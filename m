Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EFD271C6EE9
	for <lists+linux-media@lfdr.de>; Wed,  6 May 2020 13:07:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727918AbgEFLH0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 6 May 2020 07:07:26 -0400
Received: from mail.kernel.org ([198.145.29.99]:54584 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727102AbgEFLHZ (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 6 May 2020 07:07:25 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A715D2068E;
        Wed,  6 May 2020 11:07:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1588763245;
        bh=uKEKqSAFW/aYJ2Fu+oNP2OG3gCFuq6s+Y3wl5j44KCE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=uWC3u5WjG91H2+dc4Bkf6aVXMcIZ0cAuEkHSQiBXupiDku785TgQK/8AchuZvCRSG
         oLTZkJjYLiUNP+XKf6tsDH+yQkf+MqTseD2H85JSofiEwG1AEPIj9Uzs5ZCZ7I9PjY
         /4W33vNyBVdBAqI3MwKPvoAUUXXrOumzYHYytn28=
Date:   Wed, 6 May 2020 13:07:22 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Jia-Ju Bai <baijiaju1990@gmail.com>
Cc:     mchehab@kernel.org, kstewart@linuxfoundation.org,
        tomasbortoli@gmail.com, sean@mess.org, allison@lohutok.net,
        tglx@linutronix.de, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: usb: ttusb-dec: avoid buffer overflow in
 ttusb_dec_handle_irq() when DMA failures/attacks occur
Message-ID: <20200506110722.GA2975410@kroah.com>
References: <20200505142110.7620-1-baijiaju1990@gmail.com>
 <20200505181042.GD1199718@kroah.com>
 <0e4a86ee-8c4e-4ac3-8499-4e9a6ed7bd1e@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0e4a86ee-8c4e-4ac3-8499-4e9a6ed7bd1e@gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, May 06, 2020 at 06:13:01PM +0800, Jia-Ju Bai wrote:
> Hi Greg,
> 
> Thanks for the reply :)
> 
> On 2020/5/6 2:10, Greg KH wrote:
> > On Tue, May 05, 2020 at 10:21:10PM +0800, Jia-Ju Bai wrote:
> > > In this case, "buffer[4] - 1 < ARRAY_SIZE(rc_keys)"
> > > can be first satisfied, and then the value of buffer[4] can be changed
> > > to a large number, causing a buffer-overflow vulnerability.
> > Um, maybe.  I agree testing and then using the value can cause problems
> > when userspace provides you with that data and control, but for
> > DMA-backed memory, we are in so much other trouble if that is the case.
> > 
> > > To avoid the risk of this vulnerability, buffer[4] is assigned to a
> > > non-DMA local variable "index" at the beginning of
> > > ttusb_dec_handle_irq(), and then this variable replaces each use of
> > > buffer[4] in the function.
> > I strongly doubt this is even possible.  Can you describe how you can
> > modify DMA memory and if so, would you do something tiny like this?
> > 
> 
> I have never modified DMA memory in the real world, but an attacker can use
> a malicious device to do this.
> There is a video that shows how to use the Inception tool to perform DMA
> attacks and login in the Windows OS without password:
> https://www.youtube.com/watch?v=HDhpy7RpUjM

If you have control over the hardware, and can write to any DMA memory,
again, there's almost nothing a kernel can do to protect from that.

> Besides, the Windows OS resists against DMA attacks by disabling DMA of
> external devices by default:
> http://support.microsoft.com/kb/2516445

So does Linux :)

> Considering that this patch is for a USB media driver, I think that an
> attacker can just insert a malicious USB device to modify DMA memory and
> trigger this bug.

USB devices do not touch DMA memory so they physically can not do things
like what thunderbolt devices can do.

> Besides, not related to this patch, some drivers use DMA to send/receive
> data (such as the URB used in USB drivers and ring descriptors used in
> network drivers). In this case, if the data is malicious and used as an
> array index through DMA, security problems may occur.
> 
> In my opinion, similar to the data from userspace, the data from hardware
> may be also malicious and should be checked.
> 
> Maybe we could discuss this issue with DMA driver developers?

Sure, but I think that's outside the scope of this tiny patch :)

thanks,

greg k-h
