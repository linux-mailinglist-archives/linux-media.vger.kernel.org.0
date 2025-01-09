Return-Path: <linux-media+bounces-24545-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B164A07EAA
	for <lists+linux-media@lfdr.de>; Thu,  9 Jan 2025 18:21:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 02C23188D0A4
	for <lists+linux-media@lfdr.de>; Thu,  9 Jan 2025 17:21:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03DCA18E377;
	Thu,  9 Jan 2025 17:21:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Z1WDds6P"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7265D16FF4E;
	Thu,  9 Jan 2025 17:20:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736443259; cv=none; b=FmtU9CA3TCAnrP2/lu8n2ssQJFeCT9mUTI9m6hUKtsci+IUIvDsWAZmz9KlOmaUSLrNyXTVRDoVz11NLnL+gbgqk4pdNkyg/lSuXuvMMiJdFsH1mgQRl+S/ohmw0hpS2vfeSLOTIdkOozkCrLTfKNADwd58oc3xN2TZZbHlj8+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736443259; c=relaxed/simple;
	bh=uhkXg/EPKEWf0hrvEKJHWpb/MtLkbHrB4R9KcaWrJ5c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HkDQzso0WRqtGph10KcJ12Gt8H8WayBqMULg1NPf2/LKEegmeBRJxw8Y1NfuFHGbg41JtmMp3RpR+LlpovS3xpTjKEzJ632gWeg2HxvvH5vwnN0s2qApEeGb4eFtmDShRJxWS7D+a2QbcrltABxNSU3E65qogqx4K0Ea8ty/eu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Z1WDds6P; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 29C9B9FC;
	Thu,  9 Jan 2025 18:11:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1736442701;
	bh=uhkXg/EPKEWf0hrvEKJHWpb/MtLkbHrB4R9KcaWrJ5c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Z1WDds6PNKloMPIdeFYjkX0VkFBb7SBPf9nkbHrZDhHD9xu9F8DnwP2oq+RVhlDO5
	 PiXXUyn8NIvDSIYHNK6vaTM0zYyn02cOX9OCBEl4Rv6lFYf91tRxr+crRNx19iEjRa
	 mIsHc3a+4skJifA1kAtYcHMxil/dRoBOJ7b7U4j8=
Date: Thu, 9 Jan 2025 19:12:32 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Michael Riesch <michael.riesch@wolfvision.net>
Cc: Mehdi Djait <mehdi.djait@linux.intel.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	=?utf-8?B?VGjDqW8=?= Lebrun <theo.lebrun@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Kever Yang <kever.yang@rock-chips.com>,
	Nicolas Dufresne <nicolas@ndufresne.ca>,
	Sebastian Fricke <sebastian.fricke@collabora.com>,
	Alexander Shiyan <eagle.alexander923@gmail.com>,
	Val Packett <val@packett.cool>, Rob Herring <robh@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Mehdi Djait <mehdi.djait@bootlin.com>,
	Gerald Loacker <gerald.loacker@wolfvision.net>
Subject: Re: [PATCH v2 0/6] media: rockchip: add a driver for the rockchip
 camera interface (cif)
Message-ID: <20250109171232.GA17638@pendragon.ideasonboard.com>
References: <20241217-v6-8-topic-rk3568-vicap-v2-0-b1d488fcc0d3@wolfvision.net>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241217-v6-8-topic-rk3568-vicap-v2-0-b1d488fcc0d3@wolfvision.net>

Hi Michael,

