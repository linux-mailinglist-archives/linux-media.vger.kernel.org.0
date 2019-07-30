Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0B1DE79E0B
	for <lists+linux-media@lfdr.de>; Tue, 30 Jul 2019 03:45:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730670AbfG3BpP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 29 Jul 2019 21:45:15 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:36507 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1730650AbfG3BpO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 29 Jul 2019 21:45:14 -0400
X-UUID: ebc1c17d120d4839a2b70c9931803d1c-20190730
X-UUID: ebc1c17d120d4839a2b70c9931803d1c-20190730
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by mailgw01.mediatek.com
        (envelope-from <jungo.lin@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0707 with TLS)
        with ESMTP id 863998090; Tue, 30 Jul 2019 09:44:53 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 30 Jul 2019 09:44:49 +0800
Received: from [172.21.84.99] (172.21.84.99) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Tue, 30 Jul 2019 09:44:49 +0800
Message-ID: <1564451089.1212.649.camel@mtksdccf07>
Subject: Re: [RFC,v3 6/9] media: platform: Add Mediatek ISP P1 V4L2 functions
From:   Jungo Lin <jungo.lin@mediatek.com>
To:     Tomasz Figa <tfiga@chromium.org>
CC:     Hans Verkuil <hverkuil@xs4all.nl>, <devicetree@vger.kernel.org>,
        "Sean Cheng =?UTF-8?Q?=28=E9=84=AD=E6=98=87=E5=BC=98=29?=" 
        <sean.cheng@mediatek.com>,
        Frederic Chen =?UTF-8?Q?=28=E9=99=B3=E4=BF=8A=E5=85=83=29?= 
        <frederic.chen@mediatek.com>,
        Rynn Wu =?UTF-8?Q?=28=E5=90=B3=E8=82=B2=E6=81=A9=29?= 
        <rynn.wu@mediatek.com>,
        srv_heupstream <srv_heupstream@mediatek.com>,
        Rob Herring <robh@kernel.org>,
        Ryan Yu =?UTF-8?Q?=28=E4=BD=99=E5=AD=9F=E4=BF=AE=29?= 
        <ryan.yu@mediatek.com>,
        Frankie Chiu =?UTF-8?Q?=28=E9=82=B1=E6=96=87=E5=87=B1=29?= 
        <frankie.chiu@mediatek.com>, <ddavenport@chromium.org>,
        Sj Huang <sj.huang@mediatek.com>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        "Laurent Pinchart" <laurent.pinchart@ideasonboard.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg
        Roedel <joro@8bytes.org>," <linux-arm-kernel@lists.infradead.org>,
        "Linux Media Mailing List" <linux-media@vger.kernel.org>
