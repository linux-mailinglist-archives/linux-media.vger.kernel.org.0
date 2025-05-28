Return-Path: <linux-media+bounces-33525-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 92171AC6B7E
	for <lists+linux-media@lfdr.de>; Wed, 28 May 2025 16:14:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EC1CB3B4A3B
	for <lists+linux-media@lfdr.de>; Wed, 28 May 2025 14:14:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D233E28852C;
	Wed, 28 May 2025 14:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="lVVoA1jc"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7D411F37D3;
	Wed, 28 May 2025 14:14:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748441662; cv=none; b=VXDucbNJ2Bqy8Oor47Ls/Vw3s3GkiVD8SnxMFlh0Pt+2UpvLm7zVvFmGTSJ1tN1MIgcwWHGUriags6pf7ggjgeXhah7yBEUOHHrpqEGMwaZVpxzxMzQUdWtrZkv1zqPkdxrKkDoXcR9bfTm6VWLPORt3ocIgJyMVLDXa2HNLja4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748441662; c=relaxed/simple;
	bh=Xck/nwOYiqy1ZVp9Sss2kWwcLSvKVmGgOkD7OBgsZBA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=BNJvlo543y8RY3naKobMMhnHKGZWlwPYnt3Z4kpqojYCoQVOCzkhYufW5WYCl0uS4WnRFMb30O8RdRRBDTn7aFQ6nsFoqCCKgFawjGGyiPSCYHJBqUjPXF9VY4GtUumu72R016FWHlT2shv4pHqkoScYlUTbbupW0ssrP/ayF4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=lVVoA1jc; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1748441656;
	bh=Xck/nwOYiqy1ZVp9Sss2kWwcLSvKVmGgOkD7OBgsZBA=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=lVVoA1jctbfwewW2KGob5hfTDoq2NQRzQk9gxJCzi1YcEl/+KT9lpM1mZDY7EpwAz
	 C01gp7g9uaW3/+R4aPvO6wDfW5R1enrQHhY17Rc4ZbwusXt7h3uDWywQzwv3+uHrrJ
	 eyXVnqTow726pX7uJU1Zh9KVXNThuEmBMg///ei+djpn3Olt5z7LlLIGYfjVzSUyVS
	 Cob+tignic8jH9R0rI61lG5DM3Ej2AQt6cNGR2LAloGMo6fvEbUWpg5GqiDbnM6mLF
	 WDNyYPavHzBqZqlWkUbSY/zfiMhnakM4/8bZ+WN4gDOyZVH9dAF3IHgby93SQWFHEg
	 LI1+Pb7C4IL6Q==
Received: from [IPv6:2606:6d00:17:b2fc::5ac] (unknown [IPv6:2606:6d00:17:b2fc::5ac])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 524C317E3700;
	Wed, 28 May 2025 16:14:14 +0200 (CEST)
Message-ID: <7cf3e219758a67d08137ebea5e52a1abad835e65.camel@collabora.com>
Subject: Re: [RFC PATCH 07/11] arm64: dts: imx8mp: fix VPU_BUS clock setting
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Adam Ford <aford173@gmail.com>, Marco Felsch <m.felsch@pengutronix.de>
Cc: benjamin.gaignard@collabora.com, p.zabel@pengutronix.de,
 mchehab@kernel.org, 	shawnguo@kernel.org, Sascha Hauer
 <s.hauer@pengutronix.de>, 	kernel@pengutronix.de, festevam@gmail.com,
 robh@kernel.org, krzk+dt@kernel.org, 	conor+dt@kernel.org,
 paulk@sys-base.io, hverkuil@xs4all.nl, 	laurent.pinchart@ideasonboard.com,
 sebastian.fricke@collabora.com, 	ming.qian@nxp.com,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Date: Wed, 28 May 2025 10:14:12 -0400
In-Reply-To: <CAHCN7xLecU12XtXFuwfNP+eee+9RLCSB9iErNmk7VFV+WrozJA@mail.gmail.com>
References: <20250502150513.4169098-1-m.felsch@pengutronix.de>
	 <20250502150513.4169098-8-m.felsch@pengutronix.de>
	 <CAHCN7x+Lu9momgX3Vwp+Yu+Tet5Q=k2vCL83SMLuad24SDchEg@mail.gmail.com>
	 <20250502165535.aeb2osq2vnxsudmq@pengutronix.de>
	 <CAHCN7xLecU12XtXFuwfNP+eee+9RLCSB9iErNmk7VFV+WrozJA@mail.gmail.com>
