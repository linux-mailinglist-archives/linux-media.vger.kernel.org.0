Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 206762501AC
	for <lists+linux-media@lfdr.de>; Mon, 24 Aug 2020 18:05:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725963AbgHXQFU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 24 Aug 2020 12:05:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48860 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727079AbgHXQEw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 24 Aug 2020 12:04:52 -0400
Received: from gofer.mess.org (gofer.mess.org [IPv6:2a02:8011:d000:212::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A89BAC0613ED
        for <linux-media@vger.kernel.org>; Mon, 24 Aug 2020 09:04:50 -0700 (PDT)
Received: by gofer.mess.org (Postfix, from userid 1000)
        id DF0F1C641B; Mon, 24 Aug 2020 17:04:39 +0100 (BST)
From:   Sean Young <sean@mess.org>
To:     linux-media@vger.kernel.org
Cc:     =?UTF-8?q?Bruno=20Pr=C3=A9mont?= <bonbons@linux-vserver.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Maxim Levitsky <maximlevitsky@gmail.com>,
        Patrick Lerda <patrick9876@free.fr>,
        Kevin Hilman <khilman@baylibre.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Sean Wang <sean.wang@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Patrice Chotard <patrice.chotard@st.com>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        =?UTF-8?q?David=20H=C3=A4rdeman?= <david@hardeman.nu>,
        Benjamin Valentin <benpicco@googlemail.com>,
        Antti Palosaari <crope@iki.fi>
Subject: [PATCH] media: rc: harmonize infrared durations to microseconds
Date:   Mon, 24 Aug 2020 17:04:39 +0100
Message-Id: <20200824160439.29588-2-sean@mess.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200824160439.29588-1-sean@mess.org>
References: <20200824160439.29588-1-sean@mess.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

rc-core kapi uses nanoseconds for infrared durations for receiving, and
microseconds for sending. The uapi already uses microseconds for both,
so this patch does not change the uapi.

Infrared durations do not need nanosecond resolution. IR protocols do not
have durations shorter than about 100 microseconds. Some IR hardware offers
250 microseconds resolution, which is sufficient for most protocols.
Better hardware has 50 microsecond resolution and is enough for every
protocol I am aware off.

Unify on microseconds everywhere. This simplifies the code since less
conversion between microseconds and nanoseconds needs to be done.

This affects:
 - rx_resolution member of struct rc_dev
 - timeout member of struct rc_dev
 - duration member in struct ir_raw_event

Cc: "Bruno Prémont" <bonbons@linux-vserver.org>
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Maxim Levitsky <maximlevitsky@gmail.com>
Cc: Patrick Lerda <patrick9876@free.fr>
Cc: Kevin Hilman <khilman@baylibre.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Sean Wang <sean.wang@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Patrice Chotard <patrice.chotard@st.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Chen-Yu Tsai <wens@csie.org>
Cc: "David Härdeman" <david@hardeman.nu>
Cc: Benjamin Valentin <benpicco@googlemail.com>
Cc: Antti Palosaari <crope@iki.fi>
Signed-off-by: Sean Young <sean@mess.org>
---
 drivers/hid/hid-picolcd_cir.c              | 10 +++---
 drivers/media/cec/core/cec-core.c          |  2 +-
 drivers/media/cec/platform/seco/seco-cec.c |  2 +-
 drivers/media/common/siano/smsir.c         |  4 +--
 drivers/media/i2c/cx25840/cx25840-ir.c     |  2 +-
 drivers/media/pci/cx23885/cx23888-ir.c     |  2 +-
 drivers/media/pci/cx88/cx88-input.c        |  4 +--
 drivers/media/pci/smipcie/smipcie-ir.c     |  7 ++--
 drivers/media/rc/ene_ir.c                  | 18 +++++------
 drivers/media/rc/fintek-cir.c              |  8 ++---
 drivers/media/rc/igorplugusb.c             |  6 ++--
 drivers/media/rc/iguanair.c                |  4 +--
 drivers/media/rc/imon_raw.c                |  2 +-
 drivers/media/rc/ir-hix5hd2.c              |  8 ++---
 drivers/media/rc/ir-imon-decoder.c         | 10 +++---
 drivers/media/rc/ir-jvc-decoder.c          |  6 ++--
 drivers/media/rc/ir-mce_kbd-decoder.c      |  6 ++--
 drivers/media/rc/ir-nec-decoder.c          |  6 ++--
 drivers/media/rc/ir-rc5-decoder.c          |  6 ++--
 drivers/media/rc/ir-rc6-decoder.c          |  6 ++--
 drivers/media/rc/ir-rcmm-decoder.c         | 18 +++++------
 drivers/media/rc/ir-sanyo-decoder.c        |  6 ++--
 drivers/media/rc/ir-sharp-decoder.c        |  6 ++--
 drivers/media/rc/ir-sony-decoder.c         |  6 ++--
 drivers/media/rc/ir-xmp-decoder.c          | 15 +++++----
 drivers/media/rc/ir_toy.c                  | 14 ++++----
 drivers/media/rc/ite-cir.c                 | 10 +++---
 drivers/media/rc/ite-cir.h                 |  4 +--
 drivers/media/rc/lirc_dev.c                | 37 +++++++++-------------
 drivers/media/rc/mceusb.c                  | 12 +++----
 drivers/media/rc/meson-ir.c                |  4 +--
 drivers/media/rc/mtk-cir.c                 |  4 +--
 drivers/media/rc/nuvoton-cir.c             | 10 +++---
 drivers/media/rc/nuvoton-cir.h             |  2 +-
 drivers/media/rc/rc-core-priv.h            |  1 -
 drivers/media/rc/rc-ir-raw.c               | 12 +++----
 drivers/media/rc/rc-loopback.c             |  8 ++---
 drivers/media/rc/redrat3.c                 | 17 +++++-----
 drivers/media/rc/serial_ir.c               | 10 +++---
 drivers/media/rc/sir_ir.c                  |  2 +-
 drivers/media/rc/st_rc.c                   |  6 ++--
 drivers/media/rc/streamzap.c               | 10 ++----
 drivers/media/rc/sunxi-cir.c               |  4 +--
 drivers/media/rc/ttusbir.c                 | 18 +++++------
 drivers/media/rc/winbond-cir.c             | 10 +++---
 drivers/media/rc/xbox_remote.c             |  2 +-
 drivers/media/usb/au0828/au0828-input.c    |  8 ++---
 drivers/media/usb/dvb-usb-v2/rtl28xxu.c    |  4 +--
 drivers/media/usb/dvb-usb/technisat-usb2.c |  4 +--
 include/media/rc-core.h                    | 11 +++----
 50 files changed, 187 insertions(+), 207 deletions(-)

diff --git a/drivers/hid/hid-picolcd_cir.c b/drivers/hid/hid-picolcd_cir.c
index 34da38d5b0cd..d6faa0e00f95 100644
--- a/drivers/hid/hid-picolcd_cir.c
+++ b/drivers/hid/hid-picolcd_cir.c
@@ -59,10 +59,10 @@ int picolcd_raw_cir(struct picolcd_data *data,
 	for (i = 0; i+1 < sz; i += 2) {
 		w = (raw_data[i] << 8) | (raw_data[i+1]);
 		rawir.pulse = !!(w & 0x8000);
-		rawir.duration = US_TO_NS(rawir.pulse ? (65536 - w) : w);
+		rawir.duration = rawir.pulse ? (65536 - w) : w;
 		/* Quirk!! - see above */
-		if (i == 0 && rawir.duration > 15000000)
-			rawir.duration -= 15000000;
+		if (i == 0 && rawir.duration > 15000)
+			rawir.duration -= 15000;
 		ir_raw_event_store(data->rc_dev, &rawir);
 	}
 	ir_raw_event_handle(data->rc_dev);
@@ -114,8 +114,8 @@ int picolcd_init_cir(struct picolcd_data *data, struct hid_report *report)
 	rdev->dev.parent       = &data->hdev->dev;
 	rdev->driver_name      = PICOLCD_NAME;
 	rdev->map_name         = RC_MAP_RC6_MCE;
-	rdev->timeout          = MS_TO_NS(100);
-	rdev->rx_resolution    = US_TO_NS(1);
+	rdev->timeout          = MS_TO_US(100);
+	rdev->rx_resolution    = 1;
 
 	ret = rc_register_device(rdev);
 	if (ret)
diff --git a/drivers/media/cec/core/cec-core.c b/drivers/media/cec/core/cec-core.c
index c599cd94dd62..ff12994d57c5 100644
--- a/drivers/media/cec/core/cec-core.c
+++ b/drivers/media/cec/core/cec-core.c
@@ -309,7 +309,7 @@ struct cec_adapter *cec_allocate_adapter(const struct cec_adap_ops *ops,
 	adap->rc->allowed_protocols = RC_PROTO_BIT_CEC;
 	adap->rc->priv = adap;
 	adap->rc->map_name = RC_MAP_CEC;
-	adap->rc->timeout = MS_TO_NS(550);
+	adap->rc->timeout = MS_TO_US(550);
 #endif
 	return adap;
 }
diff --git a/drivers/media/cec/platform/seco/seco-cec.c b/drivers/media/cec/platform/seco/seco-cec.c
index 075dd79beb6f..ae138cc253fd 100644
--- a/drivers/media/cec/platform/seco/seco-cec.c
+++ b/drivers/media/cec/platform/seco/seco-cec.c
@@ -369,7 +369,7 @@ static int secocec_ir_probe(void *priv)
 	cec->ir->allowed_protocols = RC_PROTO_BIT_RC5;
 	cec->ir->priv = cec;
 	cec->ir->map_name = RC_MAP_HAUPPAUGE;
-	cec->ir->timeout = MS_TO_NS(100);
+	cec->ir->timeout = MS_TO_US(100);
 
 	/* Clear the status register */
 	status = smb_rd16(SECOCEC_STATUS_REG_1, &val);
diff --git a/drivers/media/common/siano/smsir.c b/drivers/media/common/siano/smsir.c
index 79bd627f84b8..d85c78c104b9 100644
--- a/drivers/media/common/siano/smsir.c
+++ b/drivers/media/common/siano/smsir.c
@@ -27,7 +27,7 @@ void sms_ir_event(struct smscore_device_t *coredev, const char *buf, int len)
 
 	for (i = 0; i < len >> 2; i++) {
 		struct ir_raw_event ev = {
-			.duration = abs(samples[i]) * 1000, /* Convert to ns */
+			.duration = abs(samples[i]),
 			.pulse = (samples[i] > 0) ? false : true
 		};
 
@@ -48,7 +48,7 @@ int sms_ir_init(struct smscore_device_t *coredev)
 		return -ENOMEM;
 
 	coredev->ir.controller = 0;	/* Todo: vega/nova SPI number */
-	coredev->ir.timeout = IR_DEFAULT_TIMEOUT;
+	coredev->ir.timeout = US_TO_NS(IR_DEFAULT_TIMEOUT);
 	pr_debug("IR port %d, timeout %d ms\n",
 			coredev->ir.controller, coredev->ir.timeout);
 
diff --git a/drivers/media/i2c/cx25840/cx25840-ir.c b/drivers/media/i2c/cx25840/cx25840-ir.c
index 2181c8a347fc..2cf3e6a1f9e1 100644
--- a/drivers/media/i2c/cx25840/cx25840-ir.c
+++ b/drivers/media/i2c/cx25840/cx25840-ir.c
@@ -688,7 +688,7 @@ static int cx25840_ir_rx_read(struct v4l2_subdev *sd, u8 *buf, size_t count,
 		}
 
 		v = (unsigned) pulse_width_count_to_ns(
-				  (u16) (p->hw_fifo_data & FIFO_RXTX), divider);
+				  (u16)(p->hw_fifo_data & FIFO_RXTX), divider) / 1000;
 		if (v > IR_MAX_DURATION)
 			v = IR_MAX_DURATION;
 
diff --git a/drivers/media/pci/cx23885/cx23888-ir.c b/drivers/media/pci/cx23885/cx23888-ir.c
index ad7f8ccad526..ddfd2eb37484 100644
--- a/drivers/media/pci/cx23885/cx23888-ir.c
+++ b/drivers/media/pci/cx23885/cx23888-ir.c
@@ -663,7 +663,7 @@ static int cx23888_ir_rx_read(struct v4l2_subdev *sd, u8 *buf, size_t count,
 		}
 
 		v = (unsigned) pulse_width_count_to_ns(
-				  (u16) (p->hw_fifo_data & FIFO_RXTX), divider);
+				  (u16)(p->hw_fifo_data & FIFO_RXTX), divider) / 1000;
 		if (v > IR_MAX_DURATION)
 			v = IR_MAX_DURATION;
 
diff --git a/drivers/media/pci/cx88/cx88-input.c b/drivers/media/pci/cx88/cx88-input.c
index 7e0fed9cd200..ce0ef0b8186f 100644
--- a/drivers/media/pci/cx88/cx88-input.c
+++ b/drivers/media/pci/cx88/cx88-input.c
@@ -479,7 +479,7 @@ int cx88_ir_init(struct cx88_core *core, struct pci_dev *pci)
 	dev->scancode_mask = hardware_mask;
 
 	if (ir->sampling) {
-		dev->timeout = 10 * 1000 * 1000; /* 10 ms */
+		dev->timeout = MS_TO_US(10); /* 10 ms */
 	} else {
 		dev->driver_type = RC_DRIVER_SCANCODE;
 		dev->allowed_protocols = rc_proto;
@@ -544,7 +544,7 @@ void cx88_ir_irq(struct cx88_core *core)
 	for (todo = 32; todo > 0; todo -= bits) {
 		ev.pulse = samples & 0x80000000 ? false : true;
 		bits = min(todo, 32U - fls(ev.pulse ? samples : ~samples));
-		ev.duration = (bits * (NSEC_PER_SEC / 1000)) / ir_samplerate;
+		ev.duration = (bits * (USEC_PER_SEC / 1000)) / ir_samplerate;
 		ir_raw_event_store_with_filter(ir->dev, &ev);
 		samples <<= bits;
 	}
diff --git a/drivers/media/pci/smipcie/smipcie-ir.c b/drivers/media/pci/smipcie/smipcie-ir.c
index 9445d792bfc9..e6b74e161a05 100644
--- a/drivers/media/pci/smipcie/smipcie-ir.c
+++ b/drivers/media/pci/smipcie/smipcie-ir.c
@@ -87,8 +87,7 @@ static void smi_ir_decode(struct smi_rc *ir)
 		struct ir_raw_event rawir = {};
 
 		rawir.pulse = 0;
-		rawir.duration = US_TO_NS(SMI_SAMPLE_PERIOD *
-					  SMI_SAMPLE_IDLEMIN);
+		rawir.duration = SMI_SAMPLE_PERIOD * SMI_SAMPLE_IDLEMIN;
 		ir_raw_event_store_with_filter(rc_dev, &rawir);
 		smi_set(IR_Init_Reg, rbIRhighidle);
 	}
@@ -151,8 +150,8 @@ int smi_ir_init(struct smi_dev *dev)
 	rc_dev->dev.parent = &dev->pci_dev->dev;
 
 	rc_dev->map_name = dev->info->rc_map;
-	rc_dev->timeout = MS_TO_NS(100);
-	rc_dev->rx_resolution = US_TO_NS(SMI_SAMPLE_PERIOD);
+	rc_dev->timeout = MS_TO_US(100);
+	rc_dev->rx_resolution = SMI_SAMPLE_PERIOD;
 
 	ir->rc_dev = rc_dev;
 	ir->dev = dev;
diff --git a/drivers/media/rc/ene_ir.c b/drivers/media/rc/ene_ir.c
index 82867a2a60b0..6049e5c95394 100644
--- a/drivers/media/rc/ene_ir.c
+++ b/drivers/media/rc/ene_ir.c
@@ -432,27 +432,27 @@ static void ene_rx_setup(struct ene_device *dev)
 
 select_timeout:
 	if (dev->rx_fan_input_inuse) {
-		dev->rdev->rx_resolution = US_TO_NS(ENE_FW_SAMPLE_PERIOD_FAN);
+		dev->rdev->rx_resolution = ENE_FW_SAMPLE_PERIOD_FAN;
 
 		/* Fan input doesn't support timeouts, it just ends the
 			input with a maximum sample */
 		dev->rdev->min_timeout = dev->rdev->max_timeout =
-			US_TO_NS(ENE_FW_SMPL_BUF_FAN_MSK *
-				ENE_FW_SAMPLE_PERIOD_FAN);
+			ENE_FW_SMPL_BUF_FAN_MSK *
+				ENE_FW_SAMPLE_PERIOD_FAN;
 	} else {
-		dev->rdev->rx_resolution = US_TO_NS(sample_period);
+		dev->rdev->rx_resolution = sample_period;
 
 		/* Theoreticly timeout is unlimited, but we cap it
 		 * because it was seen that on one device, it
 		 * would stop sending spaces after around 250 msec.
 		 * Besides, this is close to 2^32 anyway and timeout is u32.
 		 */
-		dev->rdev->min_timeout = US_TO_NS(127 * sample_period);
-		dev->rdev->max_timeout = US_TO_NS(200000);
+		dev->rdev->min_timeout = 127 * sample_period;
+		dev->rdev->max_timeout = 200000;
 	}
 
 	if (dev->hw_learning_and_tx_capable)
-		dev->rdev->tx_resolution = US_TO_NS(sample_period);
+		dev->rdev->tx_resolution = sample_period;
 
 	if (dev->rdev->timeout > dev->rdev->max_timeout)
 		dev->rdev->timeout = dev->rdev->max_timeout;
@@ -798,7 +798,7 @@ static irqreturn_t ene_isr(int irq, void *data)
 
 		dbg("RX: %d (%s)", hw_sample, pulse ? "pulse" : "space");
 
-		ev.duration = US_TO_NS(hw_sample);
+		ev.duration = hw_sample;
 		ev.pulse = pulse;
 		ir_raw_event_store_with_filter(dev->rdev, &ev);
 	}
@@ -818,7 +818,7 @@ static void ene_setup_default_settings(struct ene_device *dev)
 	dev->learning_mode_enabled = learning_mode_force;
 
 	/* Set reasonable default timeout */
-	dev->rdev->timeout = US_TO_NS(150000);
+	dev->rdev->timeout = MS_TO_US(150);
 }
 
 /* Upload all hardware settings at once. Used at load and resume time */
