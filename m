Return-Path: <linux-media+bounces-60779-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0KHfHAdz/GkEQQAAu9opvQ
	(envelope-from <linux-media+bounces-60779-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 13:09:59 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 083C94E7412
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 13:09:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A09C83038A6F
	for <lists+linux-media@lfdr.de>; Thu,  7 May 2026 11:02:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A25AE31715F;
	Thu,  7 May 2026 11:02:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A1+X9OkP"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4551933B6F6
	for <linux-media@vger.kernel.org>; Thu,  7 May 2026 11:02:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778151761; cv=none; b=q1PfPpktpZnfAiDEgmDUJwpO0dkaGbNd8QyfjyhoLAPlYY78YBN8ylCrTu0mGkV27LUzB1Q337VFUF9FW+ATyhGzFGg9hvaoh1n30RRQr4nKvSd7O4xwcOt20MiKSxVwZNbj2yhgxAKLDw5/ev3VMQb+B55z/+nss5Atyq2YcoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778151761; c=relaxed/simple;
	bh=cMgJqIA89J5jSDyNSTxWxOeL0VqIoE8Nxhg1/ff2B9s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=moxMhipD2qeQSETP1uXLZegHwIfx8+BNiaWPSqShncxusEDL+NmmHyOCzI4eVVwKA6ekp9oSl0s2w2LenP/8/0SHg6bVUAux9hqlqxMUJ4ICKVSWAVeDMxpe1QMJsHKW9Br3hVA9STQO/3d3CTGqRNYJESv/RoFLXhdMgmomFww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A1+X9OkP; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-364eef1891dso488662a91.1
        for <linux-media@vger.kernel.org>; Thu, 07 May 2026 04:02:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778151757; x=1778756557; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7del58ZNoXTYS1UrwtFFdHbvVnfss3cuhksZj/ziuKs=;
        b=A1+X9OkPYML41Cnppz9q/Xm4w4TDlJy4GGeEqwg6/h9mJicfOrypHAHVUYlmegXsL/
         fNh19q7pomNa6m5Bi9vT+6KmtWxaat1cIy62U1uXqTqUam00zp93pZxOAMUanR7paHdw
         xkW2LXb1c+3nJsfS4sKbAz+PO9TJgPN4Tt96mIEv2xA8lgp6wfWYZirSoyOCs1esizNh
         b3PCtj4dWLupRAxtMLXdGEMZpOvyedM6pCbElXSXL9rrodo5yM2zXhU8SFvH4b6NQ7hG
         5BfsJ6H44J95/G+RFBUCmvLpY65N01Mg0RUh2m9Afx2XhV5gWTO3uvinvqFV7KW9L6qB
         tfHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778151757; x=1778756557;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7del58ZNoXTYS1UrwtFFdHbvVnfss3cuhksZj/ziuKs=;
        b=b15wfRye2cF7UgHiq0nzL9dgD0p7h1cIUksen7eEP4IVuvqH6d7uJLZJcGAGOHex1Y
         Qan/JBhq22/xaQvKHibmUBPs+6/0QxxGxdTXb1CQcb1dVLYKsD3g8z5ul02fTBCEnXOy
         Sgb1ites59P60pYlgbxX3BWZ4tYZKsjaab6Yb/2DJpIy/w0kFXPWP1RtOOOjFe9c4wyy
         P+kBEJUoQ6IS0RioUu1eV/ZXxOrBLoLXmFLWrG4CQo3OYKHxXua106CgWllyDjin0abD
         1UaE+I3x4JWlqmXSIdJuXtYtKYEEZkMjEBQ5SlYjXIHdUFY+/GMM9MIDC6nV4u7YqfxR
         trJg==
X-Forwarded-Encrypted: i=1; AFNElJ/TiMAMpSOgFXG6Q/RnXHJvvTGhV4VFteGVDjquTQjoaRqgabi3AnUxhToGnprsxYtfKadGVGXe/0hqGQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxCYcD8rAikjpfQwWqJDh7Huu2gngULqhzp1ReS7ZGnTa59QKgo
	B0luQLRxE8BT/f072JXDOx3dMQP6e5jsIJhQ8n2WhWULgHiD7/0QhJ12
X-Gm-Gg: AeBDieuIoCxRii1smQAtKarHSxVVivP+dIlJ/CcCv/YyVf/pHP/Sjb9KaCHK8kv4xlY
	rcdmzEFc5duepg9REnnhaJLzp5GbBwforyz+KIlYol9S80ewFyT7wvg/aSU8bBkaKE8y6WoAVqx
	RuDpwz4MD2qd3hoiLwFP/Karyh9IJdQmMqjccm/jL75gRfogB2azqi6Kc1bi0LXdue7bgPpkzli
	9pki2U/FQT45Vg0U7vkJ5E2tslzQqJcSaqSp5i+dP+25514tMn1oMo/bCox1vQplkCTjL5eDXjP
	Ox7re83+GrY0RD+M9Mxxu8nMcNvYeVRL1RU2Dna/AnSPQD4uLaPB9vUYR5Sj2pq47Tafr2yGYJ8
	BKzluMIo0E2xG59Ee4agZOEu2+/rD+dTiNj9joK45YVwau50ooWPX8FMd+u45pfEbxIYX6iJd7k
	OmKbBXGNzJL/nT+N3QGDrVohLPjp2nvQEkhiSEvSr1YlY=
X-Received: by 2002:a17:90b:55cc:b0:366:16d1:6a25 with SMTP id 98e67ed59e1d1-36616d172e4mr1466210a91.5.1778151756721;
        Thu, 07 May 2026 04:02:36 -0700 (PDT)
Received: from phu-arch.lan ([2405:4802:1bf7:b0a0:33c8:3ea:357a:8f94])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-365d8e3dad8sm3961371a91.1.2026.05.07.04.02.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 04:02:35 -0700 (PDT)
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
Subject: [PATCH] staging: media/ipu7: Remove unused struct ia_gofo_secondary_boot_config
Date: Thu,  7 May 2026 18:01:55 +0700
Message-ID: <20260507110209.127549-1-nguyenhaiphu06@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 083C94E7412
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,intel.com,kernel.org,linuxfoundation.org,vger.kernel.org,lists.linux.dev];
	TAGGED_FROM(0.00)[bounces-60779-lists,linux-media=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nguyenhaiphu06@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-media];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

The struct ia_gofo_secondary_boot_config in abi/ipu7_fw_boot_abi.h is
not used in the driver. Remove it to cleanup the ABI headers.

Signed-off-by: Nguyen Hai Phu <nguyenhaiphu06@gmail.com>
---
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


