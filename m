Return-Path: <linux-media+bounces-66084-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 4f0sN065Q2pWfwoAu9opvQ
	(envelope-from <linux-media+bounces-66084-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 30 Jun 2026 14:40:46 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DDF086E4493
	for <lists+linux-media@lfdr.de>; Tue, 30 Jun 2026 14:40:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ziepe.ca header.s=google header.b=IYD93HRg;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66084-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66084-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C0C39300D578
	for <lists+linux-media@lfdr.de>; Tue, 30 Jun 2026 12:38:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8F6940BCCD;
	Tue, 30 Jun 2026 12:38:53 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB069403EA5
	for <linux-media@vger.kernel.org>; Tue, 30 Jun 2026 12:38:51 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782823133; cv=none; b=ScQ1W/qn5bIdkIpZHN+W+taONCR/2ak190nJq/t5DbuAtnq6p7aHuGfxnyrtbEeu+T68/i7L08MY0DBFx7QzYyfZDbKSsHxPAca4VNAB4btvldubrYVB4+/526pe2Tysn5PAxI0vLlxMlMLhVcb/xXYhtkskHDBhrrS/g8j1tTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782823133; c=relaxed/simple;
	bh=HWLewm9KCB7MjAKi5lfHa4PConKZEGpyeTggVQfUIHk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u1fcJPTsxM8r0edxr0nR0Y0CqPzjYlUJvLwKtIbZ8tuFPoDC9Q5u8Vk74h8Cn18nIAYqM0GU2msSd5+V3bKeGS6xdd1s0pG4ewkDyzsOWHTJt2swJf1kfB6iUbSa7+bw3bdA2uc3FuHxU9uGAPnLUaQVhxQPpfT6EVTfPgNrqis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=IYD93HRg; arc=none smtp.client-ip=209.85.219.48
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-8ef7b7651ecso6644636d6.1
        for <linux-media@vger.kernel.org>; Tue, 30 Jun 2026 05:38:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1782823131; x=1783427931; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=usbOUHulcGkq5pslDcl5tYYUADM4pc66+J0xE33qcCE=;
        b=IYD93HRgotQXIEA9XystXFNDgi/pIH3weHjmmw83gN3lZw1zC4MJCVTWG5/NczrUgk
         Wr6De8NJiNkZTRti2jUEhQPU1Ffhlh38sEIRlyNquV8m3TzXtiGQdDl7ZoWI+zjdkXwL
         9KACz4Ni44wXLtMe7V3K88OeJX5dlBkAKKItgaSrfTNrTC4lKvS60D98y1+9GMxNWBgG
         8z5zGajmLf/gk/yRYM4plF/h8pzzwpaZi5M6LlyaY8cINnILgPEdQpbPojtqxBIdp8Bn
         OLr4IzexORNiSyXOE5rwxA/Kh6S2iv9LH5FkGZMBuXqZcawbqO7+RBH/DLFzoE0zqz4B
         +9Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782823131; x=1783427931;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=usbOUHulcGkq5pslDcl5tYYUADM4pc66+J0xE33qcCE=;
        b=NDuhntw/RtclpNmURupN2FZMPyoTDlWCipuApWYsG77DbAJbQZDvuPzMGNrX1KH2Cs
         R80Mi9PfHyjZVZFfrEWkU2WR2x3RokP+kmrs45/vrIZUdWexOeiivrPR7jx+gVbTm/NA
         BDr6V14L4kCDhpZ8iAwP1ftOrlW22agkcJ+bi3G75X3+n1/cIsaulHnf5etBi86ybF+u
         gamFzpXzC/n0BajIrxxun37a177rAv9LLhoA51MJ5LiYW0N6Zm09qPOlFJZYm81BvC8T
         1IaBIZybLNhn0yMCgqlpPAlNkeOEWYU73ELAdr/yU28ZG5PoiebHveUz1KyZ3nIWSA1M
         We9Q==
X-Forwarded-Encrypted: i=1; AHgh+Rrqu8o6HVtTiWaYNFe9Qte1aX1PDEExYXwi04Swaile6U0dzPHywT5qqrBCmq7r9F1ppz7kNVQorBFFTQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyfiIuILvt8tKvA3M11+Mavi3IN1pj4p4CajgIpojcIQmDHLzZx
	Or17lpEFEuC/iHCr8K2PsGLtdP86C9d8Ado6iViPM+F85uN+bNJ3aJk74GqW6oosY8U=
X-Gm-Gg: AfdE7clr0fvyo9JkOHiFJmYtAqYn4AITC3O4vvF0jKZmYpWFphKZbsYfwBPuu0bNC59
	80T8HZoqEAIOfVWoLIswOK7qMFIkiL7Ddm4PREJ0BeZZt7QU7qgi7yAp9/OLmyLYo36511oiXtN
	qjsp1LM0uGvzcSKpPpixF+NK3dZ0FCBSanMUUpFlr4FUPfVQsFdLA33/Z0duX3YtD3aDBOcXEMG
	2VXF2f2AOnn0gxFB/YqnwcY8/j0lghrVpAq+tirqpJBFDypEw/RvzX/yyvfSXOncefvkYy08e0V
	rwrXpHjWUjM7MMwbmumY53TBpfS9fJSHjuUNxueSeBm/CWJ0DIkc9fEW47LZZGLU+ZzrrzyYmCP
	nLhOS6Cmsvcjsvz49Z6kP7mL8WOglFK70sjPsxnC6EEKgjZT/HIMtANhtkSC2kXmcrZuBukIRyY
	XkS/Rp9bOFX++9y+pcPRmuqY4hScuKvE72AA47ETXBEWlRMso8itgxCXvvyFk1H17Vw0o=
X-Received: by 2002:a05:6214:448e:b0:8db:480e:6944 with SMTP id 6a1803df08f44-8f2549e5762mr17241226d6.26.1782823130931;
        Tue, 30 Jun 2026 05:38:50 -0700 (PDT)
Received: from ziepe.ca (crbknf0213w-47-54-130-67.pppoe-dynamic.high-speed.nl.bellaliant.net. [47.54.130.67])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8f1a7558676sm22067246d6.40.2026.06.30.05.38.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 05:38:50 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1weXjl-00000001qLK-2mow;
	Tue, 30 Jun 2026 09:38:49 -0300
Date: Tue, 30 Jun 2026 09:38:49 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: David Laight <david.laight.linux@gmail.com>
Cc: David Hu <xuehaohu@google.com>, Sumit Semwal <sumit.semwal@linaro.org>,
	Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
	Nicolin Chen <nicolinc@nvidia.com>,
	Leon Romanovsky <leon@kernel.org>,
	Kevin Tian <kevin.tian@intel.com>,
	Ankit Agrawal <ankita@nvidia.com>,
	Alex Williamson <alex@shazbot.org>, linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
	linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
	jmoroni@google.com, praan@google.com, kpberry@google.com,
	chriscli@google.com, sashiko-bot@kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v2] dma-buf: Split sgl into page-aligned 2G chunks
