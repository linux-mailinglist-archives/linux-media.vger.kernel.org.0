Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3DACFD5A27
	for <lists+linux-media@lfdr.de>; Mon, 14 Oct 2019 06:17:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726537AbfJNER3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Oct 2019 00:17:29 -0400
Received: from mail-oi1-f194.google.com ([209.85.167.194]:46514 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726520AbfJNER3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Oct 2019 00:17:29 -0400
Received: by mail-oi1-f194.google.com with SMTP id k25so12628788oiw.13
        for <linux-media@vger.kernel.org>; Sun, 13 Oct 2019 21:17:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8nHr1trH6vWhPt8mTdU5VK4IUAHiHEFnelbcyexj+Fg=;
        b=JxEROZP1mZBKoqM5/B5NESeW617FOBOclv8zRSjcEh2D9Vbjq3HV7MIZO+YoWBbYbN
         wLkIknwGxSEhqVQfhGb2lzANUR3eXLhEYvC85iwXl4EIz3BqeawBMkEd8h1bkADV+Ath
         1/k85TPYRRCuwe+iWrlPYDtRNIdt5/yiuFxpiLz20xHWpsyf9bQjTroe6pAkhIGLqkmy
         WrWUHiwR2+8w22BFbeXSjwxBDkGwZ8TY2UHFiPUAO4sb6zTanUWi3o2nDukaYFvHZNA1
         IdrNzu0ia3ax4IhIiaF8i4zt1FK5woeazoWyqzPTxXwSeEGlZqygDATQKK2NZbueHJQh
         j/3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8nHr1trH6vWhPt8mTdU5VK4IUAHiHEFnelbcyexj+Fg=;
        b=ZzwmM4z0Tje8HTi/Dhl/k2Yu3kiaiyt7VsWz59AddRbZllyDc8tR35a2g6d8UUKtgB
         dDHtO+0KwkWEdZjgqXSM9xDfoCG23TVeFyOVylPuhYfDYeengs+j7NRpgUpxVvqWkPEc
         EMISs2Zz0s9OAetYMa1ptuN3MHWs0piK7A+WTrEGE0EKB/dnCTW3pksT+sTiV4Fznnm1
         JTSH1UyEE4ZOSj9nmT0OKdnXhS7RkvY2OuJxEsY8YhI1tIqVCcC3sp5t/JZK/Dz/4IDc
         RyrhuotoI3L2iowsK7F284SJgsZlGJEjnPGAtSPUSIh9aretwD44mOkk1NB31T2vtKwn
         eRrQ==
X-Gm-Message-State: APjAAAX2rxwqrgD8zZr+KUjqK7wnIG/o8jNLhflxCYG4UxYBYZr1jENw
        ECL4xdOvCfsAleVh55jUq2lMkdxf
X-Google-Smtp-Source: APXvYqzh2xn/BKqRgf11hpEDv2ock/5//J2Or18wG2/rQadpjeM5kE/cyJdNWPOJtkXRgK9LtTV0QA==
X-Received: by 2002:aca:fd51:: with SMTP id b78mr21813788oii.78.1571026647543;
        Sun, 13 Oct 2019 21:17:27 -0700 (PDT)
Received: from rYz3n.attlocal.net ([2600:1700:210:3790::40])
        by smtp.googlemail.com with ESMTPSA id l19sm4887918oie.22.2019.10.13.21.17.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Oct 2019 21:17:27 -0700 (PDT)
From:   Jiunn Chang <c0d1n61at3@gmail.com>
To:     linux-media@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org
Cc:     hverkuil@xs4all.nl
Subject: [PATCH 6/8] cec-follower: add tuner digital service emulation
Date:   Sun, 13 Oct 2019 23:17:19 -0500
Message-Id: <20191014041721.52025-7-c0d1n61at3@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191014041721.52025-1-c0d1n61at3@gmail.com>
References: <20191014041721.52025-1-c0d1n61at3@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The cec-follower will now emulate a digital service.  This allows an
initiator device can directly select a digital service by choosing a
digital service ID method and broadcast system along with the proper
digital IDs or channel data.  After a digital service is selected,
the cec-follower will also provide the tuner device status upon
request.

Opcodes implemented:
  - <Select Digital Service>

Signed-off-by: Jiunn Chang <c0d1n61at3@gmail.com>
---
 utils/cec-follower/cec-tuner.cpp | 169 +++++++++++++++++++++++++++++++
 1 file changed, 169 insertions(+)

diff --git a/utils/cec-follower/cec-tuner.cpp b/utils/cec-follower/cec-tuner.cpp
index 04e7e4c3..760eed2a 100644
--- a/utils/cec-follower/cec-tuner.cpp
+++ b/utils/cec-follower/cec-tuner.cpp
@@ -244,6 +244,162 @@ void analog_tuner_init(struct state *state)
 	info->analog.ana_freq = (freq_khz * 10) / 625;
 }
 
