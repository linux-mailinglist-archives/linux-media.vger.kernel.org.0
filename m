Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 20B91566614
	for <lists+linux-media@lfdr.de>; Tue,  5 Jul 2022 11:27:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230402AbiGEJ1I (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 Jul 2022 05:27:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231208AbiGEJ1E (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 5 Jul 2022 05:27:04 -0400
Received: from gofer.mess.org (gofer.mess.org [IPv6:2a02:8011:d000:212::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 732AAB1EB
        for <linux-media@vger.kernel.org>; Tue,  5 Jul 2022 02:27:00 -0700 (PDT)
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 5B0E710029D; Tue,  5 Jul 2022 10:26:58 +0100 (BST)
Date:   Tue, 5 Jul 2022 10:26:58 +0100
From:   Sean Young <sean@mess.org>
To:     Marko =?iso-8859-1?B?TeRrZWzk?= <marko.makela@iki.fi>
Cc:     linux-media@vger.kernel.org
Subject: Re: [PATCH 2/2] media: rtl28xxu: improve IR receiver
Message-ID: <YsQD4nqMq8FYpE6E@gofer.mess.org>
References: <YrmMQNPHkDGZ843v@gofer.mess.org>
 <YrqfTnY4Azqt44e4@jyty>
 <Yr/+g/j20kb5kzki@gofer.mess.org>
 <YsHLlg9CccrEzOjL@jyty>
 <YsKVA4bKNuRUOZpf@gofer.mess.org>
 <YsKwwVaFYrOxMhZw@jyty>
 <YsK6Rlk/ODYUE2/F@gofer.mess.org>
 <YsM5xhEXb6rzl1X9@jyty>
 <YsPnfBYnW2GJk4Hn@gofer.mess.org>
 <YsP68l7IuktIiMLD@jyty>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YsP68l7IuktIiMLD@jyty>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Marko,

On Tue, Jul 05, 2022 at 11:48:50AM +0300, Marko Mäkelä wrote:
> Tue, Jul 05, 2022 at 08:25:48AM +0100, Sean Young wrote:
> > On Mon, Jul 04, 2022 at 10:04:38PM +0300, Marko Mäkelä wrote:
> > > Mon, Jul 04, 2022 at 11:00:38AM +0100, Sean Young wrote:
> > > > On Mon, Jul 04, 2022 at 12:20:01PM +0300, Marko Mäkelä wrote:
> > > > > Mon, Jul 04, 2022 at 08:21:39AM +0100, Sean Young wrote:
> > > > > > On Sun, Jul 03, 2022 at 08:02:14PM +0300, Marko Mäkelä wrote:
> > > > > I tested the attached patch (which was created on 5.19-rc5, which
> > > > > failed to boot on my system for unrelated reasons) on Linux 5.17, on
> > > > > top of your fixes to rtl28xxu and rc-core.
> > > >
> > > > You'll need to fix this.
> > > 
> > > The 5.19-rc5 boot failure could have been related to LUKS setup on that
> > > machine, because a kernel panic message was displayed before I was being
> > > prompted for an encryption key. The modules would not have been loaded at
> > > that point, so I do not think that it is related to my modifications.
> > > 
> > > When compiled for the v5.17 kernel release tag on another computer, the
> > > patch that implements rc_keydown_or_repeat() worked for me.
> > > 
> > > It does not look like there are many changes in drivers/media/rc between
> > > 5.17 and 5.19.
> > 
> > Your patch needs a `Signed-off-by` and it should not be attached, it should
> > be inline in your email.
> 
> Thank you for your patience. I hope that I got it right. It would be my very
> first patch submission to the Linux kernel. I did not see it appear on this
> list archive yet. You are Cc'd.

Thanks, I'll have a look.

> > > > See https://github.com/seanyoung/cir/
> > > 
> > > This could open up many possibilities. Would the decoded events also be
> > > available via some low-level interface to user-space programs, in addition
> > > to the input event driver?
> > 
> > The plan was for it to run once, generate an eBPF program, attach that an
> > exit. The eBPF program sends the decoded stuff to the lirc chardev in
> > this struct:
> > 
> > https://www.kernel.org/doc/html/latest/userspace-api/media/rc/lirc-dev-intro.html#data-types-used-by-lirc-mode-scancode
> > 
> > This is the struct you're amending with LIRC_SCANCODE_FLAG_REPEAT.
> > 
> > Will that be sufficient for your needs?
> 
> I think that it should cover the most common types of remote control units.

That is the hope.

> I can name an example of a complex IR remote control, which I think would be
> challenging to repurpose for controlling anything else than the original
> type of device. But, I would think that something Bluetooth or WLAN based on
> a touchscreen device will replace IR in such applications.  The remote
> control of my air conditioner presents all settings on a local LCD. On every
> change, maybe after a short timeout of inactivity, it will send a long IR
> message with all the settings. The 32 bits of keycode or 64 bits of scancode
> would not be sufficient for that.

There certainly can be an eBPF decoder for this type of IR, but I'm not sure
what the use case is, because it's not key information. Maybe there is
something else in eBPF which is more suitable.

BTW I'm sure it's possible to control an air conditioner with the cir tool
above, using the IRP language. Would be great to see something like that.
Transmission is already working, so just requires reverse engineering the
protocol and writing some IRP for it. :)


Sean
