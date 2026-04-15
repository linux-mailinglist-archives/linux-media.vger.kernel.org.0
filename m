Return-Path: <linux-media+bounces-58813-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ODIfOo9j32mKSQAAu9opvQ
	(envelope-from <linux-media+bounces-58813-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 15 Apr 2026 12:08:15 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 60B5B403210
	for <lists+linux-media@lfdr.de>; Wed, 15 Apr 2026 12:08:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C2FB030EC8AB
	for <lists+linux-media@lfdr.de>; Wed, 15 Apr 2026 10:05:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEE59344D9B;
	Wed, 15 Apr 2026 10:05:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FqY6hFd8"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBFE733DED1
	for <linux-media@vger.kernel.org>; Wed, 15 Apr 2026 10:05:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776247553; cv=none; b=jObGF/I78+It2FpZRifbNER/cX+khWmqsBFsDaqzgIbBUD1njSjSip5e2BNuQAvr1wQ8gsW/zrl79Y4wmhfAreLsaWkHTKP0zrMJc0GYlv36lmWMo8DdSnFg9XFe7MiX+WTIDq7rreS6pnv42R5ckiSIFiIja0OF9AxFAaOHw50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776247553; c=relaxed/simple;
	bh=NDJ0bZGkP12D4112wksethGXWdmzMfeMV4LeDJwvJIU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qd/FByXqxfZLjribWa8ZeAQDrW7ANg+YwhN/fsHhuUh/KlHTQJ07JVfBWQ9I9t5JH8ZHaiVzTRhWhmoMMA/yUVp0k2vhBox/n566z8xMz8WgOcmEDFJG3wiDsItProcZOWnmTkd3SQufHQVdHxN2Rhk77emG0HWmZk6qQ7mh4+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FqY6hFd8; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-488a4bc360bso36500105e9.0
        for <linux-media@vger.kernel.org>; Wed, 15 Apr 2026 03:05:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776247550; x=1776852350; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oPf/88OR1eh/7G09scCZwblzoYMeBue5GJQTUY482co=;
        b=FqY6hFd8HcrCiXPm96FKeC5eHd+qGvSeOn3/S38TX20fHyh6DfcaJtu1HrRJYGb43J
         aNz179KMHSFVg8dN1R2w//Q/Y0MgsiRaPy9lsbjXGmdZLBBAFUq92IG1SnVk8ZKUrvfK
         EqmcV/AH+pIp4IFpd2Qcd8KH4PgJ5lnm97XVKN5Uu1OF5uEEkOl+RMxWD16pIw0yuGEJ
         C5STg3tBeX6fkRm2/3YklAqq9pJN4nH0konRpepi1iKqYn5+MHuM1/1axqZBweYg8xeg
         Yd/ylnKLgsrH2B5mlyRLVHr86HLnGFo6l04VMsSJl90H+7yAq7/0uN+lPSs712iKhnyl
         opyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776247550; x=1776852350;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oPf/88OR1eh/7G09scCZwblzoYMeBue5GJQTUY482co=;
        b=be6lsH+4r5tYUhbUVmvMG9Zpp55G/f4SroXE1+Xz0cwQQyVr4ZWOpVTV4OB4Oo9hSq
         1olOu8+CSgCOGzsgWSLwPwHmyorXq6DvnhZCx4EB9NeTrfNtraMtb/GtYJ+37u3Rw3sw
         odpdivzBZkszBF0ypwSBH670Ky+1wsRvlmFYF6KqyFzvCHK5hXp/3XJ2FnoFk1/WYOzt
         Rou84wML4PHFTX0HE+cQtRnrEx/LpMqnZf5qTQP407+dRa1BP0Cq+aPpmxo0Noz2VQc7
         CRtkOtEeUeB3OeoYlT9eduuyLDh81mrEvMCNJQg6SI4IIuSSUP8nK8KF+/F6p0O6CzhW
         s6CA==
X-Forwarded-Encrypted: i=1; AFNElJ9/QP044FVyxSErCM5XyybrQWOdVsN6uenUZdpeMz6YZjJ6dlJc6aEck02cVSlcJQ7ZepGAcJJNswidfw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwzGICNdn3qDLkPEHeSIjNkIDkwKMI+20nfkbPyABdI1SYeKC6t
	G4qosCSY/x76aqkUdp9AoTsQyy7cWXP1R4aDDMFw6nFIdGHFlW8uLdtCUNmJIEYrAHQ=
X-Gm-Gg: AeBDietgFBp8yHXHSg3rlqaG6czzb9skgJnmGw2NzDKsyK60h01CqQLXmXXkDfOAIEy
	znnY3O8e0Jn9+4EDzlb+iJ3MOOnO7JWpP1PnVr+GFdnrtY5mLaSsWFYUu4NffgT+Mg6m4sdZvBF
	M8xyyR3+WCcCHjcFE63QKOootYVFUpFByiuK5kMMMkYEBN4g9K1/6vcLLZSqXW0/mT/Fe19WYJt
	fvmeOfzDmYPHbczOHUQfiMzQ02NjecFsBDnQTVTuGnde10bMFqygaGnnGT7hUz02myvJPfbrNpM
	s4mOgZDdN2wLI7589rJPJL5D03UjZMCD/Z50h2uktjNsMwHpAjIEXPkZMeN9HpLzsGzrUkHU+7+
	g9ASTay6ucDSMqF3eQu7uxJYkVrhwjVtzw7ZNoC50sIuQ/YxUQRapqD5DMR0VcMHuUaDOQGHcOE
	vyFvGlx9+idgA7FYPpPTs=
X-Received: by 2002:a05:600d:1c:b0:487:1108:48bc with SMTP id 5b1f17b1804b1-488d6836d87mr221820675e9.17.1776247549991;
        Wed, 15 Apr 2026 03:05:49 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488f08bdadbsm18978325e9.0.2026.04.15.03.05.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 03:05:49 -0700 (PDT)
Date: Wed, 15 Apr 2026 13:05:45 +0300
From: Dan Carpenter <error27@gmail.com>
To: deep@crimson.net.eu.org
Cc: sakari.ailus@linux.intel.com, bingbu.cao@intel.com, mchehab@kernel.org,
	gregkh@linuxfoundation.org, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: staging: ipu7: cleanup register names and suffixes
Message-ID: <ad9i-XhEZ-m8WKVd@stanley.mountain>
References: <20260415070205.1245502-1-deep@crimson.net.eu.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260415070205.1245502-1-deep@crimson.net.eu.org>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-58813-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[error27@gmail.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_NONE(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,stanley.mountain:mid]
X-Rspamd-Queue-Id: 60B5B403210
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Apr 15, 2026 at 09:02:05AM +0200, deep@crimson.net.eu.org wrote:
> From: Kenet Jovan Sokoli <deep@crimson.net.eu.org>
> 
> Rename BUTTRESS_ registers to include IPU7_ prefix and
> remove unnecessary U suffixes from numeric constants
> for consistency.
> 

The the renames and changing the types from u32 to int should probably
be done in separate patches.

You need to be a bit careful with changing types.  Generally, you should
use unsigned types for bitwise operations.  So the _MASK variables should
be unsigned.

> diff --git a/drivers/staging/media/ipu7/ipu7-mmu.c b/drivers/staging/media/ipu7/ipu7-mmu.c
> index 6ded07ccd780..c5f83023ddbd 100644
> --- a/drivers/staging/media/ipu7/ipu7-mmu.c
> +++ b/drivers/staging/media/ipu7/ipu7-mmu.c
> @@ -33,16 +33,16 @@
>  
>  #define ISP_PAGE_SHIFT		12
>  #define ISP_PAGE_SIZE		BIT(ISP_PAGE_SHIFT)
> -#define ISP_PAGE_MASK		(~(ISP_PAGE_SIZE - 1U))
> +#define IPU7_ISP_PAGE_MASK		(~(ISP_PAGE_SIZE - 1))
>  
>  #define ISP_L1PT_SHIFT		22
> -#define ISP_L1PT_MASK		(~((1U << ISP_L1PT_SHIFT) - 1))
> +#define IPU7_ISP_L1PT_MASK		(~((1 << ISP_L1PT_SHIFT) - 1))
>  
>  #define ISP_L2PT_SHIFT		12
> -#define ISP_L2PT_MASK		(~(ISP_L1PT_MASK | (~(ISP_PAGE_MASK))))
> +#define ISP_L2PT_MASK		(~(IPU7_ISP_L1PT_MASK | (~(IPU7_ISP_PAGE_MASK))))

In the original code this was 0x3ff000 but now, because of sign
extension, it is 0xffffffff003ff000.  Does it make a difference?
I don't know.  But it makes me uncomfortable to see all these changes
thrown together like this where it's so hard to spot.

regards,
dan carpenter


