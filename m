Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E0ED16A7B9A
	for <lists+linux-media@lfdr.de>; Thu,  2 Mar 2023 08:05:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229913AbjCBHFt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 2 Mar 2023 02:05:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229915AbjCBHFp (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 2 Mar 2023 02:05:45 -0500
Received: from mail-sh.amlogic.com (mail-sh.amlogic.com [58.32.228.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A38F41B74;
        Wed,  1 Mar 2023 23:04:55 -0800 (PST)
Received: from droid10-sz.amlogic.com (10.28.11.69) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server id 15.1.2507.13; Thu, 2 Mar 2023
 14:34:46 +0800
From:   zelong dong <zelong.dong@amlogic.com>
To:     Neil Armstrong <neil.armstrong@linaro.org>,
        Sean Young <sean@mess.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>
CC:     <linux-media@vger.kernel.org>, <linux-amlogic@lists.infradead.org>,
        <devicetree@vger.kernel.org>, Zelong Dong <zelong.dong@amlogic.com>
Subject: [PATCH 1/3] media: rc: meson-ir: support rc driver type RC_DRIVER_SCANCODE
Date:   Thu, 2 Mar 2023 14:34:00 +0800
Message-ID: <20230302063402.42708-2-zelong.dong@amlogic.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20230302063402.42708-1-zelong.dong@amlogic.com>
References: <20230302063402.42708-1-zelong.dong@amlogic.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.28.11.69]
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Zelong Dong <zelong.dong@amlogic.com>

Meson IR Controller supports hardware decoder in Meson-8B and later
SoC. So far, protocol NEC/RC-6/XMP could be decoded in hardware.
DTS property 'amlogic,ir-support-hw-decode' can enable this feature.

Signed-off-by: Zelong Dong <zelong.dong@amlogic.com>
---
 drivers/media/rc/meson-ir.c | 713 ++++++++++++++++++++++++++++++++----
 1 file changed, 632 insertions(+), 81 deletions(-)

diff --git a/drivers/media/rc/meson-ir.c b/drivers/media/rc/meson-ir.c
index 4b769111f78e..1bfdce1c1864 100644
--- a/drivers/media/rc/meson-ir.c
+++ b/drivers/media/rc/meson-ir.c
@@ -14,6 +14,7 @@
 #include <linux/platform_device.h>
 #include <linux/spinlock.h>
 #include <linux/bitfield.h>
+#include <linux/regmap.h>
 
 #include <media/rc-core.h>
 
@@ -21,87 +22,598 @@
 
 /* valid on all Meson platforms */
 #define IR_DEC_LDR_ACTIVE	0x00
+	#define	IR_DEC_LDR_ACTIVE_MAX		GENMASK(28, 16)
+	#define	IR_DEC_LDR_ACTIVE_MIN		GENMASK(12, 0)
+
 #define IR_DEC_LDR_IDLE		0x04
+	#define	IR_DEC_LDR_IDLE_MAX		GENMASK(28, 16)
+	#define	IR_DEC_LDR_IDLE_MIN		GENMASK(12, 0)
+
 #define IR_DEC_LDR_REPEAT	0x08
+	#define	IR_DEC_LDR_REPEAT_MAX		GENMASK(25, 16)
+	#define	IR_DEC_LDR_REPEAT_MIN		GENMASK(9, 0)
+
 #define IR_DEC_BIT_0		0x0c
+	#define	IR_DEC_BIT_0_MAX		GENMASK(25, 16)
+	#define	IR_DEC_BIT_0_MIN		GENMASK(9, 0)
+
 #define IR_DEC_REG0		0x10
+	#define	IR_DEC_REG0_FILTER		GENMASK(30, 28)
+	#define	IR_DEC_REG0_FRAME_TIME_MAX	GENMASK(24, 12)
+	#define	IR_DEC_REG0_BASE_TIME		GENMASK(11, 0)
+
 #define IR_DEC_FRAME		0x14
+
 #define IR_DEC_STATUS		0x18
+	#define	IR_DEC_STATUS_BIT_1_ENABLE	BIT(30)
+	#define	IR_DEC_STATUS_BIT_1_MAX		GENMASK(29, 20)
+	#define	IR_DEC_STATUS_BIT_1_MIN		GENMASK(19, 10)
+	#define IR_DEC_STATUS_PULSE		BIT(8)
+	#define	IR_DEC_STATUS_BUSY		BIT(7)
+	#define	IR_DEC_STATUS_FRAME_STATUS	GENMASK(3, 0)
+
 #define IR_DEC_REG1		0x1c
-/* only available on Meson 8b and newer */
+	#define IR_DEC_REG1_TIME_IV		GENMASK(28, 16)
+	#define	IR_DEC_REG1_FRAME_LEN		GENMASK(13, 8)
+	#define IR_DEC_REG1_ENABLE		BIT(15)
+	#define	IR_DEC_REG1_HOLD_CODE		BIT(6)
+	#define IR_DEC_REG1_IRQSEL		GENMASK(3, 2)
+	#define IR_DEC_REG1_RESET		BIT(0)
+	/* Meson 6b uses REG1 to configure the mode */
+	#define IR_DEC_REG1_MODE		GENMASK(8, 7)
+
+/* The following registers are only available on Meson 8b and newer */
 #define IR_DEC_REG2		0x20
+	#define	IR_DEC_REG2_TICK_MODE		BIT(15)
+	#define	IR_DEC_REG2_REPEAT_COUNTER	BIT(13)
+	#define	IR_DEC_REG2_REPEAT_TIME		BIT(12)
+	#define	IR_DEC_REG2_COMPARE_FRAME	BIT(11)
+	#define	IR_DEC_REG2_BIT_ORDER		BIT(8)
+	/* Meson 8b / GXBB use REG2 to configure the mode */
+	#define IR_DEC_REG2_MODE		GENMASK(3, 0)
+
+#define	IR_DEC_DURATN2		0x24
+	#define	IR_DEC_DURATN2_MAX		GENMASK(25, 16)
+	#define	IR_DEC_DURATN2_MIN		GENMASK(9, 0)
+
+#define	IR_DEC_DURATN3		0x28
+	#define	IR_DEC_DURATN3_MAX		GENMASK(25, 16)
+	#define	IR_DEC_DURATN3_MIN		GENMASK(9, 0)
+
+#define	IR_DEC_FRAME1		0x2c
+
+#define FRAME_MSB_FIRST				true
+#define FRAME_LSB_FIRST				false
+
+#define DECODE_MODE_NEC				0x0
+#define DECODE_MODE_RAW				0x2
+#define DECODE_MODE_RC6				0x9
+#define DECODE_MODE_XMP				0xE
+
+#define DECODER_STATUS_VALID			BIT(3)
+#define DECODER_STATUS_DATA_CODE_ERR		BIT(2)
+#define DECODER_STATUS_CUSTOM_CODE_ERR		BIT(1)
+#define DECODER_STATUS_REPEAT			BIT(0)
+
+#define IRQSEL_NEC_MODE				0
+#define IRQSEL_RISE_FALL			1
+#define IRQSEL_FALL				2
+#define IRQSEL_RISE				3
+
+#define MESON_RAW_TRATE				10	/* us */
+#define MESON_HW_TRATE				20	/* us */
+
+#define MESON_IR_TIMINGS(proto, r_cnt, r_chk, r_comp, b1_e, hc, cnt_tick, ori, \
+			 flt, len, f_max, la_max, la_min, li_max, li_min,      \
+			 rl_max, rl_min, b0_max, b0_min, b1_max, b1_min,       \
+			 d2_max, d2_min, d3_max, d3_min)		\
+	{								\
+		.hw_protocol =			proto,			\
+		.repeat_counter_enable =	r_cnt,			\
+		.repeat_check_enable =		r_chk,			\
+		.repeat_compare_enable =	r_comp,			\
+		.bit1_match_enable =		b1_e,			\
+		.hold_code_enable =		hc,			\
+		.count_tick_mode =		cnt_tick,		\
+		.bit_order =			ori,			\
+		.filter_cnt =			flt,			\
+		.code_length =			len,			\
+		.frame_time_max =		f_max,			\
+		.leader_active_max =		la_max,			\
+		.leader_active_min =		la_min,			\
+		.leader_idle_max =		li_max,			\
+		.leader_idle_min =		li_min,			\
+		.repeat_leader_max =		rl_max,			\
+		.repeat_leader_min =		rl_min,			\
+		.bit0_max =			b0_max,			\
+		.bit0_min =			b0_min,			\
+		.bit1_max =			b1_max,			\
+		.bit1_min =			b1_min,			\
+		.duration2_max =		d2_max,			\
+		.duration2_min =		d2_min,			\
+		.duration3_max =		d3_max,			\
+		.duration3_min =		d3_min,			\
+	}								\
+
+/**
+ * struct meson_ir_param - describe IR Protocol parameter
+ * @hw_protocol: select IR Protocol from IR Controller.
+ * @repeat_counter_enable: enable frame-to-frame time counter, it should work
+ *	with @repeat_compare_enable to detect the repeat frame.
+ * @repeat_check_enable: enable repeat time check for repeat detection.
+ * @repeat_compare_enable: enable to compare frame for repeat frame detection.
+ *	Some IR Protocol send the same data as repeat frame. In this case,
+ *	it should work with @repeat_counter_enable to detect the repeat frame.
+ * @bit_order: bit order, LSB or MSB.
+ * @bit1_match_enable: enable to check bit 1.
+ * @hold_code_enable: hold frame code in register IR_DEC_FRAME1, the new one
+ *	frame code will not be store in IR_DEC_FRAME1. until IR_DEC_FRAME1
+ *	has been read.
+ * @count_tick_mode: increasing time unit of frame-to-frame time counter.
+ *	0 = 100us, 1 = 10us.
+ * @filter_cnt: input filter, to filter burr
+ * @code_length: length (N-1) of frame's data part.
+ * @frame_time_max: max time for whole frame. Unit: MESON_HW_TRATE
+ * @leader_active_max: max time for NEC/RC6 leader active part. Unit: MESON_HW_TRATE.
+ * @leader_active_min: min time for NEC/RC6 leader active part. Unit: MESON_HW_TRATE.
+ * @leader_idle_max: max time for NEC/RC6 leader idle part. Unit: MESON_HW_TRATE.
+ * @leader_idle_min: min time for NEC/RC6 leader idle part. Unit: MESON_HW_TRATE.
+ * @repeat_leader_max: max time for NEC repeat leader idle part. Unit: MESON_HW_TRATE.
+ * @repeat_leader_min: min time for NEC repeat leader idle part. Unit: MESON_HW_TRATE.
+ * @bit0_max: max time for NEC Logic '0', half of RC6 trailer bit, XMP Logic '00'
+ * @bit0_min: min time for NEC Logic '0', half of RC6 trailer bit, XMP Logic '00'
+ * @bit1_max: max time for NEC Logic '1', whole of RC6 trailer bit, XMP Logic '01'
+ * @bit1_min: min time for NEC Logic '1', whole of RC6 trailer bit, XMP Logic '01'
+ * @duration2_max: max time for half of RC6 normal bit, XMP Logic '10'.
+ * @duration2_min: min time for half of RC6 normal bit, XMP Logic '10'.
+ * @duration3_max: max time for whole of RC6 normal bit, XMP Logic '11'.
+ * @duration3_min: min time for whole of RC6 normal bit, XMP Logic '11'.
+ */
 
-#define REG0_RATE_MASK		GENMASK(11, 0)
+struct meson_ir_param {
+	u8		hw_protocol;
+	bool		repeat_counter_enable;
+	bool		repeat_check_enable;
+	bool		repeat_compare_enable;
+	bool		bit_order;
+	bool		bit1_match_enable;
+	bool		hold_code_enable;
+	bool		count_tick_mode;
+	u8		filter_cnt;
+	u8		code_length;
+	u16		frame_time_max;
+	u16		leader_active_max;
+	u16		leader_active_min;
+	u16		leader_idle_max;
+	u16		leader_idle_min;
+	u16		repeat_leader_max;
+	u16		repeat_leader_min;
+	u16		bit0_max;
+	u16		bit0_min;
+	u16		bit1_max;
+	u16		bit1_min;
+	u16		duration2_max;
+	u16		duration2_min;
+	u16		duration3_max;
+	u16		duration3_min;
+};
 
-#define DECODE_MODE_NEC		0x0
-#define DECODE_MODE_RAW		0x2
+struct meson_ir {
+	struct regmap	*reg;
+	struct rc_dev	*rc;
+	spinlock_t	lock;
+	bool		support_hw_dec;
+};
 
-/* Meson 6b uses REG1 to configure the mode */
-#define REG1_MODE_MASK		GENMASK(8, 7)
-#define REG1_MODE_SHIFT		7
+static struct regmap_config meson_ir_regmap_config = {
+	.reg_bits = 32,
+	.val_bits = 32,
+	.reg_stride = 4,
+};
 
-/* Meson 8b / GXBB use REG2 to configure the mode */
-#define REG2_MODE_MASK		GENMASK(3, 0)
-#define REG2_MODE_SHIFT		0
+static const struct meson_ir_param protocol_timings[] = {
+	/* protocol, repeat counter, repeat check, repeat compare, bit 1 match */
+	MESON_IR_TIMINGS(DECODE_MODE_NEC, false, false, false, true,
+	/* hold code, count tick, order, filter cnt, len, frame time */
+			 false, false, FRAME_LSB_FIRST, 7, 32, 4000,
+	/* leader active max/min, leader idle max/min, repeat leader max/min */
+			 500, 400, 300, 200, 150, 80,
+	/* bit0 max/min, bit1 max/min, duration2 max/min, duration3 max/min */
+			 72, 40, 134, 90, 0, 0, 0, 0),
+	MESON_IR_TIMINGS(DECODE_MODE_XMP, true, false, true, false,
+			 false, true, FRAME_MSB_FIRST, 7, 32, 1500,
+			 0, 0, 0, 0, 0, 0,
+			 52, 45, 86, 80, 121, 114, 7, 7),
+	MESON_IR_TIMINGS(DECODE_MODE_RC6, true, false, true, false,
+			 true, false, FRAME_MSB_FIRST, 7, 37, 4000,
+			 210, 125, 50, 38, 145, 125,
+			 51, 38, 94, 82, 28, 16, 51, 38)
+};
 
-#define REG1_TIME_IV_MASK	GENMASK(28, 16)
+static void meson_ir_rc6_handler(struct meson_ir *ir)
+{
+	u32 code0, code1;
 
-#define REG1_IRQSEL_MASK	GENMASK(3, 2)
-#define REG1_IRQSEL_NEC_MODE	0
-#define REG1_IRQSEL_RISE_FALL	1
-#define REG1_IRQSEL_FALL	2
-#define REG1_IRQSEL_RISE	3
+	regmap_read(ir->reg, IR_DEC_FRAME, &code0);
+	regmap_read(ir->reg, IR_DEC_FRAME1, &code1);
 
-#define REG1_RESET		BIT(0)
-#define REG1_ENABLE		BIT(15)
+	rc_keydown(ir->rc, RC_PROTO_RC6_6A_32, code0, code1 & 0x1);
+}
 
-#define STATUS_IR_DEC_IN	BIT(8)
+static void meson_ir_xmp_handler(struct meson_ir *ir)
+{
+	static u32 last_xmp_code;
+	int i;
+	u32 code = 0;
+	u32 scancode, checksum = 0;
+	u8 addr, subaddr, subaddr2, toggle, oem, obc1, obc2;
+
+	regmap_read(ir->reg, IR_DEC_FRAME, &code);
+
+	for (i = 0; i < 32; i += 4)
+		checksum += ((code >> i) & 0xf);
+	checksum = ~(checksum + 0xf - ((code >> 24) & 0xf)) & 0xf;
+
+	if (checksum != ((code >> 24) & 0xf)) {
+		last_xmp_code = 0;
+		dev_err(&ir->rc->dev, "xmp checksum error, framecode= 0x%x\n",
+			code);
+		return;
+	}
 
-#define MESON_TRATE		10	/* us */
+	subaddr  = (last_xmp_code >> 24 & 0xf0) | (last_xmp_code >> 20 & 0x0f);
+	subaddr2 = (code >> 24 & 0xf0) | (code >> 16 & 0x0f);
+	oem      = last_xmp_code >> 8;
+	addr     = last_xmp_code;
+	toggle   = code >> 20 & 0xf;
+	obc1 = code >> 8;
+	obc2 = code;
+
+	if (subaddr != subaddr2) {
+		last_xmp_code = code;
+		dev_dbg(&ir->rc->dev, "subaddress nibbles mismatch 0x%02X != 0x%02X\n",
+			subaddr, subaddr2);
+		return;
+	}
+	if (oem != 0x44)
+		dev_dbg(&ir->rc->dev, "Warning: OEM nibbles 0x%02X. Expected 0x44\n",
+			oem);
 
-struct meson_ir {
-	void __iomem	*reg;
-	struct rc_dev	*rc;
-	spinlock_t	lock;
-};
+	scancode = addr << 24 | subaddr << 16 | obc1 << 8 | obc2;
+	dev_dbg(&ir->rc->dev, "XMP scancode 0x%06x\n", scancode);
+
+	if (toggle == 0)
+		rc_keydown(ir->rc, RC_PROTO_XMP, scancode, 0);
+	else
+		rc_repeat(ir->rc);
+
+	last_xmp_code = code;
+}
 
-static void meson_ir_set_mask(struct meson_ir *ir, unsigned int reg,
-			      u32 mask, u32 value)
+static void meson_ir_nec_handler(struct meson_ir *ir)
 {
-	u32 data;
+	u32 code = 0;
+	u32 status = 0;
+	enum rc_proto proto;
+
+	regmap_read(ir->reg, IR_DEC_STATUS, &status);
+
+	if (status & DECODER_STATUS_REPEAT) {
+		rc_repeat(ir->rc);
+	} else {
+		regmap_read(ir->reg, IR_DEC_FRAME, &code);
 
-	data = readl(ir->reg + reg);
-	data &= ~mask;
-	data |= (value & mask);
-	writel(data, ir->reg + reg);
+		code = ir_nec_bytes_to_scancode(code, code >> 8,
+						code >> 16, code >> 24, &proto);
+		rc_keydown(ir->rc, proto, code, 0);
+	}
 }
 
 static irqreturn_t meson_ir_irq(int irqno, void *dev_id)
+{
+	struct meson_ir *ir = dev_id;
+	u32 status = 0;
+
+	if (ir->support_hw_dec) {
+		regmap_read(ir->reg, IR_DEC_STATUS, &status);
+
+		if (!(status & DECODER_STATUS_VALID))
+			return IRQ_NONE;
+	}
+
+	return IRQ_WAKE_THREAD;
+}
+
+static irqreturn_t meson_ir_irq_thread(int irq, void *dev_id)
 {
 	struct meson_ir *ir = dev_id;
 	u32 duration, status;
 	struct ir_raw_event rawir = {};
 
-	spin_lock(&ir->lock);
+	if (ir->support_hw_dec) {
+		if (ir->rc->enabled_protocols & RC_PROTO_BIT_NEC)
+			meson_ir_nec_handler(ir);
+		else if (ir->rc->enabled_protocols & RC_PROTO_BIT_XMP)
+			meson_ir_xmp_handler(ir);
+		else if (ir->rc->enabled_protocols & RC_PROTO_BIT_RC6_6A_32)
+			meson_ir_rc6_handler(ir);
+	} else {
+		spin_lock(&ir->lock);
 
-	duration = readl_relaxed(ir->reg + IR_DEC_REG1);
-	duration = FIELD_GET(REG1_TIME_IV_MASK, duration);
-	rawir.duration = duration * MESON_TRATE;
+		regmap_read(ir->reg, IR_DEC_REG1, &duration);
+		duration = FIELD_GET(IR_DEC_REG1_TIME_IV, duration);
+		rawir.duration = duration * MESON_RAW_TRATE;
 
-	status = readl_relaxed(ir->reg + IR_DEC_STATUS);
-	rawir.pulse = !!(status & STATUS_IR_DEC_IN);
+		regmap_read(ir->reg, IR_DEC_STATUS, &status);
+		rawir.pulse = !!(status & IR_DEC_STATUS_PULSE);
 
-	ir_raw_event_store_with_timeout(ir->rc, &rawir);
+		ir_raw_event_store_with_timeout(ir->rc, &rawir);
 
-	spin_unlock(&ir->lock);
+		spin_unlock(&ir->lock);
+	}
 
 	return IRQ_HANDLED;
 }
 
+static int meson_ir_change_hw_protocol(struct rc_dev *dev, u8 protocol)
+{
+	struct meson_ir *ir = dev->priv;
+	int i;
+	unsigned long flags;
+	u32 regval;
+	const struct meson_ir_param *timings;
+
+	for (i = 0; i < ARRAY_SIZE(protocol_timings); i++)
+		if (protocol_timings[i].hw_protocol == protocol)
+			break;
+
+	if (i == ARRAY_SIZE(protocol_timings)) {
+		dev_err(&dev->dev, "hw protocol isn't supported: %d\n",
+			protocol);
+		return -EINVAL;
+	}
+	timings = &protocol_timings[i];
+
+	spin_lock_irqsave(&ir->lock, flags);
+
+	/* HW protocol */
+	regval = FIELD_PREP(IR_DEC_REG2_MODE, timings->hw_protocol);
+	regmap_update_bits(ir->reg, IR_DEC_REG2, IR_DEC_REG2_MODE, regval);
+
+	/* Monitor timing for input filter */
+	regval = FIELD_PREP(IR_DEC_REG0_FILTER, timings->filter_cnt);
+	regmap_update_bits(ir->reg, IR_DEC_REG0, IR_DEC_REG0_FILTER, regval);
+
+	/* Hold frame data until register was read */
+	regmap_update_bits(ir->reg, IR_DEC_REG1, IR_DEC_REG1_HOLD_CODE,
+			   timings->hold_code_enable ?
+			   IR_DEC_REG1_HOLD_CODE : 0);
+
+	/* Bit order */
+	regmap_update_bits(ir->reg, IR_DEC_REG2, IR_DEC_REG2_BIT_ORDER,
+			   timings->bit_order ? IR_DEC_REG2_BIT_ORDER : 0);
+
+	/* Select tick mode */
+	regmap_update_bits(ir->reg, IR_DEC_REG2, IR_DEC_REG2_TICK_MODE,
+			   timings->count_tick_mode ?
+			   IR_DEC_REG2_TICK_MODE : 0);
+
+	/* Some IR formats transer the same data frame as repeat frame
+	 * when the key is pressing..
+	 * In this case, it could be detected as repeat frame
+	 * if the repeat check was enabled
+	 */
+	regmap_update_bits(ir->reg, IR_DEC_REG2, IR_DEC_REG2_REPEAT_COUNTER,
+			   timings->repeat_counter_enable ?
+			   IR_DEC_REG2_REPEAT_COUNTER : 0);
+	regmap_update_bits(ir->reg, IR_DEC_REG2, IR_DEC_REG2_REPEAT_TIME,
+			   timings->repeat_check_enable ?
+			   IR_DEC_REG2_REPEAT_TIME : 0);
+	regmap_update_bits(ir->reg, IR_DEC_REG2, IR_DEC_REG2_COMPARE_FRAME,
+			   timings->repeat_compare_enable ?
+			   IR_DEC_REG2_COMPARE_FRAME : 0);
+
+	/* FRAME_TIME_MAX should be large than the time between
+	 * data frame and repeat code
+	 */
+	regval = FIELD_PREP(IR_DEC_REG0_FRAME_TIME_MAX,
+			    timings->frame_time_max);
+	regmap_update_bits(ir->reg, IR_DEC_REG0, IR_DEC_REG0_FRAME_TIME_MAX,
+			   regval);
+
+	/* Length(N-1) of frame data */
+	regval = FIELD_PREP(IR_DEC_REG1_FRAME_LEN, timings->code_length - 1);
+	regmap_update_bits(ir->reg, IR_DEC_REG1, IR_DEC_REG1_FRAME_LEN, regval);
+
+	/* Time for leader active part */
+	regval = FIELD_PREP(IR_DEC_LDR_ACTIVE_MAX,
+			    timings->leader_active_max) |
+		 FIELD_PREP(IR_DEC_LDR_ACTIVE_MIN,
+			    timings->leader_active_min);
+	regmap_update_bits(ir->reg, IR_DEC_LDR_ACTIVE, IR_DEC_LDR_ACTIVE_MAX |
+			   IR_DEC_LDR_ACTIVE_MIN, regval);
+
+	/* Time for leader idle part */
+	regval = FIELD_PREP(IR_DEC_LDR_IDLE_MAX, timings->leader_idle_max) |
+		 FIELD_PREP(IR_DEC_LDR_IDLE_MIN, timings->leader_idle_min);
+	regmap_update_bits(ir->reg, IR_DEC_LDR_IDLE,
+			   IR_DEC_LDR_IDLE_MAX | IR_DEC_LDR_IDLE_MIN, regval);
+
+	/* Time for repeat leader idle part */
+	regval = FIELD_PREP(IR_DEC_LDR_REPEAT_MAX, timings->repeat_leader_max) |
+		 FIELD_PREP(IR_DEC_LDR_REPEAT_MIN, timings->repeat_leader_min);
+	regmap_update_bits(ir->reg, IR_DEC_LDR_REPEAT, IR_DEC_LDR_REPEAT_MAX |
+			   IR_DEC_LDR_REPEAT_MIN, regval);
+
+	/* NEC: Time for logic '0'
+	 * RC6: Time for half of trailer bit
+	 */
+	regval = FIELD_PREP(IR_DEC_BIT_0_MAX, timings->bit0_max) |
+		 FIELD_PREP(IR_DEC_BIT_0_MIN, timings->bit0_min);
+	regmap_update_bits(ir->reg, IR_DEC_BIT_0,
+			   IR_DEC_BIT_0_MAX | IR_DEC_BIT_0_MIN, regval);
+
+	/* NEC: Time for logic '1'
+	 * RC6: Time for whole of trailer bit
+	 */
+	regval = FIELD_PREP(IR_DEC_STATUS_BIT_1_MAX, timings->bit1_max) |
+		 FIELD_PREP(IR_DEC_STATUS_BIT_1_MIN, timings->bit1_min);
+	regmap_update_bits(ir->reg, IR_DEC_STATUS, IR_DEC_STATUS_BIT_1_MAX |
+			   IR_DEC_STATUS_BIT_1_MIN, regval);
+
+	/* Enable to match logic '1' */
+	regmap_update_bits(ir->reg, IR_DEC_STATUS, IR_DEC_STATUS_BIT_1_ENABLE,
+			   timings->bit1_match_enable ?
+			   IR_DEC_STATUS_BIT_1_ENABLE : 0);
+
+	/* NEC: Unused
+	 * RC5/RC6: Time for halt of logic 0/1
+	 */
+	regval = FIELD_PREP(IR_DEC_DURATN2_MAX, timings->duration2_max) |
+		 FIELD_PREP(IR_DEC_DURATN2_MIN, timings->duration2_min);
+	regmap_update_bits(ir->reg, IR_DEC_DURATN2,
+			   IR_DEC_DURATN2_MAX | IR_DEC_DURATN2_MIN, regval);
+
+	/* NEC: Unused
+	 * RC5/RC6: Time for whole logic 0/1
+	 */
+	regval = FIELD_PREP(IR_DEC_DURATN3_MAX, timings->duration3_max) |
+		 FIELD_PREP(IR_DEC_DURATN3_MIN, timings->duration3_min);
+	regmap_update_bits(ir->reg, IR_DEC_DURATN3,
+			   IR_DEC_DURATN3_MAX | IR_DEC_DURATN3_MIN, regval);
+
+	spin_unlock_irqrestore(&ir->lock, flags);
+
+	return 0;
+}
+
+static void meson_ir_hw_decoder_init(struct rc_dev *dev)
+{
+	u32 regval;
+	unsigned long flags;
+	struct meson_ir *ir = dev->priv;
+
+	spin_lock_irqsave(&ir->lock, flags);
+
+	/* Clear controller status */
+	regmap_read(ir->reg, IR_DEC_STATUS, &regval);
+	regmap_read(ir->reg, IR_DEC_FRAME, &regval);
+
+	/* Reset ir decoder and disable decoder */
+	regmap_update_bits(ir->reg, IR_DEC_REG1, IR_DEC_REG1_ENABLE, 0);
+	regmap_update_bits(ir->reg, IR_DEC_REG1, IR_DEC_REG1_RESET,
+			   IR_DEC_REG1_RESET);
+
+	/* Base time resolution, (19+1)*1us=20us */
+	regval = FIELD_PREP(IR_DEC_REG0_BASE_TIME, MESON_HW_TRATE - 1);
+	regmap_update_bits(ir->reg, IR_DEC_REG0, IR_DEC_REG0_BASE_TIME, regval);
+
+	spin_unlock_irqrestore(&ir->lock, flags);
+}
+
+static int meson_ir_change_protocol(struct rc_dev *dev, u64 *rc_type)
+{
+	unsigned long flags;
+	struct meson_ir *ir = dev->priv;
+
+	meson_ir_hw_decoder_init(dev);
+
+	if (*rc_type & RC_PROTO_BIT_NEC)
+		meson_ir_change_hw_protocol(dev, DECODE_MODE_NEC);
+	else if (*rc_type & RC_PROTO_BIT_XMP)
+		meson_ir_change_hw_protocol(dev, DECODE_MODE_XMP);
+	else if (*rc_type & RC_PROTO_BIT_RC6_6A_32)
+		meson_ir_change_hw_protocol(dev, DECODE_MODE_RC6);
+
+	spin_lock_irqsave(&ir->lock, flags);
+
+	/* Reset ir decoder and enable decode */
+	regmap_update_bits(ir->reg, IR_DEC_REG1, IR_DEC_REG1_RESET,
+			   IR_DEC_REG1_RESET);
+	regmap_update_bits(ir->reg, IR_DEC_REG1, IR_DEC_REG1_RESET, 0);
+	regmap_update_bits(ir->reg, IR_DEC_REG1, IR_DEC_REG1_ENABLE,
+			   IR_DEC_REG1_ENABLE);
+
+	spin_unlock_irqrestore(&ir->lock, flags);
+
+	return 0;
+}
+
+static void meson_ir_sw_decoder_init(struct rc_dev *dev)
+{
+	unsigned long flags;
+	struct meson_ir *ir = dev->priv;
+
+	spin_lock_irqsave(&ir->lock, flags);
+
+	/* Reset the decoder */
+	regmap_update_bits(ir->reg, IR_DEC_REG1, IR_DEC_REG1_RESET,
+			   IR_DEC_REG1_RESET);
+	regmap_update_bits(ir->reg, IR_DEC_REG1, IR_DEC_REG1_RESET, 0);
+
+	/* Set general operation mode (= raw/software decoding) */
+	if (of_device_is_compatible(dev->dev.of_node, "amlogic,meson6-ir"))
+		regmap_update_bits(ir->reg, IR_DEC_REG1, IR_DEC_REG1_MODE,
+				   FIELD_PREP(IR_DEC_REG1_MODE,
+					      DECODE_MODE_RAW));
+	else
+		regmap_update_bits(ir->reg, IR_DEC_REG2, IR_DEC_REG2_MODE,
+				   FIELD_PREP(IR_DEC_REG2_MODE,
+					      DECODE_MODE_RAW));
+
+	/* Set rate */
+	regmap_update_bits(ir->reg, IR_DEC_REG0, IR_DEC_REG0_BASE_TIME,
+			   FIELD_PREP(IR_DEC_REG0_BASE_TIME,
+				      MESON_RAW_TRATE - 1));
+	/* IRQ on rising and falling edges */
+	regmap_update_bits(ir->reg, IR_DEC_REG1, IR_DEC_REG1_IRQSEL,
+			   FIELD_PREP(IR_DEC_REG1_IRQSEL, IRQSEL_RISE_FALL));
+	/* Enable the decoder */
+	regmap_update_bits(ir->reg, IR_DEC_REG1, IR_DEC_REG1_ENABLE,
+			   IR_DEC_REG1_ENABLE);
+
+	spin_unlock_irqrestore(&ir->lock, flags);
+}
+
+static int meson_ir_rc_allocate_device(struct platform_device *pdev)
+{
+	struct meson_ir *ir = platform_get_drvdata(pdev);
+
+	if (ir->support_hw_dec) {
+		ir->rc = devm_rc_allocate_device(&pdev->dev,
+						 RC_DRIVER_SCANCODE);
+		if (!ir->rc) {
+			dev_err(&pdev->dev, "failed to allocate rc device\n");
+			return -ENOMEM;
+		}
+
+		ir->rc->allowed_protocols = RC_PROTO_BIT_NEC |
+					    RC_PROTO_BIT_RC6_6A_32 |
+					    RC_PROTO_BIT_XMP;
+		ir->rc->change_protocol = meson_ir_change_protocol;
+	} else {
+		ir->rc = devm_rc_allocate_device(&pdev->dev, RC_DRIVER_IR_RAW);
+		if (!ir->rc) {
+			dev_err(&pdev->dev, "failed to allocate rc device\n");
+			return -ENOMEM;
+		}
+
+		ir->rc->allowed_protocols = RC_PROTO_BIT_ALL_IR_DECODER;
+		ir->rc->rx_resolution = MESON_RAW_TRATE;
+		ir->rc->min_timeout = 1;
+		ir->rc->timeout = IR_DEFAULT_TIMEOUT;
+		ir->rc->max_timeout = 10 * IR_DEFAULT_TIMEOUT;
+	}
+
+	return 0;
+}
+
 static int meson_ir_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct device_node *node = dev->of_node;
+	struct resource *res;
+	void __iomem *res_start;
 	const char *map_name;
 	struct meson_ir *ir;
 	int irq, ret;
@@ -110,7 +622,19 @@ static int meson_ir_probe(struct platform_device *pdev)
 	if (!ir)
 		return -ENOMEM;
 
-	ir->reg = devm_platform_ioremap_resource(pdev, 0);
+	platform_set_drvdata(pdev, ir);
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (IS_ERR_OR_NULL(res)) {
+		dev_err(&pdev->dev, "get mem resource error, %ld\n",
+			PTR_ERR(res));
+		return PTR_ERR(res);
+	}
+
+	res_start = devm_ioremap_resource(&pdev->dev, res);
+	meson_ir_regmap_config.max_register = resource_size(res) - 4;
+	ir->reg = devm_regmap_init_mmio(&pdev->dev, res_start,
+					&meson_ir_regmap_config);
 	if (IS_ERR(ir->reg))
 		return PTR_ERR(ir->reg);
 
@@ -118,27 +642,28 @@ static int meson_ir_probe(struct platform_device *pdev)
 	if (irq < 0)
 		return irq;
 
-	ir->rc = devm_rc_allocate_device(dev, RC_DRIVER_IR_RAW);
-	if (!ir->rc) {
-		dev_err(dev, "failed to allocate rc device\n");
-		return -ENOMEM;
+	if (of_device_is_compatible(node, "amlogic,meson6-ir")) {
+		ir->support_hw_dec = false;
+	} else {
+		if (of_property_read_bool(node,
+					  "amlogic,ir-support-hw-decode"))
+			ir->support_hw_dec = true;
+		else
+			ir->support_hw_dec = false;
 	}
 
+	if (meson_ir_rc_allocate_device(pdev))
+		return -ENOMEM;
+
 	ir->rc->priv = ir;
 	ir->rc->device_name = DRIVER_NAME;
 	ir->rc->input_phys = DRIVER_NAME "/input0";
 	ir->rc->input_id.bustype = BUS_HOST;
 	map_name = of_get_property(node, "linux,rc-map-name", NULL);
 	ir->rc->map_name = map_name ? map_name : RC_MAP_EMPTY;
-	ir->rc->allowed_protocols = RC_PROTO_BIT_ALL_IR_DECODER;
-	ir->rc->rx_resolution = MESON_TRATE;
-	ir->rc->min_timeout = 1;
-	ir->rc->timeout = IR_DEFAULT_TIMEOUT;
-	ir->rc->max_timeout = 10 * IR_DEFAULT_TIMEOUT;
 	ir->rc->driver_name = DRIVER_NAME;
 
 	spin_lock_init(&ir->lock);
-	platform_set_drvdata(pdev, ir);
 
 	ret = devm_rc_register_device(dev, ir->rc);
 	if (ret) {
@@ -146,33 +671,20 @@ static int meson_ir_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	ret = devm_request_irq(dev, irq, meson_ir_irq, 0, NULL, ir);
+	if (!ir->support_hw_dec)
+		meson_ir_sw_decoder_init(ir->rc);
+
+	ret = devm_request_threaded_irq(dev, irq, meson_ir_irq,
+					meson_ir_irq_thread,
+					IRQF_SHARED | IRQF_NO_SUSPEND,
+					"meson_ir", ir);
 	if (ret) {
 		dev_err(dev, "failed to request irq\n");
 		return ret;
 	}
 
-	/* Reset the decoder */
-	meson_ir_set_mask(ir, IR_DEC_REG1, REG1_RESET, REG1_RESET);
-	meson_ir_set_mask(ir, IR_DEC_REG1, REG1_RESET, 0);
-
-	/* Set general operation mode (= raw/software decoding) */
-	if (of_device_is_compatible(node, "amlogic,meson6-ir"))
-		meson_ir_set_mask(ir, IR_DEC_REG1, REG1_MODE_MASK,
-				  FIELD_PREP(REG1_MODE_MASK, DECODE_MODE_RAW));
-	else
-		meson_ir_set_mask(ir, IR_DEC_REG2, REG2_MODE_MASK,
-				  FIELD_PREP(REG2_MODE_MASK, DECODE_MODE_RAW));
-
-	/* Set rate */
-	meson_ir_set_mask(ir, IR_DEC_REG0, REG0_RATE_MASK, MESON_TRATE - 1);
-	/* IRQ on rising and falling edges */
-	meson_ir_set_mask(ir, IR_DEC_REG1, REG1_IRQSEL_MASK,
-			  FIELD_PREP(REG1_IRQSEL_MASK, REG1_IRQSEL_RISE_FALL));
-	/* Enable the decoder */
-	meson_ir_set_mask(ir, IR_DEC_REG1, REG1_ENABLE, REG1_ENABLE);
-
-	dev_info(dev, "receiver initialized\n");
+	dev_info(dev, "meson ir %s decoder was initialized\n",
+		 ir->support_hw_dec ? "hw" : "sw");
 
 	return 0;
 }
@@ -184,7 +696,7 @@ static int meson_ir_remove(struct platform_device *pdev)
 
 	/* Disable the decoder */
 	spin_lock_irqsave(&ir->lock, flags);
-	meson_ir_set_mask(ir, IR_DEC_REG1, REG1_ENABLE, 0);
+	regmap_update_bits(ir->reg, IR_DEC_REG1, IR_DEC_REG1_ENABLE, 0);
 	spin_unlock_irqrestore(&ir->lock, flags);
 
 	return 0;
@@ -193,7 +705,6 @@ static int meson_ir_remove(struct platform_device *pdev)
 static void meson_ir_shutdown(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
-	struct device_node *node = dev->of_node;
 	struct meson_ir *ir = platform_get_drvdata(pdev);
 	unsigned long flags;
 
@@ -203,27 +714,64 @@ static void meson_ir_shutdown(struct platform_device *pdev)
 	 * Set operation mode to NEC/hardware decoding to give
 	 * bootloader a chance to power the system back on
 	 */
-	if (of_device_is_compatible(node, "amlogic,meson6-ir"))
-		meson_ir_set_mask(ir, IR_DEC_REG1, REG1_MODE_MASK,
-				  DECODE_MODE_NEC << REG1_MODE_SHIFT);
+	if (of_device_is_compatible(dev->of_node, "amlogic,meson6-ir"))
+		regmap_update_bits(ir->reg, IR_DEC_REG1, IR_DEC_REG1_MODE,
+				   FIELD_PREP(IR_DEC_REG1_MODE,
+					      DECODE_MODE_NEC));
 	else
-		meson_ir_set_mask(ir, IR_DEC_REG2, REG2_MODE_MASK,
-				  DECODE_MODE_NEC << REG2_MODE_SHIFT);
+		regmap_update_bits(ir->reg, IR_DEC_REG2, IR_DEC_REG2_MODE,
+				   FIELD_PREP(IR_DEC_REG2_MODE,
+					      DECODE_MODE_NEC));
 
 	/* Set rate to default value */
-	meson_ir_set_mask(ir, IR_DEC_REG0, REG0_RATE_MASK, 0x13);
+	regmap_update_bits(ir->reg, IR_DEC_REG0, IR_DEC_REG0_BASE_TIME,
+			   FIELD_PREP(IR_DEC_REG0_BASE_TIME, MESON_HW_TRATE));
 
 	spin_unlock_irqrestore(&ir->lock, flags);
 }
 
+#ifdef CONFIG_PM
+static int meson_ir_resume(struct device *dev)
+{
+	struct meson_ir *ir = dev_get_drvdata(dev);
+
+	if (ir->support_hw_dec)
+		meson_ir_change_protocol(ir->rc, &ir->rc->enabled_protocols);
+	else
+		meson_ir_sw_decoder_init(ir->rc);
+
+	return 0;
+}
+
+static int meson_ir_suspend(struct device *dev)
+{
+	struct meson_ir *ir = dev_get_drvdata(dev);
+	unsigned long flags;
+
+	spin_lock_irqsave(&ir->lock, flags);
+	regmap_update_bits(ir->reg, IR_DEC_REG1, IR_DEC_REG1_ENABLE, 0);
+	spin_unlock_irqrestore(&ir->lock, flags);
+
+	return 0;
+}
+#endif
+
 static const struct of_device_id meson_ir_match[] = {
 	{ .compatible = "amlogic,meson6-ir" },
 	{ .compatible = "amlogic,meson8b-ir" },
 	{ .compatible = "amlogic,meson-gxbb-ir" },
+	{ .compatible = "amlogic,meson-s4-ir" },
 	{ },
 };
 MODULE_DEVICE_TABLE(of, meson_ir_match);
 
+#ifdef CONFIG_PM
+static const struct dev_pm_ops meson_ir_pm_ops = {
+	.suspend_late = meson_ir_suspend,
+	.resume_early = meson_ir_resume,
+};
+#endif
+
 static struct platform_driver meson_ir_driver = {
 	.probe		= meson_ir_probe,
 	.remove		= meson_ir_remove,
@@ -231,6 +779,9 @@ static struct platform_driver meson_ir_driver = {
 	.driver = {
 		.name		= DRIVER_NAME,
 		.of_match_table	= meson_ir_match,
+#ifdef CONFIG_PM
+		.pm = &meson_ir_pm_ops,
+#endif
 	},
 };
 
-- 
2.35.1

