Return-Path: <linux-media+bounces-56380-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sGmtATdgvGlxxQIAu9opvQ
	(envelope-from <linux-media+bounces-56380-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 21:44:39 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 61AF12D2563
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 21:44:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CFEAD332C21E
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 20:32:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0372C3FAE09;
	Thu, 19 Mar 2026 20:30:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="mJUhokwM"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D0F83F9F28;
	Thu, 19 Mar 2026 20:30:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773952251; cv=none; b=c2k6x5rCFqablWPkZj2zyydrhE9myRlygr7riSMmZeEi/cIOo8vutJShzMa8Jh4qW6YUQtWNnBqOpbzREqA1FXgH+Dil0i7ND2XhhWyUkeKtiwMC3AKW5mct4k2h5VQpPqtLZnFRPQWpYpJ20IZEBkh0Bb4CxTEoV3ZaSc5vqDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773952251; c=relaxed/simple;
	bh=CwOHjqLaBd1GHVGFh3ATyrdGJNjMu0nr+guji5Fv/jM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RZ2+w/onuEmCNzj3HkoUyVaCqmPNzSxtnkx3NUAFQG8mmdrMHGaFkKp0UX0hS3xmxodVJT2EoOBY1fL880RJ3Ab7GCPkykDKZ7AcRTxgQMjmNcRhdjW1tMtEU9PPBPupzI1tAO3uIv/eY94LDP/j7mEjb/SbnwSl/baYWQ+tyno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=mJUhokwM; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id EACAD9A6;
	Thu, 19 Mar 2026 21:29:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1773952166;
	bh=CwOHjqLaBd1GHVGFh3ATyrdGJNjMu0nr+guji5Fv/jM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mJUhokwM7Jq0MfAf6VQu2nV/gGt/hjn2NFl8n2KEsp+N7ifZ3hQ20RQYnY4Uv5Mxx
	 ak4DU4yD6v0AYTEGpZ5b9Pa8Rd2pAzu3YG5WbgheUR+pT+w/tGh6R6uqm/xgcvWAEC
	 7QPJHCt9Wz2lhtAD99p2Fm5+L4CToJ7Pya1Pu6zg=
Date: Thu, 19 Mar 2026 22:30:37 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: "luo.liu.linux" <luo.liu.linux@163.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, mchehab@kernel.org,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: Re: Re: Re: Re: [PATCH] media:v4l2-async:debugfs for registered
 subdevices
Message-ID: <20260319203037.GF860715@killaraus.ideasonboard.com>
References: <20260313075824.2818713-1-luo.liu.linux@163.com>
 <abPm3VGGRAIsY1eQ@kekkonen.localdomain>
 <5e63e8aa.943f.19ce6ee4ad5.Coremail.luo.liu.linux@163.com>
 <abP4Mr_s8JRpQH0B@kekkonen.localdomain>
 <384d2274.9b3e.19ce776ec2c.Coremail.luo.liu.linux@163.com>
 <abg0R5zerwCM_1mK@kekkonen.localdomain>
 <186862ed.3836.19cf9df139c.Coremail.luo.liu.linux@163.com>
 <abkPC3sHVUdGuww1@kekkonen.localdomain>
 <4155da3e.9361.19cfb815615.Coremail.luo.liu.linux@163.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4155da3e.9361.19cfb815615.Coremail.luo.liu.linux@163.com>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[163.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56380-lists,linux-media=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.996];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,killaraus.ideasonboard.com:mid]
X-Rspamd-Queue-Id: 61AF12D2563
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 17, 2026 at 07:14:43PM +0800, luo.liu.linux wrote:
> 
> Hi Sakari,
> 
> The existing pending_async_subdevices interface provides excellent
> visibility into the notifier_list (the 'waiter' side).
>
> To achieve full symmetry and complete debuggability, we should also
> expose the subdev_list (the 'provider' side).These two views solve
> different problems:
> 
> 1 Notifier List: Diagnoses why binding is stalled (missing sub-devices).
> 
> 2 Subdev List: Diagnoses state inconsistencies (e.g., sub-devices
> present but unmatched) and verifies resource cleanup upon unbind.
> 
> From practical experience, lacking visibility into subdev_list makes
> it difficult to distinguish between a sub-device probe failure and an
> async matching failure. 
>
> Adding this interface would provide a holistic view of the async
> engine's state, which has proven essential for rapid issue
> localization in complex driver stacks.

I agree with Sakari here. There are plenty of other debugging tools in
the kernel that can be used to diagnose the kind of issues you've
described. I think this patch adds more noise than value.

> At 2026-03-17 16:21:31, Sakari Ailus wrote:
> > On Tue, Mar 17, 2026 at 11:37:52AM +0800, luo.liu.linux wrote:
> >> 
> >> Hi Sakari,
> >> 
> >> 	You are absolutely right. For an experienced kernel developer like
> >>  yourself, tools like KASAN and CONFIG_DEBUG_LIST are second nature and
> >>  incredibly effective for pinpointing such issues. I truly admire your
> >>  expertise in leveraging these advanced debugging mechanisms.
> >> 
> >> 	However, I think it is important to consider the reality for many
> >> junior driver developers (myself included). We often lack the deep
> >> intuition and extensive experience required to wield these powerful tools
> >> effectively in every scenario. More often than not, we still rely on
> >> primitive methods: struggling to reproduce intermittent crashes,
> >> scattering printk logs everywhere, and manually tracing execution paths.
> >> This process is extremely time-consuming and often yields no clear
> >> conclusions for "silent" resource leaks.
> >> 
> >> 	While I am actively working to improve my skills and learn to use
> >> these advanced tools more proficiently. I remain convinced that providing
> >> such a simple, intuitive interface offers a necessary supplement by
> >> serving as a low-barrier entry point for developers.
> >> 
> >> 	I hope this perspective clarifies why I believe this small change
> >> can bring a bit of convenience to a broader range of driver developers.
> >
> > Just enable KASAN and list debugging in the future. New interfaces like
> > this won't improve things at large.

-- 
Regards,

Laurent Pinchart

