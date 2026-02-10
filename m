Return-Path: <linux-media+bounces-52516-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QFaNIhkoi2m6QQAAu9opvQ
	(envelope-from <linux-media+bounces-52516-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 10 Feb 2026 13:44:09 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 04C3211AF7B
	for <lists+linux-media@lfdr.de>; Tue, 10 Feb 2026 13:44:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3F83B303F445
	for <lists+linux-media@lfdr.de>; Tue, 10 Feb 2026 12:44:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71E781F8691;
	Tue, 10 Feb 2026 12:44:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="PuHYRDAI"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC79C1DF261
	for <linux-media@vger.kernel.org>; Tue, 10 Feb 2026 12:43:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770727440; cv=none; b=Fi4Oa3C+9RNgWbcigoDH27wOEPI7l5wnOL7sHT1ChF841n6k0IRPfLDs9rkB9oY5pyYybvdMu9FJMQLfoF0dNOhOBA9/CSL6SKjX4K+oJ01uNW+rwFTiQP8VbHLwasThhq1Cx++FJzEsDimtCPu21DYGiiM6LvTsIa6P1A1pEMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770727440; c=relaxed/simple;
	bh=xonj/+koAdun2zKMmTEgycmII1nNMKC1m2Fb9Sy9enE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kD0J/CrcXhekQPVWkw8FWtIWf1qZNSplA1dIO/2Bb43YxwF3QFE31UITnqFewsd0c3p/HMPAdyicAMXJ8jNqteux6o7KLMmu60Gv3sKvK6g0jZeg8swI+xFUiYqL7q26X3iUVv44/bD2VMx0Cue/CbhJTMzH6fGxL9KlUjdkGVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=PuHYRDAI; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-8c710439535so56230585a.1
        for <linux-media@vger.kernel.org>; Tue, 10 Feb 2026 04:43:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1770727438; x=1771332238; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=N5ebXMgdbEnP2n7MqO77VYCN9M2l8thAEykxr97Y/HU=;
        b=PuHYRDAIYNAfidUctJhrrrZq5wFqvXYZUV+LjsIAKEyFQp7bqXDm63P1lFmluvQ+cx
         z0mbchOwVqAkPOiGCK6KH3F9eWpgfM5qefXNP1I/AsrbPuK2Iixo5FEWBkO1W6x3V0Sa
         WSqQFFevDzwB/Vnc2jTESz652KOPSgM80Qmo+WwAOIiu+g64vBOypF6KYiCJjyyFvKRV
         yt8jm6k7aDCTBRw027junEYnUwBPJkq4EYbAJpBmDBFQLlWgxmXNerCdqaRWECcGNUhu
         +k1EiqFVh/gdBheRcdb2u9eFVUjFczZekCzbu4Vw6fCDR9eihqZeBdonmDfsAFiAsgNs
         X7/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770727438; x=1771332238;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N5ebXMgdbEnP2n7MqO77VYCN9M2l8thAEykxr97Y/HU=;
        b=Z7TGCwNdZDcWro2N7yles8SYkOS1K3CnVMiG3lA8cBmCac+zPYi+oZT/yhixzNH+Hp
         WuRRNEZ1o+OTwsFPpBVL0ASV9s0dlFzzflyl5Hg2nc/XL77rHH9peauFzvhG7USlZQ5S
         zny28QztI2miRI4RPlRkBiwMnotPXSSQlCpnhwRNxlLNUuLPRXD3IXAJ/p88jwAffzov
         AMxTOrsQagfc/zJyKtEM2Ftt4nrO8uNmcKRv0Y9Qyn5PGQxqJwqKfjPpuaPTsLFplGA7
         8llid31D2PiUXLQ3kCj/4vGg7SMfELzeYEFdO0nT7TxnWzRIx+mQVXqmP50V8YsD/lwo
         1jCg==
X-Forwarded-Encrypted: i=1; AJvYcCWPaWanb+xZl7Fzz3AvoCN+Twiuk3B2/rhVqFykrhatF+3YDh6iZa3gKNcND6EKIz0STOmxthRJoZ1MGA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxeFIdkqkfZK8fNXhkhMjwg1ugwvq62TRkaehj83POJF7L+muxf
	nKJ+nFZyGHBIlQSChh513Fi6+p+cbVTZGx2o0ZKzBFSreCPRO+pudQzcK/QvHBqWNfg=
X-Gm-Gg: AZuq6aI2ZLSDmraixhvfs9GQy94ZEqngXq6nYYLCNhJmUsc6ph/V8FmHa1T09MRlgtc
	Lz9XSeqR0v6n33aiK8pYTn1+LZc6z4pmBeHzBVFXDNVbwQn3vlkDP+e1pkJQA6yRP7N2N43OiLd
	+ZfuV/yMcIrRRrgD2VBQ9jHruk2XLP6ZU1vQG2/k4zr8ugCfAlmXPCMZIDYMA9JstgHf9F/TFei
	XpXK3nMikjQWm4aeAEc9+L+hfNK7dD0cbByx2A7+Ss2oBfCOkmczZ5jFjMCIGuIiCZVXyr+6qlF
	izky+8TUQPMPTk7RYrajRJUxMSDZuhzkPwCpUcmANkQDdIsAOm43K/tz74tEWlIuJRV6vki4y0x
	YMwKcr9XDvt8MgpJhWX9g86G8mu3ik/nxTYFTtHy9wbR5bGXrvbkr+TPPHtWVPcQezKUQd/NP8f
	ivbWWYNsnmxQggeg0LxJI1u4suFXrXX4irKtJGcFKOLg2ifoJw2HmYQPug8Kmb7DbOLSjqE5hFm
	ozc/XA=
X-Received: by 2002:a05:620a:40c7:b0:8ca:55:ac60 with SMTP id af79cd13be357-8caf16ec83amr1829777785a.78.1770727438524;
        Tue, 10 Feb 2026 04:43:58 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-142-162-112-119.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.162.112.119])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8caf9ee8593sm1019180385a.36.2026.02.10.04.43.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 04:43:57 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1vpn5x-0000000315A-13dh;
	Tue, 10 Feb 2026 08:43:57 -0400
