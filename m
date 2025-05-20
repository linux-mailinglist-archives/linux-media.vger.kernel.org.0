Return-Path: <linux-media+bounces-32930-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 578E8ABDEE5
	for <lists+linux-media@lfdr.de>; Tue, 20 May 2025 17:25:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 654D31BA6FD8
	for <lists+linux-media@lfdr.de>; Tue, 20 May 2025 15:25:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBFF026A1B6;
	Tue, 20 May 2025 15:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cZOy0l8x"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 058B8264FA0
	for <linux-media@vger.kernel.org>; Tue, 20 May 2025 15:24:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747754689; cv=none; b=rweUlzpFcjPcsesZcaJDLrZdkuxSwXC7oHXONtUZwiyZ+B1RNr4lKTwwz650anbz7S3DIHBl6trZg5OpRgttHon6ptPgeu6i7eotBZjCuU2CacyGHQPSz6oQGocrSTSzN85LshzzqRWLOGDtrU+CXsm1wzKOrmLA7AGfzJbRrvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747754689; c=relaxed/simple;
	bh=oCfKvP1ERS4ESpMrkhe8MXK1lRbic7JR6DqbTVzMBTA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fKXKO+tbndGQPXIZsmzCLRElvJlaFnSfz9oTWR9TrtZwKcmns/qJ4OUpnP1pdryWPgNXi1puyqGgsLf3DGiA93eg8njqI/InUMkb4b4tMGCxbLDRteHoET7lQujAVLrRWS+mQWTG8PHQdPKg7v2W3ZGhgvWxTy3EOQMM+nb9w1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cZOy0l8x; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-ad563b69908so392918866b.3
        for <linux-media@vger.kernel.org>; Tue, 20 May 2025 08:24:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747754683; x=1748359483; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4+baD6tQxOo8A0Uv4WNUpuJre5Z88nF9wOnGWPQvSzo=;
        b=cZOy0l8xisAwZ2xrIUMZSUC0iuhaSqpJY0XBteAS/+NGHXwtCCTtB48S9HFRvIADfK
         gdn6k9WuQWjvmYeOF02q4ikBjkuLxLpsOODON6YMAOXMklShME55DKVMjh1cmEpQEoXW
         Aj6j64kopwND+mDrW7yyTFXJvj4xuFYYZCMLYN2w+1hQSSSYpcKkZX2QBcRjC3aFP2oy
         FqR4H3AT3/jcZEXfBVpo73WbfHjfiejGe5LBE6WfGSRaAdW5WCLmMEWrgrLJZP9xwpf+
         PK7YoIA3mcQrTZ017WInIgolfzSUggeS9IBkqW41xVOwjgMcdwt9OpMtDfeliog3MXEf
         ZbFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747754683; x=1748359483;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4+baD6tQxOo8A0Uv4WNUpuJre5Z88nF9wOnGWPQvSzo=;
        b=Ep3+7zommjpZW1jBi8L44weUNZREPZ4rr6JBdDJkneaFRD3+XaHr4AvGrDhkUavOGt
         kv+Y/Go75LnpJEqz337dkmn+WQO5IARi8K5XpL2BNkCnBkMjDUVok9TBUMCa8jMphksH
         jTJpxDpgE0juqU7bSDH6+oyzb1nNppvjPwW9gYSX53n2ZsoBOqObNYBHDP5fkXM1T4up
         Pp/099DtgSwNeJme8+q3BjbCdqNpkkIbnM/pfO5kzgeTurGQptYrB0UQpM2VSOOLiDil
         wbrlhuRHXM/QRubpyOpWybwVjT705+x5QNVPrfewHXDeqfi9T7lMBlrVeTj4V0aEg/sU
         uG0w==
X-Forwarded-Encrypted: i=1; AJvYcCU3cgfUkHCLXsl2nbusaQ+fI4S8va1sLyKLW4IVw9VZf5ngxM9NJlXQWWFFwst32l7nKC71HPAJHyHY/w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7Iv9MZLYhETxUR28lvxlXQbmKzIgIG/HlEpZL1N5Ma846nfhd
	NBm17Z8inIdZ625XDmy72v3ROGAfbURo1AAcNPTCKlGbhq6Q01s1SzxcleXtJg53TL0=
