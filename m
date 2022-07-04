Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9A06256518E
	for <lists+linux-media@lfdr.de>; Mon,  4 Jul 2022 12:03:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234040AbiGDKAs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 4 Jul 2022 06:00:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234030AbiGDKAm (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 4 Jul 2022 06:00:42 -0400
Received: from gofer.mess.org (gofer.mess.org [IPv6:2a02:8011:d000:212::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20FFCDEBC
        for <linux-media@vger.kernel.org>; Mon,  4 Jul 2022 03:00:41 -0700 (PDT)
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 630F11002A4; Mon,  4 Jul 2022 11:00:38 +0100 (BST)
Date:   Mon, 4 Jul 2022 11:00:38 +0100
From:   Sean Young <sean@mess.org>
To:     Marko =?iso-8859-1?B?TeRrZWzk?= <marko.makela@iki.fi>
Cc:     linux-media@vger.kernel.org
Subject: Re: [PATCH 2/2] media: rtl28xxu: improve IR receiver
Message-ID: <YsK6Rlk/ODYUE2/F@gofer.mess.org>
References: <cover.1644683294.git.sean@mess.org>
 <704b3d7e5a7a95cbd5e4dfc25a41454e919aed95.1644683294.git.sean@mess.org>
 <YrhSK5l0uQZT76Fi@jyty>
 <YrmMQNPHkDGZ843v@gofer.mess.org>
 <YrqfTnY4Azqt44e4@jyty>
 <Yr/+g/j20kb5kzki@gofer.mess.org>
 <YsHLlg9CccrEzOjL@jyty>
 <YsKVA4bKNuRUOZpf@gofer.mess.org>
 <YsKwwVaFYrOxMhZw@jyty>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YsKwwVaFYrOxMhZw@jyty>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Marko,

On Mon, Jul 04, 2022 at 12:20:01PM +0300, Marko Mäkelä wrote:
> Mon, Jul 04, 2022 at 08:21:39AM +0100, Sean Young wrote:
> > On Sun, Jul 03, 2022 at 08:02:14PM +0300, Marko Mäkelä wrote:
> > > For protocols that do not use a toggle bit, the last parameter of
> > > rc_keydown() will usually be toggle=0, and explicit calls to rc_repeat()
> > > will be issued when needed. For those protocols, I thought that we would not
> > > want rc_keydown() to set any LIRC_SCANCODE_FLAG_REPEAT flag under any
> > > circumstances.
> > 
> > Toggle and repeat are distinct concepts.
> > 
> > rc_repeat() is for protocols which have a special repeat message, which
> > carry no information other that "repeat the last message". However,
> > all protocols repeat. Whether they use a special repeat message or not.
> > 
> > It's right that if a protocol repeats a message, LIRC_SCANCODE_FLAG_REPEAT
> > is set.
> 
> Is it right to set the flag when a message is being repeated due to user
> effort (repeatedly pressing and releasing a button, instead of holding the
> button down)?

The problem here is that the nec repeat is used by some remotes, but not
others. Some nec remotes repeat the entire code every time. Our generic nec
decoder cannot distinguish between the two. So, our nec decoder interprets
both a nec repeat and a repeated code as "button being held down".

rc5 is a much nicer protocol and explicitly uses a toggle bit to specify
the button has been released/pressed. Some protocols use more than one
bit for toggle, in case a toggle was lost due to packet loss.

> If it is, is it consistent to avoid setting the flag when a
> protocol uses a toggle bit (say, RC5)?

No, RC5 repeats the same message if a button is being held down with the same
toggle value. We should get a LIRC_SCANCODE_FLAG_REPEAT in this case.

> In that case, the toggle bit would
> change its value each time the button is pressed, and your suggested change
> to rc_keydown() would not set the repeat flag.

If we can distinguish between press/release vs hold then it is not a repeat.
If it is being held down. then it is a repeat.

> As far as I understand, the change that you suggested would set the
> LIRC_SCANCODE_FLAG_REPEAT if I repeatedly press a button on the NEC protocol
> remote control, but not on an RC5 remote control.

RC5 too.

> I tested the attached patch (which was created on 5.19-rc5, which failed to
> boot on my system for unrelated reasons) on Linux 5.17, on top of your fixes
> to rtl28xxu and rc-core.

You'll need to fix this.

> One might think that it is not necessary to make difference between long
> button presses (which should generate repeat events) and short button
> presses that are quickly repeated by the user. I can think of a user-space
> application that would intentionally ignore repeat events for some buttons
> where it would make little sense. For example, when the number button 1 is
> pressed for a long time, the application might choose not to repeat the
> keypress, but "demand" multiple separate button presses by the user, if the
> channel should really be switched to 11, 111, or 1111. The intention of
> ignoring "repeat" events would be to avoid "punishing" users who are
> pressing a button longer, possibly compensating for unreliable IR signal
> reception.

The input layer create autorepeat key events for keys that are being held
down.

> If the user wants to quickly switch to channel 111 by quickly pressing the
> button three times, it should not be misreported as an auto-repeated event,
> but reported as 3 LIRC events without the "repeat" flag, and as 3 pairs of
> keydown and keyup events.

Ideally yes, if we can distinguish between the two.

FWIW I'm (slowly) working on new tooling that allows you specify the IR 
protocol in IRP format. This would allow you say for NEC:

{38.4k,564}<1,-1|1,-3>(16,-8,D:8,S:8,F:8,~F:8,1,^108m)* [D:0..255,S:0..255=255-D,F:0..255]

For remotes that repeat the entire code each time, and

{38.4k,564}<1,-1|1,-3>(16,-8,D:8,S:8,F:8,~F:8,1,^108m,(16,-4,1,^108m)*) [D:0..255,S:0..255=255-D,F:0..255]]]

For remotes that send nec repeats. This would be compiled down BPF. I'm
still working on the decoder and I haven't started on the BPF compilation
side yet (the encoder is fully working).

See https://github.com/seanyoung/cir/

> On the other hand, there should be no reason for an application to not honor
> repeat events for a volume button. That is of course up to the application
> to decide, not the kernel.

Well, that's not the way things work. Keys have autorepeats which are
generated kernel-side. I think libinput wants to change this to user
space but certainly not application side.

> If you agree that this patch is on the right track, an interface for the new
> function rc_keydown_or_repeat() may have to be exposed to the BPF interface
> as well.

I'm not sure why that is needed.


Sean
