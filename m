Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4690956509A
	for <lists+linux-media@lfdr.de>; Mon,  4 Jul 2022 11:20:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233668AbiGDJUK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 4 Jul 2022 05:20:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47054 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231491AbiGDJUJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 4 Jul 2022 05:20:09 -0400
Received: from meesny.iki.fi (meesny.iki.fi [IPv6:2001:67c:2b0:1c1::201])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 613D21114
        for <linux-media@vger.kernel.org>; Mon,  4 Jul 2022 02:20:06 -0700 (PDT)
Received: from jyty (dsl-hkibng31-58c389-173.dhcp.inet.fi [88.195.137.173])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: msmakela)
        by meesny.iki.fi (Postfix) with ESMTPSA id 569D520149;
        Mon,  4 Jul 2022 12:20:02 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
        t=1656926402;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=sngMRFYtQU11aiRShSkuSbiS2E26dZJwdJrgfF/4Y/M=;
        b=eHEG7vnp/xGPT2clLw8Gq1/i6LEUcxkAu90MxighzVAEjgod9CrjHNwHQUa2kzXUPZKZQC
        SyBjy8cGj814rcUyXE09e7h/eZooesBHaEjPz9BvHop1rVMS5CeOI7r90SMDAenpp8ZxYc
        UoQrUqGJGsvUQluXCvrMG8uOXh+YqUE=
Date:   Mon, 4 Jul 2022 12:20:01 +0300
From:   Marko =?iso-8859-1?B?TeRrZWzk?= <marko.makela@iki.fi>
To:     Sean Young <sean@mess.org>
Cc:     linux-media@vger.kernel.org
Subject: Re: [PATCH 2/2] media: rtl28xxu: improve IR receiver
Message-ID: <YsKwwVaFYrOxMhZw@jyty>
References: <cover.1644683294.git.sean@mess.org>
 <704b3d7e5a7a95cbd5e4dfc25a41454e919aed95.1644683294.git.sean@mess.org>
 <YrhSK5l0uQZT76Fi@jyty>
 <YrmMQNPHkDGZ843v@gofer.mess.org>
 <YrqfTnY4Azqt44e4@jyty>
 <Yr/+g/j20kb5kzki@gofer.mess.org>
 <YsHLlg9CccrEzOjL@jyty>
 <YsKVA4bKNuRUOZpf@gofer.mess.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="qJDHJ26yCvWC2QMJ"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YsKVA4bKNuRUOZpf@gofer.mess.org>
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=meesny; t=1656926402;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=sngMRFYtQU11aiRShSkuSbiS2E26dZJwdJrgfF/4Y/M=;
        b=faQfCf0HvpLsukKp0p7+DyZEHbS5fj6aOjE8rKC2TWnt8g/mMRBF3GNoUetuEH1HgCl/d+
        Z00AW9Yys+WCDOaXC3M7SbAILJGqyn843tJCEXD6JcmfFD2ZA51Y5fFZgPpg7Pbzpt0TcN
        XBOlRjGxJ1dEZej5eFrSIaf4h8O5Juk=
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=msmakela smtp.mailfrom=marko.makela@iki.fi
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1656926402; a=rsa-sha256; cv=none;
        b=j8jI0wYA8y/oQGBjczd98jloV8Cg23tbQ4+xKGOlsowWAtOIxKL/lsDWSpHsPNspJF8pmh
        FYIUV/vw9eIGI9AVpcTp1OL7lKgvLV1qS3SbzaZPYwUYuC7NVA+l2SuCdsD5yJwiGeM2Ua
        L1gJerljukv2UvkC7SqEUP8RMQ47hY8=
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--qJDHJ26yCvWC2QMJ
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi Sean,

Mon, Jul 04, 2022 at 08:21:39AM +0100, Sean Young wrote:
>On Sun, Jul 03, 2022 at 08:02:14PM +0300, Marko Mäkelä wrote:
>> For protocols that do not use a toggle bit, the last parameter of
>> rc_keydown() will usually be toggle=0, and explicit calls to rc_repeat()
>> will be issued when needed. For those protocols, I thought that we would not
>> want rc_keydown() to set any LIRC_SCANCODE_FLAG_REPEAT flag under any
>> circumstances.
>
>Toggle and repeat are distinct concepts.
>
>rc_repeat() is for protocols which have a special repeat message, which
>carry no information other that "repeat the last message". However,
>all protocols repeat. Whether they use a special repeat message or not.
>
>It's right that if a protocol repeats a message, LIRC_SCANCODE_FLAG_REPEAT
>is set.

