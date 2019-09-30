Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 10D15C24B7
	for <lists+linux-media@lfdr.de>; Mon, 30 Sep 2019 17:56:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732087AbfI3P4R (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 30 Sep 2019 11:56:17 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:57314 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730780AbfI3P4R (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 30 Sep 2019 11:56:17 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8UFuFtg090614;
        Mon, 30 Sep 2019 10:56:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1569858975;
        bh=URZ9o4WF27v++mNirqh2f4vb/a8st2m2aDv9wcXGHAY=;
        h=Date:From:To:CC:Subject:References:In-Reply-To;
        b=Rs92BCtN+Tp1ynSeCB48VMtBAi2teb09ZQCqVnmqNy1aaAft2ZrRo6OGR1aJQh00l
         KuHs9+nAYorRd7DlcDVSxRIdPz+TzFA4pnpW/MSdy0j0ds4vJpb/uVRgiDHAle66c9
         x+RR9tnlMK7OADvvopGI7WCgds1fY0o4qknr5ctI=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8UFuFOl093793
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 30 Sep 2019 10:56:15 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 30
 Sep 2019 10:56:05 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 30 Sep 2019 10:56:05 -0500
Received: from ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8UFuFRt074633;
        Mon, 30 Sep 2019 10:56:15 -0500
Date:   Mon, 30 Sep 2019 10:58:26 -0500
From:   Benoit Parrot <bparrot@ti.com>
To:     Austin Kim <austinkernel.kim@gmail.com>
CC:     Hans Verkuil <hverkuil@xs4all.nl>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: [Patch 02/16] media: ti-vpe: vpe: Add missing null pointer checks
Message-ID: <20190930155826.pimkap75k67mji3e@ti.com>
References: <20190927183650.31345-1-bparrot@ti.com>
 <20190927183650.31345-3-bparrot@ti.com>
 <CAOoBcBUd7reG=-WOq+Vq9SynZMJ81CWFZPN35MkmaQvquZ9xyg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAOoBcBUd7reG=-WOq+Vq9SynZMJ81CWFZPN35MkmaQvquZ9xyg@mail.gmail.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Austin,

Thanks for the review,

Austin Kim <austinkernel.kim@gmail.com> wrote on Sun [2019-Sep-29 09:08:37 +0900]:
> 2019년 9월 28일 (토) 오전 3:37, Benoit Parrot <bparrot@ti.com>님이 작성:
> >
> > A few NULL pointer checks were missing.
> > Add check with appropriate return code.
> >
> > Signed-off-by: Benoit Parrot <bparrot@ti.com>
> > ---
> >  drivers/media/platform/ti-vpe/vpe.c | 13 ++++++++++++-
> >  1 file changed, 12 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/media/platform/ti-vpe/vpe.c b/drivers/media/platform/ti-vpe/vpe.c
> > index 5ba72445584d..56f60dbea15c 100644
> > --- a/drivers/media/platform/ti-vpe/vpe.c
> > +++ b/drivers/media/platform/ti-vpe/vpe.c
> > @@ -1537,6 +1537,8 @@ static int vpe_g_fmt(struct file *file, void *priv, struct v4l2_format *f)
> >                 return -EINVAL;
> >
> >         q_data = get_q_data(ctx, f->type);
> > +       if (!q_data)
> > +               return -EINVAL;
> 
> With this commit, it seems that 'Null Pointer Dereference' could be
> avoidable even though 'get_q_data(ctx, f->type);' returns NULL.
> 
> * Original Code:
>         q_data = get_q_data(ctx, f->type);
>         // q_data = NULL;
> 
>         pix->width = q_data->width;
>         // pix->width =  (NULL)->width;
>         // In this case, data abort would be raised.

Yes I know this that is why the NULL check were added.

You mentionned earlier that the NULL pointer dereference could be
avoidable, but based on your comment I fail to see what you mean.

Please also note that this patch was a result of static analysis software
(klocwork) warnings.

Benoit

> 
> >
> >         pix->width = q_data->width;
> >         pix->height = q_data->height;
> > @@ -2001,6 +2003,8 @@ static int vpe_queue_setup(struct vb2_queue *vq,
> >         struct vpe_q_data *q_data;
> >
> >         q_data = get_q_data(ctx, vq->type);
> > +       if (!q_data)
> > +               return -EINVAL;
> >
> >         *nplanes = q_data->nplanes;
> >
> > @@ -2025,6 +2029,8 @@ static int vpe_buf_prepare(struct vb2_buffer *vb)
> >         vpe_dbg(ctx->dev, "type: %d\n", vb->vb2_queue->type);
> >
> >         q_data = get_q_data(ctx, vb->vb2_queue->type);
> > +       if (!q_data)
> > +               return -EINVAL;
> >         num_planes = q_data->nplanes;
> >
> >         if (vb->vb2_queue->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) {
> > @@ -2481,7 +2487,12 @@ static int vpe_probe(struct platform_device *pdev)
> >         mutex_init(&dev->dev_mutex);
> >
> >         dev->res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
> > -                       "vpe_top");
> > +                                               "vpe_top");
> > +       if (!dev->res) {
> > +               dev_err(&pdev->dev, "missing 'vpe_top' resources data\n");
> > +               return -ENODEV;
> > +       }
> > +
> >         /*
> >          * HACK: we get resource info from device tree in the form of a list of
> >          * VPE sub blocks, the driver currently uses only the base of vpe_top
> > --
> > 2.17.1
> >
