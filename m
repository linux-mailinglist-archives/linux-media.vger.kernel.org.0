Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 44F4B26DC15
	for <lists+linux-media@lfdr.de>; Thu, 17 Sep 2020 14:53:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726945AbgIQMxc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Sep 2020 08:53:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727107AbgIQMw7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Sep 2020 08:52:59 -0400
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC586C061756
        for <linux-media@vger.kernel.org>; Thu, 17 Sep 2020 05:52:54 -0700 (PDT)
Received: by mail-ej1-x644.google.com with SMTP id i22so3126849eja.5
        for <linux-media@vger.kernel.org>; Thu, 17 Sep 2020 05:52:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=BdxYdx9XHrwCdr4dzP1oTYv5YWLs/o7KoSb8tPS/nSw=;
        b=ccM+MAvgoCEG4vttx6xCSHufmhS0PZEIedC4PRllc90ud3FF8xpocJ7v7zm20tcZYk
         Y48aDJAb/rrKj3Xk9P9KO5CaLGn7plZ1ehW8ylgxUpcRcso5dQy13FdSnUuMHNijRgVu
         AVICzFSg+9EIXT1tbDVLJQ1WvvZSzYcw1XHl0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=BdxYdx9XHrwCdr4dzP1oTYv5YWLs/o7KoSb8tPS/nSw=;
        b=hA48vL9RMzFeHywFNfYnLnE7WLB64lczfS2KxL1CBcxNuQryZ+2kKFk75b+m1W7HWk
         l2OBZ+tMvTs+kzoAxsiUFQ3RsEu+jmIrlFq3nE4RqKdv6yZgbMz0fs8JMlwbZrYcFS9i
         O08F3Z4zUQZR9pJIoS4m67f7fViqB+XbamybH9pBlTow+Wm2GFJXMawWApRnEDGIQXiu
         vK/RzvaBOk4iP/IZO8tJplHxEwRThq+5FWqyprXSfW6s4UvVOmzjX0hRRz8/eP2DlFXP
         f1Wc2M44Q5c7yu3wwlzyCTw9SqfBNnVRorR0XRL4TxrC8IoFvVShVAZ+ukSWHLesXbI3
         EIwA==
X-Gm-Message-State: AOAM531N3G0TPMVzt6SqYaasKFUa9so55TqDRokYGuYxTT7w3a/VLc23
        3Kl0/Ld7UlNy9fDRRs/9pzsdXlvMg6KyYA==
X-Google-Smtp-Source: ABdhPJzLIYJ+Q9vOYDxX6luEiTOcmPiOKY7CB16F1qhEp4GLc/JolYO0i9YX6Ow8jk+ri7W7fpJHRA==
X-Received: by 2002:a17:906:bc52:: with SMTP id s18mr28968999ejv.398.1600347172889;
        Thu, 17 Sep 2020 05:52:52 -0700 (PDT)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com. [209.85.128.53])
        by smtp.gmail.com with ESMTPSA id a5sm17169789edb.9.2020.09.17.05.52.51
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Sep 2020 05:52:51 -0700 (PDT)
Received: by mail-wm1-f53.google.com with SMTP id z9so1942283wmk.1
        for <linux-media@vger.kernel.org>; Thu, 17 Sep 2020 05:52:51 -0700 (PDT)
X-Received: by 2002:a05:600c:20f:: with SMTP id 15mr9361892wmi.99.1600347171113;
 Thu, 17 Sep 2020 05:52:51 -0700 (PDT)
MIME-Version: 1.0
References: <20200502194052.485-1-andriy.gelman@gmail.com> <21733d1ad3c2f79a5646b4f1c541dfabda0978be.camel@ndufresne.ca>
In-Reply-To: <21733d1ad3c2f79a5646b4f1c541dfabda0978be.camel@ndufresne.ca>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Thu, 17 Sep 2020 14:52:33 +0200
X-Gmail-Original-Message-ID: <CAAFQd5B+5Zb7pzyQga+-KjfzUCYpuC1oPRjMXsTKHJzJAcmgdw@mail.gmail.com>
Message-ID: <CAAFQd5B+5Zb7pzyQga+-KjfzUCYpuC1oPRjMXsTKHJzJAcmgdw@mail.gmail.com>
Subject: Re: [PATCH] media: s5p-mfc: set V4L2_BUF_FLAG_LAST flag on final buffer
To:     Nicolas Dufresne <nicolas@ndufresne.ca>
Cc:     Andriy Gelman <andriy.gelman@gmail.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Kamil Debski <kamil@wypas.org>,
        Jeongtae Park <jtp.park@samsung.com>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg
        Roedel <joro@8bytes.org>," <linux-arm-kernel@lists.infradead.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Jun 2, 2020 at 5:09 PM Nicolas Dufresne <nicolas@ndufresne.ca> wrot=
