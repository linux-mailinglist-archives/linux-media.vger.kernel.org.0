Return-Path: <linux-media+bounces-34420-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E2911AD355E
	for <lists+linux-media@lfdr.de>; Tue, 10 Jun 2025 13:57:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 962A11895B65
	for <lists+linux-media@lfdr.de>; Tue, 10 Jun 2025 11:57:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6DA122ACDA;
	Tue, 10 Jun 2025 11:57:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="DMb5MvGw"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E90322A4CB
	for <linux-media@vger.kernel.org>; Tue, 10 Jun 2025 11:57:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749556636; cv=none; b=HS6dD4YcOgmJrMSs/PDwQ2I7T2jknBr7P/KyP6xWQdkgl4SYbE62coO+NlBfTFSM9/x3sQI1gxGIRmJpjGDJYM5QiQFHgl8Td0+zO3EcCLyAoHZH50BKu0EEC+0MZAu/Pi+wGQyrruMtF4alyhaMJ4VlS1IM9x2ac4y22X/oouo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749556636; c=relaxed/simple;
	bh=R5hMVUdxv7mmadRyb20lK91NAt+iped7miHemtSgS4o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ON3YecgJRS9DW+dxj0YmjaT/1qqBpA63BSWbbqR5Jm3p8WfNWTsLJkRwJ9seqTU1QV3NQRdeHbspuscN0g3L9f0H1bHhjYd+m8HgsN9rBzEQGb9zUuv2XBHINS4g+REOTiMvEBiE6jgUETpUlvtZSRcpKWib4puqf6wZXmueoZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=DMb5MvGw; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-54e7967cf67so5642758e87.0
        for <linux-media@vger.kernel.org>; Tue, 10 Jun 2025 04:57:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1749556632; x=1750161432; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=K11hm5KsEhFuzQMV0vnk5vTeN00HudABkfMVc/rVIOw=;
        b=DMb5MvGw2xBxBR5YuaWjR3cZ7GDYkX5Q7lMXYU48+MMByD5U0dhJJArbZiq3mmyquV
         hsqi3/FifQC2oYjQS3NyVLp1l/9MRsA46VI6mGNhQYFcA97gKQbl70rTQoh/hE4vE8ft
         c5SkYaEnfT4eBS9Y5Js7nqqYC0kSHqvIWirVo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749556632; x=1750161432;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K11hm5KsEhFuzQMV0vnk5vTeN00HudABkfMVc/rVIOw=;
        b=bIp/3PG1LhJvOl4c1PxZjWGJoB57WA783NPz4jOZyA+WdmC/9qHf1Fxp0l+Q2IWYmU
         fITHtDsVqt1Rt8nEOsIfyjqUw/I0C3WIksEigQcz/bda/yQA33owWNFtgiFQV71enh6z
         lOvDBV0SvVcYyJWtf8ldvLpBWW7NaLWl2ap79Htu6ow2Y0MPw1rQ0S0wk8F82+OWmCw7
         wmHQnnfpShUvLuyaemvb7ll9fsMMq7zHGz2EDRPjKGpVM5kYt6z3S/Y1ClIGIq8U+FOv
         gwYu0LDz2UV52KEQhsnTfYV/2Q8suPLpLkmk9JldsVd5ihUKfrxOaq46XI8zHYgnTNYG
         TcKQ==
X-Forwarded-Encrypted: i=1; AJvYcCWmNYpiLIXxre+aKfCT58hhcLVgrESw9EPcPvpGU7lL0xUI1B2Ym6P91qQEqQpLXitQSV5qSq/KaTMh5g==@vger.kernel.org
X-Gm-Message-State: AOJu0YwkVSfsmrah9/rpw/uel+T0ECkge8OGBT7LenPCO/ldC/+DAzdC
	t2wWP1DBtCe9q83TA8JV0rImkzzHE9te5zLhvyjRJrcsrUKSDUjzPG0wAcaUwliYSVt8wi9QS0w
	xs3I=
X-Gm-Gg: ASbGncsT/EWmfX+/ewPl54TWzHQQUpFIwPFFVzy4uXe3F5jKMmxK/Pd2G+YUCfow0BH
	5KmCX42QahhEPPXmgyYBPM+CYFng3VcfXh4ugpwwQE6dCTXAulMb9T6coK61pnbTtbiZH9rrSf9
	vmqd2QY/1yjCXEsQaqgtmIgV84ZwoFMdOrwkeMdfBh2Nto+WbHSr0hWs+Xfdv91MIclDMKPT8Ve
	vj6behs7kkh3ysEXaB2PEzG8zqdFJi9gjbRAUhiOOudCGw5J+Kq+21XdJputKcZAS723Eq/fhx1
	no3F8k3Xya1IxLm+dIxJgUjL/D6BdRAUkBZTC5V4EqUSo4nXXwln3gNfZCGOc7b+lY0kyDjP0gU
	tRW5+WIJcPX7FwcEOlIjH4zdXmtfpI6zfMAg=
