Return-Path: <linux-media+bounces-29909-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C4FDA83FE0
	for <lists+linux-media@lfdr.de>; Thu, 10 Apr 2025 12:04:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5102E1B82BEC
	for <lists+linux-media@lfdr.de>; Thu, 10 Apr 2025 10:02:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9AD726B091;
	Thu, 10 Apr 2025 10:00:52 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6091A202F88
	for <linux-media@vger.kernel.org>; Thu, 10 Apr 2025 10:00:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744279252; cv=none; b=fmHUxQnP4/tqz/1GK3uFG7XurjY+DCnOFHmm4V6ss8ByXtsNx4iHpibwB9os4LXEZUTr77AROQ8lQ4UDMfyOUSoiWEcnb/ozg5g/d5N/PCPBycAgwzdig6Kl4O7p6RQhkN4AA9kJ3i2zM2Ok9Nwt0+DRMWABMQtwz0uovbkzzZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744279252; c=relaxed/simple;
	bh=TGsF/Oym7zb6b18U5sNebLaBOWscnegMlJd8mhxaOmk=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=HzD6td5RWhTlsLKMcq+2XEGfyfr2LFIt41IRsE0Cl9oiGTc1LqUSHOviCIOIN2bRQoUa0QfLTFYo4x3IIiTiHiY+uG1xiqirESQPo9u2BYBxg9gFkwUNl/xn0wjmA+ZL0ESShmFNBLmwc0sBKwdsoEeECswS5FcRV8w8u+x+SXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 917FFC4CEDD
	for <linux-media@vger.kernel.org>; Thu, 10 Apr 2025 10:00:51 +0000 (UTC)
Message-ID: <be86c4a6-33f1-4f1c-bdc3-0a60804d4ea3@xs4all.nl>
Date: Thu, 10 Apr 2025 12:00:49 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US, nl
To: Linux Media Mailing List <linux-media@vger.kernel.org>
From: Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH] media: uapi: cec-funcs.h: use CEC_LOG_ADDR_BROADCAST
Autocrypt: addr=hverkuil@xs4all.nl; keydata=
 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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

The cec-funcs.h header sets the destination to 0xf for those
messages that can only be broadcast. Instead of writing:

	msg->msg[0] |= 0xf; /* broadcast */

just write:

	msg->msg[0] |= CEC_LOG_ADDR_BROADCAST;

which is more descriptive and allows us to drop the comment.

