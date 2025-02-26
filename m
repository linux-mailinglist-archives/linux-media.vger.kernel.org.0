Return-Path: <linux-media+bounces-27010-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C5BBA45A2B
	for <lists+linux-media@lfdr.de>; Wed, 26 Feb 2025 10:33:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 80B8A3A9362
	for <lists+linux-media@lfdr.de>; Wed, 26 Feb 2025 09:33:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E29B226CF8;
	Wed, 26 Feb 2025 09:33:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b="Y/h+a99M";
	dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b="qPsBrJwY"
X-Original-To: linux-media@vger.kernel.org
Received: from gofer.mess.org (gofer.mess.org [88.97.38.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31CE8258CE2;
	Wed, 26 Feb 2025 09:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=88.97.38.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740562400; cv=none; b=roW1djFWwcwXdwAin0kPCMiOeehWh6PU1WMPyJxHwu8X2kZGJYYAvZJhF1TrzzrJPzbOUWKSABWYpuTOAwb/lZEAZ4/9Vt8a91ZEyBh485e/B8bvw5USi11+gAhN/u6RRwxdpMbjNjyI/SIHkUEGzq7hLFejbAYjh/JwAr520RI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740562400; c=relaxed/simple;
	bh=POFRDazrszvS0QnZZVAljjxN4oXlt99iQqupMJS0sPg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UyNrMbIXsiWbobdmJ2JgfGXMDGDdPmiMAPV7bUdTzrAVlxjPnZHb8TEDuher/i4v/i4qcwtACH5e9js3Kk4ILOqq8LcjYl0qbLxNMXcABq3ZVTgo/M8E7nEmvSM4U48GR2ynQXzWmJfSskwiBIkVPnudnVJT+tPqff/yz50em90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org; spf=pass smtp.mailfrom=mess.org; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=Y/h+a99M; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=qPsBrJwY; arc=none smtp.client-ip=88.97.38.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mess.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1740562081; bh=POFRDazrszvS0QnZZVAljjxN4oXlt99iQqupMJS0sPg=;
	h=From:To:Cc:Subject:Date:From;
	b=Y/h+a99MpDTIEjCo9L7E+7mqOeOyTMgSflxfKkJEvVJCrHGPquCnK0aSmWf/3gHkh
	 kXhYh6OC2CghVQeNQI5UHFmNWOjcJaIfmb6BMd+D99r1Bj+ZeAGH5dINc7oRa9sh39
	 wsBsYzJOyF1kxaKR/CQU67PSZ3u904MUsrEJru8r97CY10gBusxoEuvkQ4FGOcf97T
	 LWX7jvJWqR6Y2W/zjajoCXY31YEJAXnsBMG2Rv2PJLXlb0DMt0hgRU9a+KIMxyiGSh
	 EuY+jIYlbGThYo/FSt/XgWdCBxAeiGlTKhb86UtEkbkO9MwcCD/dLEoONKev45/PoQ
	 o+VbZZm7Q+jRw==
Received: by gofer.mess.org (Postfix, from userid 501)
	id D4B7B100740; Wed, 26 Feb 2025 09:28:01 +0000 (GMT)
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1740562079; bh=POFRDazrszvS0QnZZVAljjxN4oXlt99iQqupMJS0sPg=;
	h=From:To:Cc:Subject:Date:From;
	b=qPsBrJwYO1gwvTtZ2VcnF5onhFBhuJH3qrC9XBU+FH23v9SvV3ZWHMX8PfT0dUd82
	 5yUED/QSEWuZNEf4cEG2o4hQaAkf2mkw3VZ+jbNJ+xYxTMl/TJpxHa6LXVNObnyiXf
	 mjmos6+Cmb7Juu9Ldqa+SjGkQJeO7fZiWwk3vK1ZeTk0Rq14MzZIMM4+FSdE6p4bjL
	 CyMejtxJFc/wIHEW7ubnIklSe7k4KjNZ4SCYpNaNpOad9ljZgFtUxXE/rkLBAKDxg8
	 CJ3SWdyA+lnbPNwiji4pz1uoKD9xTr1DQCpcHKUnnFcHzlaRpwhZZcIZvwAn/3giIg
	 Z1F2IycKeIIrA==
Received: from bigcore.mess.org (bigcore.local [IPv6:2a02:8011:d000:212:bc3c:1b4a:a6fa:362f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gofer.mess.org (Postfix) with ESMTPSA id D654F10005D;
	Wed, 26 Feb 2025 09:27:59 +0000 (GMT)
From: Sean Young <sean@mess.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] media: rc: reduce useless padding in struct rc_dev etc
Date: Wed, 26 Feb 2025 09:27:50 +0000
Message-ID: <20250226092751.8836-1-sean@mess.org>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reorder the fields in these structs so that we waste less space due to
padding. pahole shows that lirc_fh is 8 bytes smaller, and rc_dev is 32
bytes smaller.

Signed-off-by: Sean Young <sean@mess.org>
---
 drivers/media/rc/rc-core-priv.h |  4 +--
 include/media/rc-core.h         | 46 ++++++++++++++++-----------------
 2 files changed, 25 insertions(+), 25 deletions(-)

diff --git a/drivers/media/rc/rc-core-priv.h b/drivers/media/rc/rc-core-priv.h
index 7df949fc65e2b..4967d87ec4b77 100644
--- a/drivers/media/rc/rc-core-priv.h
+++ b/drivers/media/rc/rc-core-priv.h
@@ -85,8 +85,8 @@ struct ir_raw_event_ctrl {
 	struct rc6_dec {
 		int state;
 		u8 header;
-		u32 body;
 		bool toggle;
+		u32 body;
 		unsigned count;
 		unsigned wanted_bits;
 	} rc6;
@@ -127,8 +127,8 @@ struct ir_raw_event_ctrl {
 	struct mce_kbd_dec {
 		/* locks key up timer */
 		spinlock_t keylock;
-		struct timer_list rx_timeout;
 		int state;
+		struct timer_list rx_timeout;
 		u8 header;
 		u32 body;
 		unsigned count;
diff --git a/include/media/rc-core.h b/include/media/rc-core.h
index d095908073ef9..35c7a0546f02e 100644
--- a/include/media/rc-core.h
+++ b/include/media/rc-core.h
@@ -57,11 +57,11 @@ enum rc_filter_type {
  * struct lirc_fh - represents an open lirc file
  * @list: list of open file handles
  * @rc: rcdev for this lirc chardev
- * @carrier_low: when setting the carrier range, first the low end must be
- *	set with an ioctl and then the high end with another ioctl
  * @rawir: queue for incoming raw IR
  * @scancodes: queue for incoming decoded scancodes
  * @wait_poll: poll struct for lirc device
+ * @carrier_low: when setting the carrier range, first the low end must be
+ *	set with an ioctl and then the high end with another ioctl
  * @send_mode: lirc mode for sending, either LIRC_MODE_SCANCODE or
  *	LIRC_MODE_PULSE
  * @rec_mode: lirc mode for receiving, either LIRC_MODE_SCANCODE or
@@ -70,10 +70,10 @@ enum rc_filter_type {
 struct lirc_fh {
 	struct list_head list;
 	struct rc_dev *rc;
-	int				carrier_low;
 	DECLARE_KFIFO_PTR(rawir, unsigned int);
 	DECLARE_KFIFO_PTR(scancodes, struct lirc_scancode);
 	wait_queue_head_t		wait_poll;
+	u32				carrier_low;
 	u8				send_mode;
 	u8				rec_mode;
 };
@@ -82,6 +82,12 @@ struct lirc_fh {
  * struct rc_dev - represents a remote control device
  * @dev: driver model's view of this device
  * @managed_alloc: devm_rc_allocate_device was used to create rc_dev
+ * @registered: set to true by rc_register_device(), false by
+ *	rc_unregister_device
+ * @idle: used to keep track of RX state
+ * @encode_wakeup: wakeup filtering uses IR encode API, therefore the allowed
+ *	wakeup protocols is the set of all raw encoders
+ * @minor: unique minor remote control device number
  * @sysfs_groups: sysfs attribute groups
  * @device_name: name of the rc child device
  * @input_phys: physical path to the input child device
@@ -91,13 +97,10 @@ struct lirc_fh {
  * @rc_map: current scan/key table
  * @lock: used to ensure we've filled in all protocol details before
  *	anyone can call show_protocols or store_protocols
- * @minor: unique minor remote control device number
  * @raw: additional data for raw pulse/space devices
  * @input_dev: the input child device used to communicate events to userspace
  * @driver_type: specifies if protocol decoding is done in hardware or software
- * @idle: used to keep track of RX state
- * @encode_wakeup: wakeup filtering uses IR encode API, therefore the allowed
- *	wakeup protocols is the set of all raw encoders
+ * @users: number of current users of the device
  * @allowed_protocols: bitmask with the supported RC_PROTO_BIT_* protocols
  * @enabled_protocols: bitmask with the enabled RC_PROTO_BIT_* protocols
  * @allowed_wakeup_protocols: bitmask with the supported RC_PROTO_BIT_* wakeup
@@ -111,18 +114,17 @@ struct lirc_fh {
  *	anything with it. Yet, as the same keycode table can be used with other
  *	devices, a mask is provided to allow its usage. Drivers should generally
  *	leave this field in blank
- * @users: number of current users of the device
  * @priv: driver-specific data
  * @keylock: protects the remaining members of the struct
  * @keypressed: whether a key is currently pressed
+ * @last_toggle: toggle value of last command
+ * @last_keycode: keycode of last keypress
+ * @last_protocol: protocol of last keypress
+ * @last_scancode: scancode of last keypress
  * @keyup_jiffies: time (in jiffies) when the current keypress should be released
  * @timer_keyup: timer for releasing a keypress
  * @timer_repeat: timer for autorepeat events. This is needed for CEC, which
  *	has non-standard repeats.
- * @last_keycode: keycode of last keypress
- * @last_protocol: protocol of last keypress
- * @last_scancode: scancode of last keypress
- * @last_toggle: toggle value of last command
  * @timeout: optional time after which device stops sending data
  * @min_timeout: minimum timeout supported by device
  * @max_timeout: maximum timeout supported by device
@@ -132,8 +134,6 @@ struct lirc_fh {
  * @gap_start: start time for gap after timeout if non-zero
  * @lirc_fh_lock: protects lirc_fh list
  * @lirc_fh: list of open files
- * @registered: set to true by rc_register_device(), false by
- *	rc_unregister_device
  * @change_protocol: allow changing the protocol used on hardware decoders
  * @open: callback to allow drivers to enable polling/irq when IR input device
  *	is opened.
@@ -157,6 +157,10 @@ struct lirc_fh {
 struct rc_dev {
 	struct device			dev;
 	bool				managed_alloc;
+	bool				registered;
+	bool				idle;
+	bool				encode_wakeup;
+	unsigned int			minor;
 	const struct attribute_group	*sysfs_groups[5];
 	const char			*device_name;
 	const char			*input_phys;
@@ -165,12 +169,10 @@ struct rc_dev {
 	const char			*map_name;
 	struct rc_map			rc_map;
 	struct mutex			lock;
-	unsigned int			minor;
 	struct ir_raw_event_ctrl	*raw;
 	struct input_dev		*input_dev;
 	enum rc_driver_type		driver_type;
-	bool				idle;
-	bool				encode_wakeup;
+	u32				users;
 	u64				allowed_protocols;
 	u64				enabled_protocols;
 	u64				allowed_wakeup_protocols;
@@ -178,17 +180,16 @@ struct rc_dev {
 	struct rc_scancode_filter	scancode_filter;
 	struct rc_scancode_filter	scancode_wakeup_filter;
 	u32				scancode_mask;
-	u32				users;
 	void				*priv;
 	spinlock_t			keylock;
 	bool				keypressed;
-	unsigned long			keyup_jiffies;
-	struct timer_list		timer_keyup;
-	struct timer_list		timer_repeat;
+	u8				last_toggle;
 	u32				last_keycode;
 	enum rc_proto			last_protocol;
 	u64				last_scancode;
-	u8				last_toggle;
+	unsigned long			keyup_jiffies;
+	struct timer_list		timer_keyup;
+	struct timer_list		timer_repeat;
 	u32				timeout;
 	u32				min_timeout;
 	u32				max_timeout;
@@ -200,7 +201,6 @@ struct rc_dev {
 	spinlock_t			lirc_fh_lock;
 	struct list_head		lirc_fh;
 #endif
-	bool				registered;
 	int				(*change_protocol)(struct rc_dev *dev, u64 *rc_proto);
 	int				(*open)(struct rc_dev *dev);
 	void				(*close)(struct rc_dev *dev);
-- 
2.48.1


