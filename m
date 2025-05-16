Return-Path: <linux-media+bounces-32654-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D1568ABA30A
	for <lists+linux-media@lfdr.de>; Fri, 16 May 2025 20:37:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 61C26506623
	for <lists+linux-media@lfdr.de>; Fri, 16 May 2025 18:37:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DB3A278E6B;
	Fri, 16 May 2025 18:37:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="iEnxUU+a"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADAB33595C
	for <linux-media@vger.kernel.org>; Fri, 16 May 2025 18:37:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747420660; cv=none; b=SIqfHhsD4Le1xLaBY88Y0h44YbJGXq6WIKkCtS05ra5iKweKDpSD3KYWDJcz1MskBNwtWMv7dfj2I+7NcrHmkJdEeUSztVmB69LkNebwMjLjFjUVXW3gB68cfD6u9dGIj2TJybCWmRAZjBelwiQ9BlwxsxZMMZw4+l6t/vcZjWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747420660; c=relaxed/simple;
	bh=gOeKYb5vYdZNr2gwQABA+VzQ6mUMvYPCKs/UEbg4pTM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kvFEHVNX6QbPj4AK4Wfmo7AuzF8JvfMW9fu1Z17deL7BL4FptX+vnzS+XfsQGWPNpnQkNAx9RHgH/GwcHJkfHkHPrtQ28DkqrvaoX6PbQVEryjhKKV3l4zGiDKzNhdG5LmObhnjFjNt3qDwtTS89kG6KYWm0pqiPunyTWo+0myk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=iEnxUU+a; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-442f97af707so7865e9.0
        for <linux-media@vger.kernel.org>; Fri, 16 May 2025 11:37:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747420657; x=1748025457; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4Ry0OoNS1HfAuyBqppCjMr/xQteIVXdqvCv1soIeng0=;
        b=iEnxUU+a38eKB9XqmwIGBLb1Kv3iCgLdU0oQZ+SZr34imGPMHZxWGIiPBrWQ245GxI
         v6GZqMk1jCsk3ngF6Xx9fA+n/YNtxJAUANF6qRWjKDTqVqyVvXGOKP6lATU/rWo0oHGd
         6eWW/oKQprBr2rUcv/iqPIq87So9z0lSZC2qPWhIzLE/CYdBIW8SlGfqmeNL/hhfKEx/
         +yj2xx27rrHdB83Aa2SWHJQt+F9Bfi+Z0EOs7WZP+0Ptk6XbJG1de0ZzLN3LCuA0xzNw
         n14umz2snebJeOGyKpWxTj7GICG/oixPxuK1n/vvZ2jIxrtF7+8m341DjmDteSMACM1W
         P6xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747420657; x=1748025457;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4Ry0OoNS1HfAuyBqppCjMr/xQteIVXdqvCv1soIeng0=;
        b=lBoPQJU/CzuXGXSpoLTmCGWatmnXGkDt6v3ujW1ikHPj6BTmceamkG7GwC0DXpTAkX
         2dM0eNT0/FEge0Zc/FzTIqdQD3g7d7DPqHMLVCtRz0bY7gJX2GcxblOFvDJrRMwWfbBG
         4q+3mJB/9yEggY0nHezZ7tJbtb3vdVk4/RAPrLGteNkjzeyTJbJpra7h/h/QdId2zV6o
         sPrR/ZD8cBjznpRnIk5Qih1c02A3HGPW89arorgwdnzNq5t1vGGbVJmR757kkKYcqP69
         /MSerbdLrL9SAlNz3PYJ0PfxaY/79qbzcLeT0fOucFVgan7jua3g0pB4rwy51Qqctnzy
         i+/Q==
