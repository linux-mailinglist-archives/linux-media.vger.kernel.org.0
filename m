Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9162B7895A
	for <lists+linux-media@lfdr.de>; Mon, 29 Jul 2019 12:12:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728133AbfG2KMB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 29 Jul 2019 06:12:01 -0400
Received: from mail-ed1-f66.google.com ([209.85.208.66]:34542 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728287AbfG2KMB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 29 Jul 2019 06:12:01 -0400
Received: by mail-ed1-f66.google.com with SMTP id s49so23978072edb.1
        for <linux-media@vger.kernel.org>; Mon, 29 Jul 2019 03:11:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BuGv9mCdiFGsr2/aU0TRRsCbu+bBVd92bSRQXh+qKoY=;
        b=cAC9vA1WzP7wEkgiMvdLyiKgruKKv4ZnjNuRve1TY9887obLYXBAbg8MOgcgRTNeEZ
         S1uerLNW/hOLtEC/W09eiyKTP84oZV1KJzien/avQoU0Uj1Z34YIicEcENwWaYUE3kYS
         v3xUCf6OAkD8Y9Aw3J6yQsOt49ZRuJIF8L9Y8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BuGv9mCdiFGsr2/aU0TRRsCbu+bBVd92bSRQXh+qKoY=;
        b=Q9bDlLnQznMBYkjJmfF6IHPmI7ELZl8UR0qZzfv8+Q6EAtVARgrRSjHrubxQoP4anU
         HL9f8V1jkuV7konOxDHBmncaoo6ifwPJ9hR73mKRtz1tCdPvX5kvPATga4FF0daFXJrj
         njpisIEQstV0x6PBnhOTOkSQ0COKgczS16NoPtznOFWcobKqS6FyMvhbwnG+QOmZzJdl
         WszS0AHiYm00TBLmSxY1T0v4YEgRpFJLiYRoOwwiCBRK28rGa0K8Euvz+yaqj1NElaq3
         6ji0LNp0jymSsoefci4ebES7b3J5MgRBF3XYzck40Fct/styhTDJloVSk4oIs6hIXxGL
         v7MQ==
X-Gm-Message-State: APjAAAW0j+7hMZaOZR0ZsO9SN68l4M4hv64yEOHVXiYHY6O9zuEoRlop
        v+7fgZcn5+Gs/9pm02el+laX8bkQ9uthBw==
X-Google-Smtp-Source: APXvYqxSLyb3QcqJn++I0NCURv8EjQeXiKpjtj+c9/wfakphmO6hQVfH/6RTS99FGVcRtjCBs6o2cQ==
X-Received: by 2002:a17:906:e91:: with SMTP id p17mr84971919ejf.217.1564395118541;
        Mon, 29 Jul 2019 03:11:58 -0700 (PDT)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com. [209.85.221.41])
        by smtp.gmail.com with ESMTPSA id jt17sm11552739ejb.90.2019.07.29.03.11.58
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Mon, 29 Jul 2019 03:11:58 -0700 (PDT)
Received: by mail-wr1-f41.google.com with SMTP id r1so61162647wrl.7
        for <linux-media@vger.kernel.org>; Mon, 29 Jul 2019 03:11:58 -0700 (PDT)
X-Received: by 2002:a5d:5012:: with SMTP id e18mr17574578wrt.166.1564394653548;
 Mon, 29 Jul 2019 03:04:13 -0700 (PDT)
MIME-Version: 1.0
References: <jungo.lin@mediatek.com> <20190611035344.29814-1-jungo.lin@mediatek.com>
 <20190611035344.29814-7-jungo.lin@mediatek.com> <20190710095429.GA181405@chromium.org>
 <1563424741.1212.212.camel@mtksdccf07> <CAAFQd5CXeQv74RtqDxYYLVEpsnFbsm0m-kUBDpY_AFmCBO0PyA@mail.gmail.com>
 <1563942689.1212.494.camel@mtksdccf07> <CAAFQd5A8zW9s8cewmHnr9HFmrkxDnEqjrTiwLF2m8sKp0619hA@mail.gmail.com>
 <1564363089.1212.636.camel@mtksdccf07>
