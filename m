Return-Path: <linux-media+bounces-42234-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A31D9B51E81
	for <lists+linux-media@lfdr.de>; Wed, 10 Sep 2025 19:04:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5DE36483B06
	for <lists+linux-media@lfdr.de>; Wed, 10 Sep 2025 17:04:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A062529A307;
	Wed, 10 Sep 2025 17:04:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j5tvGL5U"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83E361A2387;
	Wed, 10 Sep 2025 17:04:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757523853; cv=none; b=AJQ48A5KsgYD/rqiQiycUf1qT2fElYDMQA3bi0MbRArkW4p6UWVoQfHcNyYwNBxjmX8SfWTtnfyJsf5tti/pZF/4Tx4j+czUPxAoOHnlP/2H4fOJlFmEb47l9tNY6VgJ7IWntX8KnoUJdtLAktxnYCURRSbpgBqZCdGsEFISEBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757523853; c=relaxed/simple;
	bh=8NxnRH/NqFBuV2JRnBAgXpAgLSBJuz9+bNobY8EfMaI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iqKv9R8HID7RZiwh/zUwsTF+MNXEtgGZaEdTzCLqlNh+24g4yqXoseENVCV1pkZk3FS92mmF7yQJjSJN4c6iY+b6HPbO8c1Z2ChsB3o00gLSYOE8g0WEuciTAL271FOmVYmHpGCKNKcj5duIN7zX6FueZeI5A3t3HZ3OVM0Kgl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j5tvGL5U; arc=none smtp.client-ip=209.85.219.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-e94d678e116so7248701276.2;
        Wed, 10 Sep 2025 10:04:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757523850; x=1758128650; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iAhi2nhP6RcwyawffhfphrfKgf6fcZyr9ahN0hYRF7o=;
        b=j5tvGL5U2mkWsQ4Sn2/ZpX+ch0M3yJjZf4WnS7QJphh808EAmCkMzShZrCdkdyTH3G
         diRCpFjQn7v2sBaT4+Htm4DQbJf2P8M93rALPGL+OyN4x10EW7GkWegevkbkTl85BTiE
         qoZL9bG1iBXpg3dgh3ylg7PziR3fn75/goL7a5TUrCjzt5PvBF44fhI6nwwwD6GGj4QL
         b2/23Qx7+Wc/eDeZ+LjYx7FO5RFepFRTJeneanr70INkQpWJsElXuatHqdwrLZayj5kp
         7ye+D+xD4WkUYnR18yx7APuv+33vtItdK/mMIJzIqsEKGaBGeIB9ClBVIFie/6PZFjLt
         5P4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757523850; x=1758128650;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iAhi2nhP6RcwyawffhfphrfKgf6fcZyr9ahN0hYRF7o=;
        b=Z9sdwQqgDtCBRLjS3rLQkKMme1/ZETdwKnCgRukjk7ZwISEKgI/5zHCZ2YU+3n4VKy
         TvNRX6nYUFjp4Qkm3sFkzY+jkCH+UAp0/+gAtzaEPtqFNF0TwdakbVmIIS0UPapz026l
         YkpMLuCyzkdCI0MVuWFWZ857COUC/XcqPSh4FK1eIHFqH0qG09ovmNDXE8QaJvYZ56Z1
         5h+1Y5i114Xsh47wBulSGixWq8QJiq4nX1o0c8anM/1Yar9woIgZsDJBSm2mQALKiT+7
         Gl2gyUyP+yBGYWBBy/se/023NbAIZITy6GvVYwb0/bhqiTImvQ0oxeYffRp/biwVu8wZ
         Aa6g==
X-Forwarded-Encrypted: i=1; AJvYcCUEo75YS5JnT00ILcQcO1XgW93bXmWh/0AIORGaRMzwec6OpcuvVegTlT9ThMHDhxiW1pu/pyWQCSlopT4=@vger.kernel.org, AJvYcCUq7GEuXxnOkU6syy/XYm3CnSR6Hda6nehQhP5s3oVdVIQWs4hJHZXfjA0lWVfNbAlV7nARgjIpYVQzww==@vger.kernel.org, AJvYcCXUTephv8VGVNlr2dFNEOlpQZYm1QkxQRQiFBPSr2FE0YC47je1T4TCf50Aqe6Vci+QBNs27Tuwq3KP@vger.kernel.org, AJvYcCXXJUyi3mPbzbH8MjtNE/CkJdTjv1EWzERxKaURD0TLboptFaYsvmYj4b+FC+zfagZYRBSdtGONgJFYoIXOcA==@vger.kernel.org, AJvYcCXsQ9M82UcAgeMZAymahjZzg0wieWwRVe+imdEwcmvwPDIQ1rVv/6s3QAnZekdrbNIoBU2RNtFi5kBdamYN@vger.kernel.org
X-Gm-Message-State: AOJu0YyMhJQpYNXWAPO1PIuPqhCfFFoB4kos6Rz+P27muNEFWu1y4cDb
	6Pw/CJ5D12REUzU1k8IDR+AMy5+eOs0tNSaWzWYbHl7Vr4mzaMIupFAnPRPrJ/hZkJN0Kzbt63c
	Oih+lIrEqx4wRQliT21kjIyBxZRKGPI0=
