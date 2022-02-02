Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E8DE4A6A98
	for <lists+linux-media@lfdr.de>; Wed,  2 Feb 2022 04:42:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244053AbiBBDmB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 1 Feb 2022 22:42:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243770AbiBBDmA (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 1 Feb 2022 22:42:00 -0500
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98C09C06173B
        for <linux-media@vger.kernel.org>; Tue,  1 Feb 2022 19:42:00 -0800 (PST)
Received: by mail-pj1-x102b.google.com with SMTP id r59so19045605pjg.4
        for <linux-media@vger.kernel.org>; Tue, 01 Feb 2022 19:42:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=hkM0INNT5ToyPpz8o/c48ueKP4pJusE9J4xkc01YiWo=;
        b=X2rRfZsKiwEgkCuMlhd9dh+eCA+LMtVK77jTFgjKml4w3Qi9/213ObL3zGVZ6XOqPF
         D65XXGjhA7nhGgmBnNDBewQm9OVTrNX1p6fTceSyirCHVY/5E+4qpHkokXHv1Vc7uOXD
         XgMKUpOJ5IcHgF2pnQvLvHS7QS71OiSIqhw6g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=hkM0INNT5ToyPpz8o/c48ueKP4pJusE9J4xkc01YiWo=;
        b=wTqPVRttJCZm+aS3GLIz1D/gFKa4CW56T+bQV76wzpZHAaXmXxoCLBc2hblehpVHw5
         VRBKssvKF8+243+LEYCGoGKMBKDNK8+tEnX6FgR8fnARRwqVCL7cSgyb2RwwqC/iVhZL
         rUuH2Ol49FPGC7bOqbnaQUwiDNYJ8ACj0VT1gXCYR4JU2os1oYBQPV5jHNab2B7eKMNX
         81m2DaPidYBnSuTpdWPWqsZJAjMzq5zAvHL4YHfXOlIKjdh/MZ1MQ2RXU9eDlh0m197M
         aX7NTZo2u7gn/hDRUJGLhgFTeAcKzaMNhb64Ik5ErpC3jDl04iTKejfwnPBMp8WsShOs
         mFjQ==
X-Gm-Message-State: AOAM531PKTkgMe19BNBZbAF9aeElSDq5oW3+C3vZ4QHh+MiSe3KeWDpU
        S0CroGjnSzHHjwL4D2EykVq/cw==
X-Google-Smtp-Source: ABdhPJwRsgcqGZ9GY7sviAxBjq2ieSkncT1SGrK8qo7Nog3t3dYzkennuudFjLIrCT5Nr0O8ONUJdQ==
X-Received: by 2002:a17:90b:1881:: with SMTP id mn1mr5953137pjb.236.1643773320175;
        Tue, 01 Feb 2022 19:42:00 -0800 (PST)
Received: from google.com ([2401:fa00:8f:203:9ae0:cb9f:b05e:ec])
        by smtp.gmail.com with ESMTPSA id i127sm7462698pfg.142.2022.02.01.19.41.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Feb 2022 19:41:59 -0800 (PST)
Date:   Wed, 2 Feb 2022 12:41:54 +0900
From:   Sergey Senozhatsky <senozhatsky@chromium.org>
To:     Aditya Garg <gargaditya08@live.com>
Cc:     "laurent.pinchart@ideasonboard.com" 
        <laurent.pinchart@ideasonboard.com>,
        "laurent.pinchart+renesas@ideasonboard.com" 
        <laurent.pinchart+renesas@ideasonboard.com>,
        "mchehab@kernel.org" <mchehab@kernel.org>,
        "mchehab+huawei@kernel.org" <mchehab+huawei@kernel.org>,
        "hverkuil@xs4all.nl" <hverkuil@xs4all.nl>,
        "sergey.senozhatsky@gmail.com" <sergey.senozhatsky@gmail.com>,
        "ribalda@chromium.org" <ribalda@chromium.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        Orlando Chamberlain <redecorating@protonmail.com>,
        "paul@mrarm.io" <paul@mrarm.io>, Aun-Ali Zaidi <admin@kodeit.net>,
        Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH RESEND] media: uvcvideo: Add support for Apple
 T2-attached FaceTime HD Camera
Message-ID: <Yfn9glTzki60IRFy@google.com>
References: <527C2E71-12E2-45D1-9B50-5A413B6920A1@live.com>
 <9BD1D373-F588-44EE-AFC0-3D691B4134DA@live.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9BD1D373-F588-44EE-AFC0-3D691B4134DA@live.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On (22/01/31 09:12), Aditya Garg wrote:
> > On 26-Jan-2022, at 4:07 PM, Aditya Garg <gargaditya08@live.com> wrote:
> > 
> > From: Paul Pawlowski <paul@mrarm.io>
> > 
> > Adds the requisite device id to support detection of the Apple FaceTime
> > HD webcam exposed over the T2 BCE VHCI interface.
> > 
> > Tested-by: Aun-Ali Zaidi <admin@kodeit.net>
> > Signed-off-by: Paul Pawlowski <paul@mrarm.io>
> > Signed-off-by: Aun-Ali Zaidi <admin@kodeit.net>
> > Signed-off-by: Aditya Garg <gargaditya08@live.com>

I'm not the maintainer, but the patch looks OK to me
FWIW
Reviewed-by: Sergey Senozhatsky <senozhatsky@chromium.org>


Laurent, Ricardo, any thoughts?


> > drivers/media/usb/uvc/uvc_driver.c | 9 +++++++++
> > 1 file changed, 9 insertions(+)
> > 
> > diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> > index 7c007426e..88dc9e7aa 100644
> > --- a/drivers/media/usb/uvc/uvc_driver.c
> > +++ b/drivers/media/usb/uvc/uvc_driver.c
> > @@ -2848,6 +2848,15 @@ static const struct usb_device_id uvc_ids[] = {
> > 	  .bInterfaceProtocol	= 0,
> > 	  .driver_info		= UVC_INFO_QUIRK(UVC_QUIRK_PROBE_MINMAX
> > 					| UVC_QUIRK_BUILTIN_ISIGHT) },
> > +	/* Apple FaceTime HD Camera (Built-In) */
> > +	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
> > +				| USB_DEVICE_ID_MATCH_INT_INFO,
> > +	  .idVendor		= 0x05ac,
> > +	  .idProduct		= 0x8514,
> > +	  .bInterfaceClass	= USB_CLASS_VIDEO,
> > +	  .bInterfaceSubClass	= 1,
> > +	  .bInterfaceProtocol	= 0,
> > +	  .driver_info		= (kernel_ulong_t)&uvc_quirk_probe_def },
> > 	/* Apple Built-In iSight via iBridge */
> > 	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
> > 				| USB_DEVICE_ID_MATCH_INT_INFO,
