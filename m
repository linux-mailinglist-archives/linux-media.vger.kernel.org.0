Return-Path: <linux-media+bounces-35070-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B1DEADC9A4
	for <lists+linux-media@lfdr.de>; Tue, 17 Jun 2025 13:41:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B7487178BAD
	for <lists+linux-media@lfdr.de>; Tue, 17 Jun 2025 11:41:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25A2F2DF3C4;
	Tue, 17 Jun 2025 11:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jjverkuil.nl header.i=@jjverkuil.nl header.b="w/cAmvEX"
X-Original-To: linux-media@vger.kernel.org
Received: from dane.soverin.net (dane.soverin.net [185.233.34.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 939942DBF62;
	Tue, 17 Jun 2025 11:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.233.34.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750160466; cv=none; b=XguQV4/1BEeEISRDTGZGHl+vNZUlcMIWRE3F0/OYGpwGrDNz7jBOaBe8YJvAzffUbJOqep64Hu6UwsWZ+PdzwO86syw702HYeAqx/1mASgJfzveAWcRyplFVaeyIFILqeIvDq4IwlraymzrPoe+y0HrOwKW9SLYCKAFl2BmQgWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750160466; c=relaxed/simple;
	bh=HjQpaUE4KbBfCcBWStg62fvctmQhLDFLlwGMr55YPC4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hXD7k4EeZsTimwWYxdAJLAyoF598ZjcoyXDK1EJKI2DJBZF6utWkfrwoSi7fNt+Pm6zfWxvANYk+iC4rOCgbHUFD6qSR0Q39jBfMo+Rh9+sBbCo6uBYtw5VIXVq3xvNWxeX56O3eCk4ZOsswJR7Yj5TghEMRNyXr3TEIplwtiVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=jjverkuil.nl; spf=pass smtp.mailfrom=jjverkuil.nl; dkim=pass (2048-bit key) header.d=jjverkuil.nl header.i=@jjverkuil.nl header.b=w/cAmvEX; arc=none smtp.client-ip=185.233.34.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=jjverkuil.nl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jjverkuil.nl
Received: from smtp.freedom.nl (unknown [10.10.4.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by dane.soverin.net (Postfix) with ESMTPS id 4bM4gs5Xpbz15qB;
	Tue, 17 Jun 2025 11:40:57 +0000 (UTC)
Received: from smtp.freedom.nl (smtp.freedom.nl [10.10.4.108]) by freedom.nl (Postfix) with ESMTPSA id 4bM4gs2xyQz2xWj;
	Tue, 17 Jun 2025 11:40:57 +0000 (UTC)
Authentication-Results: smtp.freedom.nl;
	dkim=pass (2048-bit key; unprotected) header.d=jjverkuil.nl header.i=@jjverkuil.nl header.a=rsa-sha256 header.s=soverin1 header.b=w/cAmvEX;
	dkim-atps=neutral
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jjverkuil.nl;
	s=soverin1; t=1750160457;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=tCdNiD+cmUIRwD2KpQdxB7qUYsy0Ep4LZHBtBn0Uyxg=;
	b=w/cAmvEXkJ4JdZtAp5UDG5IPEwvd3jPjhPSZ/kb3FOavOSpOCRqRO1tvR6+orXEwTvYAaG
	r0fep/DDZV/rjTFWX1e/7fON5YGjUS6RJGIC9o6U04Vg+NfEA8r/wi6ulWozU3FhBwWsYF
	VLYfoYdG+CTc9NM5YLyJ9PjdHI0C6X9pIyKJ/0qSZx9p7p/QDSj0Bf+rLqgQlIb5ZvBsSU
	jWfdcALICzgjrc1aH20u0reNR0LQYl30/+qrsrgOoIr1SIn/b9hYElTcfqz2IwuXzaIsgd
	Phwz7WMDEoxQELrGVtVwdBV0Ty12NnnNskXqSF3IDJJkSxcUIyE0Vz7+SdG9tw==
X-CM-Analysis: v=2.4 cv=I7afRMgg c=1 sm=1 tr=0 ts=68515449 a=IkcTkHD0fZMA:10 a=cm27Pg_UAAAA:8 a=KPUr6Kh8Sm8yFZlGibcA:9 a=QEXdDO2ut3YA:10
Message-ID: <3b915820-0014-4979-b9d7-2287edcd6194@jjverkuil.nl>
Date: Tue, 17 Jun 2025 13:40:57 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] media: ioctl: Order some code alphabetically
To: Sakari Ailus <sakari.ailus@iki.fi>, Ricardo Ribalda <ribalda@chromium.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250514-keep-sorted-ioctl-v1-1-0d66585c6ce5@chromium.org>
 <aEKo0oRlf33teM-i@valkosipuli.retiisi.eu>
Content-Language: en-US, nl
From: Hans Verkuil <hans@jjverkuil.nl>
Autocrypt: addr=hans@jjverkuil.nl; keydata=
 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
In-Reply-To: <aEKo0oRlf33teM-i@valkosipuli.retiisi.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spampanel-Class: ham

Hi Ricardo,

See my reply to the Makefile patch. Basically 'no' to keep-sorted, unless
this would be rolled out kernel-wide.

But I also have some comments about this patch:

On 06/06/2025 10:37, Sakari Ailus wrote:
> Hi Ricardo,
> 
> Thanks for the patch.
> 
> On Wed, May 14, 2025 at 09:46:12AM +0000, Ricardo Ribalda wrote:
>> This limits the chances for duplicates. Use keep-sorted comments to
>> avoid future disordered via media-ci tooling.
> 
> The sort order generally has been based on the IOCTL number or macro value,
> not the macro name. Similarly for formats, different Bayer orders have been
> kept together for a reason.
> 
> So while I think there would be some benefits from doing this, the
> drawbacks are probably greater in some cases. But please see below.
> 
>>
>> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
>> ---
>> Follow-up from media-summit. This is a example for how keep-sorted looks
>> like.
>> ---
>>  drivers/media/v4l2-core/v4l2-ioctl.c | 646 ++++++++++++++++++-----------------
>>  1 file changed, 328 insertions(+), 318 deletions(-)
>>
>> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
>> index 650dc1956f73d2f1943b56c42140c7b8d757259f..45dfadb1233f24697e1b3deaab34f3134de421f9 100644
>> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
>> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
>> @@ -40,36 +40,38 @@ struct std_descr {
>>  };
>>  
>>  static const struct std_descr standards[] = {
>> +	/* keep-sorted start */
>>  	{ V4L2_STD_NTSC,	"NTSC"      },
>> +	{ V4L2_STD_NTSC_443,	"NTSC-443"  },
>>  	{ V4L2_STD_NTSC_M,	"NTSC-M"    },
>>  	{ V4L2_STD_NTSC_M_JP,	"NTSC-M-JP" },
>>  	{ V4L2_STD_NTSC_M_KR,	"NTSC-M-KR" },
>> -	{ V4L2_STD_NTSC_443,	"NTSC-443"  },
>>  	{ V4L2_STD_PAL,		"PAL"       },
>> -	{ V4L2_STD_PAL_BG,	"PAL-BG"    },
>> +	{ V4L2_STD_PAL_60,	"PAL-60"    },
>>  	{ V4L2_STD_PAL_B,	"PAL-B"     },
>>  	{ V4L2_STD_PAL_B1,	"PAL-B1"    },
>> +	{ V4L2_STD_PAL_BG,	"PAL-BG"    },
>> +	{ V4L2_STD_PAL_D,	"PAL-D"     },
>> +	{ V4L2_STD_PAL_D1,	"PAL-D1"    },
>> +	{ V4L2_STD_PAL_DK,	"PAL-DK"    },
>>  	{ V4L2_STD_PAL_G,	"PAL-G"     },
>>  	{ V4L2_STD_PAL_H,	"PAL-H"     },
>>  	{ V4L2_STD_PAL_I,	"PAL-I"     },
>> -	{ V4L2_STD_PAL_DK,	"PAL-DK"    },
>> -	{ V4L2_STD_PAL_D,	"PAL-D"     },
>> -	{ V4L2_STD_PAL_D1,	"PAL-D1"    },
>>  	{ V4L2_STD_PAL_K,	"PAL-K"     },
>>  	{ V4L2_STD_PAL_M,	"PAL-M"     },
>>  	{ V4L2_STD_PAL_N,	"PAL-N"     },
>>  	{ V4L2_STD_PAL_Nc,	"PAL-Nc"    },
>> -	{ V4L2_STD_PAL_60,	"PAL-60"    },
>>  	{ V4L2_STD_SECAM,	"SECAM"     },
>>  	{ V4L2_STD_SECAM_B,	"SECAM-B"   },
>> +	{ V4L2_STD_SECAM_D,	"SECAM-D"   },
>> +	{ V4L2_STD_SECAM_DK,	"SECAM-DK"  },
>>  	{ V4L2_STD_SECAM_G,	"SECAM-G"   },
>>  	{ V4L2_STD_SECAM_H,	"SECAM-H"   },
>> -	{ V4L2_STD_SECAM_DK,	"SECAM-DK"  },
>> -	{ V4L2_STD_SECAM_D,	"SECAM-D"   },
>>  	{ V4L2_STD_SECAM_K,	"SECAM-K"   },
>>  	{ V4L2_STD_SECAM_K1,	"SECAM-K1"  },
>>  	{ V4L2_STD_SECAM_L,	"SECAM-L"   },
>>  	{ V4L2_STD_SECAM_LC,	"SECAM-Lc"  },
>> +	/* keep-sorted end */
>>  	{ 0,			"Unknown"   }
>>  };

Nack for this change. The table is already sorted, but by related standards,
which is different from alphabetical.

>>  
>> @@ -1269,289 +1271,293 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
>>  	 */
>>  	switch (fmt->pixelformat) {
>>  	/* Max description length mask:	descr = "0123456789012345678901234567890" */
>> -	case V4L2_PIX_FMT_RGB332:	descr = "8-bit RGB 3-3-2"; break;
>> -	case V4L2_PIX_FMT_RGB444:	descr = "16-bit A/XRGB 4-4-4-4"; break;
>> -	case V4L2_PIX_FMT_ARGB444:	descr = "16-bit ARGB 4-4-4-4"; break;
>> -	case V4L2_PIX_FMT_XRGB444:	descr = "16-bit XRGB 4-4-4-4"; break;
>> -	case V4L2_PIX_FMT_RGBA444:	descr = "16-bit RGBA 4-4-4-4"; break;
>> -	case V4L2_PIX_FMT_RGBX444:	descr = "16-bit RGBX 4-4-4-4"; break;
>> +	/* keep-sorted start */
>> +	case V4L2_META_FMT_C3ISP_PARAMS:	descr = "Amlogic C3 ISP Parameters"; break;
>> +	case V4L2_META_FMT_C3ISP_STATS:		descr = "Amlogic C3 ISP Statistics"; break;
>> +	case V4L2_META_FMT_D4XX:	descr = "Intel D4xx UVC Metadata"; break;
>> +	case V4L2_META_FMT_GENERIC_8:	descr = "8-bit Generic Metadata"; break;
>> +	case V4L2_META_FMT_GENERIC_CSI2_10:	descr = "8-bit Generic Meta, 10b CSI-2"; break;
>> +	case V4L2_META_FMT_GENERIC_CSI2_12:	descr = "8-bit Generic Meta, 12b CSI-2"; break;
>> +	case V4L2_META_FMT_GENERIC_CSI2_14:	descr = "8-bit Generic Meta, 14b CSI-2"; break;
>> +	case V4L2_META_FMT_GENERIC_CSI2_16:	descr = "8-bit Generic Meta, 16b CSI-2"; break;
>> +	case V4L2_META_FMT_GENERIC_CSI2_20:	descr = "8-bit Generic Meta, 20b CSI-2"; break;
>> +	case V4L2_META_FMT_GENERIC_CSI2_24:	descr = "8-bit Generic Meta, 24b CSI-2"; break;
>> +	case V4L2_META_FMT_RK_ISP1_EXT_PARAMS:	descr = "Rockchip ISP1 Ext 3A Params"; break;
>> +	case V4L2_META_FMT_RK_ISP1_PARAMS:	descr = "Rockchip ISP1 3A Parameters"; break;
>> +	case V4L2_META_FMT_RK_ISP1_STAT_3A:	descr = "Rockchip ISP1 3A Statistics"; break;
>> +	case V4L2_META_FMT_RPI_BE_CFG:	descr = "RPi PiSP BE Config format"; break;
>> +	case V4L2_META_FMT_RPI_FE_CFG:  descr = "RPi PiSP FE Config format"; break;
>> +	case V4L2_META_FMT_RPI_FE_STATS: descr = "RPi PiSP FE Statistics format"; break;
>> +	case V4L2_META_FMT_UVC:		descr = "UVC Payload Header Metadata"; break;
>> +	case V4L2_META_FMT_VIVID:       descr = "Vivid Metadata"; break;
>> +	case V4L2_META_FMT_VSP1_HGO:	descr = "R-Car VSP1 1-D Histogram"; break;
>> +	case V4L2_META_FMT_VSP1_HGT:	descr = "R-Car VSP1 2-D Histogram"; break;
>> +	case V4L2_PIX_FMT_ABGR32:	descr = "32-bit BGRA 8-8-8-8"; break;
>>  	case V4L2_PIX_FMT_ABGR444:	descr = "16-bit ABGR 4-4-4-4"; break;
>> -	case V4L2_PIX_FMT_XBGR444:	descr = "16-bit XBGR 4-4-4-4"; break;
>> -	case V4L2_PIX_FMT_BGRA444:	descr = "16-bit BGRA 4-4-4-4"; break;
>> -	case V4L2_PIX_FMT_BGRX444:	descr = "16-bit BGRX 4-4-4-4"; break;
>> -	case V4L2_PIX_FMT_RGB555:	descr = "16-bit A/XRGB 1-5-5-5"; break;
>> -	case V4L2_PIX_FMT_ARGB555:	descr = "16-bit ARGB 1-5-5-5"; break;
>> -	case V4L2_PIX_FMT_XRGB555:	descr = "16-bit XRGB 1-5-5-5"; break;
>>  	case V4L2_PIX_FMT_ABGR555:	descr = "16-bit ABGR 1-5-5-5"; break;
>> -	case V4L2_PIX_FMT_XBGR555:	descr = "16-bit XBGR 1-5-5-5"; break;
>> -	case V4L2_PIX_FMT_RGBA555:	descr = "16-bit RGBA 5-5-5-1"; break;
>> -	case V4L2_PIX_FMT_RGBX555:	descr = "16-bit RGBX 5-5-5-1"; break;
>> -	case V4L2_PIX_FMT_BGRA555:	descr = "16-bit BGRA 5-5-5-1"; break;
>> -	case V4L2_PIX_FMT_BGRX555:	descr = "16-bit BGRX 5-5-5-1"; break;
>> -	case V4L2_PIX_FMT_RGB565:	descr = "16-bit RGB 5-6-5"; break;
>> -	case V4L2_PIX_FMT_RGB555X:	descr = "16-bit A/XRGB 1-5-5-5 BE"; break;
>> +	case V4L2_PIX_FMT_ABGR64_12:	descr = "12-bit Depth BGRA"; break;
>> +	case V4L2_PIX_FMT_ARGB2101010:	descr = "32-bit ARGB 2-10-10-10"; break;
>> +	case V4L2_PIX_FMT_ARGB32:	descr = "32-bit ARGB 8-8-8-8"; break;
>> +	case V4L2_PIX_FMT_ARGB444:	descr = "16-bit ARGB 4-4-4-4"; break;
>> +	case V4L2_PIX_FMT_ARGB555:	descr = "16-bit ARGB 1-5-5-5"; break;
>>  	case V4L2_PIX_FMT_ARGB555X:	descr = "16-bit ARGB 1-5-5-5 BE"; break;
>> -	case V4L2_PIX_FMT_XRGB555X:	descr = "16-bit XRGB 1-5-5-5 BE"; break;
>> -	case V4L2_PIX_FMT_RGB565X:	descr = "16-bit RGB 5-6-5 BE"; break;
>> -	case V4L2_PIX_FMT_BGR666:	descr = "18-bit BGRX 6-6-6-14"; break;
>> +	case V4L2_PIX_FMT_AYUV32:	descr = "32-bit AYUV 8-8-8-8"; break;
>>  	case V4L2_PIX_FMT_BGR24:	descr = "24-bit BGR 8-8-8"; break;
>> -	case V4L2_PIX_FMT_RGB24:	descr = "24-bit RGB 8-8-8"; break;
>>  	case V4L2_PIX_FMT_BGR32:	descr = "32-bit BGRA/X 8-8-8-8"; break;
>> -	case V4L2_PIX_FMT_ABGR32:	descr = "32-bit BGRA 8-8-8-8"; break;
>> -	case V4L2_PIX_FMT_XBGR32:	descr = "32-bit BGRX 8-8-8-8"; break;
>> -	case V4L2_PIX_FMT_RGB32:	descr = "32-bit A/XRGB 8-8-8-8"; break;
>> -	case V4L2_PIX_FMT_ARGB32:	descr = "32-bit ARGB 8-8-8-8"; break;
>> -	case V4L2_PIX_FMT_XRGB32:	descr = "32-bit XRGB 8-8-8-8"; break;
>> -	case V4L2_PIX_FMT_BGRA32:	descr = "32-bit ABGR 8-8-8-8"; break;
>> -	case V4L2_PIX_FMT_BGRX32:	descr = "32-bit XBGR 8-8-8-8"; break;
>> -	case V4L2_PIX_FMT_RGBA32:	descr = "32-bit RGBA 8-8-8-8"; break;
>> -	case V4L2_PIX_FMT_RGBX32:	descr = "32-bit RGBX 8-8-8-8"; break;
>> -	case V4L2_PIX_FMT_RGBX1010102:	descr = "32-bit RGBX 10-10-10-2"; break;
>> -	case V4L2_PIX_FMT_RGBA1010102:	descr = "32-bit RGBA 10-10-10-2"; break;
>> -	case V4L2_PIX_FMT_ARGB2101010:	descr = "32-bit ARGB 2-10-10-10"; break;
>>  	case V4L2_PIX_FMT_BGR48:	descr = "48-bit BGR 16-16-16"; break;
>> -	case V4L2_PIX_FMT_RGB48:	descr = "48-bit RGB 16-16-16"; break;
>>  	case V4L2_PIX_FMT_BGR48_12:	descr = "12-bit Depth BGR"; break;
>> -	case V4L2_PIX_FMT_ABGR64_12:	descr = "12-bit Depth BGRA"; break;
>> -	case V4L2_PIX_FMT_GREY:		descr = "8-bit Greyscale"; break;
>> -	case V4L2_PIX_FMT_Y4:		descr = "4-bit Greyscale"; break;
>> -	case V4L2_PIX_FMT_Y6:		descr = "6-bit Greyscale"; break;
>> -	case V4L2_PIX_FMT_Y10:		descr = "10-bit Greyscale"; break;
>> -	case V4L2_PIX_FMT_Y12:		descr = "12-bit Greyscale"; break;
>> -	case V4L2_PIX_FMT_Y012:		descr = "12-bit Greyscale (bits 15-4)"; break;
>> -	case V4L2_PIX_FMT_Y14:		descr = "14-bit Greyscale"; break;
>> -	case V4L2_PIX_FMT_Y16:		descr = "16-bit Greyscale"; break;
>> -	case V4L2_PIX_FMT_Y16_BE:	descr = "16-bit Greyscale BE"; break;
>> -	case V4L2_PIX_FMT_Y10BPACK:	descr = "10-bit Greyscale (Packed)"; break;
>> -	case V4L2_PIX_FMT_Y10P:		descr = "10-bit Greyscale (MIPI Packed)"; break;
>> -	case V4L2_PIX_FMT_IPU3_Y10:	descr = "10-bit greyscale (IPU3 Packed)"; break;
>> -	case V4L2_PIX_FMT_Y12P:		descr = "12-bit Greyscale (MIPI Packed)"; break;
>> -	case V4L2_PIX_FMT_Y14P:		descr = "14-bit Greyscale (MIPI Packed)"; break;
>> -	case V4L2_PIX_FMT_Y8I:		descr = "Interleaved 8-bit Greyscale"; break;
>> -	case V4L2_PIX_FMT_Y12I:		descr = "Interleaved 12-bit Greyscale"; break;
>> -	case V4L2_PIX_FMT_Y16I:		descr = "Interleaved 16-bit Greyscale"; break;
>> -	case V4L2_PIX_FMT_Z16:		descr = "16-bit Depth"; break;
>> -	case V4L2_PIX_FMT_INZI:		descr = "Planar 10:16 Greyscale Depth"; break;
>> +	case V4L2_PIX_FMT_BGR666:	descr = "18-bit BGRX 6-6-6-14"; break;
>> +	case V4L2_PIX_FMT_BGRA32:	descr = "32-bit ABGR 8-8-8-8"; break;
>> +	case V4L2_PIX_FMT_BGRA444:	descr = "16-bit BGRA 4-4-4-4"; break;
>> +	case V4L2_PIX_FMT_BGRA555:	descr = "16-bit BGRA 5-5-5-1"; break;
>> +	case V4L2_PIX_FMT_BGRX32:	descr = "32-bit XBGR 8-8-8-8"; break;
>> +	case V4L2_PIX_FMT_BGRX444:	descr = "16-bit BGRX 4-4-4-4"; break;
>> +	case V4L2_PIX_FMT_BGRX555:	descr = "16-bit BGRX 5-5-5-1"; break;
>> +	case V4L2_PIX_FMT_CIT_YYVYUY:	descr = "GSPCA CIT YYVYUY"; break;
>>  	case V4L2_PIX_FMT_CNF4:		descr = "4-bit Depth Confidence (Packed)"; break;
>> -	case V4L2_PIX_FMT_PAL8:		descr = "8-bit Palette"; break;
>> -	case V4L2_PIX_FMT_UV8:		descr = "8-bit Chrominance UV 4-4"; break;
>> -	case V4L2_PIX_FMT_YVU410:	descr = "Planar YVU 4:1:0"; break;
>> -	case V4L2_PIX_FMT_YVU420:	descr = "Planar YVU 4:2:0"; break;
>> -	case V4L2_PIX_FMT_YUYV:		descr = "YUYV 4:2:2"; break;
>> -	case V4L2_PIX_FMT_YYUV:		descr = "YYUV 4:2:2"; break;
>> -	case V4L2_PIX_FMT_YVYU:		descr = "YVYU 4:2:2"; break;
>> -	case V4L2_PIX_FMT_UYVY:		descr = "UYVY 4:2:2"; break;
>> -	case V4L2_PIX_FMT_VYUY:		descr = "VYUY 4:2:2"; break;
>> -	case V4L2_PIX_FMT_YUV422P:	descr = "Planar YUV 4:2:2"; break;
>> -	case V4L2_PIX_FMT_YUV411P:	descr = "Planar YUV 4:1:1"; break;
>> -	case V4L2_PIX_FMT_Y41P:		descr = "YUV 4:1:1 (Packed)"; break;
>> -	case V4L2_PIX_FMT_YUV444:	descr = "16-bit A/XYUV 4-4-4-4"; break;
>> -	case V4L2_PIX_FMT_YUV555:	descr = "16-bit A/XYUV 1-5-5-5"; break;
>> -	case V4L2_PIX_FMT_YUV565:	descr = "16-bit YUV 5-6-5"; break;
>> -	case V4L2_PIX_FMT_YUV24:	descr = "24-bit YUV 4:4:4 8-8-8"; break;
>> -	case V4L2_PIX_FMT_YUV32:	descr = "32-bit A/XYUV 8-8-8-8"; break;
>> -	case V4L2_PIX_FMT_AYUV32:	descr = "32-bit AYUV 8-8-8-8"; break;
>> -	case V4L2_PIX_FMT_XYUV32:	descr = "32-bit XYUV 8-8-8-8"; break;
>> -	case V4L2_PIX_FMT_VUYA32:	descr = "32-bit VUYA 8-8-8-8"; break;
>> -	case V4L2_PIX_FMT_VUYX32:	descr = "32-bit VUYX 8-8-8-8"; break;
>> -	case V4L2_PIX_FMT_YUVA32:	descr = "32-bit YUVA 8-8-8-8"; break;
>> -	case V4L2_PIX_FMT_YUVX32:	descr = "32-bit YUVX 8-8-8-8"; break;
>> -	case V4L2_PIX_FMT_YUV410:	descr = "Planar YUV 4:1:0"; break;
>> -	case V4L2_PIX_FMT_YUV420:	descr = "Planar YUV 4:2:0"; break;
>> +	case V4L2_PIX_FMT_GREY:		descr = "8-bit Greyscale"; break;
>>  	case V4L2_PIX_FMT_HI240:	descr = "8-bit Dithered RGB (BTTV)"; break;
>> +	case V4L2_PIX_FMT_HSV24:	descr = "24-bit HSV 8-8-8"; break;
>> +	case V4L2_PIX_FMT_HSV32:	descr = "32-bit XHSV 8-8-8-8"; break;
>> +	case V4L2_PIX_FMT_INZI:		descr = "Planar 10:16 Greyscale Depth"; break;
>> +	case V4L2_PIX_FMT_IPU3_SBGGR10: descr = "10-bit bayer BGGR IPU3 Packed"; break;
>> +	case V4L2_PIX_FMT_IPU3_SGBRG10: descr = "10-bit bayer GBRG IPU3 Packed"; break;
>> +	case V4L2_PIX_FMT_IPU3_SGRBG10: descr = "10-bit bayer GRBG IPU3 Packed"; break;
>> +	case V4L2_PIX_FMT_IPU3_SRGGB10: descr = "10-bit bayer RGGB IPU3 Packed"; break;
>> +	case V4L2_PIX_FMT_IPU3_Y10:	descr = "10-bit greyscale (IPU3 Packed)"; break;
>> +	case V4L2_PIX_FMT_KONICA420:	descr = "GSPCA KONICA420"; break;
>>  	case V4L2_PIX_FMT_M420:		descr = "YUV 4:2:0 (M420)"; break;
>> -	case V4L2_PIX_FMT_YUV48_12:	descr = "12-bit YUV 4:4:4 Packed"; break;
>> +	case V4L2_PIX_FMT_MM21:		descr = "Mediatek 8-bit Block Format"; break;
>>  	case V4L2_PIX_FMT_NV12:		descr = "Y/UV 4:2:0"; break;
>> -	case V4L2_PIX_FMT_NV21:		descr = "Y/VU 4:2:0"; break;
>> +	case V4L2_PIX_FMT_NV12M:	descr = "Y/UV 4:2:0 (N-C)"; break;
>> +	case V4L2_PIX_FMT_NV12MT:	descr = "Y/UV 4:2:0 (64x32 MB, N-C)"; break;
>> +	case V4L2_PIX_FMT_NV12MT_16X16:	descr = "Y/UV 4:2:0 (16x16 MB, N-C)"; break;
>> +	case V4L2_PIX_FMT_NV12M_10BE_8L128:	descr = "10-bit NV12M (8x128 Linear, BE)"; break;
>> +	case V4L2_PIX_FMT_NV12M_8L128:	descr = "NV12M (8x128 Linear)"; break;
>> +	case V4L2_PIX_FMT_NV12_10BE_8L128:	descr = "10-bit NV12 (8x128 Linear, BE)"; break;
>> +	case V4L2_PIX_FMT_NV12_16L16:	descr = "Y/UV 4:2:0 (16x16 Linear)"; break;
>> +	case V4L2_PIX_FMT_NV12_32L32:   descr = "Y/UV 4:2:0 (32x32 Linear)"; break;
>> +	case V4L2_PIX_FMT_NV12_4L4:	descr = "Y/UV 4:2:0 (4x4 Linear)"; break;
>> +	case V4L2_PIX_FMT_NV12_8L128:	descr = "NV12 (8x128 Linear)"; break;
>>  	case V4L2_PIX_FMT_NV15:		descr = "10-bit Y/UV 4:2:0 (Packed)"; break;
>> +	case V4L2_PIX_FMT_NV15_4L4:	descr = "10-bit Y/UV 4:2:0 (4x4 Linear)"; break;
>>  	case V4L2_PIX_FMT_NV16:		descr = "Y/UV 4:2:2"; break;
>> -	case V4L2_PIX_FMT_NV61:		descr = "Y/VU 4:2:2"; break;
>> +	case V4L2_PIX_FMT_NV16M:	descr = "Y/UV 4:2:2 (N-C)"; break;
>>  	case V4L2_PIX_FMT_NV20:		descr = "10-bit Y/UV 4:2:2 (Packed)"; break;
>> +	case V4L2_PIX_FMT_NV21:		descr = "Y/VU 4:2:0"; break;
>> +	case V4L2_PIX_FMT_NV21M:	descr = "Y/VU 4:2:0 (N-C)"; break;
>>  	case V4L2_PIX_FMT_NV24:		descr = "Y/UV 4:4:4"; break;
>>  	case V4L2_PIX_FMT_NV42:		descr = "Y/VU 4:4:4"; break;
>> +	case V4L2_PIX_FMT_NV61:		descr = "Y/VU 4:2:2"; break;
>> +	case V4L2_PIX_FMT_NV61M:	descr = "Y/VU 4:2:2 (N-C)"; break;
>>  	case V4L2_PIX_FMT_P010:		descr = "10-bit Y/UV 4:2:0"; break;
>> -	case V4L2_PIX_FMT_P012:		descr = "12-bit Y/UV 4:2:0"; break;
>> -	case V4L2_PIX_FMT_NV12_4L4:	descr = "Y/UV 4:2:0 (4x4 Linear)"; break;
>> -	case V4L2_PIX_FMT_NV12_16L16:	descr = "Y/UV 4:2:0 (16x16 Linear)"; break;
>> -	case V4L2_PIX_FMT_NV12_32L32:   descr = "Y/UV 4:2:0 (32x32 Linear)"; break;
>> -	case V4L2_PIX_FMT_NV15_4L4:	descr = "10-bit Y/UV 4:2:0 (4x4 Linear)"; break;
>>  	case V4L2_PIX_FMT_P010_4L4:	descr = "10-bit Y/UV 4:2:0 (4x4 Linear)"; break;
>> -	case V4L2_PIX_FMT_NV12M:	descr = "Y/UV 4:2:0 (N-C)"; break;
>> -	case V4L2_PIX_FMT_NV21M:	descr = "Y/VU 4:2:0 (N-C)"; break;
>> -	case V4L2_PIX_FMT_NV16M:	descr = "Y/UV 4:2:2 (N-C)"; break;
>> -	case V4L2_PIX_FMT_NV61M:	descr = "Y/VU 4:2:2 (N-C)"; break;
>> -	case V4L2_PIX_FMT_NV12MT:	descr = "Y/UV 4:2:0 (64x32 MB, N-C)"; break;
>> -	case V4L2_PIX_FMT_NV12MT_16X16:	descr = "Y/UV 4:2:0 (16x16 MB, N-C)"; break;
>> +	case V4L2_PIX_FMT_P012:		descr = "12-bit Y/UV 4:2:0"; break;
>>  	case V4L2_PIX_FMT_P012M:	descr = "12-bit Y/UV 4:2:0 (N-C)"; break;
>> -	case V4L2_PIX_FMT_YUV420M:	descr = "Planar YUV 4:2:0 (N-C)"; break;
>> -	case V4L2_PIX_FMT_YVU420M:	descr = "Planar YVU 4:2:0 (N-C)"; break;
>> -	case V4L2_PIX_FMT_YUV422M:	descr = "Planar YUV 4:2:2 (N-C)"; break;
>> -	case V4L2_PIX_FMT_YVU422M:	descr = "Planar YVU 4:2:2 (N-C)"; break;
>> -	case V4L2_PIX_FMT_YUV444M:	descr = "Planar YUV 4:4:4 (N-C)"; break;
>> -	case V4L2_PIX_FMT_YVU444M:	descr = "Planar YVU 4:4:4 (N-C)"; break;
>> -	case V4L2_PIX_FMT_SBGGR8:	descr = "8-bit Bayer BGBG/GRGR"; break;
>> -	case V4L2_PIX_FMT_SGBRG8:	descr = "8-bit Bayer GBGB/RGRG"; break;
>> -	case V4L2_PIX_FMT_SGRBG8:	descr = "8-bit Bayer GRGR/BGBG"; break;
>> -	case V4L2_PIX_FMT_SRGGB8:	descr = "8-bit Bayer RGRG/GBGB"; break;
>> +	case V4L2_PIX_FMT_PAL8:		descr = "8-bit Palette"; break;
>> +	case V4L2_PIX_FMT_RGB24:	descr = "24-bit RGB 8-8-8"; break;
>> +	case V4L2_PIX_FMT_RGB32:	descr = "32-bit A/XRGB 8-8-8-8"; break;
>> +	case V4L2_PIX_FMT_RGB332:	descr = "8-bit RGB 3-3-2"; break;
>> +	case V4L2_PIX_FMT_RGB444:	descr = "16-bit A/XRGB 4-4-4-4"; break;
>> +	case V4L2_PIX_FMT_RGB48:	descr = "48-bit RGB 16-16-16"; break;
>> +	case V4L2_PIX_FMT_RGB555:	descr = "16-bit A/XRGB 1-5-5-5"; break;
>> +	case V4L2_PIX_FMT_RGB555X:	descr = "16-bit A/XRGB 1-5-5-5 BE"; break;
>> +	case V4L2_PIX_FMT_RGB565:	descr = "16-bit RGB 5-6-5"; break;
>> +	case V4L2_PIX_FMT_RGB565X:	descr = "16-bit RGB 5-6-5 BE"; break;
>> +	case V4L2_PIX_FMT_RGBA1010102:	descr = "32-bit RGBA 10-10-10-2"; break;
>> +	case V4L2_PIX_FMT_RGBA32:	descr = "32-bit RGBA 8-8-8-8"; break;
>> +	case V4L2_PIX_FMT_RGBA444:	descr = "16-bit RGBA 4-4-4-4"; break;
>> +	case V4L2_PIX_FMT_RGBA555:	descr = "16-bit RGBA 5-5-5-1"; break;
>> +	case V4L2_PIX_FMT_RGBX1010102:	descr = "32-bit RGBX 10-10-10-2"; break;
>> +	case V4L2_PIX_FMT_RGBX32:	descr = "32-bit RGBX 8-8-8-8"; break;
>> +	case V4L2_PIX_FMT_RGBX444:	descr = "16-bit RGBX 4-4-4-4"; break;
>> +	case V4L2_PIX_FMT_RGBX555:	descr = "16-bit RGBX 5-5-5-1"; break;
>>  	case V4L2_PIX_FMT_SBGGR10:	descr = "10-bit Bayer BGBG/GRGR"; break;
>> -	case V4L2_PIX_FMT_SGBRG10:	descr = "10-bit Bayer GBGB/RGRG"; break;
>> -	case V4L2_PIX_FMT_SGRBG10:	descr = "10-bit Bayer GRGR/BGBG"; break;
>> -	case V4L2_PIX_FMT_SRGGB10:	descr = "10-bit Bayer RGRG/GBGB"; break;
>> -	case V4L2_PIX_FMT_SBGGR10P:	descr = "10-bit Bayer BGBG/GRGR Packed"; break;
>> -	case V4L2_PIX_FMT_SGBRG10P:	descr = "10-bit Bayer GBGB/RGRG Packed"; break;
>> -	case V4L2_PIX_FMT_SGRBG10P:	descr = "10-bit Bayer GRGR/BGBG Packed"; break;
>> -	case V4L2_PIX_FMT_SRGGB10P:	descr = "10-bit Bayer RGRG/GBGB Packed"; break;
>> -	case V4L2_PIX_FMT_IPU3_SBGGR10: descr = "10-bit bayer BGGR IPU3 Packed"; break;
>> -	case V4L2_PIX_FMT_IPU3_SGBRG10: descr = "10-bit bayer GBRG IPU3 Packed"; break;
>> -	case V4L2_PIX_FMT_IPU3_SGRBG10: descr = "10-bit bayer GRBG IPU3 Packed"; break;
>> -	case V4L2_PIX_FMT_IPU3_SRGGB10: descr = "10-bit bayer RGGB IPU3 Packed"; break;
>>  	case V4L2_PIX_FMT_SBGGR10ALAW8:	descr = "8-bit Bayer BGBG/GRGR (A-law)"; break;
>> -	case V4L2_PIX_FMT_SGBRG10ALAW8:	descr = "8-bit Bayer GBGB/RGRG (A-law)"; break;
>> -	case V4L2_PIX_FMT_SGRBG10ALAW8:	descr = "8-bit Bayer GRGR/BGBG (A-law)"; break;
>> -	case V4L2_PIX_FMT_SRGGB10ALAW8:	descr = "8-bit Bayer RGRG/GBGB (A-law)"; break;
>>  	case V4L2_PIX_FMT_SBGGR10DPCM8:	descr = "8-bit Bayer BGBG/GRGR (DPCM)"; break;
>> -	case V4L2_PIX_FMT_SGBRG10DPCM8:	descr = "8-bit Bayer GBGB/RGRG (DPCM)"; break;
>> -	case V4L2_PIX_FMT_SGRBG10DPCM8:	descr = "8-bit Bayer GRGR/BGBG (DPCM)"; break;
>> -	case V4L2_PIX_FMT_SRGGB10DPCM8:	descr = "8-bit Bayer RGRG/GBGB (DPCM)"; break;
>> +	case V4L2_PIX_FMT_SBGGR10P:	descr = "10-bit Bayer BGBG/GRGR Packed"; break;
>>  	case V4L2_PIX_FMT_SBGGR12:	descr = "12-bit Bayer BGBG/GRGR"; break;
>> -	case V4L2_PIX_FMT_SGBRG12:	descr = "12-bit Bayer GBGB/RGRG"; break;
>> -	case V4L2_PIX_FMT_SGRBG12:	descr = "12-bit Bayer GRGR/BGBG"; break;
>> -	case V4L2_PIX_FMT_SRGGB12:	descr = "12-bit Bayer RGRG/GBGB"; break;
>>  	case V4L2_PIX_FMT_SBGGR12P:	descr = "12-bit Bayer BGBG/GRGR Packed"; break;
>> -	case V4L2_PIX_FMT_SGBRG12P:	descr = "12-bit Bayer GBGB/RGRG Packed"; break;
>> -	case V4L2_PIX_FMT_SGRBG12P:	descr = "12-bit Bayer GRGR/BGBG Packed"; break;
>> -	case V4L2_PIX_FMT_SRGGB12P:	descr = "12-bit Bayer RGRG/GBGB Packed"; break;
>>  	case V4L2_PIX_FMT_SBGGR14:	descr = "14-bit Bayer BGBG/GRGR"; break;
>> -	case V4L2_PIX_FMT_SGBRG14:	descr = "14-bit Bayer GBGB/RGRG"; break;
>> -	case V4L2_PIX_FMT_SGRBG14:	descr = "14-bit Bayer GRGR/BGBG"; break;
>> -	case V4L2_PIX_FMT_SRGGB14:	descr = "14-bit Bayer RGRG/GBGB"; break;
>>  	case V4L2_PIX_FMT_SBGGR14P:	descr = "14-bit Bayer BGBG/GRGR Packed"; break;
>> -	case V4L2_PIX_FMT_SGBRG14P:	descr = "14-bit Bayer GBGB/RGRG Packed"; break;
>> -	case V4L2_PIX_FMT_SGRBG14P:	descr = "14-bit Bayer GRGR/BGBG Packed"; break;
>> -	case V4L2_PIX_FMT_SRGGB14P:	descr = "14-bit Bayer RGRG/GBGB Packed"; break;
>>  	case V4L2_PIX_FMT_SBGGR16:	descr = "16-bit Bayer BGBG/GRGR"; break;
>> +	case V4L2_PIX_FMT_SBGGR8:	descr = "8-bit Bayer BGBG/GRGR"; break;
>> +	case V4L2_PIX_FMT_SGBRG10:	descr = "10-bit Bayer GBGB/RGRG"; break;
>> +	case V4L2_PIX_FMT_SGBRG10ALAW8:	descr = "8-bit Bayer GBGB/RGRG (A-law)"; break;
>> +	case V4L2_PIX_FMT_SGBRG10DPCM8:	descr = "8-bit Bayer GBGB/RGRG (DPCM)"; break;
>> +	case V4L2_PIX_FMT_SGBRG10P:	descr = "10-bit Bayer GBGB/RGRG Packed"; break;
>> +	case V4L2_PIX_FMT_SGBRG12:	descr = "12-bit Bayer GBGB/RGRG"; break;
>> +	case V4L2_PIX_FMT_SGBRG12P:	descr = "12-bit Bayer GBGB/RGRG Packed"; break;
>> +	case V4L2_PIX_FMT_SGBRG14:	descr = "14-bit Bayer GBGB/RGRG"; break;
>> +	case V4L2_PIX_FMT_SGBRG14P:	descr = "14-bit Bayer GBGB/RGRG Packed"; break;
>>  	case V4L2_PIX_FMT_SGBRG16:	descr = "16-bit Bayer GBGB/RGRG"; break;
>> +	case V4L2_PIX_FMT_SGBRG8:	descr = "8-bit Bayer GBGB/RGRG"; break;
>> +	case V4L2_PIX_FMT_SGRBG10:	descr = "10-bit Bayer GRGR/BGBG"; break;
>> +	case V4L2_PIX_FMT_SGRBG10ALAW8:	descr = "8-bit Bayer GRGR/BGBG (A-law)"; break;
>> +	case V4L2_PIX_FMT_SGRBG10DPCM8:	descr = "8-bit Bayer GRGR/BGBG (DPCM)"; break;
>> +	case V4L2_PIX_FMT_SGRBG10P:	descr = "10-bit Bayer GRGR/BGBG Packed"; break;
>> +	case V4L2_PIX_FMT_SGRBG12:	descr = "12-bit Bayer GRGR/BGBG"; break;
>> +	case V4L2_PIX_FMT_SGRBG12P:	descr = "12-bit Bayer GRGR/BGBG Packed"; break;
>> +	case V4L2_PIX_FMT_SGRBG14:	descr = "14-bit Bayer GRGR/BGBG"; break;
>> +	case V4L2_PIX_FMT_SGRBG14P:	descr = "14-bit Bayer GRGR/BGBG Packed"; break;
>>  	case V4L2_PIX_FMT_SGRBG16:	descr = "16-bit Bayer GRGR/BGBG"; break;
>> -	case V4L2_PIX_FMT_SRGGB16:	descr = "16-bit Bayer RGRG/GBGB"; break;
>> +	case V4L2_PIX_FMT_SGRBG8:	descr = "8-bit Bayer GRGR/BGBG"; break;
>>  	case V4L2_PIX_FMT_SN9C20X_I420:	descr = "GSPCA SN9C20X I420"; break;
>>  	case V4L2_PIX_FMT_SPCA501:	descr = "GSPCA SPCA501"; break;
>>  	case V4L2_PIX_FMT_SPCA505:	descr = "GSPCA SPCA505"; break;
>>  	case V4L2_PIX_FMT_SPCA508:	descr = "GSPCA SPCA508"; break;
>> +	case V4L2_PIX_FMT_SRGGB10:	descr = "10-bit Bayer RGRG/GBGB"; break;
>> +	case V4L2_PIX_FMT_SRGGB10ALAW8:	descr = "8-bit Bayer RGRG/GBGB (A-law)"; break;
>> +	case V4L2_PIX_FMT_SRGGB10DPCM8:	descr = "8-bit Bayer RGRG/GBGB (DPCM)"; break;
>> +	case V4L2_PIX_FMT_SRGGB10P:	descr = "10-bit Bayer RGRG/GBGB Packed"; break;
>> +	case V4L2_PIX_FMT_SRGGB12:	descr = "12-bit Bayer RGRG/GBGB"; break;
>> +	case V4L2_PIX_FMT_SRGGB12P:	descr = "12-bit Bayer RGRG/GBGB Packed"; break;
>> +	case V4L2_PIX_FMT_SRGGB14:	descr = "14-bit Bayer RGRG/GBGB"; break;
>> +	case V4L2_PIX_FMT_SRGGB14P:	descr = "14-bit Bayer RGRG/GBGB Packed"; break;
>> +	case V4L2_PIX_FMT_SRGGB16:	descr = "16-bit Bayer RGRG/GBGB"; break;
>> +	case V4L2_PIX_FMT_SRGGB8:	descr = "8-bit Bayer RGRG/GBGB"; break;
>>  	case V4L2_PIX_FMT_STV0680:	descr = "GSPCA STV0680"; break;
>>  	case V4L2_PIX_FMT_TM6000:	descr = "A/V + VBI Mux Packet"; break;
>> -	case V4L2_PIX_FMT_CIT_YYVYUY:	descr = "GSPCA CIT YYVYUY"; break;
>> -	case V4L2_PIX_FMT_KONICA420:	descr = "GSPCA KONICA420"; break;
>> -	case V4L2_PIX_FMT_MM21:		descr = "Mediatek 8-bit Block Format"; break;
>> -	case V4L2_PIX_FMT_HSV24:	descr = "24-bit HSV 8-8-8"; break;
>> -	case V4L2_PIX_FMT_HSV32:	descr = "32-bit XHSV 8-8-8-8"; break;
>> -	case V4L2_SDR_FMT_CU8:		descr = "Complex U8"; break;
>> -	case V4L2_SDR_FMT_CU16LE:	descr = "Complex U16LE"; break;
>> -	case V4L2_SDR_FMT_CS8:		descr = "Complex S8"; break;
>> +	case V4L2_PIX_FMT_UV8:		descr = "8-bit Chrominance UV 4-4"; break;
>> +	case V4L2_PIX_FMT_UYVY:		descr = "UYVY 4:2:2"; break;
>> +	case V4L2_PIX_FMT_VUYA32:	descr = "32-bit VUYA 8-8-8-8"; break;
>> +	case V4L2_PIX_FMT_VUYX32:	descr = "32-bit VUYX 8-8-8-8"; break;
>> +	case V4L2_PIX_FMT_VYUY:		descr = "VYUY 4:2:2"; break;
>> +	case V4L2_PIX_FMT_XBGR32:	descr = "32-bit BGRX 8-8-8-8"; break;
>> +	case V4L2_PIX_FMT_XBGR444:	descr = "16-bit XBGR 4-4-4-4"; break;
>> +	case V4L2_PIX_FMT_XBGR555:	descr = "16-bit XBGR 1-5-5-5"; break;
>> +	case V4L2_PIX_FMT_XRGB32:	descr = "32-bit XRGB 8-8-8-8"; break;
>> +	case V4L2_PIX_FMT_XRGB444:	descr = "16-bit XRGB 4-4-4-4"; break;
>> +	case V4L2_PIX_FMT_XRGB555:	descr = "16-bit XRGB 1-5-5-5"; break;
>> +	case V4L2_PIX_FMT_XRGB555X:	descr = "16-bit XRGB 1-5-5-5 BE"; break;
>> +	case V4L2_PIX_FMT_XYUV32:	descr = "32-bit XYUV 8-8-8-8"; break;
>> +	case V4L2_PIX_FMT_Y012:		descr = "12-bit Greyscale (bits 15-4)"; break;
>> +	case V4L2_PIX_FMT_Y10:		descr = "10-bit Greyscale"; break;
>> +	case V4L2_PIX_FMT_Y10BPACK:	descr = "10-bit Greyscale (Packed)"; break;
>> +	case V4L2_PIX_FMT_Y10P:		descr = "10-bit Greyscale (MIPI Packed)"; break;
>> +	case V4L2_PIX_FMT_Y12:		descr = "12-bit Greyscale"; break;
>> +	case V4L2_PIX_FMT_Y12I:		descr = "Interleaved 12-bit Greyscale"; break;
>> +	case V4L2_PIX_FMT_Y12P:		descr = "12-bit Greyscale (MIPI Packed)"; break;
>> +	case V4L2_PIX_FMT_Y14:		descr = "14-bit Greyscale"; break;
>> +	case V4L2_PIX_FMT_Y14P:		descr = "14-bit Greyscale (MIPI Packed)"; break;
>> +	case V4L2_PIX_FMT_Y16:		descr = "16-bit Greyscale"; break;
>> +	case V4L2_PIX_FMT_Y16I:		descr = "Interleaved 16-bit Greyscale"; break;
>> +	case V4L2_PIX_FMT_Y16_BE:	descr = "16-bit Greyscale BE"; break;
>> +	case V4L2_PIX_FMT_Y210:		descr = "10-bit YUYV Packed"; break;
>> +	case V4L2_PIX_FMT_Y212:		descr = "12-bit YUYV Packed"; break;
>> +	case V4L2_PIX_FMT_Y216:		descr = "16-bit YUYV Packed"; break;
>> +	case V4L2_PIX_FMT_Y41P:		descr = "YUV 4:1:1 (Packed)"; break;
>> +	case V4L2_PIX_FMT_Y4:		descr = "4-bit Greyscale"; break;
>> +	case V4L2_PIX_FMT_Y6:		descr = "6-bit Greyscale"; break;
>> +	case V4L2_PIX_FMT_Y8I:		descr = "Interleaved 8-bit Greyscale"; break;
>> +	case V4L2_PIX_FMT_YUV24:	descr = "24-bit YUV 4:4:4 8-8-8"; break;
>> +	case V4L2_PIX_FMT_YUV32:	descr = "32-bit A/XYUV 8-8-8-8"; break;
>> +	case V4L2_PIX_FMT_YUV410:	descr = "Planar YUV 4:1:0"; break;
>> +	case V4L2_PIX_FMT_YUV411P:	descr = "Planar YUV 4:1:1"; break;
>> +	case V4L2_PIX_FMT_YUV420:	descr = "Planar YUV 4:2:0"; break;
>> +	case V4L2_PIX_FMT_YUV420M:	descr = "Planar YUV 4:2:0 (N-C)"; break;
>> +	case V4L2_PIX_FMT_YUV422M:	descr = "Planar YUV 4:2:2 (N-C)"; break;
>> +	case V4L2_PIX_FMT_YUV422P:	descr = "Planar YUV 4:2:2"; break;
>> +	case V4L2_PIX_FMT_YUV444:	descr = "16-bit A/XYUV 4-4-4-4"; break;
>> +	case V4L2_PIX_FMT_YUV444M:	descr = "Planar YUV 4:4:4 (N-C)"; break;
>> +	case V4L2_PIX_FMT_YUV48_12:	descr = "12-bit YUV 4:4:4 Packed"; break;
>> +	case V4L2_PIX_FMT_YUV555:	descr = "16-bit A/XYUV 1-5-5-5"; break;
>> +	case V4L2_PIX_FMT_YUV565:	descr = "16-bit YUV 5-6-5"; break;
>> +	case V4L2_PIX_FMT_YUVA32:	descr = "32-bit YUVA 8-8-8-8"; break;
>> +	case V4L2_PIX_FMT_YUVX32:	descr = "32-bit YUVX 8-8-8-8"; break;
>> +	case V4L2_PIX_FMT_YUYV:		descr = "YUYV 4:2:2"; break;
>> +	case V4L2_PIX_FMT_YVU410:	descr = "Planar YVU 4:1:0"; break;
>> +	case V4L2_PIX_FMT_YVU420:	descr = "Planar YVU 4:2:0"; break;
>> +	case V4L2_PIX_FMT_YVU420M:	descr = "Planar YVU 4:2:0 (N-C)"; break;
>> +	case V4L2_PIX_FMT_YVU422M:	descr = "Planar YVU 4:2:2 (N-C)"; break;
>> +	case V4L2_PIX_FMT_YVU444M:	descr = "Planar YVU 4:4:4 (N-C)"; break;
>> +	case V4L2_PIX_FMT_YVYU:		descr = "YVYU 4:2:2"; break;
>> +	case V4L2_PIX_FMT_YYUV:		descr = "YYUV 4:2:2"; break;
>> +	case V4L2_PIX_FMT_Z16:		descr = "16-bit Depth"; break;
>>  	case V4L2_SDR_FMT_CS14LE:	descr = "Complex S14LE"; break;
>> -	case V4L2_SDR_FMT_RU12LE:	descr = "Real U12LE"; break;
>> +	case V4L2_SDR_FMT_CS8:		descr = "Complex S8"; break;
>> +	case V4L2_SDR_FMT_CU16LE:	descr = "Complex U16LE"; break;
>> +	case V4L2_SDR_FMT_CU8:		descr = "Complex U8"; break;
>>  	case V4L2_SDR_FMT_PCU16BE:	descr = "Planar Complex U16BE"; break;
>>  	case V4L2_SDR_FMT_PCU18BE:	descr = "Planar Complex U18BE"; break;
>>  	case V4L2_SDR_FMT_PCU20BE:	descr = "Planar Complex U20BE"; break;
>> -	case V4L2_TCH_FMT_DELTA_TD16:	descr = "16-bit Signed Deltas"; break;
>> +	case V4L2_SDR_FMT_RU12LE:	descr = "Real U12LE"; break;
>>  	case V4L2_TCH_FMT_DELTA_TD08:	descr = "8-bit Signed Deltas"; break;
>> -	case V4L2_TCH_FMT_TU16:		descr = "16-bit Unsigned Touch Data"; break;
>> +	case V4L2_TCH_FMT_DELTA_TD16:	descr = "16-bit Signed Deltas"; break;
>>  	case V4L2_TCH_FMT_TU08:		descr = "8-bit Unsigned Touch Data"; break;
>> -	case V4L2_META_FMT_VSP1_HGO:	descr = "R-Car VSP1 1-D Histogram"; break;
>> -	case V4L2_META_FMT_VSP1_HGT:	descr = "R-Car VSP1 2-D Histogram"; break;
>> -	case V4L2_META_FMT_UVC:		descr = "UVC Payload Header Metadata"; break;
>> -	case V4L2_META_FMT_D4XX:	descr = "Intel D4xx UVC Metadata"; break;
>> -	case V4L2_META_FMT_VIVID:       descr = "Vivid Metadata"; break;
>> -	case V4L2_META_FMT_RK_ISP1_PARAMS:	descr = "Rockchip ISP1 3A Parameters"; break;
>> -	case V4L2_META_FMT_RK_ISP1_STAT_3A:	descr = "Rockchip ISP1 3A Statistics"; break;
>> -	case V4L2_META_FMT_RK_ISP1_EXT_PARAMS:	descr = "Rockchip ISP1 Ext 3A Params"; break;
>> -	case V4L2_META_FMT_C3ISP_PARAMS:	descr = "Amlogic C3 ISP Parameters"; break;
>> -	case V4L2_META_FMT_C3ISP_STATS:		descr = "Amlogic C3 ISP Statistics"; break;
>> -	case V4L2_PIX_FMT_NV12_8L128:	descr = "NV12 (8x128 Linear)"; break;
>> -	case V4L2_PIX_FMT_NV12M_8L128:	descr = "NV12M (8x128 Linear)"; break;
>> -	case V4L2_PIX_FMT_NV12_10BE_8L128:	descr = "10-bit NV12 (8x128 Linear, BE)"; break;
>> -	case V4L2_PIX_FMT_NV12M_10BE_8L128:	descr = "10-bit NV12M (8x128 Linear, BE)"; break;
>> -	case V4L2_PIX_FMT_Y210:		descr = "10-bit YUYV Packed"; break;
>> -	case V4L2_PIX_FMT_Y212:		descr = "12-bit YUYV Packed"; break;
>> -	case V4L2_PIX_FMT_Y216:		descr = "16-bit YUYV Packed"; break;
>> -	case V4L2_META_FMT_RPI_BE_CFG:	descr = "RPi PiSP BE Config format"; break;
>> -	case V4L2_META_FMT_RPI_FE_CFG:  descr = "RPi PiSP FE Config format"; break;
>> -	case V4L2_META_FMT_RPI_FE_STATS: descr = "RPi PiSP FE Statistics format"; break;
>> -	case V4L2_META_FMT_GENERIC_8:	descr = "8-bit Generic Metadata"; break;
>> -	case V4L2_META_FMT_GENERIC_CSI2_10:	descr = "8-bit Generic Meta, 10b CSI-2"; break;
>> -	case V4L2_META_FMT_GENERIC_CSI2_12:	descr = "8-bit Generic Meta, 12b CSI-2"; break;
>> -	case V4L2_META_FMT_GENERIC_CSI2_14:	descr = "8-bit Generic Meta, 14b CSI-2"; break;
>> -	case V4L2_META_FMT_GENERIC_CSI2_16:	descr = "8-bit Generic Meta, 16b CSI-2"; break;
>> -	case V4L2_META_FMT_GENERIC_CSI2_20:	descr = "8-bit Generic Meta, 20b CSI-2"; break;
>> -	case V4L2_META_FMT_GENERIC_CSI2_24:	descr = "8-bit Generic Meta, 24b CSI-2"; break;
>> +	case V4L2_TCH_FMT_TU16:		descr = "16-bit Unsigned Touch Data"; break;
> 
> This changes the order from that in videodev2.h, e.g. spreading the Bayer
> formats of different bit depths in four different places. The list
> admittedly didn't have order entirely comparable to videodev2.h due to
> compressed formats.
> 
> How much do you think there is deviance currently from the videodev2.h
> order, taking the compressed formats below into account?

This table was never sorted (or needs to be sorted) in the first place.
Generally related formats are grouped together, but there is no advantage
in sorting alphabetically.

> 
>> +	/* keep-sorted end */
>>  
>>  	default:
>>  		/* Compressed formats */
>>  		flags = V4L2_FMT_FLAG_COMPRESSED;
>>  		switch (fmt->pixelformat) {
>>  		/* Max description length mask:	descr = "0123456789012345678901234567890" */
>> -		case V4L2_PIX_FMT_MJPEG:	descr = "Motion-JPEG"; break;
>> -		case V4L2_PIX_FMT_JPEG:		descr = "JFIF JPEG"; break;
>> +		/* keep-sorted start */
>> +		case V4L2_PIX_FMT_AJPG:		descr = "Aspeed JPEG"; break;
>> +		case V4L2_PIX_FMT_AV1_FRAME:	descr = "AV1 Frame"; break;
>> +		case V4L2_PIX_FMT_CPIA1:	descr = "GSPCA CPiA YUV"; break;
>>  		case V4L2_PIX_FMT_DV:		descr = "1394"; break;
>> -		case V4L2_PIX_FMT_MPEG:		descr = "MPEG-1/2/4"; break;
>> +		case V4L2_PIX_FMT_ET61X251:	descr = "GSPCA ET61X251"; break;
>> +		case V4L2_PIX_FMT_FWHT:		descr = "FWHT"; break; /* used in vicodec */
>> +		case V4L2_PIX_FMT_FWHT_STATELESS:	descr = "FWHT Stateless"; break; /* used in vicodec */
>> +		case V4L2_PIX_FMT_H263:		descr = "H.263"; break;
>>  		case V4L2_PIX_FMT_H264:		descr = "H.264"; break;
>> -		case V4L2_PIX_FMT_H264_NO_SC:	descr = "H.264 (No Start Codes)"; break;
>>  		case V4L2_PIX_FMT_H264_MVC:	descr = "H.264 MVC"; break;
>> +		case V4L2_PIX_FMT_H264_NO_SC:	descr = "H.264 (No Start Codes)"; break;
>>  		case V4L2_PIX_FMT_H264_SLICE:	descr = "H.264 Parsed Slice Data"; break;
>> -		case V4L2_PIX_FMT_H263:		descr = "H.263"; break;
>> +		case V4L2_PIX_FMT_HEVC:		descr = "HEVC"; break; /* aka H.265 */
>> +		case V4L2_PIX_FMT_HEVC_SLICE:	descr = "HEVC Parsed Slice Data"; break;
>> +		case V4L2_PIX_FMT_HEXTILE:	descr = "Hextile Compressed Format"; break;
>> +		case V4L2_PIX_FMT_JL2005BCD:	descr = "GSPCA JL2005BCD"; break;
>> +		case V4L2_PIX_FMT_JPEG:		descr = "JFIF JPEG"; break;
>> +		case V4L2_PIX_FMT_JPGL:		descr = "JPEG Lite"; break;
>> +		case V4L2_PIX_FMT_MJPEG:	descr = "Motion-JPEG"; break;
>>  		case V4L2_PIX_FMT_MPEG1:	descr = "MPEG-1 ES"; break;
>>  		case V4L2_PIX_FMT_MPEG2:	descr = "MPEG-2 ES"; break;
>>  		case V4L2_PIX_FMT_MPEG2_SLICE:	descr = "MPEG-2 Parsed Slice Data"; break;
>>  		case V4L2_PIX_FMT_MPEG4:	descr = "MPEG-4 Part 2 ES"; break;
>> -		case V4L2_PIX_FMT_XVID:		descr = "Xvid"; break;
>> -		case V4L2_PIX_FMT_VC1_ANNEX_G:	descr = "VC-1 (SMPTE 412M Annex G)"; break;
>> -		case V4L2_PIX_FMT_VC1_ANNEX_L:	descr = "VC-1 (SMPTE 412M Annex L)"; break;
>> -		case V4L2_PIX_FMT_VP8:		descr = "VP8"; break;
>> -		case V4L2_PIX_FMT_VP8_FRAME:    descr = "VP8 Frame"; break;
>> -		case V4L2_PIX_FMT_VP9:		descr = "VP9"; break;
>> -		case V4L2_PIX_FMT_VP9_FRAME:    descr = "VP9 Frame"; break;
>> -		case V4L2_PIX_FMT_HEVC:		descr = "HEVC"; break; /* aka H.265 */
>> -		case V4L2_PIX_FMT_HEVC_SLICE:	descr = "HEVC Parsed Slice Data"; break;
>> -		case V4L2_PIX_FMT_FWHT:		descr = "FWHT"; break; /* used in vicodec */
>> -		case V4L2_PIX_FMT_FWHT_STATELESS:	descr = "FWHT Stateless"; break; /* used in vicodec */
>> -		case V4L2_PIX_FMT_SPK:		descr = "Sorenson Spark"; break;
>> -		case V4L2_PIX_FMT_RV30:		descr = "RealVideo 8"; break;
>> -		case V4L2_PIX_FMT_RV40:		descr = "RealVideo 9 & 10"; break;
>> -		case V4L2_PIX_FMT_CPIA1:	descr = "GSPCA CPiA YUV"; break;
>> -		case V4L2_PIX_FMT_WNVA:		descr = "WNVA"; break;
>> -		case V4L2_PIX_FMT_SN9C10X:	descr = "GSPCA SN9C10X"; break;
>> -		case V4L2_PIX_FMT_PWC1:		descr = "Raw Philips Webcam Type (Old)"; break;
>> -		case V4L2_PIX_FMT_PWC2:		descr = "Raw Philips Webcam Type (New)"; break;
>> -		case V4L2_PIX_FMT_ET61X251:	descr = "GSPCA ET61X251"; break;
>> -		case V4L2_PIX_FMT_SPCA561:	descr = "GSPCA SPCA561"; break;
>> -		case V4L2_PIX_FMT_PAC207:	descr = "GSPCA PAC207"; break;
>> +		case V4L2_PIX_FMT_MPEG:		descr = "MPEG-1/2/4"; break;
>>  		case V4L2_PIX_FMT_MR97310A:	descr = "GSPCA MR97310A"; break;
>> -		case V4L2_PIX_FMT_JL2005BCD:	descr = "GSPCA JL2005BCD"; break;
>> -		case V4L2_PIX_FMT_SN9C2028:	descr = "GSPCA SN9C2028"; break;
>> -		case V4L2_PIX_FMT_SQ905C:	descr = "GSPCA SQ905C"; break;
>> -		case V4L2_PIX_FMT_PJPG:		descr = "GSPCA PJPG"; break;
>> +		case V4L2_PIX_FMT_MT2110R:	descr = "Mediatek 10bit Raster Mode"; break;
>> +		case V4L2_PIX_FMT_MT2110T:	descr = "Mediatek 10bit Tile Mode"; break;
>> +		case V4L2_PIX_FMT_MT21C:	descr = "Mediatek Compressed Format"; break;
>>  		case V4L2_PIX_FMT_OV511:	descr = "GSPCA OV511"; break;
>>  		case V4L2_PIX_FMT_OV518:	descr = "GSPCA OV518"; break;
>> -		case V4L2_PIX_FMT_JPGL:		descr = "JPEG Lite"; break;
>> -		case V4L2_PIX_FMT_SE401:	descr = "GSPCA SE401"; break;
>> -		case V4L2_PIX_FMT_S5C_UYVY_JPG:	descr = "S5C73MX interleaved UYVY/JPEG"; break;
>> -		case V4L2_PIX_FMT_MT21C:	descr = "Mediatek Compressed Format"; break;
>> -		case V4L2_PIX_FMT_QC08C:	descr = "QCOM Compressed 8-bit Format"; break;
>> -		case V4L2_PIX_FMT_QC10C:	descr = "QCOM Compressed 10-bit Format"; break;
>> -		case V4L2_PIX_FMT_AJPG:		descr = "Aspeed JPEG"; break;
>> -		case V4L2_PIX_FMT_AV1_FRAME:	descr = "AV1 Frame"; break;
>> -		case V4L2_PIX_FMT_MT2110T:	descr = "Mediatek 10bit Tile Mode"; break;
>> -		case V4L2_PIX_FMT_MT2110R:	descr = "Mediatek 10bit Raster Mode"; break;
>> -		case V4L2_PIX_FMT_HEXTILE:	descr = "Hextile Compressed Format"; break;
>> -		case V4L2_PIX_FMT_PISP_COMP1_RGGB: descr = "PiSP 8b RGRG/GBGB mode1 compr"; break;
>> -		case V4L2_PIX_FMT_PISP_COMP1_GRBG: descr = "PiSP 8b GRGR/BGBG mode1 compr"; break;
>> -		case V4L2_PIX_FMT_PISP_COMP1_GBRG: descr = "PiSP 8b GBGB/RGRG mode1 compr"; break;
>> +		case V4L2_PIX_FMT_PAC207:	descr = "GSPCA PAC207"; break;
>>  		case V4L2_PIX_FMT_PISP_COMP1_BGGR: descr = "PiSP 8b BGBG/GRGR mode1 compr"; break;
>> +		case V4L2_PIX_FMT_PISP_COMP1_GBRG: descr = "PiSP 8b GBGB/RGRG mode1 compr"; break;
>> +		case V4L2_PIX_FMT_PISP_COMP1_GRBG: descr = "PiSP 8b GRGR/BGBG mode1 compr"; break;
>>  		case V4L2_PIX_FMT_PISP_COMP1_MONO: descr = "PiSP 8b monochrome mode1 compr"; break;
>> -		case V4L2_PIX_FMT_PISP_COMP2_RGGB: descr = "PiSP 8b RGRG/GBGB mode2 compr"; break;
>> -		case V4L2_PIX_FMT_PISP_COMP2_GRBG: descr = "PiSP 8b GRGR/BGBG mode2 compr"; break;
>> -		case V4L2_PIX_FMT_PISP_COMP2_GBRG: descr = "PiSP 8b GBGB/RGRG mode2 compr"; break;
>> +		case V4L2_PIX_FMT_PISP_COMP1_RGGB: descr = "PiSP 8b RGRG/GBGB mode1 compr"; break;
>>  		case V4L2_PIX_FMT_PISP_COMP2_BGGR: descr = "PiSP 8b BGBG/GRGR mode2 compr"; break;
>> +		case V4L2_PIX_FMT_PISP_COMP2_GBRG: descr = "PiSP 8b GBGB/RGRG mode2 compr"; break;
>> +		case V4L2_PIX_FMT_PISP_COMP2_GRBG: descr = "PiSP 8b GRGR/BGBG mode2 compr"; break;
>>  		case V4L2_PIX_FMT_PISP_COMP2_MONO: descr = "PiSP 8b monochrome mode2 compr"; break;
>> +		case V4L2_PIX_FMT_PISP_COMP2_RGGB: descr = "PiSP 8b RGRG/GBGB mode2 compr"; break;
>> +		case V4L2_PIX_FMT_PJPG:		descr = "GSPCA PJPG"; break;
>> +		case V4L2_PIX_FMT_PWC1:		descr = "Raw Philips Webcam Type (Old)"; break;
>> +		case V4L2_PIX_FMT_PWC2:		descr = "Raw Philips Webcam Type (New)"; break;
>> +		case V4L2_PIX_FMT_QC08C:	descr = "QCOM Compressed 8-bit Format"; break;
>> +		case V4L2_PIX_FMT_QC10C:	descr = "QCOM Compressed 10-bit Format"; break;
>> +		case V4L2_PIX_FMT_RV30:		descr = "RealVideo 8"; break;
>> +		case V4L2_PIX_FMT_RV40:		descr = "RealVideo 9 & 10"; break;
>> +		case V4L2_PIX_FMT_S5C_UYVY_JPG:	descr = "S5C73MX interleaved UYVY/JPEG"; break;
>> +		case V4L2_PIX_FMT_SE401:	descr = "GSPCA SE401"; break;
>> +		case V4L2_PIX_FMT_SN9C10X:	descr = "GSPCA SN9C10X"; break;
>> +		case V4L2_PIX_FMT_SN9C2028:	descr = "GSPCA SN9C2028"; break;
>> +		case V4L2_PIX_FMT_SPCA561:	descr = "GSPCA SPCA561"; break;
>> +		case V4L2_PIX_FMT_SPK:		descr = "Sorenson Spark"; break;
>> +		case V4L2_PIX_FMT_SQ905C:	descr = "GSPCA SQ905C"; break;
>> +		case V4L2_PIX_FMT_VC1_ANNEX_G:	descr = "VC-1 (SMPTE 412M Annex G)"; break;
>> +		case V4L2_PIX_FMT_VC1_ANNEX_L:	descr = "VC-1 (SMPTE 412M Annex L)"; break;
>> +		case V4L2_PIX_FMT_VP8:		descr = "VP8"; break;
>> +		case V4L2_PIX_FMT_VP8_FRAME:    descr = "VP8 Frame"; break;
>> +		case V4L2_PIX_FMT_VP9:		descr = "VP9"; break;
>> +		case V4L2_PIX_FMT_VP9_FRAME:    descr = "VP9 Frame"; break;
>> +		case V4L2_PIX_FMT_WNVA:		descr = "WNVA"; break;
>> +		case V4L2_PIX_FMT_XVID:		descr = "Xvid"; break;
>> +		/* keep-sorted end */
>>  		default:
>>  			if (fmt->description[0])
>>  				return;
>> @@ -2883,117 +2889,121 @@ struct v4l2_ioctl_info {
>>  		.debug = _debug,				\
>>  	}
>>  
>> -DEFINE_V4L_STUB_FUNC(g_fbuf)
>> +/* keep-sorted start */
>> +DEFINE_V4L_STUB_FUNC(decoder_cmd)
>> +DEFINE_V4L_STUB_FUNC(dv_timings_cap)
>> +DEFINE_V4L_STUB_FUNC(encoder_cmd)
>> +DEFINE_V4L_STUB_FUNC(enum_dv_timings)
>> +DEFINE_V4L_STUB_FUNC(enum_frameintervals)
>> +DEFINE_V4L_STUB_FUNC(enum_framesizes)
>> +DEFINE_V4L_STUB_FUNC(enumaudio)
>> +DEFINE_V4L_STUB_FUNC(enumaudout)
>>  DEFINE_V4L_STUB_FUNC(expbuf)
>> -DEFINE_V4L_STUB_FUNC(g_std)
>>  DEFINE_V4L_STUB_FUNC(g_audio)
>> -DEFINE_V4L_STUB_FUNC(s_audio)
>> -DEFINE_V4L_STUB_FUNC(g_edid)
>> -DEFINE_V4L_STUB_FUNC(s_edid)
>>  DEFINE_V4L_STUB_FUNC(g_audout)
>> -DEFINE_V4L_STUB_FUNC(s_audout)
>> +DEFINE_V4L_STUB_FUNC(g_dv_timings)
>> +DEFINE_V4L_STUB_FUNC(g_edid)
>> +DEFINE_V4L_STUB_FUNC(g_enc_index)
>> +DEFINE_V4L_STUB_FUNC(g_fbuf)
>>  DEFINE_V4L_STUB_FUNC(g_jpegcomp)
>> +DEFINE_V4L_STUB_FUNC(g_std)
>> +DEFINE_V4L_STUB_FUNC(query_dv_timings)
>> +DEFINE_V4L_STUB_FUNC(s_audio)
>> +DEFINE_V4L_STUB_FUNC(s_audout)
>> +DEFINE_V4L_STUB_FUNC(s_dv_timings)
>> +DEFINE_V4L_STUB_FUNC(s_edid)
>>  DEFINE_V4L_STUB_FUNC(s_jpegcomp)
>> -DEFINE_V4L_STUB_FUNC(enumaudio)
>> -DEFINE_V4L_STUB_FUNC(enumaudout)
>> -DEFINE_V4L_STUB_FUNC(enum_framesizes)
>> -DEFINE_V4L_STUB_FUNC(enum_frameintervals)
>> -DEFINE_V4L_STUB_FUNC(g_enc_index)
>> -DEFINE_V4L_STUB_FUNC(encoder_cmd)
>> -DEFINE_V4L_STUB_FUNC(try_encoder_cmd)
>> -DEFINE_V4L_STUB_FUNC(decoder_cmd)
>>  DEFINE_V4L_STUB_FUNC(try_decoder_cmd)
>> -DEFINE_V4L_STUB_FUNC(s_dv_timings)
>> -DEFINE_V4L_STUB_FUNC(g_dv_timings)
>> -DEFINE_V4L_STUB_FUNC(enum_dv_timings)
>> -DEFINE_V4L_STUB_FUNC(query_dv_timings)
>> -DEFINE_V4L_STUB_FUNC(dv_timings_cap)
>> +DEFINE_V4L_STUB_FUNC(try_encoder_cmd)

Ditto. No need to keep this sorted.

>> +/* keep-sorted end */
>>  
>>  static const struct v4l2_ioctl_info v4l2_ioctls[] = {
>> -	IOCTL_INFO(VIDIOC_QUERYCAP, v4l_querycap, v4l_print_querycap, 0),
>> -	IOCTL_INFO(VIDIOC_ENUM_FMT, v4l_enum_fmt, v4l_print_fmtdesc, 0),
>> -	IOCTL_INFO(VIDIOC_G_FMT, v4l_g_fmt, v4l_print_format, 0),
>> -	IOCTL_INFO(VIDIOC_S_FMT, v4l_s_fmt, v4l_print_format, INFO_FL_PRIO),
>> -	IOCTL_INFO(VIDIOC_REQBUFS, v4l_reqbufs, v4l_print_requestbuffers, INFO_FL_PRIO | INFO_FL_QUEUE),
>> -	IOCTL_INFO(VIDIOC_QUERYBUF, v4l_querybuf, v4l_print_buffer, INFO_FL_QUEUE | INFO_FL_CLEAR(v4l2_buffer, length)),
>> -	IOCTL_INFO(VIDIOC_G_FBUF, v4l_stub_g_fbuf, v4l_print_framebuffer, 0),
>> -	IOCTL_INFO(VIDIOC_S_FBUF, v4l_s_fbuf, v4l_print_framebuffer, INFO_FL_PRIO),
>> -	IOCTL_INFO(VIDIOC_OVERLAY, v4l_overlay, v4l_print_u32, INFO_FL_PRIO),
>> -	IOCTL_INFO(VIDIOC_QBUF, v4l_qbuf, v4l_print_buffer, INFO_FL_QUEUE),
>> -	IOCTL_INFO(VIDIOC_EXPBUF, v4l_stub_expbuf, v4l_print_exportbuffer, INFO_FL_QUEUE | INFO_FL_CLEAR(v4l2_exportbuffer, flags)),
>> +	/* keep-sorted start */
>> +	IOCTL_INFO(VIDIOC_CREATE_BUFS, v4l_create_bufs, v4l_print_create_buffers, INFO_FL_PRIO | INFO_FL_QUEUE),
>> +	IOCTL_INFO(VIDIOC_CROPCAP, v4l_cropcap, v4l_print_cropcap, INFO_FL_CLEAR(v4l2_cropcap, type)),
>> +	IOCTL_INFO(VIDIOC_DBG_G_CHIP_INFO, v4l_dbg_g_chip_info, v4l_print_dbg_chip_info, INFO_FL_CLEAR(v4l2_dbg_chip_info, match)),
>> +	IOCTL_INFO(VIDIOC_DBG_G_REGISTER, v4l_dbg_g_register, v4l_print_dbg_register, 0),
>> +	IOCTL_INFO(VIDIOC_DBG_S_REGISTER, v4l_dbg_s_register, v4l_print_dbg_register, 0),
>> +	IOCTL_INFO(VIDIOC_DECODER_CMD, v4l_stub_decoder_cmd, v4l_print_decoder_cmd, INFO_FL_PRIO),
>>  	IOCTL_INFO(VIDIOC_DQBUF, v4l_dqbuf, v4l_print_buffer, INFO_FL_QUEUE),
>> -	IOCTL_INFO(VIDIOC_STREAMON, v4l_streamon, v4l_print_buftype, INFO_FL_PRIO | INFO_FL_QUEUE),
>> -	IOCTL_INFO(VIDIOC_STREAMOFF, v4l_streamoff, v4l_print_buftype, INFO_FL_PRIO | INFO_FL_QUEUE),
>> -	IOCTL_INFO(VIDIOC_G_PARM, v4l_g_parm, v4l_print_streamparm, INFO_FL_CLEAR(v4l2_streamparm, type)),
>> -	IOCTL_INFO(VIDIOC_S_PARM, v4l_s_parm, v4l_print_streamparm, INFO_FL_PRIO),
>> -	IOCTL_INFO(VIDIOC_G_STD, v4l_stub_g_std, v4l_print_std, 0),
>> -	IOCTL_INFO(VIDIOC_S_STD, v4l_s_std, v4l_print_std, INFO_FL_PRIO),
>> -	IOCTL_INFO(VIDIOC_ENUMSTD, v4l_enumstd, v4l_print_standard, INFO_FL_CLEAR(v4l2_standard, index)),
>> +	IOCTL_INFO(VIDIOC_DQEVENT, v4l_dqevent, v4l_print_event, 0),
>> +	IOCTL_INFO(VIDIOC_DV_TIMINGS_CAP, v4l_stub_dv_timings_cap, v4l_print_dv_timings_cap, INFO_FL_CLEAR(v4l2_dv_timings_cap, pad)),
>> +	IOCTL_INFO(VIDIOC_ENCODER_CMD, v4l_stub_encoder_cmd, v4l_print_encoder_cmd, INFO_FL_PRIO | INFO_FL_CLEAR(v4l2_encoder_cmd, flags)),
>> +	IOCTL_INFO(VIDIOC_ENUMAUDIO, v4l_stub_enumaudio, v4l_print_audio, INFO_FL_CLEAR(v4l2_audio, index)),
>> +	IOCTL_INFO(VIDIOC_ENUMAUDOUT, v4l_stub_enumaudout, v4l_print_audioout, INFO_FL_CLEAR(v4l2_audioout, index)),
>>  	IOCTL_INFO(VIDIOC_ENUMINPUT, v4l_enuminput, v4l_print_enuminput, INFO_FL_CLEAR(v4l2_input, index)),
>> -	IOCTL_INFO(VIDIOC_G_CTRL, v4l_g_ctrl, v4l_print_control, INFO_FL_CTRL | INFO_FL_CLEAR(v4l2_control, id)),
>> -	IOCTL_INFO(VIDIOC_S_CTRL, v4l_s_ctrl, v4l_print_control, INFO_FL_PRIO | INFO_FL_CTRL),
>> -	IOCTL_INFO(VIDIOC_G_TUNER, v4l_g_tuner, v4l_print_tuner, INFO_FL_CLEAR(v4l2_tuner, index)),
>> -	IOCTL_INFO(VIDIOC_S_TUNER, v4l_s_tuner, v4l_print_tuner, INFO_FL_PRIO),
>> -	IOCTL_INFO(VIDIOC_G_AUDIO, v4l_stub_g_audio, v4l_print_audio, 0),
>> -	IOCTL_INFO(VIDIOC_S_AUDIO, v4l_stub_s_audio, v4l_print_audio, INFO_FL_PRIO),
>> -	IOCTL_INFO(VIDIOC_QUERYCTRL, v4l_queryctrl, v4l_print_queryctrl, INFO_FL_CTRL | INFO_FL_CLEAR(v4l2_queryctrl, id)),
>> -	IOCTL_INFO(VIDIOC_QUERYMENU, v4l_querymenu, v4l_print_querymenu, INFO_FL_CTRL | INFO_FL_CLEAR(v4l2_querymenu, index)),
>> -	IOCTL_INFO(VIDIOC_G_INPUT, v4l_g_input, v4l_print_u32, 0),
>> -	IOCTL_INFO(VIDIOC_S_INPUT, v4l_s_input, v4l_print_u32, INFO_FL_PRIO),
>> -	IOCTL_INFO(VIDIOC_G_EDID, v4l_stub_g_edid, v4l_print_edid, INFO_FL_ALWAYS_COPY),
>> -	IOCTL_INFO(VIDIOC_S_EDID, v4l_stub_s_edid, v4l_print_edid, INFO_FL_PRIO | INFO_FL_ALWAYS_COPY),
>> -	IOCTL_INFO(VIDIOC_G_OUTPUT, v4l_g_output, v4l_print_u32, 0),
>> -	IOCTL_INFO(VIDIOC_S_OUTPUT, v4l_s_output, v4l_print_u32, INFO_FL_PRIO),
>>  	IOCTL_INFO(VIDIOC_ENUMOUTPUT, v4l_enumoutput, v4l_print_enumoutput, INFO_FL_CLEAR(v4l2_output, index)),
>> +	IOCTL_INFO(VIDIOC_ENUMSTD, v4l_enumstd, v4l_print_standard, INFO_FL_CLEAR(v4l2_standard, index)),
>> +	IOCTL_INFO(VIDIOC_ENUM_DV_TIMINGS, v4l_stub_enum_dv_timings, v4l_print_enum_dv_timings, INFO_FL_CLEAR(v4l2_enum_dv_timings, pad)),
>> +	IOCTL_INFO(VIDIOC_ENUM_FMT, v4l_enum_fmt, v4l_print_fmtdesc, 0),
>> +	IOCTL_INFO(VIDIOC_ENUM_FRAMEINTERVALS, v4l_stub_enum_frameintervals, v4l_print_frmivalenum, INFO_FL_CLEAR(v4l2_frmivalenum, height)),
>> +	IOCTL_INFO(VIDIOC_ENUM_FRAMESIZES, v4l_stub_enum_framesizes, v4l_print_frmsizeenum, INFO_FL_CLEAR(v4l2_frmsizeenum, pixel_format)),
>> +	IOCTL_INFO(VIDIOC_ENUM_FREQ_BANDS, v4l_enum_freq_bands, v4l_print_freq_band, 0),
>> +	IOCTL_INFO(VIDIOC_EXPBUF, v4l_stub_expbuf, v4l_print_exportbuffer, INFO_FL_QUEUE | INFO_FL_CLEAR(v4l2_exportbuffer, flags)),
>> +	IOCTL_INFO(VIDIOC_G_AUDIO, v4l_stub_g_audio, v4l_print_audio, 0),
>>  	IOCTL_INFO(VIDIOC_G_AUDOUT, v4l_stub_g_audout, v4l_print_audioout, 0),
>> -	IOCTL_INFO(VIDIOC_S_AUDOUT, v4l_stub_s_audout, v4l_print_audioout, INFO_FL_PRIO),
>> -	IOCTL_INFO(VIDIOC_G_MODULATOR, v4l_g_modulator, v4l_print_modulator, INFO_FL_CLEAR(v4l2_modulator, index)),
>> -	IOCTL_INFO(VIDIOC_S_MODULATOR, v4l_s_modulator, v4l_print_modulator, INFO_FL_PRIO),
>> -	IOCTL_INFO(VIDIOC_G_FREQUENCY, v4l_g_frequency, v4l_print_frequency, INFO_FL_CLEAR(v4l2_frequency, tuner)),
>> -	IOCTL_INFO(VIDIOC_S_FREQUENCY, v4l_s_frequency, v4l_print_frequency, INFO_FL_PRIO),
>> -	IOCTL_INFO(VIDIOC_CROPCAP, v4l_cropcap, v4l_print_cropcap, INFO_FL_CLEAR(v4l2_cropcap, type)),
>>  	IOCTL_INFO(VIDIOC_G_CROP, v4l_g_crop, v4l_print_crop, INFO_FL_CLEAR(v4l2_crop, type)),
>> -	IOCTL_INFO(VIDIOC_S_CROP, v4l_s_crop, v4l_print_crop, INFO_FL_PRIO),
>> -	IOCTL_INFO(VIDIOC_G_SELECTION, v4l_g_selection, v4l_print_selection, INFO_FL_CLEAR(v4l2_selection, r)),
>> -	IOCTL_INFO(VIDIOC_S_SELECTION, v4l_s_selection, v4l_print_selection, INFO_FL_PRIO | INFO_FL_CLEAR(v4l2_selection, r)),
>> +	IOCTL_INFO(VIDIOC_G_CTRL, v4l_g_ctrl, v4l_print_control, INFO_FL_CTRL | INFO_FL_CLEAR(v4l2_control, id)),
>> +	IOCTL_INFO(VIDIOC_G_DV_TIMINGS, v4l_stub_g_dv_timings, v4l_print_dv_timings, 0),
>> +	IOCTL_INFO(VIDIOC_G_EDID, v4l_stub_g_edid, v4l_print_edid, INFO_FL_ALWAYS_COPY),
>> +	IOCTL_INFO(VIDIOC_G_ENC_INDEX, v4l_stub_g_enc_index, v4l_print_enc_idx, 0),
>> +	IOCTL_INFO(VIDIOC_G_EXT_CTRLS, v4l_g_ext_ctrls, v4l_print_ext_controls, INFO_FL_CTRL | INFO_FL_ALWAYS_COPY),
>> +	IOCTL_INFO(VIDIOC_G_FBUF, v4l_stub_g_fbuf, v4l_print_framebuffer, 0),
>> +	IOCTL_INFO(VIDIOC_G_FMT, v4l_g_fmt, v4l_print_format, 0),
>> +	IOCTL_INFO(VIDIOC_G_FREQUENCY, v4l_g_frequency, v4l_print_frequency, INFO_FL_CLEAR(v4l2_frequency, tuner)),
>> +	IOCTL_INFO(VIDIOC_G_INPUT, v4l_g_input, v4l_print_u32, 0),
>>  	IOCTL_INFO(VIDIOC_G_JPEGCOMP, v4l_stub_g_jpegcomp, v4l_print_jpegcompression, 0),
>> -	IOCTL_INFO(VIDIOC_S_JPEGCOMP, v4l_stub_s_jpegcomp, v4l_print_jpegcompression, INFO_FL_PRIO),
>> -	IOCTL_INFO(VIDIOC_QUERYSTD, v4l_querystd, v4l_print_std, 0),
>> -	IOCTL_INFO(VIDIOC_TRY_FMT, v4l_try_fmt, v4l_print_format, 0),
>> -	IOCTL_INFO(VIDIOC_ENUMAUDIO, v4l_stub_enumaudio, v4l_print_audio, INFO_FL_CLEAR(v4l2_audio, index)),
>> -	IOCTL_INFO(VIDIOC_ENUMAUDOUT, v4l_stub_enumaudout, v4l_print_audioout, INFO_FL_CLEAR(v4l2_audioout, index)),
>> +	IOCTL_INFO(VIDIOC_G_MODULATOR, v4l_g_modulator, v4l_print_modulator, INFO_FL_CLEAR(v4l2_modulator, index)),
>> +	IOCTL_INFO(VIDIOC_G_OUTPUT, v4l_g_output, v4l_print_u32, 0),
>> +	IOCTL_INFO(VIDIOC_G_PARM, v4l_g_parm, v4l_print_streamparm, INFO_FL_CLEAR(v4l2_streamparm, type)),
>>  	IOCTL_INFO(VIDIOC_G_PRIORITY, v4l_g_priority, v4l_print_u32, 0),
>> -	IOCTL_INFO(VIDIOC_S_PRIORITY, v4l_s_priority, v4l_print_u32, INFO_FL_PRIO),
>> +	IOCTL_INFO(VIDIOC_G_SELECTION, v4l_g_selection, v4l_print_selection, INFO_FL_CLEAR(v4l2_selection, r)),
>>  	IOCTL_INFO(VIDIOC_G_SLICED_VBI_CAP, v4l_g_sliced_vbi_cap, v4l_print_sliced_vbi_cap, INFO_FL_CLEAR(v4l2_sliced_vbi_cap, type)),
>> +	IOCTL_INFO(VIDIOC_G_STD, v4l_stub_g_std, v4l_print_std, 0),
>> +	IOCTL_INFO(VIDIOC_G_TUNER, v4l_g_tuner, v4l_print_tuner, INFO_FL_CLEAR(v4l2_tuner, index)),
>>  	IOCTL_INFO(VIDIOC_LOG_STATUS, v4l_log_status, v4l_print_newline, 0),
>> -	IOCTL_INFO(VIDIOC_G_EXT_CTRLS, v4l_g_ext_ctrls, v4l_print_ext_controls, INFO_FL_CTRL | INFO_FL_ALWAYS_COPY),
>> -	IOCTL_INFO(VIDIOC_S_EXT_CTRLS, v4l_s_ext_ctrls, v4l_print_ext_controls, INFO_FL_PRIO | INFO_FL_CTRL | INFO_FL_ALWAYS_COPY),
>> -	IOCTL_INFO(VIDIOC_TRY_EXT_CTRLS, v4l_try_ext_ctrls, v4l_print_ext_controls, INFO_FL_CTRL | INFO_FL_ALWAYS_COPY),
>> -	IOCTL_INFO(VIDIOC_ENUM_FRAMESIZES, v4l_stub_enum_framesizes, v4l_print_frmsizeenum, INFO_FL_CLEAR(v4l2_frmsizeenum, pixel_format)),
>> -	IOCTL_INFO(VIDIOC_ENUM_FRAMEINTERVALS, v4l_stub_enum_frameintervals, v4l_print_frmivalenum, INFO_FL_CLEAR(v4l2_frmivalenum, height)),
>> -	IOCTL_INFO(VIDIOC_G_ENC_INDEX, v4l_stub_g_enc_index, v4l_print_enc_idx, 0),
>> -	IOCTL_INFO(VIDIOC_ENCODER_CMD, v4l_stub_encoder_cmd, v4l_print_encoder_cmd, INFO_FL_PRIO | INFO_FL_CLEAR(v4l2_encoder_cmd, flags)),
>> -	IOCTL_INFO(VIDIOC_TRY_ENCODER_CMD, v4l_stub_try_encoder_cmd, v4l_print_encoder_cmd, INFO_FL_CLEAR(v4l2_encoder_cmd, flags)),
>> -	IOCTL_INFO(VIDIOC_DECODER_CMD, v4l_stub_decoder_cmd, v4l_print_decoder_cmd, INFO_FL_PRIO),
>> -	IOCTL_INFO(VIDIOC_TRY_DECODER_CMD, v4l_stub_try_decoder_cmd, v4l_print_decoder_cmd, 0),
>> -	IOCTL_INFO(VIDIOC_DBG_S_REGISTER, v4l_dbg_s_register, v4l_print_dbg_register, 0),
>> -	IOCTL_INFO(VIDIOC_DBG_G_REGISTER, v4l_dbg_g_register, v4l_print_dbg_register, 0),
>> -	IOCTL_INFO(VIDIOC_S_HW_FREQ_SEEK, v4l_s_hw_freq_seek, v4l_print_hw_freq_seek, INFO_FL_PRIO),
>> -	IOCTL_INFO(VIDIOC_S_DV_TIMINGS, v4l_stub_s_dv_timings, v4l_print_dv_timings, INFO_FL_PRIO | INFO_FL_CLEAR(v4l2_dv_timings, bt.flags)),
>> -	IOCTL_INFO(VIDIOC_G_DV_TIMINGS, v4l_stub_g_dv_timings, v4l_print_dv_timings, 0),
>> -	IOCTL_INFO(VIDIOC_DQEVENT, v4l_dqevent, v4l_print_event, 0),
>> -	IOCTL_INFO(VIDIOC_SUBSCRIBE_EVENT, v4l_subscribe_event, v4l_print_event_subscription, 0),
>> -	IOCTL_INFO(VIDIOC_UNSUBSCRIBE_EVENT, v4l_unsubscribe_event, v4l_print_event_subscription, 0),
>> -	IOCTL_INFO(VIDIOC_CREATE_BUFS, v4l_create_bufs, v4l_print_create_buffers, INFO_FL_PRIO | INFO_FL_QUEUE),
>> +	IOCTL_INFO(VIDIOC_OVERLAY, v4l_overlay, v4l_print_u32, INFO_FL_PRIO),
>>  	IOCTL_INFO(VIDIOC_PREPARE_BUF, v4l_prepare_buf, v4l_print_buffer, INFO_FL_QUEUE),
>> -	IOCTL_INFO(VIDIOC_ENUM_DV_TIMINGS, v4l_stub_enum_dv_timings, v4l_print_enum_dv_timings, INFO_FL_CLEAR(v4l2_enum_dv_timings, pad)),
>> +	IOCTL_INFO(VIDIOC_QBUF, v4l_qbuf, v4l_print_buffer, INFO_FL_QUEUE),
>> +	IOCTL_INFO(VIDIOC_QUERYBUF, v4l_querybuf, v4l_print_buffer, INFO_FL_QUEUE | INFO_FL_CLEAR(v4l2_buffer, length)),
>> +	IOCTL_INFO(VIDIOC_QUERYCAP, v4l_querycap, v4l_print_querycap, 0),
>> +	IOCTL_INFO(VIDIOC_QUERYCTRL, v4l_queryctrl, v4l_print_queryctrl, INFO_FL_CTRL | INFO_FL_CLEAR(v4l2_queryctrl, id)),
>> +	IOCTL_INFO(VIDIOC_QUERYMENU, v4l_querymenu, v4l_print_querymenu, INFO_FL_CTRL | INFO_FL_CLEAR(v4l2_querymenu, index)),
>> +	IOCTL_INFO(VIDIOC_QUERYSTD, v4l_querystd, v4l_print_std, 0),
>>  	IOCTL_INFO(VIDIOC_QUERY_DV_TIMINGS, v4l_stub_query_dv_timings, v4l_print_dv_timings, INFO_FL_ALWAYS_COPY),
>> -	IOCTL_INFO(VIDIOC_DV_TIMINGS_CAP, v4l_stub_dv_timings_cap, v4l_print_dv_timings_cap, INFO_FL_CLEAR(v4l2_dv_timings_cap, pad)),
>> -	IOCTL_INFO(VIDIOC_ENUM_FREQ_BANDS, v4l_enum_freq_bands, v4l_print_freq_band, 0),
>> -	IOCTL_INFO(VIDIOC_DBG_G_CHIP_INFO, v4l_dbg_g_chip_info, v4l_print_dbg_chip_info, INFO_FL_CLEAR(v4l2_dbg_chip_info, match)),
>>  	IOCTL_INFO(VIDIOC_QUERY_EXT_CTRL, v4l_query_ext_ctrl, v4l_print_query_ext_ctrl, INFO_FL_CTRL | INFO_FL_CLEAR(v4l2_query_ext_ctrl, id)),
>>  	IOCTL_INFO(VIDIOC_REMOVE_BUFS, v4l_remove_bufs, v4l_print_remove_buffers, INFO_FL_PRIO | INFO_FL_QUEUE | INFO_FL_CLEAR(v4l2_remove_buffers, type)),
>> +	IOCTL_INFO(VIDIOC_REQBUFS, v4l_reqbufs, v4l_print_requestbuffers, INFO_FL_PRIO | INFO_FL_QUEUE),
>> +	IOCTL_INFO(VIDIOC_STREAMOFF, v4l_streamoff, v4l_print_buftype, INFO_FL_PRIO | INFO_FL_QUEUE),
>> +	IOCTL_INFO(VIDIOC_STREAMON, v4l_streamon, v4l_print_buftype, INFO_FL_PRIO | INFO_FL_QUEUE),
>> +	IOCTL_INFO(VIDIOC_SUBSCRIBE_EVENT, v4l_subscribe_event, v4l_print_event_subscription, 0),
>> +	IOCTL_INFO(VIDIOC_S_AUDIO, v4l_stub_s_audio, v4l_print_audio, INFO_FL_PRIO),
>> +	IOCTL_INFO(VIDIOC_S_AUDOUT, v4l_stub_s_audout, v4l_print_audioout, INFO_FL_PRIO),
>> +	IOCTL_INFO(VIDIOC_S_CROP, v4l_s_crop, v4l_print_crop, INFO_FL_PRIO),
>> +	IOCTL_INFO(VIDIOC_S_CTRL, v4l_s_ctrl, v4l_print_control, INFO_FL_PRIO | INFO_FL_CTRL),
>> +	IOCTL_INFO(VIDIOC_S_DV_TIMINGS, v4l_stub_s_dv_timings, v4l_print_dv_timings, INFO_FL_PRIO | INFO_FL_CLEAR(v4l2_dv_timings, bt.flags)),
>> +	IOCTL_INFO(VIDIOC_S_EDID, v4l_stub_s_edid, v4l_print_edid, INFO_FL_PRIO | INFO_FL_ALWAYS_COPY),
>> +	IOCTL_INFO(VIDIOC_S_EXT_CTRLS, v4l_s_ext_ctrls, v4l_print_ext_controls, INFO_FL_PRIO | INFO_FL_CTRL | INFO_FL_ALWAYS_COPY),
>> +	IOCTL_INFO(VIDIOC_S_FBUF, v4l_s_fbuf, v4l_print_framebuffer, INFO_FL_PRIO),
>> +	IOCTL_INFO(VIDIOC_S_FMT, v4l_s_fmt, v4l_print_format, INFO_FL_PRIO),
>> +	IOCTL_INFO(VIDIOC_S_FREQUENCY, v4l_s_frequency, v4l_print_frequency, INFO_FL_PRIO),
>> +	IOCTL_INFO(VIDIOC_S_HW_FREQ_SEEK, v4l_s_hw_freq_seek, v4l_print_hw_freq_seek, INFO_FL_PRIO),
>> +	IOCTL_INFO(VIDIOC_S_INPUT, v4l_s_input, v4l_print_u32, INFO_FL_PRIO),
>> +	IOCTL_INFO(VIDIOC_S_JPEGCOMP, v4l_stub_s_jpegcomp, v4l_print_jpegcompression, INFO_FL_PRIO),
>> +	IOCTL_INFO(VIDIOC_S_MODULATOR, v4l_s_modulator, v4l_print_modulator, INFO_FL_PRIO),
>> +	IOCTL_INFO(VIDIOC_S_OUTPUT, v4l_s_output, v4l_print_u32, INFO_FL_PRIO),
>> +	IOCTL_INFO(VIDIOC_S_PARM, v4l_s_parm, v4l_print_streamparm, INFO_FL_PRIO),
>> +	IOCTL_INFO(VIDIOC_S_PRIORITY, v4l_s_priority, v4l_print_u32, INFO_FL_PRIO),
>> +	IOCTL_INFO(VIDIOC_S_SELECTION, v4l_s_selection, v4l_print_selection, INFO_FL_PRIO | INFO_FL_CLEAR(v4l2_selection, r)),
>> +	IOCTL_INFO(VIDIOC_S_STD, v4l_s_std, v4l_print_std, INFO_FL_PRIO),
>> +	IOCTL_INFO(VIDIOC_S_TUNER, v4l_s_tuner, v4l_print_tuner, INFO_FL_PRIO),
>> +	IOCTL_INFO(VIDIOC_TRY_DECODER_CMD, v4l_stub_try_decoder_cmd, v4l_print_decoder_cmd, 0),
>> +	IOCTL_INFO(VIDIOC_TRY_ENCODER_CMD, v4l_stub_try_encoder_cmd, v4l_print_encoder_cmd, INFO_FL_CLEAR(v4l2_encoder_cmd, flags)),
>> +	IOCTL_INFO(VIDIOC_TRY_EXT_CTRLS, v4l_try_ext_ctrls, v4l_print_ext_controls, INFO_FL_CTRL | INFO_FL_ALWAYS_COPY),
>> +	IOCTL_INFO(VIDIOC_TRY_FMT, v4l_try_fmt, v4l_print_format, 0),
>> +	IOCTL_INFO(VIDIOC_UNSUBSCRIBE_EVENT, v4l_unsubscribe_event, v4l_print_event_subscription, 0),
> 
> This list has been arranged by IOCTL number and I think I'd keep it that
> way.

Indeed.

I'll just reject this patch, it is a bad example of trying to keep things sorted.

Regards,

	Hans

> 
>>  };
>> +	/* keep-sorted end */
>>  #define V4L2_IOCTLS ARRAY_SIZE(v4l2_ioctls)
>>  
>>  static bool v4l2_is_known_ioctl(unsigned int cmd)
>>
> 


