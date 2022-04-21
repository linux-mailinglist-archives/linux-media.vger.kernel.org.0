Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2913450A9A7
	for <lists+linux-media@lfdr.de>; Thu, 21 Apr 2022 22:02:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1392167AbiDUUFF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 21 Apr 2022 16:05:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1392160AbiDUUFE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 21 Apr 2022 16:05:04 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 073F84BFC0
        for <linux-media@vger.kernel.org>; Thu, 21 Apr 2022 13:02:14 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8BC77492;
        Thu, 21 Apr 2022 22:02:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1650571332;
        bh=a1jpKW0zCqPHYOIiNHocOMEqjbBGf5M0XN9UEry29xM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=mnFbN+My2+cRvRJ2Md+ELSqT1M+0ZCKQG27qxV/HAPNqGdZuVtawMA3GULu2P89+l
         d5Cc/1LAOHRnLp9oN/rT8xnzllRbVOelUKM7nVQIEoNatfanis0bhvjVyyrSLmjl+/
         8SJovZctGtGF3ZN2xX4qSmL3/CW+zocB7mGS+aho=
Date:   Thu, 21 Apr 2022 23:02:13 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>
Subject: Re: [PATCH 2/6] media: ti: cal: fix useless variable init
Message-ID: <YmG4RfhZzDsSZtFq@pendragon.ideasonboard.com>
References: <20220421143449.552312-1-tomi.valkeinen@ideasonboard.com>
 <20220421143449.552312-3-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220421143449.552312-3-tomi.valkeinen@ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomi,

Thank you for the patch.

On Thu, Apr 21, 2022 at 05:34:45PM +0300, Tomi Valkeinen wrote:
> 'ret' is initialized needlessly in cal_legacy_try_fmt_vid_cap(). We can
> also move the variable to the for block, which is the only place where
> it is used.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/platform/ti/cal/cal-video.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/ti/cal/cal-video.c b/drivers/media/platform/ti/cal/cal-video.c
> index 3e936a2ca36c..1cbd9bda1892 100644
> --- a/drivers/media/platform/ti/cal/cal-video.c
> +++ b/drivers/media/platform/ti/cal/cal-video.c
> @@ -195,7 +195,7 @@ static int cal_legacy_try_fmt_vid_cap(struct file *file, void *priv,
>  	struct cal_ctx *ctx = video_drvdata(file);
>  	const struct cal_format_info *fmtinfo;
>  	struct v4l2_subdev_frame_size_enum fse;
> -	int ret, found;
> +	int found;
>  
>  	fmtinfo = find_format_by_pix(ctx, f->fmt.pix.pixelformat);
>  	if (!fmtinfo) {
> @@ -210,12 +210,13 @@ static int cal_legacy_try_fmt_vid_cap(struct file *file, void *priv,
>  	f->fmt.pix.field = ctx->v_fmt.fmt.pix.field;
>  
>  	/* check for/find a valid width/height */
> -	ret = 0;
>  	found = false;
>  	fse.pad = 0;
>  	fse.code = fmtinfo->code;
>  	fse.which = V4L2_SUBDEV_FORMAT_ACTIVE;
>  	for (fse.index = 0; ; fse.index++) {
> +		int ret;
> +
>  		ret = v4l2_subdev_call(ctx->phy->source, pad, enum_frame_size,
>  				       NULL, &fse);
>  		if (ret)

-- 
Regards,

Laurent Pinchart
