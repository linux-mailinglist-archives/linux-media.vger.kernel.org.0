Return-Path: <linux-media+bounces-14041-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C7299146C9
	for <lists+linux-media@lfdr.de>; Mon, 24 Jun 2024 11:56:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4E76E286ADC
	for <lists+linux-media@lfdr.de>; Mon, 24 Jun 2024 09:56:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0D1A134414;
	Mon, 24 Jun 2024 09:56:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hJQMKtT9"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F074613248E
	for <linux-media@vger.kernel.org>; Mon, 24 Jun 2024 09:56:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719223009; cv=none; b=hUrcQHKBzuiuBeGTH7gD0040fcs2IcWcsVuFvH7Qa6JWbs/qRKES/Kmisl3ujRFTNh/aN1Jj0JrqAahebm+NkzKhwL3bS1Yc6VsxrR2DRtNwIHI24t7R5k/viJB/cDn0r208UPCSgcjXW3ZMK4Adgd4yK/ExalMAXsVZz731P2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719223009; c=relaxed/simple;
	bh=OZ6C7ozPGa1TtmZrTQhK4mFUSdp2h6EBkITPJ/G3aG0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=OLg3Wty3LE2SRfF9i0jwqIOZ01TFxJxsklZyVYJKiC78U6wykaKYbEdEAReYXwFUWuMTU5FzCqAl9fJPkPlqq2xl+DkNgAmpjbiZfoSbJfF9uF8V21n5A11EOl1x+3BH0bTPlY/CbNn3o7KvqodwNqEO5r9yM9Oxa01C+NOJZQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hJQMKtT9; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-35f2c9e23d3so3149490f8f.0
        for <linux-media@vger.kernel.org>; Mon, 24 Jun 2024 02:56:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719223004; x=1719827804; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mBp7ugIbNixhraLb7en7Gvov5f9s3gKpBq27g/BSbLA=;
        b=hJQMKtT98fWm3vWXkNzh73XTbudoEALSM7/Xx+lBKFFqhJzN5PcNPBk0Cwv7BFtsFk
         9pXDImcPyGbhMuwVRW1BBfxH6kuAm6HPDGAtyr4YVIYUQ2jh/atfarOrm1GGea82JLos
         cJJ0oW4DQ8JzFuQ4DL8cyPfrEa+pY6vQMeuehK6fOcfVWwirxZeFTjzrog0AOfDV7+88
         kqFeA9A72XWqjg/XhGnc7RtH3srM2Js3gHE7Yo8cZYJ/DWxhqzE+A3oUYxMUwRmgGnzM
         Mb8p1Jt+Wt+/bRv39knMlt5aEwPH9E1/uIrE0N4Uoh/p9/1U0x0XD4BXoGN87BnLDkdX
         4WXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719223004; x=1719827804;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mBp7ugIbNixhraLb7en7Gvov5f9s3gKpBq27g/BSbLA=;
        b=qnBPmZeAP6vX/sNUlEq1SfCWdmcEK52EJ8c1QjJ/SEDGI4tWdRCXhOJQrXZe4RPtG4
         egT6EWYPjy7QHJBXThUw6EhwFx96iiINYtHgCVUqxw1E/DNjD6mESWKu9RkmcIBY2aS1
         o1uRb654Gb/eIjVG5Z6zH5wEmUfP55R06aZZPv7iUaqkli1xTq7lQ1+VRlgokMhYLUym
         8sbHfJvL3LLxSZYfIKQM57rP/HgXEyYSJoDmMXfzdjBiBIPbDMQI0pVqH/zaWHvmQsv6
         DA7Tvkr5xedGRDImbtrhZicbaRYnqYdXtM3aRGKe+000/B/l8ybGDUs5i5j8NoQxxN/A
         rrgg==
X-Gm-Message-State: AOJu0YwBu432yR652sAcGMNFvHV2WggYXCKjXCdW7pKPObaLW9z+vqP1
	ty3apzXBJtvRSVzu+dC015hhALmeKDKNnkN7x3XslUbsE/eZS1x5jhWByIs=
X-Google-Smtp-Source: AGHT+IE9sksAhjU41nlr30kdiCAZrVg8IoaGM35tQ97QBXZCwqaNur2nfHV/r2PZmBUwkhzx9MjCMw==
X-Received: by 2002:a05:6000:1a8c:b0:363:776:821b with SMTP id ffacd0b85a97d-366e31bc9f4mr5718398f8f.0.1719223003705;
        Mon, 24 Jun 2024 02:56:43 -0700 (PDT)
Received: from localhost.localdomain ([105.163.2.38])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-424817b5ca0sm128258475e9.24.2024.06.24.02.56.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jun 2024 02:56:43 -0700 (PDT)
From: Dorcas Anono Litunya <anonolitunya@gmail.com>
To: linux-media@vger.kernel.org
Cc: anonolitunya@gmail.com,
	jaffe1@gmail.com,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 09/10] media: vivid: loopback based on 'Connected To' controls
Date: Mon, 24 Jun 2024 12:53:04 +0300
Message-Id: <20240624095300.745567-10-anonolitunya@gmail.com>
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

From: Hans Verkuil <hverkuil-cisco@xs4all.nl>

Instead of using hardwired video loopback limited to a single vivid
instance, use the new 'Connected To' controls to only loopback if an
HDMI or S-Video input is connected to another output, which can be
in another vivid instance. Effectively this emulates connecting and
disconnecting an HDMI/S-Video cable.

The Loop Video control is dropped since it has now been replaced by
the new 'Connected To' controls. The Display Present has also been
dropped since it no longer fits.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Co-developed-by: Dorcas Anono Litunya <anonolitunya@gmail.com>
Signed-off-by: Dorcas Anono Litunya <anonolitunya@gmail.com>
---
 Documentation/admin-guide/media/vivid.rst     |   5 -
 drivers/media/test-drivers/vivid/vivid-cec.c  |  88 ++++++++--
 drivers/media/test-drivers/vivid/vivid-core.c |  39 ++---
 drivers/media/test-drivers/vivid/vivid-core.h |  18 +-
 .../media/test-drivers/vivid/vivid-ctrls.c    | 162 ++++++------------
 .../test-drivers/vivid/vivid-kthread-cap.c    |  86 ++++++----
 .../media/test-drivers/vivid/vivid-vbi-cap.c  |   5 +-
 .../media/test-drivers/vivid/vivid-vid-cap.c  | 103 +++++++----
 .../media/test-drivers/vivid/vivid-vid-cap.h  |   2 +
 .../test-drivers/vivid/vivid-vid-common.c     | 114 ++++++++----
 .../test-drivers/vivid/vivid-vid-common.h     |   5 +-
 .../media/test-drivers/vivid/vivid-vid-out.c  |  17 +-
 12 files changed, 362 insertions(+), 282 deletions(-)

diff --git a/Documentation/admin-guide/media/vivid.rst b/Documentation/admin-guide/media/vivid.rst
index 31fb86030249..29481241d7cb 100644
--- a/Documentation/admin-guide/media/vivid.rst
+++ b/Documentation/admin-guide/media/vivid.rst
@@ -1020,11 +1020,6 @@ Digital Video Controls
 	affects the reported colorspace since DVI_D outputs will always use
 	sRGB.
 
-- Display Present:
-
-	sets the presence of a "display" on the HDMI output. This affects
-	the tx_edid_present, tx_hotplug and tx_rxsense controls.
-
 
 FM Radio Receiver Controls
 ~~~~~~~~~~~~~~~~~~~~~~~~~~
