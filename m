Return-Path: <linux-media+bounces-48000-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 776EEC99341
	for <lists+linux-media@lfdr.de>; Mon, 01 Dec 2025 22:39:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id D8863345B8B
	for <lists+linux-media@lfdr.de>; Mon,  1 Dec 2025 21:39:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51C7827C842;
	Mon,  1 Dec 2025 21:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Myo45zAN"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43FE11E3DED
	for <linux-media@vger.kernel.org>; Mon,  1 Dec 2025 21:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764625168; cv=none; b=rmnTZ1zyYVrBjH1NyJI67UoqfhoaGzZhGVSVMlIMMSfOZCvDhfqg+F5kjP5g+ShGW4Xr62ftC6W1ZmWFXt0bodBz0D3rYbKVrLgIY+OJyfnJ+9OC2a8S4ngvZxx6f6CwMwM1CReYtbtul7M9y0zH4ZYbazmNUTOK4JfANSWWGa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764625168; c=relaxed/simple;
	bh=U4slgXRD+dMp6ywPD/K2z2TxnSH9XuiVK+Qj3WU6OpA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HMpKJ4EZxR8MCg05pbyMaChhqp5/ruFalURbw080C53+PDvyvKi4CPqX4keVAjwTeVW+3aC3F+Y/uXn/TxMurIYxIFItDMpb6WAxtklsDqUmUFgoOodUUd7XWq6WUm/BoUaTDqQMf+ChK0qQ6y3KGesYevfUq01Up01j7Xfssdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Myo45zAN; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-8b2ec756de0so443167885a.3
        for <linux-media@vger.kernel.org>; Mon, 01 Dec 2025 13:39:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764625166; x=1765229966; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ya5FXlt3fgfn2bY5272+Q5pv7MOagNgU6+eVeVRebso=;
        b=Myo45zANTssQ1EH+BcfZ1U1/xNSKSXHZZfUA1UeV3BTK2GGzsvYhvQiOlUF2BFbiea
         NJMq8He59oUZKVQ5HNEh49DToNVlneqUJwITJhX+82j5CIMwyipjD8rT+TGWo1wSMTId
         EzKMe+Kf2m5rc/ZuBTGMp/D5HBqy6djTLTkIk9/iiDtzd66qZz77dkh6LL8sf3+olxhy
         OlTdsbXQ1MEcKkSqOU/omgsk77JZN7cz0pA79Q/rNUSERN5QI9N6fIeb8X79yg3tDaUK
         oscemapBlib2ImvtZPwgU0kkXQpRZs0+ALE2vEVfYiCHcODAxj1749yKvMoipEbjfMXk
         FMtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764625166; x=1765229966;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ya5FXlt3fgfn2bY5272+Q5pv7MOagNgU6+eVeVRebso=;
        b=cSiJQqMy6mC9NaNYKFABZeKDafv5OJrrHQkxMnA0JuM6UMuctfvoUesBNuPKkA67m7
         +vTC//t4DwDmemBo8o2B0brLAE5YSsY2LEK2OAMcJUFVpOjxhY0DxhOB7jrqYGw1+G8X
         3sJxMBpwrIikAqjcyJ60KOfXmiTCbhB3ArmGNITb64kyPzCCJHwK3wYkRB5QdMwiobWY
         ppG31f6VikTLlx6gpytIlxUefMGcmMiwnfJ4jc22Gt71icrbjGxLfInL2/ssC6DrhRkq
         oHcF3PLjLXWPWV+XltHSu7YjqLo4OQDo6ejuAzLEjCVf84d2UNt7m3JFgmSz/rtLBL7c
         Mnpw==
X-Forwarded-Encrypted: i=1; AJvYcCXNRAPN4lFiVEP7YDHDB/Hr69/F9TnKFP4INd+LveVRaqz1tUwryiJepeKv988PJkR8Km/03t7pEndLdw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxsedpCSuOGgcJ6arZAlXRDmilDeqtWZl4AFu/qLh/gMYKNU9Xy
	WjFryKKktfm/Gw7O5kdKQdTBF5wmR+Abij4fiSAlt+EieO1TCaBB3Z6aLMGkYfcRry1NDCpfWvh
	OweFRIKfuPk7tCixTIgC3o36/lXHOq+4=
