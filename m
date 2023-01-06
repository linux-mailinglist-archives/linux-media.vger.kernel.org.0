Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7E027660A50
	for <lists+linux-media@lfdr.de>; Sat,  7 Jan 2023 00:35:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235773AbjAFXfq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 6 Jan 2023 18:35:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234683AbjAFXfn (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 6 Jan 2023 18:35:43 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4BBD88DFF
        for <linux-media@vger.kernel.org>; Fri,  6 Jan 2023 15:35:42 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2AB076CF;
        Sat,  7 Jan 2023 00:35:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1673048141;
        bh=z3Q3TlLU+itLnKC5fwIubXLCtL88baWrKeTiD3Lutug=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=pvsZuC/AC9rmMaviP2cM7+aDtV1VBopA8ApeyHYhyz92PfPCrSt/fLhwUlSnikiHG
         kOCIofycoI9dEFl4yarY8o9E1XmMKxX/EPeln7zPnGc/FC7DjhrSnXyJtaf0aHP469
         XkDHVdPwMHZ2vs/U8sYdrDD1n2g0Y21ARnhu6AXQ=
Date:   Sat, 7 Jan 2023 01:35:35 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     adam@piggz.co.uk
Cc:     linux-media@vger.kernel.org, yong.deng@magewell.com,
        mchehab@kernel.org, linux-sunxi@lists.linux.dev,
        paul.kocialkowski@bootlin.com
Subject: Re: [PATCH 3/3] media: sun6i-csi: implement vidioc_enum_framesizes
Message-ID: <Y7iwR3W5RiQ2K+Ip@pendragon.ideasonboard.com>
References: <20230106194038.16018-1-adam@piggz.co.uk>
 <20230106194038.16018-4-adam@piggz.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230106194038.16018-4-adam@piggz.co.uk>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Adam,

Thank you for the patch.

On Fri, Jan 06, 2023 at 07:40:38PM +0000, adam@piggz.co.uk wrote:
> From: Adam Pigg <adam@piggz.co.uk>
> 
> Create sun6i_csi_capture_enum_framesizes which defines the min
> and max frame sizes

With the commit message updated (see review of 1/3),

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> Signed-off-by: Adam Pigg <adam@piggz.co.uk>
> ---
>  .../sunxi/sun6i-csi/sun6i_csi_capture.c       | 24 +++++++++++++++++++
>  1 file changed, 24 insertions(+)
> 
> diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
> index 54beba4d2b2f..2be761e6b650 100644
> --- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
> +++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
> @@ -739,6 +739,29 @@ static int sun6i_csi_capture_try_fmt(struct file *file, void *private,
>  	return 0;
>  }
>  
> +static int sun6i_csi_capture_enum_framesizes(struct file *file, void *fh,
> +					  struct v4l2_frmsizeenum *fsize)
> +{
> +	const struct sun6i_csi_capture_format *format;
> +
> +	if (fsize->index > 0)
> +		return -EINVAL;
> +
> +	format = sun6i_csi_capture_format_find(fsize->pixel_format);
> +	if (!format)
> +		return -EINVAL;
> +
> +	fsize->type = V4L2_FRMSIZE_TYPE_CONTINUOUS;
> +	fsize->stepwise.min_width = SUN6I_CSI_CAPTURE_WIDTH_MIN;
> +	fsize->stepwise.max_width = SUN6I_CSI_CAPTURE_WIDTH_MAX;
> +	fsize->stepwise.min_height = SUN6I_CSI_CAPTURE_HEIGHT_MIN;
> +	fsize->stepwise.max_height = SUN6I_CSI_CAPTURE_HEIGHT_MAX;
> +	fsize->stepwise.step_width = 1;
> +	fsize->stepwise.step_height = 1;
> +
> +	return 0;
> +}
> +
>  static int sun6i_csi_capture_enum_input(struct file *file, void *private,
>  					struct v4l2_input *input)
>  {
> @@ -775,6 +798,7 @@ static const struct v4l2_ioctl_ops sun6i_csi_capture_ioctl_ops = {
>  	.vidioc_g_fmt_vid_cap		= sun6i_csi_capture_g_fmt,
>  	.vidioc_s_fmt_vid_cap		= sun6i_csi_capture_s_fmt,
>  	.vidioc_try_fmt_vid_cap		= sun6i_csi_capture_try_fmt,
> +	.vidioc_enum_framesizes		= sun6i_csi_capture_enum_framesizes,
>  
>  	.vidioc_enum_input		= sun6i_csi_capture_enum_input,
>  	.vidioc_g_input			= sun6i_csi_capture_g_input,

-- 
Regards,

Laurent Pinchart