On Tue, Dec 17, 2024 at 04:55:12PM +0100, Michael Riesch wrote:
> Habidere,
> 
> TL;DR:
> 
> This series introduces support for the Rockchip Camera Interface (CIF),
> which can be found (in the form of variants that differ significantly) in
> different Rockchip SoCs in general, and for the Rockchip RK3568 Video
> Capture (VICAP) variant in particular.
> 
> The patches are functional and have been tested successfully on a
> custom RK3568 board including the ITE Tech. IT6801 HDMI receiver as
> attached subdevice. The IT6801 driver still needs some loving care but
> shall be submitted as well at some point.
> 
> The long story (gather 'round children):
> 
> The Rockchip Camera Interface (CIF) is featured in many Rockchip SoCs
> in different variations. For example, the PX30 Video Input Processor (VIP)
> is able to receive video data via the Digital Video Port (DVP, a parallel
> data interface and transfer it into system memory using a double-buffering
> mechanism called ping-pong mode. The RK3568 Video Capture (VICAP) unit,
> on the other hand, features a DVP and a MIPI CSI-2 receiver that can
> receive video data independently (both using the ping-pong scheme).
> The different variants may have additional features, such as scaling
> and/or cropping.
> Finally, the RK3588 VICAP unit constitutes an essential piece of the camera
> interface with one DVP, six MIPI CSI-2 receivers, scale/crop units, and
> different data path multiplexers (to system memory, to ISP, ...).
> 
> This submission bases on the work of several Bootlin developers who have
> been tirelessly submitting support for the PX30 Video Input Processor (VIP)
> block for inclusion in mainline. This process has been going on for several
> years now, with Maxime Chevallier working on the topic up to v5 [0] and
> Mehdi Djait taking over until v13 [1].
> In the review feedback on v13 a major rework with a media controller
> centric driver as a goal was requested. This motivated me to take over
> (with no clue about the MC framework whatsoever, though).
> 
> I decided to merge Mehdi's v13 with my v1 of the RK3568 VICAP support [2]
> and refactor the whole thing. The resulting v2 of the series now adds a
> basic media controller centric V4L2 driver for the Rockchip CIF with
>  - support for the PX30 VIP (not tested, though, due to the lack of HW)
>  - support for the RK3568 VICAP DVP
>  - abstraction for the ping-pong scheme to allow for future extensions 
> 
> However, several features are not yet addressed, such as
>  - support for the RK3568 MIPI CSI-2 receiver

We've discussed this previously on IRC, but I don't think the issue has
been raised on the list.

I'm puzzled by how this will work. As far as I understand, the RK3568
has a CSI-2 receiver with 4 data lanes and 2 clock lanes. I assume this
is used to support both 2x2 lanes and 1x4 lanes. Both the VICAP and ISP
sections of the TRM list CSI2 RX registers, but it's not clear how the
components are all connected. Does the ISP need to be part of the same
media graph ?

>  - support for the RK3588 variant
>  - support for the scaling/cropping units that can be found in some
>    variants
>  - support for capturing different virtual channels (up to four IDs
>    possible)
> This needs to be in the scope of future work.
> 
> Finally, please forgive me if I forgot to address reviewer comments from
> the previous iterations. Between v1 and v13 they have seen significant
> feedback including renaming the complete driver twice (from rkcif to vip
> and back to cif) and I am pretty sure that I was not able to gather
> everything.
> 
> Looking forward to your comments!
> 
> [0] https://lore.kernel.org/linux-media/20201229161724.511102-1-maxime.chevallier@bootlin.com/
> [1] https://lore.kernel.org/linux-media/cover.1707677804.git.mehdi.djait.k@gmail.com/
> [2] https://lore.kernel.org/all/20240220-v6-8-topic-rk3568-vicap-v1-0-2680a1fa640b@wolfvision.net/
> 
> To: Mehdi Djait <mehdi.djait@linux.intel.com>
> To: Maxime Chevallier <maxime.chevallier@bootlin.com>
> To: Théo Lebrun <theo.lebrun@bootlin.com>
> To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> To: Sakari Ailus <sakari.ailus@iki.fi>
> To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> To: Mauro Carvalho Chehab <mchehab@kernel.org>
> To: Rob Herring <robh+dt@kernel.org>
> To: Krzysztof Kozlowski <krzk+dt@kernel.org>
> To: Conor Dooley <conor+dt@kernel.org>
> To: Heiko Stuebner <heiko@sntech.de>
> To: Kever Yang <kever.yang@rock-chips.com>
> To: Nicolas Dufresne <nicolas@ndufresne.ca>
> To: Sebastian Fricke <sebastian.fricke@collabora.com>
> To: Alexander Shiyan <eagle.alexander923@gmail.com>
> To: Val Packett <val@packett.cool>
> To: Rob Herring <robh@kernel.org>
> To: Philipp Zabel <p.zabel@pengutronix.de>
> Cc: linux-media@vger.kernel.org
> Cc: devicetree@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-rockchip@lists.infradead.org
> Signed-off-by: Michael Riesch <michael.riesch@wolfvision.net>
> 
> Changes in v2:
> - merged with Mehdi's v13
> - refactored the complete driver towards a media controller centric driver
> - abstracted the generic ping-pong stream (can be used for DVP as well as for CSI-2)
> - switched to MPLANE API
> - added support for notifications
> - Link to v1: https://lore.kernel.org/r/20240220-v6-8-topic-rk3568-vicap-v1-0-2680a1fa640b@wolfvision.net
> 
> ---
> Mehdi Djait (2):
>       media: dt-bindings: media: add bindings for rockchip px30 vip
>       arm64: dts: rockchip: add the vip node to px30
> 
> Michael Riesch (4):
>       media: dt-bindings: media: video-interfaces: add defines for sampling modes
>       media: dt-bindings: media: add bindings for rockchip rk3568 vicap
>       media: rockchip: add a driver for the rockchip camera interface (cif)
>       arm64: dts: rockchip: add vicap node to rk356x
> 
>  .../bindings/media/rockchip,px30-vip.yaml          | 123 ++++
>  .../bindings/media/rockchip,rk3568-vicap.yaml      | 168 +++++
>  MAINTAINERS                                        |   9 +
>  arch/arm64/boot/dts/rockchip/px30.dtsi             |  12 +
>  arch/arm64/boot/dts/rockchip/rk356x-base.dtsi      |  44 ++
>  drivers/media/platform/rockchip/Kconfig            |   1 +
>  drivers/media/platform/rockchip/Makefile           |   1 +
>  drivers/media/platform/rockchip/cif/Kconfig        |  15 +
>  drivers/media/platform/rockchip/cif/Makefile       |   3 +
>  .../media/platform/rockchip/cif/cif-capture-dvp.c  | 794 +++++++++++++++++++++
>  .../media/platform/rockchip/cif/cif-capture-dvp.h  |  24 +
>  drivers/media/platform/rockchip/cif/cif-common.h   | 163 +++++
>  drivers/media/platform/rockchip/cif/cif-dev.c      | 405 +++++++++++
>  drivers/media/platform/rockchip/cif/cif-regs.h     | 132 ++++
>  drivers/media/platform/rockchip/cif/cif-stream.c   | 676 ++++++++++++++++++
>  drivers/media/platform/rockchip/cif/cif-stream.h   |  24 +
>  include/dt-bindings/media/video-interfaces.h       |   4 +
>  17 files changed, 2598 insertions(+)
> ---
> base-commit: 40384c840ea1944d7c5a392e8975ed088ecf0b37
> change-id: 20240220-v6-8-topic-rk3568-vicap-b9b3f9925f44

-- 
Regards,

Laurent Pinchart