diff --git a/drivers/media/rc/fintek-cir.c b/drivers/media/rc/fintek-cir.c
index 8e3177c5b586..b0d580566e4e 100644
--- a/drivers/media/rc/fintek-cir.c
+++ b/drivers/media/rc/fintek-cir.c
@@ -299,8 +299,8 @@ static void fintek_process_rx_ir_data(struct fintek_dev *fintek)
 		case PARSE_IRDATA:
 			fintek->rem--;
 			rawir.pulse = ((sample & BUF_PULSE_BIT) != 0);
-			rawir.duration = US_TO_NS((sample & BUF_SAMPLE_MASK)
-					  * CIR_SAMPLE_PERIOD);
+			rawir.duration = (sample & BUF_SAMPLE_MASK)
+					  * CIR_SAMPLE_PERIOD;
 
 			fit_dbg("Storing %s with duration %d",
 				rawir.pulse ? "pulse" : "space",
@@ -524,9 +524,9 @@ static int fintek_probe(struct pnp_dev *pdev, const struct pnp_device_id *dev_id
 	rdev->dev.parent = &pdev->dev;
 	rdev->driver_name = FINTEK_DRIVER_NAME;
 	rdev->map_name = RC_MAP_RC6_MCE;
-	rdev->timeout = US_TO_NS(1000);
+	rdev->timeout = 1000;
 	/* rx resolution is hardwired to 50us atm, 1, 25, 100 also possible */
-	rdev->rx_resolution = US_TO_NS(CIR_SAMPLE_PERIOD);
+	rdev->rx_resolution = CIR_SAMPLE_PERIOD;
 
 	fintek->rdev = rdev;
 
diff --git a/drivers/media/rc/igorplugusb.c b/drivers/media/rc/igorplugusb.c
index b981f7290c1b..effaa5751d6c 100644
--- a/drivers/media/rc/igorplugusb.c
+++ b/drivers/media/rc/igorplugusb.c
@@ -69,7 +69,7 @@ static void igorplugusb_irdata(struct igorplugusb *ir, unsigned len)
 								overflow);
 
 		do {
-			rawir.duration = ir->buf_in[i] * 85333;
+			rawir.duration = ir->buf_in[i] * 85;
 			rawir.pulse = i & 1;
 
 			ir_raw_event_store_with_filter(ir->rc, &rawir);
@@ -202,8 +202,8 @@ static int igorplugusb_probe(struct usb_interface *intf,
 	rc->priv = ir;
 	rc->driver_name = DRIVER_NAME;
 	rc->map_name = RC_MAP_HAUPPAUGE;
-	rc->timeout = MS_TO_NS(100);
-	rc->rx_resolution = 85333;
+	rc->timeout = MS_TO_US(100);
+	rc->rx_resolution = 85;
 
 	ir->rc = rc;
 	ret = rc_register_device(rc);
diff --git a/drivers/media/rc/iguanair.c b/drivers/media/rc/iguanair.c
index 566c2816d5be..82ba17d141fc 100644
--- a/drivers/media/rc/iguanair.c
+++ b/drivers/media/rc/iguanair.c
@@ -59,7 +59,7 @@ struct iguanair {
 #define MAX_IN_PACKET		8u
 #define MAX_OUT_PACKET		(sizeof(struct send_packet) + BUF_SIZE)
 #define TIMEOUT			1000
-#define RX_RESOLUTION		21333
+#define RX_RESOLUTION		21
 
 struct packet {
 	uint16_t start;
@@ -124,7 +124,7 @@ static void process_ir_data(struct iguanair *ir, unsigned len)
 		for (i = 0; i < 7; i++) {
 			if (ir->buf_in[i] == 0x80) {
 				rawir.pulse = false;
-				rawir.duration = US_TO_NS(21845);
+				rawir.duration = 21845;
 			} else {
 				rawir.pulse = (ir->buf_in[i] & 0x80) == 0;
 				rawir.duration = ((ir->buf_in[i] & 0x7f) + 1) *
diff --git a/drivers/media/rc/imon_raw.c b/drivers/media/rc/imon_raw.c
index aae0a3cc9479..d41580f6e4c7 100644
--- a/drivers/media/rc/imon_raw.c
+++ b/drivers/media/rc/imon_raw.c
@@ -8,7 +8,7 @@
 #include <media/rc-core.h>
 
 /* Each bit is 250us */
-#define BIT_DURATION 250000
+#define BIT_DURATION 250
 
 struct imon {
 	struct device *dev;
diff --git a/drivers/media/rc/ir-hix5hd2.c b/drivers/media/rc/ir-hix5hd2.c
index d80cfa455c73..0ffc27514fab 100644
--- a/drivers/media/rc/ir-hix5hd2.c
+++ b/drivers/media/rc/ir-hix5hd2.c
@@ -214,12 +214,12 @@ static irqreturn_t hix5hd2_ir_rx_interrupt(int irq, void *data)
 			data_h =  ((symb_val >> 16) & 0xffff) * 10;
 			symb_time = (data_l + data_h) / 10;
 
-			ev.duration = US_TO_NS(data_l);
+			ev.duration = data_l;
 			ev.pulse = true;
 			ir_raw_event_store(priv->rdev, &ev);
 
 			if (symb_time < IR_CFG_SYMBOL_MAXWIDTH) {
-				ev.duration = US_TO_NS(data_h);
+				ev.duration = data_h;
 				ev.pulse = false;
 				ir_raw_event_store(priv->rdev, &ev);
 			} else {
@@ -311,8 +311,8 @@ static int hix5hd2_ir_probe(struct platform_device *pdev)
 	rdev->input_id.vendor = 0x0001;
 	rdev->input_id.product = 0x0001;
 	rdev->input_id.version = 0x0100;
-	rdev->rx_resolution = US_TO_NS(10);
-	rdev->timeout = US_TO_NS(IR_CFG_SYMBOL_MAXWIDTH * 10);
+	rdev->rx_resolution = 10;
+	rdev->timeout = IR_CFG_SYMBOL_MAXWIDTH * 10;
 
 	ret = rc_register_device(rdev);
 	if (ret < 0)
diff --git a/drivers/media/rc/ir-imon-decoder.c b/drivers/media/rc/ir-imon-decoder.c
index a0efe2605393..41dbbef27fa6 100644
--- a/drivers/media/rc/ir-imon-decoder.c
+++ b/drivers/media/rc/ir-imon-decoder.c
@@ -8,7 +8,7 @@
 #include <linux/module.h>
 #include "rc-core-priv.h"
 
-#define IMON_UNIT		415662 /* ns */
+#define IMON_UNIT		416 /* us */
 #define IMON_BITS		30
 #define IMON_CHKBITS		(BIT(30) | BIT(25) | BIT(24) | BIT(22) | \
 				 BIT(21) | BIT(20) | BIT(19) | BIT(18) | \
@@ -102,8 +102,7 @@ static int ir_imon_decode(struct rc_dev *dev, struct ir_raw_event ev)
 
 	dev_dbg(&dev->dev,
 		"iMON decode started at state %d bitno %d (%uus %s)\n",
-		data->state, data->count, TO_US(ev.duration),
-		TO_STR(ev.pulse));
+		data->state, data->count, ev.duration, TO_STR(ev.pulse));
 
 	/*
 	 * Since iMON protocol is a series of bits, if at any point
@@ -116,7 +115,7 @@ static int ir_imon_decode(struct rc_dev *dev, struct ir_raw_event ev)
 	 * we're at a new scancode.
 	 */
 	if (data->state == STATE_ERROR) {
-		if (!ev.pulse && ev.duration > MS_TO_NS(10))
+		if (!ev.pulse && ev.duration > MS_TO_US(10))
 			data->state = STATE_INACTIVE;
 		return 0;
 	}
@@ -169,8 +168,7 @@ static int ir_imon_decode(struct rc_dev *dev, struct ir_raw_event ev)
 err_out:
 	dev_dbg(&dev->dev,
 		"iMON decode failed at state %d bitno %d (%uus %s)\n",
-		data->state, data->count, TO_US(ev.duration),
-		TO_STR(ev.pulse));
+		data->state, data->count, ev.duration, TO_STR(ev.pulse));
 
 	data->state = STATE_ERROR;
 
diff --git a/drivers/media/rc/ir-jvc-decoder.c b/drivers/media/rc/ir-jvc-decoder.c
index 864d9e316c33..470f2e1fd507 100644
--- a/drivers/media/rc/ir-jvc-decoder.c
+++ b/drivers/media/rc/ir-jvc-decoder.c
@@ -9,7 +9,7 @@
 #include "rc-core-priv.h"
 
 #define JVC_NBITS		16		/* dev(8) + func(8) */
-#define JVC_UNIT		525000		/* ns */
+#define JVC_UNIT		525		/* us */
 #define JVC_HEADER_PULSE	(16 * JVC_UNIT) /* lack of header -> repeat */
 #define JVC_HEADER_SPACE	(8  * JVC_UNIT)
 #define JVC_BIT_PULSE		(1  * JVC_UNIT)
@@ -49,7 +49,7 @@ static int ir_jvc_decode(struct rc_dev *dev, struct ir_raw_event ev)
 		goto out;
 
 	dev_dbg(&dev->dev, "JVC decode started at state %d (%uus %s)\n",
-		data->state, TO_US(ev.duration), TO_STR(ev.pulse));
+		data->state, ev.duration, TO_STR(ev.pulse));
 
 again:
 	switch (data->state) {
@@ -157,7 +157,7 @@ static int ir_jvc_decode(struct rc_dev *dev, struct ir_raw_event ev)
 
 out:
 	dev_dbg(&dev->dev, "JVC decode failed at state %d (%uus %s)\n",
-		data->state, TO_US(ev.duration), TO_STR(ev.pulse));
+		data->state, ev.duration, TO_STR(ev.pulse));
 	data->state = STATE_INACTIVE;
 	return -EINVAL;
 }
diff --git a/drivers/media/rc/ir-mce_kbd-decoder.c b/drivers/media/rc/ir-mce_kbd-decoder.c
index cfe837f773c1..90350f25d8dd 100644
--- a/drivers/media/rc/ir-mce_kbd-decoder.c
+++ b/drivers/media/rc/ir-mce_kbd-decoder.c
@@ -21,7 +21,7 @@
  * input device for the remote, rather than the keyboard/mouse one.
  */
 
-#define MCIR2_UNIT		333333	/* ns */
+#define MCIR2_UNIT		333	/* us */
 #define MCIR2_HEADER_NBITS	5
 #define MCIR2_MOUSE_NBITS	29
 #define MCIR2_KEYBOARD_NBITS	32
@@ -231,7 +231,7 @@ static int ir_mce_kbd_decode(struct rc_dev *dev, struct ir_raw_event ev)
 
 again:
 	dev_dbg(&dev->dev, "started at state %i (%uus %s)\n",
-		data->state, TO_US(ev.duration), TO_STR(ev.pulse));
+		data->state, ev.duration, TO_STR(ev.pulse));
 
 	if (!geq_margin(ev.duration, MCIR2_UNIT, MCIR2_UNIT / 2))
 		return 0;
@@ -353,7 +353,7 @@ static int ir_mce_kbd_decode(struct rc_dev *dev, struct ir_raw_event ev)
 
 out:
 	dev_dbg(&dev->dev, "failed at state %i (%uus %s)\n",
-		data->state, TO_US(ev.duration), TO_STR(ev.pulse));
+		data->state, ev.duration, TO_STR(ev.pulse));
 	data->state = STATE_INACTIVE;
 	return -EINVAL;
 }
diff --git a/drivers/media/rc/ir-nec-decoder.c b/drivers/media/rc/ir-nec-decoder.c
index 6a8973ae3684..b4c3e4baf34d 100644
--- a/drivers/media/rc/ir-nec-decoder.c
+++ b/drivers/media/rc/ir-nec-decoder.c
@@ -8,7 +8,7 @@
 #include "rc-core-priv.h"
 
 #define NEC_NBITS		32
-#define NEC_UNIT		562500  /* ns */
+#define NEC_UNIT		563  /* us */
 #define NEC_HEADER_PULSE	(16 * NEC_UNIT)
 #define NECX_HEADER_PULSE	(8  * NEC_UNIT) /* Less common NEC variant */
 #define NEC_HEADER_SPACE	(8  * NEC_UNIT)
@@ -50,7 +50,7 @@ static int ir_nec_decode(struct rc_dev *dev, struct ir_raw_event ev)
 	}
 
 	dev_dbg(&dev->dev, "NEC decode started at state %d (%uus %s)\n",
-		data->state, TO_US(ev.duration), TO_STR(ev.pulse));
+		data->state, ev.duration, TO_STR(ev.pulse));
 
 	switch (data->state) {
 
@@ -163,7 +163,7 @@ static int ir_nec_decode(struct rc_dev *dev, struct ir_raw_event ev)
 	}
 
 	dev_dbg(&dev->dev, "NEC decode failed at count %d state %d (%uus %s)\n",
-		data->count, data->state, TO_US(ev.duration), TO_STR(ev.pulse));
+		data->count, data->state, ev.duration, TO_STR(ev.pulse));
 	data->state = STATE_INACTIVE;
 	return -EINVAL;
 }
