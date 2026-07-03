Return-Path: <linux-media+bounces-66511-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id fMw/CjDbR2qBgQAAu9opvQ
	(envelope-from <linux-media+bounces-66511-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 03 Jul 2026 17:54:24 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 2431D7040C0
	for <lists+linux-media@lfdr.de>; Fri, 03 Jul 2026 17:54:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b="h/XCNnBG";
	dmarc=pass (policy=none) header.from=linaro.org;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66511-lists+linux-media=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-media+bounces-66511-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C46C03012DAE
	for <lists+linux-media@lfdr.de>; Fri,  3 Jul 2026 15:52:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F8EF2F616B;
	Fri,  3 Jul 2026 15:52:01 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD77F2DB7B4
	for <linux-media@vger.kernel.org>; Fri,  3 Jul 2026 15:51:55 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783093920; cv=none; b=Sj+ojsO6TFfR6IOEfvnrmdGkyAF2ZFKu1vu7P11PyeF7AOazyjA0knboDlg+ZPwEjO3Gn34SF0APkcKOYE/u+GrflLBVaWY4kVefniOVTW4hkiSSd4Ya4dc6Xkk4dwKMIvJYmfSYS36v7cqnHq8TtM3Gru5KQhF1/isCvj3ZYiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783093920; c=relaxed/simple;
	bh=krUtcrmj7GksaUPry5Af/PoWk1CLf55HCOVfRCFI14g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=g0c23rU2syscYK2u1AlMMQm4ghewAaEj6T+sbv/dfoZlL7hO+RtLW1mcsPyJnTgJnIXQFVgFGTOgScszX0wuI6wabURuwmCEkKVSmfJkoMht81qS6wMMygPaRWVXjS7j1QLRLKBsyetjKsr2Xm7KnX+9vlhuWAqH416XRfvRwV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=h/XCNnBG; arc=none smtp.client-ip=209.85.128.42
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-493c733f15aso6488945e9.0
        for <linux-media@vger.kernel.org>; Fri, 03 Jul 2026 08:51:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783093914; x=1783698714; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jaHNyg0pfIV0G21oSqq4pYgZBqq1jeQXTMN+2gVxafM=;
        b=h/XCNnBGryHH6c6onMjWUGWa4ZFJQy4ru5GrguAsSRov1E2Df67YpN/w89L6mebehp
         jHUFxnhI8lvkbqHdY6Q9aQcgT5rR6XstUEEO55CcJJkDzzPjnVYEpAqjgwy8LqtQl2Ez
         UVKk+c4+xEds8+9oivfLXvVJD+47ecdQ8jaNpslpWeg523maFOjhlKj7ffKgvPXdBTi7
         nS+gc6bC3jqiRsnyCtYgsKc1A/27CyH+sVPV+Pwe9xplZA0qBXkp5imqxIXk4G2pOj/T
         mI3NbklFTJb/4GXkTD5807C/DBC7y1mWSr6pawUnMLejtZG8HzpWOToy8nfeGvxSoVLc
         N6UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783093914; x=1783698714;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jaHNyg0pfIV0G21oSqq4pYgZBqq1jeQXTMN+2gVxafM=;
        b=fBCN6WSLKC56f5OCFNs7n1SRoYuRjzSAzUX6EzI/8dvhcT5LLFg3oPdD9/XiQIVKph
         BkDD84MpMvJjCbOSWMNnftCoWbIEIzwl9IayG2aCabddyGMrP4Q1KBTir6d5hfEmQ9hy
         Bklj0YNHQ7TNHfDyHIHpoXPctITAU3shHemBDDZATpG1kkTd/D+LwbsZ4A20H0zNqaA2
         mpH0t8ErJTEcn0KuN4da0tDmNh+EgHnH4yo/OCQjU5KuxQgonIyS6qS5yEZEUxQ69ChF
         DYFf+sOPdOc+Jv8o5NbKe0vIUUF52K1lKLccyIxmMZPv2EnLQ1BBo9NjuD2voxFotm6W
         yNgQ==
X-Forwarded-Encrypted: i=1; AFNElJ+iDd0+E+J8ob8nOTMkYLXcKD8XYHxw8jkINfbn6Ygsu4GZEXh6I1FxBYV0Wv5WiE4G7bKU81SG4kKPiQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxfxUdolHk75BZbRlU2yhrLXOFXYviLQN4T5jzDxJLzi3lGHXgM
	i61jYBbcV5oKD/+d7tZoBFD/M3HIYZWqResU1BPD2hC6XdhIursvs5OvbicnTcwC41w=
X-Gm-Gg: AfdE7ckXOEcl5UZqJa5ewFMBkZq+D0MwSc9x/dr4dy2fukbzDrK2vLKBNViIIE/CBfF
	qBWehmRNX/fYtGPyE2CC+jSUejHTwhQmW/CfBl9fCxNTu4FgDUpEqhOicevMRWAJ6idLCpT60E5
	+OTEvnO3rD6VWYMm4VHt9tGkkI5o7l4wNUYps581Zsord1RyzqTR+Ig71o7RER+8+ZEJ6LY3PCU
	DYDU3sdWr+MRwtdxBY8QCaSKV2/yahfkAaQkRI8Xef+lTjbBQDGIx4Fv+fzUpNIJhNUC5NRq4rw
	/Nwq9f3qOss3P4C4wkT9UG9XLt4PCx8qz6zMQ03px2BoQhvDGtaSvUHfCsxgQ82424Wwfg6JgPQ
	vys35fS7rqejnCafh8CrdehzRy485c64OgH9BaJevpA4uS/O/TOBdHMwJITjoYZjyuTs//6O5h7
	X6BWyncw==
X-Received: by 2002:a05:600c:6989:b0:493:a8ff:d7af with SMTP id 5b1f17b1804b1-493d0f04f33mr5320535e9.4.1783093913987;
        Fri, 03 Jul 2026 08:51:53 -0700 (PDT)
Received: from [127.0.0.1] ([78.152.220.181])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c63ba97csm141294655e9.12.2026.07.03.08.51.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 08:51:53 -0700 (PDT)
From: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
X-Google-Original-From: Bryan O'Donoghue <bod@kernel.org>
Date: Fri, 03 Jul 2026 16:51:47 +0100
Subject: [PATCH 3/7] media: qcom: camss: qcom-icp: Add minimal ICP driver
 with HFI infrastrucutre
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-qcom-laptops-v6-18-rc4-camss-icp-bps-ipe-icp-boots-stats-b4-v1-3-595df9e67790@kernel.org>
References: <20260703-qcom-laptops-v6-18-rc4-camss-icp-bps-ipe-icp-boots-stats-b4-v1-0-595df9e67790@kernel.org>
In-Reply-To: <20260703-qcom-laptops-v6-18-rc4-camss-icp-bps-ipe-icp-boots-stats-b4-v1-0-595df9e67790@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>, 
 Todor Tomov <todor.too@gmail.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 Bryan O'Donoghue <bod@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=35132; i=bod@kernel.org;
 h=from:subject:message-id; bh=krUtcrmj7GksaUPry5Af/PoWk1CLf55HCOVfRCFI14g=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqR9qTAtAmgwyQDFWIOe6ttIC5FDc3GqpRHM7ER
 TqLKBZsxMuJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCakfakwAKCRAicTuzoY3I
 OpRUEACDuu3Dd4Nr1oMU4hcDiuf2Mmudn2QxmL6aWACys9VNYE3ixoneWUbdzPXEltv9zYeULWA
 LZzi5St+6ejUiF1EzY1Xb62uTIEXMQm3BqsOz/nuI+gMXXioziok+iZef5XUZ9ud9HgrGdrGjqI
 KQl85s+cYPhy8jRGkmOPievVA35Io86TghFtO5/PXdfFk/c5yaCNUVa+guouGUvKuu9ydfvLwFO
 VBKxRoKLW5Fq1v5Fs+WCuJcVU1tMtNc+TWwWt7s+Gw2fPC09koWTkNCJ57G+7FtctMbR5eVNVWC
 jt/o9AfXPWgokLfSKuq1QeOSR3PRRPdYCNu0Mj1oLPf1J5Hpaz6TqIKfwJcIchRCwaWtoJ1q20t
 Q2vmMaX55zUpeJdhVVsO6jYKW0EvUci6zOntj0uZQy/dqaQCNr7tiI8y7KPN/wBLaLShU0WqTRL
 z948CNP1eC8G/wR4OAt7CBSHdGLqijF2kHx+1UGk+ckK33dhcc6OLMqB7+zaUR/y5F7iRGYikiI
 T3TrzQ2jwR35WWUtovzJTU+tr5JxXgNLix/Eh5Smp/eK9G9V0dMiH7GccsxFLhMyIGAAM25jjTu
 GdDzrhjSPcnWvI7nkJ0iQ6a6xdXxcD6J+jYCVyU0vtzY6KZ1z/yZdNlXCplKUARsUQBEDZHzDgX
 /7G/6KcICAFiJ6Q==
X-Developer-Key: i=bod@kernel.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_RHS_MATCH_TO(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:rfoss@kernel.org,m:todor.too@gmail.com,m:bryan.odonoghue@linaro.org,m:vladimir.zapolskiy@linaro.org,m:mchehab@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:bod@kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:todortoo@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[bryan.odonoghue@linaro.org,linux-media@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-66511-lists,linux-media=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:from_mime,linaro.org:dkim,vger.kernel.org:from_smtp,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2431D7040C0

Signed-off-by: Bryan O'Donoghue <bod@kernel.org>
---
 drivers/media/platform/qcom/camss/camss-icp-hfi.h | 534 +++++++++++++++++++
 drivers/media/platform/qcom/camss/camss-icp.c     | 623 ++++++++++++++++++++++
 drivers/media/platform/qcom/camss/camss-icp.h     |  58 ++
 3 files changed, 1215 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss-icp-hfi.h b/drivers/media/platform/qcom/camss/camss-icp-hfi.h
new file mode 100644
index 0000000000000..a63a0395c0f17
--- /dev/null
+++ b/drivers/media/platform/qcom/camss/camss-icp-hfi.h
@@ -0,0 +1,534 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Qualcomm CAMSS ICP HFI Protocol Definitions
+ *
+ * Copyright (c) 2025 Linaro Ltd.
+ */
+
+#ifndef __CAMSS_ICP_HFI_H__
+#define __CAMSS_ICP_HFI_H__
+
+#include <linux/types.h>
+
+#define HFI_QTBL_VERSION			0xFFFFFFFF
+
+/* ICP firmware boot command/response */
+#define ICP_INIT_REQUEST_RESET			0x0
+#define ICP_INIT_REQUEST_SET			0x01
+
+#define ICP_INIT_RESP_RESET			0x00
+#define ICP_INIT_RESP_SUCCESS			0x01
+#define	ICP_INIT_RESP_FAILED			0x02
+
+/* Command / Response groups */
+#define HFI_CMD_GRP_ICP				0
+#define HFI_CMD_GRP_IPE_BPS			BIT(24)
+#define HFI_CMD_GRP_CDM				BIT(25)
+#define HFI_CMD_GRP_DBG				(BIT(24) | BIT(25))
+
+/* Command / Response offsets */
+#define HFI_CMD_BASE				BIT(16)
+#define HFI_RSP_BASE				BIT(17)
+
+/* System Commands */
+#define HFI_CMD_SYS_INIT			0x10001
+#define HFI_CMD_SYS_PC_PREP			0x10002
+#define HFI_CMD_SYS_SET_PROPERTY		0x10003
+#define HFI_CMD_SYS_GET_PROPERTY		0x10004
+#define HFI_CMD_SYS_PING			0x10005
+#define HFI_CMD_SYS_RESET			0x10006
+
+/* ICP Firmware result codes */
+#define CAMERAICP_OK				0x00
+#define CAMERAICP_EFAILED			0x01
+#define CAMERAICP_ENOMEMORY			0x02
+#define CAMERAICP_EBADSTATE			0x03
+#define CAMERAICP_EBADPARM			0x04
+#define CAMERAICP_EBADITEM			0x05
+#define CAMERAICP_EINVALIDFORMAT		0x06
+#define CAMERAICP_EUNSUPPORTED			0x07
+#define CAMERAICP_EOUTOFBOUND			0x08
+#define CAMERAICP_ETIMEDOUT			0x09
+#define CAMERAICP_EABORTED			0x0a
+#define CAMERAICP_EHWVIOLATION			0x0b
+#define CAMERAICP_ECDMERROR			0x0c
+
+/* System Messages */
+#define HFI_MSG_ICP_COMMON_START		0x20000
+#define HFI_MSG_SYS_INIT_DONE			0x20001
+#define HFI_MSG_SYS_PC_PREP_DONE		0x20002
+#define HFI_MSG_SYS_DEBUG			0x20003
+#define HFI_MSG_SYS_IDLE			0x20004
+#define HFI_MSG_SYS_PROPERTY_INFO		0x20005
+#define HFI_MSG_SYS_PING_ACK			0x20006
+#define HFI_MSG_SYS_RESET_ACK			0x20007
+#define HFI_MSG_EVENT_NOTIFY			0x20008
+
+/* IPE/BPS Commands */
+#define HFI_CMD_IPEBPS_CREATE_HANDLE		0x1010008
+#define HFI_CMD_IPEBPS_ASYNC_COMMAND_DIRECT	0x101000a
+#define HFI_CMD_IPEBPS_ASYNC_COMMAND_INDIRECT	0x101000e
+
+/* IPE/BPS Messages */
+#define HFI_MSG_IPEBPS_CREATE_HANDLE_ACK	0x1020008
+#define HFI_MSG_IPEBPS_ASYNC_DIRECT_ACK		0x102000a
+#define HFI_MSG_IPEBPS_ASYNC_INDIRECT_ACK	0x102000e
+
+/* Opcodes */
+#define HFI_IPEBPS_CMD_OPCODE_BPS_CONFIG_IO	0x1
+#define HFI_IPEBPS_CMD_OPCODE_BPS_FRAME_PROCESS	0x2
+#define HFI_IPEBPS_CMD_OPCODE_BPS_ABORT		0x3
+#define HFI_IPEBPS_CMD_OPCODE_BPS_DESTROY	0x4
+
+#define HFI_IPEBPS_CMD_OPCODE_IPE_CONFIG_IO	0x5
+#define HFI_IPEBPS_CMD_OPCODE_IPE_FRAME_PROCESS	0x6
+#define HFI_IPEBPS_CMD_OPCODE_IPE_ABORT		0x7
+#define HFI_IPEBPS_CMD_OPCODE_IPE_DESTROY	0x8
+
+#define HFI_IPEBPS_CMD_OPCODE_BPS_WAIT_FOR_IPE	0x9
+#define HFI_IPEBPS_CMD_OPCODE_BPS_WAIT_FOR_BPS	0xa
+#define HFI_IPEBPS_CMD_OPCODE_IPE_WAIT_FOR_BPS	0xb
+#define HFI_IPEBPS_CMD_OPCODE_IPE_WAIT_FOR_IPE	0xc
+
+#define HFI_IPEBPS_CMD_OPCODE_MEM_MAP		0xe
+#define HFI_IPEBPS_CMD_OPCODE_MEM_UNMAP		0xf
+
+/* Device Types */
+#define HFI_DEV_TYPE_BPS			1
+#define HFI_DEV_TYPE_IPE_RT			2
+#define HFI_DEV_TYPE_IPE			3
+#define HFI_DEV_TYPE_IPE_SEMI_RT		4
+#define HFI_DEV_TYPE_BPS_RT			5
+#define HFI_DEV_TYPE_BPS_SEMI_RT		6
+
+/* Events */
+#define HFI_EVENT_SYS_ERROR			0x01
+#define HFI_EVENT_ICP_ERROR			0x02
+#define HFI_EVENT_IPE_BPS_ERROR			0x03
+#define HFI_EVENT_CDM_ERROR			0x04
+#define HFI_EVENT_DBG_ERROR			0x05
+
+/* Property Types */
+#define HFI_PROP_SYS_DEBUG_CFG			0x01
+#define HFI_PROP_SYS_UBWC_CFG			0x02
+#define HFI_PROP_SYS_IMAGE_VER			0x03
+#define HFI_PROP_SYS_SUPPORTED			0x04
+#define HFI_PROP_SYS_IPEBPS_PC			0x05
+
+/*
+ * Debug levels
+ */
+#define HFI_DEBUG_MSG_LOW			BIT(0)
+#define HFI_DEBUG_MSG_MEDIUM			BIT(1)
+#define HFI_DEBUG_MSG_HIGH			BIT(2)
+#define HFI_DEBUG_MSG_ERROR			BIT(3)
+#define HFI_DEBUG_MSG_FATAL			BIT(4)
+#define HFI_DEBUG_MSG_PERF			BIT(5)
+
+/*
+ * Debug output modes
+ */
+#define HFI_DEBUG_MODE_QUEUE			0x00000001
+#define HFI_DEBUG_MODE_QDSS			0x00000002
+
+/*
+ * Handle types for CREATE_HANDLE
+ */
+#define HFI_HANDLE_TYPE_BPS			1
+#define HFI_HANDLE_TYPE_IPE			2
+
+/*
+ * Queue indexes
+ */
+enum {
+	HFI_Q_CMD_TYPE = 0,
+	HFI_Q_MSG_TYPE,
+	HFI_Q_DBG_TYPE,
+	HFI_Q_MAX,
+};
+
+/* Memory Sizes */
+#define HFI_QTBL_SIZE				SZ_1M
+#define HFI_CMD_Q_SIZE				SZ_1M
+#define HFI_MSG_Q_SIZE				SZ_1M
+#define HFI_DBG_Q_SIZE				SZ_1M
+#define HFI_SFR_LOG_SIZE			SZ_4K
+
+#define HFI_CMD_Q_DATA_SIZE			SZ_4K
+#define HFI_MSG_Q_DATA_SIZE			SZ_4K
+#define HFI_DBG_Q_DATA_SIZE			102400
+
+#define HFI_SHMEM_SIZE				SZ_1M
+#define HFI_FWUNCACHED_SIZE			(7 * SZ_1M)
+#define HFI_QDSS_SIZE				SZ_1M
+#define HFI_QTBL_SIZE				SZ_1M
+#define HFI_Q_SIZE				SZ_1M
+#define HFI_SFR_SIZE				SZ_8K
+#define HFI_SECHEAP_SIZE			SZ_1M
+
+/*
+ * General Purpose registers
+ *
+ * GP registers start at CSR base + 0x20. CAMX defines them as:
+ *   GEN_PURPOSE_REG(n) = n * 4, relative to (CSR + 0x20)
+ *
+ * So GP0 = CSR+0x20, GP1 = CSR+0x24, GP2 = CSR+0x28, GP3 = CSR+0x2C, etc.
+ *
+ * Offsets below are absolute from CSR base for direct use with csr_base.
+ */
+#define HFI_REG_FW_VERSION			0x24  /* GP1 - firmware writes version */
+#define HFI_REG_HOST_ICP_INIT_REQ		0x28  /* GP2 - host signals init request */
+#define HFI_REG_ICP_HOST_INIT_RESP		0x2C  /* GP3 - firmware signals ready */
+#define HFI_REG_SHARED_MEM_PTR			0x30  /* GP4 - shared memory IOVA */
+#define HFI_REG_SHARED_MEM_SIZE			0x34  /* GP5 - shared memory size */
+#define HFI_REG_QTBL_PTR			0x38  /* GP6 - q table IOVA */
+#define HFI_REG_SECONDARY_HEAP_PTR		0x3C  /* GP7 - secondary heap IOVA */
+#define HFI_REG_SECONDARY_HEAP_SIZE		0x40  /* GP8 - secondary heap size */
+#define HFI_REG_RESERVED			0x44  /* GP9 - reserved/status */
+#define HFI_REG_SFR_PTR				0x48  /* GP10 - SFR buffer IOVA */
+#define HFI_REG_QDSS_IOVA			0x4C  /* GP11 - QDSS buffer IOVA */
+#define HFI_REG_QDSS_IOVA_SIZE			0x50  /* GP12 - QDSS buffer size */
+#define HFI_REG_IO_REGION_1_IOVA		0x54  /* GP13 - IO region 1 IOVA */
+#define HFI_REG_IO_REGION_1_SIZE		0x58  /* GP14 - IO region 1 size */
+#define HFI_REG_IO_REGION_2_IOVA		0x5C  /* GP15 - IO region 2 IOVA */
+#define HFI_REG_IO_REGION_2_SIZE		0x60  /* GP16 - IO region 2 size */
+#define HFI_REG_FWUNCACHED_IOVA			0x64  /* GP17 - FW uncached region IOVA */
+#define HFI_REG_FWUNCACHED_SIZE			0x68  /* GP18 - FW uncached region size */
+
+/* HFI constants */
+#define HFI_QUEUE_TABLE_VERSION			0xFFFFFFFF
+
+#define HFI_BYTE_WORD_SHIFT			0x02
+
+#define HFI_MAX_PROPS				16
+
+struct hfi_resources {
+	u32 shmem_size;
+	u32 qdss_size;
+	u32 fwuncached_size;
+	u32 secheap_size;
+	u32 q_tbl_size;
+	u32 qdata_size[HFI_Q_MAX];
+	u32 sfr_size;
+};
+
+struct icp_hfi_mem_region {
+	void *vaddr;
+	dma_addr_t dma_addr;
+	size_t size;
+};
+
+struct icp_hfi_mem {
+	/* These get their own allocations */
+	struct icp_hfi_mem_region shmem;
+	struct icp_hfi_mem_region qdss;
+	struct icp_hfi_mem_region fwuncached;
+
+	/* Pointers into the fwuncached region */
+	struct icp_hfi_mem_region secheap;
+	struct icp_hfi_mem_region q_tbl;
+	struct icp_hfi_mem_region q_data[HFI_Q_MAX];
+	struct icp_hfi_mem_region sfr;
+};
+
+struct icp_hfi_ops {
+	void (*raise_irq)(void *priv);
+};
+
+struct icp_hfi {
+	struct device *dev;
+	struct icp_hfi_mem hfi_mem;
+	const struct hfi_resources *res;
+
+	const struct icp_hfi_ops *ops;
+	void *priv;
+
+	/*
+	 * Queue Table Pointer
+	 * Points to hfi_q_tbl_hdr at hfi_mem.q_tbl.vaddr
+	 * Contains header + 4 x struct hfi_q_header
+	 */
+	struct hfi_q_tbl_hdr *q_tbl;
+
+	/*
+	* Synchronization
+	*/
+	struct mutex cmd_lock;
+	struct completion cmd_complete;
+
+	/*
+	 * State
+	 */
+	bool ready;         /* HFI fully initialized */
+	u32 fw_version;     /* From GP1 register after boot */
+	u32 api_version;    /* From INIT_DONE response */
+
+	/* Properties */
+	u32 prop_num;
+	u32 properties[HFI_MAX_PROPS];
+
+	/* Debug */
+	struct hfi_sfr *sfr;
+};
+
+/*
+ * HFI Queue Header - CAMX compatible
+ * Each field is padded to 64 bytes (16 u32s) for cache line alignment.
+ * The firmware expects this exact layout.
+ */
+struct hfi_q_hdr {
+	u32 dummy0[15];
+	u32 status;
+	u32 dummy1[15];
+	u32 start_addr;
+	u32 dummy2[15];
+	u32 type;
+	u32 dummy3[15];
+	u32 q_size;
+	u32 dummy4[15];
+	u32 pkt_size;
+	u32 dummy5[15];
+	u32 pkt_drop_cnt;
+	u32 dummy6[15];
+	u32 rx_wm;
+	u32 dummy7[15];
+	u32 tx_wm;
+	u32 dummy8[15];
+	u32 rx_req;
+	u32 dummy9[15];
+	u32 tx_req;
+	u32 dummy10[15];
+	u32 rx_irq_status;
+	u32 dummy11[15];
+	u32 tx_irq_status;
+	u32 dummy12[15];
+	u32 read_idx;
+	u32 dummy13[15];
+	u32 write_idx;
+	u32 dummy14[15];
+} __packed;
+
+struct hfi_q_tbl_hdr {
+	u32 version;
+	u32 size;
+	u32 q_hdr0_offset;
+	u32 q_hdr_size;
+	u32 num_queues;
+	u32 num_active_queues;
+	struct hfi_q_hdr q_hdr[];
+} __packed;
+
+struct hfi_pkt_hdr {
+	u32 size;
+	u32 type;
+} __packed;
+
+struct hfi_cmd_sys_init {
+	struct hfi_pkt_hdr hdr;
+} __packed;
+
+struct hfi_msg_init_done {
+	struct hfi_pkt_hdr hdr;
+	u32 error;
+	u32 prop_num;
+	u32 prop_data[];
+} __packed;
+
+struct hfi_cmd_ping {
+	struct hfi_pkt_hdr hdr;
+	u64 user_data;
+} __packed;
+
+struct hfi_msg_ping_ack {
+	struct hfi_pkt_hdr hdr;
+	u64 user_data;
+} __packed;
+
+struct hfi_msg_event {
+	struct hfi_pkt_hdr hdr;
+	u32 session_id;
+	u32 event_id;
+	u32 data1;
+	u32 data2;
+} __packed;
+
+struct hfi_cmd_ubwc_cfg {
+	struct hfi_pkt_hdr hdr;
+	u32 num_params;
+	u32 prop_type;
+	u32 ipe_fetch;
+	u32 ipe_write;
+	u32 bps_fetch;
+	u32 bps_write;
+} __packed;
+
+struct hfi_cmd_create_handle {
+	struct hfi_pkt_hdr hdr;
+	u32 handle_type;
+	u64 user_data0;
+	u64 user_data1;
+} __packed;
+
+struct hfi_msg_create_handle_ack {
+	struct hfi_pkt_hdr hdr;
+	u32 error;
+	u32 fw_handle;
+	u64 user_data0;
+	u64 user_data1;
+} __packed;
+
+struct hfi_cmd_async {
+	struct hfi_pkt_hdr hdr;
+	u32 opcode;
+	u32 fw_handle;
+	u64 user_data0;
+	u64 user_data1;
+	u32 num_handles;
+	u32 handle[1];
+	u32 payload[];
+} __packed;
+
+#define HFI_MSG_ASYNC_MAX_MSG 32
+struct hfi_msg_async_ack {
+	struct hfi_pkt_hdr hdr;
+	u32 opcode;
+	u64 user_data0;
+	u64 user_data1;
+	u32 error;
+	u32 msg[HFI_MSG_ASYNC_MAX_MSG];
+} __packed;
+
+struct hfi_cmd_set_property {
+	struct hfi_pkt_hdr hdr;
+	u32 num_prop;
+	u32 prop_data[];
+} __packed;
+
+struct hfi_msg_debug {
+	struct hfi_pkt_hdr hdr;
+	u32 msg_type;
+	u32 msg_size;
+	u32 timestamp_hi;
+	u32 timestamp_lo;
+	u8  msg_data[];
+} __packed;
+
+struct hfi_debug_cfg {
+	u32 debug_config;
+	u32 debug_mode;
+} __packed;
+
+struct hfi_msg_debug_level {
+	struct hfi_cmd_set_property hdr;
+	u32 prop_id;
+	struct hfi_debug_cfg cfg;
+} __packed;
+
+struct hfi_sfr {
+	u32 size;
+	char msg[HFI_SFR_LOG_SIZE];
+};
+
+static inline u32 hfi_pkt_size(void *pkt)
+{
+	struct hfi_pkt_hdr *pkt_hdr = pkt;
+	return pkt_hdr->size;
+}
+
+static inline u32 hfi_pkt_type(void *pkt)
+{
+	struct hfi_pkt_hdr *pkt_hdr = pkt;
+	return pkt_hdr->type;
+}
+
+static inline bool hfi_queue_empty(struct hfi_q_hdr *q)
+{
+	return READ_ONCE(q->read_idx) == READ_ONCE(q->write_idx);
+}
+
+static inline u32 hfi_queue_free(struct hfi_q_hdr *q)
+{
+	u32 ri = READ_ONCE(q->read_idx);
+	u32 wi = READ_ONCE(q->write_idx);
+	u32 used = (wi >= ri) ? (wi - ri) : (q->q_size - ri + wi);
+
+	return q->q_size - used - 1;
+}
+
+/* Queue management */
+int icp_hfi_init_queues(struct icp_hfi *hfi);
+void icp_hfi_deinit_queues(struct icp_hfi *hfi);
+
+/* ISR support - called from threaded IRQ handler */
+void icp_hfi_flush_debug_queue(struct icp_hfi *hfi);
+bool icp_hfi_process_msg_queue(struct icp_hfi *hfi);
+
+/* Core operations */
+int icp_hfi_core_init(struct icp_hfi *hfi);
+void icp_hfi_dump_sfr(struct icp_hfi *hfi);
+
+/**
+ * icp_set_ubwc_config - Set UBWC configuration for device
+ * @icp: ICP device
+ * @dev_type: HFI_DEV_TYPE_IPE or HFI_DEV_TYPE_BPS
+ * @cfg: UBWC configuration
+ *
+ * Should be called during IPE/BPS probe, before any contexts
+ * are created. ICP will send config to firmware on boot.
+ */
+int icp_hfi_set_ubwc_config(struct icp_device *icp, u32 dev_type,
+			    struct icp_ubwc_cfg *cfg);
+
+/**
+ * icp_ctx_create - Create processing context
+ * @icp: ICP device
+ * @dev_type: HFI_DEV_TYPE_IPE or HFI_DEV_TYPE_BPS
+ * @callback: Completion callback (called from workqueue)
+ * @priv: Private data for callback
+ *
+ * Returns context or ERR_PTR on failure.
+ */
+int icp_hfi_create_handle(struct icp_hfi *hfi, u32 handle_type,
+			  u64 ctx, u32 *fw_handle, u32 timeout_ms);
+
+/**
+ * icp_ctx_destroy - Destroy processing context
+ * @ctx: Context to destroy
+ */
+int icp_hfi_destroy_handle(struct icp_hfi *hfi, u32 handle_type,
+			   u64 ctx, u32 fw_handle, u32 timeout_ms);
+#if 0
+/**
+ * icp_ctx_config_io - Configure IO buffers for context
+ * @ctx: Processing context
+ * @cfg_iova: IOVA of configuration buffer
+ * @cfg_size: Size of configuration buffer
+ */
+int icp_ctx_config_io(struct icp_context *ctx, dma_addr_t cfg_iova, u32 cfg_size);
+
+/**
+ * icp_ctx_submit_frame - Submit frame for processing
+ * @ctx: Processing context
+ * @req: Frame request descriptor
+ *
+ * Asynchronous - completion via callback.
+ */
+int icp_ctx_submit_frame(struct icp_context *ctx, struct icp_frame_request *req);
+
+/**
+ * icp_ctx_abort - Abort pending operations
+ * @ctx: Processing context
+ */
+int icp_ctx_abort(struct icp_context *ctx);
+
+/**
+ * icp_ctx_wait - Wait for operation completion
+ * @ctx: Processing context
+ * @timeout_ms: Timeout in milliseconds
+ *
+ * Returns 0 on success, -ETIMEDOUT on timeout.
+ */
+int icp_ctx_wait(struct icp_context *ctx, unsigned long timeout_ms);
+#endif
+
+#endif /* __CAMSS_ICP_HFI_H__ */
diff --git a/drivers/media/platform/qcom/camss/camss-icp.c b/drivers/media/platform/qcom/camss/camss-icp.c
new file mode 100644
index 0000000000000..1617dea15a5a7
--- /dev/null
+++ b/drivers/media/platform/qcom/camss/camss-icp.c
@@ -0,0 +1,623 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Qualcomm ICP (Image Control Processor) driver for X1E80100
+ *
+ */
+#define DEBUG
+#include <linux/clk.h>
+#include <linux/delay.h>
+#include <linux/dma-mapping.h>
+#include <linux/firmware.h>
+#include <linux/firmware/qcom/qcom_scm.h>
+#include <linux/interconnect.h>
+#include <linux/interrupt.h>
+#include <linux/io.h>
+#include <linux/iommu.h>
+#include <linux/iopoll.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_address.h>
+#include <linux/of_reserved_mem.h>
+#include <linux/platform_device.h>
+#include <linux/pm_domain.h>
+#include <linux/pm_runtime.h>
+#include <linux/soc/qcom/mdt_loader.h>
+
+#include "camss-icp.h"
+#include "camss-icp-hfi.h"
+
+/* CSR register offsets */
+#define ICP_CSR_HW_VERSION		0x00
+#define ICP_CSR_TCM_SIZE		0x08
+#define ICP_CSR_DBG_STATUS		0x44
+#define ICP_CSR_DBG_CTRL		0x48
+
+/* CIRQ register offsets */
+#define CIRQ_OB_MASK			0x00
+#define CIRQ_OB_STATUS			0x04
+#define CIRQ_OB_CLEAR			0x08
+#define CIRQ_HOST2ICPINT		0x124
+
+/* CIRQ bits */
+#define CIRQ_ICP2HOSTINT		BIT(0)
+#define CIRQ_WDT_BITE_WS0		BIT(6)
+
+#define ICP_CLK_MAX			32
+
+#define POLLING_SLEEP_US		1000
+#define POLLING_TIMEOUT_US		20000
+
+/* HFI polling - match CAMX: 100us interval, 2 second timeout */
+#define HFI_POLL_DELAY_US		100
+#define HFI_POLL_TIMEOUT_US		2000000
+
+/* ICC paths */
+#define HFI_MAX_ICC_PATHS		4
+struct camss_icp_resources {
+	int pas_id;
+	const char ** const clk_names;
+	int clk_num;
+	const char ** const noc_names;
+	int noc_num;
+	struct hfi_resources hfi_res;
+};
+
+struct camss_icp {
+	struct device *dev;
+	void __iomem *csr_base;
+	void __iomem *cirq_base;
+	int irq;
+
+	struct dev_pm_domain_list *pd_list;
+
+	struct clk_bulk_data clks[ICP_CLK_MAX];
+	struct icc_path *icc_path[HFI_MAX_ICC_PATHS];
+
+	struct icp_hfi hfi;
+
+	phys_addr_t fw_phys;
+	size_t fw_size;
+
+	const struct camss_icp_resources *icp_res;
+};
+
+struct icp_hfi *icp_hfi_get(struct device *dev)
+{
+	struct camss_icp *icp = dev_get_drvdata(dev);
+
+	if (!icp)
+		return ERR_PTR(-ENODEV);
+
+	get_device(icp->dev);
+	return &icp->hfi;
+}
+EXPORT_SYMBOL(icp_hfi_get);
+
+void icp_hfi_put(struct icp_hfi *phfi)
+{
+	struct camss_icp *icp = container_of(phfi, struct camss_icp, hfi);
+
+	put_device(icp->dev);
+}
+EXPORT_SYMBOL(icp_hfi_put);
+
+/*
+ * Raise interrupt to firmware - called by HFI layer after CMD_Q write
+ */
+static void icp_raise_irq(void *priv)
+{
+	struct camss_icp *icp = priv;
+
+	dev_dbg(icp->dev, "Raising HOST2ICPINT (CIRQ STATUS before: 0x%x)\n",
+		readl(icp->cirq_base + CIRQ_OB_STATUS));
+
+	writel(1, icp->cirq_base + CIRQ_HOST2ICPINT);
+
+	/* Small delay then check if anything changed */
+	udelay(100);
+	dev_dbg(icp->dev, "CIRQ STATUS after HOST2ICPINT: 0x%x\n",
+		readl(icp->cirq_base + CIRQ_OB_STATUS));
+}
+
+/* Load firmware */
+static int icp_load_firmware(struct camss_icp *icp)
+{
+	const struct camss_icp_resources *icp_res = icp->icp_res;
+	const struct firmware *fw;
+	struct device_node *node;
+	struct resource res;
+	const char *fw_name;
+	char fw_path[64];
+	void *vaddr;
+	ssize_t fw_size;
+	int ret;
+
+	ret = of_property_read_string(icp->dev->of_node, "firmware-name", &fw_name);
+	if (ret)
+		return ret;
+
+	snprintf(fw_path, sizeof(fw_path), "%s.mdt", fw_name);
+
+	node = of_parse_phandle(icp->dev->of_node, "memory-region", 0);
+	if (!node)
+		return -ENODEV;
+
+	ret = of_address_to_resource(node, 0, &res);
+	of_node_put(node);
+	if (ret)
+		return ret;
+
+	dev_dbg(icp->dev, "FW memory: phys=0x%pa size=%llu\n",
+		&res.start, resource_size(&res));
+
+	ret = firmware_request_nowarn(&fw, fw_path, icp->dev);
+	if (ret)
+		return ret;
+
+	fw_size = qcom_mdt_get_size(fw);
+	if (fw_size < 0 || (size_t)fw_size > resource_size(&res)) {
+		release_firmware(fw);
+		return -EINVAL;
+	}
+
+	vaddr = ioremap_wc(res.start, resource_size(&res));
+	if (!vaddr) {
+		release_firmware(fw);
+		return -ENOMEM;
+	}
+
+	ret = qcom_mdt_load(icp->dev, fw, fw_path, icp_res->pas_id, vaddr,
+			    res.start, resource_size(&res), NULL);
+	iounmap(vaddr);
+	release_firmware(fw);
+
+	if (ret == 0) {
+		dev_dbg(icp->dev, "Firmware loaded: %s (%zd bytes)\n", fw_path, fw_size);
+		icp->fw_phys = res.start;
+		icp->fw_size = fw_size;
+	}
+
+	return ret;
+}
+
+static irqreturn_t camss_icp_isr_thread(int irq, void *data)
+{
+	struct camss_icp *icp = data;
+	u32 status;
+
+	/* Re-read status for logging */
+	status = readl(icp->cirq_base + CIRQ_OB_STATUS);
+
+	dev_dbg(icp->dev, "IRQ thread: status=0x%x\n", status);
+
+	if (status & CIRQ_WDT_BITE_WS0) {
+		dev_err(icp->dev, "ICP watchdog bite!\n");
+		icp_hfi_dump_sfr(&icp->hfi);
+	}
+
+	/* Process message queue - signals waiters if data present */
+	icp_hfi_process_msg_queue(&icp->hfi);
+
+	/* Flush debug queue - async debug messages */
+	icp_hfi_flush_debug_queue(&icp->hfi);
+
+	return IRQ_HANDLED;
+}
+
+static irqreturn_t camss_icp_isr(int irq, void *data)
+{
+	struct camss_icp *icp = data;
+	u32 status;
+
+	dev_dbg(icp->dev, "IRQ ISR\n");
+
+	status = readl(icp->cirq_base + CIRQ_OB_STATUS);
+	if (!status)
+		return IRQ_NONE;
+
+	writel(status, icp->cirq_base + CIRQ_OB_CLEAR);
+
+	return IRQ_WAKE_THREAD;
+}
+
+/* Dump GP registers for debugging */
+void icp_dump_gp_regs(struct camss_icp *icp, const char *label)
+{
+	u32 regs[20];
+	int i;
+
+	dev_info(icp->dev, "=== %s ===\n", label);
+	dev_info(icp->dev, "Raw CSR offsets 0x20-0x6C (GP registers):\n");
+
+	for (i = 0; i < 20; i++)
+		regs[i] = readl(icp->csr_base + 0x20 + i * 4);
+
+	for (i = 0; i < 20; i += 4)
+		dev_info(icp->dev, "  [0x%02x]: %08x %08x %08x %08x\n",
+			 0x20 + i * 4, regs[i], regs[i+1], regs[i+2], regs[i+3]);
+}
+
+void icp_hfi_latch_regs(struct camss_icp *icp)
+{
+	struct icp_hfi *hfi = &icp->hfi;
+	struct device *dev = hfi->dev;
+
+	/* Shared memory */
+	writel(hfi->hfi_mem.shmem.dma_addr, icp->csr_base + HFI_REG_SHARED_MEM_PTR);
+	writel(hfi->hfi_mem.shmem.size, icp->csr_base + HFI_REG_SHARED_MEM_SIZE);
+
+	/* QTBL - header describing HFI queues */
+	writel(hfi->hfi_mem.q_tbl.dma_addr, icp->csr_base + HFI_REG_QTBL_PTR);
+
+	/* QDSS */
+	writel(hfi->hfi_mem.qdss.dma_addr, icp->csr_base + HFI_REG_QDSS_IOVA);
+	writel(HFI_QDSS_SIZE, icp->csr_base + HFI_REG_QDSS_IOVA_SIZE);
+
+	/* FW Uncached */
+	writel(hfi->hfi_mem.fwuncached.dma_addr, icp->csr_base + HFI_REG_FWUNCACHED_IOVA);
+	writel(HFI_FWUNCACHED_SIZE, icp->csr_base + HFI_REG_FWUNCACHED_SIZE);
+
+	/* Sec heap */
+	writel(hfi->hfi_mem.secheap.dma_addr, icp->csr_base + HFI_REG_SECONDARY_HEAP_PTR);
+	writel(HFI_SECHEAP_SIZE, icp->csr_base + HFI_REG_SECONDARY_HEAP_SIZE);
+
+	/* SFR buffer */
+	writel(hfi->hfi_mem.sfr.dma_addr, icp->csr_base + HFI_REG_SFR_PTR);
+
+	/* IO regions - use standard CAMX values TODO: fix this */
+	writel(0x10c00000, icp->csr_base + HFI_REG_IO_REGION_1_IOVA);
+	writel(0xcf400000, icp->csr_base + HFI_REG_IO_REGION_1_SIZE);
+	writel(0xe0800000, icp->csr_base + HFI_REG_IO_REGION_2_IOVA);
+	writel(0x1e700000, icp->csr_base + HFI_REG_IO_REGION_2_SIZE);
+
+}
+
+/* HFI operations */
+static const struct icp_hfi_ops hfi_ops = {
+	.raise_irq = icp_raise_irq,
+};
+
+static int icp_boot(struct camss_icp *icp)
+{
+	const struct camss_icp_resources *icp_res = icp->icp_res;
+	u32 hw_version, data;
+	int i, ret;
+
+	/* Power on all domains via runtime PM */
+	ret = pm_runtime_resume_and_get(icp->dev);
+	if (ret) {
+		dev_err(icp->dev, "Failed to power on: %d\n", ret);
+		return ret;
+	}
+
+	/* Enable clocks */
+	ret = clk_bulk_prepare_enable(icp_res->clk_num, icp->clks);
+	if (ret) {
+		dev_err(icp->dev, "Failed to enable clocks: %d\n", ret);
+		return ret;
+	}
+
+	for (i = 0; i < icp_res->noc_num; i++) {
+		if (icp->icc_path[i]) {
+			dev_dbg(icp->dev, "Voting for BW now %s\n", icp_res->noc_names[i]);
+			ret = icc_set_bw(icp->icc_path[i], 100000000, 1000000000);
+			if (ret) {
+				dev_err(icp->dev, "Voting for %s failed\n", icp_res->noc_names[i]);
+				return ret;
+			}
+		}
+	}
+
+	/* Verify HW version */
+	hw_version = readl(icp->csr_base + ICP_CSR_HW_VERSION);
+	dev_info(icp->dev, "HW version: 0x%08x\n", hw_version);
+
+	if (hw_version == 0 || hw_version == 0xffffffff) {
+		dev_err(icp->dev, "Invalid HW version\n");
+		ret = -EIO;
+		goto err_clk;
+	}
+
+	/* Configure interrupts */
+	writel(0x7f, icp->cirq_base + CIRQ_OB_CLEAR);
+	writel(CIRQ_ICP2HOSTINT | CIRQ_WDT_BITE_WS0, icp->cirq_base + CIRQ_OB_MASK);
+
+	/* Load firmware */
+	ret = icp_load_firmware(icp);
+	if (ret)
+		goto err_clk;
+
+	/* Allocate HFI queues */
+	ret = icp_hfi_init_queues(&icp->hfi);
+	if (ret)
+		goto err_clk;
+
+	/* Start firmware via TrustZone */
+	ret = qcom_scm_pas_auth_and_reset(icp_res->pas_id);
+	if (ret) {
+		dev_err(icp->dev, "TZ auth_and_reset failed: %d\n", ret);
+		goto err_hfi;
+	}
+
+	/* Wait for firmware to boot */
+	usleep_range(5000, 51000);
+
+	/* Program HFI pointers after bootup */
+	icp_hfi_latch_regs(icp);
+
+	/*
+	 * Boot handshake with ICP firmware.
+	 *
+	 * After TZ starts the ICP, firmware waits for host to program
+	 * GP registers with memory addresses and signal readiness.
+	 *
+	 * Register assignments:
+	 *   GP1 (0x24) = FW_VERSION        - firmware writes its version
+	 *   GP2 (0x28) = HOST_ICP_INIT_REQ - host writes 1 ("addresses ready")
+	 *   GP3 (0x2C) = ICP_HOST_INIT_RESP - firmware writes 1 ("ready")
+	 *   GP4-GP18   = memory addresses   - host programs with IOVAs
+	 *
+	 * Sequence:
+	 *   1. Program GP4-GP18 with memory addresses  [done above]
+	 *   2. Write GP2 = 1 (HOST_ICP_INIT_REQUEST)
+	 *   3. Poll GP3 until ICP_INIT_RESP_SUCCESS (1)
+	 *   4. Read GP1 for firmware version
+	 *
+	 */
+
+	/* Signal firmware */
+	writel(ICP_INIT_REQUEST_SET, icp->csr_base + HFI_REG_HOST_ICP_INIT_REQ);
+
+	wmb();
+
+	/* Wait for firmware to signal ready via GP3 */
+	ret = readl_poll_timeout(icp->csr_base + HFI_REG_ICP_HOST_INIT_RESP,
+				 data, data == ICP_INIT_RESP_SUCCESS,
+				 HFI_POLL_DELAY_US, HFI_POLL_TIMEOUT_US);
+
+	if (ret < 0) {
+		dev_err(icp->dev, "Firmware ready timeout (GP3=0x%08x)\n",
+			readl(icp->csr_base + HFI_REG_ICP_HOST_INIT_RESP));
+		dev_err(icp->dev, "  GP1 (FW_VERSION)=0x%08x GP2 (INIT_REQ)=0x%08x\n",
+			readl(icp->csr_base + HFI_REG_FW_VERSION),
+			readl(icp->csr_base + HFI_REG_HOST_ICP_INIT_REQ));
+		icp_dump_gp_regs(icp, "FW READY TIMEOUT");
+		icp_hfi_dump_sfr(&icp->hfi);
+		ret = -ETIMEDOUT;
+		goto err_hfi;
+	}
+
+	/* Read firmware version from GP1 */
+	icp->hfi.fw_version = readl(icp->csr_base + HFI_REG_FW_VERSION);
+	dev_dbg(icp->dev, "Firmware ready! version=0x%08x\n", icp->hfi.fw_version);
+
+	/* Dump CIRQ state after FW init */
+	dev_info(icp->dev, "CIRQ after FW init: MASK=0x%x STATUS=0x%x\n",
+		 readl(icp->cirq_base + CIRQ_OB_MASK),
+		 readl(icp->cirq_base + CIRQ_OB_STATUS));
+
+	/* Dump GP registers to verify what firmware sees */
+	dev_info(icp->dev, "GP registers after FW init:\n");
+	dev_info(icp->dev, "  GP0 (unused):        0x%08x\n", readl(icp->csr_base + 0x20));
+	dev_info(icp->dev, "  GP1 (FW_VERSION):    0x%08x\n", readl(icp->csr_base + HFI_REG_FW_VERSION));
+	dev_info(icp->dev, "  GP2 (INIT_REQ):      0x%08x\n", readl(icp->csr_base + HFI_REG_HOST_ICP_INIT_REQ));
+	dev_info(icp->dev, "  GP3 (INIT_RESP):     0x%08x\n", readl(icp->csr_base + HFI_REG_ICP_HOST_INIT_RESP));
+	dev_info(icp->dev, "  GP4 (SHMEM_PTR):     0x%08x (we wrote: 0x%08x)\n",
+		 readl(icp->csr_base + HFI_REG_SHARED_MEM_PTR), (u32)icp->hfi.hfi_mem.shmem.dma_addr);
+	dev_info(icp->dev, "  GP5 (SHMEM_SIZE):    0x%08x (we wrote: 0x%08x)\n",
+		 readl(icp->csr_base + HFI_REG_SHARED_MEM_SIZE), (u32)icp->hfi.hfi_mem.shmem.size);
+	dev_info(icp->dev, "  GP6 (QTBL_PTR):      0x%08x (we wrote: 0x%08x)\n",
+		 readl(icp->csr_base + HFI_REG_QTBL_PTR), (u32)icp->hfi.hfi_mem.q_tbl.dma_addr);
+	dev_info(icp->dev, "  GP7 (SECHEAP_PTR):   0x%08x (we wrote: 0x%08x)\n",
+		 readl(icp->csr_base + HFI_REG_SECONDARY_HEAP_PTR), (u32)icp->hfi.hfi_mem.secheap.dma_addr);
+	dev_info(icp->dev, "  GP8 (SECHEAP_SIZE):  0x%08x (we wrote: 0x%08x)\n",
+		 readl(icp->csr_base + HFI_REG_SECONDARY_HEAP_SIZE), HFI_SECHEAP_SIZE);
+	dev_info(icp->dev, "  GP9 (STATUS):        0x%08x\n", readl(icp->csr_base + HFI_REG_RESERVED));
+	dev_info(icp->dev, "  GP10 (SFR_PTR):      0x%08x (we wrote: 0x%08x)\n",
+		 readl(icp->csr_base + HFI_REG_SFR_PTR), (u32)icp->hfi.hfi_mem.sfr.dma_addr);
+	dev_info(icp->dev, "  GP11 (QDSS_IOVA):    0x%08x (we wrote: 0x%08x)\n",
+		 readl(icp->csr_base + HFI_REG_QDSS_IOVA), (u32)icp->hfi.hfi_mem.qdss.dma_addr);
+	dev_info(icp->dev, "  GP12 (QDSS_SIZE):    0x%08x\n", readl(icp->csr_base + HFI_REG_QDSS_IOVA_SIZE));
+	dev_info(icp->dev, "  GP17 (FWUNCACHED):   0x%08x (we wrote: 0x%08x)\n",
+		 readl(icp->csr_base + HFI_REG_FWUNCACHED_IOVA), (u32)icp->hfi.hfi_mem.fwuncached.dma_addr);
+	dev_info(icp->dev, "  GP18 (FWUNC_SIZE):   0x%08x (we wrote: 0x%08x)\n",
+		 readl(icp->csr_base + HFI_REG_FWUNCACHED_SIZE), HFI_FWUNCACHED_SIZE);
+
+	return 0;
+err_hfi:
+	icp_hfi_deinit_queues(&icp->hfi);
+err_clk:
+	for (i = 0; i < icp_res->noc_num; i++) {
+		if (icp->icc_path[i])
+			icc_set_bw(icp->icc_path[i], 0, 0);
+	}
+	clk_bulk_disable_unprepare(icp_res->clk_num, icp->clks);
+	return ret;
+}
+
+static int camss_icp_probe(struct platform_device *pdev)
+{
+	struct dev_pm_domain_attach_data pd_data = { .pd_flags = PD_FLAG_DEV_LINK_ON };
+	const struct camss_icp_resources *icp_res;
+	struct camss_icp *icp;
+	int ret, i;
+
+	icp_res = of_device_get_match_data(&pdev->dev);
+	if (!icp_res)
+		return -EINVAL;
+
+	icp = devm_kzalloc(&pdev->dev, sizeof(*icp), GFP_KERNEL);
+	if (!icp)
+		return -ENOMEM;
+
+	icp->dev = &pdev->dev;
+	icp->icp_res = icp_res;
+	icp->hfi.res = &icp_res->hfi_res;
+	icp->hfi.ops = &hfi_ops;
+	icp->hfi.dev = icp->dev;
+	icp->hfi.priv = icp;
+
+	platform_set_drvdata(pdev, icp);
+
+	icp->csr_base = devm_platform_ioremap_resource_byname(pdev, "csr");
+	if (IS_ERR(icp->csr_base))
+		return PTR_ERR(icp->csr_base);
+
+	icp->cirq_base = devm_platform_ioremap_resource_byname(pdev, "cirq");
+	if (IS_ERR(icp->cirq_base))
+		return PTR_ERR(icp->cirq_base);
+
+	icp->irq = platform_get_irq(pdev, 0);
+	if (icp->irq < 0)
+		return icp->irq;
+
+	/* Reserved memory for HFI */
+	ret = of_reserved_mem_device_init_by_idx(&pdev->dev, pdev->dev.of_node, 1);
+	if (ret && ret != -ENODEV) {
+		dev_err(&pdev->dev, "Failed to init reserved memory: %d\n", ret);
+		return ret;
+	}
+
+	ret = dev_pm_domain_attach_list(&pdev->dev, &pd_data, &icp->pd_list);
+	if (ret < 0 && ret != -EEXIST) {
+		dev_err(&pdev->dev, "Failed to attach power domains: %d\n", ret);
+		return ret;
+	}
+
+	for (i = 0; i < icp_res->clk_num; i++) {
+		dev_info(&pdev->dev, "clk=%s\n", icp_res->clk_names[i]);
+		icp->clks[i].id = icp_res->clk_names[i];
+	}
+
+	ret = devm_clk_bulk_get(&pdev->dev, icp_res->clk_num, icp->clks);
+	if (ret) {
+		dev_err(&pdev->dev, "Failed to get clocks: %d\n", ret);
+		goto err_pd;
+	}
+
+	for (i = 0; i < icp_res->noc_num; i++) {
+		icp->icc_path[i] = devm_of_icc_get(&pdev->dev, icp_res->noc_names[i]);
+		if (IS_ERR(icp->icc_path[i])) {
+			if (PTR_ERR(icp->icc_path[i]) != -ENODATA) {
+				ret = PTR_ERR(icp->icc_path[i]);
+				goto err_pd;
+			}
+			icp->icc_path[i] = NULL;
+		}
+	};
+
+	ret = devm_request_threaded_irq(&pdev->dev, icp->irq, camss_icp_isr,
+					camss_icp_isr_thread,
+					IRQF_TRIGGER_RISING | IRQF_ONESHOT,
+					"camss-icp", icp);
+	if (ret) {
+		dev_err(&pdev->dev, "Failed to request IRQ: %d\n", ret);
+		goto err_pd;
+	}
+
+	pm_runtime_enable(&pdev->dev);
+
+	ret = icp_boot(icp);
+	if (ret)
+		goto err_pd;
+
+	ret = icp_hfi_core_init(&icp->hfi);
+	if (ret)
+		goto err_pd;
+
+	return 0;
+
+err_pd:
+	if (icp->pd_list)
+		dev_pm_domain_detach_list(icp->pd_list);
+
+	return ret;
+}
+
+static void camss_icp_remove(struct platform_device *pdev)
+{
+	struct camss_icp *icp = platform_get_drvdata(pdev);
+	const struct camss_icp_resources *icp_res;
+	int i;
+
+	icp_res = icp->icp_res;
+	qcom_scm_pas_shutdown(icp_res->pas_id);
+
+	icp_hfi_deinit_queues(&icp->hfi);
+
+	for (i = 0; i < icp_res->noc_num; i++) {
+		if (icp->icc_path[i])
+			icc_set_bw(icp->icc_path[i], 0, 0);
+	}
+	clk_bulk_disable_unprepare(icp_res->clk_num, icp->clks);
+
+	if (icp->pd_list)
+		dev_pm_domain_detach_list(icp->pd_list);
+
+}
+
+static const char * const x1e80100_clk_names [] = {
+	"ahb", "core", "debug_xo",
+	"gcc_hf_axi", "gcc_sf_axi",
+	"cpas_ahb", "core_ahb", "cpas_fast_ahb",
+	"camnoc_axi_rt", "camnoc_axi_nrt",
+	"bps_ahb", "bps_fast_ahb", "bps", "cpas_bps",
+	"ipe_ahb", "ipe_nps_fast_ahb", "ipe_pps_fast_ahb",
+	"ipe_nps", "ipe_pps", "cpas_ipe",
+};
+
+static const char * const x1e80100_noc_names [] = {
+	"ahb",
+	"hf_0",
+	"sf_0",
+	"sf_icp"
+};
+
+struct camss_icp_resources x1e80100_icp_res = {
+	.pas_id = 33,
+	.clk_names = x1e80100_clk_names,
+	.clk_num = ARRAY_SIZE(x1e80100_clk_names),
+	.noc_names = x1e80100_noc_names,
+	.noc_num = ARRAY_SIZE(x1e80100_noc_names),
+	.hfi_res = {
+		.shmem_size = SZ_1M,	 // change to 0x0FC00000 per downstream ?
+		.qdss_size = SZ_1M,
+		.fwuncached_size = 7 * SZ_1M,
+		/*
+		 * Carve sub-regions from FwUncached:
+		 * Over-allocate as CamX does for now.
+		 *   +0x000000: SecHeap (1MB)
+		 *   +0x100000: QTBL (1MB)
+		 *   +0x200000: CMD_Q (1MB)
+		 *   +0x300000: MSG_Q (1MB)
+		 *   +0x400000: DBG_Q (1MB)
+		 *   +0x500000: SFR (1MB alloc 4KB used)
+		 */
+		.secheap_size = SZ_1M,
+		.q_tbl_size = SZ_1M,
+		.qdata_size[HFI_Q_CMD_TYPE] = SZ_1M,
+		.qdata_size[HFI_Q_MSG_TYPE] = SZ_1M,
+		.qdata_size[HFI_Q_DBG_TYPE] = SZ_1M,
+		.sfr_size = SZ_1M,
+	},
+};
+
+static const struct of_device_id camss_icp_of_match[] = {
+	{ .compatible = "qcom,x1e80100-camss-icp", .data = &x1e80100_icp_res},
+	{ }
+};
+MODULE_DEVICE_TABLE(of, camss_icp_of_match);
+
+static struct platform_driver camss_icp_driver = {
+	.probe = camss_icp_probe,
+	.remove = camss_icp_remove,
+	.driver = {
+		.name = "camss-icp",
+		.of_match_table = camss_icp_of_match,
+	},
+};
+
+module_platform_driver(camss_icp_driver);
+
+MODULE_DESCRIPTION("Qualcomm ICP driver");
+MODULE_LICENSE("GPL");
diff --git a/drivers/media/platform/qcom/camss/camss-icp.h b/drivers/media/platform/qcom/camss/camss-icp.h
new file mode 100644
index 0000000000000..68039df4a28b4
--- /dev/null
+++ b/drivers/media/platform/qcom/camss/camss-icp.h
@@ -0,0 +1,58 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * ICP provides HFI interface used by IPE and BPS V4L2 m2m drivers.
+ *
+ * Copyright (c) 2026 Bryan O'Donoghue.
+ */
+#ifndef __CAMSS_ICP_H__
+#define __CAMSS_ICP_H__
+
+#include <linux/completion.h>
+#include <linux/device.h>
+#include <linux/types.h>
+
+#include "camss-icp-hfi.h"
+
+struct icp_device;
+
+/*
+ * ICP Context
+ *
+ * Represents a processing session with firmware.
+ * Created per-stream in IPE/BPS V4L2 driver.
+ */
+struct icp_context {
+	u32 id;
+	u32 dev_type;
+	u32 fw_handle;
+	struct completion done;
+	int result;
+	void *priv;
+	void (*callback)(struct icp_context *ctx, int status);
+};
+
+/*
+ * UBWC Configuration
+ */
+struct icp_ubwc_cfg {
+	u32 fetch_cfg;
+	u32 write_cfg;
+};
+
+/*
+ * Frame Processing Descriptor
+ */
+struct icp_frame_request {
+	dma_addr_t input_iova;
+	u32 input_size;
+	dma_addr_t output_iova;
+	u32 output_size;
+	dma_addr_t cmdbufs_iova;
+	u32 cmdbufs_size;
+	void *priv;
+};
+
+struct icp_hfi *icp_hfi_get(struct device *dev);
+void icp_hfi_put(struct icp_hfi *hfi);
+
+#endif /* __CAMSS_ICP_H__ */

-- 
2.54.0


