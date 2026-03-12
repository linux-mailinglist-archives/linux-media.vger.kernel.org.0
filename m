Return-Path: <linux-media+bounces-55490-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gBXxFDassmkjOwAAu9opvQ
	(envelope-from <linux-media+bounces-55490-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 12 Mar 2026 13:06:14 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BC98F27168B
	for <lists+linux-media@lfdr.de>; Thu, 12 Mar 2026 13:06:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3901B30312ED
	for <lists+linux-media@lfdr.de>; Thu, 12 Mar 2026 12:06:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5497134A775;
	Thu, 12 Mar 2026 12:06:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="lj4yrvSK"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CECD1DE2B4
	for <linux-media@vger.kernel.org>; Thu, 12 Mar 2026 12:06:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773317170; cv=none; b=hDELa+L+dOBuOTSb8TgyzM9URbBUM7ncQmDiyx0NYkhmSHSlNbBenb7yrouAbyjZYdgSy/NGT3ni/M1weo6JQXJVIgZ2mPPcrPsTUGUnkoF3vPdVWHlgerSOvuhqVNkugj8fTz5M279SWf/5xZVPdOqiFqlzYEKtfDJKELS2jIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773317170; c=relaxed/simple;
	bh=pLE9KQjABbXYq0V8sOoF2HYf/JGl7DSdVHj+w9thxVk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=THBb+EM2jyhquG4CTks7/21F/5vxOvDG7yqLkZ40ktZzRLv4YE700/f/MuaIdX3MOY02e4B63tBb81aEg7RzDUG6NbYssAT7NaY1gG3I/kUupX/3ifaqIpU9aMzRZYotGO2/5DyhwieHb5hJxBE/aeLhKN6LNiu2xA/AtuN4OzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=lj4yrvSK; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-8cd767d2d70so99799985a.3
        for <linux-media@vger.kernel.org>; Thu, 12 Mar 2026 05:06:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1773317168; x=1773921968; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Pw97G/mFXVE/FuLAkp3lotBvQF2JekIeUS8x5bLQ+LE=;
        b=lj4yrvSKfZ3JtwmVQuVPSYIRzJ8XCSphz3oeOZcQUOYha1N5jfwt86k2T5qnGdLgmi
         7dDgCKGdzBLhRTvgQhpqr4evYMlYHCQcrA3aNhflgyI1veMipw52vNhq9fkZbt7lOfp1
         nFGr8Qb6jQiWpBqf71mJdklV1rL8o/PqF8qgURMoWn8+WlbqOi6cUhHXw/4VYr0pJ9TU
         cKPJTk/CNB4jjQLIw/m56tQOKgznmHNNYjeC8j51ncHc9NqjP/da92yQBSJmWmDUnvvw
         7MgNBmrVa1shihl9ev2YxHt5iJr+3DxGvbCvqNNOPQtovWW0YuopaYl9SryfWqje0gX3
         G9cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773317168; x=1773921968;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Pw97G/mFXVE/FuLAkp3lotBvQF2JekIeUS8x5bLQ+LE=;
        b=L9OH3Yg1UBVULi+H9rNwaxc+PuLQ31wsKgiM9HgDVDzh1iHDSYq1et7Ypsdea9/KtT
         JN11Ajf5zDQuInKtalcvrlPN1QN5w/iKOzSBHIAIh5lPItnVRaKteXftsDmqANiPOZhJ
         ItxzU7fxyIyEh6WbGkz7/YBpCkF0M/Z2PoPeA+7nRE1EcnnLrVvldEsOEnxbosv84pmr
         SyEvFHkJts5JauzAQsJyJKULgCRhRtF0PHeMmNo50d8lCO3F+vsng63LOmU7PrnAG79h
         SidP1ogI3QsSOJvGclj/r1krsYd2+AZ2cy+w/Ccs4bscbC3dl6yCR1M0E5BfL44n32oU
         zmKA==
X-Forwarded-Encrypted: i=1; AJvYcCVGuMaugQy5Pes0PfAVPeSextf4w6NAQzI2UntitwQEq31NhIBMQY/GYwS1QJ23Jk6TWdxbFeCWO9u/mg==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywx6gc73Wa8F3636tIAsAsToiNm31YIQEwKrcgSGU8Bh4OMoNRe
	FBEcQ85a/mwvXlffL1J4EyvOQk+rgl+ThsQxYKAUzGOEUtFotD6HoEirtaGFmcoI4B0=
X-Gm-Gg: ATEYQzwINIUyA31AQRv9xsc7gBfL/atV13SJqTJy7wlBiRkpD1odcERXXn5wSW75k7n
	Rt82Et69oM8azyF87DpeXZMnQGxpZno0Qs/Zs+p2wC0JLyegGX5fXbH6pJkc2BbLhW2rIP+zrmL
	n5Dr1Z0a8F04XEtTgKHBtxa8ZPAD0h2uJ8gsVZV+kadoK+bLubx8ak+vbW9+XFi20I4B2egVOUo
	FrlAssopjNp/P6GBvEHl9bWn4iNOgZeMFKf5lr2LSjSRL+l/hf0PeXRX3F3kUFKXOLWBqkBJecn
	PHqz5RZtnYLa2s4Z2mS3/s0ovWBFO8U8rk0ldaERMlz4vIckWA8WFn6I+VjIAWty+VZ0SQ1okDW
	S6t/wkaixnYc/V2RhXX5YDCrcU+YOAoJGGlFdbeXzuGk93NvsReOvzC2/9NlBGj358sJGa9Hsq7
	cgVn9CbOhCN3/x+CdJvrxY4jftCGgn4F4026/DV9aKZo5b0z0qjGZX2yrtm59CsGj1MiUy9gU56
	07Iufbo
X-Received: by 2002:a05:620a:4e93:b0:8cd:a4d8:cd8d with SMTP id af79cd13be357-8cda4d8d254mr527718485a.14.1773317168272;
        Thu, 12 Mar 2026 05:06:08 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-162-112-119.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.162.112.119])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cda1fbcd23sm361027485a.1.2026.03.12.05.06.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 05:06:07 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1w0enm-00000006ejP-0ZCe;
	Thu, 12 Mar 2026 09:06:06 -0300
