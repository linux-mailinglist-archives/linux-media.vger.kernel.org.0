Return-Path: <linux-media+bounces-468-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id BC6427EEC24
	for <lists+linux-media@lfdr.de>; Fri, 17 Nov 2023 07:12:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4C3A9B20AC5
	for <lists+linux-media@lfdr.de>; Fri, 17 Nov 2023 06:12:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3700D517;
	Fri, 17 Nov 2023 06:12:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="E40KVoy+"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 537A48E
	for <linux-media@vger.kernel.org>; Thu, 16 Nov 2023 22:12:01 -0800 (PST)
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-50797cf5b69so2244575e87.2
        for <linux-media@vger.kernel.org>; Thu, 16 Nov 2023 22:12:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1700201519; x=1700806319; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dzkIKBP1RSNSjcHa3ooQec7vnsT1BIreWgj3m6bqwkw=;
        b=E40KVoy+wl8VWruMa6ogYnW6/ltu2bikfls4hZO0b9hNul0P8uSvJ4kDttdJPVym81
         Iu5K6FGC4FaI9a6YlE0TqwOTvX19ChANf1+zIFLgWzPn5gWZwggqJttZJ5nqmmC+RFT7
         N7l5B8VmrhpEyJc+6BjeCbtquE7smsbi+zEiU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700201519; x=1700806319;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dzkIKBP1RSNSjcHa3ooQec7vnsT1BIreWgj3m6bqwkw=;
        b=CXiUqw+cA572n9ZjNGugeuDIlLLzs0s0LNP34Cb6hjtFH4NXb8Qlbtqd7JUlvCsyWz
         C3QDsMMj6bDiEXorVmkGywnqzowizmb2H+3WZy7XsLhmBet3bUgxfpwI4WBhDW+Xrj62
         iPvf0BRoE3ZDQec7+c62/n+1bmUkoWOApK4mfyDTf+DIUzSFN6D44ZL5rqqZQiNjy++0
         +QZYa2C1cvMyOrZrsUKRDO3bgIqRRck6pTV+QOkt/SA0hV+zFajgxtcPUfTY9xQCPNzk
         lOYJHbIaKOhz9AfZ+8weXSzHX2uYTbn3wfqE7Cbcp7v/JjhKs/YGZbkMc4EHsSuYN9Ch
         KyVA==
X-Gm-Message-State: AOJu0Yz0S1SLXV/ps7xsALntHFNILARli+TMkZnEcS4Ht7WdHelJfpkn
	wEzL7fuLOwF22IHD6VQWN0GADGsi6CyQb4kC5M+DNQ==
X-Google-Smtp-Source: AGHT+IFbPm0GAk/S8jZWFqJiaxpI9RRydHhWmQXXbn39qHE7VNrw5ZxXw95aX6hOEaZc2PyZQeXNgpYfKQi/QvJmefo=
X-Received: by 2002:a05:6512:39c9:b0:50a:7640:6a7f with SMTP id
 k9-20020a05651239c900b0050a76406a7fmr15645335lfu.12.1700201519373; Thu, 16
 Nov 2023 22:11:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231116154816.70959-1-andrzej.p@collabora.com> <20231116154816.70959-4-andrzej.p@collabora.com>
In-Reply-To: <20231116154816.70959-4-andrzej.p@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 17 Nov 2023 14:11:48 +0800
Message-ID: <CAGXv+5GhaF94ZRwrZ_CWg3j6bVYyEqZru9LM7ABDB29-cPhqSQ@mail.gmail.com>
Subject: Re: [RFC 3/6] media: verisilicon: Improve constant's name
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
> For VP8 BIT(18) of this register is for enabling the boolean encoder.

Yes, but for H.264 it selects the entropy coding mode, 0 for CAVLC
and 1 for CABAC. You even add it back in the last patch. I'd do it
here, so you disambiguate the definition within one patch.

ChenYu


> Signed-off-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
> ---
>  drivers/media/platform/verisilicon/hantro_h1_regs.h    | 2 +-
>  drivers/media/platform/verisilicon/hantro_h1_vp8_enc.c | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/media/platform/verisilicon/hantro_h1_regs.h b/driver=
s/media/platform/verisilicon/hantro_h1_regs.h
> index 7752d1291c0e..c1c66c934a24 100644
> --- a/drivers/media/platform/verisilicon/hantro_h1_regs.h
> +++ b/drivers/media/platform/verisilicon/hantro_h1_regs.h
> @@ -70,7 +70,7 @@
>  #define    H1_REG_ENC_CTRL2_DISABLE_QUARTER_PIXMV      BIT(22)
>  #define    H1_REG_ENC_CTRL2_TRANS8X8_MODE_EN           BIT(21)
>  #define    H1_REG_ENC_CTRL2_CABAC_INIT_IDC(x)          ((x) << 19)
> -#define    H1_REG_ENC_CTRL2_ENTROPY_CODING_MODE                BIT(18)
> +#define    H1_REG_ENC_CTRL2_VP8_BOOLENC_ENABLE         BIT(18)
>  #define    H1_REG_ENC_CTRL2_H264_INTER4X4_MODE         BIT(17)
>  #define    H1_REG_ENC_CTRL2_H264_STREAM_MODE           BIT(16)
>  #define    H1_REG_ENC_CTRL2_INTRA16X16_MODE(x)         ((x))
> diff --git a/drivers/media/platform/verisilicon/hantro_h1_vp8_enc.c b/dri=
vers/media/platform/verisilicon/hantro_h1_vp8_enc.c
> index 05aa0dd9c09c..08c5079fbfd0 100644
> --- a/drivers/media/platform/verisilicon/hantro_h1_vp8_enc.c
> +++ b/drivers/media/platform/verisilicon/hantro_h1_vp8_enc.c
> @@ -1226,7 +1226,7 @@ static void hantro_h1_vp8_enc_set_params(struct han=
tro_dev *vpu, struct hantro_c
>         reg =3D 0;
>         if (mb_width * mb_height > MAX_MB_COUNT_TO_DISABLE_QUARTER_PIXEL_=
MV)
>                 reg =3D H1_REG_ENC_CTRL2_DISABLE_QUARTER_PIXMV;
> -       reg |=3D H1_REG_ENC_CTRL2_ENTROPY_CODING_MODE;
> +       reg |=3D H1_REG_ENC_CTRL2_VP8_BOOLENC_ENABLE;
>
>         inter_favor =3D 128 - ctx->vp8_enc.prob_intra;
>         if (inter_favor >=3D 0)
> --
> 2.25.1
>
>

