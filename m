Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A42DC285F7B
	for <lists+linux-media@lfdr.de>; Wed,  7 Oct 2020 14:48:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728218AbgJGMsN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Oct 2020 08:48:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727253AbgJGMsM (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Oct 2020 08:48:12 -0400
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com [IPv6:2a00:1450:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90C52C0613D2
        for <linux-media@vger.kernel.org>; Wed,  7 Oct 2020 05:48:12 -0700 (PDT)
Received: by mail-ed1-x542.google.com with SMTP id p13so2011351edi.7
        for <linux-media@vger.kernel.org>; Wed, 07 Oct 2020 05:48:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8DgUuIRfcHlPhdxgua6tbSE2mebG0xHkllja1Sz9A+A=;
        b=OwAuf7F2NQb/bsfTM2qcO5DjrhllMR1QqFDtj/L3iekZAReq3qsqXSiEABTatoXxTB
         rDETHWmgxlHX7z4dhuSD2d4gWdOO/SQlLd1ksmCUxOY435tx1KNZZq94LRBlSVJGBKWq
         DO8qOQ4lkUnHLmdS85byS9GsBNdfVMiJquDxE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8DgUuIRfcHlPhdxgua6tbSE2mebG0xHkllja1Sz9A+A=;
        b=KYKibzGlocH+9eXgLTepGTXkGUbpiwgXfNYv4RgbBBMhHKm5o3E8RgJ+sLy8nw9pm7
         S5gQe1P2CUtFynUzyzaODvdPuGgyX3NJt9mWTS3L6sXh4iyqdaxe8nKgFOhr3uXRTb/S
         jgKn/DRXd53GN7+WAiGpzPf7szhsMqTqO9twlIjGaCWlITKO8hB/GtDibP/yVC0ExEaF
         NDS0Yo1pCtzBDq6w+QLh8WdOX+1AszdbkirsdXowJC+7RKG09QCTwTMyjV/d0tb8L/Tu
         Sy9fQ0/qKr+kmEfxwxTlFnBUwO1c/Na/g0+QfDHTn/izqqg4U8l6azTY754Sp0B9ggM/
         G03g==
X-Gm-Message-State: AOAM532oDAYbxSvqIvluSiTrixCL3mxgOr0PiJZmIGyOZsj5A++hcM91
        ten1OhLI5x8A3Qqpo20d25AKaL/kjM7oDQ==
X-Google-Smtp-Source: ABdhPJznpx0qKX0n+QI0hcAW/vX0ry6mBMC79yPVsX5ZsEcst4F5Wh5IP5M0UeeOv7OZxiFFbnDOBw==
X-Received: by 2002:a05:6402:1c1b:: with SMTP id ck27mr3427180edb.218.1602074890742;
        Wed, 07 Oct 2020 05:48:10 -0700 (PDT)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com. [209.85.128.42])
        by smtp.gmail.com with ESMTPSA id m2sm1372487eds.46.2020.10.07.05.48.07
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Oct 2020 05:48:07 -0700 (PDT)
Received: by mail-wm1-f42.google.com with SMTP id d4so2154830wmd.5
        for <linux-media@vger.kernel.org>; Wed, 07 Oct 2020 05:48:07 -0700 (PDT)
X-Received: by 2002:a1c:4904:: with SMTP id w4mr2925784wma.99.1602074886765;
 Wed, 07 Oct 2020 05:48:06 -0700 (PDT)
MIME-Version: 1.0
References: <20201002175303.390363-1-daniel.vetter@ffwll.ch>
 <20201002175303.390363-2-daniel.vetter@ffwll.ch> <20201002180603.GL9916@ziepe.ca>
 <CAKMK7uGF+y-r4swLXmodhduRMy0NPa=ASBY8JOXS_g=9Rq9XQw@mail.gmail.com>
 <20201002233118.GM9916@ziepe.ca> <CGME20201003094038eucas1p12aaafe0f52a7747bc2ba95ccb91d1651@eucas1p1.samsung.com>
 <CAKMK7uFP-XQHUPYeRhPx7tjvjARQiF-os9z9jx6WANV6sgSf6g@mail.gmail.com>
 <d2f8e8a7-614d-18c8-9e2a-c604e5e54ce6@samsung.com> <CAKMK7uF+a1PSn+e-6F+YhkSXn9vC7etS-z0AFBMCU+Vzb2PwqA@mail.gmail.com>
 <725819e9-4f07-3f04-08f8-b6180406b339@samsung.com> <20201007124409.GN5177@ziepe.ca>
In-Reply-To: <20201007124409.GN5177@ziepe.ca>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Wed, 7 Oct 2020 14:47:55 +0200
X-Gmail-Original-Message-ID: <CAAFQd5D0ahP-3hp_vGEmJ2cyBOMXeW9HX5yKaVPcQTsFwwOE8Q@mail.gmail.com>
Message-ID: <CAAFQd5D0ahP-3hp_vGEmJ2cyBOMXeW9HX5yKaVPcQTsFwwOE8Q@mail.gmail.com>
Subject: Re: [PATCH 2/2] mm/frame-vec: use FOLL_LONGTERM
To:     Jason Gunthorpe <jgg@ziepe.ca>
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        John Hubbard <jhubbard@nvidia.com>,
        =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
        Jan Kara <jack@suse.cz>,
        Dan Williams <dan.j.williams@intel.com>,
        Linux MM <linux-mm@kvack.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Pawel Osciak <pawel@osciak.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Inki Dae <inki.dae@samsung.com>,
        Joonyoung Shim <jy0922.shim@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>, Oded Gabbay <oded.gabbay@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Oct 7, 2020 at 2:44 PM Jason Gunthorpe <jgg@ziepe.ca> wrote:
>
> On Wed, Oct 07, 2020 at 02:33:56PM +0200, Marek Szyprowski wrote:
> > Well, it was in vb2_get_vma() function, but now I see that it has been
> > lost in fb639eb39154 and 6690c8c78c74 some time ago...
>
> There is no guarentee that holding a get on the file says anthing
> about the VMA. This needed to check that the file was some special
> kind of file that promised the VMA layout and file lifetime are
> connected.
>
> Also, cloning a VMA outside the mm world is just really bad. That
> would screw up many assumptions the drivers make.
>
> If it is all obsolete I say we hide it behind a default n config
> symbol and taint the kernel if anything uses it.
>
> Add a big comment above the follow_pfn to warn others away from this
> code.

Sadly it's just verbally declared as deprecated and not formally noted
anyway. There are a lot of userspace applications relying on user
pointer support.
