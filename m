Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C26F3A31BC
	for <lists+linux-media@lfdr.de>; Thu, 10 Jun 2021 19:08:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230166AbhFJRKp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Jun 2021 13:10:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229802AbhFJRKp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Jun 2021 13:10:45 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB431C061574;
        Thu, 10 Jun 2021 10:08:48 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0EEDA8D4;
        Thu, 10 Jun 2021 19:08:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1623344927;
        bh=kMKwf3AUh1KMGBP8YTMcEFrwdeUsUAggQ5TeZiDXopI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=mDK3foDuNjaGlsy/SF/D+mLBSSRksMVJsrkfCbPfjIxiZ1BpiCgAuSSs6kvSlXTH/
         lN9RV2zszMuXnl+ZB1EmPe5o0lJfjFB3GEIHvY33c0ruOgCsWT5LJCgayv9cC5iZu5
         Gypy1bG7KIj94sVlBGfzU9yfLqxmQ1Tas8M+T1Mw=
Date:   Thu, 10 Jun 2021 20:08:28 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Ricardo Ribalda <ribalda@chromium.org>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Tomasz Figa <tfiga@chromium.org>
Subject: Re: [PATCH v9 17/22] media: docs: Document the behaviour of uvcdriver
Message-ID: <YMJHDLSoimKCMsB9@pendragon.ideasonboard.com>
References: <20210326095840.364424-1-ribalda@chromium.org>
 <20210326095840.364424-18-ribalda@chromium.org>
 <417be36b-850a-84b2-dc68-c1bec85e2edb@xs4all.nl>
 <CANiDSCsikQaCMFKdrKfqYv=NuhCxy2v--QBUPd00c5jAo6OGnQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CANiDSCsikQaCMFKdrKfqYv=NuhCxy2v--QBUPd00c5jAo6OGnQ@mail.gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Ricardo,

Thank you for the patch.

On Sat, Mar 27, 2021 at 01:01:05PM +0100, Ricardo Ribalda wrote:
> On Sat, Mar 27, 2021 at 12:19 PM Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
> > On 26/03/2021 10:58, Ricardo Ribalda wrote:
> > > The uvc driver relies on the camera firmware to keep the control states
> > > and therefore is not capable of changing an inactive control.
> > >
> > > Allow returning -EACESS in those cases.
> >
> > -EACCES
> 
> This british people that like to have a lot of double consonants :)
> 
> I have updated the series at:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/ribalda/linux.git/log/?h=uvc-compliance-v10
> 
> Will not post until there is more feedback to avoid spamming the list.

s/uvcdriver/uvcvideo driver/ in the subject line.

For the version in that branch,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> > >
> > > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > > ---
> > >  Documentation/userspace-api/media/v4l/vidioc-g-ctrl.rst      | 5 +++++
> > >  Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst | 5 +++++
> > >  2 files changed, 10 insertions(+)
> > >
> > > diff --git a/Documentation/userspace-api/media/v4l/vidioc-g-ctrl.rst b/Documentation/userspace-api/media/v4l/vidioc-g-ctrl.rst
> > > index 4f1bed53fad5..8c0a203385c2 100644
> > > --- a/Documentation/userspace-api/media/v4l/vidioc-g-ctrl.rst
> > > +++ b/Documentation/userspace-api/media/v4l/vidioc-g-ctrl.rst
> > > @@ -95,3 +95,8 @@ EBUSY
> > >
> > >  EACCES
> > >      Attempt to set a read-only control or to get a write-only control.
> > > +
> > > +    Or if there is an attempt to set an inactive control and the driver is
> > > +    not capable of keeping the new value until the control is active again.
> >
> > keeping: 'caching' or 'storing' are better words, I think.
> >
> > > +    This is the case for drivers that do not use the standard control
> > > +    framework and rely purely on the hardware to keep the controls' state.
> >
> > I would drop that last sentence. It is not relevant information to the users of
> > the API.
> >
> > > diff --git a/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst b/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
> > > index b9c62affbb5a..bb7de7a25241 100644
> > > --- a/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
> > > +++ b/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
> > > @@ -438,3 +438,8 @@ EACCES
> > >
> > >      Or the ``which`` field was set to ``V4L2_CTRL_WHICH_REQUEST_VAL`` but the
> > >      device does not support requests.
> > > +
> > > +    Or if there is an attempt to set an inactive control and the driver is
> > > +    not capable of keeping the new value until the control is active again.
> > > +    This is the case for drivers that do not use the standard control
> > > +    framework and rely purely on the hardware to keep the controls' state.
> >
> > Same comments as above.

-- 
Regards,

Laurent Pinchart