Is it right to set the flag when a message is being repeated due to user 
effort (repeatedly pressing and releasing a button, instead of holding 
the button down)? If it is, is it consistent to avoid setting the flag 
when a protocol uses a toggle bit (say, RC5)? In that case, the toggle 
bit would change its value each time the button is pressed, and your 
suggested change to rc_keydown() would not set the repeat flag.

As far as I understand, the change that you suggested would set the 
LIRC_SCANCODE_FLAG_REPEAT if I repeatedly press a button on the NEC 
protocol remote control, but not on an RC5 remote control.

I tested the attached patch (which was created on 5.19-rc5, which failed 
to boot on my system for unrelated reasons) on Linux 5.17, on top of 
your fixes to rtl28xxu and rc-core.

By the way, the patch that I sent earlier accidentally included my 
futile attempt at avoiding buffer overrun on the rtl28xxu. That is 
probably why my previous test failed.

With the NEC protocol of the bundled remote of the Astrometa DVB-T2 
adapter, the "repeat" flag was occasionally set when I repeated 
keypresses too quickly. I think that this was because the key matrix 
scanning algorithm on the remote control did not get a reading of "no 
key pressed" between two key presses. When I used an RC5 based remote 
(that of Hauppauge Nova-T PCI 90002), I only saw the "repeat" flag in 
the output of "ir-keytable -t" when holding a button down. If I repeated 
keypresses manually, the toggle bit was changing between them. In other 
words, for these two remote controls, the patch works exactly like I 
intended.

One might think that it is not necessary to make difference between long 
button presses (which should generate repeat events) and short button 
presses that are quickly repeated by the user. I can think of a 
user-space application that would intentionally ignore repeat events for 
some buttons where it would make little sense. For example, when the 
number button 1 is pressed for a long time, the application might choose 
not to repeat the keypress, but "demand" multiple separate button 
presses by the user, if the channel should really be switched to 11, 
111, or 1111. The intention of ignoring "repeat" events would be to 
avoid "punishing" users who are pressing a button longer, possibly 
compensating for unreliable IR signal reception.

If the user wants to quickly switch to channel 111 by quickly pressing 
the button three times, it should not be misreported as an auto-repeated 
event, but reported as 3 LIRC events without the "repeat" flag, and as 3 
pairs of keydown and keyup events.

On the other hand, there should be no reason for an application to not 
honor repeat events for a volume button. That is of course up to the 
application to decide, not the kernel.

If you agree that this patch is on the right track, an interface for the 
new function rc_keydown_or_repeat() may have to be exposed to the BPF 
interface as well.

	Marko

--qJDHJ26yCvWC2QMJ
Content-Type: text/x-diff; charset=us-ascii
Content-Disposition: attachment;
	filename="0001-media-rc-Report-LIRC_SCANCODE_FLAG_REPEAT-when-not-u.patch"

From 1a1825e6ae737d840e2330db454e0426f7658d4f Mon Sep 17 00:00:00 2001
From: =?UTF-8?q?Marko=20M=C3=A4kel=C3=A4?= <marko.makela@iki.fi>
Date: Mon, 4 Jul 2022 12:07:26 +0300
Subject: [PATCH] media: rc: Report LIRC_SCANCODE_FLAG_REPEAT when not using
 rc_repeat()

The flag LIRC_SCANCODE_FLAG_REPEAT is never set on rc_keydown().
Previously it was only set by rc_repeat(). The new function
rc_keydown_or_repeat() is like rc_keydown(), but it will automatically
set the LIRC_SCANCODE_FLAG_REPEAT flag for repeated events.

For protocols for which rc_repeat() will not be invoked, calls to the
new function rc_keydown_or_repeat() will replace calls to rc_keydown().

Protocols that rely on rc_repeat() will continue to use rc_keydown(),
so that the LIRC_SCANCODE_FLAG_REPEAT flag will only be set for
auto-generated repeat events when a button is being held down, and
not when the user is repeatedly pressing a button.

