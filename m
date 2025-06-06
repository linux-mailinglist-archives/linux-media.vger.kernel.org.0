Return-Path: <linux-media+bounces-34206-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2304FACFE67
	for <lists+linux-media@lfdr.de>; Fri,  6 Jun 2025 10:38:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 010A5189A046
	for <lists+linux-media@lfdr.de>; Fri,  6 Jun 2025 08:38:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0B5F285404;
	Fri,  6 Jun 2025 08:37:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b="f14ClqHH"
X-Original-To: linux-media@vger.kernel.org
Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 182D01F7904;
	Fri,  6 Jun 2025 08:37:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=195.140.195.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749199074; cv=pass; b=KCaRNhThmfs7ISjjbw5f/MaPVvsJkL0D2lEg6Vsj6k7OM3CHEVH2gzw8AjkbOBQCsQtGOf4lfc5HziiQIccoy2/tqKFWxC8saHlY+Fo+UPPNuCADTFalDbZ2Ql5mSDoQaiWTh+BlbXIEOICc7IBIQWVr8QHJDPuBVrmKV4IapgE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749199074; c=relaxed/simple;
	bh=gl7U58bzBDpkmkgWq1e3jPGO7UmjyORx9IEzsTrUbLU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=chEXpCuue6SeRlrK0DeWmhJ7T8DvGLsC3bWfjqkgWC8AQxxDsj/CStV/TEkAgdCbFBGJNGe3Q+QldhXrXQlrgyvTRA00FjvNNo7lnsNbQ6HXy+s62AA5dz2pCnfdEc41g9+0UonQWszSjfaBnpTTXkgG6wYROKXr7nxs2sm/61M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b=f14ClqHH; arc=pass smtp.client-ip=195.140.195.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (2a00-1190-d1dd-0-127c-61ff-fee2-b97e.v6.cust.suomicom.net [IPv6:2a00:1190:d1dd:0:127c:61ff:fee2:b97e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by meesny.iki.fi (Postfix) with ESMTPSA id 4bDF7R322KzyYS;
	Fri,  6 Jun 2025 11:37:39 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
	t=1749199059;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=c5+fXNxrzaZwmDloryQNgmRR3VxWDCmbRF47w4JlhsI=;
	b=f14ClqHHG1kG5bcef4YwbSjK/HARdY0XIifzyrCTkelvziiURlpXCDxXHe3SCScycp6got
	n/0FnVpffCQvDDR/MyNuCGObPNZyfpUduzDGrrktnCP0d40Dt7inTpvA7heDikBfqybg4B
	qlDQuqWl1OgloAPrTRQwGCnIl+DLjlA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=meesny; t=1749199059;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=c5+fXNxrzaZwmDloryQNgmRR3VxWDCmbRF47w4JlhsI=;
	b=sk9mD6JFDraySp/PPEP8IzoAxVpqtc82K2pRFAXv0BZAEurqbZ61I8Thnw1SSJBHS48fGW
	vY4Yt31vkTrq/eUYKe1fGdG/IRWn4c+SdsNoatXH0lIvzMj3t9YbaBHgdvfTLxS4OSgi24
	Iqfjdil6LG3ijUaBMOF60xvU1HGINjY=
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1749199059; a=rsa-sha256; cv=none;
	b=yeoBULqghHWVYetDcJsiXzeERnVEiWAGjy9GQl7Rpd4+T5NFAXx3w1rd9Nupb4Cl6CDbZn
	W33J3/5ZgnYUjd6ntTBlETLHgrUAScp02atCG4ixcKUp49mA2qWsxtYMap05hrENnZnylu
	nllbzfGm8AHjSVblAYDjebI9reilvj8=
Received: from valkosipuli.retiisi.eu (valkosipuli.local [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id B3FCF634C93;
	Fri,  6 Jun 2025 11:37:38 +0300 (EEST)
Date: Fri, 6 Jun 2025 08:37:38 +0000
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Hans Verkuil <hans@jjverkuil.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: ioctl: Order some code alphabetically
Message-ID: <aEKo0oRlf33teM-i@valkosipuli.retiisi.eu>
References: <20250514-keep-sorted-ioctl-v1-1-0d66585c6ce5@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250514-keep-sorted-ioctl-v1-1-0d66585c6ce5@chromium.org>

Hi Ricardo,

Thanks for the patch.

On Wed, May 14, 2025 at 09:46:12AM +0000, Ricardo Ribalda wrote:
> This limits the chances for duplicates. Use keep-sorted comments to
> avoid future disordered via media-ci tooling.

The sort order generally has been based on the IOCTL number or macro value,
not the macro name. Similarly for formats, different Bayer orders have been
kept together for a reason.

So while I think there would be some benefits from doing this, the
drawbacks are probably greater in some cases. But please see below.

> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
> Follow-up from media-summit. This is a example for how keep-sorted looks
> like.
> ---
>  drivers/media/v4l2-core/v4l2-ioctl.c | 646 ++++++++++++++++++-----------------
>  1 file changed, 328 insertions(+), 318 deletions(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
> index 650dc1956f73d2f1943b56c42140c7b8d757259f..45dfadb1233f24697e1b3deaab34f3134de421f9 100644
> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> @@ -40,36 +40,38 @@ struct std_descr {
>  };
>  
>  static const struct std_descr standards[] = {
> +	/* keep-sorted start */
>  	{ V4L2_STD_NTSC,	"NTSC"      },
> +	{ V4L2_STD_NTSC_443,	"NTSC-443"  },
>  	{ V4L2_STD_NTSC_M,	"NTSC-M"    },
>  	{ V4L2_STD_NTSC_M_JP,	"NTSC-M-JP" },
>  	{ V4L2_STD_NTSC_M_KR,	"NTSC-M-KR" },
> -	{ V4L2_STD_NTSC_443,	"NTSC-443"  },
>  	{ V4L2_STD_PAL,		"PAL"       },
> -	{ V4L2_STD_PAL_BG,	"PAL-BG"    },
> +	{ V4L2_STD_PAL_60,	"PAL-60"    },
>  	{ V4L2_STD_PAL_B,	"PAL-B"     },
>  	{ V4L2_STD_PAL_B1,	"PAL-B1"    },
> +	{ V4L2_STD_PAL_BG,	"PAL-BG"    },
> +	{ V4L2_STD_PAL_D,	"PAL-D"     },
> +	{ V4L2_STD_PAL_D1,	"PAL-D1"    },
> +	{ V4L2_STD_PAL_DK,	"PAL-DK"    },
>  	{ V4L2_STD_PAL_G,	"PAL-G"     },
>  	{ V4L2_STD_PAL_H,	"PAL-H"     },
>  	{ V4L2_STD_PAL_I,	"PAL-I"     },
> -	{ V4L2_STD_PAL_DK,	"PAL-DK"    },
> -	{ V4L2_STD_PAL_D,	"PAL-D"     },
> -	{ V4L2_STD_PAL_D1,	"PAL-D1"    },
>  	{ V4L2_STD_PAL_K,	"PAL-K"     },
>  	{ V4L2_STD_PAL_M,	"PAL-M"     },
>  	{ V4L2_STD_PAL_N,	"PAL-N"     },
>  	{ V4L2_STD_PAL_Nc,	"PAL-Nc"    },
> -	{ V4L2_STD_PAL_60,	"PAL-60"    },
>  	{ V4L2_STD_SECAM,	"SECAM"     },
>  	{ V4L2_STD_SECAM_B,	"SECAM-B"   },
> +	{ V4L2_STD_SECAM_D,	"SECAM-D"   },
> +	{ V4L2_STD_SECAM_DK,	"SECAM-DK"  },
>  	{ V4L2_STD_SECAM_G,	"SECAM-G"   },
>  	{ V4L2_STD_SECAM_H,	"SECAM-H"   },
> -	{ V4L2_STD_SECAM_DK,	"SECAM-DK"  },
> -	{ V4L2_STD_SECAM_D,	"SECAM-D"   },
>  	{ V4L2_STD_SECAM_K,	"SECAM-K"   },
>  	{ V4L2_STD_SECAM_K1,	"SECAM-K1"  },
>  	{ V4L2_STD_SECAM_L,	"SECAM-L"   },
>  	{ V4L2_STD_SECAM_LC,	"SECAM-Lc"  },
> +	/* keep-sorted end */
>  	{ 0,			"Unknown"   }
>  };
>  
> @@ -1269,289 +1271,293 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
>  	 */
>  	switch (fmt->pixelformat) {
>  	/* Max description length mask:	descr = "0123456789012345678901234567890" */
> -	case V4L2_PIX_FMT_RGB332:	descr = "8-bit RGB 3-3-2"; break;
> -	case V4L2_PIX_FMT_RGB444:	descr = "16-bit A/XRGB 4-4-4-4"; break;
> -	case V4L2_PIX_FMT_ARGB444:	descr = "16-bit ARGB 4-4-4-4"; break;
> -	case V4L2_PIX_FMT_XRGB444:	descr = "16-bit XRGB 4-4-4-4"; break;
> -	case V4L2_PIX_FMT_RGBA444:	descr = "16-bit RGBA 4-4-4-4"; break;
> -	case V4L2_PIX_FMT_RGBX444:	descr = "16-bit RGBX 4-4-4-4"; break;
> +	/* keep-sorted start */
> +	case V4L2_META_FMT_C3ISP_PARAMS:	descr = "Amlogic C3 ISP Parameters"; break;
> +	case V4L2_META_FMT_C3ISP_STATS:		descr = "Amlogic C3 ISP Statistics"; break;
> +	case V4L2_META_FMT_D4XX:	descr = "Intel D4xx UVC Metadata"; break;
> +	case V4L2_META_FMT_GENERIC_8:	descr = "8-bit Generic Metadata"; break;
> +	case V4L2_META_FMT_GENERIC_CSI2_10:	descr = "8-bit Generic Meta, 10b CSI-2"; break;
> +	case V4L2_META_FMT_GENERIC_CSI2_12:	descr = "8-bit Generic Meta, 12b CSI-2"; break;
> +	case V4L2_META_FMT_GENERIC_CSI2_14:	descr = "8-bit Generic Meta, 14b CSI-2"; break;
> +	case V4L2_META_FMT_GENERIC_CSI2_16:	descr = "8-bit Generic Meta, 16b CSI-2"; break;
> +	case V4L2_META_FMT_GENERIC_CSI2_20:	descr = "8-bit Generic Meta, 20b CSI-2"; break;
> +	case V4L2_META_FMT_GENERIC_CSI2_24:	descr = "8-bit Generic Meta, 24b CSI-2"; break;
> +	case V4L2_META_FMT_RK_ISP1_EXT_PARAMS:	descr = "Rockchip ISP1 Ext 3A Params"; break;
> +	case V4L2_META_FMT_RK_ISP1_PARAMS:	descr = "Rockchip ISP1 3A Parameters"; break;
> +	case V4L2_META_FMT_RK_ISP1_STAT_3A:	descr = "Rockchip ISP1 3A Statistics"; break;
> +	case V4L2_META_FMT_RPI_BE_CFG:	descr = "RPi PiSP BE Config format"; break;
> +	case V4L2_META_FMT_RPI_FE_CFG:  descr = "RPi PiSP FE Config format"; break;
> +	case V4L2_META_FMT_RPI_FE_STATS: descr = "RPi PiSP FE Statistics format"; break;
> +	case V4L2_META_FMT_UVC:		descr = "UVC Payload Header Metadata"; break;
> +	case V4L2_META_FMT_VIVID:       descr = "Vivid Metadata"; break;
> +	case V4L2_META_FMT_VSP1_HGO:	descr = "R-Car VSP1 1-D Histogram"; break;
> +	case V4L2_META_FMT_VSP1_HGT:	descr = "R-Car VSP1 2-D Histogram"; break;
> +	case V4L2_PIX_FMT_ABGR32:	descr = "32-bit BGRA 8-8-8-8"; break;
>  	case V4L2_PIX_FMT_ABGR444:	descr = "16-bit ABGR 4-4-4-4"; break;
> -	case V4L2_PIX_FMT_XBGR444:	descr = "16-bit XBGR 4-4-4-4"; break;
> -	case V4L2_PIX_FMT_BGRA444:	descr = "16-bit BGRA 4-4-4-4"; break;
> -	case V4L2_PIX_FMT_BGRX444:	descr = "16-bit BGRX 4-4-4-4"; break;
> -	case V4L2_PIX_FMT_RGB555:	descr = "16-bit A/XRGB 1-5-5-5"; break;
> -	case V4L2_PIX_FMT_ARGB555:	descr = "16-bit ARGB 1-5-5-5"; break;
> -	case V4L2_PIX_FMT_XRGB555:	descr = "16-bit XRGB 1-5-5-5"; break;
>  	case V4L2_PIX_FMT_ABGR555:	descr = "16-bit ABGR 1-5-5-5"; break;
> -	case V4L2_PIX_FMT_XBGR555:	descr = "16-bit XBGR 1-5-5-5"; break;
> -	case V4L2_PIX_FMT_RGBA555:	descr = "16-bit RGBA 5-5-5-1"; break;
> -	case V4L2_PIX_FMT_RGBX555:	descr = "16-bit RGBX 5-5-5-1"; break;
> -	case V4L2_PIX_FMT_BGRA555:	descr = "16-bit BGRA 5-5-5-1"; break;
> -	case V4L2_PIX_FMT_BGRX555:	descr = "16-bit BGRX 5-5-5-1"; break;
> -	case V4L2_PIX_FMT_RGB565:	descr = "16-bit RGB 5-6-5"; break;
> -	case V4L2_PIX_FMT_RGB555X:	descr = "16-bit A/XRGB 1-5-5-5 BE"; break;
> +	case V4L2_PIX_FMT_ABGR64_12:	descr = "12-bit Depth BGRA"; break;
> +	case V4L2_PIX_FMT_ARGB2101010:	descr = "32-bit ARGB 2-10-10-10"; break;
> +	case V4L2_PIX_FMT_ARGB32:	descr = "32-bit ARGB 8-8-8-8"; break;
> +	case V4L2_PIX_FMT_ARGB444:	descr = "16-bit ARGB 4-4-4-4"; break;
> +	case V4L2_PIX_FMT_ARGB555:	descr = "16-bit ARGB 1-5-5-5"; break;
>  	case V4L2_PIX_FMT_ARGB555X:	descr = "16-bit ARGB 1-5-5-5 BE"; break;
> -	case V4L2_PIX_FMT_XRGB555X:	descr = "16-bit XRGB 1-5-5-5 BE"; break;
> -	case V4L2_PIX_FMT_RGB565X:	descr = "16-bit RGB 5-6-5 BE"; break;
> -	case V4L2_PIX_FMT_BGR666:	descr = "18-bit BGRX 6-6-6-14"; break;
> +	case V4L2_PIX_FMT_AYUV32:	descr = "32-bit AYUV 8-8-8-8"; break;
>  	case V4L2_PIX_FMT_BGR24:	descr = "24-bit BGR 8-8-8"; break;
> -	case V4L2_PIX_FMT_RGB24:	descr = "24-bit RGB 8-8-8"; break;
>  	case V4L2_PIX_FMT_BGR32:	descr = "32-bit BGRA/X 8-8-8-8"; break;
> -	case V4L2_PIX_FMT_ABGR32:	descr = "32-bit BGRA 8-8-8-8"; break;
> -	case V4L2_PIX_FMT_XBGR32:	descr = "32-bit BGRX 8-8-8-8"; break;
> -	case V4L2_PIX_FMT_RGB32:	descr = "32-bit A/XRGB 8-8-8-8"; break;
> -	case V4L2_PIX_FMT_ARGB32:	descr = "32-bit ARGB 8-8-8-8"; break;
> -	case V4L2_PIX_FMT_XRGB32:	descr = "32-bit XRGB 8-8-8-8"; break;
> -	case V4L2_PIX_FMT_BGRA32:	descr = "32-bit ABGR 8-8-8-8"; break;
> -	case V4L2_PIX_FMT_BGRX32:	descr = "32-bit XBGR 8-8-8-8"; break;
> -	case V4L2_PIX_FMT_RGBA32:	descr = "32-bit RGBA 8-8-8-8"; break;
> -	case V4L2_PIX_FMT_RGBX32:	descr = "32-bit RGBX 8-8-8-8"; break;
> -	case V4L2_PIX_FMT_RGBX1010102:	descr = "32-bit RGBX 10-10-10-2"; break;
> -	case V4L2_PIX_FMT_RGBA1010102:	descr = "32-bit RGBA 10-10-10-2"; break;
> -	case V4L2_PIX_FMT_ARGB2101010:	descr = "32-bit ARGB 2-10-10-10"; break;
>  	case V4L2_PIX_FMT_BGR48:	descr = "48-bit BGR 16-16-16"; break;
> -	case V4L2_PIX_FMT_RGB48:	descr = "48-bit RGB 16-16-16"; break;
>  	case V4L2_PIX_FMT_BGR48_12:	descr = "12-bit Depth BGR"; break;
> -	case V4L2_PIX_FMT_ABGR64_12:	descr = "12-bit Depth BGRA"; break;
> -	case V4L2_PIX_FMT_GREY:		descr = "8-bit Greyscale"; break;
> -	case V4L2_PIX_FMT_Y4:		descr = "4-bit Greyscale"; break;
> -	case V4L2_PIX_FMT_Y6:		descr = "6-bit Greyscale"; break;
> -	case V4L2_PIX_FMT_Y10:		descr = "10-bit Greyscale"; break;
> -	case V4L2_PIX_FMT_Y12:		descr = "12-bit Greyscale"; break;
> -	case V4L2_PIX_FMT_Y012:		descr = "12-bit Greyscale (bits 15-4)"; break;
> -	case V4L2_PIX_FMT_Y14:		descr = "14-bit Greyscale"; break;
> -	case V4L2_PIX_FMT_Y16:		descr = "16-bit Greyscale"; break;
> -	case V4L2_PIX_FMT_Y16_BE:	descr = "16-bit Greyscale BE"; break;
> -	case V4L2_PIX_FMT_Y10BPACK:	descr = "10-bit Greyscale (Packed)"; break;
> -	case V4L2_PIX_FMT_Y10P:		descr = "10-bit Greyscale (MIPI Packed)"; break;
> -	case V4L2_PIX_FMT_IPU3_Y10:	descr = "10-bit greyscale (IPU3 Packed)"; break;
> -	case V4L2_PIX_FMT_Y12P:		descr = "12-bit Greyscale (MIPI Packed)"; break;
> -	case V4L2_PIX_FMT_Y14P:		descr = "14-bit Greyscale (MIPI Packed)"; break;
> -	case V4L2_PIX_FMT_Y8I:		descr = "Interleaved 8-bit Greyscale"; break;
> -	case V4L2_PIX_FMT_Y12I:		descr = "Interleaved 12-bit Greyscale"; break;
> -	case V4L2_PIX_FMT_Y16I:		descr = "Interleaved 16-bit Greyscale"; break;
> -	case V4L2_PIX_FMT_Z16:		descr = "16-bit Depth"; break;
> -	case V4L2_PIX_FMT_INZI:		descr = "Planar 10:16 Greyscale Depth"; break;
> +	case V4L2_PIX_FMT_BGR666:	descr = "18-bit BGRX 6-6-6-14"; break;
> +	case V4L2_PIX_FMT_BGRA32:	descr = "32-bit ABGR 8-8-8-8"; break;
> +	case V4L2_PIX_FMT_BGRA444:	descr = "16-bit BGRA 4-4-4-4"; break;
> +	case V4L2_PIX_FMT_BGRA555:	descr = "16-bit BGRA 5-5-5-1"; break;
> +	case V4L2_PIX_FMT_BGRX32:	descr = "32-bit XBGR 8-8-8-8"; break;
> +	case V4L2_PIX_FMT_BGRX444:	descr = "16-bit BGRX 4-4-4-4"; break;
> +	case V4L2_PIX_FMT_BGRX555:	descr = "16-bit BGRX 5-5-5-1"; break;
> +	case V4L2_PIX_FMT_CIT_YYVYUY:	descr = "GSPCA CIT YYVYUY"; break;
>  	case V4L2_PIX_FMT_CNF4:		descr = "4-bit Depth Confidence (Packed)"; break;
> -	case V4L2_PIX_FMT_PAL8:		descr = "8-bit Palette"; break;
> -	case V4L2_PIX_FMT_UV8:		descr = "8-bit Chrominance UV 4-4"; break;
> -	case V4L2_PIX_FMT_YVU410:	descr = "Planar YVU 4:1:0"; break;
> -	case V4L2_PIX_FMT_YVU420:	descr = "Planar YVU 4:2:0"; break;
> -	case V4L2_PIX_FMT_YUYV:		descr = "YUYV 4:2:2"; break;
> -	case V4L2_PIX_FMT_YYUV:		descr = "YYUV 4:2:2"; break;
> -	case V4L2_PIX_FMT_YVYU:		descr = "YVYU 4:2:2"; break;
> -	case V4L2_PIX_FMT_UYVY:		descr = "UYVY 4:2:2"; break;
> -	case V4L2_PIX_FMT_VYUY:		descr = "VYUY 4:2:2"; break;
> -	case V4L2_PIX_FMT_YUV422P:	descr = "Planar YUV 4:2:2"; break;
> -	case V4L2_PIX_FMT_YUV411P:	descr = "Planar YUV 4:1:1"; break;
> -	case V4L2_PIX_FMT_Y41P:		descr = "YUV 4:1:1 (Packed)"; break;
> -	case V4L2_PIX_FMT_YUV444:	descr = "16-bit A/XYUV 4-4-4-4"; break;
> -	case V4L2_PIX_FMT_YUV555:	descr = "16-bit A/XYUV 1-5-5-5"; break;
> -	case V4L2_PIX_FMT_YUV565:	descr = "16-bit YUV 5-6-5"; break;
> -	case V4L2_PIX_FMT_YUV24:	descr = "24-bit YUV 4:4:4 8-8-8"; break;
> -	case V4L2_PIX_FMT_YUV32:	descr = "32-bit A/XYUV 8-8-8-8"; break;
> -	case V4L2_PIX_FMT_AYUV32:	descr = "32-bit AYUV 8-8-8-8"; break;
> -	case V4L2_PIX_FMT_XYUV32:	descr = "32-bit XYUV 8-8-8-8"; break;
> -	case V4L2_PIX_FMT_VUYA32:	descr = "32-bit VUYA 8-8-8-8"; break;
> -	case V4L2_PIX_FMT_VUYX32:	descr = "32-bit VUYX 8-8-8-8"; break;
> -	case V4L2_PIX_FMT_YUVA32:	descr = "32-bit YUVA 8-8-8-8"; break;
> -	case V4L2_PIX_FMT_YUVX32:	descr = "32-bit YUVX 8-8-8-8"; break;
> -	case V4L2_PIX_FMT_YUV410:	descr = "Planar YUV 4:1:0"; break;
> -	case V4L2_PIX_FMT_YUV420:	descr = "Planar YUV 4:2:0"; break;
> +	case V4L2_PIX_FMT_GREY:		descr = "8-bit Greyscale"; break;
>  	case V4L2_PIX_FMT_HI240:	descr = "8-bit Dithered RGB (BTTV)"; break;
> +	case V4L2_PIX_FMT_HSV24:	descr = "24-bit HSV 8-8-8"; break;
> +	case V4L2_PIX_FMT_HSV32:	descr = "32-bit XHSV 8-8-8-8"; break;
> +	case V4L2_PIX_FMT_INZI:		descr = "Planar 10:16 Greyscale Depth"; break;
> +	case V4L2_PIX_FMT_IPU3_SBGGR10: descr = "10-bit bayer BGGR IPU3 Packed"; break;
> +	case V4L2_PIX_FMT_IPU3_SGBRG10: descr = "10-bit bayer GBRG IPU3 Packed"; break;
> +	case V4L2_PIX_FMT_IPU3_SGRBG10: descr = "10-bit bayer GRBG IPU3 Packed"; break;
> +	case V4L2_PIX_FMT_IPU3_SRGGB10: descr = "10-bit bayer RGGB IPU3 Packed"; break;
> +	case V4L2_PIX_FMT_IPU3_Y10:	descr = "10-bit greyscale (IPU3 Packed)"; break;
> +	case V4L2_PIX_FMT_KONICA420:	descr = "GSPCA KONICA420"; break;
>  	case V4L2_PIX_FMT_M420:		descr = "YUV 4:2:0 (M420)"; break;
> -	case V4L2_PIX_FMT_YUV48_12:	descr = "12-bit YUV 4:4:4 Packed"; break;
> +	case V4L2_PIX_FMT_MM21:		descr = "Mediatek 8-bit Block Format"; break;
>  	case V4L2_PIX_FMT_NV12:		descr = "Y/UV 4:2:0"; break;
> -	case V4L2_PIX_FMT_NV21:		descr = "Y/VU 4:2:0"; break;
> +	case V4L2_PIX_FMT_NV12M:	descr = "Y/UV 4:2:0 (N-C)"; break;
> +	case V4L2_PIX_FMT_NV12MT:	descr = "Y/UV 4:2:0 (64x32 MB, N-C)"; break;
> +	case V4L2_PIX_FMT_NV12MT_16X16:	descr = "Y/UV 4:2:0 (16x16 MB, N-C)"; break;
> +	case V4L2_PIX_FMT_NV12M_10BE_8L128:	descr = "10-bit NV12M (8x128 Linear, BE)"; break;
> +	case V4L2_PIX_FMT_NV12M_8L128:	descr = "NV12M (8x128 Linear)"; break;
> +	case V4L2_PIX_FMT_NV12_10BE_8L128:	descr = "10-bit NV12 (8x128 Linear, BE)"; break;
> +	case V4L2_PIX_FMT_NV12_16L16:	descr = "Y/UV 4:2:0 (16x16 Linear)"; break;
> +	case V4L2_PIX_FMT_NV12_32L32:   descr = "Y/UV 4:2:0 (32x32 Linear)"; break;
> +	case V4L2_PIX_FMT_NV12_4L4:	descr = "Y/UV 4:2:0 (4x4 Linear)"; break;
> +	case V4L2_PIX_FMT_NV12_8L128:	descr = "NV12 (8x128 Linear)"; break;
>  	case V4L2_PIX_FMT_NV15:		descr = "10-bit Y/UV 4:2:0 (Packed)"; break;
> +	case V4L2_PIX_FMT_NV15_4L4:	descr = "10-bit Y/UV 4:2:0 (4x4 Linear)"; break;
>  	case V4L2_PIX_FMT_NV16:		descr = "Y/UV 4:2:2"; break;
> -	case V4L2_PIX_FMT_NV61:		descr = "Y/VU 4:2:2"; break;
> +	case V4L2_PIX_FMT_NV16M:	descr = "Y/UV 4:2:2 (N-C)"; break;
>  	case V4L2_PIX_FMT_NV20:		descr = "10-bit Y/UV 4:2:2 (Packed)"; break;
> +	case V4L2_PIX_FMT_NV21:		descr = "Y/VU 4:2:0"; break;
> +	case V4L2_PIX_FMT_NV21M:	descr = "Y/VU 4:2:0 (N-C)"; break;
>  	case V4L2_PIX_FMT_NV24:		descr = "Y/UV 4:4:4"; break;
>  	case V4L2_PIX_FMT_NV42:		descr = "Y/VU 4:4:4"; break;
> +	case V4L2_PIX_FMT_NV61:		descr = "Y/VU 4:2:2"; break;
> +	case V4L2_PIX_FMT_NV61M:	descr = "Y/VU 4:2:2 (N-C)"; break;
>  	case V4L2_PIX_FMT_P010:		descr = "10-bit Y/UV 4:2:0"; break;
> -	case V4L2_PIX_FMT_P012:		descr = "12-bit Y/UV 4:2:0"; break;
> -	case V4L2_PIX_FMT_NV12_4L4:	descr = "Y/UV 4:2:0 (4x4 Linear)"; break;
> -	case V4L2_PIX_FMT_NV12_16L16:	descr = "Y/UV 4:2:0 (16x16 Linear)"; break;
> -	case V4L2_PIX_FMT_NV12_32L32:   descr = "Y/UV 4:2:0 (32x32 Linear)"; break;
> -	case V4L2_PIX_FMT_NV15_4L4:	descr = "10-bit Y/UV 4:2:0 (4x4 Linear)"; break;
>  	case V4L2_PIX_FMT_P010_4L4:	descr = "10-bit Y/UV 4:2:0 (4x4 Linear)"; break;
> -	case V4L2_PIX_FMT_NV12M:	descr = "Y/UV 4:2:0 (N-C)"; break;
> -	case V4L2_PIX_FMT_NV21M:	descr = "Y/VU 4:2:0 (N-C)"; break;
> -	case V4L2_PIX_FMT_NV16M:	descr = "Y/UV 4:2:2 (N-C)"; break;
> -	case V4L2_PIX_FMT_NV61M:	descr = "Y/VU 4:2:2 (N-C)"; break;
> -	case V4L2_PIX_FMT_NV12MT:	descr = "Y/UV 4:2:0 (64x32 MB, N-C)"; break;
> -	case V4L2_PIX_FMT_NV12MT_16X16:	descr = "Y/UV 4:2:0 (16x16 MB, N-C)"; break;
> +	case V4L2_PIX_FMT_P012:		descr = "12-bit Y/UV 4:2:0"; break;
>  	case V4L2_PIX_FMT_P012M:	descr = "12-bit Y/UV 4:2:0 (N-C)"; break;
> -	case V4L2_PIX_FMT_YUV420M:	descr = "Planar YUV 4:2:0 (N-C)"; break;
> -	case V4L2_PIX_FMT_YVU420M:	descr = "Planar YVU 4:2:0 (N-C)"; break;
> -	case V4L2_PIX_FMT_YUV422M:	descr = "Planar YUV 4:2:2 (N-C)"; break;
> -	case V4L2_PIX_FMT_YVU422M:	descr = "Planar YVU 4:2:2 (N-C)"; break;
> -	case V4L2_PIX_FMT_YUV444M:	descr = "Planar YUV 4:4:4 (N-C)"; break;
> -	case V4L2_PIX_FMT_YVU444M:	descr = "Planar YVU 4:4:4 (N-C)"; break;
> -	case V4L2_PIX_FMT_SBGGR8:	descr = "8-bit Bayer BGBG/GRGR"; break;
> -	case V4L2_PIX_FMT_SGBRG8:	descr = "8-bit Bayer GBGB/RGRG"; break;
> -	case V4L2_PIX_FMT_SGRBG8:	descr = "8-bit Bayer GRGR/BGBG"; break;
> -	case V4L2_PIX_FMT_SRGGB8:	descr = "8-bit Bayer RGRG/GBGB"; break;
> +	case V4L2_PIX_FMT_PAL8:		descr = "8-bit Palette"; break;
> +	case V4L2_PIX_FMT_RGB24:	descr = "24-bit RGB 8-8-8"; break;
> +	case V4L2_PIX_FMT_RGB32:	descr = "32-bit A/XRGB 8-8-8-8"; break;
> +	case V4L2_PIX_FMT_RGB332:	descr = "8-bit RGB 3-3-2"; break;
> +	case V4L2_PIX_FMT_RGB444:	descr = "16-bit A/XRGB 4-4-4-4"; break;
> +	case V4L2_PIX_FMT_RGB48:	descr = "48-bit RGB 16-16-16"; break;
> +	case V4L2_PIX_FMT_RGB555:	descr = "16-bit A/XRGB 1-5-5-5"; break;
> +	case V4L2_PIX_FMT_RGB555X:	descr = "16-bit A/XRGB 1-5-5-5 BE"; break;
> +	case V4L2_PIX_FMT_RGB565:	descr = "16-bit RGB 5-6-5"; break;
> +	case V4L2_PIX_FMT_RGB565X:	descr = "16-bit RGB 5-6-5 BE"; break;
> +	case V4L2_PIX_FMT_RGBA1010102:	descr = "32-bit RGBA 10-10-10-2"; break;
> +	case V4L2_PIX_FMT_RGBA32:	descr = "32-bit RGBA 8-8-8-8"; break;
> +	case V4L2_PIX_FMT_RGBA444:	descr = "16-bit RGBA 4-4-4-4"; break;
> +	case V4L2_PIX_FMT_RGBA555:	descr = "16-bit RGBA 5-5-5-1"; break;
> +	case V4L2_PIX_FMT_RGBX1010102:	descr = "32-bit RGBX 10-10-10-2"; break;
> +	case V4L2_PIX_FMT_RGBX32:	descr = "32-bit RGBX 8-8-8-8"; break;
> +	case V4L2_PIX_FMT_RGBX444:	descr = "16-bit RGBX 4-4-4-4"; break;
> +	case V4L2_PIX_FMT_RGBX555:	descr = "16-bit RGBX 5-5-5-1"; break;
>  	case V4L2_PIX_FMT_SBGGR10:	descr = "10-bit Bayer BGBG/GRGR"; break;
> -	case V4L2_PIX_FMT_SGBRG10:	descr = "10-bit Bayer GBGB/RGRG"; break;
> -	case V4L2_PIX_FMT_SGRBG10:	descr = "10-bit Bayer GRGR/BGBG"; break;
> -	case V4L2_PIX_FMT_SRGGB10:	descr = "10-bit Bayer RGRG/GBGB"; break;
> -	case V4L2_PIX_FMT_SBGGR10P:	descr = "10-bit Bayer BGBG/GRGR Packed"; break;
> -	case V4L2_PIX_FMT_SGBRG10P:	descr = "10-bit Bayer GBGB/RGRG Packed"; break;
> -	case V4L2_PIX_FMT_SGRBG10P:	descr = "10-bit Bayer GRGR/BGBG Packed"; break;
> -	case V4L2_PIX_FMT_SRGGB10P:	descr = "10-bit Bayer RGRG/GBGB Packed"; break;
> -	case V4L2_PIX_FMT_IPU3_SBGGR10: descr = "10-bit bayer BGGR IPU3 Packed"; break;
> -	case V4L2_PIX_FMT_IPU3_SGBRG10: descr = "10-bit bayer GBRG IPU3 Packed"; break;
> -	case V4L2_PIX_FMT_IPU3_SGRBG10: descr = "10-bit bayer GRBG IPU3 Packed"; break;
> -	case V4L2_PIX_FMT_IPU3_SRGGB10: descr = "10-bit bayer RGGB IPU3 Packed"; break;
>  	case V4L2_PIX_FMT_SBGGR10ALAW8:	descr = "8-bit Bayer BGBG/GRGR (A-law)"; break;
> -	case V4L2_PIX_FMT_SGBRG10ALAW8:	descr = "8-bit Bayer GBGB/RGRG (A-law)"; break;
> -	case V4L2_PIX_FMT_SGRBG10ALAW8:	descr = "8-bit Bayer GRGR/BGBG (A-law)"; break;
> -	case V4L2_PIX_FMT_SRGGB10ALAW8:	descr = "8-bit Bayer RGRG/GBGB (A-law)"; break;
>  	case V4L2_PIX_FMT_SBGGR10DPCM8:	descr = "8-bit Bayer BGBG/GRGR (DPCM)"; break;
> -	case V4L2_PIX_FMT_SGBRG10DPCM8:	descr = "8-bit Bayer GBGB/RGRG (DPCM)"; break;
> -	case V4L2_PIX_FMT_SGRBG10DPCM8:	descr = "8-bit Bayer GRGR/BGBG (DPCM)"; break;
> -	case V4L2_PIX_FMT_SRGGB10DPCM8:	descr = "8-bit Bayer RGRG/GBGB (DPCM)"; break;
> +	case V4L2_PIX_FMT_SBGGR10P:	descr = "10-bit Bayer BGBG/GRGR Packed"; break;
>  	case V4L2_PIX_FMT_SBGGR12:	descr = "12-bit Bayer BGBG/GRGR"; break;
> -	case V4L2_PIX_FMT_SGBRG12:	descr = "12-bit Bayer GBGB/RGRG"; break;
> -	case V4L2_PIX_FMT_SGRBG12:	descr = "12-bit Bayer GRGR/BGBG"; break;
> -	case V4L2_PIX_FMT_SRGGB12:	descr = "12-bit Bayer RGRG/GBGB"; break;
>  	case V4L2_PIX_FMT_SBGGR12P:	descr = "12-bit Bayer BGBG/GRGR Packed"; break;
> -	case V4L2_PIX_FMT_SGBRG12P:	descr = "12-bit Bayer GBGB/RGRG Packed"; break;
> -	case V4L2_PIX_FMT_SGRBG12P:	descr = "12-bit Bayer GRGR/BGBG Packed"; break;
> -	case V4L2_PIX_FMT_SRGGB12P:	descr = "12-bit Bayer RGRG/GBGB Packed"; break;
>  	case V4L2_PIX_FMT_SBGGR14:	descr = "14-bit Bayer BGBG/GRGR"; break;
> -	case V4L2_PIX_FMT_SGBRG14:	descr = "14-bit Bayer GBGB/RGRG"; break;
> -	case V4L2_PIX_FMT_SGRBG14:	descr = "14-bit Bayer GRGR/BGBG"; break;
> -	case V4L2_PIX_FMT_SRGGB14:	descr = "14-bit Bayer RGRG/GBGB"; break;
>  	case V4L2_PIX_FMT_SBGGR14P:	descr = "14-bit Bayer BGBG/GRGR Packed"; break;
> -	case V4L2_PIX_FMT_SGBRG14P:	descr = "14-bit Bayer GBGB/RGRG Packed"; break;
> -	case V4L2_PIX_FMT_SGRBG14P:	descr = "14-bit Bayer GRGR/BGBG Packed"; break;
> -	case V4L2_PIX_FMT_SRGGB14P:	descr = "14-bit Bayer RGRG/GBGB Packed"; break;
>  	case V4L2_PIX_FMT_SBGGR16:	descr = "16-bit Bayer BGBG/GRGR"; break;
> +	case V4L2_PIX_FMT_SBGGR8:	descr = "8-bit Bayer BGBG/GRGR"; break;
> +	case V4L2_PIX_FMT_SGBRG10:	descr = "10-bit Bayer GBGB/RGRG"; break;
> +	case V4L2_PIX_FMT_SGBRG10ALAW8:	descr = "8-bit Bayer GBGB/RGRG (A-law)"; break;
> +	case V4L2_PIX_FMT_SGBRG10DPCM8:	descr = "8-bit Bayer GBGB/RGRG (DPCM)"; break;
> +	case V4L2_PIX_FMT_SGBRG10P:	descr = "10-bit Bayer GBGB/RGRG Packed"; break;
> +	case V4L2_PIX_FMT_SGBRG12:	descr = "12-bit Bayer GBGB/RGRG"; break;
> +	case V4L2_PIX_FMT_SGBRG12P:	descr = "12-bit Bayer GBGB/RGRG Packed"; break;
> +	case V4L2_PIX_FMT_SGBRG14:	descr = "14-bit Bayer GBGB/RGRG"; break;
> +	case V4L2_PIX_FMT_SGBRG14P:	descr = "14-bit Bayer GBGB/RGRG Packed"; break;
>  	case V4L2_PIX_FMT_SGBRG16:	descr = "16-bit Bayer GBGB/RGRG"; break;
> +	case V4L2_PIX_FMT_SGBRG8:	descr = "8-bit Bayer GBGB/RGRG"; break;
> +	case V4L2_PIX_FMT_SGRBG10:	descr = "10-bit Bayer GRGR/BGBG"; break;
> +	case V4L2_PIX_FMT_SGRBG10ALAW8:	descr = "8-bit Bayer GRGR/BGBG (A-law)"; break;
> +	case V4L2_PIX_FMT_SGRBG10DPCM8:	descr = "8-bit Bayer GRGR/BGBG (DPCM)"; break;
> +	case V4L2_PIX_FMT_SGRBG10P:	descr = "10-bit Bayer GRGR/BGBG Packed"; break;
> +	case V4L2_PIX_FMT_SGRBG12:	descr = "12-bit Bayer GRGR/BGBG"; break;
> +	case V4L2_PIX_FMT_SGRBG12P:	descr = "12-bit Bayer GRGR/BGBG Packed"; break;
> +	case V4L2_PIX_FMT_SGRBG14:	descr = "14-bit Bayer GRGR/BGBG"; break;
> +	case V4L2_PIX_FMT_SGRBG14P:	descr = "14-bit Bayer GRGR/BGBG Packed"; break;
>  	case V4L2_PIX_FMT_SGRBG16:	descr = "16-bit Bayer GRGR/BGBG"; break;
> -	case V4L2_PIX_FMT_SRGGB16:	descr = "16-bit Bayer RGRG/GBGB"; break;
> +	case V4L2_PIX_FMT_SGRBG8:	descr = "8-bit Bayer GRGR/BGBG"; break;
>  	case V4L2_PIX_FMT_SN9C20X_I420:	descr = "GSPCA SN9C20X I420"; break;
>  	case V4L2_PIX_FMT_SPCA501:	descr = "GSPCA SPCA501"; break;
>  	case V4L2_PIX_FMT_SPCA505:	descr = "GSPCA SPCA505"; break;
>  	case V4L2_PIX_FMT_SPCA508:	descr = "GSPCA SPCA508"; break;
> +	case V4L2_PIX_FMT_SRGGB10:	descr = "10-bit Bayer RGRG/GBGB"; break;
> +	case V4L2_PIX_FMT_SRGGB10ALAW8:	descr = "8-bit Bayer RGRG/GBGB (A-law)"; break;
> +	case V4L2_PIX_FMT_SRGGB10DPCM8:	descr = "8-bit Bayer RGRG/GBGB (DPCM)"; break;
> +	case V4L2_PIX_FMT_SRGGB10P:	descr = "10-bit Bayer RGRG/GBGB Packed"; break;
> +	case V4L2_PIX_FMT_SRGGB12:	descr = "12-bit Bayer RGRG/GBGB"; break;
> +	case V4L2_PIX_FMT_SRGGB12P:	descr = "12-bit Bayer RGRG/GBGB Packed"; break;
> +	case V4L2_PIX_FMT_SRGGB14:	descr = "14-bit Bayer RGRG/GBGB"; break;
> +	case V4L2_PIX_FMT_SRGGB14P:	descr = "14-bit Bayer RGRG/GBGB Packed"; break;
> +	case V4L2_PIX_FMT_SRGGB16:	descr = "16-bit Bayer RGRG/GBGB"; break;
> +	case V4L2_PIX_FMT_SRGGB8:	descr = "8-bit Bayer RGRG/GBGB"; break;
>  	case V4L2_PIX_FMT_STV0680:	descr = "GSPCA STV0680"; break;
>  	case V4L2_PIX_FMT_TM6000:	descr = "A/V + VBI Mux Packet"; break;
> -	case V4L2_PIX_FMT_CIT_YYVYUY:	descr = "GSPCA CIT YYVYUY"; break;
> -	case V4L2_PIX_FMT_KONICA420:	descr = "GSPCA KONICA420"; break;
> -	case V4L2_PIX_FMT_MM21:		descr = "Mediatek 8-bit Block Format"; break;
> -	case V4L2_PIX_FMT_HSV24:	descr = "24-bit HSV 8-8-8"; break;
> -	case V4L2_PIX_FMT_HSV32:	descr = "32-bit XHSV 8-8-8-8"; break;
> -	case V4L2_SDR_FMT_CU8:		descr = "Complex U8"; break;
> -	case V4L2_SDR_FMT_CU16LE:	descr = "Complex U16LE"; break;
> -	case V4L2_SDR_FMT_CS8:		descr = "Complex S8"; break;
> +	case V4L2_PIX_FMT_UV8:		descr = "8-bit Chrominance UV 4-4"; break;
> +	case V4L2_PIX_FMT_UYVY:		descr = "UYVY 4:2:2"; break;
> +	case V4L2_PIX_FMT_VUYA32:	descr = "32-bit VUYA 8-8-8-8"; break;
> +	case V4L2_PIX_FMT_VUYX32:	descr = "32-bit VUYX 8-8-8-8"; break;
> +	case V4L2_PIX_FMT_VYUY:		descr = "VYUY 4:2:2"; break;
> +	case V4L2_PIX_FMT_XBGR32:	descr = "32-bit BGRX 8-8-8-8"; break;
> +	case V4L2_PIX_FMT_XBGR444:	descr = "16-bit XBGR 4-4-4-4"; break;
> +	case V4L2_PIX_FMT_XBGR555:	descr = "16-bit XBGR 1-5-5-5"; break;
> +	case V4L2_PIX_FMT_XRGB32:	descr = "32-bit XRGB 8-8-8-8"; break;
> +	case V4L2_PIX_FMT_XRGB444:	descr = "16-bit XRGB 4-4-4-4"; break;
> +	case V4L2_PIX_FMT_XRGB555:	descr = "16-bit XRGB 1-5-5-5"; break;
> +	case V4L2_PIX_FMT_XRGB555X:	descr = "16-bit XRGB 1-5-5-5 BE"; break;
> +	case V4L2_PIX_FMT_XYUV32:	descr = "32-bit XYUV 8-8-8-8"; break;
> +	case V4L2_PIX_FMT_Y012:		descr = "12-bit Greyscale (bits 15-4)"; break;
> +	case V4L2_PIX_FMT_Y10:		descr = "10-bit Greyscale"; break;
> +	case V4L2_PIX_FMT_Y10BPACK:	descr = "10-bit Greyscale (Packed)"; break;
> +	case V4L2_PIX_FMT_Y10P:		descr = "10-bit Greyscale (MIPI Packed)"; break;
> +	case V4L2_PIX_FMT_Y12:		descr = "12-bit Greyscale"; break;
> +	case V4L2_PIX_FMT_Y12I:		descr = "Interleaved 12-bit Greyscale"; break;
> +	case V4L2_PIX_FMT_Y12P:		descr = "12-bit Greyscale (MIPI Packed)"; break;
> +	case V4L2_PIX_FMT_Y14:		descr = "14-bit Greyscale"; break;
> +	case V4L2_PIX_FMT_Y14P:		descr = "14-bit Greyscale (MIPI Packed)"; break;
> +	case V4L2_PIX_FMT_Y16:		descr = "16-bit Greyscale"; break;
> +	case V4L2_PIX_FMT_Y16I:		descr = "Interleaved 16-bit Greyscale"; break;
> +	case V4L2_PIX_FMT_Y16_BE:	descr = "16-bit Greyscale BE"; break;
> +	case V4L2_PIX_FMT_Y210:		descr = "10-bit YUYV Packed"; break;
> +	case V4L2_PIX_FMT_Y212:		descr = "12-bit YUYV Packed"; break;
> +	case V4L2_PIX_FMT_Y216:		descr = "16-bit YUYV Packed"; break;
> +	case V4L2_PIX_FMT_Y41P:		descr = "YUV 4:1:1 (Packed)"; break;
> +	case V4L2_PIX_FMT_Y4:		descr = "4-bit Greyscale"; break;
> +	case V4L2_PIX_FMT_Y6:		descr = "6-bit Greyscale"; break;
> +	case V4L2_PIX_FMT_Y8I:		descr = "Interleaved 8-bit Greyscale"; break;
> +	case V4L2_PIX_FMT_YUV24:	descr = "24-bit YUV 4:4:4 8-8-8"; break;
> +	case V4L2_PIX_FMT_YUV32:	descr = "32-bit A/XYUV 8-8-8-8"; break;
> +	case V4L2_PIX_FMT_YUV410:	descr = "Planar YUV 4:1:0"; break;
> +	case V4L2_PIX_FMT_YUV411P:	descr = "Planar YUV 4:1:1"; break;
> +	case V4L2_PIX_FMT_YUV420:	descr = "Planar YUV 4:2:0"; break;
> +	case V4L2_PIX_FMT_YUV420M:	descr = "Planar YUV 4:2:0 (N-C)"; break;
> +	case V4L2_PIX_FMT_YUV422M:	descr = "Planar YUV 4:2:2 (N-C)"; break;
> +	case V4L2_PIX_FMT_YUV422P:	descr = "Planar YUV 4:2:2"; break;
> +	case V4L2_PIX_FMT_YUV444:	descr = "16-bit A/XYUV 4-4-4-4"; break;
> +	case V4L2_PIX_FMT_YUV444M:	descr = "Planar YUV 4:4:4 (N-C)"; break;
> +	case V4L2_PIX_FMT_YUV48_12:	descr = "12-bit YUV 4:4:4 Packed"; break;
> +	case V4L2_PIX_FMT_YUV555:	descr = "16-bit A/XYUV 1-5-5-5"; break;
> +	case V4L2_PIX_FMT_YUV565:	descr = "16-bit YUV 5-6-5"; break;
> +	case V4L2_PIX_FMT_YUVA32:	descr = "32-bit YUVA 8-8-8-8"; break;
> +	case V4L2_PIX_FMT_YUVX32:	descr = "32-bit YUVX 8-8-8-8"; break;
> +	case V4L2_PIX_FMT_YUYV:		descr = "YUYV 4:2:2"; break;
> +	case V4L2_PIX_FMT_YVU410:	descr = "Planar YVU 4:1:0"; break;
> +	case V4L2_PIX_FMT_YVU420:	descr = "Planar YVU 4:2:0"; break;
> +	case V4L2_PIX_FMT_YVU420M:	descr = "Planar YVU 4:2:0 (N-C)"; break;
> +	case V4L2_PIX_FMT_YVU422M:	descr = "Planar YVU 4:2:2 (N-C)"; break;
> +	case V4L2_PIX_FMT_YVU444M:	descr = "Planar YVU 4:4:4 (N-C)"; break;
> +	case V4L2_PIX_FMT_YVYU:		descr = "YVYU 4:2:2"; break;
> +	case V4L2_PIX_FMT_YYUV:		descr = "YYUV 4:2:2"; break;
> +	case V4L2_PIX_FMT_Z16:		descr = "16-bit Depth"; break;
>  	case V4L2_SDR_FMT_CS14LE:	descr = "Complex S14LE"; break;
> -	case V4L2_SDR_FMT_RU12LE:	descr = "Real U12LE"; break;
> +	case V4L2_SDR_FMT_CS8:		descr = "Complex S8"; break;
> +	case V4L2_SDR_FMT_CU16LE:	descr = "Complex U16LE"; break;
> +	case V4L2_SDR_FMT_CU8:		descr = "Complex U8"; break;
>  	case V4L2_SDR_FMT_PCU16BE:	descr = "Planar Complex U16BE"; break;
>  	case V4L2_SDR_FMT_PCU18BE:	descr = "Planar Complex U18BE"; break;
>  	case V4L2_SDR_FMT_PCU20BE:	descr = "Planar Complex U20BE"; break;
> -	case V4L2_TCH_FMT_DELTA_TD16:	descr = "16-bit Signed Deltas"; break;
> +	case V4L2_SDR_FMT_RU12LE:	descr = "Real U12LE"; break;
>  	case V4L2_TCH_FMT_DELTA_TD08:	descr = "8-bit Signed Deltas"; break;
> -	case V4L2_TCH_FMT_TU16:		descr = "16-bit Unsigned Touch Data"; break;
> +	case V4L2_TCH_FMT_DELTA_TD16:	descr = "16-bit Signed Deltas"; break;
>  	case V4L2_TCH_FMT_TU08:		descr = "8-bit Unsigned Touch Data"; break;
> -	case V4L2_META_FMT_VSP1_HGO:	descr = "R-Car VSP1 1-D Histogram"; break;
> -	case V4L2_META_FMT_VSP1_HGT:	descr = "R-Car VSP1 2-D Histogram"; break;
> -	case V4L2_META_FMT_UVC:		descr = "UVC Payload Header Metadata"; break;
> -	case V4L2_META_FMT_D4XX:	descr = "Intel D4xx UVC Metadata"; break;
> -	case V4L2_META_FMT_VIVID:       descr = "Vivid Metadata"; break;
> -	case V4L2_META_FMT_RK_ISP1_PARAMS:	descr = "Rockchip ISP1 3A Parameters"; break;
> -	case V4L2_META_FMT_RK_ISP1_STAT_3A:	descr = "Rockchip ISP1 3A Statistics"; break;
> -	case V4L2_META_FMT_RK_ISP1_EXT_PARAMS:	descr = "Rockchip ISP1 Ext 3A Params"; break;
> -	case V4L2_META_FMT_C3ISP_PARAMS:	descr = "Amlogic C3 ISP Parameters"; break;
> -	case V4L2_META_FMT_C3ISP_STATS:		descr = "Amlogic C3 ISP Statistics"; break;
> -	case V4L2_PIX_FMT_NV12_8L128:	descr = "NV12 (8x128 Linear)"; break;
> -	case V4L2_PIX_FMT_NV12M_8L128:	descr = "NV12M (8x128 Linear)"; break;
> -	case V4L2_PIX_FMT_NV12_10BE_8L128:	descr = "10-bit NV12 (8x128 Linear, BE)"; break;
> -	case V4L2_PIX_FMT_NV12M_10BE_8L128:	descr = "10-bit NV12M (8x128 Linear, BE)"; break;
> -	case V4L2_PIX_FMT_Y210:		descr = "10-bit YUYV Packed"; break;
> -	case V4L2_PIX_FMT_Y212:		descr = "12-bit YUYV Packed"; break;
> -	case V4L2_PIX_FMT_Y216:		descr = "16-bit YUYV Packed"; break;
> -	case V4L2_META_FMT_RPI_BE_CFG:	descr = "RPi PiSP BE Config format"; break;
> -	case V4L2_META_FMT_RPI_FE_CFG:  descr = "RPi PiSP FE Config format"; break;
> -	case V4L2_META_FMT_RPI_FE_STATS: descr = "RPi PiSP FE Statistics format"; break;
> -	case V4L2_META_FMT_GENERIC_8:	descr = "8-bit Generic Metadata"; break;
> -	case V4L2_META_FMT_GENERIC_CSI2_10:	descr = "8-bit Generic Meta, 10b CSI-2"; break;
> -	case V4L2_META_FMT_GENERIC_CSI2_12:	descr = "8-bit Generic Meta, 12b CSI-2"; break;
> -	case V4L2_META_FMT_GENERIC_CSI2_14:	descr = "8-bit Generic Meta, 14b CSI-2"; break;
> -	case V4L2_META_FMT_GENERIC_CSI2_16:	descr = "8-bit Generic Meta, 16b CSI-2"; break;
> -	case V4L2_META_FMT_GENERIC_CSI2_20:	descr = "8-bit Generic Meta, 20b CSI-2"; break;
> -	case V4L2_META_FMT_GENERIC_CSI2_24:	descr = "8-bit Generic Meta, 24b CSI-2"; break;
> +	case V4L2_TCH_FMT_TU16:		descr = "16-bit Unsigned Touch Data"; break;

This changes the order from that in videodev2.h, e.g. spreading the Bayer
formats of different bit depths in four different places. The list
admittedly didn't have order entirely comparable to videodev2.h due to
compressed formats.

How much do you think there is deviance currently from the videodev2.h
order, taking the compressed formats below into account?

> +	/* keep-sorted end */
>  
>  	default:
>  		/* Compressed formats */
>  		flags = V4L2_FMT_FLAG_COMPRESSED;
>  		switch (fmt->pixelformat) {
>  		/* Max description length mask:	descr = "0123456789012345678901234567890" */
> -		case V4L2_PIX_FMT_MJPEG:	descr = "Motion-JPEG"; break;
> -		case V4L2_PIX_FMT_JPEG:		descr = "JFIF JPEG"; break;
> +		/* keep-sorted start */
> +		case V4L2_PIX_FMT_AJPG:		descr = "Aspeed JPEG"; break;
> +		case V4L2_PIX_FMT_AV1_FRAME:	descr = "AV1 Frame"; break;
> +		case V4L2_PIX_FMT_CPIA1:	descr = "GSPCA CPiA YUV"; break;
>  		case V4L2_PIX_FMT_DV:		descr = "1394"; break;
> -		case V4L2_PIX_FMT_MPEG:		descr = "MPEG-1/2/4"; break;
> +		case V4L2_PIX_FMT_ET61X251:	descr = "GSPCA ET61X251"; break;
> +		case V4L2_PIX_FMT_FWHT:		descr = "FWHT"; break; /* used in vicodec */
> +		case V4L2_PIX_FMT_FWHT_STATELESS:	descr = "FWHT Stateless"; break; /* used in vicodec */
> +		case V4L2_PIX_FMT_H263:		descr = "H.263"; break;
>  		case V4L2_PIX_FMT_H264:		descr = "H.264"; break;
> -		case V4L2_PIX_FMT_H264_NO_SC:	descr = "H.264 (No Start Codes)"; break;
>  		case V4L2_PIX_FMT_H264_MVC:	descr = "H.264 MVC"; break;
> +		case V4L2_PIX_FMT_H264_NO_SC:	descr = "H.264 (No Start Codes)"; break;
>  		case V4L2_PIX_FMT_H264_SLICE:	descr = "H.264 Parsed Slice Data"; break;
> -		case V4L2_PIX_FMT_H263:		descr = "H.263"; break;
> +		case V4L2_PIX_FMT_HEVC:		descr = "HEVC"; break; /* aka H.265 */
> +		case V4L2_PIX_FMT_HEVC_SLICE:	descr = "HEVC Parsed Slice Data"; break;
> +		case V4L2_PIX_FMT_HEXTILE:	descr = "Hextile Compressed Format"; break;
> +		case V4L2_PIX_FMT_JL2005BCD:	descr = "GSPCA JL2005BCD"; break;
> +		case V4L2_PIX_FMT_JPEG:		descr = "JFIF JPEG"; break;
> +		case V4L2_PIX_FMT_JPGL:		descr = "JPEG Lite"; break;
> +		case V4L2_PIX_FMT_MJPEG:	descr = "Motion-JPEG"; break;
>  		case V4L2_PIX_FMT_MPEG1:	descr = "MPEG-1 ES"; break;
>  		case V4L2_PIX_FMT_MPEG2:	descr = "MPEG-2 ES"; break;
>  		case V4L2_PIX_FMT_MPEG2_SLICE:	descr = "MPEG-2 Parsed Slice Data"; break;
>  		case V4L2_PIX_FMT_MPEG4:	descr = "MPEG-4 Part 2 ES"; break;
> -		case V4L2_PIX_FMT_XVID:		descr = "Xvid"; break;
> -		case V4L2_PIX_FMT_VC1_ANNEX_G:	descr = "VC-1 (SMPTE 412M Annex G)"; break;
> -		case V4L2_PIX_FMT_VC1_ANNEX_L:	descr = "VC-1 (SMPTE 412M Annex L)"; break;
> -		case V4L2_PIX_FMT_VP8:		descr = "VP8"; break;
> -		case V4L2_PIX_FMT_VP8_FRAME:    descr = "VP8 Frame"; break;
> -		case V4L2_PIX_FMT_VP9:		descr = "VP9"; break;
> -		case V4L2_PIX_FMT_VP9_FRAME:    descr = "VP9 Frame"; break;
> -		case V4L2_PIX_FMT_HEVC:		descr = "HEVC"; break; /* aka H.265 */
> -		case V4L2_PIX_FMT_HEVC_SLICE:	descr = "HEVC Parsed Slice Data"; break;
> -		case V4L2_PIX_FMT_FWHT:		descr = "FWHT"; break; /* used in vicodec */
> -		case V4L2_PIX_FMT_FWHT_STATELESS:	descr = "FWHT Stateless"; break; /* used in vicodec */
> -		case V4L2_PIX_FMT_SPK:		descr = "Sorenson Spark"; break;
> -		case V4L2_PIX_FMT_RV30:		descr = "RealVideo 8"; break;
> -		case V4L2_PIX_FMT_RV40:		descr = "RealVideo 9 & 10"; break;
> -		case V4L2_PIX_FMT_CPIA1:	descr = "GSPCA CPiA YUV"; break;
> -		case V4L2_PIX_FMT_WNVA:		descr = "WNVA"; break;
> -		case V4L2_PIX_FMT_SN9C10X:	descr = "GSPCA SN9C10X"; break;
> -		case V4L2_PIX_FMT_PWC1:		descr = "Raw Philips Webcam Type (Old)"; break;
> -		case V4L2_PIX_FMT_PWC2:		descr = "Raw Philips Webcam Type (New)"; break;
> -		case V4L2_PIX_FMT_ET61X251:	descr = "GSPCA ET61X251"; break;
> -		case V4L2_PIX_FMT_SPCA561:	descr = "GSPCA SPCA561"; break;
> -		case V4L2_PIX_FMT_PAC207:	descr = "GSPCA PAC207"; break;
> +		case V4L2_PIX_FMT_MPEG:		descr = "MPEG-1/2/4"; break;
>  		case V4L2_PIX_FMT_MR97310A:	descr = "GSPCA MR97310A"; break;
> -		case V4L2_PIX_FMT_JL2005BCD:	descr = "GSPCA JL2005BCD"; break;
> -		case V4L2_PIX_FMT_SN9C2028:	descr = "GSPCA SN9C2028"; break;
> -		case V4L2_PIX_FMT_SQ905C:	descr = "GSPCA SQ905C"; break;
> -		case V4L2_PIX_FMT_PJPG:		descr = "GSPCA PJPG"; break;
> +		case V4L2_PIX_FMT_MT2110R:	descr = "Mediatek 10bit Raster Mode"; break;
> +		case V4L2_PIX_FMT_MT2110T:	descr = "Mediatek 10bit Tile Mode"; break;
> +		case V4L2_PIX_FMT_MT21C:	descr = "Mediatek Compressed Format"; break;
>  		case V4L2_PIX_FMT_OV511:	descr = "GSPCA OV511"; break;
>  		case V4L2_PIX_FMT_OV518:	descr = "GSPCA OV518"; break;
> -		case V4L2_PIX_FMT_JPGL:		descr = "JPEG Lite"; break;
> -		case V4L2_PIX_FMT_SE401:	descr = "GSPCA SE401"; break;
> -		case V4L2_PIX_FMT_S5C_UYVY_JPG:	descr = "S5C73MX interleaved UYVY/JPEG"; break;
> -		case V4L2_PIX_FMT_MT21C:	descr = "Mediatek Compressed Format"; break;
> -		case V4L2_PIX_FMT_QC08C:	descr = "QCOM Compressed 8-bit Format"; break;
> -		case V4L2_PIX_FMT_QC10C:	descr = "QCOM Compressed 10-bit Format"; break;
> -		case V4L2_PIX_FMT_AJPG:		descr = "Aspeed JPEG"; break;
> -		case V4L2_PIX_FMT_AV1_FRAME:	descr = "AV1 Frame"; break;
> -		case V4L2_PIX_FMT_MT2110T:	descr = "Mediatek 10bit Tile Mode"; break;
> -		case V4L2_PIX_FMT_MT2110R:	descr = "Mediatek 10bit Raster Mode"; break;
> -		case V4L2_PIX_FMT_HEXTILE:	descr = "Hextile Compressed Format"; break;
> -		case V4L2_PIX_FMT_PISP_COMP1_RGGB: descr = "PiSP 8b RGRG/GBGB mode1 compr"; break;
> -		case V4L2_PIX_FMT_PISP_COMP1_GRBG: descr = "PiSP 8b GRGR/BGBG mode1 compr"; break;
> -		case V4L2_PIX_FMT_PISP_COMP1_GBRG: descr = "PiSP 8b GBGB/RGRG mode1 compr"; break;
> +		case V4L2_PIX_FMT_PAC207:	descr = "GSPCA PAC207"; break;
>  		case V4L2_PIX_FMT_PISP_COMP1_BGGR: descr = "PiSP 8b BGBG/GRGR mode1 compr"; break;
> +		case V4L2_PIX_FMT_PISP_COMP1_GBRG: descr = "PiSP 8b GBGB/RGRG mode1 compr"; break;
> +		case V4L2_PIX_FMT_PISP_COMP1_GRBG: descr = "PiSP 8b GRGR/BGBG mode1 compr"; break;
>  		case V4L2_PIX_FMT_PISP_COMP1_MONO: descr = "PiSP 8b monochrome mode1 compr"; break;
> -		case V4L2_PIX_FMT_PISP_COMP2_RGGB: descr = "PiSP 8b RGRG/GBGB mode2 compr"; break;
> -		case V4L2_PIX_FMT_PISP_COMP2_GRBG: descr = "PiSP 8b GRGR/BGBG mode2 compr"; break;
> -		case V4L2_PIX_FMT_PISP_COMP2_GBRG: descr = "PiSP 8b GBGB/RGRG mode2 compr"; break;
> +		case V4L2_PIX_FMT_PISP_COMP1_RGGB: descr = "PiSP 8b RGRG/GBGB mode1 compr"; break;
>  		case V4L2_PIX_FMT_PISP_COMP2_BGGR: descr = "PiSP 8b BGBG/GRGR mode2 compr"; break;
> +		case V4L2_PIX_FMT_PISP_COMP2_GBRG: descr = "PiSP 8b GBGB/RGRG mode2 compr"; break;
> +		case V4L2_PIX_FMT_PISP_COMP2_GRBG: descr = "PiSP 8b GRGR/BGBG mode2 compr"; break;
>  		case V4L2_PIX_FMT_PISP_COMP2_MONO: descr = "PiSP 8b monochrome mode2 compr"; break;
> +		case V4L2_PIX_FMT_PISP_COMP2_RGGB: descr = "PiSP 8b RGRG/GBGB mode2 compr"; break;
> +		case V4L2_PIX_FMT_PJPG:		descr = "GSPCA PJPG"; break;
> +		case V4L2_PIX_FMT_PWC1:		descr = "Raw Philips Webcam Type (Old)"; break;
> +		case V4L2_PIX_FMT_PWC2:		descr = "Raw Philips Webcam Type (New)"; break;
> +		case V4L2_PIX_FMT_QC08C:	descr = "QCOM Compressed 8-bit Format"; break;
> +		case V4L2_PIX_FMT_QC10C:	descr = "QCOM Compressed 10-bit Format"; break;
> +		case V4L2_PIX_FMT_RV30:		descr = "RealVideo 8"; break;
> +		case V4L2_PIX_FMT_RV40:		descr = "RealVideo 9 & 10"; break;
> +		case V4L2_PIX_FMT_S5C_UYVY_JPG:	descr = "S5C73MX interleaved UYVY/JPEG"; break;
> +		case V4L2_PIX_FMT_SE401:	descr = "GSPCA SE401"; break;
> +		case V4L2_PIX_FMT_SN9C10X:	descr = "GSPCA SN9C10X"; break;
> +		case V4L2_PIX_FMT_SN9C2028:	descr = "GSPCA SN9C2028"; break;
> +		case V4L2_PIX_FMT_SPCA561:	descr = "GSPCA SPCA561"; break;
> +		case V4L2_PIX_FMT_SPK:		descr = "Sorenson Spark"; break;
> +		case V4L2_PIX_FMT_SQ905C:	descr = "GSPCA SQ905C"; break;
> +		case V4L2_PIX_FMT_VC1_ANNEX_G:	descr = "VC-1 (SMPTE 412M Annex G)"; break;
> +		case V4L2_PIX_FMT_VC1_ANNEX_L:	descr = "VC-1 (SMPTE 412M Annex L)"; break;
> +		case V4L2_PIX_FMT_VP8:		descr = "VP8"; break;
> +		case V4L2_PIX_FMT_VP8_FRAME:    descr = "VP8 Frame"; break;
> +		case V4L2_PIX_FMT_VP9:		descr = "VP9"; break;
> +		case V4L2_PIX_FMT_VP9_FRAME:    descr = "VP9 Frame"; break;
> +		case V4L2_PIX_FMT_WNVA:		descr = "WNVA"; break;
> +		case V4L2_PIX_FMT_XVID:		descr = "Xvid"; break;
> +		/* keep-sorted end */
>  		default:
>  			if (fmt->description[0])
>  				return;
> @@ -2883,117 +2889,121 @@ struct v4l2_ioctl_info {
>  		.debug = _debug,				\
>  	}
>  
> -DEFINE_V4L_STUB_FUNC(g_fbuf)
> +/* keep-sorted start */
> +DEFINE_V4L_STUB_FUNC(decoder_cmd)
> +DEFINE_V4L_STUB_FUNC(dv_timings_cap)
> +DEFINE_V4L_STUB_FUNC(encoder_cmd)
> +DEFINE_V4L_STUB_FUNC(enum_dv_timings)
> +DEFINE_V4L_STUB_FUNC(enum_frameintervals)
> +DEFINE_V4L_STUB_FUNC(enum_framesizes)
> +DEFINE_V4L_STUB_FUNC(enumaudio)
> +DEFINE_V4L_STUB_FUNC(enumaudout)
>  DEFINE_V4L_STUB_FUNC(expbuf)
> -DEFINE_V4L_STUB_FUNC(g_std)
>  DEFINE_V4L_STUB_FUNC(g_audio)
> -DEFINE_V4L_STUB_FUNC(s_audio)
> -DEFINE_V4L_STUB_FUNC(g_edid)
> -DEFINE_V4L_STUB_FUNC(s_edid)
>  DEFINE_V4L_STUB_FUNC(g_audout)
> -DEFINE_V4L_STUB_FUNC(s_audout)
> +DEFINE_V4L_STUB_FUNC(g_dv_timings)
> +DEFINE_V4L_STUB_FUNC(g_edid)
> +DEFINE_V4L_STUB_FUNC(g_enc_index)
> +DEFINE_V4L_STUB_FUNC(g_fbuf)
>  DEFINE_V4L_STUB_FUNC(g_jpegcomp)
> +DEFINE_V4L_STUB_FUNC(g_std)
> +DEFINE_V4L_STUB_FUNC(query_dv_timings)
> +DEFINE_V4L_STUB_FUNC(s_audio)
> +DEFINE_V4L_STUB_FUNC(s_audout)
> +DEFINE_V4L_STUB_FUNC(s_dv_timings)
> +DEFINE_V4L_STUB_FUNC(s_edid)
>  DEFINE_V4L_STUB_FUNC(s_jpegcomp)
> -DEFINE_V4L_STUB_FUNC(enumaudio)
> -DEFINE_V4L_STUB_FUNC(enumaudout)
> -DEFINE_V4L_STUB_FUNC(enum_framesizes)
> -DEFINE_V4L_STUB_FUNC(enum_frameintervals)
> -DEFINE_V4L_STUB_FUNC(g_enc_index)
> -DEFINE_V4L_STUB_FUNC(encoder_cmd)
> -DEFINE_V4L_STUB_FUNC(try_encoder_cmd)
> -DEFINE_V4L_STUB_FUNC(decoder_cmd)
>  DEFINE_V4L_STUB_FUNC(try_decoder_cmd)
> -DEFINE_V4L_STUB_FUNC(s_dv_timings)
> -DEFINE_V4L_STUB_FUNC(g_dv_timings)
> -DEFINE_V4L_STUB_FUNC(enum_dv_timings)
> -DEFINE_V4L_STUB_FUNC(query_dv_timings)
> -DEFINE_V4L_STUB_FUNC(dv_timings_cap)
> +DEFINE_V4L_STUB_FUNC(try_encoder_cmd)
> +/* keep-sorted end */
>  
>  static const struct v4l2_ioctl_info v4l2_ioctls[] = {
> -	IOCTL_INFO(VIDIOC_QUERYCAP, v4l_querycap, v4l_print_querycap, 0),
> -	IOCTL_INFO(VIDIOC_ENUM_FMT, v4l_enum_fmt, v4l_print_fmtdesc, 0),
> -	IOCTL_INFO(VIDIOC_G_FMT, v4l_g_fmt, v4l_print_format, 0),
> -	IOCTL_INFO(VIDIOC_S_FMT, v4l_s_fmt, v4l_print_format, INFO_FL_PRIO),
> -	IOCTL_INFO(VIDIOC_REQBUFS, v4l_reqbufs, v4l_print_requestbuffers, INFO_FL_PRIO | INFO_FL_QUEUE),
> -	IOCTL_INFO(VIDIOC_QUERYBUF, v4l_querybuf, v4l_print_buffer, INFO_FL_QUEUE | INFO_FL_CLEAR(v4l2_buffer, length)),
> -	IOCTL_INFO(VIDIOC_G_FBUF, v4l_stub_g_fbuf, v4l_print_framebuffer, 0),
> -	IOCTL_INFO(VIDIOC_S_FBUF, v4l_s_fbuf, v4l_print_framebuffer, INFO_FL_PRIO),
> -	IOCTL_INFO(VIDIOC_OVERLAY, v4l_overlay, v4l_print_u32, INFO_FL_PRIO),
> -	IOCTL_INFO(VIDIOC_QBUF, v4l_qbuf, v4l_print_buffer, INFO_FL_QUEUE),
> -	IOCTL_INFO(VIDIOC_EXPBUF, v4l_stub_expbuf, v4l_print_exportbuffer, INFO_FL_QUEUE | INFO_FL_CLEAR(v4l2_exportbuffer, flags)),
> +	/* keep-sorted start */
> +	IOCTL_INFO(VIDIOC_CREATE_BUFS, v4l_create_bufs, v4l_print_create_buffers, INFO_FL_PRIO | INFO_FL_QUEUE),
> +	IOCTL_INFO(VIDIOC_CROPCAP, v4l_cropcap, v4l_print_cropcap, INFO_FL_CLEAR(v4l2_cropcap, type)),
> +	IOCTL_INFO(VIDIOC_DBG_G_CHIP_INFO, v4l_dbg_g_chip_info, v4l_print_dbg_chip_info, INFO_FL_CLEAR(v4l2_dbg_chip_info, match)),
> +	IOCTL_INFO(VIDIOC_DBG_G_REGISTER, v4l_dbg_g_register, v4l_print_dbg_register, 0),
> +	IOCTL_INFO(VIDIOC_DBG_S_REGISTER, v4l_dbg_s_register, v4l_print_dbg_register, 0),
> +	IOCTL_INFO(VIDIOC_DECODER_CMD, v4l_stub_decoder_cmd, v4l_print_decoder_cmd, INFO_FL_PRIO),
>  	IOCTL_INFO(VIDIOC_DQBUF, v4l_dqbuf, v4l_print_buffer, INFO_FL_QUEUE),
> -	IOCTL_INFO(VIDIOC_STREAMON, v4l_streamon, v4l_print_buftype, INFO_FL_PRIO | INFO_FL_QUEUE),
> -	IOCTL_INFO(VIDIOC_STREAMOFF, v4l_streamoff, v4l_print_buftype, INFO_FL_PRIO | INFO_FL_QUEUE),
> -	IOCTL_INFO(VIDIOC_G_PARM, v4l_g_parm, v4l_print_streamparm, INFO_FL_CLEAR(v4l2_streamparm, type)),
> -	IOCTL_INFO(VIDIOC_S_PARM, v4l_s_parm, v4l_print_streamparm, INFO_FL_PRIO),
> -	IOCTL_INFO(VIDIOC_G_STD, v4l_stub_g_std, v4l_print_std, 0),
> -	IOCTL_INFO(VIDIOC_S_STD, v4l_s_std, v4l_print_std, INFO_FL_PRIO),
> -	IOCTL_INFO(VIDIOC_ENUMSTD, v4l_enumstd, v4l_print_standard, INFO_FL_CLEAR(v4l2_standard, index)),
> +	IOCTL_INFO(VIDIOC_DQEVENT, v4l_dqevent, v4l_print_event, 0),
> +	IOCTL_INFO(VIDIOC_DV_TIMINGS_CAP, v4l_stub_dv_timings_cap, v4l_print_dv_timings_cap, INFO_FL_CLEAR(v4l2_dv_timings_cap, pad)),
> +	IOCTL_INFO(VIDIOC_ENCODER_CMD, v4l_stub_encoder_cmd, v4l_print_encoder_cmd, INFO_FL_PRIO | INFO_FL_CLEAR(v4l2_encoder_cmd, flags)),
> +	IOCTL_INFO(VIDIOC_ENUMAUDIO, v4l_stub_enumaudio, v4l_print_audio, INFO_FL_CLEAR(v4l2_audio, index)),
> +	IOCTL_INFO(VIDIOC_ENUMAUDOUT, v4l_stub_enumaudout, v4l_print_audioout, INFO_FL_CLEAR(v4l2_audioout, index)),
>  	IOCTL_INFO(VIDIOC_ENUMINPUT, v4l_enuminput, v4l_print_enuminput, INFO_FL_CLEAR(v4l2_input, index)),
> -	IOCTL_INFO(VIDIOC_G_CTRL, v4l_g_ctrl, v4l_print_control, INFO_FL_CTRL | INFO_FL_CLEAR(v4l2_control, id)),
> -	IOCTL_INFO(VIDIOC_S_CTRL, v4l_s_ctrl, v4l_print_control, INFO_FL_PRIO | INFO_FL_CTRL),
> -	IOCTL_INFO(VIDIOC_G_TUNER, v4l_g_tuner, v4l_print_tuner, INFO_FL_CLEAR(v4l2_tuner, index)),
> -	IOCTL_INFO(VIDIOC_S_TUNER, v4l_s_tuner, v4l_print_tuner, INFO_FL_PRIO),
> -	IOCTL_INFO(VIDIOC_G_AUDIO, v4l_stub_g_audio, v4l_print_audio, 0),
> -	IOCTL_INFO(VIDIOC_S_AUDIO, v4l_stub_s_audio, v4l_print_audio, INFO_FL_PRIO),
> -	IOCTL_INFO(VIDIOC_QUERYCTRL, v4l_queryctrl, v4l_print_queryctrl, INFO_FL_CTRL | INFO_FL_CLEAR(v4l2_queryctrl, id)),
> -	IOCTL_INFO(VIDIOC_QUERYMENU, v4l_querymenu, v4l_print_querymenu, INFO_FL_CTRL | INFO_FL_CLEAR(v4l2_querymenu, index)),
> -	IOCTL_INFO(VIDIOC_G_INPUT, v4l_g_input, v4l_print_u32, 0),
> -	IOCTL_INFO(VIDIOC_S_INPUT, v4l_s_input, v4l_print_u32, INFO_FL_PRIO),
> -	IOCTL_INFO(VIDIOC_G_EDID, v4l_stub_g_edid, v4l_print_edid, INFO_FL_ALWAYS_COPY),
> -	IOCTL_INFO(VIDIOC_S_EDID, v4l_stub_s_edid, v4l_print_edid, INFO_FL_PRIO | INFO_FL_ALWAYS_COPY),
> -	IOCTL_INFO(VIDIOC_G_OUTPUT, v4l_g_output, v4l_print_u32, 0),
> -	IOCTL_INFO(VIDIOC_S_OUTPUT, v4l_s_output, v4l_print_u32, INFO_FL_PRIO),
>  	IOCTL_INFO(VIDIOC_ENUMOUTPUT, v4l_enumoutput, v4l_print_enumoutput, INFO_FL_CLEAR(v4l2_output, index)),
> +	IOCTL_INFO(VIDIOC_ENUMSTD, v4l_enumstd, v4l_print_standard, INFO_FL_CLEAR(v4l2_standard, index)),
> +	IOCTL_INFO(VIDIOC_ENUM_DV_TIMINGS, v4l_stub_enum_dv_timings, v4l_print_enum_dv_timings, INFO_FL_CLEAR(v4l2_enum_dv_timings, pad)),
> +	IOCTL_INFO(VIDIOC_ENUM_FMT, v4l_enum_fmt, v4l_print_fmtdesc, 0),
> +	IOCTL_INFO(VIDIOC_ENUM_FRAMEINTERVALS, v4l_stub_enum_frameintervals, v4l_print_frmivalenum, INFO_FL_CLEAR(v4l2_frmivalenum, height)),
> +	IOCTL_INFO(VIDIOC_ENUM_FRAMESIZES, v4l_stub_enum_framesizes, v4l_print_frmsizeenum, INFO_FL_CLEAR(v4l2_frmsizeenum, pixel_format)),
> +	IOCTL_INFO(VIDIOC_ENUM_FREQ_BANDS, v4l_enum_freq_bands, v4l_print_freq_band, 0),
> +	IOCTL_INFO(VIDIOC_EXPBUF, v4l_stub_expbuf, v4l_print_exportbuffer, INFO_FL_QUEUE | INFO_FL_CLEAR(v4l2_exportbuffer, flags)),
> +	IOCTL_INFO(VIDIOC_G_AUDIO, v4l_stub_g_audio, v4l_print_audio, 0),
>  	IOCTL_INFO(VIDIOC_G_AUDOUT, v4l_stub_g_audout, v4l_print_audioout, 0),
> -	IOCTL_INFO(VIDIOC_S_AUDOUT, v4l_stub_s_audout, v4l_print_audioout, INFO_FL_PRIO),
> -	IOCTL_INFO(VIDIOC_G_MODULATOR, v4l_g_modulator, v4l_print_modulator, INFO_FL_CLEAR(v4l2_modulator, index)),
> -	IOCTL_INFO(VIDIOC_S_MODULATOR, v4l_s_modulator, v4l_print_modulator, INFO_FL_PRIO),
> -	IOCTL_INFO(VIDIOC_G_FREQUENCY, v4l_g_frequency, v4l_print_frequency, INFO_FL_CLEAR(v4l2_frequency, tuner)),
> -	IOCTL_INFO(VIDIOC_S_FREQUENCY, v4l_s_frequency, v4l_print_frequency, INFO_FL_PRIO),
> -	IOCTL_INFO(VIDIOC_CROPCAP, v4l_cropcap, v4l_print_cropcap, INFO_FL_CLEAR(v4l2_cropcap, type)),
>  	IOCTL_INFO(VIDIOC_G_CROP, v4l_g_crop, v4l_print_crop, INFO_FL_CLEAR(v4l2_crop, type)),
> -	IOCTL_INFO(VIDIOC_S_CROP, v4l_s_crop, v4l_print_crop, INFO_FL_PRIO),
> -	IOCTL_INFO(VIDIOC_G_SELECTION, v4l_g_selection, v4l_print_selection, INFO_FL_CLEAR(v4l2_selection, r)),
> -	IOCTL_INFO(VIDIOC_S_SELECTION, v4l_s_selection, v4l_print_selection, INFO_FL_PRIO | INFO_FL_CLEAR(v4l2_selection, r)),
> +	IOCTL_INFO(VIDIOC_G_CTRL, v4l_g_ctrl, v4l_print_control, INFO_FL_CTRL | INFO_FL_CLEAR(v4l2_control, id)),
> +	IOCTL_INFO(VIDIOC_G_DV_TIMINGS, v4l_stub_g_dv_timings, v4l_print_dv_timings, 0),
> +	IOCTL_INFO(VIDIOC_G_EDID, v4l_stub_g_edid, v4l_print_edid, INFO_FL_ALWAYS_COPY),
> +	IOCTL_INFO(VIDIOC_G_ENC_INDEX, v4l_stub_g_enc_index, v4l_print_enc_idx, 0),
> +	IOCTL_INFO(VIDIOC_G_EXT_CTRLS, v4l_g_ext_ctrls, v4l_print_ext_controls, INFO_FL_CTRL | INFO_FL_ALWAYS_COPY),
> +	IOCTL_INFO(VIDIOC_G_FBUF, v4l_stub_g_fbuf, v4l_print_framebuffer, 0),
> +	IOCTL_INFO(VIDIOC_G_FMT, v4l_g_fmt, v4l_print_format, 0),
> +	IOCTL_INFO(VIDIOC_G_FREQUENCY, v4l_g_frequency, v4l_print_frequency, INFO_FL_CLEAR(v4l2_frequency, tuner)),
> +	IOCTL_INFO(VIDIOC_G_INPUT, v4l_g_input, v4l_print_u32, 0),
>  	IOCTL_INFO(VIDIOC_G_JPEGCOMP, v4l_stub_g_jpegcomp, v4l_print_jpegcompression, 0),
> -	IOCTL_INFO(VIDIOC_S_JPEGCOMP, v4l_stub_s_jpegcomp, v4l_print_jpegcompression, INFO_FL_PRIO),
> -	IOCTL_INFO(VIDIOC_QUERYSTD, v4l_querystd, v4l_print_std, 0),
> -	IOCTL_INFO(VIDIOC_TRY_FMT, v4l_try_fmt, v4l_print_format, 0),
> -	IOCTL_INFO(VIDIOC_ENUMAUDIO, v4l_stub_enumaudio, v4l_print_audio, INFO_FL_CLEAR(v4l2_audio, index)),
> -	IOCTL_INFO(VIDIOC_ENUMAUDOUT, v4l_stub_enumaudout, v4l_print_audioout, INFO_FL_CLEAR(v4l2_audioout, index)),
> +	IOCTL_INFO(VIDIOC_G_MODULATOR, v4l_g_modulator, v4l_print_modulator, INFO_FL_CLEAR(v4l2_modulator, index)),
> +	IOCTL_INFO(VIDIOC_G_OUTPUT, v4l_g_output, v4l_print_u32, 0),
> +	IOCTL_INFO(VIDIOC_G_PARM, v4l_g_parm, v4l_print_streamparm, INFO_FL_CLEAR(v4l2_streamparm, type)),
>  	IOCTL_INFO(VIDIOC_G_PRIORITY, v4l_g_priority, v4l_print_u32, 0),
> -	IOCTL_INFO(VIDIOC_S_PRIORITY, v4l_s_priority, v4l_print_u32, INFO_FL_PRIO),
> +	IOCTL_INFO(VIDIOC_G_SELECTION, v4l_g_selection, v4l_print_selection, INFO_FL_CLEAR(v4l2_selection, r)),
>  	IOCTL_INFO(VIDIOC_G_SLICED_VBI_CAP, v4l_g_sliced_vbi_cap, v4l_print_sliced_vbi_cap, INFO_FL_CLEAR(v4l2_sliced_vbi_cap, type)),
> +	IOCTL_INFO(VIDIOC_G_STD, v4l_stub_g_std, v4l_print_std, 0),
> +	IOCTL_INFO(VIDIOC_G_TUNER, v4l_g_tuner, v4l_print_tuner, INFO_FL_CLEAR(v4l2_tuner, index)),
>  	IOCTL_INFO(VIDIOC_LOG_STATUS, v4l_log_status, v4l_print_newline, 0),
> -	IOCTL_INFO(VIDIOC_G_EXT_CTRLS, v4l_g_ext_ctrls, v4l_print_ext_controls, INFO_FL_CTRL | INFO_FL_ALWAYS_COPY),
> -	IOCTL_INFO(VIDIOC_S_EXT_CTRLS, v4l_s_ext_ctrls, v4l_print_ext_controls, INFO_FL_PRIO | INFO_FL_CTRL | INFO_FL_ALWAYS_COPY),
> -	IOCTL_INFO(VIDIOC_TRY_EXT_CTRLS, v4l_try_ext_ctrls, v4l_print_ext_controls, INFO_FL_CTRL | INFO_FL_ALWAYS_COPY),
> -	IOCTL_INFO(VIDIOC_ENUM_FRAMESIZES, v4l_stub_enum_framesizes, v4l_print_frmsizeenum, INFO_FL_CLEAR(v4l2_frmsizeenum, pixel_format)),
> -	IOCTL_INFO(VIDIOC_ENUM_FRAMEINTERVALS, v4l_stub_enum_frameintervals, v4l_print_frmivalenum, INFO_FL_CLEAR(v4l2_frmivalenum, height)),
> -	IOCTL_INFO(VIDIOC_G_ENC_INDEX, v4l_stub_g_enc_index, v4l_print_enc_idx, 0),
> -	IOCTL_INFO(VIDIOC_ENCODER_CMD, v4l_stub_encoder_cmd, v4l_print_encoder_cmd, INFO_FL_PRIO | INFO_FL_CLEAR(v4l2_encoder_cmd, flags)),
> -	IOCTL_INFO(VIDIOC_TRY_ENCODER_CMD, v4l_stub_try_encoder_cmd, v4l_print_encoder_cmd, INFO_FL_CLEAR(v4l2_encoder_cmd, flags)),
> -	IOCTL_INFO(VIDIOC_DECODER_CMD, v4l_stub_decoder_cmd, v4l_print_decoder_cmd, INFO_FL_PRIO),
> -	IOCTL_INFO(VIDIOC_TRY_DECODER_CMD, v4l_stub_try_decoder_cmd, v4l_print_decoder_cmd, 0),
> -	IOCTL_INFO(VIDIOC_DBG_S_REGISTER, v4l_dbg_s_register, v4l_print_dbg_register, 0),
> -	IOCTL_INFO(VIDIOC_DBG_G_REGISTER, v4l_dbg_g_register, v4l_print_dbg_register, 0),
> -	IOCTL_INFO(VIDIOC_S_HW_FREQ_SEEK, v4l_s_hw_freq_seek, v4l_print_hw_freq_seek, INFO_FL_PRIO),
> -	IOCTL_INFO(VIDIOC_S_DV_TIMINGS, v4l_stub_s_dv_timings, v4l_print_dv_timings, INFO_FL_PRIO | INFO_FL_CLEAR(v4l2_dv_timings, bt.flags)),
> -	IOCTL_INFO(VIDIOC_G_DV_TIMINGS, v4l_stub_g_dv_timings, v4l_print_dv_timings, 0),
> -	IOCTL_INFO(VIDIOC_DQEVENT, v4l_dqevent, v4l_print_event, 0),
> -	IOCTL_INFO(VIDIOC_SUBSCRIBE_EVENT, v4l_subscribe_event, v4l_print_event_subscription, 0),
> -	IOCTL_INFO(VIDIOC_UNSUBSCRIBE_EVENT, v4l_unsubscribe_event, v4l_print_event_subscription, 0),
> -	IOCTL_INFO(VIDIOC_CREATE_BUFS, v4l_create_bufs, v4l_print_create_buffers, INFO_FL_PRIO | INFO_FL_QUEUE),
> +	IOCTL_INFO(VIDIOC_OVERLAY, v4l_overlay, v4l_print_u32, INFO_FL_PRIO),
>  	IOCTL_INFO(VIDIOC_PREPARE_BUF, v4l_prepare_buf, v4l_print_buffer, INFO_FL_QUEUE),
> -	IOCTL_INFO(VIDIOC_ENUM_DV_TIMINGS, v4l_stub_enum_dv_timings, v4l_print_enum_dv_timings, INFO_FL_CLEAR(v4l2_enum_dv_timings, pad)),
> +	IOCTL_INFO(VIDIOC_QBUF, v4l_qbuf, v4l_print_buffer, INFO_FL_QUEUE),
> +	IOCTL_INFO(VIDIOC_QUERYBUF, v4l_querybuf, v4l_print_buffer, INFO_FL_QUEUE | INFO_FL_CLEAR(v4l2_buffer, length)),
> +	IOCTL_INFO(VIDIOC_QUERYCAP, v4l_querycap, v4l_print_querycap, 0),
> +	IOCTL_INFO(VIDIOC_QUERYCTRL, v4l_queryctrl, v4l_print_queryctrl, INFO_FL_CTRL | INFO_FL_CLEAR(v4l2_queryctrl, id)),
> +	IOCTL_INFO(VIDIOC_QUERYMENU, v4l_querymenu, v4l_print_querymenu, INFO_FL_CTRL | INFO_FL_CLEAR(v4l2_querymenu, index)),
> +	IOCTL_INFO(VIDIOC_QUERYSTD, v4l_querystd, v4l_print_std, 0),
>  	IOCTL_INFO(VIDIOC_QUERY_DV_TIMINGS, v4l_stub_query_dv_timings, v4l_print_dv_timings, INFO_FL_ALWAYS_COPY),
> -	IOCTL_INFO(VIDIOC_DV_TIMINGS_CAP, v4l_stub_dv_timings_cap, v4l_print_dv_timings_cap, INFO_FL_CLEAR(v4l2_dv_timings_cap, pad)),
> -	IOCTL_INFO(VIDIOC_ENUM_FREQ_BANDS, v4l_enum_freq_bands, v4l_print_freq_band, 0),
> -	IOCTL_INFO(VIDIOC_DBG_G_CHIP_INFO, v4l_dbg_g_chip_info, v4l_print_dbg_chip_info, INFO_FL_CLEAR(v4l2_dbg_chip_info, match)),
>  	IOCTL_INFO(VIDIOC_QUERY_EXT_CTRL, v4l_query_ext_ctrl, v4l_print_query_ext_ctrl, INFO_FL_CTRL | INFO_FL_CLEAR(v4l2_query_ext_ctrl, id)),
>  	IOCTL_INFO(VIDIOC_REMOVE_BUFS, v4l_remove_bufs, v4l_print_remove_buffers, INFO_FL_PRIO | INFO_FL_QUEUE | INFO_FL_CLEAR(v4l2_remove_buffers, type)),
> +	IOCTL_INFO(VIDIOC_REQBUFS, v4l_reqbufs, v4l_print_requestbuffers, INFO_FL_PRIO | INFO_FL_QUEUE),
> +	IOCTL_INFO(VIDIOC_STREAMOFF, v4l_streamoff, v4l_print_buftype, INFO_FL_PRIO | INFO_FL_QUEUE),
> +	IOCTL_INFO(VIDIOC_STREAMON, v4l_streamon, v4l_print_buftype, INFO_FL_PRIO | INFO_FL_QUEUE),
> +	IOCTL_INFO(VIDIOC_SUBSCRIBE_EVENT, v4l_subscribe_event, v4l_print_event_subscription, 0),
> +	IOCTL_INFO(VIDIOC_S_AUDIO, v4l_stub_s_audio, v4l_print_audio, INFO_FL_PRIO),
> +	IOCTL_INFO(VIDIOC_S_AUDOUT, v4l_stub_s_audout, v4l_print_audioout, INFO_FL_PRIO),
> +	IOCTL_INFO(VIDIOC_S_CROP, v4l_s_crop, v4l_print_crop, INFO_FL_PRIO),
> +	IOCTL_INFO(VIDIOC_S_CTRL, v4l_s_ctrl, v4l_print_control, INFO_FL_PRIO | INFO_FL_CTRL),
> +	IOCTL_INFO(VIDIOC_S_DV_TIMINGS, v4l_stub_s_dv_timings, v4l_print_dv_timings, INFO_FL_PRIO | INFO_FL_CLEAR(v4l2_dv_timings, bt.flags)),
> +	IOCTL_INFO(VIDIOC_S_EDID, v4l_stub_s_edid, v4l_print_edid, INFO_FL_PRIO | INFO_FL_ALWAYS_COPY),
> +	IOCTL_INFO(VIDIOC_S_EXT_CTRLS, v4l_s_ext_ctrls, v4l_print_ext_controls, INFO_FL_PRIO | INFO_FL_CTRL | INFO_FL_ALWAYS_COPY),
> +	IOCTL_INFO(VIDIOC_S_FBUF, v4l_s_fbuf, v4l_print_framebuffer, INFO_FL_PRIO),
> +	IOCTL_INFO(VIDIOC_S_FMT, v4l_s_fmt, v4l_print_format, INFO_FL_PRIO),
> +	IOCTL_INFO(VIDIOC_S_FREQUENCY, v4l_s_frequency, v4l_print_frequency, INFO_FL_PRIO),
> +	IOCTL_INFO(VIDIOC_S_HW_FREQ_SEEK, v4l_s_hw_freq_seek, v4l_print_hw_freq_seek, INFO_FL_PRIO),
> +	IOCTL_INFO(VIDIOC_S_INPUT, v4l_s_input, v4l_print_u32, INFO_FL_PRIO),
> +	IOCTL_INFO(VIDIOC_S_JPEGCOMP, v4l_stub_s_jpegcomp, v4l_print_jpegcompression, INFO_FL_PRIO),
> +	IOCTL_INFO(VIDIOC_S_MODULATOR, v4l_s_modulator, v4l_print_modulator, INFO_FL_PRIO),
> +	IOCTL_INFO(VIDIOC_S_OUTPUT, v4l_s_output, v4l_print_u32, INFO_FL_PRIO),
> +	IOCTL_INFO(VIDIOC_S_PARM, v4l_s_parm, v4l_print_streamparm, INFO_FL_PRIO),
> +	IOCTL_INFO(VIDIOC_S_PRIORITY, v4l_s_priority, v4l_print_u32, INFO_FL_PRIO),
> +	IOCTL_INFO(VIDIOC_S_SELECTION, v4l_s_selection, v4l_print_selection, INFO_FL_PRIO | INFO_FL_CLEAR(v4l2_selection, r)),
> +	IOCTL_INFO(VIDIOC_S_STD, v4l_s_std, v4l_print_std, INFO_FL_PRIO),
> +	IOCTL_INFO(VIDIOC_S_TUNER, v4l_s_tuner, v4l_print_tuner, INFO_FL_PRIO),
> +	IOCTL_INFO(VIDIOC_TRY_DECODER_CMD, v4l_stub_try_decoder_cmd, v4l_print_decoder_cmd, 0),
> +	IOCTL_INFO(VIDIOC_TRY_ENCODER_CMD, v4l_stub_try_encoder_cmd, v4l_print_encoder_cmd, INFO_FL_CLEAR(v4l2_encoder_cmd, flags)),
> +	IOCTL_INFO(VIDIOC_TRY_EXT_CTRLS, v4l_try_ext_ctrls, v4l_print_ext_controls, INFO_FL_CTRL | INFO_FL_ALWAYS_COPY),
> +	IOCTL_INFO(VIDIOC_TRY_FMT, v4l_try_fmt, v4l_print_format, 0),
> +	IOCTL_INFO(VIDIOC_UNSUBSCRIBE_EVENT, v4l_unsubscribe_event, v4l_print_event_subscription, 0),

This list has been arranged by IOCTL number and I think I'd keep it that
way.

>  };
> +	/* keep-sorted end */
>  #define V4L2_IOCTLS ARRAY_SIZE(v4l2_ioctls)
>  
>  static bool v4l2_is_known_ioctl(unsigned int cmd)
> 

-- 
Kind regards,

Sakari Ailus

