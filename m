Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0151F74C44
	for <lists+linux-media@lfdr.de>; Thu, 25 Jul 2019 12:56:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388928AbfGYK4r (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 Jul 2019 06:56:47 -0400
Received: from mail-ed1-f67.google.com ([209.85.208.67]:43006 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728710AbfGYK4q (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 Jul 2019 06:56:46 -0400
Received: by mail-ed1-f67.google.com with SMTP id v15so49850683eds.9
        for <linux-media@vger.kernel.org>; Thu, 25 Jul 2019 03:56:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=k+VmJx2qHC6IoWcUVPga9JSh1E7Qu0Q0gAer0TQntYM=;
        b=Bv3+Nes2Q+ALJZRs1cdOeFsomrNoG29LQ9rzUKD8y5Jq4FvKKXDIX6u7vGvo4j5Ydh
         RDNNXZq1byNAJhYlWdmZcIDxxxqAf8WrYk9w4nFlhcn9LVk1iuezwnnsm8eqrgDKKipT
         5G5ReK1RMANSGUYwwKf1BIOtYh+nKwBnzg6lk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=k+VmJx2qHC6IoWcUVPga9JSh1E7Qu0Q0gAer0TQntYM=;
        b=tVgHAM2mg7X8I38H1paYydtM1L9PD3H0C3FJGhFF96nQ8aXUBiEVE36+iWsQUs/jiu
         2oRAPB87iX2+h/NA1OLczpt/OMINWdHr6f+JwgOwodqS8PxTHHCObWtpp17PTSW6MhTC
         WBwNm8xi+DzTDKNERFlC7tpgLAGwELDrFNE2xe5D9mIqDM2oUDoeyA4T/RsCfpMmapvH
         0kEhDd8XSrufSqUjn9t0XXZy/lAoKBI7qV4o1SvY6t+FK85zatbUy63D5Ptnnx7NBDzO
         FLsdqs1ewsgpilqBH2lSQYVAKzl2INHwbtpWxN0ysSEU8fMd7SEckhFQiJc8b9P9s5RS
         FeKA==
X-Gm-Message-State: APjAAAVxsfGmpO5+JY5A7jHciFNiH/6fFDS4/3BLp1W8lHkLebT7fkNN
        HiO5G78n3svr3b4jERoYuVhVT+1tHakUZg==
X-Google-Smtp-Source: APXvYqyzk/8slQo16sS5Qr/Icz9Pd3KqrTcMOQmqwKEHOb/1/fbUkxR2omxB1zYjFxCXG5k6uxfMbA==
X-Received: by 2002:aa7:d28a:: with SMTP id w10mr76184272edq.251.1564052204139;
        Thu, 25 Jul 2019 03:56:44 -0700 (PDT)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com. [209.85.221.50])
        by smtp.gmail.com with ESMTPSA id o21sm12931152edt.26.2019.07.25.03.56.41
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Thu, 25 Jul 2019 03:56:41 -0700 (PDT)
Received: by mail-wr1-f50.google.com with SMTP id p17so50240097wrf.11
        for <linux-media@vger.kernel.org>; Thu, 25 Jul 2019 03:56:41 -0700 (PDT)
X-Received: by 2002:adf:ed41:: with SMTP id u1mr89782001wro.162.1564052200774;
 Thu, 25 Jul 2019 03:56:40 -0700 (PDT)
MIME-Version: 1.0
References: <jungo.lin@mediatek.com> <20190611035344.29814-1-jungo.lin@mediatek.com>
 <20190611035344.29814-9-jungo.lin@mediatek.com> <20190710095827.GC181405@chromium.org>
 <1563675513.1212.444.camel@mtksdccf07>
In-Reply-To: <1563675513.1212.444.camel@mtksdccf07>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Thu, 25 Jul 2019 19:56:28 +0900
X-Gmail-Original-Message-ID: <CAAFQd5BT7M425AbFicYuX+wr-twgS_cxQ937+Rgxo6Y2fA6_gA@mail.gmail.com>
Message-ID: <CAAFQd5BT7M425AbFicYuX+wr-twgS_cxQ937+Rgxo6Y2fA6_gA@mail.gmail.com>
Subject: Re: [RFC,v3 8/9] media: platform: Add Mediatek ISP P1 SCP communication
To:     Jungo Lin <jungo.lin@mediatek.com>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg
        Roedel <joro@8bytes.org>," <linux-arm-kernel@lists.infradead.org>,
        devicetree@vger.kernel.org,
        srv_heupstream <srv_heupstream@mediatek.com>,
        ddavenport@chromium.org, Rob Herring <robh@kernel.org>,
        =?UTF-8?B?U2VhbiBDaGVuZyAo6YSt5piH5byYKQ==?= 
        <sean.cheng@mediatek.com>, Sj Huang <sj.huang@mediatek.com>,
        =?UTF-8?B?RnJlZGVyaWMgQ2hlbiAo6Zmz5L+K5YWDKQ==?= 
        <frederic.chen@mediatek.com>,
        =?UTF-8?B?UnlhbiBZdSAo5L2Z5a2f5L+uKQ==?= <ryan.yu@mediatek.com>,
        =?UTF-8?B?UnlubiBXdSAo5ZCz6IKy5oGpKQ==?= <rynn.wu@mediatek.com>,
        =?UTF-8?B?RnJhbmtpZSBDaGl1ICjpgrHmloflh7Ep?= 
        <frankie.chiu@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jungo,

On Sun, Jul 21, 2019 at 11:18 AM Jungo Lin <jungo.lin@mediatek.com> wrote:
[snip]
> > > +           wake_up_interruptible(&isp_ctx->composer_tx_thread.wq);
> > > +           isp_ctx->composer_tx_thread.thread = NULL;
> > > +   }
> > > +
> > > +   if (isp_ctx->composer_deinit_thread.thread) {
> > > +           wake_up(&isp_ctx->composer_deinit_thread.wq);
> > > +           isp_ctx->composer_deinit_thread.thread = NULL;
> > > +   }
> > > +   mutex_unlock(&isp_ctx->lock);
> > > +
> > > +   pm_runtime_put_sync(&p1_dev->pdev->dev);
> >
> > No need to use the sync variant.
> >
>
> We don't get this point. If we will call pm_runtime_get_sync in
> mtk_isp_hw_init function, will we need to call
> pm_runtime_put_sync_autosuspend in mtk_isp_hw_release in next patch?
> As we know, we should call runtime pm functions in pair.
>

My point is that pm_runtime_put_sync() is only needed if one wants the
runtime count to be decremented after the function returns. Normally
there is no need to do so and one would call pm_runtime_put(), or if
autosuspend is used, pm_runtime_put_autosuspend() (note there is no
"sync" in the name).

[snip]
> > +static void isp_composer_handler(void *data, unsigned int len, void *priv)
> > > +{
> > > +   struct mtk_isp_p1_ctx *isp_ctx = (struct mtk_isp_p1_ctx *)priv;
> > > +   struct isp_p1_device *p1_dev = p1_ctx_to_dev(isp_ctx);
> > > +   struct device *dev = &p1_dev->pdev->dev;
> > > +   struct mtk_isp_scp_p1_cmd *ipi_msg;
> > > +
> > > +   ipi_msg = (struct mtk_isp_scp_p1_cmd *)data;
> >
> > Should we check that len == sizeof(*ipi_msg)? (Or at least >=, if data could
> > contain some extra bytes at the end.)
> >
>
> The len parameter is the actual sending bytes from SCP to kernel.
> In the runtime, it is only 6 bytes for isp_ack_info command
> However, sizeof(*ipi_msg) is large due to struct mtk_isp_scp_p1_cmd is
> union structure.
>

That said we still should check if len is enough to cover the data
we're accessing below.

> > > +
> > > +   if (ipi_msg->cmd_id != ISP_CMD_ACK)
> > > +           return;
> > > +
> > > +   if (ipi_msg->ack_info.cmd_id == ISP_CMD_FRAME_ACK) {
> > > +           dev_dbg(dev, "ack frame_num:%d",
> > > +                   ipi_msg->ack_info.frame_seq_no);
> > > +           atomic_set(&isp_ctx->composed_frame_id,
> > > +                      ipi_msg->ack_info.frame_seq_no);
> >
> > I suppose we are expecting here that ipi_msg->ack_info.frame_seq_no would be
> > just isp_ctx->composed_frame_id + 1, right? If not, we probably dropped some
> > frames and we should handle that somehow.
> >
>
> No, we use isp_ctx->composed_frame_id to save which frame sequence
> number are composed done in SCP. In new design, we will move this from
> isp_ctx to p1_dev.

But we compose the frames in order, don't we? Wouldn't every composed
frame would be just previous frame ID + 1?

[snip]
> > > +void isp_composer_hw_init(struct device *dev)
> > > +{
> > > +   struct mtk_isp_scp_p1_cmd composer_tx_cmd;
> > > +   struct isp_p1_device *p1_dev = get_p1_device(dev);
> > > +   struct mtk_isp_p1_ctx *isp_ctx = &p1_dev->isp_ctx;
> > > +
> > > +   memset(&composer_tx_cmd, 0, sizeof(composer_tx_cmd));
> > > +   composer_tx_cmd.cmd_id = ISP_CMD_INIT;
> > > +   composer_tx_cmd.frameparam.hw_module = isp_ctx->isp_hw_module;
> > > +   composer_tx_cmd.frameparam.cq_addr.iova = isp_ctx->scp_mem_iova;
> > > +   composer_tx_cmd.frameparam.cq_addr.scp_addr = isp_ctx->scp_mem_pa;
> >
> > Should we also specify the size of the buffer? Otherwise we could end up
> > with some undetectable overruns.
> >
>
> The size of SCP composer's memory is fixed to 0x200000.
> Is it necessary to specify the size of this buffer?
>
> #define MTK_ISP_COMPOSER_MEM_SIZE 0x200000
>
> ptr = dma_alloc_coherent(p1_dev->cam_dev.smem_dev,
>                         MTK_ISP_COMPOSER_MEM_SIZE, &addr, GFP_KERNEL);
>

Okay, but please add a comment saying that this is an implicit
requirement of the firmware.

Best regards,
Tomasz
