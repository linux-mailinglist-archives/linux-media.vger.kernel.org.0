Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DFAAA4223FF
	for <lists+linux-media@lfdr.de>; Tue,  5 Oct 2021 12:59:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234128AbhJELBV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 Oct 2021 07:01:21 -0400
Received: from mail.kernel.org ([198.145.29.99]:41924 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233449AbhJELBV (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 5 Oct 2021 07:01:21 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 44C9B6117A;
        Tue,  5 Oct 2021 10:59:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1633431570;
        bh=4Bw7IC/JQi7WLEgbnB19tLNhnZc+m6/Jf/4hezFbSTI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=q4lt0bsytdxpsPQ03CZBugzVdrxit7FK4abolx0+9xKgf+OYRPYOPEqKVS4+7DLVW
         lkX4+Op0B0Eh8rWrafYkdkt0luBjblg3wLso3UJVE2vhcFn9zKr2guUeqCJzgvLx6F
         FxTUMidNT9/RG6HKzguqMq81uPWSOn+yeKYk6Q3A=
Date:   Tue, 5 Oct 2021 12:59:28 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Michael Grzeschik <m.grzeschik@pengutronix.de>,
        linux-usb@vger.kernel.org, balbi@kernel.org, hverkuil@xs4all.nl,
        m.tretter@pengutronix.de, linux-media@vger.kernel.org
Subject: Re: [RESEND PATCH v4] usb: gadget: uvc: fix multiple opens
Message-ID: <YVwwECkXk+nKn7kE@kroah.com>
References: <87pn261h4c.fsf@kernel.org>
 <20211003201355.24081-1-m.grzeschik@pengutronix.de>
 <YVuUDOf+BDTxe/IR@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YVuUDOf+BDTxe/IR@pendragon.ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Oct 05, 2021 at 02:53:48AM +0300, Laurent Pinchart wrote:
> Hi Michael,
> 
> Thank you for resending this.
> 
> On Sun, Oct 03, 2021 at 10:13:55PM +0200, Michael Grzeschik wrote:
> > From: Thomas Haemmerle <thomas.haemmerle@wolfvision.net>
> > 
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
> 
> Reflowing the paragraph would be nice (this could be done when applying
> the patch, or not at all).
> 
> > With this a process is able to check capabilities of the v4l2 device
> > without deactivating the function for the actual UVC application.
> > 
> > Reviewed-By: Michael Tretter <m.tretter@pengutronix.de>
> > Signed-off-by: Thomas Haemmerle <thomas.haemmerle@wolfvision.net>
> > Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
> > Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> Felipe, please let me know if you want me to take this in my tree and
> issue a pull request, otherwise I'll assume you'll pick it up.

I'll pick it up now, thanks.

greg k-h
