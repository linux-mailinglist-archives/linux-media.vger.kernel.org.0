Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8036936C91
	for <lists+linux-media@lfdr.de>; Thu,  6 Jun 2019 08:52:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726040AbfFFGwE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 Jun 2019 02:52:04 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:55720 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725267AbfFFGwE (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 6 Jun 2019 02:52:04 -0400
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbrezillon)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id D230D263955;
        Thu,  6 Jun 2019 07:52:02 +0100 (BST)
Date:   Thu, 6 Jun 2019 08:51:59 +0200
From:   Boris Brezillon <boris.brezillon@collabora.com>
To:     Tomasz Figa <tfiga@chromium.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        kernel@collabora.com, Hirokazu Honda <hiroh@chromium.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Maxime Jourdan <mjourdan@baylibre.com>
Subject: Re: [PATCH] media: v4l2: Fix the _MPLANE format check in
 v4l_enum_fmt()
Message-ID: <20190606085159.3454aecb@collabora.com>
In-Reply-To: <CAAFQd5Aji4v7fJZ+at_W58L_0+wC5E9wvSW=gCPLWswFECBMJA@mail.gmail.com>
References: <20190605164625.5109-1-boris.brezillon@collabora.com>
        <CAAFQd5Aji4v7fJZ+at_W58L_0+wC5E9wvSW=gCPLWswFECBMJA@mail.gmail.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, 6 Jun 2019 12:53:57 +0900
Tomasz Figa <tfiga@chromium.org> wrote:

> On Thu, Jun 6, 2019 at 1:46 AM Boris Brezillon
> <boris.brezillon@collabora.com> wrote:
> >
> > CAP_M2M_MPLANE means the device supports _MPLANE formats for both
> > capture and output. Adjust the check to avoid EINVAL errors on
> > such devices.
> >
> > Fixes: 366c719d6479 ("media: v4l2: Get rid of ->vidioc_enum_fmt_vid_{cap,out}_mplane")
> > Reported-by: Maxime Jourdan <mjourdan@baylibre.com>
> > Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> > ---
> >  drivers/media/v4l2-core/v4l2-ioctl.c | 9 +++++++--
> >  1 file changed, 7 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
> > index b4c73e8f23c5..ace9b9761bed 100644
> > --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> > +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> > @@ -1385,6 +1385,7 @@ static int v4l_enum_fmt(const struct v4l2_ioctl_ops *ops,
> >         struct video_device *vdev = video_devdata(file);
> >         struct v4l2_fmtdesc *p = arg;
> >         int ret = check_fmt(file, p->type);
> > +       u32 cap_mask;
> >
> >         if (ret)
> >                 return ret;
> > @@ -1393,7 +1394,9 @@ static int v4l_enum_fmt(const struct v4l2_ioctl_ops *ops,
> >         switch (p->type) {
> >         case V4L2_BUF_TYPE_VIDEO_CAPTURE:
> >         case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
> > -               if (!!(vdev->device_caps & V4L2_CAP_VIDEO_CAPTURE_MPLANE) !=
> > +               cap_mask = V4L2_CAP_VIDEO_CAPTURE_MPLANE |
> > +                          V4L2_CAP_VIDEO_M2M_MPLANE;
> > +               if (!!(vdev->device_caps & cap_mask) !=  
> 
> Shouldn't devices that report V4L2_CAP_VIDEO_M2M_MPLANE have also
> V4L2_CAP_VIDEO_CAPTURE_MPLANE and V4L2_CAP_VIDEO_OUTPUT_MPLANE
> reported anyway?

That's the other option, force drivers that set
V4L2_CAP_VIDEO_M2M_MPLANE to also set
V4L2_CAP_VIDEO_{CAPTURE,OUTPUT}_MPLANE (or we can let the core do it).
