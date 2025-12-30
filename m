Return-Path: <linux-media+bounces-49739-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9291ACEA168
	for <lists+linux-media@lfdr.de>; Tue, 30 Dec 2025 16:41:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 312773026BE9
	for <lists+linux-media@lfdr.de>; Tue, 30 Dec 2025 15:41:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EC2631B830;
	Tue, 30 Dec 2025 15:41:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ofGdgb83"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 289A11D5147;
	Tue, 30 Dec 2025 15:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767109272; cv=none; b=EoNBQ0MsyQ1tZHv2hnNtf403L83eXbl9DjXQA3OLT51998t72ORf8UKrqVnURB+h97M/6KtVLXNT+VHbyjw47z3LKbbJ3uxkqOw/J3SwT+mhY//kx/9Tvg6TZ1IfevILY53XkdS1zSvO+5ppULEIxZoi7V8RaMgoHGMlepiTIsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767109272; c=relaxed/simple;
	bh=apkkKHbQEvOx+K1aMNFO/FPgeZ2qyncd7/Rds2OHpNc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aNl5pGKbfdrivKp69PXvMqU/el8ujKopok7JZX8JuB/UOVZGX/vewUigOoPSTicIV6mUe3fxe4qLJJg8Cp7ROL/qnIZWzpb7TVNysvvSKVjU1qGbppTwfxOfMlb7w/zJ3BTvjROKv72ppQ9OE4B4OgpySoKrU2X1vLnf5orI8k8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ofGdgb83; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-152.bb.dnainternet.fi [81.175.209.152])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 1719A55C;
	Tue, 30 Dec 2025 16:40:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1767109251;
	bh=apkkKHbQEvOx+K1aMNFO/FPgeZ2qyncd7/Rds2OHpNc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ofGdgb8344WTydio7RC8vlaglBbb46l2fQE9fH9zaCzg9Ubgb3DjsRuBgk4YJNcGA
	 ZMDhIuvLs/unde+2zC/9Akfy7VUK+xmDFAAlPx9QxYBped5lSBAgRKBmTLTWVIZz/o
	 IFsD2ew/e092T23ZAdXF2OVdc+opjMMyvEopYsUw=
Date: Tue, 30 Dec 2025 17:40:48 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>, krzk+dt@kernel.org,
	andersson@kernel.org, konradybcio@kernel.org,
	dave.stevenson@raspberrypi.com, robh@kernel.org,
	conor+dt@kernel.org, mchehab@kernel.org,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: Re: [PATCH v3 1/4] media: i2c: ov9282: Fix reset-gpio logical state
Message-ID: <20251230154048.GA15048@pendragon.ideasonboard.com>
References: <20251114133822.434171-1-loic.poulain@oss.qualcomm.com>
 <20251114133822.434171-2-loic.poulain@oss.qualcomm.com>
 <aRtbwK0Afo50Lh0B@kekkonen.localdomain>
 <CAFEp6-1Tdmr5v0r+q0qeOG6qqA-hiBaF1iTEcmhBA0oTjLgbgg@mail.gmail.com>
 <aT_Xc6LR161QBRFp@kekkonen.localdomain>
 <CAFEp6-2PP0ufge0RXTrE2Nrn_sLCN5erokxpJsuGeHq7ZEZ83g@mail.gmail.com>
 <41447e2e-52af-4fe0-8204-7ee7f43841c6@kernel.org>
 <CAFEp6-26NiAcoP-nTaFZrG6AT3QimZsNLfPU07Fj2TwqimBbRg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFEp6-26NiAcoP-nTaFZrG6AT3QimZsNLfPU07Fj2TwqimBbRg@mail.gmail.com>

