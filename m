Return-Path: <linux-media+bounces-56874-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gCtfCWODwmlneQQAu9opvQ
	(envelope-from <linux-media+bounces-56874-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 13:28:19 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 81071308357
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 13:28:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1B2EC310F14A
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 12:24:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2E683F54BD;
	Tue, 24 Mar 2026 12:24:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="DPdTm2PZ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0408B3ED5C6
	for <linux-media@vger.kernel.org>; Tue, 24 Mar 2026 12:24:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774355060; cv=none; b=peOsjkrdvzJhskqsMSntGlXiwqbwdQkl9vo/vtc2hnZCdJYC8VkvBHz2ydBNNLwE0FUQHsYra4e/2sEdf+bhPtdX8ZOtBSoXmLc6wboKqLnIvn7AS2FjroueUZ4+fMQR5ac/+9A1PP/4/VkCRKw47NfGza6VfYNfaaRslLlpUEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774355060; c=relaxed/simple;
	bh=+rZzDMkMN8DzPS73xj43TJpHO/+m0D8wC2cm/TT1448=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z6E2Blc1aR0UpP3LxPixArkDdZEUYtCnPY5ujK/QIzHjATDTf98cE55bPVFg/ZdP9nThE+09fJGtL5ZZnkGkmBN9n3wsRi8iNeAZIFElpksn1OHlFtWrLA1w8VwVvZ30aWkurwu4WtVoypBIi13efOwvJgHbKjYefwLIBXb/rn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=DPdTm2PZ; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-89c4468686dso54418716d6.3
        for <linux-media@vger.kernel.org>; Tue, 24 Mar 2026 05:24:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1774355058; x=1774959858; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MbJdAPBjjvkAIehxkYzkMUXQO8EVBsVDqYb4hAUTKqI=;
        b=DPdTm2PZ21AU5ECoeXxeQg7YFHdr9GtsgsMhGGll4wfJdbSnLVmcaaf1bwXpMrwWF0
         xQaCcsIHKpUZQe5ELs5LgQIGoYjLULeCAwDJKtJQaaV2do3WpHYt2wTWGHs0u9rqaCu8
         WEVNxSF4yw/uiCPU3qDcwjcwZtHCi0SB3OeWpifk+DgN1QpDH2fAiOfkmhcGOY5Ufjzc
         dk12hP3ijKeWb3CWDaSpx+PMj9zKFbuIIGMA3VJ9gsbmMsIwtTw2L/516UrBgGFqfp7W
         95HaTtBFZKbPYgga8gLwoikFhjq5PS32OU96O5kutPPG22ywxN5lguGRYUTtnySjWSoz
         evXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774355058; x=1774959858;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MbJdAPBjjvkAIehxkYzkMUXQO8EVBsVDqYb4hAUTKqI=;
        b=dUb4FjV/VTbrRStToLiDJBaYT8tb7J0n7UH9Vfq8ckixZdcIqZcSuy17rjwh8ZADPJ
         mDqPTfc+kqajW1ofObROvCit2icYTZLsLdWRinWGwMwocmqo9HlPdAXvLtfktjDpiCj6
         JDoezjFZh/JO8bXDXyD9EiyjwWGPz2cpZ2YqaVYBQqkZ1fHB/abvI/cq6eCF+1jtGRPz
         hLHZ10jAzRYR4Pa3uRy2euWi0HCdgqBl/6mXGG3u+mPAmGeMjPe2wrGGZcqYlg/HYX8S
         XOBZExp6tHUMP4AV4Xx04iETe+IM1gfpb+QcqD5WJP6z+11lv6DAmPGRJXNfer67nAn/
         QOvQ==
X-Forwarded-Encrypted: i=1; AJvYcCXBIu9yGgP8AJDNvOCYwlEKXVGBrq6MOzS4JdQBcGykUFfiCu0vJAaltreazjEv/QG5ausfMNm7jZ2s5Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0yIoP4ZKe2FEoXcv5PGeNFMQeebRW9qLGVRP8CP/t+0tmzDEB
	UsTrYLUKYWM4mqsL3TVjToPqsbiPvgV1d0iafwogUmQArb9nYMhezVD8KKw7Zkq9kjg=
X-Gm-Gg: ATEYQzzMrxq4oyUa4qlptweziM5kKOu4Zw2e59JzCpCp4OTAjT53+e1hNZWneP/TVWJ
	6+DNKp/eNF8J5sQOamAXIzI953VWRuTsDOwgvFloM1c0TjHMV0CWQod2yeugenQWeFYpm8xcu3m
	IS69Ylbu+/pCJYe1bXfL0j/H4woL9tVK4Gxv4pGTiJm2TUoI84KunQjMtkV7PEF09pgmBSs/S3g
	Abs5rxmhmqnlBHV5PrbppsiyHvv+vIZfphGLT0hGhMFGw4dQcz9mEdCLSrDBRipljmDy1MAdTag
	hXES8crfYm0QkP9qsJ5iLOY82UOxQTPUFsRB/wvu2bS0VOyDvgn1TaYbPQkXVRFETO3JP4Sb5yx
	HjfPipxi5n2DMvvH4Hhqr9gMfHmCPvOQoPihORXWS7tq3OeYsh1o6N3VhY3m9+zUPWaz/Ex4ygw
	eBN5M+Hd8NHBD036KOaGki8jBFvuQyb4syvyjvMW1i46YWHXkz6Io0LOw07I7smrvCmnKsxQ==
X-Received: by 2002:a05:6214:27c5:b0:899:fd64:1b72 with SMTP id 6a1803df08f44-89c85a5bebbmr256219296d6.41.1774355057813;
        Tue, 24 Mar 2026 05:24:17 -0700 (PDT)
Received: from ziepe.ca (mctnnbsa70w-159-2-73-22.dhcp-dynamic.fibreop.nb.bellaliant.net. [159.2.73.22])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89c8536afb4sm134637326d6.42.2026.03.24.05.24.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 05:24:17 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1w50nw-00000000Gf5-2Wfl;
	Tue, 24 Mar 2026 09:24:16 -0300
Date: Tue, 24 Mar 2026 09:24:16 -0300
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
Message-ID: <20260324122416.GD8437@ziepe.ca>
References: <20260305123641.164164-1-jiri@resnulli.us>
 <ablV_f_l7wD2m63E@google.com>
 <20260324120057.GC8437@ziepe.ca>
 <CAFgf54qoFhvVR2yfROGaTJmLcjuLACswVFv=trqgJwGb_DB3zA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFgf54qoFhvVR2yfROGaTJmLcjuLACswVFv=trqgJwGb_DB3zA@mail.gmail.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[ziepe.ca:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56874-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[ziepe.ca:+];
	DMARC_NA(0.00)[ziepe.ca];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ziepe.ca:dkim,ziepe.ca:email,ziepe.ca:mid]
X-Rspamd-Queue-Id: 81071308357
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 24, 2026 at 12:14:36PM +0000, Mostafa Saleh wrote:
> On Tue, Mar 24, 2026 at 12:01 PM Jason Gunthorpe <jgg@ziepe.ca> wrote:
> >
> > On Tue, Mar 17, 2026 at 01:24:13PM +0000, Mostafa Saleh wrote:
> >
> > > On the other hand, for restricted-dma, the memory decryption is deep
> > > in the DMA direct memory allocation and the DMA API callers (for ex
> > > virtio drivers) are clueless about it and can’t pass any attrs.
> > > My proposal was specific to restricted-dma and won’t work for your case.
> >
> > How is this any different from CC?
> >
> > If the device cannot dma to "encrypted" memory, whatever that means
> > for you, then the DMA API:
> >  - Makes dma alloc coherent return "decrypted" memory, and the built
> >    in mapping of coherent memory knows about this
> >  - Makes dma_map_xxx use SWIOTLB to bounce to decrypted memory
> >
> > There is no need for something like virtio drivers to be aware of
> > any of this.
> >
> > On the other hand if the driver deliberately allocates decrypted
> > memory without using DMA API alloc coherent then it knows it did it
> > and can pass the flag to map it.
> >
> 
> The problem is that the DMA API currently gets confused by this; it
> can end up double decrypting the memory or using the wrong functions
> as mentioned in [1]

I fully belive there are bugs, but the API design is sound. If you use
the coherent allocations from the DMA API then it knows decryption has
happened when it generates a dma_addr_t and there should be no issue.

Now, if drivers are using the DMA API wrong, like trying to double map
coherent allocations then they are broken. I also would not be
surprised to find cases like this.

Jason

