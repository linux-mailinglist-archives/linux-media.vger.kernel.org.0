Return-Path: <linux-media+bounces-41571-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A6D18B400C0
	for <lists+linux-media@lfdr.de>; Tue,  2 Sep 2025 14:36:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 56DC7188A465
	for <lists+linux-media@lfdr.de>; Tue,  2 Sep 2025 12:36:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 719932580ED;
	Tue,  2 Sep 2025 12:35:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Jt0/hwhJ"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 660DD24A069;
	Tue,  2 Sep 2025 12:35:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756816547; cv=none; b=ESmyGq+bcivUSyuNlr4x2N75NAvllsp4oBXRvHvfS8hBQbrFo8sbruULJDDV2m48nTHl/DnPn47pPM4wEMeing7QHWx7hgzLlET6Q2vetqE6wYBH6mbpNRxin/T5Xrb9WVlZU3toJwlmsfRbIafLlo/8Yb5lOez+UdnoF+ebxMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756816547; c=relaxed/simple;
	bh=rgeAkaerMuo7pPYf7CTpR6admWuQ1J9uhjoEpdbvc5o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sc8uIAe+u/lDy8Sw8WObH5ma+0/OO6nqmbgu9Se8r0F59i4Q7WYq1+auPJ+882xlC4P+13UKbpLePNABgIGJahmqJx8gS+MyJWtU/XVIvsIKU1PUrV8B7zVXfQVxMbVzjqyAtnbXH8mQUHWtaXv7i5TDMCSTKdD0eFg7je7DUes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Jt0/hwhJ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (230.215-178-91.adsl-dyn.isp.belgacom.be [91.178.215.230])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 07E00C77;
	Tue,  2 Sep 2025 14:34:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1756816477;
	bh=rgeAkaerMuo7pPYf7CTpR6admWuQ1J9uhjoEpdbvc5o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Jt0/hwhJAsbh9xgjvpHX8ZlaNZWIqk8ZIYHl74D/RpN1aB5NiuYJ4sbekghmfQRpw
	 +Fd9A/vmmT2nwwMUYmeRtG4iUHsePTSDC6VPwjWx/jvbSLPcmsnu1qiKBY/+y+WTvx
	 YvS/mGTYyrZxv2mBisLcvTFnx0vJHCWg7VeZxaaQ=
Date: Tue, 2 Sep 2025 14:35:24 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Frank Li <Frank.li@nxp.com>, Guoniu Zhou <guoniu.zhou@nxp.com>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Martin Kepplinger <martink@posteo.de>,
	Purism Kernel Team <kernel@puri.sm>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/4] media: dt-bindings: nxp,imx8mq-mipi-csi2: Add
 i.MX8ULP compatible string
Message-ID: <20250902123524.GK13448@pendragon.ideasonboard.com>
References: <20250901-csi2_imx8ulp-v5-0-67964d1471f3@nxp.com>
 <20250901-csi2_imx8ulp-v5-1-67964d1471f3@nxp.com>
 <20250901154610.GB13448@pendragon.ideasonboard.com>
 <aLZMQ7c8qr5XO88d@lizhi-Precision-Tower-5810>
 <20250902083554.GD13448@pendragon.ideasonboard.com>
 <7c461931-3b04-4354-a892-52f469511c5a@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <7c461931-3b04-4354-a892-52f469511c5a@kernel.org>

On Tue, Sep 02, 2025 at 02:26:53PM +0200, Krzysztof Kozlowski wrote:
> On 02/09/2025 10:35, Laurent Pinchart wrote:
> >>>>          compatible:
> >>>>            contains:
> >>>>              enum:
> >>>> -              - fsl,imx8qxp-mipi-csi2
> >>>> +              - fsl,imx8ulp-mipi-csi2
> >>>> +    then:
> >>>> +      properties:
> >>>> +        reg:
> >>>> +          minItems: 2
> >>>> +        resets:
> >>>> +          minItems: 2
> >>>> +          maxItems: 2
> >>>> +        clocks:
> >>>> +          minItems: 4
> >>>> +        clock-names:
> >>>> +          minItems: 4
> >>>
> >>> But according to this, the ULP version requires more clocks than the QXP
> >>> version.
> >>
> >> If only clock number difference, generally, it is still compatible and can
> >> be fallback, especialy driver use devm_bulk_clk_get_all().
> > 
> > That's a driver-specific implementation decision, so I don't think it
> > should be taken into account to decide on compatibility.
> 
> The clock inputs do not restrict compatibility. If Linux can use
> fallback to bind and operate properly, then it's a strong indication
> devices are compatible.
> 
> Imagine exactly the same registers, so same programming interface, but
> one device takes one more clock which just needs to be enabled through
> its lifetime. Such devices are fully compatible, even though clock
> inputs differ.

That's only the case if someone enables the clock, isn't it ? From a DT
binding point of view, how can we know that the extra clock will be
enabled by a component separate from the driver (in this case by the
fact that the devm_bulk_clk_get_all() function gets all clocks) ?

> I also wanted to express exactly that case on my slides from OSSE -
> slide 28:
> https://osseu2025.sched.com/event/25Vsl/dts-101-from-roots-to-trees-aka-devicetree-for-beginners-krzysztof-kozlowski-linaro

Quoting that slide, you wrote

"Two devices are compatible when the new device works with Linux drivers
bound via fallback (old) compatible".

That is clearly the case here for the existing *Linux* driver. But what
if the driver called devm_bulkd_clk_get() with a device-specific list of
clocks ? Or what if the same DT bindings are used on an OS that has no
clk_get_all() equivalent ? This is my concern with declaring those two
devices as compatible: they may be from the point of view of the current
implementation of the corresponding Linux kernel driver, but DT bindings
are not Linux-specific.

Or do DT bindings assume that drivers have to always enable all clocks
declared in DT, even if they don't know what those clocks are ? That
seems error-prone, in quite a few cases drivers need to handle separate
clocks in a device-specific way, with for instance a particular
ordering, preventing them from using devm_bulk_clk_get_all(). If all
drivers are required to manage all clocks declared in DT, this would get
messy quite quickly.

> (although I focused on reversed case when devices are not compatible,
> because that is decisive case).

-- 
Regards,

Laurent Pinchart

