Return-Path: <linux-media+bounces-28062-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id ED4CDA5D10B
	for <lists+linux-media@lfdr.de>; Tue, 11 Mar 2025 21:49:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 90DF2189C604
	for <lists+linux-media@lfdr.de>; Tue, 11 Mar 2025 20:49:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5DBF264A63;
	Tue, 11 Mar 2025 20:49:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hPmUW+YU"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27ADB2620F9;
	Tue, 11 Mar 2025 20:49:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741726167; cv=none; b=oJgoy1iRWwJhEDNQ0VyGj5+mV6q7BgjiteI5sgeZ41UQPEHyoQPpfplogeNWGvCEs/m1fgmD5betijz1rqq3ma5ymH3ru0HKhQbRCw7BFCsVX3WAkeRVSMQoEsQDdXSUUgK0yOMflS1klOHS3i7lKc7doXdKpKKFITD6R8mYP7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741726167; c=relaxed/simple;
	bh=8FmPYlcHFOpSfnHE1XVVmISlRoOzSb1SFySvsKU2bLM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tuRTdiqaexkVmQ8TAAf/fjjkkbhMpZPjmsrkokGKZBh7+kyLzgap0m9rG5YnMT8YAi4dF2vFtCdL+sLY5Q/IW3cmmFJUKU70kM9qyTbDINsrgueRavefvE32106qhwfsXNqH91tIf2P1B9rolFHNOMxqncgVdTnt3+f3HrHaOos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hPmUW+YU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC513C4CEE9;
	Tue, 11 Mar 2025 20:49:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741726167;
	bh=8FmPYlcHFOpSfnHE1XVVmISlRoOzSb1SFySvsKU2bLM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=hPmUW+YU4x+MqhdXvR9UPVQKT2sjxAiptQMsT01ERZr9zhhJOd1ulpswNO3COGf9S
	 GlGAgr8lOc62Soihct+fa9aioqyCTDa4V86HncGSTvdtDDtG7Qw9FdUvUQZ3UH+iYm
	 O3mxdnt/rb8PU4LJ6P0xraOjJyLPcrXBd657GIDNx2aQitpQcC+K7xUUpIPEsGbjp2
	 X7LUKSzne9lQlIF1J5cYZfSFDrVPMsj4Wzaxd6XY0vyc/36ac9DBcZzbu+ULCaBzyB
	 qhVpskFsFkdzhNNQsAm/EOIPgEAq9jbUoZX8Qs8+rahv9taCZFJUEU+Fo4v+R/fwH2
	 6PrTfBVcQvW9A==
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-523ee30e0d4so2022630e0c.2;
        Tue, 11 Mar 2025 13:49:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVSd7ObnlP098bYAo27uDnieGFqfSZJxwdgqYjSw5e39FxNvWcQvEaiUDTDBIsE5GYqS4xYq8PCqiLaHkU=@vger.kernel.org, AJvYcCWw77Ur7Pg8NhMoHNiSkWCkk0GIsJCGPxxBz7MpLH/JqxPIfBoKyP9VA7nCps6VHOx3P0LP7ek1KE+Q6X4=@vger.kernel.org, AJvYcCWxUYZlJlvvWbEnM6o0IuuTe81L5ixHaVQPrnpS+z4e0dPH1ar5palctRWXG+RFjw3zeYXjUxs7W0pRoes=@vger.kernel.org
X-Gm-Message-State: AOJu0YwDkTf+1wZaxVoKnW0+gHl4LtJPY1X6oFEUVILX/GMrnchZPwho
	smRj59lTH2oSkyvozag+79aMNZvmkhJxUYEbItTxwYAwZ01Cc4gwp2Cb3qwPoHo5NySCTYeOall
	+YzK6J0Vqhz5wmjlPVdZRaMALMcc=
X-Google-Smtp-Source: AGHT+IGv8rYPtePlNgNFcXomGIjZGgtpHGzu87s3KufWdYOrUgDZ1+WsBcXha+mFin0bUO1R5dcgCvuClQlj1vzVEKQ=
X-Received: by 2002:a05:6102:3fa7:b0:4c3:49b:8f78 with SMTP id
 ada2fe7eead31-4c30a72e421mr12682483137.25.1741726166067; Tue, 11 Mar 2025
 13:49:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250308-imx214_clk_freq-v1-0-467a4c083c35@apitzsch.eu> <20250308-imx214_clk_freq-v1-1-467a4c083c35@apitzsch.eu>
