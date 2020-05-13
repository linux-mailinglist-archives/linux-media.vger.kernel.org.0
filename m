Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 18D421D1AAD
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2020 18:09:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389263AbgEMQJb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 13 May 2020 12:09:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730657AbgEMQJb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 13 May 2020 12:09:31 -0400
X-Greylist: delayed 111723 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 13 May 2020 09:09:31 PDT
Received: from gofer.mess.org (gofer.mess.org [IPv6:2a02:8011:d000:212::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F0F5C061A0C;
        Wed, 13 May 2020 09:09:31 -0700 (PDT)
Received: by gofer.mess.org (Postfix, from userid 1000)
        id AD35C11A001; Wed, 13 May 2020 17:09:28 +0100 (BST)
Date:   Wed, 13 May 2020 17:09:28 +0100
From:   Sean Young <sean@mess.org>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
        linux-media@vger.kernel.org
Subject: Re: [PATCH 2/3] input: serio: allow more than one byte to be sent at
 once
Message-ID: <20200513160928.GB9559@gofer.mess.org>
References: <20200507135337.2343-1-sean@mess.org>
 <20200507135337.2343-2-sean@mess.org>
 <20200507202546.GM89269@dtor-ws>
 <20200507205918.GA13370@gofer.mess.org>
 <20200511065118.GA1293993@kroah.com>
 <20200512090724.GA31990@gofer.mess.org>
 <20200513081646.GA770255@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200513081646.GA770255@kroah.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, May 13, 2020 at 10:16:46AM +0200, Greg KH wrote:
> On Tue, May 12, 2020 at 10:07:24AM +0100, Sean Young wrote:
> > So this device is the infrared kind which rc-core (in drivers/media/rc/)
> > supports, remotes and such things (not for serial IR). So by using a 
> > rc-core driver, it can use kernel IR decoding, BPF decoding, lirc chardev
> > and rc keymaps, etc.
> 
> So why do you want to user serio for this?  serio should only be for
> input devices with a serial protocol.

Admittedly this is a bit tenuous.

What I'm trying to do is write a kernel driver which uses the usb serial
drivers, and not write a poor man's version of usb serial in the IR driver.

> I think a custom usb driver that exposes the interfaces as input devices
> is going to be the simplest thing for you to do here as you will have
> full control over the packet size and format much easier.  Odds are it
> will be less work overall for this.

Admittedly I don't think it will be much code, so maybe it won't be so
ugly. It's just the code duplication I was trying to avoid.

So, I'll go ahead and as you suggest.

Thank you for your time and thoughts on this.


Sean
