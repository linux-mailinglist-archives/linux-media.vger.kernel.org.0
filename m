Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A28B4B3613
	for <lists+linux-media@lfdr.de>; Mon, 16 Sep 2019 10:00:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730742AbfIPIAb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Sep 2019 04:00:31 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:41781 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727705AbfIPIAb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Sep 2019 04:00:31 -0400
Received: by mail-ot1-f67.google.com with SMTP id g13so4824826otp.8;
        Mon, 16 Sep 2019 01:00:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4SEWfM7O8UbpERn/SUSxqqqr9oK+Dc78EcCy5Rgalfo=;
        b=hQbtcSCwzANFp2mbS9qcOW/t4MH/dwN+7w700yohTH3Y3byTCE0FcFuyacizqKGAYT
         j3/qMeiZIqcH3PVRfQDwlFCSY1KFioNEwby7aPV0mDWy/9kdKqr3gaID/KpMDe6CgZNs
         rda8w+RA65pW6TVawUUBXWhlC6mrCmh7ES920W9sPZ1Jfvr9wCNBFBNBgIPVO2QXXCc1
         Q1MThPUK8A9cb++I4CSTWcTTKaIfUkeYsgnSdPMv+pKqqPnX4Ow9RU1yO6+4rXIyOrnb
         ufZjLLeQJjnRPTjchxfFJw9sb1QftfS/TropitOxBKBym50dKsV4VHOKcMBxb3Lmem2b
         vcNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4SEWfM7O8UbpERn/SUSxqqqr9oK+Dc78EcCy5Rgalfo=;
        b=IAekic/op0k+9+i8orgRx4RCUW24cHFRaXobcTE3wrNkQVKNnUgInzsoQHmuZzpQXF
         xtonODjJRoYayPObv0yftC7rkptpNL7gmbvSt0rMws2TxFJJ8hpDc1+aAhgRxsPT4jhN
         tjAl3E9ESnSSO+NDeVbg75N8UkeJ982ch3VXlIIyUYUGmiyPWzd12DU7tyVRrL2VxKFx
         kVVox5g60MSmmF0ZQ6/h11P09klHeHvW9mNBPnDdWMzG3UkzTLb5cCUKufwSjH3D944J
         h3ycI+Q6O225Is1jL+tuHIXvEc5/8XLlEGh4vSkzygr6eKkqvj7J9rLoBv0FvKx37q00
         Q7pQ==
X-Gm-Message-State: APjAAAVG6wOw/PztcNTg5/cdKyYRrVqo3EM9kdSXUNrnc/7BQRXFkXTY
        T5RL+bubLcxkVqhp94k6wIWTnNuxoc9kJUiBGkU=
X-Google-Smtp-Source: APXvYqwVaJiYiPYcneK9AbhXCJczf/z1pcVeDuq9ViSds/oCsL6kfy7yt6MuPORkJTl9wK2S/n/2j0lf9qZ0oQiBxHg=
X-Received: by 2002:a9d:61d3:: with SMTP id h19mr50461808otk.325.1568620829938;
 Mon, 16 Sep 2019 01:00:29 -0700 (PDT)
MIME-Version: 1.0
References: <20190909162743.30114-1-bparrot@ti.com> <20190909162743.30114-6-bparrot@ti.com>
In-Reply-To: <20190909162743.30114-6-bparrot@ti.com>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Mon, 16 Sep 2019 09:00:03 +0100
Message-ID: <CA+V-a8ub2rjkp0WyUDV8EKnvqR=jCbCdxGzeeNas2APyiJdsYg@mail.gmail.com>
Subject: Re: [Patch 05/13] media: am437x-vpfe: Streamlined vb2 buffer cleanup
To:     Benoit Parrot <bparrot@ti.com>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        linux-media <linux-media@vger.kernel.org>,
        devicetree@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Benoit,

Thank you for the patch.

