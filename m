Return-Path: <linux-media+bounces-44932-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D003BEB16C
	for <lists+linux-media@lfdr.de>; Fri, 17 Oct 2025 19:36:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 709804EA839
	for <lists+linux-media@lfdr.de>; Fri, 17 Oct 2025 17:36:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD5AB307482;
	Fri, 17 Oct 2025 17:36:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Yc0ObcZB"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13F3B221726
	for <linux-media@vger.kernel.org>; Fri, 17 Oct 2025 17:36:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760722572; cv=none; b=OUDjvpl8kBkojzAIrVrrEXN8mXLCtXZPhX2/YT+o9uYTaGuEb64+V76JB3zC19q1GgG1N93rup5FXz85MBVOgYC5SHBx8P+WXArrBE5OU1cwCWfMPeDyjBPOU2mkbCM2707Gy5yXP+O5dCp77h4C4HeMESl7M2L5ao8wo9K7NHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760722572; c=relaxed/simple;
	bh=GNfFW9qgQQpSKcsiZeUd7TPByXWvy+HcyF94khmcopY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LO/BgrOMtSMzgWz5leN5L9iP9/lxJw712hUXiH8l74fb8WyVfEx1uZOlKIJRqNkkf9XzvmTo2tGzcYBL1/ri7t0eIolBR5KhP76dorV3qL0mdKa+Y/zJ1CCWWmsiraYhZaX7C3AT+B0vA+MsYVqrToSzVR7bYdi8GHyofXNUeEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Yc0ObcZB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80681C4CEFE
	for <linux-media@vger.kernel.org>; Fri, 17 Oct 2025 17:36:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760722571;
	bh=GNfFW9qgQQpSKcsiZeUd7TPByXWvy+HcyF94khmcopY=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=Yc0ObcZBbebu/m0akPq/cLbZH4cfBz1+odkhXHMihVNF8tIRF5JLniZridxy6/49f
	 umqjJqOqVAWZU6m5AojEFzU4lUBQVF/gA5t/RcYrBcmmbLsMtBptiV9ZjMi3JFX7hN
	 u34eWdvpEi5CbXPxe/7nn73R8UZPMRUt5ZHSJ4k8vFs+yPMr0SkzRlr6TC2ksFl0M1
	 Nhowxtfr89kG0M0vb18eUXZzc4WPfeKuIMHWfPH/X3zcx5k356Z6waVxJfqYHI+t17
	 bIg/p16igMiip//ww8dAkQFKHcaRK0QD+9yK+QqMX1MCZoXzFrH4Ru8pidSz14AD01
	 C3QulrQJlEUQw==
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-3652d7800a8so16155381fa.0
        for <linux-media@vger.kernel.org>; Fri, 17 Oct 2025 10:36:11 -0700 (PDT)
X-Gm-Message-State: AOJu0YzzQrk080ust0gL5PfZH5E0oOwnx6Byej1nxn+ezK1f9SP/9hkx
	Xe2XO8/l00gI9sAvBrdrrY9AJ7opnLk5mS6fyuDMJb3xZtLZglIfabJbXHONJwK761H3Gq5inBn
	4McdPso2pANrf8A/FKZvwyv5OFDHdKZ8=
X-Google-Smtp-Source: AGHT+IGiE6AxM9FssLHV6V2kR7xYD81IKqOxuluw2S2FyBVvqwxa1Jw23q6d/MDZmKcgsWyTG5v9+byO8Weep0+XJUM=
X-Received: by 2002:a05:651c:160f:b0:36a:1852:f33d with SMTP id
 38308e7fff4ca-37797a0fc1fmr16612341fa.28.1760722569815; Fri, 17 Oct 2025
 10:36:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <dbccf041ba384d61d9a7f048d7eaab111af85dbb.camel@collabora.com>
In-Reply-To: <dbccf041ba384d61d9a7f048d7eaab111af85dbb.camel@collabora.com>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Sat, 18 Oct 2025 01:35:56 +0800
X-Gmail-Original-Message-ID: <CAGb2v675dx-NECeRAf9O462QnAmH0rwQT30qxERG12-cwoVoBw@mail.gmail.com>
X-Gm-Features: AS18NWBM481y-y8tmvu3F11HEvCd3eFr8a3gmzJm-zqQIn0LbWKBSXlSeNfs4EQ
Message-ID: <CAGb2v675dx-NECeRAf9O462QnAmH0rwQT30qxERG12-cwoVoBw@mail.gmail.com>
Subject: Re: [GIT PULL v2 FOR 6.19] Media CODEC Fixes 2025-10-17
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc: linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Sat, Oct 18, 2025 at 12:56=E2=80=AFAM Nicolas Dufresne
<nicolas.dufresne@collabora.com> wrote:
>
> Hi Mauro, Hans,
>
> This pull request contains a collection of bug fixes in various codec dri=
vers
> and an improved validation of AV1 sequence parameters.

