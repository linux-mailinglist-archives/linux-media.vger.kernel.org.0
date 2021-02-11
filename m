Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B467318E02
	for <lists+linux-media@lfdr.de>; Thu, 11 Feb 2021 16:19:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229947AbhBKPTa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Feb 2021 10:19:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229964AbhBKPNI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Feb 2021 10:13:08 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E9C4C061788
        for <linux-media@vger.kernel.org>; Thu, 11 Feb 2021 07:04:54 -0800 (PST)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1lADWQ-0003e7-Lg; Thu, 11 Feb 2021 16:04:46 +0100
Received: from mtr by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1lADWP-0000h5-Af; Thu, 11 Feb 2021 16:04:45 +0100
Date:   Thu, 11 Feb 2021 16:04:45 +0100
From:   Michael Tretter <m.tretter@pengutronix.de>
To:     Felipe Balbi <balbi@kernel.org>
Cc:     Thomas Haemmerle <thomas.haemmerle@wolfvision.net>,
        laurent.pinchart@ideasonboard.com, gregkh@linuxfoundation.org,
        hverkuil@xs4all.nl, linux-usb@vger.kernel.org,
        linux-media@vger.kernel.org
Subject: Re: [PATCH v4] usb: gadget: uvc: fix multiple opens
Message-ID: <20210211150445.GM30300@pengutronix.de>
Mail-Followup-To: Michael Tretter <m.tretter@pengutronix.de>,
        Felipe Balbi <balbi@kernel.org>,
        Thomas Haemmerle <thomas.haemmerle@wolfvision.net>,
        laurent.pinchart@ideasonboard.com, gregkh@linuxfoundation.org,
        hverkuil@xs4all.nl, linux-usb@vger.kernel.org,
        linux-media@vger.kernel.org
References: <2920c6ea-d191-a6cb-ec90-dda22bb9df55@wolfvision.net>
 <20201201192730.5633-1-thomas.haemmerle@wolfvision.net>
 <87pn261h4c.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87pn261h4c.fsf@kernel.org>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 16:04:17 up 71 days,  3:31, 111 users,  load average: 0.18, 0.29,
 0.18
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: mtr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, 15 Jan 2021 15:09:39 +0200, Felipe Balbi wrote:
> Thomas Haemmerle <thomas.haemmerle@wolfvision.net> writes:
> > Currently, the UVC function is activated when open on the corresponding
> > v4l2 device is called.
> > On another open the activation of the function fails since the
> > deactivation counter in `usb_function_activate` equals 0. However the
> > error is not returned to userspace since the open of the v4l2 device is
> > successful.
> >
> > On a close the function is deactivated (since deactivation counter still
> > equals 0) and the video is disabled in `uvc_v4l2_release`, although the
> > UVC application potentially is streaming.
> >
> > Move activation of UVC function to subscription on UVC_EVENT_SETUP
> > because there we can guarantee for a userspace application utilizing
> > UVC.
> > Block subscription on UVC_EVENT_SETUP while another application already
> > is subscribed to it, indicated by `bool func_connected` in
> > `struct uvc_device`.
> > Extend the `struct uvc_file_handle` with member `bool is_uvc_app_handle`
> > to tag it as the handle used by the userspace UVC application.
> >
> > With this a process is able to check capabilities of the v4l2 device
> > without deactivating the function for the actual UVC application.
> >
> > Signed-off-by: Thomas Haemmerle <thomas.haemmerle@wolfvision.net>
> 
> Laurent, do you agree with the change?

Gentle ping.

Michael