In-Reply-To: <20250308-imx214_clk_freq-v1-1-467a4c083c35@apitzsch.eu>
From: Ricardo Ribalda Delgado <ribalda@kernel.org>
Date: Tue, 11 Mar 2025 21:49:09 +0100
X-Gmail-Original-Message-ID: <CAPybu_3MEY8GziQFwA6QFfycdYvLovrY0bQOv=xSbOS=X+627A@mail.gmail.com>
X-Gm-Features: AQ5f1JrlWikQKbkSC4DkBsFp6tcFAV6eyIqSzm6I74jq4lhMBcm0n3Qp36BdMzg
Message-ID: <CAPybu_3MEY8GziQFwA6QFfycdYvLovrY0bQOv=xSbOS=X+627A@mail.gmail.com>
Subject: Re: [PATCH RESEND 1/4] media: i2c: imx214: Calculate link bit rate
 from clock frequency
To: git@apitzsch.eu
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, ~postmarketos/upstreaming@lists.sr.ht, 
	phone-devel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 8, 2025 at 10:48=E2=80=AFPM Andr=C3=A9 Apitzsch via B4 Relay
<devnull+git.apitzsch.eu@kernel.org> wrote:
>
> From: Andr=C3=A9 Apitzsch <git@apitzsch.eu>
>
> Replace the magic link bit rate number (4800) by its calculation based
> on the used parameters and the provided external clock frequency.
>
> The link bit rate is output bitrate multiplied by the number lanes. The
> output bitrate is the OPPXCK clock frequency multiplied by the number of
> bits per pixel. The OPPXCK clock frequency is OPCK multiplied by the
> OPPXCK clock division ratio. And OPCK is the external clock frequency
> multiplied by the PreDivider setting and the PLL multiple setting.
>
> Signed-off-by: Andr=C3=A9 Apitzsch <git@apitzsch.eu>
Acked-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/i2c/imx214.c | 51 +++++++++++++++++++++++++++++++++-------=
------
>  1 file changed, 37 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/media/i2c/imx214.c b/drivers/media/i2c/imx214.c
> index 6c3f6f3c8b1f7724110dc55fead0f8a168edf35b..14a4c5094799014da38ab1bee=
c401f0d923c2152 100644
> --- a/drivers/media/i2c/imx214.c
> +++ b/drivers/media/i2c/imx214.c
> @@ -84,6 +84,7 @@
>  #define IMX214_CSI_DATA_FORMAT_RAW10   0x0A0A
>  #define IMX214_CSI_DATA_FORMAT_COMP6   0x0A06
>  #define IMX214_CSI_DATA_FORMAT_COMP8   0x0A08
> +#define IMX214_BITS_PER_PIXEL_MASK     0xFF
>
>  #define IMX214_REG_CSI_LANE_MODE       CCI_REG8(0x0114)
>  #define IMX214_CSI_2_LANE_MODE         1
> @@ -104,11 +105,23 @@
>
>  /* PLL settings */
>  #define IMX214_REG_VTPXCK_DIV          CCI_REG8(0x0301)
> +#define IMX214_DEFAULT_VTPXCK_DIV      5
> +
>  #define IMX214_REG_VTSYCK_DIV          CCI_REG8(0x0303)
> +#define IMX214_DEFAULT_VTSYCK_DIV      2
> +
>  #define IMX214_REG_PREPLLCK_VT_DIV     CCI_REG8(0x0305)
> +#define IMX214_DEFAULT_PREPLLCK_VT_DIV 3
> +
>  #define IMX214_REG_PLL_VT_MPY          CCI_REG16(0x0306)
> +#define IMX214_DEFAULT_PLL_VT_MPY      150
> +
>  #define IMX214_REG_OPPXCK_DIV          CCI_REG8(0x0309)
> +#define IMX214_DEFAULT_OPPXCK_DIV      10
> +
>  #define IMX214_REG_OPSYCK_DIV          CCI_REG8(0x030b)
> +#define IMX214_DEFAULT_OPSYCK_DIV      1
> +
>  #define IMX214_REG_PLL_MULT_DRIV       CCI_REG8(0x0310)
>  #define IMX214_PLL_SINGLE              0
>  #define IMX214_PLL_DUAL                        1
> @@ -204,6 +217,14 @@
>  #define IMX214_PIXEL_ARRAY_WIDTH       4208U
>  #define IMX214_PIXEL_ARRAY_HEIGHT      3120U
>
> +/* Link bit rate for a given input clock frequency in single PLL mode */
> +#define IMX214_LINK_BIT_RATE(clk_freq) \
> +       (((clk_freq) / 1000000) / IMX214_DEFAULT_PREPLLCK_VT_DIV \
> +       * IMX214_DEFAULT_PLL_VT_MPY \
> +       / (IMX214_DEFAULT_OPSYCK_DIV * IMX214_DEFAULT_OPPXCK_DIV) \
> +       * (IMX214_CSI_DATA_FORMAT_RAW10 & IMX214_BITS_PER_PIXEL_MASK) \
> +       * (IMX214_CSI_4_LANE_MODE + 1))
I am always very scared of these macros.... Integer over/underflows
are very easy to miss
If we support a small number of frequencies I would rather see a
function with a switch and a comment explaining where the number comes
from.


