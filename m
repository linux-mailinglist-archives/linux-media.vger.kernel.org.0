Return-Path: <linux-media+bounces-17334-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 11588968481
	for <lists+linux-media@lfdr.de>; Mon,  2 Sep 2024 12:20:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BD9BE285DC0
	for <lists+linux-media@lfdr.de>; Mon,  2 Sep 2024 10:20:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4343F142E9D;
	Mon,  2 Sep 2024 10:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Ir74HPCN"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F25B413B5A1
	for <linux-media@vger.kernel.org>; Mon,  2 Sep 2024 10:20:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725272425; cv=none; b=hwBBv87skx8tqj7WLTz3tdNcKbmOXxpWAZ+l97/T/COCVQC/YlHFpkUb0jbv/ccSIv4DXfKZq1sCLx9icuWMtGNJwUaIsHF/7L44lGWKPqtoKOJ1AlzPdWCRREj5+tbrOeMSJBI/nuJPNthkcg1RUeH1HnD2qFQi685cqrXfLPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725272425; c=relaxed/simple;
	bh=u/CcX6ph6XWnjYmPhRvK8w1GFf+01lHh/tNveV3U5v8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ocRFTgh1eERzgSBKewJY+DbTFwrAc8h+XhAs2ErtgK/LqZ/018x/ILQwpTjoLXO9jEJV20UJeTTaZD7+HZC7zFAP3NjY+8wDujZVS+2S2+a94wVjB09DQt+j5R4eCHZmRZtiWbEOEUmD/eg2VqRA3+dnL2tzw5kP9SpCmGnb5yk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Ir74HPCN; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1725272422;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ep/fbaY7ismq+G8MGQA2BTsRP6ljL7rXtJaTXHja+24=;
	b=Ir74HPCNsRvJwtAbbSnUlSutNKPNEdSLIsCRJzAqahwAA0w7PahX9nnlRdRCzWCMuUTuyp
	L56SY5rqS4CznH3gmlEb3MjEPymoFopipOc1L7Ls2RX5AcQLRBY9osiL48kwm/cGoNZTRJ
	JLIq7egKPXpRkdg4gSDvz/+HYgC1Wis=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-692-hoBXIW5DMxG2nbK6U6kH5g-1; Mon, 02 Sep 2024 06:20:21 -0400
X-MC-Unique: hoBXIW5DMxG2nbK6U6kH5g-1
Received: by mail-ed1-f71.google.com with SMTP id 4fb4d7f45d1cf-5c2504ab265so627725a12.3
        for <linux-media@vger.kernel.org>; Mon, 02 Sep 2024 03:20:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725272420; x=1725877220;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ep/fbaY7ismq+G8MGQA2BTsRP6ljL7rXtJaTXHja+24=;
        b=TKEdTvQHsA/ns5LDtITLfwS04Jb8grZb4n7IueKDGH2Il+6826V3WwygwMGFzeZwjN
         u0hKkZj4TlBYCN9fEwJOLYj8tSsYWeQ0fSGdsdwUmQnM2ViEvfCiMa3PzT1yohlFjANl
         V4an/lDD+yR9QtGckwNSAvQXsU5MfyPtFQKUcQG9GETsp/xC+R3Fc30BUDtRRxRHwAb5
         RFbVJ7Y6s1/B+wXVb6VqneaeVcK0N75zMbQJqT6Vnb3faBanw46IFogxnhq15njDguMP
         6VG+ZkTB8J/repp9xwNcNLcLJpuJ+/1NB1yZ0NtW39A8VN7zqD+7Bd5JcRi9PpPEnAh3
         9fpQ==
X-Forwarded-Encrypted: i=1; AJvYcCWannCsubIbucN8xEsAHkQWDpfRk86QCP+dPL6cJqkkeASh+HT+gmC0YXMFYHBBpcRH/VyHbFZkWkwW2A==@vger.kernel.org
X-Gm-Message-State: AOJu0YzymqpezP9qZuWKfjYVR2DX0AhBxEb0EQd7HPXAL0u+i7844BP9
	FAk/8UIn9oS1FRWy+0VviiMlWOfpxbn0aSUCKWvsrakKHAg2Y0DWizoikGM+DEtHuaOscYUr0Fr
	JKEumofOQoKESXVzPxlkF2YNNgjojdpArRCSFGWSGOdJbOeBnhqsr+OvUyWvA
X-Received: by 2002:a05:6402:5ce:b0:5c0:ba23:a55e with SMTP id 4fb4d7f45d1cf-5c21eda0c36mr11468912a12.38.1725272420616;
        Mon, 02 Sep 2024 03:20:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGkNIcs8WUpD9jfIvlj2dGbCtPZ7wdjoBkbm2bFYuxi7KXKlxOC0x7yReFNCpAHdyOfo7ViPA==
