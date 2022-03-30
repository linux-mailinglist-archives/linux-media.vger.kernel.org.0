Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CD2434ECE6E
	for <lists+linux-media@lfdr.de>; Wed, 30 Mar 2022 23:06:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351131AbiC3U60 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 30 Mar 2022 16:58:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41054 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351276AbiC3U6I (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 30 Mar 2022 16:58:08 -0400
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1676140A38
        for <linux-media@vger.kernel.org>; Wed, 30 Mar 2022 13:56:22 -0700 (PDT)
Received: by mail-ed1-x534.google.com with SMTP id b24so25871842edu.10
        for <linux-media@vger.kernel.org>; Wed, 30 Mar 2022 13:56:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nrCvj7Yq7SSib6FwgrmdzFU7UXWII5P9ju8EtUscCW0=;
        b=boNOk7s9MFWRe9Q5TIHyCBcLZAL3UIEBNmLOOWFhXw6emE+CwKKHdvhC0KffHeh0nF
         M6pQueP4aCRuJFI7dDzsd8w7oMHmH5zQ1LRTPvQqJiDWbX35wE19ft4HqpfvXL9C1Got
         NCX+Q7kxCou/I+IrAEJ9Str9SLE8Vpfu1F+nizveKZzqZBmp0ZbLt4163c8iNRc9oq8L
         +OvcysVAV7F4grrtlsY0RpODotiBIJhRyklfusZBaq0zNt0ADmOlhrzyjpVkba5kg+sN
         XtIoUFtjlMDxb5pCPzyxnwJLsJ9yaQfPKTqYXEV4ifVXSG43LsveuoFab9UFC5oCyEkr
         VAUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nrCvj7Yq7SSib6FwgrmdzFU7UXWII5P9ju8EtUscCW0=;
        b=oFOk0apbt3XHRJIZpjgPFbWVdMqC2KpDHLQyaiiBszDVPYkUWQBa+G/WkR5AtY/Mrs
         jV3Deex4/PuDgIe3EWmBm2GyC/eG5PDzPiVAFARh7H3jYFbVa6SKRKWModR/tX3PffDk
         ifkH0WJ+AtlK235AN+iFrq2wK+H4qzrx7Y1JmZYlnadLQXvQZEILS8vEW7dPGQ9TYeaU
         CDFuHcSpYysBtBDowKoeNHHXzUYbm3z7rHE7QC9ii7Cm+oXtOn1iKMQqHZ9sFNKwvHdp
         V043xZVQUIT4vigmvp2tldG/+NvFbH31LyUGRkTS1y5HiLvgZGOdVTsF+wmW2vHLILvu
         RqPQ==
X-Gm-Message-State: AOAM531Ei+WIg9aulZovbfRT+4zxBbrLLjGcQIipsM/TbmSNmqeJtLch
        FcmAED4t4SWvzSFOLcMNQ4txAQE9XVGIaYWwta73mQ==
X-Google-Smtp-Source: ABdhPJxrjw92bYCs2jMACCLJM4/KOh2wxHOU9997F7UwcQsMWyUFgKpYWFcmr9tg4GWCYtbl/45JU/IvvXHerOIfRxk=
X-Received: by 2002:a05:6402:3452:b0:418:f963:42a3 with SMTP id
 l18-20020a056402345200b00418f96342a3mr13302952edc.12.1648673780493; Wed, 30
 Mar 2022 13:56:20 -0700 (PDT)
MIME-Version: 1.0
References: <20220328035951.1817417-1-tjmercier@google.com>
 <20220328035951.1817417-3-tjmercier@google.com> <YkM6/57mVxoNfSvm@slm.duckdns.org>
In-Reply-To: <YkM6/57mVxoNfSvm@slm.duckdns.org>
From:   "T.J. Mercier" <tjmercier@google.com>
Date:   Wed, 30 Mar 2022 13:56:09 -0700
Message-ID: <CABdmKX2Gxg35k7QiL2Vn4zWhmQ4UnM-Z8cnOXR0fwBWyJnZ+Ng@mail.gmail.com>
Subject: Re: [RFC v4 2/8] cgroup: gpu: Add a cgroup controller for allocator
 attribution of GPU memory
To:     Tejun Heo <tj@kernel.org>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Jonathan Corbet <corbet@lwn.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>,
        Todd Kjos <tkjos@android.com>,
        Martijn Coenen <maco@android.com>,
        Joel Fernandes <joel@joelfernandes.org>,
        Christian Brauner <brauner@kernel.org>,
        Hridya Valsaraju <hridya@google.com>,
        Suren Baghdasaryan <surenb@google.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Benjamin Gaignard <benjamin.gaignard@linaro.org>,
        Liam Mark <lmark@codeaurora.org>,
        Laura Abbott <labbott@redhat.com>,
        Brian Starkey <Brian.Starkey@arm.com>,
        John Stultz <john.stultz@linaro.org>,
        Zefan Li <lizefan.x@bytedance.com>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Shuah Khan <shuah@kernel.org>,
        Kalesh Singh <kaleshsingh@google.com>, Kenny.Ho@amd.com,
        =?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>,
        Shuah Khan <skhan@linuxfoundation.org>,
        dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org, cgroups@vger.kernel.org,
        linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Mar 29, 2022 at 9:59 AM Tejun Heo <tj@kernel.org> wrote:
>
> Hello,

I'm sorry for the delay Tejun, my test device stopped working and my
attention has been occupied with that.

>
> On Mon, Mar 28, 2022 at 03:59:41AM +0000, T.J. Mercier wrote:
> > The API/UAPI can be extended to set per-device/total allocation limits
> > in the future.
>
> This total thing kinda bothers me. Can you please provide some concrete
> examples of how this and per-device limits would be used?

The use case we have for accounting the total (separate from the
individual devices) is to include the value as part of bugreports, for
understanding the system-wide amount of dmabuf allocations. I'm not
aware of an existing need to limit the total. Admittedly this is just
the sum over the devices, but we currently maintain out of tree code
to do this sort of thing today. [1]

The per-device limits would be used to restrict the amount of each
type of allocation charged to an individual application to prevent
hogging or to completely prevent access. This limitation is not
something we have implemented today, but it is on our roadmap.

[1] https://android-review.googlesource.com/c/kernel/common/+/1566704/3/drivers/dma-buf/dma-heap.c

>
> Thanks.
>
> --
> tejun
