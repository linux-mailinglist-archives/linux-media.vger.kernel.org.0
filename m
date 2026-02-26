Return-Path: <linux-media+bounces-53622-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +Ob8MmyroGlGlgQAu9opvQ
	(envelope-from <linux-media+bounces-53622-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 26 Feb 2026 21:22:04 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7399B1AF081
	for <lists+linux-media@lfdr.de>; Thu, 26 Feb 2026 21:22:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5DFAE3001476
	for <lists+linux-media@lfdr.de>; Thu, 26 Feb 2026 20:21:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66BCD46AEE0;
	Thu, 26 Feb 2026 20:21:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="eeYG9FwR"
X-Original-To: linux-media@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DDA94657F2
	for <linux-media@vger.kernel.org>; Thu, 26 Feb 2026 20:21:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772137308; cv=none; b=eZUoBCst2h5L06rG5dFywgJBMDYMz/PpG4iRUWiMsoRhzs+5qTnRtbFkTSMDyKQF05bZzOECjeRrW+vK9NZ1kkhlFO355xGru3ub/kE89jpk6sx86uBeVpubKkk9SUfQ0y0X9AoFSUjcCFxgOPFeJ16ZbPGb8p8gJx+moKBZRK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772137308; c=relaxed/simple;
	bh=1rzXXS9yuR4tlmEDkuB1s97i7zkm4/SxNu7Qk8Q4eKI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hMF0XFvwurPbjV3fTMHUnbrkOffmHuYm/xIaItiXiWlZkA0IYYNgwvLr2h1aDbHOjLnc+3BxEXgut9QU3qP0Xj48HOsfrBRWxPt1B+Uc/tw/AmNQ4pL5QSHQWcckMVsubr6vJ1+BvW9wyNL2Fw/Z8t2pZZelqT9z3j/j7M/KjEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=eeYG9FwR; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=Zbfz
	S89JWVR35E98rC5lcOrcboNxD6VC9rm/fk4PuH4=; b=eeYG9FwRG0mF2I+WxzL1
	HGUVggUjRhJIyqBUgN423pjLFOP3EUNQMylCmEbSZGMmely6B7Su6xr33ZSTAz27
	SHnHjRn+9CBdL1Z5essMXvI9XzDXsz+428ZavPheXWtpy/EERqut52qTJGYgLInj
	1cPeVACjybOFSolGqBL66SBDtoill7iLu9mR53JzlthU1P2siXpr4UvDoiwBZK4P
	D+ZMgeqjfaj43lU0FiQfg2DtV2v1koFsm8uL49Ad9xjswrOn2+549Br4yoMLqJxK
	9GzPFpASEH9OL6r96XiSCy8XkQ0v/gCyT3gjRNbBaPRYGavOshN70z8O6k1xV87h
	TA==
Received: (qmail 1209289 invoked from network); 26 Feb 2026 21:21:36 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 26 Feb 2026 21:21:36 +0100
X-UD-Smtp-Session: l3s3148p1@f2ID3r9LPOkujnuU
Date: Thu, 26 Feb 2026 21:21:35 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Khalil Blaiech <kblaiech@nvidia.com>,
	Asmaa Mnebhi <asmaa@nvidia.com>, Jean Delvare <jdelvare@suse.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org, linux-actions@lists.infradead.org,
	Bartosz Golaszewski <brgl@kernel.org>, linux-media@vger.kernel.org
Subject: Re: [PATCH v2 00/13] i2c: add and start using i2c_adapter-specific
 printk helpers
Message-ID: <aaCrT1SvMCIKQDmc@ninjato>
References: <20260223-i2c-printk-helpers-v2-0-13b2a97762af@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260223-i2c-printk-helpers-v2-0-13b2a97762af@oss.qualcomm.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[sang-engineering.com:s=k1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-53622-lists,linux-media=lfdr.de,renesas];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[sang-engineering.com];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	URIBL_MULTI_FAIL(0.00)[sang-engineering.com:server fail,sto.lore.kernel.org:server fail];
	DKIM_TRACE(0.00)[sang-engineering.com:+];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.995];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wsa@sang-engineering.com,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,sholland.org,nvidia.com,suse.com,linux.ibm.com,ellerman.id.au,suse.de,vger.kernel.org,lists.infradead.org,lists.linux.dev,lists.ozlabs.org];
	TAGGED_RCPT(0.00)[linux-media];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,sang-engineering.com:dkim]
X-Rspamd-Queue-Id: 7399B1AF081
X-Rspamd-Action: no action

On Mon, Feb 23, 2026 at 09:59:29AM +0100, Bartosz Golaszewski wrote:
> It's been another year of discussing the object life-time problems at
> conferences. I2C is one of the offenders and its problems are more
> complex than those of some other subsystems. It seems the revocable[1]
> API may make its way into the kernel this year but even with it in
> place, I2C won't be able to use it as there's currently nothing to
> *revoke*. The struct device is embedded within the i2c_adapter struct
> whose lifetime is tied to the provider device being bound to its driver.
> 
> Fixing this won't be fast and easy but nothing's going to happen if we
> don't start chipping away at it. The ultimate goal in order to be able
> to use an SRCU-based solution (revocable or otherwise) is to convert the
> embedded struct device in struct i2c_adapter into an __rcu pointer that
> can be *revoked*. To that end we need to hide all dereferences of
> adap->dev in drivers.
> 
> This series addresses the usage of adap->dev in device printk() helpers
> (dev_err() et al). It introduces a set of i2c-specific helpers and
> starts using them across bus drivers. For now just 12 patches but I'll
> keep on doing it if these get accepted. Once these get upstream for
> v6.20/7.0, we'll be able to also start converting i2c drivers outside of
> drivers/i2c/.

I applied the series to for-current but squashed the user conversions
into patch 1. Changes are trivial enough and I don't want the pull
request to look excessive, so it can go in smoothly. Hope you are fine
with it.