X-Received: by 2002:a05:6402:5ce:b0:5c0:ba23:a55e with SMTP id 4fb4d7f45d1cf-5c21eda0c36mr11468885a12.38.1725272420024;
        Mon, 02 Sep 2024 03:20:20 -0700 (PDT)
Received: from [192.168.171.203] ([109.38.145.100])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c226ce9722sm5296870a12.96.2024.09.02.03.20.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Sep 2024 03:20:19 -0700 (PDT)
Message-ID: <9bbe3ff8-d19a-42b1-973a-862fdfe5dfc1@redhat.com>
Date: Mon, 2 Sep 2024 12:20:16 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/1] media: atomisp: Replace rarely used macro from
 math_support.h
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Kate Hsuan <hpa@redhat.com>, linux-media@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20240813131225.2232817-1-andriy.shevchenko@linux.intel.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240813131225.2232817-1-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 8/13/24 3:12 PM, Andy Shevchenko wrote:
> Replace rarely used macro by generic ones from Linux kernel headers.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Thank you for your 3 patch(es).

I have merged this/these in my media-atomisp branch:
https://git.kernel.org/pub/scm/linux/kernel/git/hansg/linux.git/log/?h=media-atomisp

And this/these will be included in my next pull-request to
Mauro (to media subsystem maintainer)

Regards,

Hans





