Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A7C6D14B0C0
	for <lists+linux-media@lfdr.de>; Tue, 28 Jan 2020 09:16:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725922AbgA1IQG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 Jan 2020 03:16:06 -0500
Received: from gofer.mess.org ([88.97.38.141]:53029 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725848AbgA1IQG (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 Jan 2020 03:16:06 -0500
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 75964C6372; Tue, 28 Jan 2020 08:16:04 +0000 (GMT)
From:   Sean Young <sean@mess.org>
To:     linux-media@vger.kernel.org
Subject: [PATCH] media: rc: make scancodes 64 bit
Date:   Tue, 28 Jan 2020 08:16:04 +0000
Message-Id: <20200128081604.1131-1-sean@mess.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

There are many protocols that encode more than 32 bit. We want 64 bit
support so that BPF IR decoders can decode more than 32 bit. None of
the existing kernel IR decoders/encoders support 64 bit, for now.

Signed-off-by: Sean Young <sean@mess.org>
---
 drivers/media/rc/bpf-lirc.c |  5 ---
 drivers/media/rc/lirc_dev.c |  5 +--
 drivers/media/rc/rc-main.c  | 66 +++++++++++++++++++++++++++----------
 include/media/rc-core.h     |  8 ++---
 include/media/rc-map.h      |  2 +-
 5 files changed, 55 insertions(+), 31 deletions(-)

diff --git a/drivers/media/rc/bpf-lirc.c b/drivers/media/rc/bpf-lirc.c
index 0a0ce620e4a2..0f3417d161b8 100644
--- a/drivers/media/rc/bpf-lirc.c
+++ b/drivers/media/rc/bpf-lirc.c
@@ -35,11 +35,6 @@ static const struct bpf_func_proto rc_repeat_proto = {
 	.arg1_type = ARG_PTR_TO_CTX,
 };
 
-/*
- * Currently rc-core does not support 64-bit scancodes, but there are many
- * known protocols with more than 32 bits. So, define the interface as u64
- * as a future-proof.
- */
 BPF_CALL_4(bpf_rc_keydown, u32*, sample, u32, protocol, u64, scancode,
 	   u32, toggle)
 {
diff --git a/drivers/media/rc/lirc_dev.c b/drivers/media/rc/lirc_dev.c
index 9a8c1cf54ac4..b0a55d1430cc 100644
--- a/drivers/media/rc/lirc_dev.c
+++ b/drivers/media/rc/lirc_dev.c
@@ -270,10 +270,7 @@ static ssize_t ir_lirc_transmit_ir(struct file *file, const char __user *buf,
 		}
 
 		/*
-		 * The scancode field in lirc_scancode is 64-bit simply
-		 * to future-proof it, since there are IR protocols encode
-		 * use more than 32 bits. For now only 32-bit protocols
-		 * are supported.
+		 * For now, we can only encode 32-bit protocols.
 		 */
 		if (scan.scancode > U32_MAX ||
 		    !rc_validate_scancode(scan.rc_proto, scan.scancode)) {
diff --git a/drivers/media/rc/rc-main.c b/drivers/media/rc/rc-main.c
index 6f80c251f641..d38cddb53bb7 100644
--- a/drivers/media/rc/rc-main.c
+++ b/drivers/media/rc/rc-main.c
@@ -163,6 +163,41 @@ static struct rc_map_list empty_map = {
 	}
 };
 
+/**
+ * scancode_to_u64() - converts scancode in &struct input_keymap_entry
+ * @ke: keymap entry containing scancode to be converted.
+ * @scancode: pointer to the location where converted scancode should
+ *	be stored.
+ *
+ * This function is a version of input_scancode_to_scalar specialized for
+ * rc-core.
+ */
+int scancode_to_u64(const struct input_keymap_entry *ke, u64 *scancode)
+{
+	switch (ke->len) {
+	case 1:
+		*scancode = *((u8 *)ke->scancode);
+		break;
+
+	case 2:
+		*scancode = *((u16 *)ke->scancode);
+		break;
+
+	case 4:
+		*scancode = *((u32 *)ke->scancode);
+		break;
+
+	case 8:
+		*scancode = *((u64 *)ke->scancode);
+		break;
+
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
 /**
  * ir_create_table() - initializes a scancode table
  * @dev:	the rc_dev device
@@ -334,8 +369,7 @@ static unsigned int ir_update_mapping(struct rc_dev *dev,
  */
 static unsigned int ir_establish_scancode(struct rc_dev *dev,
 					  struct rc_map *rc_map,
-					  unsigned int scancode,
-					  bool resize)
+					  u64 scancode, bool resize)
 {
 	unsigned int i;
 
@@ -394,7 +428,7 @@ static int ir_setkeycode(struct input_dev *idev,
 	struct rc_dev *rdev = input_get_drvdata(idev);
 	struct rc_map *rc_map = &rdev->rc_map;
 	unsigned int index;
-	unsigned int scancode;
+	u64 scancode;
 	int retval = 0;
 	unsigned long flags;
 
@@ -407,7 +441,7 @@ static int ir_setkeycode(struct input_dev *idev,
 			goto out;
 		}
 	} else {
-		retval = input_scancode_to_scalar(ke, &scancode);
+		retval = scancode_to_u64(ke, &scancode);
 		if (retval)
 			goto out;
 
@@ -434,8 +468,7 @@ static int ir_setkeycode(struct input_dev *idev,
  *
  * return:	-ENOMEM if all keycodes could not be inserted, otherwise zero.
  */
-static int ir_setkeytable(struct rc_dev *dev,
-			  const struct rc_map *from)
+static int ir_setkeytable(struct rc_dev *dev, const struct rc_map *from)
 {
 	struct rc_map *rc_map = &dev->rc_map;
 	unsigned int i, index;
@@ -466,7 +499,7 @@ static int ir_setkeytable(struct rc_dev *dev,
 
 static int rc_map_cmp(const void *key, const void *elt)
 {
-	const unsigned int *scancode = key;
+	const u64 *scancode = key;
 	const struct rc_map_table *e = elt;
 
 	if (*scancode < e->scancode)
@@ -487,7 +520,7 @@ static int rc_map_cmp(const void *key, const void *elt)
  * return:	index in the table, -1U if not found
  */
 static unsigned int ir_lookup_by_scancode(const struct rc_map *rc_map,
-					  unsigned int scancode)
+					  u64 scancode)
 {
 	struct rc_map_table *res;
 
@@ -516,7 +549,7 @@ static int ir_getkeycode(struct input_dev *idev,
 	struct rc_map_table *entry;
 	unsigned long flags;
 	unsigned int index;
-	unsigned int scancode;
+	u64 scancode;
 	int retval;
 
 	spin_lock_irqsave(&rc_map->lock, flags);
@@ -524,7 +557,7 @@ static int ir_getkeycode(struct input_dev *idev,
 	if (ke->flags & INPUT_KEYMAP_BY_INDEX) {
 		index = ke->index;
 	} else {
-		retval = input_scancode_to_scalar(ke, &scancode);
+		retval = scancode_to_u64(ke, &scancode);
 		if (retval)
 			goto out;
 
@@ -538,7 +571,6 @@ static int ir_getkeycode(struct input_dev *idev,
 		ke->keycode = entry->keycode;
 		ke->len = sizeof(entry->scancode);
 		memcpy(ke->scancode, &entry->scancode, sizeof(entry->scancode));
-
 	} else if (!(ke->flags & INPUT_KEYMAP_BY_INDEX)) {
 		/*
 		 * We do not really know the valid range of scancodes
@@ -570,7 +602,7 @@ static int ir_getkeycode(struct input_dev *idev,
  *
  * return:	the corresponding keycode, or KEY_RESERVED
  */
-u32 rc_g_keycode_from_table(struct rc_dev *dev, u32 scancode)
+u32 rc_g_keycode_from_table(struct rc_dev *dev, u64 scancode)
 {
 	struct rc_map *rc_map = &dev->rc_map;
 	unsigned int keycode;
@@ -586,7 +618,7 @@ u32 rc_g_keycode_from_table(struct rc_dev *dev, u32 scancode)
 	spin_unlock_irqrestore(&rc_map->lock, flags);
 
 	if (keycode != KEY_RESERVED)
-		dev_dbg(&dev->dev, "%s: scancode 0x%04x keycode 0x%02x\n",
+		dev_dbg(&dev->dev, "%s: scancode 0x%04llx keycode 0x%02x\n",
 			dev->device_name, scancode, keycode);
 
 	return keycode;
@@ -743,7 +775,7 @@ EXPORT_SYMBOL_GPL(rc_repeat);
  * called with keylock held.
  */
 static void ir_do_keydown(struct rc_dev *dev, enum rc_proto protocol,
-			  u32 scancode, u32 keycode, u8 toggle)
+			  u64 scancode, u32 keycode, u8 toggle)
 {
 	bool new_event = (!dev->keypressed		 ||
 			  dev->last_protocol != protocol ||
@@ -772,7 +804,7 @@ static void ir_do_keydown(struct rc_dev *dev, enum rc_proto protocol,
 		/* Register a keypress */
 		dev->keypressed = true;
 
-		dev_dbg(&dev->dev, "%s: key down event, key 0x%04x, protocol 0x%04x, scancode 0x%08x\n",
+		dev_dbg(&dev->dev, "%s: key down event, key 0x%04x, protocol 0x%04x, scancode 0x%08llx\n",
 			dev->device_name, keycode, protocol, scancode);
 		input_report_key(dev->input_dev, keycode, 1);
 
@@ -809,7 +841,7 @@ static void ir_do_keydown(struct rc_dev *dev, enum rc_proto protocol,
  * This routine is used to signal that a key has been pressed on the
  * remote control.
  */
-void rc_keydown(struct rc_dev *dev, enum rc_proto protocol, u32 scancode,
+void rc_keydown(struct rc_dev *dev, enum rc_proto protocol, u64 scancode,
 		u8 toggle)
 {
 	unsigned long flags;
@@ -840,7 +872,7 @@ EXPORT_SYMBOL_GPL(rc_keydown);
  * remote control. The driver must manually call rc_keyup() at a later stage.
  */
 void rc_keydown_notimeout(struct rc_dev *dev, enum rc_proto protocol,
-			  u32 scancode, u8 toggle)
+			  u64 scancode, u8 toggle)
 {
 	unsigned long flags;
 	u32 keycode = rc_g_keycode_from_table(dev, scancode);
diff --git a/include/media/rc-core.h b/include/media/rc-core.h
index 1f695d9c200a..d3f85df64bb2 100644
--- a/include/media/rc-core.h
+++ b/include/media/rc-core.h
@@ -192,7 +192,7 @@ struct rc_dev {
 	struct timer_list		timer_repeat;
 	u32				last_keycode;
 	enum rc_proto			last_protocol;
-	u32				last_scancode;
+	u64				last_scancode;
 	u8				last_toggle;
 	u32				timeout;
 	u32				min_timeout;
@@ -284,12 +284,12 @@ int devm_rc_register_device(struct device *parent, struct rc_dev *dev);
 void rc_unregister_device(struct rc_dev *dev);
 
 void rc_repeat(struct rc_dev *dev);
-void rc_keydown(struct rc_dev *dev, enum rc_proto protocol, u32 scancode,
+void rc_keydown(struct rc_dev *dev, enum rc_proto protocol, u64 scancode,
 		u8 toggle);
 void rc_keydown_notimeout(struct rc_dev *dev, enum rc_proto protocol,
-			  u32 scancode, u8 toggle);
+			  u64 scancode, u8 toggle);
 void rc_keyup(struct rc_dev *dev);
-u32 rc_g_keycode_from_table(struct rc_dev *dev, u32 scancode);
+u32 rc_g_keycode_from_table(struct rc_dev *dev, u64 scancode);
 
 /*
  * From rc-raw.c
diff --git a/include/media/rc-map.h b/include/media/rc-map.h
index d22810dcd85c..0a9142fa3c80 100644
--- a/include/media/rc-map.h
+++ b/include/media/rc-map.h
@@ -90,7 +90,7 @@
  */
 struct rc_map_table {
 	u32	scancode;
-	u32	keycode;
+	u64	keycode;
 };
 
 /**
-- 
2.24.1

