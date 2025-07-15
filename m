Return-Path: <linux-media+bounces-37809-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C4F9FB067B4
	for <lists+linux-media@lfdr.de>; Tue, 15 Jul 2025 22:28:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 19B8F1C20A32
	for <lists+linux-media@lfdr.de>; Tue, 15 Jul 2025 20:28:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8DE1277CBD;
	Tue, 15 Jul 2025 20:28:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="T78iCHOb"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9421517BA1
	for <linux-media@vger.kernel.org>; Tue, 15 Jul 2025 20:28:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752611306; cv=none; b=uPv5jWF9QCHlj9CqkLa0A6/4cmKl/hveSDdMUAVus0XGI1S6Icv04QqXY/j1jKm5nW/uhFe63bcL8DgIX2E5l6OQU1SIqeCpvZPcF6QB2co89lrYI+tiVK5j8+T++4+xN0buNaZH/KkO1QzXcrQS7zGirqqFVfuKVJqA+EIN/Nw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752611306; c=relaxed/simple;
	bh=f18xUSNYlIgcF+irC+t3oUU0HbN58hfSUqHKahrCqX8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mDql9xn8370wa587f9vGkhu0fpMhLgzglfBAcVgR3X3F6rnqJKRORT+Cj47Z2UBi4gO0f/vN2wAiN+MRSqUArNmDTi7+JIxDCdRLyL9RXVCCpy1kv816s6Tyqep9Xiygkz9ru1cPC9Tn6itNm6nFYrDiKw1EWPMuijt1FemaqpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=T78iCHOb; arc=none smtp.client-ip=209.85.167.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-41b1ca1f28cso1160148b6e.1
        for <linux-media@vger.kernel.org>; Tue, 15 Jul 2025 13:28:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752611303; x=1753216103; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=I0ZfHGVA/rm3ONyiwkO2hMc1ZMvcrO1JkM9rtniwgBg=;
        b=T78iCHObyhFGmtOXQHF3abR6e8s2B3S0BZvNinvzxTlKnxtViqtdh9msV4tr1XhcAX
         RofpwMmQxhjwwkYXHgmQOgp2YaZvBJ7XkkfG3o0kayr9WhmQCHvm/HRM0jfiSkZCPcFv
         aSOrhbNwZ/MuWd3cC7sborg+B3Cm8Yo0MaAUJneSsnZhapMKh8WBCi1l2ccF1WybJDkf
         gbAvDjXKGDgyP4z9xskQVg5w6W8GLV5YFq2a2DQDzrc60MZ4SJePHDVM+oyxMG9BSQs3
         8GZOzsfpKiSSTBy4vDZLiWgWfd8zL5l2dBTsB/NPIOTkgMeoNqdwKWlQAJyt6uKL7XB4
         gjWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752611303; x=1753216103;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=I0ZfHGVA/rm3ONyiwkO2hMc1ZMvcrO1JkM9rtniwgBg=;
        b=dteWi1OdSBYL6eM9U4D2xZZQreK+B5BO1bwaC+pmCW+4TwLqfIvPiMsCo1NMRtfc6+
         A+Ne7Fx+RVl8zJbEF3LppvhiVOOpB1b6NBjc9mEoBYzOm1AIttuYAhGVB96JKWPXXQJV
         HFycwCNiM0GWx2NWxC5n12vSo2J0UlDVdcrYqBQIkkmEQlD7YzHhUg9Y16RG9JZeZax0
         fyHr1XGxqKNRV+rf0sd2ZbQbRU/20b6voH9rGHajwczm0I0ayEGcUj0qX/M37DnoXnLA
         oeSQNdC+pT9NZoFFcOzeh2MS6yuab0M5NYh+OEoRJsBaFzTYV6qHk9DaDOGuI9dpbJAv
         nQTA==
X-Gm-Message-State: AOJu0Yws2cCdgiqsvB43f+BSX6zzFWcfSDwU9daZcVhl5NZF1eU4EYEy
	vWOJeyO24DMDdqfwKDaTPl3/A5dg6hUEiyQPqmMgXPaCGWAQ2IrwzCPMYvh/oK513DGEeeWgpsh
	lJ5WI
