Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 69E2AC253B
	for <lists+linux-media@lfdr.de>; Mon, 30 Sep 2019 18:36:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732265AbfI3QgK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 30 Sep 2019 12:36:10 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:55094 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731459AbfI3QgK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 30 Sep 2019 12:36:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
        From:Date:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=UWQiVDLYiRGcNlJcUhsM1uiwFgTPXa9ToDA5YpcNSbk=; b=lNuuMEcVXyAceTbuEy764dxpl
        HUgqZiiEbmofF4MDJ1hAwuw9kZCZRd3rHUuYr0xiZwp/XWyUyeEyzkIY0dOGlOIUhcezVXCb38Urk
        IzbWyNtRF2Q4H5RYRqsi7HpzOzyov9rxtWmDxHzE+qIIxy1QfCpiSEOb5wH03iyD5fmkvI2k5aull
        HM8yffgOXpYZ49EaKlJWcwguHEXoVskB1F7J08CHBFHqPo4MGx+O/q/jLX0TEVTe6fbxEulvBoAl0
        EmKjR0K+rj1Wycfivc4UwdKJ+bcQ21EuGkNpoZqaa2GgVkXlY0PzdhOs/6ZHBM0ztmZ7eF8NhOCd5
        I4sFyx3zg==;
Received: from [179.95.58.188] (helo=coco.lan)
        by bombadil.infradead.org with esmtpsa (Exim 4.92.2 #3 (Red Hat Linux))
        id 1iEyee-00070i-BN; Mon, 30 Sep 2019 16:36:08 +0000
Date:   Mon, 30 Sep 2019 13:36:03 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To:     Johan Hovold <johan@kernel.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Pete Zaitcev <zaitcev@redhat.com>,
        Alan Stern <stern@rowland.harvard.edu>,
        linux-media@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] USB: fix runtime PM after driver unbind
Message-ID: <20190930133603.0192f809@coco.lan>
In-Reply-To: <20190930161205.18803-1-johan@kernel.org>
References: <20190930161205.18803-1-johan@kernel.org>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Mon, 30 Sep 2019 18:12:01 +0200
Johan Hovold <johan@kernel.org> escreveu:

> A recent change in USB core broke runtime-PM after driver unbind in
> several drivers (when counting all USB serial drivers). Specifically,
> drivers which took care not modify the runtime-PM usage counter after
> their disconnect callback had returned, would now fail to be suspended
> when a driver is later bound.
> 
> I guess Greg could take all of these directly through his tree, unless
> the media maintainers disagree.

Patches look ok and I'm fine if they go via Greg's tree. So:

Acked-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>

Yet, on a quick look on media:

	$ git grep -l usb_.*pm drivers/media/usb/
	drivers/media/usb/cpia2/cpia2_usb.c
	drivers/media/usb/dvb-usb-v2/az6007.c
	drivers/media/usb/dvb-usb-v2/dvb_usb.h
	drivers/media/usb/dvb-usb-v2/dvb_usb_core.c
	drivers/media/usb/gspca/gspca.c
	drivers/media/usb/gspca/gspca.h
	drivers/media/usb/siano/smsusb.c
	drivers/media/usb/stkwebcam/stk-webcam.c
	drivers/media/usb/usbvision/usbvision-i2c.c
	drivers/media/usb/uvc/uvc_driver.c
	drivers/media/usb/uvc/uvc_v4l2.c
	drivers/media/usb/zr364xx/zr364xx.c

There are other drivers beside stkwebcam with has some PM routines.

Ok, only two (stkwebcam and uvcvideo) uses usb_autopm_get_interface() and
usb_autopm_put_interface(), but I'm wondering if the others are doing the
right thing, as their implementation are probably older.

> 
> Johan
> 
> 
> Johan Hovold (4):
>   USB: usb-skeleton: fix runtime PM after driver unbind
>   USB: usblp: fix runtime PM after driver unbind
>   USB: serial: fix runtime PM after driver unbind
>   media: stkwebcam: fix runtime PM after driver unbind
> 
>  drivers/media/usb/stkwebcam/stk-webcam.c | 3 +--
>  drivers/usb/class/usblp.c                | 8 +++++---
>  drivers/usb/serial/usb-serial.c          | 5 +----
>  drivers/usb/usb-skeleton.c               | 8 +++-----
>  4 files changed, 10 insertions(+), 14 deletions(-)
> 



Thanks,
Mauro
