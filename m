Return-Path: <linux-media+bounces-49097-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C8BCACCD78E
	for <lists+linux-media@lfdr.de>; Thu, 18 Dec 2025 21:07:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0A4F83064ACC
	for <lists+linux-media@lfdr.de>; Thu, 18 Dec 2025 20:05:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA3B92C11CF;
	Thu, 18 Dec 2025 20:05:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K9LqfEjt"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFCCD28F935
	for <linux-media@vger.kernel.org>; Thu, 18 Dec 2025 20:05:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766088319; cv=none; b=VD4PPvNml6lIbqfczeI07xhMn9O5eHbLvSJsGdLQU2AcW01b8gWT2oaV9+J06d/UCTwlhAfW69LcsdRAH1NpmRlZGRQjGcF8Bp8MRZSEfefJbQuWjSLFeOopDpJYq3S7GuR0Ofs9iBSXKmadpR3F/YrM1ga/PBMqMmyWYqFwWog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766088319; c=relaxed/simple;
	bh=Bj7ArpI1zliRyozAKONZyEGVIoQM9hgLsbKdE2au0pY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fwTfWwAu6dsj5fL8RhfdbWA90ZLVfRyB3lN6To7XfpvInzfNyAerx5PDqk4oDjOgLYh3UaH3sEudfrEnEK7in4tm9vdX/x2VMhZcoJNjqCvrxHf4KSno+HZHctHs+myq4TmYEPzkjFRL1WPw6yHygz/19HLydnoFGLPGeloxRdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K9LqfEjt; arc=none smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-8887f43b224so13384136d6.1
        for <linux-media@vger.kernel.org>; Thu, 18 Dec 2025 12:05:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766088316; x=1766693116; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=K2w2+c+YKiYKr2r9Xowor6oYCm9+yfeKolfOeIUsbJQ=;
        b=K9LqfEjt/aTA5UJeWzMvqU5KZRru4CKk4J7zfdBsVmVjne9qz3zCzurUbKh8vG25rH
         +3kIa6Qze8uP120cBQFvujzfo+W9F2LtBmKsIVoWxW/fMIs5or8W0PKRrAq2SsBcZl6l
         J2r0LIUIrWZdq42qNkyHtEjEuLGc4/RxHwNyK0uyS4Atdqqa0xKv/2Cwho274Vjaz0bV
         Oxcc3VO6OhklqcSTJeEbjNUMsxsmjZDqTIvlesSSF9EOyFZ+0ES3yGH/F7cqmA60Sji3
         eTuMBVqaBPJtCG2N0fFgRXyx5tPS10oqGTIxTxr34VWcLZUQhUHqBXIigRvzthZ2Sj8I
         Hwcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766088316; x=1766693116;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K2w2+c+YKiYKr2r9Xowor6oYCm9+yfeKolfOeIUsbJQ=;
        b=a4EiGOWEC0VyAMJY+htIgQKqndCqQY7ExxTjXjIiPvp0eT2J6Oyoo6OMgXwimHuae5
         XHWGKb+DfHgjtzvMwFRi7jntXstDKhO1gqrhm7uW774eX2pTwZjj/dqzk82OOZCKolrj
         ZOM/QiDihrvgFnhlP27aZF84B81z0kdvtWbYTzsMCnF+7Ovw+uESEV53u8V5dq8TbO7F
         Kfdl1O9PrWwGrVERSISDsAuJ7LjGgbQTZNYmYW2ZfNewliNnTW0hgnDedIA3Lp/ekTSz
         X7PjKG1UQBgbAVEtkSI8i8J10OFIM/QUHH1NNxNII55+UytQcw9Z4Gqqm1qvbtUpyHPM
         oxvw==
X-Forwarded-Encrypted: i=1; AJvYcCXKePq4lpnG7/ylAVPFvsYgMUhyHqdq8xGMNfULVblMNHuUz0I8yYSJAUABOceMK+iYB9SW56MtO0I5aw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz99ZigHmArfB79FpkHIVVcS1ztvsTc3RvjrB+d/8RB0nTI2+9D
	vaMqi6FQkehalBudSTnNZ8clJdmhFtCIQucHhWp7QRqqcpigXkeUBqg4IGrv3B2UK/LlodGLx+m
	MqobKQYwWsckm1Ztu8M/+5+12WXvv3j4=
