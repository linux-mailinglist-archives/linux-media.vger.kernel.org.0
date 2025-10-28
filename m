Return-Path: <linux-media+bounces-45863-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id DDA2DC16619
	for <lists+linux-media@lfdr.de>; Tue, 28 Oct 2025 19:05:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 28393501A7D
	for <lists+linux-media@lfdr.de>; Tue, 28 Oct 2025 18:01:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54DE632ABC3;
	Tue, 28 Oct 2025 18:01:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ac1AcP4D"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9E8523D2A3
	for <linux-media@vger.kernel.org>; Tue, 28 Oct 2025 18:01:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761674471; cv=none; b=DEU4DBFou1DwaBoAVDIL2lhODN06f8HZQ4KZsDt88/WWblVVvqyYr3wSbEtFTn/ERTyj24B9vPCGR6XjUjCiL7T/gyLohNIA2rZQuRESKXPutdZZUcw4IRzXpkM1QoJ/rqkjPUfmuERTj0XmpWsL1fKTeODUv1LLYGkftP+/J8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761674471; c=relaxed/simple;
	bh=9/3gNeHaYvH7YvTs+PKEvxCrFaqnD7SiUGP4isRVTl4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hnJRf531d64v8AvfSXPNwtlDX110jrTXbtkztpvW/f4zi6NSvwGJM0gZsomjoH/kODmr01A7eDq2ssu1qE/XGUPjk63/FDdiYNJ8l4qQBC564PLBw+rSHQ4uBnB17QV9P+2omEFJseVgHfy4O2zq2L+sGeHCxbsTr1WCvqdD4JE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ac1AcP4D; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-429a0d1c31aso110419f8f.1
        for <linux-media@vger.kernel.org>; Tue, 28 Oct 2025 11:01:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761674468; x=1762279268; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pCEQzFxW+madwrv8aBawelGrP3CVpUaeIwsfLgnOZAU=;
        b=ac1AcP4D7T8TunH0ivdM7qT2LpUhplkGgGUtMx1ZSc2KzWKiJ6sc0slFFhxEVfATBr
         LCm3WXhW2iOjLB2SDbSlow98e0fZL3ucOp6fif/TjPoHn7FI22AKsxx9a3/QW38KWlpL
         pt3C0mhe6s0MSdBARextby1MgiWad+wwPpJn8Cpy29d7JMvrV8ac8MrUnRpMPRdead9f
         iEhag00CsV6oTf9PzWTrGa8LIUyuLmSL1k2BUrMbvhCDVDzAc2wZYaKkO/ItwOb8+lz5
         L0/un/iXR/rg00zIXRSwnaokr+LTBvGzpy+Ka5s1sSbOzVv5ADnEH4N2LUGBvTXe9BGB
         uqMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761674468; x=1762279268;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pCEQzFxW+madwrv8aBawelGrP3CVpUaeIwsfLgnOZAU=;
        b=FgDhIc2FD4FN8jpSnzYastAnBkdRNg0HAKJF7lwLTgBkt8GOpUNdT/K9IWw5UYfsA8
         ISdUhU5SVExFye81HdDCA9lYatj5cmuE2fDIJN5tC3Cylb0B489YK1flz/QMFlvGrtI1
         9fv+w9320f7oZPvevuHCGhrIQjmBL/Dg+W18ZGYI9QzQWDS98ciOLYaj325EnPG9XpqU
         jbFX7hHv4L9lgrkmObGqkmTE0/Z1QFELVZ6sqZstcFT9wYb/T+pmEa92TlrlxsiCfPUA
         KfG0JwkFO417zp8E4mZL2e/jtsx9kXFVchZp7F10jnoyBaPpBnHqSFT22hL6V5ncsydj
         QCQA==
X-Gm-Message-State: AOJu0YyoWiGw1hXJTyahqdgQTIdvtH0X6z3HwQXzJpuekF88YNMZQ0z7
	wFpIkBgonavkrirrlPCFAYXOAes24vscDu8CjqbMeuKtXYhlHfjI7DQct9hiqazpKSj485h8p8p
	AVxwoShNgm8Y86+Fne25T7+B8vPs26eE=
