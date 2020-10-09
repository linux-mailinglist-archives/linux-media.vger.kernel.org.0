Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 72CAC289B91
	for <lists+linux-media@lfdr.de>; Sat, 10 Oct 2020 00:06:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390831AbgJIWEX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 9 Oct 2020 18:04:23 -0400
Received: from mail.kernel.org ([198.145.29.99]:58932 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2390754AbgJIWEX (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 9 Oct 2020 18:04:23 -0400
Received: from localhost.localdomain (c-73-231-172-41.hsd1.ca.comcast.net [73.231.172.41])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 21CE12225B;
        Fri,  9 Oct 2020 22:04:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1602281061;
        bh=oITbHTmVfb1q7fGqfRr1elEf4VBd3T6psegkhAry820=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=Sqt8KxsmiMnGuR0FT3Y4aouz0n876VypJIivZK9FUCA4pSf8ob4uuB47fWSLQVpHe
         jX2gkLdcbNdzObqUeuxaPZ9R6zqIm9NdO9kF4Eo6wFiR916yXnFU9ACe7jRwX0wz2u
         mpcdILw6zl4jSuUJsqNpaZKW94F3xjT8wN+ua4cY=
Date:   Fri, 9 Oct 2020 15:04:20 -0700
From:   Andrew Morton <akpm@linux-foundation.org>
To:     =?ISO-8859-1?Q? "Christian_K=F6nig" ?= 
        <ckoenig.leichtzumerken@gmail.com>
Cc:     linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, chris@chris-wilson.co.uk,
        airlied@redhat.com, daniel@ffwll.ch, sumit.semwal@linaro.org,
        willy@infradead.org, jhubbard@nvidia.com, jgg@ziepe.ca,
        Miaohe Lin <linmiaohe@huawei.com>
Subject: Re: [PATCH 1/6] mm: mmap: fix fput in error path
Message-Id: <20201009150420.450833e3830b9d39a2385dd9@linux-foundation.org>
In-Reply-To: <20201009150342.1979-1-christian.koenig@amd.com>
References: <20201009150342.1979-1-christian.koenig@amd.com>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri,  9 Oct 2020 17:03:37 +0200 "Christian K=F6nig" <ckoenig.leichtzumer=
ken@gmail.com> wrote:

> Patch "495c10cc1c0c CHROMIUM: dma-buf: restore args..."
> adds a workaround for a bug in mmap_region.
>=20
> As the comment states ->mmap() callback can change
> vma->vm_file and so we might call fput() on the wrong file.
>=20
> Revert the workaround and proper fix this in mmap_region.
>=20

Doesn't this patch series address the same thing as
https://lkml.kernel.org/r/20200916090733.31427-1-linmiaohe@huawei.com?

