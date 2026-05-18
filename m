Return-Path: <linux-media+bounces-62010-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eIH2AC8oC2pAEAUAu9opvQ
	(envelope-from <linux-media+bounces-62010-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 16:54:39 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 72F7556F4D9
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 16:54:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5B9B53048F36
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 14:42:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AF163F44C6;
	Mon, 18 May 2026 14:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LqlpsSK8"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACBAE3EC2E0
	for <linux-media@vger.kernel.org>; Mon, 18 May 2026 14:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779115327; cv=none; b=oLyRw19q7S9aGgQihuK2SZURKKgHjSXE3zcYFt4fxGe7xaUaKe4PqscnR7hfQPN0MiTZ/53/2tqtgwpnRa/teVgM1+m3BCzWrHVq4p74kVpn8tColeb9NUGwRChn6a/tf90J420QN0pu+07yPF6MROwJXEepXkFkNCYKT4MwcD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779115327; c=relaxed/simple;
	bh=H32avlhmR9Yl5KIOFY/XV3xDiraKDpKkMLgOFhtDeyU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GOENK08tpO7JCow5dHYwQfUfXd8zXIQ8GgvUghvRbsYgRlShTtyBDq3Wc7dE9U+FTYckBwRiAc7YwH/So/ClOZfz/N9YPwe5yR53J3OMDskUUwvU/6IZJIA59Vv+eGftiqC57rs6+x7FHA6V5m+faMgopXJ34vYAYqNrXYJL1sA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LqlpsSK8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1F96C2BCB8;
	Mon, 18 May 2026 14:42:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779115327;
	bh=H32avlhmR9Yl5KIOFY/XV3xDiraKDpKkMLgOFhtDeyU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LqlpsSK8AtIQPHRtYqboW6w1l+qacyyWDJCWR25J+0TMbEUJhrM0HtdYUTzlDKxkR
	 iJWupRF0aq6nXTm1Upmln9JGdUousAhquG9vI/65RNOEhVAIKoZ9VkgSxx3Mdgl0jK
	 Wa/I2BT4LCGV36+azNgVzKsLyvVxiVo71t/f30CBV52JVyj9D8E/X5/mrj/ruGNrQj
	 Qf7RpcW3FJs82NL7mt0y3RlmDDgn0Op7OgYfbB1eAkBO6dB6RKctkyRPpRebSO6zpJ
	 PE3qKfBzIVjQKntl3z6a7X65kps4GjfyHf4J0SbdyRY4gBmHJe6kHyD1ElyQdDt5ZH
	 T4aiDmmR6qtVw==
From: Hans Verkuil <hverkuil+cisco@kernel.org>
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: [PATCHv2 1/4] media: include/uapi/linux/cec*.h: add CEC LIP support
Date: Mon, 18 May 2026 16:40:32 +0200
Message-ID: <8dac7c99b7eab4fcc11d76d50dd08fb4448672f4.1779115235.git.hverkuil+cisco@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1779115235.git.hverkuil+cisco@kernel.org>
References: <cover.1779115235.git.hverkuil+cisco@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-62010-lists,linux-media=lfdr.de,cisco];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hverkuil@kernel.org,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 72F7556F4D9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add support for the new Latency Indication Protocol feature.

This adds the opcodes and the wrapper functions.

Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
---
 include/uapi/linux/cec-funcs.h | 182 +++++++++++++++++++++++++++++++++
 include/uapi/linux/cec.h       |  24 +++++
 2 files changed, 206 insertions(+)

diff --git a/include/uapi/linux/cec-funcs.h b/include/uapi/linux/cec-funcs.h
index 189ecf0e13cd..ba4b47de9bf0 100644
--- a/include/uapi/linux/cec-funcs.h
+++ b/include/uapi/linux/cec-funcs.h
@@ -1701,6 +1701,188 @@ static inline void cec_ops_request_current_latency(const struct cec_msg *msg,
 }
 
 
