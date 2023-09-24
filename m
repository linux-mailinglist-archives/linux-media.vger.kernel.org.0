Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0C5C67AC80F
	for <lists+linux-media@lfdr.de>; Sun, 24 Sep 2023 14:42:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229561AbjIXMmJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 24 Sep 2023 08:42:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229449AbjIXMmI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 24 Sep 2023 08:42:08 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72D34106
        for <linux-media@vger.kernel.org>; Sun, 24 Sep 2023 05:42:02 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 18C1DEBA;
        Sun, 24 Sep 2023 14:40:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1695559221;
        bh=NFG/0fWVHfQTDFPNIDpcOagCItKeHUAC4bL+zSRvIn8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=gzdmGZQF2tocwZAdKIjDdSzQIT3yavPDTMiKZV+3dw93zaCFsOW/zbPEi3Ew/NkgK
         XL5kCacG1DpLnhA7UagFAOZNEZiGutDkw926rE0dcwoFmudS7IR1OZyEtc4MYM2wfX
         uqE/e4o+uqBZRTDICFrbg3Eo9opuMS0Q+2HP4rrA=
Date:   Sun, 24 Sep 2023 15:42:11 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org, Tianshu Qiu <tian.shu.qiu@intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Martin Kepplinger <martink@posteo.de>
Subject: Re: [PATCH v4 11/12] media: v4l: subdev: Print debug information on
 frame descriptor
Message-ID: <20230924124211.GA4505@pendragon.ideasonboard.com>
References: <20230922115730.251779-1-sakari.ailus@linux.intel.com>
 <20230922115730.251779-12-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230922115730.251779-12-sakari.ailus@linux.intel.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

Thank you for the patch.

On Fri, Sep 22, 2023 at 02:57:29PM +0300, Sakari Ailus wrote:
> Print debug level information on returned frame descriptors.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/media/v4l2-core/v4l2-subdev.c | 31 ++++++++++++++++++++++++++-
>  1 file changed, 30 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> index 7b087be3ff4f..ed0069efc921 100644
> --- a/drivers/media/v4l2-core/v4l2-subdev.c
> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> @@ -15,6 +15,7 @@
>  #include <linux/module.h>
>  #include <linux/overflow.h>
>  #include <linux/slab.h>
> +#include <linux/string.h>
>  #include <linux/types.h>
>  #include <linux/version.h>
>  #include <linux/videodev2.h>
> @@ -309,9 +310,37 @@ static int call_set_selection(struct v4l2_subdev *sd,
>  static int call_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
>  			       struct v4l2_mbus_frame_desc *fd)
>  {
> +	unsigned int i;
> +	int ret;
> +
>  	memset(fd, 0, sizeof(*fd));
>  
> -	return sd->ops->pad->get_frame_desc(sd, pad, fd);
> +	ret = sd->ops->pad->get_frame_desc(sd, pad, fd);
> +	if (ret)
> +		return ret;
> +
> +	dev_dbg(sd->dev, "Frame descriptor on pad %u, type %s\n", pad,
> +		fd->type == V4L2_MBUS_FRAME_DESC_TYPE_PARALLEL ? "parallel" :
> +		fd->type == V4L2_MBUS_FRAME_DESC_TYPE_CSI2 ? "CSI-2" :
> +		"unknown");
> +
> +	for (i = 0; i < fd->num_entries; i++) {
> +		struct v4l2_mbus_frame_desc_entry *entry = &fd->entry[i];
> +		char buf[20] = "";
> +
> +		if (fd->type == V4L2_MBUS_FRAME_DESC_TYPE_CSI2)
> +			WARN_ON(snprintf(buf, sizeof(buf),
> +					 ", vc %u, dt 0x%02x",
> +					 entry->bus.csi2.vc,
> +					 entry->bus.csi2.dt) >= sizeof(buf));

Assuming this doesn't cause a gcc string overflow warning with W=1,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> +
> +		dev_dbg(sd->dev,
> +			"\tstream %u, code 0x%04x, length %u, flags 0x%04x%s\n",
> +			entry->stream, entry->pixelcode, entry->length,
> +			entry->flags, buf);
> +	}
> +
> +	return 0;
>  }
>  
>  static inline int check_edid(struct v4l2_subdev *sd,

-- 
Regards,

Laurent Pinchart
