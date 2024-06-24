Return-Path: <linux-media+bounces-14040-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A1899146C7
	for <lists+linux-media@lfdr.de>; Mon, 24 Jun 2024 11:56:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8D5401C22364
	for <lists+linux-media@lfdr.de>; Mon, 24 Jun 2024 09:56:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A17B134410;
	Mon, 24 Jun 2024 09:56:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Sc9fgr+U"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 960F413248E
	for <linux-media@vger.kernel.org>; Mon, 24 Jun 2024 09:56:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719222985; cv=none; b=ZrczOIyx2cVw6UemEMk8qIyBnsyUfECUd4u5H8Zz+SSKDHu5UCytLFEKOV7hcoYPwrl4i0e0Na3UKFGOz3HHtV3onl7gNl19qXDnBORjLhytX4BNYpb3VuQO54qooFf24u8uMRtlNIw4pLlHK4m7Ba4AB5uolOIV5CfsinGXfOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719222985; c=relaxed/simple;
	bh=ZbxkaXUjkoKEBQIHe7O84lbuiaoG7L3RP7sepkCl9so=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=V7fHwxmFQdctauarkOUbVTaBysCSzbu35LpdSfnKIUA9XLQsoR3GYHzF3YnPFGurvPc+5GXVubJVtHJ2hpD/7x+TOHgV/0tK4xoBpijGR1q3UXsAA/vDXkCzgGGHT+daff7e9hQsOEaEhar/lYntlUJsaJ0WOkE9Oc9QjHcUjts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Sc9fgr+U; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4217136a74dso33424075e9.2
        for <linux-media@vger.kernel.org>; Mon, 24 Jun 2024 02:56:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719222982; x=1719827782; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L90fFcZUTsPRJLMIQLbMgoHBhy3pX5pcNxZhWtqHv0w=;
        b=Sc9fgr+USvpij/NztAmBKfsoVSHof+EJ3XoV1fPB1WZEA24IE0QhKBKfFSkP1a3Kg0
         +ECililUXwy/0gYY5Mb0bXJJfNH0JZrg74xfAV8a561e8rfJdrBLshf2S+PMqxqERI6F
         EaCj9eCsWj0xeotuadg7pWtUO82i9AUwwOCha5YvUZ7fskp+clmXA1an/trDVjwpYeAr
         oKJ5DVmTJ4MR5krQIbNQJjgjrAa9hsEjWxU8Xn7jRDPPaucLNV0RVK2a+VyWaW0XAMaV
         5b6co1blXrG8sofWKbmkZYMdr10nogfqaHu6xHQqYtbXMFR72NXKx/FMuMnmqchH2tHC
         oGig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719222982; x=1719827782;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L90fFcZUTsPRJLMIQLbMgoHBhy3pX5pcNxZhWtqHv0w=;
        b=JZG9FMOg7WBNgaYOi0TNRRi7nqTpiE37mImEbB0L7DHFWeiaqz4j317aw8dg4N604U
         OsA6t8vBIfnmBB5C9k38v+E1+Az1UhjTTPen4YqwVHH1Kh3kXgCXy067MH0oX7UYLVYv
         Hirm96ify2u+xbOrkxZwMDEyfWqCnhlJmc9+vRPRExIUwYzvBa4/Ey8KbXHuBKMHTrFX
         ubAbqhOV26gwxAds3cOHxq4zTOoTeKOVgFm0k7o7SGWeZSoqr+S3QArerVOIXj1S4pEP
         4dxBNwku1HcvLvx3TnUqLoG7rtGBE/D5NOKE1lHXidxTZ2I10vB3VggDeYckqWH1soFR
         npaA==
X-Gm-Message-State: AOJu0Yy/omE2etSLR09P/4ez807rZv4b0B7Wce0R6rlAHxKkWWA9PJlk
	0+9ySF0z/OyWPkkTaonA3RZMSddmcZWAcPs5RVcDqp8Dyd2+1AY6HMtEx7s=
X-Google-Smtp-Source: AGHT+IEQMkZ62smg5rNTkfph1O56O3HHjnuRbzt+EaxEfIthxYqXfUP/xaHfXD1TYKgEwP6uVlhYYA==
X-Received: by 2002:a05:600c:3501:b0:424:8ff8:b12e with SMTP id 5b1f17b1804b1-4248ff8b1b6mr19497965e9.11.1719222981652;
        Mon, 24 Jun 2024 02:56:21 -0700 (PDT)
Received: from localhost.localdomain ([105.163.2.38])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-424817b5ca0sm128258475e9.24.2024.06.24.02.56.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jun 2024 02:56:21 -0700 (PDT)
From: Dorcas Anono Litunya <anonolitunya@gmail.com>
To: linux-media@vger.kernel.org
Cc: anonolitunya@gmail.com,
	jaffe1@gmail.com,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 08/10] media: vivid: Add 'Is Connected To' menu controls