X-Google-Smtp-Source: AGHT+IEh7WvAJsIY445U+y/M7WanfiBn1QICVT5eE1WbGPmy8MGKqDfoQmH27hAGvNIK3jqEP8mBYQ==
X-Received: by 2002:a05:6512:b9e:b0:553:35ad:2f33 with SMTP id 2adb3069b0e04-55366c0aed0mr4658480e87.37.1749556632482;
        Tue, 10 Jun 2025 04:57:12 -0700 (PDT)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com. [209.85.167.52])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5536772aa8csm1517974e87.184.2025.06.10.04.57.11
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jun 2025 04:57:11 -0700 (PDT)
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-54b10594812so5904058e87.1
        for <linux-media@vger.kernel.org>; Tue, 10 Jun 2025 04:57:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVer4LaOBZX1DtHq13rna4Vch+5bG8UtHpIoFQT20DAjeMqZr/Ae3jchjCGOci6Wz0mN2V+D2JEZh2Sbg==@vger.kernel.org
X-Received: by 2002:a05:6512:23c9:b0:553:3544:2b31 with SMTP id
 2adb3069b0e04-55366c0b031mr2995986e87.40.1749556631288; Tue, 10 Jun 2025
 04:57:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CGME20250610113726epcas1p449116bfeef2a102c90e9519a632eb0b9@epcas1p4.samsung.com>
 <20250610113722.36820-1-yjjuny.lee@samsung.com>
In-Reply-To: <20250610113722.36820-1-yjjuny.lee@samsung.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 10 Jun 2025 13:56:58 +0200
X-Gmail-Original-Message-ID: <CANiDSCtQiiutnqGWwL1u=K4kFavhw0-z=m_Kztr2xRpDUZ+iLA@mail.gmail.com>
X-Gm-Features: AX0GCFsIB_jsO93Cd7Dtr7hPY8vm9UREfUiDERDqDZvvclpZmkTx5CnwHSKPkMg
Message-ID: <CANiDSCtQiiutnqGWwL1u=K4kFavhw0-z=m_Kztr2xRpDUZ+iLA@mail.gmail.com>
Subject: Re: [PATCH] usb: uvc: Fix 1-byte out-of-bounds read in uvc_parse_format()
To: Youngjun Lee <yjjuny.lee@samsung.com>
Cc: laurent.pinchart@ideasonboard.com, hdegoede@redhat.com, mchehab@kernel.org, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Youngjun

On Tue, 10 Jun 2025 at 13:37, Youngjun Lee <yjjuny.lee@samsung.com> wrote:
>
> The buffer length check before calling uvc_parse_format() only ensured
> that the buffer has at least 3 bytes (buflen > 2), buf the function
> accesses buffer[3], requiring at least 4 bytes.
>
> This can lead to an out-of-bounds read if the buffer has exactly 3 bytes.
>
> Fix it by checking that the buffer has at least 4 bytes before passing it
> to uvc_parse_format().
>

You probably want to add:
Fixes: c0efd232929c ("V4L/DVB (8145a): USB Video Class driver")
Cc: stable@vger.kernel.org

> Signed-off-by: Youngjun Lee <yjjuny.lee@samsung.com>
> ---
>  drivers/media/usb/uvc/uvc_driver.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> index da24a655ab68..60367d9e1c05 100644
> --- a/drivers/media/usb/uvc/uvc_driver.c
> +++ b/drivers/media/usb/uvc/uvc_driver.c
> @@ -729,7 +729,7 @@ static int uvc_parse_streaming(struct uvc_device *dev,
>         streaming->nformats = 0;
>
>         /* Parse the format descriptors. */
> -       while (buflen > 2 && buffer[1] == USB_DT_CS_INTERFACE) {
> +       while (buflen > 3 && buffer[1] == USB_DT_CS_INTERFACE) {
>                 switch (buffer[2]) {
>                 case UVC_VS_FORMAT_UNCOMPRESSED:
>                 case UVC_VS_FORMAT_MJPEG:
> --
> 2.43.0
>
>

I would have fixed it slightly different:

diff --git a/drivers/media/usb/uvc/uvc_driver.c
b/drivers/media/usb/uvc/uvc_driver.c
index 96eeb3aee546..1371a73e67e3 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -344,6 +344,9 @@ static int uvc_parse_format(struct uvc_device *dev,
        u8 ftype;
        int ret;

+       if (buflen < 4)
+               return -EINVAL;
+
        format->type = buffer[2];
        format->index = buffer[3];
        format->frames = frames;


I think it makes more sense to add the length check where it is going
to be used not on a caller function. If we every change
uvc_parse_format to read byte #5 we will probably miss the check on
uvc_parse_streaming()

-- 
Ricardo Ribalda

