Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 728A0533E3F
	for <lists+linux-media@lfdr.de>; Wed, 25 May 2022 15:51:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231805AbiEYNve (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 May 2022 09:51:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229555AbiEYNvc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 May 2022 09:51:32 -0400
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91CD91F60A
        for <linux-media@vger.kernel.org>; Wed, 25 May 2022 06:51:31 -0700 (PDT)
Received: by mail-wr1-x432.google.com with SMTP id e28so29615856wra.10
        for <linux-media@vger.kernel.org>; Wed, 25 May 2022 06:51:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=sGIIQaffh8qdkdQN2TXQM0yr8CUtzn4ce76styDebts=;
        b=kbY52ZA4DFb987YS0okGoh3t5eIgdmKEuolgdMxKh7Hkla0pfFOMjVrqzO1N4XkIeA
         /GgnyDTr+mP93p+H3sGbXt9dqPxADYbI0ixUTIikdlnBDJOxTd8ZVmKSdtbpSOM4BBx2
         gZuMHTab7nxWtS+2Rd9Y1FyeMf0lIY+hJas2o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=sGIIQaffh8qdkdQN2TXQM0yr8CUtzn4ce76styDebts=;
        b=hRXQT+QCuiAvxme/tqLDFTc1jevjsTtmognduFMISSKyzFaTlSAVHvIkVWOK6rDXHf
         OyeXRu4FkEfHHRVloZFS/TRhWCuPq2r4bRUW/lfK7eTlZa/tiozkaXk8NNMgvq1R49l+
         cU08b3487FKhAvlQERA/ATWVgLL4i6+ToqavYKDHcGH0wc8Sq3/QBK1rccrWeWWO6u12
         Ns/k9XQMAZ0KiuASoRB8ShSDiOHkSRny+ixhjPzQFkTlpTLuexuNXLsxGCM6M7HJgxfZ
         yXeqrGq6LD/64ieBc4TfJUZy2nKchC9P25AJThUdqt2wtlaVGNfOb+DRtt1Rs/YFVxY7
         9xJg==
X-Gm-Message-State: AOAM533IZTT8iQS/URX55iFVdjQZq/LY+RYRP5jezGGtaopPBMK4Ph7C
        9OqPeSm4zAt4tFkcwNmaAczZgQ==
X-Google-Smtp-Source: ABdhPJyRr1tz+y8O4y7skfjqjEb9iHPo/NOjJwcynFRmI5qq8NQRQGpHAaROpLCZFV846v9TlslNUQ==
X-Received: by 2002:a5d:560f:0:b0:20d:b24:dadb with SMTP id l15-20020a5d560f000000b0020d0b24dadbmr26795298wrv.121.1653486690098;
        Wed, 25 May 2022 06:51:30 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id bi19-20020a05600c3d9300b003942a244f39sm2047172wmb.18.2022.05.25.06.51.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 May 2022 06:51:29 -0700 (PDT)
Date:   Wed, 25 May 2022 15:51:27 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Michel =?iso-8859-1?Q?D=E4nzer?= <michel.daenzer@mailbox.org>
Cc:     Daniel Vetter <daniel@ffwll.ch>,
        Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
        tvrtko.ursulin@linux.intel.com, sergemetral@google.com,
        tzimmermann@suse.de, gustavo@padovan.org, Felix.Kuehling@amd.com,
        linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org, jason@jlekstrand.net,
        alexander.deucher@amd.com, daniels@collabora.com,
        skhawaja@google.com, sumit.semwal@linaro.org, maad.aldabagh@amd.com
Subject: Re: Tackling the indefinite/user DMA fence problem
Message-ID: <Yo40X03axFXXN9/d@phenom.ffwll.local>
References: <20220502163722.3957-1-christian.koenig@amd.com>
 <YnJQs1iusrBvpuMs@phenom.ffwll.local>
 <a01c7703-f7f7-f8ce-f80e-632a6fdcbbbe@gmail.com>
 <Ynkg81p6ADyZBa/L@phenom.ffwll.local>
 <a249c0c4-ee6c-bfb0-737b-eb6afae29602@amd.com>
 <Yo4pin1Js4KXs2HL@phenom.ffwll.local>
 <19808e9e-a5a6-c878-a2f7-5b33444f547d@mailbox.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <19808e9e-a5a6-c878-a2f7-5b33444f547d@mailbox.org>
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

On Wed, May 25, 2022 at 03:28:41PM +0200, Michel D�nzer wrote:
> On 2022-05-25 15:05, Daniel Vetter wrote:
> > On Tue, May 17, 2022 at 12:28:17PM +0200, Christian K�nig wrote:
> >> Am 09.05.22 um 16:10 schrieb Daniel Vetter:
> >>> On Mon, May 09, 2022 at 08:56:41AM +0200, Christian K�nig wrote:
> >>>> Am 04.05.22 um 12:08 schrieb Daniel Vetter:
> >>>>>
> >>>>> If the goal is specifically atomic kms, then there's an entire can of
> >>>>> worms there that I really don't want to think about, but it exists: We
> >>>>> have dma_fence as out-fences from atomic commit, and that's already
> >>>>> massively broken since most drivers allocate some memory or at least take
> >>>>> locks which can allocate memory in their commit path. Like i2c. Putting a
> >>>>> userspace memory fence as in-fence in there makes that problem
> >>>>> substantially worse, since at least in theory you're just not allowed to
> >>>>> might_faul in atomic_commit_tail.
> >>>> Yes, that's unfortunately one of the goals as well and yes I completely
> >>>> agree on the can of worms. But I think I've solved that.
> >>>>
> >>>> What I do in the patch set is to enforce that the out fence is an user fence
> >>>> when the driver supports user in fences as well.
> >>>>
> >>>> Since user fences doesn't have the memory management dependency drivers can
> >>>> actually allocate memory or call I2C functions which takes locks which have
> >>>> memory allocation dependencies.
> >>>>
> >>>> Or do I miss some other reason why you can't fault or allocate memory in
> >>>> atomic_commit_tail? At least lockdep seems to be happy about that now.
> >>> The problem is a bit that this breaks the uapi already. At least if the
> >>> goal is to have this all be perfectly transparent for userspace - as you
> >>> as you have multi-gpu setups going on at least.
> >>
> >> Question here is why do you think there is an UAPI break? We currently wait
> >> in a work item already, so where exactly is the problem?
> > 
> > It's a bit washy, but dma_fence and hence implicit sync is supposed to
> > finish in finite time. umf just doesn't.
> > 
> > Ofc in reality you can still flood your compositor and they're not very
> > robust, but with umf it's trivial to just hang your compositor forever and
> > nothing happens.
> 
> You can add that to the list of reasons why compositors need to stop
> using buffers with unsignaled fences. There's plenty of other reasons
> there already (the big one being that otherwise slow clients can slow
> down the compositor, even if the compositor uses a high priority context
> and the HW supports preemption).

Yeah that's tbh another reason why I think we shouldn't do umf as a
transparent thing - compositors need to get better anyway, so we might as
well take this as a chance to do this right.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