TODO: Introduce bpf_rc_keydown_or_repeat()
---
 drivers/media/cec/platform/seco/seco-cec.c  |  3 +-
 drivers/media/i2c/ir-kbd-i2c.c              |  2 +-
 drivers/media/pci/bt8xx/bttv-input.c        |  2 +-
 drivers/media/pci/ttpci/budget-ci.c         |  7 ++--
 drivers/media/rc/imon.c                     |  5 +--
 drivers/media/rc/ir-rc5-decoder.c           |  2 +-
 drivers/media/rc/ir-rc6-decoder.c           |  2 +-
 drivers/media/rc/ir-rcmm-decoder.c          |  4 ++-
 drivers/media/rc/rc-main.c                  | 40 ++++++++++++++++++---
 drivers/media/usb/dvb-usb-v2/az6007.c       |  2 +-
 drivers/media/usb/dvb-usb-v2/dvbsky.c       |  3 +-
 drivers/media/usb/dvb-usb/dib0700_core.c    | 10 +++---
 drivers/media/usb/dvb-usb/dib0700_devices.c |  7 ++--
 drivers/media/usb/dvb-usb/ttusb2.c          |  3 +-
 drivers/media/usb/em28xx/em28xx-input.c     |  8 ++---
 drivers/staging/media/av7110/av7110_ir.c    |  2 +-
 include/media/rc-core.h                     |  2 ++
 17 files changed, 71 insertions(+), 33 deletions(-)

diff --git a/drivers/media/cec/platform/seco/seco-cec.c b/drivers/media/cec/platform/seco/seco-cec.c
index e1176f67f89a..c552303c77df 100644
--- a/drivers/media/cec/platform/seco/seco-cec.c
+++ b/drivers/media/cec/platform/seco/seco-cec.c
@@ -429,7 +429,8 @@ static int secocec_ir_rx(struct secocec_data *priv)
 	addr = (val & SECOCEC_IR_ADDRESS_MASK) >> SECOCEC_IR_ADDRESS_SHL;
 	toggle = (val & SECOCEC_IR_TOGGLE_MASK) >> SECOCEC_IR_TOGGLE_SHL;
 
-	rc_keydown(cec->ir, RC_PROTO_RC5, RC_SCANCODE_RC5(addr, key), toggle);
+	rc_keydown_or_repeat(cec->ir, RC_PROTO_RC5, RC_SCANCODE_RC5(addr, key),
+			     toggle);
 
 	dev_dbg(dev, "IR key pressed: 0x%02x addr 0x%02x toggle 0x%02x", key,
 		addr, toggle);
diff --git a/drivers/media/i2c/ir-kbd-i2c.c b/drivers/media/i2c/ir-kbd-i2c.c
index 56674173524f..e80a8bdf18e1 100644
--- a/drivers/media/i2c/ir-kbd-i2c.c
+++ b/drivers/media/i2c/ir-kbd-i2c.c
@@ -299,7 +299,7 @@ static int ir_key_poll(struct IR_i2c *ir)
 	if (rc) {
 		dev_dbg(&ir->rc->dev, "%s: proto = 0x%04x, scancode = 0x%08x\n",
 			__func__, protocol, scancode);
-		rc_keydown(ir->rc, protocol, scancode, toggle);
+		rc_keydown_or_repeat(ir->rc, protocol, scancode, toggle);
 	}
 	return 0;
 }
diff --git a/drivers/media/pci/bt8xx/bttv-input.c b/drivers/media/pci/bt8xx/bttv-input.c
index 41226f1d0e5b..8b93424299b6 100644
--- a/drivers/media/pci/bt8xx/bttv-input.c
+++ b/drivers/media/pci/bt8xx/bttv-input.c
@@ -228,7 +228,7 @@ static void bttv_rc5_timer_end(struct timer_list *t)
 	}
 
 	scancode = RC_SCANCODE_RC5(system, command);
-	rc_keydown(ir->dev, RC_PROTO_RC5, scancode, toggle);
+	rc_keydown_or_repeat(ir->dev, RC_PROTO_RC5, scancode, toggle);
 	dprintk("scancode %x, toggle %x\n", scancode, toggle);
 }
 