Date: Tue, 10 Feb 2026 08:43:57 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Jiri Pirko <jiri@resnulli.us>
Cc: John Stultz <jstultz@google.com>, dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org, iommu@lists.linux.dev,
	linux-media@vger.kernel.org, sumit.semwal@linaro.org,
	benjamin.gaignard@collabora.com, Brian.Starkey@arm.com,
	tjmercier@google.com, christian.koenig@amd.com,
	m.szyprowski@samsung.com, robin.murphy@arm.com, leon@kernel.org,
	sean.anderson@linux.dev, ptesarik@suse.com, catalin.marinas@arm.com,
	aneesh.kumar@kernel.org, suzuki.poulose@arm.com,
	steven.price@arm.com, thomas.lendacky@amd.com, john.allen@amd.com,
	ashish.kalra@amd.com, suravee.suthikulpanit@amd.com,
	linux-coco@lists.linux.dev
Subject: Re: [PATCH 4/5] dma-buf: heaps: allow heap to specify valid heap
 flags
Message-ID: <20260210124357.GD943673@ziepe.ca>
References: <20260209153809.250835-1-jiri@resnulli.us>
 <20260209153809.250835-5-jiri@resnulli.us>
 <CANDhNCoHEZsNRmU+3z5AbeAy05H7PTtUdTq1apNd5k0f9hWW8A@mail.gmail.com>
 <20260210002927.GC943673@ziepe.ca>
 <tgvdjszwxggr53digbmddcbxvupzl4xcoprofkgrs2kgf6rknx@44ebljjpghjm>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tgvdjszwxggr53digbmddcbxvupzl4xcoprofkgrs2kgf6rknx@44ebljjpghjm>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_ALLOW(-0.20)[ziepe.ca:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-52516-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[ziepe.ca];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[ziepe.ca:+];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jgg@ziepe.ca,linux-media@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 04C3211AF7B
X-Rspamd-Action: no action

On Tue, Feb 10, 2026 at 10:14:08AM +0100, Jiri Pirko wrote:

> >I'd advocate that the right design is for userspace to positively
> >signal via this flag that it wants/accepts shared memory and without
> >the flag shared memory should never be returned.
> 
> We can have the same behaviour with the separate heap, can't we?
> Userpace positively signals it wants/accepts the shared memory by
> choosing "system_cc_decrypted" heap name.

So what do the other heap names do? Always private? Do you ever get
heaps that are unknowably private or shared (eg MMIO backed?)

Jason