Message-ID: <20260630123849.GC7525@ziepe.ca>
References: <20260621222130.1667453-1-xuehaohu@google.com>
 <20260623015459.1153884-1-xuehaohu@google.com>
 <20260623094446.4a8fc2ed@pumpkin>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260623094446.4a8fc2ed@pumpkin>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64];
	R_DKIM_ALLOW(-0.20)[ziepe.ca:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-66084-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:david.laight.linux@gmail.com,m:xuehaohu@google.com,m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:nicolinc@nvidia.com,m:leon@kernel.org,m:kevin.tian@intel.com,m:ankita@nvidia.com,m:alex@shazbot.org,m:linux-media@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linaro-mm-sig@lists.linaro.org,m:linux-kernel@vger.kernel.org,m:iommu@lists.linux.dev,m:jmoroni@google.com,m:praan@google.com,m:kpberry@google.com,m:chriscli@google.com,m:sashiko-bot@kernel.org,m:stable@vger.kernel.org,m:davidlaightlinux@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[jgg@ziepe.ca,linux-media@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[20];
	DMARC_NA(0.00)[ziepe.ca];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[ziepe.ca:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jgg@ziepe.ca,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DDF086E4493

On Tue, Jun 23, 2026 at 09:44:46AM +0100, David Laight wrote:
> On Tue, 23 Jun 2026 01:54:59 +0000
> David Hu <xuehaohu@google.com> wrote:
> 
> > Currently, `fill_sg_entry()` splits the scatterlist using `UINT_MAX`.
> > This creates a non-page-aligned DMA length (`0xFFFFFFFF`) for the
> > first entry, resulting in non-page-aligned DMA addresses for all
> > subsequent entries.
> 
> There is a separate issue of whether this code is even needed at all.
> Where can transfers over 2G (never mind 4G) actually come from.

This is DMABUF land, you really can alocate DMABUFS of huge amounts of
physical memory, VFIO does this reliably and trivially for example. It
wouldn't come from the physical allocator.

So yes, these scenarios need to work in this code.

Jason

