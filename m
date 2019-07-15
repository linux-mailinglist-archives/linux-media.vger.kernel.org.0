Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D1BF26868A
	for <lists+linux-media@lfdr.de>; Mon, 15 Jul 2019 11:44:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729533AbfGOJn6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 15 Jul 2019 05:43:58 -0400
Received: from mail-yb1-f195.google.com ([209.85.219.195]:43744 "EHLO
        mail-yb1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729413AbfGOJn5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 15 Jul 2019 05:43:57 -0400
Received: by mail-yb1-f195.google.com with SMTP id y123so2908108yby.10;
        Mon, 15 Jul 2019 02:43:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=fZZ8WVXuOszSeHc/0c/yAH4kX+d3pVHoqUHa9dvC8uU=;
        b=jPvQXZv+IvQvIOKDrE/1UTf4R3924nDi08kyG+WIj5baR4Tyt2FssXg65QToV335fR
         C3pQAHW0mt0y+pH4H5pHFNVigxkFaRpqcNAB3MLhLG5q2s+P4LyJ1aghN9dZyKbU8nLb
         +tDtSYrr0f8gdVeeIZpi09EmIyOIO0Q9X2MLV9gyJ1Q1Q1S5b8+YZVTEsmFL1iodhvC1
         vwusUno/4/rnjI4P48FdcE7GU2ufn+LjRZS9nxF32RlChRWlIdguzVsFOzZhaO2rojUJ
         xs1OnFebwIGoS6WFFiJQOVVdiD8lOq9z7qVhJUduZWLJUr9XeHSFuxdMZ1O0A5LWtLQr
         z1SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=fZZ8WVXuOszSeHc/0c/yAH4kX+d3pVHoqUHa9dvC8uU=;
        b=pyO1WtDMeOlW6MvJToipU1cSmqRLvA/KfO4rN+/t9pKlQBlHZZTzTxJjrMQcRx01ZS
         sV7Vi4uwhKMgh454ATP9hhY931GTSAA1Ms3MDXCLpEYW+I/Pv/ItZeCD1EYmp8Jk8mPq
         dA8831Nm2gn5WSHuwknXMXTUjFIuE/YYh6ajWswHFUMxy7+Djj3we+ifCeYrxmSyNPel
         kgi56hvzfpcCuBMQqD47m4NsFr+eKn8YJC483TC/8PquBU4mm8jy7gw1YglYrU1dTIef
         IFBVOLQSNmv0Ez+BayTXN5JUjrcUf3tfiJg7lB4OAy/mNBF0vgLATYaLVgo7Qjsem/1k
         AGxQ==
X-Gm-Message-State: APjAAAWAuLn9r75DqyxHzo3Pb35hYWP6DYwEAdj/3wpEd1RnUtDCLzdk
        8e2qOkyRfJISphl3SKFe3X304AoPtB0x7bnpy5leD/3IJk8=
X-Google-Smtp-Source: APXvYqyshMjLjL343jXJYNns0AL0x11WqCb1cH108fR2yfBk7X87b8Pi43a3JUgN8FWpco10Ejn9jCi8Y49UB0rrw84=
X-Received: by 2002:a25:768f:: with SMTP id r137mr15582022ybc.8.1563183836782;
 Mon, 15 Jul 2019 02:43:56 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20190715090023eucas1p2ab541c5d4b4debe766295d3c6efbd1cd@eucas1p2.samsung.com>
 <20190715031851.6890-1-huangfq.daxian@gmail.com> <37046e7b-fdde-c10f-4850-0b3efd4a00cd@samsung.com>
In-Reply-To: <37046e7b-fdde-c10f-4850-0b3efd4a00cd@samsung.com>
From:   Fuqian Huang <huangfq.daxian@gmail.com>
Date:   Mon, 15 Jul 2019 17:43:45 +0800
Message-ID: <CABXRUiQ_N=N=weMnRea4d6PXjfghta=U1xhdv-tZpSvaGBnXGg@mail.gmail.com>
Subject: Re: [PATCH v3 15/24] media: exynos4-is: Remove call to memset after dma_alloc_coherent
To:     Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc:     Kyungmin Park <kyungmin.park@samsung.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-media@vger.kernel.org,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        linux-samsung-soc@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Sylwester Nawrocki <s.nawrocki@samsung.com> =E6=96=BC 2019=E5=B9=B47=E6=9C=
=8815=E6=97=A5=E9=80=B1=E4=B8=80 =E4=B8=8B=E5=8D=885:00=E5=AF=AB=E9=81=93=
=EF=BC=9A
>
> On 7/15/19 05:18, Fuqian Huang wrote:
> > In commit 518a2f1925c3
> > ("dma-mapping: zero memory returned from dma_alloc_*"),
> > dma_alloc_coherent has already zeroed the memory.
> > So memset is not needed
>
> I can't see any changes in the above mentioned commit that would
> make dma_alloc_coherent() (arm_coherent_dma_alloc()) zeroing its
> returned memory. Maybe you need to add a reference to some other
> instead?
>
In the last version patch set, I referenced the commit af7ddd8a627c
("Merge tag 'dma-mapping-4.21' of
git://git.infradead.org/users/hch/dma-mapping")
in the commit log.
The merged commit mentions that
"ensure dma_alloc_coherent returns zeroed memory to
avoid kernel data leaks through userspace.
We already did this for most common architectures,
but this ensures we do it everywhere."
dma_alloc_coherent has already zeroed the memory during allocation
and the commit also deprecates dma_zalloc_coherent.
Greg and other maintainer told me to use the actual commit
rather than the merged commit.
So I reference the commit that ensures the dma_alloc_coherent to
returns zeroed memory every where.
Maybe this belongs to the `most common achitectures` and is not impacted
by the mentioned change.
Should I rewrite the commit log? Just mention that dma_alloc_coherent
has already zeroed the memory and not to reference the commit?
