Return-Path: <linux-media+bounces-47907-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A155C95A71
	for <lists+linux-media@lfdr.de>; Mon, 01 Dec 2025 04:37:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 26F604E0789
	for <lists+linux-media@lfdr.de>; Mon,  1 Dec 2025 03:37:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F0521E9B37;
	Mon,  1 Dec 2025 03:37:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="qM/jpEgU"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B802513FEE;
	Mon,  1 Dec 2025 03:37:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764560254; cv=none; b=h6GU9VDtz4i1khb/IQktF7zIFPo7OCojy4p445WF3x3FIi/W8lhUcEyY4yO8eP9oJTs2nm913+THq++vuZNB3D+d9T5h/IU6j1406qm7jXTfsLtDZG/IJMuTVUMcBaj3/guOF/MQP0U1OgnfsDoXbIqZGdngUU+IUtoKXQ7Skqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764560254; c=relaxed/simple;
	bh=cCPR+pIU13nIqPPAmxJUzZ9WNyhhXDoQPnxKeb/DE6s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S+dfhl5x+ohDYJRfb2MFKwr2ZrFnsN2MItk0cEmwvGBMowxaQ5bcIYAwfMRmgAanWA98SPdu0LphcY7r/pbVtPiw11bd72ItF/oXy4WftdJk45VD+oclUnzZk81P2V14wXuTrLZXM0I7LtN48t4cNMXv0VXC2EM/eF1PtaWJuFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=qM/jpEgU; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (fp76f193f3.tkyc206.ap.nuro.jp [118.241.147.243])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 5A884F13;
	Mon,  1 Dec 2025 04:35:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1764560109;
	bh=cCPR+pIU13nIqPPAmxJUzZ9WNyhhXDoQPnxKeb/DE6s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qM/jpEgUdA19glwbyE2H3ayIZ9/bnftrChud7b7kT2zwvlf7GoiKCQG0qYbIL/Ce0
	 1DRpTW33IGsRk++KZaBSN99qFxv+txwqvohB2fnntzwB01XqUCC52j/dh3wRvb9J0J
	 xMpoIZWa0k0aRqRq8BkAjrmEbzkSTxBzZWvGxbBw=
Date: Mon, 1 Dec 2025 12:37:00 +0900
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Michael Riesch <michael.riesch@collabora.com>
Cc: Frank Li <Frank.li@nxp.com>, Mehdi Djait <mehdi.djait@linux.intel.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Collabora Kernel Team <kernel@collabora.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] media: rockchip: add driver for the rockchip mipi
 csi-2 receiver
Message-ID: <20251201033700.GB21943@pendragon.ideasonboard.com>
References: <20251114-rockchip-mipi-receiver-v2-0-eb9b43377fc4@collabora.com>
 <20251114-rockchip-mipi-receiver-v2-2-eb9b43377fc4@collabora.com>
 <aRyplYZOrGsSxSlp@lizhi-Precision-Tower-5810>
 <554971e1-6fde-4b2c-a2de-fe178358a4e3@collabora.com>
 <aRzub5Ak6DZpO5f/@lizhi-Precision-Tower-5810>
 <87049b4c-df7d-454b-a7f4-073975a7ee94@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87049b4c-df7d-454b-a7f4-073975a7ee94@collabora.com>

Hello,

On Wed, Nov 26, 2025 at 09:57:31PM +0100, Michael Riesch wrote:
> On 11/18/25 23:08, Frank Li wrote:
> > On Tue, Nov 18, 2025 at 07:59:14PM +0100, Michael Riesch wrote:
> >> On 11/18/25 18:15, Frank Li wrote:
> >>> On Tue, Nov 18, 2025 at 12:12:26PM +0100, Michael Riesch via B4 Relay wrote:
> >>>> From: Michael Riesch <michael.riesch@collabora.com>
> >>>>
> >>>> [...]
> >>>> +#define CSI2HOST_N_LANES     0x04
> >>>> +#define CSI2HOST_CSI2_RESETN 0x10
> >>>> +#define CSI2HOST_PHY_STATE   0x14
> >>>> +#define CSI2HOST_ERR1	     0x20
> >>>> +#define CSI2HOST_ERR2	     0x24
> >>>> +#define CSI2HOST_MSK1	     0x28
> >>>> +#define CSI2HOST_MSK2	     0x2c
> >>>> +#define CSI2HOST_CONTROL     0x40
> >>>
> >>> Look like that is designware CSI2 controller, can we build common library
> >>> for all dwc csi2 controller, instead of every vendor create individual one.
> >>>
> >>> First try at
> >>> https://lore.kernel.org/linux-media/20250821-95_cam-v3-21-c9286fbb34b9@nxp.com/
> >>>
> >>> Toshiba have similar patch
> >>> https://lore.kernel.org/linux-media/aPZd39riAxqfw3mT@lizhi-Precision-Tower-5810/
> >>>
> >>> Frank
> >>
> >> This has been discussed already a while ago:
> >> https://lore.kernel.org/all/20250507083837.GA11152@pendragon.ideasonboard.com/
> > 
> > https://lore.kernel.org/all/20250702093806.GF16835@pendragon.ideasonboard.com/
> > 
> > Laurent Pinchart prevent imx93 DWC CSI2 driver at Jul, your discussion at
> > May, I think Laurent Pinchart change the mind.
> > 
> > We can choose not base on imx6, but we should create a standard dwc2 under
> > drivers/media/platform/synopsys/
> 
> In principle, I agree with refactoring out common code. However, I am
> not sure how similar these IP cores really are. Again, the answer I
> received from Rockchip states that this is *not* a Synopsys IP core.

That's what I based my opinion on. If we're dealing with different IP
cores from different vendors, we can have separate drivers. Even within
the family of CSI-2 receivers from Synopsys, I'm fine having different
drivers if the version differ significantly enough that using a single
driver would cause more pain than gain.

To explain this differently, for Synopsys CSI-2 receivers, I would like
to try and support multiple IP cores integrated in different SoCs in a
single driver. If, during that development, we find good reasons to use
separate drivers, then we can do so.

> Can you maybe test whether the Rockchip MIPI CSI-2 Receiver driver in
> this series works on your hardware? Then we will know if (and what)
> parts can be shared.
> 
> > Laurent Pinchart:
> > 
> > 	Can you provide direction?
> > 
> >> Bottom line from Laurent:
> >>
> >> "Let's keep this driver Rockchip-specific then. Thanks for checking."
> >>
> >>>  [...]

-- 
Regards,

Laurent Pinchart

