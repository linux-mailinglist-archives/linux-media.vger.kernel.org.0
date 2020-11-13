Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 47ACA2B1BF0
	for <lists+linux-media@lfdr.de>; Fri, 13 Nov 2020 14:35:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726376AbgKMNff (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 Nov 2020 08:35:35 -0500
Received: from mail.kernel.org ([198.145.29.99]:41526 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726160AbgKMNfe (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 Nov 2020 08:35:34 -0500
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 58DD722201;
        Fri, 13 Nov 2020 13:35:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1605274526;
        bh=4LrSB+L6f6m3Hv04Ngx55q6oO+x0uJsQ+LVSLRd8aeY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=oB6Nqu07LPWM/yPVqcjSoxdeChM/3+UZpoP0QY3TavErbjzReKlVsatUNJLu+cZqe
         rYh1uuhB7y8SFqunxtFjZ12yvPx2rGzG6a+PcDiqTRaAVVEF0bzNKAtsXJ3ZY0IoK+
         ZlHcGi8Hky/88cnajPcI2iMRefrO4f1MbU7aECjk=
Date:   Fri, 13 Nov 2020 14:36:23 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     thomas.haemmerle@wolfvision.net
Cc:     laurent.pinchart@ideasonboard.com, balbi@kernel.org,
        hverkuil@xs4all.nl, linux-usb@vger.kernel.org,
        m.tretter@pengutronix.de, linux-media@vger.kernel.org
Subject: Re: [PATCH v3] usb: gadget: uvc: fix multiple opens
Message-ID: <X66L17t41LkoIOm1@kroah.com>
References: <X6pmMFYmzO088p4g@kroah.com>
 <20201110143015.15134-1-thomas.haemmerle@wolfvision.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201110143015.15134-1-thomas.haemmerle@wolfvision.net>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Nov 10, 2020 at 03:30:15PM +0100, thomas.haemmerle@wolfvision.net wrote:
> From: Thomas Haemmerle <thomas.haemmerle@wolfvision.net>
> 
> Currently, the UVC function is activated when open on the corresponding
> v4l2 device is called.
> On another open the activation of the function fails since the
> deactivation counter in `usb_function_activate` equals 0. However the
> error is not returned to userspace since the open of the v4l2 device is
> successful.
> 
> On a close the function is deactivated (since deactivation counter still
> equals 0) and the video is disabled in `uvc_v4l2_release`, although the
> UVC application potentially is streaming.
> 
> Move activation of UVC function to subscription on UVC_EVENT_SETUP
> because there we can guarantee for a userspace application utilizing UVC.
> Block subscription on UVC_EVENT_SETUP while another application already
> is subscribed to it, indicated by `bool func_connected` in
> `struct uvc_device`.
> Extend the `struct uvc_file_handle` with member `bool is_uvc_app_handle`
> to tag it as the handle used by the userspace UVC application.
> 
> With this a process is able to check capabilities of the v4l2 device
> without deactivating the function for the actual UVC application.
> 
> Signed-off-by: Thomas Haemmerle <thomas.haemmerle@wolfvision.net>
> ---
> v3:
>  - replace `unsigned int connections` with `bool func_connected`
>  - rename `bool connected` to `bool is_uvc_app_handle`

Can you fix this up based on Hans's review?

thanks,

greg k-h
