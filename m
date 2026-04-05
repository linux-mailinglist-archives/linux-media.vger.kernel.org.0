Return-Path: <linux-media+bounces-58067-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yGQtBdS80mnGaAcAu9opvQ
	(envelope-from <linux-media+bounces-58067-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 05 Apr 2026 21:49:40 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 89B7139F9C1
	for <lists+linux-media@lfdr.de>; Sun, 05 Apr 2026 21:49:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A12AE3016CB6
	for <lists+linux-media@lfdr.de>; Sun,  5 Apr 2026 19:49:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4BA4381B11;
	Sun,  5 Apr 2026 19:49:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="RChzoVVb"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 279BE2DC78C;
	Sun,  5 Apr 2026 19:48:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775418543; cv=none; b=Njx7Ko0ocMHqMmfaG3j0koewKlTXuZJqyiyk603B5sWRUyy/vSZf0+Oq83X8QKb5TLsnpL1xXrL0/Db0q1kQ1F2mY41bJTfxSKoVo3X3pODBitM9aDfRJ0iv/yFbkT1J/qbPDLQyvO7iTdd73j7Md+MuwMjN5zi6H4S3bMX08Bc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775418543; c=relaxed/simple;
	bh=eFwLATyP+HZAuzJmFA+1HPdM8F0qKUtvcK5HjyXRQ24=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N1NW/mDuDiT6r7Xs9V1GZwNeXItbd8C9OSBBPT6MyfUHEGm4l7ChYQOZbbO61ZHSx8a0+JW3Ihmr4Bea8SzNopNRlrOZ5mWtBD4XsxrO68l/qr603+td1Fu1ZhVcuBWX7C/EIJTBzQNwJ0wrIUFGsfJADZMaTcdKf9qeBnqHgVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=RChzoVVb; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 39BFA6AF;
	Sun,  5 Apr 2026 21:47:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1775418446;
	bh=eFwLATyP+HZAuzJmFA+1HPdM8F0qKUtvcK5HjyXRQ24=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RChzoVVb9KC9PDYDr0RQ4Hc8YIYTfs6QbbRUyfCbMoRLyRF66w5eGkLJD5rxG/vQS
	 XDric6FPsF7fTw6Q9dEUORZaJ511giavnMZVUvaAVJuVi2HezLSicW8FZStMotiu4G
	 dHmqp8gNseK6yLRPqMS2aHV3RdavlfSZsBjBGVFk=
Date: Sun, 5 Apr 2026 22:48:51 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>, vladimir.zapolskiy@linaro.org,
	kieran.bingham@ideasonboard.com, robh@kernel.org,
	krzk+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
	linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	johannes.goede@oss.qualcomm.com, mchehab@kernel.org
Subject: Re: [RFC PATCH 0/3] media: qcom: camss: CAMSS Offline Processing
 Engine support
Message-ID: <20260405194851.GA3972481@killaraus.ideasonboard.com>
References: <xy6TKmdveRx4cMshSHEUGZ7s3lbsurWcsc2vq05A7_N4bCialR7EelZitouugtZDkpFCAghjqY4NDdSQEIPprw==@protonmail.internalid>
 <20260323125824.211615-1-loic.poulain@oss.qualcomm.com>
 <055a7281-3e41-4e26-a8c8-5e28d69c0685@kernel.org>
 <CAFEp6-2NniQquVrw_V8P_cyUayMMY0SPC8hgczjB3ef5zx7e5A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFEp6-2NniQquVrw_V8P_cyUayMMY0SPC8hgczjB3ef5zx7e5A@mail.gmail.com>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-58067-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,killaraus.ideasonboard.com:mid]
X-Rspamd-Queue-Id: 89B7139F9C1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 24, 2026 at 05:16:21PM +0100, Loic Poulain wrote:
> On Tue, Mar 24, 2026 at 1:54 PM Bryan O'Donoghue wrote:
> > On 23/03/2026 12:58, Loic Poulain wrote:
> > > This first version is intentionally minimalistic. It provides a working
> > > configuration using a fixed set of static processing parameters, mainly
> > > to achieve correct and good-quality debayering.
> >
> > You need the other 50% of the kernel side - the generation of bayer
> > statistics in the IFE, as well as generation of parameters to feed back
> > into the OPE - which requires a user-space implementation too, so a lot
> > of work there too.
> >
> > I'd also say when we have an ICP we should be using it via the HFI
> > protocol, thus burying all of the IPE/OPE BPS and CDM complexity in the
> > firmware.
> >
> > Understood Agatti has no ICP so you're limited to direct OPE/IFE
> > register access here. For HFI capable platforms - the majority - HFI is
> > the way to go.
> 
> Fully agree, this is exactly the point where we should sync and work
> together on a proper solution.

I don't necessarily agree with that. There are pros and cons for using
HFI on platforms that have an ICP. If correctly written, a firmware can
improve the throughput in multi-camera use cases by reprogramming the
time-multiplexed OPE faster. On the other hand, in use cases that don't
require pushing the platform to its limits, dealing with a closed-source
firmware often causes lots of issues.

We should aim at supporting both direct ISP access and HFI with the same
userspace API, even on a single platform. Which option to start with is
an open question that we should discuss.

> As a follow‑up to this RFC, I already have several ongoing pieces that
> aim to generalize the CAMSS ISP support, and I’d very much like to
> discuss them with you:
> 
> - camss-isp-m2m: Generic M2M scheduling framework handling job dispatch
> based on buffer readiness and enabled endpoints (frame input, output,
> statistics, parameters).

This should be generic, not limited to camss. v4l2-isp is a good
candidate.

> - camss-isp-pipeline: Helper layer to construct complex media/ISP graphs
> from a structural description (endpoints, links, etc.).

That also doesn't seem specific to camss.

> - camss-isp-params: Generic helper for handling ISP parameter buffers
> (using v4l2-isp-params).

I'm curious to know what camss-specific helpers you envision there.

> - camss-isp-stats: Generic helper framework for CAMSS statistics devices.

Same.

> - camss-(isp-)ope: OPE‑specific logic only (register configuration, IRQ
> handling, parameter‑to‑register translation).
> 
> This approach should significantly reduce the amount of
> platform‑specific code required for future ISP blocks. It should also
> allow you to integrate a camss-isp-hamoa (or similar) backend, or even
> a camss-isp-hfi implementation for the M2M functions, without
> duplicating the infrastructure.
> 
> So yes, let’s sync and agree on a shared/open development model and an
> overall direction, possibly even a common tree, to ensure we stay
> aligned and can collaborate effectively.

Let's schedule a call to kickstart those discussions. Many people are on
Easter vacation this week, next week could be a good candidate.

> > I'll publish an RFC for Hamoa for that soonish so we can make sure both
> > coexist.
> 
> Ack.

-- 
Regards,

Laurent Pinchart

