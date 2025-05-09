Return-Path: <linux-media+bounces-32163-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EA04AB1B71
	for <lists+linux-media@lfdr.de>; Fri,  9 May 2025 19:14:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B2C9F1BA70B7
	for <lists+linux-media@lfdr.de>; Fri,  9 May 2025 17:14:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FCAB239E6A;
	Fri,  9 May 2025 17:14:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Qp8pTehg"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23443238173
	for <linux-media@vger.kernel.org>; Fri,  9 May 2025 17:14:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746810851; cv=none; b=qe2PsP6VGX+8NyoCeIMQdtoz2056iKGoEaD1KN+aS+liQ7GWMC2uHGvTkWXjYTgA2hCIaBuU7WGA77GxRx2L7JLK2OL/gSHRvlg6TyHFXYTot/jTqkAcCpbWtARcZrnwk6ajpjbtejb8qJEjc4hE/LjkCDr+Hjz25EB5BDNpJrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746810851; c=relaxed/simple;
	bh=smM82pNC+KSoX+27bEVUeyoSpZ4hnMM+We8D5KWbT6U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aEwH1fnWBLjQpTy+IBjW+bGQt7jmJbNZYxFdflzrm4QrnkFAcX9/A1eS7/Q6EJdOn7Bn3HeqOPBbvJoZpZ9G5h7BGfQrtPOgURlCnzBBX0KpkgjPud2ydKhE/GHC0VSU5us4sU4xlV5EbhtE2iy7etf0tlgXeRscOSBwil/DIlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Qp8pTehg; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43cf3192d8bso1955e9.1
        for <linux-media@vger.kernel.org>; Fri, 09 May 2025 10:14:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746810848; x=1747415648; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=smM82pNC+KSoX+27bEVUeyoSpZ4hnMM+We8D5KWbT6U=;
        b=Qp8pTehgDCzFuzCaQcXNT3tbomqQRLWhf6UY6+SlEnADW0y9q6VBSyKv7LCaIG+CeN
         r+JDzh4tlGmqBYYO7LXZoov+MtjRLgBmy+NXJNraEGfMZHtTcCBNlEKa1FBLztps7d0y
         Ue2EXlQ6EwbURpD8q7k+SmAAylDBeGXbhwovA0fKWl8ziUL/yCmD8VetNkHi9kS3bGPP
         zO04pFK8D2VLZsaLRDbJKnU4J9vg9iloj7q34oPCqufykSZMnDRKG8J1ltXibyrHkSX9
         OLl0aPREiImtCq/V4vpXdUQ0NFqLY0BMli5aChtLZyQvVr4npqUt91n5cGBNrr87REnW
         JI1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746810848; x=1747415648;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=smM82pNC+KSoX+27bEVUeyoSpZ4hnMM+We8D5KWbT6U=;
        b=lL+eiDhXvck9VPgyWBqi+ODoGNA/yU7nTt82akZnDoocPGKjOKhexV4VDPE65R9Yvm
         uHNi9zgUdu4AuUuOiVwXO1U4tkHQgnA5zJkeOvTLAphXIZYLw06WQ8JilCEdXudphFAC
         JVSKbUhGw4tvhPszD9TlGwpxj/x8fWF/Iib1t3n/T8CA/SuvKfvquPQOHD81bZNjHcTt
         jjHbbnW+w+e5/j0awuMGRAOkozUVMehufZdcYf4nn/g3nTDoPkVTgCMrU65HC3gm6k8P
         Lv/zbrEkBVRsPtzBcbWlJjhh6PeM0+HfgyMs41x4Jc4dpIq1iaB2qBLP/qx3PPA507gt
         JbYQ==
X-Forwarded-Encrypted: i=1; AJvYcCVvQRwGpWbM3ICSb+YPQaXWc7i3isNYLD6BEKzH3AxtzzipuyV56K1n7e1S6nqI7HRiw9PJSnwjgrwr5A==@vger.kernel.org
X-Gm-Message-State: AOJu0YzSE6q6oxDWBm12dcyLvDefgWO9RauM9dpfhfOY+dg1XsGnZa31
	RVTC7qAVDSwVk3K59C56PHkQlYleMDYyuhoQQv5/B8fuguj6SDDzDFOyyHJwNVhsjQui+oG6oEW
	MLhBxwHd6Sm8omxqHKacJ5806TlcMckkx0Q1c
X-Gm-Gg: ASbGncvZYo9ZMlft/hcV0JRJZ5B/6neyiHZu5FuY45c4gM6kT3NQme92BfWBy1jHbY9
	sG0ybzwz1QNotn7GYtB13yZtz8TZDfhH6OlFnn1eLdkRH/guDXF8VFaWGP86rrphB6Q23Vx3wad
	VKjnEduPL1MVInNM0ghW9H