X-Gm-Gg: ASbGnctZ8K6eOJM4fWN+7pgzPMx9q7DgsycfmvmWEUkpga8yEIK00QHy/BkvAaDldpn
	h7L944UNySr9aNZjjc7HSqRee2sAefDsVtcOpgh6TuDFOh3yRnZgz5yl0ZHzffcmAkgLo+L4lo7
	gRxiqZupd1q1hPkLNW+WPpPW6qygJx2838euFSqH6RGqX6eeksZ5YjH7FFfMb+vU2JizB18m9Ef
	K4chGNZ42loHy/cQ9HKzkLSN2ZudWXpM1UcL0EGUGk38q7Bod9Ra0slKgJJKCDV6Lnt6Fw=
X-Google-Smtp-Source: AGHT+IHpEn293xUQBtxDVQ71PVjUFm7YcMZrTKR+UYoQPv+Rm0ZHF2wr51C1F4u8ECE4D8JahpoR5i75Grw6elZvooM=
X-Received: by 2002:a05:6000:2887:b0:429:8b81:5ace with SMTP id
 ffacd0b85a97d-429a81b1470mr3944782f8f.7.1761674467657; Tue, 28 Oct 2025
 11:01:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251002-c55-v12-0-3eda2dba9554@ideasonboard.com> <20251002-c55-v12-2-3eda2dba9554@ideasonboard.com>
In-Reply-To: <20251002-c55-v12-2-3eda2dba9554@ideasonboard.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 28 Oct 2025 18:00:39 +0000
X-Gm-Features: AWmQ_bkbLojgbgpv5n9DbkH76vLTXPQ-oionzdgMQBrgFA-kSP32mMdP7wnhQz8
Message-ID: <CA+V-a8uVjR7p_+LCXOTjH4MxL_PMv4O5obuJxpvoyJvFfHG--A@mail.gmail.com>
Subject: Re: [PATCH v12 02/15] media: uapi: Add 20-bit bayer formats
To: Daniel Scally <dan.scally@ideasonboard.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Anthony.McGivern@arm.com, 
	jacopo.mondi@ideasonboard.com, nayden.kanchev@arm.com, robh+dt@kernel.org, 
	mchehab@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
	jerome.forissier@linaro.org, kieran.bingham@ideasonboard.com, 
	laurent.pinchart@ideasonboard.com, 
	Sakari Ailus <sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 2, 2025 at 11:20=E2=80=AFAM Daniel Scally
<dan.scally@ideasonboard.com> wrote:
>
> The Mali-C55 requires input data be in 20-bit format, MSB aligned.
> Add some new media bus format macros to represent that input format.
>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Co-developed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
> ---
> Changes in v12:
>
>         - None
>
> Changes in v11:
>
>         - None
>
> Changes in v10:
>
>         - None
>
> Changes in v9:
>
>         - None
>
> Changes in v8:
>
>         - None
>
> Changes in v7:
>
>         - None
>
> Changes in v6:
>
>         - Fixed the table formatting
>
> Changes in v5:
>
>         - New patch
> ---
>  .../userspace-api/media/v4l/subdev-formats.rst     | 252 +++++++++++++++=
+++++-
>  include/uapi/linux/media-bus-format.h              |   6 +-
>  2 files changed, 255 insertions(+), 3 deletions(-)
>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

> diff --git a/Documentation/userspace-api/media/v4l/subdev-formats.rst b/D=
ocumentation/userspace-api/media/v4l/subdev-formats.rst
> index 57194180fe42f31f88aa0aeb4a4650bf4fb32bcc..ecbe83dcc4b716c77ce37f55f=
bb8a59b2eed17ab 100644
> --- a/Documentation/userspace-api/media/v4l/subdev-formats.rst
> +++ b/Documentation/userspace-api/media/v4l/subdev-formats.rst
> @@ -2816,7 +2816,7 @@ organization is given as an example for the first p=
ixel only.
>      \tiny
>      \setlength{\tabcolsep}{2pt}
>
> -.. tabularcolumns:: |p{6.0cm}|p{0.7cm}|p{0.3cm}|p{0.22cm}|p{0.22cm}|p{0.=
22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}=
|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|
> +.. tabularcolumns:: |p{6.0cm}|p{0.7cm}|p{0.3cm}|p{0.22cm}|p{0.22cm}|p{0.=
22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}=
|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.=
22cm}|p{0.22cm}|p{0.22cm}|
>
>  .. _v4l2-mbus-pixelcode-bayer:
>
> @@ -2829,10 +2829,14 @@ organization is given as an example for the first=
 pixel only.
