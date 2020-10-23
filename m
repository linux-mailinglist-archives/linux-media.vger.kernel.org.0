Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6735B296BD6
	for <lists+linux-media@lfdr.de>; Fri, 23 Oct 2020 11:13:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S461196AbgJWJNF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 23 Oct 2020 05:13:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S461198AbgJWJNF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 23 Oct 2020 05:13:05 -0400
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com [IPv6:2607:f8b0:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3DAAC0613D6
        for <linux-media@vger.kernel.org>; Fri, 23 Oct 2020 02:13:04 -0700 (PDT)
Received: by mail-oi1-x244.google.com with SMTP id h10so1131890oie.5
        for <linux-media@vger.kernel.org>; Fri, 23 Oct 2020 02:13:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=qM5nhEMYeFdEA7QerSEffOkMoRD8vG6Y+rmNtsxnjd4=;
        b=Xxk1aGPWSfFkpkis6OoEqJ2gCaQ0ahlPrRIzd5LTpnMwyB8U4J5r+K0BKl7hDE+eYN
         3FcbH6Xq/dGBMGOJztPD8i+0aPOjlnDIfmE3yk5nKc52BxNSLHg2zElLlqf99LJUx8Jn
         jnSHwE5Y+hs0wMvh4+/GAgohgcKexUIqGABys=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=qM5nhEMYeFdEA7QerSEffOkMoRD8vG6Y+rmNtsxnjd4=;
        b=HLJNI0gfz5a6aNXutGDUiPpo7ngExyliQbmE2D7UZJFSbdTWlxV6iZfeyDMekNYlXt
         zDggWIB1skA+GYImxyvRvviBs4YlTbiR3agNQCHQEhFbazHFdRG7ubHgc95Ehp/9eeB/
         hdGUK6MqLu9aAe03g2hg17nUJOrCWVWgwZHOxWYy+Yp0tf9xcFSYvgLTdrGSZz1SFHbn
         IWKv7Sxj8lBvkn64e+GpPoKdjDamuhxTCRAALfbp19wHyr3Xi6wGBKIRra5gCdvcUGZC
         Ny/+8cBTs6V/iRWJYs291vQxODQlO6VBHo4zDg+BZnnmSmlHp6ylgIyWpKLz9sBIRtAq
         q2lg==
X-Gm-Message-State: AOAM530wl0oGWeynP0/FM6P0tlE2ToFeaHW+use7J2epbaqaDHguYm8O
        CaJcGo7h8lfkJZe1agaTqXLt7BeCHj/h35peQPTBQA==
X-Google-Smtp-Source: ABdhPJxJfW2e7RMT1o53fgdROAZNOXDUkt9dx9afCHGb/w0gAtXuC9OHLmkK0ZV4M3byXb+A+RT/xRPrOH90bLENhKU=
X-Received: by 2002:aca:39d6:: with SMTP id g205mr958482oia.14.1603444384107;
 Fri, 23 Oct 2020 02:13:04 -0700 (PDT)
MIME-Version: 1.0
References: <20201021085655.1192025-1-daniel.vetter@ffwll.ch> <20201021085655.1192025-5-daniel.vetter@ffwll.ch>
In-Reply-To: <20201021085655.1192025-5-daniel.vetter@ffwll.ch>
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
Date:   Fri, 23 Oct 2020 11:12:52 +0200
Message-ID: <CAKMK7uE50TPNruEQv5JDX91q0DDqy-CXfbQzc48YeqPzSE96yA@mail.gmail.com>
Subject: Re: [PATCH v3 04/16] misc/habana: Use FOLL_LONGTERM for userptr
To:     DRI Development <dri-devel@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>
Cc:     KVM list <kvm@vger.kernel.org>, Linux MM <linux-mm@kvack.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>,
        linux-s390 <linux-s390@vger.kernel.org>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        Andrew Morton <akpm@linux-foundation.org>,
        John Hubbard <jhubbard@nvidia.com>,
        =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
        Jan Kara <jack@suse.cz>,
        Dan Williams <dan.j.williams@intel.com>,
        Oded Gabbay <oded.gabbay@gmail.com>,
        Omer Shpigelman <oshpigelman@habana.ai>,
        Ofir Bitton <obitton@habana.ai>,
        Tomer Tayar <ttayar@habana.ai>,
        Moti Haimovski <mhaimovski@habana.ai>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Pawel Piskorski <ppiskorski@habana.ai>,
        Daniel Vetter <daniel.vetter@ffwll.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Oded,

Did testing on your end turn up anything, or can I put an
ack&tested-by from you on the two habana patches for the next round?

Thanks, Daniel

On Wed, Oct 21, 2020 at 10:57 AM Daniel Vetter <daniel.vetter@ffwll.ch> wro=
te:
>
> These are persistent, not just for the duration of a dma operation.
>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Jason Gunthorpe <jgg@ziepe.ca>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: John Hubbard <jhubbard@nvidia.com>
> Cc: J=C3=A9r=C3=B4me Glisse <jglisse@redhat.com>
> Cc: Jan Kara <jack@suse.cz>
> Cc: Dan Williams <dan.j.williams@intel.com>
> Cc: linux-mm@kvack.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-samsung-soc@vger.kernel.org
> Cc: linux-media@vger.kernel.org
> Cc: Oded Gabbay <oded.gabbay@gmail.com>
> Cc: Omer Shpigelman <oshpigelman@habana.ai>
> Cc: Ofir Bitton <obitton@habana.ai>
> Cc: Tomer Tayar <ttayar@habana.ai>
> Cc: Moti Haimovski <mhaimovski@habana.ai>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Pawel Piskorski <ppiskorski@habana.ai>
> Signed-off-by: Daniel Vetter <daniel.vetter@ffwll.com>
> ---
>  drivers/misc/habanalabs/common/memory.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/misc/habanalabs/common/memory.c b/drivers/misc/haban=
alabs/common/memory.c
> index 327b64479f97..767d3644c033 100644
> --- a/drivers/misc/habanalabs/common/memory.c
> +++ b/drivers/misc/habanalabs/common/memory.c
> @@ -1288,7 +1288,8 @@ static int get_user_memory(struct hl_device *hdev, =
u64 addr, u64 size,
>                 return -ENOMEM;
>         }
>
> -       rc =3D pin_user_pages_fast(start, npages, FOLL_FORCE | FOLL_WRITE=
,
> +       rc =3D pin_user_pages_fast(start, npages,
> +                                FOLL_FORCE | FOLL_WRITE | FOLL_LONGTERM,
>                                  userptr->pages);
>
>         if (rc !=3D npages) {
> --
> 2.28.0
>


--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
