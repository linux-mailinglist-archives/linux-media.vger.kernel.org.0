Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9DBCEAE2BE
	for <lists+linux-media@lfdr.de>; Tue, 10 Sep 2019 06:05:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732200AbfIJEFG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Sep 2019 00:05:06 -0400
Received: from mail-ed1-f65.google.com ([209.85.208.65]:36214 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731800AbfIJEFG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Sep 2019 00:05:06 -0400
Received: by mail-ed1-f65.google.com with SMTP id f2so9202371edw.3
        for <linux-media@vger.kernel.org>; Mon, 09 Sep 2019 21:05:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NWPWiF7RmUFMiClnKh78wynrVqgBNiPTp2bFs9APlmM=;
        b=gZo+vDHuRtLwgL2wLk7M1IljiLedGerG7+gBK5mBCdgTSbOGx/YUbSX7B8QN9bxFXA
         7VEDRKARc2s3HPkg8XakopyPnAlQpKf5x37pXIdxcFrTQaDILsLMuSHin8iNeCZluNu3
         2dDOYvZNouZSBLXPMyQegrzKmrWI246WLFDAU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NWPWiF7RmUFMiClnKh78wynrVqgBNiPTp2bFs9APlmM=;
        b=GE7wguS4NU4ejsk9MBI45sa/rTnuWBMToVc8j+kdiRmONmMYeYFJgvIx6r5ycrD9jU
         9I6f44wL5xS7ZYs+ssCOo8EhUGOvBGwz48VTod58j7w9HCCvsyxZ0FCWGn92Ns9EAjDl
         rKWwZE3bULAGaKUo9G+dlQe/TRI5r5yp9xy6AOdi48FJtLZwnEb9hHorp9Tq+ZnFF48q
         lYd9+YLViUzzYVMGJGJ2ljW7+vngG0UA1qdSGWdsYqkzX3h2/tZ56S3+YZS3KZsue1on
         822mxLLdB6e0qZXcsLOWh75qiWyR5FE+TdWbcAM1Kna5K9lDqjcEPAZoq2tfybgoBW6b
         EI5g==
X-Gm-Message-State: APjAAAVNqyUonYHF1erWnWqTsCWytmqnqMIFrbrCA9BrCtiLqjwv6lHS
        D8oCamCh8wgmFBPd3JeYmzRRd69XSSULUA==
X-Google-Smtp-Source: APXvYqwHNW0e6Z0+FoPIVtHZi00zWuCTM/tIfLu2gfIWTdGn/haxT3SxaIwcSUVYAMJwiuo3cERXiw==
X-Received: by 2002:a50:eb88:: with SMTP id y8mr18853184edr.150.1568088303672;
        Mon, 09 Sep 2019 21:05:03 -0700 (PDT)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com. [209.85.221.45])
        by smtp.gmail.com with ESMTPSA id k10sm3355284edb.68.2019.09.09.21.05.02
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Sep 2019 21:05:02 -0700 (PDT)
Received: by mail-wr1-f45.google.com with SMTP id q17so12389086wrx.10
        for <linux-media@vger.kernel.org>; Mon, 09 Sep 2019 21:05:02 -0700 (PDT)
X-Received: by 2002:a5d:4e89:: with SMTP id e9mr21305605wru.48.1568088301989;
 Mon, 09 Sep 2019 21:05:01 -0700 (PDT)
MIME-Version: 1.0
References: <20190909192244.9367-1-frederic.chen@mediatek.com> <20190909192244.9367-5-frederic.chen@mediatek.com>
In-Reply-To: <20190909192244.9367-5-frederic.chen@mediatek.com>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Tue, 10 Sep 2019 13:04:50 +0900
X-Gmail-Original-Message-ID: <CAAFQd5DEn_N26M7B4X7fKHVA=XBtWJN=Y4VF7D9B=TkgXf_i+Q@mail.gmail.com>
Message-ID: <CAAFQd5DEn_N26M7B4X7fKHVA=XBtWJN=Y4VF7D9B=TkgXf_i+Q@mail.gmail.com>
Subject: Re: [RFC PATCH V3 4/5] platform: mtk-isp: Add Mediatek DIP driver
To:     =?UTF-8?B?RnJlZGVyaWMgQ2hlbiAo6Zmz5L+K5YWDKQ==?= 
        <frederic.chen@mediatek.com>
