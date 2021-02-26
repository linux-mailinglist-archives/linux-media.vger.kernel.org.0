Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E2573326170
	for <lists+linux-media@lfdr.de>; Fri, 26 Feb 2021 11:39:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230421AbhBZKjS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 Feb 2021 05:39:18 -0500
Received: from lb1-smtp-cloud8.xs4all.net ([194.109.24.21]:49733 "EHLO
        lb1-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230496AbhBZKif (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 Feb 2021 05:38:35 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id FaVHludmHnPxbFaVKlxU8A; Fri, 26 Feb 2021 11:37:50 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1614335870; bh=YVEYKhzUB7v9KuIU34vMIlZungNTUN86vULOxyAzpms=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=DpTZMqt+uktthi2mRhpVhu88Tu1fbFwsEXaneJrG/0KjA637N6hsj3lxZ7ZbZyjNb
         6AogkOMlr3L8FOaeDwmNrqHhGcYiAQg7hGQGBYuKqwLu7j0M/WUWw3Bvqhikqrzejw
         AxY6wKGcHdb2I5UftCIG5AW8J/lgF1KTHPDFwwUK/yx72nbKC81SR4wZFPAHyzEJuP
         G1AMoif1YDC6wuWBXa6eJqwyStNWIa7aCpmTqN49Fs+OhUavHpDCV5d9qVywEVZYmY
         f1Jb+XjNlfPmjtoVNG4R/GQseWMhLb/U5+ytoODJK++Oq0b9hX0yime2VhabEKoL7g
         X0WOkArtlpEhQ==
To:     Sean Young <sean@mess.org>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Hans de Goede <hdegoede@redhat.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCHv3] media/rc: compile rc-cec.c into rc-core
Message-ID: <8d2661f6-0b8e-13f0-cc89-025a82dd7564@xs4all.nl>
Date:   Fri, 26 Feb 2021 11:37:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.7.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfAB28WyO23I3uTkSKp+wrvXYjlxboZOoDGwQ0Qfpy+E87P1B2TSDbDzK2//7EhTa4pGtjP8gNjXbCIjR2EmRaPmswbK+HmQEgvV9Ky89gBDBJDXSka+a
 mWUA25tdBUO1WfCvuMTkxOux81c93QrjNxGdrn7c4Pqa7cx59x1sh1GsaeZnAF2PT4tLSCqFjku9md60K/3LVAxHOEv4RhWIYAmTKMsUGOypwtvvGrws5K0l
 ALtNsebHJSEWY/cf5N0mZw==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The rc-cec keymap is unusual in that it can't be built as a module,
instead it is registered directly in rc-main.c if CONFIG_MEDIA_CEC_RC
is set. This is because it can be called from drm_dp_cec_set_edid() via
cec_register_adapter() in an asynchronous context, and it is not
allowed to use request_module() to load rc-cec.ko in that case. Trying to
do so results in a 'WARN_ON_ONCE(wait && current_is_async())'.

Since this keymap is only used if CONFIG_MEDIA_CEC_RC is set, we
just compile this keymap into the rc-core module and never as a
separate module.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Fixes: 2c6d1fffa1d9 (drm: add support for DisplayPort CEC-Tunneling-over-AUX)
Reported-by: Hans de Goede <hdegoede@redhat.com>
---
Change since v2:
Move 'extern struct rc_map_list cec_map;' to rc-map.h to fix sparse warning.

Change since v1:
Fix copy-and-paste error: rc_core_exit() called rc_map_register() instead
of rc_map_unregister().
---
 drivers/media/rc/Makefile         |  1 +
 drivers/media/rc/keymaps/Makefile |  1 -
 drivers/media/rc/keymaps/rc-cec.c | 28 +++++++++++-----------------
 drivers/media/rc/rc-main.c        |  6 ++++++
 include/media/rc-map.h            |  7 +++++++
 5 files changed, 25 insertions(+), 18 deletions(-)

diff --git a/drivers/media/rc/Makefile b/drivers/media/rc/Makefile
index 5bb2932ab119..ff6a8fc4c38e 100644
--- a/drivers/media/rc/Makefile
+++ b/drivers/media/rc/Makefile
@@ -5,6 +5,7 @@ obj-y += keymaps/
 obj-$(CONFIG_RC_CORE) += rc-core.o
 rc-core-y := rc-main.o rc-ir-raw.o
 rc-core-$(CONFIG_LIRC) += lirc_dev.o
+rc-core-$(CONFIG_MEDIA_CEC_RC) += keymaps/rc-cec.o
 rc-core-$(CONFIG_BPF_LIRC_MODE2) += bpf-lirc.o
 obj-$(CONFIG_IR_NEC_DECODER) += ir-nec-decoder.o
 obj-$(CONFIG_IR_RC5_DECODER) += ir-rc5-decoder.o
diff --git a/drivers/media/rc/keymaps/Makefile b/drivers/media/rc/keymaps/Makefile
index b252a1d2ebd6..cc6662e1903f 100644
--- a/drivers/media/rc/keymaps/Makefile
+++ b/drivers/media/rc/keymaps/Makefile
@@ -21,7 +21,6 @@ obj-$(CONFIG_RC_MAP) += rc-adstech-dvb-t-pci.o \
 			rc-behold.o \
 			rc-behold-columbus.o \
 			rc-budget-ci-old.o \
-			rc-cec.o \
 			rc-cinergy-1400.o \
 			rc-cinergy.o \
 			rc-d680-dmb.o \
diff --git a/drivers/media/rc/keymaps/rc-cec.c b/drivers/media/rc/keymaps/rc-cec.c
index 3e3bd11092b4..068e22aeac8c 100644
--- a/drivers/media/rc/keymaps/rc-cec.c
+++ b/drivers/media/rc/keymaps/rc-cec.c
@@ -1,5 +1,15 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 /* Keytable for the CEC remote control
+ *
+ * This keymap is unusual in that it can't be built as a module,
+ * instead it is registered directly in rc-main.c if CONFIG_MEDIA_CEC_RC
+ * is set. This is because it can be called from drm_dp_cec_set_edid() via
+ * cec_register_adapter() in an asynchronous context, and it is not
+ * allowed to use request_module() to load rc-cec.ko in that case.
+ *
+ * Since this keymap is only used if CONFIG_MEDIA_CEC_RC is set, we
+ * just compile this keymap into the rc-core module and never as a
+ * separate module.
  *
  * Copyright (c) 2015 by Kamil Debski
  */
@@ -152,7 +162,7 @@ static struct rc_map_table cec[] = {
 	/* 0x77-0xff: Reserved */
 };

-static struct rc_map_list cec_map = {
+struct rc_map_list cec_map = {
 	.map = {
 		.scan		= cec,
 		.size		= ARRAY_SIZE(cec),
@@ -160,19 +170,3 @@ static struct rc_map_list cec_map = {
 		.name		= RC_MAP_CEC,
 	}
 };
-
-static int __init init_rc_map_cec(void)
-{
-	return rc_map_register(&cec_map);
-}
-
-static void __exit exit_rc_map_cec(void)
-{
-	rc_map_unregister(&cec_map);
-}
-
-module_init(init_rc_map_cec);
-module_exit(exit_rc_map_cec);
-
-MODULE_LICENSE("GPL");
-MODULE_AUTHOR("Kamil Debski");
diff --git a/drivers/media/rc/rc-main.c b/drivers/media/rc/rc-main.c
index 1fd62c1dac76..8e88dc8ea6c5 100644
--- a/drivers/media/rc/rc-main.c
+++ b/drivers/media/rc/rc-main.c
@@ -2069,6 +2069,9 @@ static int __init rc_core_init(void)

 	led_trigger_register_simple("rc-feedback", &led_feedback);
 	rc_map_register(&empty_map);
+#ifdef CONFIG_MEDIA_CEC_RC
+	rc_map_register(&cec_map);
+#endif

 	return 0;
 }
@@ -2078,6 +2081,9 @@ static void __exit rc_core_exit(void)
 	lirc_dev_exit();
 	class_unregister(&rc_class);
 	led_trigger_unregister_simple(led_feedback);
+#ifdef CONFIG_MEDIA_CEC_RC
+	rc_map_unregister(&cec_map);
+#endif
 	rc_map_unregister(&empty_map);
 }

diff --git a/include/media/rc-map.h b/include/media/rc-map.h
index 999b750bc6b8..30f138ebab6f 100644
--- a/include/media/rc-map.h
+++ b/include/media/rc-map.h
@@ -175,6 +175,13 @@ struct rc_map_list {
 	struct rc_map map;
 };

+#ifdef CONFIG_MEDIA_CEC_RC
+/*
+ * rc_map_list from rc-cec.c
+ */
+extern struct rc_map_list cec_map;
+#endif
+
 /* Routines from rc-map.c */

 /**
-- 
2.30.0

