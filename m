Return-Path: <linux-media+bounces-26961-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 90CB9A442A9
	for <lists+linux-media@lfdr.de>; Tue, 25 Feb 2025 15:27:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 04FB21896770
	for <lists+linux-media@lfdr.de>; Tue, 25 Feb 2025 14:21:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8522226BDBB;
	Tue, 25 Feb 2025 14:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="nIsJWFUV"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F62926A1A0
	for <linux-media@vger.kernel.org>; Tue, 25 Feb 2025 14:20:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740493255; cv=none; b=YA3/p9489fiVuV2gHWYqyhid12M2ApWfwI78QWdG//+tZHV5cRAyQ1n/Q0+H/uJ1P8iOcfuZI9VzjwXWMIGdjmLo1QNtYTqbHeKN4e1rP+tuCDnViqEzyxpf5LeWb1V+DIFb75GGttfCoge9cxZXNPIixHAHqwoM1zlvMZahWVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740493255; c=relaxed/simple;
	bh=4aRVcR1MtxzUuDinO58olTCgo2qDQEdNqepuqBaC/20=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=USM7iuzc4KBq9mpZG+5DCEYk+78PQuuvurDn3Ep4Gi7SEI3ZJSfQzHqLHJefa/zXAVIyqgXiOQR6LA9f6GKdA6W3KMpUAWPFxqDMAgBq9a8XYIyan5xTIG/3LJKQL3IYAnkmemzxkUxc9pztmXZI2wH6XhT8g9zSbur2c3MAgnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=nIsJWFUV; arc=none smtp.client-ip=209.85.219.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-e6087a8588bso112852276.1
        for <linux-media@vger.kernel.org>; Tue, 25 Feb 2025 06:20:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1740493252; x=1741098052; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=yLGj3f01/5YqskB/AMHKol9KSvNGpbV7f974e7GtQ0U=;
        b=nIsJWFUVPNvfheUD0MUZufKF654v4pxGi87gALKIYaHHUUQuyeU5xFijZM0cJ2RYqG
         phYCIFwesyEK4kRNVgrTrDApp8aDCjaF5XMJTh7oYacvAvPFUdcOTA+mrm2veSm5OA9O
         rnjDunJ8Itk42bUf8qlqQVQm72kx2oZAhSFLglqTIg15K0WShjUmB2Z/FExjSaV16wI2
         WDu6gUMuEFpU8Z1OzSNdXYShzINVOrzpRN8pYUsqtGayndG9ykZkzx1tzcCarUrdl2uP
         Crg/YSNkSq3i9dmLuA5s/fLI4baibikpicY8gAVfxBRDrYjs3lnku29eFfDLOn7t979l
         bbFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740493252; x=1741098052;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yLGj3f01/5YqskB/AMHKol9KSvNGpbV7f974e7GtQ0U=;
        b=IPqRH26uJoul7WYkC+I76Rbx6izskXPwO12vZJyk/gmYZ8fl/8RryoXIpexWt0VOUE
         qxKbQO/OM/jILv58w4YUEvopmlWheqOEBrALGF73emXOdq7oyA8Mg5iZwrlqpfgIOEzE
         1Vrv22yQ4mFmpeR32FUbUfSZo1gUsw87xbViXauA0/LN768mJ7HDD63jTIsi8NeExDd1
         tkrSJAOYgt0fcK7qx4xzLQfYB4SS29fxjgCZl7hLpu57JH0uNd1T27jCQzfg39WohLhn
         +pLHxcMN6XDeYYUOXjIlSjSGS9XoE8DA2+HodI0YUS2t1pTsjbjJaMcWQJD2qDqxQ4RS
         6EOg==
X-Forwarded-Encrypted: i=1; AJvYcCXKrGxFkldlRig4J5f7U0ADPuvDZ78QqqV34jUr+O81Nf1OKnM91h4q7gA1s7ffcxysQoUocidmqxW0Ig==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxnl+kdBtfd1RyqzQ0rUH7WVGqORnTWJQas0/F+1XarV/jd/jko
	hMnyorHqL9REoXTTFnZgLtv4fZNSU+st4aq5mhtVTpfN2df+vJIYyzg60cAdR5YI/tVcKkRhmGe
	Pmvm6VDLxVoyewIrhaFMlfLTSU7yU6a4l9KaHWg==
