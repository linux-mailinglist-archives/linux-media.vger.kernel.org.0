Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8C44EE5F9D
	for <lists+linux-media@lfdr.de>; Sat, 26 Oct 2019 22:48:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726524AbfJZUsZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 26 Oct 2019 16:48:25 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:59306 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726409AbfJZUsZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 26 Oct 2019 16:48:25 -0400
Received: from pendragon.ideasonboard.com (143.121.2.93.rev.sfr.net [93.2.121.143])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 62FAF325;
        Sat, 26 Oct 2019 22:48:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1572122903;
        bh=ycEMw8jclVPleoiDQImdNz0BCXHXftvCkHtIXATUYZ0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ZH5z26Ywij757RNeoLW6MsFjvV9+uNENwUyeYRipHykROKld1gC7eaSUtl8pWJRRJ
         DPrhqer3lXMK+kxpAMAFK+XBVVfMGBzK6H0UPI8CF5+z0nUrZkn9iJ5ZLURbB/xIJi
         XhmHa8zewIWr/NR/Qcd6uC6f/EPG4q9GNLXt0zi8=
Date:   Sat, 26 Oct 2019 23:48:15 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomasz Figa <tfiga@chromium.org>
Cc:     Pavel Machek <pavel@ucw.cz>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        "open list:MEDIA INPUT INFRASTRUCTURE (V4L/DVB)" 
        <linux-media@vger.kernel.org>
Subject: Re: [PATCH v4 01/11] dt-bindings: video-interfaces: Document
 'location' property
Message-ID: <20191026204815.GA28970@pendragon.ideasonboard.com>
References: <20191007162913.250743-1-jacopo@jmondi.org>
 <20191007162913.250743-2-jacopo@jmondi.org>
 <20191008074052.GA633@amd>
 <20191008075828.phxf2m7237ryl6yf@uno.localdomain>
 <20191008080634.GC633@amd>
 <20191008082041.476a2soclry6qn3v@uno.localdomain>
 <9788aa13-1bc0-02c3-33f5-a875940f2dc3@xs4all.nl>
 <20191023142717.GA22854@duo.ucw.cz>
 <CAAFQd5CjUH7QRg-oQOKB=YH9NPvSxwjrdRUPYZkYVAHgJh6dZg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAAFQd5CjUH7QRg-oQOKB=YH9NPvSxwjrdRUPYZkYVAHgJh6dZg@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Oct 25, 2019 at 03:29:49PM +0900, Tomasz Figa wrote:
> On Wed, Oct 23, 2019 at 11:27 PM Pavel Machek <pavel@ucw.cz> wrote:
> >
> > Hi!
> >
> > > > I'm skeptical about adding now a property for a device that we don't
> > > > support, because we -now- think it's a good idea. I might be wrong,
> > > > but my assumption is that when someone will want to support an
> > > > 'advanced' device, it's easy to add "movable" or whatever else to the
> > > > list of accepted properties values. Am I wrong in assuming this? As
> > > > long as "front" "back" and "external" will stay supported for backward
> > > > DTB compatibility it should be fine, right ?
> > >
> > > The basic rule is that you should not define things unless you KNOW that
> > > they will be needed. So when we actually see new devices for which
> > > "front", "back" or "external" does not fit, then new names can be
> > > created.
> >
> > > It's impossible to cover all situations since we can't predict the future.
> > > The best we can do is to allow for future extensions.
> >
> > Those devices are already being sold, and yes, they are running linux
> > (with some patches probably).
> >
> > I believe it would be better to specify "this camera is selfie --
> > takes pictures of the user" vs. "this is main camera -- takes pictures
> > of what user is looking at".
> 
> FWIW, Android and Chrome OS call those "user-facing" and
> "world-facing" respectively.

Isn't that equivalent to what Jacopo is proposing though ? If we define
the orientation of the device relatively to its user (e.g. for all
cellphone devices the front is defined as the side facing the user), and
the location of the camera relative to the device, we get the same
information.

-- 
Regards,

Laurent Pinchart