+/* Latency Indication Protocol Feature */
+/* Only for CEC 2.0 and up */
+static inline void cec_msg_request_lip_support(struct cec_msg *msg,
+					       int reply, __u16 phys_addr)
+{
+	msg->len = 4;
+	msg->msg[1] = CEC_MSG_REQUEST_LIP_SUPPORT;
+	msg->msg[2] = phys_addr >> 8;
+	msg->msg[3] = phys_addr & 0xff;
+	msg->reply = reply ? CEC_MSG_REPORT_LIP_SUPPORT : 0;
+}
+
+static inline void cec_ops_request_lip_support(const struct cec_msg *msg,
+					       __u16 *phys_addr)
+{
+	*phys_addr = (msg->msg[2] << 8) | msg->msg[3];
+}
+
+static inline void cec_msg_report_lip_support(struct cec_msg *msg, __u32 sqid)
+{
+	msg->len = 6;
+	msg->msg[1] = CEC_MSG_REPORT_LIP_SUPPORT;
+	msg->msg[2] = sqid >> 24;
+	msg->msg[3] = (sqid >> 16) & 0xff;
+	msg->msg[4] = (sqid >> 8) & 0xff;
+	msg->msg[5] = sqid & 0xff;
+}
+
+static inline void cec_ops_report_lip_support(const struct cec_msg *msg,
+					      __u32 *sqid)
+{
+	*sqid = (msg->msg[2] << 24) | (msg->msg[3] << 16) |
+		(msg->msg[4] << 8) | msg->msg[5];
+}
+
+static inline void cec_msg_request_audio_and_video_latency(struct cec_msg *msg,
+					       int reply, __u8 video_format,
+					       __u8 hdr_format, __u8 vrr_format,
+					       __u8 audio_format,
+					       __u8 audio_format_extension)
+{
+	msg->len = 6;
+	msg->msg[1] = CEC_MSG_REQUEST_AUDIO_AND_VIDEO_LATENCY;
+	msg->msg[2] = video_format;
+	msg->msg[3] = hdr_format;
+	msg->msg[4] = vrr_format;
+	msg->msg[5] = audio_format;
+	if (audio_format >= 1 && audio_format <= 31) {
+		msg->msg[6] = audio_format_extension;
+		msg->len++;
+	}
+	msg->reply = reply ? CEC_MSG_REPORT_AUDIO_AND_VIDEO_LATENCY : 0;
+}
+
+static inline void cec_ops_request_audio_and_video_latency(const struct cec_msg *msg,
+					       __u8 *video_format,
+					       __u8 *hdr_format,
+					       __u8 *vrr_format,
+					       __u8 *audio_format,
+					       __u8 *audio_format_extension)
+{
+	*video_format = msg->msg[2];
+	*hdr_format = msg->msg[3];
+	*vrr_format = msg->msg[4];
+	*audio_format = msg->msg[5];
+	*audio_format_extension = msg->len > 6 ? msg->msg[6] : 0;
+}
+
+static inline void cec_msg_report_audio_and_video_latency(struct cec_msg *msg,
+							  __u16 video_latency,
+							  __u16 audio_latency)
+{
+	msg->len = 6;
+	msg->msg[1] = CEC_MSG_REPORT_AUDIO_AND_VIDEO_LATENCY;
+	msg->msg[2] = video_latency >> 8;
+	msg->msg[3] = video_latency & 0xff;
+	msg->msg[4] = audio_latency >> 8;
+	msg->msg[5] = audio_latency & 0xff;
+}
+
+static inline void cec_ops_report_audio_and_video_latency(const struct cec_msg *msg,
+					      __u16 *video_latency,
+					      __u16 *audio_latency)
+{
+	*video_latency = (msg->msg[2] << 8) | msg->msg[3];
+	*audio_latency = (msg->msg[4] << 8) | msg->msg[5];
+}
+
+static inline void cec_msg_request_audio_latency(struct cec_msg *msg,
+						 int reply,
+						 __u8 audio_format,
+						 __u8 audio_format_extension)
+{
+	msg->len = 3;
+	msg->msg[1] = CEC_MSG_REQUEST_AUDIO_LATENCY;
+	msg->msg[2] = audio_format;
+	if (audio_format >= 1 && audio_format <= 31) {
+		msg->msg[3] = audio_format_extension;
+		msg->len++;
+	}
+	msg->reply = reply ? CEC_MSG_REPORT_AUDIO_LATENCY : 0;
+}
+
+static inline void cec_ops_request_audio_latency(const struct cec_msg *msg,
+						 __u8 *audio_format,
+						 __u8 *audio_format_extension)
+{
+	*audio_format = msg->msg[2];
+	*audio_format_extension = msg->len > 3 ? msg->msg[3] : 0;
+}
+
+static inline void cec_msg_report_audio_latency(struct cec_msg *msg,
+						__u16 audio_latency)
+{
+	msg->len = 4;
+	msg->msg[1] = CEC_MSG_REPORT_AUDIO_LATENCY;
+	msg->msg[2] = audio_latency >> 8;
+	msg->msg[3] = audio_latency & 0xff;
+}
+
+static inline void cec_ops_report_audio_latency(const struct cec_msg *msg,
+						__u16 *audio_latency)
+{
+	*audio_latency = (msg->msg[2] << 8) | msg->msg[3];
+}
+
+static inline void cec_msg_request_video_latency(struct cec_msg *msg,
+						 int reply, __u8 video_format,
+						 __u8 hdr_format,
+						 __u8 vrr_format)
+{
+	msg->len = 5;
+	msg->msg[1] = CEC_MSG_REQUEST_VIDEO_LATENCY;
+	msg->msg[2] = video_format;
+	msg->msg[3] = hdr_format;
+	msg->msg[4] = vrr_format;
+	msg->reply = reply ? CEC_MSG_REPORT_VIDEO_LATENCY : 0;
+}
+
+static inline void cec_ops_request_video_latency(const struct cec_msg *msg,
+						 __u8 *video_format,
+						 __u8 *hdr_format,
+						 __u8 *vrr_format)
+{
+	*video_format = msg->msg[2];
+	*hdr_format = msg->msg[3];
+	*vrr_format = msg->msg[4];
+}
+
+static inline void cec_msg_report_video_latency(struct cec_msg *msg,
+						__u16 video_latency)
+{
+	msg->len = 4;
+	msg->msg[1] = CEC_MSG_REPORT_VIDEO_LATENCY;
+	msg->msg[2] = video_latency >> 8;
+	msg->msg[3] = video_latency & 0xff;
+}
+
+static inline void cec_ops_report_video_latency(const struct cec_msg *msg,
+						__u16 *video_latency)
+{
+	*video_latency = (msg->msg[2] << 8) | msg->msg[3];
+}
+
+static inline void cec_msg_update_sqid(struct cec_msg *msg, __u32 sqid)
+{
+	msg->len = 6;
+	msg->msg[1] = CEC_MSG_UPDATE_SQID;
+	msg->msg[2] = sqid >> 24;
+	msg->msg[3] = (sqid >> 16) & 0xff;
+	msg->msg[4] = (sqid >> 8) & 0xff;
+	msg->msg[5] = sqid & 0xff;
+}
+
+static inline void cec_ops_update_sqid(const struct cec_msg *msg,
+				       __u32 *sqid)
+{
+	*sqid = (msg->msg[2] << 24) | (msg->msg[3] << 16) |
+		(msg->msg[4] << 8) | msg->msg[5];
+}
+
+
 /* Capability Discovery and Control Feature */
 static inline void cec_msg_cdc_hec_inquire_state(struct cec_msg *msg,
 						 __u16 phys_addr1,
diff --git a/include/uapi/linux/cec.h b/include/uapi/linux/cec.h
index b2af1dddd4d7..75bc9e4e0350 100644
--- a/include/uapi/linux/cec.h
+++ b/include/uapi/linux/cec.h
@@ -1104,6 +1104,30 @@ struct cec_event {
 #define CEC_OP_AUD_OUT_COMPENSATED_PARTIAL_DELAY	3
 
 
+/* Latency Indication Protocol Feature */
+#define CEC_MSG_REQUEST_LIP_SUPPORT			0x50
+#define CEC_MSG_REPORT_LIP_SUPPORT			0x51
+#define CEC_MSG_REQUEST_AUDIO_AND_VIDEO_LATENCY		0x52
+/* HDR Format Operand (hdr_format) */
+#define CEC_OP_HDR_FORMAT_GAMMA_SDR			0
+#define CEC_OP_HDR_FORMAT_GAMMA_HDR			1
+#define CEC_OP_HDR_FORMAT_PQ				2
+#define CEC_OP_HDR_FORMAT_HLG				3
+#define CEC_OP_HDR_FORMAT_DYNAMIC_HDR_TYPE_1		8
+#define CEC_OP_HDR_FORMAT_DYNAMIC_HDR_TYPE_2		9
+#define CEC_OP_HDR_FORMAT_DYNAMIC_HDR_TYPE_4		11
+#define CEC_OP_HDR_FORMAT_DV_SINK_LED			16
+#define CEC_OP_HDR_FORMAT_DV_SOURCE_LED			17
+#define CEC_OP_HDR_FORMAT_HDR10PLUS			24
+#define CEC_OP_HDR_FORMAT_ETSI_TS_103_433		32
+#define CEC_MSG_REPORT_AUDIO_AND_VIDEO_LATENCY		0x53
+#define CEC_MSG_REQUEST_AUDIO_LATENCY			0x54
+#define CEC_MSG_REPORT_AUDIO_LATENCY			0x55
+#define CEC_MSG_REQUEST_VIDEO_LATENCY			0x56
+#define CEC_MSG_REPORT_VIDEO_LATENCY			0x57
+#define CEC_MSG_UPDATE_SQID				0x58
+
+
 /* Capability Discovery and Control Feature */
 #define CEC_MSG_CDC_MESSAGE				0xf8
 /* Ethernet-over-HDMI: nobody ever does this... */
-- 
2.53.0