diff --git a/drivers/media/test-drivers/vivid/vivid-cec.c b/drivers/media/test-drivers/vivid/vivid-cec.c
index 1f7469ff04d5..941ef4263214 100644
--- a/drivers/media/test-drivers/vivid/vivid-cec.c
+++ b/drivers/media/test-drivers/vivid/vivid-cec.c
@@ -23,7 +23,7 @@ struct xfer_on_bus {
 static bool find_dest_adap(struct vivid_dev *dev,
 			   struct cec_adapter *adap, u8 dest)
 {
-	unsigned int i;
+	unsigned int i, j;
 
 	if (dest >= 0xf)
 		return false;
@@ -33,12 +33,29 @@ static bool find_dest_adap(struct vivid_dev *dev,
 	    cec_has_log_addr(dev->cec_rx_adap, dest))
 		return true;
 
-	for (i = 0; i < MAX_OUTPUTS && dev->cec_tx_adap[i]; i++) {
-		if (adap == dev->cec_tx_adap[i])
+	for (i = 0, j = 0; i < dev->num_inputs; i++) {
+		unsigned int menu_idx =
+			dev->input_is_connected_to_output[i];
+
+		if (dev->input_type[i] != HDMI)
+			continue;
+		j++;
+		if (menu_idx < FIXED_MENU_ITEMS)
+			continue;
+
+		struct vivid_dev *dev_tx = vivid_ctrl_hdmi_to_output_instance[menu_idx];
+		unsigned int output = vivid_ctrl_hdmi_to_output_index[menu_idx];
+
+		if (!dev_tx)
 			continue;
-		if (!dev->cec_tx_adap[i]->is_configured)
+
+		unsigned int hdmi_output = dev_tx->output_to_iface_index[output];
+
+		if (adap == dev_tx->cec_tx_adap[hdmi_output])
+			continue;
+		if (!dev_tx->cec_tx_adap[hdmi_output]->is_configured)
 			continue;
-		if (cec_has_log_addr(dev->cec_tx_adap[i], dest))
+		if (cec_has_log_addr(dev_tx->cec_tx_adap[hdmi_output], dest))
 			return true;
 	}
 	return false;
@@ -96,7 +113,7 @@ static void adjust_sfts(struct vivid_dev *dev)
 int vivid_cec_bus_thread(void *_dev)
 {
 	u32 last_sft;
-	unsigned int i;
+	unsigned int i, j;
 	unsigned int dest;
 	ktime_t start, end;
 	s64 delta_us, retry_us;
@@ -193,9 +210,27 @@ int vivid_cec_bus_thread(void *_dev)
 		if (first_status == CEC_TX_STATUS_OK) {
 			if (xfers_on_bus[first_idx].adap != dev->cec_rx_adap)
 				cec_received_msg(dev->cec_rx_adap, &first_msg);
-			for (i = 0; i < MAX_OUTPUTS && dev->cec_tx_adap[i]; i++)
-				if (xfers_on_bus[first_idx].adap != dev->cec_tx_adap[i])
-					cec_received_msg(dev->cec_tx_adap[i], &first_msg);
+			for (i = 0, j = 0; i < dev->num_inputs; i++) {
+				unsigned int menu_idx =
+					dev->input_is_connected_to_output[i];
+
+				if (dev->input_type[i] != HDMI)
+					continue;
+				j++;
+				if (menu_idx < FIXED_MENU_ITEMS)
+					continue;
+
+				struct vivid_dev *dev_tx = vivid_ctrl_hdmi_to_output_instance[menu_idx];
+				unsigned int output = vivid_ctrl_hdmi_to_output_index[menu_idx];
+
+				if (!dev_tx)
+					continue;
+
+				unsigned int hdmi_output = dev_tx->output_to_iface_index[output];
+
+				if (xfers_on_bus[first_idx].adap != dev_tx->cec_tx_adap[hdmi_output])
+					cec_received_msg(dev_tx->cec_tx_adap[hdmi_output], &first_msg);
+			}
 		}
 		end = ktime_get();
 		/*
@@ -242,21 +277,36 @@ static int vivid_cec_adap_transmit(struct cec_adapter *adap, u8 attempts,
 				   u32 signal_free_time, struct cec_msg *msg)
 {
 	struct vivid_dev *dev = cec_get_drvdata(adap);
+	struct vivid_dev *dev_rx = dev;
 	u8 idx = cec_msg_initiator(msg);
+	u8 output = 0;
 
-	spin_lock(&dev->cec_xfers_slock);
-	dev->xfers[idx].adap = adap;
-	memcpy(dev->xfers[idx].msg, msg->msg, CEC_MAX_MSG_SIZE);
-	dev->xfers[idx].len = msg->len;
-	dev->xfers[idx].sft = CEC_SIGNAL_FREE_TIME_RETRY;
+	if (dev->cec_rx_adap != adap) {
+		int i;
+
+		for (i = 0; i < dev->num_hdmi_outputs; i++)
+			if (dev->cec_tx_adap[i] == adap)
+				break;
+		if (i == dev->num_hdmi_outputs)
+			return -ENONET;
+		output = dev->hdmi_index_to_output_index[i];
+		dev_rx = dev->output_to_input_instance[output];
+		if (!dev_rx)
+			return -ENONET;
+	}
+	spin_lock(&dev_rx->cec_xfers_slock);
+	dev_rx->xfers[idx].adap = adap;
+	memcpy(dev_rx->xfers[idx].msg, msg->msg, CEC_MAX_MSG_SIZE);
+	dev_rx->xfers[idx].len = msg->len;
+	dev_rx->xfers[idx].sft = CEC_SIGNAL_FREE_TIME_RETRY;
 	if (signal_free_time > CEC_SIGNAL_FREE_TIME_RETRY) {
-		if (idx == dev->last_initiator)
-			dev->xfers[idx].sft = CEC_SIGNAL_FREE_TIME_NEXT_XFER;
+		if (idx == dev_rx->last_initiator)
+			dev_rx->xfers[idx].sft = CEC_SIGNAL_FREE_TIME_NEXT_XFER;
 		else
-			dev->xfers[idx].sft = CEC_SIGNAL_FREE_TIME_NEW_INITIATOR;
+			dev_rx->xfers[idx].sft = CEC_SIGNAL_FREE_TIME_NEW_INITIATOR;
 	}
-	spin_unlock(&dev->cec_xfers_slock);
-	wake_up_interruptible(&dev->kthread_waitq_cec);
+	spin_unlock(&dev_rx->cec_xfers_slock);
+	wake_up_interruptible(&dev_rx->kthread_waitq_cec);
 
 	return 0;
 }
diff --git a/drivers/media/test-drivers/vivid/vivid-core.c b/drivers/media/test-drivers/vivid/vivid-core.c
index 7eb8a0a5d4d3..00e0d08af357 100644
--- a/drivers/media/test-drivers/vivid/vivid-core.c
+++ b/drivers/media/test-drivers/vivid/vivid-core.c
@@ -190,6 +190,7 @@ struct vivid_dev *vivid_devs[VIVID_MAX_DEVS];
 DEFINE_SPINLOCK(hdmi_output_skip_mask_lock);
 struct workqueue_struct *update_hdmi_ctrls_workqueue;
 u64 hdmi_to_output_menu_skip_mask;
+u64 hdmi_input_update_outputs_mask;
 
 struct vivid_dev *vivid_ctrl_hdmi_to_output_instance[MAX_MENU_ITEMS];
 unsigned int vivid_ctrl_hdmi_to_output_index[MAX_MENU_ITEMS];
@@ -985,7 +986,6 @@ static int vivid_detect_feature_set(struct vivid_dev *dev, int inst,
 	for (i = 0; i < dev->num_outputs; i++) {
 		dev->output_type[i] = ((output_types[inst] >> i) & 1) ? HDMI : SVID;
 		dev->output_name_counter[i] = out_type_counter[dev->output_type[i]]++;
-		dev->display_present[i] = true;
 	}
 	dev->has_audio_outputs = out_type_counter[SVID];
 	if (out_type_counter[HDMI] == 16) {
@@ -1418,7 +1418,6 @@ static int vivid_create_queues(struct vivid_dev *dev)
 
 static int vivid_create_devnodes(struct platform_device *pdev,
 				 struct vivid_dev *dev, int inst,
-				 unsigned int cec_tx_bus_cnt,
 				 v4l2_std_id tvnorms_cap,
 				 v4l2_std_id tvnorms_out,
 				 unsigned in_type_counter[4],
@@ -1462,7 +1461,7 @@ static int vivid_create_devnodes(struct platform_device *pdev,
 				return ret;
 			}
 			cec_s_phys_addr(dev->cec_rx_adap, 0, false);
-			v4l2_info(&dev->v4l2_dev, "CEC adapter %s registered for HDMI input 0\n",
+			v4l2_info(&dev->v4l2_dev, "CEC adapter %s registered for HDMI input\n",
 				  dev_name(&dev->cec_rx_adap->devnode.dev));
 		}
 #endif
@@ -1505,10 +1504,10 @@ static int vivid_create_devnodes(struct platform_device *pdev,
 #endif
 
 #ifdef CONFIG_VIDEO_VIVID_CEC
-		for (i = 0; i < cec_tx_bus_cnt; i++) {
+		for (i = 0; i < dev->num_hdmi_outputs; i++) {
 			ret = cec_register_adapter(dev->cec_tx_adap[i], &pdev->dev);
 			if (ret < 0) {
-				for (; i < cec_tx_bus_cnt; i++) {
+				for (; i >= 0; i--) {
 					cec_delete_adapter(dev->cec_tx_adap[i]);
 					dev->cec_tx_adap[i] = NULL;
 				}
@@ -1516,10 +1515,6 @@ static int vivid_create_devnodes(struct platform_device *pdev,
 			}
 			v4l2_info(&dev->v4l2_dev, "CEC adapter %s registered for HDMI output %d\n",
 				  dev_name(&dev->cec_tx_adap[i]->devnode.dev), i);
-			if (i < out_type_counter[HDMI])
-				cec_s_phys_addr(dev->cec_tx_adap[i], (i + 1) << 12, false);
-			else
-				cec_s_phys_addr(dev->cec_tx_adap[i], 0x1000, false);
 		}
 #endif
 
@@ -1762,11 +1757,16 @@ static int vivid_create_devnodes(struct platform_device *pdev,
 static void update_hdmi_ctrls_work_handler(struct work_struct *work)
 {
 	u64 skip_mask;
+	u64 update_mask;
 
 	spin_lock(&hdmi_output_skip_mask_lock);
 	skip_mask = hdmi_to_output_menu_skip_mask;
+	update_mask = hdmi_input_update_outputs_mask;
+	hdmi_input_update_outputs_mask = 0;
 	spin_unlock(&hdmi_output_skip_mask_lock);
 	for (int i = 0; i < n_devs && vivid_devs[i]; i++) {
+		if (update_mask & (1 << i))
+			vivid_update_connected_outputs(vivid_devs[i]);
 		for (int j = 0; j < vivid_devs[i]->num_hdmi_inputs; j++) {
 			struct v4l2_ctrl *c = vivid_devs[i]->ctrl_hdmi_to_output[j];
 
@@ -1808,7 +1808,6 @@ static int vivid_create_instance(struct platform_device *pdev, int inst)
 	struct vivid_dev *dev;
 	unsigned node_type = node_types[inst];
 	v4l2_std_id tvnorms_cap = 0, tvnorms_out = 0;
-	unsigned int cec_tx_bus_cnt = 0;
 	int ret;
 	int i;
 
@@ -1937,8 +1936,6 @@ static int vivid_create_instance(struct platform_device *pdev, int inst)
 		goto unreg_dev;
 
 	/* enable/disable interface specific controls */
-	if (dev->num_outputs && dev->output_type[0] != HDMI)
-		v4l2_ctrl_activate(dev->ctrl_display_present, false);
 	if (dev->num_inputs && dev->input_type[0] != HDMI) {
 		v4l2_ctrl_activate(dev->ctrl_dv_timings_signal_mode, false);
 		v4l2_ctrl_activate(dev->ctrl_dv_timings, false);
@@ -1994,27 +1991,27 @@ static int vivid_create_instance(struct platform_device *pdev, int inst)
 	}
 
 	if (dev->has_vid_out) {
-		for (i = 0; i < dev->num_outputs; i++) {
+		int j;
+
+		for (i = j = 0; i < dev->num_outputs; i++) {
 			struct cec_adapter *adap;
 
 			if (dev->output_type[i] != HDMI)
 				continue;
 
-			dev->cec_output2bus_map[i] = cec_tx_bus_cnt;
-			adap = vivid_cec_alloc_adap(dev, cec_tx_bus_cnt, true);
+			adap = vivid_cec_alloc_adap(dev, j, true);
 			ret = PTR_ERR_OR_ZERO(adap);
 			if (ret < 0) {
-				for (i = 0; i < dev->num_outputs; i++)
-					cec_delete_adapter(dev->cec_tx_adap[i]);
+				while (j--)
+					cec_delete_adapter(dev->cec_tx_adap[j]);
 				goto unreg_dev;
 			}
 
-			dev->cec_tx_adap[cec_tx_bus_cnt] = adap;
-			cec_tx_bus_cnt++;
+			dev->cec_tx_adap[j++] = adap;
 		}
 	}
 
-	if (dev->cec_rx_adap || cec_tx_bus_cnt) {
+	if (dev->cec_rx_adap || dev->num_hdmi_outputs) {
 		init_waitqueue_head(&dev->kthread_waitq_cec);
 		dev->kthread_cec = kthread_run(vivid_cec_bus_thread, dev,
 					       "vivid_cec-%s", dev->v4l2_dev.name);
@@ -2040,7 +2037,7 @@ static int vivid_create_instance(struct platform_device *pdev, int inst)
 	v4l2_ctrl_handler_setup(&dev->ctrl_hdl_touch_cap);
 
 	/* finally start creating the device nodes */
-	ret = vivid_create_devnodes(pdev, dev, inst, cec_tx_bus_cnt,
+	ret = vivid_create_devnodes(pdev, dev, inst,
 				    tvnorms_cap, tvnorms_out,
 				    in_type_counter, out_type_counter);
 	if (ret)
diff --git a/drivers/media/test-drivers/vivid/vivid-core.h b/drivers/media/test-drivers/vivid/vivid-core.h
index b0c5b7369de5..cc18a3bc6dc0 100644
--- a/drivers/media/test-drivers/vivid/vivid-core.h
+++ b/drivers/media/test-drivers/vivid/vivid-core.h
@@ -83,7 +83,15 @@ extern unsigned vivid_debug;
 extern char *vivid_ctrl_hdmi_to_output_strings[1 + MAX_MENU_ITEMS];
 /* Menu control skip mask of all HDMI outputs that are in use */
 extern u64 hdmi_to_output_menu_skip_mask;
-/* Spinlock for access to hdmi_to_output_menu_skip_mask */
+/*
+ * Bitmask of which vivid instances need to update any connected
+ * HDMI outputs.
+ */
+extern u64 hdmi_input_update_outputs_mask;
+/*
+ * Spinlock for access to hdmi_to_output_menu_skip_mask and
+ * hdmi_input_update_outputs_mask.
+ */
 extern spinlock_t hdmi_output_skip_mask_lock;
 /*
  * Workqueue that updates the menu controls whenever the HDMI menu skip mask
@@ -283,7 +291,6 @@ struct vivid_dev {
 	bool				has_tv_tuner;
 	bool				has_touch_cap;
 
-	bool				can_loop_video;
 	/* Output index (0-MAX_OUTPUTS) to vivid instance of connected input */
 	struct vivid_dev		*output_to_input_instance[MAX_OUTPUTS];
 	/* Output index (0-MAX_OUTPUTS) to input index (0-MAX_INPUTS) of connected input */
@@ -336,7 +343,6 @@ struct vivid_dev {
 		struct v4l2_ctrl	*ctrl_dv_timings_signal_mode;
 		struct v4l2_ctrl	*ctrl_dv_timings;
 	};
-	struct v4l2_ctrl		*ctrl_display_present;
 	struct v4l2_ctrl		*ctrl_has_crop_cap;
 	struct v4l2_ctrl		*ctrl_has_compose_cap;
 	struct v4l2_ctrl		*ctrl_has_scaler_cap;
@@ -463,7 +469,6 @@ struct vivid_dev {
 	u8				*scaled_line;
 	u8				*blended_line;
 	unsigned			cur_scaled_line;
-	bool				display_present[MAX_OUTPUTS];
 
 	/* Output Overlay */
 	void				*fb_vbase_out;
@@ -643,11 +648,10 @@ struct vivid_dev {
 
 	/* CEC */
 	struct cec_adapter		*cec_rx_adap;
-	struct cec_adapter		*cec_tx_adap[MAX_OUTPUTS];
-	u8				cec_output2bus_map[MAX_OUTPUTS];
+	struct cec_adapter		*cec_tx_adap[MAX_HDMI_OUTPUTS];
 	struct task_struct		*kthread_cec;
 	wait_queue_head_t		kthread_waitq_cec;
-	struct vivid_cec_xfer	xfers[MAX_OUTPUTS];
+	struct vivid_cec_xfer		xfers[MAX_OUTPUTS];
 	spinlock_t			cec_xfers_slock; /* read and write cec messages */
 	u32				cec_sft; /* bus signal free time, in bit periods */
 	u8				last_initiator;
diff --git a/drivers/media/test-drivers/vivid/vivid-ctrls.c b/drivers/media/test-drivers/vivid/vivid-ctrls.c
index f278bd86e99d..6e6504d04fe4 100644
--- a/drivers/media/test-drivers/vivid/vivid-ctrls.c
+++ b/drivers/media/test-drivers/vivid/vivid-ctrls.c
@@ -18,7 +18,6 @@
 #include "vivid-radio-common.h"
 #include "vivid-osd.h"
 #include "vivid-ctrls.h"
-#include "vivid-cec.h"
 
 #define VIVID_CID_CUSTOM_BASE		(V4L2_CID_USER_BASE | 0xf000)
 #define VIVID_CID_BUTTON		(VIVID_CID_CUSTOM_BASE + 0)
@@ -69,14 +68,12 @@
 #define VIVID_CID_HAS_CROP_OUT		(VIVID_CID_VIVID_BASE + 34)
 #define VIVID_CID_HAS_COMPOSE_OUT	(VIVID_CID_VIVID_BASE + 35)
 #define VIVID_CID_HAS_SCALER_OUT	(VIVID_CID_VIVID_BASE + 36)
-#define VIVID_CID_LOOP_VIDEO		(VIVID_CID_VIVID_BASE + 37)
 #define VIVID_CID_SEQ_WRAP		(VIVID_CID_VIVID_BASE + 38)
 #define VIVID_CID_TIME_WRAP		(VIVID_CID_VIVID_BASE + 39)
 #define VIVID_CID_MAX_EDID_BLOCKS	(VIVID_CID_VIVID_BASE + 40)
 #define VIVID_CID_PERCENTAGE_FILL	(VIVID_CID_VIVID_BASE + 41)
 #define VIVID_CID_REDUCED_FPS		(VIVID_CID_VIVID_BASE + 42)
 #define VIVID_CID_HSV_ENC		(VIVID_CID_VIVID_BASE + 43)
-#define VIVID_CID_DISPLAY_PRESENT	(VIVID_CID_VIVID_BASE + 44)
 
 #define VIVID_CID_STD_SIGNAL_MODE	(VIVID_CID_VIVID_BASE + 60)
 #define VIVID_CID_STANDARD		(VIVID_CID_VIVID_BASE + 61)
@@ -445,6 +442,33 @@ static const struct v4l2_ctrl_ops vivid_user_vid_ctrl_ops = {
 
 /* Video Capture Controls */
 
+static void vivid_update_power_present(struct vivid_dev *dev)
+{
+	unsigned int i, j;
+
+	dev->power_present = 0;
+	for (i = 0, j = 0;
+	     i < ARRAY_SIZE(dev->dv_timings_signal_mode); i++) {
+		if (dev->input_type[i] != HDMI)
+			continue;
+		/*
+		 * If connected to TPG or HDMI output, and the signal
+		 * mode is not NO_SIGNAL, then there is power present.
+		 */
+		if (dev->input_is_connected_to_output[i] != 1 &&
+		    dev->dv_timings_signal_mode[i] != NO_SIGNAL)
+			dev->power_present |= (1 << j);
+		j++;
+	}
+
+	__v4l2_ctrl_s_ctrl(dev->ctrl_rx_power_present,
+			   dev->power_present);
+
+	v4l2_ctrl_activate(dev->ctrl_dv_timings,
+			   dev->dv_timings_signal_mode[dev->input] ==
+			   SELECTED_DV_TIMINGS);
+}
+
 static int vivid_vid_cap_s_ctrl(struct v4l2_ctrl *ctrl)
 {
 	static const u32 colorspaces[] = {
@@ -459,7 +483,7 @@ static int vivid_vid_cap_s_ctrl(struct v4l2_ctrl *ctrl)
 		V4L2_COLORSPACE_470_SYSTEM_BG,
 	};
 	struct vivid_dev *dev = container_of(ctrl->handler, struct vivid_dev, ctrl_hdl_vid_cap);
-	unsigned int i, j;
+	unsigned int i;
 	struct vivid_dev *output_inst = NULL;
 	int index = 0;
 	int hdmi_index, svid_index;
@@ -579,25 +603,9 @@ static int vivid_vid_cap_s_ctrl(struct v4l2_ctrl *ctrl)
 		dev->dv_timings_signal_mode[dev->input] =
 			dev->ctrl_dv_timings_signal_mode->val;
 		dev->query_dv_timings[dev->input] = dev->ctrl_dv_timings->val;
-
-		dev->power_present = 0;
-		for (i = 0, j = 0;
-		     i < ARRAY_SIZE(dev->dv_timings_signal_mode);
-		     i++)
-			if (dev->input_type[i] == HDMI) {
-				if (dev->dv_timings_signal_mode[i] != NO_SIGNAL)
-					dev->power_present |= (1 << j);
-				j++;
-			}
-		__v4l2_ctrl_s_ctrl(dev->ctrl_rx_power_present,
-				   dev->power_present);
-
-		v4l2_ctrl_activate(dev->ctrl_dv_timings,
-			dev->dv_timings_signal_mode[dev->input] ==
-				SELECTED_DV_TIMINGS);
-
+		vivid_update_power_present(dev);
 		vivid_update_quality(dev);
-		vivid_send_source_change(dev, HDMI);
+		vivid_send_input_source_change(dev, dev->input);
 		break;
 	case VIVID_CID_DV_TIMINGS_ASPECT_RATIO:
 		dev->dv_timings_aspect_ratio[dev->input] = ctrl->val;
@@ -621,8 +629,11 @@ static int vivid_vid_cap_s_ctrl(struct v4l2_ctrl *ctrl)
 		input_index = dev->hdmi_index_to_input_index[hdmi_index];
 		dev->input_is_connected_to_output[input_index] = ctrl->val;
 
-		if (output_inst)
+		if (output_inst) {
 			output_inst->output_to_input_instance[index] = NULL;
+			vivid_update_outputs(output_inst);
+			cec_phys_addr_invalidate(output_inst->cec_tx_adap[index]);
+		}
 		if (ctrl->val >= FIXED_MENU_ITEMS) {
 			output_inst = vivid_ctrl_hdmi_to_output_instance[ctrl->val];
 			index = vivid_ctrl_hdmi_to_output_index[ctrl->val];
@@ -635,8 +646,14 @@ static int vivid_vid_cap_s_ctrl(struct v4l2_ctrl *ctrl)
 		if (ctrl->val >= FIXED_MENU_ITEMS)
 			hdmi_to_output_menu_skip_mask |= 1ULL << ctrl->val;
 		spin_unlock(&hdmi_output_skip_mask_lock);
+		vivid_update_power_present(dev);
+		vivid_update_quality(dev);
+		vivid_send_input_source_change(dev, dev->hdmi_index_to_input_index[hdmi_index]);
 		if (ctrl->val < FIXED_MENU_ITEMS && ctrl->cur.val < FIXED_MENU_ITEMS)
 			break;
+		spin_lock(&hdmi_output_skip_mask_lock);
+		hdmi_input_update_outputs_mask |= 1 << dev->inst;
+		spin_unlock(&hdmi_output_skip_mask_lock);
 		queue_work(update_hdmi_ctrls_workqueue, &dev->update_hdmi_ctrl_work);
 		break;
 	case VIVID_CID_SVID_IS_CONNECTED_TO_OUTPUT(0) ... VIVID_CID_SVID_IS_CONNECTED_TO_OUTPUT(15):
@@ -660,6 +677,8 @@ static int vivid_vid_cap_s_ctrl(struct v4l2_ctrl *ctrl)
 		if (ctrl->val >= FIXED_MENU_ITEMS)
 			svid_to_output_menu_skip_mask |= 1ULL << ctrl->val;
 		spin_unlock(&svid_output_skip_mask_lock);
+		vivid_update_quality(dev);
+		vivid_send_input_source_change(dev, dev->svid_index_to_input_index[svid_index]);
 		if (ctrl->val < FIXED_MENU_ITEMS && ctrl->cur.val < FIXED_MENU_ITEMS)
 			break;
 		queue_work(update_svid_ctrls_workqueue, &dev->update_svid_ctrl_work);
@@ -1026,37 +1045,6 @@ static const struct v4l2_ctrl_config vivid_ctrl_limited_rgb_range = {
 };
 
 
-/* Video Loop Control */
-
-static int vivid_loop_cap_s_ctrl(struct v4l2_ctrl *ctrl)
-{
-	struct vivid_dev *dev = container_of(ctrl->handler, struct vivid_dev, ctrl_hdl_loop_cap);
-
-	switch (ctrl->id) {
-	case VIVID_CID_LOOP_VIDEO:
-		dev->loop_video = ctrl->val;
-		vivid_update_quality(dev);
-		vivid_send_source_change(dev, SVID);
-		vivid_send_source_change(dev, HDMI);
-		break;
-	}
-	return 0;
-}
-
-static const struct v4l2_ctrl_ops vivid_loop_cap_ctrl_ops = {
-	.s_ctrl = vivid_loop_cap_s_ctrl,
-};
-
-static const struct v4l2_ctrl_config vivid_ctrl_loop_video = {
-	.ops = &vivid_loop_cap_ctrl_ops,
-	.id = VIVID_CID_LOOP_VIDEO,
-	.name = "Loop Video",
-	.type = V4L2_CTRL_TYPE_BOOLEAN,
-	.max = 1,
-	.step = 1,
-};
-
-
 /* VBI Capture Control */
 
 static int vivid_vbi_cap_s_ctrl(struct v4l2_ctrl *ctrl)
@@ -1091,8 +1079,6 @@ static int vivid_vid_out_s_ctrl(struct v4l2_ctrl *ctrl)
 {
 	struct vivid_dev *dev = container_of(ctrl->handler, struct vivid_dev, ctrl_hdl_vid_out);
 	struct v4l2_bt_timings *bt = &dev->dv_timings_out.bt;
-	u32 display_present = 0;
-	unsigned int i, j, bus_idx;
 
 	switch (ctrl->id) {
 	case VIVID_CID_HAS_CROP_OUT:
@@ -1123,39 +1109,11 @@ static int vivid_vid_out_s_ctrl(struct v4l2_ctrl *ctrl)
 					V4L2_QUANTIZATION_LIM_RANGE :
 					V4L2_QUANTIZATION_DEFAULT;
 		}
-		if (dev->loop_video)
-			vivid_send_source_change(dev, HDMI);
-		break;
-	case VIVID_CID_DISPLAY_PRESENT:
-		if (dev->output_type[dev->output] != HDMI)
-			break;
+		if (vivid_output_is_connected_to(dev)) {
+			struct vivid_dev *dev_rx = vivid_output_is_connected_to(dev);
 
-		dev->display_present[dev->output] = ctrl->val;
-		for (i = 0, j = 0; i < dev->num_outputs; i++)
-			if (dev->output_type[i] == HDMI)
-				display_present |=
-					dev->display_present[i] << j++;
-
-		__v4l2_ctrl_s_ctrl(dev->ctrl_tx_rxsense, display_present);
-
-		if (dev->edid_blocks) {
-			__v4l2_ctrl_s_ctrl(dev->ctrl_tx_edid_present,
-					   display_present);
-			__v4l2_ctrl_s_ctrl(dev->ctrl_tx_hotplug,
-					   display_present);
+			vivid_send_source_change(dev_rx, HDMI);
 		}
-
-		bus_idx = dev->cec_output2bus_map[dev->output];
-		if (!dev->cec_tx_adap[bus_idx])
-			break;
-
-		if (ctrl->val && dev->edid_blocks)
-			cec_s_phys_addr(dev->cec_tx_adap[bus_idx],
-					dev->cec_tx_adap[bus_idx]->phys_addr,
-					false);
-		else
-			cec_phys_addr_invalidate(dev->cec_tx_adap[bus_idx]);
-
 		break;
 	}
 	return 0;
@@ -1195,16 +1153,6 @@ static const struct v4l2_ctrl_config vivid_ctrl_has_scaler_out = {
 	.step = 1,
 };
 
-static const struct v4l2_ctrl_config vivid_ctrl_display_present = {
-	.ops = &vivid_vid_out_ctrl_ops,
-	.id = VIVID_CID_DISPLAY_PRESENT,
-	.name = "Display Present",
-	.type = V4L2_CTRL_TYPE_BOOLEAN,
-	.max = 1,
-	.def = 1,
-	.step = 1,
-};
-
 /* Streaming Controls */
 
 static int vivid_streaming_s_ctrl(struct v4l2_ctrl *ctrl)
@@ -1914,21 +1862,13 @@ int vivid_create_controls(struct vivid_dev *dev, bool show_ccs_cap,
 		dev->ctrl_tx_mode = v4l2_ctrl_new_std_menu(hdl_vid_out, NULL,
 			V4L2_CID_DV_TX_MODE, V4L2_DV_TX_MODE_HDMI,
 			0, V4L2_DV_TX_MODE_HDMI);
-		dev->ctrl_display_present = v4l2_ctrl_new_custom(hdl_vid_out,
-			&vivid_ctrl_display_present, NULL);
-		dev->ctrl_tx_hotplug = v4l2_ctrl_new_std(hdl_vid_out,
-			NULL, V4L2_CID_DV_TX_HOTPLUG, 0, hdmi_output_mask,
-			0, hdmi_output_mask);
-		dev->ctrl_tx_rxsense = v4l2_ctrl_new_std(hdl_vid_out,
-			NULL, V4L2_CID_DV_TX_RXSENSE, 0, hdmi_output_mask,
-			0, hdmi_output_mask);
-		dev->ctrl_tx_edid_present = v4l2_ctrl_new_std(hdl_vid_out,
-			NULL, V4L2_CID_DV_TX_EDID_PRESENT, 0, hdmi_output_mask,
-			0, hdmi_output_mask);
+		dev->ctrl_tx_hotplug = v4l2_ctrl_new_std(hdl_vid_out, NULL,
+			V4L2_CID_DV_TX_HOTPLUG, 0, hdmi_output_mask, 0, 0);
+		dev->ctrl_tx_rxsense = v4l2_ctrl_new_std(hdl_vid_out, NULL,
+			V4L2_CID_DV_TX_RXSENSE, 0, hdmi_output_mask, 0, 0);
+		dev->ctrl_tx_edid_present = v4l2_ctrl_new_std(hdl_vid_out, NULL,
+			V4L2_CID_DV_TX_EDID_PRESENT, 0, hdmi_output_mask, 0, 0);
 	}
-	if ((dev->has_vid_cap && dev->has_vid_out) ||
-	    (dev->has_vbi_cap && dev->has_vbi_out))
-		v4l2_ctrl_new_custom(hdl_loop_cap, &vivid_ctrl_loop_video, NULL);
 
 	if (dev->has_fb)
 		v4l2_ctrl_new_custom(hdl_fb, &vivid_ctrl_clear_fb, NULL);
diff --git a/drivers/media/test-drivers/vivid/vivid-kthread-cap.c b/drivers/media/test-drivers/vivid/vivid-kthread-cap.c
index 42048727d7ff..669bd96da4c7 100644
--- a/drivers/media/test-drivers/vivid/vivid-kthread-cap.c
+++ b/drivers/media/test-drivers/vivid/vivid-kthread-cap.c
@@ -142,7 +142,7 @@ static void scale_line(const u8 *src, u8 *dst, unsigned srcw, unsigned dstw, uns
  * (loop_vid_overlay). Finally calculate the part of the capture buffer that
  * will receive that overlaid video.
  */
-static void vivid_precalc_copy_rects(struct vivid_dev *dev)
+static void vivid_precalc_copy_rects(struct vivid_dev *dev, struct vivid_dev *out_dev)
 {
 	/* Framebuffer rectangle */
 	struct v4l2_rect r_fb = {
@@ -150,16 +150,16 @@ static void vivid_precalc_copy_rects(struct vivid_dev *dev)
 	};
 	/* Overlay window rectangle in framebuffer coordinates */
 	struct v4l2_rect r_overlay = {
-		dev->overlay_out_left, dev->overlay_out_top,
-		dev->compose_out.width, dev->compose_out.height
+		out_dev->overlay_out_left, out_dev->overlay_out_top,
+		out_dev->compose_out.width, out_dev->compose_out.height
 	};
 
-	v4l2_rect_intersect(&dev->loop_vid_copy, &dev->crop_cap, &dev->compose_out);
+	v4l2_rect_intersect(&dev->loop_vid_copy, &dev->crop_cap, &out_dev->compose_out);
 
 	dev->loop_vid_out = dev->loop_vid_copy;
-	v4l2_rect_scale(&dev->loop_vid_out, &dev->compose_out, &dev->crop_out);
-	dev->loop_vid_out.left += dev->crop_out.left;
-	dev->loop_vid_out.top += dev->crop_out.top;
+	v4l2_rect_scale(&dev->loop_vid_out, &out_dev->compose_out, &out_dev->crop_out);
+	dev->loop_vid_out.left += out_dev->crop_out.left;
+	dev->loop_vid_out.top += out_dev->crop_out.top;
 
 	dev->loop_vid_cap = dev->loop_vid_copy;
 	v4l2_rect_scale(&dev->loop_vid_cap, &dev->crop_cap, &dev->compose_cap);
@@ -176,15 +176,15 @@ static void vivid_precalc_copy_rects(struct vivid_dev *dev)
 	v4l2_rect_intersect(&r_overlay, &r_fb, &r_overlay);
 
 	/* shift r_overlay to the same origin as compose_out */
-	r_overlay.left += dev->compose_out.left - dev->overlay_out_left;
-	r_overlay.top += dev->compose_out.top - dev->overlay_out_top;
+	r_overlay.left += out_dev->compose_out.left - out_dev->overlay_out_left;
+	r_overlay.top += out_dev->compose_out.top - out_dev->overlay_out_top;
 
 	v4l2_rect_intersect(&dev->loop_vid_overlay, &r_overlay, &dev->loop_vid_copy);
 	dev->loop_fb_copy = dev->loop_vid_overlay;
 
 	/* shift dev->loop_fb_copy back again to the fb origin */
-	dev->loop_fb_copy.left -= dev->compose_out.left - dev->overlay_out_left;
-	dev->loop_fb_copy.top -= dev->compose_out.top - dev->overlay_out_top;
+	dev->loop_fb_copy.left -= out_dev->compose_out.left - out_dev->overlay_out_left;
+	dev->loop_fb_copy.top -= out_dev->compose_out.top - out_dev->overlay_out_top;
 
 	dev->loop_vid_overlay_cap = dev->loop_vid_overlay;
 	v4l2_rect_scale(&dev->loop_vid_overlay_cap, &dev->crop_cap, &dev->compose_cap);
@@ -213,24 +213,25 @@ static void *plane_vaddr(struct tpg_data *tpg, struct vivid_buffer *buf,
 	return vbuf;
 }
 
-static noinline_for_stack int vivid_copy_buffer(struct vivid_dev *dev, unsigned p,
-		u8 *vcapbuf, struct vivid_buffer *vid_cap_buf)
+static noinline_for_stack int vivid_copy_buffer(struct vivid_dev *dev,
+						struct vivid_dev *out_dev, unsigned p,
+						u8 *vcapbuf, struct vivid_buffer *vid_cap_buf)
 {
 	bool blank = dev->must_blank[vid_cap_buf->vb.vb2_buf.index];
 	struct tpg_data *tpg = &dev->tpg;
 	struct vivid_buffer *vid_out_buf = NULL;
-	unsigned vdiv = dev->fmt_out->vdownsampling[p];
+	unsigned vdiv = out_dev->fmt_out->vdownsampling[p];
 	unsigned twopixsize = tpg_g_twopixelsize(tpg, p);
 	unsigned img_width = tpg_hdiv(tpg, p, dev->compose_cap.width);
 	unsigned img_height = dev->compose_cap.height;
 	unsigned stride_cap = tpg->bytesperline[p];
-	unsigned stride_out = dev->bytesperline_out[p];
+	unsigned stride_out = out_dev->bytesperline_out[p];
 	unsigned stride_osd = dev->display_byte_stride;
 	unsigned hmax = (img_height * tpg->perc_fill) / 100;
 	u8 *voutbuf;
 	u8 *vosdbuf = NULL;
 	unsigned y;
-	bool blend = dev->fbuf_out_flags;
+	bool blend = out_dev->fbuf_out_flags;
 	/* Coarse scaling with Bresenham */
 	unsigned vid_out_int_part;
 	unsigned vid_out_fract_part;
@@ -247,8 +248,8 @@ static noinline_for_stack int vivid_copy_buffer(struct vivid_dev *dev, unsigned
 	vid_out_int_part = dev->loop_vid_out.height / dev->loop_vid_cap.height;
 	vid_out_fract_part = dev->loop_vid_out.height % dev->loop_vid_cap.height;
 
-	if (!list_empty(&dev->vid_out_active))
-		vid_out_buf = list_entry(dev->vid_out_active.next,
+	if (!list_empty(&out_dev->vid_out_active))
+		vid_out_buf = list_entry(out_dev->vid_out_active.next,
 					 struct vivid_buffer, list);
 	if (vid_out_buf == NULL)
 		return -ENODATA;
@@ -256,8 +257,8 @@ static noinline_for_stack int vivid_copy_buffer(struct vivid_dev *dev, unsigned
 	vid_cap_buf->vb.field = vid_out_buf->vb.field;
 
 	voutbuf = plane_vaddr(tpg, vid_out_buf, p,
-			      dev->bytesperline_out, dev->fmt_out_rect.height);
-	if (p < dev->fmt_out->buffers)
+			      out_dev->bytesperline_out, out_dev->fmt_out_rect.height);
+	if (p < out_dev->fmt_out->buffers)
 		voutbuf += vid_out_buf->vb.vb2_buf.planes[p].data_offset;
 	voutbuf += tpg_hdiv(tpg, p, dev->loop_vid_out.left) +
 		(dev->loop_vid_out.top / vdiv) * stride_out;
@@ -274,7 +275,7 @@ static noinline_for_stack int vivid_copy_buffer(struct vivid_dev *dev, unsigned
 		return 0;
 	}
 
-	if (dev->overlay_out_enabled &&
+	if (out_dev->overlay_out_enabled &&
 	    dev->loop_vid_overlay.width && dev->loop_vid_overlay.height) {
 		vosdbuf = dev->video_vbase;
 		vosdbuf += (dev->loop_fb_copy.left * twopixsize) / 2 +
@@ -385,6 +386,7 @@ static noinline_for_stack int vivid_copy_buffer(struct vivid_dev *dev, unsigned
 
 static void vivid_fillbuff(struct vivid_dev *dev, struct vivid_buffer *buf)
 {
+	struct vivid_dev *out_dev = NULL;
 	struct tpg_data *tpg = &dev->tpg;
 	unsigned factor = V4L2_FIELD_HAS_T_OR_B(dev->field_cap) ? 2 : 1;
 	unsigned line_height = 16 / factor;
@@ -396,14 +398,6 @@ static void vivid_fillbuff(struct vivid_dev *dev, struct vivid_buffer *buf)
 	unsigned ms;
 	char str[100];
 	s32 gain;
-	bool is_loop = false;
-
-	if (dev->loop_video && dev->can_loop_video &&
-		((vivid_is_svid_cap(dev) &&
-		!VIVID_INVALID_SIGNAL(dev->std_signal_mode[dev->input])) ||
-		(vivid_is_hdmi_cap(dev) &&
-		!VIVID_INVALID_SIGNAL(dev->dv_timings_signal_mode[dev->input]))))
-		is_loop = true;
 
 	buf->vb.sequence = dev->vid_cap_seq_count;
 	v4l2_ctrl_s_ctrl(dev->ro_int32, buf->vb.sequence & 0xff);
@@ -428,7 +422,34 @@ static void vivid_fillbuff(struct vivid_dev *dev, struct vivid_buffer *buf)
 		    dev->field_cap == V4L2_FIELD_ALTERNATE);
 	tpg_s_perc_fill_blank(tpg, dev->must_blank[buf->vb.vb2_buf.index]);
 
-	vivid_precalc_copy_rects(dev);
+	if (vivid_vid_can_loop(dev) &&
+	    ((vivid_is_svid_cap(dev) &&
+	    !VIVID_INVALID_SIGNAL(dev->std_signal_mode[dev->input])) ||
+	    (vivid_is_hdmi_cap(dev) &&
+	    !VIVID_INVALID_SIGNAL(dev->dv_timings_signal_mode[dev->input])))) {
+		out_dev = vivid_input_is_connected_to(dev);
+		/*
+		 * If the vivid instance of the output device is different
+		 * from the vivid instance of this input device, then we
+		 * must take care to properly serialize the output device to
+		 * prevent that the buffer we are copying from is being freed.
+		 *
+		 * If the output device is part of the same instance, then the
+		 * lock is already taken and there is no need to take the mutex.
+		 *
+		 * The problem with taking the mutex is that you can get
+		 * deadlocked if instance A locks instance B and vice versa.
+		 * It is not really worth trying to be very smart about this,
+		 * so just try to take the lock, and if you can't, then just
+		 * set out_dev to NULL and you will end up with a single frame
+		 * of Noise (the default test pattern in this case).
+		 */
+		if (out_dev && dev != out_dev && !mutex_trylock(&out_dev->mutex))
+			out_dev = NULL;
+	}
+
+	if (out_dev)
+		vivid_precalc_copy_rects(dev, out_dev);
 
 	for (p = 0; p < tpg_g_planes(tpg); p++) {
 		void *vbuf = plane_vaddr(tpg, buf, p,
@@ -445,10 +466,13 @@ static void vivid_fillbuff(struct vivid_dev *dev, struct vivid_buffer *buf)
 			vbuf += dev->fmt_cap->data_offset[p];
 		}
 		tpg_calc_text_basep(tpg, basep, p, vbuf);
-		if (!is_loop || vivid_copy_buffer(dev, p, vbuf, buf))
+		if (!out_dev || vivid_copy_buffer(dev, out_dev, p, vbuf, buf))
 			tpg_fill_plane_buffer(tpg, vivid_get_std_cap(dev),
 					p, vbuf);
 	}
+	if (out_dev && dev != out_dev)
+		mutex_unlock(&out_dev->mutex);
+
 	dev->must_blank[buf->vb.vb2_buf.index] = false;
 
 	/* Updates stream time, only update at the start of a new frame. */
diff --git a/drivers/media/test-drivers/vivid/vivid-vbi-cap.c b/drivers/media/test-drivers/vivid/vivid-vbi-cap.c
index 3840b3a664ac..f40d68853692 100644
--- a/drivers/media/test-drivers/vivid/vivid-vbi-cap.c
+++ b/drivers/media/test-drivers/vivid/vivid-vbi-cap.c
@@ -14,6 +14,7 @@
 #include "vivid-kthread-cap.h"
 #include "vivid-vbi-cap.h"
 #include "vivid-vbi-gen.h"
+#include "vivid-vid-common.h"
 
 static void vivid_sliced_vbi_cap_fill(struct vivid_dev *dev, unsigned seqnr)
 {
@@ -23,7 +24,7 @@ static void vivid_sliced_vbi_cap_fill(struct vivid_dev *dev, unsigned seqnr)
 	vivid_vbi_gen_sliced(vbi_gen, is_60hz, seqnr);
 
 	if (!is_60hz) {
-		if (dev->loop_video) {
+		if (vivid_vid_can_loop(dev)) {
 			if (dev->vbi_out_have_wss) {
 				vbi_gen->data[12].data[0] = dev->vbi_out_wss[0];
 				vbi_gen->data[12].data[1] = dev->vbi_out_wss[1];
@@ -47,7 +48,7 @@ static void vivid_sliced_vbi_cap_fill(struct vivid_dev *dev, unsigned seqnr)
 				break;
 			}
 		}
-	} else if (dev->loop_video && is_60hz) {
+	} else if (vivid_vid_can_loop(dev) && is_60hz) {
 		if (dev->vbi_out_have_cc[0]) {
 			vbi_gen->data[0].data[0] = dev->vbi_out_cc[0][0];
 			vbi_gen->data[0].data[1] = dev->vbi_out_cc[0][1];
diff --git a/drivers/media/test-drivers/vivid/vivid-vid-cap.c b/drivers/media/test-drivers/vivid/vivid-vid-cap.c
index fcbef8b58127..aff15c0e5a73 100644
--- a/drivers/media/test-drivers/vivid/vivid-vid-cap.c
+++ b/drivers/media/test-drivers/vivid/vivid-vid-cap.c
@@ -210,9 +210,6 @@ static int vid_cap_start_streaming(struct vb2_queue *vq, unsigned count)
 	unsigned i;
 	int err;
 
-	if (vb2_is_streaming(&dev->vb_vid_out_q))
-		dev->can_loop_video = vivid_vid_can_loop(dev);
-
 	dev->vid_cap_seq_count = 0;
 	dprintk(dev, 1, "%s\n", __func__);
 	for (i = 0; i < VIDEO_MAX_FRAME; i++)
@@ -242,7 +239,6 @@ static void vid_cap_stop_streaming(struct vb2_queue *vq)
 
 	dprintk(dev, 1, "%s\n", __func__);
 	vivid_stop_generating_vid_cap(dev, &dev->vid_cap_streaming);
-	dev->can_loop_video = false;
 }
 
 static void vid_cap_buf_request_complete(struct vb2_buffer *vb)
@@ -273,7 +269,7 @@ void vivid_update_quality(struct vivid_dev *dev)
 {
 	unsigned freq_modulus;
 
-	if (dev->loop_video && (vivid_is_svid_cap(dev) || vivid_is_hdmi_cap(dev))) {
+	if (dev->input_is_connected_to_output[dev->input]) {
 		/*
 		 * The 'noise' will only be replaced by the actual video
 		 * if the output video matches the input video settings.
@@ -487,35 +483,35 @@ static enum v4l2_field vivid_field_cap(struct vivid_dev *dev, enum v4l2_field fi
 
 static unsigned vivid_colorspace_cap(struct vivid_dev *dev)
 {
-	if (!dev->loop_video || vivid_is_webcam(dev) || vivid_is_tv_cap(dev))
+	if (!vivid_input_is_connected_to(dev))
 		return tpg_g_colorspace(&dev->tpg);
 	return dev->colorspace_out;
 }
 
 static unsigned vivid_xfer_func_cap(struct vivid_dev *dev)
 {
-	if (!dev->loop_video || vivid_is_webcam(dev) || vivid_is_tv_cap(dev))
+	if (!vivid_input_is_connected_to(dev))
 		return tpg_g_xfer_func(&dev->tpg);
 	return dev->xfer_func_out;
 }
 
 static unsigned vivid_ycbcr_enc_cap(struct vivid_dev *dev)
 {
-	if (!dev->loop_video || vivid_is_webcam(dev) || vivid_is_tv_cap(dev))
+	if (!vivid_input_is_connected_to(dev))
 		return tpg_g_ycbcr_enc(&dev->tpg);
 	return dev->ycbcr_enc_out;
 }
 
 static unsigned int vivid_hsv_enc_cap(struct vivid_dev *dev)
 {
-	if (!dev->loop_video || vivid_is_webcam(dev) || vivid_is_tv_cap(dev))
+	if (!vivid_input_is_connected_to(dev))
 		return tpg_g_hsv_enc(&dev->tpg);
 	return dev->hsv_enc_out;
 }
 
 static unsigned vivid_quantization_cap(struct vivid_dev *dev)
 {
-	if (!dev->loop_video || vivid_is_webcam(dev) || vivid_is_tv_cap(dev))
+	if (!vivid_input_is_connected_to(dev))
 		return tpg_g_quantization(&dev->tpg);
 	return dev->quantization_out;
 }
@@ -1537,13 +1533,65 @@ int vidioc_query_dv_timings(struct file *file, void *_fh,
 	return 0;
 }
 
+void vivid_update_outputs(struct vivid_dev *dev)
+{
+	u32 edid_present = 0;
+
+	if (!dev || !dev->num_outputs)
+		return;
+	for (unsigned int i = 0, j = 0; i < dev->num_outputs; i++) {
+		if (dev->output_type[i] != HDMI)
+			continue;
+
+		struct vivid_dev *dev_rx = dev->output_to_input_instance[i];
+
+		if (dev_rx && dev_rx->edid_blocks)
+			edid_present |= 1 << j;
+		j++;
+	}
+	v4l2_ctrl_s_ctrl(dev->ctrl_tx_edid_present, edid_present);
+	v4l2_ctrl_s_ctrl(dev->ctrl_tx_hotplug, edid_present);
+	v4l2_ctrl_s_ctrl(dev->ctrl_tx_rxsense, edid_present);
+}
+
+void vivid_update_connected_outputs(struct vivid_dev *dev)
+{
+	u16 phys_addr = cec_get_edid_phys_addr(dev->edid, dev->edid_blocks * 128, NULL);
+
+	for (unsigned int i = 0, j = 0; i < dev->num_inputs; i++) {
+		unsigned int menu_idx =
+			dev->input_is_connected_to_output[i];
+
+		if (dev->input_type[i] != HDMI)
+			continue;
+		j++;
+		if (menu_idx < FIXED_MENU_ITEMS)
+			continue;
+
+		struct vivid_dev *dev_tx = vivid_ctrl_hdmi_to_output_instance[menu_idx];
+		unsigned int output = vivid_ctrl_hdmi_to_output_index[menu_idx];
+
+		if (!dev_tx)
+			continue;
+
+		unsigned int hdmi_output = dev_tx->output_to_iface_index[output];
+
+		vivid_update_outputs(dev_tx);
+		if (dev->edid_blocks) {
+			cec_s_phys_addr(dev_tx->cec_tx_adap[hdmi_output],
+					v4l2_phys_addr_for_input(phys_addr, j),
+					false);
+		} else {
+			cec_phys_addr_invalidate(dev_tx->cec_tx_adap[hdmi_output]);
+		}
+	}
+}
+
 int vidioc_s_edid(struct file *file, void *_fh,
 			 struct v4l2_edid *edid)
 {
 	struct vivid_dev *dev = video_drvdata(file);
 	u16 phys_addr;
-	u32 display_present = 0;
-	unsigned int i, j;
 	int ret;
 
 	memset(edid->reserved, 0, sizeof(edid->reserved));
@@ -1552,13 +1600,11 @@ int vidioc_s_edid(struct file *file, void *_fh,
 	if (dev->input_type[edid->pad] != HDMI || edid->start_block)
 		return -EINVAL;
 	if (edid->blocks == 0) {
+		if (vb2_is_busy(&dev->vb_vid_cap_q))
+			return -EBUSY;
 		dev->edid_blocks = 0;
-		if (dev->num_outputs) {
-			v4l2_ctrl_s_ctrl(dev->ctrl_tx_edid_present, 0);
-			v4l2_ctrl_s_ctrl(dev->ctrl_tx_hotplug, 0);
-		}
-		phys_addr = CEC_PHYS_ADDR_INVALID;
-		goto set_phys_addr;
+		vivid_update_connected_outputs(dev);
+		return 0;
 	}
 	if (edid->blocks > dev->edid_max_blocks) {
 		edid->blocks = dev->edid_max_blocks;
@@ -1575,26 +1621,7 @@ int vidioc_s_edid(struct file *file, void *_fh,
 	dev->edid_blocks = edid->blocks;
 	memcpy(dev->edid, edid->edid, edid->blocks * 128);
 
-	for (i = 0, j = 0; i < dev->num_outputs; i++)
-		if (dev->output_type[i] == HDMI)
-			display_present |=
-				dev->display_present[i] << j++;
-
-	if (dev->num_outputs) {
-		v4l2_ctrl_s_ctrl(dev->ctrl_tx_edid_present, display_present);
-		v4l2_ctrl_s_ctrl(dev->ctrl_tx_hotplug, display_present);
-	}
-
-set_phys_addr:
-	/* TODO: a proper hotplug detect cycle should be emulated here */
-	cec_s_phys_addr(dev->cec_rx_adap, phys_addr, false);
-
-	for (i = 0; i < MAX_OUTPUTS && dev->cec_tx_adap[i]; i++)
-		cec_s_phys_addr(dev->cec_tx_adap[i],
-				dev->display_present[i] ?
-				v4l2_phys_addr_for_input(phys_addr, i + 1) :
-				CEC_PHYS_ADDR_INVALID,
-				false);
+	vivid_update_connected_outputs(dev);
 	return 0;
 }
 
diff --git a/drivers/media/test-drivers/vivid/vivid-vid-cap.h b/drivers/media/test-drivers/vivid/vivid-vid-cap.h
index 949768652d38..7a8daf0af2ca 100644
--- a/drivers/media/test-drivers/vivid/vivid-vid-cap.h
+++ b/drivers/media/test-drivers/vivid/vivid-vid-cap.h
@@ -10,6 +10,8 @@
 
 void vivid_update_quality(struct vivid_dev *dev);
 void vivid_update_format_cap(struct vivid_dev *dev, bool keep_controls);
+void vivid_update_outputs(struct vivid_dev *dev);
+void vivid_update_connected_outputs(struct vivid_dev *dev);
 enum tpg_video_aspect vivid_get_video_aspect(const struct vivid_dev *dev);
 
 extern const v4l2_std_id vivid_standard[];
diff --git a/drivers/media/test-drivers/vivid/vivid-vid-common.c b/drivers/media/test-drivers/vivid/vivid-vid-common.c
index a3e8eb90f11b..df7678db67fb 100644
--- a/drivers/media/test-drivers/vivid/vivid-vid-common.c
+++ b/drivers/media/test-drivers/vivid/vivid-vid-common.c
@@ -769,14 +769,55 @@ const struct vivid_fmt *vivid_get_format(struct vivid_dev *dev, u32 pixelformat)
 	return NULL;
 }
 
+struct vivid_dev *vivid_output_is_connected_to(struct vivid_dev *dev)
+{
+	struct vivid_dev *input_inst = dev->output_to_input_instance[dev->output];
+
+	if (!input_inst)
+		return NULL;
+	if (input_inst->input != dev->output_to_input_index[dev->output])
+		return NULL;
+	return input_inst;
+}
+
+struct vivid_dev *vivid_input_is_connected_to(struct vivid_dev *dev)
+{
+	s32 connected_output = dev->input_is_connected_to_output[dev->input];
+
+	if (connected_output < FIXED_MENU_ITEMS)
+		return NULL;
+	struct vivid_dev *output_inst = NULL;
+
+	if (vivid_is_hdmi_cap(dev)) {
+		output_inst = vivid_ctrl_hdmi_to_output_instance[connected_output];
+		if (vivid_ctrl_hdmi_to_output_index[connected_output] != output_inst->output)
+			return NULL;
+		return output_inst;
+	} else if (vivid_is_svid_cap(dev)) {
+		output_inst = vivid_ctrl_svid_to_output_instance[connected_output];
+		if (vivid_ctrl_svid_to_output_index[connected_output] != output_inst->output)
+			return NULL;
+		return output_inst;
+	} else {
+		return NULL;
+	}
+	return output_inst;
+}
+
 bool vivid_vid_can_loop(struct vivid_dev *dev)
 {
-	if (dev->src_rect.width != dev->sink_rect.width ||
-	    dev->src_rect.height != dev->sink_rect.height)
+	struct vivid_dev *output_inst = vivid_input_is_connected_to(dev);
+
+	if (!output_inst)
 		return false;
-	if (dev->fmt_cap->fourcc != dev->fmt_out->fourcc)
+	if (!vb2_is_streaming(&output_inst->vb_vid_out_q))
 		return false;
-	if (dev->field_cap != dev->field_out)
+	if (dev->src_rect.width != output_inst->sink_rect.width ||
+	    dev->src_rect.height != output_inst->sink_rect.height)
+		return false;
+	if (dev->fmt_cap->fourcc != output_inst->fmt_out->fourcc)
+		return false;
+	if (dev->field_cap != output_inst->field_out)
 		return false;
 	/*
 	 * While this can be supported, it is just too much work
@@ -785,34 +826,34 @@ bool vivid_vid_can_loop(struct vivid_dev *dev)
 	if (dev->field_cap == V4L2_FIELD_SEQ_TB ||
 	    dev->field_cap == V4L2_FIELD_SEQ_BT)
 		return false;
-	if (vivid_is_svid_cap(dev) && vivid_is_svid_out(dev)) {
-		if (!(dev->std_cap[dev->input] & V4L2_STD_525_60) !=
-		    !(dev->std_out & V4L2_STD_525_60))
-			return false;
-		return true;
-	}
-	if (vivid_is_hdmi_cap(dev) && vivid_is_hdmi_out(dev))
+	if (vivid_is_hdmi_cap(dev))
 		return true;
-	return false;
+	if (!(dev->std_cap[dev->input] & V4L2_STD_525_60) !=
+	    !(output_inst->std_out & V4L2_STD_525_60))
+		return false;
+	return true;
 }
 
-void vivid_send_source_change(struct vivid_dev *dev, unsigned type)
+void vivid_send_input_source_change(struct vivid_dev *dev, unsigned int input_index)
 {
 	struct v4l2_event ev = {
 		.type = V4L2_EVENT_SOURCE_CHANGE,
 		.u.src_change.changes = V4L2_EVENT_SRC_CH_RESOLUTION,
 	};
-	unsigned i;
+	ev.id = input_index;
 
-	for (i = 0; i < dev->num_inputs; i++) {
-		ev.id = i;
-		if (dev->input_type[i] == type) {
-			if (video_is_registered(&dev->vid_cap_dev) && dev->has_vid_cap)
-				v4l2_event_queue(&dev->vid_cap_dev, &ev);
-			if (video_is_registered(&dev->vbi_cap_dev) && dev->has_vbi_cap)
-				v4l2_event_queue(&dev->vbi_cap_dev, &ev);
-		}
-	}
+	if (video_is_registered(&dev->vid_cap_dev) && dev->has_vid_cap)
+		v4l2_event_queue(&dev->vid_cap_dev, &ev);
+	if (dev->input_type[input_index] == TV || dev->input_type[input_index] == SVID)
+		if (video_is_registered(&dev->vbi_cap_dev) && dev->has_vbi_cap)
+			v4l2_event_queue(&dev->vbi_cap_dev, &ev);
+}
+
+void vivid_send_source_change(struct vivid_dev *dev, unsigned int type)
+{
+	for (int i = 0; i < dev->num_inputs; i++)
+		if (dev->input_type[i] == type)
+			vivid_send_input_source_change(dev, i);
 }
 
 /*
@@ -1036,6 +1077,7 @@ int vidioc_g_edid(struct file *file, void *_fh,
 			 struct v4l2_edid *edid)
 {
 	struct vivid_dev *dev = video_drvdata(file);
+	struct vivid_dev *dev_rx = dev;
 	struct video_device *vdev = video_devdata(file);
 	struct cec_adapter *adap;
 	unsigned int loc;
@@ -1048,31 +1090,33 @@ int vidioc_g_edid(struct file *file, void *_fh,
 			return -EINVAL;
 		adap = dev->cec_rx_adap;
 	} else {
-		unsigned int bus_idx;
-
 		if (edid->pad >= dev->num_outputs)
 			return -EINVAL;
 		if (dev->output_type[edid->pad] != HDMI)
 			return -EINVAL;
-		if (!dev->display_present[edid->pad])
+		dev_rx = dev->output_to_input_instance[edid->pad];
+		if (!dev_rx)
 			return -ENODATA;
-		bus_idx = dev->cec_output2bus_map[edid->pad];
-		adap = dev->cec_tx_adap[bus_idx];
+
+		unsigned int hdmi_output = dev->output_to_iface_index[edid->pad];
+
+		adap = dev->cec_tx_adap[hdmi_output];
 	}
 	if (edid->start_block == 0 && edid->blocks == 0) {
-		edid->blocks = dev->edid_blocks;
+		edid->blocks = dev_rx->edid_blocks;
 		return 0;
 	}
-	if (dev->edid_blocks == 0)
+	if (dev_rx->edid_blocks == 0)
 		return -ENODATA;
-	if (edid->start_block >= dev->edid_blocks)
+	if (edid->start_block >= dev_rx->edid_blocks)
 		return -EINVAL;
-	if (edid->blocks > dev->edid_blocks - edid->start_block)
-		edid->blocks = dev->edid_blocks - edid->start_block;
+	if (edid->blocks > dev_rx->edid_blocks - edid->start_block)
+		edid->blocks = dev_rx->edid_blocks - edid->start_block;
 
-	memcpy(edid->edid, dev->edid + edid->start_block * 128, edid->blocks * 128);
+	memcpy(edid->edid, dev_rx->edid + edid->start_block * 128, edid->blocks * 128);
 
-	loc = cec_get_edid_spa_location(dev->edid, dev->edid_blocks * 128);
+	loc = cec_get_edid_spa_location(dev_rx->edid,
+					dev_rx->edid_blocks * 128);
 	if (vdev->vfl_dir == VFL_DIR_TX && adap && loc &&
 	    loc >= edid->start_block * 128 &&
 	    loc < (edid->start_block + edid->blocks) * 128) {
diff --git a/drivers/media/test-drivers/vivid/vivid-vid-common.h b/drivers/media/test-drivers/vivid/vivid-vid-common.h
index d908d9725283..c49ac85abaed 100644
--- a/drivers/media/test-drivers/vivid/vivid-vid-common.h
+++ b/drivers/media/test-drivers/vivid/vivid-vid-common.h
@@ -22,8 +22,11 @@ extern const struct v4l2_dv_timings_cap vivid_dv_timings_cap;
 
 const struct vivid_fmt *vivid_get_format(struct vivid_dev *dev, u32 pixelformat);
 
+struct vivid_dev *vivid_input_is_connected_to(struct vivid_dev *dev);
+struct vivid_dev *vivid_output_is_connected_to(struct vivid_dev *dev);
 bool vivid_vid_can_loop(struct vivid_dev *dev);
-void vivid_send_source_change(struct vivid_dev *dev, unsigned type);
+void vivid_send_source_change(struct vivid_dev *dev, unsigned int type);
+void vivid_send_input_source_change(struct vivid_dev *dev, unsigned int input_index);
 
 int vivid_vid_adjust_sel(unsigned flags, struct v4l2_rect *r);
 
diff --git a/drivers/media/test-drivers/vivid/vivid-vid-out.c b/drivers/media/test-drivers/vivid/vivid-vid-out.c
index a299b872c05a..74752e15cba6 100644
--- a/drivers/media/test-drivers/vivid/vivid-vid-out.c
+++ b/drivers/media/test-drivers/vivid/vivid-vid-out.c
@@ -155,9 +155,6 @@ static int vid_out_start_streaming(struct vb2_queue *vq, unsigned count)
 	struct vivid_dev *dev = vb2_get_drv_priv(vq);
 	int err;
 
-	if (vb2_is_streaming(&dev->vb_vid_cap_q))
-		dev->can_loop_video = vivid_vid_can_loop(dev);
-
 	dev->vid_out_seq_count = 0;
 	dprintk(dev, 1, "%s\n", __func__);
 	if (dev->start_streaming_error) {
@@ -185,7 +182,6 @@ static void vid_out_stop_streaming(struct vb2_queue *vq)
 
 	dprintk(dev, 1, "%s\n", __func__);
 	vivid_stop_generating_vid_out(dev, &dev->vid_out_streaming);
-	dev->can_loop_video = false;
 }
 
 static void vid_out_buf_request_complete(struct vb2_buffer *vb)
@@ -562,9 +558,11 @@ int vivid_s_fmt_vid_out(struct file *file, void *priv,
 	dev->xfer_func_out = mp->xfer_func;
 	dev->ycbcr_enc_out = mp->ycbcr_enc;
 	dev->quantization_out = mp->quantization;
-	if (dev->loop_video) {
-		vivid_send_source_change(dev, SVID);
-		vivid_send_source_change(dev, HDMI);
+	struct vivid_dev *in_dev = vivid_output_is_connected_to(dev);
+
+	if (in_dev) {
+		vivid_send_source_change(in_dev, SVID);
+		vivid_send_source_change(in_dev, HDMI);
 	}
 	return 0;
 }
@@ -1014,11 +1012,6 @@ int vidioc_s_output(struct file *file, void *priv, unsigned o)
 	dev->meta_out_dev.tvnorms = dev->vid_out_dev.tvnorms;
 	vivid_update_format_out(dev);
 
-	v4l2_ctrl_activate(dev->ctrl_display_present, vivid_is_hdmi_out(dev));
-	if (vivid_is_hdmi_out(dev))
-		v4l2_ctrl_s_ctrl(dev->ctrl_display_present,
-				 dev->display_present[dev->output]);
-
 	return 0;
 }
 
-- 
2.34.1


