Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3D6E5A8430
	for <lists+linux-media@lfdr.de>; Wed,  4 Sep 2019 15:49:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730135AbfIDNNH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 4 Sep 2019 09:13:07 -0400
Received: from mail-ed1-f67.google.com ([209.85.208.67]:41156 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727722AbfIDNNH (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 4 Sep 2019 09:13:07 -0400
Received: by mail-ed1-f67.google.com with SMTP id z9so17120089edq.8
        for <linux-media@vger.kernel.org>; Wed, 04 Sep 2019 06:13:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MOV4cHwCeXmCSAFYb8khVqjm5n/Qa64rF9TWXojizKk=;
        b=PJ0fgm8dX3lI+ptfzwJhpzD5dViSsoSfH04P0c8+uQF9GmGmqOfGKHBsEbf1DZdmh4
         90GpHGsJHCeUhKZ+tT+3PuaIkK38Nml2mbUWGZ78/iQhiyLGYkcpP+DFxlQJbR4+u3C3
         Z1UjBOmgLjevM+8mMGDEELdpLHigvnd4v0flU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MOV4cHwCeXmCSAFYb8khVqjm5n/Qa64rF9TWXojizKk=;
        b=bSFMczWyVnxJonLEDnSIDxVbSRJGCB/G7SyliobFbDCTo3DpEe6RvqLBrJJg70i5T8
         whpMq6K67m2zps04sP19VoBzgpqNcJavfefTM1eYQColnMxhoYDzQCTtCxuImQXDnO3s
         2RTy7UDak7gUr66Cvl2kM9Le1pbeG1vu17rl7keTI9TS0zLW8OirkCeYAFscjUeagdNP
         aDJ4b21BEoEziajj+f2p4zPPKPU5JIqLGo1EYQa0gc/pEpzXX0u3CulL4nWbCGH5NSx0
         G26U5Z9d0dUoD5OdAqAdt5WfxlqP11yvMX6pVKwZiANdXYziP8wpeVUmHt5oa5NBDZv2
         juOQ==
X-Gm-Message-State: APjAAAV1IRZndMLw4luaILvp3vaEmeQlEoUN+Jy0DzUk1a8/mfCYK71s
        Pb173vBmVxPjd87QaxBx0R/jXX2OWSGmBg==
X-Google-Smtp-Source: APXvYqzseLgewbeMHDCbqPn5jAx+nYQwmGwenx0dcFjo0NDPegrQGV0KrS2Y6uA2LaZp1NlanR61og==
X-Received: by 2002:a17:906:4a46:: with SMTP id a6mr8993025ejv.184.1567602784423;
        Wed, 04 Sep 2019 06:13:04 -0700 (PDT)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com. [209.85.128.54])
        by smtp.gmail.com with ESMTPSA id mh8sm1356776ejb.74.2019.09.04.06.13.02
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Sep 2019 06:13:03 -0700 (PDT)
Received: by mail-wm1-f54.google.com with SMTP id p13so3710589wmh.1
        for <linux-media@vger.kernel.org>; Wed, 04 Sep 2019 06:13:02 -0700 (PDT)
X-Received: by 2002:a1c:c012:: with SMTP id q18mr2592884wmf.116.1567602782491;
 Wed, 04 Sep 2019 06:13:02 -0700 (PDT)
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
 <1567589188.22453.24.camel@mtksdccf07>
In-Reply-To: <1567589188.22453.24.camel@mtksdccf07>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Wed, 4 Sep 2019 22:12:51 +0900
X-Gmail-Original-Message-ID: <CAAFQd5Ckz9qH7AnLNM4HRTM2gJQP1HXRS09+o6Prf++D1PQhng@mail.gmail.com>
Message-ID: <CAAFQd5Ckz9qH7AnLNM4HRTM2gJQP1HXRS09+o6Prf++D1PQhng@mail.gmail.com>
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

On Wed, Sep 4, 2019 at 6:26 PM Jerry-ch Chen <Jerry-ch.Chen@mediatek.com> wrote:
>
> Hi Tomasz,
>
> On Wed, 2019-09-04 at 17:03 +0800, Tomasz Figa wrote:
> > On Wed, Sep 4, 2019 at 6:02 PM Jerry-ch Chen <Jerry-ch.Chen@mediatek.com> wrote:
> > >
> > > Hi Tomasz,
> > >
> > > On Wed, 2019-09-04 at 16:25 +0800, Tomasz Figa wrote:
> > > > On Wed, Sep 4, 2019 at 5:09 PM Jerry-ch Chen <Jerry-ch.Chen@mediatek.com> wrote:
> > > > >
> > > > > Hi Tomasz,
> > > > >
> > > > > On Wed, 2019-09-04 at 14:34 +0800, Tomasz Figa wrote:
> > > > > > On Wed, Sep 4, 2019 at 3:09 PM Jerry-ch Chen <Jerry-ch.Chen@mediatek.com> wrote:
> > > > > > >
> > > > > > > Hi Tomasz,
> > > > > > >
> > > > > > > On Wed, 2019-09-04 at 12:15 +0800, Tomasz Figa wrote:
> > > > > > > > On Wed, Sep 4, 2019 at 12:38 PM Jerry-ch Chen
> > > > > > > > <Jerry-ch.Chen@mediatek.com> wrote:
> > > > > > > > >
> > > > > > > > > Hi Tomasz,
> > > > > > > > >
> > > > > > > > > On Tue, 2019-09-03 at 20:05 +0800, Tomasz Figa wrote:
> > > > > > > > > > On Tue, Sep 3, 2019 at 8:46 PM Jerry-ch Chen <Jerry-ch.Chen@mediatek.com> wrote:
> > > > > > > > > > >
> > > > > > > > > > > Hi Tomasz,
> > > > > > > > > > >
> > > > > > > > > > > On Tue, 2019-09-03 at 15:04 +0800, Tomasz Figa wrote:
> > > > > > > > > > > > On Tue, Sep 3, 2019 at 3:44 PM Jerry-ch Chen <Jerry-ch.Chen@mediatek.com> wrote:
> > > > > > > > > > > > >
> > > > > > > > > > > > > On Tue, 2019-09-03 at 13:19 +0800, Tomasz Figa wrote:
> > > > > > > > > > > > > > On Mon, Sep 2, 2019 at 8:47 PM Jerry-ch Chen <Jerry-ch.Chen@mediatek.com> wrote:
> > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > Hi Tomasz,
> > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > On Fri, 2019-08-30 at 16:33 +0800, Tomasz Figa wrote:
> > > > > > > > > > > > > > > > On Wed, Aug 28, 2019 at 11:00 AM Jerry-ch Chen
> > > > > > > > > > > > > > > > <Jerry-ch.Chen@mediatek.com> wrote:
> > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > Hi Tomasz,
> > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > On Mon, 2019-08-26 at 14:36 +0800, Tomasz Figa wrote:
> > > > > > > > > > > > > > > > > > Hi Jerry,
> > > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > > On Sun, Aug 25, 2019 at 6:18 PM Jerry-ch Chen
> > > > > > > > > > > > > > > > > > <Jerry-ch.Chen@mediatek.com> wrote:
> > > > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > > > Hi Tomasz,
> > > > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > > > On Fri, 2019-08-02 at 16:28 +0800, Tomasz Figa wrote:
> > > > > > > > > > > > > > > > > > > > Hi Jerry,
> > > > > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > > > > On Tue, Jul 09, 2019 at 04:41:12PM +0800, Jerry-ch Chen wrote:
> [snip]
> > > > > static void mtk_fd_vb2_stop_streaming(struct vb2_queue *vq)
> > > > > {
> > > > >         struct mtk_fd_ctx *ctx = vb2_get_drv_priv(vq);
> > > > >         struct mtk_fd_dev *fd = ctx->fd_dev;
> > > > >         struct vb2_v4l2_buffer *vb;
> > > > >         struct v4l2_m2m_ctx *m2m_ctx = ctx->fh.m2m_ctx;
> > > > >         struct v4l2_m2m_queue_ctx *queue_ctx;
> > > > >         u32 ret;
> > > > >
> > > > >         if (!fd->fd_irq_done.done)
> > > >
> > > > We shouldn't access internal fields of completion.
> > > >
> > > > >                 ret = wait_for_completion_timeout(&fd->fd_irq_done,
> > > > >                                                   msecs_to_jiffies(
> > > > >                                                         MTK_FD_HW_TIMEOUT));
> > > > >         queue_ctx = V4L2_TYPE_IS_OUTPUT(vq->type) ?
> > > > >                                         &m2m_ctx->out_q_ctx :
> > > > >                                         &m2m_ctx->cap_q_ctx;
> > > > >         while ((vb = v4l2_m2m_buf_remove(queue_ctx)))
> > > > >                 v4l2_m2m_buf_done(vb, VB2_BUF_STATE_ERROR);
> > > > >
> > > > >         if (vq->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
> > > > >                 mtk_fd_hw_disconnect(fd);
> > > > > }
> > > > >
> > > > > I've also tried to wait completion unconditionally for both queues and
> > > > > the second time will wait until timeout, as a result, it takes longer to
> > > > > swap the camera every time and close the camera app.
> > > >
> > > > I think it should work better if we call complete_all() instead of complete().
> > > >
> > > Thanks,
> > >
> > > I use complete_all(), and it works fine now.
> > >
> > > static void mtk_fd_vb2_stop_streaming(struct vb2_queue *vq)
> > > {
> > >         struct mtk_fd_ctx *ctx = vb2_get_drv_priv(vq);
> > >         struct mtk_fd_dev *fd = ctx->fd_dev;
> > >         struct vb2_v4l2_buffer *vb;
> > >         struct v4l2_m2m_ctx *m2m_ctx = ctx->fh.m2m_ctx;
> > >         struct v4l2_m2m_queue_ctx *queue_ctx;
> > >
> > >         wait_for_completion_timeout(&fd->fd_irq_done,
> > >                                           msecs_to_jiffies(MTK_FD_HW_TIMEOUT));
> >
> > Shouldn't we still send some command to the hardware to stop? Like a
> > reset. Otherwise we don't know if it isn't still accessing the memory.
> >
> I thought no more jobs will be enqueued here when stop_streaming so we
> don't need it.

That's true for the case when the wait completed successfully, but we
also need to ensure the hardware is stopped even if a timeout happens.

> We still could send an ipi command to reset the HW, and wait for it's
> callback or we could set the register MTK_FD_REG_OFFSET_HW_ENABLE to
> zero to disable the HW.

Since it's for handling a timeout, a reset should be more likely to
bring the hardware back to a reasonable state.

>
> Best regards,
> Jerry
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
> > > Best regards,
> > > Jerry
> > >
> > > > Best regards,
> > > > Tomasz
> > >
> > >
>
>
