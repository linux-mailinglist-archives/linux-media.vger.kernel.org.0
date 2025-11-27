Return-Path: <linux-media+bounces-47807-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 93BD9C8D52D
	for <lists+linux-media@lfdr.de>; Thu, 27 Nov 2025 09:23:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id AC7234E476F
	for <lists+linux-media@lfdr.de>; Thu, 27 Nov 2025 08:23:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C977532277B;
	Thu, 27 Nov 2025 08:23:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EYKVm9pa"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7838A31CA6A
	for <linux-media@vger.kernel.org>; Thu, 27 Nov 2025 08:23:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764231789; cv=none; b=bzl7LIL9gL+dHDNL7nFPDPr/bpNhomeu9DoPO32VaaBvvV42hbUQA2SzdCnvYsYbZkXLeNbbSkng2RGMRm++LKc1tKx9D8YRPlMkhro0TRqFVgxE7gfJ3D5d5/G3ZX1VZoSc/GJdB05IomT53h5CFp7sRUwlM0cF+sDYwv744qM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764231789; c=relaxed/simple;
	bh=U2pzATW9i26spcLqvGk0JZgv9o3jQYgv9ZlZSJMszX0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bhphX+n/QWYXCq+GFwl5/pDf/DPbdrfQNv5BNUsBrseU6U5QG0VpeLU1E4BSAWvzWICKF41F3bZCTwgj5roJAomvLAFMUEeNrlX2U7dCD9L7vEo+9Pu4DRB4MBc9ADEhd/hhLKKGrFJ+AIHEkzO59C/GUvRMjnnAIn6J5iAPN1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EYKVm9pa; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-29ba9249e9dso7154655ad.3
        for <linux-media@vger.kernel.org>; Thu, 27 Nov 2025 00:23:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764231787; x=1764836587; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=w6hBnm1WTlzOV43F8Rg8NMwBpW3sVO5XoameZRwTC+k=;
        b=EYKVm9paYgovcgQoX6olgHrLOL4NZ7AFg9qnzNk55uKLxZt5OG6SDKv8dcyfJfYS1h
         ISDdOonU3VKcYDH3R7zqwRS9BeARaud25e4rOYGETRXTFBWMaOElDiEAWqbZAd9EK1Ux
         r2L76P5oWC/E43nUiaEGaWlgjtXyOaRbaZN5OeqEHRNoWpppHlZzphwcM8WYRzGi437d
         n4t80qKV/qliUCh4XDo4iwJSu+WzPY8No9OU4ZYVFL+zcDB0T7LeKAe2Csdmr/jXm5Cf
         YlR6J6ru2mwNorXvx4RqAh4HfEjwZwwpT2ZFgra3zZ+MsdmU3A/VyJ4/vvDttTgg6T4G
         QXpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764231787; x=1764836587;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=w6hBnm1WTlzOV43F8Rg8NMwBpW3sVO5XoameZRwTC+k=;
        b=xGeZYPg4LSHgjv4XnbxED/deK+P43sFG77s/kRnueBfeH1mLxZY0eIl5qJ9SS/XXUW
         wkjICBeoCYn2YLhdZczA/zuCyKLywJxyEfbR0SY1hppLukt6k727ijlA0TWqoOu/PPOb
         z50CqWImGpoBfVx7iCjDVGw9Y+E5nxtfXUitOznRkW7W21eI20l4EKwtEDEzqmATsE7c
         u1/FkXd22Dpzp1NJ1P/NNKmQWIF0/+tY95GkqbkSWPTVTnAy1Fs1VjSGQ0m33bvuRqH9
         5F0WrO76eTDKIJYyI8vXjNd3mzOxAcbgWEJ3p6XLzK/H8dS2G4Q2n30sFvN+PSesN2CC
         K6lg==
X-Forwarded-Encrypted: i=1; AJvYcCXwlT+FXchcU6ZIkih0OAXsAE+hYegrCxmdDfjQ/UnVYqfWrpTaSxHZUNUr40/LU7C++MxBmIyuBe6OsA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxWP8+7VwjXtclstlmLhZQ3CzQGYiOo/RMbrENv1q4/2x/0PDWX
	5BLQNjnNA0XWakH0PUOkDxAvZcuPDBuctciLv4Psa++KdOhb36+BY5sknyxgmm0hJjI=
