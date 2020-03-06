Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 078D517B70C
	for <lists+linux-media@lfdr.de>; Fri,  6 Mar 2020 07:53:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725901AbgCFGxD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 6 Mar 2020 01:53:03 -0500
Received: from mail-io1-f66.google.com ([209.85.166.66]:42387 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725855AbgCFGxC (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 6 Mar 2020 01:53:02 -0500
Received: by mail-io1-f66.google.com with SMTP id q128so1063074iof.9
        for <linux-media@vger.kernel.org>; Thu, 05 Mar 2020 22:53:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/mARJYGslAJ8V9v0TPSw6dreIR1LiKX4t1V7F/dU3ew=;
        b=YRWfWW+PdyHfSJi8ExaraGhfeX3ywJEpqzVaR0lechfwGLoxZMXLGK1taQExIrWiG8
         f7PX1JZaQ5oqFVc9EK+KAIuiZw4ej3DT0TAQsbrspHVY7K30dxLJtrHvU0R08CgCdRZM
         5fVxO4+8GdjL2jH1+edlQ+EuSO9YD5E36+OZM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/mARJYGslAJ8V9v0TPSw6dreIR1LiKX4t1V7F/dU3ew=;
        b=j6Qj7UWHbGMucDAIxGuwDAgiu5bBWLnpfC8vH2MixA7A2eJnn6fd1vXMKzxJYcTdyS
         z1pFzIkhRNGVQIrtZT5YpJRE8hnafwtlo+hF+qS5P4x6M+ledFqE6GeSBim4FkGNON1L
         f1zHr5rODwIIjf+oti1HkwriKnQOdDfFw+0YTf4LofzYf1KHRfP4Xf8pO7AGOwICwhVz
         5nPz2SQALWlO6sBLlhT6YxCNhFR6RWwYbs8kyonJfPNMRKl/AakeFO7a/u7WnuPk0WsC
         GUWmjU/W8ZWMkkUZMG9clX4q/87wViZUq7y+APRQ2/mftEhJvP52NA3vz9KnkaIMaKAD
         jdkw==
X-Gm-Message-State: ANhLgQ2gS8ikf7DrpAyWlzZBZ0n7X1rtE9+/ZE2oZvTZwjoTGXQBp3GC
        jkWqyOFntnJsT7aENhtwbOmp/muYEC5yNji3mpB5Iw==
X-Google-Smtp-Source: ADFU+vtNwg97u+UdTWVYb6/mwYd7ahxnbfnrbtAicFiBrYZA15JA9SwdltGuhno/l4EXfmmq9upRMGTPd78cxG76KAI=
X-Received: by 2002:a6b:5b15:: with SMTP id v21mr1895802ioh.100.1583477581773;
 Thu, 05 Mar 2020 22:53:01 -0800 (PST)
MIME-Version: 1.0
References: <20200302044021.97415-1-hsinyi@chromium.org> <46f27a3b-de4c-8d43-d6d7-d6332ee30451@xs4all.nl>
In-Reply-To: <46f27a3b-de4c-8d43-d6d7-d6332ee30451@xs4all.nl>
From:   Hsin-Yi Wang <hsinyi@chromium.org>
Date:   Fri, 6 Mar 2020 14:52:35 +0800
Message-ID: <CAJMQK-i2Cht5YMMMQsyz0UGhpiU3kF67C_j8pD0pHDwzkyz6VA@mail.gmail.com>
Subject: Re: [PATCH v4] media: mtk-vpu: avoid unaligned access to DTCM buffer.
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
        Houlong Wei <houlong.wei@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org,
        lkml <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Mar 3, 2020 at 10:24 PM Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
>
> On 02/03/2020 05:40, Hsin-Yi Wang wrote:
> > media: mtk-vpu: avoid unaligned access to DTCM buffer.
> >
> > Previously, vpu->recv_buf and send_buf are forced cast from
> > void __iomem *tcm. vpu->recv_buf->share_buf is passed to
> > vpu_ipi_desc.handler(). It's not able to do unaligned access. Otherwise
> > kernel would crash due to unable to handle kernel paging request.
> >
> > struct vpu_run {
> >       u32 signaled;
> >       char fw_ver[VPU_FW_VER_LEN];
> >       unsigned int    dec_capability;
> >       unsigned int    enc_capability;
> >       wait_queue_head_t wq;
> > };
> >
> > fw_ver starts at 4 byte boundary. If system enables
> > CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS, strscpy() will do
> > read_word_at_a_time(), which tries to read 8-byte: *(unsigned long *)addr
> >
> > vpu_init_ipi_handler() calls strscpy(), which would lead to crash.
> >
> > vpu_init_ipi_handler() and several other handlers (eg.
> > vpu_dec_ipi_handler) only do read access to this data, so they can be
> > const, and we can use memcpy_fromio() to copy the buf to another non iomem
> > buffer then pass to handler.
> >
> > Fixes: 85709cbf1524 ("media: replace strncpy() by strscpy()")
> > Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> > ---
> > Change in v4:
> > - Remove forced casting recv_buf from tcm. Copy iomem data before passing
> >   to handler.
> > Change in v2, v3:
> > - fix sparse warnings.
> > ---
> >  drivers/media/platform/mtk-mdp/mtk_mdp_vpu.c  |  9 ++--
> >  .../media/platform/mtk-vcodec/vdec_vpu_if.c   |  6 +--
> >  .../media/platform/mtk-vcodec/venc_vpu_if.c   | 12 ++---
> >  drivers/media/platform/mtk-vpu/mtk_vpu.c      | 45 ++++++++++---------
> >  drivers/media/platform/mtk-vpu/mtk_vpu.h      |  2 +-
> >  5 files changed, 38 insertions(+), 36 deletions(-)
> >
> > diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_vpu.c b/drivers/media/platform/mtk-mdp/mtk_mdp_vpu.c
> > index 6720d11f50cf..dc95b8a44759 100644
> > --- a/drivers/media/platform/mtk-mdp/mtk_mdp_vpu.c
> > +++ b/drivers/media/platform/mtk-mdp/mtk_mdp_vpu.c
> > @@ -15,7 +15,7 @@ static inline struct mtk_mdp_ctx *vpu_to_ctx(struct mtk_mdp_vpu *vpu)
> >       return container_of(vpu, struct mtk_mdp_ctx, vpu);
> >  }
> >
> > -static void mtk_mdp_vpu_handle_init_ack(struct mdp_ipi_comm_ack *msg)
> > +static void mtk_mdp_vpu_handle_init_ack(const struct mdp_ipi_comm_ack *msg)
> >  {
> >       struct mtk_mdp_vpu *vpu = (struct mtk_mdp_vpu *)
> >                                       (unsigned long)msg->ap_inst;
> > @@ -26,10 +26,11 @@ static void mtk_mdp_vpu_handle_init_ack(struct mdp_ipi_comm_ack *msg)
> >       vpu->inst_addr = msg->vpu_inst_addr;
> >  }
> >
> > -static void mtk_mdp_vpu_ipi_handler(void *data, unsigned int len, void *priv)
> > +static void mtk_mdp_vpu_ipi_handler(const void *data, unsigned int len,
> > +                                 void *priv)
> >  {
> > -     unsigned int msg_id = *(unsigned int *)data;
> > -     struct mdp_ipi_comm_ack *msg = (struct mdp_ipi_comm_ack *)data;
> > +     unsigned int msg_id = *(const unsigned int *)data;
> > +     const struct mdp_ipi_comm_ack *msg = data;
>
> Why not just do:
>
>         const struct mdp_ipi_comm_ack *msg = data;
>         unsigned int msg_id = msg->msg_id;
>
> Much cleaner.
>
> Other than this small issue this patch looks nice. No more sparse/smatch warnings
> and no more weird casts :-)
>
> Regards,
>
>         Hans
>
Updated in V5, thanks :)

https://lore.kernel.org/lkml/20200304025851.173570-1-hsinyi@chromium.org/
