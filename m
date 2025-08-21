Return-Path: <linux-media+bounces-40558-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 353CCB2F75C
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 14:00:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B408EAA451C
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 11:57:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 349BF30FF09;
	Thu, 21 Aug 2025 11:56:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VM7mxTvl"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75E4E2E0929
	for <linux-media@vger.kernel.org>; Thu, 21 Aug 2025 11:56:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755777400; cv=none; b=QvIMlXF0VSu+inzR0erO+Cw9xc5hqmdzyWhLERqeAsE7ratDuSySOVde2rGSN6kMXcB3HgmqkaI6dOo6zUrb9KwfQze7Y6Qv2zPVsg+ffIiMNY0obG2dpSszdhrakcKYORhzrCIqgQjnKApne7JlhO12b4T/dB79TlEbFq9IJPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755777400; c=relaxed/simple;
	bh=uf6vS3Gl2AuJ7xqaJiaRJedxS56Xesptizd08sfMens=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=usc8p9XtumkvzduJsqLUvNsEPEBvpLC2F3fgR0F3M6YJTBtX2bFIz1jXn/h56DqaFpOT3V3DO+g3Eu3O5CyCxLd2BPDad/V2tFWDrpZJY14E9YCiKgg/QJkLUlTknV/WLgJAhMwXW7MBaJP3Cbavw1divFpGxe3C2yCvoaSZxKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VM7mxTvl; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-333f92cb94eso7828741fa.3
        for <linux-media@vger.kernel.org>; Thu, 21 Aug 2025 04:56:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755777395; x=1756382195; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NTRZmz9b45Hl2bTm1apFpY/NlVi3bfWcm6ULUt78zN4=;
        b=VM7mxTvljui9g3lu39TOLUk1ZV6pCMH8OG9CoturI99lwEeKkgCehLIJXnFI4/vOQc
         Xfv7eVzvCp7gInSOBUAbKzyCXFHGSOueTtC3cCcSR7wiAwxx2tGtLVVhGe/kiivOKwFp
         IQXHPxpy+J7zMIWq4oHb1H8j55i5msEMt2S8QlNV+wlIqPKD353nNI5w2rEqAAQ6olKV
         SDdC+kFjxAF46YbZJLE2f73+tl5D39nhSS/SUjUPFsFENoN6BuEwradO09gEt8+gTHUW
         euEgTAZc7VOvIBaJPDt6XMqfceDOhVrWPWLB8QEyrZvVj7LXb8plg7+C3LdG5v9SVrka
         bj6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755777395; x=1756382195;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NTRZmz9b45Hl2bTm1apFpY/NlVi3bfWcm6ULUt78zN4=;
        b=ioPfOTEpKbgSxIQCPZi0z6jGJjDXQ6/Bdqy5kvtKgOQVSG9cBMmWyY2m+7KSFIeR4l
         loQnYvaF7YVnb9GghLtr0sz+TFS38BcByU5YtTjEUF0gljzOjrcyMKtNClykm3qec/cU
         slXTiBsvOWSvOhRZMtVpw/Ucm0Dc24eFmC+u5kl3jFDLG6OroB8tfyM4UVZHljExl6eq
         3spnIvXm02HJrAvPBLcU2kDXeIoWJNDZpHeUEUXmHJzZYA2HgnRvkmBRHDE8dJ+KwtYt
         3TmmfxnUklw9a7058YX/Vej+vI2bcKHwPUlq0aWeGQ4oDZUSeS9YZufeL3d9ReHrJkDa
         2OZA==
X-Forwarded-Encrypted: i=1; AJvYcCWWzYM16zJP9O/W/tgVv0c7Q+96wuhcYSDNoUbj1jsxJdSdP/L70ReWIuTV2xRvPKQm5Z/swxEwqR4V/w==@vger.kernel.org
X-Gm-Message-State: AOJu0YwGztLh7y3S79qatLyIjQ5B08cL+JwbrY+PR3m6K42FodxinsAT
	FUN+FijRvby1W/AKwQmIfmbk4lxkNNQKEla0SIe2VglQjuhppVmt4ySwyorgBUinKLKzHh/UPz4
	KtL0bkAm2LOcVmVhP9yfe/V5HvrX0Ne7A7MpNMAqu4Q==
