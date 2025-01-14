Return-Path: <linux-media+bounces-24730-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A482A1115C
	for <lists+linux-media@lfdr.de>; Tue, 14 Jan 2025 20:46:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4D77D1888126
	for <lists+linux-media@lfdr.de>; Tue, 14 Jan 2025 19:47:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DB3C20ADE5;
	Tue, 14 Jan 2025 19:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BW5Cjdrt"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 539542080D0
	for <linux-media@vger.kernel.org>; Tue, 14 Jan 2025 19:46:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736883998; cv=none; b=hMxwA0ElCtqo1lj1j7tEgbWHQTVMGosfhyJT/OJ5KqXVT14jZMboRs0XPqy4zIvl+ConZanSwfbHfDlgfSn4Ak7P+qixoNaaVcd0nbdUIU6JUPN0Jn8eR72KjBtAY85JpT9y1sWaFwpNgVjlBvhd+2D8fmEiQPvFT2iB2D1YU58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736883998; c=relaxed/simple;
	bh=mtlbO5pD3OH1lj6OMF21FLzICL+OBIxNoR/be1QT+nA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gDS+FH67TxPZl8zFdown3H01WrNqOgtoHdxMa3/JS4Jvf0KOb/xZLQ1yvsBtFrz8vveTJ25BtZny6OYGmJgK6xLMqo+/r7z0a+41whTGqEGyZqyWh+HH4102f4O+M90nj/7hbvWAtY/ovI3CV+jVVDgluC1csehIrF7t1EgreNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BW5Cjdrt; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-385dc85496dso290733f8f.3
        for <linux-media@vger.kernel.org>; Tue, 14 Jan 2025 11:46:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736883994; x=1737488794; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vxDB2Wb8JUamL19cl9GDthbDMznKMMo1W7TNxgSukcs=;
        b=BW5CjdrtYVwLrZj23QrSV2+Gtcg4LbG+OJgIKLRSqdPdPU5IvwHIhqTOLGJkZcmw9H
         aXUW1DRUxVFBd4HE7wTQqDscbiWlhOM5tQGz/zjMU/kVSm/R1inLws4Z74HqI5K5SBxw
         grXb6DZupsnWgNRLJ4Hz0A+MchSke5s6s3UPbjrrHZMJQ4dy4Te5QCQCkb8Lxrq2SLof
         ybnl88QMlHHg+USzK0lXuaGiH9bZyx5fcFz/M+QmdGQ9ck5ksGop/DNAztgQaK5P2JSh
         eR7uEAVAUXPefZq31uI5LkpgLVa1R/NS3ewN4bk1kYVn/KrrT3tsNT2LkpIiFhLfiTO0
         tstg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736883994; x=1737488794;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vxDB2Wb8JUamL19cl9GDthbDMznKMMo1W7TNxgSukcs=;
        b=KlrXy02+DjOWOG6nqnd9I9hjuwGHL5+wTa2Art3wvYhwhjBX+/dR6LfpvjHyom3fjl
         /dFP0jCm+p3PAaUZOP8V4punQ5FmWqZl+K/71HwQRpG3MCvo8ze+ncXCRGyD+i75rOP5
         Cimz+cYa0OtRo9/aw0VRYNH/Nm9KI6+kJ64TDWgA2tZW3u7Cfdlc142/G9/FvH2knJPl
         10ENdEP2DmSSFT0XStk1Il9bDp4wmAm95ipH3vt/BRMKSEESJGrcLWYwo0ddXUT63se2
         YwdchN8h8IATtX8mwsGGw7EdbuF/Iysczu+AUCRF1QJBhmH+G0ms99zpsOrJBfkMh9WP
         hyYA==
X-Gm-Message-State: AOJu0YxVxrRmngO2V2iUqJCk9CUxAmQVkkKt6jNESRUqdUYpsF9cZHWF
	z1+H1T/XMq/nVIkagsc0L3cPjHwispWAliK9VsLMqtxAvTCt+3Vka8Mtap5/CWg=
