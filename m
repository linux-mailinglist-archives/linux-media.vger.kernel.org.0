Return-Path: <linux-media+bounces-8908-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B9E5689DA19
	for <lists+linux-media@lfdr.de>; Tue,  9 Apr 2024 15:24:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4931E1F21F08
	for <lists+linux-media@lfdr.de>; Tue,  9 Apr 2024 13:24:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D15A12F376;
	Tue,  9 Apr 2024 13:24:27 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 471E98287F
	for <linux-media@vger.kernel.org>; Tue,  9 Apr 2024 13:24:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712669066; cv=none; b=dHucWNhcBUE/P41oN+BxK9YqZZvf45nNjjn8IImUz4yEF8D2cRwcGUVvHEI+ybavxlFzX2uYiZkhS1bvyA1gN3NbY12jqFqQ0j6MeHazeNOLpwR0SmagVcqgR5BQK06JIk++eq6QCVlsIU3oHyEKgdyqwyKE6/jj7EK6k61j/eI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712669066; c=relaxed/simple;
	bh=EiVqs1uRLfdIuABnyIIzdJoQyeHbKdIyHEldKOb6GSs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sE5vS3I41xHBVyV7twsiZU4ywovaMbarULKWLOWX/Vb5BuB9Aj+qJyUUysCXRvJcRQWRnV/T7w/dnkowjwOjYyBb4Fl58KMu3SVnuW638maJ3s2fi4WDi5Vi4cGFmsBZwjEkDAZSuJTOi+pEAP9O/VI4qiHkWl8p0nF2TcOllGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mtr@pengutronix.de>)
	id 1ruBSW-0006AP-N7; Tue, 09 Apr 2024 15:24:20 +0200
Received: from [2a0a:edc0:2:b01:1d::c5] (helo=pty.whiteo.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <mtr@pengutronix.de>)
	id 1ruBSV-00BJWl-St; Tue, 09 Apr 2024 15:24:19 +0200
Received: from mtr by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <mtr@pengutronix.de>)
	id 1ruBSV-004TAX-2b;
	Tue, 09 Apr 2024 15:24:19 +0200
Date: Tue, 9 Apr 2024 15:24:19 +0200
From: Michael Tretter <m.tretter@pengutronix.de>
To: "BRES, Guillaume" <guillaume.bres@bertin.group>
Cc: "kernel@pengutronix.de" <kernel@pengutronix.de>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"ORIOT DE LA CHAPELLE, DAVID" <david.oriot@bertin.group>,
	"DUMAS, Victor" <victor.dumas@bertin.group>
Subject: Re: Allegro/VCU on Zynq-MP 2023+
Message-ID: <ZhVBgzksyirY-YGy@pengutronix.de>
Mail-Followup-To: Michael Tretter <m.tretter@pengutronix.de>,
	"BRES, Guillaume" <guillaume.bres@bertin.group>,
	"kernel@pengutronix.de" <kernel@pengutronix.de>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"ORIOT DE LA CHAPELLE, DAVID" <david.oriot@bertin.group>,
	"DUMAS, Victor" <victor.dumas@bertin.group>
References: <MRZP264MB3098B2F903EC080C7EF37066E2072@MRZP264MB3098.FRAP264.PROD.OUTLOOK.COM>
 <ZhT3VVvzBCi2QkEo@pengutronix.de>
 <MRZP264MB3098098B02FB23660850D43EE2072@MRZP264MB3098.FRAP264.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <MRZP264MB3098098B02FB23660850D43EE2072@MRZP264MB3098.FRAP264.PROD.OUTLOOK.COM>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mtr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org

Hi Guillaume,