>      * - Identifier
>        - Code
>        -
> -      - :cspan:`15` Data organization
> +      - :cspan:`19` Data organization
>      * -
>        -
>        - Bit
> +      - 19
> +      - 18
> +      - 17
> +      - 16
>        - 15
>        - 14
>        - 13
> @@ -2862,6 +2866,10 @@ organization is given as an example for the first =
pixel only.
>        -
>        -
>        -
> +      -
> +      -
> +      -
> +      -
>        - b\ :sub:`7`
>        - b\ :sub:`6`
>        - b\ :sub:`5`
> @@ -2883,6 +2891,10 @@ organization is given as an example for the first =
pixel only.
>        -
>        -
>        -
> +      -
> +      -
> +      -
> +      -
>        - g\ :sub:`7`
>        - g\ :sub:`6`
>        - g\ :sub:`5`
> @@ -2904,6 +2916,10 @@ organization is given as an example for the first =
pixel only.
>        -
>        -
>        -
> +      -
> +      -
> +      -
> +      -
>        - g\ :sub:`7`
>        - g\ :sub:`6`
>        - g\ :sub:`5`
> @@ -2925,6 +2941,10 @@ organization is given as an example for the first =
pixel only.
>        -
>        -
>        -
> +      -
> +      -
> +      -
> +      -
>        - r\ :sub:`7`
>        - r\ :sub:`6`
>        - r\ :sub:`5`
> @@ -2946,6 +2966,10 @@ organization is given as an example for the first =
pixel only.
>        -
>        -
>        -
> +      -
> +      -
> +      -
> +      -
>        - b\ :sub:`7`
>        - b\ :sub:`6`
>        - b\ :sub:`5`
> @@ -2967,6 +2991,10 @@ organization is given as an example for the first =
pixel only.
>        -
>        -
>        -
> +      -
> +      -
> +      -
> +      -
>        - g\ :sub:`7`
>        - g\ :sub:`6`
>        - g\ :sub:`5`
> @@ -2988,6 +3016,10 @@ organization is given as an example for the first =
pixel only.
>        -
>        -
>        -
> +      -
> +      -
> +      -
> +      -
>        - g\ :sub:`7`
>        - g\ :sub:`6`
>        - g\ :sub:`5`
> @@ -3009,6 +3041,10 @@ organization is given as an example for the first =
pixel only.
>        -
>        -
>        -
> +      -
> +      -
> +      -
> +      -
>        - r\ :sub:`7`
>        - r\ :sub:`6`
>        - r\ :sub:`5`
> @@ -3030,6 +3066,10 @@ organization is given as an example for the first =
pixel only.
>        -
>        -
>        -
> +      -
> +      -
> +      -
> +      -
>        - b\ :sub:`7`
>        - b\ :sub:`6`
>        - b\ :sub:`5`
> @@ -3051,6 +3091,10 @@ organization is given as an example for the first =
pixel only.
>        -
>        -
>        -
> +      -
> +      -
> +      -
> +      -
>        - g\ :sub:`7`
>        - g\ :sub:`6`
>        - g\ :sub:`5`
> @@ -3072,6 +3116,10 @@ organization is given as an example for the first =
pixel only.
>        -
>        -
>        -
> +      -
> +      -
> +      -
> +      -
>        - g\ :sub:`7`
>        - g\ :sub:`6`
>        - g\ :sub:`5`
> @@ -3093,6 +3141,10 @@ organization is given as an example for the first =
pixel only.
>        -
>        -
>        -
> +      -
> +      -
> +      -
> +      -
>        - r\ :sub:`7`
>        - r\ :sub:`6`
>        - r\ :sub:`5`
> @@ -3114,6 +3166,10 @@ organization is given as an example for the first =
pixel only.
>        -
>        -
>        -
> +      -
> +      -
> +      -
> +      -
>        - 0
>        - 0
>        - 0
> @@ -3133,6 +3189,10 @@ organization is given as an example for the first =
pixel only.
>        -
>        -
>        -
> +      -
> +      -
> +      -
> +      -
>        - b\ :sub:`7`
>        - b\ :sub:`6`
>        - b\ :sub:`5`
> @@ -3154,6 +3214,10 @@ organization is given as an example for the first =
pixel only.
>        -
>        -
>        -
> +      -
> +      -
> +      -
> +      -
>        - b\ :sub:`7`
>        - b\ :sub:`6`
>        - b\ :sub:`5`
> @@ -3173,6 +3237,10 @@ organization is given as an example for the first =
pixel only.
>        -
>        -
>        -
> +      -
> +      -
> +      -
> +      -
>        - 0
>        - 0
>        - 0
> @@ -3194,6 +3262,10 @@ organization is given as an example for the first =
pixel only.
>        -
>        -
>        -
> +      -
> +      -
> +      -
> +      -
>        - b\ :sub:`9`
>        - b\ :sub:`8`
>        - b\ :sub:`7`
> @@ -3213,6 +3285,10 @@ organization is given as an example for the first =
pixel only.
>        -
>        -
>        -
> +      -
> +      -
> +      -
> +      -
>        - b\ :sub:`1`
>        - b\ :sub:`0`
>        - 0
> @@ -3234,6 +3310,10 @@ organization is given as an example for the first =
pixel only.
>        -
>        -
>        -
> +      -
> +      -
> +      -
> +      -
>        - b\ :sub:`1`
>        - b\ :sub:`0`
>        - 0
> @@ -3253,6 +3333,10 @@ organization is given as an example for the first =
pixel only.
>        -
>        -
>        -
> +      -
> +      -
> +      -
> +      -
>        - b\ :sub:`9`
>        - b\ :sub:`8`
>        - b\ :sub:`7`
> @@ -3272,6 +3356,10 @@ organization is given as an example for the first =
pixel only.
>        -
>        -
>        -
> +      -
> +      -
> +      -
> +      -
>        - b\ :sub:`9`
>        - b\ :sub:`8`
>        - b\ :sub:`7`
> @@ -3293,6 +3381,10 @@ organization is given as an example for the first =
pixel only.
>        -
>        -
>        -
> +      -
> +      -
> +      -
> +      -
>        - g\ :sub:`9`
>        - g\ :sub:`8`
>        - g\ :sub:`7`
> @@ -3314,6 +3406,10 @@ organization is given as an example for the first =
pixel only.
>        -
>        -
>        -
> +      -
> +      -
> +      -
> +      -
>        - g\ :sub:`9`
>        - g\ :sub:`8`
>        - g\ :sub:`7`
> @@ -3335,6 +3431,10 @@ organization is given as an example for the first =
pixel only.
>        -
>        -
>        -
> +      -
> +      -
> +      -
> +      -
>        - r\ :sub:`9`
>        - r\ :sub:`8`
>        - r\ :sub:`7`
> @@ -3354,6 +3454,10 @@ organization is given as an example for the first =
pixel only.
>        -
>        -
>        -
> +      -
> +      -
> +      -
> +      -
>        - b\ :sub:`11`
>        - b\ :sub:`10`
>        - b\ :sub:`9`
> @@ -3375,6 +3479,10 @@ organization is given as an example for the first =
pixel only.
>        -
>        -
>        -
> +      -
> +      -
> +      -
> +      -
>        - g\ :sub:`11`
>        - g\ :sub:`10`
>        - g\ :sub:`9`
> @@ -3396,6 +3504,10 @@ organization is given as an example for the first =
pixel only.
>        -
>        -
>        -
> +      -
> +      -
> +      -
> +      -
>        - g\ :sub:`11`
>        - g\ :sub:`10`
>        - g\ :sub:`9`
> @@ -3417,6 +3529,10 @@ organization is given as an example for the first =
pixel only.
>        -
>        -
>        -
> +      -
> +      -
> +      -
> +      -
>        - r\ :sub:`11`
>        - r\ :sub:`10`
>        - r\ :sub:`9`
> @@ -3436,6 +3552,10 @@ organization is given as an example for the first =
pixel only.
>        -
>        -
>        -
> +      -
> +      -
> +      -
> +      -
>        - b\ :sub:`13`
>        - b\ :sub:`12`
>        - b\ :sub:`11`
> @@ -3457,6 +3577,10 @@ organization is given as an example for the first =
pixel only.
>        -
>        -
>        -
> +      -
> +      -
> +      -
> +      -
>        - g\ :sub:`13`
>        - g\ :sub:`12`
>        - g\ :sub:`11`
> @@ -3478,6 +3602,10 @@ organization is given as an example for the first =
pixel only.
>        -
>        -
>        -
> +      -
> +      -
> +      -
> +      -
>        - g\ :sub:`13`
>        - g\ :sub:`12`
>        - g\ :sub:`11`
> @@ -3499,6 +3627,10 @@ organization is given as an example for the first =
pixel only.
>        -
>        -
>        -
> +      -
> +      -
> +      -
> +      -
>        - r\ :sub:`13`
>        - r\ :sub:`12`
>        - r\ :sub:`11`
> @@ -3518,6 +3650,10 @@ organization is given as an example for the first =
pixel only.
>        - MEDIA_BUS_FMT_SBGGR16_1X16
>        - 0x301d
>        -
> +      -
> +      -
> +      -
> +      -
>        - b\ :sub:`15`
>        - b\ :sub:`14`
>        - b\ :sub:`13`
> @@ -3539,6 +3675,10 @@ organization is given as an example for the first =
pixel only.
>        - MEDIA_BUS_FMT_SGBRG16_1X16
>        - 0x301e
>        -
> +      -
> +      -
> +      -
> +      -
>        - g\ :sub:`15`
>        - g\ :sub:`14`
>        - g\ :sub:`13`
> @@ -3560,6 +3700,10 @@ organization is given as an example for the first =
pixel only.
>        - MEDIA_BUS_FMT_SGRBG16_1X16
>        - 0x301f
>        -
> +      -
> +      -
> +      -
> +      -
>        - g\ :sub:`15`
>        - g\ :sub:`14`
>        - g\ :sub:`13`
> @@ -3581,6 +3725,110 @@ organization is given as an example for the first=
 pixel only.