X-Gm-Gg: ASbGnctZXgqqTVgWH7Nja0+thgTRVlu/aEK3AIh9AT12uRiOsB8RUiUol9Fbszgh/RE
	uZWX7isWmV7s1umDU1xLjfdXbzuDxD/o/utx8dVmhnwbaUn2Bs1RZ8pGEuXNlMGkhpEeUIQSHFo
	maLEThUcpbWPvfGwsTXDTPeoaDfxTLTXgFgli+1QliYLiCh8o85ZCTBa9thZD6ctWtp4PMTNJpL
	4fIgu8O3nPeb4R3Ec59heGYYarYfh6pNLn4SSeOcKxjM5HFyHxMymyYyX2PkN0iyn9VhtuSU6Ic
	Ou4t9Zx1fBtqvFYp8+6uPlEt87qZeG3kQyXkEXACCAEIOwQDuoxqSx0eFVMO/Hbuz9GWneaYK9v
	ut7vmxO9GY93Yd3R2mYv2SY6aqlEB
X-Google-Smtp-Source: AGHT+IEjl5dONqcGI/9Obalen7xsUtIevbtIgV4jJD0y/opupXbgJh0kSw2McapRPYLftw/O7r7cRw==
X-Received: by 2002:a17:907:268a:b0:ad5:eff:db32 with SMTP id a640c23a62f3a-ad536de9517mr1410145466b.48.1747754682501;
        Tue, 20 May 2025 08:24:42 -0700 (PDT)
