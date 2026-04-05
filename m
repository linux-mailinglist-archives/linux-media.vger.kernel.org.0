Return-Path: <linux-media+bounces-58073-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QIeuKsfE0mn1agcAu9opvQ
	(envelope-from <linux-media+bounces-58073-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 05 Apr 2026 22:23:35 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DFAA39FBD7
	for <lists+linux-media@lfdr.de>; Sun, 05 Apr 2026 22:23:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3C3553009560
	for <lists+linux-media@lfdr.de>; Sun,  5 Apr 2026 20:23:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99C8C3822A7;
	Sun,  5 Apr 2026 20:23:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="AEZU3P8N"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5AB33822A2;
	Sun,  5 Apr 2026 20:23:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775420605; cv=none; b=GGuZz3CXPCXlS/rAqWZGIf90Yvi1BECZjwvAhygJ66AoP+fn0udy5aaHOzd9r6Kr4+AbjOEwseUIel7xceKlLo0ei+BRZCNfy4MxiUEQJgtPwLLqBSV0NeaMNjW/Tbf2HFtcUka0Oee7d8zZozAU4PYvqUpzbXtmlCSt4ATMsHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775420605; c=relaxed/simple;
	bh=cqBHW+U/hqFIYxRzPM9pf8MhMONPdAhwhfGSpDUXX54=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xp34fVt+tGeKvlhJr4A8Y+TFpL6h/HoFMjkjUzQPCqC4edOAoN3iM2Ks/JEheK3WoANG0l6NsUfFso2/I4duCdIQTPjMmmvOa3QWSm7t0+jgDl0lBUE+xnDTBhfOBhRGdpQJTAv5XBWPKbl4eGJOqCuQ15QEx5iJkn9priECHy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=AEZU3P8N; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 639A96AF;
	Sun,  5 Apr 2026 22:21:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1775420515;
	bh=cqBHW+U/hqFIYxRzPM9pf8MhMONPdAhwhfGSpDUXX54=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AEZU3P8NMmXmUiCy215QCzuoWGYU0F5mOKT0p4wE0e4atYKGBaeYprbfYsdZYcdzw
	 8Tq3kJGqAMerB490NYjvEz1HxHeeFtrphN7HTd1pCqm0e8x6iTOEVQYQte2bnbmb9w
	 aVqBXVddzN02r48h5YDf69mMUjWq/p07ieyn8yjM=
Date: Sun, 5 Apr 2026 23:23:20 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>, johannes.goede@oss.qualcomm.com,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	vladimir.zapolskiy@linaro.org, kieran.bingham@ideasonboard.com,
	robh@kernel.org, krzk+dt@kernel.org, andersson@kernel.org,
	konradybcio@kernel.org, linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, mchehab@kernel.org
Subject: Re: [RFC PATCH 2/3] media: qcom: camss: Add CAMSS Offline Processing
 Engine driver
Message-ID: <20260405202320.GD1213462@killaraus.ideasonboard.com>
References: <rj2vb725he4yzfvjifzyxqpbqk5oztfaafp7sg2qes4qz3mlaz@z5dyoqod56d7>
 <7fc31426-3157-49c7-a30d-dcd7b181fcc6@oss.qualcomm.com>
 <qq43xl3lsv2nq4ngn2hojleddxjmkgwclb2ajek5gvdtgyjltl@3tqg5ydhsxia>
 <8DTHyPLaUjGKd83PvBsisjn_SnpUnvkateTtwz9P6CChP9VGfDyQmJa4Rfd5KwOBOLhtGFJPDzfHrXC4zvV-Fg==@protonmail.internalid>
 <0330f63f-7137-4484-954a-fc0776a9b052@oss.qualcomm.com>
 <0879e4c1-5381-4a70-9fb3-4af9b3bf6e48@kernel.org>
 <0RTUgDf1wbD0phPk8qAcojZovgMA_68R84FRaL_BHfjzupSA6c_8S5ogVerViYPFNJtvup9sOvL_uPx2t6-KCg==@protonmail.internalid>
 <2e4c4641-f631-48fa-b5dd-6efd70110dd6@oss.qualcomm.com>
 <e2a4e9dd-6a45-48dc-8757-244e201dd4d6@kernel.org>
 <CAFEp6-2EjvEogSdVNCEY-XwgYe7Bg_2d1me2EWhzDp8Cr=ZeLg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFEp6-2EjvEogSdVNCEY-XwgYe7Bg_2d1me2EWhzDp8Cr=ZeLg@mail.gmail.com>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-58073-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 5DFAA39FBD7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 30, 2026 at 09:07:59PM +0200, Loic Poulain wrote:
> On Mon, Mar 30, 2026 at 4:33 PM Bryan O'Donoghue wrote:
> > On 30/03/2026 15:27, johannes.goede@oss.qualcomm.com wrote:
> > >> That's another reason I bring up CDM again and again. We probably
> > >> don't want to fix to the wrong format for OPE, introduce the CDM
> > >> and then find we have to map from one format to another for large
> > >> and complex data over and over again for each frame or every N
> > >> frames.
> > > 
> > > CDM is a much lower-level API then what is expected from
> > > a media-controller centric V4L2 driver. Basically the OPE
> > > driver will export:
> >
> > My concern is about wrappering one thing inside of another thing and
> > then stuffing it again back into CDM and doing the same on the way out.
> 
> I think there will always be some level of copying involved. That
> said, we can pre‑build the CDM sequence in the drivers and only update
> the variable values, which should avoid significant overhead.
> 
> If we start handling CDM formats directly on the user side, it would
> require exposing a lot of low‑level knowledge there (such as register
> layouts and offsets), and that would diverge from how other ISP
> implementations are structured. I’m concerned this would increase
> complexity and reduce portability.

Agreed, I don't think we should go in that direction. Translating the
parameters buffer to the format expecting by the CDM can be done in the
kernel in userspace context, and work in the IRQ handler will then
become minimal. As far as I understand the CDM expects a buffer that
contains register address and value pairs. This is exactly what the
R-Car V4H does, the rppx1 driver translates the parameters buffer to the
same register addresses and values format, and then passes it to the
VSP (which has the same role as the CDM here).

As mentioned in a separate e-mail, we also support programming the ISP
through MMIO. This creates more work in IRQ context, but is very useful
during development. Switching to MMIO just requires a different code
path in the IRQ handler that iterates over the registers
addresses/values in the VSP buffer, and writes to registers directly.
The architecture is very modular.

> > There are already 50 MMIO writes in the OPE ISR, I don't believe it is
> > sustainable to keep adding MMIO into that.
> 
> Yes, I understand the concern. From our testing so far, however, this
> has not shown to be an issue. In addition, a full reconfiguration
> would only happen in specific cases, such as on explicit full
> configuration changes or during context switching. We can certainly
> look at implementing CDM, but at this stage it didn't seem to bring
> significant benefits, so I prefered to focus on other functional
> aspects, and revisit CDM once there is a clearer need, measurable
> gain, or if it becomes part of the uAPI as discussed here.

I agree. Let's design the driver with CDM in mind to have the right
abstraction layers, and work on CDM support in a second step. If someone
believes this should be done urgently, they can even help by working in
parallel with ISP features enablement.

> > I'm aware of a project in qcom that did something with making the CDM
> > format in libcamera and handed that off to kernel, recommend looking
> > into that.
> 
> I will, thanks, I'm however, concerned about how acceptable this
> approach would be to the wider community and to the maintainers.

-- 
Regards,

Laurent Pinchart

