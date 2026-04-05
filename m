Return-Path: <linux-media+bounces-58076-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +IHQD2vK0mnuawcAu9opvQ
	(envelope-from <linux-media+bounces-58076-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 05 Apr 2026 22:47:39 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F260039FC5D
	for <lists+linux-media@lfdr.de>; Sun, 05 Apr 2026 22:47:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0BF063005E95
	for <lists+linux-media@lfdr.de>; Sun,  5 Apr 2026 20:47:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5802B382F0D;
	Sun,  5 Apr 2026 20:47:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="FcvcOHKh"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98645625;
	Sun,  5 Apr 2026 20:47:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775422046; cv=none; b=CmGP1EXGYw7RzQsDDD5k3LJ5NSscr8Cl4lnkt/8/5TTr8uV9uq4qGF/yfoJHkfSdTnjuH06cLEktuFlmnbBka+D+0yQrhiNGez2XMIFcic2OdNs8YeYLH2ox/curetv6rszY1Y18y95VFkg23h9nJ6wKXEUmjp7ItHtb1FaWBBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775422046; c=relaxed/simple;
	bh=/N/xEyKEbWFTMdM+GtrKN2VGWe9gF9Y7Lyq2psveIIY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IVjfhREnVEigRy8I3h53Qy1RxoQVz6AsnS68Yi5cR0jn6Y5K7HqgieiOuI/WmbwnrvLqH8JONTFuLBY8Iv+Xkr17RX9+cBtLtOM2DvcvtWzE1cPzU14Bf2B7vK4q2yl+afalPObiiBtR5kkpWB2IzJymo5E2YWQvC81GFXDCgpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=FcvcOHKh; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 9D4A16AF;
	Sun,  5 Apr 2026 22:45:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1775421957;
	bh=/N/xEyKEbWFTMdM+GtrKN2VGWe9gF9Y7Lyq2psveIIY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FcvcOHKhzjQmFLlHPH1txXk4jcBmzPLeyt6rCkcKhBZjIj6dYCFJFgQVaVMHvxs/o
	 n8GITnItT++Jw1QFbnoO8Dsrbs49fLnf4vQ0klB0muVcEBNbJ606KHW1QtmZCOCJD4
	 Mz3IepgCjEdEnEOL3h7EtQMeNEoCVb9mLonuTxME=
Date: Sun, 5 Apr 2026 23:47:22 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Bryan O'Donoghue <bod@kernel.org>
Cc: Loic Poulain <loic.poulain@oss.qualcomm.com>,
	vladimir.zapolskiy@linaro.org, kieran.bingham@ideasonboard.com,
	robh@kernel.org, krzk+dt@kernel.org, andersson@kernel.org,
	konradybcio@kernel.org, linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, johannes.goede@oss.qualcomm.com,
	mchehab@kernel.org
Subject: Re: [RFC PATCH 0/3] media: qcom: camss: CAMSS Offline Processing
 Engine support
Message-ID: <20260405204722.GF1213462@killaraus.ideasonboard.com>
References: <xy6TKmdveRx4cMshSHEUGZ7s3lbsurWcsc2vq05A7_N4bCialR7EelZitouugtZDkpFCAghjqY4NDdSQEIPprw==@protonmail.internalid>
 <20260323125824.211615-1-loic.poulain@oss.qualcomm.com>
 <055a7281-3e41-4e26-a8c8-5e28d69c0685@kernel.org>
 <CAFEp6-2NniQquVrw_V8P_cyUayMMY0SPC8hgczjB3ef5zx7e5A@mail.gmail.com>
 <j1jExQP2GCnHhjXkyuhDn_d0CP50oZDMyso3CFfkygb7Ww_9Z3L93P8Px0KjTQAqU5jzr2I41V1_2ZdQOQqfxA==@protonmail.internalid>
 <20260405194851.GA3972481@killaraus.ideasonboard.com>
 <d5bb1f75-f55f-43e6-8160-bacc4088b0a2@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <d5bb1f75-f55f-43e6-8160-bacc4088b0a2@kernel.org>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-58076-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: F260039FC5D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sun, Apr 05, 2026 at 08:55:00PM +0100, Bryan O'Donoghue wrote:
> On 05/04/2026 20:48, Laurent Pinchart wrote:
> > I don't necessarily agree with that. There are pros and cons for using
> > HFI on platforms that have an ICP. If correctly written, a firmware can
> > improve the throughput in multi-camera use cases by reprogramming the
> > time-multiplexed OPE faster. On the other hand, in use cases that don't
> > require pushing the platform to its limits, dealing with a closed-source
> > firmware often causes lots of issues.
> > 
> > We should aim at supporting both direct ISP access and HFI with the same
> > userspace API, even on a single platform. Which option to start with is
> > an open question that we should discuss.
> 
> I think - for IPE and BPS ICP/HFI is the way to go.
> 
> However thinking about it - inline pixel processing IPP inside of the 
> IFE is superior to BPS/IPE for virtually every scenario i.e. why deliver 
> a frame to user-space and then submit it directly to BPS via CDM or via 
> a firmware interface HFI, if you can do the same processing in the IFE - 
> which on the majority of qcom platforms, you can.

As always, it depends. Offline processing consumes more memory bandwidth
and introduces latency, *but* if the statistics are computed by the IFE,
then the OPE can process frames using statistics coming from the same
frame instead of previous frames. It can improve the reactivity of the
algorithms.

Some processing is also badly suited for inline pipelines. In
particular, DOL HDR stitching in an inline pipeline requires a large
amoung of line buffers, so many ISP vendors implement it in offline ISPs
only. Temporal denoising can also be more tricky in an inline ISP.

Processing is sometimes split between the inline and offline parts, with
inline processing in Bayer domain, covering processing algorithms that
don't benefit much from using stats from the same frame, and offline
processing taking over for the rest.

> Agatti is an outlier in that sense.
> 
> So actually I've shifted my focus on Hamoa to IFE/IPP.

I'd love to get stats out of the IFE :-)

> You still BTW do want HFI for BPS/IPE - but to get 3a going on the vast 
> majority of qcom platforms - you want the PIX/IPP path in the IFE.
> 
> OTOH if you want to do offline bayer processing - taking say a saved 
> file from the filesystem - then BPS/IPE is the way to do it and IMO HFI 
> is the way to do that.
> 
> But ICP/BPS/IPE is a nice to have.

We need a glossary :-)

> I realise that's a word-soup of TLAs but yeah, TL;DR IFE/IPP is the way 
> to go on !Agatti and once we get a nice 3a loop going there a fun 
> side-project would be offline bayer processing via HFI.

-- 
Regards,

Laurent Pinchart