X-Gm-Gg: ASbGnctK0nRk44ygBXiKdboVi4szcLnjmGlf88GO8f83UJOaw9NFkYR58/eY28iu7nZ
	uKHklwBSoPVZeCjbsmD5tlX/SyPIh3ZCBQAWdV69/4+3DSQlbGOTDm3yftChyoejzAPzXLy0cw5
	klSDA94+7qx1GtV8VNooX6hCi8RzI3MG87ITx8u2BNOJYXG6PMxZGkZC1eu/XLDdL31iecvKVyk
	XN/KcfxfLl88jGX5gDK/ap9mLLVHX6CDDXKfD2Qtt0YaN1zJEggzbKIbRVJFUsmhnZ7JUc2pF7y
	eTQvT7ma/p1H8zIUyfNZI9BoAwjdug60Rk3waH3NaAzakvx+vq7At9d/1kpyDI2FwLYkny3Jt7E
	LSozDLHTg7uZuPCtPZfQ3k4jDexa7
X-Google-Smtp-Source: AGHT+IG4VA/3K7wBqJHGHAXakCfDjLQqrhd/V7nBLNlCVsFdNiBAZkrjO3Jzmyhv7E9j2YiZjwCxmg==
X-Received: by 2002:a05:6808:80b1:b0:41c:31f:fdd1 with SMTP id 5614622812f47-41d0555e2a9mr107309b6e.29.1752611303539;
        Tue, 15 Jul 2025 13:28:23 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:9b4e:9dd8:875d:d59])
        by smtp.gmail.com with UTF8SMTPSA id 5614622812f47-41c8f9b481asm331390b6e.43.2025.07.15.13.28.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 13:28:23 -0700 (PDT)
Date: Tue, 15 Jul 2025 15:28:21 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Yu Liao <liaoyu15@huawei.com>
Cc: linux-media@vger.kernel.org
Subject: [bug report] media: use struct_size() helper
Message-ID: <72cfeef1-589d-4946-ace3-c5796fad767a@sabinyo.mountain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello Yu Liao,

Commit ba85aea885a1 ("media: use struct_size() helper") from Aug 16,
2023 (linux-next), leads to the following Smatch static checker
warning:

	drivers/media/common/videobuf2/frame_vector.c:162 frame_vector_create()
	warn: saving 'size_add' to type 'int'

drivers/media/common/videobuf2/frame_vector.c
    152 /**
    153  * frame_vector_create() - allocate & initialize structure for pinned pfns
    154  * @nr_frames:        number of pfns slots we should reserve
    155  *
    156  * Allocate and initialize struct pinned_pfns to be able to hold @nr_pfns
    157  * pfns.
    158  */
    159 struct frame_vector *frame_vector_create(unsigned int nr_frames)
    160 {
    161         struct frame_vector *vec;
--> 162         int size = struct_size(vec, ptrs, nr_frames);
                ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Using struct_size() and then saving the result as an int, doesn't add
any safety.  It needs to be saved to size_t.

    163 
    164         if (WARN_ON_ONCE(nr_frames == 0))
    165                 return NULL;
    166         /*
    167          * This is absurdly high. It's here just to avoid strange effects when
    168          * arithmetics overflows.
    169          */
    170         if (WARN_ON_ONCE(nr_frames > INT_MAX / sizeof(void *) / 2))

There are some integer overflow checks here which are unnecessary if we're
going to use struct_size().

The reason why this uses INT_MAX is that you're not allowed to allocate
more than 2GB of data with kvmalloc().  If you want to allocate
ridiculous amounts of memory then you need to use vmalloc().  This is a
security thing because after 2GB then integers start to wrap.

It would be easier to write:

	if (size > INT_MAX)
		return NULL;

    171                 return NULL;
    172         /*
    173          * Avoid higher order allocations, use vmalloc instead. It should
    174          * be rare anyway.
    175          */

This say use vmalloc() but the code uses kvmalloc().  I don't know what
this comment means.

    176         vec = kvmalloc(size, GFP_KERNEL);
    177         if (!vec)
    178                 return NULL;
    179         vec->nr_allocated = nr_frames;
    180         vec->nr_frames = 0;
    181         return vec;
    182 }

regards,
dan carpenter

