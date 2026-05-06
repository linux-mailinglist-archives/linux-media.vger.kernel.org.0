Return-Path: <linux-media+bounces-60603-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SGoxOudD+2lPYgMAu9opvQ
	(envelope-from <linux-media+bounces-60603-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 15:36:39 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FE334DB0FC
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 15:36:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1CAD1300E725
	for <lists+linux-media@lfdr.de>; Wed,  6 May 2026 13:36:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDD593EE1DD;
	Wed,  6 May 2026 13:36:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="s4S7S6DX"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DB7430F927
	for <linux-media@vger.kernel.org>; Wed,  6 May 2026 13:36:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778074561; cv=none; b=ZGaVJg3mG+kzt0rql9l8nXetBk4G8lBWD8mqPOb8tSBvFiVqXDM76SkXNCDMV2w4MZorGBvQa/ThRMBZ3Rs/TAN10bLj0n6wGltbESKIRu08bt7UGOPk4sIP7SS6ePpABfrmOKfHSD6xqj5v619ebGAI9FvhYl2MRSo7oxqwLSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778074561; c=relaxed/simple;
	bh=UKnBepza+YMYP5qR/OuATziXiLQfIajC7/HQkl44c8I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JQDlAKyCi3+NrnEQBJAiWoQHCwWtz9yN3EgCto9MzUugS2EjCybDtAEowIU55Av4Uq5U1IrAycv+xjb8Pj+KT7VPgtMQ6EhUPrzTmCtEXdjZ2gD14uvcndiOcWyJJKtV7oX2Y9JIZAfXTplZUbHwLWtN9g8hUtJn+6eapz8xSEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=s4S7S6DX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD99CC2BCC9;
	Wed,  6 May 2026 13:35:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778074560;
	bh=UKnBepza+YMYP5qR/OuATziXiLQfIajC7/HQkl44c8I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=s4S7S6DXA/XTg2ZSQpel85fDh8ZMihECvCceqzp8/vv9iYoB23u3Eg1E+fU3MtDwl
	 ZGy+pNUpbGumYHFp2oyWX4kTKRjuA4DA/0jsHgcxUvxz3C9X9noCX/JdFsKkGuQ5DP
	 dbPmeWC4w8pzb8V3vbF7+OZvAzvyPuIR7GD3qrxFYbgpljjvq+/25ejLaTk8fwSyFh
	 AORxsskb2pwIM2VX6Ck3h6RUGdzfJFa6oHjnczMLe9hWMCIMYb3jWX35QVR+ByUvWk
	 CJQzTvdVMeFWvMJGLChHrt8rt+sYl5Dte/3l3WBNUkB2qGh2P3uibxZhrtM+PfsUfG
	 /tsZHt+3wmhLg==
From: Hans Verkuil <hverkuil+cisco@kernel.org>
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: [PATCH 1/4] include/uapi/linux/cec*.h: add CEC LIP support
Date: Wed,  6 May 2026 15:34:05 +0200
Message-ID: <051117b6d1237695e44967e510ba9994d057065e.1778074448.git.hverkuil+cisco@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1778074448.git.hverkuil+cisco@kernel.org>
References: <cover.1778074448.git.hverkuil+cisco@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 3FE334DB0FC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60603-lists,linux-media=lfdr.de,cisco];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hverkuil@kernel.org,linux-media@vger.kernel.org];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

Add support for the new Latency Indication Protocol feature.

This adds the opcodes and the wrapper functions.

Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
---
 include/uapi/linux/cec-funcs.h | 182 +++++++++++++++++++++++++++++++++
 include/uapi/linux/cec.h       |  24 +++++
 2 files changed, 206 insertions(+)

diff --git a/include/uapi/linux/cec-funcs.h b/include/uapi/linux/cec-funcs.h
index 189ecf0e13cd..416ecc819799 100644
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
+					      __u16 * audio_latency)
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


