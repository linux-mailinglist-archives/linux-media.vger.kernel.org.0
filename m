Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2910855DC41
	for <lists+linux-media@lfdr.de>; Tue, 28 Jun 2022 15:25:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235976AbiF1G1h (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 Jun 2022 02:27:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245553AbiF1G1c (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 Jun 2022 02:27:32 -0400
Received: from meesny.iki.fi (meesny.iki.fi [IPv6:2001:67c:2b0:1c1::201])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 846E72316C
        for <linux-media@vger.kernel.org>; Mon, 27 Jun 2022 23:27:30 -0700 (PDT)
Received: from jyty (dsl-hkibng31-58c389-173.dhcp.inet.fi [88.195.137.173])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: msmakela)
        by meesny.iki.fi (Postfix) with ESMTPSA id B02F0200A4;
        Tue, 28 Jun 2022 09:27:27 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
        t=1656397647;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=11lVZf+zyvnlTmjRGbfhcAOqoVCVH8QaqlDrmu4Tn6c=;
        b=Zi74+WKgMjwz8F9fCOyOGk/JXGTYZM+09EA18peygPto/+VpNhphn09liPno7y6tTxvKF0
        cTq4qlFvV1GBq3a7uZu+IJqgP3m9JKmZZVZN0zdbHdCtVVf/2GhAPLXWq3cFlq86tAaTWB
        WWBW+Bnb6KqLp+mwCk3Nm8Gsr6RrpZ4=
Date:   Tue, 28 Jun 2022 09:27:26 +0300
From:   Marko =?iso-8859-1?B?TeRrZWzk?= <marko.makela@iki.fi>
To:     Sean Young <sean@mess.org>
Cc:     linux-media@vger.kernel.org
Subject: Re: [PATCH 2/2] media: rtl28xxu: improve IR receiver
Message-ID: <YrqfTnY4Azqt44e4@jyty>
References: <cover.1644683294.git.sean@mess.org>
 <704b3d7e5a7a95cbd5e4dfc25a41454e919aed95.1644683294.git.sean@mess.org>
 <YrhSK5l0uQZT76Fi@jyty>
 <YrmMQNPHkDGZ843v@gofer.mess.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="ykhP8KOj85vLkU6E"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YrmMQNPHkDGZ843v@gofer.mess.org>
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=meesny; t=1656397647;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=11lVZf+zyvnlTmjRGbfhcAOqoVCVH8QaqlDrmu4Tn6c=;
        b=I/crVvF1D1KZrioJ2wLIEbahDPG428EDdLNozD/cxsJPDlGwFOlZ1Lf9MlMIX8U5k6SgHW
        adLDc/8GY1pjjygqnsEdRRhKIxe54IzRaG9FTPWq8iqUUXvXIZdJard/7uTvJkhnZK/6ME
        ljmaMycXHYkLNQbd+DJ1fwGVeGnO7XM=
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=msmakela smtp.mailfrom=marko.makela@iki.fi
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1656397647; a=rsa-sha256; cv=none;
        b=M9gogSCnL6t+jPQEz14kMjcV4MwdHVkes8I/fAwOK1uI7phNBR5+KCMTFrvS3McOIMLCC2
        1Tp+ffvxanZlyLGLDUb9jYfJGY0zsf6UowakoT7nVTEdi7Vz2UHMsuwtXRGuO8mROHKF5f
        stxGwQdtud/FCdGbeRNvpe0FhRKwpD0=
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--ykhP8KOj85vLkU6E
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi Sean,

Mon, Jun 27, 2022 at 11:53:52AM +0100, Sean Young wrote:
>Hi Marko,
>
>On Sun, Jun 26, 2022 at 03:33:47PM +0300, Marko Mäkelä wrote:
>> I finally took the time to get a deeper understanding of the infrared remote
>> control subsystem. I think that I now understand the translation into
>> key-down, key-up, and key-repeat events. For the RC5 protocol, rc_repeat()
>> will not be called by ir-rc5-decoder.c but instead, ir_do_keydown() will
>> handle the repeat. For lirc_scancode_event() it will never set the
>> LIRC_SCANCODE_FLAG_REPEAT bit, even if !new_event and the protocol does
>> support the toggle bit. That might qualify as a bug.
>
>You are right, this was missed. Patches welcome.

Attached (for 5.19.0-rc3, on top of the two commits of this patch 
series).

I thought that it would be the least amount of trouble to slightly 
change the interpretation of the "toggle" parameter of
rc_keydown(). My intention was to use the values 1 and 2 when the toggle 
flag is present. Any nonzero values would work.

I am not that familiar with updating the modules, and I suspect that 
instead of actually testing this code, I was testing the "ring buffer" 
patch that I posted yesterday. I could not use the rmmod/insmod approach 
for testing this change, because the rc_core module was in use by the 
display driver. So, I can only say that the patch compiled for me. A few 
FIXME places are indicated where I am not sure that a correct (nonzero) 
toggle value would be computed.

An alternative approach would be to use the value toggle=1 for the case 
when the toggle bit is set, and toggle>1 for the case when it is not 
set. Basically, change things like 1+!!x to 1+!x in the callers, and 
change the condition toggle > 1 to toggle == 1 in rc-main.c. In that 
way, any old driver that would use the toggle values 0 and 1 would still 
generate LIRC_SCANCODE_FLAG_TOGGLE. But then, the repeat_event logic 
would only work half the time (when toggle!=0).

	Marko

--ykhP8KOj85vLkU6E
Content-Type: text/x-diff; charset=us-ascii
Content-Disposition: attachment;
	filename="0001-rc_keydown-Report-LIRC_SCANCODE_FLAG_REPEAT-based-on.patch"

From 29a5c2a00653f49c854109b2f2c8f99b4431430f Mon Sep 17 00:00:00 2001
From: =?UTF-8?q?Marko=20M=C3=A4kel=C3=A4?= <marko.makela@iki.fi>
Date: Tue, 28 Jun 2022 07:59:17 +0300
Subject: [PATCH] rc_keydown(): Report LIRC_SCANCODE_FLAG_REPEAT based on
 toggle bit

Drivers that will not call rc_repeat() will let rc_keydown()
create repeat events. For the LIRC interface, the repeat flag
would only be set by rc_repeat(), never by rc_keydown().

We change the meaning of the toggle parameter: Drivers that
invoke rc_repeat() by themselves should always pass toggle=0,
while protocols that include a toggle bit should pass toggle>0,
with the value 1 meaning that the toggle bit is clear.

This is largely untested code. See FIXME comments.
Also, an interface change for bpf_rc_keydown() might have to be
documented.
---
 drivers/media/cec/platform/seco/seco-cec.c  |  3 +-
 drivers/media/i2c/ir-kbd-i2c.c              |  4 +-
 drivers/media/pci/bt8xx/bttv-input.c        |  2 +-
 drivers/media/pci/ttpci/budget-ci.c         |  4 +-
 drivers/media/rc/bpf-lirc.c                 |  2 +-
 drivers/media/rc/img-ir/img-ir-rc5.c        |  2 +-
 drivers/media/rc/img-ir/img-ir-rc6.c        |  2 +-
 drivers/media/rc/imon.c                     |  2 +-
 drivers/media/rc/ir-jvc-decoder.c           |  3 +-
 drivers/media/rc/ir-rc5-decoder.c           |  2 +-
 drivers/media/rc/ir-rc6-decoder.c           |  4 +-
 drivers/media/rc/ir-rcmm-decoder.c          |  2 +-
 drivers/media/rc/rc-main.c                  |  9 ++--
 drivers/media/usb/dvb-usb-v2/az6007.c       |  2 +-
 drivers/media/usb/dvb-usb-v2/dvbsky.c       |  2 +-
 drivers/media/usb/dvb-usb-v2/rtl28xxu.c     | 48 ++++-----------------
 drivers/media/usb/dvb-usb-v2/rtl28xxu.h     |  1 +
 drivers/media/usb/dvb-usb/dib0700_core.c    |  2 +-
 drivers/media/usb/dvb-usb/dib0700_devices.c |  2 +-
 drivers/media/usb/dvb-usb/ttusb2.c          |  3 +-
 drivers/media/usb/em28xx/em28xx-input.c     |  4 +-
 drivers/staging/media/av7110/av7110_ir.c    |  2 +-
 22 files changed, 40 insertions(+), 67 deletions(-)

diff --git a/drivers/media/cec/platform/seco/seco-cec.c b/drivers/media/cec/platform/seco/seco-cec.c
index a056412883b9..6aa889add090 100644
--- a/drivers/media/cec/platform/seco/seco-cec.c
+++ b/drivers/media/cec/platform/seco/seco-cec.c
@@ -416,7 +416,8 @@ static int secocec_ir_rx(struct secocec_data *priv)
 	addr = (val & SECOCEC_IR_ADDRESS_MASK) >> SECOCEC_IR_ADDRESS_SHL;
 	toggle = (val & SECOCEC_IR_TOGGLE_MASK) >> SECOCEC_IR_TOGGLE_SHL;
 
-	rc_keydown(cec->ir, RC_PROTO_RC5, RC_SCANCODE_RC5(addr, key), toggle);
+	rc_keydown(cec->ir, RC_PROTO_RC5, RC_SCANCODE_RC5(addr, key),
+		   1 + toggle);
 
 	dev_dbg(dev, "IR key pressed: 0x%02x addr 0x%02x toggle 0x%02x\n", key,
 		addr, toggle);
diff --git a/drivers/media/i2c/ir-kbd-i2c.c b/drivers/media/i2c/ir-kbd-i2c.c
index 56674173524f..28dbce16dc19 100644
--- a/drivers/media/i2c/ir-kbd-i2c.c
+++ b/drivers/media/i2c/ir-kbd-i2c.c
@@ -99,7 +99,7 @@ static int get_key_haup_common(struct IR_i2c *ir, enum rc_proto *protocol,
 
 		*protocol = RC_PROTO_RC5;
 		*scancode = RC_SCANCODE_RC5(dev, code);
-		*ptoggle = toggle;
+		*ptoggle = toggle + 1;
 
 		return 1;
 	} else if (size == 6 && (buf[0] & 0x40)) {
@@ -108,7 +108,7 @@ static int get_key_haup_common(struct IR_i2c *ir, enum rc_proto *protocol,
 		vendor = get_unaligned_be16(buf + 1);
 
 		if (vendor == 0x800f) {
-			*ptoggle = (dev & 0x80) != 0;
+			*ptoggle = 1 + ((dev & 0x80) != 0);
 			*protocol = RC_PROTO_RC6_MCE;
 			dev &= 0x7f;
 			dev_dbg(&ir->rc->dev,
diff --git a/drivers/media/pci/bt8xx/bttv-input.c b/drivers/media/pci/bt8xx/bttv-input.c
index 41226f1d0e5b..a82e40b13078 100644
--- a/drivers/media/pci/bt8xx/bttv-input.c
+++ b/drivers/media/pci/bt8xx/bttv-input.c
@@ -228,7 +228,7 @@ static void bttv_rc5_timer_end(struct timer_list *t)
 	}
 
 	scancode = RC_SCANCODE_RC5(system, command);
-	rc_keydown(ir->dev, RC_PROTO_RC5, scancode, toggle);
+	rc_keydown(ir->dev, RC_PROTO_RC5, scancode, toggle + 1);
 	dprintk("scancode %x, toggle %x\n", scancode, toggle);
 }
 
diff --git a/drivers/media/pci/ttpci/budget-ci.c b/drivers/media/pci/ttpci/budget-ci.c
index d59d18647371..50c9f5672cc0 100644
--- a/drivers/media/pci/ttpci/budget-ci.c
+++ b/drivers/media/pci/ttpci/budget-ci.c
@@ -147,13 +147,13 @@ static void msp430_ir_interrupt(struct tasklet_struct *t)
 	if (budget_ci->ir.full_rc5) {
 		rc_keydown(dev, RC_PROTO_RC5,
 			   RC_SCANCODE_RC5(budget_ci->ir.rc5_device, budget_ci->ir.ir_key),
-			   !!(command & 0x20));
+			   1 + !!(command & 0x20));
 		return;
 	}
 
 	/* FIXME: We should generate complete scancodes for all devices */
 	rc_keydown(dev, RC_PROTO_UNKNOWN, budget_ci->ir.ir_key,
-		   !!(command & 0x20));
+		   1 + !!(command & 0x20));
 }
 
 static int msp430_ir_init(struct budget_ci *budget_ci)
