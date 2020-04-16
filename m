Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DED4B1ABFDA
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2020 13:43:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2506535AbgDPLmG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Apr 2020 07:42:06 -0400
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:52417 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2505749AbgDPK6T (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Apr 2020 06:58:19 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id P28fjcHrs7xncP28ij7Mw4; Thu, 16 Apr 2020 12:53:00 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1587034381; bh=UMvhdZxlHb7Bl5+gPso3dxBNOKnA9PSVRcPcbNRZ/ZQ=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=GPFsOnGtaAAPwHZ07CJTgiqofXLeFQEl2GWF/rioj5oXeJlGgsOjrNxbk9H8QXzZb
         A+/2MXoL+va63RUpSTOf2TC+g+jPj8Xc3fOAHyfzpiXSqVpw2MqXZ2HLFJhG0nZ9hV
         6bge8QkJ49D+5471iCcAc61z0oLB5pS1aZpYksNTbvtrenXAmZJoPPE+Igj0RqKCVz
         UH77+Y564A4+8tUUO9D2RO6sz2umxy13OP2s8yV52EXKscFyCV9HTDM+Cf3s3kgvE4
         xK4CMEas88E1WhM5L3aSwX01z2wI9h2tvgtezVMlk3IXCgmGJUPnhCReDowXmrkaiE
         /mlPHH5D27WHA==
Subject: Re: [PATCH] media: imx: utils: Default colorspace to SRGB
To:     Steve Longerbeam <slongerbeam@gmail.com>,
        linux-media@vger.kernel.org
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
References: <20200325173456.21455-1-slongerbeam@gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <9cea8cb9-b127-6ff0-a240-be338e081eaa@xs4all.nl>
Date:   Thu, 16 Apr 2020 12:52:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200325173456.21455-1-slongerbeam@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfLB6/4mlYD+QJ31n9t3wPG9xdxoOHxSijFl1r0V5wpWeGC5OGL06uT5+t4gJL+Y6s0dhQmBlLjoOPO2ZS+W5Asl/e6TdRc1ZsWKhEQWA/r/rNfXSRU2/
 YwnHuToPbF3Ko29GaOPsBm41iC5QWSJjs8RXrjO0zcjLR0sB4vU0bbzjw2PHnYTWMi7am/pSRC9EVEuakpQINlvLQOOFwgfyVJt88jqkYE4R7gHg2iC0xu1R
 PgqHFLSSRRJOScZfsjXfszb2s8dMBPEfo2ph2SkLmns2VOpQpetf4gWBk6p2Vq1SLb8iLSge9HdMt/JoAIMj4A==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Steve,

On 25/03/2020 18:34, Steve Longerbeam wrote:
> The function init_mbus_colorimetry() is used to initialize the imx
> subdevice mbus colorimetry to some sane defaults when the subdevice is
> registered. Currently it guesses at a colorspace based on the passed
> mbus pixel format. If the format is RGB, it chooses colorspace
> V4L2_COLORSPACE_SRGB, and if the format is YUV, it chooses
> V4L2_COLORSPACE_SMPTE170M.
> 
> While that might be a good guess, it's not necessarily true that a RGB
> pixel format encoding uses a SRGB colorspace, or that a YUV encoding
> uses a SMPTE170M colorspace. Instead of making this dubious guess,
> just default the colorspace to SRGB.
> 
> Reported-by: Hans Verkuil <hverkuil@xs4all.nl>
> Signed-off-by: Steve Longerbeam <slongerbeam@gmail.com>
> ---
>  drivers/staging/media/imx/imx-media-utils.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/media/imx/imx-media-utils.c b/drivers/staging/media/imx/imx-media-utils.c
> index fae981698c49..8344675bfd05 100644
> --- a/drivers/staging/media/imx/imx-media-utils.c
> +++ b/drivers/staging/media/imx/imx-media-utils.c
> @@ -236,8 +236,7 @@ static const struct imx_media_pixfmt ipu_rgb_formats[] = {
>  static void init_mbus_colorimetry(struct v4l2_mbus_framefmt *mbus,
>  				  const struct imx_media_pixfmt *fmt)
>  {
> -	mbus->colorspace = (fmt->cs == IPUV3_COLORSPACE_RGB) ?
> -		V4L2_COLORSPACE_SRGB : V4L2_COLORSPACE_SMPTE170M;
> +	mbus->colorspace = V4L2_COLORSPACE_SRGB;
>  	mbus->xfer_func = V4L2_MAP_XFER_FUNC_DEFAULT(mbus->colorspace);
>  	mbus->ycbcr_enc = V4L2_MAP_YCBCR_ENC_DEFAULT(mbus->colorspace);
>  	mbus->quantization =

The quantization is probably wrong as well since it checks fmt->cs.
The first argument should just be 'true'.

> 

In any case, this patch no longer applies after the imx utils patch series.

Regards,

	Hans
