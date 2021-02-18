Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 66C1131ECBF
	for <lists+linux-media@lfdr.de>; Thu, 18 Feb 2021 18:05:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234198AbhBRQ7Z (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 18 Feb 2021 11:59:25 -0500
Received: from lb2-smtp-cloud9.xs4all.net ([194.109.24.26]:49821 "EHLO
        lb2-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233256AbhBRQOg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 18 Feb 2021 11:14:36 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id ClvQlG3KUZvk6ClvUlAXi8; Thu, 18 Feb 2021 17:13:12 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1613664792; bh=UMs6ieNZxg5GE9x4Iz9tPbVgybqsI/TV4irkbj9RlK4=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=RtsipwUi8Tsh59craFIA8S88yqE72Rtr+rz8cidB5AuAds4Pf69Gk5qtYDx4QlzBC
         3m6fQgnm12vFwDdMoCMMUJVtzMHOeeQHfkZYQgJVC8s6JeZF4StCVpTospk1R7BTk3
         f36AG9dGqvGh748a3SJnOJCygmXiCpNPw7RP1YF3XdqX9nnwzUXZYkKVAEsx0D19nv
         GQ6UQb9jRtxlYArkysrleaI5YgUg5U3sEZqA77ded4kBOdSxBDMmwK29ppPmb8UOq1
         MnAjK1etxdu95sEEPBowAaCBboWli/VG3mevZ16e1NjJF7fpJZCVBeh4piK+vzA2Wn
         S/8kbZw0HI+Fg==
To:     Sean Young <sean@mess.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Hans de Goede <hdegoede@redhat.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH] media/rc: compile rc-cec.c into rc-core
Message-ID: <c3b7bb19-a3a7-e954-80cf-a083b11ee69d@xs4all.nl>
Date:   Thu, 18 Feb 2021 17:13:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.7.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfEDkOORaURqlXDG/Y63YNUXKrhz0SRq2ss1Tr8NB3trq7oMlHi9Ly0vqEnhNEXS2UamSGgGDyHgFE6vUsmyHCGBKwmx/JSbl+gzHbm5RQlnCi1NxphjF
 1li/zAQhHaFi00dy28k29MAVZjtPzWPw12R5s0wriv9aRNvhx/9cbXPjO/1g9KiSburmQ+YYCXmLQX0QxwggNDX8jVX5rbfyKPJK2TMsO5kAmY3v+0tOgQT7
 6tRhyjtvqYkBjDS0CVoMpg==
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
Sean, I tested this both with RC_CORE=y and =m.

It looks reasonably clean to me, but I am not sure if this affects v4l-utils
as well. Let me know what you think.

Regards,

	Hans
---
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
index 1fd62c1dac76..4768b1e9ffd1 100644
--- a/drivers/media/rc/rc-main.c
+++ b/drivers/media/rc/rc-main.c
@@ -163,6 +163,10 @@ static struct rc_map_list empty_map = {
 	}
 };

+#ifdef CONFIG_MEDIA_CEC_RC
+extern struct rc_map_list cec_map;
+#endif
+
 /**
  * scancode_to_u64() - converts scancode in &struct input_keymap_entry
  * @ke: keymap entry containing scancode to be converted.
@@ -2069,6 +2073,9 @@ static int __init rc_core_init(void)

 	led_trigger_register_simple("rc-feedback", &led_feedback);
 	rc_map_register(&empty_map);
+#ifdef CONFIG_MEDIA_CEC_RC
+	rc_map_register(&cec_map);
+#endif

 	return 0;
 }
@@ -2078,6 +2085,9 @@ static void __exit rc_core_exit(void)
 	lirc_dev_exit();
 	class_unregister(&rc_class);
 	led_trigger_unregister_simple(led_feedback);
+#ifdef CONFIG_MEDIA_CEC_RC
+	rc_map_register(&cec_map);
+#endif
 	rc_map_unregister(&empty_map);
 }

