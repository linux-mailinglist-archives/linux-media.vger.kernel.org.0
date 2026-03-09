Return-Path: <linux-media+bounces-54953-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0EFhCvnHrmlwIwIAu9opvQ
	(envelope-from <linux-media+bounces-54953-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 09 Mar 2026 14:15:37 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B17A239898
	for <lists+linux-media@lfdr.de>; Mon, 09 Mar 2026 14:15:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8A60E300A7F4
	for <lists+linux-media@lfdr.de>; Mon,  9 Mar 2026 13:15:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8084D3BED0D;
	Mon,  9 Mar 2026 13:15:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="kr40yCgb"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD5BF3AE71F
	for <linux-media@vger.kernel.org>; Mon,  9 Mar 2026 13:15:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773062134; cv=none; b=TUOuSoyN4aXLuP5IZ+v9IilmlFRDTmI/OSsqA66YUBdbNMgowxEUaasRfUZ4nfPfFmjUT3esLvBKwqQbf2GpzYSb7wFhUsddRtozbW5/LdGQoJtzQZkcMG5pCmSsltoM4m+89ZI1n0WdksnpNvKBQOcWFiwWHkZ5+YhS/nBNEzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773062134; c=relaxed/simple;
	bh=UbKRPGurvkeEylighvGv7GG2XxMvDn6WSSd9/y7ODUc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aXt/6R/mmFSTlRIgaiPA4Jx1oJpziJUR/UBsS+Vu/CYZ0qlgdvjYiO90gRP7pptzcCU4qZ3JGTdo9MYVdpq5VmAeb7yaPL41UtSKA+yXDTiUBY0VDopZbxZnRX2hC0OU5iIuWVxCYNXM+NGp5KUZZcDimJvkc+3WzaiPKrL2qPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=kr40yCgb; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-8cd858e860aso143407085a.2
        for <linux-media@vger.kernel.org>; Mon, 09 Mar 2026 06:15:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1773062131; x=1773666931; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JEXl2Wcr1hEZjBx3v2qoobpIKwPw4w6oHEBSBd3/8YI=;
        b=kr40yCgbOrB3CaoKU2p4YD73fdYL1XaOfOAmnjv83ohEqJsQ8pxQn2z3TWvQNTgq3j
         IGq7ry4onXORnN0UWcLq0m6jg/0raYkRJb4dkBk+VzlhFDxX45cUyOgc2jUDGxAtRWPX
         ktXdDMtHgE5+iweUMQ1BoCdNlX1SpNIKqMltGV/LDPYnWcE4IMmPJi+bxbNl57TJbfJY
         NhQPc9iCpWiFkyPbBW7gw25sAtKMNqK1tKQVww98tn8odywQAiBZyO2tAT6C2jNqQ8+i
         Yoa0R9Ju0ffXK697hluQB4VNHaSAGH+Y+kCwRI26ebq4Pzj7U/RUhtixLCMlZELwppBg
         6qLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773062131; x=1773666931;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JEXl2Wcr1hEZjBx3v2qoobpIKwPw4w6oHEBSBd3/8YI=;
        b=KV0H8MV6GZ5n4cB8QtcSmxBIf7kGBDbYBVszJyYEHD0YhzTv2IL+5c9YVLBHZWL7o8
         v54yJD44LjDh7gNzuc5e23ZcN10ymFuwSyPbRxaJk7ZUYpuDH7BLsUMaJO7hnbk1onpH
         dbZR1WjWGIZgN+bD2wyiVlxtayZ6N/y+Kntm4orsRXWNbvGfEy0b49dit/5JfwaLFlf8
         BwnUg/i7ip8Z1vBoRncFnpNWneyGjBdIzvv3K6+pqET0YQEmX65/BG5H2c7Q4ht19ABH
         edgsZmTO30rClj3oxLRh7TMHLBEcSrFgEZDXPJTqmqMhBlS9Z/iq0Ch+UkeI+P2vKrXN
         5iWA==
X-Forwarded-Encrypted: i=1; AJvYcCUmFPWo4bWYqWUmCKMll0QEuJLTRbsJMyjNiFnLBwAJKHrnu1c/RZszMsiro60+xh+6/CCk+P7Q7TaCsA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzgSyPh42QSI+0JcZoNgJa15nnAOIr1QOz+xfgPvqnGqlp8JwBQ
	dZmaZjthTzrP5n+ehZnf8OwTRP9MksFQosDna8ClpdcBUrl9bxVM9q1Sn4z21FsLcUw=
X-Gm-Gg: ATEYQzxu+aWA2XwbaNuPEKtCak4VmyJDm+SxKQYjmBz23jk//L5t5jSPVv++Gkyrkct
	iNEURn+0pJIB0bENzjXNwTdgxStmUWz9Wz/4l/JSDVpxszMI31zCN9xmfdgZQglar18/F2fg3BB
	NVHwCWAf4DTcwd437Wqr9AOodyZ7hib4DJnHv7YfaVoamnunyVGnzEhMxIWgYMz7BL2GeNjt33I
	3KexVjxz61FeXiYdEOuZtK5Tw6B9xvG5xWmifXa61JE9EBtxM7R7/V72ftgAGgHmRzDWe8L7WXd
	Ed/1Bn5+4EqSsadd7URLGdNWP+EGP+KZPuK0yKohLVl6xfK2bSVelMq/h1rrAhvXIekbhI95rYd
	6DPcFcd3GatHAS3p52Ru3lh7FVEWeUsb6T4//KXadVzUgSFX58wBa8W5pdBU1OB3ZEcYYX7BBnp
	DpMvv5JgGcVFuJ8DxRyvOj85KqXJdQ0gu6RIEJtcZxzoAeM0UNtbIs4f1REmQfi3zgWiG9VfIMA
	k8paA4N
X-Received: by 2002:a05:620a:4381:b0:8cd:76fa:1be1 with SMTP id af79cd13be357-8cd76fa1ff3mr1023224185a.14.1773062131558;
        Mon, 09 Mar 2026 06:15:31 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-162-112-119.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.162.112.119])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cd7e857037sm378431585a.20.2026.03.09.06.15.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 06:15:31 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1vzaSI-0000000G6JW-1RIq;
	Mon, 09 Mar 2026 10:15:30 -0300
