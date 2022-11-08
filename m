Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8DBB0620866
	for <lists+linux-media@lfdr.de>; Tue,  8 Nov 2022 05:46:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232847AbiKHEqO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Nov 2022 23:46:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232308AbiKHEqM (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 7 Nov 2022 23:46:12 -0500
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3DC7612AEB
        for <linux-media@vger.kernel.org>; Mon,  7 Nov 2022 20:46:11 -0800 (PST)
Received: by mail-ej1-x62a.google.com with SMTP id q9so35661235ejd.0
        for <linux-media@vger.kernel.org>; Mon, 07 Nov 2022 20:46:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Fra4yIWv6TZGqY5e50Ht4t7fKg9qXIteCxj5r9JD6vc=;
        b=k5nrvygDjfG84Jq8usw3TAeubZw8DjisC8BDW/Nl99poBxOVm3b4Emj6HmmfjmpRDg
         6UqJx+Zje8uwbw0492FSt+SP9nPZpSClhlI2a7jkV8gf4dZ+NQhHw/+vcVeKfiMshCy8
         l5vHZxgwLrsSFmUFQ9k9AqBdcglrJDMAIuZNg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Fra4yIWv6TZGqY5e50Ht4t7fKg9qXIteCxj5r9JD6vc=;
        b=Dr8JC2vy7cYbSRRJ4JRGMTO6QpS9mZgiPaxBleZVAtTkrlbmvueZlBeU37fLrd034m
         pHgXAV3AAs3Tb4yAGA3GKOLvtA/hPBMP9N6xb9YeZr3xSsfpM+rzf/5Am1iS3jxVYvwx
         3l9B26ADJ8YJtjznkmjEphN9LLF8WiWbo4B9T13cCgSl4pn3fpdYal6tuVgGa9h+stn0
         AOZs5cF/+cGcqKWC8F+UwT5XRrz5OnuIgfps9hvq38K8vqbg/IhUb+sO9iAzdIsPfeHU
         kxjQqxHg1dmkPo/wEWOGjo/j6FLHgy3yxeKXbBN2TGtb+6O4+aM88fFaSW0CBN8KHBFM
         dwsg==
X-Gm-Message-State: ACrzQf31oU4b0R8jydH4dpqp70W2R7aHFf0TG0YiJIIdjpr9sPhIUvEc
        ZDMp3X/x4uh59Xwf/eXeHpMr6BegFIrrmw==
X-Google-Smtp-Source: AMsMyM6QbM+ghckpH603q/yoPiH0dZZYTHKDi4XGIaZ6B8W0Tqe81IYou037p9BDtHT5xY++sPQ7Yg==
X-Received: by 2002:a17:906:fc6:b0:72f:d080:416 with SMTP id c6-20020a1709060fc600b0072fd0800416mr50809570ejk.1.1667882769877;
        Mon, 07 Nov 2022 20:46:09 -0800 (PST)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com. [209.85.218.42])
        by smtp.gmail.com with ESMTPSA id q6-20020a1709064cc600b0078d793e7927sm4156897ejt.4.2022.11.07.20.46.09
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Nov 2022 20:46:09 -0800 (PST)
Received: by mail-ej1-f42.google.com with SMTP id t25so35507947ejb.8
        for <linux-media@vger.kernel.org>; Mon, 07 Nov 2022 20:46:09 -0800 (PST)
X-Received: by 2002:a17:906:ee8e:b0:730:3646:d178 with SMTP id
 wt14-20020a170906ee8e00b007303646d178mr51989213ejb.426.1667882769115; Mon, 07
 Nov 2022 20:46:09 -0800 (PST)
MIME-Version: 1.0
References: <20221107161740.144456-1-david@redhat.com> <20221107161740.144456-17-david@redhat.com>
In-Reply-To: <20221107161740.144456-17-david@redhat.com>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Tue, 8 Nov 2022 13:45:57 +0900
X-Gmail-Original-Message-ID: <CAAFQd5C3Ba1WhjYJF_7tW06mgvzoz9KTakNo+Tz8h_f6dGKzHQ@mail.gmail.com>
Message-ID: <CAAFQd5C3Ba1WhjYJF_7tW06mgvzoz9KTakNo+Tz8h_f6dGKzHQ@mail.gmail.com>
Subject: Re: [PATCH RFC 16/19] mm/frame-vector: remove FOLL_FORCE usage
To:     David Hildenbrand <david@redhat.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-rdma@vger.kernel.org,
        linux-media@vger.kernel.org, linux-kselftest@vger.kernel.org,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        John Hubbard <jhubbard@nvidia.com>,
        Peter Xu <peterx@redhat.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrea Arcangeli <aarcange@redhat.com>,
        Hugh Dickins <hughd@google.com>, Nadav Amit <namit@vmware.com>,
        Vlastimil Babka <vbabka@suse.cz>,
        Matthew Wilcox <willy@infradead.org>,
        Mike Kravetz <mike.kravetz@oracle.com>,
        Muchun Song <songmuchun@bytedance.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        David Airlie <airlied@gmail.com>,
        Oded Gabbay <ogabbay@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi David,

On Tue, Nov 8, 2022 at 1:19 AM David Hildenbrand <david@redhat.com> wrote:
>
> FOLL_FORCE is really only for debugger access. According to commit
> 707947247e95 ("media: videobuf2-vmalloc: get_userptr: buffers are always
> writable"), the pinned pages are always writable.

Actually that patch is only a workaround to temporarily disable
support for read-only pages as they seemed to suffer from some
corruption issues in the retrieved user pages. We expect to support
read-only pages as hardware input after. That said, FOLL_FORCE doesn't
sound like the right thing even in that case, but I don't know the
background behind it being added here in the first place. +Hans
Verkuil +Marek Szyprowski do you happen to remember anything about it?

Best regards,
Tomasz

>
> FOLL_FORCE in this case seems to be a legacy leftover. Let's just remove
> it.
>
> Cc: Tomasz Figa <tfiga@chromium.org>
> Cc: Marek Szyprowski <m.szyprowski@samsung.com>
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  drivers/media/common/videobuf2/frame_vector.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/media/common/videobuf2/frame_vector.c b/drivers/media/common/videobuf2/frame_vector.c
> index 542dde9d2609..062e98148c53 100644
> --- a/drivers/media/common/videobuf2/frame_vector.c
> +++ b/drivers/media/common/videobuf2/frame_vector.c
> @@ -50,7 +50,7 @@ int get_vaddr_frames(unsigned long start, unsigned int nr_frames,
>         start = untagged_addr(start);
>
>         ret = pin_user_pages_fast(start, nr_frames,
> -                                 FOLL_FORCE | FOLL_WRITE | FOLL_LONGTERM,
> +                                 FOLL_WRITE | FOLL_LONGTERM,
>                                   (struct page **)(vec->ptrs));
>         if (ret > 0) {
>                 vec->got_ref = true;
> --
> 2.38.1
>
