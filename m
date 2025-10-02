Return-Path: <linux-media+bounces-43641-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 09757BB3F95
	for <lists+linux-media@lfdr.de>; Thu, 02 Oct 2025 15:02:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B2A983A550E
	for <lists+linux-media@lfdr.de>; Thu,  2 Oct 2025 13:02:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CEFF3112C4;
	Thu,  2 Oct 2025 13:02:30 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF5C830F95A
	for <linux-media@vger.kernel.org>; Thu,  2 Oct 2025 13:02:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759410150; cv=none; b=ewndqUTQnk3081g39MAGAM+eQDRN0f7uY/pQVuJDm3zalj77bhv8H07RvHubwWigAE72Ot5aVamWRBBaaqT4uEwL5UXi8WSvuT6pLJ9cTxxtCQPACd81RsNMnjxvvKgONhUe0m4Des2fqH+0fDD/ye/5Q0EI30R9qMV0q5bfeVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759410150; c=relaxed/simple;
	bh=Bzm3UVzy5UmWZcilLMKv+UlC3Okbitce2Is02Gaxtrg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Zg49vjjKGjFlyHaCE8wRiQuBooUW1j9bNIQidyOhjLydiGl7hwJMuqwlgkQpLSdQCDhWJGXxPtS7uHbmv7a3zbKN6OmavJhCxDnowDTWhy2+gZIm/+AAPo2UZWHE7YTzOi2F2/qUXU/NydSjilupTT9jDNKhUjJ8EskJePNtacc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.210.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-74a61973bedso687099a34.0
        for <linux-media@vger.kernel.org>; Thu, 02 Oct 2025 06:02:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759410146; x=1760014946;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ec+ndxQ3jnu1a8VNviNr06HkWUDsCBC6MfDIjOmWDIU=;
        b=GoPm+9s2hFrMLKXBPfi/2oiXw5HET4aXgG34jIbpu/Fc7eqr8N810DtWILLwSgKQVM
         cMBOp3opXzbgqKOSnmsr4IahHp4M85SWBJ0qlVwY8AORUjupnxCVWGI93ddN8E3Icm+y
         SSgCtslnxwYcdvm+NoyAV7jby9vlo9dULwYcXSaFc2rXG4i/hkKilfF7z8DvIVY59OPL
         uCbQq/dN0e/Hf2xrEJaz266aN1cdVs7Twtx/npf6ld80RODJKeXdslZ2qF5h05bYML4Q
         Lb3RqNeV4dznj/MLZ1E07bOzuzNapJswYZIXdLr0NVrhxu4zQduj2MYiaRGi4zCqgDV5
         UbEQ==
X-Forwarded-Encrypted: i=1; AJvYcCWLC1KKqW4ucWEDcybpQkqz1urqsc/4954LuXZ7snN4PnQNy8+xVUN/HprWd9kQA+x4wfZHnnfwXe8hFA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2rRDprwaNAHY6WcvOCJQ0ImsH+u8qWfmzAwEP6+5ENrKmfquR
	C0H/svzJFyxWTABG5pkdAT72bh71UKVMB2ACUmxbzPkvuYugXDLKVs5Fn0yCZy4+VVhqKw==
X-Gm-Gg: ASbGnctl/66Ctwl/atANFQFdZVeuOuVdt4HkwJOyhC2BeuR6vWbr0m7X0cNHYlFUkot
	TcWT6yNII2B0tR8RCB8lpqn9HS5eXgb8wi7dn7kOkJOSlT62dvwSug/k/vsoCaOBYh235gTFeJd
	Ri5aCoKPaNqYx5IDZBDeSSsN4XtkvDer1iOZ22Y5Lyi6gfoBSELjyMoAWXNXt8tfqB62SD5SdrU
	6kbKLbzLGFruVtRcE5/tvOX5whsyqP6jTQVZytGTiASzGmXJrsjvf0r4BeTQGexQ3sxcvmhBPPv
	WxtlEHGwR7iTkJnDii+AtX+4Jgps8Zls9Px3QvMXxuf1i7jHZO2Ts9Wf87at4bWSK1KoYRH2+qQ
	Ff24+CKpEIukbSb1JBiII1ZRSRqHx1JxEcbPOD11H4s7nVqB22Wok1RpB/YNpLWMDEaPVH/Xd0K
	3gA1gUdxhtMMtFOqqocCTEHiA=