Date: Mon, 24 Jun 2024 12:53:02 +0300
Message-Id: <20240624095300.745567-9-anonolitunya@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240624095300.745567-1-anonolitunya@gmail.com>
References: <20240624095300.745567-1-anonolitunya@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The video loopback functionality in vivid is very crude. What we really
want is to be able to emulate connecting an HDMI or S-Video input to
an HDMI or S-Video output, and the input and output can be in different
vivid instances.

Effectively this emulates what happens when you physically connect an
HDMI or S-Video cable between two devices.

In particular, this makes prototyping with vivid much more realistic.

This patch creates a menu control for each HDMI or S-Video input. The
menu control starts with "Test Pattern Generator" and "None" (i.e.
disconnected). After that up to 62 HDMI or S-Video outputs are listed
that you can connect the input to.

If there are more than 62 HDMI or S-Video outputs, then those will not
be included in the menu (currently menucontrols have max 64 entries).

If an input is connected to an output, then all other 'Connected To'
controls are updated to exclude that output to avoid having multiple
inputs connected to the same output.

Signed-off-by: Dorcas Anono Litunya <anonolitunya@gmail.com>
Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/test-drivers/vivid/vivid-core.c | 207 +++++++++++++++++-
 drivers/media/test-drivers/vivid/vivid-core.h | 109 ++++++++-
 .../media/test-drivers/vivid/vivid-ctrls.c    | 102 +++++++++
 3 files changed, 401 insertions(+), 17 deletions(-)

diff --git a/drivers/media/test-drivers/vivid/vivid-core.c b/drivers/media/test-drivers/vivid/vivid-core.c
index 4a9d9b30aa42..7eb8a0a5d4d3 100644
--- a/drivers/media/test-drivers/vivid/vivid-core.c
+++ b/drivers/media/test-drivers/vivid/vivid-core.c
@@ -1,4 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0-only
+
 /*
  * vivid-core.c - A Virtual Video Test Driver, core initialization
  *
@@ -42,15 +43,13 @@
 #include "vivid-touch-cap.h"
 
 #define VIVID_MODULE_NAME "vivid"
-
-/* The maximum number of vivid devices */
-#define VIVID_MAX_DEVS CONFIG_VIDEO_VIVID_MAX_DEVS
+#define MAX_STRING_LENGTH 23
 
 MODULE_DESCRIPTION("Virtual Video Test Driver");
 MODULE_AUTHOR("Hans Verkuil");
 MODULE_LICENSE("GPL");
 
-static unsigned n_devs = 1;
+unsigned int n_devs = 1;
 module_param(n_devs, uint, 0444);
 MODULE_PARM_DESC(n_devs, " number of driver instances to create");
 
@@ -186,7 +185,31 @@ MODULE_PARM_DESC(supports_requests, " support for requests, default is 1.\n"
 			     "\t\t    1 == supports requests\n"
 			     "\t\t    2 == requires requests");
 
