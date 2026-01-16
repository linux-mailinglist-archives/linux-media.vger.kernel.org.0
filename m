Return-Path: <linux-media+bounces-50877-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 83A59D30E47
	for <lists+linux-media@lfdr.de>; Fri, 16 Jan 2026 13:10:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 24277300CEDF
	for <lists+linux-media@lfdr.de>; Fri, 16 Jan 2026 12:10:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACB033876CF;
	Fri, 16 Jan 2026 12:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ggchk9r5"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E6A7369982;
	Fri, 16 Jan 2026 12:10:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768565429; cv=none; b=OyJOPWoZlh1FXAAP1QtP7iX5LEc1ARRWyimi1WfeUFNN1etFE/3FpphT4Rq/WRMVVSKSI/yrpB2ZMiE9nVOrGFq8pEW7vIpgIwOL6sAAoBDYc8jcnD9oUn5xxKz5f/FmwUw6bU5G5epSbhd27vC2ko2yFd2AcidZIwdwVZR+qeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768565429; c=relaxed/simple;
	bh=QfxbdCdKhEdyEN02+r2vp+Ub4nbIlg5f/Z9mt5myDKk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qw/EzXKNCypwKCoJBow1Biu9hs95jS4i9tPNvy6+yOlGqEXUKBMkUb1Mn9tYBkjOH8jpJFO5UvIOoeHYawZb9j0RwJ7COw4nKvujiBBJWAZq9e7loE0ox9gJXKPG+HVV4mVz8fanN4SHbHE9zWE/RMUm20vvHLQbGC7WqfcSEUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ggchk9r5; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768565428; x=1800101428;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=QfxbdCdKhEdyEN02+r2vp+Ub4nbIlg5f/Z9mt5myDKk=;
  b=ggchk9r5NYBaLB/Bm3P7igNXrjnGmvrKsxNbIc63Cjsff4Bfv+oR7QZP
   xvdbe6MuxQeXcGarJyAylW6TxX88Qbonykjaavt+8t0FMow4w7FXZtWbt
   tB6p+hStihx4K3UtJ5Pd8RRQ9S5l6DN5JS3VuT1hk2YgZVZNO0wzm6yQT
   rWcupelod6t6O6Uwh8VoVXg2impIa2Gla9bEwTvurRmiLCSw41ddhkcbo
   pBt8QXSAAIeAbNTjQdr/2k6Y1ze3EvSlyGUJFxGfRUkUcfbTORqaHqW6V
   IG5LfT7477U627dErvpw9MhLssPUqHW/LBhS5JNw5WiQIScfi369AUeIi
   g==;
X-CSE-ConnectionGUID: FYIYdHY6RX+Mm/drz4RDww==
X-CSE-MsgGUID: ye3lgQGqRDqmMg5Qdq2YWQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11672"; a="87455662"
X-IronPort-AV: E=Sophos;i="6.21,231,1763452800"; 
   d="scan'208";a="87455662"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2026 04:10:27 -0800
X-CSE-ConnectionGUID: SEuBDxBVSc2y4zLvJuYMiw==
X-CSE-MsgGUID: /Lgbij9+QH2fis18QSZjHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,231,1763452800"; 
   d="scan'208";a="205127523"
Received: from abityuts-desk.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.150])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2026 04:10:22 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 6791711F726;
	Fri, 16 Jan 2026 14:10:22 +0200 (EET)
Date: Fri, 16 Jan 2026 14:10:22 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Cc: michael.riesch@collabora.com, Chaoyi Chen <chaoyi.chen@rock-chips.com>,
	Kever Yang <kever.yang@rock-chips.com>, Frank Li <Frank.li@nxp.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Collabora Kernel Team <kernel@collabora.com>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/3] media: dt-bindings: add rockchip mipi csi-2
 receiver
