Return-Path: <linux-media+bounces-41078-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B84FAB35E29
	for <lists+linux-media@lfdr.de>; Tue, 26 Aug 2025 13:53:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0EC481BC249F
	for <lists+linux-media@lfdr.de>; Tue, 26 Aug 2025 11:45:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CE9E3376BE;
	Tue, 26 Aug 2025 11:44:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Diz3q8F8"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A121618DF9D;
	Tue, 26 Aug 2025 11:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756208663; cv=none; b=NpiNh6QpdH31SF8xOwdHoQo6yhlxymTNVqBYYXEynBMoo450k89bxa2TtGHjNkoxtkWuyYeuPxERfJXxRDWQ0gZoTymTP3jsYxWqtKps93uGea61aL5wx2m68p5B3aI/FOA4WQM4CTnL5lP5GQ4BZjeSCE5gTihg/DIpZAqubFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756208663; c=relaxed/simple;
	bh=gPWFtOfDlGNjTh65kxpE4jTt4VsFGsZ3a+MU5+Da/3E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LnJehypMazDor0+9idRL55d/2BVrAHcgbMtBAFLun89lcLRkc4gzGcW7Ts9IjrwTyfxBrl3TNCyqa0xm+qUb3tpztAEvfdd6Zg1h6HWVGo62kqnlbGxvHbGPnMYmHguZIojFmF/5ARBOmjk/PtJkWqOWBgFsEi7QnvbhIO3LtaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Diz3q8F8; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (unknown [213.244.170.152])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 8EAF75782;
	Tue, 26 Aug 2025 13:43:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1756208596;
	bh=gPWFtOfDlGNjTh65kxpE4jTt4VsFGsZ3a+MU5+Da/3E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Diz3q8F8cGUQ/w/QjuhsxnJTf81qtzTaJfBzTLgJwvZfh8WTBjfEMKeNoKOn39uU4
	 L9aWe1xxOxGgpDRPD/1RExd1TjzLRbSpizQz7XJKYI3+w+Er7M5hym4AEoM5PcSM0L
	 ycbiNMe17DrMJ3bNbgmuyuY2tRbTEJBvyNPch3KI=
Date: Tue, 26 Aug 2025 13:43:57 +0200
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
Subject: Re: [PATCH v2 04/12] arm64: dts: fsd: Add CSI nodes
Message-ID: <20250826114357.GA607@pendragon.ideasonboard.com>
References: <20250814140943.22531-1-inbaraj.e@samsung.com>
 <CGME20250814141019epcas5p2f957b934d5b60d4649cf9c6abd6969d5@epcas5p2.samsung.com>
 <20250814140943.22531-5-inbaraj.e@samsung.com>
 <1919de68-99ea-47f7-b3d2-cae4611f9c52@kernel.org>
 <00d101dc136c$aa037020$fe0a5060$@samsung.com>
 <41434afa-fecd-4507-bcca-735d358ac925@kernel.org>
 <016401dc15c0$fc0dcfe0$f4296fa0$@samsung.com>
 <1dfaedc8-88e6-4749-8726-e8f66878e57e@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1dfaedc8-88e6-4749-8726-e8f66878e57e@kernel.org>

On Tue, Aug 26, 2025 at 10:36:50AM +0200, Krzysztof Kozlowski wrote:
> On 25/08/2025 15:05, Inbaraj E wrote:
> > Hi Krzysztof,
> > 
> >>> CSIS stands for Camera Serial Interface Slave.
> >>
> >> Googling for "MIPI CSIS" gives me 0 results, so I still claim this is not a generic
> >> name.
> > 
> > I checked other vendors (e.g: freescale), and they are using mipi-csi. I'll adopt for the
> > same.
> 
> Then it is just "csi"? Except that you have some other different nodes
> called "csi" as well, so two different devices are "csi"?

This one is high on my list of unfortunate name clashes. Many NXP SoCs
(among others, I've seen that in other vendors too) have IP cores named
"Camera Sensor Interface" that they abbreviate to "CSI". They are
unrelated to the MIPI Camera Serial Interface. I won't blame NXP, as I
think they may have started using the acronym before MIPI CSI became a
big thing.

-- 
Regards,

Laurent Pinchart

