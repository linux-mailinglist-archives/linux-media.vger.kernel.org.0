Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E03D658F120
	for <lists+linux-media@lfdr.de>; Wed, 10 Aug 2022 19:03:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233153AbiHJRDd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 10 Aug 2022 13:03:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233167AbiHJRDb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 10 Aug 2022 13:03:31 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C6BF74DD6
        for <linux-media@vger.kernel.org>; Wed, 10 Aug 2022 10:03:30 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id ay39-20020a05600c1e2700b003a5503a80cfso1303951wmb.2
        for <linux-media@vger.kernel.org>; Wed, 10 Aug 2022 10:03:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc;
        bh=RycH3O9/jVtOrwg8Tb4rCPx9NQGJX/8jY/4QeSrvWuA=;
        b=ahEMB/f1Os7HN/dmBZ/hQpmyqb6o4v/xxFPofPybSlzrEcYUrb651plr/cbP/+fMzr
         P5NUXhJef0mDLs9iqWCS20L/CffRua3nS9EACIIulJKL7+VNH01XgL+dwLXaKhp+Tfx7
         LpIwltdiTebuvkDiYQOw92vpVGk8zum9tL3uk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc;
        bh=RycH3O9/jVtOrwg8Tb4rCPx9NQGJX/8jY/4QeSrvWuA=;
        b=tDSWtW2IHl1Kv6qlNuoIbT35RvTdKL8OnkVtpcIKpeiOz2J6hJXrCOC829Vs+niXQ3
         KudYFYn5HSVG3SAEHJAJiVsbJ8xVjBZq/6zztN9cLjUSQwaUya5DfLoGsUq0reVce/Y2
         kmnvwfmhVTXH29b2ENyb8A2QOg/NULNNxP4Ukcg+m4u64ekHSA9ClJnIMWbRzrFR+FGr
         NClIBFd0AmBYXURPDiTPID6SgOUQNct25LfPNY+NQfPxsvNtVyogXdSZ+PkRzD2Y14J1
         5HctN17Yhk5P0M8cJRJXoMUNTPq6zTH0Hwm5aZysJfTAZ2g9mQppEhGwPxyovozBU6F3
         M8qQ==
X-Gm-Message-State: ACgBeo36MHddJ6NBYzB4X6Tl8eee9+9dEiCTftnFIiMxP3rWCmuYmM2P
        udFLdipOsqUYadNiaQ0g/u8wEA==
X-Google-Smtp-Source: AA6agR7QsEM/xyMBF5xLERrn21uITTdQBdPJFNEQyJKrMuV11k6LvfptsnHkOpDEr4Zozx6IwaLSEA==
X-Received: by 2002:a05:600c:34c9:b0:3a4:f1d7:edbd with SMTP id d9-20020a05600c34c900b003a4f1d7edbdmr3099490wmq.128.1660151008998;
        Wed, 10 Aug 2022 10:03:28 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id e3-20020adf9bc3000000b0020e6ce4dabdsm16865341wrc.103.2022.08.10.10.03.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Aug 2022 10:03:28 -0700 (PDT)
Date:   Wed, 10 Aug 2022 19:03:26 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc:     Daniel Vetter <daniel@ffwll.ch>,
        Christian =?iso-8859-1?Q?K=F6nig?= 
        <ckoenig.leichtzumerken@gmail.com>, karolina.drobnik@intel.com,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Subject: Re: [Intel-gfx] [PATCH] dma-buf: revert "return only unsignaled
 fences in dma_fence_unwrap_for_each v3"
Message-ID: <YvPk3pdz0t81Pz7A@phenom.ffwll.local>
References: <20220712102849.1562-1-christian.koenig@amd.com>
 <CAKMK7uFnMSKXcU+v_g-Sh62O5MB1uY=K2H-Fq7-5UYtmmjCZ_w@mail.gmail.com>
 <c78e4774-6319-a9ce-978b-4489e1913da3@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c78e4774-6319-a9ce-978b-4489e1913da3@amd.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Aug 10, 2022 at 07:01:55PM +0200, Christian König wrote:
> Am 10.08.22 um 18:54 schrieb Daniel Vetter:
> > On Tue, 12 Jul 2022 at 12:28, Christian König
> > <ckoenig.leichtzumerken@gmail.com> wrote:
> > > This reverts commit 8f61973718485f3e89bc4f408f929048b7b47c83.
> > > 
> > > It turned out that this is not correct. Especially the sync_file info
> > > IOCTL needs to see even signaled fences to correctly report back their
> > > status to userspace.
> > > 
> > > Instead add the filter in the merge function again where it makes sense.
> > > 
> > > Signed-off-by: Christian König <christian.koenig@amd.com>
> > > ---
> > >   drivers/dma-buf/dma-fence-unwrap.c | 3 ++-
> > >   include/linux/dma-fence-unwrap.h   | 6 +-----
> > >   2 files changed, 3 insertions(+), 6 deletions(-)
> > > 
> > > diff --git a/drivers/dma-buf/dma-fence-unwrap.c b/drivers/dma-buf/dma-fence-unwrap.c
> > > index 502a65ea6d44..7002bca792ff 100644
> > > --- a/drivers/dma-buf/dma-fence-unwrap.c
> > > +++ b/drivers/dma-buf/dma-fence-unwrap.c
> > > @@ -72,7 +72,8 @@ struct dma_fence *__dma_fence_unwrap_merge(unsigned int num_fences,
> > >          count = 0;
> > >          for (i = 0; i < num_fences; ++i) {
> > >                  dma_fence_unwrap_for_each(tmp, &iter[i], fences[i])
> > > -                       ++count;
> > > +                       if (!dma_fence_is_signaled(tmp))
> > > +                               ++count;
> > >          }
> > > 
> > >          if (count == 0)
> > > diff --git a/include/linux/dma-fence-unwrap.h b/include/linux/dma-fence-unwrap.h
> > > index 390de1ee9d35..66b1e56fbb81 100644
> > > --- a/include/linux/dma-fence-unwrap.h
> > > +++ b/include/linux/dma-fence-unwrap.h
> > > @@ -43,14 +43,10 @@ struct dma_fence *dma_fence_unwrap_next(struct dma_fence_unwrap *cursor);
> > >    * Unwrap dma_fence_chain and dma_fence_array containers and deep dive into all
> > >    * potential fences in them. If @head is just a normal fence only that one is
> > >    * returned.
> > > - *
> > > - * Note that signalled fences are opportunistically filtered out, which
> > > - * means the iteration is potentially over no fence at all.
> > >    */
> > >   #define dma_fence_unwrap_for_each(fence, cursor, head)                 \
> > >          for (fence = dma_fence_unwrap_first(head, cursor); fence;       \
> > > -            fence = dma_fence_unwrap_next(cursor))                     \
> > > -               if (!dma_fence_is_signaled(fence))
> > > +            fence = dma_fence_unwrap_next(cursor))
> > Not sure it's worth it, but could we still filter but keep the fence
> > if there's an error?
> > 
> > I'm honestly also not entirely sure whether error propagation is a
> > terrific idea, since every single use-case I've seen in i915 was a
> > mis-design and not good at all. So burning it all down and declaring
> > the testcases invalid might be the right thing to do here.
> 
> This is not about error propagation.
> 
> The sync_file has an IOCTL which asks how many of the merged fences are
> already signaled. When we filter signaled fences here the result of this is
> always 0.
> 
> We have an igt test exercising this which reported that the IOCTL doesn't
> work any more.

Ah ok. I guess we add that to the list of reasons why sync_file is a bit a
funny interface, and people should just use drm_syncobj instead :-)
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
