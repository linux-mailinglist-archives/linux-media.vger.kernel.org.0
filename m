Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1788334540
	for <lists+linux-media@lfdr.de>; Tue,  4 Jun 2019 13:19:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727325AbfFDLTd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 Jun 2019 07:19:33 -0400
Received: from gofer.mess.org ([88.97.38.141]:53489 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727180AbfFDLTc (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 4 Jun 2019 07:19:32 -0400
Received: by gofer.mess.org (Postfix, from userid 1000)
        id DC281604C0; Tue,  4 Jun 2019 12:19:30 +0100 (BST)
From:   Sean Young <sean@mess.org>
To:     linux-media@vger.kernel.org, Oliver Endriss <o.endriss@gmx.de>,
        Holger Waechtler <holger@convergence.de>
Subject: [PATCH] media: ttpci: use rc-core for the IR receiver
Date:   Tue,  4 Jun 2019 12:19:30 +0100
Message-Id: <20190604111930.7153-1-sean@mess.org>
X-Mailer: git-send-email 2.11.0
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The IR protocol can be set via the rc protocols sysfs file rather than
via module parameters and a custom procfs file. So, it is no longer
necessary to periodically check for protocol changes.

The IR_RCMM protocol does not match the Philips RC-MM protocol (12, 24 or
32 bit variants) so this is marked RC_PROTO_UNKNOWN for now. This protocol
not used by the remote for this device.

Tested on Technotrend/Hauppauge WinTV Nexus-S rev2.1, which comes
with a small black hauppauge remote.

Signed-off-by: Sean Young <sean@mess.org>
---
 drivers/media/pci/ttpci/av7110.c        |  14 +-
 drivers/media/pci/ttpci/av7110.h        |  21 +-
 drivers/media/pci/ttpci/av7110_ir.c     | 423 ++++++------------------
 drivers/media/rc/keymaps/rc-hauppauge.c |   1 +
 4 files changed, 112 insertions(+), 347 deletions(-)

diff --git a/drivers/media/pci/ttpci/av7110.c b/drivers/media/pci/ttpci/av7110.c
index e6ee23544a6e..d0cdee1c6eb0 100644
--- a/drivers/media/pci/ttpci/av7110.c
+++ b/drivers/media/pci/ttpci/av7110.c
@@ -218,7 +218,7 @@ static void recover_arm(struct av7110 *av7110)
 	restart_feeds(av7110);
 
 #if IS_ENABLED(CONFIG_DVB_AV7110_IR)
-	av7110_check_ir_config(av7110, true);
+	av7110_set_ir_config(av7110);
 #endif
 }
 
@@ -250,10 +250,6 @@ static int arm_thread(void *data)
 		if (!av7110->arm_ready)
 			continue;
 
-#if IS_ENABLED(CONFIG_DVB_AV7110_IR)
-		av7110_check_ir_config(av7110, false);
-#endif
-
 		if (mutex_lock_interruptible(&av7110->dcomlock))
 			break;
 		newloops = rdebi(av7110, DEBINOSWAP, STATUS_LOOPS, 0, 2);
@@ -659,9 +655,11 @@ static void gpioirq(unsigned long cookie)
 		return;
 
 	case DATA_IRCOMMAND:
-		if (av7110->ir.ir_handler)
-			av7110->ir.ir_handler(av7110,
-				swahw32(irdebi(av7110, DEBINOSWAP, Reserved, 0, 4)));
+#if IS_ENABLED(CONFIG_DVB_AV7110_IR)
+		av7110_ir_handler(av7110,
+				  swahw32(irdebi(av7110, DEBINOSWAP, Reserved,
+						 0, 4)));
+#endif
 		iwdebi(av7110, DEBINOSWAP, RX_BUFF, 0, 2);
 		break;
 
diff --git a/drivers/media/pci/ttpci/av7110.h b/drivers/media/pci/ttpci/av7110.h
index 8606ef5ebbe2..809d938ae166 100644
--- a/drivers/media/pci/ttpci/av7110.h
+++ b/drivers/media/pci/ttpci/av7110.h
@@ -81,23 +81,11 @@ struct av7110;
 
 /* infrared remote control */
 struct infrared {
-	u16	key_map[256];
-	struct input_dev	*input_dev;
+	struct rc_dev		*rcdev;
 	char			input_phys[32];
-	struct timer_list	keyup_timer;
-	struct tasklet_struct	ir_tasklet;
-	void			(*ir_handler)(struct av7110 *av7110, u32 ircom);
-	u32			ir_command;
 	u32			ir_config;
-	u32			device_mask;
-	u8			protocol;
-	u8			inversion;
-	u16			last_key;
-	u16			last_toggle;
-	bool			keypressed;
 };
 
-
 /* place to store all the necessary device information */
 struct av7110 {
 
@@ -304,9 +292,10 @@ struct av7110 {
 extern int ChangePIDs(struct av7110 *av7110, u16 vpid, u16 apid, u16 ttpid,
 		       u16 subpid, u16 pcrpid);
 
-extern int av7110_check_ir_config(struct av7110 *av7110, int force);
-extern int av7110_ir_init(struct av7110 *av7110);
-extern void av7110_ir_exit(struct av7110 *av7110);
+void av7110_ir_handler(struct av7110 *av7110, u32 ircom);
+int av7110_set_ir_config(struct av7110 *av7110);
+int av7110_ir_init(struct av7110 *av7110);
+void av7110_ir_exit(struct av7110 *av7110);
 
 /* msp3400 i2c subaddresses */
 #define MSP_WR_DEM 0x10
diff --git a/drivers/media/pci/ttpci/av7110_ir.c b/drivers/media/pci/ttpci/av7110_ir.c
index dfa18878e5f0..f1094659dfb9 100644
--- a/drivers/media/pci/ttpci/av7110_ir.c
+++ b/drivers/media/pci/ttpci/av7110_ir.c
@@ -4,379 +4,156 @@
  *
  * Copyright (C) 1999-2003 Holger Waechtler <holger@convergence.de>
  * Copyright (C) 2003-2007 Oliver Endriss <o.endriss@gmx.de>
+ * Copyright (C) 2019 Sean Young <sean@mess.org>
  */
 
-
-#include <linux/types.h>
-#include <linux/init.h>
-#include <linux/module.h>
-#include <linux/proc_fs.h>
 #include <linux/kernel.h>
-#include <linux/bitops.h>
+#include <media/rc-core.h>
 
 #include "av7110.h"
 #include "av7110_hw.h"
 
-
-#define AV_CNT		4
-
 #define IR_RC5		0
 #define IR_RCMM		1
 #define IR_RC5_EXT	2 /* internal only */
 
-#define IR_ALL		0xffffffff
-
-#define UP_TIMEOUT	(HZ*7/25)
-
-
-/* Note: enable ir debugging by or'ing debug with 16 */
-
-static int ir_protocol[AV_CNT] = { IR_RCMM, IR_RCMM, IR_RCMM, IR_RCMM};
-module_param_array(ir_protocol, int, NULL, 0644);
-MODULE_PARM_DESC(ir_protocol, "Infrared protocol: 0 RC5, 1 RCMM (default)");
-
-static int ir_inversion[AV_CNT];
-module_param_array(ir_inversion, int, NULL, 0644);
-MODULE_PARM_DESC(ir_inversion, "Inversion of infrared signal: 0 not inverted (default), 1 inverted");
-
-static uint ir_device_mask[AV_CNT] = { IR_ALL, IR_ALL, IR_ALL, IR_ALL };
-module_param_array(ir_device_mask, uint, NULL, 0644);
-MODULE_PARM_DESC(ir_device_mask, "Bitmask of infrared devices: bit 0..31 = device 0..31 (default: all)");
-
-
-static int av_cnt;
-static struct av7110 *av_list[AV_CNT];
-
-static u16 default_key_map [256] = {
-	KEY_0, KEY_1, KEY_2, KEY_3, KEY_4, KEY_5, KEY_6, KEY_7,
-	KEY_8, KEY_9, KEY_BACK, 0, KEY_POWER, KEY_MUTE, 0, KEY_INFO,
-	KEY_VOLUMEUP, KEY_VOLUMEDOWN, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
-	KEY_CHANNELUP, KEY_CHANNELDOWN, 0, 0, 0, 0, 0, 0,
-	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
-	0, 0, 0, 0, KEY_TEXT, 0, 0, KEY_TV, 0, 0, 0, 0, 0, KEY_SETUP, 0, 0,
-	0, 0, 0, KEY_SUBTITLE, 0, 0, KEY_LANGUAGE, 0,
-	KEY_RADIO, 0, 0, 0, 0, KEY_EXIT, 0, 0,
-	KEY_UP, KEY_DOWN, KEY_LEFT, KEY_RIGHT, KEY_OK, 0, 0, 0,
-	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, KEY_RED, KEY_GREEN, KEY_YELLOW,
-	KEY_BLUE, 0, 0, 0, 0, 0, 0, 0, KEY_MENU, KEY_LIST, 0, 0, 0, 0, 0, 0,
-	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
-	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
-	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
-	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
-	0, 0, 0, 0, KEY_UP, KEY_UP, KEY_DOWN, KEY_DOWN,
-	0, 0, 0, 0, KEY_EPG, 0, 0, 0,
-	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
-	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
-	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, KEY_VCR
-};
-
-
-/* key-up timer */
-static void av7110_emit_keyup(struct timer_list *t)
-{
-	struct infrared *ir = from_timer(ir, t, keyup_timer);
-
-	if (!ir || !ir->keypressed)
-		return;
-
-	input_report_key(ir->input_dev, ir->last_key, 0);
-	input_sync(ir->input_dev);
-	ir->keypressed = false;
-}
-
-
-/* tasklet */
-static void av7110_emit_key(unsigned long parm)
+/* interrupt handler */
+void av7110_ir_handler(struct av7110 *av7110, u32 ircom)
 {
-	struct infrared *ir = (struct infrared *) parm;
-	u32 ircom = ir->ir_command;
-	u8 data;
-	u8 addr;
-	u16 toggle;
-	u16 keycode;
-
-	/* extract device address and data */
-	switch (ir->protocol) {
-	case IR_RC5: /* RC5: 5 bits device address, 6 bits data */
-		data = ircom & 0x3f;
-		addr = (ircom >> 6) & 0x1f;
-		toggle = ircom & 0x0800;
-		break;
+	struct rc_dev *rcdev = av7110->ir.rcdev;
+	enum rc_proto proto;
+	u32 command, addr, scancode;
+	u32 toggle;
 
-	case IR_RCMM: /* RCMM: ? bits device address, ? bits data */
-		data = ircom & 0xff;
-		addr = (ircom >> 8) & 0x1f;
-		toggle = ircom & 0x8000;
-		break;
-
-	case IR_RC5_EXT: /* extended RC5: 5 bits device address, 7 bits data */
-		data = ircom & 0x3f;
-		addr = (ircom >> 6) & 0x1f;
-		/* invert 7th data bit for backward compatibility with RC5 keymaps */
-		if (!(ircom & 0x1000))
-			data |= 0x40;
-		toggle = ircom & 0x0800;
-		break;
-
-	default:
-		printk("%s invalid protocol %x\n", __func__, ir->protocol);
-		return;
-	}
-
-	input_event(ir->input_dev, EV_MSC, MSC_RAW, (addr << 16) | data);
-	input_event(ir->input_dev, EV_MSC, MSC_SCAN, data);
-
-	keycode = ir->key_map[data];
-
-	dprintk(16, "%s: code %08x -> addr %i data 0x%02x -> keycode %i\n",
-		__func__, ircom, addr, data, keycode);
-
-	/* check device address */
-	if (!(ir->device_mask & (1 << addr)))
-		return;
-
-	if (!keycode) {
-		printk ("%s: code %08x -> addr %i data 0x%02x -> unknown key!\n",
-			__func__, ircom, addr, data);
-		return;
-	}
-
-	if (ir->keypressed &&
-	    (ir->last_key != keycode || toggle != ir->last_toggle))
-		input_event(ir->input_dev, EV_KEY, ir->last_key, 0);
-
-	input_event(ir->input_dev, EV_KEY, keycode, 1);
-	input_sync(ir->input_dev);
-
-	ir->keypressed = true;
-	ir->last_key = keycode;
-	ir->last_toggle = toggle;
-
-	mod_timer(&ir->keyup_timer, jiffies + UP_TIMEOUT);
-}
-
-
-/* register with input layer */
-static void input_register_keys(struct infrared *ir)
-{
-	int i;
+	dprintk(4, "ir command = %08x\n", ircom);
 
-	set_bit(EV_KEY, ir->input_dev->evbit);
-	set_bit(EV_REP, ir->input_dev->evbit);
-	set_bit(EV_MSC, ir->input_dev->evbit);
+	if (rcdev) {
+		switch (av7110->ir.ir_config) {
+		case IR_RC5: /* RC5: 5 bits device address, 6 bits command */
+			command = ircom & 0x3f;
+			addr = (ircom >> 6) & 0x1f;
+			scancode = RC_SCANCODE_RC5(addr, command);
+			toggle = ircom & 0x0800;
+			proto = RC_PROTO_RC5;
+			break;
 
-	set_bit(MSC_RAW, ir->input_dev->mscbit);
-	set_bit(MSC_SCAN, ir->input_dev->mscbit);
+		case IR_RCMM: /* RCMM: ? bits device address, ? bits command */
+			command = ircom & 0xff;
+			addr = (ircom >> 8) & 0x1f;
+			scancode = ircom;
+			toggle = ircom & 0x8000;
+			proto = RC_PROTO_OTHER;
+			break;
 
-	memset(ir->input_dev->keybit, 0, sizeof(ir->input_dev->keybit));
+		case IR_RC5_EXT:
+			/*
+			 * extended RC5: 5 bits device address, 7 bits command
+			 *
+			 * Extended RC5 uses only one start bit. The second
+			 * start bit is re-assigned bit 6 of the command bit.
+			 */
+			command = ircom & 0x3f;
+			addr = (ircom >> 6) & 0x1f;
+			if (!(ircom & 0x1000))
+				command |= 0x40;
+			scancode = RC_SCANCODE_RC5(addr, command);
+			toggle = ircom & 0x0800;
+			proto = RC_PROTO_RC5;
+			break;
+		default:
+			dprintk(2, "unknown ir config %d\n",
+				av7110->ir.ir_config);
+			return;
+		}
 
-	for (i = 0; i < ARRAY_SIZE(ir->key_map); i++) {
-		if (ir->key_map[i] > KEY_MAX)
-			ir->key_map[i] = 0;
-		else if (ir->key_map[i] > KEY_RESERVED)
-			set_bit(ir->key_map[i], ir->input_dev->keybit);
+		rc_keydown(rcdev, proto, scancode, toggle != 0);
 	}
-
-	ir->input_dev->keycode = ir->key_map;
-	ir->input_dev->keycodesize = sizeof(ir->key_map[0]);
-	ir->input_dev->keycodemax = ARRAY_SIZE(ir->key_map);
 }
 
-/* check for configuration changes */
-int av7110_check_ir_config(struct av7110 *av7110, int force)
+int av7110_set_ir_config(struct av7110 *av7110)
 {
-	int i;
-	int modified = force;
-	int ret = -ENODEV;
-
-	for (i = 0; i < av_cnt; i++)
-		if (av7110 == av_list[i])
-			break;
-
-	if (i < av_cnt && av7110) {
-		if ((av7110->ir.protocol & 1) != ir_protocol[i] ||
-		    av7110->ir.inversion != ir_inversion[i])
-			modified = true;
-
-		if (modified) {
-			/* protocol */
-			if (ir_protocol[i]) {
-				ir_protocol[i] = 1;
-				av7110->ir.protocol = IR_RCMM;
-				av7110->ir.ir_config = 0x0001;
-			} else if (FW_VERSION(av7110->arm_app) >= 0x2620) {
-				av7110->ir.protocol = IR_RC5_EXT;
-				av7110->ir.ir_config = 0x0002;
-			} else {
-				av7110->ir.protocol = IR_RC5;
-				av7110->ir.ir_config = 0x0000;
-			}
-			/* inversion */
-			if (ir_inversion[i]) {
-				ir_inversion[i] = 1;
-				av7110->ir.ir_config |= 0x8000;
-			}
-			av7110->ir.inversion = ir_inversion[i];
-			/* update ARM */
-			ret = av7110_fw_cmd(av7110, COMTYPE_PIDFILTER, SetIR, 1,
-						av7110->ir.ir_config);
-		} else
-			ret = 0;
+	dprintk(4, "ir config = %08x\n", av7110->ir.ir_config);
 
-		/* address */
-		if (av7110->ir.device_mask != ir_device_mask[i])
-			av7110->ir.device_mask = ir_device_mask[i];
-	}
-
-	return ret;
+	return av7110_fw_cmd(av7110, COMTYPE_PIDFILTER, SetIR, 1,
+			     av7110->ir.ir_config);
 }
 
-
-/* /proc/av7110_ir interface */
-static ssize_t av7110_ir_proc_write(struct file *file, const char __user *buffer,
-				    size_t count, loff_t *pos)
+static int change_protocol(struct rc_dev *rcdev, u64 *rc_type)
 {
-	char *page;
+	struct av7110 *av7110 = rcdev->priv;
 	u32 ir_config;
-	int size = sizeof ir_config + sizeof av_list[0]->ir.key_map;
-	int i;
 
-	if (count < size)
+	if (*rc_type & RC_PROTO_BIT_UNKNOWN) {
+		ir_config = IR_RCMM;
+		*rc_type = RC_PROTO_UNKNOWN;
+	} else if (*rc_type & RC_PROTO_BIT_RC5) {
+		if (FW_VERSION(av7110->arm_app) >= 0x2620)
+			ir_config = IR_RC5_EXT;
+		else
+			ir_config = IR_RC5;
+		*rc_type = RC_PROTO_BIT_RC5;
+	} else {
 		return -EINVAL;
-
-	page = vmalloc(size);
-	if (!page)
-		return -ENOMEM;
-
-	if (copy_from_user(page, buffer, size)) {
-		vfree(page);
-		return -EFAULT;
 	}
 
-	memcpy(&ir_config, page, sizeof ir_config);
-
-	for (i = 0; i < av_cnt; i++) {
-		/* keymap */
-		memcpy(av_list[i]->ir.key_map, page + sizeof ir_config,
-			sizeof(av_list[i]->ir.key_map));
-		/* protocol, inversion, address */
-		ir_protocol[i] = ir_config & 0x0001;
-		ir_inversion[i] = ir_config & 0x8000 ? 1 : 0;
-		if (ir_config & 0x4000)
-			ir_device_mask[i] = 1 << ((ir_config >> 16) & 0x1f);
-		else
-			ir_device_mask[i] = IR_ALL;
-		/* update configuration */
-		av7110_check_ir_config(av_list[i], false);
-		input_register_keys(&av_list[i]->ir);
-	}
-	vfree(page);
-	return count;
-}
+	if (ir_config == av7110->ir.ir_config)
+		return 0;
 
-static const struct file_operations av7110_ir_proc_fops = {
-	.owner		= THIS_MODULE,
-	.write		= av7110_ir_proc_write,
-	.llseek		= noop_llseek,
-};
+	av7110->ir.ir_config = ir_config;
 
-/* interrupt handler */
-static void ir_handler(struct av7110 *av7110, u32 ircom)
-{
-	dprintk(4, "ir command = %08x\n", ircom);
-	av7110->ir.ir_command = ircom;
-	tasklet_schedule(&av7110->ir.ir_tasklet);
+	return av7110_set_ir_config(av7110);
 }
 
-
 int av7110_ir_init(struct av7110 *av7110)
 {
-	struct input_dev *input_dev;
-	static struct proc_dir_entry *e;
-	int err;
-
-	if (av_cnt >= ARRAY_SIZE(av_list))
-		return -ENOSPC;
+	struct rc_dev *rcdev;
+	struct pci_dev *pci;
+	int ret;
 
-	av_list[av_cnt++] = av7110;
-	av7110_check_ir_config(av7110, true);
-
-	timer_setup(&av7110->ir.keyup_timer, av7110_emit_keyup, 0);
-
-	input_dev = input_allocate_device();
-	if (!input_dev)
+	rcdev = rc_allocate_device(RC_DRIVER_SCANCODE);
+	if (!rcdev)
 		return -ENOMEM;
 
-	av7110->ir.input_dev = input_dev;
-	snprintf(av7110->ir.input_phys, sizeof(av7110->ir.input_phys),
-		"pci-%s/ir0", pci_name(av7110->dev->pci));
+	pci = av7110->dev->pci;
 
-	input_dev->name = "DVB on-card IR receiver";
-
-	input_dev->phys = av7110->ir.input_phys;
-	input_dev->id.bustype = BUS_PCI;
-	input_dev->id.version = 2;
-	if (av7110->dev->pci->subsystem_vendor) {
-		input_dev->id.vendor = av7110->dev->pci->subsystem_vendor;
-		input_dev->id.product = av7110->dev->pci->subsystem_device;
+	snprintf(av7110->ir.input_phys, sizeof(av7110->ir.input_phys),
+		 "pci-%s/ir0", pci_name(pci));
+
+	rcdev->device_name = av7110->card_name;
+	rcdev->driver_name = KBUILD_MODNAME;
+	rcdev->input_phys = av7110->ir.input_phys;
+	rcdev->input_id.bustype = BUS_PCI;
+	rcdev->input_id.version = 2;
+	if (pci->subsystem_vendor) {
+		rcdev->input_id.vendor  = pci->subsystem_vendor;
+		rcdev->input_id.product = pci->subsystem_device;
 	} else {
-		input_dev->id.vendor = av7110->dev->pci->vendor;
-		input_dev->id.product = av7110->dev->pci->device;
-	}
-	input_dev->dev.parent = &av7110->dev->pci->dev;
-	/* initial keymap */
-	memcpy(av7110->ir.key_map, default_key_map, sizeof av7110->ir.key_map);
-	input_register_keys(&av7110->ir);
-	err = input_register_device(input_dev);
-	if (err) {
-		input_free_device(input_dev);
-		return err;
+		rcdev->input_id.vendor  = pci->vendor;
+		rcdev->input_id.product = pci->device;
 	}
 
-	/*
-	 * Input core's default autorepeat is 33 cps with 250 msec
-	 * delay, let's adjust to numbers more suitable for remote
-	 * control.
-	 */
-	input_enable_softrepeat(input_dev, 250, 125);
+	rcdev->dev.parent = &pci->dev;
+	rcdev->allowed_protocols = RC_PROTO_BIT_RC5 | RC_PROTO_BIT_UNKNOWN;
+	rcdev->change_protocol = change_protocol;
+	rcdev->map_name = RC_MAP_HAUPPAUGE;
+	rcdev->priv = av7110;
 
-	if (av_cnt == 1) {
-		e = proc_create("av7110_ir", S_IWUSR, NULL, &av7110_ir_proc_fops);
-		if (e)
-			proc_set_size(e, 4 + 256 * sizeof(u16));
-	}
+	av7110->ir.rcdev = rcdev;
+	av7110->ir.ir_config = IR_RC5;
+	av7110_set_ir_config(av7110);
 
-	tasklet_init(&av7110->ir.ir_tasklet, av7110_emit_key, (unsigned long) &av7110->ir);
-	av7110->ir.ir_handler = ir_handler;
+	ret = rc_register_device(rcdev);
+	if (ret) {
+		av7110->ir.rcdev = NULL;
+		rc_free_device(rcdev);
+	}
 
-	return 0;
+	return ret;
 }
 
-
 void av7110_ir_exit(struct av7110 *av7110)
 {
-	int i;
-
-	if (av_cnt == 0)
-		return;
-
-	del_timer_sync(&av7110->ir.keyup_timer);
-	av7110->ir.ir_handler = NULL;
-	tasklet_kill(&av7110->ir.ir_tasklet);
-
-	for (i = 0; i < av_cnt; i++)
-		if (av_list[i] == av7110) {
-			av_list[i] = av_list[av_cnt-1];
-			av_list[av_cnt-1] = NULL;
-			break;
-		}
-
-	if (av_cnt == 1)
-		remove_proc_entry("av7110_ir", NULL);
-
-	input_unregister_device(av7110->ir.input_dev);
-
-	av_cnt--;
+	rc_unregister_device(av7110->ir.rcdev);
 }
 
 //MODULE_AUTHOR("Holger Waechtler <holger@convergence.de>, Oliver Endriss <o.endriss@gmx.de>");
diff --git a/drivers/media/rc/keymaps/rc-hauppauge.c b/drivers/media/rc/keymaps/rc-hauppauge.c
index 582aa9012443..c117e9fc2697 100644
--- a/drivers/media/rc/keymaps/rc-hauppauge.c
+++ b/drivers/media/rc/keymaps/rc-hauppauge.c
@@ -233,6 +233,7 @@ static struct rc_map_table rc5_hauppauge_new[] = {
 	 * This one also uses RC-5 protocol
 	 * Keycodes start with address = 0x00
 	 */
+	{ 0x000f, KEY_TV },
 	{ 0x001f, KEY_TV },
 	{ 0x0020, KEY_CHANNELUP },
 	{ 0x000c, KEY_RADIO },
-- 
2.21.0

