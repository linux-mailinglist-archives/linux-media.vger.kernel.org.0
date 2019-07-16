Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6E9566A457
	for <lists+linux-media@lfdr.de>; Tue, 16 Jul 2019 10:56:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728141AbfGPI4P (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 Jul 2019 04:56:15 -0400
Received: from ns.iliad.fr ([212.27.33.1]:53414 "EHLO ns.iliad.fr"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727796AbfGPI4P (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 Jul 2019 04:56:15 -0400
Received: from ns.iliad.fr (localhost [127.0.0.1])
        by ns.iliad.fr (Postfix) with ESMTP id 236CC20455;
        Tue, 16 Jul 2019 10:56:13 +0200 (CEST)
Received: from [192.168.108.49] (freebox.vlq16.iliad.fr [213.36.7.13])
        by ns.iliad.fr (Postfix) with ESMTP id F332F20080;
        Tue, 16 Jul 2019 10:56:12 +0200 (CEST)
From:   Marc Gonzalez <marc.w.gonzalez@free.fr>
Subject: [PATCH v2] media: dvb: Provide 4 devm variants
To:     Sean Young <sean@mess.org>, Brad Love <brad@nextdimension.cc>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        =?UTF-8?Q?Jonathan_Neusch=c3=a4fer?= <j.neuschaefer@gmx.net>
Cc:     linux-media <linux-media@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Guenter Roeck <linux@roeck-us.net>
Message-ID: <568760ff-08d8-6e7f-df35-cf76d4fcf945@free.fr>
Date:   Tue, 16 Jul 2019 10:56:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: ClamAV using ClamSMTP ; ns.iliad.fr ; Tue Jul 16 10:56:13 2019 +0200 (CEST)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Provide devm variants for automatic resource release on device removal.
Makes error-handling in probe() much simpler, thus less error-prone.
And once all resources are devmanaged, remove() is no longer needed.

Signed-off-by: Marc Gonzalez <marc.w.gonzalez@free.fr>
---
Changes from v1:
x Simplify devm_dvb_register_adapter() implementation
x Add 3 more devm APIs
x Document them in devres.rst
---
 Documentation/driver-model/devres.rst |  6 ++++++
 drivers/media/dvb-core/dmxdev.c       | 13 +++++++++++++
 drivers/media/dvb-core/dvb_demux.c    | 13 +++++++++++++
 drivers/media/dvb-core/dvb_frontend.c | 13 +++++++++++++
 drivers/media/dvb-core/dvbdev.c       | 12 ++++++++++++
 include/media/dmxdev.h                |  3 +++
 include/media/dvb_demux.h             |  2 ++
 include/media/dvb_frontend.h          |  3 +++
 include/media/dvbdev.h                |  3 +++
 9 files changed, 68 insertions(+)

diff --git a/Documentation/driver-model/devres.rst b/Documentation/driver-model/devres.rst
index a100bef54952..1b6ced8e4294 100644
--- a/Documentation/driver-model/devres.rst
+++ b/Documentation/driver-model/devres.rst
@@ -265,6 +265,12 @@ DMA
 DRM
   devm_drm_dev_init()
 
+DVB
+  devm_dvb_register_adapter()
+  devm_dvb_register_frontend()
+  devm_dvb_dmx_init()
+  devm_dvb_dmxdev_init()
+
 GPIO
   devm_gpiod_get()
   devm_gpiod_get_index()
diff --git a/drivers/media/dvb-core/dmxdev.c b/drivers/media/dvb-core/dmxdev.c
index f14a872d1268..f38b65d1b430 100644
--- a/drivers/media/dvb-core/dmxdev.c
+++ b/drivers/media/dvb-core/dmxdev.c
@@ -1444,6 +1444,19 @@ int dvb_dmxdev_init(struct dmxdev *dmxdev, struct dvb_adapter *dvb_adapter)
 
 EXPORT_SYMBOL(dvb_dmxdev_init);
 
+static void dmxdev_release(void *dmxdev)
+{
+	dvb_dmxdev_release(dmxdev);
+}
+
+int devm_dvb_dmxdev_init(struct device *dev, struct dmxdev *dmxdev,
+		struct dvb_adapter *dvb_adapter)
+{
+	int rc = dvb_dmxdev_init(dmxdev, dvb_adapter);
+	return rc ? : devm_add_action_or_reset(dev, dmxdev_release, dmxdev);
+}
+EXPORT_SYMBOL(devm_dvb_dmxdev_init);
+
 void dvb_dmxdev_release(struct dmxdev *dmxdev)
 {
 	dmxdev->exit = 1;
diff --git a/drivers/media/dvb-core/dvb_demux.c b/drivers/media/dvb-core/dvb_demux.c
index 39a2c6ccf31d..55b9675b99c5 100644
--- a/drivers/media/dvb-core/dvb_demux.c
+++ b/drivers/media/dvb-core/dvb_demux.c
@@ -28,6 +28,7 @@
 #include <linux/string.h>
 #include <linux/crc32.h>
 #include <linux/uaccess.h>
+#include <linux/device.h>
 #include <asm/div64.h>
 
 #include <media/dvb_demux.h>
@@ -1317,6 +1318,18 @@ int dvb_dmx_init(struct dvb_demux *dvbdemux)
 
 EXPORT_SYMBOL(dvb_dmx_init);
 
+static void dmx_release(void *dvbdemux)
+{
+	dvb_dmx_release(dvbdemux);
+}
+
+int devm_dvb_dmx_init(struct device *dev, struct dvb_demux *dvbdemux)
+{
+	int rc = dvb_dmx_init(dvbdemux);
+	return rc ? : devm_add_action_or_reset(dev, dmx_release, dvbdemux);
+}
+EXPORT_SYMBOL(devm_dvb_dmx_init);
+
 void dvb_dmx_release(struct dvb_demux *dvbdemux)
 {
 	vfree(dvbdemux->cnt_storage);
diff --git a/drivers/media/dvb-core/dvb_frontend.c b/drivers/media/dvb-core/dvb_frontend.c
index 209186c5cd9b..4a281cd8c064 100644
--- a/drivers/media/dvb-core/dvb_frontend.c
+++ b/drivers/media/dvb-core/dvb_frontend.c
@@ -3007,6 +3007,19 @@ int dvb_register_frontend(struct dvb_adapter *dvb,
 }
 EXPORT_SYMBOL(dvb_register_frontend);
 
+static void unregister_frontend(void *fe)
+{
+	dvb_unregister_frontend(fe);
+}
+
+int devm_dvb_register_frontend(struct device *dev,
+		struct dvb_adapter *dvb, struct dvb_frontend *fe)
+{
+	int rc = dvb_register_frontend(dvb, fe);
+	return rc ? : devm_add_action_or_reset(dev, unregister_frontend, fe);
+}
+EXPORT_SYMBOL(devm_dvb_register_frontend);
+
 int dvb_unregister_frontend(struct dvb_frontend *fe)
 {
 	struct dvb_frontend_private *fepriv = fe->frontend_priv;
diff --git a/drivers/media/dvb-core/dvbdev.c b/drivers/media/dvb-core/dvbdev.c
index a3393cd4e584..7d007bcc2abb 100644
--- a/drivers/media/dvb-core/dvbdev.c
+++ b/drivers/media/dvb-core/dvbdev.c
@@ -885,6 +885,18 @@ int dvb_register_adapter(struct dvb_adapter *adap, const char *name,
 }
 EXPORT_SYMBOL(dvb_register_adapter);
 
+static void unregister_adapter(void *adap)
+{
+	dvb_unregister_adapter(adap);
+}
+
+int devm_dvb_register_adapter(struct device *dev, struct dvb_adapter *adap,
+		const char *name, struct module *module, short *adapter_nums)
+{
+	int rc = dvb_register_adapter(adap, name, module, dev, adapter_nums);
+	return rc ? : devm_add_action_or_reset(dev, unregister_adapter, adap);
+}
+EXPORT_SYMBOL(devm_dvb_register_adapter);
 
 int dvb_unregister_adapter(struct dvb_adapter *adap)
 {
diff --git a/include/media/dmxdev.h b/include/media/dmxdev.h
index baafa3b8aca4..0300d829aeea 100644
--- a/include/media/dmxdev.h
+++ b/include/media/dmxdev.h
@@ -204,6 +204,9 @@ struct dmxdev {
  */
 int dvb_dmxdev_init(struct dmxdev *dmxdev, struct dvb_adapter *adap);
 
+int devm_dvb_dmxdev_init(struct device *dev, struct dmxdev *dmxdev,
+		struct dvb_adapter *dvb_adapter);
+
 /**
  * dvb_dmxdev_release - releases a digital TV demux and unregisters it.
  *
diff --git a/include/media/dvb_demux.h b/include/media/dvb_demux.h
index 3b6aeca7a49e..95fe901076d7 100644
--- a/include/media/dvb_demux.h
+++ b/include/media/dvb_demux.h
@@ -266,6 +266,8 @@ struct dvb_demux {
  */
 int dvb_dmx_init(struct dvb_demux *demux);
 
+int devm_dvb_dmx_init(struct device *dev, struct dvb_demux *demux);
+
 /**
  * dvb_dmx_release - releases a digital TV demux internal buffers.
  *
diff --git a/include/media/dvb_frontend.h b/include/media/dvb_frontend.h
index f05cd7b94a2c..56dbaf3cc7a9 100644
--- a/include/media/dvb_frontend.h
+++ b/include/media/dvb_frontend.h
@@ -713,6 +713,9 @@ struct dvb_frontend {
 int dvb_register_frontend(struct dvb_adapter *dvb,
 				 struct dvb_frontend *fe);
 
+int devm_dvb_register_frontend(struct device *dev,
+		struct dvb_adapter *dvb, struct dvb_frontend *fe);
+
 /**
  * dvb_unregister_frontend() - Unregisters a DVB frontend
  *
diff --git a/include/media/dvbdev.h b/include/media/dvbdev.h
index 551325858de3..32f8d1626319 100644
--- a/include/media/dvbdev.h
+++ b/include/media/dvbdev.h
@@ -202,6 +202,9 @@ int dvb_register_adapter(struct dvb_adapter *adap, const char *name,
 			 struct module *module, struct device *device,
 			 short *adapter_nums);
 
+int devm_dvb_register_adapter(struct device *dev, struct dvb_adapter *adap,
+		const char *name, struct module *module, short *adapter_nums);
+
 /**
  * dvb_unregister_adapter - Unregisters a DVB adapter
  *
-- 
2.17.1