On Mon, Sep 9, 2019 at 5:26 PM Benoit Parrot <bparrot@ti.com> wrote:
>
> Returning queued vb2 buffers back to user space is a common
> task best handled by a helper function.
>
> Signed-off-by: Benoit Parrot <bparrot@ti.com>
> ---
>  drivers/media/platform/am437x/am437x-vpfe.c | 54 ++++++++++-----------
>  1 file changed, 26 insertions(+), 28 deletions(-)
>
> diff --git a/drivers/media/platform/am437x/am437x-vpfe.c b/drivers/media/platform/am437x/am437x-vpfe.c
> index 3a8ad9bdf283..52f7fc6e11dd 100644
> --- a/drivers/media/platform/am437x/am437x-vpfe.c
> +++ b/drivers/media/platform/am437x/am437x-vpfe.c
> @@ -1949,6 +1949,29 @@ static void vpfe_buffer_queue(struct vb2_buffer *vb)
>         spin_unlock_irqrestore(&vpfe->dma_queue_lock, flags);
>  }
>
> +static void vpfe_return_all_buffers(struct vpfe_device *vpfe,
> +                                   enum vb2_buffer_state state)
> +{
> +       struct vpfe_cap_buffer *buf, *node;
> +       unsigned long flags;
> +
> +       spin_lock_irqsave(&vpfe->dma_queue_lock, flags);
> +       list_for_each_entry_safe(buf, node, &vpfe->dma_queue, list) {
> +               vb2_buffer_done(&buf->vb.vb2_buf, state);
> +               list_del(&buf->list);
> +       }
> +
> +       if (vpfe->cur_frm)
> +               vb2_buffer_done(&vpfe->cur_frm->vb.vb2_buf, state);
> +
> +       if (vpfe->next_frm && vpfe->next_frm != vpfe->cur_frm)
> +               vb2_buffer_done(&vpfe->next_frm->vb.vb2_buf, state);
> +
> +       vpfe->cur_frm = NULL;
> +       vpfe->next_frm = NULL;
> +       spin_unlock_irqrestore(&vpfe->dma_queue_lock, flags);
> +}
> +
>  /*
>   * vpfe_start_streaming : Starts the DMA engine for streaming
>   * @vb: ptr to vb2_buffer
> @@ -1957,7 +1980,6 @@ static void vpfe_buffer_queue(struct vb2_buffer *vb)
>  static int vpfe_start_streaming(struct vb2_queue *vq, unsigned int count)
>  {
>         struct vpfe_device *vpfe = vb2_get_drv_priv(vq);
> -       struct vpfe_cap_buffer *buf, *tmp;
>         struct vpfe_subdev_info *sdinfo;
>         unsigned long flags;
>         unsigned long addr;
> @@ -2003,11 +2025,8 @@ static int vpfe_start_streaming(struct vb2_queue *vq, unsigned int count)
>         return 0;
>
>  err:
> -       list_for_each_entry_safe(buf, tmp, &vpfe->dma_queue, list) {
> -               list_del(&buf->list);
> -               vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_QUEUED);
> -       }
> -
> +       vpfe_return_all_buffers(vpfe, VB2_BUF_STATE_QUEUED);
> +       vpfe_pcr_enable(&vpfe->ccdc, 0);

please create a seperate patch for the above change.

Cheers,
--Prabhakar Lad

>         return ret;
>  }
>
> @@ -2022,7 +2041,6 @@ static void vpfe_stop_streaming(struct vb2_queue *vq)
>  {
>         struct vpfe_device *vpfe = vb2_get_drv_priv(vq);
>         struct vpfe_subdev_info *sdinfo;
> -       unsigned long flags;
>         int ret;
>
>         vpfe_pcr_enable(&vpfe->ccdc, 0);
> @@ -2040,27 +2058,7 @@ static void vpfe_stop_streaming(struct vb2_queue *vq)
>                 vpfe_dbg(1, vpfe, "stream off failed in subdev\n");
>
>         /* release all active buffers */
> -       spin_lock_irqsave(&vpfe->dma_queue_lock, flags);
> -       if (vpfe->cur_frm == vpfe->next_frm) {
> -               vb2_buffer_done(&vpfe->cur_frm->vb.vb2_buf,
> -                               VB2_BUF_STATE_ERROR);
> -       } else {
> -               if (vpfe->cur_frm != NULL)
> -                       vb2_buffer_done(&vpfe->cur_frm->vb.vb2_buf,
> -                                       VB2_BUF_STATE_ERROR);
> -               if (vpfe->next_frm != NULL)
> -                       vb2_buffer_done(&vpfe->next_frm->vb.vb2_buf,
> -                                       VB2_BUF_STATE_ERROR);
> -       }
> -
> -       while (!list_empty(&vpfe->dma_queue)) {
> -               vpfe->next_frm = list_entry(vpfe->dma_queue.next,
> -                                               struct vpfe_cap_buffer, list);
> -               list_del(&vpfe->next_frm->list);
> -               vb2_buffer_done(&vpfe->next_frm->vb.vb2_buf,
> -                               VB2_BUF_STATE_ERROR);
> -       }
> -       spin_unlock_irqrestore(&vpfe->dma_queue_lock, flags);
> +       vpfe_return_all_buffers(vpfe, VB2_BUF_STATE_ERROR);
>  }
>
>  static int vpfe_g_pixelaspect(struct file *file, void *priv,
> --
> 2.17.1
>
