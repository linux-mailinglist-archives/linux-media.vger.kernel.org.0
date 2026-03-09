Return-Path: <linux-media+bounces-54954-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CDIEHDfJrmlwIwIAu9opvQ
	(envelope-from <linux-media+bounces-54954-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 09 Mar 2026 14:20:55 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BDAC42399D9
	for <lists+linux-media@lfdr.de>; Mon, 09 Mar 2026 14:20:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8F1743070DE3
	for <lists+linux-media@lfdr.de>; Mon,  9 Mar 2026 13:17:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4DE13C1976;
	Mon,  9 Mar 2026 13:17:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="iEOW+UtG"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A9813BED0C
	for <linux-media@vger.kernel.org>; Mon,  9 Mar 2026 13:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773062260; cv=none; b=YdtN5som5HgV/k+13huvTaEi4T27ic8cTAlE4Q1XQWVLMAofVhuLQp6UVA0UAg/5WWYxvhZ5OWhC0FWMatSARtPNsz8WiWZ98xFjfQ2isBCvEA9GTxK/gMpTrjkCv5nYQBz2H/+goJ4ofQs8ttUeFVrVVRm5CvzyKB3zxcOtKnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773062260; c=relaxed/simple;
	bh=0gIWGbCJp5nwkRBHpqTWfAQJnaj/D8oDAfy5HSusAOA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F7QpXRaJjnFJNZDIQ9rOqaNSLfvCVILBhF1PeSS+xT5NZol51x6Lk8FcJdHqalazrvWYkLNt80b89eMFwLTdAqFQ/4yf0DYxC40Cftc4RTaSvpNHf+8kqaq1K4rQy3aSX9fxiUg07lkV1fV/yqmwhDpAPEnVxqMNACqkrqzJyM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=iEOW+UtG; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-8c9f6b78ca4so1519845985a.0
        for <linux-media@vger.kernel.org>; Mon, 09 Mar 2026 06:17:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1773062258; x=1773667058; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0gIWGbCJp5nwkRBHpqTWfAQJnaj/D8oDAfy5HSusAOA=;
        b=iEOW+UtGwg04rmR/S1hc90KFPkcgkvX9DxivLeeyc5iJ7+8L8GZUMj5p3b2MIoqYNH
         eZ/7/ugkNu7NVX/juatkte8VPlQSnL7FbMciCffm7mSe9+KnXEW8NNQ3MsvGQRaD62+i
         zhGr6pUQpdAjxXVrDJXFOluEr9u3ZcpkLsRcEbk1Yhwdb0JfKESs48aAVh+bEB3cq8WX
         pOl88jinp9FGyKaKFwZnjeKHYyb/TS2OKT/PyLMDnL9uI2t4QsiFEig5rWFo7V9pUi74
         J3nOPlQPvE/Pp5CBM5soagk0dBai1oAwCCdRd8m0pWaRqRm63z7k+PJMIaWNP2rNO4eD
         HK6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773062258; x=1773667058;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0gIWGbCJp5nwkRBHpqTWfAQJnaj/D8oDAfy5HSusAOA=;
        b=cOCBY2ADiVbbqfhs3Pk4SbcZpcdfLVT4eviwmCtFRxl+AtiobT0GgaIi0mHxpv4OSs
         YAgmKgQV6wlyYm/X4ei6TddtrsiiAig2MX0Vcr10+vQMJkqmqt9SpgKhzITNn8fLqSkv
         wggA19LGfwXLp1ggEGIHptepZZ5IqFbRlIupuo2ZoVu42U1BL1Zsx9MMFzTMoUabrDkZ
         9Wt+1JeKgejVqcrRSzy3SkiLD1iejqC0f3wb1jF/ha7J3gvqVfe0+qtC+VgSWwdZHB6t
         g4aFdRrjaJabzS3nDYUoQ/4LoSmc65Q9rCIKkJW00z7cQjNxL6rRgwgfSty8bgYDCzQ5
         JayQ==
X-Forwarded-Encrypted: i=1; AJvYcCXMrgqc0wcYO9Z4BtqIJsNGHsQh323Kle3qKlUaV7+Y5xWAtbVz6omp5PBmGV79YRTQmKy5GLwx6Trq0Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YySl64vAbzwJCGqqOmsFFbOrXWS8+hbIt5QJa2w0JQaZ754YHrW
	NScya+9Jdl+twswVBaAK/zHGfBHKmoO0m2JB+MFWR+k9HsXXUVFcPoIrVecV2JoOkfw=
X-Gm-Gg: ATEYQzz+A9q69Gcaxb0gUAJ8xT4+SuLSyXMld8ZO0JQXQHFO36q4i57KKXQq+YY/SDY
	QSlGXrXzt7hmESzdHIYvilYiYEPZjDH+I9K09c43kuM3ycOxiRyCKdTO/MZKW3qql6FNPni4cXs
	aoutap5GsBJrTBkkVn3OH3A/92IOPXFel73HMfIGqEtr18RD9DoIZdllH5s4TtbY+9gAiGDzSY2
	IrYGQt0zsRfRmChHqSMFvIRXAs4o2AnqVOUIei7bOS2cfSl94qSdaGk2gKjKrZS8tq+LnVLyLm+
	lzNWGkL4HQiefCuW5Zn/PqQ6AT9moYWlzhesqoq9xUx0YC9ejgT+SuBYC34sETrt0FP/yUA9vg8
	dfZKR26jR5qfJixwDhg6yLZr6Lhn+Ks916koKlwHuwOiC6Un2mS7SPki2cq2LC2VTUYv63r18ko
	+Cf2VblMSnguwmsDMr0bcfBR9wQJjW/YRSjRVuAaElw0VPOC9CqWV3+Mg8DzdTBJ6sKF5Ulp77C
	j1ysh3j
X-Received: by 2002:a05:620a:4690:b0:8cd:87fc:cf9 with SMTP id af79cd13be357-8cd87fc11e4mr446497085a.1.1773062258159;
        Mon, 09 Mar 2026 06:17:38 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-162-112-119.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.162.112.119])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cd6f49649esm668080485a.12.2026.03.09.06.17.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 06:17:37 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1vzaUK-0000000G6v8-3p9H;
	Mon, 09 Mar 2026 10:17:36 -0300
