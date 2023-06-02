Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 036CA71FD57
	for <lists+linux-media@lfdr.de>; Fri,  2 Jun 2023 11:13:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234970AbjFBJNj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 2 Jun 2023 05:13:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235123AbjFBJM4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 2 Jun 2023 05:12:56 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5021E61
        for <linux-media@vger.kernel.org>; Fri,  2 Jun 2023 02:12:15 -0700 (PDT)
Received: from pendragon.ideasonboard.com (om126156168104.26.openmobile.ne.jp [126.156.168.104])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 598927FC;
        Fri,  2 Jun 2023 11:11:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1685697112;
        bh=ywwln9MXCNMQEGwTGFxPZunsP2MmGUtvMU0Z9noatsg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=nj+dJv3HwvVpEf+1N/KdzcduEzsQy3UVkzKoKmbM0ACNLiDOJA5lDlXPzEU3ArcZt
         oIGUKk0kiLcui/TApSISCBCBfeVmuhIIWB6FKE50T9neYBufeG471kB8T1ZPvuHwR+
         KyuAXCfGXKFvj9LnPwfLX3f5E8Jb6UzunqwY/sbM=
Date:   Fri, 2 Jun 2023 12:12:12 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org, bingbu.cao@intel.com
Subject: Re: [PATCH v3 1/1] media: pci: ipu3-cio2: Obtain remote pad from
 endpoint
Message-ID: <20230602091212.GB23701@pendragon.ideasonboard.com>
References: <20230515122127.590733-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230515122127.590733-1-sakari.ailus@linux.intel.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

Thank you for the patch.

On Mon, May 15, 2023 at 03:21:27PM +0300, Sakari Ailus wrote:
> Use the endpoint fwnode to find out the remote pad, instead of using the
> first source pad found. Also improve error messages.

The commit message should explain *why*. Once I know why, I'll review
the patch :-)

> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
> Oh well. Hopefully this is final then.
> 
> since v2:
> - Use remote fwnode for finding the remote pad, not local.
> 
>  drivers/media/pci/intel/ipu3/ipu3-cio2-main.c | 28 ++++++++-----------
>  1 file changed, 12 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c b/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c
> index 39a8022eec396..2743ecc9b8e4b 100644
> --- a/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c
> +++ b/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c
> @@ -1418,31 +1418,27 @@ static int cio2_notifier_complete(struct v4l2_async_notifier *notifier)
>  	struct sensor_async_subdev *s_asd;
>  	struct v4l2_async_connection *asd;
>  	struct cio2_queue *q;
> -	unsigned int pad;
>  	int ret;
>  
>  	list_for_each_entry(asd, &cio2->notifier.done_list, asc_entry) {
>  		s_asd = to_sensor_asd(asd);
>  		q = &cio2->queue[s_asd->csi2.port];
>  
> -		for (pad = 0; pad < q->sensor->entity.num_pads; pad++)
> -			if (q->sensor->entity.pads[pad].flags &
> -						MEDIA_PAD_FL_SOURCE)
> -				break;
> -
> -		if (pad == q->sensor->entity.num_pads) {
> -			dev_err(dev, "failed to find src pad for %s\n",
> -				q->sensor->name);
> -			return -ENXIO;
> +		ret = media_entity_get_fwnode_pad(&q->sensor->entity,
> +						  s_asd->asd.match.fwnode,
> +						  MEDIA_PAD_FL_SOURCE);
> +		if (ret < 0) {
> +			dev_err(dev, "no pad for endpoint %pfw (%d)\n",
> +				s_asd->asd.match.fwnode, ret);
> +			return ret;
>  		}
>  
> -		ret = media_create_pad_link(
> -				&q->sensor->entity, pad,
> -				&q->subdev.entity, CIO2_PAD_SINK,
> -				0);
> +		ret = media_create_pad_link(&q->sensor->entity, ret,
> +					    &q->subdev.entity, CIO2_PAD_SINK,
> +					    0);
>  		if (ret) {
> -			dev_err(dev, "failed to create link for %s\n",
> -				q->sensor->name);
> +			dev_err(dev, "failed to create link for %s (endpoint %pfw, error %d)\n",
> +				q->sensor->name, s_asd->asd.match.fwnode, ret);
>  			return ret;
>  		}
>  	}

-- 
Regards,

Laurent Pinchart
