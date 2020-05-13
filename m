Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1FDAF1D1BDB
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2020 19:04:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389825AbgEMREN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 13 May 2020 13:04:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728068AbgEMREN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 13 May 2020 13:04:13 -0400
Received: from gofer.mess.org (gofer.mess.org [IPv6:2a02:8011:d000:212::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08432C061A0C;
        Wed, 13 May 2020 10:04:13 -0700 (PDT)
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 3464B11A001; Wed, 13 May 2020 18:04:11 +0100 (BST)
Date:   Wed, 13 May 2020 18:04:11 +0100
From:   Sean Young <sean@mess.org>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Greg KH <gregkh@linuxfoundation.org>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
        linux-media@vger.kernel.org
Subject: Re: [PATCH 2/3] input: serio: allow more than one byte to be sent at
 once
Message-ID: <20200513170411.GD9559@gofer.mess.org>
References: <20200507135337.2343-1-sean@mess.org>
 <20200507135337.2343-2-sean@mess.org>
 <20200507202546.GM89269@dtor-ws>
 <20200507205918.GA13370@gofer.mess.org>
 <20200511065118.GA1293993@kroah.com>
 <20200512090724.GA31990@gofer.mess.org>
 <20200512173727.GC89269@dtor-ws>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200512173727.GC89269@dtor-ws>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, May 12, 2020 at 10:37:27AM -0700, Dmitry Torokhov wrote:
> On Tue, May 12, 2020 at 10:07:24AM +0100, Sean Young wrote:
> > Now it would be nice to have a discussion about this rather than being
> > dismissed with:
> > 
> > > > > Ummm, serial protocol data size is at most 9 bits so I have no earthly
> > > > > idea how they expect to get 16.
> > 
> > Which is just a tad insulting.
> 
> That was not meant to be insulting, however serial protocol defines that
> the data size is at most 9 bits, so expecting that one can transmit
> anything more than that _atomically_ is wrong. If your device/firmware
> requires 16 bits to be transferred as indivisible units, then serial
> port abstraction is wrong one to be used.

Honestly thank you for explaining that. I had no idea this was an abstract
point about the demarcations of serial port-ness.

There is no physical rs-232 cabling involved at all in this case.

> Now serio is layer "above" serial ports (but does not have to have
> an underlying serial port) that provides byte-oriented communication
> that is expected to mostly flow into host. Its does not expect heavy
> data flows coming from the host and into the device (if you look at all
> the touchscreens, psmouse, etc, they all send initialization sequences
> to the device, and then all the data flows into the host). Therefore
> there is little benefit in optimizing serio writes.

True, I didn't think this would make much of an measurable improvement,
but still, some.

> You are using performance clams as a clutch for the requirement of
> sending u16s, but as I mentioned it is wrong if you use serial ports
> abstraction layer. Greg mentioned ir-usb. You can maybe enhance it, or
> create a similar driver that connects USB to rc-core and ensures that
> you can communicate with the device with exact format it needs.

Yes, I'll go down this route.

Thank you for the discussion, it was very helpful.


Sean
