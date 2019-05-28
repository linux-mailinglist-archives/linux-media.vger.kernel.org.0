Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EED692CBAF
	for <lists+linux-media@lfdr.de>; Tue, 28 May 2019 18:19:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726945AbfE1QTw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 May 2019 12:19:52 -0400
Received: from mail-ed1-f68.google.com ([209.85.208.68]:45892 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726927AbfE1QTv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 May 2019 12:19:51 -0400
Received: by mail-ed1-f68.google.com with SMTP id g57so17769079edc.12
        for <linux-media@vger.kernel.org>; Tue, 28 May 2019 09:19:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=Z6BAb8U4jAKgq+VJA+Ioc28MS9MNOX5YtQzmthG7c44=;
        b=VZIbAJazyzC9rMfgwy7yk/BBsVfL7cJryeHe1ZDCMkrp81gnONfaB9WtZx0vHT89kr
         WgMt29vO6f+k6KGm21wsQXx0MGoPDQkn01O7494qijLZR0FjH5KjutI2XAYaErvvZ2Ew
         RJ16/6Sd5JdNUbetL06mL9nE7DBATM0XrxfFRXNXqEVgLw9AcNjvr0EbNAoZbFReczHY
         Cjr5LxHqEXb0FH0Xzc3a9rl61rz+qQAk6dbc8ASbxV5Qf1MWOWK9KKUGC6ba80YaKG9G
         IwIqpQLE7QIRsGhYxPczDrt78MYy42IHo0g42jRhPVc8WMdmuvrsBOFFhMBGszyn3eyy
         ewyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=Z6BAb8U4jAKgq+VJA+Ioc28MS9MNOX5YtQzmthG7c44=;
        b=JGF0QILfQVix+WuSg9w1OEw0d4tEmGUS9kMqW0A+i8WgjY9STIxre8n2oP44Y3ePvQ
         X7QtEu6NzskDT6od8NOQU4BWTd9bw6DCfwvcqMcnAqT14+clw7H4dvv2KWbxTDmaiByq
         vYep+PMDN5+lFTSSORXS6Q056jbS49yEm8GzwrNhzBiXDLhrL6u8YF+p0mIZ3k3H8GvX
         9D+7WBuEf2xb9Gf/1JnWTPykMQobPAOaPvmTzIZ7OskOn48NKo7HrMsOuujOpo0JHutW
         2JIF7u9O8GpfpMylpDkThk5w/gP9H9SsprgM4uOERejQOZ+xDHA+XLbBkERPScDcTnH2
         inKA==
X-Gm-Message-State: APjAAAVneAG/x/N0AkiqUFunso/4SZOZFwO2zzqwwQb9YIQB5Xh7MnwY
        OC+mrnUDXHqwXKHTZzv2ISWBk4QCugM=
X-Google-Smtp-Source: APXvYqwKCKOmizZXf+gpOHVgTTciAMVU9iX5Ocuxg3INpmxcGAL9NkbM0KmSE9eBxWvTcsDziHpf+A==
X-Received: by 2002:a50:a93c:: with SMTP id l57mr40354599edc.151.1559060389817;
        Tue, 28 May 2019 09:19:49 -0700 (PDT)
Received: from ubuntu.localdomain ([173.38.220.62])
        by smtp.gmail.com with ESMTPSA id c38sm4313002edc.22.2019.05.28.09.19.48
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 28 May 2019 09:19:49 -0700 (PDT)
From:   johan.korsnes@gmail.com
To:     linux-media@vger.kernel.org
Cc:     Johan Korsnes <johan.korsnes@gmail.com>
Subject: [PATCH 6/8] media: vivid: add HDMI (dis)connect RX emulation
Date:   Tue, 28 May 2019 10:19:10 -0700
Message-Id: <20190528171912.3688-7-johan.korsnes@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190528171912.3688-1-johan.korsnes@gmail.com>
References: <20190528171912.3688-1-johan.korsnes@gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Johan Korsnes <johan.korsnes@gmail.com>

Adds the following bitmask control:
-V4L2_CID_DV_RX_POWER_PRESENT

The RX_POWER_PRESENT bitmask is set based on the digital video timings
signal mode. This also removes 1/1 warnings for v4l2-compliance test on
vivid instance with HDMI input.

Signed-off-by: Johan Korsnes <johan.korsnes@gmail.com>
---
 drivers/media/platform/vivid/vivid-core.h  |  4 ++++
 drivers/media/platform/vivid/vivid-ctrls.c | 19 +++++++++++++++++--
 2 files changed, 21 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/vivid/vivid-core.h b/drivers/media/platform/vivid/vivid-core.h
index b7307cbba2a5..f5ad92c376f7 100644
--- a/drivers/media/platform/vivid/vivid-core.h
+++ b/drivers/media/platform/vivid/vivid-core.h
@@ -252,6 +252,8 @@ struct vivid_dev {
 	struct v4l2_ctrl		*ctrl_tx_hotplug;
 	struct v4l2_ctrl		*ctrl_tx_rxsense;
 
+	struct v4l2_ctrl		*ctrl_rx_power_present;
+
 	struct v4l2_ctrl		*radio_tx_rds_pi;
 	struct v4l2_ctrl		*radio_tx_rds_pty;
 	struct v4l2_ctrl		*radio_tx_rds_mono_stereo;
@@ -335,6 +337,8 @@ struct vivid_dev {
 	unsigned			tv_field_cap;
 	unsigned			tv_audio_input;
 
+	u32				power_present;
+
 	/* Capture Overlay */
 	struct v4l2_framebuffer		fb_cap;
 	struct v4l2_fh			*overlay_cap_owner;
diff --git a/drivers/media/platform/vivid/vivid-ctrls.c b/drivers/media/platform/vivid/vivid-ctrls.c
index 5cb7232a8278..ae3690fd1b52 100644
--- a/drivers/media/platform/vivid/vivid-ctrls.c
+++ b/drivers/media/platform/vivid/vivid-ctrls.c
@@ -358,7 +358,7 @@ static int vivid_vid_cap_s_ctrl(struct v4l2_ctrl *ctrl)
 		V4L2_COLORSPACE_470_SYSTEM_BG,
 	};
 	struct vivid_dev *dev = container_of(ctrl->handler, struct vivid_dev, ctrl_hdl_vid_cap);
-	unsigned i;
+	unsigned i, j;
 
 	switch (ctrl->id) {
 	case VIVID_CID_TEST_PATTERN:
@@ -472,6 +472,16 @@ static int vivid_vid_cap_s_ctrl(struct v4l2_ctrl *ctrl)
 			dev->ctrl_dv_timings_signal_mode->val;
 		dev->query_dv_timings[dev->input] = dev->ctrl_dv_timings->val;
 
+		dev->power_present = 0;
+		for (i = 0, j = 0; i < ARRAY_SIZE(dev->dv_timings_signal_mode); i++)
+			if (dev->input_type[i] == HDMI) {
+				if (dev->dv_timings_signal_mode[i] != NO_SIGNAL)
+					dev->power_present |= (1 << j);
+				j++;
+			}
+		__v4l2_ctrl_s_ctrl(dev->ctrl_rx_power_present,
+				   dev->power_present);
+
 		v4l2_ctrl_activate(dev->ctrl_dv_timings,
 			dev->dv_timings_signal_mode[dev->input] ==
 				SELECTED_DV_TIMINGS);
@@ -1582,7 +1592,7 @@ int vivid_create_controls(struct vivid_dev *dev, bool show_ccs_cap,
 			v4l2_ctrl_new_custom(hdl_vbi_cap, &vivid_ctrl_vbi_cap_interlaced, NULL);
 	}
 
-	if (has_hdmi && dev->has_vid_cap) {
+	if (dev->num_hdmi_inputs) {
 		dev->ctrl_dv_timings_signal_mode = v4l2_ctrl_new_custom(hdl_vid_cap,
 					&vivid_ctrl_dv_timings_signal_mode, NULL);
 
@@ -1602,6 +1612,11 @@ int vivid_create_controls(struct vivid_dev *dev, bool show_ccs_cap,
 			&vivid_vid_cap_ctrl_ops,
 			V4L2_CID_DV_RX_RGB_RANGE, V4L2_DV_RGB_RANGE_FULL,
 			0, V4L2_DV_RGB_RANGE_AUTO);
+		dev->ctrl_rx_power_present = v4l2_ctrl_new_std(hdl_vid_cap,
+			NULL, V4L2_CID_DV_RX_POWER_PRESENT, 0,
+			(2 << (dev->num_hdmi_inputs - 1)) - 1, 0,
+			(2 << (dev->num_hdmi_inputs - 1)) - 1);
+
 	}
 	if (dev->num_hdmi_outputs) {
 		/*
-- 
2.17.1