Date: Thu, 12 Mar 2026 09:06:06 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Jiri Pirko <jiri@resnulli.us>
Cc: Leon Romanovsky <leon@kernel.org>, dri-devel@lists.freedesktop.org,
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
Message-ID: <20260312120606.GC1469476@ziepe.ca>
References: <20260305123641.164164-1-jiri@resnulli.us>
 <20260305123641.164164-2-jiri@resnulli.us>
 <20260308101948.GO12611@unreal>
 <20260309131530.GJ1687929@ziepe.ca>
 <20260309140233.GW12611@unreal>
 <20260309151857.GO1687929@ziepe.ca>
 <phry3e2dtgxzxdqvrnqfuskangp4al64f2auithwme5kwkgepe@7qtftrhgv4l7>
 <20260312003408.GA1469476@ziepe.ca>
 <pmfxzgtazwa7fwz4mx53htdg4jjifwyq3gyzwklc45affy3xrp@57hxan4pqnkx>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <pmfxzgtazwa7fwz4mx53htdg4jjifwyq3gyzwklc45affy3xrp@57hxan4pqnkx>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[ziepe.ca:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55490-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,ziepe.ca:dkim,ziepe.ca:mid]
X-Rspamd-Queue-Id: BC98F27168B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 12, 2026 at 10:03:37AM +0100, Jiri Pirko wrote:
> >Alot of device MMIO is decrypted by nature and can't be encrypted, so
> >you'd have to use both flags. eg in VFIO we'd want to do this.
> 
> Why both flags? Why MMIO flag is not enough? You still want to hit
> "if (attrs & DMA_ATTR_MMIO) {" path, don't you?

Because we will eventually have both decrypted and encrypted MMIO.

> I mean, CC_DECRYPTED says the memory to be mapped was explicitly
> decrypted before the call. MMIO was not explicitly decrypted, it is
> decrypted by definition. For me that does not fit the CC_DECRYPTED
> semantics.

I would say CC_DECRYPTED means that pgprot_decrypted must be used to
form a PTE, and !CC_DECRYPTED means that pgprot_encrypted() was used

This flag should someday flow down into the vIOMMU driver and set the
corresponding C bit the IOPTE (for AMD) exactly as the pgprot does.

Less about set_memory_encrypted as that is only for DRAM.

Jason

