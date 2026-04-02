Return-Path: <linux-media+bounces-57973-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QGKYC817zmnVnwYAu9opvQ
	(envelope-from <linux-media+bounces-57973-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 02 Apr 2026 16:23:09 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C83C38A6F3
	for <lists+linux-media@lfdr.de>; Thu, 02 Apr 2026 16:23:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7BEF530758AB
	for <lists+linux-media@lfdr.de>; Thu,  2 Apr 2026 14:16:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 061BF3E95BC;
	Thu,  2 Apr 2026 14:16:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eve6vmsQ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AA683E51F4
	for <linux-media@vger.kernel.org>; Thu,  2 Apr 2026 14:16:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775139404; cv=pass; b=QqhunFPHD7bNs+HO+smZtROEpKfiJ8Tzc3ZnEKax2l1D9VXoE/ZMvMfdzG74ZQKwvAW5hi/uEUWjNnA7ZkEv/Li8KZ4SDkv6zgJvlt5iEWQp4zWndlWZk68TxUJPw/XB3ubIY3B7hreO2qLGM1ZxvQsEX6WSu3SqWk45d7QSN+4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775139404; c=relaxed/simple;
	bh=kppR+N974fkjx4INcpvuZ1XJFj3juq+tdAzH2DIZUgE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SRsW++vG6mvJQqXtGM9wUOGccwI/EPD2RJoHh83hfr6EzX0ZXfIkEyQXUjL0z0lo9yBfJjLaXWB8ZiUREBKSyF/0NJC0cZiPx8BueT6Xj6NqPc+U+FG1sOKqMfP/vqZhXQ3DBwWlSwpMz4aoXrjcT2iNcJLMhkxOIQ9tdLPQHyo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eve6vmsQ; arc=pass smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-48557c8ad47so7281975e9.0
        for <linux-media@vger.kernel.org>; Thu, 02 Apr 2026 07:16:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775139401; cv=none;
        d=google.com; s=arc-20240605;
        b=CXrkh5+u0TZHebsfatChC2SLp9DIREPv19hitYVADjCh/Klf8xGWz5n+proNhdo+JY
         WjtmnOBhU31Y/fmLKjwEi9+j2nV8vEAXKEj5nfja7VHzhjcBblk+lO76ypWEc6kio5CZ
         Oqb4cFeGw/tHbtwVZK3MWJKnlV0wDbiwqCeWMuacIEBPxQeWa56E84Te4y86T48Zxfti
         jmNPjQf51KmUuSzkd1cqjPmg1ntH6WlDFaPk7Wty7jGal26H1m88iT1K9yTOYg/0RZT/
         z8CcUEuujTeZCfhUB4T3w12zXgH8qe+uVo03PNWTxqsMJtbUTuB+MhziCtI5BUXNKCkv
         RE1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=kppR+N974fkjx4INcpvuZ1XJFj3juq+tdAzH2DIZUgE=;
        fh=ILz+M9SaEAbF3emyNQb7rqmKVdeTVDIJots/AfmenPo=;
        b=WGyn0An9PCP6FXbFEXI294pGp7u+4Otmh0N+eCwLOY7mg0Ms34Zk8Ba+95u7YgUzaH
         6RSrM5lcCGDGfoJq3vEBd24NS/TG3pULh9jLTgGIjQpCejowqN7XZJ4P67SrOEGu5TxG
         08YLWAyXgyESblfJETn78VIe6vgIOnzEagJubO2PVcbMjJISkq4wfy2CNEocD8jAAWMN
         j9jmXIF4rDMEXXukEkxaegC02O2oj9bvf0DShqJ0yCxKz13DfFwuFtgNDUj6eS1oUkUU
         2inEKClrEX7+EaRPdzCXKLJ4dWmmKOfJr0B3GbkdehgDlK1MjueelycLC04OajKpFZxu
         TADA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775139401; x=1775744201; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kppR+N974fkjx4INcpvuZ1XJFj3juq+tdAzH2DIZUgE=;
        b=eve6vmsQBbn0rGsRCRrLkcIzlpuW0AXMIPEC8fg90wssCaPuVZtesYVT9GfRIj31HH
         nl5krVoAwm8PYrnGbYiHmpi+MgS9l/nooNUdxaIfQGtLXj4/aDRP0IYNsKAhjIyh820+
         rswdoP/Tw4J+p3VcBPZKHYX+l8drgKdbLn12oT3sm9yDJgxczKWX71XQcSvCKNCwdUQp
         LsW1FfyTctRROwpP/rDVyVOCPr2LXL/c7ioAgiRpGG8J7tIRBXkwgEdQrRFQHznX1VO1
         pzNpPrtaDDX+N4l3CD5ii8Exg7Z8BtBWM3Kb0o92zkt6dH0XbXKUoMyF9etsVHpWmvlo
         lDLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775139401; x=1775744201;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kppR+N974fkjx4INcpvuZ1XJFj3juq+tdAzH2DIZUgE=;
        b=qC0CxTkK5WgHEVULSKzCkBHwOsdvoxzZMs/kQSI+25/oISwgnSdbiUvYnYBNq08Zrv
         CiLNUb8jlxBCtUIy86El2ZPy861Hrf3SWFR+gNwv0PGKuN1BheDIySwZKjwHayq3FjUx
         wc+qBKdPqQPLQk+988xnRyROnMbBGdr//3LZyyVa6KQ9xconInDg1pErJNcRUuQv0F1B
         oFjWGkshGkS7llA/sjAuUl7hSTL/5nwA2sTzhwo6hNDzynJMsbtQoOfjdpfyujRQsAX0
         Iw7Pe9TRQFM5Jb6TbfnQPzxgaH/wprdr7tNnxLZX+hkcs4apjnoUPsbfH/5kGapVFCrK
         Wg9Q==
X-Forwarded-Encrypted: i=1; AJvYcCWb9EqVv3eTV6zzZRKVVSFceEMFWu1bGQ8n1AIFV1H9o/4qt+uZo/8bGKsHjr6L1al58iZMeHo9SLtfsg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyKt9DZiGE/vZj3rFQxuI/4beyT4GXH71UOdx/QISO/OBRhcHid
	5vSiJtbZfqdbInGzUsdG7tqne4BNPzEyOiXDD0Z9iRIkHT86hyqZGg9zBTbtogFRqNzHJFZJmWq
	ZW/E9oNRlixL2snAEvijotouXiw0QWIY=
X-Gm-Gg: ATEYQzyh+nDdW5+95JgN2LdRrlwSggpkxEJtb0U87G/FlyUDim1SOJ0jfMy5ESAKHA/
	m3Bcow0+rAGjK4NPhR0xPs55wu9fMbeSq3H90O84YaVoeGNynNeNO72haU8zZTouwfaHD0lN1Wl
	HRXK+XJdHz8Ug66f94QKchrUYZignUfpq+RT+vJx1yK4sDn7erKfmrupY205kH7fwoZj5CIHi2H
	+8cSpmETdbbaDkDhc17S1w+WkBw6CeGdfSF/ymC24bJcawI6AwiDwt+wEJAMNAbtE5aUJBKqRIL
	5lRMxMhvrz98zVdqlGeCglkrCNM5YcAuJqrt1pyh+Ptn7MZzUYqApwLJbQ5UUPKvtgAzLga6x1l
	qdLdwpABof5QZoZGKTpERXMDoew==
X-Received: by 2002:a05:600c:890c:b0:488:7f49:eae5 with SMTP id
 5b1f17b1804b1-488835903c7mr98934615e9.16.1775139401258; Thu, 02 Apr 2026
 07:16:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260402091827.2163-1-joshua.crofts1@gmail.com>
 <ac5mFkf5RIEg410Q@ashevche-desk.local> <CALoEA-zg2pFEvGGesXJPVfEJQCKZA0Cj5-oqS=U8GUKBd-TRkw@mail.gmail.com>
 <ac5pOwTLZHFtgyfG@ashevche-desk.local>
In-Reply-To: <ac5pOwTLZHFtgyfG@ashevche-desk.local>
From: Joshua Crofts <joshua.crofts1@gmail.com>
Date: Thu, 2 Apr 2026 16:16:33 +0200
X-Gm-Features: AQROBzAFAYmtv49AxooTnKZel774V-TSWwqS9W4HG8GhHORkhFsMz5ngPiQqKY4
Message-ID: <CALoEA-z0aGoir4_C8cMyZGguJ-Bp1UUADKxntDgjcseUkzNuag@mail.gmail.com>
Subject: Re: [PATCH] staging: atomisp: fix alignment in function signature
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: hansg@kernel.org, mchehab@kernel.org, andy@kernel.org, 
	gregkh@linuxfoundation.org, sakari.ailus@linux.intel.com, grondon@gmail.com, 
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-57973-lists,linux-media=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,linuxfoundation.org,linux.intel.com,gmail.com,vger.kernel.org,lists.linux.dev];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[joshuacrofts1@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,intel.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 9C83C38A6F3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, 2 Apr 2026 at 15:04, Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:

> It is okay and good to group the fixes for the same driver of the same kind.
> I don't believe it's the only single problem of this kind in this driver.
> But you may double check and fix them all.
>
Okay, I'll do a v2 and send it tomorrow (as per the guidelines you mentioned).
Thanks for the feedback, I appreciate it.

Kind regards

CJD

