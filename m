Return-Path: <linux-media+bounces-60828-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uLxmM3ms/GkNSgAAu9opvQ
	(envelope-from <linux-media+bounces-60828-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 17:15:05 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B1DF4EADDF
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 17:15:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 344C1300FF84
	for <lists+linux-media@lfdr.de>; Thu,  7 May 2026 15:15:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD39F4014A0;
	Thu,  7 May 2026 15:14:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sy+/4wzW"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DCAC3ED11B
	for <linux-media@vger.kernel.org>; Thu,  7 May 2026 15:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778166896; cv=none; b=Uw6Kx7OyeyiXKb3HIMyJkVuxLXbHyzndNfsrgMgVeXkBkaQUhF3Ox/1zgVr2Rk/DW17Ckd99uwyQHOPdnmlioYCX3LtzJlef2MlXAHVTZ159PYNpwikGV6MUlTlIzTCIQZ+bnMZK0ku5sM976dlNBg3Vjhw6qHYHxirCWN1phFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778166896; c=relaxed/simple;
	bh=xFS5J5u77pt3Y7Hf4FpTk5D9ePHHCptoA+oAHM0seJg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Rv9x8UnSxAPHHAPmkxJstWhfxp8+gjHMKQ9We47lbr+iHmoZ9cWc2rObvHrSieLgEaC7I4ri3+bqOjDmGXFH7iad/fCdrhPf4rCHjueGxJTvrxcWYYIrI711quk1ZWoQSmPbVomR7d/txHdQWKUj36BoM3aiPgyXd1Lzm0xGwVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sy+/4wzW; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2ba21d32776so7337755ad.2
        for <linux-media@vger.kernel.org>; Thu, 07 May 2026 08:14:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778166894; x=1778771694; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EkKYvF0OF++20NLzTdvDQYF9J4JuHMfHvRom9bmio3E=;
        b=sy+/4wzWyAJXHC4nPhMfkerT6SSBP85rIpAcIVwwScBhd5e6nKkGWLvQBp67hWKTgU
         lWShrJRedf+toQ6lSmySTzsW2qsd9Ra3donLDrvda5wmymnGblSL6tU32eRjVx9ksmpO
         9x0RqmSPhACWgSGxIKmndG19eoEF5kU7PMbS6SMqQm4aMfqL08lY/QxHpnswvCbD5bLo
         +y7+TaF/g4VrGjWLCB+pc2Df7GY1t3bJI+0PLbA5q+/ZHALLkjN2DW2udfhjMFZYOtEm
         9usVjQzAZJ05STXIHopakukGTAInzUsUKMvQGlD4BKDBGJEhp5r4LyZIzBBBPi8lQSXt
         tgtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778166894; x=1778771694;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EkKYvF0OF++20NLzTdvDQYF9J4JuHMfHvRom9bmio3E=;
        b=e+kJIv46KuNfWilxY9FK7/3ctTO1HBOiJbT1Creq8HREVWo6rWavGnWNCF9srrd/oY
         cj/Ofyn9LUmdAt8tkGM5AQIfMqG7QJ0SW2lsPfOTYo9BL1d/DNraxDRAhynZbXffRTdb
         lwUpUltuoF/RF8wbsZdWbjLIaRuX6EMghicdaWE+WYq9OqDFMvTCUwt9zR/X6S/vpjJE
         YGGx2PNXwyDJe88JY9SghuM7MvdEXhJiBhy8yx8oCQfs/0tFvG5mG73qbYZ2tsxSL4y+
         P2k9YRqKg1V/dpOC8Nl9w4vCsjNRLn/MrE6gpIZHU7lrDeF0JGJRM4Q19LlRYK+BAC7l
         h5Pw==
X-Forwarded-Encrypted: i=1; AFNElJ8fp9yue2li3X+MV/6v1ACMbMselBrKoJhesZMY+y16KHYdLvsjnTyPzuWr6BA1BEZ4XFkga1fVdLanZg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzxi9e/g8lGep/tiAOOJgZM5mACH3camXmEVwEyKPu6RapQqvRu
	KpU+FsuxVMpOGxNran7Rd3wOmYBNg+2lG9A+6e4tkavHUiJnXzoDdS7jCJu/zQ==
X-Gm-Gg: AeBDietiQ60g2bcsaeG5IqdHNrp93BsQ8rplqO0rH3nqesGo35BLtIWZRjB1wGH3fug
	Ka58VGuST/UpMJL2WQvSFUkHA/BbCKTFjpWqTrEXAmfNFl7lGesIbnYzV0WZymO+z57Ae/kLEqI
	b6aD+r/gyAn5x20XvjngtIsypG2J1jjfPkIL5XlMOrWGqGqYhjs6K2BkJSbUmtxlTbMEuF2Rw2V
	eT4MWTVZkdeQzgGFdCV4P7oW8R9HS8ktq31MC0hIFuleK+pjSE/nHx5Pqbj8cFULlssoDSIlDi5
	LXae0QcrODVIZ4Z5fdXlaSVAQPMrCm3XNrNlw0s9UF0xiHGVciAOwlUyELETNE8xWUyBkH874nL
	Vgj9ztG89CL5fDt+e2vzUrB4jP1b65cOQgZGWAPrbWc9mO1M9yFc7P0Sw025EHYtFgurpTn1VFq
	4C4/nOcGQKrEmMsGl9vA+efLt4yh9o/E4GKVbgDZs=
X-Received: by 2002:a17:902:e54e:b0:2ba:4eee:6c1e with SMTP id d9443c01a7336-2ba78e40c8fmr87801885ad.15.1778166894387;
        Thu, 07 May 2026 08:14:54 -0700 (PDT)
Received: from localhost ([2405:4802:1bf7:b0a0:33c8:3ea:357a:8f94])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bae78544ddsm112945ad.56.2026.05.07.08.14.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 08:14:54 -0700 (PDT)
From: Nguyen Hai Phu <nguyenhaiphu06@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Nguyen Hai Phu <nguyenhaiphu06@gmail.com>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] staging: media: ipu7: Remove unused struct ia_gofo_secondary_boot_config
Date: Thu,  7 May 2026 22:14:27 +0700
Message-ID: <20260507151446.153614-1-nguyenhaiphu06@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 4B1DF4EADDF
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,intel.com,kernel.org,linuxfoundation.org,vger.kernel.org,lists.linux.dev];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60828-lists,linux-media=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nguyenhaiphu06@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action