>        - MEDIA_BUS_FMT_SRGGB16_1X16
>        - 0x3020
>        -
> +      -
> +      -
> +      -
> +      -
> +      - r\ :sub:`15`
> +      - r\ :sub:`14`
> +      - r\ :sub:`13`
> +      - r\ :sub:`12`
> +      - r\ :sub:`11`
> +      - r\ :sub:`10`
> +      - r\ :sub:`9`
> +      - r\ :sub:`8`
> +      - r\ :sub:`7`
> +      - r\ :sub:`6`
> +      - r\ :sub:`5`
> +      - r\ :sub:`4`
> +      - r\ :sub:`3`
> +      - r\ :sub:`2`
> +      - r\ :sub:`1`
> +      - r\ :sub:`0`
> +    * .. _MEDIA-BUS-FMT-SBGGR20-1X20:
> +
> +      - MEDIA_BUS_FMT_SBGGR20_1X20
> +      - 0x3021
> +      -
> +      - b\ :sub:`19`
> +      - b\ :sub:`18`
> +      - b\ :sub:`17`
> +      - b\ :sub:`16`
> +      - b\ :sub:`15`
> +      - b\ :sub:`14`
> +      - b\ :sub:`13`
> +      - b\ :sub:`12`
> +      - b\ :sub:`11`
> +      - b\ :sub:`10`
> +      - b\ :sub:`9`
> +      - b\ :sub:`8`
> +      - b\ :sub:`7`
> +      - b\ :sub:`6`
> +      - b\ :sub:`5`
> +      - b\ :sub:`4`
> +      - b\ :sub:`3`
> +      - b\ :sub:`2`
> +      - b\ :sub:`1`
> +      - b\ :sub:`0`
> +    * .. _MEDIA-BUS-FMT-SGBRG20-1X20:
> +
> +      - MEDIA_BUS_FMT_SGBRG20_1X20
> +      - 0x3022
> +      -
> +      - g\ :sub:`19`
> +      - g\ :sub:`18`
> +      - g\ :sub:`17`
> +      - g\ :sub:`16`
> +      - g\ :sub:`15`
> +      - g\ :sub:`14`
> +      - g\ :sub:`13`
> +      - g\ :sub:`12`
> +      - g\ :sub:`11`
> +      - g\ :sub:`10`
> +      - g\ :sub:`9`
> +      - g\ :sub:`8`
> +      - g\ :sub:`7`
> +      - g\ :sub:`6`
> +      - g\ :sub:`5`
> +      - g\ :sub:`4`
> +      - g\ :sub:`3`
> +      - g\ :sub:`2`
> +      - g\ :sub:`1`
> +      - g\ :sub:`0`
> +    * .. _MEDIA-BUS-FMT-SGRBG20-1X20:
> +
> +      - MEDIA_BUS_FMT_SGRBG20_1X20
> +      - 0x3023
> +      -
> +      - g\ :sub:`19`
> +      - g\ :sub:`18`
> +      - g\ :sub:`17`
> +      - g\ :sub:`16`
> +      - g\ :sub:`15`
> +      - g\ :sub:`14`
> +      - g\ :sub:`13`
> +      - g\ :sub:`12`
> +      - g\ :sub:`11`
> +      - g\ :sub:`10`
> +      - g\ :sub:`9`
> +      - g\ :sub:`8`
> +      - g\ :sub:`7`
> +      - g\ :sub:`6`
> +      - g\ :sub:`5`
> +      - g\ :sub:`4`
> +      - g\ :sub:`3`
> +      - g\ :sub:`2`
> +      - g\ :sub:`1`
> +      - g\ :sub:`0`
> +    * .. _MEDIA-BUS-FMT-SRGGB20-1X20:
> +
> +      - MEDIA_BUS_FMT_SRGGB20_1X20
> +      - 0x3024
> +      -
> +      - r\ :sub:`19`
> +      - r\ :sub:`18`
> +      - r\ :sub:`17`
> +      - r\ :sub:`16`
>        - r\ :sub:`15`
>        - r\ :sub:`14`
>        - r\ :sub:`13`
> diff --git a/include/uapi/linux/media-bus-format.h b/include/uapi/linux/m=
edia-bus-format.h
> index 62ad82fd285a8ce24bd16c207c51c0e75ea95070..6005f033e62c04bdd3dff7ac9=
05f5b921341cd47 100644
> --- a/include/uapi/linux/media-bus-format.h
> +++ b/include/uapi/linux/media-bus-format.h
> @@ -124,7 +124,7 @@
>  #define MEDIA_BUS_FMT_YUV16_1X48               0x202a
>  #define MEDIA_BUS_FMT_UYYVYY16_0_5X48          0x202b
>
> -/* Bayer - next is     0x3021 */
> +/* Bayer - next is     0x3025 */
>  #define MEDIA_BUS_FMT_SBGGR8_1X8               0x3001
>  #define MEDIA_BUS_FMT_SGBRG8_1X8               0x3013
>  #define MEDIA_BUS_FMT_SGRBG8_1X8               0x3002
> @@ -157,6 +157,10 @@
>  #define MEDIA_BUS_FMT_SGBRG16_1X16             0x301e
>  #define MEDIA_BUS_FMT_SGRBG16_1X16             0x301f
>  #define MEDIA_BUS_FMT_SRGGB16_1X16             0x3020
> +#define MEDIA_BUS_FMT_SBGGR20_1X20             0x3021
> +#define MEDIA_BUS_FMT_SGBRG20_1X20             0x3022
> +#define MEDIA_BUS_FMT_SGRBG20_1X20             0x3023
> +#define MEDIA_BUS_FMT_SRGGB20_1X20             0x3024
>
>  /* JPEG compressed formats - next is   0x4002 */
>  #define MEDIA_BUS_FMT_JPEG_1X8                 0x4001
>
> --
> 2.43.0
>
>