Cc:     Hans Verkuil <hans.verkuil@cisco.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        yuzhao@chromium.org, zwisler@chromium.org,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg
        Roedel <joro@8bytes.org>," <linux-arm-kernel@lists.infradead.org>,
        =?UTF-8?B?U2VhbiBDaGVuZyAo6YSt5piH5byYKQ==?= 
        <Sean.Cheng@mediatek.com>, Sj Huang <sj.huang@mediatek.com>,
        =?UTF-8?B?Q2hyaXN0aWUgWXUgKOa4uOmbheaDoCk=?= 
        <christie.yu@mediatek.com>,
        =?UTF-8?B?SG9sbWVzIENoaW91ICjpgrHmjLop?= 
        <holmes.chiou@mediatek.com>,
        Jerry-ch Chen <Jerry-ch.Chen@mediatek.com>,
        =?UTF-8?B?SnVuZ28gTGluICjmnpfmmI7kv4op?= <jungo.lin@mediatek.com>,
        =?UTF-8?B?UnlubiBXdSAo5ZCz6IKy5oGpKQ==?= <Rynn.Wu@mediatek.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        srv_heupstream <srv_heupstream@mediatek.com>,
        devicetree@vger.kernel.org, Shik Chen <shik@chromium.org>,
        suleiman@chromium.org,
        =?UTF-8?B?QWxsYW4gWWFuZyAo5qWK5pm66YieKQ==?= 
        <Allan.Yang@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Frederic,

On Tue, Sep 10, 2019 at 4:23 AM <frederic.chen@mediatek.com> wrote:
>
> From: Frederic Chen <frederic.chen@mediatek.com>
>
> This patch adds the driver of Digital Image Processing (DIP)
> unit in Mediatek ISP system, providing image format
> conversion, resizing, and rotation features.
>
> The mtk-isp directory will contain drivers for multiple IP
> blocks found in Mediatek ISP system. It will include ISP
> Pass 1 driver(CAM), sensor interface driver, DIP driver and
> face detection driver.
>
> Signed-off-by: Frederic Chen <frederic.chen@mediatek.com>
> ---
>  drivers/media/platform/mtk-isp/Makefile       |    7 +
>  .../media/platform/mtk-isp/isp_50/Makefile    |    7 +
>  .../platform/mtk-isp/isp_50/dip/Makefile      |   18 +
>  .../platform/mtk-isp/isp_50/dip/mtk_dip-dev.c |  650 +++++
>  .../platform/mtk-isp/isp_50/dip/mtk_dip-dev.h |  566 +++++
>  .../platform/mtk-isp/isp_50/dip/mtk_dip-hw.h  |  156 ++
>  .../platform/mtk-isp/isp_50/dip/mtk_dip-sys.c |  521 ++++
>  .../mtk-isp/isp_50/dip/mtk_dip-v4l2.c         | 2255 +++++++++++++++++
>  8 files changed, 4180 insertions(+)
>  create mode 100644 drivers/media/platform/mtk-isp/Makefile
>  create mode 100644 drivers/media/platform/mtk-isp/isp_50/Makefile
>  create mode 100644 drivers/media/platform/mtk-isp/isp_50/dip/Makefile
>  create mode 100644 drivers/media/platform/mtk-isp/isp_50/dip/mtk_dip-dev.c
>  create mode 100644 drivers/media/platform/mtk-isp/isp_50/dip/mtk_dip-dev.h
>  create mode 100644 drivers/media/platform/mtk-isp/isp_50/dip/mtk_dip-hw.h
>  create mode 100644 drivers/media/platform/mtk-isp/isp_50/dip/mtk_dip-sys.c
>  create mode 100644 drivers/media/platform/mtk-isp/isp_50/dip/mtk_dip-v4l2.c
>

Thanks for sending v3!

I'm going to do a full review a bit later, but please check one
comment about power handling below.

Other than that one comment, from a quick look, I think we only have a
number of style issues left. Thanks for the hard work!

