Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3601257355A
	for <lists+linux-media@lfdr.de>; Wed, 13 Jul 2022 13:27:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234908AbiGML1f (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 13 Jul 2022 07:27:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229724AbiGML1e (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 13 Jul 2022 07:27:34 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6EFF41020A7
        for <linux-media@vger.kernel.org>; Wed, 13 Jul 2022 04:27:32 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id l23so19296661ejr.5
        for <linux-media@vger.kernel.org>; Wed, 13 Jul 2022 04:27:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=basnieuwenhuizen.nl; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=cgbVqpds8mhTKeUXizYnEEoGmAd2rC6hze58WchI2BM=;
        b=YE8DIUKEKR81wAdiKdIdXPiVSalzHYH7NiL2C5V6iUyw/U4tQsO8cTTuNu/adU8fyD
         E8fm6cQ2pKPhPyvgxSzZFCLhHKzeHtboii2CGvQcd4XogCVJgBRpwytlV6CQ0wCAfHea
         AMIf6iz0sdEyy03hBciyNKRUGeDIDiCL8LxrSt4EpvWdPxSEsSO074ldQXBIeNzwuzmj
         yRHOIz5ox+htnE2+DlgT0jifhG4TJ4fbp4QRXAfKQy1i51Pq/kzbAMJoE5GaUI8X5MLI
         9pQ98Z71WcDiLMrOMK9KB/5LqNtMDcjz7FcCp7MUdfm19ZnuI3/m4UG5K+7+CGjdMHdq
         CRqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=cgbVqpds8mhTKeUXizYnEEoGmAd2rC6hze58WchI2BM=;
        b=w3SFQ/p74ExNnuCYu6dTDfx54RovnmXULv55oaU6d2wA0CtrWCKM2KTMkre6OYrk4B
         NtHUct3AYdbd+wGfGADrJcJl70bA3HJwoBLGm/Wevz9TmTR9uV8g3zlp5Mhzwed3Zw3F
         bIqrWfDIAbLStF5efHmi3iUgpcOhvLwZPYkw1INoAIngbpcCYp/oUmG2AmNrjDkGSIUE
         ZJHD0OZCKfaaY4ysQYlgbUEXeQ2CN8qelAXCC6TVoRD/hyFz8FjdsOxC1/NCHp+t9ZM2
         8PxVust5ju6YJH/NXT090Dc6VLkmdV2O0JhLskfuFspkgi3XFSzofjAIOaO77NZlvYrF
         f/bA==
X-Gm-Message-State: AJIora9rTnuhl/028H9AtvscKDm8EJ9i9A1cxKmiVzOi8SLJNOdrKuW3
        1nMzrM85ZxWSRQbZ2sTQaJ1u230XQgsuYgeFwBOJ8FZfklGxtg==
X-Google-Smtp-Source: AGRyM1tHwm40kKIWPERFKsHDjnmslgZwhxHHbdVXqQbznHIUujskOLvaWC2g4hKKQJ6jrd9rtwfArZWg/KjJFIOPUh8=
X-Received: by 2002:a17:906:c781:b0:726:c967:8d1b with SMTP id
 cw1-20020a170906c78100b00726c9678d1bmr3093574ejb.54.1657711651034; Wed, 13
 Jul 2022 04:27:31 -0700 (PDT)
MIME-Version: 1.0
References: <20220712131201.131475-1-christian.koenig@amd.com>
 <CADnq5_PSECF0b_ynF=UhXu3Os0hYZcvcQtk1pD+T3q+Z1g-Hgg@mail.gmail.com> <a3dfc73f-5867-d442-b74d-a890a42753bd@amd.com>
In-Reply-To: <a3dfc73f-5867-d442-b74d-a890a42753bd@amd.com>
From:   Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
Date:   Wed, 13 Jul 2022 13:27:13 +0200
Message-ID: <CAP+8YyHLy9=ueEcgVbk6nnAr=aqJXW1f31xm37gkGVrzdG3o=g@mail.gmail.com>
Subject: Re: [Linaro-mm-sig] [PATCH] dma-buf/dma_resv_usage: update explicit
 sync documentation
To:     =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc:     Alex Deucher <alexdeucher@gmail.com>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        linux-media <linux-media@vger.kernel.org>,
        Maling list - DRI developers 
        <dri-devel@lists.freedesktop.org>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>, Daniel Vetter <daniel@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

With that changed

Reviewed-by: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>

Thanks!

On Tue, Jul 12, 2022 at 3:23 PM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> Am 12.07.22 um 15:20 schrieb Alex Deucher:
> > On Tue, Jul 12, 2022 at 9:12 AM Christian K=C3=B6nig
> > <ckoenig.leichtzumerken@gmail.com> wrote:
> >> Make it clear that DMA_RESV_USAGE_BOOKMARK can be used for explicit sy=
nced
> > DMA_RESV_USAGE_BOOKKEEP?
>
> Crappy autocorrect and copy&paste. Thanks for pointing that out.
>
> Christian.
>
> >
> >> user space submissions as well and document the rules around adding th=
e
> >> same fence with different usages.
> >>
> >> Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> >> ---
> >>   include/linux/dma-resv.h | 16 +++++++++++++---
> >>   1 file changed, 13 insertions(+), 3 deletions(-)
> >>
> >> diff --git a/include/linux/dma-resv.h b/include/linux/dma-resv.h
> >> index c8ccbc94d5d2..264e27e56dff 100644
> >> --- a/include/linux/dma-resv.h
> >> +++ b/include/linux/dma-resv.h
> >> @@ -62,6 +62,11 @@ struct dma_resv_list;
> >>    * For example when asking for WRITE fences then the KERNEL fences a=
re returned
> >>    * as well. Similar when asked for READ fences then both WRITE and K=
ERNEL
> >>    * fences are returned as well.
> >> + *
> >> + * Already used fences can be promoted in the sense that a fence with
> >> + * DMA_RESV_USAGE_BOOKMARK could become DMA_RESV_USAGE_READ by adding=
 it again
> > Same here.
> >
> > With that fixed,
> > Acked-by: Alex Deucher <alexander.deucher@amd.com>
> >
> > Alex
> >
> >> + * with this usage. But fences can never be degraded in the sense tha=
t a fence
> >> + * with DMA_RESV_USAGE_WRITE could become DMA_RESV_USAGE_READ.
> >>    */
> >>   enum dma_resv_usage {
> >>          /**
> >> @@ -98,10 +103,15 @@ enum dma_resv_usage {
> >>           * @DMA_RESV_USAGE_BOOKKEEP: No implicit sync.
> >>           *
> >>           * This should be used by submissions which don't want to par=
ticipate in
> >> -        * implicit synchronization.
> >> +        * any implicit synchronization.
> >> +        *
> >> +        * The most common case are preemption fences, page table upda=
tes, TLB
> >> +        * flushes as well as explicit synced user submissions.
> >>           *
> >> -        * The most common case are preemption fences as well as page =
table
> >> -        * updates and their TLB flushes.
> >> +        * Explicit synced user user submissions can be promoted to
> >> +        * DMA_RESV_USAGE_READ or DMA_RESV_USAGE_WRITE as needed using
> >> +        * dma_buf_import_sync_file() when implicit synchronization sh=
ould
> >> +        * become necessary after initial adding of the fence.
> >>           */
> >>          DMA_RESV_USAGE_BOOKKEEP
> >>   };
> >> --
> >> 2.25.1
> >>
> >> _______________________________________________
> >> Linaro-mm-sig mailing list -- linaro-mm-sig@lists.linaro.org
> >> To unsubscribe send an email to linaro-mm-sig-leave@lists.linaro.org
>