diff --git a/drivers/media/rc/bpf-lirc.c b/drivers/media/rc/bpf-lirc.c
index fe17c7f98e81..829302c6d891 100644
--- a/drivers/media/rc/bpf-lirc.c
+++ b/drivers/media/rc/bpf-lirc.c
@@ -42,7 +42,7 @@ BPF_CALL_4(bpf_rc_keydown, u32*, sample, u32, protocol, u64, scancode,
 
 	ctrl = container_of(sample, struct ir_raw_event_ctrl, bpf_sample);
 
-	rc_keydown(ctrl->dev, protocol, scancode, toggle != 0);
+	rc_keydown(ctrl->dev, protocol, scancode, (u8) toggle);
 
 	return 0;
 }
diff --git a/drivers/media/rc/img-ir/img-ir-rc5.c b/drivers/media/rc/img-ir/img-ir-rc5.c
index 23c8e2397ba7..386be464bfa7 100644
--- a/drivers/media/rc/img-ir/img-ir-rc5.c
+++ b/drivers/media/rc/img-ir/img-ir-rc5.c
@@ -31,7 +31,7 @@ static int img_ir_rc5_scancode(int len, u64 raw, u64 enabled_protocols,
 
 	request->protocol = RC_PROTO_RC5;
 	request->scancode = addr << 8 | cmd;
-	request->toggle   = tgl;
+	request->toggle   = 1 + tgl;
 	return IMG_IR_SCANCODE;
 }
 
