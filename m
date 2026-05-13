Return-Path: <linux-media+bounces-61330-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id dxFCBJshBGoZEwIAu9opvQ
	(envelope-from <linux-media+bounces-61330-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 09:00:43 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AD2252E5BC
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 09:00:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5F159303747E
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 07:00:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FA3D3D4128;
	Wed, 13 May 2026 07:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aLWrok0e"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40E732874FA
	for <linux-media@vger.kernel.org>; Wed, 13 May 2026 07:00:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778655626; cv=none; b=DQutxcuL1jSRifTYF6exIKbXcKAraj5vtbYryswjFDAS+88ob6+7OnzUkEnPQacR+42uRT2MGAT+66ND28MlWDWescycIbCSo8F6tFkCUODNSDaWJOJaWTcZuAbgaExNhj6Gh4GTEPpl4r5Ti0TNV4w+vXhVh4qqqEbXwUgW89c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778655626; c=relaxed/simple;
	bh=MFN9/QoNknbsqvcPfXG8PDiKo1RlCEzFG6pJYopYdkM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YtBWH8gEOOYAgCEFMvibIkl3MsrVUtz8HNHTpO5dxlURshzgiaAtxFGYQteSuKx8TlOFC0G+fb0yjir+1i4miXzEAexOxRIgFsPSYWuENqZ5nP1E7O2KJgXZgTqAnee7AywcBX4k/kUM6H/LahFuN+Fl8mWLzfaTO8WzN6aZUI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aLWrok0e; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-44a74032ff8so4733641f8f.1
        for <linux-media@vger.kernel.org>; Wed, 13 May 2026 00:00:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778655624; x=1779260424; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KWUn8+SjlDuoSwuw8nKOZYEXk7UtcnUYxUiUlW/Jo5w=;
        b=aLWrok0eFMZ64P57DiifamiUwIvTjNFYs5JPhcv6+5M00w3vxlRtII0GMv9+qWQbAD
         zJZrgR4fgeEWq0Eh8+ugWT+ADD3LGF1NeQiRPfn1PLyYWyTUYUeQIfNtPSsIUKrr7Ed4
         wG51vdDlanXSyITJXRhdPnEf0gAumsKz7d6HYtlri8KutkCG4OQ8+D8L31xG0iS9bKs4
         /HRzqrsHWPqPhpX3upsYn0i5ktF6mKVjqnUtgCi/T9EfJVKHaSq+M6/glRTzeN5Lxmr/
         hmbLiC6To+rrP2y00hI4QsjjhEbBT9tOuhlbDouRf9UhJ6NBVjGkuykiZb6vTpY0Xx8/
         69IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778655624; x=1779260424;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KWUn8+SjlDuoSwuw8nKOZYEXk7UtcnUYxUiUlW/Jo5w=;
        b=hPoTYS2skdxRQtg5u5lA83Wykg9WSC4lzl4HFmbHFM1DKF3RxqF2YTcZFwiFsku0ko
         uMq0nEyzyIfsbb9thAvwYQFJUZ70iubb9P0mYo3XskrbAIW3efR+hq3odaytZU+rLMZD
         7K/85vnFf14p05PCaIG4A/1hkUsEhkteunS+jvezdgWCTM5W4AKaUTgJmhC4bdopp2yZ
         yCOCJioln/mCtRQgFANP47bfCVFDr7+M3KGhv4If6CoZXdxLsg0oyfeps+iYPz/m/jBC
         kUWho1SOOCYFlCGgvRg7+3IoFVoi7nVQ46jQsfSRVm8RnaFFojf8v/zUPzx9zKzsdsp7
         HvAA==
X-Forwarded-Encrypted: i=1; AFNElJ/venipx9Vkjl6L5YwsFUKMeJmcZFGLHhbTwuC2m6HgT++CpL6sLnA0crKv85/3V2ufSHsaielL6JuVYg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzgIzmBs2X2oznUwP4nArgncXh4j1S3QXl95KSZ8X6fusSnkGem
	FvPvlawAp+2U4gC0EjM5uG8J9zcHNvUukh3YPvbgvjncT1b4YY+wtJ06
X-Gm-Gg: Acq92OF49cqCtb8PkRLNMckTiu9SK2Pq1+JrZ/NVEGqlRwkI5G9WUEKe7EuO7HHSz2S
	gg0XonvzOrpj5zlq91MJwSVdLuTi4muJdL1ntjQwkqPLmRhxmTh9LxtIbyw9irB2PevV6INn+DS
	sPS90DMFsWbvTfrJQNdca2EMyV1SZSY2tsRzQ4RwaZ9rR4Mg0OH6NA0cYeTUPpwo8emOMCeDO6Q
	Nz0QmdTq0VwxOCEyKrwutgn/O2nSdMra09G7Q4jsYDQMne5ZIxOhYE7CZ8+sm7ppSU/5STXq3qv
	el8MAcDY9eY4Ck49JU/T0ZmsgSJyrINkgI0p2ZKmRmdKizqUiSH+pnfTOJzVzkKMOHdXHqznWfR
	q1ar72SDBYzDHJnQ9u+fQfAwSEDYKKBK+Q5mrWuTKFYTKdWdyvb2DIAcY1Y+CRcqipK6+nzG2jj
	YLo42vKOXt+OJmBC4ZVHGudyox/iZ3mw==
X-Received: by 2002:a05:6000:2586:b0:452:c246:ab79 with SMTP id ffacd0b85a97d-45c79586435mr2329827f8f.14.1778655623487;
        Wed, 13 May 2026 00:00:23 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-454913049ecsm37112411f8f.19.2026.05.13.00.00.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 00:00:21 -0700 (PDT)
Date: Wed, 13 May 2026 10:00:18 +0300
From: Dan Carpenter <error27@gmail.com>
To: Tomasz Unger <tomasz.unger@yahoo.pl>
Cc: Andy Shevchenko <andy@kernel.org>, Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH v3] staging: media: atomisp: remove stale "Generated
 code" comments
Message-ID: <agQhgsgYJfizeLuk@stanley.mountain>
References: <20260512-atomisp-remove-generated-comment-v3-1-97930e4e1ca8.ref@yahoo.pl>
 <20260512-atomisp-remove-generated-comment-v3-1-97930e4e1ca8@yahoo.pl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260512-atomisp-remove-generated-comment-v3-1-97930e4e1ca8@yahoo.pl>
X-Rspamd-Queue-Id: 4AD2252E5BC
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-61330-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[yahoo.pl];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[error27@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[9];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stanley.mountain:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Tue, May 12, 2026 at 08:10:52PM +0200, Tomasz Unger wrote:
> Remove the "Generated code: do not edit or commmit." comments and
> the resulting double blank lines from five files. This code is coupled
> with legacy firmware and will never be re-generated, so the comment
> is misleading and should be dropped entirely rather than having its
> typo fixed.
> 
> Suggested-by: Dan Carpenter <error27@gmail.com>

I didn't really suggest it.  I just pointed out that you need to
delete the blank line following it so the right way to do this would
be to put a little note under the ---


> Signed-off-by: Tomasz Unger <tomasz.unger@yahoo.pl>
> ---
  ^^^
cut off line, here.

v3: remove trailing blank lines (as noted by Dan Carpenter)

Although I'm also happy to boost my tag count so I don't really mind
being credited either.

regards,
dan carpenter