X-Gm-Gg: ASbGncvj1xvu5EZ5rFkGWKgPbANL4AM2TpCEODv5ySGKyhnzJy9R1gWc6QduBxG8gab
	DJpVUUjJ7UB/C918aPp+BrvI8NeNbrq0xk4onjUKDQc4KPOg2avC93ppYt8b42864SC0OTUz1Hm
	YsHUpYswOqebZ1dhMRzgSwBWN2FXXZyP2ORtv3V5B36IJX1L70djXS8pb3xitroJDZtAn+/7zS0
	//BK/RNW7gMyMnhKUW/A3Cfj3HF/rJTLgsoM6+PIy3LDc/r/TTUlcoaCCUwGXWo/Tk5au+n
X-Google-Smtp-Source: AGHT+IER13mKPcCGVKuCMptsL9LazocaDj6jSmqEiz+kIc/LNX7GIxUpkepPagRdTlxs1DatTTSgcg==
X-Received: by 2002:adf:b607:0:b0:385:e9ba:ace3 with SMTP id ffacd0b85a97d-38a872dc7b1mr7039415f8f.1.1736883994457;
        Tue, 14 Jan 2025 11:46:34 -0800 (PST)
Received: from [127.0.1.1] ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436e9e37c2esm184337515e9.28.2025.01.14.11.46.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 11:46:33 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 14 Jan 2025 20:46:17 +0100
Subject: [PATCH 1/6] media: Use str_enable_disable-like helpers
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250114-str-enable-disable-media-v1-1-9316270aa65f@linaro.org>
References: <20250114-str-enable-disable-media-v1-0-9316270aa65f@linaro.org>
In-Reply-To: <20250114-str-enable-disable-media-v1-0-9316270aa65f@linaro.org>
To: Hans Verkuil <hverkuil@xs4all.nl>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Tomasz Figa <tfiga@chromium.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Maxim Levitsky <maximlevitsky@gmail.com>, Sean Young <sean@mess.org>, 
 Olli Salonen <olli.salonen@iki.fi>, Abylay Ospan <aospan@amazon.com>, 
 Jemma Denson <jdenson@gmail.com>, 
 Patrick Boettcher <patrick.boettcher@posteo.de>, 
 Jacopo Mondi <jacopo+renesas@jmondi.org>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
 Tim Harvey <tharvey@gateworks.com>, Andy Walls <awalls@md.metrocast.net>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Bingbu Cao <bingbu.cao@intel.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=11914;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=mtlbO5pD3OH1lj6OMF21FLzICL+OBIxNoR/be1QT+nA=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnhr8PWzf8AUgl92d11XYLjAMWKfYLc6TOqLp97
 cp7f+c1SvCJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ4a/DwAKCRDBN2bmhouD
 1zcZD/9AmyRI+aMgg+IZ1AfpEUHi9nIxVVnmut42zvTqRsfX7tDvjkNx6DMgTcpz0EcCBCUoU/A
 hRedawppay9QdgHE7vxgwENIa8mHj/a/WV3e/R7RxZ2d0tm7CmuoxUwSSja9EEikfALJzNbJvK3
 wdUYaH8O7os7SD8ojy/xHm/HWi/733sPKhM/jgVHDDGwms3DWl1AS+NVXIXQM2GwVIj3cnPSSK0
 mJIujjUOKEC2IfNGQU1RP0hL04KDL3Ec9l3S3nDwXEo6QcRVmKXa8loZplHMt9HQlF9t2CPQGDV
 ZUMQiNBi4EKmfAIYNnGmFueHgIIoKt0RB4wEwe4QuvlKI5eLoIzqFg/ot5O5QLPYOrwbU8MVfh1
 PMAKA2Hu2AF48zQMrNKAgWol6+NFt7dYIiVKeqQ0OSvFn7JojMjj33dMRa7wxCX5gQ0n7OxMJBn
 NMMoMWThN9pUgxUPMtVKk0KvlejKDD9ZfLwLz7MGYbm+GYfce3HR25l/uxuXD57OI4WRiiU4114
 olebe44PwuVbDIEo3Xv+C15Usv5N2VKgiilLFoNXHpC5XzzU5Lb+SojiCzSajVklCTMH4QogK/f
 biEEtLpQxpckgfVcDHpnnqSjkupaGc3S+IFcGhxK08SyJLG7Ifa+DTvP7tvBHHuAz7cgqWRvKGX
 HIUGUHIkY5LWnFA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Replace ternary (condition ? "enable" : "disable") syntax with helpers
