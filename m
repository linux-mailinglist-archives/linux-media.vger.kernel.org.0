Return-Path: <linux-media+bounces-65790-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 7RK2Hd6CP2omUAkAu9opvQ
	(envelope-from <linux-media+bounces-65790-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 27 Jun 2026 09:59:26 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E3CCA6D16E8
	for <lists+linux-media@lfdr.de>; Sat, 27 Jun 2026 09:59:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linuxfoundation.org header.s=korg header.b=ySlmQxaM;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65790-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-65790-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linuxfoundation.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0B79A302DA2D
	for <lists+linux-media@lfdr.de>; Sat, 27 Jun 2026 07:58:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00301390C8E;
	Sat, 27 Jun 2026 07:58:39 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 514453093DF;
	Sat, 27 Jun 2026 07:58:36 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782547118; cv=none; b=cHhByM5ccjq/VUx0bSpq8D5yMsSRPAY+Xm6PDR7ZBhiGuJQwPFe0v3fgVcKdDPKsetVEnHCCGyIAUUsHcd0VYlY2rNoaOxiHLI4HZvkhi+IiBs0guJvozZ5Ci+CmTQXtIiqYRmqFQ9xOYHjFt1FfnyLcuO5yAgHGuCc2fMwcxjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782547118; c=relaxed/simple;
	bh=zzld5Ps1lp0aisU7FMGtUh0gURSpE3Zf600yOc+p9Wc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KVs+kGCuUIWvpFJgItYO0NVwt4allGH5AnxSqS1feXyF81Ys6lTiJ3uv2gD6pyb0zPEjn+XZycAy+Ix13XNSkXz+JS6lhuKDLAKBK3XGQsme1MNsYGKK8hhvbR4A9dj5M4bgJg4mArlx1XBqX2Y9x72nckeQtIfCj5xncmcbFWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=ySlmQxaM; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3AE931F000E9;
	Sat, 27 Jun 2026 07:58:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1782547116;
	bh=sC/9NRaMhx8xOE1zpBvZ6+soTA49hwC/fkHgMNk6Cz0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ySlmQxaMkn5EL193hboPUN4jtNlvxZwkmADfBQXLIUEjHFsyVS+pT5bFNyJrvw50u
	 5QkLb8/pU4xtdHt59fwHL1FVrb511qK3iH/XKYPFH2eSRVC1ZAUwo6hkfL5lusNjF1
	 abQ3u0kqBQdh7gDI644vy0JvrwSph9MErRN6IbUo=
Date: Sat, 27 Jun 2026 08:57:22 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Doruk Tan Ozturk <doruk@0sec.ai>
Cc: Hans de Goede <hansg@kernel.org>, Andy Shevchenko <andy@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Dan Carpenter <error27@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] media: atomisp: validate user-supplied buffer
 sizes in two ioctl paths
Message-ID: <2026062709-copy-ensure-cf64@gregkh>
References: <20260627063924.79491-1-doruk@0sec.ai>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260627063924.79491-1-doruk@0sec.ai>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.34 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-65790-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,linux.intel.com,vger.kernel.org,lists.linux.dev];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:doruk@0sec.ai,m:hansg@kernel.org,m:andy@kernel.org,m:mchehab@kernel.org,m:error27@gmail.com,m:sakari.ailus@linux.intel.com,m:linux-media@vger.kernel.org,m:linux-staging@lists.linux.dev,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[gregkh@linuxfoundation.org,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	RCPT_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,linuxfoundation.org:dkim,linuxfoundation.org:from_mime,gregkh:mid,0sec.ai:url,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E3CCA6D16E8

On Sat, Jun 27, 2026 at 08:39:21AM +0200, Doruk Tan Ozturk wrote:
> Two ioctl paths in the Intel AtomISP staging driver share the same
> defect class: one user-controlled field sizes the destination buffer
> while a separate user-controlled field sizes the copy/store, with no
> cross-validation between them. A local caller on an atomisp V4L2 device
> can drive a kernel heap out-of-bounds write with attacker-controlled
> length (and, for both, attacker-controlled contents).
> 
> Patch 1 (framebuffer-to-CSS, FPN / S_FBUF path) bounds arg->fmt.sizeimage
> to the frame allocated from width/height/format before the copy/store.
> 
> Patch 2 (S_DIS_VECTOR DVS 6-axis config) bounds the user-supplied
> width/height dimensions to the stream-grid-sized destination config in
> both the ISP2401 and ISP2400 branches before the first copy.
> 
> Both were found by 0sec's autonomous vulnerability analysis
> (https://0sec.ai) via static analysis; neither is yet runtime-reproduced
> (Intel Baytrail/Cherrytrail ISP hardware required).

Please document this in the assisted-by tag as the documentation
requires.

