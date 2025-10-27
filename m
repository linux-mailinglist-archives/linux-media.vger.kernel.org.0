Return-Path: <linux-media+bounces-45687-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 821D1C0F43D
	for <lists+linux-media@lfdr.de>; Mon, 27 Oct 2025 17:27:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 08AE04E361C
	for <lists+linux-media@lfdr.de>; Mon, 27 Oct 2025 16:26:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DA793093AC;
	Mon, 27 Oct 2025 16:26:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WLa74pib"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D46E3305051
	for <linux-media@vger.kernel.org>; Mon, 27 Oct 2025 16:26:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761582386; cv=none; b=sVZI6X+PIlrQdbLBK9Pzdbnow6i3WyVXKFQzawe6PAzvYjn/IEyLEQDU76K5KIHK50QgnUob01f26CU2wyBWRF6/87cGqrHjnrnrGmIiOzcvaG/r00dj1M3j2Gtlzdoep9dnBv46S+GputNQ1l1nli7DETGrhQmHw2K5ngczeDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761582386; c=relaxed/simple;
	bh=Bs4B8/uykKw1jcppFuo9rBAa0l4UHhlbTVgzfpm/mNc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FocAvHmmnr3tRoSP1RoSy3JFDoXfADMw4KChUtoY8yLJHCQuGTeHHBTl1QsJRYHcRbfmCjUYURrkWcVqXBS7L4L1+EUsdsspX/Gpr5ZW+UqvYbHh4wFc6XR5VAQ9oMnJIolKcbzi5CCCc/cnCp8bt4SP1B2D4BxTkh4xV0/QU08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WLa74pib; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3f0ae439b56so2429711f8f.3
        for <linux-media@vger.kernel.org>; Mon, 27 Oct 2025 09:26:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761582383; x=1762187183; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5SrTb8IVi1M+UPh4x4SyPxsMBzZTSdlA/Lo+QiBLzFo=;
        b=WLa74pibiOKry6Zo3ZBWIm22nFO5FMxyQ4eMt2zdr697we6dHC8IwN1IMjiTm7PmCM
         z744oQ/9G7pEnhcjH4S/jYrnTVYHVyljCxJt1TmYr6ZrUk6EhGHGdTgWYeczesQMAsds
         B/pPs+z1owWXKXx+PPYbvmS49Auejbk0/S4xA9n6t6kdn8g7VeP1wSR6X4HGLP3opEn1
         6+Ifte9S+4cZKN4lTiBwzPxKjuRG/DTH5ZWoPlQWvnxBVtuZ0XGZ09YuM5+4FzUK6rhb
         iBCMAZXSzBnll4fL4aYOJxxKBb2E/g5w4me0XnfDa8cn5BshdkF4RlZsLoqYxQa+wV71
         B04g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761582383; x=1762187183;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5SrTb8IVi1M+UPh4x4SyPxsMBzZTSdlA/Lo+QiBLzFo=;
        b=TQjoeGWPpHj4Sl3aAOqq6mR5uIPhSuJvuP4MZXxnRH54GjlU5VwFk561BJKTiAkif3
         HI5ix8IkfkV6bdMFWIcY7uQwGMg34rW6f1N1LTawIqTEuSFZ3hassVyAguRqTJlrlPo/
         K/mMGawgXaqjnckEo1PPJc4haUCYmteqy6PJ22TrJsTvIj72uHzXTXVqpUJjzcDce13T
         Yg+8peZMGjoehdcCg3byyy0EVu2p0B8Ct6ESjmOI/tZmOV0onNad88Js3xzgjQdaa+cJ
         aeFox58j8FLOtEjncxOvYoPJ7I2z+TXHvPTsBSVvwiMetD8tUQUSojyuS1eAExR49GLH
         CtWQ==