> +
>  static const char * const imx214_supply_name[] =3D {
>         "vdda",
>         "vddd",
> @@ -299,15 +320,16 @@ static const struct cci_reg_sequence mode_4096x2304=
[] =3D {
>         { IMX214_REG_DIG_CROP_WIDTH, 4096 },
>         { IMX214_REG_DIG_CROP_HEIGHT, 2304 },
>
> -       { IMX214_REG_VTPXCK_DIV, 5 },
> -       { IMX214_REG_VTSYCK_DIV, 2 },
> -       { IMX214_REG_PREPLLCK_VT_DIV, 3 },
> -       { IMX214_REG_PLL_VT_MPY, 150 },
> -       { IMX214_REG_OPPXCK_DIV, 10 },
> -       { IMX214_REG_OPSYCK_DIV, 1 },
> +       { IMX214_REG_VTPXCK_DIV, IMX214_DEFAULT_VTPXCK_DIV },
> +       { IMX214_REG_VTSYCK_DIV, IMX214_DEFAULT_VTSYCK_DIV },
> +       { IMX214_REG_PREPLLCK_VT_DIV, IMX214_DEFAULT_PREPLLCK_VT_DIV },
> +       { IMX214_REG_PLL_VT_MPY, IMX214_DEFAULT_PLL_VT_MPY },
> +       { IMX214_REG_OPPXCK_DIV, IMX214_DEFAULT_OPPXCK_DIV },
> +       { IMX214_REG_OPSYCK_DIV, IMX214_DEFAULT_OPSYCK_DIV },
>         { IMX214_REG_PLL_MULT_DRIV, IMX214_PLL_SINGLE },
>
> -       { IMX214_REG_REQ_LINK_BIT_RATE, IMX214_LINK_BIT_RATE_MBPS(4800) }=
,
> +       { IMX214_REG_REQ_LINK_BIT_RATE,
> +               IMX214_LINK_BIT_RATE_MBPS(IMX214_LINK_BIT_RATE(IMX214_DEF=
AULT_CLK_FREQ)) },
>
>         { CCI_REG8(0x3A03), 0x09 },
>         { CCI_REG8(0x3A04), 0x50 },
> @@ -362,15 +384,16 @@ static const struct cci_reg_sequence mode_1920x1080=
[] =3D {
>         { IMX214_REG_DIG_CROP_WIDTH, 1920 },
>         { IMX214_REG_DIG_CROP_HEIGHT, 1080 },
>
> -       { IMX214_REG_VTPXCK_DIV, 5 },
> -       { IMX214_REG_VTSYCK_DIV, 2 },
> -       { IMX214_REG_PREPLLCK_VT_DIV, 3 },
> -       { IMX214_REG_PLL_VT_MPY, 150 },
> -       { IMX214_REG_OPPXCK_DIV, 10 },
> -       { IMX214_REG_OPSYCK_DIV, 1 },
> +       { IMX214_REG_VTPXCK_DIV, IMX214_DEFAULT_VTPXCK_DIV },
> +       { IMX214_REG_VTSYCK_DIV, IMX214_DEFAULT_VTSYCK_DIV },
> +       { IMX214_REG_PREPLLCK_VT_DIV, IMX214_DEFAULT_PREPLLCK_VT_DIV },
> +       { IMX214_REG_PLL_VT_MPY, IMX214_DEFAULT_PLL_VT_MPY },
> +       { IMX214_REG_OPPXCK_DIV, IMX214_DEFAULT_OPPXCK_DIV },
> +       { IMX214_REG_OPSYCK_DIV, IMX214_DEFAULT_OPSYCK_DIV },
>         { IMX214_REG_PLL_MULT_DRIV, IMX214_PLL_SINGLE },
>
> -       { IMX214_REG_REQ_LINK_BIT_RATE, IMX214_LINK_BIT_RATE_MBPS(4800) }=
,
> +       { IMX214_REG_REQ_LINK_BIT_RATE,
> +               IMX214_LINK_BIT_RATE_MBPS(IMX214_LINK_BIT_RATE(IMX214_DEF=
AULT_CLK_FREQ)) },
>
>         { CCI_REG8(0x3A03), 0x04 },
>         { CCI_REG8(0x3A04), 0xF8 },
>
> --
> 2.48.1
>
>