X-Gm-Gg: ASbGncvCYP4dNCxIffMNrUqdinpFy8z0iowqJMLbGp69rRs6iYyAxLKsElkWklaF764
	XmTQ+T8ls7UVz3MSS8ufZo3PnG/DjTNezHEXrsj2FHF3qJ/cCryTGn2docVPXs+7SpZA5EU7ECQ
	OtChesBiA9k4tQpbS7NRa+JnZthYFyhlpdVgMvgBeF4rNRtp6f5Xv8Fv3hyGMS1BhhC8uoxNsbe
	zVhBNPioouoGvTunspconQI2KgwvIkeTE/3bU7TKezlT0VfVZOhdcA5I5uzaRLxdf5xwA==
X-Google-Smtp-Source: AGHT+IFDJ6lg5MxUSmUVun4F/Tz+fV/DaTriGHNCnPcATTgtDfNsilRg6+Hi6qXUw8UE/oCfbowoPuItAeaNKnkxOOI=
X-Received: by 2002:a05:620a:2907:b0:857:890f:7fab with SMTP id
 af79cd13be357-8b4ebdce57dmr3735537485a.85.1764625165847; Mon, 01 Dec 2025
 13:39:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251122090343.81243-1-21cnbao@gmail.com> <ed7701d7-28c8-4760-9ccb-f22fc1e9528e@kernel.org>
In-Reply-To: <ed7701d7-28c8-4760-9ccb-f22fc1e9528e@kernel.org>
From: Barry Song <21cnbao@gmail.com>
Date: Tue, 2 Dec 2025 05:39:14 +0800
X-Gm-Features: AWmQ_bkntYc9RqDd7viHZ4oh-bPL-P8xMulAYuAEyBuveMg92U8PVcocpttZ0iw
Message-ID: <CAGsJ_4zwXiwvHYvX6pBsyWLi-LXQcTDzR=e+hQ_4YOLd5BhCOA@mail.gmail.com>
Subject: Re: [PATCH RFC] mm/vmap: map contiguous pages in batches whenever possible
To: "David Hildenbrand (Red Hat)" <david@kernel.org>
Cc: akpm@linux-foundation.org, linux-mm@kvack.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	linux-kernel@vger.kernel.org, Barry Song <v-songbaohua@oppo.com>, 
	Uladzislau Rezki <urezki@gmail.com>, Sumit Semwal <sumit.semwal@linaro.org>, 
	John Stultz <jstultz@google.com>, Maxime Ripard <mripard@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 1, 2025 at 6:36=E2=80=AFPM David Hildenbrand (Red Hat)
<david@kernel.org> wrote:
[...]
> >
> > diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> > index 0832f944544c..af2e3e8c052a 100644
> > --- a/mm/vmalloc.c
> > +++ b/mm/vmalloc.c
> > @@ -642,6 +642,34 @@ static int vmap_small_pages_range_noflush(unsigned=
 long addr, unsigned long end,
> >       return err;
> >   }
> >
> > +static inline int get_vmap_batch_order(struct page **pages,
> > +             unsigned int stride,
> > +             int max_steps,
> > +             unsigned int idx)
>
> These fit into less lines.
>
> ideally
>
> \t\tunsigned int stride, int max_steps, unsigned int idx)

Right, thanks!

>
> > +{
>
> int order, nr_pages, i;
> struct page *base;
>
> But I think you can just drop "base". And order.

Right, thanks!

>
> > +     /*
> > +      * Currently, batching is only supported in vmap_pages_range
> > +      * when page_shift =3D=3D PAGE_SHIFT.
> > +      */
> > +     if (stride !=3D 1)
> > +             return 0;
> > +
> > +     struct page *base =3D pages[idx];
> > +     if (!PageHead(base))
> > +             return 0;
> > +
> > +     int order =3D compound_order(base);
> > +     int nr_pages =3D 1 << order;
>
>
> You can drop the head check etc and simply do
>
> nr_pages =3D compound_nr(pages[idx]);
> if (nr_pages =3D=3D 1)
>         return 0;
>

Nice. Since compound_nr() returns 1 for tail pages.

> Which raises the question: are these things folios? I assume not.

In my case, it=E2=80=99s simply alloc_pages with GFP_COMP. I assume that fo=
lios
allocated via folio_alloc() would also automatically benefit from this patc=
h?

Currently, vmap() takes a pages array as an argument. So even for a folio,
we need to expand it into individual pages. Simply passing a folios array t=
o
vmalloc likely won=E2=80=99t work, since vmap() could start and end at subp=
ages
in the middle of a folio.

Thanks
Barry

