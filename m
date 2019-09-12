Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 54511B08A4
	for <lists+linux-media@lfdr.de>; Thu, 12 Sep 2019 08:05:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729622AbfILGEY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Sep 2019 02:04:24 -0400
Received: from mail-ed1-f66.google.com ([209.85.208.66]:36271 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727186AbfILGEY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Sep 2019 02:04:24 -0400
Received: by mail-ed1-f66.google.com with SMTP id f2so16480879edw.3
        for <linux-media@vger.kernel.org>; Wed, 11 Sep 2019 23:04:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LjfYgHrvdyzdbJpnHRyIqrQrXL2lINOVqcLX3oIlaCA=;
        b=lkpp3OLLxsJt6BJd9FydWcE47w5MQsJS0CgcGvyto3A+ZTBhX9yHJXy35kJKMmztr8
         mmtG+W5yWb5Xm9uFOY4sPakw9xfa4dvT+PcfVCMn3cUCpCMnSqA1oyfkcKIZYKe9Q6Md
         ky6Uy00Is2RTb8FrnjPyktCVLhAl+XizQFHCQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LjfYgHrvdyzdbJpnHRyIqrQrXL2lINOVqcLX3oIlaCA=;
        b=c1xJfesIDe9BG6wmc9TCHL7MGyY//orelRro46oNpLqk4zmYsfEKjyCTRLSJBKtZ+C
         jfHCR2P6H56BOcEe18ub20Rk6REn5L+B+YlGyMPy4R62aJZP2UGE19Yh+i5OMcdmigXy
         TuPsQ8p3hacBDhtrm0+HZUJMWqLLzXBdceH9FqG6JA1lZ2d1KIY3TsIvizHd19LGUniO
         jtxZBTSV/t5xRpeT4SuJJyni1DwZ5mNEFaHWiNV34Fe7EFJSfo9UAYdND65zoJv0Rb+b
         hSP4V/JsH4m5/UHeEArCWiWvVtA67x9J2fZiBeR6xyu+qlsGsoKYahEszLO9/mQiy6dl
         P2og==
X-Gm-Message-State: APjAAAWSXBac2KJTMf/w7itdojta6+pahTUZ4xHdvBQUgxXxqbVPZMHL
        6pFBu16lg9g4zxYdkbmIk+VSwYy1Dht53w==
X-Google-Smtp-Source: APXvYqxIh7MQZA7wmFsDgDmBkqBSGnhI/zhPcNzQ//LANgbbzZck+k2f+5P8g/7+UimDC4KuCawSIA==
X-Received: by 2002:a50:f19c:: with SMTP id x28mr39458714edl.42.1568268261988;
        Wed, 11 Sep 2019 23:04:21 -0700 (PDT)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com. [209.85.221.49])
        by smtp.gmail.com with ESMTPSA id be17sm4529105edb.87.2019.09.11.23.04.21
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Sep 2019 23:04:21 -0700 (PDT)
Received: by mail-wr1-f49.google.com with SMTP id y19so27020356wrd.3
        for <linux-media@vger.kernel.org>; Wed, 11 Sep 2019 23:04:21 -0700 (PDT)
X-Received: by 2002:adf:dec2:: with SMTP id i2mr17316890wrn.92.1568267896913;
 Wed, 11 Sep 2019 22:58:16 -0700 (PDT)
MIME-Version: 1.0
References: <20190909192244.9367-1-frederic.chen@mediatek.com>
 <20190909192244.9367-5-frederic.chen@mediatek.com> <CAAFQd5DEn_N26M7B4X7fKHVA=XBtWJN=Y4VF7D9B=TkgXf_i+Q@mail.gmail.com>
 <1568223671.19171.12.camel@mtksdccf07>
In-Reply-To: <1568223671.19171.12.camel@mtksdccf07>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Thu, 12 Sep 2019 14:58:05 +0900
X-Gmail-Original-Message-ID: <CAAFQd5Cd2-dyQnMEy0LBwaajn7UfzEbHiJp7AkDy=T8Zy6t_=A@mail.gmail.com>
Message-ID: <CAAFQd5Cd2-dyQnMEy0LBwaajn7UfzEbHiJp7AkDy=T8Zy6t_=A@mail.gmail.com>
Subject: Re: [RFC PATCH V3 4/5] platform: mtk-isp: Add Mediatek DIP driver
To:     Frederic Chen <frederic.chen@mediatek.com>
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

