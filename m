Return-Path: <linux-media+bounces-56601-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kCdXDx2tvmmlWQMAu9opvQ
	(envelope-from <linux-media+bounces-56601-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 21 Mar 2026 15:37:17 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 911FF2E5D70
	for <lists+linux-media@lfdr.de>; Sat, 21 Mar 2026 15:37:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 754FD3013698
	for <lists+linux-media@lfdr.de>; Sat, 21 Mar 2026 14:36:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C238C38C41F;
	Sat, 21 Mar 2026 14:36:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="USrFKmCJ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 417DC277C81
	for <linux-media@vger.kernel.org>; Sat, 21 Mar 2026 14:36:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774103797; cv=none; b=hGaz3Wh1PzO9txokcO3ZkHmA+pzwsGVELQ+eotaq2vjH4UafregCTvt8l4d/Dau4oHXrZNoL3ElgUSGh/0FzM74WyHnQ+e56rkU2jJRR4897uiI7+TpztGVSDFl2CaVQ2shXBCtOjb0/ocRcwSzHYYBaWiTeavaJoSToQs7b7Zo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774103797; c=relaxed/simple;
	bh=eyWTmsWEMsGVgmH3Nk++xSbBYAxQ/Az2J0TCI8njgEU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=IlnXt4pvjg7yKfXn+sHiam7Sq2YCfqaJgpDZhJm9csGbs0S6AgfbvRnYIOOYh7MdulSxoUxKpUPQYCys0aeW2nCnj651c4OdizEPqtCS5FXapIFh7HKwKATq90DhsCgp0uw51qvsOFM0Gi05zBrWKev1G/F9pYCLjg895n3EA/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=USrFKmCJ; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-829b8b6c4d0so2409665b3a.0
        for <linux-media@vger.kernel.org>; Sat, 21 Mar 2026 07:36:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774103795; x=1774708595; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TujJwlFE7Zx7hU8eqJk2Kg4L6JXipUtmCXmWV+6vIGA=;
        b=USrFKmCJf83c/QmFDa2iaTqCt26ytuaYonxecPwct/OimYyavb4oyexDgHkEOvtHKo
         gs7Qytn8I2lZ3h6lXKXLMe7pkI780wHR+Y36kEaM+B0q+MCLu4uCRY3khU3WJ+4oy72V
         L2/HVa5S1nHdUvU/P3JGvxbR+NrwJDusbm1e/H4XuTygEM9AWvEUJh9Zw4/9DShdePoP
         +6X190WyhLt/7FHrKERTk/2jWtnm8TTysbvUSwHaJ9Dy7XM6abUe5YU/w6vuLI7oYx1H
         jWDnln3Sj5gm9A0fxLV8vgbM1tNHN4a6kJTJjffeBs5GhgHdkvNhJdWTiNtwr7OJuQ7u
         rm2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774103795; x=1774708595;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TujJwlFE7Zx7hU8eqJk2Kg4L6JXipUtmCXmWV+6vIGA=;
        b=F0xY9PsYYxMR5ZE/ySYB/SQjNhlD5M3wLhekM5BzRFGoSyeg9eeFGvEoD83eDlTs6y
         FfTiy+Y6v2FFj+OOX66+ydgrHBpW4rTssRQxvxDjDyN5UIxtLeG32/lJ3HUNHISpGbzx
         dN6TRyH5tQ3FkUwSFcQAV1FqFjl2z/cSOULGmG8Mi8hyk5oLeU76uZ3vZECThA6AGELt
         Sz1qnoLDYs/KI/yd3QjD5FvdDFZm1WmmLjA9R6DyRvUqhcMoq9eOKtQAnpsQ23IIKDnv
         sTobSZJ/XDWxwDSA2BsbJrOKKd1+ESLmS6xnRUm2AqMoWNCd9aEtmJrOOz0M36LiNWNm
         Hgsw==
X-Forwarded-Encrypted: i=1; AJvYcCVJ+n2YsyuPS99SeK7zjiQxIo/qzIdqJe+ahOyRZstKqj/TJWdmYqP6G6Scuuozt7yIU4Soun7CAzSifg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwwzUBbMlWTP3A25lZCH72pgTRaCvxunUMqh2aJmr/oFdRQIqrS
	eDtmMHVKF7gn8ZYAKNz7+/20McG/EP0Z3rY+BJY2KcoFisf6+cvcTkHU
X-Gm-Gg: ATEYQzzct62mpdSlAPsBJJmSezYoXQgwoN3giyoGhu/+w7YDeFAg5nWSvGN/YC1UTMI
	/d/neLN9YeylksG3lVrS2HEbntM6dXnULhYIAj92Vep1Svpq63wRScWeHiS5OBGv+7Cnm589jbM
	cNvg68EP1crRsj4QeMxP6e9EJpIhG6bYnkH33wgo/7bTWcdATyZGafaKR81/U+DkxvnHzXrs+RL
	G6N2IE2rpgYQuCVfJWQIis/VzHyhODygIITDTfCjkE3QFNy3ovjlSw8eDmdpYVV52hzEAhpwMZ3
	rbfKiXmtoe3JSMO+VWTxtodDJF5lNFQp2hZErMuYNcyDCRf+P1EhCRURmYOro/XyMwCK7GbKMUa
	BY2CUCRFVKbtWjrO4GMMvgAoYdl7H66VKwxDIWBAHHYtBH+4AbPIQQOY+/EUz5MQe3OaXDeaKmV
	8dzdOL1YUcoA/SuAlvBbpRSWkpJzp8IMAqPgmejJS5M5IrkwWuLLfBJ4I=
X-Received: by 2002:a05:6a00:3e07:b0:827:343a:a1ef with SMTP id d2e1a72fcca58-82a8c335bd6mr5943177b3a.52.1774103794458;
        Sat, 21 Mar 2026 07:36:34 -0700 (PDT)
Received: from xufowonmvnism.localdomain ([223.104.194.79])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82b0409b455sm4779012b3a.28.2026.03.21.07.36.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Mar 2026 07:36:34 -0700 (PDT)
From: Lian Xiangyu <lin25001x@gmail.com>
To: sakari.ailus@linux.intel.com,
	gregkh@linuxfoundation.org
Cc: bingbu.cao@intel.com,
	mchehab@kernel.org,
	linux-staging@lists.linux.dev,
	linux-media@vger.kernel.org,
	Lian Xiangyu <lin25001x@gmail.com>
Subject: [PATCH] staging: media: ipu7: remove 'U' suffix from register definitions
Date: Sat, 21 Mar 2026 22:31:32 +0800
Message-Id: <20260321143132.661290-1-lin25001x@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[intel.com,kernel.org,lists.linux.dev,vger.kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-56601-lists,linux-media=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lin25001x@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-media];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 911FF2E5D70
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The ipu7 driver's TODO specifies that the 'U' suffix should be
removed from hexadecimal and decimal values in register definitions.

This patch cleans up the definitions in the header files within the
ipu7 directory to comply with the requirements and improve consistency.

The modification was verified by comparing the disassembly of the
built-in.a archive before and after the change. The MD5 hashes of the
disassembly output remained identical, confirming that this is a
purely cosmetic cleanup with no functional impact on the binary.

Signed-off-by: Lian Xiangyu <lin25001x@gmail.com>
---
 .../staging/media/ipu7/abi/ipu7_fw_boot_abi.h | 104 +++++++++---------
 .../media/ipu7/abi/ipu7_fw_common_abi.h       |  40 +++----
 .../media/ipu7/abi/ipu7_fw_config_abi.h       |   4 +-
 .../staging/media/ipu7/abi/ipu7_fw_isys_abi.h |  26 ++---
 .../staging/media/ipu7/abi/ipu7_fw_msg_abi.h  |  82 +++++++-------
 .../media/ipu7/abi/ipu7_fw_syscom_abi.h       |   2 +-
 .../staging/media/ipu7/ipu7-buttress-regs.h   |  24 ++--
 .../staging/media/ipu7/ipu7-isys-csi-phy.h    |   4 +-
 .../staging/media/ipu7/ipu7-isys-csi2-regs.h  |  14 +--
 drivers/staging/media/ipu7/ipu7-isys-csi2.h   |  10 +-
 drivers/staging/media/ipu7/ipu7-isys-video.h  |   4 +-
 drivers/staging/media/ipu7/ipu7-isys.h        |  20 ++--
 drivers/staging/media/ipu7/ipu7.h             |  24 ++--
 13 files changed, 179 insertions(+), 179 deletions(-)

diff --git a/drivers/staging/media/ipu7/abi/ipu7_fw_boot_abi.h b/drivers/staging/media/ipu7/abi/ipu7_fw_boot_abi.h
index a1519c4fe66..795130a884b 100644
--- a/drivers/staging/media/ipu7/abi/ipu7_fw_boot_abi.h
+++ b/drivers/staging/media/ipu7/abi/ipu7_fw_boot_abi.h
@@ -9,13 +9,13 @@
 #include "ipu7_fw_common_abi.h"
 #include "ipu7_fw_syscom_abi.h"
 
-#define IA_GOFO_FWLOG_SEVERITY_CRIT			(0U)
-#define IA_GOFO_FWLOG_SEVERITY_ERROR			(1U)
-#define IA_GOFO_FWLOG_SEVERITY_WARNING			(2U)
-#define IA_GOFO_FWLOG_SEVERITY_INFO			(3U)
-#define IA_GOFO_FWLOG_SEVERITY_DEBUG			(4U)
-#define IA_GOFO_FWLOG_SEVERITY_VERBOSE			(5U)
-#define IA_GOFO_FWLOG_MAX_LOGGER_SOURCES		(64U)
+#define IA_GOFO_FWLOG_SEVERITY_CRIT			(0)
+#define IA_GOFO_FWLOG_SEVERITY_ERROR			(1)
+#define IA_GOFO_FWLOG_SEVERITY_WARNING			(2)
+#define IA_GOFO_FWLOG_SEVERITY_INFO			(3)
+#define IA_GOFO_FWLOG_SEVERITY_DEBUG			(4)
+#define IA_GOFO_FWLOG_SEVERITY_VERBOSE			(5)
+#define IA_GOFO_FWLOG_MAX_LOGGER_SOURCES		(64)
 
 #define LOGGER_CONFIG_CHANNEL_ENABLE_HWPRINTF_BITMASK	BIT(0)
 #define LOGGER_CONFIG_CHANNEL_ENABLE_SYSCOM_BITMASK	BIT(1)
@@ -37,22 +37,22 @@ struct ia_gofo_logger_config {
 
 #define IA_GOFO_BUTTRESS_FW_BOOT_PARAMS_MAX_REG_IDX_PER_APP \
 	((u32)IA_GOFO_FW_BOOT_ID_MAX)
-#define IA_GOFO_BUTTRESS_FW_BOOT_PARAMS_IS_OFFSET (0U)
+#define IA_GOFO_BUTTRESS_FW_BOOT_PARAMS_IS_OFFSET (0)
 #define IA_GOFO_BUTTRESS_FW_BOOT_PARAMS_PS_OFFSET \
 	((IA_GOFO_BUTTRESS_FW_BOOT_PARAMS_IS_OFFSET) + \
 	(u32)(IA_GOFO_BUTTRESS_FW_BOOT_PARAMS_MAX_REG_IDX_PER_APP))
-#define IA_GOFO_BUTTRESS_FW_BOOT_PARAMS_PRIMARY_OFFSET (0U)
-#define IA_GOFO_CCG_IPU_BUTTRESS_FW_BOOT_PARAMS_SECONDARY_OFFSET (0x3000U / 4U)
+#define IA_GOFO_BUTTRESS_FW_BOOT_PARAMS_PRIMARY_OFFSET (0)
+#define IA_GOFO_CCG_IPU_BUTTRESS_FW_BOOT_PARAMS_SECONDARY_OFFSET (0x3000 / 4)
 #define IA_GOFO_HKR_IPU_BUTTRESS_FW_BOOT_PARAMS_SECONDARY_OFFSET \
-	(IA_GOFO_BUTTRESS_FW_BOOT_PARAMS_MAX_REG_IDX_PER_APP * 2U)
+	(IA_GOFO_BUTTRESS_FW_BOOT_PARAMS_MAX_REG_IDX_PER_APP * 2)
 #define IA_GOFO_HKR_HIF_BUTTRESS_FW_BOOT_PARAMS_SECONDARY_OFFSET \
 	(IA_GOFO_BUTTRESS_FW_BOOT_PARAMS_MAX_REG_IDX_PER_APP)
 #define IA_GOFO_CCG_IPU_BUTTRESS_FW_BOOT_PARAMS_MAX_REG_IDX \
-	(IA_GOFO_BUTTRESS_FW_BOOT_PARAMS_MAX_REG_IDX_PER_APP * 4U)
+	(IA_GOFO_BUTTRESS_FW_BOOT_PARAMS_MAX_REG_IDX_PER_APP * 4)
 #define IA_GOFO_HKR_IPU_BUTTRESS_FW_BOOT_PARAMS_MAX_REG_IDX \
-	(IA_GOFO_BUTTRESS_FW_BOOT_PARAMS_MAX_REG_IDX_PER_APP * 4U)
+	(IA_GOFO_BUTTRESS_FW_BOOT_PARAMS_MAX_REG_IDX_PER_APP * 4)
 
-#define IA_GOFO_BOOT_RESERVED_SIZE (58U)
+#define IA_GOFO_BOOT_RESERVED_SIZE (58)
 #define IA_GOFO_BOOT_SECONDARY_RESERVED_SIZE (IA_GOFO_BOOT_RESERVED_SIZE)
 #define IA_GOFO_BOOT_SECONDARY_RESERVED_FIELDS \
 	(sizeof(ia_gofo_addr_t) + sizeof(ia_gofo_addr_t) + sizeof(u32))
@@ -75,7 +75,7 @@ enum ia_gofo_boot_uc_tile_frequency_units {
 };
 
 #define IA_GOFO_FW_BOOT_STATE_IS_CRITICAL(boot_state) \
-	(0xdead0000U == ((boot_state) & 0xffff0000U))
+	(0xdead0000 == ((boot_state) & 0xffff0000))
 
 struct ia_gofo_boot_config {
 	u32 length;
@@ -104,35 +104,35 @@ struct ia_gofo_secondary_boot_config {
 
 #pragma pack(pop)
 
-#define IA_GOFO_WDT_TIMEOUT_ERR			0xdead0401U
-#define IA_GOFO_MEM_FATAL_DME_ERR		0xdead0801U
-#define IA_GOFO_MEM_UNCORRECTABLE_LOCAL_ERR	0xdead0802U
-#define IA_GOFO_MEM_UNCORRECTABLE_DIRTY_ERR	0xdead0803U
-#define IA_GOFO_MEM_UNCORRECTABLE_DTAG_ERR	0xdead0804U
-#define IA_GOFO_MEM_UNCORRECTABLE_CACHE_ERR	0xdead0805U
-#define IA_GOFO_DOUBLE_EXCEPTION_ERR		0xdead0806U
-#define IA_GOFO_BIST_DMEM_FAULT_DETECTION_ERR	0xdead1000U
-#define IA_GOFO_BIST_DATA_INTEGRITY_FAILURE	0xdead1010U
+#define IA_GOFO_WDT_TIMEOUT_ERR			0xdead0401
+#define IA_GOFO_MEM_FATAL_DME_ERR		0xdead0801
+#define IA_GOFO_MEM_UNCORRECTABLE_LOCAL_ERR	0xdead0802
+#define IA_GOFO_MEM_UNCORRECTABLE_DIRTY_ERR	0xdead0803
+#define IA_GOFO_MEM_UNCORRECTABLE_DTAG_ERR	0xdead0804
+#define IA_GOFO_MEM_UNCORRECTABLE_CACHE_ERR	0xdead0805
+#define IA_GOFO_DOUBLE_EXCEPTION_ERR		0xdead0806
+#define IA_GOFO_BIST_DMEM_FAULT_DETECTION_ERR	0xdead1000
+#define IA_GOFO_BIST_DATA_INTEGRITY_FAILURE	0xdead1010
 
 enum ia_gofo_boot_state {
-	IA_GOFO_FW_BOOT_STATE_SECONDARY_BOOT_CONFIG_READY = 0x57a7b000U,
-	IA_GOFO_FW_BOOT_STATE_UNINIT = 0x57a7e000U,
-	IA_GOFO_FW_BOOT_STATE_STARTING_0 = 0x57a7d000U,
-	IA_GOFO_FW_BOOT_STATE_CACHE_INIT_DONE = 0x57a7d010U,
-	IA_GOFO_FW_BOOT_STATE_MEM_INIT_DONE = 0x57a7d020U,
-	IA_GOFO_FW_BOOT_STATE_STACK_INIT_DONE = 0x57a7d030U,
-	IA_GOFO_FW_BOOT_STATE_EARLY_BOOT_DONE = 0x57a7d100U,
-	IA_GOFO_FW_BOOT_STATE_BOOT_CONFIG_START = 0x57a7d200U,
-	IA_GOFO_FW_BOOT_STATE_QUEUE_INIT_DONE = 0x57a7d300U,
-	IA_GOFO_FW_BOOT_STATE_READY = 0x57a7e100U,
-	IA_GOFO_FW_BOOT_STATE_CRIT_UNSPECIFIED = 0xdead0001U,
-	IA_GOFO_FW_BOOT_STATE_CRIT_CFG_PTR = 0xdead0101U,
-	IA_GOFO_FW_BOOT_STATE_CRIT_CFG_VERSION = 0xdead0201U,
-	IA_GOFO_FW_BOOT_STATE_CRIT_MSG_VERSION = 0xdead0301U,
+	IA_GOFO_FW_BOOT_STATE_SECONDARY_BOOT_CONFIG_READY = 0x57a7b000,
+	IA_GOFO_FW_BOOT_STATE_UNINIT = 0x57a7e000,
+	IA_GOFO_FW_BOOT_STATE_STARTING_0 = 0x57a7d000,
+	IA_GOFO_FW_BOOT_STATE_CACHE_INIT_DONE = 0x57a7d010,
+	IA_GOFO_FW_BOOT_STATE_MEM_INIT_DONE = 0x57a7d020,
+	IA_GOFO_FW_BOOT_STATE_STACK_INIT_DONE = 0x57a7d030,
+	IA_GOFO_FW_BOOT_STATE_EARLY_BOOT_DONE = 0x57a7d100,
+	IA_GOFO_FW_BOOT_STATE_BOOT_CONFIG_START = 0x57a7d200,
+	IA_GOFO_FW_BOOT_STATE_QUEUE_INIT_DONE = 0x57a7d300,
+	IA_GOFO_FW_BOOT_STATE_READY = 0x57a7e100,
+	IA_GOFO_FW_BOOT_STATE_CRIT_UNSPECIFIED = 0xdead0001,
+	IA_GOFO_FW_BOOT_STATE_CRIT_CFG_PTR = 0xdead0101,
+	IA_GOFO_FW_BOOT_STATE_CRIT_CFG_VERSION = 0xdead0201,
+	IA_GOFO_FW_BOOT_STATE_CRIT_MSG_VERSION = 0xdead0301,
 	IA_GOFO_FW_BOOT_STATE_CRIT_WDT_TIMEOUT = IA_GOFO_WDT_TIMEOUT_ERR,
-	IA_GOFO_FW_BOOT_STATE_WRONG_DATA_SECTION_UNPACKING = 0xdead0501U,
-	IA_GOFO_FW_BOOT_STATE_WRONG_RO_DATA_SECTION_UNPACKING = 0xdead0601U,
-	IA_GOFO_FW_BOOT_STATE_INVALID_UNTRUSTED_ADDR_MIN = 0xdead0701U,
+	IA_GOFO_FW_BOOT_STATE_WRONG_DATA_SECTION_UNPACKING = 0xdead0501,
+	IA_GOFO_FW_BOOT_STATE_WRONG_RO_DATA_SECTION_UNPACKING = 0xdead0601,
+	IA_GOFO_FW_BOOT_STATE_INVALID_UNTRUSTED_ADDR_MIN = 0xdead0701,
 	IA_GOFO_FW_BOOT_STATE_CRIT_MEM_FATAL_DME = IA_GOFO_MEM_FATAL_DME_ERR,
 	IA_GOFO_FW_BOOT_STATE_CRIT_MEM_UNCORRECTABLE_LOCAL =
 	IA_GOFO_MEM_UNCORRECTABLE_LOCAL_ERR,
@@ -146,18 +146,18 @@ enum ia_gofo_boot_state {
 	IA_GOFO_DOUBLE_EXCEPTION_ERR,
 	IA_GOFO_FW_BOOT_STATE_CRIT_BIST_DMEM_FAULT_DETECTION_ERR =
 	IA_GOFO_BIST_DMEM_FAULT_DETECTION_ERR,
-	IA_GOFO_FW_BOOT_STATE_CRIT_DATA_INTEGRITY_FAILURE = 0xdead1010U,
-	IA_GOFO_FW_BOOT_STATE_CRIT_STACK_CHK_FAILURE = 0xdead1011U,
+	IA_GOFO_FW_BOOT_STATE_CRIT_DATA_INTEGRITY_FAILURE = 0xdead1010,
+	IA_GOFO_FW_BOOT_STATE_CRIT_STACK_CHK_FAILURE = 0xdead1011,
 	IA_GOFO_FW_BOOT_STATE_CRIT_SYSCOM_CONTEXT_INTEGRITY_FAILURE =
-	0xdead1012U,
-	IA_GOFO_FW_BOOT_STATE_CRIT_MPU_CONFIG_FAILURE = 0xdead1013U,
-	IA_GOFO_FW_BOOT_STATE_CRIT_SHARED_BUFFER_FAILURE = 0xdead1014U,
-	IA_GOFO_FW_BOOT_STATE_CRIT_CMEM_FAILURE = 0xdead1015U,
-	IA_GOFO_FW_BOOT_STATE_SHUTDOWN_CMD = 0x57a7f001U,
-	IA_GOFO_FW_BOOT_STATE_SHUTDOWN_START = 0x57a7e200U,
-	IA_GOFO_FW_BOOT_STATE_INACTIVE = 0x57a7e300U,
-	IA_GOFO_FW_BOOT_HW_CMD_ACK_TIMEOUT = 0x57a7e400U,
-	IA_GOFO_FW_BOOT_SYSTEM_CYCLES_ERROR = 0x57a7e500U
+	0xdead1012,
+	IA_GOFO_FW_BOOT_STATE_CRIT_MPU_CONFIG_FAILURE = 0xdead1013,
+	IA_GOFO_FW_BOOT_STATE_CRIT_SHARED_BUFFER_FAILURE = 0xdead1014,
+	IA_GOFO_FW_BOOT_STATE_CRIT_CMEM_FAILURE = 0xdead1015,
+	IA_GOFO_FW_BOOT_STATE_SHUTDOWN_CMD = 0x57a7f001,
+	IA_GOFO_FW_BOOT_STATE_SHUTDOWN_START = 0x57a7e200,
+	IA_GOFO_FW_BOOT_STATE_INACTIVE = 0x57a7e300,
+	IA_GOFO_FW_BOOT_HW_CMD_ACK_TIMEOUT = 0x57a7e400,
+	IA_GOFO_FW_BOOT_SYSTEM_CYCLES_ERROR = 0x57a7e500
 };
 
 #endif
diff --git a/drivers/staging/media/ipu7/abi/ipu7_fw_common_abi.h b/drivers/staging/media/ipu7/abi/ipu7_fw_common_abi.h
index 7bb6fac585a..32c0965241c 100644
--- a/drivers/staging/media/ipu7/abi/ipu7_fw_common_abi.h
+++ b/drivers/staging/media/ipu7/abi/ipu7_fw_common_abi.h
@@ -11,7 +11,7 @@
 #pragma pack(push, 1)
 typedef u32	ia_gofo_addr_t;
 
-#define IA_GOFO_ADDR_NULL	(0U)
+#define IA_GOFO_ADDR_NULL	(0)
 
 struct ia_gofo_version_s {
 	u8 patch;
@@ -24,8 +24,8 @@ struct ia_gofo_version_s {
 	{.major = (major_val), .minor = (minor_val), .subminor = \
 	(subminor_val), .patch = (patch_val)}
 
-#define IA_GOFO_MSG_VERSION_LIST_MAX_ENTRIES	(3U)
-#define IA_GOFO_MSG_RESERVED_SIZE		(3U)
+#define IA_GOFO_MSG_VERSION_LIST_MAX_ENTRIES	(3)
+#define IA_GOFO_MSG_RESERVED_SIZE		(3)
 
 struct ia_gofo_msg_version_list {
 	u8 num_versions;
@@ -35,11 +35,11 @@ struct ia_gofo_msg_version_list {
 
 #pragma pack(pop)
 
-#define TLV_TYPE_PADDING		(0U)
+#define TLV_TYPE_PADDING		(0)
 
 #pragma pack(push, 1)
 
-#define IA_GOFO_ABI_BITS_PER_BYTE	(8U)
+#define IA_GOFO_ABI_BITS_PER_BYTE	(8)
 
 struct ia_gofo_tlv_header {
 	u16 tlv_type;
@@ -58,10 +58,10 @@ struct ia_gofo_tlv_list {
 
 #define IA_GOFO_MODULO(dividend, divisor) ((dividend) % (divisor))
 
-#define IA_GOFO_MSG_ERR_MAX_DETAILS		(4U)
-#define IA_GOFO_MSG_ERR_OK			(0U)
-#define IA_GOFO_MSG_ERR_UNSPECIFED		(0xffffffffU)
-#define IA_GOFO_MSG_ERR_GROUP_UNSPECIFIED	(0U)
+#define IA_GOFO_MSG_ERR_MAX_DETAILS		(4)
+#define IA_GOFO_MSG_ERR_OK			(0)
+#define IA_GOFO_MSG_ERR_UNSPECIFED		(0xffffffff)
+#define IA_GOFO_MSG_ERR_GROUP_UNSPECIFIED	(0)
 #define IA_GOFO_MSG_ERR_IS_OK(err)	(IA_GOFO_MSG_ERR_OK == (err).err_code)
 
 #pragma pack(push, 1)
@@ -73,9 +73,9 @@ struct ia_gofo_msg_err {
 
 #pragma pack(pop)
 
-#define IA_GOFO_MSG_ERR_GROUP_APP_EXT_START	(16U)
-#define IA_GOFO_MSG_ERR_GROUP_MAX		(31U)
-#define IA_GOFO_MSG_ERR_GROUP_INTERNAL_START	(IA_GOFO_MSG_ERR_GROUP_MAX + 1U)
+#define IA_GOFO_MSG_ERR_GROUP_APP_EXT_START	(16)
+#define IA_GOFO_MSG_ERR_GROUP_MAX		(31)
+#define IA_GOFO_MSG_ERR_GROUP_INTERNAL_START	(IA_GOFO_MSG_ERR_GROUP_MAX + 1)
 #define IA_GOFO_MSG_ERR_GROUP_RESERVED	IA_GOFO_MSG_ERR_GROUP_UNSPECIFIED
 #define IA_GOFO_MSG_ERR_GROUP_GENERAL		1
 
@@ -130,7 +130,7 @@ enum ia_gofo_soc_pbk_instance_id {
 	IA_GOFO_SOC_PBK_ID_N
 };
 
-#define IA_GOFO_MSG_LINK_PBK_MAX_SLOTS	(2U)
+#define IA_GOFO_MSG_LINK_PBK_MAX_SLOTS	(2)
 
 struct ia_gofo_msg_indirect {
 	struct ia_gofo_msg_header header;
@@ -141,11 +141,11 @@ struct ia_gofo_msg_indirect {
 #pragma pack(pop)
 
 #pragma pack(push, 1)
-#define IA_GOFO_MSG_LOG_MAX_PARAMS	(4U)
-#define IA_GOFO_MSG_LOG_DOC_FMT_ID_MIN	(0U)
+#define IA_GOFO_MSG_LOG_MAX_PARAMS	(4)
+#define IA_GOFO_MSG_LOG_DOC_FMT_ID_MIN	(0)
 
-#define IA_GOFO_MSG_LOG_DOC_FMT_ID_MAX	(4095U)
-#define IA_GOFO_MSG_LOG_FMT_ID_INVALID	(0xfffffffU)
+#define IA_GOFO_MSG_LOG_DOC_FMT_ID_MAX	(4095)
+#define IA_GOFO_MSG_LOG_FMT_ID_INVALID	(0xfffffff)
 
 struct ia_gofo_msg_log_info {
 	u16 log_counter;
@@ -168,8 +168,8 @@ struct ia_gofo_msg_log {
 
 #pragma pack(pop)
 
-#define IA_GOFO_MSG_ABI_OUT_ACK_QUEUE_ID	(0U)
-#define IA_GOFO_MSG_ABI_OUT_LOG_QUEUE_ID	(1U)
-#define IA_GOFO_MSG_ABI_IN_DEV_QUEUE_ID		(2U)
+#define IA_GOFO_MSG_ABI_OUT_ACK_QUEUE_ID	(0)
+#define IA_GOFO_MSG_ABI_OUT_LOG_QUEUE_ID	(1)
+#define IA_GOFO_MSG_ABI_IN_DEV_QUEUE_ID		(2)
 
 #endif
diff --git a/drivers/staging/media/ipu7/abi/ipu7_fw_config_abi.h b/drivers/staging/media/ipu7/abi/ipu7_fw_config_abi.h
index c3f62aaedd8..3bbf5417fd0 100644
--- a/drivers/staging/media/ipu7/abi/ipu7_fw_config_abi.h
+++ b/drivers/staging/media/ipu7/abi/ipu7_fw_config_abi.h
@@ -8,8 +8,8 @@
 
 #include <linux/types.h>
 
-#define IPU_CONFIG_ABI_WDT_TIMER_DISABLED	0U
-#define IPU_CONFIG_ABI_CMD_TIMER_DISABLED	0U
+#define IPU_CONFIG_ABI_WDT_TIMER_DISABLED	0
+#define IPU_CONFIG_ABI_CMD_TIMER_DISABLED	0
 
 struct ipu7_wdt_abi {
 	u32 wdt_timer1_us;
diff --git a/drivers/staging/media/ipu7/abi/ipu7_fw_isys_abi.h b/drivers/staging/media/ipu7/abi/ipu7_fw_isys_abi.h
index c42d0b7a262..905cf7bd95f 100644
--- a/drivers/staging/media/ipu7/abi/ipu7_fw_isys_abi.h
+++ b/drivers/staging/media/ipu7/abi/ipu7_fw_isys_abi.h
@@ -9,26 +9,26 @@
 #include "ipu7_fw_common_abi.h"
 #include "ipu7_fw_isys_abi.h"
 
-#define IPU_INSYS_MAX_OUTPUT_QUEUES	(3U)
-#define IPU_INSYS_STREAM_ID_MAX		(16U)
+#define IPU_INSYS_MAX_OUTPUT_QUEUES	(3)
+#define IPU_INSYS_STREAM_ID_MAX		(16)
 
-#define IPU_INSYS_MAX_INPUT_QUEUES	(IPU_INSYS_STREAM_ID_MAX + 1U)
-#define IPU_INSYS_OUTPUT_FIRST_QUEUE	(0U)
-#define IPU_INSYS_OUTPUT_LAST_QUEUE	(IPU_INSYS_MAX_OUTPUT_QUEUES - 1U)
+#define IPU_INSYS_MAX_INPUT_QUEUES	(IPU_INSYS_STREAM_ID_MAX + 1)
+#define IPU_INSYS_OUTPUT_FIRST_QUEUE	(0)
+#define IPU_INSYS_OUTPUT_LAST_QUEUE	(IPU_INSYS_MAX_OUTPUT_QUEUES - 1)
 #define IPU_INSYS_OUTPUT_MSG_QUEUE	(IPU_INSYS_OUTPUT_FIRST_QUEUE)
-#define IPU_INSYS_OUTPUT_LOG_QUEUE	(IPU_INSYS_OUTPUT_FIRST_QUEUE + 1U)
+#define IPU_INSYS_OUTPUT_LOG_QUEUE	(IPU_INSYS_OUTPUT_FIRST_QUEUE + 1)
 #define IPU_INSYS_OUTPUT_RESERVED_QUEUE	(IPU_INSYS_OUTPUT_LAST_QUEUE)
 #define IPU_INSYS_INPUT_FIRST_QUEUE	(IPU_INSYS_MAX_OUTPUT_QUEUES)
 #define IPU_INSYS_INPUT_LAST_QUEUE \
-	(IPU_INSYS_INPUT_FIRST_QUEUE + IPU_INSYS_MAX_INPUT_QUEUES - 1U)
+	(IPU_INSYS_INPUT_FIRST_QUEUE + IPU_INSYS_MAX_INPUT_QUEUES - 1)
 #define IPU_INSYS_INPUT_DEV_QUEUE	(IPU_INSYS_INPUT_FIRST_QUEUE)
-#define IPU_INSYS_INPUT_MSG_QUEUE	(IPU_INSYS_INPUT_FIRST_QUEUE + 1U)
-#define IPU_INSYS_INPUT_MSG_MAX_QUEUE	(IPU_INSYS_MAX_INPUT_QUEUES - 1U)
+#define IPU_INSYS_INPUT_MSG_QUEUE	(IPU_INSYS_INPUT_FIRST_QUEUE + 1)
+#define IPU_INSYS_INPUT_MSG_MAX_QUEUE	(IPU_INSYS_MAX_INPUT_QUEUES - 1)
 
-#define MAX_OPINS_FOR_SINGLE_IPINS	(3U)
+#define MAX_OPINS_FOR_SINGLE_IPINS	(3)
 #define DEV_SEND_QUEUE_SIZE		(IPU_INSYS_STREAM_ID_MAX)
 
-#define PIN_PLANES_MAX			(4U)
+#define PIN_PLANES_MAX			(4)
 
 #define INSYS_MSG_ERR_STREAM_INSUFFICIENT_RESOURCES_INPUT \
 	INSYS_MSG_ERR_STREAM_INSUFFICIENT_RESOURCES
@@ -138,8 +138,8 @@ enum ipu7_insys_mipi_dt_rename_mode {
 	N_IPU_INSYS_MIPI_DT_MODE
 };
 
-#define IPU_INSYS_SEND_MSG_ENABLED				1U
-#define IPU_INSYS_SEND_MSG_DISABLED				0U
+#define IPU_INSYS_SEND_MSG_ENABLED				1
+#define IPU_INSYS_SEND_MSG_DISABLED				0
 
 #define IPU_INSYS_STREAM_SYNC_MSG_SEND_RESP_SOF			BIT(0)
 #define IPU_INSYS_STREAM_SYNC_MSG_SEND_RESP_EOF			BIT(1)
diff --git a/drivers/staging/media/ipu7/abi/ipu7_fw_msg_abi.h b/drivers/staging/media/ipu7/abi/ipu7_fw_msg_abi.h
index 8a78dd0936d..35c21ce5166 100644
--- a/drivers/staging/media/ipu7/abi/ipu7_fw_msg_abi.h
+++ b/drivers/staging/media/ipu7/abi/ipu7_fw_msg_abi.h
@@ -28,8 +28,8 @@ enum ipu7_msg_type {
 	IPU_MSG_TYPE_N,
 };
 
-#define IPU_MSG_MAX_NODE_TERMS		(64U)
-#define IPU_MSG_MAX_FRAGS		(7U)
+#define IPU_MSG_MAX_NODE_TERMS		(64)
+#define IPU_MSG_MAX_FRAGS		(7)
 
 enum ipu7_msg_node_type {
 	IPU_MSG_NODE_TYPE_PAD = 0,
@@ -37,14 +37,14 @@ enum ipu7_msg_node_type {
 	IPU_MSG_NODE_TYPE_N
 };
 
-#define IPU_MSG_NODE_MAX_DEVICES	(128U)
-#define DEB_NUM_UINT32	(IPU_MSG_NODE_MAX_DEVICES / (sizeof(u32) * 8U))
+#define IPU_MSG_NODE_MAX_DEVICES	(128)
+#define DEB_NUM_UINT32	(IPU_MSG_NODE_MAX_DEVICES / (sizeof(u32) * 8))
 
 typedef u32 ipu7_msg_teb_t[2];
 typedef u32 ipu7_msg_deb_t[DEB_NUM_UINT32];
 
-#define IPU_MSG_NODE_MAX_ROUTE_ENABLES	(128U)
-#define RBM_NUM_UINT32	(IPU_MSG_NODE_MAX_ROUTE_ENABLES / (sizeof(u32) * 8U))
+#define IPU_MSG_NODE_MAX_ROUTE_ENABLES	(128)
+#define RBM_NUM_UINT32	(IPU_MSG_NODE_MAX_ROUTE_ENABLES / (sizeof(u32) * 8))
 
 typedef u32 ipu7_msg_rbm_t[RBM_NUM_UINT32];
 
@@ -67,13 +67,13 @@ struct ipu7_msg_cb_profile {
 	ipu7_msg_rbm_t reb;
 };
 
-#define IPU_MSG_NODE_MAX_PROFILES	(2U)
-#define IPU_MSG_NODE_DEF_PROFILE_IDX	(0U)
-#define IPU_MSG_NODE_RSRC_ID_EXT_IP	(0xffU)
+#define IPU_MSG_NODE_MAX_PROFILES	(2)
+#define IPU_MSG_NODE_DEF_PROFILE_IDX	(0)
+#define IPU_MSG_NODE_RSRC_ID_EXT_IP	(0xff)
 
-#define IPU_MSG_NODE_DONT_CARE_TEB_HI	(0xffffffffU)
-#define IPU_MSG_NODE_DONT_CARE_TEB_LO	(0xffffffffU)
-#define IPU_MSG_NODE_RSRC_ID_IS		(0xfeU)
+#define IPU_MSG_NODE_DONT_CARE_TEB_HI	(0xffffffff)
+#define IPU_MSG_NODE_DONT_CARE_TEB_LO	(0xffffffff)
+#define IPU_MSG_NODE_RSRC_ID_IS		(0xfe)
 
 struct ipu7_msg_node {
 	struct ia_gofo_tlv_header tlv_header;
@@ -113,10 +113,10 @@ enum ipu7_msg_link_cmprs_option_bit_depth {
 	IPU_MSG_LINK_CMPRS_OPTION_12BPP = 2,
 };
 
-#define IPU_MSG_LINK_CMPRS_SPACE_SAVING_DENOM		(128U)
-#define IPU_MSG_LINK_CMPRS_LOSSY_CFG_PAYLOAD_SIZE	(5U)
+#define IPU_MSG_LINK_CMPRS_SPACE_SAVING_DENOM		(128)
+#define IPU_MSG_LINK_CMPRS_LOSSY_CFG_PAYLOAD_SIZE	(5)
 #define IPU_MSG_LINK_CMPRS_SPACE_SAVING_NUM_MAX \
-	(IPU_MSG_LINK_CMPRS_SPACE_SAVING_DENOM - 1U)
+	(IPU_MSG_LINK_CMPRS_SPACE_SAVING_DENOM - 1)
 
 struct ipu7_msg_link_cmprs_plane_desc {
 	u8 plane_enable;
@@ -134,10 +134,10 @@ struct ipu7_msg_link_cmprs_plane_desc {
 	u32 lossy_cfg[IPU_MSG_LINK_CMPRS_LOSSY_CFG_PAYLOAD_SIZE];
 };
 
-#define IPU_MSG_LINK_CMPRS_MAX_PLANES		(2U)
-#define IPU_MSG_LINK_CMPRS_NO_ALIGN_INTERVAL	(0U)
-#define IPU_MSG_LINK_CMPRS_MIN_ALIGN_INTERVAL	(16U)
-#define IPU_MSG_LINK_CMPRS_MAX_ALIGN_INTERVAL	(1024U)
+#define IPU_MSG_LINK_CMPRS_MAX_PLANES		(2)
+#define IPU_MSG_LINK_CMPRS_NO_ALIGN_INTERVAL	(0)
+#define IPU_MSG_LINK_CMPRS_MIN_ALIGN_INTERVAL	(16)
+#define IPU_MSG_LINK_CMPRS_MAX_ALIGN_INTERVAL	(1024)
 struct ipu7_msg_link_cmprs_option {
 	struct ia_gofo_tlv_header header;
 	u32 cmprs_buf_size;
@@ -156,11 +156,11 @@ struct ipu7_msg_link_ep_pair {
 	struct ipu7_msg_link_ep ep_dst;
 };
 
-#define IPU_MSG_LINK_FOREIGN_KEY_NONE		(65535U)
-#define IPU_MSG_LINK_FOREIGN_KEY_MAX		(64U)
-#define IPU_MSG_LINK_PBK_ID_DONT_CARE		(255U)
-#define IPU_MSG_LINK_PBK_SLOT_ID_DONT_CARE	(255U)
-#define IPU_MSG_LINK_TERM_ID_DONT_CARE		(0xffU)
+#define IPU_MSG_LINK_FOREIGN_KEY_NONE		(65535)
+#define IPU_MSG_LINK_FOREIGN_KEY_MAX		(64)
+#define IPU_MSG_LINK_PBK_ID_DONT_CARE		(255)
+#define IPU_MSG_LINK_PBK_SLOT_ID_DONT_CARE	(255)
+#define IPU_MSG_LINK_TERM_ID_DONT_CARE		(0xff)
 
 struct ipu7_msg_link {
 	struct ia_gofo_tlv_header tlv_header;
@@ -258,9 +258,9 @@ enum ipu7_msg_term_type {
 	IPU_MSG_TERM_TYPE_N,
 };
 
-#define IPU_MSG_TERM_EVENT_TYPE_NONE		0U
-#define IPU_MSG_TERM_EVENT_TYPE_PROGRESS	1U
-#define IPU_MSG_TERM_EVENT_TYPE_N	(IPU_MSG_TERM_EVENT_TYPE_PROGRESS + 1U)
+#define IPU_MSG_TERM_EVENT_TYPE_NONE		0
+#define IPU_MSG_TERM_EVENT_TYPE_PROGRESS	1
+#define IPU_MSG_TERM_EVENT_TYPE_N	(IPU_MSG_TERM_EVENT_TYPE_PROGRESS + 1)
 
 struct ipu7_msg_term {
 	struct ia_gofo_tlv_header tlv_header;
@@ -292,8 +292,8 @@ struct ipu7_msg_term_event {
 #pragma pack(pop)
 
 #pragma pack(push, 1)
-#define IPU_MSG_DEVICE_SEND_MSG_ENABLED		1U
-#define IPU_MSG_DEVICE_SEND_MSG_DISABLED	0U
+#define IPU_MSG_DEVICE_SEND_MSG_ENABLED		1
+#define IPU_MSG_DEVICE_SEND_MSG_DISABLED	0
 
 #define IPU_MSG_DEVICE_OPEN_SEND_RESP		BIT(0)
 #define IPU_MSG_DEVICE_OPEN_SEND_IRQ		BIT(1)
@@ -333,9 +333,9 @@ enum ipu7_msg_err_device {
 #pragma pack(pop)
 
 #pragma pack(push, 1)
-#define IPU_MSG_GRAPH_ID_UNKNOWN	(0xffU)
-#define IPU_MSG_GRAPH_SEND_MSG_ENABLED	1U
-#define IPU_MSG_GRAPH_SEND_MSG_DISABLED	0U
+#define IPU_MSG_GRAPH_ID_UNKNOWN	(0xff)
+#define IPU_MSG_GRAPH_SEND_MSG_ENABLED	1
+#define IPU_MSG_GRAPH_SEND_MSG_DISABLED	0
 
 #define IPU_MSG_GRAPH_OPEN_SEND_RESP	BIT(0)
 #define IPU_MSG_GRAPH_OPEN_SEND_IRQ	BIT(1)
@@ -429,8 +429,8 @@ enum ipu7_msg_err_graph {
 
 #pragma pack(pop)
 
-#define FWPS_MSG_ABI_MAX_INPUT_QUEUES	(60U)
-#define FWPS_MSG_ABI_MAX_OUTPUT_QUEUES	(2U)
+#define FWPS_MSG_ABI_MAX_INPUT_QUEUES	(60)
+#define FWPS_MSG_ABI_MAX_OUTPUT_QUEUES	(2)
 #define FWPS_MSG_ABI_MAX_QUEUES \
 	(FWPS_MSG_ABI_MAX_OUTPUT_QUEUES + FWPS_MSG_ABI_MAX_INPUT_QUEUES)
 
@@ -441,25 +441,25 @@ enum ipu7_msg_err_graph {
 queues"
 #endif
 #define FWPS_MSG_ABI_IN_DEV_QUEUE_ID	(IA_GOFO_MSG_ABI_IN_DEV_QUEUE_ID)
-#define FWPS_MSG_ABI_IN_RESERVED_QUEUE_ID	(3U)
+#define FWPS_MSG_ABI_IN_RESERVED_QUEUE_ID	(3)
 #define FWPS_MSG_ABI_IN_FIRST_TASK_QUEUE_ID \
-	(FWPS_MSG_ABI_IN_RESERVED_QUEUE_ID + 1U)
+	(FWPS_MSG_ABI_IN_RESERVED_QUEUE_ID + 1)
 
 #if (FWPS_MSG_ABI_IN_FIRST_TASK_QUEUE_ID >= FWPS_MSG_ABI_MAX_INPUT_QUEUES)
 #error "Maximum queues configuration is too small to fit minimum number of \
 useful queues"
 #endif
 
-#define FWPS_MSG_ABI_IN_LAST_TASK_QUEUE_ID	(FWPS_MSG_ABI_MAX_QUEUES - 1U)
+#define FWPS_MSG_ABI_IN_LAST_TASK_QUEUE_ID	(FWPS_MSG_ABI_MAX_QUEUES - 1)
 #define FWPS_MSG_ABI_IN_MAX_TASK_QUEUES \
 	(FWPS_MSG_ABI_IN_LAST_TASK_QUEUE_ID - \
-	FWPS_MSG_ABI_IN_FIRST_TASK_QUEUE_ID + 1U)
+	FWPS_MSG_ABI_IN_FIRST_TASK_QUEUE_ID + 1)
 #define FWPS_MSG_ABI_OUT_FIRST_QUEUE_ID		(FWPS_MSG_ABI_OUT_ACK_QUEUE_ID)
-#define FWPS_MSG_ABI_OUT_LAST_QUEUE_ID	(FWPS_MSG_ABI_MAX_OUTPUT_QUEUES - 1U)
+#define FWPS_MSG_ABI_OUT_LAST_QUEUE_ID	(FWPS_MSG_ABI_MAX_OUTPUT_QUEUES - 1)
 #define FWPS_MSG_ABI_IN_FIRST_QUEUE_ID		(FWPS_MSG_ABI_IN_DEV_QUEUE_ID)
 #define FWPS_MSG_ABI_IN_LAST_QUEUE_ID	(FWPS_MSG_ABI_IN_LAST_TASK_QUEUE_ID)
 
-#define FWPS_MSG_HOST2FW_MAX_SIZE	(2U * 1024U)
-#define FWPS_MSG_FW2HOST_MAX_SIZE	(256U)
+#define FWPS_MSG_HOST2FW_MAX_SIZE	(2 * 1024)
+#define FWPS_MSG_FW2HOST_MAX_SIZE	(256)
 
 #endif
diff --git a/drivers/staging/media/ipu7/abi/ipu7_fw_syscom_abi.h b/drivers/staging/media/ipu7/abi/ipu7_fw_syscom_abi.h
index bfa5258d5b9..64e61209144 100644
--- a/drivers/staging/media/ipu7/abi/ipu7_fw_syscom_abi.h
+++ b/drivers/staging/media/ipu7/abi/ipu7_fw_syscom_abi.h
@@ -11,7 +11,7 @@
 #include "ipu7_fw_common_abi.h"
 
 #pragma pack(push, 1)
-#define SYSCOM_QUEUE_MIN_CAPACITY	2U
+#define SYSCOM_QUEUE_MIN_CAPACITY	2
 
 struct syscom_queue_params_config {
 	ia_gofo_addr_t token_array_mem;
diff --git a/drivers/staging/media/ipu7/ipu7-buttress-regs.h b/drivers/staging/media/ipu7/ipu7-buttress-regs.h
index 3eafd6a3813..e95982e4eed 100644
--- a/drivers/staging/media/ipu7/ipu7-buttress-regs.h
+++ b/drivers/staging/media/ipu7/ipu7-buttress-regs.h
@@ -178,7 +178,7 @@
 #define BUTTRESS_REG_FW_BOOT_PARAMS15				0x403c
 
 #define BUTTRESS_FW_BOOT_PARAMS_ENTRY(i) \
-	(BUTTRESS_REG_FW_BOOT_PARAMS0 + ((i) * 4U))
+	(BUTTRESS_REG_FW_BOOT_PARAMS0 + ((i) * 4))
 #define BUTTRESS_REG_FW_GP(i)				(0x4040 + 0x4 * (i))
 #define BUTTRESS_REG_FPGA_SUPPORT(i)			(0x40c0 + 0x4 * (i))
 
@@ -280,14 +280,14 @@
 #define BUTTRESS_IRQ_PS_IRQ				BIT(31)
 
 /* buttress irq */
-#define	BUTTRESS_PWR_STATUS_HH_STATE_IDLE	0U
-#define	BUTTRESS_PWR_STATUS_HH_STATE_IN_PRGS	1U
-#define	BUTTRESS_PWR_STATUS_HH_STATE_DONE	2U
-#define	BUTTRESS_PWR_STATUS_HH_STATE_ERR	3U
+#define	BUTTRESS_PWR_STATUS_HH_STATE_IDLE	0
+#define	BUTTRESS_PWR_STATUS_HH_STATE_IN_PRGS	1
+#define	BUTTRESS_PWR_STATUS_HH_STATE_DONE	2
+#define	BUTTRESS_PWR_STATUS_HH_STATE_ERR	3
 
 #define BUTTRESS_TSC_CMD_START_TSC_SYNC		BIT(0)
 #define BUTTRESS_PWR_STATUS_HH_STATUS_SHIFT	11
-#define BUTTRESS_PWR_STATUS_HH_STATUS_MASK	(0x3U << 11)
+#define BUTTRESS_PWR_STATUS_HH_STATUS_MASK	(0x3 << 11)
 #define BUTTRESS_TSW_WA_SOFT_RESET		BIT(8)
 /* new for PTL */
 #define BUTTRESS_SEL_PB_TIMESTAMP		BIT(9)
@@ -326,15 +326,15 @@
 #define BUTTRESS_CSE2IUDATA0_IPC_NACK_MASK 0xffff
 
 /* IS/PS freq control */
-#define BUTTRESS_IS_FREQ_CTL_RATIO_MASK	0xffU
-#define BUTTRESS_PS_FREQ_CTL_RATIO_MASK	0xffU
+#define BUTTRESS_IS_FREQ_CTL_RATIO_MASK	0xff
+#define BUTTRESS_PS_FREQ_CTL_RATIO_MASK	0xff
 
 #define IPU7_IS_FREQ_MAX		450
 #define IPU7_IS_FREQ_MIN		50
 #define IPU7_PS_FREQ_MAX		750
-#define BUTTRESS_PS_FREQ_RATIO_STEP		25U
+#define BUTTRESS_PS_FREQ_RATIO_STEP		25
 /* valid for IPU8 */
-#define BUTTRESS_IS_FREQ_RATIO_STEP		25U
+#define BUTTRESS_IS_FREQ_RATIO_STEP		25
 
 /* IS: 400mhz, PS: 500mhz */
 #define IPU7_IS_FREQ_CTL_DEFAULT_RATIO		0x1b
@@ -350,11 +350,11 @@
 /* buttree power status */
 #define IPU_BUTTRESS_PWR_STATE_IS_PWR_SHIFT	0
 #define IPU_BUTTRESS_PWR_STATE_IS_PWR_MASK	\
-	(0x3U << IPU_BUTTRESS_PWR_STATE_IS_PWR_SHIFT)
+	(0x3 << IPU_BUTTRESS_PWR_STATE_IS_PWR_SHIFT)
 
 #define IPU_BUTTRESS_PWR_STATE_PS_PWR_SHIFT	4
 #define IPU_BUTTRESS_PWR_STATE_PS_PWR_MASK	\
-	(0x3U << IPU_BUTTRESS_PWR_STATE_PS_PWR_SHIFT)
+	(0x3 << IPU_BUTTRESS_PWR_STATE_PS_PWR_SHIFT)
 
 #define IPU_BUTTRESS_PWR_STATE_DN_DONE		0x0
 #define IPU_BUTTRESS_PWR_STATE_UP_PROCESS	0x1
diff --git a/drivers/staging/media/ipu7/ipu7-isys-csi-phy.h b/drivers/staging/media/ipu7/ipu7-isys-csi-phy.h
index dfdcb61540c..9663372a098 100644
--- a/drivers/staging/media/ipu7/ipu7-isys-csi-phy.h
+++ b/drivers/staging/media/ipu7/ipu7-isys-csi-phy.h
@@ -8,8 +8,8 @@
 
 struct ipu7_isys;
 
-#define PHY_MODE_DPHY		0U
-#define PHY_MODE_CPHY		1U
+#define PHY_MODE_DPHY		0
+#define PHY_MODE_CPHY		1
 
 int ipu7_isys_csi_phy_powerup(struct ipu7_isys_csi2 *csi2);
 void ipu7_isys_csi_phy_powerdown(struct ipu7_isys_csi2 *csi2);
diff --git a/drivers/staging/media/ipu7/ipu7-isys-csi2-regs.h b/drivers/staging/media/ipu7/ipu7-isys-csi2-regs.h
index aad52c44a00..4837dde9a8c 100644
--- a/drivers/staging/media/ipu7/ipu7-isys-csi2-regs.h
+++ b/drivers/staging/media/ipu7/ipu7-isys-csi2-regs.h
@@ -54,7 +54,7 @@
 #define IS_MAIN_IRQ_CTL_LEVEL_NOT_PULSE		(IS_MAIN_IRQ_CTRL_BASE + 0x14)
 
 /* IS IO regs base */
-#define IS_PHY_NUM				4U
+#define IS_PHY_NUM				4
 #define IS_IO_BASE				0x280000
 
 /* dwc csi cdphy registers */
@@ -1003,7 +1003,7 @@
 #define PORT_ARB_IRQ_CTL_CLEAR			0x8
 #define PORT_ARB_IRQ_CTL_ENABLE			0xc
 
-#define MGC_PPC					4U
+#define MGC_PPC					4
 #define MGC_DTYPE_RAW(i)			(((i) - 8) / 2)
 #define IS_IO_MGC_BASE				(IS_IO_BASE + 0x48000)
 #define MGC_KICK				0x0
@@ -1048,8 +1048,8 @@
 #define MGC_MG_BUSY_STTS			0xa8
 #define MGC_MG_STOPPED_STTS			0xac
 /* tile width and height in pixels for Chess board and Color palette */
-#define MGC_TPG_TILE_WIDTH			64U
-#define MGC_TPG_TILE_HEIGHT			64U
+#define MGC_TPG_TILE_WIDTH			64
+#define MGC_TPG_TILE_HEIGHT			64
 
 #define IPU_CSI_PORT_A_ADDR_OFFSET		0x0
 #define IPU_CSI_PORT_B_ADDR_OFFSET		0x0
@@ -1152,8 +1152,8 @@
 #define IPU7_CSI_RX_SYNC_IRQ_MASK		0x0
 #define IPU7P5_CSI_RX_SYNC_FE_IRQ_MASK		0x0
 
-#define CSI_RX_NUM_ERRORS_IN_IRQ		12U
-#define CSI_RX_NUM_SYNC_IN_IRQ			32U
+#define CSI_RX_NUM_ERRORS_IN_IRQ		12
+#define CSI_RX_NUM_SYNC_IN_IRQ			32
 
 enum CSI_FE_MODE_TYPE {
 	CSI_FE_DPHY_MODE = 0,
@@ -1187,7 +1187,7 @@ enum CSI2HOST_SELECTION {
 #define CSI_REG_PORT_GPREG_CSI2_SLV_REG_SRST	0x4
 #define CSI_REG_PORT_GPREG_CSI2_PORT_CONTROL	0x8
 
-#define CSI_RX_NUM_IRQ				32U
+#define CSI_RX_NUM_IRQ				32
 
 #define IPU7_CSI_RX_SYNC_FS_VC			0x55555555
 #define IPU7_CSI_RX_SYNC_FE_VC			0xaaaaaaaa
diff --git a/drivers/staging/media/ipu7/ipu7-isys-csi2.h b/drivers/staging/media/ipu7/ipu7-isys-csi2.h
index 6c23b80f92a..a83b9a1e2bc 100644
--- a/drivers/staging/media/ipu7/ipu7-isys-csi2.h
+++ b/drivers/staging/media/ipu7/ipu7-isys-csi2.h
@@ -16,12 +16,12 @@ struct ipu7_isys;
 struct ipu7_isys_csi2_pdata;
 struct ipu7_isys_stream;
 
-#define IPU7_NR_OF_CSI2_VC		16U
+#define IPU7_NR_OF_CSI2_VC		16
 #define INVALID_VC_ID			-1
-#define IPU7_NR_OF_CSI2_SINK_PADS	1U
-#define IPU7_CSI2_PAD_SINK		0U
-#define IPU7_NR_OF_CSI2_SRC_PADS	8U
-#define IPU7_CSI2_PAD_SRC		1U
+#define IPU7_NR_OF_CSI2_SINK_PADS	1
+#define IPU7_CSI2_PAD_SINK		0
+#define IPU7_NR_OF_CSI2_SRC_PADS	8
+#define IPU7_CSI2_PAD_SRC		1
 #define IPU7_NR_OF_CSI2_PADS		(IPU7_NR_OF_CSI2_SINK_PADS + \
 					 IPU7_NR_OF_CSI2_SRC_PADS)
 
diff --git a/drivers/staging/media/ipu7/ipu7-isys-video.h b/drivers/staging/media/ipu7/ipu7-isys-video.h
index 1ac1787fabe..23f44febd3f 100644
--- a/drivers/staging/media/ipu7/ipu7-isys-video.h
+++ b/drivers/staging/media/ipu7/ipu7-isys-video.h
@@ -17,8 +17,8 @@
 
 #include "ipu7-isys-queue.h"
 
-#define IPU_INSYS_OUTPUT_PINS		11U
-#define IPU_ISYS_MAX_PARALLEL_SOF	2U
+#define IPU_INSYS_OUTPUT_PINS		11
+#define IPU_ISYS_MAX_PARALLEL_SOF	2
 
 struct file;
 struct ipu7_isys;
diff --git a/drivers/staging/media/ipu7/ipu7-isys.h b/drivers/staging/media/ipu7/ipu7-isys.h
index ef1ab1b42f6..c898ff9594b 100644
--- a/drivers/staging/media/ipu7/ipu7-isys.h
+++ b/drivers/staging/media/ipu7/ipu7-isys.h
@@ -28,21 +28,21 @@
 #define IPU_ISYS_ENTITY_PREFIX		"Intel IPU7"
 
 /* FW support max 16 streams */
-#define IPU_ISYS_MAX_STREAMS		16U
+#define IPU_ISYS_MAX_STREAMS		16
 
 /*
  * Current message queue configuration. These must be big enough
  * so that they never gets full. Queues are located in system memory
  */
-#define IPU_ISYS_SIZE_RECV_QUEUE	40U
-#define IPU_ISYS_SIZE_LOG_QUEUE		256U
-#define IPU_ISYS_SIZE_SEND_QUEUE	40U
-#define IPU_ISYS_NUM_RECV_QUEUE		1U
-
-#define IPU_ISYS_MIN_WIDTH		2U
-#define IPU_ISYS_MIN_HEIGHT		2U
-#define IPU_ISYS_MAX_WIDTH		8160U
-#define IPU_ISYS_MAX_HEIGHT		8190U
+#define IPU_ISYS_SIZE_RECV_QUEUE	40
+#define IPU_ISYS_SIZE_LOG_QUEUE		256
+#define IPU_ISYS_SIZE_SEND_QUEUE	40
+#define IPU_ISYS_NUM_RECV_QUEUE		1
+
+#define IPU_ISYS_MIN_WIDTH		2
+#define IPU_ISYS_MIN_HEIGHT		2
+#define IPU_ISYS_MAX_WIDTH		8160
+#define IPU_ISYS_MAX_HEIGHT		8190
 
 #define FW_CALL_TIMEOUT_JIFFIES		\
 	msecs_to_jiffies(IPU_LIB_CALL_TIMEOUT_MS)
diff --git a/drivers/staging/media/ipu7/ipu7.h b/drivers/staging/media/ipu7/ipu7.h
index ac8ac068946..04e2b1b735e 100644
--- a/drivers/staging/media/ipu7/ipu7.h
+++ b/drivers/staging/media/ipu7/ipu7.h
@@ -100,18 +100,18 @@ struct ipu7_device {
 /* FW is accessible within the first 2 GiB only in non-secure mode. */
 #define IPU_MMU_ADDR_BITS_NON_SECURE	31
 
-#define IPU7_IS_MMU_NUM			4U
-#define IPU7_PS_MMU_NUM			4U
-#define IPU7P5_IS_MMU_NUM		4U
-#define IPU7P5_PS_MMU_NUM		4U
-#define IPU8_IS_MMU_NUM			5U
-#define IPU8_PS_MMU_NUM			4U
-#define IPU_MMU_MAX_NUM			5U /* max(IS, PS) */
-#define IPU_MMU_MAX_TLB_L1_STREAMS	40U
-#define IPU_MMU_MAX_TLB_L2_STREAMS	40U
-#define IPU_ZLX_MAX_NUM			32U
-#define IPU_ZLX_POOL_NUM		8U
-#define IPU_UAO_PLANE_MAX_NUM		64U
+#define IPU7_IS_MMU_NUM			4
+#define IPU7_PS_MMU_NUM			4
+#define IPU7P5_IS_MMU_NUM		4
+#define IPU7P5_PS_MMU_NUM		4
+#define IPU8_IS_MMU_NUM			5
+#define IPU8_PS_MMU_NUM			4
+#define IPU_MMU_MAX_NUM			5 /* max(IS, PS) */
+#define IPU_MMU_MAX_TLB_L1_STREAMS	40
+#define IPU_MMU_MAX_TLB_L2_STREAMS	40
+#define IPU_ZLX_MAX_NUM			32
+#define IPU_ZLX_POOL_NUM		8
+#define IPU_UAO_PLANE_MAX_NUM		64
 
 /*
  * To maximize the IOSF utlization, IPU need to send requests in bursts.
-- 
2.34.1


