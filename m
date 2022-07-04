Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 57D27565DBF
	for <lists+linux-media@lfdr.de>; Mon,  4 Jul 2022 21:04:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231562AbiGDTEq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 4 Jul 2022 15:04:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229674AbiGDTEo (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 4 Jul 2022 15:04:44 -0400
X-Greylist: delayed 93743 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 04 Jul 2022 12:04:42 PDT
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CBB0394
        for <linux-media@vger.kernel.org>; Mon,  4 Jul 2022 12:04:42 -0700 (PDT)
Received: from jyty (dsl-hkibng31-58c389-173.dhcp.inet.fi [88.195.137.173])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: msmakela)
        by lahtoruutu.iki.fi (Postfix) with ESMTPSA id D7F7E1B00276;
        Mon,  4 Jul 2022 22:04:39 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
        t=1656961479;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=jC/gHgEGsyjhw8jPioPBo8UnmhMFB7XMUxi/LR8UBEo=;
        b=f0AU+SZ9dt+18KYT7iRFxBSvzAIj4ft/resvu4u1NIuASbXyHbUCJHrJW7mVZNa/6INYEe
        JyDktTf1wk2CoxJYmTYVd9ptiQU56faSQxUApxzyUrpdHwpYmOv6Vci208InkftnXIUyGc
        5UD8sWGWFHMS5HmN+QoYKTSCSbIJbxvkm8Ig1hH1hqP089DolCd6JUMmcfDvGiqcD66uHh
        yHK7Ph7vUKSz2i8iddIHxnHxalvUix9TM58IEizn/RHgQm1/iqexDZ0KDUjud4xxV+jWu8
        2IFIo/hjoJzb7ZY010K02K0JfqWKEaUyOmtbecLmGKUQ1JNeWPNDcjUNbxP7NQ==
Date:   Mon, 4 Jul 2022 22:04:38 +0300
From:   Marko =?iso-8859-1?B?TeRrZWzk?= <marko.makela@iki.fi>
To:     Sean Young <sean@mess.org>
Cc:     linux-media@vger.kernel.org
Subject: Re: [PATCH 2/2] media: rtl28xxu: improve IR receiver
Message-ID: <YsM5xhEXb6rzl1X9@jyty>
References: <cover.1644683294.git.sean@mess.org>
 <704b3d7e5a7a95cbd5e4dfc25a41454e919aed95.1644683294.git.sean@mess.org>
 <YrhSK5l0uQZT76Fi@jyty>
 <YrmMQNPHkDGZ843v@gofer.mess.org>
 <YrqfTnY4Azqt44e4@jyty>
 <Yr/+g/j20kb5kzki@gofer.mess.org>
 <YsHLlg9CccrEzOjL@jyty>
 <YsKVA4bKNuRUOZpf@gofer.mess.org>
 <YsKwwVaFYrOxMhZw@jyty>
 <YsK6Rlk/ODYUE2/F@gofer.mess.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="cLwnVj2EukfdE3MP"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YsK6Rlk/ODYUE2/F@gofer.mess.org>
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1656961479; a=rsa-sha256;
        cv=none;
        b=aYVh5knqSEqHXvdu/cbe5152WZr+h/CsQeKmKet0kdEUqMjcalu/xPDBEYh4xgacuFWu53
        2LuLpF0ZMVRK4ovofdivM9yJ4SNjD2SQyCnyMdGK7ZrGEB17JM0x3A8Q74a9IXSDH/Mf0+
        rrGbfrnUj6zveAbckRSI0e7k6GhxQWLWi+qtjrvXYvCs6M+9VSPwcO57m9t8PcPt7VXit4
        Y6XC9TxrYK+QDcdHN//lWQfPGjF+0+DOFUqcCSusuvvtFgD33rRxIDtYB2ddq70Zog/io/
        f30Kz0h26ABzZ0xP0xF97H/QfyMm8SoXAdYPaUnx7e9pisFW6yddZdRxX9guyA==
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=msmakela smtp.mailfrom=marko.makela@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=lahtoruutu; t=1656961479;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=jC/gHgEGsyjhw8jPioPBo8UnmhMFB7XMUxi/LR8UBEo=;
        b=nOJQ/NzCIIeXYdOIlJDt/rv3BvbrebTu/UZLupXnjDLFJQl6JoPxdVND3PLNMfOu5wy5nD
        Nhxi+RCMle1vyBkfumDQdsnH4pj7Bci+Z2zhNEOejIXBSD932pCijUAcFeRzASduk1n5Lk
        BrsvUukDtmhqqPVasvhXIHuVokELDPydsp1gNmehAkfAnxiNMzv/750nGRczhVUN5IMjCn
        nmrWU/IjXWnkzuE/6lQrKDOVAj5wakguEUbj1PH2i1ucUgrYKVJP4JxFRTdM4hdjKnfKOQ
        lT7yOnYnQbtnLbQ/Cdn63Ev7vmGDVlzdYV/krwBReQpnaEcHBDGsHZpmw5BlSw==
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--cLwnVj2EukfdE3MP
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi Sean,

