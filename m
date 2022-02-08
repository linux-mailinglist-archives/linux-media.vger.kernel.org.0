Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8FA8E4ADE94
	for <lists+linux-media@lfdr.de>; Tue,  8 Feb 2022 17:46:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1383551AbiBHQqi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Feb 2022 11:46:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238447AbiBHQqg (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 8 Feb 2022 11:46:36 -0500
Received: from gofer.mess.org (gofer.mess.org [IPv6:2a02:8011:d000:212::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30594C061576
        for <linux-media@vger.kernel.org>; Tue,  8 Feb 2022 08:46:33 -0800 (PST)
Received: by gofer.mess.org (Postfix, from userid 1000)
        id C7372101BFE; Tue,  8 Feb 2022 16:46:31 +0000 (UTC)
Date:   Tue, 8 Feb 2022 16:46:31 +0000
From:   Sean Young <sean@mess.org>
To:     Marko =?iso-8859-1?B?TeRrZWzk?= <marko.makela@iki.fi>
Cc:     Antti Palosaari <crope@iki.fi>, linux-media@vger.kernel.org
Subject: Re: Inconsistent RC5 ir-keytable events
Message-ID: <YgKeZ+vAynWvvijz@gofer.mess.org>
References: <20220103092123.GA21115@gofer.mess.org>
 <YdLRa86ddm2T4xew@jyty>
 <20220103110743.GA22001@gofer.mess.org>
 <YdLqL2ViSwWzS/Ig@jyty>
 <YdRwqt1pwb8osT6V@jyty>
 <20220105095355.GA6428@gofer.mess.org>
 <YdbVfObDZZnFIDc3@jyty>
 <YeBZmM0ISnFGcsVa@gofer.mess.org>
 <YeEYxwUkCV7rSa0A@jyty>
 <YfV2TeOgSiVShmZN@jyty>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YfV2TeOgSiVShmZN@jyty>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Marko,

On Sat, Jan 29, 2022 at 07:15:57PM +0200, Marko Mäkelä wrote:
> Hi Sean,
> 
> Did you have a chance to repeat my findings with a remote control unit that
> uses the RC5 protocol?

Yes, I've reproduced the problem now. It's very weird.

After pressing button 1, waiting for a second or two, and then pressing button
3, the device reports some old IR from button 1 before reporting the IR from
button 3.

The IR is not a copy of old data, it so presumably its IR that was not 
reported before. Now I don't know why this IR gets reported so late.

> I tried to understand the code changes. A few observations:
> 
> In rtl2831u_get_rc_config(), rc->interval is set to 400 and rc->timeout is
> not set at all. Maybe it is OK, similar chips supported by the same driver.

The timeout won't have an affect on this problem.

> In rtl2832u_rc_query(), the idle_length is being computed from the last two
> bytes of the IR_RX_BUF buffer. The threshold is 0xc0 and thus
> it can only be exceeded if both last 7-bit bytes are included in the sum.
> Side note: the & 0x7f is redundant, because the most significant bit was
> already tested to be clear:
> 
> 	idle_length = 0;
> 	if (len > 2) {
> 		if (!(buf[len - 1] & 0x80))
> 			idle_length += buf[len - 1] & 0x7f;
> 		if (!(buf[len - 2] & 0x80))
> 			idle_length += buf[len - 2] & 0x7f;
> 	}
> 
> 	dev_dbg(&d->intf->dev, "idle_length=%x\n", idle_length);
> 
> 	if (idle_length < 0xbf)
> 		return 0;

Yes, you are right. Note that I've observed this problem also we did not
enter the early return here (which I introduced).

> However, I spotted a potential problem here. I may of course be mistaken
> because I do not know how the IR_RX_BUF is supposed to work. Could it happen
> that buf[] contains some IR events, then 2 or more consecutive bytes of no
> pulses (with the total time exceeding 0xbf*51µs), and then again some IR
> events until the very end of the buffer, so that in the above check, we
> would return 0?

I have not seen this happen. You can enable debugging for this using:

echo 'file rtl28xxu.c +p' > /sys/kernel/debug/dynamic_debug/control

dmesg -w

I do not know exactly how the buffer works, only some experimentation will
help here. Unless there is a vendor driver/documentation for this device.

> Could we in that case discard some IR events? Could that
> explain the glitch that I observed with the NEC protocol?

I'm not really sure this is the problem, that's what not what I observed.


Sean