On Tue, 09 Apr 2024 09:55:32 +0000, BRES, Guillaume wrote:
[...]
> > You are mixing the bindings of the downstream and the upstream driver. You have to stick to one binding to use one driver or the other.
> 
> That was just our latest attempt. It is not very clear what we are supposed to declare (see following question).
> From what you said, I adapted the devicetree to the following, allegrodvt is now probed, it fails to locate IRQ#0, but I am just starting to debug, I'm confident we will find the solution to this :
> 
>             // vcu settings
> 1369     vcu_settings: vcu@a0241000 {
> 1370         compatible = "xlnx,vcu-settings", "syscon";
> 1371         reg = <0x0 0xa0241000 0x0 0x1000>;
> 1372         reg-names = "logicore";
> 1373     };
>               // new section
> 1374     vcu_al5e: video-codec@a0009000 {
> 1375         compatible = "allegro,al5e-1.1", "allegro,al5e";
> 1376         reg = <0 0xa0009000 0 0x1000>, <0 0xa0000000 0 0x8000>;

The addresses look wrong. You configured the register mapping when
configuring the bitstream and this mapping needs to be reflected in the
device tree.

In your case the addresses probably should be

	reg = <0 0xa0209000 0 0x1000>, <0 0xa0200000 0 0x8000>;

> 1377         reg-names = "regs", "sram";
> 1378         interrupts = <0 104 4>;   // try to establish IRQ relationship, but not sure yet IRQ#0 is actually this one or another.
> 1379         clocks = <&vcu 0>, <&vcu 1>, <&zynqmp_clk 71>, <&zynqmp_clk 71>, <&zynqmp_clk 71>;
> 1380         clock-names = "core_clk", "mcu_clk", "m_axi_core_aclk", "m_axi_mcu_aclk", "s_axi_lite_aclk";
> 1381     };
>              // still partially needed
> 1382     vcu: vcu@a0200000 {
> 1383         #address-cells = <2>;
> 1384         #clock-cells = <1>;
> 1385         #size-cells = <2>;
> 1386         clock-names = "pll_ref", "aclk", "vcu_core_enc", "vcu_core_dec", "vcu_mcu_enc", "vcu_mcu_dec";
> 1387         clocks = <&misc_clk_1>, <&zynqmp_clk 71>, <&vcu 1>, <&vcu 2>, <&vcu 3>, <&vcu 4>;
> 1388         compatible = "xlnx,vcu-1.2", "xlnx,vcu";
> 1389         interrupt-names = "vcu_host_interrupt";
> 1390         interrupt-parent = <&gic>;
> 1391         interrupts = <0 104 4>;
> 1392         ranges ;
> 1393         reg-names = "vcu_slcr";
> 1394         reg = <0x0 0xa0240000 0x0 0x1000>;
> 1395         reset-gpios = <&vfrmbuf_gpio 6 GPIO_ACTIVE_LOW>;
> 1396     };

This node doesn't follow the documented binding. There should be only
two clocks and no interrupt.

> 
> 
> > What kind of documentation did you expect and where did you expect it?
> 
> I think the current kernel lacks some notes - no idea what their
> appropriate location might be, that explain the relationship between
> all those drivers, especially the syscon setup. For the simple reason
> that you need all of these drivers to work at the same time, and one
> of them by itself will never be enough.

The allegro,al5e-1.1 is the actual encoder.

The xlnx,vcu is more or less the clock controller for the VCU, and
controls the clocks for the encoder and the decoder.

The vcu-settings are the registers that expose the VCU configuration,
since the VCU can be configured with different settings. These settings
are shared with the decoder and a potential decoder driver would need to
have access to the register values in vcu-settings, too.

> > The upstream driver is product-driven, and only has the features
> > that are needed for the product
> 
> Could you elaborate or point out to a location where we can have
> detailed documentation of the current capabilities ?  so we can make a
> decision whether we should upgrade to mainline, or remain on the
> out-of-tree module ?

The driver is able to do h.264 and h.265 encoding with a few options for
quality and rate control. In contrast to the downstream driver, it
exposes a standard V4L2 video encoder interface to userspace.

Which features do you need? I'm very open to review and test patches
that add more features to improve and extend the upstream driver.

Michael

