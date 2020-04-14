Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 038C11A8ED3
	for <lists+linux-media@lfdr.de>; Wed, 15 Apr 2020 00:58:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2634332AbgDNW6m (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Apr 2020 18:58:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2634321AbgDNW6j (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Apr 2020 18:58:39 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F9F1C061A0C
        for <linux-media@vger.kernel.org>; Tue, 14 Apr 2020 15:58:39 -0700 (PDT)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 42570521;
        Wed, 15 Apr 2020 00:58:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1586905116;
        bh=0le8NfkADwPLJSXphkl+/23oqufoK6RtNmvhS3P3CpU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=OaqRdH6MQa4lUQxsN8Cr//T2HQOULPClID94gwBUu1LE/F6Bnw2lFOI2/QuKZcUup
         oWuGfFYyQW7wEhv7foqDeJhM7FWsmu4kgYc1Xk3qGy7Cy7TM8MqitaCsac7iCQVFxb
         F+X7D21LwqKNg9/EiodAz04bQ0QH9oaJ0FlifMBw=
Date:   Wed, 15 Apr 2020 01:58:24 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Steve Longerbeam <slongerbeam@gmail.com>
Cc:     linux-media@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH v4 01/17] media: entity: Pass entity to get_fwnode_pad
 operation
Message-ID: <20200414225824.GA27621@pendragon.ideasonboard.com>
References: <20200303234256.8928-1-slongerbeam@gmail.com>
 <20200303234256.8928-2-slongerbeam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200303234256.8928-2-slongerbeam@gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Steve,

Thank you for the patch.

On Tue, Mar 03, 2020 at 03:42:40PM -0800, Steve Longerbeam wrote:
> Add a missing pointer to the entity in the media_entity operation
> get_fwnode_pad. There are no implementers of this op yet, but a future
> entity that does so will almost certainly need a reference to itself
> to carry out the work.
> 
> Fixes: ae45cd5efc120 ("[media] media: entity: Add get_fwnode_pad entity
> operation")
> Signed-off-by: Steve Longerbeam <slongerbeam@gmail.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/mc/mc-entity.c | 2 +-
>  include/media/media-entity.h | 3 ++-
>  2 files changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
> index 211279c5fd77..12b45e669bcc 100644
> --- a/drivers/media/mc/mc-entity.c
> +++ b/drivers/media/mc/mc-entity.c
> @@ -386,7 +386,7 @@ int media_entity_get_fwnode_pad(struct media_entity *entity,
>  	if (ret)
>  		return ret;
>  
> -	ret = entity->ops->get_fwnode_pad(&endpoint);
> +	ret = entity->ops->get_fwnode_pad(entity, &endpoint);
>  	if (ret < 0)
>  		return ret;
>  
> diff --git a/include/media/media-entity.h b/include/media/media-entity.h
> index 8cb2c504a05c..cde80ad029b7 100644
> --- a/include/media/media-entity.h
> +++ b/include/media/media-entity.h
> @@ -212,7 +212,8 @@ struct media_pad {
>   *    mutex held.
>   */
>  struct media_entity_operations {
> -	int (*get_fwnode_pad)(struct fwnode_endpoint *endpoint);
> +	int (*get_fwnode_pad)(struct media_entity *entity,
> +			      struct fwnode_endpoint *endpoint);
>  	int (*link_setup)(struct media_entity *entity,
>  			  const struct media_pad *local,
>  			  const struct media_pad *remote, u32 flags);

-- 
Regards,

Laurent Pinchart
