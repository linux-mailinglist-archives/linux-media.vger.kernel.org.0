Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3BC68A6071
	for <lists+linux-media@lfdr.de>; Tue,  3 Sep 2019 07:19:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726450AbfICFTs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 3 Sep 2019 01:19:48 -0400
Received: from mail-ed1-f67.google.com ([209.85.208.67]:38236 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725886AbfICFTr (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 3 Sep 2019 01:19:47 -0400
Received: by mail-ed1-f67.google.com with SMTP id r12so17295749edo.5
        for <linux-media@vger.kernel.org>; Mon, 02 Sep 2019 22:19:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nRWk1hiNsgYKDx0eHOI6vp6cA2gI01WBhMOu+BZ2jiE=;
        b=XRznKuQFypiCThT4oXIQSIBA7FNl2mvcrR0pkBLgUBKjwgIbdfglCn2WZbp2oaWnie
         5SIqUtqyGftLXp4KNEyzDy+t+MhsoDwqHd6t0wZtQfXgYzkn6fX17iHhLPhI3hNOVr1g
         58lg3a5A2vXrMBrASbA4h4/L+NJVUmauuvOvQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nRWk1hiNsgYKDx0eHOI6vp6cA2gI01WBhMOu+BZ2jiE=;
        b=gEVwnnUI73Ohmd81sjGe6LLebprXnj42ERSTLztqRDkHSYEWhiHSht1LAm8vuOrXlj
         v1GStusqfZleST6+pF68GuPiGhB4rQWDYSA/o5uMC9TQcuD0BMP7dJnqIjYWFmoXl0eI
         QPWhGvu0PrUfmIFxH7tlwMSPd9Gwnurt7OJv1hSkPoiKblaRbpUtij3SCDUd2oHEpIDJ
         L1U4V8A/otkiSvBnCzTQxgkHMkWBJsx4ND3lhn70YggpveMony187GjNK81ER+j1xYgi
         tL4n12nIQf2OjxlmTQNpAoFTGiyNn+aM1E5gn/ls+8zD7mQY0jsFD2mGMhpdSy509IUr
         HRmw==
X-Gm-Message-State: APjAAAXlejyLVvgnOp+Wot0H19yO2/816ozrwh8yg3rqPy2SHfrHU/Wx
        dfs2TzaafgsqTFlRRRE2lp7sJLZU6Ni0oA==
X-Google-Smtp-Source: APXvYqyghaL9sfAnsQeRnlU0qoNIINXhjy5x12IQ1IMYGPCN5rt2OUNAJVETChu+iI6pogsnUY5DnA==
X-Received: by 2002:a17:906:6dd4:: with SMTP id j20mr27269992ejt.173.1567487985506;
        Mon, 02 Sep 2019 22:19:45 -0700 (PDT)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com. [209.85.128.43])
        by smtp.gmail.com with ESMTPSA id p11sm19345edh.77.2019.09.02.22.19.45
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Sep 2019 22:19:45 -0700 (PDT)
Received: by mail-wm1-f43.google.com with SMTP id k1so16537679wmi.1
        for <linux-media@vger.kernel.org>; Mon, 02 Sep 2019 22:19:45 -0700 (PDT)
X-Received: by 2002:a1c:f704:: with SMTP id v4mr28499086wmh.90.1567487984880;
 Mon, 02 Sep 2019 22:19:44 -0700 (PDT)
MIME-Version: 1.0
References: <1562661672-22439-1-git-send-email-Jerry-Ch.chen@mediatek.com>
 <1562661672-22439-5-git-send-email-Jerry-Ch.chen@mediatek.com>
 <20190802082815.GA203993@chromium.org> <1566724680.20680.8.camel@mtksdccf07>
 <CAAFQd5Dw+jaT-+LAUEVeB8W1zdnOgPw7u+aCfDWhYW1SfbzO8g@mail.gmail.com>
 <1566957625.20680.33.camel@mtksdccf07> <CAAFQd5D-Yg1FjUE_rwmqfS1gvfE0=MZ=r-ziueU_37-uo9QTbw@mail.gmail.com>
 <1567424859.18318.32.camel@mtksdccf07>
In-Reply-To: <1567424859.18318.32.camel@mtksdccf07>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Tue, 3 Sep 2019 14:19:32 +0900
X-Gmail-Original-Message-ID: <CAAFQd5AGgeFbto6V1KkL0dp1QPziOKV3pWQDU2OJ+S1QKvnBdg@mail.gmail.com>
Message-ID: <CAAFQd5AGgeFbto6V1KkL0dp1QPziOKV3pWQDU2OJ+S1QKvnBdg@mail.gmail.com>
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

On Mon, Sep 2, 2019 at 8:47 PM Jerry-ch Chen <Jerry-ch.Chen@mediatek.com> wrote:
>
> Hi Tomasz,
>
> On Fri, 2019-08-30 at 16:33 +0800, Tomasz Figa wrote:
> > On Wed, Aug 28, 2019 at 11:00 AM Jerry-ch Chen
> > <Jerry-ch.Chen@mediatek.com> wrote:
> > >
> > > Hi Tomasz,
> > >
> > > On Mon, 2019-08-26 at 14:36 +0800, Tomasz Figa wrote:
> > > > Hi Jerry,
> > > >
> > > > On Sun, Aug 25, 2019 at 6:18 PM Jerry-ch Chen
> > > > <Jerry-ch.Chen@mediatek.com> wrote:
> > > > >
> > > > > Hi Tomasz,
> > > > >
> > > > > On Fri, 2019-08-02 at 16:28 +0800, Tomasz Figa wrote:
> > > > > > Hi Jerry,
> > > > > >
> > > > > > On Tue, Jul 09, 2019 at 04:41:12PM +0800, Jerry-ch Chen wrote:
[snip]
> > > static int mtk_fd_vb2_queue_setup(struct vb2_queue *vq,
> > >                                   unsigned int *num_buffers,
> > >                                   unsigned int *num_planes,
> > >                                   unsigned int sizes[],
> > >                                   struct device *alloc_devs[])
> > > {
> > >         struct mtk_fd_ctx *ctx = vb2_get_drv_priv(vq);
> > >         struct device *dev = ctx->dev;
> > >         unsigned int size[2];
> > >
> > >         switch (vq->type) {
> > >         case V4L2_BUF_TYPE_META_CAPTURE:
> > >                 size[0] = ctx->dst_fmt.buffersize;
> > >                 break;
> > >         case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
> > >                 size[0] = ctx->src_fmt.plane_fmt[0].sizeimage;
> > >                 if (*num_planes == 2)
> > >                         size[1] = ctx->src_fmt.plane_fmt[1].sizeimage;
> > >                 break;
> > >         }
> > >
> > >         if (*num_planes == 1) {
> > >                 if (sizes[0] < size[0])
> > >                         return -EINVAL;
> > >         } else if (*num_planes == 2) {
> > >                 if ((sizes[0] < size[0]) && (sizes[1] < size[1]))
> > >                         return -EINVAL;
> >
> > Can we just use a loop here and combine the 2 cases above?
> >
> > Also, we need to fail with -EINVAL if *num_planes is > 2.
> >
> > >         } else {
> > >                 *num_planes = 1;
> > >                 sizes[0] = size[0];
> >
> > This should be the case if *num_planes == 0 and the number of planes
> > and sizes should match the currently active format.
> >
> I appreciate your comments,
>
> Ok, I will update as following:
> static int mtk_fd_vb2_queue_setup(struct vb2_queue *vq,
>                                   unsigned int *num_buffers,
>                                   unsigned int *num_planes,
>                                   unsigned int sizes[],
>                                   struct device *alloc_devs[])
> {
>         struct mtk_fd_ctx *ctx = vb2_get_drv_priv(vq);
>         unsigned int size[2];
>         unsigned int plane;
>
>         switch (vq->type) {
>         case V4L2_BUF_TYPE_META_CAPTURE:
>                 size[0] = ctx->dst_fmt.buffersize;
>                 break;
>         case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
>                 size[0] = ctx->src_fmt.plane_fmt[0].sizeimage;
>                 if (*num_planes == 2)
>                         size[1] = ctx->src_fmt.plane_fmt[1].sizeimage;
>                 break;
>         }
>
>         if (*num_planes > 2)
>                 return -EINVAL;
>         if (*num_planes == 0) {
>                 if (vq->type == V4L2_BUF_TYPE_META_CAPTURE) {
>                         sizes[0] = ctx->dst_fmt.buffersize;
>                         *num_planes = 1;
>                         return 0;
>                 }
>
>                 *num_planes = ctx->src_fmt.num_planes;
>                 for (plane = 0; plane < *num_planes; plane++)
>                         sizes[plane] = ctx->src_fmt.plane_fmt[plane].sizeimage;
>                 return 0;
>         }
>
>         for (plane = 0; plane < *num_planes; plane++) {
>                 if(sizes[plane] < size[plane])
>                         return -EINVAL;
>         }
>         return 0;
> }
>

Looks good, thanks!

> > >         }
> > >
> > >         return 0;
> > > }
> > >
> > > > [snip]
> > > >
> > > > > > > +static void mtk_fd_vb2_stop_streaming(struct vb2_queue *vq)
> > > > > > > +{
> > > > > > > +   struct mtk_fd_ctx *ctx = vb2_get_drv_priv(vq);
> > > > > > > +   struct vb2_buffer *vb;
> > > > > >
> > > > > > How do we guarantee here that the hardware isn't still accessing the buffers
> > > > > > removed below?
> > > > > >
> > > > > Maybe we can check the driver state flag and aborting the unfinished
> > > > > jobs?
> > > > > (fd_hw->state == FD_ENQ)
> > > > >
> > > >
> > > > Yes, we need to either cancel or wait for the currently processing
> > > > job. It depends on hardware capabilities, but cancelling is generally
> > > > preferred for the lower latency.
> > > >
> > > Ok, it the state is ENQ, then we can disable the FD hw by controlling
> > > the registers.
> > >
> > > for example:
> > >         writel(0x0, fd->fd_base + FD_HW_ENABLE);
> > >         writel(0x0, fd->fd_base + FD_INT_EN);
> > >
> >
> > What's exactly the effect of writing 0 to FD_HW_ENABLE?
> >
> Sorry, my last reply didn't solve the question,
> we should implement a mtk_fd_job_abort() for v4l2_m2m_ops().
>
> which is able to readl_poll_timeout_atomic()
> and check the HW busy bits in the register FD_INT_EN;
>
> if they are not cleared until timeout, we could handle the last
> processing job.
> Otherwise, the FD irq handler should have handled the last processing
> job and we could continue the stop_streaming().
>
> For job_abort():
> static void mtk_fd_job_abort(void *priv)
> {
>         struct mtk_fd_ctx *ctx = priv;
>         struct mtk_fd_dev *fd = ctx->fd_dev;
>         u32 val;
>         u32 ret;
>
>         ret = readl_poll_timeout_atomic(fd->fd_base + MTK_FD_REG_OFFSET_INT_EN,
>                                         val,
>                                         (val & MTK_FD_HW_BUSY_MASK) ==
>                                         MTK_FD_HW_STATE_IS_BUSY,
>                                         USEC_PER_MSEC, MTK_FD_STOP_HW_TIMEOUT);

Hmm, would it be possible to avoid the busy wait by having a
completion that could be signalled from the interrupt handler?

Best regards,
Tomasz
