Return-Path: <linux-media+bounces-55719-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SKlEAfMutGmQigAAu9opvQ
	(envelope-from <linux-media+bounces-55719-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 16:36:19 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B88A2861F6
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 16:36:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 04B3E30A1180
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 15:29:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB0C93B0ACA;
	Fri, 13 Mar 2026 15:29:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RlAXVduX"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C6B23AD503
	for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 15:29:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773415789; cv=none; b=ABAkPw/5aQ0m9NPI+xSfMuSW1zkgbOuxI21EO6yLA1nxfbPt7nMZ2x3iRNzhI+3s/Wskryob70E0XI7J82CnmdBHZBK5gFUS0AzW2Oh5BuesX+L1LldYQHZzQJeHm4YUqg0A0BUguIpaVrK0yhE+mCSWzy6/M/uZsA78+l6xDkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773415789; c=relaxed/simple;
	bh=dxfpkQj7eiFeIIDXWNcA4ZUVHh5IwXnuf92aVIsXyic=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=IWey18fePH6wQoIu1vu5c9ZkcsJeh5Jx1yukTFZwDQ3eH0trwm/ihSzkG3ww3QEsBsBDRR0LhUDD6FL6A7/8w2cYW1Z5gfj5tiPK0e0EkLmrK7oxcelLWpCPyHhIM/5Vb+90b3uyvtL4bFnwVf55J1xI9e5iHzUi/qLcRNILves=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RlAXVduX; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-35a1d4a095bso965559a91.0
        for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 08:29:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773415787; x=1774020587; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=egzitlphPzbhJMIdezsx6gs1Ho+qeL+qGUKXEWbH8Jw=;
        b=RlAXVduX6OwdSeojb0ioIdVdbDixVdlxvfFtLIPss8YNYOQS3dTsRHxcmCDr3iDphm
         0eQ6oOSeCDkrG4K3Bqs65BnihSjq0cP/c586+w4YQAuv5tOPlANaqXWwSzSqwKN9Kqcl
         yhyzQ61DbRAh6aujpf6GRUMYGGmCjeoFzyu3CKCZ6fG7Dh4NqBnZVh/NqLSNdLBZH0yn
         eBuMnM72KbJ8yip+htDBGzNBM2IRuzAyOXXJpBgXpHlcU7PuBXQ9zGm8vCcsEmWPCmIB
         hVewH3OhyHFU4oc/SJ1HuJU1CWQqcQVVSx97Y2/Yl1Z1QN0nc3ocwI2oMrqOow64BAip
         kSyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773415787; x=1774020587;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=egzitlphPzbhJMIdezsx6gs1Ho+qeL+qGUKXEWbH8Jw=;
        b=plvOOO5DlbbkIYAadGUXRJ6gGIHPti31OuxhHz4fyKx/3EjqMwSzgp1hrnHjjRuAlz
         XsT0/Gq4Ji2cePak4QuZXqfaRHzOrmog8/66WHvCfREdT8FYQ5JcX+xlY62JeGIGcKcN
         LIk6KkGMAZl7Q/ExjS76pJG3+mLC8bEB69GVgCCY5YBthkajU+fEqU9YvuI/0QvBI9UM
         dlh98KtDGxa4Zuq+Fu8STfpaHAewCMorDUQgiAS+dpC0Cbe9ejZ0Po7lUl7/LSrS5xOo
         dkox5JQ8tNXbkotrecta2KOzRNxWAuOqne9EVqUxyncCz6w+bEj8pLQOt4qYec4rB0rN
         xgtQ==
X-Forwarded-Encrypted: i=1; AJvYcCWHIDPNAgtOknSfjZHLT2nM5u9mHZ9ZIx3nElzUO38Tc46Lrl5dn6wrKfCeYBlSEh38+55lncN2UMcBQA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyQESDTtQRMtlmF89uv/XT3tDPq9daY+S1dHm631u9deG9EDkly
	Z5+8ommuVPs/QX0Qj0j0mLb2FKDErV+1tFeBMMvAOdAYOQV2Z/kQuCAW
X-Gm-Gg: ATEYQzwjS4VGtgkfwVwJ5ns6BRXF9VYfBfeZwXrkOEXhsKwHntawd5O5kKs1T4cWiZH
	JldSOZS79GH9BBfw8mm4Q6bKU2nvm2Zh2FwH3lOQjpxbgHeOsf+NJO9Y0y7suSEkAm0dbQNIrTW
	HSMWJd+fAvOR4jcU5/BQnbWUiaYf/UTlUoR3wfAbnJNb4s6uadLuKzwdvT/q+nYvTwqYUQaiScE
	J1RZqYFgwykNnihEsNEkSfe7dT4+Ugb4vRh9g4N//gs6lADWxqDSz6edN/y6g5COKwrQijnU8TW
	rjV/GxeT2vAG8ENnMFV79xF8N6odpsp1fYutPYzbeqUxFqE2Tal6Uj/BCRcYi/gciYILOSICpGY
	LgrDNP+iA/iwFj8IZP5qhm9FgTwcBfCDMl0iJIp+UV7rK2NFFZjCPh33rFKJpbt3TexhneABRIy
	BvTWLB35QUJh9UgcPAv1AQGSQeE7Bt6Vd1Ep+o4LYaCS3oGOCTCJPpy4ANgGFX+wt8UDieamuBJ
	n9djpZzXN2XYU/BWm+FiWtUjAgElWQoC2T78g==
X-Received: by 2002:a17:90b:1c09:b0:35a:2ed:9b6f with SMTP id 98e67ed59e1d1-35a117df08dmr5949617a91.0.1773415787288;
        Fri, 13 Mar 2026 08:29:47 -0700 (PDT)
Received: from starpt-K55VD.. (2001-b011-7803-1632-43cb-2c60-f383-892a.dynamic-ip6.hinet.net. [2001:b011:7803:1632:43cb:2c60:f383:892a])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c73ebb64819sm2656785a12.22.2026.03.13.08.29.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 08:29:46 -0700 (PDT)
From: Lin YuChen <starpt.official@gmail.com>
To: andy@kernel.org,
	hansg@kernel.org,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org
Cc: sakari.ailus@linux.intel.com,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	starpt.official@gmail.com
Subject: [PATCH 2/2] staging: media: atomisp: use kmalloc_array() for sh_css_blob_info
Date: Fri, 13 Mar 2026 23:29:36 +0800
Message-Id: <20260313152936.14560-1-starpt.official@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[linux.intel.com,vger.kernel.org,lists.linux.dev,gmail.com];
	TAGGED_FROM(0.00)[bounces-55719-lists,linux-media=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[starptofficial@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_NONE(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 9B88A2861F6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Replace the open-coded multiplication in kmalloc() with kmalloc_array()
to provide overflow protection and improve code readability.

Signed-off-by: Lin YuChen <starpt.official@gmail.com>
---
v2:
 - Remove unnecessary parentheses in kmalloc_array() call as suggested
   by Andy Shevchenko.
 drivers/staging/media/atomisp/pci/sh_css_firmware.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/sh_css_firmware.c b/drivers/staging/media/atomisp/pci/sh_css_firmware.c
index 57ecf5549c23..af12df2f9b09 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_firmware.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_firmware.c
@@ -253,9 +253,9 @@ sh_css_load_firmware(struct device *dev, const char *fw_data,
 	sh_css_num_binaries = file_header->binary_nr;
 	/* Only allocate memory for ISP blob info */
 	if (sh_css_num_binaries > NUM_OF_SPS) {
-		sh_css_blob_info = kmalloc(
-		    (sh_css_num_binaries - NUM_OF_SPS) *
-		    sizeof(*sh_css_blob_info), GFP_KERNEL);
+		sh_css_blob_info =
+			kmalloc_array(sh_css_num_binaries - NUM_OF_SPS,
+				      sizeof(*sh_css_blob_info), GFP_KERNEL);
 		if (!sh_css_blob_info)
 			return -ENOMEM;
 	} else {
-- 
2.34.1


