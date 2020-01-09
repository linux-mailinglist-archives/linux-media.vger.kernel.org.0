Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 507F21363ED
	for <lists+linux-media@lfdr.de>; Fri, 10 Jan 2020 00:38:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729411AbgAIXif (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 9 Jan 2020 18:38:35 -0500
Received: from mail-qk1-f194.google.com ([209.85.222.194]:43455 "EHLO
        mail-qk1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726380AbgAIXif (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 9 Jan 2020 18:38:35 -0500
Received: by mail-qk1-f194.google.com with SMTP id t129so264670qke.10;
        Thu, 09 Jan 2020 15:38:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Z+fP9LDxEwzW2I4/onD1G2Z+ZF+S8K1st8xslhotzbI=;
        b=ajnibXV2i9c2UHbBDNi0EhliNEOYv2E1YxhJJjxflYx8hdHOzKHb0dxwmlwLiHn4q5
         dT4/eRzsTGcUsJSO8R7E2V6ukj2gdfgRUXVG9rfYRDKZghI1omGFPsVTty4eY4adYD61
         wFhSBFfp81S5YDMoBeLxoOu575gSUoEOblHJ3UkRZEAaDiZ4M27EbEb2QqJWH7f6gz6r
         /PwiS60ehB++1sdxPi2yNj3IrIkjosny7naRdUml/DneJde+6g0H/PwHmtQS3gXsghzh
         aWBEHkU9DOwFuSE0QE+aW8O5M7yjFcqXpLOZYschatc3hHGmT6gUqg4/Tfh+ayhjqt1b
         T2Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Z+fP9LDxEwzW2I4/onD1G2Z+ZF+S8K1st8xslhotzbI=;
        b=f5iv8ixazwcht/2yvLih16HP52UkfqorKp4TxINQqKmGq//FabBIxjEr395auolnqC
         hSyxw4vkthjrUZEriZTwRC1Jq7bUj7Dr6f1eRw1NTwqBeuLqGCI4leRghNcW1PnjbMzb
         F7UkUWch/WYexOayosvegMlZz1I6RAOV1YctoaRZVezg6rO2agQDnN6I+AA3fzH00H1p
         Eak+6iMH3HNDfzJSCSD8ailT4MjYwtwFfHlLQcJkuXMB+jguMM6IuaxvAoe8/9K2AsqH
         56/uIyIaVxUehP+5AhZauHJH+M2TESDJfx7HKYCIbKMq87+kOv1FIrMNDH9ZFBVAq8w5
         ZZog==
X-Gm-Message-State: APjAAAXStrok0+VizOmjFR265Sb+FrkBsqssj/Vfchjk9SaYV+PjMJ+y
        Ym3QvMaW+GjD+Zn7h6eiug8=
X-Google-Smtp-Source: APXvYqxoXGQIYxib/+yzkgOj4je4pw+qEm9qQGymXToeMJfwFmoqPJntdhANaN2ZNW1LY8LT3+lgKA==
X-Received: by 2002:a05:620a:14a4:: with SMTP id x4mr392171qkj.493.1578613113870;
        Thu, 09 Jan 2020 15:38:33 -0800 (PST)
Received: from localhost.localdomain ([2804:14d:72b1:8920:da15:c0bd:33c1:e2ad])
        by smtp.gmail.com with ESMTPSA id w20sm111483qtj.4.2020.01.09.15.38.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jan 2020 15:38:33 -0800 (PST)
From:   "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
X-Google-Original-From: Daniel W. S. Almeida
To:     mchehab@kernel.org, sean@mess.org, tglx@linutronix.de,
        gregkh@linuxfoundation.org
Cc:     "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        skhan@linuxfoundation.org,
        linux-kernel-mentees@lists.linuxfoundation.org
Subject: [PATCH v2] media: dvb_dummy_tuner: implement driver skeleton
Date:   Thu,  9 Jan 2020 20:37:57 -0300
Message-Id: <20200109233757.734008-1-dwlsalmeida@gmail.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>

Implement a dummy DVB tuner as part of ongoing work
on a virtual DVB test driver under the 2020 Spring Linux
Kernel Mentorship Program.

The virtual DVB test driver serves as a reference DVB driver and helps
validate the existing APIs in the media subsystem. It can also aid developers
 working on userspace applications.

This dummy tuner should support common TV standards such as DVB-T/T2/S/S2,
ISDB-T and ATSC when completed.

For now, only a basic skeleton is available, most functions do nothing
whatsoever.

Signed-off-by: Daniel W. S. Almeida <dwlsalmeida@gmail.com>
-----------------------------------------------------------

Changes in v2:
	Commit message was rewritten
	Added better description in KConfig
	Added better description in .h and .c
	Added copyright notice in .h and .c
	Kconfig dummy tuner option now defaults to 'n'
	Removed calls to pr_err, pr_debug
Not addressed in v2:
	attach()/release() calls:
		I would appreciate some clarification on this, since some
		tuners implement only probe()/remove(), some implement
		only attach()/release() and some implement both (e.g. mt2060.c).
		Furthermore, in mt2060.c, both attach() and probe()  copy 
		struct dvb_tuner_ops into fe->ops->tuner_ops.

-------------------------------------------------------------

 drivers/media/tuners/Kconfig           |   9 ++
 drivers/media/tuners/Makefile          |   1 +
 drivers/media/tuners/dvb_dummy_tuner.c | 160 +++++++++++++++++++++++++
 drivers/media/tuners/dvb_dummy_tuner.h |  31 +++++
 4 files changed, 201 insertions(+)
 create mode 100644 drivers/media/tuners/dvb_dummy_tuner.c
 create mode 100644 drivers/media/tuners/dvb_dummy_tuner.h

diff --git a/drivers/media/tuners/Kconfig b/drivers/media/tuners/Kconfig
index e104bb7766e1..d433dc7e68b1 100644
--- a/drivers/media/tuners/Kconfig
+++ b/drivers/media/tuners/Kconfig
@@ -296,4 +296,13 @@ config MEDIA_TUNER_QM1D1B0004
 	default m if !MEDIA_SUBDRV_AUTOSELECT
 	help
 	  Sharp QM1D1B0004 ISDB-S tuner driver.
+
+config MEDIA_TUNER_DVB_DUMMY_TUNER
+	tristate "Dummy tuner"
+	depends on MEDIA_SUPPORT && I2C
+	default n
+	help
+	  The virtual DVB test driver serves as a reference DVB driver and helps
+	  validate the existing APIs in the media subsystem. It can also aid
+	  developers working on userspace applications.
 endmenu
diff --git a/drivers/media/tuners/Makefile b/drivers/media/tuners/Makefile
index 7b4f8423501e..f98de1cf2e19 100644
--- a/drivers/media/tuners/Makefile
+++ b/drivers/media/tuners/Makefile
@@ -44,5 +44,6 @@ obj-$(CONFIG_MEDIA_TUNER_QM1D1C0042) += qm1d1c0042.o
 obj-$(CONFIG_MEDIA_TUNER_QM1D1B0004) += qm1d1b0004.o
 obj-$(CONFIG_MEDIA_TUNER_M88RS6000T) += m88rs6000t.o
 obj-$(CONFIG_MEDIA_TUNER_TDA18250) += tda18250.o
+obj-$(CONFIG_MEDIA_TUNER_DVB_DUMMY_TUNER) += dvb_dummy_tuner.o
 
 ccflags-y += -I$(srctree)/drivers/media/dvb-frontends
diff --git a/drivers/media/tuners/dvb_dummy_tuner.c b/drivers/media/tuners/dvb_dummy_tuner.c
new file mode 100644
index 000000000000..8aed5d583eeb
--- /dev/null
+++ b/drivers/media/tuners/dvb_dummy_tuner.c
@@ -0,0 +1,160 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * A dummy DVB tuner as part of ongoing work
+ * on a virtual DVB test driver under the 2020 Spring Linux
+ * Kernel Mentorship Program.
+ *
+ * The virtual DVB test driver serves as a reference DVB driver and helps
+ * validate the existing APIs in the media subsystem. It can also aid developers
+ * working on userspace applications.
+ *
+ * This dummy tuner should support common TV standards such as DVB-T/T2/S/S2,
+ * ISDB-T and ATSC when completed.
+ *
+ * Copyright (c) 2020 Daniel W. S. Almeida <dwlsalmeida@gmail.com>
+ */
+
+#include <linux/errno.h>
+#include <linux/i2c.h>
+#include <linux/module.h>
+#include <linux/slab.h>
+#include <linux/types.h>
+#include <media/dvb_frontend.h>
+#include "dvb_dummy_tuner.h"
+
+struct dvb_dummy_tuner_dev {
+	struct dvb_frontend *fe;
+};
+
+static void dvb_dummy_tuner_release(struct dvb_frontend *fe)
+{
+}
+
+static int dvb_dummy_tuner_init(struct dvb_frontend *fe)
+{
+	return 0;
+}
+
+static int dvb_dummy_tuner_sleep(struct dvb_frontend *fe)
+{
+	return 0;
+}
+
+static int dvb_dummy_tuner_suspend(struct dvb_frontend *fe)
+{
+	return 0;
+}
+
+static int dvb_dummy_tuner_resume(struct dvb_frontend *fe)
+{
+	return 0;
+}
+
+static int dvb_dummy_tuner_set_params(struct dvb_frontend *fe)
+{
+	return 0;
+}
+
+static int dvb_dummy_tuner_set_config(struct dvb_frontend *fe, void *priv_cfg)
+{
+	return 0;
+}
+
+static int dvb_dummy_tuner_get_frequency(struct dvb_frontend *fe,
+					 u32 *frequency)
+{
+	return 0;
+}
+
+static int dvb_dummy_tuner_get_bandwidth(struct dvb_frontend *fe,
+					 u32 *bandwidth)
+{
+	return 0;
+}
+
+static int dvb_dummy_tuner_get_if_frequency(struct dvb_frontend *fe,
+					    u32 *frequency)
+{
+	return 0;
+}
+
+static int dvb_dummy_tuner_get_status(struct dvb_frontend *fe, u32 *status)
+{
+	return 0;
+}
+
+static const struct dvb_tuner_ops dvb_dummy_tuner_ops = {
+	.release = dvb_dummy_tuner_release,
+	.init = dvb_dummy_tuner_init,
+	.sleep = dvb_dummy_tuner_sleep,
+	.suspend = dvb_dummy_tuner_suspend,
+	.resume = dvb_dummy_tuner_resume,
+	.set_params = dvb_dummy_tuner_set_params,
+	.set_config = dvb_dummy_tuner_set_config,
+	.get_bandwidth = dvb_dummy_tuner_get_bandwidth,
+	.get_frequency = dvb_dummy_tuner_get_frequency,
+	.get_if_frequency = dvb_dummy_tuner_get_if_frequency,
+	.get_status = dvb_dummy_tuner_get_status,
+};
+
+static const struct i2c_device_id dvb_dummy_tuner_i2c_id_table[] = {
+	{"dvb_dummy_tuner", 0},
+	{}
+};
+MODULE_DEVICE_TABLE(i2c, dvb_dummy_tuner_i2c_id_table);
+
+static int dvb_dummy_tuner_i2c_probe(struct i2c_client *client,
+				     const struct i2c_device_id *id)
+{
+	int ret = 0;
+	struct dvb_dummy_tuner_config *config = client->dev.platform_data;
+	struct dvb_frontend *fe = config->fe;
+	struct dvb_dummy_tuner_dev *tuner_dev = NULL;
+
+	tuner_dev = kzalloc(sizeof(*tuner_dev), GFP_KERNEL);
+	if (!tuner_dev) {
+		ret = -ENOMEM;
+		goto err;
+	}
+
+	i2c_set_clientdata(client, tuner_dev);
+	tuner_dev->fe = config->fe;
+
+	memcpy(&fe->ops.tuner_ops,
+	       &dvb_dummy_tuner_ops,
+	       sizeof(struct dvb_tuner_ops));
+
+	fe->tuner_priv = client;
+
+	return ret;
+
+err:
+	return ret;
+}
+
+static int dvb_dummy_tuner_i2c_remove(struct i2c_client *client)
+{
+	struct dvb_dummy_tuner_dev *tuner_dev = i2c_get_clientdata(client);
+	struct dvb_frontend *fe = tuner_dev->fe;
+
+	memset(&fe->ops.tuner_ops, 0, sizeof(struct dvb_tuner_ops));
+	fe->tuner_priv = NULL;
+	kfree(tuner_dev);
+
+	return 0;
+}
+
+static struct i2c_driver dvb_dummy_tuner_i2c_driver = {
+	.driver = {
+		.name = "dvb_dummy_tuner",
+		.suppress_bind_attrs = true,
+	},
+	.probe		= dvb_dummy_tuner_i2c_probe,
+	.remove		= dvb_dummy_tuner_i2c_remove,
+	.id_table	= dvb_dummy_tuner_i2c_id_table,
+};
+module_i2c_driver(dvb_dummy_tuner_i2c_driver);
+
+MODULE_DESCRIPTION("DVB Dummy Tuner");
+MODULE_AUTHOR("Daniel W. S. Almeida");
+MODULE_LICENSE("GPL");
diff --git a/drivers/media/tuners/dvb_dummy_tuner.h b/drivers/media/tuners/dvb_dummy_tuner.h
new file mode 100644
index 000000000000..3569bbc3716e
--- /dev/null
+++ b/drivers/media/tuners/dvb_dummy_tuner.h
@@ -0,0 +1,31 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * A dummy DVB tuner as part of ongoing work
+ * on a virtual DVB test driver under the 2020 Spring Linux
+ * Kernel Mentorship Program.
+ *
+ * The virtual DVB test driver serves as a reference DVB driver and helps
+ * validate the existing APIs in the media subsystem. It can also aid developers
+ * working on userspace applications.
+ *
+ * This dummy tuner should support common TV standards such as DVB-T/T2/S/S2,
+ * ISDB-T and ATSC when completed.
+ *
+ * Copyright (c) 2020 Daniel W. S. Almeida <dwlsalmeida@gmail.com>
+ */
+
+#ifndef __TUNER_DVB_DUMMY_TUNER_H__
+#define __TUNER_DVB_DUMMY_TUNER_H__
+
+#include <media/dvb_frontend.h>
+/**
+ * struct dvb_dummy_tuner_config - configuration parameters for the dummy tuner
+ *
+ * @fe:
+ *	frontend returned by driver
+ */
+struct dvb_dummy_tuner_config {
+	struct dvb_frontend *fe;
+};
+
+#endif /*__TUNER_DVB_DUMMY_TUNER_H__ */
-- 
2.24.1