> ---
>  .../atomisp/pci/hive_isp_css_include/math_support.h      | 6 ------
>  .../ipu2_io_ls/bayer_io_ls/ia_css_bayer_io.host.c        | 9 +++++----
>  .../ipu2_io_ls/yuv444_io_ls/ia_css_yuv444_io.host.c      | 9 +++++----
>  .../media/atomisp/pci/runtime/binary/src/binary.c        | 3 ++-
>  .../media/atomisp/pci/runtime/isys/src/virtual_isys.c    | 8 ++++----
>  5 files changed, 16 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_include/math_support.h b/drivers/staging/media/atomisp/pci/hive_isp_css_include/math_support.h
> index 160c496784b7..907f9ebcc60d 100644
> --- a/drivers/staging/media/atomisp/pci/hive_isp_css_include/math_support.h
> +++ b/drivers/staging/media/atomisp/pci/hive_isp_css_include/math_support.h
> @@ -28,12 +28,6 @@
>  #define CEIL_SHIFT(a, b)     (((a) + (1 << (b)) - 1) >> (b))
>  #define CEIL_SHIFT_MUL(a, b) (CEIL_SHIFT(a, b) << (b))
>  
> -#if !defined(PIPE_GENERATION)
> -
> -#define ceil_div(a, b)		(CEIL_DIV(a, b))
> -
> -#endif /* !defined(PIPE_GENERATION) */
> -
>  /*
>   * For SP and ISP, SDK provides the definition of OP_std_modadd.
>   * We need it only for host
> diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/ipu2_io_ls/bayer_io_ls/ia_css_bayer_io.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/ipu2_io_ls/bayer_io_ls/ia_css_bayer_io.host.c
> index 0091e2a3da52..c32659894c29 100644
> --- a/drivers/staging/media/atomisp/pci/isp/kernels/ipu2_io_ls/bayer_io_ls/ia_css_bayer_io.host.c
> +++ b/drivers/staging/media/atomisp/pci/isp/kernels/ipu2_io_ls/bayer_io_ls/ia_css_bayer_io.host.c
> @@ -13,9 +13,11 @@
>   * more details.
>   */
>  
> +#include <linux/bitops.h>
> +#include <linux/math.h>
> +
>  #include "ia_css_bayer_io.host.h"
>  #include "dma.h"
> -#include "math_support.h"
>  #ifndef IA_CSS_NO_DEBUG
>  #include "ia_css_debug.h"
>  #endif
> @@ -29,9 +31,8 @@ int ia_css_bayer_io_config(const struct ia_css_binary      *binary,
>  	const struct ia_css_frame **out_frames = (const struct ia_css_frame **)
>  		&args->out_frame;
>  	const struct ia_css_frame_info *in_frame_info = ia_css_frame_get_info(in_frame);
> -	const unsigned int ddr_bits_per_element = sizeof(short) * 8;
> -	const unsigned int ddr_elems_per_word = ceil_div(HIVE_ISP_DDR_WORD_BITS,
> -						ddr_bits_per_element);
> +	const unsigned int ddr_elems_per_word =
> +		DIV_ROUND_UP(HIVE_ISP_DDR_WORD_BITS, BITS_PER_TYPE(short));
>  	unsigned int size_get = 0, size_put = 0;
>  	unsigned int offset = 0;
>  	int ret;
> diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/ipu2_io_ls/yuv444_io_ls/ia_css_yuv444_io.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/ipu2_io_ls/yuv444_io_ls/ia_css_yuv444_io.host.c
> index 32c504a950ce..5b2d5023b5ee 100644
> --- a/drivers/staging/media/atomisp/pci/isp/kernels/ipu2_io_ls/yuv444_io_ls/ia_css_yuv444_io.host.c
> +++ b/drivers/staging/media/atomisp/pci/isp/kernels/ipu2_io_ls/yuv444_io_ls/ia_css_yuv444_io.host.c
> @@ -13,9 +13,11 @@ FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
>  more details.
>  */
>  
> +#include <linux/bitops.h>
> +#include <linux/math.h>
> +
>  #include "ia_css_yuv444_io.host.h"
>  #include "dma.h"
> -#include "math_support.h"
>  #ifndef IA_CSS_NO_DEBUG
>  #include "ia_css_debug.h"
>  #endif
> @@ -29,9 +31,8 @@ int ia_css_yuv444_io_config(const struct ia_css_binary      *binary,
>  	const struct ia_css_frame **out_frames = (const struct ia_css_frame **)
>  		&args->out_frame;
>  	const struct ia_css_frame_info *in_frame_info = ia_css_frame_get_info(in_frame);
> -	const unsigned int ddr_bits_per_element = sizeof(short) * 8;
> -	const unsigned int ddr_elems_per_word = ceil_div(HIVE_ISP_DDR_WORD_BITS,
> -						ddr_bits_per_element);
> +	const unsigned int ddr_elems_per_word =
> +		DIV_ROUND_UP(HIVE_ISP_DDR_WORD_BITS, BITS_PER_TYPE(short));
>  	unsigned int size_get = 0, size_put = 0;
>  	unsigned int offset = 0;
>  	int ret;
> diff --git a/drivers/staging/media/atomisp/pci/runtime/binary/src/binary.c b/drivers/staging/media/atomisp/pci/runtime/binary/src/binary.c
> index b0f904a5e442..2ff522f7dec8 100644
> --- a/drivers/staging/media/atomisp/pci/runtime/binary/src/binary.c
> +++ b/drivers/staging/media/atomisp/pci/runtime/binary/src/binary.c
> @@ -328,7 +328,8 @@ ia_css_binary_dvs_grid_info(const struct ia_css_binary *binary,
>  
>  	dvs_info = &info->dvs_grid.dvs_grid_info;
>  
> -	/* for DIS, we use a division instead of a ceil_div. If this is smaller
> +	/*
> +	 * For DIS, we use a division instead of a DIV_ROUND_UP(). If this is smaller
>  	 * than the 3a grid size, it indicates that the outer values are not
>  	 * valid for DIS.
>  	 */
> diff --git a/drivers/staging/media/atomisp/pci/runtime/isys/src/virtual_isys.c b/drivers/staging/media/atomisp/pci/runtime/isys/src/virtual_isys.c
> index 52483498239d..2e0193671f4b 100644
> --- a/drivers/staging/media/atomisp/pci/runtime/isys/src/virtual_isys.c
> +++ b/drivers/staging/media/atomisp/pci/runtime/isys/src/virtual_isys.c
> @@ -13,6 +13,8 @@
>   * more details.
>   */
>  
> +#include <linux/bitops.h>
> +#include <linux/math.h>
>  #include <linux/string.h> /* for memcpy() */
>  
>  #include "system_global.h"
> @@ -20,7 +22,6 @@
>  
>  #include "ia_css_isys.h"
>  #include "ia_css_debug.h"
> -#include "math_support.h"
>  #include "virtual_isys.h"
>  #include "isp.h"
>  #include "sh_css_defs.h"
> @@ -558,7 +559,7 @@ static int32_t calculate_stride(
>  		bits_per_pixel = CEIL_MUL(bits_per_pixel, 8);
>  
>  	pixels_per_word = HIVE_ISP_DDR_WORD_BITS / bits_per_pixel;
> -	words_per_line  = ceil_div(pixels_per_line_padded, pixels_per_word);
> +	words_per_line  = DIV_ROUND_UP(pixels_per_line_padded, pixels_per_word);
>  	bytes_per_line  = HIVE_ISP_DDR_WORD_BYTES * words_per_line;
>  
>  	return bytes_per_line;
> @@ -690,7 +691,6 @@ static bool calculate_ibuf_ctrl_cfg(
>      const isp2401_input_system_cfg_t	*isys_cfg,
>      ibuf_ctrl_cfg_t			*cfg)
>  {
> -	const s32 bits_per_byte = 8;
>  	s32 bits_per_pixel;
>  	s32 bytes_per_pixel;
>  	s32 left_padding;
> @@ -698,7 +698,7 @@ static bool calculate_ibuf_ctrl_cfg(
>  	(void)input_port;
>  
>  	bits_per_pixel = isys_cfg->input_port_resolution.bits_per_pixel;
> -	bytes_per_pixel = ceil_div(bits_per_pixel, bits_per_byte);
> +	bytes_per_pixel = BITS_TO_BYTES(bits_per_pixel);
>  
>  	left_padding = CEIL_MUL(isys_cfg->output_port_attr.left_padding, ISP_VEC_NELEMS)
>  		       * bytes_per_pixel;