from string_choices.h because:
1. Simple function call with one argument is easier to read.  Ternary
   operator has three arguments and with wrapping might lead to quite
   long code.
2. Is slightly shorter thus also easier to read.
3. It brings uniformity in the text - same string.
4. Allows deduping by the linker, which results in a smaller binary
   file.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/media/cec/platform/cec-gpio/cec-gpio.c  |  5 +++--
 drivers/media/cec/usb/pulse8/pulse8-cec.c       |  5 +++--
 drivers/media/common/b2c2/flexcop-hw-filter.c   |  5 +++--
 drivers/media/common/siano/sms-cards.c          |  3 ++-
 drivers/media/common/videobuf2/videobuf2-core.c |  6 ++++--
 drivers/media/rc/ene_ir.c                       |  3 ++-
 drivers/media/rc/mceusb.c                       |  3 ++-
 drivers/media/rc/serial_ir.c                    |  5 +++--
 drivers/media/tuners/tda18250.c                 |  3 ++-
 drivers/media/tuners/tda9887.c                  | 11 ++++++-----
 10 files changed, 30 insertions(+), 19 deletions(-)

diff --git a/drivers/media/cec/platform/cec-gpio/cec-gpio.c b/drivers/media/cec/platform/cec-gpio/cec-gpio.c
index 50cdc557c9430a2625ae615a1f469d2b2b02e6be..c75c48c07b7fb42254ba82abaab5f3602ef6cd97 100644
--- a/drivers/media/cec/platform/cec-gpio/cec-gpio.c
+++ b/drivers/media/cec/platform/cec-gpio/cec-gpio.c
@@ -9,6 +9,7 @@
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/seq_file.h>
+#include <linux/string_choices.h>
 #include <media/cec-notifier.h>
 #include <media/cec-pin.h>
 
@@ -136,10 +137,10 @@ static void cec_gpio_status(struct cec_adapter *adap, struct seq_file *file)
 	seq_printf(file, "using irq: %d\n", cec->cec_irq);
 	if (cec->hpd_gpio)
 		seq_printf(file, "hpd: %s\n",
-			   cec->hpd_is_high ? "high" : "low");
+			   str_high_low(cec->hpd_is_high));
 	if (cec->v5_gpio)
 		seq_printf(file, "5V: %s\n",
-			   cec->v5_is_high ? "high" : "low");
+			   str_high_low(cec->v5_is_high));
 }
 
 static int cec_gpio_read_hpd(struct cec_adapter *adap)
diff --git a/drivers/media/cec/usb/pulse8/pulse8-cec.c b/drivers/media/cec/usb/pulse8/pulse8-cec.c
index 171366fe35443b19f4791ffada46c83ed5e4fe06..c0b48b526cd7c86d046386184a036fbadde51306 100644
--- a/drivers/media/cec/usb/pulse8/pulse8-cec.c
+++ b/drivers/media/cec/usb/pulse8/pulse8-cec.c
@@ -36,6 +36,7 @@
 #include <linux/workqueue.h>
 #include <linux/serio.h>
 #include <linux/slab.h>
+#include <linux/string_choices.h>
 #include <linux/time.h>
 #include <linux/delay.h>
 
@@ -695,14 +696,14 @@ static int pulse8_setup(struct pulse8 *pulse8, struct serio *serio,
 		return err;
 	pulse8->autonomous = data[0];
 	dev_dbg(pulse8->dev, "Autonomous mode: %s",
-		data[0] ? "on" : "off");
+		str_on_off(data[0]));
 
 	if (pulse8->vers >= 10) {
 		cmd[0] = MSGCODE_GET_AUTO_POWER_ON;
 		err = pulse8_send_and_wait(pulse8, cmd, 1, cmd[0], 1);
 		if (!err)
 			dev_dbg(pulse8->dev, "Auto Power On: %s",
-				data[0] ? "on" : "off");
+				str_on_off(data[0]));
 	}
 
 	cmd[0] = MSGCODE_GET_DEVICE_TYPE;