X-Google-Smtp-Source: AGHT+IGIOeDEWkTPJlJYoFOPlsDJZicUnJ4c/UkoMyFr41LQw4MHAhw4wh4WakhkfW8ENl7pHf8A6Q==
X-Received: by 2002:a05:6830:488b:b0:788:d698:a0ad with SMTP id 46e09a7af769-7bddb7ef38amr5805038a34.24.1759410146459;
        Thu, 02 Oct 2025 06:02:26 -0700 (PDT)
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com. [209.85.160.175])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-92eb4f0927csm462397241.18.2025.10.02.06.02.26
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Oct 2025 06:02:26 -0700 (PDT)
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-4e06163d9e9so9498181cf.3
        for <linux-media@vger.kernel.org>; Thu, 02 Oct 2025 06:02:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXCtLYf5E5vFVhx9Q6hu/OcN5eJAb7HUlUvLanOzaDUtKMWD574BZJkQf9lYdGHMN4dzfKlcWljqeXI0Q==@vger.kernel.org
X-Received: by 2002:a67:f74a:0:b0:5d3:fecb:e4e8 with SMTP id
 ada2fe7eead31-5d3fecbe643mr2057033137.5.1759409779799; Thu, 02 Oct 2025
 05:56:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251002081247.51255-1-byungchul@sk.com> <20251002081247.51255-3-byungchul@sk.com>
 <2025100255-tapestry-elite-31b0@gregkh>
