Return-Path: <linux-media+bounces-59214-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8O+1IwVq52ke8AEAu9opvQ
	(envelope-from <linux-media+bounces-59214-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 21 Apr 2026 14:13:57 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EDE2943A7D1
	for <lists+linux-media@lfdr.de>; Tue, 21 Apr 2026 14:13:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 65ACF3032F42
	for <lists+linux-media@lfdr.de>; Tue, 21 Apr 2026 12:10:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0ACA3A9DAB;
	Tue, 21 Apr 2026 12:10:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="DzpsIoD8"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C5783451C8
	for <linux-media@vger.kernel.org>; Tue, 21 Apr 2026 12:10:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776773408; cv=none; b=RQARlBVr1L+5+QMnJuXBUEvtEgT+75/U+1kAe2JjRSBPOxvKjoBeu9TTyIysd7sr3XY7zBM4BsSReujgp4CqmMmB200EdXf8JTqA7IT0z5Ewvig85nfkG0prYOwsxusPV+ifl4ft9FfcK9IBze108REdbXesavlsgelbqRESh6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776773408; c=relaxed/simple;
	bh=XbKdlZH8Wn5Q2Gv7aa3pDFxSc1M2qfNLzzDFE8v4jqo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nSbH85dYQBqt/0usGiFeJxFq4gqBAtrs9UR8WVnksrdmHs4kxssWnNj07aaoCODjnNy4yq2Th80T5CBcWNOWsUPFAM+SRtPLRfW+FeZ2fyi40a3HPInFtjkyYR3Z2I6B7giXwzfi1S/NixMQyZbG/bbtfuamAUeGb0WocVWotXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=DzpsIoD8; arc=none smtp.client-ip=74.125.82.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-12c7212836bso10854245c88.0
        for <linux-media@vger.kernel.org>; Tue, 21 Apr 2026 05:10:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1776773406; x=1777378206; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HpS1oVTR3rIZCafWVa+4FbkfcJKXjhWy8xb1rynP1OU=;
        b=DzpsIoD8/M4qKwIMr5W+i0ydLNPvu1gZSlNjH0qksznwQ46MmDnPScTPC6PW2te0qm
         MwSImABCeFOexqJQdF5JTb1psDiSFManlz8D/p2hwSGwvq9nsoDMJGsPtoWpH1/J4H0B
         6LoOjdpFvOKDqSvut+qTfgSikZCC2A6lRTW0A83KWgbJXskhi33n+9pHsAhy/lxSbmRp
         jy98qJvjNdzsJajTLvC+pyB8pbPYv175rW9VbL4XXd/qGH8DKrVdJT2sFxImf692Yulj
         d/v+WozuCoYOcw/hTtQTcqHjK/ztxldgbE5C5nSK5XQ7nBVFsAGCjvNuUkO9yzGNdlGL
         8Qug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776773406; x=1777378206;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HpS1oVTR3rIZCafWVa+4FbkfcJKXjhWy8xb1rynP1OU=;
        b=gNq3zDSm7RXZbqi/ZVvQfrFdXs2JvAqGx7Iq8j/HEutfVLGEZ+jS1v+ICEmgkakhSL
         tCbP9O4/os+ZZsH9iyNusWtVQoHoppI8utu8Xeuhli6UeVw2ukDLpCtsElqvGfb6hhvx
         R+QmG5UImLgy35bl1T6w3ZFQ9kjCnmoGWjMr/dKSb89dpPJTqG1I7Ay/KN/0bw2hn66P
         EJnZ7aiqKXWB8BeOSHG+U52LnYWp0ja38WtthtUuDgSTC8Fdnf7wvM3KiA32RRCAIYp4
         IrjXAlfZif23InkFmep7ejrSCpUxRBjdWEwpCAsCZru7kRILmcjdgAilhn/9SzXoVu4E
         LeGg==
X-Forwarded-Encrypted: i=1; AFNElJ/n9ImIwnGdsSZnQ9kTwafkbkxFKGNN/Fx/PX78ay1tW75pmvgCd3WfQIUwUV+Q1czwKs0Sl/HpRl2M+Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxlrznZY6yqzD6zYF5CGcXXoOOQMgVBNuxRM2ivNFFotk6IFYvD
	5TGsT/36l5IMJrOEbnQNNs8kbCsL1/I0haM5MWduR+ZDGS4a+ZIQrZVyYhm9yRncNSw=
X-Gm-Gg: AeBDievYSBUAoFd6pnQRPIG2hGW/TL46tkLtEpw2oTiCoF9ciuCnNGxgpGm+813nvab
	DEnYER2A9kprsnrDpR6swGTWigxrZjsFRt5sG5kT2n3GkWPbyLYquJvTaOULSQ8mDgGI2WcRmmu
	mU2FJy4fxLeU6Woa1QuNOeAukVNEIt6BkxmL2TQDNNWVfX6ePfMaPWcYKHDtwmFkDBOlENTVgqZ
	MI+k3JZYpl/vzRKnPGgCw/cmgdHpo8kY9/Pyzef2/xTgEf1qq3+9jbSUM0eEDswlJIa+wHgQR45
	uu730il8Txk7td1z426JlevdBckT7OqMx6RAjVo9rBgZsmGIkV5iDnwNZQgaurH44FvhC2ws9y+
	ByD0WU2PXKZDLE8E+zwLP/hs9WuunKVVBHbYPo65jio/rYNv1Kbyy1vr82asIisZti2i2N7YVNM
	q5zWYNFl4/x0qt1EKT1LQ=
X-Received: by 2002:a05:7022:ff45:b0:128:ca6f:adf2 with SMTP id a92af1059eb24-12c73fae276mr12134183c88.32.1776773406031;
        Tue, 21 Apr 2026 05:10:06 -0700 (PDT)
Received: from ziepe.ca ([130.41.10.202])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c74a2ac32sm19260013c88.15.2026.04.21.05.10.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 05:10:05 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wF9vY-00000001ErI-0ePf;
	Tue, 21 Apr 2026 09:10:04 -0300
Date: Tue, 21 Apr 2026 09:10:04 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Jiri Pirko <jiri@resnulli.us>
Cc: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
	iommu@lists.linux.dev, linux-media@vger.kernel.org,
	sumit.semwal@linaro.org, benjamin.gaignard@collabora.com,
	Brian.Starkey@arm.com, jstultz@google.com, tjmercier@google.com,
	christian.koenig@amd.com, m.szyprowski@samsung.com,
	robin.murphy@arm.com, leon@kernel.org, sean.anderson@linux.dev,
	ptesarik@suse.com, catalin.marinas@arm.com, suzuki.poulose@arm.com,
	steven.price@arm.com, thomas.lendacky@amd.com, john.allen@amd.com,
	ashish.kalra@amd.com, suravee.suthikulpanit@amd.com,
	linux-coco@lists.linux.dev
Subject: Re: [PATCH v5 1/2] dma-mapping: introduce DMA_ATTR_CC_SHARED for
 shared memory
Message-ID: <20260421121004.GA3611611@ziepe.ca>
References: <20260325192352.437608-1-jiri@resnulli.us>
 <20260325192352.437608-2-jiri@resnulli.us>
 <yq5atst6ywbl.fsf@kernel.org>
 <4qdizkkoeke3cvkcf35upa7p7ick6s654eqlrizmi7ozkw5eze@tnpk2e34xgwl>
 <yq5awly0d504.fsf@kernel.org>
 <tteiecxfqy4k24wnzvp6ocxnuopyhmqtne2xwh5htwldlbzjnp@o6cbzdlurxld>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tteiecxfqy4k24wnzvp6ocxnuopyhmqtne2xwh5htwldlbzjnp@o6cbzdlurxld>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[ziepe.ca:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-59214-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ziepe.ca:dkim,ziepe.ca:mid]
X-Rspamd-Queue-Id: EDE2943A7D1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Apr 21, 2026 at 01:53:31PM +0200, Jiri Pirko wrote:
> >> You reach there when is_swiotlb_force_bounce(dev) is true and
> >> DMA_ATTR_CC_SHARED is set. What am I missing?
> >>
> >
> >So a swiotlb_force_bounce will not use swiotlb bouncing if
> >DMA_ATTR_CC_SHARED is set ? 
> 
> Correct. Bouncing does not make sense in this case, as shared memory is
> already being mapped.

It is a little bit mangled, there are many reasons force_swiotlb can
be set, but we loose them as it flows through - swiotlb_init()
just has a simple SWIOTLB_FORCE

Ideally DMA_ATTR_CC_SHARED would skip swiotlb only if it is being
selected for CC reasons. For instance if you have the swiotlb force
command line parameter I would still expect it bounce shared memory.

Arguably I think this arch flow is misdesigned, the
is_swiotlb_force_bounce() should not be used for CC. dma_capable() is
the correct API to check if the device can DMA to the presented
address, and it will trigger swiotlb_map() just the same without
creating this gap.

Jason

