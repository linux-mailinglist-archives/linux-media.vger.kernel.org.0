Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4A62064EA8F
	for <lists+linux-media@lfdr.de>; Fri, 16 Dec 2022 12:31:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229680AbiLPLbk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 16 Dec 2022 06:31:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230287AbiLPLbh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 16 Dec 2022 06:31:37 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 145491409B
        for <linux-media@vger.kernel.org>; Fri, 16 Dec 2022 03:30:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1671190241;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Yvf6qZW2ovKLOTQd2ZUlYb1ftgRwQmzMm5+ccXiLrCI=;
        b=CmrE1qzMuJmFmD6/RCJvgwTO6qwX3p6OcldV0Tuov+ePNywP/IkOcNbocVwOzV8gyt8Rdq
        D8oMF0F1wNvZ6K/ZWwUw+Lold75VN2fRPvUoTO3jg9zPSRp0dPc7YcyP1KDXtXS+FgFeyH
        zKiiGAVB0aj0weN+mdZ/E/U+IAp3ouU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-112-XklrP0VSM6SvzpUJwpvEqA-1; Fri, 16 Dec 2022 06:30:38 -0500
X-MC-Unique: XklrP0VSM6SvzpUJwpvEqA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5DD0E1C02D52;
        Fri, 16 Dec 2022 11:30:37 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.194.205])
        by smtp.corp.redhat.com (Postfix) with ESMTP id ED2D3400F58;
        Fri, 16 Dec 2022 11:30:33 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>, Pavel Machek <pavel@ucw.cz>,
        Lee Jones <lee@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Daniel Scally <djrscally@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        platform-driver-x86@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-gpio@vger.kernel.org, Kate Hsuan <hpa@redhat.com>,
        Mark Pearson <markpearson@lenovo.com>,
        Andy Yeh <andy.yeh@intel.com>, Yao Hao <yao.hao@intel.com>,
        linux-media@vger.kernel.org
Subject: [PATCH v3 05/11] leds: led-class: Add generic [devm_]led_get()
Date:   Fri, 16 Dec 2022 12:30:07 +0100
Message-Id: <20221216113013.126881-6-hdegoede@redhat.com>
In-Reply-To: <20221216113013.126881-1-hdegoede@redhat.com>
References: <20221216113013.126881-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add a generic [devm_]led_get() method which can be used on both devicetree
and non devicetree platforms to get a LED classdev associated with
a specific function on a specific device, e.g. the privacy LED associated
with a specific camera sensor.

Note unlike of_led_get() this takes a string describing the function
rather then an index. This is done because e.g. camera sensors might
have a privacy LED, or a flash LED, or both and using an index
approach leaves it unclear what the function of index 0 is if there is
only 1 LED. The existing of support is extended to also support
getting a LED by function-name using the standard devicetree pattern
of adding a -names string array to map names to the indexes.

For non devicetree platforms a lookup-table mechanism is added to
allow the platform code to map specific LED class_dev-s to specific
device,function combinations this way.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/leds/led-class.c | 91 ++++++++++++++++++++++++++++++++++++++++
 include/linux/leds.h     | 18 ++++++++
 2 files changed, 109 insertions(+)

diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
index 6e25c411ba35..76b3ab66eb88 100644
--- a/drivers/leds/led-class.c
+++ b/drivers/leds/led-class.c
@@ -23,6 +23,8 @@
 #include "leds.h"
 
 static struct class *leds_class;
+static DEFINE_MUTEX(leds_lookup_lock);
+static LIST_HEAD(leds_lookup_list);
 
 static ssize_t brightness_show(struct device *dev,
 		struct device_attribute *attr, char *buf)
@@ -329,6 +331,95 @@ struct led_classdev *__must_check devm_of_led_get(struct device *dev,
 }
 EXPORT_SYMBOL_GPL(devm_of_led_get);
 
