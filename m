Return-Path: <linux-media+bounces-65450-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id tmP1GudHOmoU5QcAu9opvQ
	(envelope-from <linux-media+bounces-65450-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 23 Jun 2026 10:46:31 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D60CA6B55F9
	for <lists+linux-media@lfdr.de>; Tue, 23 Jun 2026 10:46:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=J2kQIA6K;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65450-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-65450-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B1E51308CACC
	for <lists+linux-media@lfdr.de>; Tue, 23 Jun 2026 08:44:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE4E03CF673;
	Tue, 23 Jun 2026 08:44:52 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D78C13CF200
	for <linux-media@vger.kernel.org>; Tue, 23 Jun 2026 08:44:50 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782204292; cv=none; b=jzA8eXfZqtWQ8RKDvN50ZgL36LPSXOf4Z/wsuxwbOg6FGMd1jKyueZGISz6D+9208L4DdwfKb9/P8mQlbd8vshNiaDH/mw73jzGQZ/5O705Sm3hV3y+yBVZ+2lieFu+RMh64trAVhyZBpOplI514m7QZB/HlV7UyFnzL2JkST5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782204292; c=relaxed/simple;
	bh=/NW10gd3XiJjasTwnvkAvxDjB+x+y0bolKqdPwKnlUc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PEtNxGyZX8usSsjK8Lb2um2gOzJI0vykzYyhEeUu/7B6zVXtchnqzpmpQLovE6eguYotJOCWI6bAaakRKOKsuu/0Kqnsn0MvM0BgQz2f/0cLqNmXgDP5AVxQEYTIWeSKeyEIYcV2u+36nhvklfXEtkLvl3SG4jUcNban2fGHE0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J2kQIA6K; arc=none smtp.client-ip=209.85.128.42
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4903d730b1fso79968075e9.2
        for <linux-media@vger.kernel.org>; Tue, 23 Jun 2026 01:44:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782204289; x=1782809089; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cd5zggzn9YY/eKp5MGwYc/7RumCc5LCFsD9dus6MWn0=;
        b=J2kQIA6KcLlAW2F536zioZdayh7HoTZMaWMlqtiBJ8sxJqanZEBwaYqmGOgBfZrqDr
         fgAcz27+KyR1wA2NJ/DLNU+PmjGTgjtaP5GYoarkkWar4Qtyu0GAlVhBJbp3PJKUEybK
         KcfHsW7uBy0L1JKfXPsCP9CQKZpDUAW5kEKzKRC0SWWZ7rQCTvOMLS1HJbbR7cUV/jYF
         /MIWfobo86UW0MCISSZQkzFnkK7pkrinnqLifr4Z8C5ByCl8DAW1vpNJh+a6Pv42SkuS
         rdseE6KfR9dXpfFALm2RDWOhHYtfCc3JUgWdRs9amRMi5JP9Hi8/wZPcgyOqk3fxyitq
         tHng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782204289; x=1782809089;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cd5zggzn9YY/eKp5MGwYc/7RumCc5LCFsD9dus6MWn0=;
        b=MXa7xpGlQbjPhbgZJ8AVAvR/b8/iF5ECFF50+RM2rD665+grcOIAZyXgndvUqI37lf
         AQxfJawjL0M9yCZfH7+eIWi+lO6wtvDN/RT3LpX0UvZzPLTqdkyPRXcfUWVpaOYs+SX0
         KCfO7A8bVvp6kJcJzWCPckb2jgzF5Xbe3ul/Gy9dD1uVjauLNVQxts1ct2Jx84eYlvvi
         Kg9V1HB7V8Vz7Kg5fGnREhgg4HgLoRo0oMigu7Ipz7R8i/2khsAEz6dANAx3l1z7ed3q
         CSm6sAo+Du2VCKUZ3lPaot6/xR+f2m/4JGfv7UTj+WpP1O/8iDWSC1KPsAZ+ZJeNwQEr
         29vQ==
X-Forwarded-Encrypted: i=1; AFNElJ/+p4+bW4OOrCptFI5cG4baoEbqgdZVtQKGTwu7i21sZ+25leZaqRugCU+w3BJCT4giLLv87TbIJONZrw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwbJNL4Jqjx5o9FBxzwF0YB2MCI+XJVm9uJghIAaKzOObkV1Rhy
	fE553pkjt89HiPhPZwc7CClJDJI1e2QfaGxOUFP4sQU80Zlg+agsItsk
X-Gm-Gg: AfdE7cl0mUQe52CrqHz/1snP2ox9+QKJhjjUKmvLxTMsKAKsAmRWbNijWWnaE1o26vd
	e8Ox+CMKh2PINmKjGxMYauQRU7imD0MLEX5kAy0BObmvHLKpOIZaPVYXhgKGOTlo7smMjsTmgRi
	adxEjvVzgLHVNTCOTtS4gJaFYe6vUznRg+Bi/YQ7BhJAGcD0j/gAc1DG5uiSWt/q1TzrksTN0KQ
	JgxLLnhQ7/jSK7RNgb8EzYdiIczoM+IuMCOvNeJNkf13zAf/B9a3CgUyCh/Ofil48BC9B5+ojLX
	IEBgqEuzi7x99Q1aLcwJTgZI/21v5WmztwYhTV+Weq+8LB6sCze2S+R5P4xbDvvM8+t1aZdHuBk
	mt6ahuUsVkqEmiXPCDYh2AiiNnh5SMH7GyjObox8ocCDdkz64L4cczf8Biu8TsVK8XZV24zfPGv
	Izse2j1ELS76oO2ciFWTRnxO50qQ15O//UCU/S/xGglBXJ/3oVGg==
X-Received: by 2002:a05:600d:640f:20b0:492:408b:d267 with SMTP id 5b1f17b1804b1-4925b394574mr18459465e9.13.1782204289054;
        Tue, 23 Jun 2026 01:44:49 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4924923392dsm530639635e9.2.2026.06.23.01.44.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 01:44:48 -0700 (PDT)
Date: Tue, 23 Jun 2026 09:44:46 +0100
From: David Laight <david.laight.linux@gmail.com>
To: David Hu <xuehaohu@google.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>, "Christian =?UTF-8?B?S8O2bmln?="
 <christian.koenig@amd.com>, Jason Gunthorpe <jgg@ziepe.ca>, Nicolin Chen
 <nicolinc@nvidia.com>, Leon Romanovsky <leon@kernel.org>, Kevin Tian
 <kevin.tian@intel.com>, Ankit Agrawal <ankita@nvidia.com>, Alex Williamson
 <alex@shazbot.org>, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org, iommu@lists.linux.dev, jmoroni@google.com,
 praan@google.com, kpberry@google.com, chriscli@google.com,
 sashiko-bot@kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v2] dma-buf: Split sgl into page-aligned 2G chunks
