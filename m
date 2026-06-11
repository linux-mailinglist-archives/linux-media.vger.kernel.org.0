Return-Path: <linux-media+bounces-64545-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id PwTwMkhlKmrKogMAu9opvQ
	(envelope-from <linux-media+bounces-64545-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 11 Jun 2026 09:35:36 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BFF066F6B3
	for <lists+linux-media@lfdr.de>; Thu, 11 Jun 2026 09:35:36 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b="Z01QBw/h";
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64545-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64545-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 232FE3030985
	for <lists+linux-media@lfdr.de>; Thu, 11 Jun 2026 07:35:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61EF6367F54;
	Thu, 11 Jun 2026 07:35:23 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E38423630B7;
	Thu, 11 Jun 2026 07:35:19 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781163322; cv=none; b=ZpKevQ3/R53C35X1Weuc5q0K0AtYwQIZo8tZ2ISBHywRgZ62lp+EdwB1DX/VLXqi4lr7l+ieX9GCioBEQsmJ4/fYG7ez+TsBihJJ555MPqhO6+CFEsRLZVG/ML9SzOg/HPgW19j0BE7OQTAV/2INj+nssX9Hf7mnvuNobPxODMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781163322; c=relaxed/simple;
	bh=TzgMTwGX2whiLtuSSGLT29Et1A+aIa1g13YstftP9Vo=;
	h=Message-ID:Date:From:To:Subject:In-Reply-To:References:Cc; b=ARJAnu3oVK3GgybxRPYKvIhU7M7wAkmZ6zFMSpf9oTmapfJ439ScoIqL0mr69YxoAyUM4e+GHvf9W3QV00U1QguDQ+ACEjBZP10aTw4MO77gNkvHcf7IZoZGVwDof0KndUkwONnpwVZdUJ9hYfO9OkPsJ4XUhS8AHpx6cn9rcdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z01QBw/h; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E3651F00893;
	Thu, 11 Jun 2026 07:35:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781163319;
	bh=mo/64/HPY/6XXdxYXG0j1Rf2IH961OLjSb7/zYXIAp0=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc;
	b=Z01QBw/hVD0yzmyR9h/PeeyZ0iRCgAk+/aPcn16UqS3zZfuWeP7a6qWfdqmwQ64c7
	 SUPKR2ROzkbXWRdLbWoisYB51wZF40L8vvw0MozUehUzOXbcsSsnQ0fbgMJJmCHGkW
	 z+TuJ9RV3obUIo8CPP/tRZUPc5Hs7F5upTIG6t0fkoVPZxquwXwNgAinfjXUhvkvqU
	 6YeQ2LjisVMoDUHycAma+Lu74RYAWxQFblvBsWwIvRFb7/kKDiutnbSyvdf+3vpuqS
	 Dp2GHlTRm5vmXa5cb7jZrXcCPOVrqwZElTLvCkH94I9VrnrjiQ9+mME23BBp+rSEGk
	 5s8EcKr+hihgQ==
Message-ID: <c52f5bc48973b580c8df41764acb73e4@kernel.org>
Date: Thu, 11 Jun 2026 07:35:17 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Sumit Semwal" <sumit.semwal@linaro.org>
Subject: Re: [PATCH] dma-buf: move system_cc_shared heap under separate
 Kconfig
In-Reply-To: <20260610142329.3836808-1-sumit.semwal@linaro.org>
References: <20260610142329.3836808-1-sumit.semwal@linaro.org>
Cc: Brian.Starkey@arm.com, afd@ti.com, agordeev@linux.ibm.com, arnd@linaro.org, benjamin.gaignard@collabora.com, chleroy@kernel.org, christian.koenig@amd.com, djbw@kernel.org, dri-devel@lists.freedesktop.org, gerald.schaefer@linux.ibm.com, hch@infradead.org, jgg@ziepe.ca, jiri@resnulli.us, jstultz@google.com, linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, linux-s390@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, lkp@intel.com, maddy@linux.ibm.com, mpe@ellerman.id.au, mripard@kernel.org, npiggin@gmail.com, sumit.semwal@linaro.org, thomas.lendacky@amd.com, tjmercier@google.com, x86@kernel.org, "Arnd
 Bergmann" <arnd@arndb.de>, "Maxime Ripard" <mripard@kernel.org>
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	MISSING_MIME_VERSION(2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-64545-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[mripard@kernel.org,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[arm.com,ti.com,linux.ibm.com,linaro.org,collabora.com,kernel.org,amd.com,lists.freedesktop.org,infradead.org,ziepe.ca,resnulli.us,google.com,lists.linaro.org,vger.kernel.org,lists.ozlabs.org,intel.com,ellerman.id.au,gmail.com,arndb.de];
	RCPT_COUNT_TWELVE(0.00)[31];
	FORGED_RECIPIENTS(0.00)[m:sumit.semwal@linaro.org,m:Brian.Starkey@arm.com,m:afd@ti.com,m:agordeev@linux.ibm.com,m:arnd@linaro.org,m:benjamin.gaignard@collabora.com,m:chleroy@kernel.org,m:christian.koenig@amd.com,m:djbw@kernel.org,m:dri-devel@lists.freedesktop.org,m:gerald.schaefer@linux.ibm.com,m:hch@infradead.org,m:jgg@ziepe.ca,m:jiri@resnulli.us,m:jstultz@google.com,m:linaro-mm-sig@lists.linaro.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-s390@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:lkp@intel.com,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:mripard@kernel.org,m:npiggin@gmail.com,m:thomas.lendacky@amd.com,m:tjmercier@google.com,m:x86@kernel.org,m:arnd@arndb.de,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mripard@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,arndb.de:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3BFF066F6B3

On Wed, 10 Jun 2026 19:53:29 +0530, Sumit Semwal wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> While system heap and system_cc_shared heap share a lot of code
> and hence the same source file, their users have different needs.
> 
> 
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