diff --git a/drivers/media/pci/ttpci/budget-ci.c b/drivers/media/pci/ttpci/budget-ci.c
index d59d18647371..20f974b462e8 100644
--- a/drivers/media/pci/ttpci/budget-ci.c
+++ b/drivers/media/pci/ttpci/budget-ci.c
@@ -145,9 +145,10 @@ static void msp430_ir_interrupt(struct tasklet_struct *t)
 		return;
 
 	if (budget_ci->ir.full_rc5) {
-		rc_keydown(dev, RC_PROTO_RC5,
-			   RC_SCANCODE_RC5(budget_ci->ir.rc5_device, budget_ci->ir.ir_key),
-			   !!(command & 0x20));
+		rc_keydown_or_repeat(dev, RC_PROTO_RC5,
+				     RC_SCANCODE_RC5(budget_ci->ir.rc5_device,
+						     budget_ci->ir.ir_key),
+				     !!(command & 0x20));
 		return;
 	}
 
diff --git a/drivers/media/rc/imon.c b/drivers/media/rc/imon.c
index 54da6f60079b..32371f81612c 100644
--- a/drivers/media/rc/imon.c
+++ b/drivers/media/rc/imon.c
@@ -1664,8 +1664,9 @@ static void imon_incoming_packet(struct imon_context *ictx,
 			else
 				return;
 
-			rc_keydown(ictx->rdev, proto, ictx->rc_scancode,
-				   ictx->rc_toggle);
+			rc_keydown_or_repeat(ictx->rdev, proto,
+					     ictx->rc_scancode,
+					     ictx->rc_toggle);
 
 			spin_lock_irqsave(&ictx->kc_lock, flags);
 			ictx->last_keycode = ictx->kc;
diff --git a/drivers/media/rc/ir-rc5-decoder.c b/drivers/media/rc/ir-rc5-decoder.c
index d58b6226afeb..2594e3aba4d9 100644
--- a/drivers/media/rc/ir-rc5-decoder.c
+++ b/drivers/media/rc/ir-rc5-decoder.c
@@ -157,7 +157,7 @@ static int ir_rc5_decode(struct rc_dev *dev, struct ir_raw_event ev)
 		dev_dbg(&dev->dev, "RC5(x/sz) scancode 0x%06x (p: %u, t: %u)\n",
 			scancode, protocol, toggle);
 
-		rc_keydown(dev, protocol, scancode, toggle);
+		rc_keydown_or_repeat(dev, protocol, scancode, toggle);
 		data->state = STATE_INACTIVE;
 		return 0;
 	}
diff --git a/drivers/media/rc/ir-rc6-decoder.c b/drivers/media/rc/ir-rc6-decoder.c
index 0657ad5eef48..1d8b9e42e1f5 100644
--- a/drivers/media/rc/ir-rc6-decoder.c
+++ b/drivers/media/rc/ir-rc6-decoder.c
@@ -263,7 +263,7 @@ static int ir_rc6_decode(struct rc_dev *dev, struct ir_raw_event ev)
 			goto out;
 		}
 
-		rc_keydown(dev, protocol, scancode, toggle);
+		rc_keydown_or_repeat(dev, protocol, scancode, toggle);
 		data->state = STATE_INACTIVE;
 		return 0;
 	}
diff --git a/drivers/media/rc/ir-rcmm-decoder.c b/drivers/media/rc/ir-rcmm-decoder.c
index fd9ec69a3718..4c32d5448df3 100644
--- a/drivers/media/rc/ir-rcmm-decoder.c
+++ b/drivers/media/rc/ir-rcmm-decoder.c
@@ -156,7 +156,9 @@ static int ir_rcmm_decode(struct rc_dev *dev, struct ir_raw_event ev)
 		}
 
 		if (dev->enabled_protocols & RC_PROTO_BIT_RCMM32) {
-			rc_keydown(dev, RC_PROTO_RCMM32, scancode, toggle);
+			rc_keydown_or_repeat(dev, RC_PROTO_RCMM32,
+					     data->bits & ~0x8000,
+					     !!(0x8000 & data->bits));
 			data->state = STATE_INACTIVE;
 			return 0;
 		}
diff --git a/drivers/media/rc/rc-main.c b/drivers/media/rc/rc-main.c
index f27f6b383816..301a3c2e9bd6 100644
--- a/drivers/media/rc/rc-main.c
+++ b/drivers/media/rc/rc-main.c
@@ -773,12 +773,13 @@ EXPORT_SYMBOL_GPL(rc_repeat);
  * @scancode:   the scancode of the keypress
  * @keycode:    the keycode of the keypress
  * @toggle:     the toggle value of the keypress
