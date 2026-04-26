Return-Path: <linux-media+bounces-59630-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4LiCJakN7mmUqQAAu9opvQ
	(envelope-from <linux-media+bounces-59630-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 26 Apr 2026 15:05:45 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 162A6469E31
	for <lists+linux-media@lfdr.de>; Sun, 26 Apr 2026 15:05:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B2FD6300F504
	for <lists+linux-media@lfdr.de>; Sun, 26 Apr 2026 13:05:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82C373612F3;
	Sun, 26 Apr 2026 13:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="d+p6voql"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com [209.85.217.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 949FD1F16B
	for <linux-media@vger.kernel.org>; Sun, 26 Apr 2026 13:05:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777208735; cv=none; b=QolhndBeu4dOahP8NjPFtKFDeli8g6U7+I4mRmX82/eTRhG8CR6dUe9PTxRmhQkbIwF7O7gG/j2q7WPehiDRi3tgFDsBUou2l5NGcUOOse+H0i/Zfdif4pGKSwf5UmZ2lyjGqsDTk8MmWb8bo5fz4fTnVyaO7Eygq7qKwEV9wXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777208735; c=relaxed/simple;
	bh=p372NUN8mpdPi0B1Wv7deQ9himnMrrfonWh6E7CqgbQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QkWRLUEu+JXUXjN6riVkuvylzLUfXr340H6CXPNMUbC4xPfos3GvNQLxltciE0x62EGUnQp/gIlkqqhjVKYp1WmjvO3LxAtGvHl+XEUN5Dhyo4qXJgmZiSsnFAPpXqtAnUwdNIo85dpOk1MEXDi70mvzF8BQKEqOVzaICK+PNVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=d+p6voql; arc=none smtp.client-ip=209.85.217.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-6221c7251d1so957404137.2
        for <linux-media@vger.kernel.org>; Sun, 26 Apr 2026 06:05:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1777208732; x=1777813532; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mZgLj8cyLE1pTCqai3ecepNuqq+WdEKm5C7L8MuPHFc=;
        b=d+p6voqlLZAsun413kAjxGc6JUCxZ4M2PWo28ZiWJ2kWxhdUSA39mYvdv+P4+PIEMb
         QlsxVLFmUynOfGihHaMm4lz0rq7QwcsBB3v7sNDsYPErP3DK2tTxndUt9VFC0mEfGvpu
         oj7EfN5Rfn2H5in0PbHgwlJfMgwe8Dt4BbNOHmwsFyKuHWeYvEfz5LnU8iQZ5/neX9o4
         GDQvahT79jo1o061xnBJ6e460iMssI/ZugG8IPThJGGdBaTgx9BbUx06ZXlWm/Hb0w3F
         ALQyg/9QS6Gc3Fyb8UUMVSEe6S0E34lbDnxfvO1aFYwMTBP5UBhJtipw1eB+1kW+YsAe
         dRmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777208732; x=1777813532;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mZgLj8cyLE1pTCqai3ecepNuqq+WdEKm5C7L8MuPHFc=;
        b=rNKc4i6RkDqVlFIYKp7qABUVMfVsdJ9zLd4IyG5fsacsjoF8HK54HUA12W7iVAXNeT
         zhW2V+wHXXN31YD0/6ZlsjCHmT+hxK1nEMh+66TLUg9VKgwP2AuKfcE+6FAvdHffzqo3
         6vQi0wPrYl4yO2gYmJdTI3zHrisicr0NEt+FOUJuuRFAuVx0CWavjpXEJWyA/oHteToR
         uOahNUToJqZ3f0XrNWTc04Z1QyLw/HZ9xPdq9U9G2IYm+BelR8mOBK6NUNu/7NLYYNzY
         t+sw8jCcr8TTTtdByNufjOUgSDrNN2GTp6IxGGtW3Uo/KGqjc3Ur4HCo8qP80vb28xKc
         WCyA==
X-Forwarded-Encrypted: i=1; AFNElJ+YsENZAWBube32s8UfUEqWsEk/CazSqTs4OJomL7UZTkdRELDNZNkm7sPENiWikABTxIFJpMrGdmYRyw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxhdsT5Gz8+TP4fDqkCaU7dwzdQzS7lAmVeLu+5Z1uHd/9yMRMP
	n7uqAiMiTXlc1gVNZpfmkG53VEoBJiPCwPeRsGe2DYh81iyHzghw/1OeXtTp0i+z/DE=
X-Gm-Gg: AeBDieuVRk+1au2Fn2YU/WrekOhbj6snXn96oZJ4jKFrZs3P45wmtmU9HmiPq1jQ75C
	PCL+dR1AL94+20L3idCWrJGAQS01/WuByPRkdeH3DiMwzBY4umuk3bybkPBIkEDsfcUSj6HdY4L
	5LUaL6r0bwH3eRNNcSZGDHYVCl2axsdvp2SfExv84mnsWp5to5zwy3+4LunsTGlJu+HYKn3GIKL
	+e5I5/jYig8Kvy92I4GVpRvCjLab6TQ89qz7cDBzTpMmqGQ+rGHXfoh5EtwOduU1xpPk0+a/RHs
	q3TF9xuytB+pM0nk7roW0RhRCJaUhU42K11r2bNxIisCGE/4BsoD9eMGYXiVW/NUePOwdCamdiu
	ktFukP4NQNOOwUKietNIcAkUDWkgq7JPJVIWL2U17JPzUmqnTxACHPIT/jPoToT9poMg2LzOdPM
	30HQtZPRs0GKWci7yAv9IRhVKaUTe2wChDpgc0E993VRVJcbODfVyYuk2eunGQ4WBDbM8z3w7IB
	UJI8QSTph42d7pN3ZCXMemCPFM=
X-Received: by 2002:a05:6102:5e94:b0:610:1239:f6d7 with SMTP id ada2fe7eead31-616f772efecmr18253527137.18.1777208732488;
        Sun, 26 Apr 2026 06:05:32 -0700 (PDT)
Received: from ziepe.ca (crbknf0213w-47-54-130-67.pppoe-dynamic.high-speed.nl.bellaliant.net. [47.54.130.67])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8b02ae7df88sm249063966d6.35.2026.04.26.06.05.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 06:05:31 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wGzAx-0000000Egs5-0CBA;
	Sun, 26 Apr 2026 10:05:31 -0300
Date: Sun, 26 Apr 2026 10:05:31 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
Cc: Jiri Pirko <jiri@resnulli.us>, dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org, iommu@lists.linux.dev,
	linux-media@vger.kernel.org, sumit.semwal@linaro.org,
	benjamin.gaignard@collabora.com, Brian.Starkey@arm.com,
	jstultz@google.com, tjmercier@google.com, christian.koenig@amd.com,
	m.szyprowski@samsung.com, robin.murphy@arm.com, leon@kernel.org,
	sean.anderson@linux.dev, ptesarik@suse.com, catalin.marinas@arm.com,
	suzuki.poulose@arm.com, steven.price@arm.com,
	thomas.lendacky@amd.com, john.allen@amd.com, ashish.kalra@amd.com,
	suravee.suthikulpanit@amd.com, linux-coco@lists.linux.dev
Subject: Re: [PATCH v5 1/2] dma-mapping: introduce DMA_ATTR_CC_SHARED for
 shared memory
Message-ID: <20260426130531.GF804026@ziepe.ca>
References: <20260325192352.437608-1-jiri@resnulli.us>
 <20260325192352.437608-2-jiri@resnulli.us>
 <yq5atst6ywbl.fsf@kernel.org>
 <4qdizkkoeke3cvkcf35upa7p7ick6s654eqlrizmi7ozkw5eze@tnpk2e34xgwl>
 <yq5awly0d504.fsf@kernel.org>
 <tteiecxfqy4k24wnzvp6ocxnuopyhmqtne2xwh5htwldlbzjnp@o6cbzdlurxld>
 <20260421121004.GA3611611@ziepe.ca>
 <yq5aik9jcpzm.fsf@kernel.org>
 <20260424225514.GE804026@ziepe.ca>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260424225514.GE804026@ziepe.ca>
X-Rspamd-Queue-Id: 162A6469E31
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[ziepe.ca:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-59630-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

> > static inline dma_addr_t dma_direct_map_phys(struct device *dev,
> > 		phys_addr_t phys, size_t size, enum dma_data_direction dir,
> > 		unsigned long attrs, bool flush)
> > {
> > 	dma_addr_t dma_addr;
> > 
> > 	if (is_swiotlb_force_bounce(dev)) {
> > 		if (attrs & (DMA_ATTR_MMIO | DMA_ATTR_REQUIRE_COHERENT))
> > 			return DMA_MAPPING_ERROR;
> > 
> > 		return swiotlb_map(dev, phys, size, dir, attrs);
> > 	}
> > 
> > 	if (attrs & DMA_ATTR_MMIO) {
> > 		dma_addr = phys;
> > 		if (unlikely(!dma_capable(dev, dma_addr, size, false, attrs)))
> > 			goto err_overflow;
> > 		goto dma_mapped;
> 
> I suspect P2P is probably broken on CC because this doesn't make
> sense..

Actually, I suppose it is fully broken because it will jump to swiotlb
and then should fail.

> This should flow into the
> phys_to_dma_unencrypted/phys_to_dma_encrypted block as well AFAICT, it
> shouldn't just assign phys. Assigning phys to dma on a CC system is
> always wrong, right?
> 
> It is is more like
> 
>         /* To be updated, callers should specify MMIO | CC_SHARED instead of
> 	   * implying it. */
>         if (attrs & DMA_ATTR_MMIO)
> 	   attrs |= DMA_ATTR_CC_SHARED;

So no need for this if, we can go directly to marking the MMIO callers
with DMA_ATTR_CC_SHARED once this is fixed for mmio:

>         if (attrs & DMA_ATTR_CC_SHARED) {
>  		dma_addr = phys_to_dma_unencrypted(dev, phys);
>  	} else {
>  		dma_addr = phys_to_dma_encrypted(dev, phys);
>  	}

Jasn