In-Reply-To: <1564363089.1212.636.camel@mtksdccf07>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Mon, 29 Jul 2019 19:04:02 +0900
X-Gmail-Original-Message-ID: <CAAFQd5D4Roc05H1NnXSp=W+L1RN7LEPHY0EA0mRhpHAcZ3wvMg@mail.gmail.com>
Message-ID: <CAAFQd5D4Roc05H1NnXSp=W+L1RN7LEPHY0EA0mRhpHAcZ3wvMg@mail.gmail.com>
Subject: Re: [RFC,v3 6/9] media: platform: Add Mediatek ISP P1 V4L2 functions
To:     Jungo Lin <jungo.lin@mediatek.com>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>, devicetree@vger.kernel.org,
        =?UTF-8?B?U2VhbiBDaGVuZyAo6YSt5piH5byYKQ==?= 
        <sean.cheng@mediatek.com>,
        =?UTF-8?B?RnJlZGVyaWMgQ2hlbiAo6Zmz5L+K5YWDKQ==?= 
        <frederic.chen@mediatek.com>,
        =?UTF-8?B?UnlubiBXdSAo5ZCz6IKy5oGpKQ==?= <rynn.wu@mediatek.com>,
        srv_heupstream <srv_heupstream@mediatek.com>,
        Rob Herring <robh@kernel.org>,
        =?UTF-8?B?UnlhbiBZdSAo5L2Z5a2f5L+uKQ==?= <ryan.yu@mediatek.com>,
        =?UTF-8?B?RnJhbmtpZSBDaGl1ICjpgrHmloflh7Ep?= 
        <frankie.chiu@mediatek.com>, ddavenport@chromium.org,
        Sj Huang <sj.huang@mediatek.com>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg
        Roedel <joro@8bytes.org>," <linux-arm-kernel@lists.infradead.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Jul 29, 2019 at 10:18 AM Jungo Lin <jungo.lin@mediatek.com> wrote:
