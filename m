Return-Path: <linux-media+bounces-59292-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4BiRIGB/6GkILAIAu9opvQ
	(envelope-from <linux-media+bounces-59292-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 22 Apr 2026 09:57:20 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D654C443315
	for <lists+linux-media@lfdr.de>; Wed, 22 Apr 2026 09:57:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 92F7F304F239
	for <lists+linux-media@lfdr.de>; Wed, 22 Apr 2026 07:51:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D80B9374185;
	Wed, 22 Apr 2026 07:51:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Q5sGLwcG"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDCA4372B3D
	for <linux-media@vger.kernel.org>; Wed, 22 Apr 2026 07:51:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776844274; cv=none; b=irs61Mc9jR0Z2jIpg+3UP5vUF2tR6x5Xs+B4dB9hWCfgcfrHoiY0TpMIFDOSnzQCpognKC/uVqDz0T+1zr4pV+52TYUPwDPV8STL1QIJ8FkDuXV7OfUNOiY/PK7H4SmiXTNXfe8FhDp490RJDY0kKPUcDSIz3HrKB53sTno5soY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776844274; c=relaxed/simple;
	bh=eFM3fFc5Zl326sG07acTtNC+v1oI2aRgEXDFTR18mFY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Wv7RkrZXigYgDMjTzPS9Ler8aZg2kCF+4xAQHAvXLZlJdzZzAkPA0yZDvy2+fsok2B3M11imskzG7A4kADN9dPMgeGrQB1eDZBBj54aGQY6JyWuw/2D7FpifpadjUYBUVfW3jnnC/KskALBFoBYFlnX+dBOfcfSlIWWbt8MHr6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Q5sGLwcG; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-48371104ffdso6117705e9.1
        for <linux-media@vger.kernel.org>; Wed, 22 Apr 2026 00:51:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1776844271; x=1777449071; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JoRr8QDMIzfqgX7VNwrYeGw2tZtA7cdSKtjPSj3Z59k=;
        b=Q5sGLwcGY3n63ICUZ2XnR9+abATtJcleyHMahF15MQrMykZXW2NCbJEPIVPrRAqVXb
         4l8TxoqtWFRjP8x/6K9FNu2+R8b5BNWIX9PXPxEDK0GkRv+HtP+7ilG9Y7EDhB9qJd5B
         ENsbVduOY34DMi0OYHL8Fm5LJiC2MhxIm1uzA0gsu1vGHZOZcgxAeVyaemgRSv+4w4E4
         SLEEMYdtpF/5RkE0BEAY+8UuF9b8L6RJ78bSk20spGSIFEZ7HSb6hcGu7Y28ZG6fRBB+
         TDw3EU5RajZKfZPYTNDF6Z45T3k9xzjYnPIylOxLrqNsNcPR4Mqgzeh7SuVimy+7+jkL
         j12A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776844271; x=1777449071;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JoRr8QDMIzfqgX7VNwrYeGw2tZtA7cdSKtjPSj3Z59k=;
        b=g4DXCYbpSOu/0Um2/jApV5i92QwVQbV4TlBMuH+K+KTyYR+zoc1PLeiPnj9QyB7s+g
         iZnKtochofP50ldiftIyQ5UNDOn/TPzaJg8jiOZksAc4J4USR2Vq6DdmIu0XRzyRgZMR
         qxDA9P0po8NxGadptkCHuw90bHEoFzZI8HI6eHv3tVSfNQxxdivJuJdXN9Ah8o1BYxeb
         /fJK2ZAJ99lcfj5cROYKfGM3QWQVK3qqh7kCrVvXXgyhDk8T4kNTPYvx4zsnjSfRffFR
         A5ExriSjrwemQxS/sQ/bpjGxrZW6peQ4EGHn3f/164Dnel4hcxnlXd2jZP76CMK2zvm+
         iiCg==
X-Forwarded-Encrypted: i=1; AFNElJ+oP6T8yxRoANTnN/MKCSz3VPWyWVik1BWM9LtBJ6yp7NQ/Ggi0FvtFuMahpSE+X9cfvbaqjR234T0V+g==@vger.kernel.org
X-Gm-Message-State: AOJu0YxjNOneqZRV85or2M7TgQSfWOLzrgJTuf5E4oN7pGIhA+fPtIdJ
	i8XkzwlQ4xn4HbeOUIGASYJ7zJatCjNqcD4Ag4IwWix26RSB7/LwEjPqR1T/nM/moMD4xu41k0R
	MQ5+1WnI=
X-Gm-Gg: AeBDietDbPr7RQQ8iVGOQaFRd3i7nLfbOoIyhxJU0ZZEOjy/FnNabEcFLxOMaBi3DaF
	Ql6k+/7gjmYH9omQK0wg2VNSCwaeoZcIXU8QHieeJXKrxhFykBWJS1xOQBu//CqUG/KQH8YV+y/
	u34M1AlpdVo5cRt2ghJ34ezH4ID7GMASr1ZFkFA3VSiAoAm/SdygCVzsazF3zBhGoCKnBX0ZJ91
	b7gsfeXSfUjkVDCVGHOouEvW9F8gVvLttW8N1vc/pjPExaGpuFswPt7fikic6zdc3NfapKucTfY
	oe0L/nyyRc6auoJMcIgryaQTNOkGSzK6mS3Sy7oWN5imm6HvGRvoxuCgUBpVat6n6y/npc0V4n6
	fQyqmkoyTSREU9QEJdfU6DWn5rc3gyt4GuAw17ZFt+Px2kzcJNcxLl9YoRAKm2+o4F9KtR2QyNt
	O134fRVQwLRe/v7fFnXZqNSCnUfPendtJJmAP2CEwZLq5u4isFZZpYLGWUe6B5ExR6gGth9kPJJ
	3nHl6FqCD8ohvhAVVphAeV91M8=
X-Received: by 2002:a05:600c:314c:b0:48a:5664:f44a with SMTP id 5b1f17b1804b1-48a56650076mr45995745e9.2.1776844271346;
        Wed, 22 Apr 2026 00:51:11 -0700 (PDT)
Received: from mordecai (dynamic-2a00-1028-83b8-1e7a-3010-3bd6-8521-caf1.ipv6.o2.cz. [2a00:1028:83b8:1e7a:3010:3bd6:8521:caf1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4e4d6casm39579398f8f.32.2026.04.22.00.51.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 00:51:10 -0700 (PDT)
Date: Wed, 22 Apr 2026 09:51:04 +0200
From: Petr Tesarik <ptesarik@suse.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Jiri Pirko <jiri@resnulli.us>, "Aneesh Kumar K.V"
 <aneesh.kumar@kernel.org>, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, iommu@lists.linux.dev,
 linux-media@vger.kernel.org, sumit.semwal@linaro.org,
 benjamin.gaignard@collabora.com, Brian.Starkey@arm.com, jstultz@google.com,
 tjmercier@google.com, christian.koenig@amd.com, m.szyprowski@samsung.com,
 robin.murphy@arm.com, leon@kernel.org, sean.anderson@linux.dev,
 catalin.marinas@arm.com, suzuki.poulose@arm.com, steven.price@arm.com,
 thomas.lendacky@amd.com, john.allen@amd.com, ashish.kalra@amd.com,
 suravee.suthikulpanit@amd.com, linux-coco@lists.linux.dev
Subject: Re: [PATCH v5 1/2] dma-mapping: introduce DMA_ATTR_CC_SHARED for
 shared memory
Message-ID: <20260422095104.1b3c4132@mordecai>
In-Reply-To: <20260421121004.GA3611611@ziepe.ca>
References: <20260325192352.437608-1-jiri@resnulli.us>
	<20260325192352.437608-2-jiri@resnulli.us>
	<yq5atst6ywbl.fsf@kernel.org>
	<4qdizkkoeke3cvkcf35upa7p7ick6s654eqlrizmi7ozkw5eze@tnpk2e34xgwl>
	<yq5awly0d504.fsf@kernel.org>
	<tteiecxfqy4k24wnzvp6ocxnuopyhmqtne2xwh5htwldlbzjnp@o6cbzdlurxld>
	<20260421121004.GA3611611@ziepe.ca>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-suse-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-59292-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ptesarik@suse.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,ziepe.ca:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: D654C443315
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, 21 Apr 2026 09:10:04 -0300
Jason Gunthorpe <jgg@ziepe.ca> wrote:

> On Tue, Apr 21, 2026 at 01:53:31PM +0200, Jiri Pirko wrote:
> > >> You reach there when is_swiotlb_force_bounce(dev) is true and
> > >> DMA_ATTR_CC_SHARED is set. What am I missing?
> > >>  
> > >
> > >So a swiotlb_force_bounce will not use swiotlb bouncing if
> > >DMA_ATTR_CC_SHARED is set ?   
> > 
> > Correct. Bouncing does not make sense in this case, as shared memory is
> > already being mapped.  
> 
> It is a little bit mangled, there are many reasons force_swiotlb can
> be set, but we loose them as it flows through - swiotlb_init()
> just has a simple SWIOTLB_FORCE
> 
> Ideally DMA_ATTR_CC_SHARED would skip swiotlb only if it is being
> selected for CC reasons. For instance if you have the swiotlb force
> command line parameter I would still expect it bounce shared memory.
> 
> Arguably I think this arch flow is misdesigned, the
> is_swiotlb_force_bounce() should not be used for CC. dma_capable() is
> the correct API to check if the device can DMA to the presented
> address, and it will trigger swiotlb_map() just the same without
> creating this gap.

Seconded.

Then again, the whole DMA mapping logic is extremely convoluted, with
dmaops, direct, CMA, and swiotlb, so I'm no longer sure there is one
undisputable way where CC shared mappings should be added to the mix.

Has anyone considered a cleaner design yet? If yes, I'm volunteering to
help implement it. If not, then please ignore me as a random rant.

Petr T

