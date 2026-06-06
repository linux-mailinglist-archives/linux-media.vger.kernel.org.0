Return-Path: <linux-media+bounces-64004-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 0O+7JEjnI2pq0AEAu9opvQ
	(envelope-from <linux-media+bounces-64004-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 06 Jun 2026 11:24:24 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DF79064CFFC
	for <lists+linux-media@lfdr.de>; Sat, 06 Jun 2026 11:24:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=FhAcSub2;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64004-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-64004-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 542E23028F0E
	for <lists+linux-media@lfdr.de>; Sat,  6 Jun 2026 09:23:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4566318EF0;
	Sat,  6 Jun 2026 09:23:51 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 202804204E
	for <linux-media@vger.kernel.org>; Sat,  6 Jun 2026 09:23:49 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780737831; cv=none; b=DFtm8pHF9MuAigH2SOUon8ileeP0UtHOExBy1o29iOP0tgaFO/e8rcRHj1v30SLB1xemAaxPT2wqm/ejjuitbqpWe7E/zJVYElmfxuTXtNGMZP3QB53jVqDnRlXDy5f52Eov3I+JnNPyByzAL1mHgNTK1OlMm7nKpBiz+C4A9To=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780737831; c=relaxed/simple;
	bh=BwhE7xdI5+5inoubbMFMEgTrsdY/m7GE7gSoGyMgy0w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GWuM7c4weUTe9s04sypGkzpOjb9uxzxTxhJzhvfzuvBgev2DFsPcMLGGvm4ZCHyToHdjc5nyK9Z9sM6kL5y39vlxeF30ZxWa/CDtrexFa6yRp1hg3OVOFArvAYAfECMfyOqJhwYf5agzsIi9Pul21QOvup+/AIIO3spqiHSyAY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FhAcSub2; arc=none smtp.client-ip=209.85.128.49
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-490b613a17bso25825765e9.3
        for <linux-media@vger.kernel.org>; Sat, 06 Jun 2026 02:23:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780737828; x=1781342628; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=o3AECBOGH+bhiXvCtacqMdiArKuJwpVAkabTm5OFjxQ=;
        b=FhAcSub2FfhjWGfqL3Bdr9r4pcBiQCHYG4E7Div64s9BQJMLNVgJkrCwkjAY8Au5Y+
         ylCyr8T5tqTdpJ6MAYxsD12yYof/9UGvArjzs+L66OxRZB9r+uLLyH5au/ikdOhjjO2E
         EbKC9NYimspoYIswt8vU7tx5mRSjitYkN2qTlgR3bIxlzC+b5kRqjYCA/7Tgm3AnmmDl
         aNhRVH7NPfvPWPnwcaESAXpgoAKusqt/AyZEXgpRKvvnCrwVkFlQSgcDWdNdvbeYW3t2
         FZIUSVctpgMFVhHmH28SaBScakqVkWmpvBN9fJ9A7CzxfxH43bWPwYqfkVK2W4ZqDYbC
         xHfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780737828; x=1781342628;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o3AECBOGH+bhiXvCtacqMdiArKuJwpVAkabTm5OFjxQ=;
        b=DLjE4nYfkOv4JiXSRMJ+Ycp7ocn6egnzvVe+CdHC5kkDja1WgZAW/lMGL/E5xdYnUG
         hHm26TmOlvPEMyBf2jFBV1e5RhVM7BF0y2CYzty3noBfFiIsbrn+bLkquX4t5n48kTVL
         3ovAxpvLCKFiKZPGNd9IX2pVNoSNB42TZFcN4VFYxwHVrIrCpphqe4I2W8F1BTNCAaMv
         E7OQbHXP2Hcj3g4HX6QWNaaVeYDrUrG4ntqj16gTxh/p0is9Kujwea0BUGO9b02K257v
         p/UXZ3tXoqzZ4sC4JbKa0TAK2HOqvoxKnQlv5CPmgsx1P70d49P6eS/uHzCsUxTsqNz/
         MCbg==
X-Forwarded-Encrypted: i=1; AFNElJ+2J/mM00Ra1ntKqriKHezZTn5WZCbx0lR6pOfxwouXlhvgamgXn7lDRBEBJn3Z5TCu1uoO3cbGr6/fDA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyTWmv8wCJKgGTMXLa88BYRVe1R5pudaqYDnUWo49lxvi2k850z
	qu3pzc1wKuSaQdrds1iBKsZu7soB83pi2IE0+8Up31Ve6cYbULI9dToK
X-Gm-Gg: Acq92OF6Uy4cw34ItFLWdTG22JbQ0hd9LvfB44671q2DuonNqcCgj9pPvURxYQiWQEK
	zm319A/DmsMzZruFwA7gUlAGRugi56Jm94YXfa2zJyUOSJhw21Obnpec84Q6vgQOG7Fsbe32qSU
	KQd6ttAaFWWc7Ld2FoloPHQATP2fmmld4jsVEoj7M70Ls2R78EN6qlRcwvoaXTq0t4kganOqKTF
	kLQLEfy9oDcXqXnVfDoxQe2XbbXFyNrbmTUS0U+O0IdqQ8yEUMsAbuC5dNcuKauu1U0AljlaD+T
	RVkdgVD3PZ9PFAeHuNXH/3Ekst7vV6zbVx6hPm6ITwZkWsK9rWhEDaR/X4OQZLd+cccpPLdab8R
	NlDJNaWp9J1QBf5ECQvSHjC1Cgeeafvu8qXKZ7CqUcsAulZZ04aKNwNeBlUTwT32olWbaB9mYVe
	jRje3kLMvvNxtT8XVuUu/UnvGCipLNsw==
X-Received: by 2002:a05:600c:468a:b0:490:c2a2:e91e with SMTP id 5b1f17b1804b1-490c2a2ea2fmr119883895e9.34.1780737828479;
        Sat, 06 Jun 2026 02:23:48 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc40716bsm230650815e9.12.2026.06.06.02.23.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Jun 2026 02:23:47 -0700 (PDT)
Date: Sat, 6 Jun 2026 12:23:44 +0300
From: Dan Carpenter <error27@gmail.com>
To: Rhys Tumelty <rhys@tumelty.co.uk>
Cc: hansg@kernel.org, mchehab@kernel.org, gregkh@linuxfoundation.org,
	sakari.ailus@linux.intel.com, andy@kernel.org,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: media: atomisp: remove unused macros
Message-ID: <aiPnIDHmJlplnoRh@stanley.mountain>
References: <20260606091447.168262-1-rhys@tumelty.co.uk>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260606091447.168262-1-rhys@tumelty.co.uk>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-64004-lists,linux-media=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[error27@gmail.com,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:rhys@tumelty.co.uk,m:hansg@kernel.org,m:mchehab@kernel.org,m:gregkh@linuxfoundation.org,m:sakari.ailus@linux.intel.com,m:andy@kernel.org,m:linux-media@vger.kernel.org,m:linux-staging@lists.linux.dev,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[error27@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DF79064CFFC

On Sat, Jun 06, 2026 at 10:14:47AM +0100, Rhys Tumelty wrote:
> diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/debug.c b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/debug.c
> index 8513e78856b2..d05832e7f337 100644
> --- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/debug.c
> +++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/debug.c
> @@ -12,7 +12,6 @@
>  #include "debug_private.h"
>  #endif /* __INLINE_DEBUG__ */
>  
> -#define __INLINE_SP__
>  #include "sp.h"
>  

This is used.  It should eventually be cleaned up, but not by randomly
deleting stuff.

regards,
dan carpenter