> On Fri, 2019-07-26 at 14:49 +0900, Tomasz Figa wrote:
> > On Wed, Jul 24, 2019 at 1:31 PM Jungo Lin <jungo.lin@mediatek.com> wrote:
> > > On Tue, 2019-07-23 at 19:21 +0900, Tomasz Figa wrote:
> > > > On Thu, Jul 18, 2019 at 1:39 PM Jungo Lin <jungo.lin@mediatek.com> wrote:
> > > > > On Wed, 2019-07-10 at 18:54 +0900, Tomasz Figa wrote:
> > > > > > On Tue, Jun 11, 2019 at 11:53:41AM +0800, Jungo Lin wrote:
[snip]
> > >                 dev_dbg(cam->dev, "jobs are full\n");
> > >                 spin_unlock_irqrestore(&cam->pending_job_lock, flags);
> > >                 return;
> > >         }
> > >         list_for_each_entry_safe(req, req_prev, &cam->pending_job_list, list) {
> >
> > Could we instead check the counter here and break if it's >=
> > MTK_ISP_MAX_RUNNING_JOBS?
> > Then we could increment it here too to simplify the code.
> >
>
> Thanks for your advice.
> We simplified this function as below:
>
> void mtk_cam_dev_req_try_queue(struct mtk_cam_dev *cam)
> {
>         struct mtk_cam_dev_request *req, *req_prev;
>         unsigned long flags;
>
>         if (!cam->streaming) {
>                 dev_dbg(cam->dev, "stream is off\n");
>                 return;
>         }
>
>         spin_lock_irq(&cam->pending_job_lock);
>         spin_lock_irqsave(&cam->running_job_lock, flags);

Having the inner call spin_lock_irqsave() doesn't really do anything
useful, because the outer spin_lock_irq() disables the IRQs and flags
would always have the IRQ disabled state. Please use irqsave for the
outer call.

[snip]
> > > > > > > +
> > > > > > > +static struct v4l2_subdev *
> > > > > > > +mtk_cam_cio_get_active_sensor(struct mtk_cam_dev *cam_dev)
> > > > > > > +{
> > > > > > > +   struct media_device *mdev = cam_dev->seninf->entity.graph_obj.mdev;
> > > > > > > +   struct media_entity *entity;
> > > > > > > +   struct device *dev = &cam_dev->pdev->dev;
> > > > > > > +   struct v4l2_subdev *sensor;
> > > > > >
> > > > > > This variable would be unitialized if there is no streaming sensor. Was
> > > > > > there no compiler warning generated for this?
> > > > > >
> > > > >
> > > > > No, there is no compiler warning.
> > > > > But, we will assign sensor to NULL to avoid unnecessary compiler warning
> > > > > with different compiler options.
> > > > >
> > > >
> > > > Thanks. It would be useful if you could check why the compiler you're
> > > > using doesn't show a warning here. We might be missing other
> > > > uninitialized variables.
> > > >
> > >
> > > We will feedback to your project team to check the possible reason about
> > > compiler warning issue.
> > >
> >
> > Do you mean that it was the Clang toolchain used on Chromium OS (e.g.
> > emerge chromeos-kernel-4_19)?
>
> > [snip]
>
> Yes, I checked this comment in the Chromium OS build environment.
> But, I think I have made the mistake here. I need to check the build
> status in the Mediatek's kernel upstream environment. I will pay
> attention in next path set upstream.
>

Thanks a lot. I will recheck this in the Chromium OS toolchain too.

> > > > > > > +
> > > > > > > +   dev_dbg(dev, "%s: node:%d fd:%d idx:%d\n",
> > > > > > > +           __func__,
> > > > > > > +           node->id,
> > > > > > > +           buf->vbb.request_fd,
> > > > > > > +           buf->vbb.vb2_buf.index);
> > > > > > > +
> > > > > > > +   /* For request buffers en-queue, handled in mtk_cam_req_try_queue */
> > > > > > > +   if (vb->vb2_queue->uses_requests)
> > > > > > > +           return;
> > > > > >
> > > > > > I'd suggest removing non-request support from this driver. Even if we end up
> > > > > > with a need to provide compatibility for non-request mode, then it should be
> > > > > > built on top of the requests mode, so that the driver itself doesn't have to
> > > > > > deal with two modes.
> > > > > >
> > > > >
> > > > > The purpose of non-request function in this driver is needed by
> > > > > our camera middle-ware design. It needs 3A statistics buffers before
> > > > > image buffers en-queue. So we need to en-queue 3A statistics with
> > > > > non-request mode in this driver. After MW got the 3A statistics data, it
> > > > > will en-queue the images, tuning buffer and other meta buffers with
> > > > > request mode. Based on this requirement, do you have any suggestion?
> > > > > For upstream driver, should we only consider request mode?
> > > > >
> > > >
> > > > Where does that requirement come from? Why the timing of queuing of
> > > > the buffers to the driver is important?
> > > >
> > > > [snip]
> > >
> > > Basically, this requirement comes from our internal camera
> > > middle-ware/3A hal in user space. Since this is not generic requirement,
> > > we will follow your original suggestion to keep the request mode only
> > > and remove other non-request design in other files. For upstream driver,
> > > it should support request mode only.
> > >
> >
> > Note that Chromium OS will use the "upstream driver" and we don't want
> > to diverge, so please make the userspace also use only requests. I
> > don't see a reason why there would be any need to submit any buffers
> > outside of a request.
> >
> > [snip]
>
> Ok, I have raised your concern to our colleagues and let him to discuss
> with you in another communication channel.
>

Thanks!

Best regards,
Tomasz
