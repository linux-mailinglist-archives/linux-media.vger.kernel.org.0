Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 60BBA1BE158
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2020 16:42:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726451AbgD2OmJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 29 Apr 2020 10:42:09 -0400
Received: from mga05.intel.com ([192.55.52.43]:47902 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726348AbgD2OmJ (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 29 Apr 2020 10:42:09 -0400
IronPort-SDR: AZS+NQ2dSfSLmMs2v0GMdKbfhf1aEDSRrFoSeSeBxYEKmw6SeErqP0ZT+RvwKNFfmQ+wrLOkUe
 r+SVE+vlQ1mA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2020 07:42:08 -0700
IronPort-SDR: JYTmKi7eEB+Du7rYHHpKyO7w9AIyKHZa5zKlyvAQxtazK0eBGdTnfgt+oGU2JilEyt1UW3lFyq
 Y2W05HvD0Umw==
X-IronPort-AV: E=Sophos;i="5.73,332,1583222400"; 
   d="scan'208";a="246865286"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2020 07:42:06 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 026FC202AE; Wed, 29 Apr 2020 17:42:03 +0300 (EEST)
Date:   Wed, 29 Apr 2020 17:42:03 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Steve Longerbeam <slongerbeam@gmail.com>
Cc:     linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH v5 02/23] media: entity: Modify default behavior of
 media_entity_get_fwnode_pad
Message-ID: <20200429144203.GJ9190@paasikivi.fi.intel.com>
References: <20200420003930.11463-1-slongerbeam@gmail.com>
 <20200420003930.11463-3-slongerbeam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200420003930.11463-3-slongerbeam@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Steve,

On Sun, Apr 19, 2020 at 05:39:09PM -0700, Steve Longerbeam wrote:
> Modify the default behavior of media_entity_get_fwnode_pad() (when the
> entity does not provide the get_fwnode_pad op) to first assume the entity
> implements a 1:1 mapping between fwnode port number and media pad index.
> 
> If the 1:1 mapping is not valid, e.g. the port number falls outside the
> entity's pad index range, or the pad at that port number doesn't match the
> given direction_flags, fall-back to the previous behavior that searches
> the entity for the first pad that matches the given direction_flags.
> 
> The previous default behavior can choose the wrong pad for entities with
> multiple sink or source pads. With this change the function will choose
> the correct pad index if the entity implements a 1:1 port to pad mapping
> at that port.
> 
> Signed-off-by: Steve Longerbeam <slongerbeam@gmail.com>
> ---
>  drivers/media/mc/mc-entity.c | 25 ++++++++++++++++++++-----
>  include/media/media-entity.h |  6 ++++--
>  2 files changed, 24 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
> index 12b45e669bcc..b1e0259a58c5 100644
> --- a/drivers/media/mc/mc-entity.c
> +++ b/drivers/media/mc/mc-entity.c
> @@ -370,22 +370,37 @@ int media_entity_get_fwnode_pad(struct media_entity *entity,
>  				unsigned long direction_flags)
>  {
>  	struct fwnode_endpoint endpoint;
> -	unsigned int i;
>  	int ret;
>  
> +	ret = fwnode_graph_parse_endpoint(fwnode, &endpoint);
> +	if (ret)
> +		return ret;
> +
>  	if (!entity->ops || !entity->ops->get_fwnode_pad) {
> +		unsigned int i;
> +
> +		/*
> +		 * for the default case, first try a 1:1 mapping between
> +		 * fwnode port number and pad index.
> +		 */
> +		ret = endpoint.port;
> +		if (ret < entity->num_pads &&
> +		    (entity->pads[ret].flags & direction_flags))
> +			return ret;

Given the 3rd patch, is this one still meant to be here?

> +
> +		/*
> +		 * if that didn't work search the entity for the first
> +		 * pad that matches the @direction_flags.
> +		 */
>  		for (i = 0; i < entity->num_pads; i++) {
>  			if (entity->pads[i].flags & direction_flags)
>  				return i;
>  		}
>  
> +		/* else fail */
>  		return -ENXIO;
>  	}
>  
> -	ret = fwnode_graph_parse_endpoint(fwnode, &endpoint);
> -	if (ret)
> -		return ret;
> -
>  	ret = entity->ops->get_fwnode_pad(entity, &endpoint);
>  	if (ret < 0)
>  		return ret;
> diff --git a/include/media/media-entity.h b/include/media/media-entity.h
> index cde80ad029b7..9316eb9f8486 100644
> --- a/include/media/media-entity.h
> +++ b/include/media/media-entity.h
> @@ -871,8 +871,10 @@ struct media_pad *media_entity_remote_pad(const struct media_pad *pad);
>   * mappings of media pads.
>   *
>   * If the entity does not implement the get_fwnode_pad() operation
> - * then this function searches the entity for the first pad that
> - * matches the @direction_flags.
> + * then this function first assumes the entity implements a 1:1 mapping
> + * between fwnode port number and media pad index. If the 1:1 mapping
> + * is not valid, then the function searches the entity for the first pad
> + * that matches the @direction_flags.
>   *
>   * Return: returns the pad number on success or a negative error code.
>   */

-- 
Regards,

Sakari Ailus
