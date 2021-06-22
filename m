Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E4273B0D93
	for <lists+linux-media@lfdr.de>; Tue, 22 Jun 2021 21:21:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232021AbhFVTXk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Jun 2021 15:23:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229786AbhFVTXj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Jun 2021 15:23:39 -0400
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com [IPv6:2607:f8b0:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56A61C061574
        for <linux-media@vger.kernel.org>; Tue, 22 Jun 2021 12:21:22 -0700 (PDT)
Received: by mail-ot1-x32a.google.com with SMTP id 7-20020a9d0d070000b0290439abcef697so22319601oti.2
        for <linux-media@vger.kernel.org>; Tue, 22 Jun 2021 12:21:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=NLND4Ku01kSAPaPQnJOp1FH7Yq9QVSRTNQQ4RbCxk0w=;
        b=e5CaOZBOftVhbkEerPYPtaLJCTi7dkW17rRGwPvuHPJJoz1+U4machk4c/sWYYds9F
         ix+7YOv/rHYeIbZ5mOBktSK7y1oi02liHSKSjMkzWSsFNHipPhBp/d7g5CMC1O/Zq8dO
         aKmYXEe0vLST278s3JBJERKtZVE+IDiO8pDyQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=NLND4Ku01kSAPaPQnJOp1FH7Yq9QVSRTNQQ4RbCxk0w=;
        b=jvMKxQy9JH60SbfT9sITfItWc0U5mYfWe5Gsl3LASeGLLtVB/umqE/sCRCI0QzFjfk
         K9u6iC8DfwSjQcy7zW7Xsj3gF8JpiKrp/73XN9zi39zjKQJPoEpDAWXYdjOs3EvDcnD9
         NWv3j7FrmpGB89Xz+8BSY6V4ubCeleHZlg3nEmYCIjQvrcA7x+QRV/jsSN+umRbgdPPP
         CeOGuYuMcuhnEZ4e5Axr+Mi2lTsTnzULeOXHPRTCmRaKFsopqB1I7E/oo+oUp4I3OcuC
         +w2owNYDcJWzbuyMqoULLpOyr4xhCLUE4jyAXs4cvIva72tzDUjn7dyZ2b7VS80uZu/y
         NGWA==
X-Gm-Message-State: AOAM533CvcdpjZ6FshDEboxBJglDtYt6SVxfbJfre9rkWkQ/3413TM94
        nScjZbOQFprubo5OXxMbeBsh31KOxeScIE/bDZ3foA==
X-Google-Smtp-Source: ABdhPJxEjFo8oIALPvZRWajZYHHD9+zYYML42DA/uD7PRo7j950Ok3AXzR/g8ARzZSUBUYI2JILIZh+XPK5Vw12qP60=
X-Received: by 2002:a9d:12eb:: with SMTP id g98mr4360330otg.303.1624389681754;
 Tue, 22 Jun 2021 12:21:21 -0700 (PDT)
MIME-Version: 1.0
References: <20210622165511.3169559-1-daniel.vetter@ffwll.ch>
 <20210622165511.3169559-3-daniel.vetter@ffwll.ch> <YNIzkSg5kwp9gdCR@ravnborg.org>
In-Reply-To: <YNIzkSg5kwp9gdCR@ravnborg.org>
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
Date:   Tue, 22 Jun 2021 21:21:10 +0200
Message-ID: <CAKMK7uHSade-GobvwXXP2ArNPFr0qOA+2-V1W36MqHYk0wj_+g@mail.gmail.com>
Subject: Re: [PATCH 02/15] dma-buf: Switch to inline kerneldoc
To:     Sam Ravnborg <sam@ravnborg.org>
Cc:     DRI Development <dri-devel@lists.freedesktop.org>,
        Deepak R Varma <mh12gx2825@gmail.com>,
        Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        Kevin Wang <kevin1.wang@amd.com>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>, Nirmoy Das <nirmoy.das@amd.com>,
        Chen Li <chenli@uniontech.com>,
        Dave Airlie <airlied@redhat.com>,
        Alex Deucher <alexander.deucher@amd.com>,
        Daniel Vetter <daniel.vetter@intel.com>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Jun 22, 2021 at 9:01 PM Sam Ravnborg <sam@ravnborg.org> wrote:
>
> Hi Daniel.
>
> On Tue, Jun 22, 2021 at 06:54:58PM +0200, Daniel Vetter wrote:
> > Also review & update everything while we're at it.
> >
> > This is prep work to smash a ton of stuff into the kerneldoc for
> > @resv.
> >
> > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > Cc: Sumit Semwal <sumit.semwal@linaro.org>
> > Cc: "Christian K=C3=B6nig" <christian.koenig@amd.com>
> > Cc: Alex Deucher <alexander.deucher@amd.com>
> > Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> > Cc: Dave Airlie <airlied@redhat.com>
> > Cc: Nirmoy Das <nirmoy.das@amd.com>
> > Cc: Deepak R Varma <mh12gx2825@gmail.com>
> > Cc: Chen Li <chenli@uniontech.com>
> > Cc: Kevin Wang <kevin1.wang@amd.com>
> > Cc: linux-media@vger.kernel.org
> > Cc: linaro-mm-sig@lists.linaro.org
> > ---
> >  include/linux/dma-buf.h | 107 +++++++++++++++++++++++++++++++---------
> >  1 file changed, 83 insertions(+), 24 deletions(-)
> >
> > diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
> > index 92eec38a03aa..6d18b9e448b9 100644
> > --- a/include/linux/dma-buf.h
> > +++ b/include/linux/dma-buf.h
> > @@ -289,28 +289,6 @@ struct dma_buf_ops {
> >
> >  /**
> >   * struct dma_buf - shared buffer object
> > - * @size: size of the buffer; invariant over the lifetime of the buffe=
r.
> > - * @file: file pointer used for sharing buffers across, and for refcou=
nting.
> > - * @attachments: list of dma_buf_attachment that denotes all devices a=
ttached,
> > - *               protected by dma_resv lock.
> > - * @ops: dma_buf_ops associated with this buffer object.
> > - * @lock: used internally to serialize list manipulation, attach/detac=
h and
> > - *        vmap/unmap
> > - * @vmapping_counter: used internally to refcnt the vmaps
> > - * @vmap_ptr: the current vmap ptr if vmapping_counter > 0
> > - * @exp_name: name of the exporter; useful for debugging.
> > - * @name: userspace-provided name; useful for accounting and debugging=
,
> > - *        protected by @resv.
> > - * @name_lock: spinlock to protect name access
> > - * @owner: pointer to exporter module; used for refcounting when expor=
ter is a
> > - *         kernel module.
> > - * @list_node: node for dma_buf accounting and debugging.
> > - * @priv: exporter specific private data for this buffer object.
> > - * @resv: reservation object linked to this dma-buf
> > - * @poll: for userspace poll support
> > - * @cb_excl: for userspace poll support
> > - * @cb_shared: for userspace poll support
> > - * @sysfs_entry: for exposing information about this buffer in sysfs.
>
> This sentence
> >   * The attachment_uid member of @sysfs_entry is protected by dma_resv =
lock
> >   * and is incremented on each attach.
> belongs to the paragraph describing sysfs_entry and should be moved too.
> Or maybe reworded and then document all fields in dma_buf_sysfs_entry?

Unfortunately kerneldoc lost the ability to document embedded
structs/unions. At least last time I checked, it's a bit a bikeshed.
So I'd need to pull the entire struct out. I'll just move it since
it's indeed misplaced.

> With this fixed:
> Acked-by: Sam Ravnborg <sam@ravnborg.org>

Thanks for taking a look.
-Daniel
--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
