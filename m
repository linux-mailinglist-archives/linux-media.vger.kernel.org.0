Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2C0E7B3CE3
	for <lists+linux-media@lfdr.de>; Mon, 16 Sep 2019 16:52:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730758AbfIPOvx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Sep 2019 10:51:53 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:40060 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726690AbfIPOvx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Sep 2019 10:51:53 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8GEppEZ048227;
        Mon, 16 Sep 2019 09:51:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1568645511;
        bh=N2fNUTJ5FqCAIRceZLmcocaOVqYYlTS4Sz3JSM1s1To=;
        h=Date:From:To:CC:Subject:References:In-Reply-To;
        b=qSrkDPzFGX2ZFyVswTk+k9SZ/PSDqAl54dAgfESJvwvmlkgBH/2wbURA42Z9NUHDX
         pH5RdyNEf6MVprFGcL9tLGMdirKakBpDWhPtQPqso16J+5pQAZmGBpHYq6Sl1e3PLm
         g5OTDCnQtwUXUU5QzRwdABJaqV6u+Ru0b4nUYAOs=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8GEppft012452
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 16 Sep 2019 09:51:51 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 16
 Sep 2019 09:51:50 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 16 Sep 2019 09:51:48 -0500
Received: from ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with SMTP id x8GEpoBQ048306;
        Mon, 16 Sep 2019 09:51:50 -0500
Date:   Mon, 16 Sep 2019 09:53:56 -0500
From:   Benoit Parrot <bparrot@ti.com>
To:     "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
CC:     Hans Verkuil <hverkuil@xs4all.nl>,
        linux-media <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [Patch 05/13] media: am437x-vpfe: Streamlined vb2 buffer cleanup
Message-ID: <20190916145356.wddnnl3kk2awmbf4@ti.com>
References: <20190909162743.30114-1-bparrot@ti.com>
 <20190909162743.30114-6-bparrot@ti.com>
 <CA+V-a8ub2rjkp0WyUDV8EKnvqR=jCbCdxGzeeNas2APyiJdsYg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CA+V-a8ub2rjkp0WyUDV8EKnvqR=jCbCdxGzeeNas2APyiJdsYg@mail.gmail.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Lad, Prabhakar <prabhakar.csengg@gmail.com> wrote on Mon [2019-Sep-16 09:00:03 +0100]:
