Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 310A34E997D
	for <lists+linux-media@lfdr.de>; Mon, 28 Mar 2022 16:28:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240590AbiC1Oab (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 28 Mar 2022 10:30:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231512AbiC1Oaa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 28 Mar 2022 10:30:30 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E81DE2C66B
        for <linux-media@vger.kernel.org>; Mon, 28 Mar 2022 07:28:49 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id n35so8496598wms.5
        for <linux-media@vger.kernel.org>; Mon, 28 Mar 2022 07:28:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=WjzWlNVKOE6uKeqLypa3nAMUDF+N13vP0KfWFKRJ4GI=;
        b=LS3rXOJDDKiIT/tfMnHijyWDWKwjQ5oNrVsOyLIAWzFLVdxY+hwOODKpKuBtRwNV3R
         xTjsntU/hYeUcaKuwj32/73XvAM0y9roGriVvmXssFLWO3TcuZbatSV1AKuqGoDSSOPg
         xfUDca8Ykmw0v1welLVX1tyAjAHnnj60lrj4I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=WjzWlNVKOE6uKeqLypa3nAMUDF+N13vP0KfWFKRJ4GI=;
        b=nQVfdsQl2XS9ciNh9YfeFumLh0YaU/R16l5YFDtx+a7/h5GKFTB85NqwFa3Pv5sNbP
         EXMiFVnFFltM008nK73oXtZ56fM0/mA/5LmXABcVJzAMe1LaUBlads32QaLIN9Apmlu0
         qywBbKSBAPfuGMMns1IW8amPXcjRy8yUftySkdxhcSo5UxfLARg/QxhmwcV4i0lUwdmx
         hUTvtTbKSBCLJL6edzXHyT7YrYdGaY69nUdxB5DQwE4NEI9/cbQ4eM56cdkkvYqKS3eG
         Ja4NRzqXCcxtHqMeeKueNXgPtgeof+ARbs9MvDfsIxOmHG2fWmDo4EHlIR+yYqEgS1tN
         ihaw==
X-Gm-Message-State: AOAM533VoS7HIVikL/limr0AnrGxhWJGsR0IMHroG3JwYo8k4koDfUnh
        rgTseCn7h1rVwAhS4tRYtS+6Eg==
X-Google-Smtp-Source: ABdhPJyPodc097J11BwB9GCzd5t3BCFaMS5fyOq2wAqTzghwA5Fhs+Yzi48HpkmELIHQ4mBhJOTAyw==
X-Received: by 2002:a1c:4303:0:b0:38d:43a:82a4 with SMTP id q3-20020a1c4303000000b0038d043a82a4mr9495849wma.37.1648477728396;
        Mon, 28 Mar 2022 07:28:48 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id y15-20020a05600015cf00b00203e324347bsm14508745wry.102.2022.03.28.07.28.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Mar 2022 07:28:47 -0700 (PDT)
Date:   Mon, 28 Mar 2022 16:28:46 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc:     Daniel Vetter <daniel@ffwll.ch>,
        Christian =?iso-8859-1?Q?K=F6nig?= 
        <ckoenig.leichtzumerken@gmail.com>,
        Ville =?iso-8859-1?Q?Syrj=E4l=E4?= 
        <ville.syrjala@linux.intel.com>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        sumit.semwal@linaro.org, gustavo@padovan.org,
        linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org, Dave Airlie <airlied@gmail.com>
Subject: Re: [PATCH 1/2] dma-buf: add dma_fence_unwrap
Message-ID: <YkHGHtMOqVYClkhR@phenom.ffwll.local>
References: <20220311110244.1245-1-christian.koenig@amd.com>
 <Yj3e0QjbnPoG7n4I@intel.com>
 <35cc3bd5-c0ab-0bd1-9603-4971234fbcd6@amd.com>
 <338d0623-1161-c958-101f-dc7d8ef12f99@gmail.com>
 <YkHEutP7ylbVgJjf@phenom.ffwll.local>
 <33e990e7-b6fc-d9f8-5dee-4a809ec80d6c@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <33e990e7-b6fc-d9f8-5dee-4a809ec80d6c@amd.com>
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

On Mon, Mar 28, 2022 at 04:26:44PM +0200, Christian K�nig wrote:
> Am 28.03.22 um 16:22 schrieb Daniel Vetter:
> > On Mon, Mar 28, 2022 at 12:28:31PM +0200, Christian K�nig wrote:
> > > Hi Ville & Daniel,
> > > 
> > > Am 25.03.22 um 16:28 schrieb Christian K�nig:
> > > > Am 25.03.22 um 16:25 schrieb Ville Syrj�l�:
> > > > > On Fri, Mar 11, 2022 at 12:02:43PM +0100, Christian K�nig wrote:
> > > > > > Add a general purpose helper to deep dive into
> > > > > > dma_fence_chain/dma_fence_array
> > > > > > structures and iterate over all the fences in them.
> > > > > > 
> > > > > > This is useful when we need to flatten out all fences in those
> > > > > > structures.
> > > > > > 
> > > > > > Signed-off-by: Christian K�nig <christian.koenig@amd.com>
> > > > > One of the dma-buf patches took down Intel CI. Looks like every
> > > > > machine oopses in some sync_file thing now:
> > > > > <1>[� 260.470008] BUG: kernel NULL pointer dereference, address:
> > > > > 0000000000000010
> > > > > <1>[� 260.470020] #PF: supervisor read access in kernel mode
> > > > > <1>[� 260.470025] #PF: error_code(0x0000) - not-present page
> > > > > <6>[� 260.470030] PGD 0 P4D 0
> > > > > <4>[� 260.470035] Oops: 0000 [#1] PREEMPT SMP NOPTI
> > > > > <4>[� 260.470040] CPU: 0 PID: 5306 Comm: core_hotunplug Not tainted
> > > > > 5.17.0-CI-CI_DRM_11405+ #1
> > > > > <4>[� 260.470049] Hardware name: Intel Corporation Jasper Lake
> > > > > Client Platform/Jasperlake DDR4 SODIMM RVP, BIOS
> > > > > JSLSFWI1.R00.2385.D02.2010160831 10/16/2020
> > > > > <4>[� 260.470058] RIP: 0010:dma_fence_array_first+0x19/0x20
> > > I've looked into this and the root cause seems to be that the new code
> > > doesn't handle dma_fence_arrays with zero elements.
> > > 
> > > That is rather easy to fix, but a dma_fence_array with zero number of
> > > elements is most likely a bug because under the wrong circumstances it can
> > > create a dma_fence instance which will never signal.
> > > 
> > > I've send out a patch on Frinday ([PATCH] dma-buf: WIP dma_fence_array_first
> > > fix) which avoids the crash and prints a warning if anybody tries to create
> > > a dma_fence_array with zero length.
> > > 
> > > Can you test this?
> > It's in drm-tip now (in the fixup branch) so drm-tip results should have
> > the result soonish:
> > 
> > https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fintel-gfx-ci.01.org%2Ftree%2Fdrm-tip%2Findex.html&amp;data=04%7C01%7Cchristian.koenig%40amd.com%7C0afc74b5df0c4ea384af08da10c672fa%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637840742273792356%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=SL2CuMgM6lCSOhDTvs%2FaFg6zRlc7F3X%2BNkf6GuGMGXI%3D&amp;reserved=0?
> 
> How do I find something in there? Is there a search function over all the
> test results?

Not really. You can ask on #intel-gfx-ci, or look at the tests that have
blown up without this to know where to look.

You can also download all the logfiles with wget recursive or so from the
build directory (the links in the top row) and search locally.
-Daniel

> 
> Thanks,
> Christian.
> 
> > 
> > Cheers, Daniel
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
