Return-Path: <linux-media+bounces-55411-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mO8MNP55sWk2vgIAu9opvQ
	(envelope-from <linux-media+bounces-55411-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2026 15:19:42 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C164A2654CD
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2026 15:19:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9A1913004D92
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2026 14:19:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9403F36E472;
	Wed, 11 Mar 2026 14:19:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b="S9LaWBBu"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF124274B42
	for <linux-media@vger.kernel.org>; Wed, 11 Mar 2026 14:19:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773238772; cv=none; b=ulp6VhXvHco3WbDj4zBzWc6tFeLFFz9ciuF8XQKmhInFx+AHWUD2gmnXqleyEL9vPcx+nyZLhFkkeROjbP4f1siDfmPvguDGcPQ6tCvwN4z4mV512omxxCANr8QAd6SREufzy5C6/sG8Ydf131iUkAG0VMh1brG0LPAHphw1J50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773238772; c=relaxed/simple;
	bh=ZrUWNUYcRB4S08yg1WEQ2YVogaM7A4KC4ZmR4pQ+1F4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KYwKRurnv53QVeiJvyxKcu4SoQ8EYYTaBmK15yvXM1kAQlGCMejjP+9qF4yJ86ATqsukt+Z/s0pSByr5dDyTSQ4vQGP9e6HIbBSzYxPRW/bsZgDM/KZFtAYI0Z83NS5KhPRq1iC0RNW/cCZGB25z2KGfC/Z9l1yewLKcLclqDUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us; spf=none smtp.mailfrom=resnulli.us; dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b=S9LaWBBu; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-485392de558so21858585e9.1
        for <linux-media@vger.kernel.org>; Wed, 11 Mar 2026 07:19:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20230601.gappssmtp.com; s=20230601; t=1773238767; x=1773843567; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZrUWNUYcRB4S08yg1WEQ2YVogaM7A4KC4ZmR4pQ+1F4=;
        b=S9LaWBBuv1FIuyW7d/d5tO4jVUOUyAiVIGhF3YXUgNhJDhOcSR0PTa5KC6YzR2gXQ+
         p5WRFiytzwa4GlAo8StwuIMzFWSOXEvIw9bNAuHSzZs50Rybh6AMpLmIDhE4JLHNdhJg
         GnsSUvBKChTHV6Ph+X/8x518xoePv3e7dV6sz3QRT2TfoQPBKajdc8K9ym7E9JnzsmPu
         PAfGtESAplM41RY4srPRiwSs3t1ZnQ0nNFvRQR0KfV/L9Fa+MzWjmruiX8CynzXQShrP
         kqWXIVCNxE0oJ16alJJu5IhIPwonMsf7Y98m8MoRMA56OIPkCcpQCkAZpFNaC69FSuBf
         bzhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773238767; x=1773843567;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZrUWNUYcRB4S08yg1WEQ2YVogaM7A4KC4ZmR4pQ+1F4=;
        b=RE0epz6kMZF85Ns0fjoZ7RR3UwHZQs38braQPEr3fwLC1Y3JbraT6l+nloSq+nrLlV
         0hshRWmIqRQNapT68YyI+By5x+t/nxCQ/EzxT8bgM3BmstoHGPhGzTmiRrVqMk6YX8Wa
         Fv+NP48N/ORWweTP3adI6OWh8wBTLN/9htuIBPN1uGEWwHnAYmZwBVgtJwSpaqrWMAwT
         ncLCg6F7LEd7V1OtbEiiya7Cn7KBuPUG01cBD0LQKFAY+M2LIWbCnp7dG3q1Qm7iMz4P
         VR8z/kfCPtg9nNEO+P9DTevn+/wIxEB57eFsWXen6sUE7oNdMXk7keudhfpSPG68YNbc
         vM0A==
X-Forwarded-Encrypted: i=1; AJvYcCV6cCtx9RO1zjPX1MlRO0e+McQ+kPTBvQBQkVbeiS63bUpYbwAMfsGOgfnIq0WhNmGQHc26PW0fPv8rHQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzEj21gHaIS+UvV1At2ulY/23Ji6uMmnWvw0Hw8AgVjBGy5jU5z
	DG8u3XnOXlS8xymG14VmXH+LSzOHVIq6eP3It/LM1LfrByLJ9zthiOvyLNRlupBJXvxzBq3ztrr
	u0hQ6oA4=
X-Gm-Gg: ATEYQzzWa/O/Pk9MJixjnUBFnLFDa4VOXQjpCvmpB6hszj1b4OWgyrcU/7L436iLrGI
	BRyan1YBPQ82lgX4kjzLod8EUB4Y/svOMElwcMjHXt5maIrsIwXCcY/2LZ1/rMJ2SHAmX+B2SIO
	Ap5LuvKT1dr/Eg8VYJGCubJl6jCceV8SovSWfvLOg+3VjstJtRzolJ/zAQhuwbOrClgjoTJsyNW
	Hgt9g9vR2c97DdLPSSau4KkK0ctXniyt0ii0BpFrKLEq1SMzkztkTAvVtXLeXGOIIbf/ULMfmwm
	U02T6XlpMkfDyEZ3bJkJeQBSRwjU8rdX7M9FqrNoMtnVt4ww4CQuO+FQB1uHoX34B759deiMLYH
	LFTD9v/3GzvslXTVkrTk0aD20oSRzLo65BAg/Q6Db+9r9Ujoa6aAZ2mX1tpzTC4tkrDb5jH6YrD
	dFDikns24DZrLB6eD0gKJpgc/h30p374mpwh5VswB0Sg==
X-Received: by 2002:a05:600c:4745:b0:485:2a85:e5ec with SMTP id 5b1f17b1804b1-4854b0ae77bmr43456195e9.2.1773238766811;
        Wed, 11 Mar 2026 07:19:26 -0700 (PDT)
Received: from FV6GYCPJ69 ([85.163.81.98])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48541ab9f9esm162608305e9.4.2026.03.11.07.19.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 07:19:25 -0700 (PDT)
Date: Wed, 11 Mar 2026 15:19:23 +0100
From: Jiri Pirko <jiri@resnulli.us>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Petr Tesarik <ptesarik@suse.com>, dri-devel@lists.freedesktop.org, 
	linaro-mm-sig@lists.linaro.org, iommu@lists.linux.dev, linux-media@vger.kernel.org, 
	sumit.semwal@linaro.org, benjamin.gaignard@collabora.com, Brian.Starkey@arm.com, 
	jstultz@google.com, tjmercier@google.com, christian.koenig@amd.com, 
	m.szyprowski@samsung.com, robin.murphy@arm.com, leon@kernel.org, sean.anderson@linux.dev, 
	catalin.marinas@arm.com, aneesh.kumar@kernel.org, suzuki.poulose@arm.com, 
	steven.price@arm.com, thomas.lendacky@amd.com, john.allen@amd.com, 
	ashish.kalra@amd.com, suravee.suthikulpanit@amd.com, linux-coco@lists.linux.dev
Subject: Re: [PATCH net-next v3 1/2] dma-mapping: introduce
 DMA_ATTR_CC_DECRYPTED for pre-decrypted memory
Message-ID: <p52ohr7pqtpzmwdpwzfwmwpor3wkop3quwxmq57jopan4awwav@5hhcgsskzgu2>
References: <20260305123641.164164-1-jiri@resnulli.us>
 <20260305123641.164164-2-jiri@resnulli.us>
 <20260309135610.1f81d2df@mordecai>
 <20260309131736.GK1687929@ziepe.ca>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260309131736.GK1687929@ziepe.ca>
X-Rspamd-Queue-Id: C164A2654CD
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[resnulli-us.20230601.gappssmtp.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[resnulli.us];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55411-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[resnulli-us.20230601.gappssmtp.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jiri@resnulli.us,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ziepe.ca:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,resnulli-us.20230601.gappssmtp.com:dkim]
X-Rspamd-Action: no action

Mon, Mar 09, 2026 at 02:17:36PM +0100, jgg@ziepe.ca wrote:
>On Mon, Mar 09, 2026 at 01:56:10PM +0100, Petr Tesarik wrote:
>> I don't want to start a bikeshedding discussion, so if everyone else
>> likes this name, let's keep it. But maybe the "_CC" (meaning
>> Confidential Comptuing) is not necessary. IIUC it's the same concept as
>> set_page_encrypted(), set_page_decrypted(), which does not refer to
>> CoCo either.
>
>Frankly I hate that AMD got their "encrypted" "decrypted" naming baked
>into the CC related APIs.
>
>I'm not at all convinced that they "do not refer to CoCo" in the way
>Linux uses them and other arches absolutely make them 100% tied to coco.
>
>If we are going to bikeshed the name it should be DMA_ATTR_CC_SHARED

On the other hand, the encrypted/decrypted helpers could be always
renamed if it makes sense. Better to perhaps have DMA_ATTR_DECRYPTED to
have things consistently named now? If someone renames them all in the
future, so be it.

