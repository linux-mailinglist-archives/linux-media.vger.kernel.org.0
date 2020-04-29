Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D4DE21BD770
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2020 10:40:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726477AbgD2Iku (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 29 Apr 2020 04:40:50 -0400
Received: from relay8-d.mail.gandi.net ([217.70.183.201]:41379 "EHLO
        relay8-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726345AbgD2Iku (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 29 Apr 2020 04:40:50 -0400
X-Originating-IP: 2.224.242.101
Received: from uno.localdomain (2-224-242-101.ip172.fastwebnet.it [2.224.242.101])
        (Authenticated sender: jacopo@jmondi.org)
        by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 1F9D61BF208;
        Wed, 29 Apr 2020 08:40:46 +0000 (UTC)
Date:   Wed, 29 Apr 2020 10:43:58 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org, libcamera-devel@lists.libcamera.org,
        mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        andrey.konovalov@linaro.org, laurent.pinchart@ideasonboard.com
Subject: Re: [PATCH v5 4/6] media: v4l2-subdev: Assume V4L2_SUBDEV_API is
 selected
Message-ID: <20200429084358.ssliiljy4jdzrvl3@uno.localdomain>
References: <20200428210609.6793-1-jacopo@jmondi.org>
 <20200428210609.6793-5-jacopo@jmondi.org>
 <20200428212643.GB5381@paasikivi.fi.intel.com>
 <20200429070215.gh3757q455ky6bkq@uno.localdomain>
 <20200429082737.GB9190@paasikivi.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200429082737.GB9190@paasikivi.fi.intel.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari

On Wed, Apr 29, 2020 at 11:27:37AM +0300, Sakari Ailus wrote:
> Hi Jacopo,
>
> On Wed, Apr 29, 2020 at 09:02:15AM +0200, Jacopo Mondi wrote:
> > Hi Sakari,
> >
> > On Wed, Apr 29, 2020 at 12:26:43AM +0300, Sakari Ailus wrote:
> > > Hi Jacopo,
> > >
> > > On Tue, Apr 28, 2020 at 11:06:07PM +0200, Jacopo Mondi wrote:
> > > > A sub-device device node can be registered in user space only if the
> > > > CONFIG_V4L2_SUBDEV_API Kconfig option is selected.
> > > >
> > > > Remove checks from the v4l2-subdev file handle open/close functions and
> > > > ioctl handler as they are only accessible if a device node was registered
> > > > to user space in first place.
> > >
> > > Is there other motivation with this than clean up things a little?
> > >
> >
> > I had to add yet-another #if defined and I got fed up. If you don't
> > have a device node registered you won't be able to access any of the
> > functions where the existing #if defined() where placed.
> >
> > > The change increases the binary size marginally if the Kconfig option is
> > > disabled.
> > >
> >
> > I see. Should we instead guard the whole file handle operations and
> > ioctl handler instead of having #if defined() spread inside them ? I
> > assume they where there as leftover, as I'm still missing the point,
> > give that, as said, without V4L2_SUBDEV_API, you can't register any
> > device node to userspace..
>
> I think that's why those #ifdefs have been originally put there --- it's
> just dead code without the subdev nodes, and the compiler won't be able to
> figure this out.
>
> But it seems, later on, when people have added code that supports
> sub-device nodes, no #ifdefs have been added.
>
> I think I'd make sense to remove the current #ifdefs and add dummy ops for
> everything where needed that truly depends on that Kconfig option (i.e.
> sub-device nodes). Or just to remove these, as your patch does. It's not a
> lot of code.

that's what I've done now, as soon as I've run a few compile test, I'll send
a new version.

Thanks
   j

>
> --
> Kind regards,
>
> Sakari Ailus