Message-ID: <aWoqrhHJwUHQpb2K@kekkonen.localdomain>
References: <20251114-rockchip-mipi-receiver-v4-0-a9c86fecd052@collabora.com>
 <20251114-rockchip-mipi-receiver-v4-1-a9c86fecd052@collabora.com>
 <aWoOzn_d7ixgbzj4@kekkonen.localdomain>
 <5173450.iZASKD2KPV@diego>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5173450.iZASKD2KPV@diego>

Hi Heiko,

On Fri, Jan 16, 2026 at 12:07:22PM +0100, Heiko Stübner wrote:
> Am Freitag, 16. Januar 2026, 11:11:26 Mitteleuropäische Normalzeit schrieb Sakari Ailus:
> > Hi Michael,
> > 
> > On Thu, Jan 15, 2026 at 07:26:07PM +0100, Michael Riesch via B4 Relay wrote:
> > > From: Michael Riesch <michael.riesch@collabora.com>
> > > 
> > > Add documentation for the Rockchip MIPI CSI-2 Receiver.
> > > 
> > > Signed-off-by: Michael Riesch <michael.riesch@wolfvision.net>
> > > Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
> > > ---
> > >  .../bindings/media/rockchip,rk3568-mipi-csi2.yaml  | 141 +++++++++++++++++++++
> > >  MAINTAINERS                                        |   6 +
> > >  2 files changed, 147 insertions(+)
> > > 
> > > diff --git a/Documentation/devicetree/bindings/media/rockchip,rk3568-mipi-csi2.yaml b/Documentation/devicetree/bindings/media/rockchip,rk3568-mipi-csi2.yaml
> > > new file mode 100644
> > > index 000000000000..2c2bd87582eb
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/media/rockchip,rk3568-mipi-csi2.yaml
> > 
> > I'd add a compatible string for the base IP block and name it accordingly.
> 
> personally, I wouldn't do that.
> 
> While the RK3568-variant is a somewhat smooth integration ... the now
> (temporarily) omitted RK3588 variant of a similar block is not.
> 
> I.e. the RK3588 has quite a number of those CSI hosts, with a bunch of
> resource routing bits and bops between those CSI hosts sitting in the
> Rockchip "Gernal Register Files" (dumping ground for random bits and bops).
> 
> So you then get a syscon accessing per-soc registers and bits.
> 
> So while it is (compatible to) some Synopsis IP block, the integration to
> make that thing actually do something is highly soc-specific.
> 
> That's also why the for example the dw-hdmi/dsi IPs don't use a common
> compatible [0] [1] [2] [3] [4]
> 
> 
> [0] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/display/amlogic,meson-dw-hdmi.yaml
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/display/allwinner,sun8i-a83t-dw-hdmi.yaml
> [2] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/display/hisilicon/dw-dsi.txt
> [3] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-hdmi.yaml
> [4] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-mipi-dsi.yaml

Ack, thanks for the explanation. This sounds reasonable to me; this can be
later extended or renamed if needed.

> 
> 
> > > +    soc {
> > > +        interrupt-parent = <&gic>;
> > > +        #address-cells = <2>;
> > > +        #size-cells = <2>;
> > > +
> > > +        csi: csi@fdfb0000 {
> > > +            compatible = "rockchip,rk3568-mipi-csi2";
> > 
> > This would become e.g.
> > 
> >             compatible = "rockchip,rk3568-mipi-csi2", "snps,dw-mipi-csi2rx";
> > 
> > See my comments on the driver patch as well.
> 
> In the PCIe area, we have  rockchip,rk3568-pcie and rockchip,rk3568-pcie-ep
> for a similar combo.
> 
> For CSI the receiver is the vastly more common thing to do. So if anything,
> I'd go with "foo-csi2" vs. "foo-csi2-device", if somebody really develops a
> "camera" SoC, with a fully featured DT-based OS in the future ;-) .

There may be surprises, CSI-2 transmitters may be used in other kinds to
devices than cameras. Therefore I'd add the "rx" part in the name, at the
very least when it comes to the Synopsys IP block. Some of the other
receivers are named that way already and we have a transmitter driver, too.

-- 
Regards,

Sakari Ailus

