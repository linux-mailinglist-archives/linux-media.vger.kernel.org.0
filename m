Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3D408450053
	for <lists+linux-media@lfdr.de>; Mon, 15 Nov 2021 09:54:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229864AbhKOI5a (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 15 Nov 2021 03:57:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230007AbhKOI5Z (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 15 Nov 2021 03:57:25 -0500
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com [IPv6:2607:f8b0:4864:20::72d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4E60C061746
        for <linux-media@vger.kernel.org>; Mon, 15 Nov 2021 00:54:28 -0800 (PST)
Received: by mail-qk1-x72d.google.com with SMTP id de30so15994530qkb.0
        for <linux-media@vger.kernel.org>; Mon, 15 Nov 2021 00:54:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=O8v1HYmp53Pf23FMJDjlVTNW0npXn9r8mJ7FcbIc5E0=;
        b=MqpF0gbmJACjslApRNAym0kk361y2naqaGiB4kfpdTdP+41bMqpSujQxu0MF61WM66
         bdewI9X50H9kFBsmFoCc92rpeRCu2Nl705ffZN7SvHdylhAOBEAquRDb/GMUciNxx+Pk
         ioCA162cuFgqvcCspw/V/akBBcknhIteqapKs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=O8v1HYmp53Pf23FMJDjlVTNW0npXn9r8mJ7FcbIc5E0=;
        b=tr/vqfrlst6IO8/Zg3wJiT0zPBcQYg26c/yOFAr4vhPl9euvQ3NIr7WhsBQ5lCu3Y2
         ceCQpvjbl4r1/EfaZkgGNMgDn0xLSM0MS31jlvO7X8VGTDyyLpnplS0lKSfkrGclnUaq
         I2wJ4kQ8QJfhX6HVNS0JLLsTtaY7DyyRGoj9jP2GCxrYP+1lae/v58TUd6UJ2U4kmJq+
         /idHBixIP5NDr66r9TU60cmKjPOSbMMyzlHP0g8fPZlECDny3I74RA0NfTEyfU3HfLRF
         QdtH+js51mJ1hCGqqt2e9+AESzjPzuBDvNoIVuzDcRmt7Oj4ncMeTzqGRrJhWkPeFIDi
         Hi4g==
X-Gm-Message-State: AOAM530Pq1QMArijlqcejn1Yh2SV4Bs++6OQl+tE7NSRj5Ad1DCDAqSu
        XGYCIdyzwbq9m+flC9W1HOxI9Oqh3dUUMBLr
X-Google-Smtp-Source: ABdhPJwHT1ckHtcUOR3Ld37ahyVKn62D7Orji4/e7epZX37ZVuvPy0kDn4sqAYOTdEKti8QWFpDwfQ==
X-Received: by 2002:a05:620a:f0d:: with SMTP id v13mr28988949qkl.4.1636966467641;
        Mon, 15 Nov 2021 00:54:27 -0800 (PST)
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com. [209.85.219.171])
        by smtp.gmail.com with ESMTPSA id o17sm6652244qkp.89.2021.11.15.00.54.25
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Nov 2021 00:54:26 -0800 (PST)
Received: by mail-yb1-f171.google.com with SMTP id e136so44851567ybc.4
        for <linux-media@vger.kernel.org>; Mon, 15 Nov 2021 00:54:25 -0800 (PST)
X-Received: by 2002:a25:a0c8:: with SMTP id i8mr38458123ybm.322.1636966465333;
 Mon, 15 Nov 2021 00:54:25 -0800 (PST)
MIME-Version: 1.0
References: <20211101145355.533704-1-hdegoede@redhat.com> <28823616-9622-29d4-75d6-cfef0d4f7323@redhat.com>
In-Reply-To: <28823616-9622-29d4-75d6-cfef0d4f7323@redhat.com>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Mon, 15 Nov 2021 17:54:14 +0900
X-Gmail-Original-Message-ID: <CAAFQd5Ax6LUKMWMuvutCo7ng995rF5YBDw+WBRRDJE7dY-c0Cg@mail.gmail.com>
Message-ID: <CAAFQd5Ax6LUKMWMuvutCo7ng995rF5YBDw+WBRRDJE7dY-c0Cg@mail.gmail.com>
Subject: Re: [PATCH media-staging regression fix] media: videobuf2-dma-sg: Fix
 buf->vb NULL pointer dereference
To:     Hans de Goede <hdegoede@redhat.com>,
        Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        linux-media@vger.kernel.org,
        Sergey Senozhatsky <senozhatsky@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On Sat, Nov 6, 2021 at 9:39 PM Hans de Goede <hdegoede@redhat.com> wrote:
>
> Hi,
>
> On 11/1/21 15:53, Hans de Goede wrote:
> > Commit a4b83deb3e76 ("media: videobuf2: rework vb2_mem_ops API")
> > added a new vb member to struct vb2_dma_sg_buf, but it only added
> > code setting this to the vb2_dma_sg_alloc() function and not to the
> > vb2_dma_sg_get_userptr() and vb2_dma_sg_attach_dmabuf() which also
> > create vb2_dma_sg_buf objects.
> >
> > This is causing a crash due to a NULL pointer deref when using
> > libcamera on devices with an Intel IPU3 (qcam app).
> >
> > Fix these crashes by assigning buf->vb in the other 2 functions too,
> > note libcamera tests the vb2_dma_sg_get_userptr() path, the change
> > to the vb2_dma_sg_attach_dmabuf() path is untested.
> >
> > Fixes: a4b83deb3e76 ("media: videobuf2: rework vb2_mem_ops API")
> > Cc: Sergey Senozhatsky <senozhatsky@chromium.org>
> > Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>
> Ping ? This is still an issue in the current media-staging tree.

Uh, sorry, I thought this was already fixed by [1], but that was only
for the dma-contig allocator. Thanks for the patch.

Acked-by: Tomasz Figa <tfiga@chromium.org>

[1] https://patchwork.kernel.org/project/linux-media/patch/20210928034634.333785-1-senozhatsky@chromium.org/

Hans (V.), would you pick this fix, please?

Best regards,
Tomasz

>
> Regards,
>
> Hans
>
>
> > ---
> >  drivers/media/common/videobuf2/videobuf2-dma-sg.c | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/drivers/media/common/videobuf2/videobuf2-dma-sg.c b/drivers/media/common/videobuf2/videobuf2-dma-sg.c
> > index 33ee63a99139..0452ed9fac95 100644
> > --- a/drivers/media/common/videobuf2/videobuf2-dma-sg.c
> > +++ b/drivers/media/common/videobuf2/videobuf2-dma-sg.c
> > @@ -241,6 +241,7 @@ static void *vb2_dma_sg_get_userptr(struct vb2_buffer *vb, struct device *dev,
> >       buf->offset = vaddr & ~PAGE_MASK;
> >       buf->size = size;
> >       buf->dma_sgt = &buf->sg_table;
> > +     buf->vb = vb;
> >       vec = vb2_create_framevec(vaddr, size);
> >       if (IS_ERR(vec))
> >               goto userptr_fail_pfnvec;
> > @@ -642,6 +643,7 @@ static void *vb2_dma_sg_attach_dmabuf(struct vb2_buffer *vb, struct device *dev,
> >       buf->dma_dir = vb->vb2_queue->dma_dir;
> >       buf->size = size;
> >       buf->db_attach = dba;
> > +     buf->vb = vb;
> >
> >       return buf;
> >  }
> >
>
