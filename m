Return-Path: <linux-media+bounces-24209-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C7DE9FF987
	for <lists+linux-media@lfdr.de>; Thu,  2 Jan 2025 13:53:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 35244188377B
	for <lists+linux-media@lfdr.de>; Thu,  2 Jan 2025 12:53:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE1621B0F0B;
	Thu,  2 Jan 2025 12:52:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="jByZHUAO"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54F917083E
	for <linux-media@vger.kernel.org>; Thu,  2 Jan 2025 12:52:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735822372; cv=none; b=Ci0H/UBCQDsFhZfBUl9V2sWSTAFKYzUFQRVqprGFU2Ag/sIIRz85IZbzDYOAcu575Z4AxFKl9iiYK4qWiI8uPvvSKmwVh4P3hmmvhJ92GJAH/Wg9SoX/gwMe+bj3j7vbzLCGuq7/wgcavoKRCDdLXDvNmZjC8mWZXMjceLKj0zY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735822372; c=relaxed/simple;
	bh=HsJUnV9gF/I2sO8L0s/aRm5z9x31Y1gzy5zpQ7b4VK8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YAsJmqcvZ7SHStLMd7FjoA3tA5LGG9H+cKEglw6dLpm06NNfMQUyMAxKarkIgKCZoWlwPhmEXB4Nu6N94i8zYzHHa1SzSqJS4cnC4N4HF+JxAp9dmM7Uxlpi9RkZL+Gv3pt7bh6Wqytf54wou4jW8QVVzb0ZceurSIXFrZlcUIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=jByZHUAO; arc=none smtp.client-ip=209.85.219.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-e537d9e3d75so15211763276.3
        for <linux-media@vger.kernel.org>; Thu, 02 Jan 2025 04:52:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1735822368; x=1736427168; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=yIOD8QrsWxqeqXYea09cjJQmEWGSbOI4WIbuvRZ3TRs=;
        b=jByZHUAOw5KxihhWIJQZ3Xv3NienqM0B/tw8Z5XV2hP0bloeDiIZH4H1Eh9wAbgYeY
         xYUpVA/hHxA5j8eULpDKAdWGGqGcqX/K3KJjFbRx0GUZNHYlnd0LPiLnAdOqk5qQjv25
         GTnC5o3XB5sAMZxik45JsX04thIMp3ZvHCTKZRrRvJuHUu1Az7axHDzFMwMPa4Tjrebg
         kf+p8bFLe190M7Bq/1xWNx9lzda4OzEkSqaN6yBSb2O0NYpX0W3taKb/X4pgt9YhaUP7
         w6dZ4oS4+8vATdJFdSuj0NYuGfOs5GOtwts0w8l9qZqF9nwPzHArz1HK3Tzm1eiQzyzt
         Ls6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735822368; x=1736427168;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yIOD8QrsWxqeqXYea09cjJQmEWGSbOI4WIbuvRZ3TRs=;
        b=X2UC39fBKMP8uuopsIUKBOXbtblu2b8nBvtY6m1v8mGNNpGdXqAoUqIsPky4PryTJ/
         eksVXWuZy/elsrAuIQj0zAW5kH1MZbOdkGqGseN3Haqm9TeTkX80rqkYW+9Gsw1bVmIV
         IjCOoQBpVmv0cQOg8Y1pZqavApreeyy1n7wcqODVKqK8zqqrBay6wKZ19iPxAguob+NC
         e6GKi4LoQPEfyt9vTPtUSJpLR1I9U/kPC4yNAh0LMzjukZKWOMkiLxh0WyzFL07DRSMn
         msrOabrsWsnmKYtgYLBAdouMr9kshcXqBpWvIk29Ik0JciPhuHZNBrh+KsLxXssQnWGw
         Sidg==
X-Forwarded-Encrypted: i=1; AJvYcCWSl6/WrrzKuuCo9dcAUKiHTS6X67IXuMjFfWfCVo7SCWuTrulW4mT1vJQ+tdaD56JBx2YnURoU92D0cg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxVvFU1nbHVqs2CFtA7MX3MiGOR+Ehb6a8a43udsKajxdE+fMRq
	4QSN+Ph4o2qzkvgG051E5Dryh9ehB6EuJYzLv7ow8Uf4ZhDtDdfH1z/mdFMmHiWA5Tgq4Jk6lSP
	uD4HmHdde4XFTmoQ6eArO7YQ9vq/pR7tzC0K82A==
X-Gm-Gg: ASbGncujfqN/dVHAw1NuDipMoTrOaH8iuBmfy5H91I1n9q7UoGiN77XPk/XaIOltq7+
	HMASqQ+OX05kHNP/kcAoPhNcH1Xc1Ur7VZhapYg==
X-Google-Smtp-Source: AGHT+IESytUCNtmsOTMh1dyl2/5YIAsxOS0II0sunaBnTCp+AEb+yDJmx9j2bpg20kNupv4++Vdkh4sAQQwJZ1gRz6w=
X-Received: by 2002:a05:690c:6605:b0:6ef:57f9:ec4 with SMTP id
 00721157ae682-6f3f80de947mr307485967b3.5.1735822368150; Thu, 02 Jan 2025
 04:52:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241220-media-rpi-hevc-dec-v1-0-0ebcc04ed42e@raspberrypi.com>
 <20241220-media-rpi-hevc-dec-v1-3-0ebcc04ed42e@raspberrypi.com> <d2f047cd-5c50-454f-95be-601edb79466d@collabora.com>