[snip]
> +static void dip_runner_func(struct work_struct *work)
> +{
> +       struct mtk_dip_request *req = mtk_dip_hw_mdp_work_to_req(work);
> +       struct mtk_dip_dev *dip_dev = req->dip_pipe->dip_dev;
> +       struct img_config *config_data =
> +               (struct img_config *)req->working_buf->config_data.vaddr;
> +
> +       /*
> +        * Call MDP/GCE API to do HW excecution
> +        * Pass the framejob to MDP driver
> +        */
> +       pm_runtime_get_sync(dip_dev->dev);
> +       mdp_cmdq_sendtask(dip_dev->mdp_pdev, config_data,
> +                         &req->img_fparam.frameparam, NULL, false,
> +                         dip_mdp_cb_func, req);
> +}
[snip]
> +static void dip_composer_workfunc(struct work_struct *work)
> +{
> +       struct mtk_dip_request *req = mtk_dip_hw_fw_work_to_req(work);
> +       struct mtk_dip_dev *dip_dev = req->dip_pipe->dip_dev;
> +       struct img_ipi_param ipi_param;
> +       struct mtk_dip_hw_subframe *buf;
> +       int ret;
> +
> +       down(&dip_dev->sem);
> +
> +       buf = mtk_dip_hw_working_buf_alloc(req->dip_pipe->dip_dev);
> +       if (!buf) {
> +               dev_err(req->dip_pipe->dip_dev->dev,
> +                       "%s:%s:req(%p): no free working buffer available\n",
> +                       __func__, req->dip_pipe->desc->name, req);
> +       }
> +
> +       req->working_buf = buf;
> +       mtk_dip_wbuf_to_ipi_img_addr(&req->img_fparam.frameparam.subfrm_data,
> +                                    &buf->buffer);
> +       memset(buf->buffer.vaddr, 0, DIP_SUB_FRM_SZ);
> +       mtk_dip_wbuf_to_ipi_img_sw_addr(&req->img_fparam.frameparam.config_data,
> +                                       &buf->config_data);
> +       memset(buf->config_data.vaddr, 0, DIP_COMP_SZ);
> +
> +       if (!req->img_fparam.frameparam.tuning_data.present) {
> +               /*
> +                * When user enqueued without tuning buffer,
> +                * it would use driver internal buffer.
> +                */
> +               dev_dbg(dip_dev->dev,
> +                       "%s: frame_no(%d) has no tuning_data\n",
> +                       __func__, req->img_fparam.frameparam.frame_no);
> +
> +               mtk_dip_wbuf_to_ipi_tuning_addr
> +                               (&req->img_fparam.frameparam.tuning_data,
> +                                &buf->tuning_buf);
> +               memset(buf->tuning_buf.vaddr, 0, DIP_TUNING_SZ);
> +       }
> +
> +       mtk_dip_wbuf_to_ipi_img_sw_addr(&req->img_fparam.frameparam.self_data,
> +                                       &buf->frameparam);
> +       memcpy(buf->frameparam.vaddr, &req->img_fparam.frameparam,
> +              sizeof(req->img_fparam.frameparam));
> +       ipi_param.usage = IMG_IPI_FRAME;
> +       ipi_param.frm_param.handle = req->id;
> +       ipi_param.frm_param.scp_addr = (u32)buf->frameparam.scp_daddr;
> +
> +       mutex_lock(&dip_dev->hw_op_lock);
> +       atomic_inc(&dip_dev->num_composing);
> +       ret = scp_ipi_send(dip_dev->scp_pdev, SCP_IPI_DIP, &ipi_param,
> +                          sizeof(ipi_param), 0);

We're not holding the pm_runtime enable count here
(pm_runtime_get_sync() wasn't called), so rproc_shutdown() might have
been called. Wouldn't that affect the ability for this IPI to run?

We had a related discussion with Jerry on the FD series and I think
the conclusion is:
a) if there is any state that needs to be preserved between jobs, that
would be cleared by rproc_shutdown() then we need to call
rproc_boot/shutdown() when we start/stop streaming.
b) it there is no such state, we can keep them inside runtime PM
callbacks, but we need to call pm_runtime_get_sync() before sending an
IPI and pm_runtime_mark_last_busy() + pm_runtime_put_autosuspend()
after the SCP signals completion. In this case the runtime PM
autosuspend delay should be set to around 2-3 times the delay needed
for rproc_shutdown() + rproc_boot() to complete.

Best regards,
Tomasz