diff --git a/drivers/media/common/b2c2/flexcop-hw-filter.c b/drivers/media/common/b2c2/flexcop-hw-filter.c
index c5a3345c99e9ee4b39dfe453eeaa5f59eae93cfa..f0969af79311181404811857bf209a45b9014cd5 100644
--- a/drivers/media/common/b2c2/flexcop-hw-filter.c
+++ b/drivers/media/common/b2c2/flexcop-hw-filter.c
@@ -5,11 +5,12 @@
  * see flexcop.c for copyright information
  */
 #include "flexcop.h"
+#include <linux/string_choices.h>
 
 static void flexcop_rcv_data_ctrl(struct flexcop_device *fc, int onoff)
 {
 	flexcop_set_ibi_value(ctrl_208, Rcv_Data_sig, onoff);
-	deb_ts("rcv_data is now: '%s'\n", onoff ? "on" : "off");
+	deb_ts("rcv_data is now: '%s'\n", str_on_off(onoff));
 }
 
 void flexcop_smc_ctrl(struct flexcop_device *fc, int onoff)
@@ -116,7 +117,7 @@ static void flexcop_pid_control(struct flexcop_device *fc,
 		return;
 
 	deb_ts("setting pid: %5d %04x at index %d '%s'\n",
-			pid, pid, index, onoff ? "on" : "off");
+			pid, pid, index, str_on_off(onoff));
 
 	/* First 6 can be buggy - skip over them if option set */
 	if (fc->skip_6_hw_pid_filter)
diff --git a/drivers/media/common/siano/sms-cards.c b/drivers/media/common/siano/sms-cards.c
index d4a116ab6c888609800aeedf9a6c4e268205f3a3..e9aa95233ff178c126cc1e621ab2e096637cb27c 100644
--- a/drivers/media/common/siano/sms-cards.c
+++ b/drivers/media/common/siano/sms-cards.c
@@ -8,6 +8,7 @@
 #include "sms-cards.h"
 #include "smsir.h"
 #include <linux/module.h>