diff --git a/drivers/media/rc/ir-rc5-decoder.c b/drivers/media/rc/ir-rc5-decoder.c
index 63624654a71e..d58b6226afeb 100644
--- a/drivers/media/rc/ir-rc5-decoder.c
+++ b/drivers/media/rc/ir-rc5-decoder.c
@@ -16,7 +16,7 @@
 #define RC5_SZ_NBITS		15
 #define RC5X_NBITS		20
 #define CHECK_RC5X_NBITS	8
-#define RC5_UNIT		888888 /* ns */
+#define RC5_UNIT		889 /* us */
 #define RC5_BIT_START		(1 * RC5_UNIT)
 #define RC5_BIT_END		(1 * RC5_UNIT)
 #define RC5X_SPACE		(4 * RC5_UNIT)
@@ -55,7 +55,7 @@ static int ir_rc5_decode(struct rc_dev *dev, struct ir_raw_event ev)
 
 again:
 	dev_dbg(&dev->dev, "RC5(x/sz) decode started at state %i (%uus %s)\n",
-		data->state, TO_US(ev.duration), TO_STR(ev.pulse));
+		data->state, ev.duration, TO_STR(ev.pulse));
 
 	if (!geq_margin(ev.duration, RC5_UNIT, RC5_UNIT / 2))
 		return 0;
@@ -164,7 +164,7 @@ static int ir_rc5_decode(struct rc_dev *dev, struct ir_raw_event ev)
 
 out:
 	dev_dbg(&dev->dev, "RC5(x/sz) decode failed at state %i count %d (%uus %s)\n",
-		data->state, data->count, TO_US(ev.duration), TO_STR(ev.pulse));
+		data->state, data->count, ev.duration, TO_STR(ev.pulse));
 	data->state = STATE_INACTIVE;
 	return -EINVAL;
 }
diff --git a/drivers/media/rc/ir-rc6-decoder.c b/drivers/media/rc/ir-rc6-decoder.c
index 95727ca910f7..df8cd53a9005 100644
--- a/drivers/media/rc/ir-rc6-decoder.c
+++ b/drivers/media/rc/ir-rc6-decoder.c
@@ -15,7 +15,7 @@
  * RC6-6A-32	(MCE version with toggle bit in body)
  */
 
-#define RC6_UNIT		444444	/* nanosecs */
+#define RC6_UNIT		444	/* microseconds */
 #define RC6_HEADER_NBITS	4	/* not including toggle bit */
 #define RC6_0_NBITS		16
 #define RC6_6A_32_NBITS		32