X-Forwarded-Encrypted: i=1; AJvYcCXj4km5gGO8/GdPTQfelCYPGA6defbZRSPnPfDTXsRIRJfiCY5y10t+L1ES8O94vF/CAXBZyb/yPwF/vw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwDhcIUltGUcUY9nrUlnckQ0yay5f1qcmGyxB2zoPNw92jBCILp
	DRwCLVELr5LSGJtxSq26oLlxD5sRYeAyFA+OQmABEbCIMV8TY0GbjQJmhnFzVK/kJSuHTOIMwak
	wFJvahDi8y813hQ8HH9ADJUWinpguqJ8=
X-Gm-Gg: ASbGncs5PItxxQ+feSf2li42ZyOaFA77p5ENdMHqW35hGyVluSKUiml2tDwAEi/gozA
	l9+6JCqgi4g1KTGOKS/t4bLYi8Vd5dWCHBl023Fn1uno4mFHIBAFFUJedx5R9mzVNrmu4RI3jxj
	PbwUPbEwKj1UX6HKAguww43o9+L0sCkI7lv7frSSYEnR9QwSVz74fxMvRhfqtVQluHV4X3BhpOZ
	5zMIF6TA/SP41idoKTVDe8mqfWeqKLVozipmACFgPZcraxV2+9MaUSL8iuvi0w+16RvCm22
X-Google-Smtp-Source: AGHT+IHFJxRu5qBnlqFAzxiFl/DfUrP65/+IhuceL8h0odWrzhYK3yEz43INR8RoomWFqZX8ENb8Yl5j8aUnmvnmeyI=
X-Received: by 2002:a05:6000:22c1:b0:429:8d8b:fef7 with SMTP id
 ffacd0b85a97d-429a7e8af59mr280669f8f.49.1761582382833; Mon, 27 Oct 2025
 09:26:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251022142051.70400-1-clamor95@gmail.com> <7c5a1a6e-cad2-46c3-b5cd-3e92ca6d99a7@kernel.org>
In-Reply-To: <7c5a1a6e-cad2-46c3-b5cd-3e92ca6d99a7@kernel.org>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Mon, 27 Oct 2025 18:26:11 +0200
X-Gm-Features: AWmQ_bndZ_UMW04Dj_5iuem6GBL-JfBmCI1w73hLOMnrt2c_rPQxhjX1IsYuHlw
Message-ID: <CAPVz0n1aj8A5L50WcO-W4jSH2t6kfi6qXN-2FkmZxiAYJUN3vg@mail.gmail.com>
Subject: Re: [PATCH v5 00/23] tegra-video: add CSI support for Tegra20 and Tegra30
To: Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Sowjanya Komatineni <skomatineni@nvidia.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Prashant Gaikwad <pgaikwad@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Mikko Perttunen <mperttunen@nvidia.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	=?UTF-8?Q?Jonas_Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>, 
	Dmitry Osipenko <digetx@gmail.com>, Charan Pedumuru <charan.pedumuru@gmail.com>, 
	Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>, Aaron Kling <webgeek1234@gmail.com>, 
	Arnd Bergmann <arnd@arndb.de>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D0=BD, 27 =D0=B6=D0=BE=D0=B2=D1=82. 2025=E2=80=AF=D1=80. =D0=BE 18:0=
8 Hans Verkuil <hverkuil+cisco@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> Hi Svyatoslav,
>
> On 22/10/2025 16:20, Svyatoslav Ryhel wrote:
> > Add support for MIPI CSI device found in Tegra20 and Tegra30 SoC along
> > with a set of changes required for that.
>
> Other than patch 06/23 that looked iffy (although the original code was i=
ffy as
> already), for which I posted a review, this series looks almost ready.

06/23 addresses issue I have encountered while testing with mt9m114 I
will add detailed explanation later in the 06/23 commit discussion.

>
> Should the clk patches be merged together with the media patches? Or can =
those
> go in via the clk subsystem? If it is the latter, then I'll need an Acked=
-by from the
> clk subsystem maintainer.
>

I suppose this should be discussed between staging and clk subsystem
maintainers I am fine with any conclusion.

