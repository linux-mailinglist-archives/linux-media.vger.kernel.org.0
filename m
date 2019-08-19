Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 998E0948B7
	for <lists+linux-media@lfdr.de>; Mon, 19 Aug 2019 17:45:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726949AbfHSPpJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 19 Aug 2019 11:45:09 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:40600 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726810AbfHSPpJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 19 Aug 2019 11:45:09 -0400
Received: by mail-pf1-f194.google.com with SMTP id w16so1386094pfn.7
        for <linux-media@vger.kernel.org>; Mon, 19 Aug 2019 08:45:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zMGg7ZRNK7NfpqI/Qet9Dxr9rbclh2xtbR4hUTFM6IY=;
        b=GJoHV9QE4xGJAUCqD7zOGEihP3UiAZjpj3bmVElnV3mGgDu9+IBupxqZo5crTOTBSn
         9E4KUL6HMvh/OBYUcO8Tpulqz8WiyGQenGKjsASlkTFv2dXi8Y/niM3/Z+P7vnlKNIaZ
         MtFd0UdR9JYH1Lcgtiq3NMGR7NeTcmBx3BytYCkuY0+Mh6In/PjXGCT7JB+YD1Ki2rnw
         M/YU/3ABnIwEbCJlH3DAt0qAYIkuPOryLlR92BarOXnc/HJERVegrVcC8hFgAU/vJ7Go
         FvSFH9zA3QmxP0Me+8WMdbNNwakaShO+N+03UzcmCf/+VKatv8Kx3ZtIc9UnmtYKv3wf
         5kAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zMGg7ZRNK7NfpqI/Qet9Dxr9rbclh2xtbR4hUTFM6IY=;
        b=ABtAGIKaAShNFSg1LIPs9fP4l9geTQR1fU82zvbxWdIm4KUzPWcXAdXxsPjhFqUqKt
         FH1ogy5rRBemEm03lq1u6cn0h0sbBjp5wAm1Lt5Lbe4G1+173cpUPlZyboH4va/wMqR5
         u8PxwjHGkHJB0SIwu3OT6Zfi2XyqJST27WTXbsNMWiJpvQo/zLonHDMxvA7M4tAleOt6
         iwzhETArjGRbJcMJhsMTR6DZv88iuAuVn2L3LfToMIcd/gcxUQEYLgCdaasi/xlo2H2e
         SUgdbXuZSKPlQHlNKyfG1tDP25zljAeO+L6l1mug2qmn1zahI51FHFpzrWoX6SQEf52Q
         1AMQ==
X-Gm-Message-State: APjAAAUHO9+oWvBZCybEXu0VIR7PCkcRtDN/wDVEqD0cLjIFTg2bm2Yy
        qneuqKbzz4NqPvaxixhPUNe2kSzhoSJXav0hoCM1Dw==
X-Google-Smtp-Source: APXvYqyflWC4oeyk4cX94v5k6CQJ/8FEDGgMF+Kmp2ZaCbPDE8MBxb9njXOAWHJ8AnGwbz7Ioq7XIseAIciXEoaHYEw=
X-Received: by 2002:a63:3006:: with SMTP id w6mr20727946pgw.440.1566229508161;
 Mon, 19 Aug 2019 08:45:08 -0700 (PDT)
MIME-Version: 1.0
References: <00eb8ba84205c59cac01b1b47615116a461c302c.1566220355.git.andreyknvl@google.com>
 <20190819150342.sxk3zzxvrxhkpp6j@willie-the-truck> <CAAeHK+xP6HnLJt_RKW67x8nbJLJp5A=av57BfwiFrA88eFn60w@mail.gmail.com>
 <20190819153856.odtneqxfxva2wjgu@willie-the-truck>
In-Reply-To: <20190819153856.odtneqxfxva2wjgu@willie-the-truck>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Mon, 19 Aug 2019 17:44:56 +0200
Message-ID: <CAAeHK+zf_VKOttBVfZUdp-ra=uNTx_faCmJkrM81BzgEaOZjSQ@mail.gmail.com>
Subject: Re: [PATCH ARM] selftests, arm64: fix uninitialized symbol in tags_test.c
To:     Will Deacon <will@kernel.org>
Cc:     Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Memory Management List <linux-mm@kvack.org>,
        LKML <linux-kernel@vger.kernel.org>,
        amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        linux-rdma@vger.kernel.org, linux-media@vger.kernel.org,
        kvm@vger.kernel.org,
        "open list:KERNEL SELFTEST FRAMEWORK" 
        <linux-kselftest@vger.kernel.org>,
        Will Deacon <will.deacon@arm.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Szabolcs Nagy <Szabolcs.Nagy@arm.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Kostya Serebryany <kcc@google.com>,
        Khalid Aziz <khalid.aziz@oracle.com>,
        Felix Kuehling <Felix.Kuehling@amd.com>,
        Vincenzo Frascino <vincenzo.frascino@arm.com>,
        Jacob Bramley <Jacob.Bramley@arm.com>,
        Leon Romanovsky <leon@kernel.org>,
        Christoph Hellwig <hch@infradead.org>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        Dave Martin <Dave.Martin@arm.com>,
        Evgeniy Stepanov <eugenis@google.com>,
        Kevin Brodsky <kevin.brodsky@arm.com>,
        Kees Cook <keescook@chromium.org>,
        Ruben Ayrapetyan <Ruben.Ayrapetyan@arm.com>,
        Ramana Radhakrishnan <Ramana.Radhakrishnan@arm.com>,
        Alex Williamson <alex.williamson@redhat.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Dmitry Vyukov <dvyukov@google.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Yishai Hadas <yishaih@mellanox.com>,
        Jens Wiklander <jens.wiklander@linaro.org>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Lee Smith <Lee.Smith@arm.com>,
        Alexander Deucher <Alexander.Deucher@amd.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        enh <enh@google.com>, Robin Murphy <robin.murphy@arm.com>,
        Christian Koenig <Christian.Koenig@amd.com>,
        Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Aug 19, 2019 at 5:39 PM Will Deacon <will@kernel.org> wrote:
>
> On Mon, Aug 19, 2019 at 05:16:37PM +0200, Andrey Konovalov wrote:
> > On Mon, Aug 19, 2019 at 5:03 PM Will Deacon <will@kernel.org> wrote:
> > >
> > > On Mon, Aug 19, 2019 at 03:14:42PM +0200, Andrey Konovalov wrote:
> > > > Fix tagged_ptr not being initialized when TBI is not enabled.
> > > >
> > > > Dan Carpenter <dan.carpenter@oracle.com>
> > >
> > > Guessing this was Reported-by, or has Dan introduced his own tag now? ;)
> >
> > Oops, yes, Reported-by :)
> >
> > >
> > > Got a link to the report?
> >
> > https://www.spinics.net/lists/linux-kselftest/msg09446.html
>
> Thanks, I'll fix up the commit message and push this out later on. If you
> get a chance, would you be able to look at the pending changes from
> Catalin[1], please?
>
> Will
>
> [1] https://lkml.kernel.org/r/20190815154403.16473-1-catalin.marinas@arm.com

Sure! I didn't realize some actioned is required from me on those.
I'll add my Acked-by's. Thanks!
