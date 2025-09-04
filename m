Return-Path: <linux-media+bounces-41751-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A322B4322D
	for <lists+linux-media@lfdr.de>; Thu,  4 Sep 2025 08:19:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 29B04544D81
	for <lists+linux-media@lfdr.de>; Thu,  4 Sep 2025 06:19:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF45F25A62E;
	Thu,  4 Sep 2025 06:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="YQ0V4/o6"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 939C613E898
	for <linux-media@vger.kernel.org>; Thu,  4 Sep 2025 06:18:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756966738; cv=none; b=Vd7Il6zEB81mbTxNZmDbRYPTg7+a+96QHe78MFelAQlvnyVtcFR4sL/Uc6SfifTBu0hXl3OPZXXJ9O5vnJqmsEWLWrELUi7y9qc6oWEDNdqpTPYH3GtLzpHkpNfg0tM5orVI5OCe1T2444+SXjTIWyDsGr2t+OCTk40WZH/WBoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756966738; c=relaxed/simple;
	bh=V+SCQTip4Jj4Bo7UqGS8PgqQeKkz3sa/LNgtAzDwCz0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=i+RO7VMC0bD/PUrDDCTivP1MnoCIgC6la2x0Y2TWs4hpKyLUp6tIjPz/6RlaeFFXSmOWiC3SGtiZfaUpACx8jFaYUr1Oy3zdYyoW4jOE2GQ74lMzLsGL4IUFnm7LEJ8Jv3uuhXOfTdGBzrOk/5KCVQ8nT1qhe8w5LseP8OaaCAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=YQ0V4/o6; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-337f6cdaf2cso4949941fa.2
        for <linux-media@vger.kernel.org>; Wed, 03 Sep 2025 23:18:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1756966735; x=1757571535; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7CQBkphJcdYBghhb0rqPa4FTq1gxFu4hiwbVOVVdraE=;
        b=YQ0V4/o6wOwedE4WLJ0UhQs/S9981jM09Alpui5FQ8Fsxwot/cL1jZZyBmzbU1xJiQ
         zNCmDYHwzYdMHZmTXYs+hyKNSQuFa2BSKZ2FJHI1e4bpLF+aAiLTZdd2L/UnMdsl6UJR
         ElJCJtzpAFhrjbvgm5TIO+kvq27B7tnjvS7SU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756966735; x=1757571535;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7CQBkphJcdYBghhb0rqPa4FTq1gxFu4hiwbVOVVdraE=;
        b=M46gIXbVA9L91TxONHS0rde2rhEKnOtTRGmOwfYmy3nwcTqNOTqkiYIiZCiTAbABRC
         09NswYtU8hTh9PmEm65rNVyUJs30BHJjlQbTrobvowYXGCrOGIRzOlhqpc3/p+iDXWIl
         TTM0t26OTCHFBbKoaSHARcMycanW96SmXBcn5NOoALoWeUxJKIisq3cAYKLx9LgBOrzu
         ZsaxP/UFIoh/1xBOk0A4J3DW5EsNwerlFTI6hf84MSwdTDRXAsBUVvXhPtoL71/QYnWg
         XT/lfp+GdkGA0ACU57RRqx5MlH9sqU+dEMfxMewBRZDI7F8V9OoYSG2vNYEbFRnNk29x
         AsRQ==
X-Forwarded-Encrypted: i=1; AJvYcCX2Jmjvxj5knOE6kpzDQFqM18XuRI4n1Ip4khmKKHo2FFqY+pkxI5zwAO4k0oUREva4fYJMul1NSAP2kw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxz1PHaVQE7kLHBYNg9E/2a+O9z6yQJGq2qNPYtB1+kQYHuzkc9
	mLtTuNgS6byGRCOHv4k0SEArmEN/gATS/MpOsugyax11+Fb73Rze1br3VY2W9V8Z9ElzFMJj3+Q
	oWhZpwpuL37Ahcw0FiidlUVSgJ2MeBtceZ1gYrIH5
