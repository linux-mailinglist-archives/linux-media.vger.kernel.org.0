Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E708328FA2
	for <lists+linux-media@lfdr.de>; Fri, 24 May 2019 05:31:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388847AbfEXDbH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 23 May 2019 23:31:07 -0400
Received: from mail-it1-f195.google.com ([209.85.166.195]:35416 "EHLO
        mail-it1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388804AbfEXDbG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 23 May 2019 23:31:06 -0400
Received: by mail-it1-f195.google.com with SMTP id u186so11767266ith.0
        for <linux-media@vger.kernel.org>; Thu, 23 May 2019 20:31:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Mv9CMN0i6nNcIH3+gboQPHuQ3PFIry51DtN3+zdUF0M=;
        b=IxNxaYrz95tN91XjVNI3UZ+WlfGO3SRzMiNHHQNCCLJouwGqKBfnwmZbq6bRWDhQrG
         aUOM8bJ4BAs6XD6I8cStJ6rWQQ+syKvXrRPJeXM6MmzODaNCzxsNOQaFm6HNC8HCwaqn
         xvXZ/p4QpAcYet2UxsjZ461n6UGmxiei8k9NM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Mv9CMN0i6nNcIH3+gboQPHuQ3PFIry51DtN3+zdUF0M=;
        b=MVJPzSFYXXbYFFmrdXQnxhCyRFtw7WMIELRa6QneAMUin0CymdnGuQiRlvPKGpY4uW
         Z5TkrA5MrcFj1RoWrzrusPAIAqCbuiHFMrXCk9+fIsKK8KGysEHl5f4GXNjxFKQPltJo
         SCzm7kAoCXIrNo9ZMxV+UAiIK+kWkWcaojfPeVjsOiAJTjE+OrmHEWhHnO1hp+/8OKZI
         XslO5UwEaPsJOCszy/7M0481hPKYJ4wc9fsxPjAax3WtkmlS/x0Nol9o5fJ/SLokeotH
         H9s7x06RevIR4uFjuAgYgnCNHLFMKKns+C8ojb0aTQRagty4wLoedqtJPl1ycSlj3fXc
         zmWg==
X-Gm-Message-State: APjAAAWKR4meWRvQN/ck238qGDpx1wk2fyIblgBJHGdtrK7QDteLQG/6
        AYOj07zY/lNqH6ykev/DARXflg==
X-Google-Smtp-Source: APXvYqzu4HFk3XLY67ReDmSSeHuX4CFH8VygT+5D9E6iMHvE0v5XoUNZtGm8DWCnSZ9pIcW9imvfKg==
X-Received: by 2002:a02:1006:: with SMTP id 6mr66453369jay.47.1558668665524;
        Thu, 23 May 2019 20:31:05 -0700 (PDT)
Received: from shuah-t480s.internal (c-24-9-64-241.hsd1.co.comcast.net. [24.9.64.241])
        by smtp.gmail.com with ESMTPSA id h185sm794380itb.16.2019.05.23.20.31.04
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 23 May 2019 20:31:05 -0700 (PDT)
From:   Shuah Khan <skhan@linuxfoundation.org>
To:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        helen.koike@collabora.com
Cc:     Shuah Khan <skhan@linuxfoundation.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] media: add generic device allocate interface to media-dev-allocator
Date:   Thu, 23 May 2019 21:31:01 -0600
Message-Id: <f4b11067f523b5727b9a44cf415ce265deffdfe0.1558667245.git.skhan@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1558667245.git.skhan@linuxfoundation.org>
References: <cover.1558667245.git.skhan@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Media Device Allocator API supports just USB devices. Enhance it
adding a genetic device allocate interface to support other media
drivers.

The new interface takes pointer to struct device instead and creates
media device. This interface allows a group of drivers that have a
common root device to share media device resource and ensure media
device doesn't get deleted as long as one of the drivers holds its
reference.

The new interface has been tested with vimc component driver to fix
panics when vimc module is removed while streaming is in progress.

Signed-off-by: Shuah Khan <skhan@linuxfoundation.org>
---
 drivers/media/Makefile              |  4 +--
 drivers/media/media-dev-allocator.c | 39 ++++++++++++++++++++++++
 include/media/media-dev-allocator.h | 46 +++++++++++++++++++++++++----
 3 files changed, 80 insertions(+), 9 deletions(-)

diff --git a/drivers/media/Makefile b/drivers/media/Makefile
index 4a330d0e5e40..3a4f7f74301d 100644
--- a/drivers/media/Makefile
+++ b/drivers/media/Makefile
@@ -7,9 +7,7 @@ media-objs	:= media-device.o media-devnode.o media-entity.o \
 		   media-request.o
 
 ifeq ($(CONFIG_MEDIA_CONTROLLER),y)
-	ifeq ($(CONFIG_USB),y)
-		media-objs += media-dev-allocator.o
-	endif
+	media-objs += media-dev-allocator.o
 endif
 
 #