diff --git a/drivers/media/rc/img-ir/img-ir-rc6.c b/drivers/media/rc/img-ir/img-ir-rc6.c
index b2bf46886420..5baa74a67d72 100644
--- a/drivers/media/rc/img-ir/img-ir-rc6.c
+++ b/drivers/media/rc/img-ir/img-ir-rc6.c
@@ -52,7 +52,7 @@ static int img_ir_rc6_scancode(int len, u64 raw, u64 enabled_protocols,
 
 	request->protocol = RC_PROTO_RC6_0;
 	request->scancode = addr << 8 | cmd;
-	request->toggle	  = trl2;
+	request->toggle	  = 1 + trl2;
 	return IMG_IR_SCANCODE;
 }
 
diff --git a/drivers/media/rc/imon.c b/drivers/media/rc/imon.c
index 735b925da998..0fd0e41fd1d5 100644
--- a/drivers/media/rc/imon.c
+++ b/drivers/media/rc/imon.c
@@ -1552,7 +1552,7 @@ static int imon_parse_press_type(struct imon_context *ictx,
 
 	/* mce-specific button handling, no keyup events */
 	else if (ktype == IMON_KEY_MCE) {
-		ictx->rc_toggle = buf[2];
+		ictx->rc_toggle = 1 + buf[2]; /* FIXME: test this */
 		press_type = 1;
 
 	/* incoherent or irrelevant data */
diff --git a/drivers/media/rc/ir-jvc-decoder.c b/drivers/media/rc/ir-jvc-decoder.c
index 8b10954d2b6b..c72aa1c2f15a 100644
--- a/drivers/media/rc/ir-jvc-decoder.c
+++ b/drivers/media/rc/ir-jvc-decoder.c
@@ -129,7 +129,8 @@ static int ir_jvc_decode(struct rc_dev *dev, struct ir_raw_event ev)
 			scancode = (bitrev8((data->bits >> 8) & 0xff) << 8) |
 				   (bitrev8((data->bits >> 0) & 0xff) << 0);
 			dev_dbg(&dev->dev, "JVC scancode 0x%04x\n", scancode);
-			rc_keydown(dev, RC_PROTO_JVC, scancode, data->toggle);
+			rc_keydown(dev, RC_PROTO_JVC, scancode,
+				   1 + data->toggle);
 			data->first = false;
 			data->old_bits = data->bits;
 		} else if (data->bits == data->old_bits) {
diff --git a/drivers/media/rc/ir-rc5-decoder.c b/drivers/media/rc/ir-rc5-decoder.c
index 82d7f6ad2338..9a1071418d61 100644
--- a/drivers/media/rc/ir-rc5-decoder.c
+++ b/drivers/media/rc/ir-rc5-decoder.c
@@ -157,7 +157,7 @@ static int ir_rc5_decode(struct rc_dev *dev, struct ir_raw_event ev)
 		dev_dbg(&dev->dev, "RC5(x/sz) scancode 0x%06x (p: %u, t: %u)\n",
 			scancode, protocol, toggle);
 
-		rc_keydown(dev, protocol, scancode, toggle);
+		rc_keydown(dev, protocol, scancode, 1 + toggle);
 		data->state = STATE_INACTIVE;
 		return 0;
 	}
diff --git a/drivers/media/rc/ir-rc6-decoder.c b/drivers/media/rc/ir-rc6-decoder.c
index 3b2c8bab3e73..74dfc270e7f7 100644
--- a/drivers/media/rc/ir-rc6-decoder.c
+++ b/drivers/media/rc/ir-rc6-decoder.c
@@ -212,7 +212,7 @@ static int ir_rc6_decode(struct rc_dev *dev, struct ir_raw_event ev)
 		switch (rc6_mode(data)) {
 		case RC6_MODE_0:
 			scancode = data->body;
-			toggle = data->toggle;
+			toggle = 1 + data->toggle;
 			protocol = RC_PROTO_RC6_0;
 			dev_dbg(&dev->dev, "RC6(0) scancode 0x%04x (toggle: %u)\n",
 				scancode, toggle);
@@ -241,7 +241,7 @@ static int ir_rc6_decode(struct rc_dev *dev, struct ir_raw_event ev)
 				case RC6_6A_KATHREIN_CC:
 				case RC6_6A_ZOTAC_CC:
 					protocol = RC_PROTO_RC6_MCE;
-					toggle = !!(scancode & RC6_6A_MCE_TOGGLE_MASK);
+					toggle = 1 + !!(scancode & RC6_6A_MCE_TOGGLE_MASK);
 					scancode &= ~RC6_6A_MCE_TOGGLE_MASK;
 					break;
 				default:
diff --git a/drivers/media/rc/ir-rcmm-decoder.c b/drivers/media/rc/ir-rcmm-decoder.c
index a8a34436fe85..7c43bc22f580 100644
--- a/drivers/media/rc/ir-rcmm-decoder.c
+++ b/drivers/media/rc/ir-rcmm-decoder.c
@@ -148,7 +148,7 @@ static int ir_rcmm_decode(struct rc_dev *dev, struct ir_raw_event ev)
 			break;
 
 		if (rcmm_mode(data)) {
-			toggle = !!(0x8000 & data->bits);
+			toggle = 1 + !!(0x8000 & data->bits);
 			scancode = data->bits & ~0x8000;
 		} else {
 			toggle = 0;
diff --git a/drivers/media/rc/rc-main.c b/drivers/media/rc/rc-main.c
index f27f6b383816..dbea6eda83ee 100644
--- a/drivers/media/rc/rc-main.c
+++ b/drivers/media/rc/rc-main.c
@@ -782,18 +782,19 @@ static void ir_do_keydown(struct rc_dev *dev, enum rc_proto protocol,
 {
 	bool new_event = (!dev->keypressed		 ||
 			  dev->last_protocol != protocol ||
-			  dev->last_scancode != scancode ||
-			  dev->last_toggle   != toggle);
+			  dev->last_scancode != scancode);
+	bool repeat_event = !new_event && toggle && dev->last_toggle == toggle;
 	struct lirc_scancode sc = {
 		.scancode = scancode, .rc_proto = protocol,
-		.flags = toggle ? LIRC_SCANCODE_FLAG_TOGGLE : 0,
+		.flags = (toggle > 1 ? LIRC_SCANCODE_FLAG_TOGGLE : 0) |
+			 (repeat_event ? LIRC_SCANCODE_FLAG_REPEAT : 0),
 		.keycode = keycode
 	};
 
 	if (dev->allowed_protocols != RC_PROTO_BIT_CEC)
 		lirc_scancode_event(dev, &sc);
 
-	if (new_event && dev->keypressed)
+	if (!repeat_event && dev->keypressed)
 		ir_do_keyup(dev, false);
 
 	if (scancode <= U32_MAX)
diff --git a/drivers/media/usb/dvb-usb-v2/az6007.c b/drivers/media/usb/dvb-usb-v2/az6007.c
index 62ee09f28a0b..cc218c0d71a8 100644
--- a/drivers/media/usb/dvb-usb-v2/az6007.c
+++ b/drivers/media/usb/dvb-usb-v2/az6007.c
@@ -224,7 +224,7 @@ static int az6007_rc_query(struct dvb_usb_device *d)
 		proto = RC_PROTO_NEC32;
 	}
 
-	rc_keydown(d->rc_dev, proto, code, st->data[5]);
+	rc_keydown(d->rc_dev, proto, code, 1 + st->data[5]); /* FIXME */
 
 	return 0;
 }
diff --git a/drivers/media/usb/dvb-usb-v2/dvbsky.c b/drivers/media/usb/dvb-usb-v2/dvbsky.c
index 1221c924312a..e264c774c64f 100644
--- a/drivers/media/usb/dvb-usb-v2/dvbsky.c
+++ b/drivers/media/usb/dvb-usb-v2/dvbsky.c
@@ -192,7 +192,7 @@ static int dvbsky_rc_query(struct dvb_usb_device *d)
 		rc5_system = (code & 0x7C0) >> 6;
 		toggle = (code & 0x800) ? 1 : 0;
 		scancode = rc5_system << 8 | rc5_command;
-		rc_keydown(d->rc_dev, RC_PROTO_RC5, scancode, toggle);
+		rc_keydown(d->rc_dev, RC_PROTO_RC5, scancode, 1 + toggle);
 	}
 	return 0;
 }