X-Gm-Gg: ASbGncvjKrZhQPdAct5vYrfg43XWF7IKOeePpFsvTmaoozu8LnUg8iUYOQEe1U955cX
	E0XdZw1n/n++SCrL8p6Y9d6VDZ5r5mwBk4pl2m1VCKBS7SjwTotzMTKEjKp11W9Awu17/V6Ifkt
	8/Lzrix6xaZL9J9PuWJlORPRDjaP0k7aekdTZWqjg149hUVQBfqrNlgX1UGH/9hcBoTtBFuoES/
	5e8n1BZ8uBVln9Bu8+JpVmnqVvmE0esZ2Tt7UiJw9fc2UsEsINOW2S2oDwbL1U9Puvn395ePWO5
	I0mugWn2d5XbgELNRV9tKMg/IF6TGaLAQ63kP/o9nlO/s61l4Y2M84elnn2URsHYYE0MAfwhRTS
	g+zqb56rdpWbYZJYMU2ae1w+VqqrwSZHCWlNSR/aulk04DFhqPtbmhCKtOscZfpLCbJX/XXnffo
	GqklNvWoa3Kz0=
X-Google-Smtp-Source: AGHT+IH+qULnt5IiDwVZs4RSPJiSUXQVGTLH6/7d6HCRpJINYmlZt5FbShE8rGka4cxnUizRSOqJTw==
X-Received: by 2002:a17:903:1b43:b0:294:cc1d:e28d with SMTP id d9443c01a7336-29b6c50c704mr246709565ad.25.1764231786633;
        Thu, 27 Nov 2025 00:23:06 -0800 (PST)
Received: from localhost ([122.172.86.94])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-be4fb2490bcsm1176810a12.2.2025.11.27.00.23.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Nov 2025 00:23:06 -0800 (PST)
Date: Thu, 27 Nov 2025 13:53:03 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dma-buf: add no-op stubs when CONFIG_DMA_SHARED_BUFFER
 is disabled
Message-ID: <4o3meb52jvgjrtqswpmrgkgjhn4zbzkvmyen4zqrkzeypsthpt@nt4vm7jwqash>
References: <6202945f4af2d10e0fb6602b25ff9cb454c1ee85.1764229204.git.viresh.kumar@linaro.org>
 <8d5ae067-e1bf-46a7-9137-d5936197ad5c@amd.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8d5ae067-e1bf-46a7-9137-d5936197ad5c@amd.com>

On 27-11-25, 09:07, Christian König wrote:
> On 11/27/25 08:40, Viresh Kumar wrote:
> > Move several dma-buf function declarations under
> > CONFIG_DMA_SHARED_BUFFER and provide static inline no-op implementations
> > for the disabled case to allow the callers to build when the feature is
> > not compiled in.
> 
> Good point, but which driver actually needs that?

This broke some WIP stuff [1] which isn't posted upstream yet. That's why I
didn't mention anything in the commit log, though I could have added a comment
about that in the non-commit-log part.

> In other words there should be a concrete example of what breaks in the commit message.

There is time for those changes to be posted and not sure if they will be
accepted or not. But either way, this change made sense in general and so I
thought there is nothing wrong to get this upstream right away.

> > +static inline struct dma_buf *dma_buf_get(int fd)
> > +{
> > +	return NULL;
> 
> And here ERR_PTR(-EINVAL).

I am not really sure if this should be EINVAL in this case. EOPNOTSUPP still
makes sense as the API isn't supported.

> > +static inline struct dma_buf *dma_buf_iter_begin(void)
> > +{
> > +	return NULL;
> > +}
> > +
> > +static inline struct dma_buf *dma_buf_iter_next(struct dma_buf *dmbuf)
> > +{
> > +	return NULL;
> > +}
> 
> Those two are only for BPF and not driver use.

Will drop them.

-- 
viresh

[1] https://git.kernel.org/pub/scm/linux/kernel/git/vireshk/linux.git/log/?h=virtio/msg