> Regarding the bindings: all except 21/23 are Acked.

Maybe you did not notice, but 21/23 has reviewed-by from Rob Herring.

>
> I have one question regarding testing: in the past I tested this driver w=
ith a
> Jetson TX1 devkit and a camera sensor. One of the main reasons this drive=
r is still
> in staging is that I never got that to work reliably: after 10-30 minutes=
 it would
> lose sync and streaming would stop.
>
> Unfortunately I never had the time to dig deeper into that.
>
> So have you tested this with a camera sensor? And if so, does it stream r=
eliably?
> I.e. just let it stream for 24 hours and see if that works.
>
> If it is reliable for you, then I think this driver should be moved to dr=
ivers/media.

Streaming works but I did not tested for such prolonged periods of
time. Scope of this patchset is bringing CSI support for
Tegra20/Tegra30, extended testing and move to media can be done in
followup.

>
> Regards,
>
>         Hans
>
> >
> > ---
> > Changes in v2:
> > - vi_sensor gated through csus
> > - TEGRA30_CLK_CLK_MAX moved to clk-tegra30
> > - adjusted commit titles and messages
> > - clk_register_clkdev dropped from pad clock registration
> > - removed tegra30-vi/vip and used tegra20 fallback
> > - added separate csi schema for tegra20-csi and tegra30-csi
> > - fixet number of VI channels
> > - adjusted tegra_vi_out naming
> > - fixed yuv_input_format to main_input_format
> > - MIPI calibration refsctored for Tegra114+ and added support for
> >   pre-Tegra114 to use CSI as a MIPI calibration device
> > - switched ENOMEM to EBUSY
> > - added check into tegra_channel_get_remote_csi_subdev
> > - moved avdd-dsi-csi-supply into CSI
> > - next_fs_sp_idx > next_fs_sp_value
> > - removed host1x_syncpt_incr from framecounted syncpoint
> > - csi subdev request moved before frame cycle
> >
> > Changes in v3:
> > - tegra20 and tegra30 csi schema merged
> > - removed unneeded properties and requirements from schema
> > - improved vendor specific properties description
> > - added tegra20 csus parent mux
> > - improved commit descriptions
> > - redesigned MIPI-calibration to expose less SoC related data into head=
er
> > - commit "staging: media: tegra-video: csi: add support for SoCs with i=
ntegrated
> >   MIPI calibration" dropped as unneeded
> > - improved tegra_channel_get_remote_device_subdev logic
> > - avdd-dsi-csi-supply moved from vi to csi for p2597 and p3450-0000
> > - software syncpoint counters switched to direct reading
> > - adjusted planar formats offset calculation
> >
> > Changes in v4:
> > - removed ifdefs from tegra_mipi_driver
> > - document Tegra132 MIPI calibration device
> > - switched to use BIT macro in tegra114-mipi
> > - pinctrl changes moved to a separate patch
> > - ERESTARTSYS workaround preserved for now
> > - tegra_mipi_add_provider replaced with devm_tegra_mipi_add_provider
> > - reworked bytesperline and sizeimage calculaion
> >
> > Changes in v5:
> > - dropped patch 1/24 of v4 since it was picked to pinctrl tree
> > - added reasoning for tegra132 comaptible into commit desctiption
> > - moved clocks into common section in tegra20-csi schema
> > - added note regarding ERESTARTSYS
> > ---
> >
> > Svyatoslav Ryhel (23):
> >   clk: tegra: set CSUS as vi_sensor's gate for Tegra20, Tegra30 and
> >     Tegra114
> >   dt-bindings: clock: tegra30: Add IDs for CSI pad clocks
> >   clk: tegra30: add CSI pad clock gates
> >   dt-bindings: display: tegra: document Tegra30 VI and VIP
> >   staging: media: tegra-video: expand VI and VIP support to Tegra30
> >   staging: media: tegra-video: vi: adjust get_selection op check
> >   staging: media: tegra-video: vi: add flip controls only if no source
> >     controls are provided
> >   staging: media: tegra-video: csi: move CSI helpers to header
> >   gpu: host1x: convert MIPI to use operation function pointers
> >   dt-bindings: display: tegra: document Tegra132 MIPI calibration devic=
e
> >   staging: media: tegra-video: vi: improve logic of source requesting
> >   staging: media: tegra-video: csi: move avdd-dsi-csi-supply from VI to
> >     CSI
> >   arm64: tegra: move avdd-dsi-csi-supply into CSI node
> >   staging: media: tegra-video: tegra20: set correct maximum width and
> >     height
> >   staging: media: tegra-video: tegra20: add support for second output o=
f
> >     VI
> >   staging: media: tegra-video: tegra20: adjust format align calculation=
s
> >   staging: media: tegra-video: tegra20: set VI HW revision
> >   staging: media: tegra-video: tegra20: increase maximum VI clock
> >     frequency
> >   staging: media: tegra-video: tegra20: expand format support with
> >     RAW8/10 and YUV422/YUV420p 1X16
> >   staging: media: tegra-video: tegra20: adjust luma buffer stride
> >   dt-bindings: display: tegra: document Tegra20 and Tegra30 CSI
> >   ARM: tegra: add CSI nodes for Tegra20 and Tegra30
> >   staging: media: tegra-video: add CSI support for Tegra20 and Tegra30
> >
> >  .../display/tegra/nvidia,tegra114-mipi.yaml   |   1 +
> >  .../display/tegra/nvidia,tegra20-csi.yaml     | 138 +++
> >  .../display/tegra/nvidia,tegra20-vi.yaml      |  19 +-
> >  .../display/tegra/nvidia,tegra20-vip.yaml     |   9 +-
> >  arch/arm/boot/dts/nvidia/tegra20.dtsi         |  19 +-
> >  arch/arm/boot/dts/nvidia/tegra30.dtsi         |  24 +-
> >  .../arm64/boot/dts/nvidia/tegra210-p2597.dtsi |   4 +-
> >  .../boot/dts/nvidia/tegra210-p3450-0000.dts   |   4 +-
> >  drivers/clk/tegra/clk-tegra114.c              |   7 +-
> >  drivers/clk/tegra/clk-tegra20.c               |  20 +-
> >  drivers/clk/tegra/clk-tegra30.c               |  21 +-
> >  drivers/gpu/drm/tegra/dsi.c                   |   1 +
> >  drivers/gpu/host1x/Makefile                   |   1 +
> >  drivers/gpu/host1x/mipi.c                     | 525 ++---------
> >  drivers/gpu/host1x/tegra114-mipi.c            | 483 +++++++++++
> >  drivers/staging/media/tegra-video/Makefile    |   1 +
> >  drivers/staging/media/tegra-video/csi.c       |  70 +-
> >  drivers/staging/media/tegra-video/csi.h       |  16 +
> >  drivers/staging/media/tegra-video/tegra20.c   | 820 +++++++++++++++---
> >  drivers/staging/media/tegra-video/vi.c        |  56 +-
> >  drivers/staging/media/tegra-video/vi.h        |   6 +-
> >  drivers/staging/media/tegra-video/video.c     |   8 +-
> >  drivers/staging/media/tegra-video/vip.c       |   4 +-
> >  include/dt-bindings/clock/tegra30-car.h       |   3 +-
> >  include/linux/host1x.h                        |  10 -
> >  include/linux/tegra-mipi-cal.h                |  57 ++
> >  26 files changed, 1657 insertions(+), 670 deletions(-)
> >  create mode 100644 Documentation/devicetree/bindings/display/tegra/nvi=
dia,tegra20-csi.yaml
> >  create mode 100644 drivers/gpu/host1x/tegra114-mipi.c
> >  create mode 100644 include/linux/tegra-mipi-cal.h
> >
>

