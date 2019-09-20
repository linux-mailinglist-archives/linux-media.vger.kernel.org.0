Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0FDA4B8C82
	for <lists+linux-media@lfdr.de>; Fri, 20 Sep 2019 10:21:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2395169AbfITIVU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 20 Sep 2019 04:21:20 -0400
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:37523 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2395166AbfITIVU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 20 Sep 2019 04:21:20 -0400
Received: from [IPv6:2001:983:e9a7:1:3829:6e33:4e49:c53d] ([IPv6:2001:983:e9a7:1:3829:6e33:4e49:c53d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id BEAHiU9589D4hBEAIich6r; Fri, 20 Sep 2019 10:21:18 +0200
Subject: Re: [Patch v2 10/13] media: am437x-vpfe: Remove print_fourcc helper
To:     Benoit Parrot <bparrot@ti.com>
Cc:     Prabhakar Lad <prabhakar.csengg@gmail.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20190919204125.15254-1-bparrot@ti.com>
 <20190919204125.15254-11-bparrot@ti.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <455387f7-3211-c032-c6c0-a15100f123d1@xs4all.nl>
Date:   Fri, 20 Sep 2019 10:21:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190919204125.15254-11-bparrot@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfJBXcyQDEPz3vjvRHG5J/wyOlEhZJSu1iaUsPL//Szs94xN63PaZWcshZ1tB5HfaA8zQZ1Rw/LfuXCgjWvNHM07tUlXbjVFglSzIEET6gFXqBt8tTkXS
 4abSsHaUXQi8D8jQpJmFbraK/ey4Lg5SIEQhMTvqChbN8kVUMNbWKeCjjUetr4XEdthEPq1evqBaUagwDg9/rkkVlpEiu83FNGkm9wR8GDgSL7t4aJUbXgVS
 JV91IxfMUAzBJ/0xGFppF7CMLY2qdfWJdq5Q4nHhlObkz+YROXy2XAVVjjHGiye4KEqhnA/49Y9C/f4MD2yib2eYkgC2RG1q3VACAGbrPk6C6K8Nzk0ncnVb
 DkZlrN5lFeFzWtnhLC8q9hs908vzgqJMI2RexZf5OGh35HqFBbTt3YB4W9l+BH2rllXqit8+
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 9/19/19 10:41 PM, Benoit Parrot wrote:
> print_fourcc helper function was used for debug log to
> convert a pixel format code into its readable form for display
> purposes. But since it used a single static buffer to perform
> the conversion this might lead to display format issue when more
> than one instance was invoked simultaneously.
> 
> It turns out that print_fourcc can be safely replace by using
> "%4pE" instead and passing the pointer to the fourcc code.

If this series is merged:

https://www.mail-archive.com/linux-media@vger.kernel.org/msg149985.html

then this patch needs to be rewritten. So I'll skip this patch for now.

Regards,

	Hans

> 
> Signed-off-by: Benoit Parrot <bparrot@ti.com>
> ---
>  drivers/media/platform/am437x/am437x-vpfe.c | 42 +++++++--------------
>  1 file changed, 14 insertions(+), 28 deletions(-)
> 
> diff --git a/drivers/media/platform/am437x/am437x-vpfe.c b/drivers/media/platform/am437x/am437x-vpfe.c
> index 605a6bb7e6c2..ad46e037fe89 100644
> --- a/drivers/media/platform/am437x/am437x-vpfe.c
> +++ b/drivers/media/platform/am437x/am437x-vpfe.c
> @@ -221,20 +221,6 @@ static void pix_to_mbus(struct vpfe_device *vpfe,
>  	v4l2_fill_mbus_format(mbus_fmt, pix_fmt, fmt->code);
>  }
>  
> -/*  Print Four-character-code (FOURCC) */
> -static char *print_fourcc(u32 fmt)
> -{
> -	static char code[5];
> -
> -	code[0] = (unsigned char)(fmt & 0xff);
> -	code[1] = (unsigned char)((fmt >> 8) & 0xff);
> -	code[2] = (unsigned char)((fmt >> 16) & 0xff);
> -	code[3] = (unsigned char)((fmt >> 24) & 0xff);
> -	code[4] = '\0';
> -
> -	return code;
> -}
> -
>  static int
>  cmp_v4l2_format(const struct v4l2_format *lhs, const struct v4l2_format *rhs)
>  {
> @@ -696,8 +682,8 @@ static int vpfe_ccdc_set_pixel_format(struct vpfe_ccdc *ccdc, u32 pixfmt)
>  {
>  	struct vpfe_device *vpfe = container_of(ccdc, struct vpfe_device, ccdc);
>  
> -	vpfe_dbg(1, vpfe, "%s: if_type: %d, pixfmt:%s\n",
> -		 __func__, ccdc->ccdc_cfg.if_type, print_fourcc(pixfmt));
> +	vpfe_dbg(1, vpfe, "%s: if_type: %d, pixfmt:%4pE\n",
> +		 __func__, ccdc->ccdc_cfg.if_type, &pixfmt);
>  
>  	if (ccdc->ccdc_cfg.if_type == VPFE_RAW_BAYER) {
>  		ccdc->ccdc_cfg.bayer.pix_fmt = CCDC_PIXFMT_RAW;
> @@ -983,8 +969,8 @@ static int vpfe_config_ccdc_image_format(struct vpfe_device *vpfe)
>  	enum ccdc_frmfmt frm_fmt = CCDC_FRMFMT_INTERLACED;
>  	int ret = 0;
>  
> -	vpfe_dbg(1, vpfe, "pixelformat: %s\n",
> -		print_fourcc(vpfe->fmt.fmt.pix.pixelformat));
> +	vpfe_dbg(1, vpfe, "pixelformat: %4pE\n",
> +		 &vpfe->fmt.fmt.pix.pixelformat);
>  
>  	if (vpfe_ccdc_set_pixel_format(&vpfe->ccdc,
>  			vpfe->fmt.fmt.pix.pixelformat) < 0) {
> @@ -1392,9 +1378,9 @@ static int __vpfe_get_format(struct vpfe_device *vpfe,
>  	format->type = vpfe->fmt.type;
>  
>  	vpfe_dbg(1, vpfe,
> -		 "%s: size %dx%d (%s) bytesperline = %d, size = %d, bpp = %d\n",
> +		 "%s: size %dx%d (%4pE) bytesperline = %d, size = %d, bpp = %d\n",
>  		 __func__, format->fmt.pix.width, format->fmt.pix.height,
> -		 print_fourcc(format->fmt.pix.pixelformat),
> +		 &format->fmt.pix.pixelformat,
>  		 format->fmt.pix.bytesperline, format->fmt.pix.sizeimage, *bpp);
>  
>  	return 0;
> @@ -1427,9 +1413,9 @@ static int __vpfe_set_format(struct vpfe_device *vpfe,
>  	format->type = vpfe->fmt.type;
>  
>  	vpfe_dbg(1, vpfe,
> -		 "%s size %dx%d (%s) bytesperline = %d, size = %d, bpp = %d\n",
> +		 "%s: size %dx%d (%4pE) bytesperline = %d, size = %d, bpp = %d\n",
>  		 __func__,  format->fmt.pix.width, format->fmt.pix.height,
> -		 print_fourcc(format->fmt.pix.pixelformat),
> +		 &format->fmt.pix.pixelformat,
>  		 format->fmt.pix.bytesperline, format->fmt.pix.sizeimage, *bpp);
>  
>  	return 0;
> @@ -1463,8 +1449,8 @@ static int vpfe_enum_fmt(struct file *file, void  *priv,
>  
>  	f->pixelformat = fmt->fourcc;
>  
> -	vpfe_dbg(1, vpfe, "%s: mbus index: %d code: %x pixelformat: %s\n",
> -		 __func__, f->index, fmt->code, print_fourcc(fmt->fourcc));
> +	vpfe_dbg(1, vpfe, "%s: mbus index: %d code: %x pixelformat: %4pE\n",
> +		 __func__, f->index, fmt->code, &fmt->fourcc);
>  
>  	return 0;
>  }
> @@ -1571,8 +1557,8 @@ static int vpfe_enum_size(struct file *file, void  *priv,
>  	fsize->discrete.width = fse.max_width;
>  	fsize->discrete.height = fse.max_height;
>  
> -	vpfe_dbg(1, vpfe, "%s: index: %d pixformat: %4.4s size: %dx%d\n",
> -		 __func__, fsize->index, (char *)&fsize->pixel_format,
> +	vpfe_dbg(1, vpfe, "%s: index: %d pixformat: %4pE size: %dx%d\n",
> +		 __func__, fsize->index, &fsize->pixel_format,
>  		 fsize->discrete.width, fsize->discrete.height);
>  
>  	return 0;
> @@ -2242,8 +2228,8 @@ vpfe_async_bound(struct v4l2_async_notifier *notifier,
>  				continue;
>  			vpfe->active_fmt[i] = fmt;
>  			vpfe_dbg(3, vpfe,
> -				 "matched fourcc: %4.4s code: %04x idx: %d\n",
> -				 (char *)&fmt->fourcc, mbus_code.code, i);
> +				 "matched fourcc: %4pE code: %04x idx: %d\n",
> +				 &fmt->fourcc, mbus_code.code, i);
>  			vpfe->num_active_fmt = ++i;
>  		}
>  	}
> 