+static int digital_get_service_offset(struct cec_op_digital_service_id *digital)
+{
+	__u8 method = digital->service_id_method;
+	struct cec_op_dvb_data *dvb = &digital->dvb;
+	struct cec_op_atsc_data *atsc = &digital->atsc;
+	struct cec_op_channel_data *channel = &digital->channel;
+	unsigned int sys =
+		(digital->dig_bcast_system == CEC_OP_DIG_SERVICE_BCAST_SYSTEM_ARIB_T ||
+		 digital->dig_bcast_system == CEC_OP_DIG_SERVICE_BCAST_SYSTEM_ATSC_T ||
+		 digital->dig_bcast_system == CEC_OP_DIG_SERVICE_BCAST_SYSTEM_DVB_T) ? 1 : 0;
+
+	for (int i = 0; i < NUM_DIGITAL_CHANS; i++) {
+		switch (method) {
+		case CEC_OP_SERVICE_ID_METHOD_BY_DIG_ID:
+			if (dvb->transport_id == digital_arib_data[sys][0][i].tsid &&
+			    dvb->service_id == digital_arib_data[sys][0][i].sid &&
+			    dvb->orig_network_id == digital_arib_data[sys][0][i].onid) {
+				return (sys * NUM_DIGITAL_CHANS) + i;
+			}
+			if (atsc->transport_id == digital_atsc_data[sys][0][i].tsid &&
+			    atsc->program_number == digital_atsc_data[sys][0][i].sid) {
+				return (sys * NUM_DIGITAL_CHANS) + i;
+			}
+			if (dvb->transport_id == digital_dvb_data[sys][0][i].tsid &&
+			    dvb->service_id == digital_dvb_data[sys][0][i].sid &&
+			    dvb->orig_network_id == digital_dvb_data[sys][0][i].onid) {
+				return (sys * NUM_DIGITAL_CHANS) + i;
+			}
+			break;
+		case CEC_OP_SERVICE_ID_METHOD_BY_CHANNEL:
+			if (channel->minor == digital_arib_data[sys][0][i].minor) {
+				return (sys * NUM_DIGITAL_CHANS) + i;
+			}
+			if (channel->major == digital_atsc_data[sys][0][i].major &&
+			    channel->minor == digital_atsc_data[sys][0][i].minor) {
+				return (sys * NUM_DIGITAL_CHANS) + i;
+			}
+			if (channel->minor == digital_dvb_data[sys][0][i].minor) {
+				return (sys * NUM_DIGITAL_CHANS) + i;
+			}
+			break;
+		default:
+			break;
+		}
+	}
+	return -1;
+}
+
+static int digital_get_service_idx(struct cec_op_digital_service_id *digital)
+{
+	__u8 system = digital->dig_bcast_system;
+	int offset = digital_get_service_offset(digital);
+
+	switch (system) {
+	case CEC_OP_DIG_SERVICE_BCAST_SYSTEM_ARIB_BS:
+	case CEC_OP_DIG_SERVICE_BCAST_SYSTEM_ARIB_T:
+		return offset;
+	case CEC_OP_DIG_SERVICE_BCAST_SYSTEM_ATSC_SAT:
+	case CEC_OP_DIG_SERVICE_BCAST_SYSTEM_ATSC_T: {
+		return offset == -1 ? offset : NUM_DIGITAL_CHANS * 2 + offset;
+	}
+	case CEC_OP_DIG_SERVICE_BCAST_SYSTEM_DVB_S2:
+	case CEC_OP_DIG_SERVICE_BCAST_SYSTEM_DVB_T: {
+		return offset == -1 ? offset : NUM_DIGITAL_CHANS * 4 + offset;
+	}
+	default:
+		break;
+	}
+	return -1;
+}
+
+static void digital_update_tuner_dev_info(struct node *node, unsigned int idx,
+					  __u8 method = CEC_OP_SERVICE_ID_METHOD_BY_DIG_ID)
+{
+	struct cec_op_tuner_device_info *info = &node->state.tuner_dev_info;
+	struct cec_op_digital_service_id *digital = &info->digital;
+	struct cec_op_dvb_data *dvb = &digital->dvb;
+	struct cec_op_atsc_data *atsc = &digital->atsc;
+	struct cec_op_channel_data *channel = &digital->channel;
+	unsigned int tbl = idx / (NUM_DIGITAL_CHANS * 2);
+	unsigned int sys = (idx % (NUM_DIGITAL_CHANS * 2)) / NUM_DIGITAL_CHANS;
+	unsigned int offset = idx % NUM_DIGITAL_CHANS;
+
+	node->state.service_idx = idx;
+	info->tuner_display_info = CEC_OP_TUNER_DISPLAY_INFO_DIGITAL;
+	info->is_analog = false;
+	digital->service_id_method = method;
+	switch (tbl) {
+	case 0: {
+		if (sys)
+			digital->dig_bcast_system = CEC_OP_DIG_SERVICE_BCAST_SYSTEM_ARIB_T;
+		else
+			digital->dig_bcast_system = CEC_OP_DIG_SERVICE_BCAST_SYSTEM_ARIB_BS;
+		if (digital->service_id_method) {
+			channel->channel_number_fmt = digital_arib_data[sys][0][offset].fmt;
+			channel->major = digital_arib_data[sys][0][offset].major;
+			channel->minor = digital_arib_data[sys][0][offset].minor;
+		} else {
+			dvb->transport_id = digital_arib_data[sys][0][offset].tsid;
+			dvb->orig_network_id = digital_arib_data[sys][0][offset].onid;
+			dvb->service_id = digital_arib_data[sys][0][offset].sid;
+		}
+		break;
+	}
+	case 1: {
+		if (sys)
+			digital->dig_bcast_system = CEC_OP_DIG_SERVICE_BCAST_SYSTEM_ATSC_T;
+		else
+			digital->dig_bcast_system = CEC_OP_DIG_SERVICE_BCAST_SYSTEM_ATSC_SAT;
+		if (digital->service_id_method) {
+			channel->channel_number_fmt = digital_atsc_data[sys][0][offset].fmt;
+			channel->major = digital_atsc_data[sys][0][offset].major;
+			channel->minor = digital_atsc_data[sys][0][offset].minor;
+		} else {
+			atsc->transport_id = digital_atsc_data[sys][0][offset].tsid;
+			atsc->program_number = digital_atsc_data[sys][0][offset].sid;
+		}
+		break;
+	}
+	case 2: {
+		if (sys)
+			digital->dig_bcast_system = CEC_OP_DIG_SERVICE_BCAST_SYSTEM_DVB_T;
+		else
+			digital->dig_bcast_system = CEC_OP_DIG_SERVICE_BCAST_SYSTEM_DVB_S2;
+		if (digital->service_id_method) {
+			channel->channel_number_fmt = digital_dvb_data[sys][0][offset].fmt;
+			channel->major = digital_dvb_data[sys][0][offset].major;
+			channel->minor = digital_dvb_data[sys][0][offset].minor;
+		} else {
+			dvb->transport_id = digital_dvb_data[sys][0][offset].tsid;
+			dvb->orig_network_id = digital_dvb_data[sys][0][offset].onid;
+			dvb->service_id = digital_dvb_data[sys][0][offset].sid;
+		}
+		break;
+	}
+	default:
+		break;
+	}
+}
+
+static bool digital_set_tuner_dev_info(struct node *node, struct cec_msg *msg)
+{
+	struct cec_op_digital_service_id digital = {};
+	__u8 method;
+	int idx;
+
+	cec_ops_select_digital_service(msg, &digital);
+	method = digital.service_id_method;
+	idx = digital_get_service_idx(&digital);
+	if (idx > -1) {
+		digital_update_tuner_dev_info(node, idx, method);
+		return true;
+	}
+	return false;
+}
+
 static unsigned int analog_get_nearest_service_idx(__u8 ana_bcast_type, __u8 ana_bcast_system,
 						   int ana_freq_khz)
 {
@@ -340,6 +496,19 @@ void process_tuner_record_timer_msgs(struct node *node, struct cec_msg &msg, uns
 		return;
 
 	case CEC_MSG_SELECT_DIGITAL_SERVICE:
+		if (!cec_has_tuner(1 << me) && !cec_has_tv(1 << me))
+			break;
+
+		if (node->state.tuner_dev_info.rec_flag == CEC_OP_REC_FLAG_USED) {
+			reply_feature_abort(node, &msg, CEC_OP_ABORT_REFUSED);
+			return;
+		}
+		if (!digital_set_tuner_dev_info(node, &msg)) {
+			reply_feature_abort(node, &msg, CEC_OP_ABORT_INVALID_OP);
+			return;
+		}
+		return;
+
 	case CEC_MSG_TUNER_STEP_DECREMENT: {
 		if (!cec_has_tuner(1 << me) && !cec_has_tv(1 << me))
 			break;
-- 
2.23.0