Organization: Collabora Canada
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

Le mardi 27 mai 2025 à 22:05 -0500, Adam Ford a écrit :
> On Fri, May 2, 2025 at 11:55 AM Marco Felsch <m.felsch@pengutronix.de> wrote:
> > 
> > On 25-05-02, Adam Ford wrote:
> > > On Fri, May 2, 2025 at 10:10 AM Marco Felsch <m.felsch@pengutronix.de> wrote:
> > > > 
> > > > The VPU_PLL clock must be set before the VPU_BUS clock which is derived
> > > > from the VPU_PLL clock else the VPU_BUS clock is 300MHz and not 600MHz.
> 
> I did verify the current clock rate ends up at 300MHz instead of the
> desired 600 or 800MHz, so we should do something.
> 

This reminded me of: 

https://patchwork.linuxtv.org/project/linux-media/patch/20250217-b4-hantro-av1-clock-rate-v2-1-e179fad52641@collabora.com/

Which also made me discover that this patch wasn't picked despite being mark accepted. We
will favour DT clock settings from here, since its not really managable otherwise, old board
will stay like this, otherwise we face backward compatibility issues.

Note that G2 and VC8K can be run at higher rate, but to be stable, you need
to also control voltage and proper cooling, not something we want "by default".

Nicolas

> 
> > > > 
> > > > Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> > > > ---
> > > >  arch/arm64/boot/dts/freescale/imx8mp.dtsi | 4 ++--
> > > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > > > 
> > > > diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> > > > index 97b09b647ec7..7f4bdefb3480 100644
> > > > --- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> > > > +++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> > > > @@ -2289,8 +2289,8 @@ vpumix_blk_ctrl: blk-ctrl@38330000 {
> > > >                                  <&clk IMX8MP_CLK_VPU_G2_ROOT>,
> > > >                                  <&clk IMX8MP_CLK_VPU_VC8KE_ROOT>;
> > > >                         clock-names = "g1", "g2", "vc8000e";
> > > > -                       assigned-clocks = <&clk IMX8MP_CLK_VPU_BUS>, <&clk IMX8MP_VPU_PLL>;
> > > > -                       assigned-clock-parents = <&clk IMX8MP_VPU_PLL_OUT>;
> > > > +                       assigned-clocks = <&clk IMX8MP_VPU_PLL>, <&clk IMX8MP_CLK_VPU_BUS>;
> > > > +                       assigned-clock-parents = <0>, <&clk IMX8MP_VPU_PLL_OUT>;
> > > >                         assigned-clock-rates = <600000000>, <600000000>;
> > > 
> > > I think there was a move to make the default be overdrive [1]  and [2]
> > > and use a 'nominal' device tree for those who are not in overdrive
> > > mode.  According to the TRM, the VPU_BUS_CLK_ROOT, the nominal is
> > > 600MHz and the overdrive is 800MHz.  Based on that, I wonder if the
> > > values here should be 800MHz and if we should add the nominal values
> > > of 600MHz to the imx8m-nominal.dtsi file.
> > 
> > You're right, Ahamd and Lucas did change this. I will adapt it later on.
> 
> I updated my device tree to run in overdrive mode and ran fluster at
> the higher rates:
> VPU_G1 - 800MHz,
> VPU-G2 - 700MHz
> VPU-Bus - 800MHz
> 
> ./fluster.py run -d GStreamer-VP8-V4L2SL-Gst1.0
> Ran 57/61 tests successfully               in 5.922 secs
> (vs 7.059 secs at nominal speed)
> 
> ./fluster.py run -dGStreamer-H.264-V4L2SL-Gst1.0
> Ran 129/135 tests successfully               in 40.107 secs
> (vs 45.741 secs at nominal speed)
> 
> If you want, I can submit the clock updates I have for overdrive or
> send them to you to save you some time.
> 
> adam
> 
> > 
> > Regards,
> >   Marco