@@ -95,7 +95,7 @@ static int ir_rc6_decode(struct rc_dev *dev, struct ir_raw_event ev)
 
 again:
 	dev_dbg(&dev->dev, "RC6 decode started at state %i (%uus %s)\n",
-		data->state, TO_US(ev.duration), TO_STR(ev.pulse));
+		data->state, ev.duration, TO_STR(ev.pulse));
 
 	if (!geq_margin(ev.duration, RC6_UNIT, RC6_UNIT / 2))
 		return 0;
@@ -270,7 +270,7 @@ static int ir_rc6_decode(struct rc_dev *dev, struct ir_raw_event ev)
 
 out:
 	dev_dbg(&dev->dev, "RC6 decode failed at state %i (%uus %s)\n",
-		data->state, TO_US(ev.duration), TO_STR(ev.pulse));
+		data->state, ev.duration, TO_STR(ev.pulse));
 	data->state = STATE_INACTIVE;
 	return -EINVAL;
 }
diff --git a/drivers/media/rc/ir-rcmm-decoder.c b/drivers/media/rc/ir-rcmm-decoder.c
index 028df5cb1828..fd9ec69a3718 100644
--- a/drivers/media/rc/ir-rcmm-decoder.c
+++ b/drivers/media/rc/ir-rcmm-decoder.c
@@ -6,12 +6,12 @@
 #include "rc-core-priv.h"
 #include <linux/module.h>
 
-#define RCMM_UNIT		166667	/* nanosecs */
-#define RCMM_PREFIX_PULSE	416666  /* 166666.666666666*2.5 */
-#define RCMM_PULSE_0            277777  /* 166666.666666666*(1+2/3) */
-#define RCMM_PULSE_1            444444  /* 166666.666666666*(2+2/3) */
-#define RCMM_PULSE_2            611111  /* 166666.666666666*(3+2/3) */
-#define RCMM_PULSE_3            777778  /* 166666.666666666*(4+2/3) */
+#define RCMM_UNIT		166  /* microseconds */
+#define RCMM_PREFIX_PULSE	417  /* 166.666666666666*2.5 */
+#define RCMM_PULSE_0            278  /* 166.666666666666*(1+2/3) */
+#define RCMM_PULSE_1            444  /* 166.666666666666*(2+2/3) */
+#define RCMM_PULSE_2            611  /* 166.666666666666*(3+2/3) */
+#define RCMM_PULSE_3            778  /* 166.666666666666*(4+2/3) */
 
 enum rcmm_state {
 	STATE_INACTIVE,
@@ -64,8 +64,8 @@ static int ir_rcmm_decode(struct rc_dev *dev, struct ir_raw_event ev)
 	int value;
 
 	if (!(dev->enabled_protocols & (RC_PROTO_BIT_RCMM32 |
-							RC_PROTO_BIT_RCMM24 |
-							RC_PROTO_BIT_RCMM12)))
+					RC_PROTO_BIT_RCMM24 |
+					RC_PROTO_BIT_RCMM12)))
 		return 0;
 
 	if (!is_timing_event(ev)) {
@@ -165,7 +165,7 @@ static int ir_rcmm_decode(struct rc_dev *dev, struct ir_raw_event ev)
 	}
 
 	dev_dbg(&dev->dev, "RC-MM decode failed at count %d state %d (%uus %s)\n",
-		data->count, data->state, TO_US(ev.duration), TO_STR(ev.pulse));
+		data->count, data->state, ev.duration, TO_STR(ev.pulse));
 	data->state = STATE_INACTIVE;
 	return -EINVAL;
 }
diff --git a/drivers/media/rc/ir-sanyo-decoder.c b/drivers/media/rc/ir-sanyo-decoder.c
index dd6ee1e339d6..bfc181be1044 100644
--- a/drivers/media/rc/ir-sanyo-decoder.c
+++ b/drivers/media/rc/ir-sanyo-decoder.c
@@ -17,7 +17,7 @@
 #include "rc-core-priv.h"
 
 #define SANYO_NBITS		(13+13+8+8)
-#define SANYO_UNIT		562500  /* ns */
+#define SANYO_UNIT		563  /* us */
 #define SANYO_HEADER_PULSE	(16  * SANYO_UNIT)
 #define SANYO_HEADER_SPACE	(8   * SANYO_UNIT)
 #define SANYO_BIT_PULSE		(1   * SANYO_UNIT)
@@ -59,7 +59,7 @@ static int ir_sanyo_decode(struct rc_dev *dev, struct ir_raw_event ev)
 	}
 
 	dev_dbg(&dev->dev, "SANYO decode started at state %d (%uus %s)\n",
-		data->state, TO_US(ev.duration), TO_STR(ev.pulse));
+		data->state, ev.duration, TO_STR(ev.pulse));
 
 	switch (data->state) {
 
@@ -158,7 +158,7 @@ static int ir_sanyo_decode(struct rc_dev *dev, struct ir_raw_event ev)
 	}
 
 	dev_dbg(&dev->dev, "SANYO decode failed at count %d state %d (%uus %s)\n",
-		data->count, data->state, TO_US(ev.duration), TO_STR(ev.pulse));
+		data->count, data->state, ev.duration, TO_STR(ev.pulse));
 	data->state = STATE_INACTIVE;
 	return -EINVAL;
 }
diff --git a/drivers/media/rc/ir-sharp-decoder.c b/drivers/media/rc/ir-sharp-decoder.c
index 37fab0919131..d09c38c07dbd 100644
--- a/drivers/media/rc/ir-sharp-decoder.c
+++ b/drivers/media/rc/ir-sharp-decoder.c
@@ -12,7 +12,7 @@
 #include "rc-core-priv.h"
 
 #define SHARP_NBITS		15
-#define SHARP_UNIT		40000  /* ns */
+#define SHARP_UNIT		40  /* us */
 #define SHARP_BIT_PULSE		(8    * SHARP_UNIT) /* 320us */
 #define SHARP_BIT_0_PERIOD	(25   * SHARP_UNIT) /* 1ms (680us space) */
 #define SHARP_BIT_1_PERIOD	(50   * SHARP_UNIT) /* 2ms (1680ms space) */
@@ -47,7 +47,7 @@ static int ir_sharp_decode(struct rc_dev *dev, struct ir_raw_event ev)
 	}
 
 	dev_dbg(&dev->dev, "Sharp decode started at state %d (%uus %s)\n",
-		data->state, TO_US(ev.duration), TO_STR(ev.pulse));
+		data->state, ev.duration, TO_STR(ev.pulse));
 
 	switch (data->state) {
 
@@ -159,7 +159,7 @@ static int ir_sharp_decode(struct rc_dev *dev, struct ir_raw_event ev)
 	}
 
 	dev_dbg(&dev->dev, "Sharp decode failed at count %d state %d (%uus %s)\n",
-		data->count, data->state, TO_US(ev.duration), TO_STR(ev.pulse));
+		data->count, data->state, ev.duration, TO_STR(ev.pulse));
 	data->state = STATE_INACTIVE;
 	return -EINVAL;
 }
diff --git a/drivers/media/rc/ir-sony-decoder.c b/drivers/media/rc/ir-sony-decoder.c
index 9fa58d92eb09..52207541f9f6 100644
--- a/drivers/media/rc/ir-sony-decoder.c
+++ b/drivers/media/rc/ir-sony-decoder.c
@@ -8,7 +8,7 @@
 #include <linux/module.h>
 #include "rc-core-priv.h"
 
-#define SONY_UNIT		600000 /* ns */
+#define SONY_UNIT		600 /* us */
 #define SONY_HEADER_PULSE	(4 * SONY_UNIT)
 #define	SONY_HEADER_SPACE	(1 * SONY_UNIT)
 #define SONY_BIT_0_PULSE	(1 * SONY_UNIT)
@@ -48,7 +48,7 @@ static int ir_sony_decode(struct rc_dev *dev, struct ir_raw_event ev)
 		goto out;
 
 	dev_dbg(&dev->dev, "Sony decode started at state %d (%uus %s)\n",
-		data->state, TO_US(ev.duration), TO_STR(ev.pulse));
+		data->state, ev.duration, TO_STR(ev.pulse));
 
 	switch (data->state) {
 
@@ -154,7 +154,7 @@ static int ir_sony_decode(struct rc_dev *dev, struct ir_raw_event ev)
 
 out:
 	dev_dbg(&dev->dev, "Sony decode failed at state %d (%uus %s)\n",
-		data->state, TO_US(ev.duration), TO_STR(ev.pulse));
+		data->state, ev.duration, TO_STR(ev.pulse));
 	data->state = STATE_INACTIVE;
 	return -EINVAL;
 
diff --git a/drivers/media/rc/ir-xmp-decoder.c b/drivers/media/rc/ir-xmp-decoder.c
index 4c3d03876200..ff94f48bda32 100644
--- a/drivers/media/rc/ir-xmp-decoder.c
+++ b/drivers/media/rc/ir-xmp-decoder.c
@@ -12,11 +12,12 @@
 #include <linux/module.h>
 #include "rc-core-priv.h"
 
-#define XMP_UNIT		  136000 /* ns */
-#define XMP_LEADER		  210000 /* ns */
-#define XMP_NIBBLE_PREFIX	  760000 /* ns */
-#define	XMP_HALFFRAME_SPACE	13800000 /* ns */
-#define	XMP_TRAILER_SPACE	20000000 /* should be 80ms but not all dureation supliers can go that high */
+#define XMP_UNIT		  136 /* us */
+#define XMP_LEADER		  210 /* us */
+#define XMP_NIBBLE_PREFIX	  760 /* us */
+#define	XMP_HALFFRAME_SPACE	13800 /* us */
+/* should be 80ms but not all duration supliers can go that high */
+#define	XMP_TRAILER_SPACE	20000
 
 enum xmp_state {
 	STATE_INACTIVE,
@@ -42,7 +43,7 @@ static int ir_xmp_decode(struct rc_dev *dev, struct ir_raw_event ev)
 	}
 
 	dev_dbg(&dev->dev, "XMP decode started at state %d %d (%uus %s)\n",
-		data->state, data->count, TO_US(ev.duration), TO_STR(ev.pulse));
+		data->state, data->count, ev.duration, TO_STR(ev.pulse));
 
 	switch (data->state) {
 
@@ -183,7 +184,7 @@ static int ir_xmp_decode(struct rc_dev *dev, struct ir_raw_event ev)
 	}
 
 	dev_dbg(&dev->dev, "XMP decode failed at count %d state %d (%uus %s)\n",
-		data->count, data->state, TO_US(ev.duration), TO_STR(ev.pulse));
+		data->count, data->state, ev.duration, TO_STR(ev.pulse));
 	data->state = STATE_INACTIVE;
 	return -EINVAL;
 }
diff --git a/drivers/media/rc/ir_toy.c b/drivers/media/rc/ir_toy.c
index 5c7a7500a925..e0242c9b6aeb 100644
--- a/drivers/media/rc/ir_toy.c
+++ b/drivers/media/rc/ir_toy.c
@@ -38,8 +38,8 @@ static const u8 COMMAND_TXSTART[] = { 0x26, 0x24, 0x25, 0x03 };
 #define LEN_SAMPLEMODEPROTO 3
 
 #define MIN_FW_VERSION 20
-#define UNIT_NS 21333
-#define MAX_TIMEOUT_NS (UNIT_NS * U16_MAX)
+#define UNIT_US 21
+#define MAX_TIMEOUT_US (UNIT_US * U16_MAX)
 
 #define MAX_PACKET 64
 