Date: Mon, 9 Mar 2026 10:17:36 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Petr Tesarik <ptesarik@suse.com>
Cc: Jiri Pirko <jiri@resnulli.us>, dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org, iommu@lists.linux.dev,
	linux-media@vger.kernel.org, sumit.semwal@linaro.org,
	benjamin.gaignard@collabora.com, Brian.Starkey@arm.com,
	jstultz@google.com, tjmercier@google.com, christian.koenig@amd.com,
	m.szyprowski@samsung.com, robin.murphy@arm.com, leon@kernel.org,
	sean.anderson@linux.dev, catalin.marinas@arm.com,
	aneesh.kumar@kernel.org, suzuki.poulose@arm.com,
	steven.price@arm.com, thomas.lendacky@amd.com, john.allen@amd.com,
	ashish.kalra@amd.com, suravee.suthikulpanit@amd.com,
	linux-coco@lists.linux.dev
Subject: Re: [PATCH net-next v3 1/2] dma-mapping: introduce
 DMA_ATTR_CC_DECRYPTED for pre-decrypted memory
Message-ID: <20260309131736.GK1687929@ziepe.ca>
References: <20260305123641.164164-1-jiri@resnulli.us>
 <20260305123641.164164-2-jiri@resnulli.us>
 <20260309135610.1f81d2df@mordecai>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260309135610.1f81d2df@mordecai>
X-Rspamd-Queue-Id: BDAC42399D9
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[ziepe.ca:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-54954-lists,linux-media=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.944];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ziepe.ca:dkim,ziepe.ca:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Mon, Mar 09, 2026 at 01:56:10PM +0100, Petr Tesarik wrote:
> I don't want to start a bikeshedding discussion, so if everyone else
> likes this name, let's keep it. But maybe the "_CC" (meaning
> Confidential Comptuing) is not necessary. IIUC it's the same concept as
> set_page_encrypted(), set_page_decrypted(), which does not refer to
> CoCo either.

Frankly I hate that AMD got their "encrypted" "decrypted" naming baked
into the CC related APIs.

I'm not at all convinced that they "do not refer to CoCo" in the way
Linux uses them and other arches absolutely make them 100% tied to coco.

If we are going to bikeshed the name it should be DMA_ATTR_CC_SHARED

Jason