In-Reply-To: <2025100255-tapestry-elite-31b0@gregkh>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 2 Oct 2025 14:56:08 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWXuXh4SVu-ORghAqsZa7U6_mcW44++id9ioUm5Y4KTLw@mail.gmail.com>
X-Gm-Features: AS18NWCmqHU8DKNueQjpF6Ifrv2W5fzYfUTjQ8XBBt-1KrFWqeUHHsvmYo_0fpY
Message-ID: <CAMuHMdWXuXh4SVu-ORghAqsZa7U6_mcW44++id9ioUm5Y4KTLw@mail.gmail.com>
Subject: Re: [PATCH v17 02/47] dept: implement DEPT(DEPendency Tracker)
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Byungchul Park <byungchul@sk.com>, linux-kernel@vger.kernel.org, kernel_team@skhynix.com, 
	torvalds@linux-foundation.org, damien.lemoal@opensource.wdc.com, 
	linux-ide@vger.kernel.org, adilger.kernel@dilger.ca, 
	linux-ext4@vger.kernel.org, mingo@redhat.com, peterz@infradead.org, 
	will@kernel.org, tglx@linutronix.de, rostedt@goodmis.org, 
	joel@joelfernandes.org, sashal@kernel.org, daniel.vetter@ffwll.ch, 
	duyuyang@gmail.com, johannes.berg@intel.com, tj@kernel.org, tytso@mit.edu, 
	willy@infradead.org, david@fromorbit.com, amir73il@gmail.com, 
	kernel-team@lge.com, linux-mm@kvack.org, akpm@linux-foundation.org, 
	mhocko@kernel.org, minchan@kernel.org, hannes@cmpxchg.org, 
	vdavydov.dev@gmail.com, sj@kernel.org, jglisse@redhat.com, dennis@kernel.org, 
	cl@linux.com, penberg@kernel.org, rientjes@google.com, vbabka@suse.cz, 
	ngupta@vflare.org, linux-block@vger.kernel.org, josef@toxicpanda.com, 
	linux-fsdevel@vger.kernel.org, jack@suse.cz, jlayton@kernel.org, 
	dan.j.williams@intel.com, hch@infradead.org, djwong@kernel.org, 
	dri-devel@lists.freedesktop.org, rodrigosiqueiramelo@gmail.com, 
	melissa.srw@gmail.com, hamohammed.sa@gmail.com, harry.yoo@oracle.com, 
	chris.p.wilson@intel.com, gwan-gyeong.mun@intel.com, 
	max.byungchul.park@gmail.com, boqun.feng@gmail.com, longman@redhat.com, 
	yunseong.kim@ericsson.com, ysk@kzalloc.com, yeoreum.yun@arm.com, 
	netdev@vger.kernel.org, matthew.brost@intel.com, her0gyugyu@gmail.com, 
	corbet@lwn.net, catalin.marinas@arm.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, luto@kernel.org, 
	sumit.semwal@linaro.org, gustavo@padovan.org, christian.koenig@amd.com, 
	andi.shyti@kernel.org, arnd@arndb.de, lorenzo.stoakes@oracle.com, 
	Liam.Howlett@oracle.com, rppt@kernel.org, surenb@google.com, 
	mcgrof@kernel.org, petr.pavlu@suse.com, da.gomez@kernel.org, 
	samitolvanen@google.com, paulmck@kernel.org, frederic@kernel.org, 
	neeraj.upadhyay@kernel.org, joelagnelf@nvidia.com, josh@joshtriplett.org, 
	urezki@gmail.com, mathieu.desnoyers@efficios.com, jiangshanlai@gmail.com, 
	qiang.zhang@linux.dev, juri.lelli@redhat.com, vincent.guittot@linaro.org, 
	dietmar.eggemann@arm.com, bsegall@google.com, mgorman@suse.de, 
	vschneid@redhat.com, chuck.lever@oracle.com, neil@brown.name, 
	okorniev@redhat.com, Dai.Ngo@oracle.com, tom@talpey.com, trondmy@kernel.org, 
	anna@kernel.org, kees@kernel.org, bigeasy@linutronix.de, clrkwllms@kernel.org, 
	mark.rutland@arm.com, ada.coupriediaz@arm.com, kristina.martsenko@arm.com, 
	wangkefeng.wang@huawei.com, broonie@kernel.org, kevin.brodsky@arm.com, 
	dwmw@amazon.co.uk, shakeel.butt@linux.dev, ast@kernel.org, ziy@nvidia.com, 
	yuzhao@google.com, baolin.wang@linux.alibaba.com, usamaarif642@gmail.com, 
	joel.granados@kernel.org, richard.weiyang@gmail.com, geert+renesas@glider.be, 
	tim.c.chen@linux.intel.com, linux@treblig.org, 
	alexander.shishkin@linux.intel.com, lillian@star-ark.net, 
	chenhuacai@kernel.org, francesco@valla.it, guoweikang.kernel@gmail.com, 
	link@vivo.com, jpoimboe@kernel.org, masahiroy@kernel.org, brauner@kernel.org, 
	thomas.weissschuh@linutronix.de, oleg@redhat.com, mjguzik@gmail.com, 
	andrii@kernel.org, wangfushuai@baidu.com, linux-doc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org, 
	linaro-mm-sig@lists.linaro.org, linux-i2c@vger.kernel.org, 
	linux-arch@vger.kernel.org, linux-modules@vger.kernel.org, 
	rcu@vger.kernel.org, linux-nfs@vger.kernel.org, 
	linux-rt-devel@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Greg,

On Thu, 2 Oct 2025 at 10:25, Greg KH <gregkh@linuxfoundation.org> wrote:
> > @@ -0,0 +1,446 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +/*
> > + * DEPT(DEPendency Tracker) - runtime dependency tracker
> > + *
> > + * Started by Byungchul Park <max.byungchul.park@gmail.com>:
> > + *
> > + *  Copyright (c) 2020 LG Electronics, Inc., Byungchul Park
> > + *  Copyright (c) 2024 SK hynix, Inc., Byungchul Park
>
> Nit, it's now 2025 :)

The last non-trivial change to this file was between the last version
posted in 2024 (v14) and the first version posted in 2025 (v15),
so 2024 doesn't sound that off to me.
You are not supposed to bump the copyright year when republishing
without any actual changes.  It is meant to be the work=E2=80=99s first yea=
r
of publication.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

