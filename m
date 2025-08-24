Return-Path: <linux-media+bounces-40848-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B8F3B332D5
	for <lists+linux-media@lfdr.de>; Sun, 24 Aug 2025 23:15:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 03FAB189AB9C
	for <lists+linux-media@lfdr.de>; Sun, 24 Aug 2025 21:16:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA167246768;
	Sun, 24 Aug 2025 21:15:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="FhkThc7r"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2FDA11CA0;
	Sun, 24 Aug 2025 21:15:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756070147; cv=none; b=tDe6bN/AgGghQNYo+aT5FZpAJQgVHsMMeTDPJD4WeBRDUpgYZHk5Sul5Lj4tK39NioQRCF+GVkYLIZXxR+Z9/roSoREmcCihiA6y4QfPh9xli2u3XedLfuzyuwcgh68gUcw78yKmvnmELJw2dVYsGz0SHoVeQjyrXqylBPQSPr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756070147; c=relaxed/simple;
	bh=/4qUqPwxdDhlFuiP2I8MM+kio8evMDngLWdnQo3JTLk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fh/xxvDZ0SP2Cl2194gagmVZ5upFwCFDN1Z9k6KddJjm0q0SvPMA/e8k87JhqOQSLOTGSwh/MGqGFL1+wkMVufSnan4LimL8dGxXjsKPhfOOsMoXgg/WgidlLPswYrlaI29et9ymB6cud4cpP9zA+7+BK/dDkqQdmDRJ/mEKhYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=FhkThc7r; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (unknown [185.22.192.49])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 361374B72;
	Sun, 24 Aug 2025 23:14:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1756070075;
	bh=/4qUqPwxdDhlFuiP2I8MM+kio8evMDngLWdnQo3JTLk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FhkThc7rbLyiuWFGAXyuzK1h9M5YQHbwYXNB1chUbxHDcvpC5gml2JvnMksXyLuzd
	 NRYzmzzwNduP1QbaJL/oKRExekiU4VS5OExrjQ3D1YyJDeRPdKka1F2chEQM0SglVP
	 yObrGkPwvFKHhw24lCX0PtWSJ2CLvPAy1hDmmPlU=
Date: Sun, 24 Aug 2025 23:15:13 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Inbaraj E <inbaraj.e@samsung.com>, mturquette@baylibre.com,
	sboyd@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, s.nawrocki@samsung.com, s.hauer@pengutronix.de,
	shawnguo@kernel.org, cw00.choi@samsung.com, rmfrfs@gmail.com,
	martink@posteo.de, mchehab@kernel.org, linux-fsd@tesla.com,
	will@kernel.org, catalin.marinas@arm.com, pankaj.dubey@samsung.com,
	shradha.t@samsung.com, ravi.patel@samsung.com,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, alim.akhtar@samsung.com,
	linux-samsung-soc@vger.kernel.org, kernel@puri.sm,
	kernel@pengutronix.de, festevam@gmail.com,
	linux-media@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 10/12] dt-bindings: media: fsd: Document CSIS DMA
 controller
Message-ID: <20250824211513.GA30196@pendragon.ideasonboard.com>
References: <20250814140943.22531-1-inbaraj.e@samsung.com>
 <CGME20250814141051epcas5p14dccee388087372973988aeebcb872cf@epcas5p1.samsung.com>
 <20250814140943.22531-11-inbaraj.e@samsung.com>
 <c46c6f66-dee6-4efa-a624-de62aa705206@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <c46c6f66-dee6-4efa-a624-de62aa705206@kernel.org>

Hi Krzysztof,

On Mon, Aug 18, 2025 at 10:45:17AM +0200, Krzysztof Kozlowski wrote:
> On 14/08/2025 16:09, Inbaraj E wrote:
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - interrupts
> > +  - clocks
> > +  - clock-names
> > +  - iommus
> > +  - port
> 
> Also, you miss here supplies (as required).

Did you perhaps mean power-domains ? As far as I understand this is an
IP core internal to an SoC, so *-supply would be quite uncommon.

-- 
Regards,

Laurent Pinchart