+/**
+ * led_get() - request a LED device via the LED framework
+ * @dev: device for which to get the LED device
+ * @function: string describing the function of the LED device
+ *
+ * @return a pointer to a LED device or ERR_PTR(errno) on failure.
+ */
+struct led_classdev *led_get(struct device *dev, char *function)
+{
+	struct led_lookup_data *lookup;
+	struct led_classdev *led_cdev;
+	const char *led_name = NULL;
+	struct device *led_dev;
+
+	if (dev->of_node) {
+		led_cdev = __of_led_get(dev->of_node, -1, function);
+		if (!IS_ERR(led_cdev) || PTR_ERR(led_cdev) != -ENOENT)
+			return led_cdev;
+	}
+
+	mutex_lock(&leds_lookup_lock);
+	list_for_each_entry(lookup, &leds_lookup_list, list) {
+		if (!strcmp(lookup->consumer_dev_name, dev_name(dev)) &&
+		    !strcmp(lookup->consumer_function, function)) {
+			led_name = kstrdup(lookup->led_name, GFP_KERNEL);
+			break;
+		}
+	}
+	mutex_unlock(&leds_lookup_lock);
+
+	if (!led_name)
+		return ERR_PTR(-ENOENT);
+
+	led_dev = class_find_device_by_name(leds_class, led_name);
+	kfree(led_name);
+
+	return __led_get(led_dev);
+}
+EXPORT_SYMBOL_GPL(led_get);
+
+/**
+ * devm_led_get() - request a LED device via the LED framework
+ * @dev: device for which to get the LED device
+ * @function: string describing the function of the LED device
+ *
+ * The LED device returned from this function is automatically released
+ * on driver detach.
+ *
+ * @return a pointer to a LED device or ERR_PTR(errno) on failure.
+ */
+struct led_classdev *devm_led_get(struct device *dev, char *function)
+{
+	struct led_classdev *led;
+
+	led = led_get(dev, function);
+	if (IS_ERR(led))
+		return led;
+
+	return __devm_led_get(dev, led);
+}
+EXPORT_SYMBOL_GPL(devm_led_get);
+
+/**
+ * led_add_lookup() - Add a LED lookup table entry
+ * @led_lookup: the lookup table entry to add
+ *
+ * Add a LED lookup table entry. On systems without devicetree the lookup table
+ * is used by led_get() to find LEDs.
+ */
+void led_add_lookup(struct led_lookup_data *led_lookup)
+{
+	mutex_lock(&leds_lookup_lock);
+	list_add_tail(&led_lookup->list, &leds_lookup_list);
+	mutex_unlock(&leds_lookup_lock);
+}
+EXPORT_SYMBOL_GPL(led_add_lookup);
+
+/**
+ * led_remove_lookup() - Remove a LED lookup table entry
+ * @led_lookup: the lookup table entry to remove
+ */
+void led_remove_lookup(struct led_lookup_data *led_lookup)
+{
+	mutex_lock(&leds_lookup_lock);
+	list_del(&led_lookup->list);
+	mutex_unlock(&leds_lookup_lock);
+}
+EXPORT_SYMBOL_GPL(led_remove_lookup);
+
 static int led_classdev_next_name(const char *init_name, char *name,
 				  size_t len)
 {
diff --git a/include/linux/leds.h b/include/linux/leds.h
index ba4861ec73d3..e44fc5ec7c9a 100644
--- a/include/linux/leds.h
+++ b/include/linux/leds.h
@@ -39,6 +39,18 @@ enum led_default_state {
 	LEDS_DEFSTATE_KEEP	= 2,
 };
 
+/*
+ * This is used to tell led_get() device which led_classdev to return for
+ * a specific consumer device-name, function pair on non devicetree platforms.
+ * Note all strings must be set.
+ */
+struct led_lookup_data {
+	struct list_head list;
+	const char *led_name;
+	const char *consumer_dev_name;
+	const char *consumer_function;
+};
+
 struct led_init_data {
 	/* device fwnode handle */
 	struct fwnode_handle *fwnode;
@@ -211,6 +223,12 @@ void devm_led_classdev_unregister(struct device *parent,
 void led_classdev_suspend(struct led_classdev *led_cdev);
 void led_classdev_resume(struct led_classdev *led_cdev);
 
+void led_add_lookup(struct led_lookup_data *led_lookup);
+void led_remove_lookup(struct led_lookup_data *led_lookup);
+
+struct led_classdev *__must_check led_get(struct device *dev, char *function);
+struct led_classdev *__must_check devm_led_get(struct device *dev, char *function);
+
 extern struct led_classdev *of_led_get(struct device_node *np, int index);
 extern void led_put(struct led_classdev *led_cdev);
 struct led_classdev *__must_check devm_of_led_get(struct device *dev,
-- 
2.38.1

