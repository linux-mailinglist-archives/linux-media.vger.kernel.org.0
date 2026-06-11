Return-Path: <linux-media+bounces-64572-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id umMOIEGMKmq1sAMAu9opvQ
	(envelope-from <linux-media+bounces-64572-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 11 Jun 2026 12:21:53 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 22E52670CCC
	for <lists+linux-media@lfdr.de>; Thu, 11 Jun 2026 12:21:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=resnulli-us.20251104.gappssmtp.com header.s=20251104 header.b=fpBmzwUT;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64572-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64572-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C20613014744
	for <lists+linux-media@lfdr.de>; Thu, 11 Jun 2026 10:21:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BDF53CC7F8;
	Thu, 11 Jun 2026 10:21:39 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F572376BE8
	for <linux-media@vger.kernel.org>; Thu, 11 Jun 2026 10:21:34 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781173299; cv=none; b=hVSqrby46YEMZ18nnP+Og+T+rsojCyo8DpYvChEfW82+eMfFEVOj2C4SABaMyDX71eK2kIbTbuRS7YKLcPVSFTrwZwi6FwiNZ4lIpYeMLTu1AaViscBDYO7vzJjEtx8N02A1Jwe/Moak/hv90z94lK1HV6PaJwW2D8C6Uo1lg1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781173299; c=relaxed/simple;
	bh=g+zLGbhMsxlq3gXNeYqrEL9pXE9QWiEaXduyVPFtohc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FILYc7EvwNITqJrVolK/QwrABqGwSz5M/Z2kgYwUea8tkZy9LNRNSDByT8m1AxFxzwoqiy/oc6vC/EORZQ/nrx15V26ohD18Z8p4Ai3dx0tId0AwHTntNB5gLHkkhCbidFvhomtJ5BlkjqCiddUOCqPNwjbN5qj4hhi3xbHq+dg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us; spf=none smtp.mailfrom=resnulli.us; dkim=pass (2048-bit key) header.d=resnulli-us.20251104.gappssmtp.com header.i=@resnulli-us.20251104.gappssmtp.com header.b=fpBmzwUT; arc=none smtp.client-ip=209.85.221.41
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-45fd464d51fso4293308f8f.3
        for <linux-media@vger.kernel.org>; Thu, 11 Jun 2026 03:21:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20251104.gappssmtp.com; s=20251104; t=1781173293; x=1781778093; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ks9XZxCyDCZpPl0hZOLfLDZkVcVXMB4BMtGl2dtDnVQ=;
        b=fpBmzwUTySw/uiKDGqQbqoKpktladXcRVPQD8sdhH5800qPk8c1zMxZcvIndfbGt2I
         IQDVTckZtX67LYZbu72rZxgvtoqDpUKSJRUtYpG9geKANvGiJbGhWBWsD2otq5CuToR4
         AVV9+3E0InG/YX7WK5cjputrEPHICe60ZFboRlVZ0dksZg632/CgoJWaCRZXbLxHn5n6
         Y1i2kV/VS1m5NK/rrLXNSpzoa8JDCXlFN8EfrqkLcdIdOguUlVQIkTPI6cELj2jhs1di
         GQ/Epo5IAI3BmeKBm/4WttY+FbhkImK+vIhHXj4Fzu2DqyYmsg9mRd2kuTpHBzbQ8jNT
         FS3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781173293; x=1781778093;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ks9XZxCyDCZpPl0hZOLfLDZkVcVXMB4BMtGl2dtDnVQ=;
        b=rvFy7UPkFBh9FemAMXaMVY2pYZO9fIUvnvcNvIaM7/gNJylq07h4/zElR0S40vWQ4E
         c1vWPuFLZsIsNZiE9y696/msL5XQQXgZYK+eQXTgTEevKwDtQQHDcdiusRhnBYgsw7ou
         yf5I5OxNKpf64xgGgMbd4mIxauBG8t59laVyLRytQLE2JU53daBGL10TQxxDdNHGT98V
         30PglcpyE4OdrwRkDjCSP/V6WxMxlcvlzX5n47nxssXS01sUJVEmyoMLmbgYSzxLzHXf
         IZP+I1/Jh1u46V7E2gTwtu1QykZDSs8SigZV6q9bpSPuSTB2jKaFCfKdVsBS0zArJ1+c
         K5/w==
X-Forwarded-Encrypted: i=1; AFNElJ/cQ8zoAdAmHjfHWCulUkF8y3c9eOm0zSuc6vVPEnxdZZqyC3zWdrMRmS1A1UX+geougQpyFpcpQA24ow==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0aBeHcgQYIEWmGajzXTLOa9bfObIAN/tYV6M5UJENo2pzNdH8
	sc7uy0xVPovM+M9wIzRd2XWKCqBDoBXXaMwUQrnvbNzdAurDVXt2RvVsm32ATVZTt6Q=
X-Gm-Gg: Acq92OFowv8gLoQihZvNsLOqsebaZvQsAaSVAi0XCgiF892Khlky/emKJSJv18g9HSM
	aQpmsBJ9p53dsXoR9mr0OpwLc8cCHOttjL6GKqNqB2Rqg5lidvicmmym/eUaLq4qUQVHxsmA3fN
	zpL1jrVQuTAY5Ktp5pkKz7VySPM1O6q/20aQw68DjaJVSBXFdMi5sPXXG6lJ2H/6Rha1o3EI6hG
	FtjdCaYCz48MWjRs4PsWt16fzyOG8oXZNSKj7ALOsF7grRe9/x3Ca67zUkKVFxuhTPuaGA9XylZ
	R0GfT9kAaqlJtsG6w2S6k9frltRgNCw5+hRPQLzTT00sp/+7PudzI6pfYZw+1fVzvBR2qa5yTZ0
	ScdqGyaEJWnUmNrb6NHIKUPlXNofsXK+Ekh0cilhsiNPy9LkuFkgmMe7+7xIiK0hYvKAXVTFCci
	t5BMOUenM7737mb2r4nqpzUWokMHuDQn2CrJ5x+w==
X-Received: by 2002:a05:6000:1449:b0:43c:ef4f:79e4 with SMTP id ffacd0b85a97d-460677c149emr3057787f8f.37.1781173293060;
        Thu, 11 Jun 2026 03:21:33 -0700 (PDT)
Received: from localhost ([140.209.217.212])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4602cda3651sm68603644f8f.32.2026.06.11.03.21.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 03:21:32 -0700 (PDT)
Date: Thu, 11 Jun 2026 12:21:27 +0200
From: Jiri Pirko <jiri@resnulli.us>
To: Sumit Semwal <sumit.semwal@linaro.org>
Cc: christian.koenig@amd.com, jgg@ziepe.ca, hch@infradead.org, 
	maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, chleroy@kernel.org, 
	linuxppc-dev@lists.ozlabs.org, lkp@intel.com, agordeev@linux.ibm.com, 
	gerald.schaefer@linux.ibm.com, linux-s390@vger.kernel.org, djbw@kernel.org, 
	thomas.lendacky@amd.com, x86@kernel.org, arnd@linaro.org, benjamin.gaignard@collabora.com, 
	Brian.Starkey@arm.com, jstultz@google.com, tjmercier@google.com, mripard@kernel.org, 
	afd@ti.com, linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] dma-buf: move system_cc_shared heap under separate
 Kconfig
