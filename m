Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8B4141721F1
	for <lists+linux-media@lfdr.de>; Thu, 27 Feb 2020 16:13:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730258AbgB0PNn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 Feb 2020 10:13:43 -0500
Received: from mail-il1-f194.google.com ([209.85.166.194]:32894 "EHLO
        mail-il1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729772AbgB0PNl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 Feb 2020 10:13:41 -0500
Received: by mail-il1-f194.google.com with SMTP id s18so2757317iln.0
        for <linux-media@vger.kernel.org>; Thu, 27 Feb 2020 07:13:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=m+kylmRZdQ7kHJRK9lKNLqwlSVhHwyYol2gsDgRlfLA=;
        b=G2r3t7rraJO/jHNvyP5CFwnplNk9lJtpT9K3gnayhn4rcbOA3gSXoz8oCLeE81E/Wt
         no0Zh7DuWczVpOtO+5F+bZ/zXJJtqem4r07fo5SkxDWfHb9mDBp6nKik1l4JDM8KN/al
         qqemDCNP9bkaEgHme33rJac7E7n0rUJSoO+8E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=m+kylmRZdQ7kHJRK9lKNLqwlSVhHwyYol2gsDgRlfLA=;
        b=HJyDKIHWfk02aRzRwvUR21+yLmtmGWTJmszQnRT8KMn2ZseGJKjkhe820sL4qhykGo
         TFEVp7WCMOKujIv2FLZjSlxRNQRsI9GwOxpEcnuVOmmEaTU/xXdY/eU9cdw0m5czV+ML
         7dNYS4PnuGHw9K3rqM0xFG3z6YUBzPDd3MypNd8rrkwmjhrEEM4QbybR0rL62XRm+vrZ
         lY65YnVEzUDKFJC83qpy2Jz/q1m07tnCxX8XMapsioRzL7GyDThHWra4teO1vjgAAoNe
         DwLIdKw+d6i878RXD/VG67Yn2Hhn8ohDe8RA3gORQ3b4z0GWq20Z4GDcb9nqvb6XdZ7k
         OIIg==
X-Gm-Message-State: APjAAAUJgaxUjSMfmIB82C+b7WNOWHJgCc46qMYpRqioGmrAnWQnOkAO
        ngWESnoMV9EpbijJtMYIARE2QV5KeXI+2CDBllBruA==
X-Google-Smtp-Source: APXvYqx6ZTgm/JnuJem8YlsSHDER8b5Wil6I0Af4SkhwFk++vp7lU3TdAvSta4JoAfspzedl//Jug2AVYKDt3UXKMdc=
X-Received: by 2002:a92:d610:: with SMTP id w16mr5875950ilm.283.1582816420405;
 Thu, 27 Feb 2020 07:13:40 -0800 (PST)
MIME-Version: 1.0
References: <20200225172437.106679-1-hsinyi@chromium.org> <6986e879-cf35-13a5-baae-9ab09ba1a0d7@xs4all.nl>
In-Reply-To: <6986e879-cf35-13a5-baae-9ab09ba1a0d7@xs4all.nl>
From:   Hsin-Yi Wang <hsinyi@chromium.org>
Date:   Thu, 27 Feb 2020 23:13:14 +0800
Message-ID: <CAJMQK-hFQ8ZMAH=C9suud81gwXQaG_=4mx69qeQP=eCFgAXhTQ@mail.gmail.com>
Subject: Re: [PATCH v3] media: mtk-vpu: avoid unaligned access to DTCM buffer.
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

On Thu, Feb 27, 2020 at 5:50 PM Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
>
> On 2/25/20 6:24 PM, Hsin-Yi Wang wrote:
> > struct vpu_run *run in vpu_init_ipi_handler() is an ioremapped DTCM (Data
> > Tightly Coupled Memory) buffer shared with AP.  It's not able to do
> > unaligned access. Otherwise kernel would crash due to unable to handle
> > kernel paging request.
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
> > Copy the string by memcpy_fromio() for this buffer to avoid unaligned
> > access.
> >
> > Fixes: 85709cbf1524 ("media: replace strncpy() by strscpy()")
> > Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> > ---
> > Change in v3:
> > - fix sparse warnings.
> > Change in v2:
> > - fix sparse warnings.
> > ---
> >  drivers/media/platform/mtk-vpu/mtk_vpu.c | 14 ++++++++------
> >  1 file changed, 8 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/media/platform/mtk-vpu/mtk_vpu.c b/drivers/media/platform/mtk-vpu/mtk_vpu.c
> > index a768707abb94..e3fd2d1814f3 100644
> > --- a/drivers/media/platform/mtk-vpu/mtk_vpu.c
> > +++ b/drivers/media/platform/mtk-vpu/mtk_vpu.c
> > @@ -603,12 +603,14 @@ EXPORT_SYMBOL_GPL(vpu_load_firmware);
> >  static void vpu_init_ipi_handler(void *data, unsigned int len, void *priv)
> >  {
> >       struct mtk_vpu *vpu = (struct mtk_vpu *)priv;
> > -     struct vpu_run *run = (struct vpu_run *)data;
> > -
> > -     vpu->run.signaled = run->signaled;
> > -     strscpy(vpu->run.fw_ver, run->fw_ver, sizeof(vpu->run.fw_ver));
> > -     vpu->run.dec_capability = run->dec_capability;
> > -     vpu->run.enc_capability = run->enc_capability;
> > +     struct vpu_run __iomem *run = (struct vpu_run __iomem __force *)data;
>
> The use of __force is generally a bad sign. Shouldn't the 'void *data' be a
> 'void __iomem *data'? And vpu->recv_buf should be 'struct share_obj __iomem *recv_buf;'.
> Probably send_buf as well.
>
> In other words, the __iomem attribute should be wired up correctly throughout the
> driver code, and not forcibly applied in one place. That is asking for trouble in
> the future. Also, sparse only works well in detecting problems if such attributes
> are applied at the right level.
>
> Regards,
>
>         Hans
>
Thanks for your comments. I should check the whole code more
thoroughly. I do see that vpu->recv_buf is forced cast from void
__iomem *tcm:
vpu->recv_buf = (__force struct share_obj *)(vpu->reg.tcm +VPU_DTCM_OFFSET);
I'll use struct share_obj __iomem *recv_buf; as you suggested. Thanks

Since all handlers (vpu_init_ipi_handler, vpu_enc_ipi_handler,
vpu_dec_ipi_handler, and mtk_mdp_vpu_ipi_handler) only do read access
to this buffer, I think we can also change 'void *data' as 'const void
*data', and pass another buffer copied from vpu->recv_buf->share_buf
to handler. In this way we don't have to change to use iomem APIs in
those handlers.

 static void vpu_ipi_handler(struct mtk_vpu *vpu)
 {
-       struct share_obj *rcv_obj = vpu->recv_buf;
+       struct share_obj __iomem *rcv_obj = vpu->recv_buf;
        struct vpu_ipi_desc *ipi_desc = vpu->ipi_desc;
-
-       if (rcv_obj->id < IPI_MAX && ipi_desc[rcv_obj->id].handler) {
-               ipi_desc[rcv_obj->id].handler(rcv_obj->share_buf,...
...
+       unsigned char data[SHARE_BUF_SIZE];
+       s32 id = readl(&rcv_obj->id);
+
+       memcpy_fromio(data, rcv_obj->share_buf, sizeof(data));
+       if (id < IPI_MAX && ipi_desc[id].handler) {
+               ipi_desc[id].handler(data, readl(&rcv_obj->len), ...
...