X-Gm-Gg: ASbGncsmo2pmthuvv/vnRiqFPCy07LPg+Xg2i+tVRT4TRtlZQ8fTgNhjL0VbBGfzUxY
	ML27sJrkl8/RBtcb7ZPdrPQzyAmzAQ88VJdPOcwdlv7Es4zkhLd+OQgjKzCJLNAj5PvoFi9OTm1
	lfV7mo+mHAT8/nUIGpuN5ZnLYvmf82NTu7WVAN+g2hf5nOfcLwJ3OYCsAi+E1wM40ZQZAyKvd7x
	oPvDRulrKlGO3yhV3k=
X-Google-Smtp-Source: AGHT+IEfnhT9ZSnLfrxKenO2m0z1nuzfqS7vviy8OiPv+Dkiyq8OrSHh9+vCeh+cYF0spuidfc9qnQhd9ZCiFqloKVc=
X-Received: by 2002:a05:690e:250b:10b0:5fa:ccca:7c27 with SMTP id
 956f58d0204a3-6102c30b9f6mr12766300d50.8.1757523850376; Wed, 10 Sep 2025
 10:04:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250910-leds-v5-0-bb90a0f897d5@vinarskis.com> <20250910-leds-v5-4-bb90a0f897d5@vinarskis.com>
In-Reply-To: <20250910-leds-v5-4-bb90a0f897d5@vinarskis.com>
From: Steev Klimaszewski <threeway@gmail.com>
Date: Wed, 10 Sep 2025 12:04:00 -0500
X-Gm-Features: Ac12FXwb-SXXuwNDs7DFnPiik28LYopuJH_w6GUXGeVeKXumFwg8fkQlWOaiNp0
Message-ID: <CAOvMTZhxJ3atv62ui5+ahNKV1vb7JXnwwm4xxvg5p=o5p2HnDQ@mail.gmail.com>
Subject: Re: [PATCH v5 4/4] arm64: dts: qcom: sc8280xp-x13s: enable camera
 privacy indicator
To: Aleksandrs Vinarskis <alex@vinarskis.com>
Cc: Hans de Goede <hansg@kernel.org>, Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, Jingoo Han <jingoohan1@gmail.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Jean-Jacques Hiblot <jjhiblot@traphandler.com>, 
	Jacopo Mondi <jacopo@jmondi.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Daniel Thompson <danielt@kernel.org>, linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	Andy Shevchenko <andy.shevchenko@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Aleksandrs,

On Wed, Sep 10, 2025 at 7:01=E2=80=AFAM Aleksandrs Vinarskis <alex@vinarski=
s.com> wrote:
>
> Leverage newly introduced 'leds' and 'led-names' properties to pass
> indicator's phandle and function to v4l2 subnode. The latter supports
> privacy led since couple of years ago under 'privacy-led' designation.
> Unlike initially proposed trigger-source based approach, this solution
> cannot be easily bypassed from userspace, thus reducing privacy
> concerns.
>
> Signed-off-by: Aleksandrs Vinarskis <alex@vinarskis.com>
> ---
>  arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts b=
/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
> index 637430719e6d7d3c0eeb4abf2b80eea1f8289530..3b3f7137689a6fa292ffe4fec=
8c1d1f20ee525bc 100644
> --- a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
> +++ b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
> @@ -83,14 +83,11 @@ leds {
>                 pinctrl-names =3D "default";
>                 pinctrl-0 =3D <&cam_indicator_en>;
>
> -               led-camera-indicator {
> -                       label =3D "white:camera-indicator";
> +               privacy_led: privacy-led {

Should this now be privacy_led: privacy { ?

>                         function =3D LED_FUNCTION_INDICATOR;
>                         color =3D <LED_COLOR_ID_WHITE>;
>                         gpios =3D <&tlmm 28 GPIO_ACTIVE_HIGH>;
> -                       linux,default-trigger =3D "none";
>                         default-state =3D "off";
> -                       /* Reuse as a panic indicator until we get a "cam=
era on" trigger */
>                         panic-indicator;
>                 };
>         };
> @@ -685,6 +682,9 @@ camera@10 {
>                 pinctrl-names =3D "default";
>                 pinctrl-0 =3D <&cam_rgb_default>;
>
> +               leds =3D <&privacy_led>;
> +               led-names =3D "privacy";
> +
>                 clocks =3D <&camcc CAMCC_MCLK3_CLK>;
>
>                 orientation =3D <0>;      /* Front facing */
>
> --
> 2.48.1
>

v5 does not turn the led on here on my X13s whereas v3 did (and v4 was
not tested)