diff --git a/drivers/media/media-dev-allocator.c b/drivers/media/media-dev-allocator.c
index ae17887dec59..4078e098cede 100644
--- a/drivers/media/media-dev-allocator.c
+++ b/drivers/media/media-dev-allocator.c
@@ -94,6 +94,7 @@ static struct media_device *__media_device_get(struct device *dev,
 	return &mdi->mdev;
 }
 
+#if IS_ENABLED(CONFIG_USB)
 struct media_device *media_device_usb_allocate(struct usb_device *udev,
 					       const char *module_name,
 					       struct module *owner)
@@ -115,6 +116,44 @@ struct media_device *media_device_usb_allocate(struct usb_device *udev,
 	return mdev;
 }
 EXPORT_SYMBOL_GPL(media_device_usb_allocate);
+#endif
+
+struct media_device *media_device_allocate(struct device *dev,
+					   const char *model,
+					   const char *bus_info,
+					   const char *module_name,
+					   struct module *owner)
+{
+	struct media_device *mdev;
+
+	mutex_lock(&media_device_lock);
+	mdev = __media_device_get(dev, module_name, owner);
+	if (!mdev) {
+		mutex_unlock(&media_device_lock);
+		return ERR_PTR(-ENOMEM);
+	}
+
+	if (!mdev->dev) {
+		/* Initialize media device */
+		if (model)
+			strscpy(mdev->model, model, sizeof(mdev->model));
+		else
+			strscpy(mdev->model, "Unkonw model",
+				sizeof(mdev->model));
+		if (bus_info)
+			strscpy(mdev->bus_info, bus_info,
+				sizeof(mdev->bus_info));
+		else
+			strscpy(mdev->bus_info, "Unknown bus_info",
+				sizeof(mdev->bus_info));
+		mdev->dev = dev;
+		media_device_init(mdev);
+	}
+
+	mutex_unlock(&media_device_lock);
+	return mdev;
+}
+EXPORT_SYMBOL_GPL(media_device_allocate);
 
 void media_device_delete(struct media_device *mdev, const char *module_name,
 			 struct module *owner)
diff --git a/include/media/media-dev-allocator.h b/include/media/media-dev-allocator.h
index b35ea6062596..479a3c52cf89 100644
--- a/include/media/media-dev-allocator.h
+++ b/include/media/media-dev-allocator.h
@@ -19,7 +19,8 @@
 
 struct usb_device;
 
-#if defined(CONFIG_MEDIA_CONTROLLER) && defined(CONFIG_USB)
+#if defined(CONFIG_MEDIA_CONTROLLER)
+#if defined(CONFIG_USB)
 /**
  * media_device_usb_allocate() - Allocate and return struct &media device
  *
@@ -38,6 +39,36 @@ struct usb_device;
 struct media_device *media_device_usb_allocate(struct usb_device *udev,
 					       const char *module_name,
 					       struct module *owner);
+#else
+static inline struct media_device *media_device_usb_allocate(
+			struct usb_device *udev, const char *module_name,
+			struct module *owner)
+			{ return NULL; }
+#endif /* CONFIG_USB */
+/**
+ * media_device_allocate() - Allocate and return struct &media device
+ *
+ * @udev:		struct &device pointer
+ * @model:		should be filled with device model name
+ * @bus_info:		should be filled with device bus information:
+ *			Unique and stable device location identifier
+ *			as defined in struct media_device
+ * @module_name:	should be filled with %KBUILD_MODNAME
+ * @owner:		struct module pointer %THIS_MODULE for the driver.
+ *			%THIS_MODULE is null for a built-in driver.
+ *			It is safe even when %THIS_MODULE is null.
+ *
+ * This interface should be called to allocate a Media Device when multiple
+ * drivers/sub-drivers share device and the media device. This interface
+ * allocates &media_device structure and calls media_device_init() to
+ * initialize it.
+ *
+ */
+struct media_device *media_device_allocate(struct device *dev,
+					   const char *model,
+					   const char *bus_info,
+					   const char *module_name,
+					   struct module *owner);
 /**
  * media_device_delete() - Release media device. Calls kref_put().
  *
@@ -52,12 +83,15 @@ struct media_device *media_device_usb_allocate(struct usb_device *udev,
 void media_device_delete(struct media_device *mdev, const char *module_name,
 			 struct module *owner);
 #else
-static inline struct media_device *media_device_usb_allocate(
-			struct usb_device *udev, const char *module_name,
-			struct module *owner)
-			{ return NULL; }
+static inline struct media_device *media_device_allocate(
+					struct device *dev,
+					const char *model,
+					const char *bus_info,
+					const char *module_name,
+					struct module *owner)
+					{ return NULL; }
 static inline void media_device_delete(
 			struct media_device *mdev, const char *module_name,
 			struct module *owner) { }
-#endif /* CONFIG_MEDIA_CONTROLLER && CONFIG_USB */
+#endif /* CONFIG_MEDIA_CONTROLLER */
 #endif /* _MEDIA_DEV_ALLOCATOR_H */
-- 
2.17.1

