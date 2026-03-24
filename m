Return-Path: <linux-media+bounces-56900-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +FuJDs/QwmnRmQQAu9opvQ
	(envelope-from <linux-media+bounces-56900-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 18:58:39 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A20C931A683
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 18:58:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 892FA3033240
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 17:57:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDA9740822B;
	Tue, 24 Mar 2026 17:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="HHj3YVgN"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C7833C8715
	for <linux-media@vger.kernel.org>; Tue, 24 Mar 2026 17:57:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774375041; cv=none; b=r6jdq/FBlNqw89zQ9QdHFJt/Sf0BrC3JEXAwyqppPqA+mWXIl43NBQBv7Bam1pSflmCc/nqn2EU91DCyiYWK64kHlmfetRfDwuQ04EA9EriQbwUIYtt+lY004T643bWQuaNIOZX/u+mse3di3/wQISgCOtlo1bX95JNEgzabhzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774375041; c=relaxed/simple;
	bh=DGPmxoTTtNhn7YbNdJRS1EkbAYPcolSO8E8zMkGnzu8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DgP0qz7ng3Bant6HiufhaLCdUDh15gx+kd5W0+K8i5O7DcrhNtRGIWICfACROyrv0NkBIMoF6mwPYyUURl3pMENoLm3hne3d/kXUcEnUmcnOkXNSxYtkY9ZeXgFcio84zm84fPHGr3wzp+YHCmqDZquMtyOLXaMjDupCZTrWBf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=HHj3YVgN; arc=none smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-899fbf92bdbso66560776d6.0
        for <linux-media@vger.kernel.org>; Tue, 24 Mar 2026 10:57:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1774375039; x=1774979839; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DGPmxoTTtNhn7YbNdJRS1EkbAYPcolSO8E8zMkGnzu8=;
        b=HHj3YVgNyjSujMVnEI9SEt5bKtMQE6zKF6E8cKHPMo7tUYT1c1bBm7WDNhrKvK81VS
         p9UaHyIhdMy+Lz5AdG1biN/ieeo7v9JaWpS5ByAc0aVOVc7JiJPA7216Mg3kcxWdzBhk
         seDeE/Q7VNRQSLBZLxbJ2fSgqWffIaxNZS19tDdT2YF97Ky4XOhvauSW69A2J9sHX2yR
         lIP4Ky6GEvr1ON3xRQMAylqVzbUBgZ73oEgK6OeQ7TksTuKPtsTtWAmBeCqV8r25V2xJ
         OoJnKuaumVMJKexfy0THHkyeCn5YQunTZc26anSR47fkK2+SN7jGAf4U5dv3vMk/IOBw
         4Icg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774375039; x=1774979839;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DGPmxoTTtNhn7YbNdJRS1EkbAYPcolSO8E8zMkGnzu8=;
        b=Qsf7Nal0C64/Gnj8LxZLO09IrFCAU250ESDD8q0PUiQeQgHqAgwKSrfFuOLMPiWkZX
         otbZDLU9Nyfr4H49mhFGoceNWWxdKCoAyi6UHyita/X5n9I3d6Iq+DXPVsocoGqwFKId
         I+X7REG3+hUTQRZ4c8bCljqCFAMxYKAWtcZdo0TjU+7oTzPoPo1GLxinZ+jYeNOP07ni
         At8Ih9DZb6CkDIeHB+AmU/xbYCm5+M9cbYCiRlS9MWVuSmaZK1pufXqs2qGZUCCCXYaX
         UUrk9TiJH77bnfAl+VCYGQX1Ph+5btwVTrj8VW1y7PCZkzn5+OlXKtkP360osrxX58jh
         F86g==
X-Forwarded-Encrypted: i=1; AJvYcCXg2/5reNyZbLx4KWZfk01y1JTa6IxXrMtj1UlCJYPKad78gfSZ0OQzvuCTA6NjtfX3vuwKcOJwbON2JQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyuCOJED352ARwt9UaeQHtKQ4SQ0+wdQSQn+ViqgZH7LruymY2/
	/zJxC8fDcff2rlJo7b2KYQxrtkBhY8jIL6yOOkDs+PuV8V2boJmM+wqKIpauz9svWSQ=
X-Gm-Gg: ATEYQzyMtSDk6gzzbR9mMz/PcMCaKspAJ45r4tR5URVsV3TJ17d9ztsDYVnTb4xxMeB
	x6yZcqMInNpGEJLbQmRwB4ODO+XRZQk9CTeeurg/1EFxrOF0w4diCv5Wu7jXTNzjVlviaI4of8m
	eK7Lm9/pQ3kDmluEuun/v1je+yuMjk/jPy1bVbchvI1DmRawhLXcr58hDogUZDZNpSAWykB794z
	YkHnmvhBxlw4Blvs99fh1jDhpEVJQ3hes902nlYM83nBYs2M+8I2vZWmfwYrh/6lJmJXU77bZBY
	HuKyqwn1TdLcRwhM0SlaNk5dXqSDGhF+ycfoEmDHXOZV73gxcnJuD2bf866VnntucGIEa8vuQh5
	N39W7A2YWzVvT4eZT1N6g0RJ1da6XM8O7JgIgrPyIqdX7DWYssPy0iMKzWNVTMInoi7BEKIEDEk
	b0ak1S9Kq+Vtq+MjeO7XlhzIQbnAQVFgQmmyuXyQzZbEDQhnhNM8rsfgEQF47bZ5aPb4cU3g==
X-Received: by 2002:a05:6214:4293:b0:89a:125f:37dd with SMTP id 6a1803df08f44-89cc4ace974mr7595006d6.49.1774375038919;
        Tue, 24 Mar 2026 10:57:18 -0700 (PDT)
Received: from ziepe.ca (mctnnbsa70w-159-2-73-22.dhcp-dynamic.fibreop.nb.bellaliant.net. [159.2.73.22])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89c85251b04sm116985626d6.17.2026.03.24.10.57.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 10:57:18 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1w560D-00000000Isw-1b4r;
	Tue, 24 Mar 2026 14:57:17 -0300
Date: Tue, 24 Mar 2026 14:57:17 -0300
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
Message-ID: <20260324175717.GE8437@ziepe.ca>
References: <20260305123641.164164-1-jiri@resnulli.us>
 <ablV_f_l7wD2m63E@google.com>
 <20260324120057.GC8437@ziepe.ca>
 <CAFgf54qoFhvVR2yfROGaTJmLcjuLACswVFv=trqgJwGb_DB3zA@mail.gmail.com>
 <20260324122416.GD8437@ziepe.ca>
 <CAFgf54qwA2D1Xa4rnruJ4Nfp5BsB=T_pB3hzz9HBjh22TL17uA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFgf54qwA2D1Xa4rnruJ4Nfp5BsB=T_pB3hzz9HBjh22TL17uA@mail.gmail.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[ziepe.ca:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56900-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: A20C931A683
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 24, 2026 at 05:36:23PM +0000, Mostafa Saleh wrote:
> But it's not about drivers in that case, it's about many places
> (SWIOTLB and DMA-direct) calling set_memory_decrypted() without clear
> ownership so in some cases they step on each other's toes, and I don't
> think that will get simpler with yet another caller in this series

I don't understand how this can be, ownership is clear. SWIOTLB owns
the buffer, dma alloc coherent owns the buffer, user owns the
buffer. There should be no other cases, and they don't step on each
other unless the APIs are being used wrong.

> I am fine with the API design you mentioned, but I believe that it
> needs clear documentation specifying who is responsible for
> decryption. The code should provide wrappers checking for these cases
> instead of having is_swiotlb_for_alloc() and force_dma_unencrypted()
> everywhere in DMA-direct.

Redoingt how dma-api works internally is some other project... It
would be nice if swiotlb would sort of recursively DMA map using the
new flag instead of open coding it but that is pretty minor.

Jason

