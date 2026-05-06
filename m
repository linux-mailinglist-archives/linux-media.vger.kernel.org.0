Return-Path: <linux-media+bounces-60606-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8EtZKQRE+2lPYgMAu9opvQ
	(envelope-from <linux-media+bounces-60606-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 15:37:08 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B7E94DB122
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 15:37:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D74EF301B70F
	for <lists+linux-media@lfdr.de>; Wed,  6 May 2026 13:36:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38B4134FF4F;
	Wed,  6 May 2026 13:36:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Lrw3KtKz"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A305D30BBAE
	for <linux-media@vger.kernel.org>; Wed,  6 May 2026 13:36:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778074565; cv=none; b=Ys6dOfzW1EQiZZ2hXW2Nc8a3lz065gOiqDFvoO1AgS3ADEP2zXZi2CfbeNCLCF+oawq1stuaZloDdw89gHnuWVtUmfu00X9UM0MwMJGmqarcX3t/K1BcDmiL+HvXEvA3s5HbkFJHcsW4xRItFBtWA3gAuXKtPRllPLdkfkF3BI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778074565; c=relaxed/simple;
	bh=dwX8hqYPZLUMgxOxhufWFEMrEwq6t5n+J+cj39hBH8Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GVh+O/7Z3nTTMbEWHevq1sX1KIb7W15eGYdFBvFouRaFvrrOrC2+SGn/8N/oFgXYDMxMZrzFz8TiZRMR8WxUrbUPbUV8yJ0sHZftBPDZNCUCVdpIBn47OMeuFiKINs9WpO8nzQOd1vVS1G+5FPUa7J8PEX08lJ2wR1WW+vtROdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Lrw3KtKz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E6B1C2BCB8;
	Wed,  6 May 2026 13:36:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778074565;
	bh=dwX8hqYPZLUMgxOxhufWFEMrEwq6t5n+J+cj39hBH8Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Lrw3KtKzEexX7T2PSd9Td3qaQWjuEVsHQIg5q5wiud5MBVnyF8bQvlMgsdipcCFiC
	 hRHO+vEZ4fKG2NN71wKgHkriqAnHzPMCIRN5IXfJBJWx8AYXLzaHznfU0/15X+nUu+
	 n5qGslTNDwAk5jICLXb/UPFL2dhSYDnh8IJfnxS9T7K+1ETC6SwJ2qwFuAa8Vb4oWV
	 cU1j7nikgJRHkf/w7x6FOaK69o0iAtkbSES/eOVYaTWNY/dC46aO1/5loR3pNKpxDO
	 gK2nzwic+UgzJSVLHmLt0SLuDi00hqcQLRX8w0CrKbTBq117dSIf82+76WhfX5DzqU
	 gwqMC7Ojvn6Vg==
From: Hans Verkuil <hverkuil+cisco@kernel.org>
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: [PATCH 4/4] include/uapi/linux/cec*: clarify which msgs are CEC 2.0
Date: Wed,  6 May 2026 15:34:08 +0200
Message-ID: <df37d46c4fbd410707d2a390681ea3e494569411.1778074448.git.hverkuil+cisco@kernel.org>
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
X-Rspamd-Queue-Id: 2B7E94DB122
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60606-lists,linux-media=lfdr.de,cisco];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

Drop comments about CEC 2.0 from cec-funcs.h.

In cec.h clearly comment messages that are CEC 2.0 specific
as such. Also rename references to HDMI 2.0 to CEC 2.0.

The <Request/Report Current Latency> messages were marked
as CEC 2.0 only. That is wrong, these messages are explicitly
allowed for any CEC version.

Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
---
 include/uapi/linux/cec.h | 25 ++++++++++++-------------
 1 file changed, 12 insertions(+), 13 deletions(-)