In-Reply-To: <d2f047cd-5c50-454f-95be-601edb79466d@collabora.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 2 Jan 2025 12:52:32 +0000
Message-ID: <CAPY8ntBNse4Dq9E49QO3ipDbb+uMipe+MuLxW_Jpszu9gQgpww@mail.gmail.com>
Subject: Re: [PATCH 3/7] media: ioctl: Add pixel formats NV12MT_COL128 and NV12MT_10_COL128
To: Robert Mader <robert.mader@collabora.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, John Cox <john.cox@raspberrypi.com>, 
	Dom Cobley <dom@raspberrypi.com>, review list <kernel-list@raspberrypi.com>, 
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, John Cox <jc@kynesim.co.uk>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

Hi Robert

Resending this reply as replying from my phone before the Christmas
break sent it as HTML :-(

On Sat, 21 Dec 2024 at 17:38, Robert Mader <robert.mader@collabora.com> wrote:
>
> Hi, thanks for the patch.
>
> On 20.12.24 17:21, Dave Stevenson wrote:
>
> Add V4L2_PIXFMT_NV12MT_COL128 and V4L2_PIXFMT_NV12MT_10_COL128
> to describe the Raspberry Pi HEVC decoder NV12 multiplanar formats.
>
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> ---
>  drivers/media/v4l2-core/v4l2-ioctl.c | 2 ++
>  include/uapi/linux/videodev2.h       | 5 +++++
>  2 files changed, 7 insertions(+)
>
> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
> index 0304daa8471d..e510e375a871 100644
> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> @@ -1377,7 +1377,9 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
>   case V4L2_PIX_FMT_NV16M: descr = "Y/UV 4:2:2 (N-C)"; break;
>   case V4L2_PIX_FMT_NV61M: descr = "Y/VU 4:2:2 (N-C)"; break;
>   case V4L2_PIX_FMT_NV12MT: descr = "Y/UV 4:2:0 (64x32 MB, N-C)"; break;
> + case V4L2_PIX_FMT_NV12MT_COL128: descr = "Y/CbCr 4:2:0 (128b cols)"; break;
>   case V4L2_PIX_FMT_NV12MT_16X16: descr = "Y/UV 4:2:0 (16x16 MB, N-C)"; break;
> + case V4L2_PIX_FMT_NV12MT_10_COL128: descr = "10-bit Y/CbCr 4:2:0 (128b cols)"; break;
>   case V4L2_PIX_FMT_P012M: descr = "12-bit Y/UV 4:2:0 (N-C)"; break;
>   case V4L2_PIX_FMT_YUV420M: descr = "Planar YUV 4:2:0 (N-C)"; break;
>   case V4L2_PIX_FMT_YVU420M: descr = "Planar YVU 4:2:0 (N-C)"; break;
> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> index e7c4dce39007..f8f97aa6a616 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -687,6 +687,11 @@ struct v4l2_pix_format {
>  #define V4L2_PIX_FMT_NV12MT_16X16 v4l2_fourcc('V', 'M', '1', '2') /* 12  Y/CbCr 4:2:0 16x16 tiles */
>  #define V4L2_PIX_FMT_NV12M_8L128      v4l2_fourcc('N', 'A', '1', '2') /* Y/CbCr 4:2:0 8x128 tiles */
>  #define V4L2_PIX_FMT_NV12M_10BE_8L128 v4l2_fourcc_be('N', 'T', '1', '2') /* Y/CbCr 4:2:0 10-bit 8x128 tiles */
> +#define V4L2_PIX_FMT_NV12MT_COL128 v4l2_fourcc('N', 'c', '1', '2') /* 12  Y/CbCr 4:2:0 128 pixel wide column */
> +#define V4L2_PIX_FMT_NV12MT_10_COL128 v4l2_fourcc('N', 'c', '3', '0')
>
> Should these be upper-case Cs instead? So they compatible with the previously used downstream values?

No, this is deliberate.

Downstream was using a single planar format, with extra complexity for
determining the chroma offset per column, and weird handling required
on bytesperline.
Having had discussions, switching to a multiplanar format (hence MT in
the name) removes those complexities and means we don't need to do
anything weird in the v4l2 format definitions.

Reusing NC12 and NC30 fourccs will give us grief over backwards
compatibility, hence lower case for the new version.

I have a patch on [1] that adds back in NC12 and NC30 for downstream
just so we don't break existing users, but see no point in upstreaming
that.

> P.S.: Coincidentally Gstreamer just landed support for NC12 in https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/7355 and there is also a link to experimental NC30 patches. So happy to see this series appear upstream :)

Ooh, nice. I'll give it a test when I'm back in the office.

Dave

[1] https://github.com/6by9/linux/commits/rpi-6.12.y-hevc_dec/

> + /* Y/CbCr 4:2:0 10bpc, 3x10 packed as 4 bytes in
> + * a 128 bytes / 96 pixel wide column */
> +
>
>  /* Bayer formats - see http://www.siliconimaging.com/RGB%20Bayer.htm */
>  #define V4L2_PIX_FMT_SBGGR8  v4l2_fourcc('B', 'A', '8', '1') /*  8  BGBG.. GRGR.. */
>