Is it possible to fast track these for 6.18? Some of these fix fatal errors=
.

> cheers,
> Nicolas
>
> p.s. sorry for the previous empty subject request.
>
> ---
>
> The following changes since commit 082b86919b7a94de01d849021b4da820a6cb89=
dc:
>
>   media: v4l2-mem2mem: Fix outdated documentation (2025-10-14 15:07:37 +0=
200)
>
> are available in the Git repository at:
>
>   https://gitlab.freedesktop.org/linux-media/users/ndufresne.git tags/for=
-6.19-media-codec-fixes-2025-10-17
>
> for you to fetch changes up to 60d4fac49415810bd4d07b18570065999e318a7b:
>
>   media: allegro: fix race conditions in channel handling (2025-10-16 09:=
32:55 -0400)
>
> ----------------------------------------------------------------
> Various CODEC bug fixes
>
> ----------------------------------------------------------------
> Chen-Yu Tsai (1):
>       media: mediatek: vcodec: Use spinlock for context list protection l=
ock

This one.

>
> Haoxiang Li (1):
>       media: mediatek: vcodec: Fix a reference leak in mtk_vcodec_fw_vpu_=
init()
>
> Johan Hovold (1):
>       media: platform: mtk-mdp3: fix device leaks at probe
>
> Matthias Fend (3):
>       media: allegro: print warning if channel creation timeout occurs
>       media: allegro: process all pending status mbox messages
>       media: allegro: fix race conditions in channel handling
>
> Ming Qian (2):
>       media: amphion: Remove vpu_vb_is_codecconfig
>       media: amphion: Cancel message work before releasing the VPU core
>
> Nicolas Dufresne (2):
>       media: verisilicon: Fix CPU stalls on G2 bus error

This one.

>       media: verisilicon: Protect G2 HEVC decoder against invalid DPB ind=
ex

And maybe this one?


Thanks
ChenYu

>
> Pavan Bobba (1):
>       media: v4l2-ctrls: add full AV1 profile validation in validate_av1_=
sequence()
>
>  drivers/media/platform/allegro-dvt/allegro-core.c                   | 11=
4 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++=
++++++++++++++++++-----------------------
>  drivers/media/platform/amphion/vpu_malone.c                         |  2=
3 +++--------------------
>  drivers/media/platform/amphion/vpu_v4l2.c                           |  1=
6 +++-------------
>  drivers/media/platform/amphion/vpu_v4l2.h                           |  1=
0 ----------
>  drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c                |  1=
4 ++++++++++++++
>  drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vpu.c   |  1=
4 +++++++++-----
>  drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c |  1=
2 +++++++-----
>  drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h |   =
2 +-
>  drivers/media/platform/mediatek/vcodec/decoder/vdec_vpu_if.c        |   =
5 +++--
>  drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv.c |  1=
2 +++++++-----
>  drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv.h |   =
2 +-
>  drivers/media/platform/mediatek/vcodec/encoder/venc_vpu_if.c        |   =
5 +++--
>  drivers/media/platform/verisilicon/hantro_g2.c                      |  8=
8 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++----=
---------------
>  drivers/media/platform/verisilicon/hantro_g2_hevc_dec.c             |  1=
7 +++++++++++++----
>  drivers/media/platform/verisilicon/hantro_g2_regs.h                 |  1=
3 +++++++++++++
>  drivers/media/platform/verisilicon/hantro_g2_vp9_dec.c              |   =
2 --
>  drivers/media/platform/verisilicon/hantro_hw.h                      |   =
1 +
>  drivers/media/platform/verisilicon/imx8m_vpu_hw.c                   |   =
2 ++
>  drivers/media/v4l2-core/v4l2-ctrls-core.c                           | 12=
5 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++=
+++++++++++++++++++++++++++-------------------------
>  19 files changed, 340 insertions(+), 137 deletions(-)
>
> --
> Nicolas Dufresne
> Principal Engineer at Collabora
>
> --
> Nicolas Dufresne
> Principal Engineer at Collabora

