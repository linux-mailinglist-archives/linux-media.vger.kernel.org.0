Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 342A3638FFA
	for <lists+linux-media@lfdr.de>; Fri, 25 Nov 2022 19:38:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229796AbiKYSio (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 25 Nov 2022 13:38:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229601AbiKYSim (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 25 Nov 2022 13:38:42 -0500
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com [IPv6:2607:f8b0:4864:20::b35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A11C10540
        for <linux-media@vger.kernel.org>; Fri, 25 Nov 2022 10:38:42 -0800 (PST)
Received: by mail-yb1-xb35.google.com with SMTP id e141so6031605ybh.3
        for <linux-media@vger.kernel.org>; Fri, 25 Nov 2022 10:38:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R113yfqtwbqC0ITDeGvhSNa3zHrb/nkgAVqOtFCA4Qc=;
        b=sS359yY7pQIaB3NIMVHYcqDqWmEn/ZMyYfc7T6oA3VOjJmqn0ykiDIAFmwHIQSbsLQ
         SwBMwRnZhBCbXGg6szCpfHmDgxIEcskbbt0mPR6iR10Lm8nOmVRFbaaGEpADctbzhWX7
         fPe0fWjas4DFr8/jjVLoxV6jKNqu62BAu3ItCwKWCUpG4SZvIJExxAKMtYoF3/lTTibB
         wtCyMudC0RoYxPe2jfPlNOdYXLMVwnasC9E0dZJpO6P7XJIkWmnvWU/WvCispvu5W9wV
         J3BwUkORUs03UIenFoYtgGx+XVyBQFc0F2NrmWWLOlFOUKkSTmiql4z9rE5LNMxJQJmf
         by+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R113yfqtwbqC0ITDeGvhSNa3zHrb/nkgAVqOtFCA4Qc=;
        b=rRNpbHdUCGJhc5h40lpyy5jcTm8DbLoKVlG5JV4u2wJIfNhu94eoiCKxhKBm/rx96H
         b3/cEacVBN9rYNaDLs96Fd+0R/dhL0cajJjvPaDdoYO7L2+uIdGTOO3eesz6b9nOzK3E
         YtGDxJOChsW61yyOB6lMBVcsxa7POuGhNBxB6hDk0zxrTLoB4oWsltCqsAbLxOm3lV0O
         tX//2ExNEQlXkfGfB7dnvOglayKWiZsxprUZxQy/ai3s6tGts4SNOA+nvZETxqrRkpjG
         PTMyvH12+0jdW3HPRYcZOqfkQTYHFCCUo7l9RwHfYHLPUVgflH9Rrq3U6aZlCqYQV04h
         u83A==
X-Gm-Message-State: ANoB5pln0eHiKr8r1otLNxFL3blYBX5N2rlVz6T69onWoekNj+CP0rI0
        GGIfl3z2jVS20aa5Fes0/3uhpyqKV62ndz+0UC06vw==
X-Google-Smtp-Source: AA0mqf5AXflwQEOLKlJmJazpNyHLivko8S4A9tyMg119AsSvYjt/IFoUuaE2j1mVksysNrm0lltNF3qJhF/EdhJtEFs=
X-Received: by 2002:a25:7408:0:b0:6f2:49a7:38ef with SMTP id
 p8-20020a257408000000b006f249a738efmr6331877ybc.365.1669401521064; Fri, 25
 Nov 2022 10:38:41 -0800 (PST)
MIME-Version: 1.0
References: <20221123193519.3948105-1-tjmercier@google.com>
 <260a86f0-057e-e235-ac38-abeb922d0dc1@amd.com> <Y38z6A5IF/BlXVPp@phenom.ffwll.local>
 <63972059-1c23-ceb9-841c-1cfee29a1c77@gmail.com>
In-Reply-To: <63972059-1c23-ceb9-841c-1cfee29a1c77@gmail.com>
From:   "T.J. Mercier" <tjmercier@google.com>
Date:   Fri, 25 Nov 2022 10:38:30 -0800
Message-ID: <CABdmKX2QvW_7qDeosxES4jLsTDPUWS-Qphj4FaJUsqDeVQbf9A@mail.gmail.com>
Subject: Re: [Linaro-mm-sig] Re: [PATCH] dma-buf: A collection of typo and
 documentation fixes
To:     =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
Cc:     =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Nov 24, 2022 at 1:43 AM Christian K=C3=B6nig
<ckoenig.leichtzumerken@gmail.com> wrote:
>
> Am 24.11.22 um 10:05 schrieb Daniel Vetter:
> > On Thu, Nov 24, 2022 at 08:03:09AM +0100, Christian K=C3=B6nig wrote:
> >> Am 23.11.22 um 20:35 schrieb T.J. Mercier:
> >>> I've been collecting these typo fixes for a while and it feels like
> >>> time to send them in.
> >>>
> >>> Signed-off-by: T.J. Mercier <tjmercier@google.com>
> >> Acked-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> > Will you also push this? I think tj doesn't have commit rights yet, and=
 I
> > somehow can't see the patch locally (I guess it's stuck in moderation).
>
> I was just about to complain that this doesn't apply cleanly to
> drm-misc-next.
>
> Trivial problem, one of the typos was just removed by Dimitry a few
> weeks ago.
>
> I've fixed that up locally and pushed the result, but nevertheless
> please make sure that DMA-buf patches are based on the drm branches.
>
I'm sorry, this was on top of a random spot in Linus's 6.1-rc5.
(84368d882b96 Merge tag 'soc-fixes-6.1-3') I'm not sure why I did
that, but I suspect it was after a fresh git pull. I have too many
repos.

Thanks all for the reviews.

> Thanks,
> Christian.
>
> > -Daniel
> >
> >>> ---
> >>>    drivers/dma-buf/dma-buf.c | 14 +++++++-------
> >>>    include/linux/dma-buf.h   |  6 +++---
> >>>    2 files changed, 10 insertions(+), 10 deletions(-)
> >>>
> >>> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> >>> index dd0f83ee505b..614ccd208af4 100644
> >>> --- a/drivers/dma-buf/dma-buf.c
> >>> +++ b/drivers/dma-buf/dma-buf.c
> >>> @@ -1141,7 +1141,7 @@ EXPORT_SYMBOL_NS_GPL(dma_buf_unmap_attachment, =
DMA_BUF);
> >>>     *
> >>>     * @dmabuf:      [in]    buffer which is moving
> >>>     *
> >>> - * Informs all attachmenst that they need to destroy and recreated a=
ll their
> >>> + * Informs all attachments that they need to destroy and recreate al=
l their
> >>>     * mappings.
> >>>     */
> >>>    void dma_buf_move_notify(struct dma_buf *dmabuf)
> >>> @@ -1159,11 +1159,11 @@ EXPORT_SYMBOL_NS_GPL(dma_buf_move_notify, DMA=
_BUF);
> >>>    /**
> >>>     * DOC: cpu access
> >>>     *
> >>> - * There are mutliple reasons for supporting CPU access to a dma buf=
fer object:
> >>> + * There are multiple reasons for supporting CPU access to a dma buf=
fer object:
> >>>     *
> >>>     * - Fallback operations in the kernel, for example when a device =
is connected
> >>>     *   over USB and the kernel needs to shuffle the data around firs=
t before
> >>> - *   sending it away. Cache coherency is handled by braketing any tr=
ansactions
> >>> + *   sending it away. Cache coherency is handled by bracketing any t=
ransactions
> >>>     *   with calls to dma_buf_begin_cpu_access() and dma_buf_end_cpu_=
access()
> >>>     *   access.
> >>>     *
> >>> @@ -1190,7 +1190,7 @@ EXPORT_SYMBOL_NS_GPL(dma_buf_move_notify, DMA_B=
UF);
> >>>     *   replace ION buffers mmap support was needed.
> >>>     *
> >>>     *   There is no special interfaces, userspace simply calls mmap o=
n the dma-buf
> >>> - *   fd. But like for CPU access there's a need to braket the actual=
 access,
> >>> + *   fd. But like for CPU access there's a need to bracket the actua=
l access,
> >>>     *   which is handled by the ioctl (DMA_BUF_IOCTL_SYNC). Note that
> >>>     *   DMA_BUF_IOCTL_SYNC can fail with -EAGAIN or -EINTR, in which =
case it must
> >>>     *   be restarted.
> >>> @@ -1264,10 +1264,10 @@ static int __dma_buf_begin_cpu_access(struct =
dma_buf *dmabuf,
> >>>     * preparations. Coherency is only guaranteed in the specified ran=
ge for the
> >>>     * specified access direction.
> >>>     * @dmabuf:      [in]    buffer to prepare cpu access for.
> >>> - * @direction:     [in]    length of range for cpu access.
> >>> + * @direction:     [in]    direction of access.
> >>>     *
> >>>     * After the cpu access is complete the caller should call
> >>> - * dma_buf_end_cpu_access(). Only when cpu access is braketed by bot=
h calls is
> >>> + * dma_buf_end_cpu_access(). Only when cpu access is bracketed by bo=
th calls is
> >>>     * it guaranteed to be coherent with other DMA access.
> >>>     *
> >>>     * This function will also wait for any DMA transactions tracked t=
hrough
> >>> @@ -1307,7 +1307,7 @@ EXPORT_SYMBOL_NS_GPL(dma_buf_begin_cpu_access, =
DMA_BUF);
> >>>     * actions. Coherency is only guaranteed in the specified range fo=
r the
> >>>     * specified access direction.
> >>>     * @dmabuf:      [in]    buffer to complete cpu access for.
> >>> - * @direction:     [in]    length of range for cpu access.
> >>> + * @direction:     [in]    direction of access.
> >>>     *
> >>>     * This terminates CPU access started with dma_buf_begin_cpu_acces=
s().
> >>>     *
> >>> diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
> >>> index 71731796c8c3..1d61a4f6db35 100644
> >>> --- a/include/linux/dma-buf.h
> >>> +++ b/include/linux/dma-buf.h
> >>> @@ -330,7 +330,7 @@ struct dma_buf {
> >>>      * @lock:
> >>>      *
> >>>      * Used internally to serialize list manipulation, attach/detach =
and
> >>> -    * vmap/unmap. Note that in many cases this is superseeded by
> >>> +    * vmap/unmap. Note that in many cases this is superseded by
> >>>      * dma_resv_lock() on @resv.
> >>>      */
> >>>     struct mutex lock;
> >>> @@ -365,7 +365,7 @@ struct dma_buf {
> >>>      */
> >>>     const char *name;
> >>> -   /** @name_lock: Spinlock to protect name acces for read access. *=
/
> >>> +   /** @name_lock: Spinlock to protect name access for read access. =
*/
> >>>     spinlock_t name_lock;
> >>>     /**
> >>> @@ -402,7 +402,7 @@ struct dma_buf {
> >>>      *   anything the userspace API considers write access.
> >>>      *
> >>>      * - Drivers may just always add a write fence, since that only
> >>> -    *   causes unecessarily synchronization, but no correctness issu=
es.
> >>> +    *   causes unnecessary synchronization, but no correctness issue=
s.
> >>>      *
> >>>      * - Some drivers only expose a synchronous userspace API with no
> >>>      *   pipelining across drivers. These do not set any fences for t=
heir
>