+ * @do_repeat:  whether to set the LIRC_SCANCODE_FLAG_REPEAT when needed
  *
  * This function is used internally to register a keypress, it must be
  * called with keylock held.
  */
 static void ir_do_keydown(struct rc_dev *dev, enum rc_proto protocol,
-			  u64 scancode, u32 keycode, u8 toggle)
+			  u64 scancode, u32 keycode, u8 toggle, bool do_repeat)
 {
 	bool new_event = (!dev->keypressed		 ||
 			  dev->last_protocol != protocol ||
@@ -786,7 +787,8 @@ static void ir_do_keydown(struct rc_dev *dev, enum rc_proto protocol,
 			  dev->last_toggle   != toggle);
 	struct lirc_scancode sc = {
 		.scancode = scancode, .rc_proto = protocol,
-		.flags = toggle ? LIRC_SCANCODE_FLAG_TOGGLE : 0,
+		.flags = (toggle ? LIRC_SCANCODE_FLAG_TOGGLE : 0) |
+		(do_repeat && !new_event ? LIRC_SCANCODE_FLAG_REPEAT : 0),
 		.keycode = keycode
 	};
 
@@ -852,7 +854,7 @@ void rc_keydown(struct rc_dev *dev, enum rc_proto protocol, u64 scancode,
 	u32 keycode = rc_g_keycode_from_table(dev, scancode);
 
 	spin_lock_irqsave(&dev->keylock, flags);
-	ir_do_keydown(dev, protocol, scancode, keycode, toggle);
+	ir_do_keydown(dev, protocol, scancode, keycode, toggle, false);
 
 	if (dev->keypressed) {
 		dev->keyup_jiffies = jiffies +
@@ -864,6 +866,36 @@ void rc_keydown(struct rc_dev *dev, enum rc_proto protocol, u64 scancode,
 }
 EXPORT_SYMBOL_GPL(rc_keydown);
 
+/**
+ * rc_keydown_or_repeat() - generates input event for a key press
+ * @dev:	the struct rc_dev descriptor of the device
+ * @protocol:	the protocol for the keypress
+ * @scancode:	the scancode for the keypress
+ * @toggle:	the toggle value (protocol dependent, if the protocol doesn't
+ *		support toggle values, this should be set to zero)
+ *
+ * This routine is used to signal that a key has been pressed or is
+ * being held down on the remote control.
+ */
+void rc_keydown_or_repeat(struct rc_dev *dev, enum rc_proto protocol,
+			  u64 scancode, u8 toggle)
+{
+	unsigned long flags;
+	u32 keycode = rc_g_keycode_from_table(dev, scancode);
+
+	spin_lock_irqsave(&dev->keylock, flags);
+	ir_do_keydown(dev, protocol, scancode, keycode, toggle, true);
+
+	if (dev->keypressed) {
+		dev->keyup_jiffies = jiffies +
+			usecs_to_jiffies(dev->keyup_delay) +
+			msecs_to_jiffies(repeat_period(protocol));
+		mod_timer(&dev->timer_keyup, dev->keyup_jiffies);
+	}
+	spin_unlock_irqrestore(&dev->keylock, flags);
+}
+EXPORT_SYMBOL_GPL(rc_keydown_or_repeat);
+
 /**
  * rc_keydown_notimeout() - generates input event for a key press without
  *                          an automatic keyup event at a later time
@@ -883,7 +915,7 @@ void rc_keydown_notimeout(struct rc_dev *dev, enum rc_proto protocol,
 	u32 keycode = rc_g_keycode_from_table(dev, scancode);
 
 	spin_lock_irqsave(&dev->keylock, flags);
-	ir_do_keydown(dev, protocol, scancode, keycode, toggle);
+	ir_do_keydown(dev, protocol, scancode, keycode, toggle, false);
 	spin_unlock_irqrestore(&dev->keylock, flags);
 }
 EXPORT_SYMBOL_GPL(rc_keydown_notimeout);
diff --git a/drivers/media/usb/dvb-usb-v2/az6007.c b/drivers/media/usb/dvb-usb-v2/az6007.c
index 62ee09f28a0b..7ff10eb7d5b2 100644
--- a/drivers/media/usb/dvb-usb-v2/az6007.c
+++ b/drivers/media/usb/dvb-usb-v2/az6007.c
@@ -224,7 +224,7 @@ static int az6007_rc_query(struct dvb_usb_device *d)
 		proto = RC_PROTO_NEC32;
 	}
 
-	rc_keydown(d->rc_dev, proto, code, st->data[5]);
+	rc_keydown_or_repeat(d->rc_dev, proto, code, st->data[5]);
 
 	return 0;
 }
diff --git a/drivers/media/usb/dvb-usb-v2/dvbsky.c b/drivers/media/usb/dvb-usb-v2/dvbsky.c
index 1221c924312a..d8f398179760 100644
--- a/drivers/media/usb/dvb-usb-v2/dvbsky.c
+++ b/drivers/media/usb/dvb-usb-v2/dvbsky.c
@@ -192,7 +192,8 @@ static int dvbsky_rc_query(struct dvb_usb_device *d)
 		rc5_system = (code & 0x7C0) >> 6;
 		toggle = (code & 0x800) ? 1 : 0;
 		scancode = rc5_system << 8 | rc5_command;
-		rc_keydown(d->rc_dev, RC_PROTO_RC5, scancode, toggle);
+		rc_keydown_or_repeat(d->rc_dev, RC_PROTO_RC5, scancode,
+				     toggle);
 	}
 	return 0;
 }
diff --git a/drivers/media/usb/dvb-usb/dib0700_core.c b/drivers/media/usb/dvb-usb/dib0700_core.c
index 1caabb51ea47..ff97106bb7eb 100644
--- a/drivers/media/usb/dvb-usb/dib0700_core.c
+++ b/drivers/media/usb/dvb-usb/dib0700_core.c
@@ -711,7 +711,6 @@ static void dib0700_rc_urb_completion(struct urb *purb)
 	struct dib0700_rc_response *poll_reply;
 	enum rc_proto protocol;
 	u32 keycode;
-	u8 toggle;
 
 	deb_info("%s()\n", __func__);
 	if (d->rc_dev == NULL) {
@@ -743,8 +742,6 @@ static void dib0700_rc_urb_completion(struct urb *purb)
 
 	switch (d->props.rc.core.protocol) {
 	case RC_PROTO_BIT_NEC:
-		toggle = 0;
-
 		/* NEC protocol sends repeat code as 0 0 0 FF */
 		if (poll_reply->nec.system     == 0x00 &&
 		    poll_reply->nec.not_system == 0x00 &&
@@ -780,7 +777,6 @@ static void dib0700_rc_urb_completion(struct urb *purb)
 	default:
 		deb_data("RC5 protocol\n");
 		protocol = RC_PROTO_RC5;
-		toggle = poll_reply->report_id;
 		keycode = RC_SCANCODE_RC5(poll_reply->rc5.system, poll_reply->rc5.data);
 
 		if ((poll_reply->rc5.data ^ poll_reply->rc5.not_data) != 0xff) {
@@ -791,10 +787,12 @@ static void dib0700_rc_urb_completion(struct urb *purb)
 			goto resubmit;
 		}
 
-		break;
+		rc_keydown_or_repeat(d->rc_dev, protocol, keycode,
+				     poll_reply->report_id);
+		goto resubmit;
 	}
 
-	rc_keydown(d->rc_dev, protocol, keycode, toggle);
+	rc_keydown(d->rc_dev, protocol, keycode, 0);
 
 resubmit:
 	/* Clean the buffer before we requeue */
diff --git a/drivers/media/usb/dvb-usb/dib0700_devices.c b/drivers/media/usb/dvb-usb/dib0700_devices.c
index 710c1afe3e85..31126e69290f 100644
--- a/drivers/media/usb/dvb-usb/dib0700_devices.c
+++ b/drivers/media/usb/dvb-usb/dib0700_devices.c
@@ -517,7 +517,6 @@ static int dib0700_rc_query_old_firmware(struct dvb_usb_device *d)
 {
 	enum rc_proto protocol;
 	u32 scancode;
-	u8 toggle;
 	int i;
 	struct dib0700_state *st = d->priv;
 
@@ -558,18 +557,18 @@ static int dib0700_rc_query_old_firmware(struct dvb_usb_device *d)
 
 		protocol = RC_PROTO_NEC;
 		scancode = RC_SCANCODE_NEC(st->buf[3 - 2], st->buf[3 - 3]);
-		toggle = 0;
+		rc_keydown(d->rc_dev, protocol, scancode, 0);
 		break;
 
 	default:
 		/* RC-5 protocol changes toggle bit on new keypress */
 		protocol = RC_PROTO_RC5;
 		scancode = RC_SCANCODE_RC5(st->buf[3 - 2], st->buf[3 - 3]);
-		toggle = st->buf[3 - 1];
+		rc_keydown_or_repeat(d->rc_dev, protocol, scancode,
+				     st->buf[3 - 1]);
 		break;
 	}
 
-	rc_keydown(d->rc_dev, protocol, scancode, toggle);
 	return 0;
 }
 
diff --git a/drivers/media/usb/dvb-usb/ttusb2.c b/drivers/media/usb/dvb-usb/ttusb2.c
index 294274fd8f55..94b722b87a72 100644
--- a/drivers/media/usb/dvb-usb/ttusb2.c
+++ b/drivers/media/usb/dvb-usb/ttusb2.c
@@ -456,7 +456,8 @@ static int tt3650_rc_query(struct dvb_usb_device *d)
 		/* got a "press" event */
 		st->last_rc_key = RC_SCANCODE_RC5(rx[3], rx[2]);
 		deb_info("%s: cmd=0x%02x sys=0x%02x\n", __func__, rx[2], rx[3]);
-		rc_keydown(d->rc_dev, RC_PROTO_RC5, st->last_rc_key, rx[1]);
+		rc_keydown_or_repeat(d->rc_dev, RC_PROTO_RC5, st->last_rc_key,
+				     rx[1]);
 	} else if (st->last_rc_key) {
 		rc_keyup(d->rc_dev);
 		st->last_rc_key = 0;
diff --git a/drivers/media/usb/em28xx/em28xx-input.c b/drivers/media/usb/em28xx/em28xx-input.c
index 0b6d77c3bec8..7034707d5138 100644
--- a/drivers/media/usb/em28xx/em28xx-input.c
+++ b/drivers/media/usb/em28xx/em28xx-input.c
@@ -337,10 +337,10 @@ static void em28xx_ir_handle_key(struct em28xx_IR *ir)
 			poll_result.toggle_bit, poll_result.read_count,
 			poll_result.scancode);
 		if (ir->full_code)
-			rc_keydown(ir->rc,
-				   poll_result.protocol,
-				   poll_result.scancode,
-				   poll_result.toggle_bit);
+			rc_keydown_or_repeat(ir->rc,
+					     poll_result.protocol,
+					     poll_result.scancode,
+					     poll_result.toggle_bit);
 		else
 			rc_keydown(ir->rc,
 				   RC_PROTO_UNKNOWN,
diff --git a/drivers/staging/media/av7110/av7110_ir.c b/drivers/staging/media/av7110/av7110_ir.c
index a851ba328e4a..6691e4322654 100644
--- a/drivers/staging/media/av7110/av7110_ir.c
+++ b/drivers/staging/media/av7110/av7110_ir.c
@@ -64,7 +64,7 @@ void av7110_ir_handler(struct av7110 *av7110, u32 ircom)
 			return;
 		}
 
-		rc_keydown(rcdev, proto, scancode, toggle != 0);
+		rc_keydown_or_repeat(rcdev, proto, scancode, !!toggle);
 	}
 }
 
diff --git a/include/media/rc-core.h b/include/media/rc-core.h
index b688304959bc..4f49b5a9b1c6 100644
--- a/include/media/rc-core.h
+++ b/include/media/rc-core.h
@@ -287,6 +287,8 @@ void rc_unregister_device(struct rc_dev *dev);
 void rc_repeat(struct rc_dev *dev);
 void rc_keydown(struct rc_dev *dev, enum rc_proto protocol, u64 scancode,
 		u8 toggle);
+void rc_keydown_or_repeat(struct rc_dev *dev, enum rc_proto protocol,
+			  u64 scancode, u8 toggle);
 void rc_keydown_notimeout(struct rc_dev *dev, enum rc_proto protocol,
 			  u64 scancode, u8 toggle);
 void rc_keyup(struct rc_dev *dev);
-- 
2.36.1


--qJDHJ26yCvWC2QMJ--
