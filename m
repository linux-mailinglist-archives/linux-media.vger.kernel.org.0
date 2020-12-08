Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E2332D2285
	for <lists+linux-media@lfdr.de>; Tue,  8 Dec 2020 05:56:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727822AbgLHEy5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Dec 2020 23:54:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725917AbgLHEy5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 7 Dec 2020 23:54:57 -0500
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com [IPv6:2a00:1450:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9FFCEC061793
        for <linux-media@vger.kernel.org>; Mon,  7 Dec 2020 20:54:16 -0800 (PST)
Received: by mail-ed1-x543.google.com with SMTP id p22so4171180edu.11
        for <linux-media@vger.kernel.org>; Mon, 07 Dec 2020 20:54:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8/HsXaIACwTyoNaST+7tlYLda7+69QnFbCYHF3SGybM=;
        b=NHsKtZ9ZOwK+YAUpwafqbwPyEYnaQlamxFuqZ5sx2/0AONSSemfZtgg6vaRYU7xMnz
         77hLn6qr8fZNf18KjA10NS1l9fT9uZjhO5l20wU8SjXk6PeV+cqAxSBJQCDlYwdIqnKx
         YIKIJbr2H7A/xU0s4wwnhf/QpGitRIJ5AI3KM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8/HsXaIACwTyoNaST+7tlYLda7+69QnFbCYHF3SGybM=;
        b=LD2xasSjCiid3o3yN0lziOlWXzn2SGg/MCllohr8Nm9RFey7lt9RSc3NilgnaTzt7L
         E+y8QastEzVWCVrTqYsyq9i2zVjU3jmtIoFSsHivs5c0CKMcYMIRnSYPxhw2LHUQARWx
         jj2nrD00HF51eVT17cqrbLEfqtvDSWh7MJZrysKzIz3kG0V49B7DSMVxsZnadxxManh+
         o1L/H5wK050Sj1p7HTwcYGH0KWxQhFS8Z6Q6JDjTZkG8xAjE9q3y8gU3IUvVtdZav+03
         PRTEuyiBVGjEMtyBJfXvlEi9o71PbjDKDCZTA+qM0f8A3WqSLnueZvY63QzyA9j5fBX1
         kFww==
X-Gm-Message-State: AOAM530EP+Xh/SRBj99crtHw1FtpnijlgXewLOW98xLHwQ0m2AK5rzAd
        OKpillkve2Ow1h9oDLQv2sV9O6PGjpqu1A==
X-Google-Smtp-Source: ABdhPJykNdZwLl/7cbAcD1fkP8UyT21jpZV9g3bjKiHbhj83bCdf1xR7aLEmFv1Yy5Ihm0pdglCPgQ==
X-Received: by 2002:a05:6402:8d9:: with SMTP id d25mr22669263edz.278.1607403255172;
        Mon, 07 Dec 2020 20:54:15 -0800 (PST)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com. [209.85.221.42])
        by smtp.gmail.com with ESMTPSA id bo20sm11516511edb.1.2020.12.07.20.54.12
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Dec 2020 20:54:13 -0800 (PST)
Received: by mail-wr1-f42.google.com with SMTP id u12so14948196wrt.0
        for <linux-media@vger.kernel.org>; Mon, 07 Dec 2020 20:54:12 -0800 (PST)
X-Received: by 2002:adf:f881:: with SMTP id u1mr22668227wrp.103.1607403252411;
 Mon, 07 Dec 2020 20:54:12 -0800 (PST)
MIME-Version: 1.0
References: <20201125221917.150463-1-ribalda@chromium.org> <20201130083410.GD32234@lst.de>
 <20201201033658.GE3723071@google.com> <20201201144916.GA14682@lst.de>
In-Reply-To: <20201201144916.GA14682@lst.de>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Tue, 8 Dec 2020 13:54:00 +0900
X-Gmail-Original-Message-ID: <CAAFQd5BBEbmENrrZ-vMK9cKOap19XWmfcxwrxKfjWx-wEew8rg@mail.gmail.com>
Message-ID: <CAAFQd5BBEbmENrrZ-vMK9cKOap19XWmfcxwrxKfjWx-wEew8rg@mail.gmail.com>
Subject: Re: [PATCH v3 5/6] media: uvcvideo: Use dma_alloc_noncontiguos API
To:     Christoph Hellwig <hch@lst.de>
Cc:     Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>,
        Ricardo Ribalda <ribalda@chromium.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        IOMMU DRIVERS <iommu@lists.linux-foundation.org>,
        Joerg Roedel <joro@8bytes.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Sergey Senozhatsky <senozhatsky@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Christoph,

On Tue, Dec 1, 2020 at 11:49 PM Christoph Hellwig <hch@lst.de> wrote:
>
> On Tue, Dec 01, 2020 at 12:36:58PM +0900, Sergey Senozhatsky wrote:
> > Not that I have any sound experience in this area, but the helper
> > probably won't hurt. Do you also plan to add vmap() to that helper
> > or dma_alloc_noncontiguous()/sg_alloc_table_from_pages() only?
>
> Yes, I think adding the vmap is useful, and it probably makes sense
> to do that unconditionally.  I'd also include the fallback to
> dma_alloc_pages when the noncontig version isn't supported in the
> helper.

From the media perspective, it would be good to have the vmap
optional, similarly to the DMA_ATTR_NO_KERNEL_MAPPING attribute for
coherent allocations. Actually, in the media drivers, the need to have
a kernel mapping of the DMA buffers corresponds to a minority of the
drivers. Most of them only need to map them to the userspace.

Nevertheless, that minority actually happens to be quite widely used,
e.g. the uvcvideo driver, so we can't go to the other extreme and just
drop the vmap at all.

In any case, Sergey is going to share a preliminary patch on how the
current API would be used in the V4L2 videobuf2 framework. That should
give us more input on how such a helper could look.

Other than that, again, thanks a lot for helping with this.

Best regards,
Tomasz