Message-ID: <aiqLJUrJ1dnKhsJn@FV6GYCPJ69>
References: <20260610142329.3836808-1-sumit.semwal@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260610142329.3836808-1-sumit.semwal@linaro.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[resnulli-us.20251104.gappssmtp.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:jgg@ziepe.ca,m:hch@infradead.org,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:lkp@intel.com,m:agordeev@linux.ibm.com,m:gerald.schaefer@linux.ibm.com,m:linux-s390@vger.kernel.org,m:djbw@kernel.org,m:thomas.lendacky@amd.com,m:x86@kernel.org,m:arnd@linaro.org,m:benjamin.gaignard@collabora.com,m:Brian.Starkey@arm.com,m:jstultz@google.com,m:tjmercier@google.com,m:mripard@kernel.org,m:afd@ti.com,m:linux-media@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linaro-mm-sig@lists.linaro.org,m:linux-kernel@vger.kernel.org,m:arnd@arndb.de,s:lists@lfdr.de];
	DMARC_NA(0.00)[resnulli.us];
	FORGED_SENDER(0.00)[jiri@resnulli.us,linux-media@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[28];
	TAGGED_FROM(0.00)[bounces-64572-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[amd.com,ziepe.ca,infradead.org,linux.ibm.com,ellerman.id.au,gmail.com,kernel.org,lists.ozlabs.org,intel.com,vger.kernel.org,linaro.org,collabora.com,arm.com,google.com,ti.com,lists.freedesktop.org,lists.linaro.org,arndb.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jiri@resnulli.us,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[resnulli-us.20251104.gappssmtp.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:email,linaro.org:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp,resnulli.us:from_mime,arndb.de:email,FV6GYCPJ69:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 22E52670CCC

Wed, Jun 10, 2026 at 04:23:29PM +0200, sumit.semwal@linaro.org wrote:
>From: Arnd Bergmann <arnd@arndb.de>
>
>While system heap and system_cc_shared heap share a lot of code
>and hence the same source file, their users have different needs.
>
>system heap users need it to be a loadable module, while
>system_cc_shared heap users don't.
>
>Building as a loadable module breaks system_cc_shared heap on
>powerpc and s390 due to un-exported set_memory_encrypted /
>set_memory_decrypted functions.
>
>Fix these by reorganising code to put the system_cc_shared heap
>under a new Kconfig symbol, which allows either building both
>into the kernel, or leave encryption up to the consumers of the
>system heap.
>
>Fixes: fd55edff8a0a ("dma-buf: heaps: system: Turn the heap into a module")
>Signed-off-by: Arnd Bergmann <arnd@arndb.de>
>Signed-off-by: Sumit Semwal <sumit.semwal@linaro.org>
>---
> drivers/dma-buf/heaps/Kconfig       |  8 ++++++++
> drivers/dma-buf/heaps/system_heap.c | 16 ++++++++++------
> 2 files changed, 18 insertions(+), 6 deletions(-)
>
>diff --git a/drivers/dma-buf/heaps/Kconfig b/drivers/dma-buf/heaps/Kconfig
>index e273fb18feca..a39decdcf067 100644
>--- a/drivers/dma-buf/heaps/Kconfig
>+++ b/drivers/dma-buf/heaps/Kconfig
>@@ -5,6 +5,14 @@ config DMABUF_HEAPS_SYSTEM
> 	  Choose this option to enable the system dmabuf heap. The system heap
> 	  is backed by pages from the buddy allocator. If in doubt, say Y.
> 
>+config DMABUF_HEAPS_CC_SYSTEM

Nit: "DMABUF_HEAPS_SYSTEM_CC_SHARED" to be consistent with the heap
name?

With or without it:
Reviewed-by: Jiri Pirko <jiri@nvidia.com>


