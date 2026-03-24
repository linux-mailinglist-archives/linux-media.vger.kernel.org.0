Return-Path: <linux-media+bounces-56867-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wJlOG3t+wmnqdAQAu9opvQ
	(envelope-from <linux-media+bounces-56867-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 13:07:23 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EC133307E33
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 13:07:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 00CAE312AB59
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 12:01:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F258E3EF669;
	Tue, 24 Mar 2026 12:01:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="IpwnW08V"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 517AC3ED5D2
	for <linux-media@vger.kernel.org>; Tue, 24 Mar 2026 12:01:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774353664; cv=none; b=JQ3su4BpEvtzq1Mzq7abNhpEVaaTtktIYyl4gb0pcGJyqc3oGZSk1wPcbfi9ZI33YysbRaOJEHk8wgY09/EijnS4BiiWSp3FGmcQSwKe6yaU+TQtYaxbMrgJvHEsCvvHe/AkLa4mVOwE+PnOAfhZOIgQMIhbHf8le1bJV4u3MWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774353664; c=relaxed/simple;
	bh=LBSelXUmDdw7uStyJ/dS5KNmrXZYc6tcp0HXtRjX5cQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rK165BcECvD8BrM9g3HboPLCLwcobemqmnoHKmRnN+wdWTDY9ErQRNllLAvd4lc25dyRyHE53vahnVCxxyP1AlSXpD0o83Ss8fFa3j3ZAqwQQ8g+x6iJg/D7hUSJBoUyntpCc52xsFKig9p4zyYF+7DVIUbCiFKS86+QN0cl4/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=IpwnW08V; arc=none smtp.client-ip=209.85.210.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-7d7653db148so3016335a34.2
        for <linux-media@vger.kernel.org>; Tue, 24 Mar 2026 05:01:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1774353660; x=1774958460; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6xGeDSaplrfa0s0FkTnYgpWTfeJHarWr6HfnS+Tx8gc=;
        b=IpwnW08Vfnqv4uUfBZUk8sARp+RpHmDyA4RqP97BLF5sIjZX7zojK4tvidZgZxIfPI
         64zQBZMuo2KgzR2Cwz9ImJ/Ugsz1dW5foRjf9IyskXm4gJSKvjdv2o6hHbm/WvoZT4jy
         H1gChOm/jl8b5QR6Xor0QIMSZnBS2B4hjl8lTU65pv6+Ptcgvd2zTIsJM2ZSBxTAKCs+
         dfzbwK4j94A1Zte3vFBNg0giKKS5Aa+mkCxJ0wwnk+G17PKMMEqs9dAU+gQj9e95VVTS
         UgQOuj4ANbXTfhF6klYWKDg3E5Qa3H5OXquP7+yfSbOE7zuOmKFNLWPb/gxDw4ctEVmW
         y6gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774353660; x=1774958460;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6xGeDSaplrfa0s0FkTnYgpWTfeJHarWr6HfnS+Tx8gc=;
        b=W7sH6RTJMgmTqq5X/9HAPqJkKyP9MR8w59GdKHelSC5FZH4vJEKqAMhqkTYRg5IGWc
         X4Pj5mI42s1/7ZgjfMUPoRtwtM/yNht5c6GNvwxNYiGhVxmh/W/3jgjAMP17OLQdCI5t
         hKl5GwLW+TFVCzuIh9/ohz2AqmPs+1jgiX34jRf75P4hrs5fbWWXZOqyY16+N+BqWM8c
         lmvgY9+Vqi/kUGAs4iJAbsOGLkQAkkP1av12LwYjOV+ejblyp613okxVn2eA/scyTB8p
         9sM4jwlNfMIO47Esse0KBupHmvdeFNGNXGkYQhYX0tK05FeXMi1cNYbGYtj4P09wV3eD
         0ufg==
X-Forwarded-Encrypted: i=1; AJvYcCWjhVjANia7O97/Yp3HSdvvPNKgeSUVCoEfQ9NHMnoHAedrDQKjFpGypWwrfzFASX+2RT5QaBB57JZdBA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzFp5hDZ6JxpHsHEV34aCp6BUaDziHWS+5IDdOie3p22lguaxdF
	iReN8ZXaVWJHpKFhsT3MSx8w8XK2S+GO1aWiR+YzCaIQPi7R7wLBEen/4grZUmMagZk=
X-Gm-Gg: ATEYQzzANuMTfN3jK08ehr35HkI56ujnPi0Tc/JvhdPRp6phjtewaMXdyLhj6dJXQIq
	eHngIzb4sWg63lqi0aeFLzDQNgNQqkAJ1hocNPElTLReYFwjjHvNhhuPQoq09vMShAWGsqWTUGD
	cPSdWwQ4hcX3xrR/KkMIiekaIY8jh7EtkUSrq6StEC7mMCU4X8i4ifwYvrfs8P94hrP8FCkiSuM
	60YUuxalg8qoRMApQSLOcEzXKcYa1jqTQrwBjMqBI7l9R82vdOL8viVaYPMFF8rLATDgzRsMd/O
	1uizR4g31MdNurt9CRkND3LpybB5gaCD+q+ptGKRxjB2DxlrQa1LMcZm1pijxee4HBqVMk7TVCT
	Y6d91HDn8Yx1gPue0YYJI7FEfzjvjETw9n+3xW0Liafle1edt8ve99IyzEOXtmWatS49VAL9xLr
	zMK9f/i4+r8Uhs6pb9b9qcXli0bEg5JkaGS08Xjn05B6vzDIscNVvWSrhY8E6VAHkt2NGEVW0E0
	5XYFrjD
X-Received: by 2002:a05:6820:174b:b0:67d:f88f:d83d with SMTP id 006d021491bc7-67df88fef36mr1271317eaf.29.1774353659590;
        Tue, 24 Mar 2026 05:00:59 -0700 (PDT)
Received: from ziepe.ca (mctnnbsa70w-159-2-73-22.dhcp-dynamic.fibreop.nb.bellaliant.net. [159.2.73.22])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89c85335402sm138526236d6.25.2026.03.24.05.00.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 05:00:58 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1w50RN-00000000GV5-3aCE;
	Tue, 24 Mar 2026 09:00:57 -0300
Date: Tue, 24 Mar 2026 09:00:57 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Mostafa Saleh <smostafa@google.com>
Cc: Jiri Pirko <jiri@resnulli.us>, dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org, iommu@lists.linux.dev,
	linux-media@vger.kernel.org, sumit.semwal@linaro.org,
	benjamin.gaignard@collabora.com, Brian.Starkey@arm.com,
	jstultz@google.com, tjmercier@google.com, christian.koenig@amd.com,
	m.szyprowski@samsung.com, robin.murphy@arm.com, leon@kernel.org,
	sean.anderson@linux.dev, ptesarik@suse.com, catalin.marinas@arm.com,
	aneesh.kumar@kernel.org, suzuki.poulose@arm.com,
	steven.price@arm.com, thomas.lendacky@amd.com, john.allen@amd.com,
	ashish.kalra@amd.com, suravee.suthikulpanit@amd.com,
	linux-coco@lists.linux.dev
Subject: Re: [PATCH net-next v3 0/2] dma-buf: heaps: system: add an option to
 allocate explicitly decrypted memory
Message-ID: <20260324120057.GC8437@ziepe.ca>
References: <20260305123641.164164-1-jiri@resnulli.us>
 <ablV_f_l7wD2m63E@google.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ablV_f_l7wD2m63E@google.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[ziepe.ca:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[ziepe.ca:+];
	TAGGED_FROM(0.00)[bounces-56867-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[ziepe.ca];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jgg@ziepe.ca,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: EC133307E33
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 17, 2026 at 01:24:13PM +0000, Mostafa Saleh wrote:

> On the other hand, for restricted-dma, the memory decryption is deep
> in the DMA direct memory allocation and the DMA API callers (for ex
> virtio drivers) are clueless about it and can’t pass any attrs.
> My proposal was specific to restricted-dma and won’t work for your case.

How is this any different from CC?

If the device cannot dma to "encrypted" memory, whatever that means
for you, then the DMA API:
 - Makes dma alloc coherent return "decrypted" memory, and the built
   in mapping of coherent memory knows about this
 - Makes dma_map_xxx use SWIOTLB to bounce to decrypted memory

There is no need for something like virtio drivers to be aware of
any of this.

On the other hand if the driver deliberately allocates decrypted
memory without using DMA API alloc coherent then it knows it did it
and can pass the flag to map it.

> I am wondering if the kernel should have a more solid, unified method
> for identifying already-decrypted memory instead. Perhaps we need a
> way for the DMA API to natively recognize the encryption state of a
> physical page (working alongside force_dma_unencrypted(dev)), rather
> than relying on caller-provided attributes?

Definately not, we do not want the DMA API inspecting things like
this.

Jason