X-Gm-Gg: ASbGncvZZHAKD59xYkFedJ021tX9J6qUUEXLIbhqwsrSX0vLC0fnjWjV1cAUmUO+9gX
	mX5Mlm5exN3lK3ZEUfyd4U8TqOdbCnxcV34RISIMZE5e/B+6D5D0iyUES7Y94ADiUkUY00pmDxI
	s3uwP1WSMPrharm/b1hbJ0yuxxOXvFZF87MnuezRA=
X-Google-Smtp-Source: AGHT+IENualTBjQ0gC23IsPS4Y3OAVTdoidslIODPAXgztEQkt/QwuDATXiFsWJ/F2T2gnPhUdShHIX8sQEr6smL7nA=
X-Received: by 2002:a05:6902:2493:b0:e5b:43dd:cf18 with SMTP id
 3f1490d57ef6-e5e2490dc3amr14360779276.22.1740493251235; Tue, 25 Feb 2025
 06:20:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250225-b4-ov9282-gain-v1-0-a24af2820dde@linux.dev> <20250225-b4-ov9282-gain-v1-2-a24af2820dde@linux.dev>
In-Reply-To: <20250225-b4-ov9282-gain-v1-2-a24af2820dde@linux.dev>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 25 Feb 2025 14:20:34 +0000
X-Gm-Features: AQ5f1JpnFy2Fej1Tv3LO4JDgq3THZkPkBcXgbtSirWhgQwozrTWSiHSj1Na7Bi0
Message-ID: <CAPY8ntCoerdGgM1CjLWzNPx-0gACR1O9yaccRoHByq-B3D-rJg@mail.gmail.com>
Subject: Re: [PATCH 2/3] media: i2c: ov9282: add AEC Manual register definition
To: Richard Leitner <richard.leitner@linux.dev>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Richard

Thanks for the patch

On Tue, 25 Feb 2025 at 13:09, Richard Leitner <richard.leitner@linux.dev> wrote:
>
> Add #define's for the "AEC MANUAL" (0x3503) register and its
> values/flags. Use those in the registers single usage within the
> `common_regs` struct.
>
> All values are based on the OV9281 datasheet v1.01 (09.18.2015).
>
> Signed-off-by: Richard Leitner <richard.leitner@linux.dev>

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> ---
>  drivers/media/i2c/ov9282.c | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
> index c926842257893c4da3319b847fab9908b5bdaec6..c882a021cf18852237bf9b9524d3de0c5b48cbcb 100644
> --- a/drivers/media/i2c/ov9282.c
> +++ b/drivers/media/i2c/ov9282.c
> @@ -44,6 +44,15 @@
>  #define OV9282_EXPOSURE_STEP   1
>  #define OV9282_EXPOSURE_DEFAULT        0x0282
>
> +/* AEC/AGC manual */
> +#define OV9282_REG_AEC_MANUAL          0x3503
> +#define OV9282_DIGFRAC_GAIN_DELAY      BIT(6)
> +#define OV9282_GAIN_CHANGE_DELAY       BIT(5)
> +#define OV9282_GAIN_DELAY              BIT(4)
> +#define OV9282_GAIN_PREC16_EN          BIT(3)
> +#define OV9282_GAIN_MANUAL_AS_SENSGAIN BIT(2)
> +#define OV9282_AEC_MANUAL_DEFAULT      0x00
> +
>  /* Analog gain control */
>  #define OV9282_REG_AGAIN       0x3509
>  #define OV9282_AGAIN_MIN       0x10
> @@ -214,7 +223,7 @@ static const struct ov9282_reg common_regs[] = {
>         {0x3030, 0x10},
>         {0x3039, 0x32},
>         {0x303a, 0x00},
> -       {0x3503, 0x08},
> +       {OV9282_REG_AEC_MANUAL, OV9282_GAIN_PREC16_EN},
>         {0x3505, 0x8c},
>         {0x3507, 0x03},
>         {0x3508, 0x00},
>
> --
> 2.47.2
>
>