Signed-off-by: Hans Verkuil <hverkuil@xs4all.nl>
---
diff --git a/include/uapi/linux/cec-funcs.h b/include/uapi/linux/cec-funcs.h
index d58fa1cdcb08..189ecf0e13cd 100644
--- a/include/uapi/linux/cec-funcs.h
+++ b/include/uapi/linux/cec-funcs.h
@@ -14,7 +14,7 @@
 static inline void cec_msg_active_source(struct cec_msg *msg, __u16 phys_addr)
 {
 	msg->len = 4;
-	msg->msg[0] |= 0xf; /* broadcast */
+	msg->msg[0] |= CEC_LOG_ADDR_BROADCAST;
 	msg->msg[1] = CEC_MSG_ACTIVE_SOURCE;
 	msg->msg[2] = phys_addr >> 8;
 	msg->msg[3] = phys_addr & 0xff;
@@ -59,7 +59,7 @@ static inline void cec_msg_request_active_source(struct cec_msg *msg,
 						 int reply)
 {
 	msg->len = 2;
-	msg->msg[0] |= 0xf; /* broadcast */
+	msg->msg[0] |= CEC_LOG_ADDR_BROADCAST;
 	msg->msg[1] = CEC_MSG_REQUEST_ACTIVE_SOURCE;
 	msg->reply = reply ? CEC_MSG_ACTIVE_SOURCE : 0;
 }
@@ -68,7 +68,7 @@ static inline void cec_msg_routing_information(struct cec_msg *msg,
 					       __u16 phys_addr)
 {
 	msg->len = 4;
-	msg->msg[0] |= 0xf; /* broadcast */
+	msg->msg[0] |= CEC_LOG_ADDR_BROADCAST;
 	msg->msg[1] = CEC_MSG_ROUTING_INFORMATION;
 	msg->msg[2] = phys_addr >> 8;
 	msg->msg[3] = phys_addr & 0xff;
@@ -86,7 +86,7 @@ static inline void cec_msg_routing_change(struct cec_msg *msg,
 					  __u16 new_phys_addr)
 {
 	msg->len = 6;
-	msg->msg[0] |= 0xf; /* broadcast */
+	msg->msg[0] |= CEC_LOG_ADDR_BROADCAST;
 	msg->msg[1] = CEC_MSG_ROUTING_CHANGE;
 	msg->msg[2] = orig_phys_addr >> 8;
 	msg->msg[3] = orig_phys_addr & 0xff;
@@ -106,7 +106,7 @@ static inline void cec_ops_routing_change(const struct cec_msg *msg,
 static inline void cec_msg_set_stream_path(struct cec_msg *msg, __u16 phys_addr)
 {
 	msg->len = 4;
-	msg->msg[0] |= 0xf; /* broadcast */
+	msg->msg[0] |= CEC_LOG_ADDR_BROADCAST;
 	msg->msg[1] = CEC_MSG_SET_STREAM_PATH;
 	msg->msg[2] = phys_addr >> 8;
 	msg->msg[3] = phys_addr & 0xff;
@@ -791,7 +791,7 @@ static inline void cec_msg_report_physical_addr(struct cec_msg *msg,
 					__u16 phys_addr, __u8 prim_devtype)
 {
 	msg->len = 5;
-	msg->msg[0] |= 0xf; /* broadcast */
+	msg->msg[0] |= CEC_LOG_ADDR_BROADCAST;
 	msg->msg[1] = CEC_MSG_REPORT_PHYSICAL_ADDR;
 	msg->msg[2] = phys_addr >> 8;
 	msg->msg[3] = phys_addr & 0xff;
@@ -817,7 +817,7 @@ static inline void cec_msg_set_menu_language(struct cec_msg *msg,
 					     const char *language)
 {
 	msg->len = 5;
-	msg->msg[0] |= 0xf; /* broadcast */
+	msg->msg[0] |= CEC_LOG_ADDR_BROADCAST;
 	msg->msg[1] = CEC_MSG_SET_MENU_LANGUAGE;
 	memcpy(msg->msg + 2, language, 3);
 }
@@ -850,7 +850,7 @@ static inline void cec_msg_report_features(struct cec_msg *msg,
 				__u8 rc_profile, __u8 dev_features)
 {
 	msg->len = 6;
-	msg->msg[0] |= 0xf; /* broadcast */
+	msg->msg[0] |= CEC_LOG_ADDR_BROADCAST;
 	msg->msg[1] = CEC_MSG_REPORT_FEATURES;
 	msg->msg[2] = cec_version;
 	msg->msg[3] = all_device_types;
@@ -1092,7 +1092,7 @@ static inline void cec_msg_tuner_step_increment(struct cec_msg *msg)
 static inline void cec_msg_device_vendor_id(struct cec_msg *msg, __u32 vendor_id)
 {
 	msg->len = 5;
-	msg->msg[0] |= 0xf; /* broadcast */
+	msg->msg[0] |= CEC_LOG_ADDR_BROADCAST;
 	msg->msg[1] = CEC_MSG_DEVICE_VENDOR_ID;
 	msg->msg[2] = vendor_id >> 16;
 	msg->msg[3] = (vendor_id >> 8) & 0xff;
@@ -1655,7 +1655,7 @@ static inline void cec_msg_report_current_latency(struct cec_msg *msg,
 						  __u8 audio_out_delay)
 {
 	msg->len = 6;
-	msg->msg[0] |= 0xf; /* broadcast */
+	msg->msg[0] |= CEC_LOG_ADDR_BROADCAST;
 	msg->msg[1] = CEC_MSG_REPORT_CURRENT_LATENCY;
 	msg->msg[2] = phys_addr >> 8;
 	msg->msg[3] = phys_addr & 0xff;
@@ -1687,7 +1687,7 @@ static inline void cec_msg_request_current_latency(struct cec_msg *msg,
 						   __u16 phys_addr)
 {
 	msg->len = 4;
-	msg->msg[0] |= 0xf; /* broadcast */
+	msg->msg[0] |= CEC_LOG_ADDR_BROADCAST;
 	msg->msg[1] = CEC_MSG_REQUEST_CURRENT_LATENCY;
 	msg->msg[2] = phys_addr >> 8;
 	msg->msg[3] = phys_addr & 0xff;
@@ -1707,7 +1707,7 @@ static inline void cec_msg_cdc_hec_inquire_state(struct cec_msg *msg,
 						 __u16 phys_addr2)
 {
 	msg->len = 9;
-	msg->msg[0] |= 0xf; /* broadcast */
+	msg->msg[0] |= CEC_LOG_ADDR_BROADCAST;
 	msg->msg[1] = CEC_MSG_CDC_MESSAGE;
 	/* msg[2] and msg[3] (phys_addr) are filled in by the CEC framework */
 	msg->msg[4] = CEC_MSG_CDC_HEC_INQUIRE_STATE;
@@ -1737,7 +1737,7 @@ static inline void cec_msg_cdc_hec_report_state(struct cec_msg *msg,
 						__u16 hec_field)
 {
 	msg->len = has_field ? 10 : 8;
-	msg->msg[0] |= 0xf; /* broadcast */
+	msg->msg[0] |= CEC_LOG_ADDR_BROADCAST;
 	msg->msg[1] = CEC_MSG_CDC_MESSAGE;
 	/* msg[2] and msg[3] (phys_addr) are filled in by the CEC framework */
 	msg->msg[4] = CEC_MSG_CDC_HEC_REPORT_STATE;
@@ -1782,7 +1782,7 @@ static inline void cec_msg_cdc_hec_set_state(struct cec_msg *msg,
 					     __u16 phys_addr5)
 {
 	msg->len = 10;
-	msg->msg[0] |= 0xf; /* broadcast */
+	msg->msg[0] |= CEC_LOG_ADDR_BROADCAST;
 	msg->msg[1] = CEC_MSG_CDC_MESSAGE;
 	/* msg[2] and msg[3] (phys_addr) are filled in by the CEC framework */
 	msg->msg[4] = CEC_MSG_CDC_HEC_INQUIRE_STATE;
@@ -1832,7 +1832,7 @@ static inline void cec_msg_cdc_hec_set_state_adjacent(struct cec_msg *msg,
 						      __u8 hec_set_state)
 {
 	msg->len = 8;
-	msg->msg[0] |= 0xf; /* broadcast */
+	msg->msg[0] |= CEC_LOG_ADDR_BROADCAST;
 	msg->msg[1] = CEC_MSG_CDC_MESSAGE;
 	/* msg[2] and msg[3] (phys_addr) are filled in by the CEC framework */
 	msg->msg[4] = CEC_MSG_CDC_HEC_SET_STATE_ADJACENT;
@@ -1857,7 +1857,7 @@ static inline void cec_msg_cdc_hec_request_deactivation(struct cec_msg *msg,
 							__u16 phys_addr3)
 {
 	msg->len = 11;
-	msg->msg[0] |= 0xf; /* broadcast */
+	msg->msg[0] |= CEC_LOG_ADDR_BROADCAST;
 	msg->msg[1] = CEC_MSG_CDC_MESSAGE;
 	/* msg[2] and msg[3] (phys_addr) are filled in by the CEC framework */
 	msg->msg[4] = CEC_MSG_CDC_HEC_REQUEST_DEACTIVATION;
@@ -1884,7 +1884,7 @@ static inline void cec_ops_cdc_hec_request_deactivation(const struct cec_msg *ms
 static inline void cec_msg_cdc_hec_notify_alive(struct cec_msg *msg)
 {
 	msg->len = 5;
-	msg->msg[0] |= 0xf; /* broadcast */
+	msg->msg[0] |= CEC_LOG_ADDR_BROADCAST;
 	msg->msg[1] = CEC_MSG_CDC_MESSAGE;
 	/* msg[2] and msg[3] (phys_addr) are filled in by the CEC framework */
 	msg->msg[4] = CEC_MSG_CDC_HEC_NOTIFY_ALIVE;
@@ -1899,7 +1899,7 @@ static inline void cec_ops_cdc_hec_notify_alive(const struct cec_msg *msg,
 static inline void cec_msg_cdc_hec_discover(struct cec_msg *msg)
 {
 	msg->len = 5;
-	msg->msg[0] |= 0xf; /* broadcast */
+	msg->msg[0] |= CEC_LOG_ADDR_BROADCAST;
 	msg->msg[1] = CEC_MSG_CDC_MESSAGE;
 	/* msg[2] and msg[3] (phys_addr) are filled in by the CEC framework */
 	msg->msg[4] = CEC_MSG_CDC_HEC_DISCOVER;
@@ -1916,7 +1916,7 @@ static inline void cec_msg_cdc_hpd_set_state(struct cec_msg *msg,
 					     __u8 hpd_state)
 {
 	msg->len = 6;
-	msg->msg[0] |= 0xf; /* broadcast */
+	msg->msg[0] |= CEC_LOG_ADDR_BROADCAST;
 	msg->msg[1] = CEC_MSG_CDC_MESSAGE;
 	/* msg[2] and msg[3] (phys_addr) are filled in by the CEC framework */
 	msg->msg[4] = CEC_MSG_CDC_HPD_SET_STATE;
@@ -1938,7 +1938,7 @@ static inline void cec_msg_cdc_hpd_report_state(struct cec_msg *msg,
 						__u8 hpd_error)
 {
 	msg->len = 6;
-	msg->msg[0] |= 0xf; /* broadcast */
+	msg->msg[0] |= CEC_LOG_ADDR_BROADCAST;
 	msg->msg[1] = CEC_MSG_CDC_MESSAGE;
 	/* msg[2] and msg[3] (phys_addr) are filled in by the CEC framework */
 	msg->msg[4] = CEC_MSG_CDC_HPD_REPORT_STATE;