+#include <linux/string_choices.h>
 
 static struct sms_board sms_boards[] = {
 	[SMS_BOARD_UNKNOWN] = {
@@ -326,7 +327,7 @@ int sms_board_lna_control(struct smscore_device_t *coredev, int onoff)
 	int board_id = smscore_get_board_id(coredev);
 	struct sms_board *board = sms_get_board(board_id);
 
-	pr_debug("%s: LNA %s\n", __func__, onoff ? "enabled" : "disabled");
+	pr_debug("%s: LNA %s\n", __func__, str_enabled_disabled(onoff));
 
 	switch (board_id) {
 	case SMS1XXX_BOARD_HAUPPAUGE_TIGER_MINICARD_R2:
diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/media/common/videobuf2/videobuf2-core.c
index 2df566f409b65eb99fa7fbe308b8e3afe1bdcbca..19fa5c133c28db9c3766aded8e123a621a34ff88 100644
--- a/drivers/media/common/videobuf2/videobuf2-core.c
+++ b/drivers/media/common/videobuf2/videobuf2-core.c
@@ -23,6 +23,7 @@
 #include <linux/poll.h>
 #include <linux/slab.h>
 #include <linux/sched.h>
+#include <linux/string_choices.h>
 #include <linux/freezer.h>
 #include <linux/kthread.h>
 
@@ -2874,7 +2875,8 @@ static int __vb2_init_fileio(struct vb2_queue *q, int read)
 		return -EBUSY;
 
 	dprintk(q, 3, "setting up file io: mode %s, count %d, read_once %d, write_immediately %d\n",
-		(read) ? "read" : "write", q->min_reqbufs_allocation, q->fileio_read_once,
+		str_read_write(read), q->min_reqbufs_allocation,
+		q->fileio_read_once,
 		q->fileio_write_immediately);
 
 	fileio = kzalloc(sizeof(*fileio), GFP_KERNEL);
@@ -3022,7 +3024,7 @@ static size_t __vb2_perform_fileio(struct vb2_queue *q, char __user *data, size_
 	int ret;
 
 	dprintk(q, 3, "mode %s, offset %ld, count %zd, %sblocking\n",
-		read ? "read" : "write", (long)*ppos, count,
+		str_read_write(read), (long)*ppos, count,
 		nonblock ? "non" : "");
 
 	if (!data)
diff --git a/drivers/media/rc/ene_ir.c b/drivers/media/rc/ene_ir.c
index 67722e2e47ff78e504c55054480f0619e050f093..90bee860a8a13dda52e1efebfa42a30a26fb93fe 100644
--- a/drivers/media/rc/ene_ir.c
+++ b/drivers/media/rc/ene_ir.c
@@ -24,6 +24,7 @@
 #include <linux/interrupt.h>
 #include <linux/sched.h>
 #include <linux/slab.h>
+#include <linux/string_choices.h>
 #include <media/rc-core.h>
 #include "ene_ir.h"
 
@@ -1118,7 +1119,7 @@ static void ene_remove(struct pnp_dev *pnp_dev)
 /* enable wake on IR (wakes on specific button on original remote) */
 static void ene_enable_wake(struct ene_device *dev, bool enable)
 {
-	dbg("wake on IR %s", enable ? "enabled" : "disabled");
+	dbg("wake on IR %s", str_enabled_disabled(enable));
 	ene_set_clear_reg_mask(dev, ENE_FW1, ENE_FW1_WAKE, enable);
 }
 
diff --git a/drivers/media/rc/mceusb.c b/drivers/media/rc/mceusb.c
index 044767eb3a38c9354bdf4185bfb16521ddfceb91..fcf9e1559aea8b890e33ae6c9cdd951642ccdd44 100644
--- a/drivers/media/rc/mceusb.c
+++ b/drivers/media/rc/mceusb.c
@@ -25,6 +25,7 @@
 #include <linux/device.h>
 #include <linux/module.h>
 #include <linux/slab.h>
+#include <linux/string_choices.h>
 #include <linux/workqueue.h>
 #include <linux/usb.h>
 #include <linux/usb/input.h>
@@ -1126,7 +1127,7 @@ static int mceusb_set_rx_carrier_report(struct rc_dev *dev, int enable)
 				    MCE_CMD_SETIRRXPORTEN, 0x00 };
 
 	dev_dbg(ir->dev, "%s short-range receiver carrier reporting",
-		enable ? "enable" : "disable");
+		str_enable_disable(enable));
 	if (enable) {
 		ir->carrier_report_enabled = true;
 		if (!ir->learning_active) {
diff --git a/drivers/media/rc/serial_ir.c b/drivers/media/rc/serial_ir.c
index fc5fd39271772013c78c466a5c322b4a04ec8d69..f9ec2f043529cbed1e3f4dfd805c3d27919954d4 100644
--- a/drivers/media/rc/serial_ir.c
+++ b/drivers/media/rc/serial_ir.c
@@ -25,6 +25,7 @@
 #include <linux/delay.h>
 #include <linux/platform_device.h>
 #include <linux/spinlock.h>
+#include <linux/string_choices.h>
 #include <media/rc-core.h>
 
 struct serial_ir_hw {
@@ -588,10 +589,10 @@ static int serial_ir_probe(struct platform_device *dev)
 		}
 		sense = nlow >= nhigh ? 1 : 0;
 		dev_info(&dev->dev, "auto-detected active %s receiver\n",
-			 sense ? "low" : "high");
+			 str_low_high(sense));
 	} else
 		dev_info(&dev->dev, "Manually using active %s receiver\n",
-			 sense ? "low" : "high");
+			 str_low_high(sense));
 
 	dev_dbg(&dev->dev, "Interrupt %d, port %04x obtained\n", irq, io);
 
diff --git a/drivers/media/tuners/tda18250.c b/drivers/media/tuners/tda18250.c
index 68d0275f29e1b789ca1687283996c43ea3bacafc..1cfc0e3bfab455faee1da44de0ac5a473c68edc5 100644
--- a/drivers/media/tuners/tda18250.c
+++ b/drivers/media/tuners/tda18250.c
@@ -7,6 +7,7 @@
 
 #include "tda18250_priv.h"
 #include <linux/regmap.h>
+#include <linux/string_choices.h>
 
 static const struct dvb_tuner_ops tda18250_ops;
 
@@ -107,7 +108,7 @@ static int tda18250_wait_for_irq(struct dvb_frontend *fe,
 	dev_dbg(&client->dev, "waited IRQ (0x%02x) %d ms, triggered: %s", irq,
 			jiffies_to_msecs(jiffies) -
 			(jiffies_to_msecs(timeout) - maxwait),
-			triggered ? "true" : "false");
+			str_true_false(triggered));
 
 	if (!triggered)
 		return -ETIMEDOUT;
diff --git a/drivers/media/tuners/tda9887.c b/drivers/media/tuners/tda9887.c
index b2f7054c1832cef3610f38f2ff1421b01e7892c7..d1f9ef30782b5244083a1345def8cb8c2f343f44 100644
--- a/drivers/media/tuners/tda9887.c
+++ b/drivers/media/tuners/tda9887.c
@@ -6,6 +6,7 @@
 #include <linux/init.h>
 #include <linux/errno.h>
 #include <linux/delay.h>
+#include <linux/string_choices.h>
 #include <linux/videodev2.h>
 #include <media/v4l2-common.h>
 #include <media/tuner.h>
@@ -291,11 +292,11 @@ static void dump_read_message(struct dvb_frontend *fe, unsigned char *buf)
 		"+ 12.5 kHz",
 	};
 	tuner_info("read: 0x%2x\n", buf[0]);