@@ -131,7 +131,7 @@ static void irtoy_response(struct irtoy *irtoy, u32 len)
 			if (v == 0xffff) {
 				rawir.pulse = false;
 			} else {
-				rawir.duration = v * UNIT_NS;
+				rawir.duration = v * UNIT_US;
 				ir_raw_event_store_with_timeout(irtoy->rc,
 								&rawir);
 			}
@@ -302,7 +302,7 @@ static int irtoy_tx(struct rc_dev *rc, uint *txbuf, uint count)
 		return -ENOMEM;
 
 	for (i = 0; i < count; i++) {
-		u16 v = DIV_ROUND_CLOSEST(US_TO_NS(txbuf[i]), UNIT_NS);
+		u16 v = DIV_ROUND_CLOSEST(txbuf[i], UNIT_US);
 
 		if (!v)
 			v = 1;
@@ -438,7 +438,7 @@ static int irtoy_probe(struct usb_interface *intf,
 	rc->tx_ir = irtoy_tx;
 	rc->allowed_protocols = RC_PROTO_BIT_ALL_IR_DECODER;
 	rc->map_name = RC_MAP_RC6_MCE;
-	rc->rx_resolution = UNIT_NS;
+	rc->rx_resolution = UNIT_US;
 	rc->timeout = IR_DEFAULT_TIMEOUT;
 
 	/*
@@ -450,8 +450,8 @@ static int irtoy_probe(struct usb_interface *intf,
 	 *
 	 * So, make timeout a largish minimum which works with most protocols.
 	 */
-	rc->min_timeout = MS_TO_NS(40);
-	rc->max_timeout = MAX_TIMEOUT_NS;
+	rc->min_timeout = MS_TO_US(40);
+	rc->max_timeout = MAX_TIMEOUT_US;
 
 	err = rc_register_device(rc);
 	if (err)
diff --git a/drivers/media/rc/ite-cir.c b/drivers/media/rc/ite-cir.c
index 07667c04c1d2..a905113fef6e 100644
--- a/drivers/media/rc/ite-cir.c
+++ b/drivers/media/rc/ite-cir.c
@@ -176,14 +176,14 @@ static void ite_decode_bytes(struct ite_dev *dev, const u8 * data, int
 	if (next_one > 0) {
 		ev.pulse = true;
 		ev.duration =
-		    ITE_BITS_TO_NS(next_one, sample_period);
+		    ITE_BITS_TO_US(next_one, sample_period);
 		ir_raw_event_store_with_filter(dev->rdev, &ev);
 	}
 
 	while (next_one < size) {
 		next_zero = find_next_zero_bit_le(ldata, size, next_one + 1);
 		ev.pulse = false;
-		ev.duration = ITE_BITS_TO_NS(next_zero - next_one, sample_period);
+		ev.duration = ITE_BITS_TO_US(next_zero - next_one, sample_period);
 		ir_raw_event_store_with_filter(dev->rdev, &ev);
 
 		if (next_zero < size) {
@@ -193,7 +193,7 @@ static void ite_decode_bytes(struct ite_dev *dev, const u8 * data, int
 						     next_zero + 1);
 			ev.pulse = true;
 			ev.duration =
-			    ITE_BITS_TO_NS(next_one - next_zero,
+			    ITE_BITS_TO_US(next_one - next_zero,
 					   sample_period);
 			ir_raw_event_store_with_filter
 			    (dev->rdev, &ev);
@@ -1555,9 +1555,9 @@ static int ite_probe(struct pnp_dev *pdev, const struct pnp_device_id
 	rdev->timeout = IR_DEFAULT_TIMEOUT;
 	rdev->max_timeout = 10 * IR_DEFAULT_TIMEOUT;
 	rdev->rx_resolution = ITE_BAUDRATE_DIVISOR *
-				itdev->params.sample_period;
+				itdev->params.sample_period / 1000;
 	rdev->tx_resolution = ITE_BAUDRATE_DIVISOR *
-				itdev->params.sample_period;
+				itdev->params.sample_period / 1000;
 
 	/* set up transmitter related values if needed */
 	if (itdev->params.hw_tx_capable) {
diff --git a/drivers/media/rc/ite-cir.h b/drivers/media/rc/ite-cir.h
index f04c4b34ff0c..4954470448a7 100644
--- a/drivers/media/rc/ite-cir.h
+++ b/drivers/media/rc/ite-cir.h
@@ -146,8 +146,8 @@ struct ite_dev {
 #define ITE_DEFAULT_CARRIER_FREQ	38000
 
 /* convert bits to us */
-#define ITE_BITS_TO_NS(bits, sample_period) \
-((u32) ((bits) * ITE_BAUDRATE_DIVISOR * sample_period))
+#define ITE_BITS_TO_US(bits, sample_period) \
+((u32)((bits) * ITE_BAUDRATE_DIVISOR * (sample_period) / 1000))
 
 /*
  * n in RDCR produces a tolerance of +/- n * 6.25% around the center
diff --git a/drivers/media/rc/lirc_dev.c b/drivers/media/rc/lirc_dev.c
index bea52a2fae2b..cde817e744b7 100644
--- a/drivers/media/rc/lirc_dev.c
+++ b/drivers/media/rc/lirc_dev.c
@@ -67,17 +67,16 @@ void ir_lirc_raw_event(struct rc_dev *dev, struct ir_raw_event ev)
 		dev->gap = true;
 		dev->gap_duration = ev.duration;
 
-		sample = LIRC_TIMEOUT(ev.duration / 1000);
+		sample = LIRC_TIMEOUT(ev.duration);
 		dev_dbg(&dev->dev, "timeout report (duration: %d)\n", sample);
 
 	/* Normal sample */
 	} else {
 		if (dev->gap) {
-			dev->gap_duration += ktime_to_ns(ktime_sub(ktime_get(),
+			dev->gap_duration += ktime_to_us(ktime_sub(ktime_get(),
 							 dev->gap_start));
 
-			/* Convert to ms and cap by LIRC_VALUE_MASK */
-			do_div(dev->gap_duration, 1000);
+			/* Cap by LIRC_VALUE_MASK */
 			dev->gap_duration = min_t(u64, dev->gap_duration,
 						  LIRC_VALUE_MASK);
 
@@ -89,10 +88,10 @@ void ir_lirc_raw_event(struct rc_dev *dev, struct ir_raw_event ev)
 			dev->gap = false;
 		}
 
-		sample = ev.pulse ? LIRC_PULSE(ev.duration / 1000) :
-					LIRC_SPACE(ev.duration / 1000);
+		sample = ev.pulse ? LIRC_PULSE(ev.duration) :
+					LIRC_SPACE(ev.duration);
 		dev_dbg(&dev->dev, "delivering %uus %s to lirc_dev\n",
-			TO_US(ev.duration), TO_STR(ev.pulse));
+			ev.duration, TO_STR(ev.pulse));
 	}
 
 	/*
@@ -296,8 +295,7 @@ static ssize_t ir_lirc_transmit_ir(struct file *file, const char __user *buf,
 		}
 
 		for (i = 0; i < count; i++)
-			/* Convert from NS to US */
-			txbuf[i] = DIV_ROUND_UP(raw[i].duration, 1000);
+			txbuf[i] = raw[i].duration;
 
 		if (dev->s_tx_carrier) {
 			int carrier = ir_raw_encode_carrier(scan.rc_proto);
@@ -325,7 +323,7 @@ static ssize_t ir_lirc_transmit_ir(struct file *file, const char __user *buf,
 	}
 
 	for (i = 0; i < count; i++) {
-		if (txbuf[i] > IR_MAX_DURATION / 1000 - duration || !txbuf[i]) {
+		if (txbuf[i] > IR_MAX_DURATION - duration || !txbuf[i]) {
 			ret = -EINVAL;
 			goto out_kfree;
 		}
@@ -517,7 +515,7 @@ static long ir_lirc_ioctl(struct file *file, unsigned int cmd,
 		if (!dev->rx_resolution)
 			ret = -ENOTTY;
 		else
-			val = dev->rx_resolution / 1000;
+			val = dev->rx_resolution;
 		break;
 
 	case LIRC_SET_WIDEBAND_RECEIVER:
@@ -539,31 +537,26 @@ static long ir_lirc_ioctl(struct file *file, unsigned int cmd,
 		if (!dev->max_timeout)
 			ret = -ENOTTY;
 		else
-			val = DIV_ROUND_UP(dev->min_timeout, 1000);
+			val = dev->min_timeout;
 		break;
 
 	case LIRC_GET_MAX_TIMEOUT:
 		if (!dev->max_timeout)
 			ret = -ENOTTY;
 		else
-			val = dev->max_timeout / 1000;
+			val = dev->max_timeout;
 		break;
 
 	case LIRC_SET_REC_TIMEOUT:
 		if (!dev->max_timeout) {
 			ret = -ENOTTY;
-		} else if (val > U32_MAX / 1000) {
-			/* Check for multiply overflow */
-			ret = -EINVAL;
 		} else {
-			u32 tmp = val * 1000;
-
-			if (tmp < dev->min_timeout || tmp > dev->max_timeout)
+			if (val < dev->min_timeout || val > dev->max_timeout)
 				ret = -EINVAL;
 			else if (dev->s_timeout)
-				ret = dev->s_timeout(dev, tmp);
+				ret = dev->s_timeout(dev, val);
 			else
-				dev->timeout = tmp;
+				dev->timeout = val;
 		}
 		break;
 
@@ -571,7 +564,7 @@ static long ir_lirc_ioctl(struct file *file, unsigned int cmd,
 		if (!dev->timeout)
 			ret = -ENOTTY;
 		else
-			val = DIV_ROUND_UP(dev->timeout, 1000);
+			val = dev->timeout;
 		break;
 
 	case LIRC_SET_REC_TIMEOUT_REPORTS:
diff --git a/drivers/media/rc/mceusb.c b/drivers/media/rc/mceusb.c
index 98681ba10428..f1dbd059ed08 100644
--- a/drivers/media/rc/mceusb.c
+++ b/drivers/media/rc/mceusb.c
@@ -1070,7 +1070,7 @@ static int mceusb_set_timeout(struct rc_dev *dev, unsigned int timeout)
 	struct mceusb_dev *ir = dev->priv;
 	unsigned int units;
 
-	units = DIV_ROUND_CLOSEST(timeout, US_TO_NS(MCE_TIME_UNIT));
+	units = DIV_ROUND_CLOSEST(timeout, MCE_TIME_UNIT);
 
 	cmdbuf[2] = units >> 8;
 	cmdbuf[3] = units;
@@ -1196,7 +1196,7 @@ static void mceusb_handle_command(struct mceusb_dev *ir, u8 *buf_in)
 	switch (subcmd) {
 	/* 2-byte return value commands */
 	case MCE_RSP_EQIRTIMEOUT:
-		ir->rc->timeout = US_TO_NS((*hi << 8 | *lo) * MCE_TIME_UNIT);
+		ir->rc->timeout = (*hi << 8 | *lo) * MCE_TIME_UNIT;
 		break;
 	case MCE_RSP_EQIRNUMPORTS:
 		ir->num_txports = *hi;
@@ -1291,9 +1291,9 @@ static void mceusb_process_ir_data(struct mceusb_dev *ir, int buf_len)
 				ir->pulse_tunit += rawir.duration;
 				ir->pulse_count++;
 			}
-			rawir.duration *= US_TO_NS(MCE_TIME_UNIT);
+			rawir.duration *= MCE_TIME_UNIT;
 
-			dev_dbg(ir->dev, "Storing %s %u ns (%02x)",
+			dev_dbg(ir->dev, "Storing %s %u us (%02x)",
 				rawir.pulse ? "pulse" : "space",
 				rawir.duration,	ir->buf_in[i]);
 
@@ -1605,8 +1605,8 @@ static struct rc_dev *mceusb_init_rc_dev(struct mceusb_dev *ir)
 	rc->dev.parent = dev;
 	rc->priv = ir;
 	rc->allowed_protocols = RC_PROTO_BIT_ALL_IR_DECODER;
-	rc->min_timeout = US_TO_NS(MCE_TIME_UNIT);
-	rc->timeout = MS_TO_NS(100);
+	rc->min_timeout = MCE_TIME_UNIT;
+	rc->timeout = MS_TO_US(100);
 	if (!mceusb_model[ir->model].broken_irtimeout) {
 		rc->s_timeout = mceusb_set_timeout;
 		rc->max_timeout = 10 * IR_DEFAULT_TIMEOUT;
diff --git a/drivers/media/rc/meson-ir.c b/drivers/media/rc/meson-ir.c
index 51c6dd3406a0..dad55950dfc6 100644
--- a/drivers/media/rc/meson-ir.c
+++ b/drivers/media/rc/meson-ir.c
@@ -86,7 +86,7 @@ static irqreturn_t meson_ir_irq(int irqno, void *dev_id)
 
 	duration = readl_relaxed(ir->reg + IR_DEC_REG1);
 	duration = FIELD_GET(REG1_TIME_IV_MASK, duration);
-	rawir.duration = US_TO_NS(duration * MESON_TRATE);
+	rawir.duration = duration * MESON_TRATE;
 
 	status = readl_relaxed(ir->reg + IR_DEC_STATUS);
 	rawir.pulse = !!(status & STATUS_IR_DEC_IN);
@@ -133,7 +133,7 @@ static int meson_ir_probe(struct platform_device *pdev)
 	map_name = of_get_property(node, "linux,rc-map-name", NULL);
 	ir->rc->map_name = map_name ? map_name : RC_MAP_EMPTY;
 	ir->rc->allowed_protocols = RC_PROTO_BIT_ALL_IR_DECODER;
-	ir->rc->rx_resolution = US_TO_NS(MESON_TRATE);
+	ir->rc->rx_resolution = MESON_TRATE;
 	ir->rc->min_timeout = 1;
 	ir->rc->timeout = IR_DEFAULT_TIMEOUT;
 	ir->rc->max_timeout = 10 * IR_DEFAULT_TIMEOUT;
diff --git a/drivers/media/rc/mtk-cir.c b/drivers/media/rc/mtk-cir.c
index a0c94ab322c7..5051a5e5244b 100644
--- a/drivers/media/rc/mtk-cir.c
+++ b/drivers/media/rc/mtk-cir.c
@@ -52,8 +52,8 @@
 #define MTK_IR_END(v, p)	  ((v) == MTK_MAX_SAMPLES && (p) == 0)
 /* Number of registers to record the pulse width */
 #define MTK_CHKDATA_SZ		  17
-/* Sample period in ns */
-#define MTK_IR_SAMPLE		  46000
+/* Sample period in us */
+#define MTK_IR_SAMPLE		  46
 
 enum mtk_fields {
 	/* Register to setting software sampling period */
diff --git a/drivers/media/rc/nuvoton-cir.c b/drivers/media/rc/nuvoton-cir.c
index 52d246dc5b3d..8a37f083fe3d 100644
--- a/drivers/media/rc/nuvoton-cir.c
+++ b/drivers/media/rc/nuvoton-cir.c
@@ -653,8 +653,7 @@ static int nvt_ir_raw_set_wakeup_filter(struct rc_dev *dev,
 
 	/* Inspect the ir samples */
 	for (i = 0, count = 0; i < ret && count < WAKEUP_MAX_SIZE; ++i) {
-		/* NS to US */
-		val = DIV_ROUND_UP(raw[i].duration, 1000L) / SAMPLE_PERIOD;
+		val = raw[i].duration / SAMPLE_PERIOD;
 
 		/* Split too large values into several smaller ones */
 		while (val > 0 && count < WAKEUP_MAX_SIZE) {
@@ -721,8 +720,7 @@ static void nvt_process_rx_ir_data(struct nvt_dev *nvt)
 		sample = nvt->buf[i];
 
 		rawir.pulse = ((sample & BUF_PULSE_BIT) != 0);
-		rawir.duration = US_TO_NS((sample & BUF_LEN_MASK)
-					  * SAMPLE_PERIOD);
+		rawir.duration = (sample & BUF_LEN_MASK) * SAMPLE_PERIOD;
 
 		nvt_dbg("Storing %s with duration %d",
 			rawir.pulse ? "pulse" : "space", rawir.duration);
@@ -1000,9 +998,9 @@ static int nvt_probe(struct pnp_dev *pdev, const struct pnp_device_id *dev_id)
 	rdev->input_id.version = nvt->chip_minor;
 	rdev->driver_name = NVT_DRIVER_NAME;
 	rdev->map_name = RC_MAP_RC6_MCE;
-	rdev->timeout = MS_TO_NS(100);
+	rdev->timeout = MS_TO_US(100);
 	/* rx resolution is hardwired to 50us atm, 1, 25, 100 also possible */
-	rdev->rx_resolution = US_TO_NS(CIR_SAMPLE_PERIOD);
+	rdev->rx_resolution = CIR_SAMPLE_PERIOD;
 #if 0
 	rdev->min_timeout = XYZ;
 	rdev->max_timeout = XYZ;
diff --git a/drivers/media/rc/nuvoton-cir.h b/drivers/media/rc/nuvoton-cir.h
index 0cf301d1e163..ed7d93beaa28 100644
--- a/drivers/media/rc/nuvoton-cir.h
+++ b/drivers/media/rc/nuvoton-cir.h
@@ -94,7 +94,7 @@ struct nvt_dev {
 #define CIR_IOREG_LENGTH	0x0f
 
 /* RX limit length, 8 high bits for SLCH, 8 low bits for SLCL */
-#define CIR_RX_LIMIT_COUNT  (IR_DEFAULT_TIMEOUT / US_TO_NS(SAMPLE_PERIOD))
+#define CIR_RX_LIMIT_COUNT  (IR_DEFAULT_TIMEOUT / SAMPLE_PERIOD)
 
 /* CIR Regs */
 #define CIR_IRCON	0x00
diff --git a/drivers/media/rc/rc-core-priv.h b/drivers/media/rc/rc-core-priv.h
index 1eeab277a08e..a59c6c416a18 100644
--- a/drivers/media/rc/rc-core-priv.h
+++ b/drivers/media/rc/rc-core-priv.h
@@ -193,7 +193,6 @@ static inline bool is_timing_event(struct ir_raw_event ev)
 	return !ev.carrier_report && !ev.reset;
 }
 
-#define TO_US(duration)			DIV_ROUND_CLOSEST((duration), 1000)
 #define TO_STR(is_pulse)		((is_pulse) ? "pulse" : "space")
 
 /* functions for IR encoders */
diff --git a/drivers/media/rc/rc-ir-raw.c b/drivers/media/rc/rc-ir-raw.c
index 39dd46bbd0c1..b3c86b98f4f9 100644
--- a/drivers/media/rc/rc-ir-raw.c
+++ b/drivers/media/rc/rc-ir-raw.c
@@ -77,7 +77,7 @@ int ir_raw_event_store(struct rc_dev *dev, struct ir_raw_event *ev)
 		return -EINVAL;
 
 	dev_dbg(&dev->dev, "sample: (%05dus %s)\n",
-		TO_US(ev->duration), TO_STR(ev->pulse));
+		ev->duration, TO_STR(ev->pulse));
 
 	if (!kfifo_put(&dev->raw->kfifo, *ev)) {
 		dev_err(&dev->dev, "IR event FIFO is full!\n");
@@ -108,7 +108,7 @@ int ir_raw_event_store_edge(struct rc_dev *dev, bool pulse)
 		return -EINVAL;
 
 	now = ktime_get();
-	ev.duration = ktime_to_ns(ktime_sub(now, dev->raw->last_event));
+	ev.duration = ktime_to_us(ktime_sub(now, dev->raw->last_event));
 	ev.pulse = !pulse;
 
 	return ir_raw_event_store_with_timeout(dev, &ev);
@@ -275,7 +275,7 @@ static int change_protocol(struct rc_dev *dev, u64 *rc_proto)
 	if (timeout == 0)
 		timeout = IR_DEFAULT_TIMEOUT;
 	else
-		timeout += MS_TO_NS(10);
+		timeout += MS_TO_US(10);
 
 	if (timeout < dev->min_timeout)
 		timeout = dev->min_timeout;
@@ -564,14 +564,14 @@ static void ir_raw_edge_handle(struct timer_list *t)
 	if (ktime_to_ns(interval) >= dev->timeout) {
 		struct ir_raw_event ev = {
 			.timeout = true,
-			.duration = ktime_to_ns(interval)
+			.duration = ktime_to_us(interval)
 		};
 
 		ir_raw_event_store(dev, &ev);
 	} else {
 		mod_timer(&dev->raw->edge_handle,
-			  jiffies + nsecs_to_jiffies(dev->timeout -
-						     ktime_to_ns(interval)));
+			  jiffies + usecs_to_jiffies(dev->timeout -
+						     ktime_to_us(interval)));
 	}
 	spin_unlock_irqrestore(&dev->raw->edge_spinlock, flags);
 
diff --git a/drivers/media/rc/rc-loopback.c b/drivers/media/rc/rc-loopback.c
index ef8b83b707df..1ba3f96ffa7d 100644
--- a/drivers/media/rc/rc-loopback.c
+++ b/drivers/media/rc/rc-loopback.c
@@ -113,7 +113,7 @@ static int loop_tx_ir(struct rc_dev *dev, unsigned *txbuf, unsigned count)
 
 	for (i = 0; i < count; i++) {
 		rawir.pulse = i % 2 ? false : true;
-		rawir.duration = txbuf[i] * 1000;
+		rawir.duration = txbuf[i];
 		if (rawir.duration)
 			ir_raw_event_store_with_filter(dev, &rawir);
 	}
@@ -219,11 +219,11 @@ static int __init loop_init(void)
 	rc->allowed_protocols	= RC_PROTO_BIT_ALL_IR_DECODER;
 	rc->allowed_wakeup_protocols = RC_PROTO_BIT_ALL_IR_ENCODER;
 	rc->encode_wakeup	= true;
-	rc->timeout		= 100 * 1000 * 1000; /* 100 ms */
+	rc->timeout		= MS_TO_US(100); /* 100 ms */
 	rc->min_timeout		= 1;
 	rc->max_timeout		= UINT_MAX;
-	rc->rx_resolution	= 1000;
-	rc->tx_resolution	= 1000;
+	rc->rx_resolution	= 1;
+	rc->tx_resolution	= 1;
 	rc->s_tx_mask		= loop_set_tx_mask;
 	rc->s_tx_carrier	= loop_set_tx_carrier;
 	rc->s_tx_duty_cycle	= loop_set_tx_duty_cycle;
diff --git a/drivers/media/rc/redrat3.c b/drivers/media/rc/redrat3.c
index aad9526f3754..2cf3377ec63a 100644
--- a/drivers/media/rc/redrat3.c
+++ b/drivers/media/rc/redrat3.c
@@ -340,7 +340,7 @@ static void redrat3_process_ir_data(struct redrat3_dev *rr3)
 {
 	struct ir_raw_event rawir = {};
 	struct device *dev;
-	unsigned int i, sig_size, single_len, offset, val;
+	unsigned int i, sig_size, offset, val;
 	u32 mod_freq;
 
 	dev = rr3->dev;
@@ -361,7 +361,6 @@ static void redrat3_process_ir_data(struct redrat3_dev *rr3)
 	for (i = 0; i < sig_size; i++) {
 		offset = rr3->irdata.sigdata[i];
 		val = get_unaligned_be16(&rr3->irdata.lens[offset]);
-		single_len = redrat3_len_to_us(val);
 
 		/* we should always get pulse/space/pulse/space samples */
 		if (i % 2)
@@ -369,7 +368,7 @@ static void redrat3_process_ir_data(struct redrat3_dev *rr3)
 		else
 			rawir.pulse = true;
 
-		rawir.duration = US_TO_NS(single_len);
+		rawir.duration = redrat3_len_to_us(val);
 		/* cap the value to IR_MAX_DURATION */
 		rawir.duration = (rawir.duration > IR_MAX_DURATION) ?
 				 IR_MAX_DURATION : rawir.duration;
@@ -495,7 +494,7 @@ static u32 redrat3_get_timeout(struct redrat3_dev *rr3)
 	return timeout;
 }
 
-static int redrat3_set_timeout(struct rc_dev *rc_dev, unsigned int timeoutns)
+static int redrat3_set_timeout(struct rc_dev *rc_dev, unsigned int timeoutus)
 {
 	struct redrat3_dev *rr3 = rc_dev->priv;
 	struct usb_device *udev = rr3->udev;
@@ -507,7 +506,7 @@ static int redrat3_set_timeout(struct rc_dev *rc_dev, unsigned int timeoutns)
 	if (!timeout)
 		return -ENOMEM;
 
-	*timeout = cpu_to_be32(redrat3_us_to_len(timeoutns / 1000));
+	*timeout = cpu_to_be32(redrat3_us_to_len(timeoutus));
 	ret = usb_control_msg(udev, usb_sndctrlpipe(udev, 0), RR3_SET_IR_PARAM,
 		     USB_TYPE_VENDOR | USB_RECIP_DEVICE | USB_DIR_OUT,
 		     RR3_IR_IO_SIG_TIMEOUT, 0, timeout, sizeof(*timeout),
@@ -947,15 +946,15 @@ static struct rc_dev *redrat3_init_rc_dev(struct redrat3_dev *rr3)
 	rc->dev.parent = dev;
 	rc->priv = rr3;
 	rc->allowed_protocols = RC_PROTO_BIT_ALL_IR_DECODER;
-	rc->min_timeout = MS_TO_NS(RR3_RX_MIN_TIMEOUT);
-	rc->max_timeout = MS_TO_NS(RR3_RX_MAX_TIMEOUT);
-	rc->timeout = US_TO_NS(redrat3_get_timeout(rr3));
+	rc->min_timeout = MS_TO_US(RR3_RX_MIN_TIMEOUT);
+	rc->max_timeout = MS_TO_US(RR3_RX_MAX_TIMEOUT);
+	rc->timeout = redrat3_get_timeout(rr3);
 	rc->s_timeout = redrat3_set_timeout;
 	rc->tx_ir = redrat3_transmit_ir;
 	rc->s_tx_carrier = redrat3_set_tx_carrier;
 	rc->s_carrier_report = redrat3_wideband_receiver;
 	rc->driver_name = DRIVER_NAME;
-	rc->rx_resolution = US_TO_NS(2);
+	rc->rx_resolution = 2;
 	rc->map_name = RC_MAP_HAUPPAUGE;
 
 	ret = rc_register_device(rc);
diff --git a/drivers/media/rc/serial_ir.c b/drivers/media/rc/serial_ir.c
index d77507ba0fb5..a6895e04ac1f 100644
--- a/drivers/media/rc/serial_ir.c
+++ b/drivers/media/rc/serial_ir.c
@@ -269,7 +269,7 @@ static void frbwrite(unsigned int l, bool is_pulse)
 
 	if (ptr > 0 && is_pulse) {
 		pulse += l;
-		if (pulse > 250000) {
+		if (pulse > 250) {
 			ev.duration = space;
 			ev.pulse = false;
 			ir_raw_event_store_with_filter(serial_ir.rcdev, &ev);
@@ -283,13 +283,13 @@ static void frbwrite(unsigned int l, bool is_pulse)
 	}
 	if (!is_pulse) {
 		if (ptr == 0) {
-			if (l > 20000000) {
+			if (l > 20000) {
 				space = l;
 				ptr++;
 				return;
 			}
 		} else {
-			if (l > 20000000) {
+			if (l > 20000) {
 				space += pulse;
 				if (space > IR_MAX_DURATION)
 					space = IR_MAX_DURATION;
@@ -376,7 +376,7 @@ static irqreturn_t serial_ir_irq_handler(int i, void *blah)
 					sense = sense ? 0 : 1;
 				}
 			} else {
-				data = ktime_to_ns(delkt);
+				data = ktime_to_us(delkt);
 			}
 			frbwrite(data, !(dcd ^ sense));
 			serial_ir.lastkt = kt;
@@ -528,7 +528,7 @@ static int serial_ir_probe(struct platform_device *dev)
 	rcdev->min_timeout = 1;
 	rcdev->timeout = IR_DEFAULT_TIMEOUT;
 	rcdev->max_timeout = 10 * IR_DEFAULT_TIMEOUT;
-	rcdev->rx_resolution = 250000;
+	rcdev->rx_resolution = 250;
 
 	serial_ir.rcdev = rcdev;
 
diff --git a/drivers/media/rc/sir_ir.c b/drivers/media/rc/sir_ir.c
index 80b3a6736dbd..6ec96dc34586 100644
--- a/drivers/media/rc/sir_ir.c
+++ b/drivers/media/rc/sir_ir.c
@@ -110,7 +110,7 @@ static void add_read_queue(int flag, unsigned long val)
 	} else {
 		val += TIME_CONST / 2;
 	}
-	ev.duration = US_TO_NS(val);
+	ev.duration = val;
 
 	ir_raw_event_store_with_filter(rcdev, &ev);
 }
diff --git a/drivers/media/rc/st_rc.c b/drivers/media/rc/st_rc.c
index 1dc4e2e33705..3237fef5d502 100644
--- a/drivers/media/rc/st_rc.c
+++ b/drivers/media/rc/st_rc.c
@@ -134,12 +134,12 @@ static irqreturn_t st_rc_rx_interrupt(int irq, void *data)
 				mark /= dev->sample_div;
 			}
 
-			ev.duration = US_TO_NS(mark);
+			ev.duration = mark;
 			ev.pulse = true;
 			ir_raw_event_store(dev->rdev, &ev);
 
 			if (!last_symbol) {
-				ev.duration = US_TO_NS(symbol);
+				ev.duration = symbol;
 				ev.pulse = false;
 				ir_raw_event_store(dev->rdev, &ev);
 			} else  {
@@ -292,7 +292,7 @@ static int st_rc_probe(struct platform_device *pdev)
 	rdev->allowed_protocols = RC_PROTO_BIT_ALL_IR_DECODER;
 	/* rx sampling rate is 10Mhz */
 	rdev->rx_resolution = 100;
-	rdev->timeout = US_TO_NS(MAX_SYMB_TIME);
+	rdev->timeout = MAX_SYMB_TIME;
 	rdev->priv = rc_dev;
 	rdev->open = st_rc_open;
 	rdev->close = st_rc_close;
diff --git a/drivers/media/rc/streamzap.c b/drivers/media/rc/streamzap.c
index 79a41fc7161c..9f3cd9fb6b6e 100644
--- a/drivers/media/rc/streamzap.c
+++ b/drivers/media/rc/streamzap.c
@@ -137,7 +137,6 @@ static void sz_push_full_pulse(struct streamzap_ir *sz,
 		} else {
 			rawir.duration = delta;
 			rawir.duration -= sz->sum;
-			rawir.duration = US_TO_NS(rawir.duration);
 			rawir.duration = (rawir.duration > IR_MAX_DURATION) ?
 					 IR_MAX_DURATION : rawir.duration;
 		}
@@ -151,7 +150,6 @@ static void sz_push_full_pulse(struct streamzap_ir *sz,
 	rawir.duration = ((int) value) * SZ_RESOLUTION;
 	rawir.duration += SZ_RESOLUTION / 2;
 	sz->sum += rawir.duration;
-	rawir.duration = US_TO_NS(rawir.duration);
 	rawir.duration = (rawir.duration > IR_MAX_DURATION) ?
 			 IR_MAX_DURATION : rawir.duration;
 	sz_push(sz, rawir);
@@ -172,7 +170,6 @@ static void sz_push_full_space(struct streamzap_ir *sz,
 	rawir.duration = ((int) value) * SZ_RESOLUTION;
 	rawir.duration += SZ_RESOLUTION / 2;
 	sz->sum += rawir.duration;
-	rawir.duration = US_TO_NS(rawir.duration);
 	sz_push(sz, rawir);
 }
 
@@ -403,13 +400,12 @@ static int streamzap_probe(struct usb_interface *intf,
 	sz->decoder_state = PulseSpace;
 	/* FIXME: don't yet have a way to set this */
 	sz->timeout_enabled = true;
-	sz->rdev->timeout = ((US_TO_NS(SZ_TIMEOUT * SZ_RESOLUTION) &
-				IR_MAX_DURATION) | 0x03000000);
+	sz->rdev->timeout = SZ_TIMEOUT * SZ_RESOLUTION;
 	#if 0
 	/* not yet supported, depends on patches from maxim */
 	/* see also: LIRC_GET_REC_RESOLUTION and LIRC_SET_REC_TIMEOUT */
-	sz->min_timeout = US_TO_NS(SZ_TIMEOUT * SZ_RESOLUTION);
-	sz->max_timeout = US_TO_NS(SZ_TIMEOUT * SZ_RESOLUTION);
+	sz->min_timeout = SZ_TIMEOUT * SZ_RESOLUTION;
+	sz->max_timeout = SZ_TIMEOUT * SZ_RESOLUTION;
 	#endif
 
 	sz->signal_start = ktime_get_real();
diff --git a/drivers/media/rc/sunxi-cir.c b/drivers/media/rc/sunxi-cir.c
index e222b4c98be4..ddee6ee37bab 100644
--- a/drivers/media/rc/sunxi-cir.c
+++ b/drivers/media/rc/sunxi-cir.c
@@ -241,8 +241,8 @@ static int sunxi_ir_probe(struct platform_device *pdev)
 	ir->rc->dev.parent = dev;
 	ir->rc->allowed_protocols = RC_PROTO_BIT_ALL_IR_DECODER;
 	/* Frequency after IR internal divider with sample period in ns */
-	ir->rc->rx_resolution = (1000000000ul / (b_clk_freq / 64));
-	ir->rc->timeout = MS_TO_NS(SUNXI_IR_TIMEOUT);
+	ir->rc->rx_resolution = (USEC_PER_SEC / (b_clk_freq / 64));
+	ir->rc->timeout = MS_TO_US(SUNXI_IR_TIMEOUT);
 	ir->rc->driver_name = SUNXI_IR_DEV;
 
 	ret = rc_register_device(ir->rc);
diff --git a/drivers/media/rc/ttusbir.c b/drivers/media/rc/ttusbir.c
index 011a8b620d86..629787d53ee1 100644
--- a/drivers/media/rc/ttusbir.c
+++ b/drivers/media/rc/ttusbir.c
@@ -20,8 +20,8 @@
  * messages per second (!), whether IR is idle or not.
  */
 #define NUM_URBS	4
-#define NS_PER_BYTE	62500
-#define NS_PER_BIT	(NS_PER_BYTE/8)
+#define US_PER_BYTE	62
+#define US_PER_BIT	(US_PER_BYTE / 8)
 
 struct ttusbir {
 	struct rc_dev *rc;
@@ -117,13 +117,13 @@ static void ttusbir_process_ir_data(struct ttusbir *tt, uint8_t *buf)
 		switch (v) {
 		case 0xfe:
 			rawir.pulse = false;
-			rawir.duration = NS_PER_BYTE;
+			rawir.duration = US_PER_BYTE;
 			if (ir_raw_event_store_with_filter(tt->rc, &rawir))
 				event = true;
 			break;
 		case 0:
 			rawir.pulse = true;
-			rawir.duration = NS_PER_BYTE;
+			rawir.duration = US_PER_BYTE;
 			if (ir_raw_event_store_with_filter(tt->rc, &rawir))
 				event = true;
 			break;
@@ -137,12 +137,12 @@ static void ttusbir_process_ir_data(struct ttusbir *tt, uint8_t *buf)
 				rawir.pulse = false;
 			}
 
-			rawir.duration = NS_PER_BIT * (8 - b);
+			rawir.duration = US_PER_BIT * (8 - b);
 			if (ir_raw_event_store_with_filter(tt->rc, &rawir))
 				event = true;
 
 			rawir.pulse = !rawir.pulse;
-			rawir.duration = NS_PER_BIT * b;
+			rawir.duration = US_PER_BIT * b;
 			if (ir_raw_event_store_with_filter(tt->rc, &rawir))
 				event = true;
 			break;
@@ -311,10 +311,10 @@ static int ttusbir_probe(struct usb_interface *intf,
 	rc->max_timeout = 10 * IR_DEFAULT_TIMEOUT;
 
 	/*
-	 * The precision is NS_PER_BIT, but since every 8th bit can be
-	 * overwritten with garbage the accuracy is at best 2 * NS_PER_BIT.
+	 * The precision is US_PER_BIT, but since every 8th bit can be
+	 * overwritten with garbage the accuracy is at best 2 * US_PER_BIT.
 	 */
-	rc->rx_resolution = NS_PER_BIT;
+	rc->rx_resolution = 2 * US_PER_BIT;
 
 	ret = rc_register_device(rc);
 	if (ret) {
diff --git a/drivers/media/rc/winbond-cir.c b/drivers/media/rc/winbond-cir.c
index 630e376d3688..aed23ca0fa6c 100644
--- a/drivers/media/rc/winbond-cir.c
+++ b/drivers/media/rc/winbond-cir.c
@@ -354,7 +354,6 @@ wbcir_irq_rx(struct wbcir_data *data, struct pnp_dev *device)
 {
 	u8 irdata;
 	struct ir_raw_event rawir = {};
-	unsigned duration;
 
 	/* Since RXHDLEV is set, at least 8 bytes are in the FIFO */
 	while (inb(data->sbase + WBCIR_REG_SP3_LSR) & WBCIR_RX_AVAIL) {
@@ -362,13 +361,12 @@ wbcir_irq_rx(struct wbcir_data *data, struct pnp_dev *device)
 		if (data->rxstate == WBCIR_RXSTATE_ERROR)
 			continue;
 
-		duration = ((irdata & 0x7F) + 1) *
+		rawir.duration = ((irdata & 0x7F) + 1) *
 			(data->carrier_report_enabled ? 2 : 10);
 		rawir.pulse = irdata & 0x80 ? false : true;
-		rawir.duration = US_TO_NS(duration);
 
 		if (rawir.pulse)
-			data->pulse_duration += duration;
+			data->pulse_duration += rawir.duration;
 
 		ir_raw_event_store_with_filter(data->dev, &rawir);
 	}
@@ -519,7 +517,7 @@ wbcir_set_carrier_report(struct rc_dev *dev, int enable)
 
 	/* Set a higher sampling resolution if carrier reports are enabled */
 	wbcir_select_bank(data, WBCIR_BANK_2);
-	data->dev->rx_resolution = US_TO_NS(enable ? 2 : 10);
+	data->dev->rx_resolution = enable ? 2 : 10;
 	outb(enable ? 0x03 : 0x0f, data->sbase + WBCIR_REG_SP3_BGDL);
 	outb(0x00, data->sbase + WBCIR_REG_SP3_BGDH);
 
@@ -1076,7 +1074,7 @@ wbcir_probe(struct pnp_dev *device, const struct pnp_device_id *dev_id)
 	data->dev->min_timeout = 1;
 	data->dev->timeout = IR_DEFAULT_TIMEOUT;
 	data->dev->max_timeout = 10 * IR_DEFAULT_TIMEOUT;
-	data->dev->rx_resolution = US_TO_NS(2);
+	data->dev->rx_resolution = 2;
 	data->dev->allowed_protocols = RC_PROTO_BIT_ALL_IR_DECODER;
 	data->dev->allowed_wakeup_protocols = RC_PROTO_BIT_NEC |
 		RC_PROTO_BIT_NECX | RC_PROTO_BIT_NEC32 | RC_PROTO_BIT_RC5 |
diff --git a/drivers/media/rc/xbox_remote.c b/drivers/media/rc/xbox_remote.c
index 4a3f2cc4ef18..98d0b43608ad 100644
--- a/drivers/media/rc/xbox_remote.c
+++ b/drivers/media/rc/xbox_remote.c
@@ -157,7 +157,7 @@ static void xbox_remote_rc_init(struct xbox_remote *xbox_remote)
 	rdev->device_name = xbox_remote->rc_name;
 	rdev->input_phys = xbox_remote->rc_phys;
 
-	rdev->timeout = MS_TO_NS(10);
+	rdev->timeout = MS_TO_US(10);
 
 	usb_to_input_id(xbox_remote->udev, &rdev->input_id);
 	rdev->dev.parent = &xbox_remote->interface->dev;
diff --git a/drivers/media/usb/au0828/au0828-input.c b/drivers/media/usb/au0828/au0828-input.c
index 4befa920246c..3d3368202cd0 100644
--- a/drivers/media/usb/au0828/au0828-input.c
+++ b/drivers/media/usb/au0828/au0828-input.c
@@ -104,11 +104,11 @@ static int au8522_rc_andor(struct au0828_rc *ir, u16 reg, u8 mask, u8 value)
 
 /* Remote Controller time units */
 
-#define AU8522_UNIT		200000 /* ns */
-#define NEC_START_SPACE		(4500000 / AU8522_UNIT)
-#define NEC_START_PULSE		(562500 * 16)
+#define AU8522_UNIT		200 /* us */
+#define NEC_START_SPACE		(4500 / AU8522_UNIT)
+#define NEC_START_PULSE		(563 * 16)
 #define RC5_START_SPACE		(4 * AU8522_UNIT)
-#define RC5_START_PULSE		888888
+#define RC5_START_PULSE		889
 
 static int au0828_get_key_au8522(struct au0828_rc *ir)
 {
diff --git a/drivers/media/usb/dvb-usb-v2/rtl28xxu.c b/drivers/media/usb/dvb-usb-v2/rtl28xxu.c
index 2080f6ef4be1..91460e4d0c30 100644
--- a/drivers/media/usb/dvb-usb-v2/rtl28xxu.c
+++ b/drivers/media/usb/dvb-usb-v2/rtl28xxu.c
@@ -1781,7 +1781,7 @@ static int rtl2832u_rc_query(struct dvb_usb_device *d)
 	/* pass data to Kernel IR decoder */
 	for (i = 0; i < len; i++) {
 		ev.pulse = buf[i] >> 7;
-		ev.duration = 50800 * (buf[i] & 0x7f);
+		ev.duration = 51 * (buf[i] & 0x7f);
 		ir_raw_event_store_with_filter(d->rc_dev, &ev);
 	}
 
@@ -1809,7 +1809,7 @@ static int rtl2832u_get_rc_config(struct dvb_usb_device *d,
 	rc->query = rtl2832u_rc_query;
 	rc->interval = 200;
 	/* we program idle len to 0xc0, set timeout to one less */
-	rc->timeout = 0xbf * 50800;
+	rc->timeout = 0xbf * 51;
 
 	return 0;
 }
diff --git a/drivers/media/usb/dvb-usb/technisat-usb2.c b/drivers/media/usb/dvb-usb/technisat-usb2.c
index f172120db2aa..a9ed26ce1be6 100644
--- a/drivers/media/usb/dvb-usb/technisat-usb2.c
+++ b/drivers/media/usb/dvb-usb/technisat-usb2.c
@@ -656,14 +656,14 @@ static int technisat_usb2_get_ir(struct dvb_usb_device *d)
 	for (i = 1; i < ARRAY_SIZE(state->buf); i++) {
 		if (buf[i] == 0xff) {
 			ev.pulse = 0;
-			ev.duration = 888888*2;
+			ev.duration = 889 * 2;
 			ir_raw_event_store(d->rc_dev, &ev);
 			break;
 		}
 
 		ev.pulse = !ev.pulse;
 		ev.duration = (buf[i] * FIRMWARE_CLOCK_DIVISOR *
-			       FIRMWARE_CLOCK_TICK) / 1000;
+			       FIRMWARE_CLOCK_TICK) / (1000 * 1000);
 		ir_raw_event_store(d->rc_dev, &ev);
 	}
 
diff --git a/include/media/rc-core.h b/include/media/rc-core.h
index d3f85df64bb2..a1019c4ab5e8 100644
--- a/include/media/rc-core.h
+++ b/include/media/rc-core.h
@@ -128,8 +128,8 @@ struct lirc_fh {
  * @timeout: optional time after which device stops sending data
  * @min_timeout: minimum timeout supported by device
  * @max_timeout: maximum timeout supported by device
- * @rx_resolution : resolution (in ns) of input sampler
- * @tx_resolution: resolution (in ns) of output sampler
+ * @rx_resolution : resolution (in us) of input sampler
+ * @tx_resolution: resolution (in us) of output sampler
  * @lirc_dev: lirc device
  * @lirc_cdev: lirc char cdev
  * @gap_start: time when gap starts
@@ -157,7 +157,7 @@ struct lirc_fh {
  * @s_wakeup_filter: set the wakeup scancode filter. If the mask is zero
  *	then wakeup should be disabled. wakeup_protocol will be set to
  *	a valid protocol if mask is nonzero.
- * @s_timeout: set hardware timeout in ns
+ * @s_timeout: set hardware timeout in us
  */
 struct rc_dev {
 	struct device			dev;
@@ -309,11 +309,10 @@ struct ir_raw_event {
 	unsigned                carrier_report:1;
 };
 
-#define IR_DEFAULT_TIMEOUT	MS_TO_NS(125)
-#define IR_MAX_DURATION         500000000	/* 500 ms */
 #define US_TO_NS(usec)		((usec) * 1000)
 #define MS_TO_US(msec)		((msec) * 1000)
-#define MS_TO_NS(msec)		((msec) * 1000 * 1000)
+#define IR_MAX_DURATION		MS_TO_US(500)
+#define IR_DEFAULT_TIMEOUT	MS_TO_US(125)
 
 void ir_raw_event_handle(struct rc_dev *dev);
 int ir_raw_event_store(struct rc_dev *dev, struct ir_raw_event *ev);
-- 
2.26.2