On Tue, Dec 30, 2025 at 04:03:58PM +0100, Loic Poulain wrote:
> On Tue, Dec 30, 2025 at 2:54 PM Krzysztof Kozlowski wrote:
> > On 15/12/2025 11:19, Loic Poulain wrote:
> > > On Mon, Dec 15, 2025 at 10:40 AM Sakari Ailus wrote:
> > >> On Mon, Dec 15, 2025 at 10:35:15AM +0100, Loic Poulain wrote:
> > >>> On Mon, Nov 17, 2025 at 6:30 PM Sakari Ailus wrote:
> > >>>> On Fri, Nov 14, 2025 at 02:38:19PM +0100, Loic Poulain wrote:
> > >>>>> Ensure reset state is low in the power-on state and high in the
> > >>>>> power-off state (assert reset). Note that the polarity is abstracted
> > >>>>> by the GPIO subsystem, so the logic level reflects the intended reset
> > >>>>> behavior.
> > >>>>
> > >>>> That's an interesting approach to fix DTS gone systematically wrong.
> > >>>>
> > >>>> I was thinking of the drivers that have this issue, too, but I would have
> > >>>> introduced a new GPIO under a different name (many sensors use "enable",
> > >>>> too). Any thoughts?
> > >>>
> > >>> Apologies for missing your point earlier. We can’t really name it
> > >>> enable, as it performs the opposite function and that would be
> > >>> confusing in the device tree description. A property like reset2 would
> > >>> be more accurate, but I suspect such a binding wouldn’t be acceptable
> > >>> from a device tree/bindings perspective.
> > >>
> > >> Many sensor datasheets document a pin called "xshutdown" or alike. That's
> > >> not exactly "reset" or "enable" but it can be mapped to either and this can
> > >> be seen in the existing bindings. The polarity is effectively the opposite,
> > >> yes, but does that matter?
> > >
> > > I assume naming a pin 'xshutdown' or 'xreset' indicates that its
> > > polarity is inverted at the driver level, the driver interprets the
> > > shutdown or reset function as being active when the logical level is 0
> > > (low), as they actually incorrectly do for the 'reset' gpio.
> > >
> > > From the driver’s perspective, this naming convention is acceptable;
> > > however, it causes the devicetree description to slightly diverge from
> > > the datasheet and leaves the reset property effectively inverted (and
> > > therefore incorrect).
> > >
> > > Honestly, in this specific case, the simplest solution would be to fix
> > > the driver, since there is currently no upstream devicetree using this
> > > sensor. That would technically break backward compatibility for any
> > > out-of-tree DTS (if they exist), but those would have been incorrect
> > > in the first place.
> > >
> > > But yes, this seems like a good opportunity to discuss and define a
> > > more general approach that can be applied to other drivers with
> > > similar polarity or naming issues.
> > >
> > > Krzysztof, any thoughts?
> >
> > You need to first CC me. You sent it to the special bulk email
> > address... Anyway, please be specific about the question.
> 
> Ultimately, I’d like to reach a consensus before moving forward with
> V4, as several approaches have been discussed so far:
> 
> 1. Keep the current (incorrect) driver logic: This was the approach I
> used in V1 of this series, explicitly noting in the DTS that the
> polarity was incorrect. However, this workaround was fairly rejected
> as not being an acceptable solution.
> 
> 2. Fix the driver logic: This was the approach in V2. It ensures
> correct behavior going forward, especially since there is currently no
> upstream DTB using this binding yet. The downside is that it would
> consistently break any out-of-tree DTBs that *incorrectly* describe
> the GPIO polarity.
> 
> 3. Follow the wsa881x approach: this is V3, aiming for best-effort
> backward compatibility. That said, it’s true that this approach does
> not handle all cases.
> 
> There have also been discussions about introducing an additional
> property for the same pin, with polarity described correctly... From a
> DTS perspective, I believe this would likely be rejected.
> 
> Based on Laurent’s reply, he seems more inclined toward solutions 1
> and 2. Would either of these approaches be acceptable from a DTS
> standpoint?

Do you know of DTs in the wild that use the ov9282 reset-gpios ? Based
on the git history, I see the driver was initially upstreamed by Intel,
and there's been lots of activity on the driver from Dave Stevenson from
Raspberry Pi.

Raspberry Pi modules don't wire the reset pin to a GPIO (the GPIO on the
connector controls the on-module regulators), so there should be no
regression if we changed the driver behaviour.

As the driver was upstreamed by Intel, I assume it may be used on
ACPI-based systems. Sakari, do you know what those machines are, and if
they expose the reset GPIO through ACPI ?

> > I responded to earlier message that your claims in your comment in this
> > patch are clearly wrong, but what it is surprising me, it's second
> > approach this month people completely ignore existing and new DTS. Other
> > was MT7530 where author also claim all is fine, but actually both old
> > and new DTS were broken. Same here.
> 
> Yes, the comment is oversimplified, which makes it incorrect in
> certain cases. I’ll ensure the comment is accurate in the next version
> if we decide to stick with this solution.

-- 
Regards,

Laurent Pinchart