Date:   Tue, 30 Jul 2019 09:44:49 +0800
In-Reply-To: <CAAFQd5D4Roc05H1NnXSp=W+L1RN7LEPHY0EA0mRhpHAcZ3wvMg@mail.gmail.com>
References: <jungo.lin@mediatek.com>
         <20190611035344.29814-1-jungo.lin@mediatek.com>
         <20190611035344.29814-7-jungo.lin@mediatek.com>
         <20190710095429.GA181405@chromium.org>
         <1563424741.1212.212.camel@mtksdccf07>
         <CAAFQd5CXeQv74RtqDxYYLVEpsnFbsm0m-kUBDpY_AFmCBO0PyA@mail.gmail.com>
         <1563942689.1212.494.camel@mtksdccf07>
         <CAAFQd5A8zW9s8cewmHnr9HFmrkxDnEqjrTiwLF2m8sKp0619hA@mail.gmail.com>
         <1564363089.1212.636.camel@mtksdccf07>
         <CAAFQd5D4Roc05H1NnXSp=W+L1RN7LEPHY0EA0mRhpHAcZ3wvMg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.2.3-0ubuntu6 
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
X-MTK:  N
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, 2019-07-29 at 19:04 +0900, Tomasz Figa wrote:
> On Mon, Jul 29, 2019 at 10:18 AM Jungo Lin <jungo.lin@mediatek.com> wrote:
> > On Fri, 2019-07-26 at 14:49 +0900, Tomasz Figa wrote:
> > > On Wed, Jul 24, 2019 at 1:31 PM Jungo Lin <jungo.lin@mediatek.com> wrote:
> > > > On Tue, 2019-07-23 at 19:21 +0900, Tomasz Figa wrote:
> > > > > On Thu, Jul 18, 2019 at 1:39 PM Jungo Lin <jungo.lin@mediatek.com> wrote:
> > > > > > On Wed, 2019-07-10 at 18:54 +0900, Tomasz Figa wrote:
> > > > > > > On Tue, Jun 11, 2019 at 11:53:41AM +0800, Jungo Lin wrote:
> [snip]
> > > >                 dev_dbg(cam->dev, "jobs are full\n");
> > > >                 spin_unlock_irqrestore(&cam->pending_job_lock, flags);
> > > >                 return;
> > > >         }
> > > >         list_for_each_entry_safe(req, req_prev, &cam->pending_job_list, list) {
> > >
> > > Could we instead check the counter here and break if it's >=
> > > MTK_ISP_MAX_RUNNING_JOBS?
> > > Then we could increment it here too to simplify the code.
> > >
> >
> > Thanks for your advice.
> > We simplified this function as below:
> >
> > void mtk_cam_dev_req_try_queue(struct mtk_cam_dev *cam)
> > {
> >         struct mtk_cam_dev_request *req, *req_prev;
> >         unsigned long flags;
> >
> >         if (!cam->streaming) {
> >                 dev_dbg(cam->dev, "stream is off\n");
> >                 return;
> >         }
> >
> >         spin_lock_irq(&cam->pending_job_lock);
> >         spin_lock_irqsave(&cam->running_job_lock, flags);
> 
> Having the inner call spin_lock_irqsave() doesn't really do anything
> useful, because the outer spin_lock_irq() disables the IRQs and flags
> would always have the IRQ disabled state. Please use irqsave for the
> outer call.
> 
> [snip]

Thanks for your comment.
This is a bug which triggers one kernel warning about wrong ISR state as
you said. We have fixed it.

> > > > > > > > +
> > > > > > > > +static struct v4l2_subdev *
> > > > > > > > +mtk_cam_cio_get_active_sensor(struct mtk_cam_dev *cam_dev)
> > > > > > > > +{
> > > > > > > > +   struct media_device *mdev = cam_dev->seninf->entity.graph_obj.mdev;
> > > > > > > > +   struct media_entity *entity;
> > > > > > > > +   struct device *dev = &cam_dev->pdev->dev;
> > > > > > > > +   struct v4l2_subdev *sensor;
> > > > > > >
> > > > > > > This variable would be unitialized if there is no streaming sensor. Was
> > > > > > > there no compiler warning generated for this?
> > > > > > >
> > > > > >
> > > > > > No, there is no compiler warning.
> > > > > > But, we will assign sensor to NULL to avoid unnecessary compiler warning
> > > > > > with different compiler options.
> > > > > >
> > > > >
> > > > > Thanks. It would be useful if you could check why the compiler you're
> > > > > using doesn't show a warning here. We might be missing other
> > > > > uninitialized variables.
> > > > >
> > > >
> > > > We will feedback to your project team to check the possible reason about
> > > > compiler warning issue.
> > > >
> > >
> > > Do you mean that it was the Clang toolchain used on Chromium OS (e.g.
> > > emerge chromeos-kernel-4_19)?
> >
> > > [snip]
> >
> > Yes, I checked this comment in the Chromium OS build environment.
> > But, I think I have made the mistake here. I need to check the build
> > status in the Mediatek's kernel upstream environment. I will pay
> > attention in next path set upstream.
> >
> 
> Thanks a lot. I will recheck this in the Chromium OS toolchain too.
> 

For these complier warnings, we have fixed them in Mediatek upstream
environment[1]. In this build environment, we could observe some
comelier warnings which are not generated by Chromium OS toolchain.

[1]
toolchain/aarch64/usr/bin/aarch64-poky-linux

> > > > > > > > +
> > > > > > > > +   dev_dbg(dev, "%s: node:%d fd:%d idx:%d\n",
> > > > > > > > +           __func__,
> > > > > > > > +           node->id,
> > > > > > > > +           buf->vbb.request_fd,
> > > > > > > > +           buf->vbb.vb2_buf.index);
> > > > > > > > +
> > > > > > > > +   /* For request buffers en-queue, handled in mtk_cam_req_try_queue */
> > > > > > > > +   if (vb->vb2_queue->uses_requests)
> > > > > > > > +           return;
> > > > > > >
> > > > > > > I'd suggest removing non-request support from this driver. Even if we end up
> > > > > > > with a need to provide compatibility for non-request mode, then it should be
> > > > > > > built on top of the requests mode, so that the driver itself doesn't have to
> > > > > > > deal with two modes.
> > > > > > >
> > > > > >
> > > > > > The purpose of non-request function in this driver is needed by
> > > > > > our camera middle-ware design. It needs 3A statistics buffers before
> > > > > > image buffers en-queue. So we need to en-queue 3A statistics with
> > > > > > non-request mode in this driver. After MW got the 3A statistics data, it
> > > > > > will en-queue the images, tuning buffer and other meta buffers with
> > > > > > request mode. Based on this requirement, do you have any suggestion?
> > > > > > For upstream driver, should we only consider request mode?
> > > > > >
> > > > >
> > > > > Where does that requirement come from? Why the timing of queuing of
> > > > > the buffers to the driver is important?
> > > > >
> > > > > [snip]
> > > >
> > > > Basically, this requirement comes from our internal camera
> > > > middle-ware/3A hal in user space. Since this is not generic requirement,
> > > > we will follow your original suggestion to keep the request mode only
> > > > and remove other non-request design in other files. For upstream driver,
> > > > it should support request mode only.
> > > >
> > >
> > > Note that Chromium OS will use the "upstream driver" and we don't want
> > > to diverge, so please make the userspace also use only requests. I
> > > don't see a reason why there would be any need to submit any buffers
> > > outside of a request.
> > >
> > > [snip]
> >
> > Ok, I have raised your concern to our colleagues and let him to discuss
> > with you in another communication channel.
> >
> 
> Thanks!
> 
> Best regards,
> Tomasz

Our colleague is preparing material to explain the our 3A/MW design. If
he is ready, he will discuss this with you.

In the original plan, we will deliver P1 v4 patch set tomorrow (31th
Jul.). But, there are some comments waiting for other experts' input.
Do you suggest it is better to resolve all comments before v4 patch set
submitting or continue to discuss these comments on v4?

Thanks,


Jungo