Message-ID: <20260623094446.4a8fc2ed@pumpkin>
In-Reply-To: <20260623015459.1153884-1-xuehaohu@google.com>
References: <20260621222130.1667453-1-xuehaohu@google.com>
	<20260623015459.1153884-1-xuehaohu@google.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[davidlaightlinux@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:xuehaohu@google.com,m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:jgg@ziepe.ca,m:nicolinc@nvidia.com,m:leon@kernel.org,m:kevin.tian@intel.com,m:ankita@nvidia.com,m:alex@shazbot.org,m:linux-media@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linaro-mm-sig@lists.linaro.org,m:linux-kernel@vger.kernel.org,m:iommu@lists.linux.dev,m:jmoroni@google.com,m:praan@google.com,m:kpberry@google.com,m:chriscli@google.com,m:sashiko-bot@kernel.org,m:stable@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-65450-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[davidlaightlinux@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[pumpkin:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D60CA6B55F9

On Tue, 23 Jun 2026 01:54:59 +0000
David Hu <xuehaohu@google.com> wrote:

> Currently, `fill_sg_entry()` splits the scatterlist using `UINT_MAX`.
> This creates a non-page-aligned DMA length (`0xFFFFFFFF`) for the
> first entry, resulting in non-page-aligned DMA addresses for all
> subsequent entries.

There is a separate issue of whether this code is even needed at all.
Where can transfers over 2G (never mind 4G) actually come from.

The read, write and similar system calls limit transfers to INT_MAX
(even on 64bit) and a lot of driver code will need fixing it longer
lengths are allowed though.
io_uring better enforce the same limits.
So the transfers can come directly from userspace.

Not only that but you also need a single physically contiguous buffer.
Good luck allocating that!

Now maybe there are some peer-to-peer places where the large buffer
is device memory, but they will be unusual and probably need
special treatment anyway.

	David