X-Gm-Gg: AY/fxX5nVa8uY2sTA2d/IsBy+YdeSrlJ+P2AYGdqR+fBKJBw47Y6Pq0+dWapA67/Hxv
	10nnQlBAWSW4cFcD7Qkccl0RQFuRWTzh9obSgjbb8swFQZi1bS7KtS51UdSOQeTSbJt6V86KyC3
	SgT+AladprjCFDu8VYzof51IKsvPc5N1cCH2K4h61a2et43Uu5uGq4hrmABxWjA0wAbA0saU5dx
	//t/LIghpSbqfdcbfbhBeOvcJGvZjeGdDmd1HAEZDxWwBcgvsgxctSNTQHoecpG8Hp0EA==
X-Google-Smtp-Source: AGHT+IGfIU5RGxtASwu3bgpX3b92cFmnR8DyddSN6GsrTR4BnDx7NubHp+pRDhWWPTmxwurkx7B44lRP57rfNIwWyMU=
X-Received: by 2002:a05:6214:4e07:b0:882:4488:482 with SMTP id
 6a1803df08f44-88d84434111mr12774246d6.62.1766088316168; Thu, 18 Dec 2025
 12:05:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251215053050.11599-1-21cnbao@gmail.com> <aUQJEa643lQAGK6s@milan>
In-Reply-To: <aUQJEa643lQAGK6s@milan>
From: Barry Song <21cnbao@gmail.com>
Date: Fri, 19 Dec 2025 04:05:05 +0800
X-Gm-Features: AQt7F2raxnY_WBDzIdYwiT21G3LhQyvH-Z-k4m21oQXjYaLgAcLMtZPi1-shSsA
Message-ID: <CAGsJ_4zwqbg889+CTtO8XLQZu+rFs-m6+kANKO78-TAf4zjjaA@mail.gmail.com>
Subject: Re: [PATCH] mm/vmalloc: map contiguous pages in batches for vmap()
 whenever possible
To: Uladzislau Rezki <urezki@gmail.com>
Cc: akpm@linux-foundation.org, linux-mm@kvack.org, 
	dri-devel@lists.freedesktop.org, jstultz@google.com, 
	linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, Barry Song <v-songbaohua@oppo.com>, 
	David Hildenbrand <david@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>, 
	Maxime Ripard <mripard@kernel.org>, Tangquan Zheng <zhengtangquan@oppo.com>
Content-Type: text/plain; charset="UTF-8"

[...]
> >
> > +static inline int get_vmap_batch_order(struct page **pages,
> > +             unsigned int stride, unsigned int max_steps, unsigned int idx)
> > +{
> > +     int nr_pages = 1;
> > +
> > +     /*
> > +      * Currently, batching is only supported in vmap_pages_range
> > +      * when page_shift == PAGE_SHIFT.
> > +      */
> > +     if (stride != 1)
> > +             return 0;
> > +
> > +     nr_pages = compound_nr(pages[idx]);
> > +     if (nr_pages == 1)
> > +             return 0;
> > +     if (max_steps < nr_pages)
> > +             return 0;
> > +
> > +     if (num_pages_contiguous(&pages[idx], nr_pages) == nr_pages)
> > +             return compound_order(pages[idx]);
> > +     return 0;
> > +}
> > +
> Can we instead look at this as: it can be that we have continues
> set of pages let's find out. I mean if we do not stick just to
> compound pages.

We use PageCompound(pages[0]) and compound_nr() as quick
filters to skip checking the contiguous count, and this is
now the intended use case. Always checking contiguity might
cause a slight regression, I guess.

BTW, do we have a strong use case where GFP_COMP or folio is
not used, yet the pages are physically contiguous?

Thanks
Barry