diff --git a/include/uapi/linux/cec.h b/include/uapi/linux/cec.h
index 75bc9e4e0350..81a05c9c0706 100644
--- a/include/uapi/linux/cec.h
+++ b/include/uapi/linux/cec.h
@@ -742,7 +742,7 @@ struct cec_event {
 #define CEC_OP_PRIM_DEVTYPE_PROCESSOR			7
 
 #define CEC_MSG_SET_MENU_LANGUAGE			0x32
-#define CEC_MSG_REPORT_FEATURES				0xa6	/* HDMI 2.0 */
+#define CEC_MSG_REPORT_FEATURES				0xa6	/* CEC 2.0 */
 /* All Device Types Operand (all_device_types) */
 #define CEC_OP_ALL_DEVTYPE_TV				0x80
 #define CEC_OP_ALL_DEVTYPE_RECORD			0x40
@@ -777,7 +777,7 @@ struct cec_event {
 #define CEC_OP_FEAT_DEV_SOURCE_HAS_ARC_RX		0x02
 #define CEC_OP_FEAT_DEV_HAS_SET_AUDIO_VOLUME_LEVEL	0x01
 
-#define CEC_MSG_GIVE_FEATURES				0xa5	/* HDMI 2.0 */
+#define CEC_MSG_GIVE_FEATURES				0xa5	/* CEC 2.0 */
 
 
 /* Deck Control Feature */
@@ -1067,7 +1067,7 @@ struct cec_event {
 #define CEC_OP_AUD_FMT_ID_CEA861			0
 #define CEC_OP_AUD_FMT_ID_CEA861_CXT			1
 
-#define CEC_MSG_SET_AUDIO_VOLUME_LEVEL			0x73
+#define CEC_MSG_SET_AUDIO_VOLUME_LEVEL			0x73	/* CEC 2.0 */
 
 /* Audio Rate Control Feature */
 #define CEC_MSG_SET_AUDIO_RATE				0x9a
@@ -1091,7 +1091,6 @@ struct cec_event {
 
 
 /* Dynamic Audio Lipsync Feature */
-/* Only for CEC 2.0 and up */
 #define CEC_MSG_REQUEST_CURRENT_LATENCY			0xa7
 #define CEC_MSG_REPORT_CURRENT_LATENCY			0xa8
 /* Low Latency Mode Operand (low_latency_mode) */
@@ -1105,9 +1104,9 @@ struct cec_event {
 
 
 /* Latency Indication Protocol Feature */
-#define CEC_MSG_REQUEST_LIP_SUPPORT			0x50
-#define CEC_MSG_REPORT_LIP_SUPPORT			0x51
-#define CEC_MSG_REQUEST_AUDIO_AND_VIDEO_LATENCY		0x52
+#define CEC_MSG_REQUEST_LIP_SUPPORT			0x50	/* CEC 2.0 */
+#define CEC_MSG_REPORT_LIP_SUPPORT			0x51	/* CEC 2.0 */
+#define CEC_MSG_REQUEST_AUDIO_AND_VIDEO_LATENCY		0x52	/* CEC 2.0 */
 /* HDR Format Operand (hdr_format) */
 #define CEC_OP_HDR_FORMAT_GAMMA_SDR			0
 #define CEC_OP_HDR_FORMAT_GAMMA_HDR			1
@@ -1120,12 +1119,12 @@ struct cec_event {
 #define CEC_OP_HDR_FORMAT_DV_SOURCE_LED			17
 #define CEC_OP_HDR_FORMAT_HDR10PLUS			24
 #define CEC_OP_HDR_FORMAT_ETSI_TS_103_433		32
-#define CEC_MSG_REPORT_AUDIO_AND_VIDEO_LATENCY		0x53
-#define CEC_MSG_REQUEST_AUDIO_LATENCY			0x54
-#define CEC_MSG_REPORT_AUDIO_LATENCY			0x55
-#define CEC_MSG_REQUEST_VIDEO_LATENCY			0x56
-#define CEC_MSG_REPORT_VIDEO_LATENCY			0x57
-#define CEC_MSG_UPDATE_SQID				0x58
+#define CEC_MSG_REPORT_AUDIO_AND_VIDEO_LATENCY		0x53	/* CEC 2.0 */
+#define CEC_MSG_REQUEST_AUDIO_LATENCY			0x54	/* CEC 2.0 */
+#define CEC_MSG_REPORT_AUDIO_LATENCY			0x55	/* CEC 2.0 */
+#define CEC_MSG_REQUEST_VIDEO_LATENCY			0x56	/* CEC 2.0 */
+#define CEC_MSG_REPORT_VIDEO_LATENCY			0x57	/* CEC 2.0 */
+#define CEC_MSG_UPDATE_SQID				0x58	/* CEC 2.0 */
 
 
 /* Capability Discovery and Control Feature */
-- 
2.53.0