> Hi Benoit,
> 
> Thank you for the patch.
> 
> On Mon, Sep 9, 2019 at 5:26 PM Benoit Parrot <bparrot@ti.com> wrote:
> >
> > Returning queued vb2 buffers back to user space is a common
> > task best handled by a helper function.
> >
> > Signed-off-by: Benoit Parrot <bparrot@ti.com>
> > ---
> >  drivers/media/platform/am437x/am437x-vpfe.c | 54 ++++++++++-----------
> >  1 file changed, 26 insertions(+), 28 deletions(-)
> >
> > diff --git a/drivers/media/platform/am437x/am437x-vpfe.c b/drivers/media/platform/am437x/am437x-vpfe.c
> > index 3a8ad9bdf283..52f7fc6e11dd 100644
> > --- a/drivers/media/platform/am437x/am437x-vpfe.c
> > +++ b/drivers/media/platform/am437x/am437x-vpfe.c
> > @@ -1949,6 +1949,29 @@ static void vpfe_buffer_queue(struct vb2_buffer *vb)
> >         spin_unlock_irqrestore(&vpfe->dma_queue_lock, flags);
> >  }
> >
> > +static void vpfe_return_all_buffers(struct vpfe_device *vpfe,
> > +                                   enum vb2_buffer_state state)
> > +{
> > +       struct vpfe_cap_buffer *buf, *node;
> > +       unsigned long flags;
> > +
> > +       spin_lock_irqsave(&vpfe->dma_queue_lock, flags);
> > +       list_for_each_entry_safe(buf, node, &vpfe->dma_queue, list) {
> > +               vb2_buffer_done(&buf->vb.vb2_buf, state);
> > +               list_del(&buf->list);
> > +       }
> > +
> > +       if (vpfe->cur_frm)
> > +               vb2_buffer_done(&vpfe->cur_frm->vb.vb2_buf, state);
> > +
> > +       if (vpfe->next_frm && vpfe->next_frm != vpfe->cur_frm)
> > +               vb2_buffer_done(&vpfe->next_frm->vb.vb2_buf, state);
> > +
> > +       vpfe->cur_frm = NULL;
> > +       vpfe->next_frm = NULL;
> > +       spin_unlock_irqrestore(&vpfe->dma_queue_lock, flags);
> > +}
> > +
> >  /*
> >   * vpfe_start_streaming : Starts the DMA engine for streaming
> >   * @vb: ptr to vb2_buffer
> > @@ -1957,7 +1980,6 @@ static void vpfe_buffer_queue(struct vb2_buffer *vb)
> >  static int vpfe_start_streaming(struct vb2_queue *vq, unsigned int count)
> >  {
> >         struct vpfe_device *vpfe = vb2_get_drv_priv(vq);
> > -       struct vpfe_cap_buffer *buf, *tmp;
> >         struct vpfe_subdev_info *sdinfo;
> >         unsigned long flags;
> >         unsigned long addr;
> > @@ -2003,11 +2025,8 @@ static int vpfe_start_streaming(struct vb2_queue *vq, unsigned int count)
> >         return 0;
> >
> >  err:
> > -       list_for_each_entry_safe(buf, tmp, &vpfe->dma_queue, list) {
> > -               list_del(&buf->list);
> > -               vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_QUEUED);
> > -       }
> > -
> > +       vpfe_return_all_buffers(vpfe, VB2_BUF_STATE_QUEUED);
> > +       vpfe_pcr_enable(&vpfe->ccdc, 0);
> 
> please create a seperate patch for the above change.

You mean a separate patch just for the vpfe_pcr_enable() call?

Benoit

> 
> Cheers,
> --Prabhakar Lad
> 
> >         return ret;
> >  }
> >
> > @@ -2022,7 +2041,6 @@ static void vpfe_stop_streaming(struct vb2_queue *vq)
> >  {
> >         struct vpfe_device *vpfe = vb2_get_drv_priv(vq);
> >         struct vpfe_subdev_info *sdinfo;
> > -       unsigned long flags;
> >         int ret;
> >
> >         vpfe_pcr_enable(&vpfe->ccdc, 0);
> > @@ -2040,27 +2058,7 @@ static void vpfe_stop_streaming(struct vb2_queue *vq)
> >                 vpfe_dbg(1, vpfe, "stream off failed in subdev\n");
> >
> >         /* release all active buffers */
> > -       spin_lock_irqsave(&vpfe->dma_queue_lock, flags);
> > -       if (vpfe->cur_frm == vpfe->next_frm) {
> > -               vb2_buffer_done(&vpfe->cur_frm->vb.vb2_buf,
> > -                               VB2_BUF_STATE_ERROR);
> > -       } else {
> > -               if (vpfe->cur_frm != NULL)
> > -                       vb2_buffer_done(&vpfe->cur_frm->vb.vb2_buf,
> > -                                       VB2_BUF_STATE_ERROR);
> > -               if (vpfe->next_frm != NULL)
> > -                       vb2_buffer_done(&vpfe->next_frm->vb.vb2_buf,
> > -                                       VB2_BUF_STATE_ERROR);
> > -       }
> > -
> > -       while (!list_empty(&vpfe->dma_queue)) {
> > -               vpfe->next_frm = list_entry(vpfe->dma_queue.next,
> > -                                               struct vpfe_cap_buffer, list);
> > -               list_del(&vpfe->next_frm->list);
> > -               vb2_buffer_done(&vpfe->next_frm->vb.vb2_buf,
> > -                               VB2_BUF_STATE_ERROR);
> > -       }
> > -       spin_unlock_irqrestore(&vpfe->dma_queue_lock, flags);
> > +       vpfe_return_all_buffers(vpfe, VB2_BUF_STATE_ERROR);
> >  }
> >
> >  static int vpfe_g_pixelaspect(struct file *file, void *priv,
> > --
> > 2.17.1
> >