-static struct vivid_dev *vivid_devs[VIVID_MAX_DEVS];
+struct vivid_dev *vivid_devs[VIVID_MAX_DEVS];
+
+DEFINE_SPINLOCK(hdmi_output_skip_mask_lock);
+struct workqueue_struct *update_hdmi_ctrls_workqueue;
+u64 hdmi_to_output_menu_skip_mask;
+
+struct vivid_dev *vivid_ctrl_hdmi_to_output_instance[MAX_MENU_ITEMS];
+unsigned int vivid_ctrl_hdmi_to_output_index[MAX_MENU_ITEMS];
+
+char *vivid_ctrl_hdmi_to_output_strings[MAX_MENU_ITEMS + 1] = {
+	"Test Pattern Generator",
+	"None"
+};
+
+DEFINE_SPINLOCK(svid_output_skip_mask_lock);
+struct workqueue_struct *update_svid_ctrls_workqueue;
+u64 svid_to_output_menu_skip_mask;
+
+struct vivid_dev *vivid_ctrl_svid_to_output_instance[MAX_MENU_ITEMS];
+unsigned int vivid_ctrl_svid_to_output_index[MAX_MENU_ITEMS];
+
+char *vivid_ctrl_svid_to_output_strings[MAX_MENU_ITEMS + 1] = {
+	"Test Pattern Generator",
+	"None"
+};
 
 const struct v4l2_rect vivid_min_rect = {
 	0, 0, MIN_WIDTH, MIN_HEIGHT
@@ -827,6 +850,7 @@ static void vivid_dev_release(struct v4l2_device *v4l2_dev)
 {
 	struct vivid_dev *dev = container_of(v4l2_dev, struct vivid_dev, v4l2_dev);
 
+	cancel_work_sync(&dev->update_hdmi_ctrl_work);
 	vivid_free_controls(dev);
 	v4l2_device_unregister(&dev->v4l2_dev);
 #ifdef CONFIG_MEDIA_CONTROLLER
@@ -946,6 +970,7 @@ static int vivid_detect_feature_set(struct vivid_dev *dev, int inst,
 		dev->num_inputs--;
 	}
 	dev->num_hdmi_inputs = in_type_counter[HDMI];
+	dev->num_svid_inputs = in_type_counter[SVID];
 
 	/* how many outputs do we have and of what type? */
 	dev->num_outputs = num_outputs[inst];
@@ -1734,6 +1759,42 @@ static int vivid_create_devnodes(struct platform_device *pdev,
 	return 0;
 }
 
+static void update_hdmi_ctrls_work_handler(struct work_struct *work)
+{
+	u64 skip_mask;
+
+	spin_lock(&hdmi_output_skip_mask_lock);
+	skip_mask = hdmi_to_output_menu_skip_mask;
+	spin_unlock(&hdmi_output_skip_mask_lock);
+	for (int i = 0; i < n_devs && vivid_devs[i]; i++) {
+		for (int j = 0; j < vivid_devs[i]->num_hdmi_inputs; j++) {
+			struct v4l2_ctrl *c = vivid_devs[i]->ctrl_hdmi_to_output[j];
+
+			v4l2_ctrl_modify_range(c, c->minimum, c->maximum,
+					       skip_mask & ~(1ULL << c->cur.val),
+					       c->default_value);
+		}
+	}
+}
+
+static void update_svid_ctrls_work_handler(struct work_struct *work)
+{
+	u64 skip_mask;
+
+	spin_lock(&svid_output_skip_mask_lock);
+	skip_mask = svid_to_output_menu_skip_mask;
+	spin_unlock(&svid_output_skip_mask_lock);
+	for (int i = 0; i < n_devs && vivid_devs[i]; i++) {
+		for (int j = 0; j < vivid_devs[i]->num_svid_inputs; j++) {
+			struct v4l2_ctrl *c = vivid_devs[i]->ctrl_svid_to_output[j];
+
+			v4l2_ctrl_modify_range(c, c->minimum, c->maximum,
+					       skip_mask & ~(1ULL << c->cur.val),
+					       c->default_value);
+		}
+	}
+}
+
 static int vivid_create_instance(struct platform_device *pdev, int inst)
 {
 	static const struct v4l2_dv_timings def_dv_timings =
@@ -1850,6 +1911,22 @@ static int vivid_create_instance(struct platform_device *pdev, int inst)
 	dev->edid_max_blocks = dev->edid_blocks = 2;
 	memcpy(dev->edid, vivid_hdmi_edid, sizeof(vivid_hdmi_edid));
 	dev->radio_rds_init_time = ktime_get();
+	INIT_WORK(&dev->update_hdmi_ctrl_work, update_hdmi_ctrls_work_handler);
+	INIT_WORK(&dev->update_svid_ctrl_work, update_svid_ctrls_work_handler);
+	for (int j = 0, k = 0; j < dev->num_inputs; ++j)
+		if (dev->input_type[j] == HDMI)
+			dev->hdmi_index_to_input_index[k++] = j;
+	for (int j = 0, k = 0; j < dev->num_outputs; ++j)
+		if (dev->output_type[j] == HDMI) {
+			dev->output_to_iface_index[j] = k;
+			dev->hdmi_index_to_output_index[k++] = j;
+		}
+	for (int j = 0, k = 0; j < dev->num_inputs; ++j)
+		if (dev->input_type[j] == SVID)
+			dev->svid_index_to_input_index[k++] = j;
+	for (int j = 0, k = 0; j < dev->num_outputs; ++j)
+		if (dev->output_type[j] == SVID)
+			dev->output_to_iface_index[j] = k++;
 
 	/* create all controls */
 	ret = vivid_create_controls(dev, ccs_cap == -1, ccs_out == -1, no_error_inj,
@@ -1986,7 +2063,7 @@ static int vivid_create_instance(struct platform_device *pdev, int inst)
 	vb2_video_unregister_device(&dev->vid_out_dev);
 	vb2_video_unregister_device(&dev->vid_cap_dev);
 	cec_unregister_adapter(dev->cec_rx_adap);
-	for (i = 0; i < MAX_OUTPUTS; i++)
+	for (i = 0; i < MAX_HDMI_OUTPUTS; i++)
 		cec_unregister_adapter(dev->cec_tx_adap[i]);
 	if (dev->kthread_cec)
 		kthread_stop(dev->kthread_cec);
@@ -2033,6 +2110,42 @@ static int vivid_probe(struct platform_device *pdev)
 	/* n_devs will reflect the actual number of allocated devices */
 	n_devs = i;
 
+	/* Determine qmenu items actually in use */
+	int hdmi_count = FIXED_MENU_ITEMS;
+	int svid_count = FIXED_MENU_ITEMS;
+
+	for (int i = 0; i < n_devs; i++) {
+		struct vivid_dev *dev = vivid_devs[i];
+
+		if (!dev->has_vid_out)
+			continue;
+		for (int j = 0; j < dev->num_outputs && hdmi_count < MAX_MENU_ITEMS; ++j) {
+			if (dev->output_type[j] == HDMI) {
+				vivid_ctrl_hdmi_to_output_instance[hdmi_count] = vivid_devs[i];
+				vivid_ctrl_hdmi_to_output_index[hdmi_count++] = j;
+			}
+		}
+		for (int j = 0; j < dev->num_outputs && svid_count < MAX_MENU_ITEMS; ++j) {
+			if (dev->output_type[j] == SVID) {
+				vivid_ctrl_svid_to_output_instance[svid_count] = vivid_devs[i];
+				vivid_ctrl_svid_to_output_index[svid_count++] = j;
+			}
+		}
+	}
+	hdmi_count = min(hdmi_count, MAX_MENU_ITEMS);
+	svid_count = min(svid_count, MAX_MENU_ITEMS);
+	for (int i = 0; i < n_devs; i++) {
+		for (int j = 0; j < vivid_devs[i]->num_hdmi_inputs; j++) {
+			struct v4l2_ctrl *c = vivid_devs[i]->ctrl_hdmi_to_output[j];
+
+			v4l2_ctrl_modify_range(c, c->minimum, hdmi_count - 1, 0, c->default_value);
+		}
+		for (int j = 0; j < vivid_devs[i]->num_svid_inputs; j++) {
+			struct v4l2_ctrl *c = vivid_devs[i]->ctrl_svid_to_output[j];
+
+			v4l2_ctrl_modify_range(c, c->minimum, svid_count - 1, 0, c->default_value);
+		}
+	}
 	return ret;
 }
 
@@ -2109,7 +2222,7 @@ static void vivid_remove(struct platform_device *pdev)
 			vb2_video_unregister_device(&dev->touch_cap_dev);
 		}
 		cec_unregister_adapter(dev->cec_rx_adap);
-		for (j = 0; j < MAX_OUTPUTS; j++)
+		for (j = 0; j < MAX_HDMI_OUTPUTS; j++)
 			cec_unregister_adapter(dev->cec_tx_adap[j]);
 		if (dev->kthread_cec)
 			kthread_stop(dev->kthread_cec);
@@ -2137,21 +2250,91 @@ static struct platform_driver vivid_pdrv = {
 
 static int __init vivid_init(void)
 {
-	int ret;
-
+	int hdmi_count = FIXED_MENU_ITEMS;
+	int svid_count = FIXED_MENU_ITEMS;
+	int ret = -ENOMEM;
+	unsigned int ndevs;
+
+	/* Sanity check, prevent insane number of vivid instances */
+	if (n_devs > 64)
+		n_devs = 64;
+	ndevs = clamp_t(unsigned int, n_devs, 1, VIVID_MAX_DEVS);
+
+	for (unsigned int i = 0; i < ndevs; i++) {
+		if (!(node_types[i] & (1 << 8)))
+			continue;
+		unsigned int n_outputs = min(num_outputs[i], MAX_OUTPUTS);
+
+		for (u8 j = 0, k = 0; j < n_outputs && hdmi_count < MAX_MENU_ITEMS &&
+		     k < MAX_HDMI_OUTPUTS; ++j) {
+			if (output_types[i] & BIT(j)) {
+				vivid_ctrl_hdmi_to_output_strings[hdmi_count] =
+					kmalloc(MAX_STRING_LENGTH, GFP_KERNEL);
+				if (!vivid_ctrl_hdmi_to_output_strings[hdmi_count])
+					goto free_output_strings;
+				snprintf(vivid_ctrl_hdmi_to_output_strings[hdmi_count],
+					 MAX_STRING_LENGTH, "Output HDMI %03d-%d",
+					 i & 0xff, k);
+				k++;
+				hdmi_count++;
+			}
+		}
+		for (u8 j = 0, k = 0; j < n_outputs && svid_count < MAX_MENU_ITEMS; ++j) {
+			if (!(output_types[i] & BIT(j))) {
+				vivid_ctrl_svid_to_output_strings[svid_count] =
+					kmalloc(MAX_STRING_LENGTH, GFP_KERNEL);
+				if (!vivid_ctrl_svid_to_output_strings[svid_count])
+					goto free_output_strings;
+				snprintf(vivid_ctrl_svid_to_output_strings[svid_count],
+					 MAX_STRING_LENGTH, "Output S-Video %03d-%d",
+					 i & 0xff, k);
+				k++;
+				svid_count++;
+			}
+		}
+	}
 	ret = platform_device_register(&vivid_pdev);
 	if (ret)
-		return ret;
-
+		goto free_output_strings;
 	ret = platform_driver_register(&vivid_pdrv);
 	if (ret)
-		platform_device_unregister(&vivid_pdev);
+		goto unreg_device;
+
+	/* Initialize workqueue before module is loaded */
+	update_hdmi_ctrls_workqueue = create_workqueue("update_hdmi_ctrls_wq");
+	if (!update_hdmi_ctrls_workqueue) {
+		ret = -ENOMEM;
+		goto unreg_driver;
+	}
+	update_svid_ctrls_workqueue = create_workqueue("update_svid_ctrls_wq");
+	if (!update_svid_ctrls_workqueue) {
+		ret = -ENOMEM;
+		goto destroy_hdmi_wq;
+	}
+	return ret;
 
+destroy_hdmi_wq:
+	destroy_workqueue(update_hdmi_ctrls_workqueue);
+unreg_driver:
+	platform_driver_register(&vivid_pdrv);
+unreg_device:
+	platform_device_unregister(&vivid_pdev);
+free_output_strings:
+	for (int i = FIXED_MENU_ITEMS; i < MAX_MENU_ITEMS; i++) {
+		kfree(vivid_ctrl_hdmi_to_output_strings[i]);
+		kfree(vivid_ctrl_svid_to_output_strings[i]);
+	}
 	return ret;
 }
 
 static void __exit vivid_exit(void)
 {
+	for (int i = FIXED_MENU_ITEMS; i < MAX_MENU_ITEMS; i++) {
+		kfree(vivid_ctrl_hdmi_to_output_strings[i]);
+		kfree(vivid_ctrl_svid_to_output_strings[i]);
+	}
+	destroy_workqueue(update_svid_ctrls_workqueue);
+	destroy_workqueue(update_hdmi_ctrls_workqueue);
 	platform_driver_unregister(&vivid_pdrv);
 	platform_device_unregister(&vivid_pdev);
 }
diff --git a/drivers/media/test-drivers/vivid/vivid-core.h b/drivers/media/test-drivers/vivid/vivid-core.h
index cfb8e66083f6..b0c5b7369de5 100644
--- a/drivers/media/test-drivers/vivid/vivid-core.h
+++ b/drivers/media/test-drivers/vivid/vivid-core.h
@@ -50,10 +50,87 @@
 #define JIFFIES_PER_DAY (3600U * 24U * HZ)
 #define JIFFIES_RESYNC (JIFFIES_PER_DAY * (0xf0000000U / JIFFIES_PER_DAY))
 
+/*
+ * Maximum number of HDMI inputs allowed by vivid, due to limitations
+ * of the Physical Address in the EDID and used by CEC we stop at 15
+ * inputs and outputs.
+ */
+#define MAX_HDMI_INPUTS 15
+#define MAX_HDMI_OUTPUTS 15
+
+/* Maximum number of S-Video inputs allowed by vivid */
+#define MAX_SVID_INPUTS 16
+
+/* The maximum number of items in a menu control */
+#define MAX_MENU_ITEMS BITS_PER_LONG_LONG
+
+/* Number of fixed menu items in the 'Connected To' menu controls */
+#define FIXED_MENU_ITEMS 2
+
+/* The maximum number of vivid devices */
+#define VIVID_MAX_DEVS CONFIG_VIDEO_VIVID_MAX_DEVS
+
 extern const struct v4l2_rect vivid_min_rect;
 extern const struct v4l2_rect vivid_max_rect;
 extern unsigned vivid_debug;
 
+/*
+ * NULL-terminated string array for the HDMI 'Connected To' menu controls
+ * with the list of possible HDMI outputs.
+ *
+ * The first two items are fixed ("TPG" and "None").
+ */
+extern char *vivid_ctrl_hdmi_to_output_strings[1 + MAX_MENU_ITEMS];
+/* Menu control skip mask of all HDMI outputs that are in use */
+extern u64 hdmi_to_output_menu_skip_mask;
+/* Spinlock for access to hdmi_to_output_menu_skip_mask */
+extern spinlock_t hdmi_output_skip_mask_lock;
+/*
+ * Workqueue that updates the menu controls whenever the HDMI menu skip mask
+ * changes.
+ */
+extern struct workqueue_struct *update_hdmi_ctrls_workqueue;
+
+/*
+ * The HDMI menu control value (index in the menu list) maps to an HDMI
+ * output that is part of the given vivid_dev instance and has the given
+ * output index (as returned by VIDIOC_G_OUTPUT).
+ *
+ * NULL/0 if not available.
+ */
+extern struct vivid_dev *vivid_ctrl_hdmi_to_output_instance[MAX_MENU_ITEMS];
+extern unsigned int vivid_ctrl_hdmi_to_output_index[MAX_MENU_ITEMS];
+
+/*
+ * NULL-terminated string array for the S-Video 'Connected To' menu controls
+ * with the list of possible S-Video outputs.
+ *
+ * The first two items are fixed ("TPG" and "None").
+ */
+extern char *vivid_ctrl_svid_to_output_strings[1 + MAX_MENU_ITEMS];
+/* Menu control skip mask of all S-Video outputs that are in use */
+extern u64 svid_to_output_menu_skip_mask;
+/* Spinlock for access to svid_to_output_menu_skip_mask */
+extern spinlock_t svid_output_skip_mask_lock;
+/*
+ * Workqueue that updates the menu controls whenever the S-Video menu skip mask
+ * changes.
+ */
+extern struct workqueue_struct *update_svid_ctrls_workqueue;
+
+/*
+ * The S-Video menu control value (index in the menu list) maps to an S-Video
+ * output that is part of the given vivid_dev instance and has the given
+ * output index (as returned by VIDIOC_G_OUTPUT).
+ *
+ * NULL/0 if not available.
+ */
+extern struct vivid_dev *vivid_ctrl_svid_to_output_instance[MAX_MENU_ITEMS];
+extern unsigned int vivid_ctrl_svid_to_output_index[MAX_MENU_ITEMS];
+
+extern struct vivid_dev *vivid_devs[VIVID_MAX_DEVS];
+extern unsigned int n_devs;
+
 struct vivid_fmt {
 	u32	fourcc;          /* v4l2 format id */
 	enum	tgp_color_enc color_enc;
@@ -118,7 +195,7 @@ struct vivid_cec_xfer {
 };
 
 struct vivid_dev {
-	unsigned			inst;
+	u8				inst;
 	struct v4l2_device		v4l2_dev;
 #ifdef CONFIG_MEDIA_CONTROLLER
 	struct media_device		mdev;
@@ -161,6 +238,8 @@ struct vivid_dev {
 
 	spinlock_t			slock;
 	struct mutex			mutex;
+	struct work_struct		update_hdmi_ctrl_work;
+	struct work_struct		update_svid_ctrl_work;
 
 	/* capabilities */
 	u32				vid_cap_caps;
@@ -176,12 +255,13 @@ struct vivid_dev {
 
 	/* supported features */
 	bool				multiplanar;
-	unsigned			num_inputs;
-	unsigned int			num_hdmi_inputs;
+	u8				num_inputs;
+	u8				num_hdmi_inputs;
+	u8				num_svid_inputs;
 	u8				input_type[MAX_INPUTS];
 	u8				input_name_counter[MAX_INPUTS];
-	unsigned			num_outputs;
-	unsigned int			num_hdmi_outputs;
+	u8				num_outputs;
+	u8				num_hdmi_outputs;
 	u8				output_type[MAX_OUTPUTS];
 	u8				output_name_counter[MAX_OUTPUTS];
 	bool				has_audio_inputs;
@@ -204,6 +284,20 @@ struct vivid_dev {
 	bool				has_touch_cap;
 
 	bool				can_loop_video;
+	/* Output index (0-MAX_OUTPUTS) to vivid instance of connected input */
+	struct vivid_dev		*output_to_input_instance[MAX_OUTPUTS];
+	/* Output index (0-MAX_OUTPUTS) to input index (0-MAX_INPUTS) of connected input */
+	u8				output_to_input_index[MAX_OUTPUTS];
+	/* Output index (0-MAX_OUTPUTS) to HDMI or S-Video output index (0-MAX_HDMI/SVID_OUTPUTS) */
+	u8				output_to_iface_index[MAX_OUTPUTS];
+	/* ctrl_hdmi_to_output or ctrl_svid_to_output control value for each input */
+	s32                             input_is_connected_to_output[MAX_INPUTS];
+	/* HDMI index (0-MAX_HDMI_OUTPUTS) to output index (0-MAX_OUTPUTS) */
+	u8				hdmi_index_to_output_index[MAX_HDMI_OUTPUTS];
+	/* HDMI index (0-MAX_HDMI_INPUTS) to input index (0-MAX_INPUTS) */
+	u8				hdmi_index_to_input_index[MAX_HDMI_INPUTS];
+	/* S-Video index (0-MAX_SVID_INPUTS) to input index (0-MAX_INPUTS) */
+	u8				svid_index_to_input_index[MAX_SVID_INPUTS];
 
 	/* controls */
 	struct v4l2_ctrl		*brightness;
@@ -276,6 +370,11 @@ struct vivid_dev {
 	struct v4l2_ctrl		*radio_rx_rds_psname;
 	struct v4l2_ctrl		*radio_rx_rds_radiotext;
 
+	struct v4l2_ctrl                *ctrl_hdmi_to_output[MAX_HDMI_INPUTS];
+	char				ctrl_hdmi_to_output_names[MAX_HDMI_INPUTS][32];
+	struct v4l2_ctrl		*ctrl_svid_to_output[MAX_SVID_INPUTS];
+	char				ctrl_svid_to_output_names[MAX_SVID_INPUTS][32];
+
 	unsigned			input_brightness[MAX_INPUTS];
 	unsigned			osd_mode;
 	unsigned			button_pressed;
diff --git a/drivers/media/test-drivers/vivid/vivid-ctrls.c b/drivers/media/test-drivers/vivid/vivid-ctrls.c
index f2b20e25a7a4..f278bd86e99d 100644
--- a/drivers/media/test-drivers/vivid/vivid-ctrls.c
+++ b/drivers/media/test-drivers/vivid/vivid-ctrls.c
@@ -104,6 +104,12 @@
 #define VIVID_CID_META_CAP_GENERATE_PTS	(VIVID_CID_VIVID_BASE + 111)
 #define VIVID_CID_META_CAP_GENERATE_SCR	(VIVID_CID_VIVID_BASE + 112)
 
+/* HDMI inputs are in the range 0-14. The next available CID is VIVID_CID_VIVID_BASE + 128 */
+#define VIVID_CID_HDMI_IS_CONNECTED_TO_OUTPUT(input) (VIVID_CID_VIVID_BASE + 113 + (input))
+
+/* S-Video inputs are in the range 0-15. The next available CID is VIVID_CID_VIVID_BASE + 144 */
+#define VIVID_CID_SVID_IS_CONNECTED_TO_OUTPUT(input) (VIVID_CID_VIVID_BASE + 128 + (input))
+
 /* General User Controls */
 
 static void vivid_unregister_dev(bool valid, struct video_device *vdev)
@@ -454,6 +460,10 @@ static int vivid_vid_cap_s_ctrl(struct v4l2_ctrl *ctrl)
 	};
 	struct vivid_dev *dev = container_of(ctrl->handler, struct vivid_dev, ctrl_hdl_vid_cap);
 	unsigned int i, j;
+	struct vivid_dev *output_inst = NULL;
+	int index = 0;
+	int hdmi_index, svid_index;
+	s32 input_index = 0;
 
 	switch (ctrl->id) {
 	case VIVID_CID_TEST_PATTERN:
@@ -604,6 +614,56 @@ static int vivid_vid_cap_s_ctrl(struct v4l2_ctrl *ctrl)
 		if (dev->edid_blocks > dev->edid_max_blocks)
 			dev->edid_blocks = dev->edid_max_blocks;
 		break;
+	case VIVID_CID_HDMI_IS_CONNECTED_TO_OUTPUT(0) ... VIVID_CID_HDMI_IS_CONNECTED_TO_OUTPUT(14):
+		hdmi_index = ctrl->id - VIVID_CID_HDMI_IS_CONNECTED_TO_OUTPUT(0);
+		output_inst = vivid_ctrl_hdmi_to_output_instance[ctrl->cur.val];
+		index = vivid_ctrl_hdmi_to_output_index[ctrl->cur.val];
+		input_index = dev->hdmi_index_to_input_index[hdmi_index];
+		dev->input_is_connected_to_output[input_index] = ctrl->val;
+
+		if (output_inst)
+			output_inst->output_to_input_instance[index] = NULL;
+		if (ctrl->val >= FIXED_MENU_ITEMS) {
+			output_inst = vivid_ctrl_hdmi_to_output_instance[ctrl->val];
+			index = vivid_ctrl_hdmi_to_output_index[ctrl->val];
+			output_inst->output_to_input_instance[index] = dev;
+			output_inst->output_to_input_index[index] =
+				dev->hdmi_index_to_input_index[hdmi_index];
+		}
+		spin_lock(&hdmi_output_skip_mask_lock);
+		hdmi_to_output_menu_skip_mask &= ~(1ULL << ctrl->cur.val);
+		if (ctrl->val >= FIXED_MENU_ITEMS)
+			hdmi_to_output_menu_skip_mask |= 1ULL << ctrl->val;
+		spin_unlock(&hdmi_output_skip_mask_lock);
+		if (ctrl->val < FIXED_MENU_ITEMS && ctrl->cur.val < FIXED_MENU_ITEMS)
+			break;
+		queue_work(update_hdmi_ctrls_workqueue, &dev->update_hdmi_ctrl_work);
+		break;
+	case VIVID_CID_SVID_IS_CONNECTED_TO_OUTPUT(0) ... VIVID_CID_SVID_IS_CONNECTED_TO_OUTPUT(15):
+		svid_index = ctrl->id - VIVID_CID_SVID_IS_CONNECTED_TO_OUTPUT(0);
+		output_inst = vivid_ctrl_svid_to_output_instance[ctrl->cur.val];
+		index = vivid_ctrl_svid_to_output_index[ctrl->cur.val];
+		input_index = dev->svid_index_to_input_index[svid_index];
+		dev->input_is_connected_to_output[input_index] = ctrl->val;
+
+		if (output_inst)
+			output_inst->output_to_input_instance[index] = NULL;
+		if (ctrl->val >= FIXED_MENU_ITEMS) {
+			output_inst = vivid_ctrl_svid_to_output_instance[ctrl->val];
+			index = vivid_ctrl_svid_to_output_index[ctrl->val];
+			output_inst->output_to_input_instance[index] = dev;
+			output_inst->output_to_input_index[index] =
+				dev->svid_index_to_input_index[svid_index];
+		}
+		spin_lock(&svid_output_skip_mask_lock);
+		svid_to_output_menu_skip_mask &= ~(1ULL << ctrl->cur.val);
+		if (ctrl->val >= FIXED_MENU_ITEMS)
+			svid_to_output_menu_skip_mask |= 1ULL << ctrl->val;
+		spin_unlock(&svid_output_skip_mask_lock);
+		if (ctrl->val < FIXED_MENU_ITEMS && ctrl->cur.val < FIXED_MENU_ITEMS)
+			break;
+		queue_work(update_svid_ctrls_workqueue, &dev->update_svid_ctrl_work);
+		break;
 	}
 	return 0;
 }
@@ -1710,6 +1770,48 @@ int vivid_create_controls(struct vivid_dev *dev, bool show_ccs_cap,
 		v4l2_ctrl_new_custom(hdl_vid_cap, &vivid_ctrl_insert_eav, NULL);
 		v4l2_ctrl_new_custom(hdl_vid_cap, &vivid_ctrl_insert_hdmi_video_guard_band, NULL);
 		v4l2_ctrl_new_custom(hdl_vid_cap, &vivid_ctrl_reduced_fps, NULL);
+
+		WARN_ON(dev->num_hdmi_inputs > MAX_HDMI_INPUTS);
+		WARN_ON(dev->num_svid_inputs > MAX_SVID_INPUTS);
+
+		for (int i = 0; i < dev->num_hdmi_inputs; i++) {
+			snprintf(dev->ctrl_hdmi_to_output_names[i],
+				 sizeof(dev->ctrl_hdmi_to_output_names[i]),
+				 "HDMI %03u-%u Is Connected To", dev->inst, i);
+		}
+
+		for (int i = 0; i < dev->num_hdmi_inputs; i++) {
+			struct v4l2_ctrl_config ctrl_config = {
+				.ops = &vivid_vid_cap_ctrl_ops,
+				.id = VIVID_CID_HDMI_IS_CONNECTED_TO_OUTPUT(i),
+				.name = dev->ctrl_hdmi_to_output_names[i],
+				.type = V4L2_CTRL_TYPE_MENU,
+				.max = 1,
+				.qmenu = (const char * const *)vivid_ctrl_hdmi_to_output_strings,
+			};
+			dev->ctrl_hdmi_to_output[i] = v4l2_ctrl_new_custom(hdl_vid_cap,
+									   &ctrl_config, NULL);
+		}
+
+		for (int i = 0; i < dev->num_svid_inputs; i++) {
+			snprintf(dev->ctrl_svid_to_output_names[i],
+				 sizeof(dev->ctrl_svid_to_output_names[i]),
+				 "S-Video %03u-%u Is Connected To", dev->inst, i);
+		}
+
+		for (int i = 0; i < dev->num_svid_inputs; i++) {
+			struct v4l2_ctrl_config ctrl_config = {
+				.ops = &vivid_vid_cap_ctrl_ops,
+				.id = VIVID_CID_SVID_IS_CONNECTED_TO_OUTPUT(i),
+				.name = dev->ctrl_svid_to_output_names[i],
+				.type = V4L2_CTRL_TYPE_MENU,
+				.max = 1,
+				.qmenu = (const char * const *)vivid_ctrl_svid_to_output_strings,
+			};
+			dev->ctrl_svid_to_output[i] = v4l2_ctrl_new_custom(hdl_vid_cap,
+									   &ctrl_config, NULL);
+		}
+
 		if (show_ccs_cap) {
 			dev->ctrl_has_crop_cap = v4l2_ctrl_new_custom(hdl_vid_cap,
 				&vivid_ctrl_has_crop_cap, NULL);
-- 
2.34.1