Date: Mon, 9 Mar 2026 10:15:30 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Leon Romanovsky <leon@kernel.org>
Cc: Jiri Pirko <jiri@resnulli.us>, dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org, iommu@lists.linux.dev,
	linux-media@vger.kernel.org, sumit.semwal@linaro.org,
	benjamin.gaignard@collabora.com, Brian.Starkey@arm.com,
	jstultz@google.com, tjmercier@google.com, christian.koenig@amd.com,
	m.szyprowski@samsung.com, robin.murphy@arm.com,
	sean.anderson@linux.dev, ptesarik@suse.com, catalin.marinas@arm.com,
	aneesh.kumar@kernel.org, suzuki.poulose@arm.com,
	steven.price@arm.com, thomas.lendacky@amd.com, john.allen@amd.com,
	ashish.kalra@amd.com, suravee.suthikulpanit@amd.com,
	linux-coco@lists.linux.dev
Subject: Re: [PATCH net-next v3 1/2] dma-mapping: introduce
 DMA_ATTR_CC_DECRYPTED for pre-decrypted memory
Message-ID: <20260309131530.GJ1687929@ziepe.ca>
References: <20260305123641.164164-1-jiri@resnulli.us>
 <20260305123641.164164-2-jiri@resnulli.us>
 <20260308101948.GO12611@unreal>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260308101948.GO12611@unreal>
X-Rspamd-Queue-Id: 9B17A239898
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[ziepe.ca:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-54953-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[ziepe.ca:+];
	DMARC_NA(0.00)[ziepe.ca];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jgg@ziepe.ca,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-0.948];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Sun, Mar 08, 2026 at 12:19:48PM +0200, Leon Romanovsky wrote:

> > +/*
> > + * DMA_ATTR_CC_DECRYPTED: Indicates memory that has been explicitly decrypted
> > + * (shared) for confidential computing guests. The caller must have
> > + * called set_memory_decrypted(). A struct page is required.
> > + */
> > +#define DMA_ATTR_CC_DECRYPTED	(1UL << 12)
> 
> While adding the new attribute is fine, I would expect additional checks in
> dma_map_phys() to ensure the attribute cannot be misused. For example,
> WARN_ON(attrs & (DMA_ATTR_CC_DECRYPTED | DMA_ATTR_MMIO)), along with a check
> that we are taking the direct path only.

DECRYPYED and MMIO is something that needs to work, VFIO (inside a
TVM) should be using that combination.

Jason

