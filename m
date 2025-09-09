Return-Path: <linux-media+bounces-42123-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EE279B5020C
	for <lists+linux-media@lfdr.de>; Tue,  9 Sep 2025 18:03:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AEFDB3BFDF9
	for <lists+linux-media@lfdr.de>; Tue,  9 Sep 2025 16:03:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 645F733472A;
	Tue,  9 Sep 2025 16:03:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g+7SmH1I"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FE9026529B;
	Tue,  9 Sep 2025 16:03:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757433782; cv=none; b=Ffj+S16RYuKwxQGjzfK5WrYH/45bqs2ywrWg6f8jOp/0z3FxVhA4EXrlpK8b+6zKTTnF+bTIa9Bw3V2MrRUqzn7tVBK+MbRn05kDdsFCzUEPhbiMPcufbsR5kb+g5wVVFvZHNH7U2OL1fyg9gEbbCd+eGMDY0GvWQKl13hcww98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757433782; c=relaxed/simple;
	bh=jCUceQsL4KPF7qd/NyyavrylZZJxNxFACVT/FdIkAnU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aIIYcGgQaGIfANUXfLbGAus2y5bmUvL0Se54tvZ2o8mUzj9r2USWFV45MAVVVuSU/ChRodEy45i2KciX9txTAEKzgIgIX6hYvrGwP15KKuxtTzCvfuWe7ThchkgE4bUZ0wmlXfpf2NjrTjRYxgk19+gwUtPvhn527SXWoaWZ91g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g+7SmH1I; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02714C4CEF8;
	Tue,  9 Sep 2025 16:03:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757433782;
	bh=jCUceQsL4KPF7qd/NyyavrylZZJxNxFACVT/FdIkAnU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=g+7SmH1IqLAddZD6/oPjNm1Xkbgpxgy3ZnFh6wsBVC+0eQcmQDotbzxg9LHzvJXCg
	 gkG2Agbo+VNTNQ305lpIgYOJeZWlulkQ8VA1xedj9+hY0wsztN50gzIvG/zjfRgQtc
	 Co+nbc0N53ntAJF65sG/VCz1XQkfrrO7vNcshEfH6FdsoEoQjd1CbUJjiFfZjzlEmO
	 jOyEpIDy4nX7TUdBKCTKHmXUe+7qvw1Ym+jrgBiNXn2CSD9FFljm9GoNuyOyGIuM5Z
	 IkVOX5reiU6Gkz7BbXaIVOGknRZ9CpG5lpVjJI6X0ab5TSEYjQG0nP4EApghI071cR
	 5A1uZJwfh9K1w==
Date: Tue, 9 Sep 2025 11:03:01 -0500
From: Rob Herring <robh@kernel.org>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Thierry Reding <treding@nvidia.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Prashant Gaikwad <pgaikwad@nvidia.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dmitry Osipenko <digetx@gmail.com>,
	Jonas =?iso-8859-1?Q?Schw=F6bel?= <jonasschwoebel@yahoo.de>,
	Charan Pedumuru <charan.pedumuru@gmail.com>,
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH v2 12/23] dt-bindings: display: tegra: move
 avdd-dsi-csi-supply from VI to CSI
Message-ID: <20250909160301.GA3308644-robh@kernel.org>
References: <20250906135345.241229-1-clamor95@gmail.com>
 <20250906135345.241229-13-clamor95@gmail.com>
 <20250909005729.GA2330015-robh@kernel.org>
 <CAPVz0n0PhzjsJSKp9P7amG36V+E_dLFXAgJqtTPx4cfH0m5BXQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPVz0n0PhzjsJSKp9P7amG36V+E_dLFXAgJqtTPx4cfH0m5BXQ@mail.gmail.com>

On Tue, Sep 09, 2025 at 08:00:04AM +0300, Svyatoslav Ryhel wrote:
> вт, 9 вер. 2025 р. о 03:57 Rob Herring <robh@kernel.org> пише:
> >
> > On Sat, Sep 06, 2025 at 04:53:33PM +0300, Svyatoslav Ryhel wrote:
> > > The avdd-dsi-csi-supply is CSI power supply, it has nothing to do with VI,
> > > like same supply is used with DSI and has nothing to do with DC. Move it
> > > to correct place.
> > >
> > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > ---
> > >  .../devicetree/bindings/display/tegra/nvidia,tegra20-vi.yaml   | 3 ---
> > >  .../devicetree/bindings/display/tegra/nvidia,tegra210-csi.yaml | 3 +++
> > >  2 files changed, 3 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vi.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vi.yaml
> > > index dd67d4162884..bb138277d5e8 100644
> > > --- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vi.yaml
> > > +++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vi.yaml
> > > @@ -75,9 +75,6 @@ properties:
> > >    ranges:
> > >      maxItems: 1
> > >
> > > -  avdd-dsi-csi-supply:
> > > -    description: DSI/CSI power supply. Must supply 1.2 V.
> > > -
> > >    vip:
> > >      $ref: /schemas/display/tegra/nvidia,tegra20-vip.yaml
> > >
> > > diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra210-csi.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra210-csi.yaml
> > > index fa07a40d1004..37f6129c9c92 100644
> > > --- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra210-csi.yaml
> > > +++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra210-csi.yaml
> > > @@ -37,6 +37,9 @@ properties:
> > >        - const: cile
> > >        - const: csi_tpg
> > >
> > > +  avdd-dsi-csi-supply:
> > > +    description: DSI/CSI power supply. Must supply 1.2 V.
> >
> > On further thought, why does this have 'dsi' in the name at all. If it
> > happens to be the same supply for DSI and CSI, that's an SoC integration
> > detail. The name here should be local to the module. Perhaps
> > 'avdd-supply' is enough? Fine to rename it as you are breaking the ABI
> > moving it anyways.
> >
> 
> Not only this supply is common for DSI and CSI, on all schematics I
> have seem so far input for this supply on CSI block is always called
> avdd-dsi-csi and supply is named accordingly. This patch aims not to
> rename supply, which has correct naming IMHO, but to place it in
> correct place - CSI, not VI as it is ATM.

Okay, then my Ack stands.

