Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B992B7A6522
	for <lists+linux-media@lfdr.de>; Tue, 19 Sep 2023 15:32:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232453AbjISNcp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 19 Sep 2023 09:32:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232389AbjISNco (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 19 Sep 2023 09:32:44 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2BD9F1
        for <linux-media@vger.kernel.org>; Tue, 19 Sep 2023 06:32:36 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 237CBBB2;
        Tue, 19 Sep 2023 15:30:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1695130259;
        bh=uFmrdA+WvsfZWCuCsanzPXaKijv+Dqkdqd5Ru9tlw/k=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=eGDofv3J19/sx1PFRhM4bngDJONKc53/czkxN/zMVP4Gc0pr9uBy7OXti7DlSNB4b
         JICHhgNwlBqq7bn/TK8h7Hgjmzo4qPLWwEtMwp4MfjJBJ7St9L/8YOQzY+iDcL0MtZ
         Lqy5tKsxn95BJKgvzQ/lXz0yfy8ARk9UeCTWxdcQ=
Date:   Tue, 19 Sep 2023 16:32:48 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org, Tianshu Qiu <tian.shu.qiu@intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Martin Kepplinger <martink@posteo.de>
Subject: Re: [PATCH v3 11/12] media: v4l: subdev: Print debug information on
 frame descriptor
Message-ID: <20230919133248.GD1505@pendragon.ideasonboard.com>
References: <20230919121728.126781-1-sakari.ailus@linux.intel.com>
 <20230919121728.126781-12-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230919121728.126781-12-sakari.ailus@linux.intel.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

Thank you for the patch.

On Tue, Sep 19, 2023 at 03:17:27PM +0300, Sakari Ailus wrote:
> Print debug level information on returned frame descriptors.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/media/v4l2-core/v4l2-subdev.c | 32 ++++++++++++++++++++++++++-
>  1 file changed, 31 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> index 7b087be3ff4f..504ca625b2bd 100644
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
> @@ -309,9 +310,38 @@ static int call_set_selection(struct v4l2_subdev *sd,
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

Should this be sized for the worst case ? The vc and dt should not be
large, but a buffer overflow on the stack in debug code if a subdev
returns an incorrect value would be bad.

> +
> +		if (fd->type == V4L2_MBUS_FRAME_DESC_TYPE_CSI2)
> +			snprintf(buf, sizeof(buf), ", vc %u, dt 0x%2.2x",

0x%02x would be one character shorter ;-) Same below.

> +				 entry->bus.csi2.vc, entry->bus.csi2.dt);
> +
> +		dev_dbg(sd->dev,
> +			"\tstream %u, code 0x%4.4x, lenght %u, flags%s%s%s\n",

s/lenght/length/

> +			entry->stream, entry->pixelcode, entry->length,
> +			entry->flags & V4L2_MBUS_FRAME_DESC_FL_LEN_MAX ?
> +			" LEN_MAX" : "",
> +			entry->flags & V4L2_MBUS_FRAME_DESC_FL_BLOB ?
> +			" BLOB" : "", buf);

If no flags are set, you will get something like

	stream 0, code 0x1234, length ..., flags, vc 0, dt 0x2a

Maybe printing the hex value for the flags would be simpler and clearer
?

> +	}
> +
> +	return 0;
>  }
>  
>  static inline int check_edid(struct v4l2_subdev *sd,

-- 
Regards,

Laurent Pinchart
