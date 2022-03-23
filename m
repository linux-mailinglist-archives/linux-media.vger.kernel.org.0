Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 184F44E5792
	for <lists+linux-media@lfdr.de>; Wed, 23 Mar 2022 18:34:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343625AbiCWRfr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Mar 2022 13:35:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235607AbiCWRfq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Mar 2022 13:35:46 -0400
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com [IPv6:2607:f8b0:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50772574A7
        for <linux-media@vger.kernel.org>; Wed, 23 Mar 2022 10:34:16 -0700 (PDT)
Received: by mail-oi1-x231.google.com with SMTP id b188so2323296oia.13
        for <linux-media@vger.kernel.org>; Wed, 23 Mar 2022 10:34:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Oc3j7qx+RVq8AEkfbcM8wdtLT4RMF7Jazn9wGYELKYo=;
        b=lVkaipRA9cbbKsIlTwibO+57SxWnmiqryKv0QNJOucGwuc85AOdLhje9gbxr7u8Rdl
         VpwYNmHEpSm8s83sTXx0BOm0SGiY2Zyb7uZqmf9JT83N1ufvMp8kqJbrf/JTsFgT0GV8
         LP+8GyqiNFYGyloG+Q3LWwT01N2gsUJwTKOCI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Oc3j7qx+RVq8AEkfbcM8wdtLT4RMF7Jazn9wGYELKYo=;
        b=x/UdG1V6ela9cew9ljNCRsaio0AqmTALQQPUGQZVaboeKRWFPu6waex3yxawMRgslG
         k+V5JC7+8bfJXSHRazzN4CF/P9PGcswr8V1bMgyIO5MCw7KxXQriOa3MVfNk+fpayfjM
         xI0+oitiv7wqQ2Ey0HEhXvw6hyO/OMR+xYJUWeVNxxaQUORsCaGh/Nos1qda67ovvKwH
         hZivVedDtdOoZWX+IjF6CKj4O/5PCFmYBLZEQHgJUmPkrivU0CiVxqCc/DKwXIG7DKkV
         eaRjkGpUu0zpbDtQ2mWf6HgQcOIgUyfa91bg/clr0+3H0Ojbfd3zSd0KeX+Ww728oiiZ
         oLvQ==
X-Gm-Message-State: AOAM531hSexjsiHGEhpJ4+rZY9FIO0RkTkTHyVMEaIt51SE0xtD+mpG/
        dFXR9vXo3lTWB04L3LKpP8RO1dKMnnFXUSRJaL1yoQ==
X-Google-Smtp-Source: ABdhPJwpviu3DKqdy1TzqCT0HJi2lO9O1FtTVne+HEW/NX81Bk5OXD4zGWdVlTPf9979mrjITZUiEU+yyHfhF1gO/r0=
X-Received: by 2002:a54:4099:0:b0:2ec:d31c:481d with SMTP id
 i25-20020a544099000000b002ecd31c481dmr634810oii.7.1648056854641; Wed, 23 Mar
 2022 10:34:14 -0700 (PDT)
MIME-Version: 1.0
References: <20220321135856.1331-1-christian.koenig@amd.com>
 <20220321135856.1331-4-christian.koenig@amd.com> <Yjse+S0bf4P6QTfu@phenom.ffwll.local>
 <20220323163242.GJ64706@ziepe.ca>
In-Reply-To: <20220323163242.GJ64706@ziepe.ca>
From:   Daniel Vetter <daniel@ffwll.ch>
Date:   Wed, 23 Mar 2022 18:34:03 +0100
Message-ID: <CAKMK7uHRnYSSrrP_4p2JLBhsXX4TZcPFm44LS9wEwOR1R+fBBA@mail.gmail.com>
Subject: Re: [PATCH 04/23] RDMA: use dma_resv_wait() instead of extracting the fence
To:     Jason Gunthorpe <jgg@ziepe.ca>
Cc:     =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
        dri-devel@lists.freedesktop.org,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Leon Romanovsky <leon@kernel.org>,
        Maor Gottlieb <maorg@nvidia.com>,
        Gal Pressman <galpress@amazon.com>,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, 23 Mar 2022 at 17:32, Jason Gunthorpe <jgg@ziepe.ca> wrote:
>
> On Wed, Mar 23, 2022 at 02:22:01PM +0100, Daniel Vetter wrote:
> > On Mon, Mar 21, 2022 at 02:58:37PM +0100, Christian K=C3=B6nig wrote:
> > > Use dma_resv_wait() instead of extracting the exclusive fence and
> > > waiting on it manually.
> > >
> > > Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> > > Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> > > Cc: Jason Gunthorpe <jgg@ziepe.ca>
> >
> > Jason, can you ack this for merging through drm trees please?
>
> Sure, it looks trivial, but I didn't see the whole series:
>
> Acked-by: Jason Gunthorpe <jgg@nvidia.com>

The entire series reworks how dma_resv stores fences (and what exactly
the mean), which is why we need to get users away from some of these
low-level accessors and towards functions at a slightly higher level.
-Daniel
--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
