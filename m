Return-Path: <linux-media+bounces-64905-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id xDu7L4vkL2p/IgUAu9opvQ
	(envelope-from <linux-media+bounces-64905-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2026 13:39:55 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 320EC685C55
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2026 13:39:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=SUgZSCdu;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64905-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-64905-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B7409301EB73
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2026 11:39:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CC6A33F377;
	Mon, 15 Jun 2026 11:39:52 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9C353E4C88
	for <linux-media@vger.kernel.org>; Mon, 15 Jun 2026 11:39:50 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781523592; cv=none; b=BeW148oMwZzd+TOCFQJXd79VWUTUU47q5yikOpzL/uPrPCS02fHv2g4gzWiTp6nc0U4/ozdgKLRYbYwu2+g7hAAHsUG7O81dflkaFRuQUSuGLLvtKv7EHM9NJsV27PRInR0S7MF7ad5qw8+rF70ofnpOobE2NzU3KxvvV0mP4a4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781523592; c=relaxed/simple;
	bh=Z7OqvE75syAa2U+X2SOS0u90frEwNWeKDpIXMeHLtPs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sW485UW8JSWCOR/SFebiBCsRnIjloukgYoR2XNratrSjseyTqbdXp3MWkXhFK2fh0UxIv15Gnykh4llSosJJfXtL4CR5aF1CmVwkCkMNF2QvbC7DsbqGh8zeyyGloWaB16/8ZawZ4bH/A8HT6C87xp/IcXHCBUNHuquskApEi74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SUgZSCdu; arc=none smtp.client-ip=209.85.160.182
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-5178a42caa3so33784821cf.1
        for <linux-media@vger.kernel.org>; Mon, 15 Jun 2026 04:39:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781523590; x=1782128390; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=g2mEvzG86mOUiso05TrKev3JyUyvNYbprsTbBPCrk1M=;
        b=SUgZSCduUfCVtZmt5qPpH4l0JeEz2C6AnrAu710W4HtzNk7hWNKUAHJlmWCw2Q1BWy
         F6JLruQ+kbnhtUir+J63FZ2FSr93WfhejO6wRh24lvGzTZ4uuCe28vMzRpGtIM3wEXts
         x1vn435qbCIws9Q5J5veCka9qCL+66oqeeD7ez04tdWJxxZh5V9wr5drSQWX833312x2
         DJdJYYv/Fl0lm0kP2zG3evW7dDC1hyWNM3BKSyerFPO8TkO+tmZRLAfDQwEcslcxsv9B
         BovMT0o+zNAShAMTxtC6QZg4RT+vMCKFbDO1uzWFflIl0HDK8p+pMYE8SzYAXZr/SVlj
         dr6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781523590; x=1782128390;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g2mEvzG86mOUiso05TrKev3JyUyvNYbprsTbBPCrk1M=;
        b=q0/A5MWpldaSFXbcpqdMfYDiEBxfyuujydFUTtbu+X1GttMFWaBVynSU+DnUZNTwr4
         31hrCBPAy1dwGZV1UAFeoN+1zdKbrExvgvKWTTxlcy3+Kk98NjoSd1g0+qFSXpB9NJPJ
         bAxwEZ6AB1exCW09LX6Pq/UQVL5JQnSLRZAnDRfv6IYibMPUS4c7oUWxn8YjSHeppboS
         6+rYrwPY6D3JKUvJWdJYoLVbrmMpFhclwbA6v5/Fcilck45K0Yiuctd68X6aswsHJZ0k
         njbW9rz9axqb0CA5MEb0FZEX9m4U4rnOsoUDgTcV40zYyeMknJ9Hi5d7gDRjYLcHfrE2
         HP2A==
X-Forwarded-Encrypted: i=1; AFNElJ9akQlz+5MkcxUdWGkN5YKIRFmBjZ5AgONXazDfa6C78ZaJCFP4HHAac5HcsecXTZnljhyiaogOy2oB0A==@vger.kernel.org
X-Gm-Message-State: AOJu0YyH7XJcifvZpR7ODz5hsTn7bC7UAn1RKtK7tyyAiDiUg1G5CdgG
	ohmJnLWjGyhSGaHOWB0oXg0OZRClQOmBs6rWplWDS4ceCTkwBStviFMX
X-Gm-Gg: Acq92OGKxRoKnnGaxnx2KUbNBdb2ELaur0Szv2IlTVsMiwUhb4XmEmW8/inwi6ArbVI
	j8pNDYppRIAu1hJkCIueeEUYpnZEC4IRKjiK0hkbwI8Cy/JX+J0XsnsRwJCGUVuerKdFRbohOza
	ckNJ/3AaH8yyMIYScoN6A9XGJIDhUGkxk+2ICbgkf2LFyn5WeDCcWFnE6def9LxL1KJ10Or3oa1
	SC23oQFlMC35F8uMFxD/Gik9EQ/tRxu3jHr943W7328xllJL9E5aaiaEiyfTJbM74qGVD3PZzlU
	p71KLZUPWNFYn/5hSC/NMkmO9sEbfn9GeMllDf7ay6JN1zP+8Tud0HWrgb0yG35dnzA3lvKqhG2
	YO+EsSxAjVjrtVhPJ3i4ji2YkaQnOQ+CJKmzHILFj2W7/fUjFn/Dq+6gz8Q4nc0ehcBIXKNn9Nk
	91xe+7oVJwKP4YqvyD
X-Received: by 2002:ac8:6545:0:b0:516:ca56:a44d with SMTP id d75a77b69052e-517fbc89409mr177167071cf.6.1781523589611;
        Mon, 15 Jun 2026 04:39:49 -0700 (PDT)
Received: from localhost ([43.225.189.75])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-517fb7ec47asm105333951cf.24.2026.06.15.04.39.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 04:39:48 -0700 (PDT)
Date: Mon, 15 Jun 2026 14:39:42 +0300
From: Dan Carpenter <error27@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Dawei Feng <dawei.feng@seu.edu.cn>, andy@kernel.org, hansg@kernel.org,
	mchehab@kernel.org, sakari.ailus@linux.intel.com,
	gregkh@linuxfoundation.org, abdelrahmanfekry375@gmail.com,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, jianhao.xu@seu.edu.cn,
	Zilin Guan <zilin@seu.edu.cn>, Kees Cook <keescook@chromium.org>,
	Jonathan Corbet <corbet@lwn.net>
Subject: Re: [PATCH v2 1/2] media: atomisp: fix memory leak in
 atomisp_pci_probe()
Message-ID: <ai_kfgkuDYcFd0bG@stanley.mountain>
References: <20260615072841.3113700-1-dawei.feng@seu.edu.cn>
 <20260615072841.3113700-2-dawei.feng@seu.edu.cn>
 <ai_d0B8YOZAwnqu_@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ai_d0B8YOZAwnqu_@ashevche-desk.local>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-64905-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:andriy.shevchenko@intel.com,m:dawei.feng@seu.edu.cn,m:andy@kernel.org,m:hansg@kernel.org,m:mchehab@kernel.org,m:sakari.ailus@linux.intel.com,m:gregkh@linuxfoundation.org,m:abdelrahmanfekry375@gmail.com,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-staging@lists.linux.dev,m:jianhao.xu@seu.edu.cn,m:zilin@seu.edu.cn,m:keescook@chromium.org,m:corbet@lwn.net,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[error27@gmail.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[seu.edu.cn,kernel.org,linux.intel.com,linuxfoundation.org,gmail.com,vger.kernel.org,lists.linux.dev,chromium.org,lwn.net];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[error27@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,stanley.mountain:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 320EC685C55

On Mon, Jun 15, 2026 at 02:11:12PM +0300, Andy Shevchenko wrote:
> > The bug was first flagged by an experimental analysis tool we are
> > developing for kernel memory-management bugs while analyzing
> > v6.13-rc1. The tool is still under development and is not yet publicly
> > available. Manual inspection confirms that the bug is still present in
> > v7.1-rc7.
> > 
> > An x86_64 allyesconfig build showed no new warnings. As we do not have
> > an Intel Atom ISP platform with the required camera sensor hardware to
> > test with, no runtime testing was able to be performed.
> 
> These last two paragraphs do not suit the commit message. Please, drop them
> here and better to describe all this in the cover letter (if not yet).

This is how the documentation says to write commit messages.

https://lore.kernel.org/all/ahgaOigklcDCYvRp@stanley.mountain/

regards,
dan carpenter