X-Google-Smtp-Source: AGHT+IH40mARNMU/tf7BP0uCdyGA5liGBuBykAAd7c4WUrmrx1q7itlR5BUHqvu/mY8+HZhP0nMjqB2T+rpZhsONAQE=
X-Received: by 2002:a05:600c:1ca1:b0:439:8d84:32ff with SMTP id
 5b1f17b1804b1-442d7c36971mr1213425e9.3.1746810848319; Fri, 09 May 2025
 10:14:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250508182025.2961555-1-tjmercier@google.com>
 <20250508182025.2961555-5-tjmercier@google.com> <CAPhsuW6z90sErDTA97_MN2=QKHc96Ge3HwGD1ZoMYj6Sh7GYVA@mail.gmail.com>
In-Reply-To: <CAPhsuW6z90sErDTA97_MN2=QKHc96Ge3HwGD1ZoMYj6Sh7GYVA@mail.gmail.com>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Fri, 9 May 2025 10:13:56 -0700
X-Gm-Features: AX0GCFu8BoOcyJCPnA7QXYP7Ly2ZIBuYiyNl-jSbUErDvQFnq_Cx4tGRHuAx2Fg
Message-ID: <CABdmKX1A0Ard1yoV9SAV4jZfrD3tvMz2cftcuFPhQgkAKDk58w@mail.gmail.com>
Subject: Re: [PATCH bpf-next v4 4/5] selftests/bpf: Add test for dmabuf_iter
To: Song Liu <song@kernel.org>
Cc: sumit.semwal@linaro.org, christian.koenig@amd.com, ast@kernel.org, 
	daniel@iogearbox.net, andrii@kernel.org, martin.lau@linux.dev, 
	skhan@linuxfoundation.org, alexei.starovoitov@gmail.com, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	bpf@vger.kernel.org, linux-kselftest@vger.kernel.org, android-mm@google.com, 
	simona@ffwll.ch, eddyz87@gmail.com, yonghong.song@linux.dev, 
	john.fastabend@gmail.com, kpsingh@kernel.org, sdf@fomichev.me, 
	jolsa@kernel.org, mykolal@fb.com, shuah@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 8, 2025 at 5:36=E2=80=AFPM Song Liu <song@kernel.org> wrote:
>
> On Thu, May 8, 2025 at 11:20=E2=80=AFAM T.J. Mercier <tjmercier@google.co=
m> wrote:
> [...]
> > diff --git a/tools/testing/selftests/bpf/prog_tests/dmabuf_iter.c b/too=
ls/testing/selftests/bpf/prog_tests/dmabuf_iter.c
> > new file mode 100644
> > index 000000000000..35745f4ce0f8
> > --- /dev/null
> > +++ b/tools/testing/selftests/bpf/prog_tests/dmabuf_iter.c
> > @@ -0,0 +1,224 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/* Copyright (c) 2025 Google */
> > +
> > +#include <test_progs.h>
> > +#include <bpf/libbpf.h>
> > +#include <bpf/btf.h>
> > +#include "dmabuf_iter.skel.h"
> > +
> > +#include <fcntl.h>
> > +#include <stdbool.h>
> > +#include <stdio.h>
> > +#include <stdlib.h>
> > +#include <string.h>
> > +#include <sys/ioctl.h>
> > +#include <sys/mman.h>
> > +#include <unistd.h>
> > +
> > +#include <linux/dma-buf.h>
> > +#include <linux/dma-heap.h>
> > +#include <linux/udmabuf.h>
> > +
> > +static int memfd, udmabuf;
>
> Global fds are weird. AFAICT, we don't really need them
> to be global? If we really need them to be global, please
> initialize them to -1, just in case we close(0) by accident.

Hmm, no we don't really need them to be global but I didn't really
want to pass all these variables around to all the setup and test
functions. The fd lifetimes are nearly the whole program lifetime
anyways, and just need to exist without actually being used for
anything. I'll add the -1 initialization as you suggest. If udmabuf
creation failed, we would have done a close(0) in
destroy_test_buffers() on the sysheap_dmabuf fd.


> > +static const char udmabuf_test_buffer_name[DMA_BUF_NAME_LEN] =3D "udma=
buf_test_buffer_for_iter";
> > +static size_t udmabuf_test_buffer_size;
> > +static int sysheap_dmabuf;
> > +static const char sysheap_test_buffer_name[DMA_BUF_NAME_LEN] =3D "sysh=
eap_test_buffer_for_iter";
> > +static size_t sysheap_test_buffer_size;

