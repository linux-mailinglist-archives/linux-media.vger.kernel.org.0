Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4BA496CA40E
	for <lists+linux-media@lfdr.de>; Mon, 27 Mar 2023 14:26:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232671AbjC0M0V (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 27 Mar 2023 08:26:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232750AbjC0M0N (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 27 Mar 2023 08:26:13 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F4C840EB
        for <linux-media@vger.kernel.org>; Mon, 27 Mar 2023 05:26:07 -0700 (PDT)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1pglvI-0006F7-4I; Mon, 27 Mar 2023 14:26:04 +0200
Received: from mtr by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1pglvH-0002C7-RD; Mon, 27 Mar 2023 14:26:03 +0200
Date:   Mon, 27 Mar 2023 14:26:03 +0200
From:   Michael Tretter <m.tretter@pengutronix.de>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Daniel Scally <dan.scally@ideasonboard.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Michael Grzeschik <m.grzeschik@pengutronix.de>,
        linux-usb@vger.kernel.org, linux-media@vger.kernel.org,
        kernel@pengutronix.de
Subject: Re: [PATCH 0/8] usb: gadget: uvc: fix errors reported by
 v4l2-compliance
Message-ID: <20230327122603.GB7238@pengutronix.de>
Mail-Followup-To: Michael Tretter <m.tretter@pengutronix.de>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Daniel Scally <dan.scally@ideasonboard.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Michael Grzeschik <m.grzeschik@pengutronix.de>,
        linux-usb@vger.kernel.org, linux-media@vger.kernel.org,
        kernel@pengutronix.de
References: <20230323-uvc-gadget-cleanup-v1-0-e41f0c5d9d8e@pengutronix.de>
 <20230324093834.GJ18895@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230324093834.GJ18895@pendragon.ideasonboard.com>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: mtr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
X-Spam-Status: No, score=-2.3 required=5.0 tests=RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Fri, 24 Mar 2023 11:38:34 +0200, Laurent Pinchart wrote:
> On Thu, Mar 23, 2023 at 12:41:09PM +0100, Michael Tretter wrote:
> > This series fixes various errors and warnings that are reported by
> > v4l2-compliance for the v4l2 output device created by the UVC gadget.
> > 
> > Most notably, it changes the driver to take the initial format from the
> > configfs instead of using a hard coded value that might be rejected later in
> > the SET_FORMAT call. Note that user space is still responsible for negotiating
> > the format with the UVC host.
> 
> I'm afraid I dislike most of this series (apart from the fix to
> REQBUFS). It was a bad idea to add format handling to the driver in the
> first place, and this series adds up code on top of that to please a
> compliance tool but without any added value. This code should never be
> exercised by userspace and will just bloat the kernel. That's not good.

There is a userspace implementation that exercises this code: The GStreamer
v4l2uvcsink element [0] handles the format negotiation with the UVC host, but
internally uses a v4l2sink to pass the video buffers to the V4L2 output device
of the UVC gadget. The v4l2sink element treats the UVC V4L2 device like any
other V4L2 device, uses the specified ioctls, and, thus, expects compliant
behavior from the V4L2 device.

Being able to use a GStreamer pipeline with a v4l2uvcsink and v4l2sink element
to pass video data from any GStreamer source element to a UVC gadget is so
beneficial that it justifies adding the few missing V4L2 callbacks to make the
device's behavior compliant to V4L2. Especially, as the behavior of the code
can easily be exercised and tested with v4l2-compliance.

Therefore, I think the added code actually has value, as it allows to reuse
existing userspace code for V4L2 devices with the V4L2 device of the UVC
gadget.

Michael

[0] https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/1304

> I'd recommend reverting the series that add format handling if you want
> to improve the UVC gadget driver.
> 
> > To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > To: Daniel Scally <dan.scally@ideasonboard.com>
> > To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > Cc: Michael Grzeschik <m.grzeschik@pengutronix.de>
> > Cc: linux-usb@vger.kernel.org
> > Cc: linux-media@vger.kernel.org
> > Cc: kernel@pengutronix.de
> > Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
> > 
> > ---
> > Michael Tretter (8):
> >       usb: gadget: uvc: use fourcc printk helper
> >       usb: gadget: uvc: fix return code of REQBUFS
> >       usb: gadget: uvc: implement s/g_output ioctl
> >       usb: gadget: uvc: move video format initialization to uvc_v4l2
> >       usb: gadget: uvc: initialize video format using configfs
> >       usb: gadget: uvc: try harder to find a valid format
> >       usb: gadget: uvc: add colorspace handling
> >       usb: gadget: uvc: implement s/g_parm
> > 
> >  drivers/usb/gadget/function/f_uvc.c     |   2 +
> >  drivers/usb/gadget/function/uvc.h       |   5 +
> >  drivers/usb/gadget/function/uvc_queue.c |   6 +-
> >  drivers/usb/gadget/function/uvc_v4l2.c  | 235 ++++++++++++++++++++++++++++++--
> >  drivers/usb/gadget/function/uvc_v4l2.h  |   3 +
> >  drivers/usb/gadget/function/uvc_video.c |   5 -
> >  6 files changed, 238 insertions(+), 18 deletions(-)
> > ---
> > base-commit: 8be174835f07b2c106b9961c0775486d06112a3c
> > change-id: 20230323-uvc-gadget-cleanup-47b1495befb9
