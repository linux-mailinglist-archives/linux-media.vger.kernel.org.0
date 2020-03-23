Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 82B9D18F5F9
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2020 14:43:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728415AbgCWNnx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Mar 2020 09:43:53 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:48188 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727447AbgCWNnx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Mar 2020 09:43:53 -0400
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 998D3308;
        Mon, 23 Mar 2020 14:43:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1584971030;
        bh=FM8KGtuvcnkDfxSzmaIY1xYQcEegldmFku3aQKGDZno=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=vYx7hEGydKcdYl7RRwz+ufmPwjnxM0fi8y++63urw+M0uU4vrR60Hxzm0/8WaY1nP
         2mjPVPco1nr1NxcO27+dzAKbOQjhRNHu0LKvbQ1s6LcZqRk1myG2XP67OUwcBMxE+A
         8QjVDOpHEZBQpjah7BqKuDfzlOiQCSnOwpDmFz50=
Date:   Mon, 23 Mar 2020 15:43:41 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Pavel Machek <pavel@ucw.cz>, sean@mess.org,
        hverkuil-cisco@xs4all.nl, mchehab+samsung@kernel.org,
        sakari.ailus@linux.intel.com, linux-media@vger.kernel.org
Subject: Re: [PATCH] Minimal libv4l2 support for complex cameras
Message-ID: <20200323134341.GH4768@pendragon.ideasonboard.com>
References: <20200323114727.GA31063@amd>
 <20200323115753.GC12103@pendragon.ideasonboard.com>
 <20200323122216.GA18697@duo.ucw.cz>
 <20200323122442.GD12103@pendragon.ideasonboard.com>
 <20200323135933.6ddbe4c3@coco.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200323135933.6ddbe4c3@coco.lan>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

On Mon, Mar 23, 2020 at 01:59:33PM +0100, Mauro Carvalho Chehab wrote:
> Em Mon, 23 Mar 2020 14:24:42 +0200 Laurent Pinchart escreveu:
> > On Mon, Mar 23, 2020 at 01:22:17PM +0100, Pavel Machek wrote:
> > > > On Mon, Mar 23, 2020 at 12:47:27PM +0100, Pavel Machek wrote:
> > > >> Hi!
> > > >> 
> > > >> We now have easy-to-install support for complex camera in form of
> > > >> Maemo Leste on N900.... Unfortunately we don't have anything in
> > > >> userspace that can be used to work with the camera.
> > > >> 
> > > >> This attempts to be minimal solution to get libv4l2 to work.
> > > > 
> > > > libv4l2 is mostly deprecated.
> 
> Well, not really... I guess lots of userspace apps rely on it
> (qv4l2, xawtv, tvtime, camorama, zbar, ...).
>
> In order to be able to deprecate it, we need to add some code there
> to let them bind via libcamera and test them with different hardware,
> including the non-UVC ones.

qv4l2 is out of scope, as that's a V4L2 test application, so it really
needs to stay as close as possible to V4L2 :-) TV applications are also
not candidates for porting to libcamera, as libcamera doesn't support TV
capture. Sure, they can use non-TV capture devices, but it's really a
completely different world. I don't mind if someone wants to try and
integrate libcamera support in the above applications, but I'd also be
happy to let them as they are and move on.

I'm not calling for libv4l2 to be removed, but new developments
shouldn't use it. We've been telling developers to go for the V4L2 API
directly instead unless some libv4l2 features are mandatory for their
use case (such as support for the custom compression formats of those
ancient webcams). It makes no sense, from a community point of view, to
invest in that project to support complex cameras.

> > > > How about contributing an OMAP3 ISP
> > > > pipeline handler to libcamera instead ? :-)
> > > 
> > > Why should it be instead?
> > > 
> > > I need something for kernel testing, and there is ton of apps using
> > > it. Let me do this. libcamera might be future, but...
> > 
> > Sure, if it's useful for you, I won't prevent you from developing any
> > code you want :-) But there's very little chance of getting it merged,
> > and it would be useful to more people to have a support for that
> > platform in libcamera. It's really your decision, and I'm not blaming
> > you.
> 
> I created some time ago a fork of v4l-utils in order to be able to
> merge the N900 work from Pavel. We can add the N900 work there - or 
> on a separate branch at the main v4l-utils tree.

It's open source, forks are encouraged. I believe it would be a waste of
time, but it's not my time, so I don't mind :-)

-- 
Regards,

Laurent Pinchart
