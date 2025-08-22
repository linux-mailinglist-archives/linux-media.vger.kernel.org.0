Return-Path: <linux-media+bounces-40767-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 473DAB31AE1
	for <lists+linux-media@lfdr.de>; Fri, 22 Aug 2025 16:11:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 67A5C1BA2F9D
	for <lists+linux-media@lfdr.de>; Fri, 22 Aug 2025 14:06:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CCEA3054C8;
	Fri, 22 Aug 2025 14:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hmb7VwXT"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB405303C87;
	Fri, 22 Aug 2025 14:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755871563; cv=none; b=FPCr0jDYXt9UWT8nZq19Fu4VOyU7ZZPQbrl+3QZ26egpdiwmV85EaKZh3z4w5/TCkKMh2o/cVy9bufa+oFTku39pHAc46llf83ishAodgcin8hIPfsh6RUJRjxLbWafo42XZXazPTASzn8A5lb453NuJB9QnVzNJHcGgIwNrWyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755871563; c=relaxed/simple;
	bh=Ku6m0SqEEMBqWM59nurSigUjLIp8pNkfpPu9KePkEV0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k2ijP7W0ewKTP1BQEq35JQQES59U9sgg6leh6/2ZRiMMeMQH7axdYQIEqap/NykJkPgrxuMOLuPjkJloWvkct0GSKkIVNbnkmCSbl7/gqAe6os6Q8n652BltORwLNO6GpXBhh2H1A3e6xXiJPdS3o3qOlIxAe+/V8CCSDmJ/PUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hmb7VwXT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25DA6C4CEED;
	Fri, 22 Aug 2025 14:06:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755871562;
	bh=Ku6m0SqEEMBqWM59nurSigUjLIp8pNkfpPu9KePkEV0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hmb7VwXTw40W8ge+1DeTuLEgBD8x3r3p6Cdb1nPkcJ+aDHcquzJIJXzdMMghS4ftK
	 9kgkBWSHmLKqXTnhGVtb/aII0is6Su5Z8NkSVUiN5bWFdKEu6ka5w6Ntdw8uDQ3kx6
	 xfdDLyEENVkjYY3JP/uRMjdszBHeyYu8DKccAYmiHEygNKjNZ1253v/CviYFiXoBZ4
	 1yTQN/4pY/pv9Nbs/qbsHBab9Ev+TzrsD8HvBvl8wFNiBkq3B9Hh19cP3m4ua6RrYQ
	 LyvY49ToEsQTinnyI14SdYrUxZ8VVgXrxJ8Bw2WVKAxog1ZogsTRdaXQlSMzzQNhpD
	 zXXX8D7yRFehA==
Date: Fri, 22 Aug 2025 09:06:01 -0500
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
	Peter De Schrijver <pdeschrijver@nvidia.com>,
	Prashant Gaikwad <pgaikwad@nvidia.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dmitry Osipenko <digetx@gmail.com>,
	Charan Pedumuru <charan.pedumuru@gmail.com>,
	linux-media@vger.kernel.org, linux-tegra@vger.kernel.org,
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH v1 17/19] dt-bindings: display: tegra: document Tegra20
 and Tegra30 CSI
Message-ID: <20250822140601.GA3496760-robh@kernel.org>
References: <20250819121631.84280-1-clamor95@gmail.com>
 <20250819121631.84280-18-clamor95@gmail.com>
 <20250819203007.GA1266319-robh@kernel.org>
 <CAPVz0n2tsE3FHAz7sbdwkWaRQtmXJ5wNg8vvb2B9k8iYuyvUQQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPVz0n2tsE3FHAz7sbdwkWaRQtmXJ5wNg8vvb2B9k8iYuyvUQQ@mail.gmail.com>

On Wed, Aug 20, 2025 at 08:39:36AM +0300, Svyatoslav Ryhel wrote:
> вт, 19 серп. 2025 р. о 23:30 Rob Herring <robh@kernel.org> пише:
> >
> > On Tue, Aug 19, 2025 at 03:16:29PM +0300, Svyatoslav Ryhel wrote:
> > > Document CSI hw block found in Tegra20 and Tegra30 SoC.
> > >
> > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > ---
> > >  .../display/tegra/nvidia,tegra210-csi.yaml    | 78 +++++++++++++++----
> > >  1 file changed, 63 insertions(+), 15 deletions(-)
> > >
> > > diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra210-csi.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra210-csi.yaml
> > > index fa07a40d1004..a5669447a33b 100644
> > > --- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra210-csi.yaml
> > > +++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra210-csi.yaml
> > > @@ -16,30 +16,78 @@ properties:
> > >
> > >    compatible:
> > >      enum:
> > > +      - nvidia,tegra20-csi
> > > +      - nvidia,tegra30-csi
> > >        - nvidia,tegra210-csi
> > >
> > >    reg:
> > >      maxItems: 1
> > >
> > > -  clocks:
> > > -    items:
> > > -      - description: module clock
> > > -      - description: A/B lanes clock
> > > -      - description: C/D lanes clock
> > > -      - description: E lane clock
> > > -      - description: test pattern generator clock
> > > -
> > > -  clock-names:
> > > -    items:
> > > -      - const: csi
> > > -      - const: cilab
> > > -      - const: cilcd
> > > -      - const: cile
> > > -      - const: csi_tpg
> > > +  clocks: true
> > > +  clock-names: true
> > >
> > >    power-domains:
> > >      maxItems: 1
> > >
> > > +allOf:
> > > +  - if:
> > > +      properties:
> > > +        compatible:
> > > +          contains:
> > > +            enum:
> > > +              - nvidia,tegra20-csi
> > > +    then:
> > > +      properties:
> > > +        clocks:
> > > +          items:
> > > +            - description: module clock
> > > +
> > > +        clock-names:
> > > +          items:
> > > +            - const: csi
> > > +  - if:
> > > +      properties:
> > > +        compatible:
> > > +          contains:
> > > +            enum:
> > > +              - nvidia,tegra30-csi
> > > +    then:
> > > +      properties:
> > > +        clocks:
> > > +          items:
> > > +            - description: module clock
> > > +            - description: PAD A clock
> > > +            - description: PAD B clock
> > > +
> > > +        clock-names:
> > > +          items:
> > > +            - const: csi
> > > +            - const: csia_pad
> > > +            - const: csib_pad
> > > +  - if:
> > > +      properties:
> > > +        compatible:
> > > +          contains:
> > > +            enum:
> > > +              - nvidia,tegra210-csi
> > > +    then:
> > > +      properties:
> > > +        clocks:
> > > +          items:
> > > +            - description: module clock
> > > +            - description: A/B lanes clock
> > > +            - description: C/D lanes clock
> > > +            - description: E lane clock
> > > +            - description: test pattern generator clock
> > > +
> > > +        clock-names:
> > > +          items:
> > > +            - const: csi
> > > +            - const: cilab
> > > +            - const: cilcd
> > > +            - const: cile
> > > +            - const: csi_tpg
> > > +
> >
> > This is longer that what's the same. I think this should be a separate
> > schema doc.
> >
> 
> CSI hw block configuration is similar between generations, the main
> difference is the amount of clocks routed. Not sure if it is worth it
> to create duplicates with sole difference in number of clocks used.

If the clock names were at least the same I might agree, but the only 
common one is 'csi'. How similar the h/w is doesn't matter, how similar 
the binding is is what matters.

Rob

