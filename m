Return-Path: <linux-media+bounces-359-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C2947EBF4B
	for <lists+linux-media@lfdr.de>; Wed, 15 Nov 2023 10:16:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BA890B20C55
	for <lists+linux-media@lfdr.de>; Wed, 15 Nov 2023 09:16:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 167B15660;
	Wed, 15 Nov 2023 09:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="gkv7Pl+b"
X-Original-To: linux-media@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AEC87E;
	Wed, 15 Nov 2023 09:16:29 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::221])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F2A711C;
	Wed, 15 Nov 2023 01:16:23 -0800 (PST)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1688524000C;
	Wed, 15 Nov 2023 09:16:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1700039782;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fEBGlNa6ETX9qVEVywc0Dk28Tg8zkpZzVQlUPuAs6YA=;
	b=gkv7Pl+bIME6lgpeIGjLvmlGp04L3bUcTbk094pWAX166nXAAXV0ImUKdI1WHscKuhwpV3
	MERBo6HmYIkos69YcUQEJnkmC7paZ+TYedjZgtHgP+qPEeoFv7GFTDd4Q5aft/jLs4R1pR
	KLXPAO2mSsDrHVSSbIdhVu3A0HjgEuTx441A5evLC3MAHs//ZAAYVrOdzMx/wOD0LFSf5s
	KEWjVK//XX5iMeegY29KYX9dzQe3/2tJpjhV0Aq5fKHmqBl0g2CXkiXo2pllbBvARZuPk8
	Ykaic8DVN4kG3kl4inyELuQsbLjGcuBU6ZkyUZx0ne5d/jShTVhbQFIMXaA7pA==
Date: Wed, 15 Nov 2023 10:16:20 +0100
From: Mehdi Djait <mehdi.djait@bootlin.com>
To: Michael Riesch <michael.riesch@wolfvision.net>
Cc: mchehab@kernel.org, heiko@sntech.de, hverkuil-cisco@xs4all.nl,
	krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org,
	conor+dt@kernel.org, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	thomas.petazzoni@bootlin.com, alexandre.belloni@bootlin.com,
	maxime.chevallier@bootlin.com, paul.kocialkowski@bootlin.com
Subject: Re: [PATCH v10 2/3] media: rockchip: Add a driver for Rockchip's
 camera interface
Message-ID: <ZVSMZLDVPv0V3h1A@pc-70.home>
References: <cover.1699460637.git.mehdi.djait@bootlin.com>
 <bcc0b84f4a6a8cf4c007cfe25025060b22627408.1699460637.git.mehdi.djait@bootlin.com>
 <4f9bc04b-81af-49ee-9818-d4cd281504e7@wolfvision.net>
 <ZVJAogJsTidx+Cg1@pc-70.home>
 <c06b68f5-ac7c-46d4-bb81-dc1dbbee0b34@wolfvision.net>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c06b68f5-ac7c-46d4-bb81-dc1dbbee0b34@wolfvision.net>
X-GND-Sasl: mehdi.djait@bootlin.com

On Mon, Nov 13, 2023 at 05:05:12PM +0100, Michael Riesch wrote:
> Hi Mehdi,
> 
> On 11/13/23 16:28, Mehdi Djait wrote:
> > Hi Michael,
> > 
> > On Fri, Nov 10, 2023 at 03:33:34PM +0100, Michael Riesch wrote:
> >> Hi Mehdi,
> >>
> >> Sorry, forgot one thing:
> >>
> >> On 11/8/23 17:38, Mehdi Djait wrote:
> >>> +static int cif_subdev_notifier(struct cif_device *cif_dev)
> >>> +{
> >>> +	struct v4l2_async_notifier *ntf = &cif_dev->notifier;
> >>> +	struct device *dev = cif_dev->dev;
> >>> +	struct v4l2_async_connection *asd;
> >>> +	struct v4l2_fwnode_endpoint vep = {
> >>> +		.bus_type = V4L2_MBUS_PARALLEL,
> >>
> >> This is surprising. I had to set this to V4L2_MBUS_UNKNOWN, otherwise
> >> v4l2_fwnode_endpoint_parse would yield -ENXIO, which indicates a bus
> >> type mismatch. Does this really work for your (BT.656, right?) setup?
> >>
> > 
> > Yes it works.
> > 
> >> I think we should get the bus type from the device tree, right?
> >>
> > 
> > I am looking into this.
> > 
> >> Thanks and best regards,
> >> Michael
> >>
> > 
> > I assume you have a "bus-type = <MEDIA_BUS_TYPE_BT656>;" in the device
> > tree definition of your endpoint ? This caused the mismatch as the
> > v4l2_fwnode_endpoint is set to PARALLEL
> 
> Yes that's correct.
> 
> The documentation is quite sparse here, but I would guess that the PX30
> VIP accepts parallel data without embedded syncs (=
> MEDIA_BUS_TYPE_PARALLEL) as well as parallel data with embedded syncs (=
> MEDIA_BUS_TYPE_BT656). If this is actually the case, I think we should
> put V4L2_MBUS_UNKNOWN and let the device tree decide.

Yes, I will do this.

> 
> We can be sure, however, that the PX30 VIP supports BT.656, so I guess
> the safe approach would be to use .bus_type = V4L2_MBUS_BT656.
> 
> What do you think?

I agree

--
Kind Regards
Mehdi Djait

> 
> Best regards,
> Michael

