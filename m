Return-Path: <linux-media+bounces-469-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1406B7EEC68
	for <lists+linux-media@lfdr.de>; Fri, 17 Nov 2023 07:56:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3DE9B1C20A6F
	for <lists+linux-media@lfdr.de>; Fri, 17 Nov 2023 06:56:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AE73D529;
	Fri, 17 Nov 2023 06:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="E3SUpy7L"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C213DA8
	for <linux-media@vger.kernel.org>; Thu, 16 Nov 2023 22:56:49 -0800 (PST)
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-507a98517f3so2219655e87.0
        for <linux-media@vger.kernel.org>; Thu, 16 Nov 2023 22:56:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1700204208; x=1700809008; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T66xySD/6BWFxQMYfuVxdprtl5AUvCVORapS2X/UsjA=;
        b=E3SUpy7LUOCgDeGfqhGxUPiOdZRAtZP9FGwnozOGjKX5seNcFfKNwfK55tMwKjxebw
         iSXslerlw+gjznEzMA7Lf4QBIB8djAkAg+kMd1k+Zl0M5oJNxxjH93sp2pm0cG8bjukM
         mqyoheNlVrXGLACwEaCcdMX8tP/REQxWebTWk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700204208; x=1700809008;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T66xySD/6BWFxQMYfuVxdprtl5AUvCVORapS2X/UsjA=;
        b=Ro5YTiKov8ByNTz/IjARiWzDSNFxy9pd44XI/mVfeKNuQFFh26M2Dd49/UzK9F3H6M
         +yd9txZdBOtT9oNPcXodqlVJX8YldA5GR9DJrtUXnLzvEOt0IQe13t7pLAmyiKSEnB20
         5d2dkixb+HMcFT4MgXzbVOlBPydDRSaJTY2wrLcaT41vryYXaa2uIWfVH5H7EwsaUPDb
         hXj1gCbSKww39q43gOpv9DNnulFkVqjW3T6OU2wHt0DiWFbopChYHX7p4lt268QrIBch
         C3N7TQtgBRfu2kf2UrhOtmKv2YHFBfPgVB/Fn4ffz7wKYbJLSIuR1n7gk8MFYL8i7Q35
         LdFg==
X-Gm-Message-State: AOJu0YwcwkKxdKF34Oqr8WIC4Ptey/VGsODwANcJF/UxB0wsnDM2g1S9
	h6AOtbjduYqnNENIJdz4F9TLG8mIGc+zv7rvzvD3Cw==
X-Google-Smtp-Source: AGHT+IFglSCUhlR+oyIk3/8hEw9b1yf+H4f0nrHpnUuSq77qWRvZSkqp2vLBmJbn9Hw3jSSmXioHPYnOaZeT3dSXuhg=
X-Received: by 2002:ac2:4e0f:0:b0:50a:26b:6ddf with SMTP id
 e15-20020ac24e0f000000b0050a026b6ddfmr16092967lfr.63.1700204207777; Thu, 16
 Nov 2023 22:56:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231116154816.70959-1-andrzej.p@collabora.com> <20231116154816.70959-5-andrzej.p@collabora.com>
In-Reply-To: <20231116154816.70959-5-andrzej.p@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 17 Nov 2023 14:56:36 +0800
Message-ID: <CAGXv+5Hag=-JqYAKOgNUyFSjuwBu6ij1Rsv1cp==duGjY8w42A@mail.gmail.com>
Subject: Re: [RFC 4/6] media: verisilicon: Update H1 register definitions
To: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Cc: linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	Hugues Fruchet <hugues.fruchet@foss.st.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
	Daniel Almeida <daniel.almeida@collabora.com>, 
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Nicolas Dufresne <nicolas.dufresne@collabora.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 16, 2023 at 11:48=E2=80=AFPM Andrzej Pietrasiewicz
<andrzej.p@collabora.com> wrote:
>
> Add definition of register at offset 0x00c.
>
> Signed-off-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
> ---
>  drivers/media/platform/verisilicon/hantro_h1_regs.h | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/drivers/media/platform/verisilicon/hantro_h1_regs.h b/driver=
s/media/platform/verisilicon/hantro_h1_regs.h
> index c1c66c934a24..efb46da23eab 100644
> --- a/drivers/media/platform/verisilicon/hantro_h1_regs.h
> +++ b/drivers/media/platform/verisilicon/hantro_h1_regs.h
> @@ -23,6 +23,15 @@
>  #define     H1_REG_AXI_CTRL_INPUT_SWAP32               BIT(2)
>  #define     H1_REG_AXI_CTRL_OUTPUT_SWAP8               BIT(1)
>  #define     H1_REG_AXI_CTRL_INPUT_SWAP8                        BIT(0)
> +#define H1_REG_DEVICE_CTRL                             0x00c
> +#define     H1_REG_DEVICE_CTRL_SCALE_OUTPUT_SWAP8      BIT(27)
> +#define     H1_REG_DEVICE_CTRL_SCALE_OUTPUT_SWAP16     BIT(26)
> +#define     H1_REG_DEVICE_CTRL_SCALE_OUTPUT_SWAP32     BIT(25)
> +#define     H1_REG_DEVICE_CTRL_MV_OUTPUT_SWAP8         BIT(24)
> +#define     H1_REG_DEVICE_CTRL_MV_OUTPUT_SWAP16                BIT(23)
> +#define     H1_REG_DEVICE_CTRL_MV_OUTPUT_SWAP32                BIT(22)
> +#define     H1_REG_DEVICE_CTRL_INPUT_READ_1MB          BIT(21)
> +#define     H1_REG_DEVICE_CTRL_AXI_DUAL_CHANNEL                BIT(20)

According to the i.MX8M Mini reference manual, this bit is a "disable"
control, i.e. setting this bit disables dual channel AXI. I think the
macro should explicitly state this in the naming, so something like
H1_REG_DEVICE_CTRL_DISABLE_AXI_DUAL_CH(ANNEL).

Other bits matches the reference manual.

>  #define H1_REG_ADDR_OUTPUT_STREAM                      0x014
>  #define H1_REG_ADDR_OUTPUT_CTRL                                0x018
>  #define H1_REG_ADDR_REF_LUMA                           0x01c
> --
> 2.25.1
>
>

