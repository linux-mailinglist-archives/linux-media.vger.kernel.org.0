Return-Path: <linux-media+bounces-39568-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D9B1B223D0
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 11:57:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 834111B63D69
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 09:56:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A60D2EA750;
	Tue, 12 Aug 2025 09:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="HR/wDnWj"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5071C2EA745;
	Tue, 12 Aug 2025 09:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754992567; cv=none; b=CVNAkzDlBDjnWrvjYLzaIuJsdZjQbYk5n/Gr2p4TtpGwghYK9cJ0cckVtZ6ZC80Gt6niyYIKU5MsMN3XTvl3bTWwmQ+feUpiW2pm4H7VojBw+hWbdJhE/Vl+109+SyVApjUQV85cZgo+Te333fikEICJ+cjSAEGIRbQg0rUsoCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754992567; c=relaxed/simple;
	bh=Jc6UjfTcQvZWgyuziRpzBFM1KCrtVqYio7YrhWkGjvg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hy+2vMfAg9fOWfemYKGbbyV9ycgXBudBY6gSpzzdntbMv9lSSZYcerei/9wgbVDme0mUE/ErmIKm/rj7WJRHcC13wx0M5ot5KiFGrwLM+TdIHCC8ltPj5811E6BQJPfk8XVsVqTZpIe9N4o40uqqyccNe0qGBUfu2k/5vaec96A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=HR/wDnWj; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id A7B9A3D5;
	Tue, 12 Aug 2025 11:55:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1754992509;
	bh=Jc6UjfTcQvZWgyuziRpzBFM1KCrtVqYio7YrhWkGjvg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HR/wDnWjoEx6ULy6D4nn+zWGXxDgeyYjkra3kB1vPWDoUNiH9LNSm4NLhq91Jm+eg
	 0W3+I+BKlvUc8had2s1myxVGNC/2Vl5oBrmBNmb18Ap60IBtTsVPwph/ogC/gOV+fG
	 7QnPJqG8jllMngW/Th7BLSigM759CA6JBFuS6338=
Date: Tue, 12 Aug 2025 12:55:43 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Will Whang <will@willwhang.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 1/4] dt-bindings: media: Add Sony IMX585 CMOS image
 sensor
Message-ID: <20250812095543.GJ30054@pendragon.ideasonboard.com>
References: <20250810220921.14307-1-will@willwhang.com>
 <20250810220921.14307-2-will@willwhang.com>
 <20250811-successful-military-dragon-d72486@kuoka>
 <CAFoNnrxWwqT9WA-h2WOsUe6Q-qEoz2mTHLpDogAyMwiXXZ9MrA@mail.gmail.com>
 <f12e6ff3-6ec3-487f-bf9c-0f8c06ee6444@kernel.org>
 <CAFoNnrxhUof8BBrefm1L1peTxg==Koz72TY+54G_8QUy-rrT8g@mail.gmail.com>
 <e695c61a-e183-4eea-a7f6-1b2861b2129f@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e695c61a-e183-4eea-a7f6-1b2861b2129f@kernel.org>

On Tue, Aug 12, 2025 at 08:47:12AM +0200, Krzysztof Kozlowski wrote:
> On 12/08/2025 08:31, Will Whang wrote:
> > On Mon, Aug 11, 2025 at 11:23 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
> >> On 12/08/2025 04:47, Will Whang wrote:
> >>> On Mon, Aug 11, 2025 at 1:01 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:
> >>>> On Sun, Aug 10, 2025 at 11:09:18PM +0100, Will Whang wrote:
> >>>>> +description:
> >>>>> +  IMX585 sensor is a Sony CMOS sensor with 4K and FHD outputs.
> >>>>> +
> >>>>> +properties:
> >>>>> +  compatible:
> >>>>> +    enum:
> >>>>> +      - sony,imx585
> >>>>> +      - sony,imx585-mono
> >>>>
> >>>> I don't understand this second compatible. Is this different hardware?
> >>>> Can you point me to "mono" datasheet?
> >>>>
> >>>> Your description should explain this. Commit msg as well, instead of
> >>>> speaking about driver (in fact drop all driver related comments).
> >>>>
> >>> Mono version of this sensor is basically just removing the bayer
> >>> filter, so the sensor itself actually doesn't know if it is color or
> >>> mono and from my knowledge there are no registers programmed in the
> >>> factory that will show the variant and model number. (That is why when
> >>> the driver probing it only test blacklevel register because there are
> >>> no ID registers)
> >>> Originally in V1 patch I've made the switch between color and mono in
> >>> dtoverlay config but reviewer comments is to move it to compatible
> >>> string and not property.(https://lore.kernel.org/linux-media/20250703175121.GA17709@pendragon.ideasonboard.com/)
> >>
> >> You only partially answer and judging by mentioning driver below:
> >>
> >>> In this case, what would you recommend?
> >>>
> >>> compatible:
> >>>   enum:
> >>>     - sony,imx585
> >>>     - sony,imx585-mono
> >>>   description: IMX585 has two variants, color and mono which the
> >>> driver supports both.
> >>
> >> ... I still have doubts that you really understand what I am asking. Is
> >> this one device or two different devices?
> > 
> > One device that has two variants: IMX585-AAMJ1 (Mono) and IMX585-AAQJ1
> > (Color). Silicon-wise the difference is just with or without bayer
> > filter.
> 
> Then I would propose to use sony,imx585-aamj1 and -aaqj1 with short
> explanation either in comment or description about difference in RGB
> mosaic filter.

Works for me. We could possibly omit the "j1" suffix too.

-- 
Regards,

Laurent Pinchart