X-Forwarded-Encrypted: i=1; AJvYcCXBUN+EzC4uY3PggtYK5Py9rTOO0F0bbBf03jGCcNdedBdlY8mWRbdBRz6Phb7BJPD+L7pLtAoLyVI5Ng==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyde/AmoInJcagUY+besD/8qTueInXPQ8rNFGM7hWZDDwjgiFwN
	CcG4nAHq0qz97BFr8A5TLX6+RS/G3iPqvWYkxRPVeXX9agJGIyf3ejxQZFn/4502n8t0DGSa7b+
	DGYVVW8hIsWvhCX83+KDIc9mcXWewxAe1iGf8YX4y
X-Gm-Gg: ASbGnctsRnyGgtu066Xn7eBJz3gZtKOF4teKTrP92Ht5tpBEaMw34iEo1eWPyD2bfXX
	uxkkAf7heDyQWgep6lje2jH8XyLscq89ECXA31ANQfMUXRyM1xdl4yuY/ceaBgNgQy1lpbOsvtc
	ubHbaa1x0alhaSABATyEdNbtD0s4N/jNs=
X-Google-Smtp-Source: AGHT+IFlJwYSklgxEvZl8Ke3yMdeH7Aynfa6I4TzkjA+ku62ilt/KyiolYrem1WwEweVEMjnl2UEtaZa6LgR8VQKh+4=
X-Received: by 2002:a05:600c:2e49:b0:439:961d:fc7d with SMTP id
 5b1f17b1804b1-443ae3dbdfdmr86285e9.6.1747420656773; Fri, 16 May 2025 11:37:36
 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250513092803.2096-1-tao.wangtao@honor.com> <fdc8f0a2-5b2f-4898-8090-0d7b888c15d8@amd.com>
 <5b68b2a50d48444b93d97f5d342f37c8@honor.com> <ef978301-6a63-451d-9ae6-171968b26a55@amd.com>
 <9f732ac8b90e4e819e0a6a5511ac3f6d@honor.com> <50092362-4644-4e47-9c63-fc82ba24e516@amd.com>
 <2755aae2f1674b239569bf1acad765dc@honor.com> <2487bad4-81d6-4ea2-96a7-a6ac741c9d9c@amd.com>
 <a3f57102bc6e4588bc7659485feadbc1@honor.com> <5c11b50c-2e36-4fd5-943c-086f55adffa8@amd.com>
In-Reply-To: <5c11b50c-2e36-4fd5-943c-086f55adffa8@amd.com>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Fri, 16 May 2025 11:37:24 -0700
X-Gm-Features: AX0GCFtOts9XRJe0V3KGcBdQUf6jVo13nhHDmbXLMWQDLR6a1LqvOs4ZgU-TPRo
Message-ID: <CABdmKX30c_5N34FYMre6Qx5LLLWicsi_XdUdu0QtsOmQ=RcYxQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] dmabuf/heaps: implement DMA_BUF_IOCTL_RW_FILE for system_heap
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: wangtao <tao.wangtao@honor.com>, 
	"sumit.semwal@linaro.org" <sumit.semwal@linaro.org>, 
	"benjamin.gaignard@collabora.com" <benjamin.gaignard@collabora.com>, 
	"Brian.Starkey@arm.com" <Brian.Starkey@arm.com>, "jstultz@google.com" <jstultz@google.com>, 
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, 
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
	"linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"wangbintian(BintianWang)" <bintian.wang@honor.com>, yipengxiang <yipengxiang@honor.com>, 
	liulu 00013167 <liulu.liu@honor.com>, hanfeng 00012985 <feng.han@honor.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 16, 2025 at 1:36=E2=80=AFAM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> On 5/16/25 09:40, wangtao wrote:
