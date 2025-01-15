Return-Path: <linux-media+bounces-24772-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BBFFA11FCB
	for <lists+linux-media@lfdr.de>; Wed, 15 Jan 2025 11:36:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4D21B7A3D8C
	for <lists+linux-media@lfdr.de>; Wed, 15 Jan 2025 10:36:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 625F11E9910;
	Wed, 15 Jan 2025 10:35:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aAt6QHzC"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 063E81E98FA;
	Wed, 15 Jan 2025 10:35:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736937333; cv=none; b=d57UF3EuHCotxQYOmzJ4EF2f5nMJaGGMZ72lewFFX5pomEmZnP93PsMl4qLrKvQUznBjQBKIYgLrjstSstW6T6Mh6oqJDeXTlLMKGyE4KxZmL0NCYQRqI9OHA3AgwDW996K37O/1SjiJM+WpQBGIbG5e7HIfK0VU42xyv4qypAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736937333; c=relaxed/simple;
	bh=srmbFPQOHGz4l0rqphK2ONGqHNDOAhI+wHcwQagKgAY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uRxVusxPzRQjIuZ5p/J0kqJFqW2q+QITJ/032JINJlDoa9VX5gt1NvIeWPvO8wU6qw1+Eq+oudm0sd9TQKGQGsOlIsP+Y1ZU3dbkRajf826RHqdhRSgm9qAPN13xP/unyS0WgxZhWLwSDu0daGH3MeygK+KuxoIChatuh4kZk1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aAt6QHzC; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736937332; x=1768473332;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=srmbFPQOHGz4l0rqphK2ONGqHNDOAhI+wHcwQagKgAY=;
  b=aAt6QHzC4HWGcl4rP4pAO4Z1DEvRhtyQJ+C6belHlWrQ/SPYJD3u25YI
   Y1zMl+sQ42O445+ESyjXdu4j8gSPPVVvHdykzpngkmZB74DO0WbeDiXCz
   oEwLNqTz9z6yb95DkKWPpdTwfAsEjiGUlQRQsABEc4Kx2anZfByl8XiLX
   OT0uMq5QA8ufjyh2iFGv+FPNfelib7jrG1k6yULTFnAt9v0Bcvn49rVk6
   HQx+DrVwj0BKYeYFhSUApwWv2Ca41uAE2xsa68zILp2SgSw5iJ24pwEnp
   ax041C7itd0FZWCdGcpjnvidW12eSD0fPdxedagXulld92rkFET4rttHx
   Q==;
X-CSE-ConnectionGUID: HXZSP8PGTim6olc/09tFEA==
X-CSE-MsgGUID: L+RrGddjThORE9vVzGENbA==
X-IronPort-AV: E=McAfee;i="6700,10204,11315"; a="37293886"
X-IronPort-AV: E=Sophos;i="6.12,317,1728975600"; 
   d="scan'208";a="37293886"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2025 02:35:31 -0800
X-CSE-ConnectionGUID: yHD1Mg5hS+CA7ypCYlvO/A==
X-CSE-MsgGUID: BCdZ7nwgR6K8jb4ux29lKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,317,1728975600"; 
   d="scan'208";a="110064450"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO mdjait-mobl) ([10.245.244.123])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2025 02:35:26 -0800
Date: Wed, 15 Jan 2025 11:35:19 +0100
From: Mehdi Djait <mehdi.djait@linux.intel.com>
To: Michael Riesch <michael.riesch@wolfvision.net>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Maxime Chevallier <maxime.chevallier@bootlin.com>, =?utf-8?B?VGjDqW8=?= Lebrun <theo.lebrun@bootlin.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
	Kever Yang <kever.yang@rock-chips.com>, Nicolas Dufresne <nicolas@ndufresne.ca>, 
	Sebastian Fricke <sebastian.fricke@collabora.com>, Alexander Shiyan <eagle.alexander923@gmail.com>, 
	Val Packett <val@packett.cool>, Rob Herring <robh@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	Mehdi Djait <mehdi.djait@bootlin.com>, Gerald Loacker <gerald.loacker@wolfvision.net>
Subject: Re: [PATCH v2 0/6] media: rockchip: add a driver for the rockchip
 camera interface (cif)
Message-ID: <2ktcdemu3og64vuvyxykpxrwquewubsqcpmhxykynkbl5ddwym@dsxaldpwu2u4>
References: <20241217-v6-8-topic-rk3568-vicap-v2-0-b1d488fcc0d3@wolfvision.net>
 <20250109171232.GA17638@pendragon.ideasonboard.com>
 <6380144e-f0c4-4415-89d5-36ed3d5a4205@wolfvision.net>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6380144e-f0c4-4415-89d5-36ed3d5a4205@wolfvision.net>

Hi Michael and Laurent,

