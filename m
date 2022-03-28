Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D6A014E9954
	for <lists+linux-media@lfdr.de>; Mon, 28 Mar 2022 16:22:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241694AbiC1OYg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 28 Mar 2022 10:24:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239756AbiC1OYg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 28 Mar 2022 10:24:36 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 851C05DE45
        for <linux-media@vger.kernel.org>; Mon, 28 Mar 2022 07:22:54 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id l7-20020a05600c1d0700b0038c99618859so13076105wms.2
        for <linux-media@vger.kernel.org>; Mon, 28 Mar 2022 07:22:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=0qMi19vJjaBiLl9cST+fBDBfq+lOIRwdfDjsTWbv4+A=;
        b=F6SrEc540oQbJ4koNpIXnsQNTXkFgqI6U/3cDMxUWVC4DyuuAWQRvto0jWiQx+RygR
         az1eH84A1QaOlVPcmO2sktRA6+Oq14ehcGOz9Wipe7TsmT4xpng2OUhP8KJzz26RUyKz
         O3PYrAc8ylFBmFqVK6n23fC3EaqzGbjQigaF0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=0qMi19vJjaBiLl9cST+fBDBfq+lOIRwdfDjsTWbv4+A=;
        b=s4MNne7hRo2Q1iYGioE8l/P7doZbFMGdYPZtoNYyTl/r1KlrVuVLYyblLxryA7AGL+
         9HarDmBO2EDXvlkmAKMC6FIPkYuKiQrrqnrY3xsHTG0TS8bxLvfk84uisz0q60/Bdfdd
         32t0Klf+nPtfaj0y+tFWzU9gJp+7QfDq8OZfm/yaMDPqPmWyVzVDIHLmUxUYjLuJxPhA
         08DH5I0i/XqJJU8lbn5yNr8ELh5mi07SFtZ4EhpGUQzTWiAVKe+Wst8vVBEOyGjKgTI1
         bQwOWqs+bKereUSIFjPKad349oPqw59Yj8G8pK76Hl+HXpszEpLkq2faNW7wQ8863hRE
         i5tQ==
X-Gm-Message-State: AOAM532neaF44HbZa55MBUFXR2eHKwnTggwjHoigg7L1dR931SfES3bU
        FgtWl/Gi6+nacNSqLbS4Lk6+zQ==
X-Google-Smtp-Source: ABdhPJy/CXlQv4q32M0C+eVPZAvzKzIlirYkPv5FpU1qt19fZsp2h8xi+lNT8j6s35IT6ynk7FjAsw==
X-Received: by 2002:a05:600c:12c9:b0:38c:b319:6da2 with SMTP id v9-20020a05600c12c900b0038cb3196da2mr36510119wmd.125.1648477373048;
        Mon, 28 Mar 2022 07:22:53 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id z5-20020a05600c0a0500b0037fa93193a8sm13921845wmp.44.2022.03.28.07.22.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Mar 2022 07:22:52 -0700 (PDT)
Date:   Mon, 28 Mar 2022 16:22:50 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Christian =?iso-8859-1?Q?K=F6nig?= 
        <ckoenig.leichtzumerken@gmail.com>
Cc:     Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
        Ville =?iso-8859-1?Q?Syrj=E4l=E4?= 
        <ville.syrjala@linux.intel.com>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        sumit.semwal@linaro.org, gustavo@padovan.org,
        linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org, Dave Airlie <airlied@gmail.com>
Subject: Re: [PATCH 1/2] dma-buf: add dma_fence_unwrap
Message-ID: <YkHEutP7ylbVgJjf@phenom.ffwll.local>
References: <20220311110244.1245-1-christian.koenig@amd.com>
 <Yj3e0QjbnPoG7n4I@intel.com>
 <35cc3bd5-c0ab-0bd1-9603-4971234fbcd6@amd.com>
 <338d0623-1161-c958-101f-dc7d8ef12f99@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <338d0623-1161-c958-101f-dc7d8ef12f99@gmail.com>
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

On Mon, Mar 28, 2022 at 12:28:31PM +0200, Christian König wrote:
> Hi Ville & Daniel,
> 
> Am 25.03.22 um 16:28 schrieb Christian König:
> > Am 25.03.22 um 16:25 schrieb Ville Syrjälä:
> > > On Fri, Mar 11, 2022 at 12:02:43PM +0100, Christian König wrote:
> > > > Add a general purpose helper to deep dive into
> > > > dma_fence_chain/dma_fence_array
> > > > structures and iterate over all the fences in them.
> > > > 
> > > > This is useful when we need to flatten out all fences in those
> > > > structures.
> > > > 
> > > > Signed-off-by: Christian König <christian.koenig@amd.com>
> > > One of the dma-buf patches took down Intel CI. Looks like every
> > > machine oopses in some sync_file thing now:
> > > <1>[  260.470008] BUG: kernel NULL pointer dereference, address:
> > > 0000000000000010
> > > <1>[  260.470020] #PF: supervisor read access in kernel mode
> > > <1>[  260.470025] #PF: error_code(0x0000) - not-present page
> > > <6>[  260.470030] PGD 0 P4D 0
> > > <4>[  260.470035] Oops: 0000 [#1] PREEMPT SMP NOPTI
> > > <4>[  260.470040] CPU: 0 PID: 5306 Comm: core_hotunplug Not tainted
> > > 5.17.0-CI-CI_DRM_11405+ #1
> > > <4>[  260.470049] Hardware name: Intel Corporation Jasper Lake
> > > Client Platform/Jasperlake DDR4 SODIMM RVP, BIOS
> > > JSLSFWI1.R00.2385.D02.2010160831 10/16/2020
> > > <4>[  260.470058] RIP: 0010:dma_fence_array_first+0x19/0x20
> 
> I've looked into this and the root cause seems to be that the new code
> doesn't handle dma_fence_arrays with zero elements.
> 
> That is rather easy to fix, but a dma_fence_array with zero number of
> elements is most likely a bug because under the wrong circumstances it can
> create a dma_fence instance which will never signal.
> 
> I've send out a patch on Frinday ([PATCH] dma-buf: WIP dma_fence_array_first
> fix) which avoids the crash and prints a warning if anybody tries to create
> a dma_fence_array with zero length.
> 
> Can you test this?

It's in drm-tip now (in the fixup branch) so drm-tip results should have
the result soonish:

https://intel-gfx-ci.01.org/tree/drm-tip/index.html?

Cheers, Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