e:
>
> Hi Andriy,
>
> thanks for you patch.
>
> Le samedi 02 mai 2020 =C3=A0 15:40 -0400, Andriy Gelman a =C3=A9crit :
> > From: Andriy Gelman <andriy.gelman@gmail.com>
> >
> > As per V4L2 api, the final buffer should set V4L2_BUF_FLAG_LAST flag.
> >
> > Signed-off-by: Andriy Gelman <andriy.gelman@gmail.com>
> > ---
> >  drivers/media/platform/s5p-mfc/s5p_mfc.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/media/platform/s5p-mfc/s5p_mfc.c b/drivers/media/p=
latform/s5p-mfc/s5p_mfc.c
> > index 5c2a23b953a4..b3d9b3a523fe 100644
> > --- a/drivers/media/platform/s5p-mfc/s5p_mfc.c
> > +++ b/drivers/media/platform/s5p-mfc/s5p_mfc.c
> > @@ -614,6 +614,7 @@ static void s5p_mfc_handle_stream_complete(struct s=
5p_mfc_ctx *ctx)
> >               list_del(&mb_entry->list);
> >               ctx->dst_queue_cnt--;
> >               vb2_set_plane_payload(&mb_entry->b->vb2_buf, 0, 0);
> > +             mb_entry->b->flags |=3D V4L2_BUF_FLAG_LAST;
> >               vb2_buffer_done(&mb_entry->b->vb2_buf, VB2_BUF_STATE_DONE=
);
>
> The empty buffer is only there for backward compatibility. As the spec
> says, userspace should completely ignore this buffer. I bet it will
> still have the effect to set last_buffer_dequeued =3D true in vb2,
> unblocking poll() operations and allowing for the queue to unblock and
> return EPIPE on further DQBUF.
>
> Perhaps you should make sure the if both the src and dst queues are
> empty/done by the time cmd_stop is called it will still work. Other
> drivers seems to handle this, but this one does not seems to have a
> special case for that, which may hang userspace in a different way.
>
> What you should do to verify this patch is correct, and that your
> userpace does not rely on legacy path is that it should always be able
> to detect the end of the drain with a EPIPE on DQBUF. LAST_BUF is just
> an early signalling, but may not occur if there was nothing left to
> produce (except for MFC which maybe be crafting a buffer in all cases,
> but that's going a roundtrip through the HW, which is not clear will
> work if the dst queue was empty).

The spec guarantees that a buffer with the LAST_BUF flag is returned
to the userspace. In fact, handling entirely by the DQBUF return code
may be buggy, because the LAST_BUF flag may also be set for other
reasons, like a resolution change happening after a drain request was
already initiated. The proper way to handle a drain is to look for the
LAST_BUF flag and then try to dequeue an event to check what the
LAST_BUF flag is associated with. It might be worth adding a relevant
note to the drain sequence documentation in the spec.

As for the patch itself, I think it's valid, but it's a bit concerning
that the code is inside a conditional block executed only when there
is a buffer in the CAPTURE queue [1]. As I mentioned above, the driver
needs to signal the LAST_BUF flag, so if there is no buffer to signal
it on, it should be signaled when a buffer is queued. Of course it's
well possible that the condition can never happen, e.g. the function
is called only as a result of a hardware request that can be scheduled
only when there is at least 1 CAPTURE buffer in the queue. Looking at
[2], it might be the case indeed, but someone should validate that.

[1] https://elixir.bootlin.com/linux/v5.9-rc5/source/drivers/media/platform=
/s5p-mfc/s5p_mfc.c#L611
[2] https://elixir.bootlin.com/linux/v5.9-rc5/source/drivers/media/platform=
/s5p-mfc/s5p_mfc_dec.c#L222

Best regards,
Tomasz

>
> As shared on IRC, you have sent these patch to FFMPEG:
>
> https://patchwork.ffmpeg.org/project/ffmpeg/patch/20200429212942.28797-2-=
andriy.gelman@gmail.com/
>
> This should have been clarified as supporting legacy drivers / older
> kernel with Samsung driver. Seems like a fair patch. And you added:
>
> https://patchwork.ffmpeg.org/project/ffmpeg/patch/20200429212942.28797-1-=
andriy.gelman@gmail.com/
>
> This one should maybe add the clarification that this is an
> optimization to skip an extra poll/dqbuf dance, but that end of
> draining will ultimately be catched by EPIPE on dqbuf for the described
> cases. Remains valid enhancement to ffmpeg imho.
>
> >       }
> >
>
