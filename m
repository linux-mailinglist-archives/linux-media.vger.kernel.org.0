Return-Path: <linux-media+bounces-58071-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kNrtM8HC0mldagcAu9opvQ
	(envelope-from <linux-media+bounces-58071-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 05 Apr 2026 22:14:57 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EA7E39FB83
	for <lists+linux-media@lfdr.de>; Sun, 05 Apr 2026 22:14:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 791A0300D950
	for <lists+linux-media@lfdr.de>; Sun,  5 Apr 2026 20:14:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9275C3822AC;
	Sun,  5 Apr 2026 20:14:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="SlZcAMsh"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE5D3145FE0;
	Sun,  5 Apr 2026 20:14:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775420084; cv=none; b=eoEXueb8y8pYLK/xIEbY6B5vpN5hRcBtT5fO5xkjW2Vph/gun9k5BcfOALhUBZlpQZBdq7OXW2SlvJ9wQ5xzEHOuadYp8Y5cCSMTTjDxf3y8KP7Tovo7yAXraOSht51EK/+/20CaBIApFqhDNh2q8yoT3ITxzpWkw7jtqQkx9N4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775420084; c=relaxed/simple;
	bh=b+kYfFusrvnvd/tWkcfi4fGgeWnGzPTiLK2UY6hE0TY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pze7mhcGMpjYG+AL03fZaOANz7Jv78+7YNpoGaXQg4+Awf+g0OGpYrt/GYwOfRORbk00syg7A7ZOHU/pf4nQrl7pWA/ykoIb2zjOaxtA8/TJ4pmAG7XZXKqsJ47kpfNNgnHi6OL5aIcrf4eHPMLlRPL1KzqehsgSkL+n/lWNEAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=SlZcAMsh; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 6493A6AF;
	Sun,  5 Apr 2026 22:13:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1775419994;
	bh=b+kYfFusrvnvd/tWkcfi4fGgeWnGzPTiLK2UY6hE0TY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SlZcAMsheDamWDUNSvO7ieEaL6TSXo+afjIKNcczS76M9bZpxZm4UzhxJonxpeY4x
	 U5JRaGWo6mARM37aJ6PLnvMRQy0HKdN2viUUdbK2gWcEecGEonexz7OqV3lpJ8IIMO
	 CTjz8xKpFZQ/TtBsC7jrgDXgpgYUH14Y103HzuE4=
Date: Sun, 5 Apr 2026 23:14:39 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>, johannes.goede@oss.qualcomm.com,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	vladimir.zapolskiy@linaro.org, kieran.bingham@ideasonboard.com,
	robh@kernel.org, krzk+dt@kernel.org, andersson@kernel.org,
	konradybcio@kernel.org, linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, mchehab@kernel.org
Subject: Re: [RFC PATCH 2/3] media: qcom: camss: Add CAMSS Offline Processing
 Engine driver
Message-ID: <20260405201439.GC1213462@killaraus.ideasonboard.com>
References: <X-Lw_zi1o015-V1Cv4dY_ik6SfTB8TTcLmn1l-Ta7UviYTJ6gwMBn4B4ulYwjd_Aetul5xUt0T6ln9E-Hl5h4g==@protonmail.internalid>
 <CAFEp6-3ziXJTYADOFj--rZL5TumroXuW+=SnUQ9XakRxHT-ypg@mail.gmail.com>
 <12194cc0-0960-486c-be7e-1a22d95de340@kernel.org>
 <rj2vb725he4yzfvjifzyxqpbqk5oztfaafp7sg2qes4qz3mlaz@z5dyoqod56d7>
 <7fc31426-3157-49c7-a30d-dcd7b181fcc6@oss.qualcomm.com>
 <qq43xl3lsv2nq4ngn2hojleddxjmkgwclb2ajek5gvdtgyjltl@3tqg5ydhsxia>
 <8DTHyPLaUjGKd83PvBsisjn_SnpUnvkateTtwz9P6CChP9VGfDyQmJa4Rfd5KwOBOLhtGFJPDzfHrXC4zvV-Fg==@protonmail.internalid>
 <0330f63f-7137-4484-954a-fc0776a9b052@oss.qualcomm.com>
 <0879e4c1-5381-4a70-9fb3-4af9b3bf6e48@kernel.org>
 <4hasliun3wkook2pvfkntjlzs7elu67ine5q7nd7ptjthx5qvw@rntvb7lnajpc>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <4hasliun3wkook2pvfkntjlzs7elu67ine5q7nd7ptjthx5qvw@rntvb7lnajpc>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-58071-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:dkim,killaraus.ideasonboard.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: 2EA7E39FB83
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 30, 2026 at 09:55:23PM +0300, Dmitry Baryshkov wrote:
> On Mon, Mar 30, 2026 at 03:11:58PM +0100, Bryan O'Donoghue wrote:
> > On 30/03/2026 14:46, johannes.goede@oss.qualcomm.com wrote:
> > > > > And then your CCMv1 or CCMv2 helper will get called with
> > > > > the matching parameter-data.
> > > >
> > > > This leads to userspace having to know exact format for each hardware
> > > > version, which is not nice. At the very least it should be possible to
> > > > accept CCMv1 buffers and covert them to CCMv2 when required.
> > >
> > > Yes, but a new ISP may also have a different pipeline altogether
> > > with e.g. more then one preview/viewfinder output vs one viewfinder
> > > output for current hw, etc.
> > 
> > My scoping on HFI shows that the IQ structures between Kona and later
> > versions have pretty stable data-structures.
> > 
> > It might be worthwhile for the non-HFI version to implement those
> > structures.
> > 
> > I keep mentioning CDM. Its also possible to construct the buffer in the
> > format the CDM would require and hand that from user-space into the kernel.
> > 
> > That would save alot of overhead translating from one format to another.
> > 
> > That's another reason I bring up CDM again and again. We probably don't want
> > to fix to the wrong format for OPE, introduce the CDM and then find we have
> > to map from one format to another for large and complex data over and over
> > again for each frame or every N frames.
> > 
> > TBH I think the CDM should happen for this system and in that vein is there
> > any reason not to pack the data in the order the CDM will want ?
> 
> This sounds like the most horrible idea: letting userspace directly
> program any registers in a way that is not visible to the kernel.

ISP hardware is typically not designed to make this safe, so I would be
really, really careful about going in that direction. It also seems a
dangerous idea to me.

> > So probably in fact IQ structs are not the right thing for OPE+IFE.

-- 
Regards,

Laurent Pinchart