-	tuner_info("  after power on : %s\n", (buf[0] & 0x01) ? "yes" : "no");
+	tuner_info("  after power on : %s\n", str_yes_no(buf[0] & 0x01));
 	tuner_info("  afc            : %s\n", afc[(buf[0] >> 1) & 0x0f]);
-	tuner_info("  fmif level     : %s\n", (buf[0] & 0x20) ? "high" : "low");
+	tuner_info("  fmif level     : %s\n", str_high_low(buf[0] & 0x20));
 	tuner_info("  afc window     : %s\n", (buf[0] & 0x40) ? "in" : "out");
-	tuner_info("  vfi level      : %s\n", (buf[0] & 0x80) ? "high" : "low");
+	tuner_info("  vfi level      : %s\n", str_high_low(buf[0] & 0x80));
 }
 
 static void dump_write_message(struct dvb_frontend *fe, unsigned char *buf)
@@ -344,13 +345,13 @@ static void dump_write_message(struct dvb_frontend *fe, unsigned char *buf)
 	tuner_info("  B0   video mode      : %s\n",
 		   (buf[1] & 0x01) ? "video trap" : "sound trap");
 	tuner_info("  B1   auto mute fm    : %s\n",
-		   (buf[1] & 0x02) ? "yes" : "no");
+		   str_yes_no(buf[1] & 0x02));
 	tuner_info("  B2   carrier mode    : %s\n",
 		   (buf[1] & 0x04) ? "QSS" : "Intercarrier");
 	tuner_info("  B3-4 tv sound/radio  : %s\n",
 		   sound[(buf[1] & 0x18) >> 3]);
 	tuner_info("  B5   force mute audio: %s\n",
-		   (buf[1] & 0x20) ? "yes" : "no");
+		   str_yes_no(buf[1] & 0x20));
 	tuner_info("  B6   output port 1   : %s\n",
 		   (buf[1] & 0x40) ? "high (inactive)" : "low (active)");
 	tuner_info("  B7   output port 2   : %s\n",

-- 
2.43.0