Mon, Jul 04, 2022 at 11:00:38AM +0100, Sean Young wrote:
>Hi Marko,
>
>On Mon, Jul 04, 2022 at 12:20:01PM +0300, Marko Mäkelä wrote:
>> Mon, Jul 04, 2022 at 08:21:39AM +0100, Sean Young wrote:
>> > On Sun, Jul 03, 2022 at 08:02:14PM +0300, Marko Mäkelä wrote:
>> > > For protocols that do not use a toggle bit, the last parameter of
>> > > rc_keydown() will usually be toggle=0, and explicit calls to rc_repeat()
>> > > will be issued when needed. For those protocols, I thought that we would not
>> > > want rc_keydown() to set any LIRC_SCANCODE_FLAG_REPEAT flag under any
>> > > circumstances.
>> >
>> > Toggle and repeat are distinct concepts.
>> >
>> > rc_repeat() is for protocols which have a special repeat message, which
>> > carry no information other that "repeat the last message". However,
>> > all protocols repeat. Whether they use a special repeat message or not.
>> >
>> > It's right that if a protocol repeats a message, LIRC_SCANCODE_FLAG_REPEAT
>> > is set.
>>
>> Is it right to set the flag when a message is being repeated due to user
>> effort (repeatedly pressing and releasing a button, instead of holding the
>> button down)?
>
>The problem here is that the nec repeat is used by some remotes, but 
>not others. Some nec remotes repeat the entire code every time. Our 
>generic nec decoder cannot distinguish between the two. So, our nec 
>decoder interprets both a nec repeat and a repeated code as "button 
>being held down".

I see. My experience of remote control protocols is mostly limited to 
RC5.

>> As far as I understand, the change that you suggested would set the
>> LIRC_SCANCODE_FLAG_REPEAT if I repeatedly press a button on the NEC protocol
>> remote control, but not on an RC5 remote control.
>
>RC5 too.

I think that it is depends on the implementation of the firmware that 
runs on the remote control unit. If the button is released and quickly 
pressed again so that no keyboard matrix scan was scheduled to run in 
between, then the firmware could report it as a repeat event.  
Alternatively, every second IR message could be lost, so that the 
receiver would observe the same toggle bit value for every IR message 
that it receives.

>>I tested the attached patch (which was created on 5.19-rc5, which 
>>failed to boot on my system for unrelated reasons) on Linux 5.17, on 
>>top of your fixes to rtl28xxu and rc-core.
>
>You'll need to fix this.

The 5.19-rc5 boot failure could have been related to LUKS setup on that 
machine, because a kernel panic message was displayed before I was being 
prompted for an encryption key. The modules would not have been loaded 
at that point, so I do not think that it is related to my modifications.

When compiled for the v5.17 kernel release tag on another computer, the 
patch that implements rc_keydown_or_repeat() worked for me.

It does not look like there are many changes in drivers/media/rc between 
5.17 and 5.19.

>>If the user wants to quickly switch to channel 111 by quickly pressing 
>>the button three times, it should not be misreported as an 
>>auto-repeated event, but reported as 3 LIRC events without the 
>>"repeat" flag, and as 3 pairs of keydown and keyup events.
>
>Ideally yes, if we can distinguish between the two.

Okay, I understand that we indeed cannot always do that.

>See https://github.com/seanyoung/cir/

This could open up many possibilities. Would the decoded events also be 
available via some low-level interface to user-space programs, in 
addition to the input event driver?

>>On the other hand, there should be no reason for an application to not 
>>honor repeat events for a volume button. That is of course up to the 
>>application to decide, not the kernel.
>
>Well, that's not the way things work. Keys have autorepeats which are 
>generated kernel-side. I think libinput wants to change this to user 
>space but certainly not application side.

It is how https://tvdr.de works. I have been using it via two 
interfaces: a built-in LIRC interface, and vdr-plugin-remote for the 
Linux input device driver. In http://git.tvdr.de/vdr.git you can find 
that in some cases, normal key-presses are being distinguished from 
repeat events (git grep -w k_Repeat). This is the reason why I brought 
up the missing LIRC_SCANCODE_FLAG_REPEAT in the RC5 protocol decoder: 
VDR with the LIRC interface would observe that the user is repeatedly 
pressing a button even when the button is being held down.

>> If you agree that this patch is on the right track, an interface for the new
>> function rc_keydown_or_repeat() may have to be exposed to the BPF interface
>> as well.
>
>I'm not sure why that is needed.

I am attaching a minimal version of the patch, just one hunk, like you 
suggested earlier. I did not observe any bad effects with either remote 
control unit I tested it with: RC5 and NEC, again, on the rtl28xxu and 
with your two commits, on the v5.17 tag.

Best regards,

	Marko

--cLwnVj2EukfdE3MP
Content-Type: text/x-diff; charset=us-ascii
Content-Disposition: attachment;
	filename="0001-media-rc-Always-report-LIRC-repeat-flag.patch"

From 7bdda9eccd704076297a0d0802c8638b4562c703 Mon Sep 17 00:00:00 2001
From: =?UTF-8?q?Marko=20M=C3=A4kel=C3=A4?= <marko.makela@mariadb.com>
Date: Mon, 4 Jul 2022 21:56:08 +0300
Subject: [PATCH] media: rc: Always report LIRC repeat flag

The flag LIRC_SCANCODE_FLAG_REPEAT was never set by rc_keydown().
Previously it was only set by rc_repeat(), but not all protocol
decoders invoke that function.
---
 drivers/media/rc/rc-main.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/rc/rc-main.c b/drivers/media/rc/rc-main.c
index f27f6b383816..d875d84ea221 100644
--- a/drivers/media/rc/rc-main.c
+++ b/drivers/media/rc/rc-main.c
@@ -786,7 +786,8 @@ static void ir_do_keydown(struct rc_dev *dev, enum rc_proto protocol,
 			  dev->last_toggle   != toggle);
 	struct lirc_scancode sc = {
 		.scancode = scancode, .rc_proto = protocol,
-		.flags = toggle ? LIRC_SCANCODE_FLAG_TOGGLE : 0,
+		.flags = (toggle ? LIRC_SCANCODE_FLAG_TOGGLE : 0) |
+		(!new_event ? LIRC_SCANCODE_FLAG_REPEAT : 0),
 		.keycode = keycode
 	};
 
-- 
2.36.1


--cLwnVj2EukfdE3MP--