On Fri, Jan 10, 2025 at 09:48:04AM +0100, Michael Riesch wrote:
> Hi Laurent,
> 
> On 1/9/25 18:12, Laurent Pinchart wrote:
> > Hi Michael,
> > 
> > On Tue, Dec 17, 2024 at 04:55:12PM +0100, Michael Riesch wrote:
> >> [...]
> >> and refactor the whole thing. The resulting v2 of the series now adds a
> >> basic media controller centric V4L2 driver for the Rockchip CIF with
> >>  - support for the PX30 VIP (not tested, though, due to the lack of HW)
> >>  - support for the RK3568 VICAP DVP
> >>  - abstraction for the ping-pong scheme to allow for future extensions 
> >>
> >> However, several features are not yet addressed, such as
> >>  - support for the RK3568 MIPI CSI-2 receiver
> > 
> > We've discussed this previously on IRC, but I don't think the issue has
> > been raised on the list.
> > 
> > I'm puzzled by how this will work. As far as I understand, the RK3568
> > has a CSI-2 receiver with 4 data lanes and 2 clock lanes. I assume this
> > is used to support both 2x2 lanes and 1x4 lanes. Both the VICAP and ISP
> > sections of the TRM list CSI2 RX registers, but it's not clear how the
> > components are all connected. Does the ISP need to be part of the same
> > media graph ?
> 
> Well you are not the only one to be puzzled by this HW :-) I started to
> bring up the MIPI CSI-2 part and can describe the situation as I
> understand it. No claim for correctness or completeness, though.
> 
> Indeed, the RK3568 MIPI CSI-2 PHY (TRM Chapter 28) has 4 data lanes and
> 2 clock lanes. And indeed it is possible to attach one device (1x4) or
> two devices (2x2) to it. In the latter case the PHY is operated in split
> mode (and 1x4 would be the default full mode, then). The mode can be set
> in a GRF register.
> 
> The RK3568 features a MIPI CSI-2 host controller (TRM Chapter 27) that
> (apparently) is connected to the RK3568 VICAP but has its registers in a
> separate memory region. Right now I am trying to clean up the downstream
> V4L2 subdevice driver for this host controller, which shall be linked to
> the PHY using the "phys" DT property, and linked to the VICAP using DT
> endpoints. In the end, the media graph could look like
> 
>   CC1 (V4L2 subdev) --> RK3568 VICAP DVP (V4L2 device)
> 
>   CC2 (V4L2 subdev) --> RK3568 MIPI CSI-2 HOST (V4L2 subdev) -->
>   RK3568 VICAP MIPI (V4L2 device)
> 
> where CC denotes a companion chip, such as an image sensor or a video
> decoder. Note that there are two disjoint subgraphs in this topology.
> 
> As you already pointed out, the RK3568 ISP features its integrated MIPI
> CSI-2 host controller (as e.g. the RK3399 ISP does). This host
> controller is represented by a V4L2 subdevice as well, and the
> connection to the (same) MIPI PHY is established similarly. The
> difference may be that this controller has its registers within the ISP
> register block and is thus tightly coupled to the ISP (and the rkisp1
> driver).
> 
> Now I guess that in split mode the ISP MIPI path works completely
> independent and could be represented either by a separate media graph or
> by another disjoint subgraph in the same media graph.
> In split mode we need to define which host controller should handle
> which set of lanes (there are two sets, clock 1 + data 1 + data 2 as
> well as clock 2 + data 3 + data 4). Right now I am not sure how this
> should be accomplished, but then the split mode can also wait a bit.
> 
> However, as you pointed out in our IRC discussion, it is mentioned in
> TRM Chapter 12 that the RK3568 ISP can also process the DVP input. This
> still needs some verification, the rest of the paragraph is pure
> speculation. But maybe on simply needs to set the correct bits in
> CTRL_0000_VI_DPCL. Now this would mean that there should be one large
> media graph the includes the RK3568 VICAP as well as the RK3568 ISP,
> i.e., something along the lines
> 
>   CC0 (V4L2 subdev) --> RK3568 ISP MIPI CSI-2 HOST (V4L2 subdev)
>                             |
>                             v
>                      RK3568 ISP MUX (V4L2 subdev) --> RK3568 ISP...
>                             ^
>                             |
>   CC1 (V4L2 subdev) --> MAGIC V4L2 subdev? -->
>   RK3568 VICAP DVP (V4L2 device)
> 
>   CC2 (V4L2 subdev) --> RK3568 MIPI CSI-2 HOST (V4L2 subdev) -->
>   RK3568 VICAP MIPI (V4L2 device)
> 
> where the MAGIC V4L2 subdev should be a fan out of some sort?!
> 
> Now to answer your question: I guess it is going to be one media graph
> for RK3568 VICAP and RK3588 ISP. This shall be in perfect alignment with
> the RK3588, where VICAP and ISPs are clearly connected.

From what I can gather online:

"For RV1126/RV1109 and RK356X platforms, VICAP and ISP are two independent image processing IPs,
If the image collected by VICAP is to be processed by ISP , it is necessary to generate v4l2
corresponding to the interface of VICAP at the driver level sub The device is linked to the node
corresponding to the ISP to provide parameters for the ISP driver to use."

"For the RK356X chip, VICAP has only a single core and has both dvp/mipi interfaces. The dvp interface
corresponds to a rkvicap_dvp node, and the mipi interface corresponds to a rkvicap_mipi_lvds node each
node can be collected independently."

"In order to synchronize the VICAP collected data information to the isp driver, it is necessary to link the
logical sditf node generated by the VICAP driver to the virtual node
device generated by the isp"

In a graph showing how ISP and VICAP are connected a virtual connection
is used (as opposed to a Entitative connection, e.g., between the mipi
sensor and the csi2 dphy)

So from my understanding, VICAP/ISP2.1 of rk3568 seem to be different from the rk3588,
where the VICAP is clearly connected to the two ISP3.0

--
Kind Regards
Mehdi Djait