On Thu, Sep 12, 2019 at 2:41 AM Frederic Chen
<frederic.chen@mediatek.com> wrote:
>
> Hi Tomasz,
>
> I appreciate your helpful comments.
>
>
> On Tue, 2019-09-10 at 13:04 +0900, Tomasz Figa wrote:
> > Hi Frederic,
> >
> > On Tue, Sep 10, 2019 at 4:23 AM <frederic.chen@mediatek.com> wrote:
> > >
> > > From: Frederic Chen <frederic.chen@mediatek.com>
> > >
> > > This patch adds the driver of Digital Image Processing (DIP)
> > > unit in Mediatek ISP system, providing image format
> > > conversion, resizing, and rotation features.
> > >
> > > The mtk-isp directory will contain drivers for multiple IP
> > > blocks found in Mediatek ISP system. It will include ISP
> > > Pass 1 driver(CAM), sensor interface driver, DIP driver and
> > > face detection driver.
> > >
> > > Signed-off-by: Frederic Chen <frederic.chen@mediatek.com>
> > > ---
> > >  drivers/media/platform/mtk-isp/Makefile       |    7 +
> > >  .../media/platform/mtk-isp/isp_50/Makefile    |    7 +
> > >  .../platform/mtk-isp/isp_50/dip/Makefile      |   18 +
> > >  .../platform/mtk-isp/isp_50/dip/mtk_dip-dev.c |  650 +++++
> > >  .../platform/mtk-isp/isp_50/dip/mtk_dip-dev.h |  566 +++++
> > >  .../platform/mtk-isp/isp_50/dip/mtk_dip-hw.h  |  156 ++
> > >  .../platform/mtk-isp/isp_50/dip/mtk_dip-sys.c |  521 ++++
> > >  .../mtk-isp/isp_50/dip/mtk_dip-v4l2.c         | 2255 +++++++++++++++++
> > >  8 files changed, 4180 insertions(+)
> > >  create mode 100644 drivers/media/platform/mtk-isp/Makefile
> > >  create mode 100644 drivers/media/platform/mtk-isp/isp_50/Makefile
> > >  create mode 100644 drivers/media/platform/mtk-isp/isp_50/dip/Makefile
> > >  create mode 100644 drivers/media/platform/mtk-isp/isp_50/dip/mtk_dip-dev.c
> > >  create mode 100644 drivers/media/platform/mtk-isp/isp_50/dip/mtk_dip-dev.h
> > >  create mode 100644 drivers/media/platform/mtk-isp/isp_50/dip/mtk_dip-hw.h
> > >  create mode 100644 drivers/media/platform/mtk-isp/isp_50/dip/mtk_dip-sys.c
> > >  create mode 100644 drivers/media/platform/mtk-isp/isp_50/dip/mtk_dip-v4l2.c
> > >
> >
> > Thanks for sending v3!
> >
> > I'm going to do a full review a bit later, but please check one
> > comment about power handling below.
> >
> > Other than that one comment, from a quick look, I think we only have a
> > number of style issues left. Thanks for the hard work!
> >
> > [snip]
> > > +static void dip_runner_func(struct work_struct *work)
> > > +{
> > > +       struct mtk_dip_request *req = mtk_dip_hw_mdp_work_to_req(work);
> > > +       struct mtk_dip_dev *dip_dev = req->dip_pipe->dip_dev;
> > > +       struct img_config *config_data =
> > > +               (struct img_config *)req->working_buf->config_data.vaddr;
> > > +
> > > +       /*
> > > +        * Call MDP/GCE API to do HW excecution
> > > +        * Pass the framejob to MDP driver
> > > +        */
> > > +       pm_runtime_get_sync(dip_dev->dev);
> > > +       mdp_cmdq_sendtask(dip_dev->mdp_pdev, config_data,
> > > +                         &req->img_fparam.frameparam, NULL, false,
> > > +                         dip_mdp_cb_func, req);
> > > +}
> > [snip]
> > > +static void dip_composer_workfunc(struct work_struct *work)
> > > +{
> > > +       struct mtk_dip_request *req = mtk_dip_hw_fw_work_to_req(work);
> > > +       struct mtk_dip_dev *dip_dev = req->dip_pipe->dip_dev;
> > > +       struct img_ipi_param ipi_param;
> > > +       struct mtk_dip_hw_subframe *buf;
> > > +       int ret;
> > > +
> > > +       down(&dip_dev->sem);
> > > +
> > > +       buf = mtk_dip_hw_working_buf_alloc(req->dip_pipe->dip_dev);
> > > +       if (!buf) {
> > > +               dev_err(req->dip_pipe->dip_dev->dev,
> > > +                       "%s:%s:req(%p): no free working buffer available\n",
> > > +                       __func__, req->dip_pipe->desc->name, req);
> > > +       }
> > > +
> > > +       req->working_buf = buf;
> > > +       mtk_dip_wbuf_to_ipi_img_addr(&req->img_fparam.frameparam.subfrm_data,
> > > +                                    &buf->buffer);
> > > +       memset(buf->buffer.vaddr, 0, DIP_SUB_FRM_SZ);
> > > +       mtk_dip_wbuf_to_ipi_img_sw_addr(&req->img_fparam.frameparam.config_data,
> > > +                                       &buf->config_data);
> > > +       memset(buf->config_data.vaddr, 0, DIP_COMP_SZ);
> > > +
> > > +       if (!req->img_fparam.frameparam.tuning_data.present) {
> > > +               /*
> > > +                * When user enqueued without tuning buffer,
> > > +                * it would use driver internal buffer.
> > > +                */
> > > +               dev_dbg(dip_dev->dev,
> > > +                       "%s: frame_no(%d) has no tuning_data\n",
> > > +                       __func__, req->img_fparam.frameparam.frame_no);
> > > +
> > > +               mtk_dip_wbuf_to_ipi_tuning_addr
> > > +                               (&req->img_fparam.frameparam.tuning_data,
> > > +                                &buf->tuning_buf);
> > > +               memset(buf->tuning_buf.vaddr, 0, DIP_TUNING_SZ);
> > > +       }
> > > +
> > > +       mtk_dip_wbuf_to_ipi_img_sw_addr(&req->img_fparam.frameparam.self_data,
> > > +                                       &buf->frameparam);
> > > +       memcpy(buf->frameparam.vaddr, &req->img_fparam.frameparam,
> > > +              sizeof(req->img_fparam.frameparam));
> > > +       ipi_param.usage = IMG_IPI_FRAME;
> > > +       ipi_param.frm_param.handle = req->id;
> > > +       ipi_param.frm_param.scp_addr = (u32)buf->frameparam.scp_daddr;
> > > +
> > > +       mutex_lock(&dip_dev->hw_op_lock);
> > > +       atomic_inc(&dip_dev->num_composing);
> > > +       ret = scp_ipi_send(dip_dev->scp_pdev, SCP_IPI_DIP, &ipi_param,
> > > +                          sizeof(ipi_param), 0);
> >
> > We're not holding the pm_runtime enable count here
> > (pm_runtime_get_sync() wasn't called), so rproc_shutdown() might have
> > been called. Wouldn't that affect the ability for this IPI to run?
> >
> > We had a related discussion with Jerry on the FD series and I think
> > the conclusion is:
> > a) if there is any state that needs to be preserved between jobs, that
> > would be cleared by rproc_shutdown() then we need to call
> > rproc_boot/shutdown() when we start/stop streaming.
> > b) it there is no such state, we can keep them inside runtime PM
> > callbacks, but we need to call pm_runtime_get_sync() before sending an
> > IPI and pm_runtime_mark_last_busy() + pm_runtime_put_autosuspend()
> > after the SCP signals completion. In this case the runtime PM
> > autosuspend delay should be set to around 2-3 times the delay needed
> > for rproc_shutdown() + rproc_boot() to complete.
>
> Since each IMG_IPI_FRAME command is stateless, I would like to
> use pm_runtime_get_sync()/ pm_runtime_mark_last_busy()/
> pm_runtime_put_autosuspend() to fix this issue (solution b).

What does IMG_IPI_INIT do then? Do we need it at all?

I'm worried about the fact that we call rproc_boot(), IMG_IPI_INIT and
then rproc_shutdown(). The latter can completely shutdown the SCP and
clear any state there. How would the effects of IMG_IPI_INIT be
preserved until IMG_IPI_FRAME is called?

Best regards,
Tomasz