> >
> >
> >> -----Original Message-----
> >> From: Christian K=C3=B6nig <christian.koenig@amd.com>
> >> Sent: Thursday, May 15, 2025 10:26 PM
> >> To: wangtao <tao.wangtao@honor.com>; sumit.semwal@linaro.org;
> >> benjamin.gaignard@collabora.com; Brian.Starkey@arm.com;
> >> jstultz@google.com; tjmercier@google.com
> >> Cc: linux-media@vger.kernel.org; dri-devel@lists.freedesktop.org; lina=
ro-
> >> mm-sig@lists.linaro.org; linux-kernel@vger.kernel.org;
> >> wangbintian(BintianWang) <bintian.wang@honor.com>; yipengxiang
> >> <yipengxiang@honor.com>; liulu 00013167 <liulu.liu@honor.com>; hanfeng
> >> 00012985 <feng.han@honor.com>
> >> Subject: Re: [PATCH 2/2] dmabuf/heaps: implement
> >> DMA_BUF_IOCTL_RW_FILE for system_heap
> >>
> >> On 5/15/25 16:03, wangtao wrote:
> >>> [wangtao] My Test Configuration (CPU 1GHz, 5-test average):
> >>> Allocation: 32x32MB buffer creation
> >>> - dmabuf 53ms vs. udmabuf 694ms (10X slower)
> >>> - Note: shmem shows excessive allocation time
> >>
> >> Yeah, that is something already noted by others as well. But that is
> >> orthogonal.
> >>
> >>>
> >>> Read 1024MB File:
> >>> - dmabuf direct 326ms vs. udmabuf direct 461ms (40% slower)
> >>> - Note: pin_user_pages_fast consumes majority CPU cycles
> >>>
> >>> Key function call timing: See details below.
> >>
> >> Those aren't valid, you are comparing different functionalities here.
> >>
> >> Please try using udmabuf with sendfile() as confirmed to be working by=
 T.J.
> > [wangtao] Using buffer IO with dmabuf file read/write requires one memo=
ry copy.
> > Direct IO removes this copy to enable zero-copy. The sendfile system ca=
ll
> > reduces memory copies from two (read/write) to one. However, with udmab=
uf,
> > sendfile still keeps at least one copy, failing zero-copy.
>
>
> Then please work on fixing this.
>
> Regards,
> Christian.
>
>
> >
> > If udmabuf sendfile uses buffer IO (file page cache), read latency matc=
hes
> > dmabuf buffer read, but allocation time is much longer.
> > With Direct IO, the default 16-page pipe size makes it slower than buff=
er IO.
> >
> > Test data shows:
> > udmabuf direct read is much faster than udmabuf sendfile.
> > dmabuf direct read outperforms udmabuf direct read by a large margin.
> >
> > Issue: After udmabuf is mapped via map_dma_buf, apps using memfd or
> > udmabuf for Direct IO might cause errors, but there are no safeguards t=
o
> > prevent this.
> >
> > Allocate 32x32MB buffer and read 1024 MB file Test:
> > Metric                 | alloc (ms) | read (ms) | total (ms)
> > -----------------------|------------|-----------|-----------
> > udmabuf buffer read    | 539        | 2017      | 2555
> > udmabuf direct read    | 522        | 658       | 1179

I can't reproduce the part where udmabuf direct reads are faster than
buffered reads. That's the opposite of what I'd expect. Something
seems wrong with those buffered reads.

> > udmabuf buffer sendfile| 505        | 1040      | 1546
> > udmabuf direct sendfile| 510        | 2269      | 2780

I can reproduce the 3.5x slower udambuf direct sendfile compared to
udmabuf direct read. It's a pretty disappointing result, so it seems
like something could be improved there.

1G from ext4 on 6.12.17 | read/sendfile (ms)
------------------------|-------------------
udmabuf buffer read     | 351
udmabuf direct read     | 540
udmabuf buffer sendfile | 255
udmabuf direct sendfile | 1990


> > dmabuf buffer read     | 51         | 1068      | 1118
> > dmabuf direct read     | 52         | 297       | 349
> >
> > udmabuf sendfile test steps:
> > 1. Open data file(1024MB), get back_fd
> > 2. Create memfd(32MB) # Loop steps 2-6
> > 3. Allocate udmabuf with memfd
> > 4. Call sendfile(memfd, back_fd)
> > 5. Close memfd after sendfile
> > 6. Close udmabuf
> > 7. Close back_fd
> >
> >>
> >> Regards,
> >> Christian.
> >
>

