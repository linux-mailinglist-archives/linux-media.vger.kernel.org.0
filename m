Return-Path: <linux-media+bounces-14530-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F4C5923EAB
	for <lists+linux-media@lfdr.de>; Tue,  2 Jul 2024 15:17:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 30F571C22C54
	for <lists+linux-media@lfdr.de>; Tue,  2 Jul 2024 13:17:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF02A1B4C3E;
	Tue,  2 Jul 2024 13:17:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b="Gg0cjQV6";
	dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b="rO4r/91p"
X-Original-To: linux-media@vger.kernel.org
Received: from gofer.mess.org (gofer.mess.org [88.97.38.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8870D1B47AE;
	Tue,  2 Jul 2024 13:17:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=88.97.38.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719926252; cv=none; b=jlmuTIa+9sAAJBwC9dNKMYM0UaTU+LZAL18jSDqkTIxybgmgjTH/iCA0E1MgsZJn0y5/tp/rqBfqdPT7hTsE4rZnyTyUZ7SwbEQk9UwselZNaDLfP+Z5Y89vLx41lRLO2fnlxoIDt81urPZs+T6DO/NEqiiAq+T8rVg453onkqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719926252; c=relaxed/simple;
	bh=nZ93kjKMZv3z4eVgOtALn8/6uNAb67f/+1r8/XKSRYk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kMcAYoPGtm7RQkkMp5gP9HSW8HeP9Jr7tYRRtR4UsRAZmVmCkCVamy2twToxLpPEgeIRr0b66WQXOpwySYzkqj5ZsBXiGmOMl2QWbIDCJyxAAbPbVIwP1w78NF6UDdYN3pOkoDs5NkPIWMf/k++uftOAicB2MX86q0CF9JWXCec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org; spf=pass smtp.mailfrom=mess.org; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=Gg0cjQV6; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=rO4r/91p; arc=none smtp.client-ip=88.97.38.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mess.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1719926242; bh=nZ93kjKMZv3z4eVgOtALn8/6uNAb67f/+1r8/XKSRYk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Gg0cjQV6ccdjv66kUREJgr4dnEzfA/RFCkJddIi4+dTgn5TH7z4xzCr9n+TRU4fe0
	 5HGC2cedcZD0LbSKNciTSpjQP98De7jaURQxjjBHhKN8yYSeyCTZe5Rp/BFmxgQAZy
	 vIgdEXw8gaZkuTDJ12iL/DaaPwkMNTzGrnwUzbUVOZln4aB7XT3x1UXyE5wIgl1k0/
	 rCiHZOXqqHXCq5eqw6QDPhn69yRqK7KkD+JZOfFGXCrRmKAjT/nkMY69c4fcDW1Quv
	 S5Pw6PS8TbsUpuz/gwl3puW95EJNw9uxog4RV7aVphCjWltm/f418KrLGt1MxULGGS
	 kA6iG76sHjw3g==
Received: by gofer.mess.org (Postfix, from userid 501)
	id AEEC8100105; Tue,  2 Jul 2024 14:17:22 +0100 (BST)
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1719926240; bh=nZ93kjKMZv3z4eVgOtALn8/6uNAb67f/+1r8/XKSRYk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rO4r/91pILbQzKK2gCp+r/WGnTap2w55T8vRU3c7sRYximUY8C+bQiSi7iEc2PiJ/
	 X/1HumvsoO5FxKYJNI62Er/J8rlQW4DZUW/iNvuiI3fTEpXucyYBp6MpIwMONU/PoR
	 HVI5BzahBqs2dBllpFkkZ7AU2W7eOg4z2EO8VQcI72uLimO3tXBOXBQqWy505THCRu
	 7hswJvHWVg8Lt4mOUGJKPfU3FKSy934qV2XEa/2bsvp7iBtNT8oJM1n+TYGywdfgZ5
	 q9NFu/RDaalhUUbtl0JM2+mRfXgK447ismErtGE17TymYWExzOffXsR35jVQr056rv
	 kAbvy2cmgWDng==
Received: from localhost.localdomain (bigcore.local [IPv6:2a02:8011:d000:212:bc3c:1b4a:a6fa:362f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gofer.mess.org (Postfix) with ESMTPSA id 6020D1000B2;
	Tue,  2 Jul 2024 14:17:20 +0100 (BST)
From: Sean Young <sean@mess.org>
To: linux-media@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] media: rc: reduce useless padding in struct rc_dev and lirc_fh
Date: Tue,  2 Jul 2024 14:17:03 +0100
Message-ID: <20240702131705.1073761-2-sean@mess.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240702131705.1073761-1-sean@mess.org>
References: <20240702131705.1073761-1-sean@mess.org>
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
 include/media/rc-core.h | 46 ++++++++++++++++++++---------------------
 1 file changed, 23 insertions(+), 23 deletions(-)

diff --git a/include/media/rc-core.h b/include/media/rc-core.h
index d095908073ef9..fc938400bb831 100644
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
+	int				carrier_low;
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
2.45.2


