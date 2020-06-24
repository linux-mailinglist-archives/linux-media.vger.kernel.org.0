Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 42D322072B1
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2020 13:58:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403790AbgFXL6w (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 Jun 2020 07:58:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388491AbgFXL6w (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 Jun 2020 07:58:52 -0400
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com [IPv6:2a00:1450:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2CBBC061573
        for <linux-media@vger.kernel.org>; Wed, 24 Jun 2020 04:58:51 -0700 (PDT)
Received: by mail-ej1-x641.google.com with SMTP id n24so2200800ejd.0
        for <linux-media@vger.kernel.org>; Wed, 24 Jun 2020 04:58:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bfoFbTp1jr2I0obymTUaIsffNufAQrxCZnD5n4W9cLQ=;
        b=mh1QeBarXUNA+BpPNkuVYPczl6ELMrnlr7iG8xE/noQvhbCpusVzCoBhSnKDAuHh6W
         LlTBWpRYN88ysR3tnIIqi6NS9JG11ypRdeDuCdEPLvKedQBvEpwiCQbf2QGSlTDO9R7K
         PpVq0v8UXTXcsDkLtvJ2TdJn0e335AK1FJNeM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bfoFbTp1jr2I0obymTUaIsffNufAQrxCZnD5n4W9cLQ=;
        b=CY1o/J4baFOHKIagulmpVrCTUCtAHM1mPVFkAz6bVYff99WsgDD/AbhgjC0D5ujGxT
         T/xxe+oGtTj9f1pQzPLwri6Mj0RDgCFr5uEiMcee9kt78kGCTqxy6VVP2lwwzvIjHp1u
         UPz+mCIvuTLd+f8TqTovE3KxrzLmFHrTEFq6f/KVF/5JvDwr7Ja6kCGou47nTferyxzg
         P2JUVAuBOf3ipYuTOOXmQ5jOLuhnh/IXFa+TPwZ4SmhI2QtK8opkiKyRVRmYcWEeyr2t
         YZrYoA4vHCmY/BhH1tmUIG2tyRSKmXizgfuyychCgOntAm0jurscSGoAjLaZCJtfrvAc
         9+5A==
X-Gm-Message-State: AOAM530hzJY3qq2HkzlVk+Q274oUeEnw1tHFUTRGa7p0ika8l0lekqwW
        +myRiZXBNagUjvvR86sSBO2OIO/wr3v6GA==
X-Google-Smtp-Source: ABdhPJwah+f4cLkmsDqPAdFYjAv0tMcOoaOYUmUp283P1EFroX62CrdSJTOgYz8UaFIOSJdZTGTeNA==
X-Received: by 2002:a17:906:af4d:: with SMTP id ly13mr23724648ejb.250.1592999930077;
        Wed, 24 Jun 2020 04:58:50 -0700 (PDT)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com. [209.85.128.50])
        by smtp.gmail.com with ESMTPSA id m22sm15446552ejb.47.2020.06.24.04.58.48
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Jun 2020 04:58:49 -0700 (PDT)
Received: by mail-wm1-f50.google.com with SMTP id o2so2241245wmh.2
        for <linux-media@vger.kernel.org>; Wed, 24 Jun 2020 04:58:48 -0700 (PDT)
X-Received: by 2002:a7b:c2a9:: with SMTP id c9mr30008672wmk.11.1592999928401;
 Wed, 24 Jun 2020 04:58:48 -0700 (PDT)
MIME-Version: 1.0
References: <BN6PR04MB06602E7221CC7455F3142540A3AE0@BN6PR04MB0660.namprd04.prod.outlook.com>
 <07fb9000-ae00-efcd-e91a-48765ff3d4bf@xs4all.nl> <20200624115419.GA20764@pi3>
In-Reply-To: <20200624115419.GA20764@pi3>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Wed, 24 Jun 2020 13:58:37 +0200
X-Gmail-Original-Message-ID: <CAAFQd5CW0CL-s6=UOPsm37Mg+kswM_DTXEEnQMHC3kc2LxAY5w@mail.gmail.com>
Message-ID: <CAAFQd5CW0CL-s6=UOPsm37Mg+kswM_DTXEEnQMHC3kc2LxAY5w@mail.gmail.com>
Subject: Re: [PATCH 00/11] media: exynos4-is: Improve support for s5pv210 and
 parallel ports
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        Jonathan Bakker <xc-racer2@live.ca>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>, kgene@kernel.org,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg
        Roedel <joro@8bytes.org>," <linux-arm-kernel@lists.infradead.org>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Jun 24, 2020 at 1:54 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On Wed, Jun 24, 2020 at 01:39:50PM +0200, Hans Verkuil wrote:
> > Can someone from Samsung or someone who knows this SoC take a look at this series?
> >
> > This series looks sane to me, so I'll probably merge this if nobody replies
> > in the next two weeks or so.
>
> Unfortunately I don't know the media part on S5Pv210 at all so I cannot
> provide any feedback. There are not many active users of these SoCs
> nowadays. One of hem is Jonathan, so if he wants to change something he will
> mostly break/affect his own setup. :) Therefore I think it is safe to merge.

I think this driver is also used on Exynos4210 and on some setups with
4412 where the ISP is not used.

I can't promise anything, but I'll try to do a high level review.
Hopefully I still have some memory from the time I used to play with
this hardware.

Best regards,
Tomasz