The struct ia_gofo_secondary_boot_config in abi/ipu7_fw_boot_abi.h is
not used in the driver. Remove it to cleanup the ABI headers.

Signed-off-by: Nguyen Hai Phu <nguyenhaiphu06@gmail.com>
---
v2: fix subject line prefix

 drivers/staging/media/ipu7/abi/ipu7_fw_boot_abi.h | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/drivers/staging/media/ipu7/abi/ipu7_fw_boot_abi.h b/drivers/staging/media/ipu7/abi/ipu7_fw_boot_abi.h
index a1519c4fe661..21d1ff7ab29a 100644
--- a/drivers/staging/media/ipu7/abi/ipu7_fw_boot_abi.h
+++ b/drivers/staging/media/ipu7/abi/ipu7_fw_boot_abi.h
@@ -91,17 +91,6 @@ struct ia_gofo_boot_config {
 	struct syscom_config_s syscom_context_config;
 };
 
-struct ia_gofo_secondary_boot_config {
-	u32 length;
-	struct ia_gofo_version_s config_version;
-	struct ia_gofo_msg_version_list client_version_support;
-	u8 reserved1[IA_GOFO_BOOT_SECONDARY_RESERVED_FIELDS];
-	u16 checksum;
-	u8 padding[2];
-	u32 reserved2[IA_GOFO_BOOT_SECONDARY_RESERVED_SIZE];
-	struct syscom_config_s syscom_context_config;
-};
-
 #pragma pack(pop)
 
 #define IA_GOFO_WDT_TIMEOUT_ERR			0xdead0401U
-- 
2.54.0


