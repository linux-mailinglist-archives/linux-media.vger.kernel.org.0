Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5C7F4A9DAB
	for <lists+linux-media@lfdr.de>; Thu,  5 Sep 2019 11:00:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731794AbfIEJAc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 Sep 2019 05:00:32 -0400
Received: from mail-ed1-f66.google.com ([209.85.208.66]:39684 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726231AbfIEJAc (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 5 Sep 2019 05:00:32 -0400
Received: by mail-ed1-f66.google.com with SMTP id u6so1919352edq.6
        for <linux-media@vger.kernel.org>; Thu, 05 Sep 2019 02:00:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dr4pHmSbqe8BWrRQh4f+8Z19xbBALuiWZmuc5+cRwSA=;
        b=N+BMQkP3QqTkvqLo+EcuPIVYJckeqq9bSRoz0BzotfagDCNrtzKCjLkr30aS0dzOSO
         MTzbf55qcGOEw7kCvHI/7OWISUdJmAc6vgOuzppMXxUTyMG1OeSdBtVOhGIeeS6IPdj5
         gT58JuSqIqaK7d7xgkbGcg5k0XvK2QTKqllRo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dr4pHmSbqe8BWrRQh4f+8Z19xbBALuiWZmuc5+cRwSA=;
        b=mlIDzss/XmDpaclFrJI+/p9o9K0Kg7bzqdY4yGAfHql3T+3hzvqcsKmFiGb6CXh7T9
         KXu8XNgZ89GuPy9VLr8+lMCMxCiQ/AlCQ5c8c3oWuuVDa6DCegGo/y8SlPuNddS2vVwe
         jz+G0P9ukd7wWwJgyct8OAVafnEgJLlm3u4E5qhoX53by4oWxYuDsFeB3TF9g46O3tzR
         X1nDb+3c86L5B8bwxoUy/qOgL+MRGQyVgdQh7U4cSRsuWkWkMLnqqqOhaHUfVZPq3qWU
         3mmDPy4g+KSmY0GouaNPzDZy1WPi0aQ+4/COfDNAk0Dq9hc62eF7Y1nWxiOUCd+3ydDZ
         EKuA==
X-Gm-Message-State: APjAAAVUkcwdCuHWmskASwXS3xu/P0X5Vg9jte1YYzVx++r1Zx8oh5Ne
        J0ML9U0kmYsbymy0iwnoPC04qSv8GbyNyQ==
X-Google-Smtp-Source: APXvYqzDP2yKRjngjyTtdoEMVwb3quxCOB2OM2x9TogCEPOM+d1eN/T7ycs/XibyZNsXf2Zu62gkFg==
X-Received: by 2002:a17:906:85c8:: with SMTP id i8mr1894469ejy.178.1567674029442;
        Thu, 05 Sep 2019 02:00:29 -0700 (PDT)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com. [209.85.221.51])
        by smtp.gmail.com with ESMTPSA id a13sm168716ejj.23.2019.09.05.02.00.29
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Sep 2019 02:00:29 -0700 (PDT)
Received: by mail-wr1-f51.google.com with SMTP id h7so744439wrw.8
        for <linux-media@vger.kernel.org>; Thu, 05 Sep 2019 02:00:29 -0700 (PDT)
X-Received: by 2002:a5d:6585:: with SMTP id q5mr1530322wru.162.1567673580253;
 Thu, 05 Sep 2019 01:53:00 -0700 (PDT)
MIME-Version: 1.0
References: <1562661672-22439-1-git-send-email-Jerry-Ch.chen@mediatek.com>
 <1562661672-22439-5-git-send-email-Jerry-Ch.chen@mediatek.com>
 <20190802082815.GA203993@chromium.org> <1566724680.20680.8.camel@mtksdccf07>
 <CAAFQd5Dw+jaT-+LAUEVeB8W1zdnOgPw7u+aCfDWhYW1SfbzO8g@mail.gmail.com>
 <1566957625.20680.33.camel@mtksdccf07> <CAAFQd5D-Yg1FjUE_rwmqfS1gvfE0=MZ=r-ziueU_37-uo9QTbw@mail.gmail.com>
 <1567424859.18318.32.camel@mtksdccf07> <CAAFQd5AGgeFbto6V1KkL0dp1QPziOKV3pWQDU2OJ+S1QKvnBdg@mail.gmail.com>
 <1567493081.18318.49.camel@mtksdccf07> <CAAFQd5DWM=R7sFHYGhhR_rXrzgRnc4xtH_t8Pig-4tcP9KTSYg@mail.gmail.com>
 <1567511169.18318.65.camel@mtksdccf07> <CAAFQd5DiPcUxd+R-v_-BdRx+QqZ35Riii_jpgbqr5mc3BnQvDw@mail.gmail.com>
 <1567568281.18318.80.camel@mtksdccf07> <CAAFQd5CRC2cyV30B4Qv59HdrJ7Cpe_yK5aY-BecQQ3J3i0PtCQ@mail.gmail.com>
 <1567577389.18318.100.camel@mtksdccf07> <CAAFQd5AxTQPD+nP9CJs45QTzGHKssjv3vRtMqHONABfp12afYw@mail.gmail.com>
 <1567584577.22453.11.camel@mtksdccf07> <CAAFQd5Dzxy10g-MKHMnNbVO6kp9_L_jm1m+gtN+p=YF2LyBiag@mail.gmail.com>
 <1567587708.22453.15.camel@mtksdccf07> <CAAFQd5DWfEEiGthPi=qoxD-mpAWa68GOCi55mqpmagS-tsGYkA@mail.gmail.com>
 <1567589188.22453.24.camel@mtksdccf07> <CAAFQd5Ckz9qH7AnLNM4HRTM2gJQP1HXRS09+o6Prf++D1PQhng@mail.gmail.com>
 <1567603143.22453.27.camel@mtksdccf07> <1567666940.22453.31.camel@mtksdccf07>
 <CAAFQd5A=D33nUWTyYjt3acV43r3fqjSEkLbt3_Sr1YG1PzQgqQ@mail.gmail.com> <1567671418.22453.41.camel@mtksdccf07>
In-Reply-To: <1567671418.22453.41.camel@mtksdccf07>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Thu, 5 Sep 2019 17:52:47 +0900
X-Gmail-Original-Message-ID: <CAAFQd5D2ketE19RPr20BVYGhqg2Lh2ZNTtAr5J2GoWU9RiSAsA@mail.gmail.com>
Message-ID: <CAAFQd5D2ketE19RPr20BVYGhqg2Lh2ZNTtAr5J2GoWU9RiSAsA@mail.gmail.com>
Subject: Re: [RFC PATCH V2 4/4] platform: mtk-isp: Add Mediatek FD driver
To:     Jerry-ch Chen <Jerry-ch.Chen@mediatek.com>
Cc:     "yuzhao@chromium.org" <yuzhao@chromium.org>,
        "zwisler@chromium.org" <zwisler@chromium.org>,
        "linux-mediatek@lists.infradead.org" 
        <linux-mediatek@lists.infradead.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        =?UTF-8?B?U2VhbiBDaGVuZyAo6YSt5piH5byYKQ==?= 
        <Sean.Cheng@mediatek.com>,
        =?UTF-8?B?U2ogSHVhbmcgKOm7g+S/oeeSiyk=?= <sj.huang@mediatek.com>,
        =?UTF-8?B?Q2hyaXN0aWUgWXUgKOa4uOmbheaDoCk=?= 
        <christie.yu@mediatek.com>,
        =?UTF-8?B?RnJlZGVyaWMgQ2hlbiAo6Zmz5L+K5YWDKQ==?= 
        <Frederic.Chen@mediatek.com>,
        =?UTF-8?B?SnVuZ28gTGluICjmnpfmmI7kv4op?= <jungo.lin@mediatek.com>,
        =?UTF-8?B?UnlubiBXdSAo5ZCz6IKy5oGpKQ==?= <Rynn.Wu@mediatek.com>,
        =?UTF-8?B?UG8tWWFuZyBIdWFuZyAo6buD5p+P6Zm9KQ==?= 
        <po-yang.huang@mediatek.com>,
        "shik@chromium.org" <shik@chromium.org>,
        "suleiman@chromium.org" <suleiman@chromium.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        srv_heupstream <srv_heupstream@mediatek.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "laurent.pinchart+renesas@ideasonboard.com" 
        <laurent.pinchart+renesas@ideasonboard.com>,
        "hans.verkuil@cisco.com" <hans.verkuil@cisco.com>,
        "mchehab@kernel.org" <mchehab@kernel.org>,
        "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Sep 5, 2019 at 5:17 PM Jerry-ch Chen <Jerry-ch.Chen@mediatek.com> wrote:
>
> Hi Tomasz,
>
> On Thu, 2019-09-05 at 15:13 +0800, Tomasz Figa wrote:
> > On Thu, Sep 5, 2019 at 4:02 PM Jerry-ch Chen <Jerry-ch.Chen@mediatek.com> wrote:
> > >
> > > Hi Tomasz,
> > >
> > > On Wed, 2019-09-04 at 21:19 +0800, Jerry-ch Chen wrote:
> > > > On Wed, 2019-09-04 at 21:12 +0800, Tomasz Figa wrote:
> > > > > On Wed, Sep 4, 2019 at 6:26 PM Jerry-ch Chen <Jerry-ch.Chen@mediatek.com> wrote:
> > > > > >
> > > > > > Hi Tomasz,
> > > > > >
> > > > > > On Wed, 2019-09-04 at 17:03 +0800, Tomasz Figa wrote:
> > > > > > > On Wed, Sep 4, 2019 at 6:02 PM Jerry-ch Chen <Jerry-ch.Chen@mediatek.com> wrote:
> > > > > > > >
> > > > > > > > Hi Tomasz,
> > > > > > > >
> > > > > > > > On Wed, 2019-09-04 at 16:25 +0800, Tomasz Figa wrote:
> > > > > > > > > On Wed, Sep 4, 2019 at 5:09 PM Jerry-ch Chen <Jerry-ch.Chen@mediatek.com> wrote:
> > > > > > > > > >
> > > > > > > > > > Hi Tomasz,
> > > > > > > > > >
> > > > > > > > > > On Wed, 2019-09-04 at 14:34 +0800, Tomasz Figa wrote:
> > > > > > > > > > > On Wed, Sep 4, 2019 at 3:09 PM Jerry-ch Chen <Jerry-ch.Chen@mediatek.com> wrote:
> > > > > > > > > > > >
> > > > > > > > > > > > Hi Tomasz,
> > > > > > > > > > > >
> > > > > > > > > > > > On Wed, 2019-09-04 at 12:15 +0800, Tomasz Figa wrote:
> > > > > > > > > > > > > On Wed, Sep 4, 2019 at 12:38 PM Jerry-ch Chen
> > > > > > > > > > > > > <Jerry-ch.Chen@mediatek.com> wrote:
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > Hi Tomasz,
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > On Tue, 2019-09-03 at 20:05 +0800, Tomasz Figa wrote:
> > > > > > > > > > > > > > > On Tue, Sep 3, 2019 at 8:46 PM Jerry-ch Chen <Jerry-ch.Chen@mediatek.com> wrote:
> > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > Hi Tomasz,
> > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > On Tue, 2019-09-03 at 15:04 +0800, Tomasz Figa wrote:
> > > > > > > > > > > > > > > > > On Tue, Sep 3, 2019 at 3:44 PM Jerry-ch Chen <Jerry-ch.Chen@mediatek.com> wrote:
> > > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > > On Tue, 2019-09-03 at 13:19 +0800, Tomasz Figa wrote:
> > > > > > > > > > > > > > > > > > > On Mon, Sep 2, 2019 at 8:47 PM Jerry-ch Chen <Jerry-ch.Chen@mediatek.com> wrote:
> > > > > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > > > > Hi Tomasz,
> > > > > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > > > > On Fri, 2019-08-30 at 16:33 +0800, Tomasz Figa wrote:
> > > > > > > > > > > > > > > > > > > > > On Wed, Aug 28, 2019 at 11:00 AM Jerry-ch Chen
> > > > > > > > > > > > > > > > > > > > > <Jerry-ch.Chen@mediatek.com> wrote:
> > > > > > > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > > > > > > Hi Tomasz,
> > > > > > > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > > > > > > On Mon, 2019-08-26 at 14:36 +0800, Tomasz Figa wrote:
> > > > > > > > > > > > > > > > > > > > > > > Hi Jerry,
> > > > > > > > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > > > > > > > On Sun, Aug 25, 2019 at 6:18 PM Jerry-ch Chen
> > > > > > > > > > > > > > > > > > > > > > > <Jerry-ch.Chen@mediatek.com> wrote:
> > > > > > > > > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > > > > > > > > Hi Tomasz,
> > > > > > > > > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > > > > > > > > On Fri, 2019-08-02 at 16:28 +0800, Tomasz Figa wrote:
> > > > > > > > > > > > > > > > > > > > > > > > > Hi Jerry,
> > > > > > > > > > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > > > > > > > > > On Tue, Jul 09, 2019 at 04:41:12PM +0800, Jerry-ch Chen wrote:
> > > > > > [snip]
> > > > > > > > > > static void mtk_fd_vb2_stop_streaming(struct vb2_queue *vq)
> > > > > > > > > > {
> > > > > > > > > >         struct mtk_fd_ctx *ctx = vb2_get_drv_priv(vq);
> > > > > > > > > >         struct mtk_fd_dev *fd = ctx->fd_dev;
> > > > > > > > > >         struct vb2_v4l2_buffer *vb;
> > > > > > > > > >         struct v4l2_m2m_ctx *m2m_ctx = ctx->fh.m2m_ctx;
> > > > > > > > > >         struct v4l2_m2m_queue_ctx *queue_ctx;
> > > > > > > > > >         u32 ret;
> > > > > > > > > >
> > > > > > > > > >         if (!fd->fd_irq_done.done)
> > > > > > > > >
> > > > > > > > > We shouldn't access internal fields of completion.
> > > > > > > > >
> > > > > > > > > >                 ret = wait_for_completion_timeout(&fd->fd_irq_done,
> > > > > > > > > >                                                   msecs_to_jiffies(
> > > > > > > > > >                                                         MTK_FD_HW_TIMEOUT));
> > > > > > > > > >         queue_ctx = V4L2_TYPE_IS_OUTPUT(vq->type) ?
> > > > > > > > > >                                         &m2m_ctx->out_q_ctx :
> > > > > > > > > >                                         &m2m_ctx->cap_q_ctx;
> > > > > > > > > >         while ((vb = v4l2_m2m_buf_remove(queue_ctx)))
> > > > > > > > > >                 v4l2_m2m_buf_done(vb, VB2_BUF_STATE_ERROR);
> > > > > > > > > >
> > > > > > > > > >         if (vq->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
> > > > > > > > > >                 mtk_fd_hw_disconnect(fd);
> > > > > > > > > > }
> > > > > > > > > >
> > > > > > > > > > I've also tried to wait completion unconditionally for both queues and
> > > > > > > > > > the second time will wait until timeout, as a result, it takes longer to
> > > > > > > > > > swap the camera every time and close the camera app.
> > > > > > > > >
> > > > > > > > > I think it should work better if we call complete_all() instead of complete().
> > > > > > > > >
> > > > > > > > Thanks,
> > > > > > > >
> > > > > > > > I use complete_all(), and it works fine now.
> > > > > > > >
> > > > > > > > static void mtk_fd_vb2_stop_streaming(struct vb2_queue *vq)
> > > > > > > > {
> > > > > > > >         struct mtk_fd_ctx *ctx = vb2_get_drv_priv(vq);
> > > > > > > >         struct mtk_fd_dev *fd = ctx->fd_dev;
> > > > > > > >         struct vb2_v4l2_buffer *vb;
> > > > > > > >         struct v4l2_m2m_ctx *m2m_ctx = ctx->fh.m2m_ctx;
> > > > > > > >         struct v4l2_m2m_queue_ctx *queue_ctx;
> > > > > > > >
> > > > > > > >         wait_for_completion_timeout(&fd->fd_irq_done,
> > > > > > > >                                           msecs_to_jiffies(MTK_FD_HW_TIMEOUT));
> > > > > > >
> > > > > > > Shouldn't we still send some command to the hardware to stop? Like a
> > > > > > > reset. Otherwise we don't know if it isn't still accessing the memory.
> > > > > > >
> > > > > > I thought no more jobs will be enqueued here when stop_streaming so we
> > > > > > don't need it.
> > > > >
> > > > > That's true for the case when the wait completed successfully, but we
> > > > > also need to ensure the hardware is stopped even if a timeout happens.
> > > > >
> > > > > > We still could send an ipi command to reset the HW, and wait for it's
> > > > > > callback or we could set the register MTK_FD_REG_OFFSET_HW_ENABLE to
> > > > > > zero to disable the HW.
> > > > >
> > > > > Since it's for handling a timeout, a reset should be more likely to
> > > > > bring the hardware back to a reasonable state.
> > > > >
> > > >
> > > > Ok, I will send the ipi command to reset the HW.
> > > >
> > > > Thanks and best regards,
> > > > Jerry
> > > I've tested and will refine as following:
> > >
> > > static void mtk_fd_vb2_stop_streaming(struct vb2_queue *vq)
> > > {
> > >         struct mtk_fd_ctx *ctx = vb2_get_drv_priv(vq);
> > >         struct mtk_fd_dev *fd = ctx->fd_dev;
> > >         struct vb2_v4l2_buffer *vb;
> > >         struct v4l2_m2m_ctx *m2m_ctx = ctx->fh.m2m_ctx;
> > >         struct v4l2_m2m_queue_ctx *queue_ctx;
> > >         u32 ret;
> > >
> > >         ret = wait_for_completion_timeout(&fd->fd_irq_done,
> > >                                           msecs_to_jiffies(MTK_FD_HW_TIMEOUT));
> > >         /* Disable FD HW */
> > >         if(!ret) {
> > >                 struct ipi_message fd_ipi_msg;
> > >
> > >                 fd_ipi_msg.cmd_id = MTK_FD_IPI_CMD_RESET;
> > >                 ret = scp_ipi_send(fd->scp_pdev, SCP_IPI_FD_CMD, &fd_ipi_msg,
> > >                                    sizeof(fd_ipi_msg), MTK_FD_IPI_SEND_TIMEOUT);
> > >                 if (ret)
> > >                         dev_err(fd->dev, "FD Reset HW error\n");
> > >         }
> >
> > Would you also put the same code in suspend handler? If so, perhaps
> > it's better to keep this in a helper function (mtk_fd_job_abort()) as
> > we had before?
> >
>
> Ok, done, It will reset the HW and return ETIMEOUT if the last job is
> timeout, the return value will be used in suspend for further action.
>
> static int mtk_fd_job_abort(struct mtk_fd_dev *fd)
> {
>         u32 ret;
>
>         ret = wait_for_completion_timeout(&fd->fd_irq_done,
>                                           msecs_to_jiffies(MTK_FD_HW_TIMEOUT));
>         /* Reset FD HW */
>         if (!ret) {
>                 struct ipi_message fd_ipi_msg;
>
>                 fd_ipi_msg.cmd_id = MTK_FD_IPI_CMD_RESET;
>                 if (scp_ipi_send(fd->scp_pdev, SCP_IPI_FD_CMD, &fd_ipi_msg,
>                                  sizeof(fd_ipi_msg), MTK_FD_IPI_SEND_TIMEOUT))
>                         dev_err(fd->dev, "FD Reset HW error\n");
>                 return -ETIMEDOUT;
>         }
>         return 0;
> }
>
> static void mtk_fd_vb2_stop_streaming(struct vb2_queue *vq)
> {
>         struct mtk_fd_ctx *ctx = vb2_get_drv_priv(vq);
>         struct mtk_fd_dev *fd = ctx->fd_dev;
>         struct vb2_v4l2_buffer *vb;
>         struct v4l2_m2m_ctx *m2m_ctx = ctx->fh.m2m_ctx;
>         struct v4l2_m2m_queue_ctx *queue_ctx;
>
>         mtk_fd_job_abort(fd);
>         queue_ctx = V4L2_TYPE_IS_OUTPUT(vq->type) ?
>                                         &m2m_ctx->out_q_ctx :
>                                         &m2m_ctx->cap_q_ctx;
>         while ((vb = v4l2_m2m_buf_remove(queue_ctx)))
>                 v4l2_m2m_buf_done(vb, VB2_BUF_STATE_ERROR);
>
>         if (vq->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
>                 mtk_fd_hw_disconnect(fd);
> }
>
> static int mtk_fd_suspend(struct device *dev)
> {
>         struct mtk_fd_dev *fd = dev_get_drvdata(dev);
>
>         if (pm_runtime_suspended(dev))
>                 return 0;
>
>         if (fd->fd_stream_count)
>                 if (mtk_fd_job_abort(fd))
>                         mtk_fd_hw_job_finish(fd, VB2_BUF_STATE_ERROR);

Wouldn't this cause the next job to be run?

>
>         /* suspend FD HW */
>         writel(0x0, fd->fd_base + MTK_FD_REG_OFFSET_INT_EN);
>         writel(0x0, fd->fd_base + MTK_FD_REG_OFFSET_HW_ENABLE);
>         clk_disable_unprepare(fd->fd_clk);
>         dev_dbg(dev, "%s:disable clock\n", __func__);
>
>         return 0;
> }
>
> > >         queue_ctx = V4L2_TYPE_IS_OUTPUT(vq->type) ?
> > >                                         &m2m_ctx->out_q_ctx :
> > >                                         &m2m_ctx->cap_q_ctx;
> > >         while ((vb = v4l2_m2m_buf_remove(queue_ctx)))
> > >                 v4l2_m2m_buf_done(vb, VB2_BUF_STATE_ERROR);
> > >
> > >         if (vq->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
> > >                 mtk_fd_hw_disconnect(fd);
> > > }
> > >
> > > If there is no other concern, may I send the RFC v3 patch for review?
> >
> > Thanks, technically it looks good now. Just one comment about avoiding
> > code duplication above.
> >
>
> Thanks,
>
> I will send the v3 if the above fix-up is accepted,

I think there is a bigger issue here actually, related to how the m2m
helpers work. Let's just keep the code as you proposed and post v3.

We can continue the discussion there.

Best regards,
Tomasz