diff --git a/drivers/media/usb/dvb-usb-v2/rtl28xxu.c b/drivers/media/usb/dvb-usb-v2/rtl28xxu.c
index a83b1107fc7f..04670cec727c 100644
--- a/drivers/media/usb/dvb-usb-v2/rtl28xxu.c
+++ b/drivers/media/usb/dvb-usb-v2/rtl28xxu.c
@@ -1711,16 +1711,10 @@ static int rtl2831u_get_rc_config(struct dvb_usb_device *d,
 
 static int rtl2832u_rc_query(struct dvb_usb_device *d)
 {
-	int ret, i, len;
+	int ret, i, end;
 	struct rtl28xxu_dev *dev = d->priv;
 	struct ir_raw_event ev = {};
 	u8 buf[128];
-	static const struct rtl28xxu_reg_val_mask refresh_tab[] = {
-		{IR_RX_IF,               0x03, 0xff},
-		{IR_RX_BUF_CTRL,         0x80, 0xff},
-		{IR_RX_CTRL,             0x80, 0xff},
-	};
-	u32 idle_length;
 
 	/* init remote controller */
 	if (!dev->rc_active) {
@@ -1761,48 +1755,22 @@ static int rtl2832u_rc_query(struct dvb_usb_device *d)
 		goto exit;
 
 	ret = rtl28xxu_rd_reg(d, IR_RX_BC, &buf[0]);
-	if (ret || buf[0] > sizeof(buf))
+	if (ret)
 		goto err;
 
-	len = buf[0];
+	i = dev->rc_bc;
+	end = dev->rc_bc = buf[0] & 0x7f;
 
 	/* read raw code from hw */
-	ret = rtl28xxu_rd_regs(d, IR_RX_BUF, buf, len);
+	ret = rtl28xxu_rd_regs(d, IR_RX_BUF, buf, sizeof buf);
 	if (ret)
 		goto err;
 
-	dev_dbg(&d->intf->dev, "IR_RX_BUF=%*ph\n", len, buf);
-
-	/* if the receiver is not idle yet, do not process */
-	idle_length = 0;
-	if (len > 2) {
-		if (!(buf[len - 1] & 0x80))
-			idle_length += buf[len - 1];
-		if (!(buf[len - 2] & 0x80))
-			idle_length += buf[len - 2];
-	}
-
-	if (idle_length < 0xbf) {
-		/*
-		 * If the IR does not end with a space equal to the idle
-		 * length, then the IR is not complete yet and more is to
-		 * arrive shortly. If we process it and flush the buffer now,
-		 * we end up missing IR.
-		 */
-		dev_dbg(&d->intf->dev, "ignoring idle=%x\n", idle_length);
-		return 0;
-	}
-
-	/* let hw receive new code */
-	for (i = 0; i < ARRAY_SIZE(refresh_tab); i++) {
-		ret = rtl28xxu_wr_reg_mask(d, refresh_tab[i].reg,
-				refresh_tab[i].val, refresh_tab[i].mask);
-		if (ret)
-			goto err;
-	}
+	dev_dbg(&d->intf->dev, "IR_RX_BUF=%d,%*ph\n", end,
+		(int) sizeof buf, buf);
 
 	/* pass data to Kernel IR decoder */
-	for (i = 0; i < len; i++) {
+	for (; i != end; i++, i &= 0x7f) {
 		ev.pulse = buf[i] >> 7;
 		ev.duration = 51 * (buf[i] & 0x7f);
 		ir_raw_event_store_with_filter(d->rc_dev, &ev);
diff --git a/drivers/media/usb/dvb-usb-v2/rtl28xxu.h b/drivers/media/usb/dvb-usb-v2/rtl28xxu.h
index d5e207baa05d..b1abd73a3020 100644
--- a/drivers/media/usb/dvb-usb-v2/rtl28xxu.h
+++ b/drivers/media/usb/dvb-usb-v2/rtl28xxu.h
@@ -64,6 +64,7 @@ struct rtl28xxu_dev {
 	u8 tuner;
 	char *tuner_name;
 	u8 page; /* integrated demod active register page */
+	u8 rc_bc;
 	struct i2c_adapter *demod_i2c_adapter;
 	bool rc_active;
 	bool new_i2c_write;
diff --git a/drivers/media/usb/dvb-usb/dib0700_core.c b/drivers/media/usb/dvb-usb/dib0700_core.c
index 1caabb51ea47..02bb7349857f 100644
--- a/drivers/media/usb/dvb-usb/dib0700_core.c
+++ b/drivers/media/usb/dvb-usb/dib0700_core.c
@@ -780,7 +780,7 @@ static void dib0700_rc_urb_completion(struct urb *purb)
 	default:
 		deb_data("RC5 protocol\n");
 		protocol = RC_PROTO_RC5;
-		toggle = poll_reply->report_id;
+		toggle = 1 + poll_reply->report_id; /* FIXME */
 		keycode = RC_SCANCODE_RC5(poll_reply->rc5.system, poll_reply->rc5.data);
 
 		if ((poll_reply->rc5.data ^ poll_reply->rc5.not_data) != 0xff) {
diff --git a/drivers/media/usb/dvb-usb/dib0700_devices.c b/drivers/media/usb/dvb-usb/dib0700_devices.c
index 7f8bebfa3e8e..7cbc1a251f47 100644
--- a/drivers/media/usb/dvb-usb/dib0700_devices.c
+++ b/drivers/media/usb/dvb-usb/dib0700_devices.c
@@ -565,7 +565,7 @@ static int dib0700_rc_query_old_firmware(struct dvb_usb_device *d)
 		/* RC-5 protocol changes toggle bit on new keypress */
 		protocol = RC_PROTO_RC5;
 		scancode = RC_SCANCODE_RC5(st->buf[3 - 2], st->buf[3 - 3]);
-		toggle = st->buf[3 - 1];
+		toggle = 1 + st->buf[3 - 1]; /* FIXME: test this */
 		break;
 	}
 
diff --git a/drivers/media/usb/dvb-usb/ttusb2.c b/drivers/media/usb/dvb-usb/ttusb2.c
index 373ffa7f641e..c649ae5415a3 100644
--- a/drivers/media/usb/dvb-usb/ttusb2.c
+++ b/drivers/media/usb/dvb-usb/ttusb2.c
@@ -456,7 +456,8 @@ static int tt3650_rc_query(struct dvb_usb_device *d)
 		/* got a "press" event */
 		st->last_rc_key = RC_SCANCODE_RC5(rx[3], rx[2]);
 		deb_info("%s: cmd=0x%02x sys=0x%02x\n", __func__, rx[2], rx[3]);
-		rc_keydown(d->rc_dev, RC_PROTO_RC5, st->last_rc_key, rx[1]);
+		rc_keydown(d->rc_dev, RC_PROTO_RC5, st->last_rc_key,
+			   1 + rx[1]); /* FIXME: test this */
 	} else if (st->last_rc_key) {
 		rc_keyup(d->rc_dev);
 		st->last_rc_key = 0;
diff --git a/drivers/media/usb/em28xx/em28xx-input.c b/drivers/media/usb/em28xx/em28xx-input.c
index 0b6d77c3bec8..79f7c2540c02 100644
--- a/drivers/media/usb/em28xx/em28xx-input.c
+++ b/drivers/media/usb/em28xx/em28xx-input.c
@@ -340,12 +340,12 @@ static void em28xx_ir_handle_key(struct em28xx_IR *ir)
 			rc_keydown(ir->rc,
 				   poll_result.protocol,
 				   poll_result.scancode,
-				   poll_result.toggle_bit);
+				   1 + poll_result.toggle_bit);
 		else
 			rc_keydown(ir->rc,
 				   RC_PROTO_UNKNOWN,
 				   poll_result.scancode & 0xff,
-				   poll_result.toggle_bit);
+				   1 + poll_result.toggle_bit);
 
 		if (ir->dev->chip_id == CHIP_ID_EM2874 ||
 		    ir->dev->chip_id == CHIP_ID_EM2884)
diff --git a/drivers/staging/media/av7110/av7110_ir.c b/drivers/staging/media/av7110/av7110_ir.c
index a851ba328e4a..ec33a4be3cd5 100644
--- a/drivers/staging/media/av7110/av7110_ir.c
+++ b/drivers/staging/media/av7110/av7110_ir.c
@@ -64,7 +64,7 @@ void av7110_ir_handler(struct av7110 *av7110, u32 ircom)
 			return;
 		}
 
-		rc_keydown(rcdev, proto, scancode, toggle != 0);
+		rc_keydown(rcdev, proto, scancode, 1 + !!toggle);
 	}
 }
 
-- 
2.36.1


--ykhP8KOj85vLkU6E--