X-Gm-Gg: ASbGnctjY0pWdftskhuoFyfD4SIshDjSndF4tdvi72Im7OCRwilk/i8VX/kZg2ha69/
	G0b1wk0bZPUvGNC+N1BvFOIUvACx9qgv05BPK0NIrcNXi3rR1hBSSId0WUn2sc0l1/WdnnCafme
	1rdIGaHVUnQ7yPlWgGLZT3hNYyVzf+vXzaB3z/3KFETKxiRnJo/cze6Zph86JFJtZouLnn0eMkp
	w08p1k=
X-Google-Smtp-Source: AGHT+IHLNT7GNgIK+Yc1AUKtRsJ+Pu3qxvF99KQLgmBORucS0GzpXEZZoUCuuB+z9QVIQwaQ+MKKQAluSVZweFngFeU=
X-Received: by 2002:a05:651c:54a:b0:332:57b8:92eb with SMTP id
 38308e7fff4ca-33549e7e81dmr7293611fa.10.1755777395492; Thu, 21 Aug 2025
 04:56:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250820171302.324142-1-ariel.dalessandro@collabora.com> <20250820171302.324142-14-ariel.dalessandro@collabora.com>
In-Reply-To: <20250820171302.324142-14-ariel.dalessandro@collabora.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 21 Aug 2025 13:56:24 +0200
X-Gm-Features: Ac12FXxjp4iK3cFyWU_S6p_GaEq9BIq8dd_UPbgZlXscJTvrfMnMiNgyqvjOGHs
Message-ID: <CACRpkdbpKqKyebADj0xPFq3g0biPh-vm4d6C3sd8r0URyfyYRg@mail.gmail.com>
Subject: Re: [PATCH v1 13/14] dt-bindings: input/touchscreen: Convert MELFAS
 MIP4 Touchscreen to YAML
To: "Ariel D'Alessandro" <ariel.dalessandro@collabora.com>
Cc: airlied@gmail.com, amergnat@baylibre.com, andrew+netdev@lunn.ch, 
	andrew-ct.chen@mediatek.com, angelogioacchino.delregno@collabora.com, 
	broonie@kernel.org, chunkuang.hu@kernel.org, ck.hu@mediatek.com, 
	conor+dt@kernel.org, davem@davemloft.net, dmitry.torokhov@gmail.com, 
	edumazet@google.com, flora.fu@mediatek.com, houlong.wei@mediatek.com, 
	jeesw@melfas.com, jmassot@collabora.com, kernel@collabora.com, 
	krzk+dt@kernel.org, kuba@kernel.org, 
	kyrie.wu@mediatek.corp-partner.google.com, lgirdwood@gmail.com, 
	louisalexis.eyraud@collabora.com, maarten.lankhorst@linux.intel.com, 
	matthias.bgg@gmail.com, mchehab@kernel.org, minghsiu.tsai@mediatek.com, 
	mripard@kernel.org, p.zabel@pengutronix.de, pabeni@redhat.com, 
	robh@kernel.org, sean.wang@kernel.org, simona@ffwll.ch, 
	support.opensource@diasemi.com, tiffany.lin@mediatek.com, tzimmermann@suse.de, 
	yunfei.dong@mediatek.com, devicetree@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-sound@vger.kernel.org, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Ariel,

thanks for your patch!

On Wed, Aug 20, 2025 at 7:17=E2=80=AFPM Ariel D'Alessandro
<ariel.dalessandro@collabora.com> wrote:

> +  ce-gpios:
> +    description: GPIO connected to the CE (chip enable) pin of the chip
> +    maxItems: 1

Mention that this should always have the flag GPIO_ACTIVE_HIGH
as this is required by the hardware.

Unfortunately we have no YAML syntax for enforcing flags :/

With that fix:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