Received: from rayden.urgonet (h-98-128-140-123.A175.priv.bahnhof.se. [98.128.140.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d278257sm742608766b.82.2025.05.20.08.24.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 08:24:41 -0700 (PDT)
From: Jens Wiklander <jens.wiklander@linaro.org>
To: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	op-tee@lists.trustedfirmware.org,
	linux-arm-kernel@lists.infradead.org
Cc: Olivier Masse <olivier.masse@nxp.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Yong Wu <yong.wu@mediatek.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Brian Starkey <Brian.Starkey@arm.com>,
	John Stultz <jstultz@google.com>,
	"T . J . Mercier" <tjmercier@google.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Sumit Garg <sumit.garg@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	azarrabi@qti.qualcomm.com,
	Simona Vetter <simona.vetter@ffwll.ch>,
	Daniel Stone <daniel@fooishbar.org>,
	Rouven Czerwinski <rouven.czerwinski@linaro.org>,
	Jens Wiklander <jens.wiklander@linaro.org>
Subject: [PATCH v9 1/9] optee: sync secure world ABI headers
Date: Tue, 20 May 2025 17:16:44 +0200
Message-ID: <20250520152436.474778-2-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250520152436.474778-1-jens.wiklander@linaro.org>
References: <20250520152436.474778-1-jens.wiklander@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update the header files describing the secure world ABI, both with and
without FF-A. The ABI is extended to deal with protected memory, but as
usual backward compatible.

Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
---
 drivers/tee/optee/optee_ffa.h | 27 ++++++++---
 drivers/tee/optee/optee_msg.h | 84 ++++++++++++++++++++++++++++++-----
 drivers/tee/optee/optee_smc.h | 37 ++++++++++++++-
 3 files changed, 130 insertions(+), 18 deletions(-)

diff --git a/drivers/tee/optee/optee_ffa.h b/drivers/tee/optee/optee_ffa.h
index 257735ae5b56..cc257e7956a3 100644
--- a/drivers/tee/optee/optee_ffa.h
+++ b/drivers/tee/optee/optee_ffa.h
@@ -81,7 +81,7 @@
  *                   as the second MSG arg struct for
  *                   OPTEE_FFA_YIELDING_CALL_WITH_ARG.
  *        Bit[31:8]: Reserved (MBZ)
- * w5:	  Bitfield of secure world capabilities OPTEE_FFA_SEC_CAP_* below,
+ * w5:	  Bitfield of OP-TEE capabilities OPTEE_FFA_SEC_CAP_*
  * w6:	  The maximum secure world notification number
  * w7:	  Not used (MBZ)
  */
@@ -94,6 +94,8 @@
 #define OPTEE_FFA_SEC_CAP_ASYNC_NOTIF	BIT(1)
 /* OP-TEE supports probing for RPMB device if needed */
 #define OPTEE_FFA_SEC_CAP_RPMB_PROBE	BIT(2)
+/* OP-TEE supports Protected Memory for secure data path */
+#define OPTEE_FFA_SEC_CAP_PROTMEM	BIT(3)
 
 #define OPTEE_FFA_EXCHANGE_CAPABILITIES OPTEE_FFA_BLOCKING_CALL(2)
 
@@ -108,7 +110,7 @@
  *
  * Return register usage:
  * w3:    Error code, 0 on success
- * w4-w7: Note used (MBZ)
+ * w4-w7: Not used (MBZ)
  */
 #define OPTEE_FFA_UNREGISTER_SHM	OPTEE_FFA_BLOCKING_CALL(3)
 
@@ -119,16 +121,31 @@
  * Call register usage:
  * w3:    Service ID, OPTEE_FFA_ENABLE_ASYNC_NOTIF
  * w4:	  Notification value to request bottom half processing, should be
- *	  less than OPTEE_FFA_MAX_ASYNC_NOTIF_VALUE.
+ *	  less than OPTEE_FFA_MAX_ASYNC_NOTIF_VALUE
  * w5-w7: Not used (MBZ)
  *
  * Return register usage:
  * w3:    Error code, 0 on success
- * w4-w7: Note used (MBZ)
+ * w4-w7: Not used (MBZ)
  */
 #define OPTEE_FFA_ENABLE_ASYNC_NOTIF	OPTEE_FFA_BLOCKING_CALL(5)
 
-#define OPTEE_FFA_MAX_ASYNC_NOTIF_VALUE 64
+#define OPTEE_FFA_MAX_ASYNC_NOTIF_VALUE	64
+
+/*
+ * Release Protected memory
+ *
+ * Call register usage:
+ * w3:    Service ID, OPTEE_FFA_RECLAIM_PROTMEM
+ * w4:    Shared memory handle, lower bits
+ * w5:    Shared memory handle, higher bits
+ * w6-w7: Not used (MBZ)
+ *
+ * Return register usage:
+ * w3:    Error code, 0 on success
+ * w4-w7: Note used (MBZ)
+ */
+#define OPTEE_FFA_RELEASE_PROTMEM	OPTEE_FFA_BLOCKING_CALL(8)
 
 /*
  * Call with struct optee_msg_arg as argument in the supplied shared memory
diff --git a/drivers/tee/optee/optee_msg.h b/drivers/tee/optee/optee_msg.h
index e8840a82b983..22130e967dc5 100644
--- a/drivers/tee/optee/optee_msg.h
+++ b/drivers/tee/optee/optee_msg.h
@@ -133,13 +133,13 @@ struct optee_msg_param_rmem {
 };
 
 /**
- * struct optee_msg_param_fmem - ffa memory reference parameter
+ * struct optee_msg_param_fmem - FF-A memory reference parameter
  * @offs_lower:	   Lower bits of offset into shared memory reference
  * @offs_upper:	   Upper bits of offset into shared memory reference
  * @internal_offs: Internal offset into the first page of shared memory
  *		   reference
  * @size:	   Size of the buffer
- * @global_id:	   Global identifier of Shared memory
+ * @global_id:	   Global identifier of the shared memory
  */
 struct optee_msg_param_fmem {
 	u32 offs_low;
@@ -165,7 +165,7 @@ struct optee_msg_param_value {
  * @attr:	attributes
  * @tmem:	parameter by temporary memory reference
  * @rmem:	parameter by registered memory reference
- * @fmem:	parameter by ffa registered memory reference
+ * @fmem:	parameter by FF-A registered memory reference
  * @value:	parameter by opaque value
  * @octets:	parameter by octet string
  *
@@ -296,6 +296,18 @@ struct optee_msg_arg {
  */
 #define OPTEE_MSG_FUNCID_GET_OS_REVISION	0x0001
 
+/*
+ * Values used in OPTEE_MSG_CMD_LEND_PROTMEM below
+ * OPTEE_MSG_PROTMEM_RESERVED		Reserved
+ * OPTEE_MSG_PROTMEM_SECURE_VIDEO_PLAY	Secure Video Playback
+ * OPTEE_MSG_PROTMEM_TRUSTED_UI		Trused UI
+ * OPTEE_MSG_PROTMEM_SECURE_VIDEO_RECORD	Secure Video Recording
+ */
+#define OPTEE_MSG_PROTMEM_RESERVED		0
+#define OPTEE_MSG_PROTMEM_SECURE_VIDEO_PLAY	1
+#define OPTEE_MSG_PROTMEM_TRUSTED_UI		2
+#define OPTEE_MSG_PROTMEM_SECURE_VIDEO_RECORD	3
+
 /*
  * Do a secure call with struct optee_msg_arg as argument
  * The OPTEE_MSG_CMD_* below defines what goes in struct optee_msg_arg::cmd
@@ -337,15 +349,63 @@ struct optee_msg_arg {
  * OPTEE_MSG_CMD_STOP_ASYNC_NOTIF informs secure world that from now is
  * normal world unable to process asynchronous notifications. Typically
  * used when the driver is shut down.
+ *
+ * OPTEE_MSG_CMD_LEND_PROTMEM lends protected memory. The passed normal
+ * physical memory is protected from normal world access. The memory
+ * should be unmapped prior to this call since it becomes inaccessible
+ * during the request.
+ * Parameters are passed as:
+ * [in] param[0].attr			OPTEE_MSG_ATTR_TYPE_VALUE_INPUT
+ * [in] param[0].u.value.a		OPTEE_MSG_PROTMEM_* defined above
+ * [in] param[1].attr			OPTEE_MSG_ATTR_TYPE_TMEM_INPUT
+ * [in] param[1].u.tmem.buf_ptr		physical address
+ * [in] param[1].u.tmem.size		size
+ * [in] param[1].u.tmem.shm_ref		holds protected memory reference
+ *
+ * OPTEE_MSG_CMD_RECLAIM_PROTMEM reclaims a previously lent protected
+ * memory reference. The physical memory is accessible by the normal world
+ * after this function has return and can be mapped again. The information
+ * is passed as:
+ * [in] param[0].attr			OPTEE_MSG_ATTR_TYPE_VALUE_INPUT
+ * [in] param[0].u.value.a		holds protected memory cookie
+ *
+ * OPTEE_MSG_CMD_GET_PROTMEM_CONFIG get configuration for a specific
+ * protected memory use case. Parameters are passed as:
+ * [in] param[0].attr			OPTEE_MSG_ATTR_TYPE_VALUE_INOUT
+ * [in] param[0].value.a		OPTEE_MSG_PROTMEM_*
+ * [in] param[1].attr			OPTEE_MSG_ATTR_TYPE_{R,F}MEM_OUTPUT
+ * [in] param[1].u.{r,f}mem		Buffer or NULL
+ * [in] param[1].u.{r,f}mem.size	Provided size of buffer or 0 for query
+ * output for the protected use case:
+ * [out] param[0].value.a		Minimal size of protected memory
+ * [out] param[0].value.b		Required alignment of size and start of
+ *					protected memory
+ * [out] param[0].value.c               PA width, max 64
+ * [out] param[1].{r,f}mem.size		Size of output data
+ * [out] param[1].{r,f}mem		If non-NULL, contains an array of
+ *					uint16_t holding endpoints that
+ *					must be included when lending
+ *					memory for this use case
+ *
+ * OPTEE_MSG_CMD_ASSIGN_PROTMEM assigns use-case to protected memory
+ * previously lent using the FFA_LEND framework ABI. Parameters are passed
+ * as:
+ * [in] param[0].attr			OPTEE_MSG_ATTR_TYPE_VALUE_INPUT
+ * [in] param[0].u.value.a		holds protected memory cookie
+ * [in] param[0].u.value.b		OPTEE_MSG_PROTMEM_* defined above
  */
-#define OPTEE_MSG_CMD_OPEN_SESSION	0
-#define OPTEE_MSG_CMD_INVOKE_COMMAND	1
-#define OPTEE_MSG_CMD_CLOSE_SESSION	2
-#define OPTEE_MSG_CMD_CANCEL		3
-#define OPTEE_MSG_CMD_REGISTER_SHM	4
-#define OPTEE_MSG_CMD_UNREGISTER_SHM	5
-#define OPTEE_MSG_CMD_DO_BOTTOM_HALF	6
-#define OPTEE_MSG_CMD_STOP_ASYNC_NOTIF	7
-#define OPTEE_MSG_FUNCID_CALL_WITH_ARG	0x0004
+#define OPTEE_MSG_CMD_OPEN_SESSION		0
+#define OPTEE_MSG_CMD_INVOKE_COMMAND		1
+#define OPTEE_MSG_CMD_CLOSE_SESSION		2
+#define OPTEE_MSG_CMD_CANCEL			3
+#define OPTEE_MSG_CMD_REGISTER_SHM		4
+#define OPTEE_MSG_CMD_UNREGISTER_SHM		5
+#define OPTEE_MSG_CMD_DO_BOTTOM_HALF		6
+#define OPTEE_MSG_CMD_STOP_ASYNC_NOTIF		7
+#define OPTEE_MSG_CMD_LEND_PROTMEM		8
+#define OPTEE_MSG_CMD_RECLAIM_PROTMEM		9
+#define OPTEE_MSG_CMD_GET_PROTMEM_CONFIG	10
+#define OPTEE_MSG_CMD_ASSIGN_PROTMEM		11
+#define OPTEE_MSG_FUNCID_CALL_WITH_ARG		0x0004
 
 #endif /* _OPTEE_MSG_H */
diff --git a/drivers/tee/optee/optee_smc.h b/drivers/tee/optee/optee_smc.h
index 879426300821..accf76a99288 100644
--- a/drivers/tee/optee/optee_smc.h
+++ b/drivers/tee/optee/optee_smc.h
@@ -264,7 +264,6 @@ struct optee_smc_get_shm_config_result {
 #define OPTEE_SMC_SEC_CAP_HAVE_RESERVED_SHM	BIT(0)
 /* Secure world can communicate via previously unregistered shared memory */
 #define OPTEE_SMC_SEC_CAP_UNREGISTERED_SHM	BIT(1)
-
 /*
  * Secure world supports commands "register/unregister shared memory",
  * secure world accepts command buffers located in any parts of non-secure RAM
@@ -280,6 +279,10 @@ struct optee_smc_get_shm_config_result {
 #define OPTEE_SMC_SEC_CAP_RPC_ARG		BIT(6)
 /* Secure world supports probing for RPMB device if needed */
 #define OPTEE_SMC_SEC_CAP_RPMB_PROBE		BIT(7)
+/* Secure world supports protected memory */
+#define OPTEE_SMC_SEC_CAP_PROTMEM		BIT(8)
+/* Secure world supports dynamic protected memory */
+#define OPTEE_SMC_SEC_CAP_DYNAMIC_PROTMEM	BIT(9)
 
 #define OPTEE_SMC_FUNCID_EXCHANGE_CAPABILITIES	9
 #define OPTEE_SMC_EXCHANGE_CAPABILITIES \
@@ -451,6 +454,38 @@ struct optee_smc_disable_shm_cache_result {
 
 /* See OPTEE_SMC_CALL_WITH_REGD_ARG above */
 #define OPTEE_SMC_FUNCID_CALL_WITH_REGD_ARG	19
+/*
+ * Get protected memory config
+ *
+ * Returns the protected memory config.
+ *
+ * Call register usage:
+ * a0   SMC Function ID, OPTEE_SMC_GET_PROTMEM_CONFIG
+ * a2-6	Not used, must be zero
+ * a7	Hypervisor Client ID register
+ *
+ * Have config return register usage:
+ * a0	OPTEE_SMC_RETURN_OK
+ * a1	Physical address of start of protected memory
+ * a2	Size of protected memory
+ * a3	PA width, max 64
+ * a4-7	Preserved
+ *
+ * Not available register usage:
+ * a0	OPTEE_SMC_RETURN_ENOTAVAIL
+ * a1-3 Not used
+ * a4-7	Preserved
+ */
+#define OPTEE_SMC_FUNCID_GET_PROTMEM_CONFIG		20
+#define OPTEE_SMC_GET_PROTMEM_CONFIG \
+	OPTEE_SMC_FAST_CALL_VAL(OPTEE_SMC_FUNCID_GET_PROTMEM_CONFIG)
+
+struct optee_smc_get_protmem_config_result {
+	unsigned long status;
+	unsigned long start;
+	unsigned long size;
+	unsigned long pa_width;
+};
 
 /*
  * Resume from RPC (for example after processing a foreign interrupt)
-- 
2.43.0