X-Gm-Gg: ASbGncuzG1B4DspwCYVEnYnUldJlJCIluCLNUxyeMwRHO4g83i24ACuco4gTjFcz/k2
	PMY0YCqx4/mzJpyfwPJkfAPbuf3RC3BRrYo3+SuiY/N5KTpVKoU2F9ezoB39xLVO2GIqcSB8AH7
	QWCAd23P9oQsHtEul0lOFmLvZIhJteYh32bup+Uy1UV+qO+4ty8+zsfY4ObXWlb3mR+w5WS7oFT
	I/HEjoOSal4quW8XjLG35Qmi/29OycE7xF67siMqjam3So0f29MzcC/WsM=
X-Google-Smtp-Source: AGHT+IFmpIgZJkgG1TcnUjMeEXxa3OW2u+0iRL2YEUKOrf2DSwzSi6u1IDGdInKUk3OLck6UIHWPn37d12I2FT8Uhls=
X-Received: by 2002:a2e:a991:0:b0:337:e585:8082 with SMTP id
 38308e7fff4ca-337e585814emr40485291fa.22.1756966734673; Wed, 03 Sep 2025
 23:18:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250820075405.1041838-1-wenst@chromium.org> <CAC=S1njQ5z2Ezz2OXDJ6Pk_9EEPgG3gu=Os7uFv6Lmdq0X77og@mail.gmail.com>
In-Reply-To: <CAC=S1njQ5z2Ezz2OXDJ6Pk_9EEPgG3gu=Os7uFv6Lmdq0X77og@mail.gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 4 Sep 2025 14:18:43 +0800
X-Gm-Features: Ac12FXyJUlQIqk0i4ipdL_cOK9k6d650IYlqwO_gxbw4GTZ_J2T6UQ6kDktMWOs
Message-ID: <CAGXv+5GgGs5LEGJV4fpUpxOXC=_Fvo3CA4S10zZGxes9C2HrEQ@mail.gmail.com>
Subject: Re: [PATCH v2] media: mediatek: vcodec: Use spinlock for context list
 protection lock
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>
Cc: Yunfei Dong <yunfei.dong@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	Tomasz Figa <tfiga@chromium.org>, Fei Shao <fshao@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Ping?

On Wed, Aug 20, 2025 at 6:37=E2=80=AFPM Fei Shao <fshao@chromium.org> wrote=
:
>
> On Wed, Aug 20, 2025 at 3:54=E2=80=AFPM Chen-Yu Tsai <wenst@chromium.org>=
 wrote:
> >
> > Previously a mutex was added to protect the encoder and decoder context
> > lists from unexpected changes originating from the SCP IP block, causin=
g
> > the context pointer to go invalid, resulting in a NULL pointer
> > dereference in the IPI handler.
> >
> > Turns out on the MT8173, the VPU IPI handler is called from hard IRQ
> > context. This causes a big warning from the scheduler. This was first
> > reported downstream on the ChromeOS kernels, but is also reproducible
> > on mainline using Fluster with the FFmpeg v4l2m2m decoders. Even though
> > the actual capture format is not supported, the affected code paths
> > are triggered.
> >

We really should get this in as this triggers a very large and scary
warning every time the encoder or decoder is used.


ChenYu

> > Since this lock just protects the context list and operations on it are
> > very fast, it should be OK to switch to a spinlock.
> >
> > Fixes: 6467cda18c9f ("media: mediatek: vcodec: adding lock to protect d=
ecoder context list")
> > Fixes: afaaf3a0f647 ("media: mediatek: vcodec: adding lock to protect e=
ncoder context list")
> > Cc: Yunfei Dong <yunfei.dong@mediatek.com>
> > Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> > ---
> > Changes since v1:
> > - Switched to _irqsave / _irqrestore variants even in helper only calle=
d
> >   by IRQ handler (Tomasz)
> >
> >  .../mediatek/vcodec/common/mtk_vcodec_fw_vpu.c       | 10 ++++++----
> >  .../mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c     | 12 +++++++-----
> >  .../mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h     |  2 +-
> >  .../platform/mediatek/vcodec/decoder/vdec_vpu_if.c   |  5 +++--
> >  .../mediatek/vcodec/encoder/mtk_vcodec_enc_drv.c     | 12 +++++++-----
> >  .../mediatek/vcodec/encoder/mtk_vcodec_enc_drv.h     |  2 +-
> >  .../platform/mediatek/vcodec/encoder/venc_vpu_if.c   |  5 +++--
> >  7 files changed, 28 insertions(+), 20 deletions(-)
>
> Reviewed-by: Fei Shao <fshao@chromium.org>

