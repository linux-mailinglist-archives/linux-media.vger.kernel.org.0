Return-Path: <linux-media+bounces-59087-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uCzYJKJJ5GkzTgEAu9opvQ
	(envelope-from <linux-media+bounces-59087-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 19 Apr 2026 05:18:58 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 95437422FDC
	for <lists+linux-media@lfdr.de>; Sun, 19 Apr 2026 05:18:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 21BB730200CB
	for <lists+linux-media@lfdr.de>; Sun, 19 Apr 2026 03:16:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 009BB330B2D;
	Sun, 19 Apr 2026 03:16:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b="qeKwwkGJ"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B2293290BB
	for <linux-media@vger.kernel.org>; Sun, 19 Apr 2026 03:16:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776568577; cv=none; b=E8nqi6E+igyB2RZDStNOE9eDlUw1mdxQUP4AebOaNA3cY2GZLPg594EidaAJGGf3J7rYl/g7xrfUR02SmSqACj+7BAcOs5r+/W1sLN2O93UJh1IMmR7JaNYZrHE+CT25KGWBnnoX5+ENb4d8H+RnbQQTuCNNnpi6KqR+B5eGVb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776568577; c=relaxed/simple;
	bh=o1An2SvrCqr40SIRC+E6nswZR7lN//rkfQ0/TYvQBRg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=e1gpaC8JngnVR3JJUzIBGPmYATqYSBXaSqYhoQRhqK8RNjzLJUIiN05MshXuLJJ1xs4YxWSYz4BXhkVSIt2ZY/q+Lj9upmKV5IwHBbGrPtUJcpEQMANlmRqtQNZAghD7w0weRU61spNBY24puIYSzJH/zX6jLIBXd9ANZQ4R4S4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b=qeKwwkGJ; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 36AC73F1C0
	for <linux-media@vger.kernel.org>; Sun, 19 Apr 2026 03:16:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1776568560;
	bh=Z87teUv8a9vw/PuofVqXhMl3313Ral2SkrCndNJuZ8w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version;
	b=qeKwwkGJZVL2CaqLGBCL5AzELx6QHVBIhoIbwDN61LNvCZRiAFOTP8oYoNL1ku7hP
	 zri9XbJbrE+nlBHa4IhcW7t/Dyb1TVFUc/MI6mzGd+b1i9fYaNeFBXfk4IBfwWWOfr
	 /iZH8gvRnO2R0u8SH22vRGU80T9NMf1gnAkjdkVNNv6wDLodFHLyO0pZNYyys37ZCU
	 U/82TU6nBDlGAmZQEqSwjq293dUCcUicJim9iwtR0GaFjtmLKDmU9tLTLwEdEs0+pd
	 ZSI3h0lzaYvi7UZla/ZttuIg3VstqsxH9qF1s6aA5xfw2bbSjSyV4jxtYNqrtqqLST
	 oBs7JVwY3rMr5HJyfSpFquz+ARNrQchPnvOvWekFCOHaiMhKbTX+U83NOksPiAXgtd
	 128+fWQEat7zq7Sf/NEZxMzb6RK2ziYprf+OXFetqquFukKr0XlZlaerXhD6tNUXXb
	 nA3bSRgtl8kl0lSriDdJpoNPZPjmT8LcnVN+PZJCGiBjoba2qw/ALsewUDkZNHugaz
	 cisYU9RGDxLifB8uTHl10w3DWJKe9qVwMKsWQA1fp+PNUCEFA1DuncLg+sN+MN1Cni
	 UGYJpiwDCndEAGVL0AwA+Uj7EmkLWL4LauTUOuvBWeBD8xyEACHlkzjGP20e6pFcmP
	 j1e+zgcYwCzSp0qaot7ROXqg=
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b461b36990so18742325ad.3
        for <linux-media@vger.kernel.org>; Sat, 18 Apr 2026 20:16:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776568558; x=1777173358;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z87teUv8a9vw/PuofVqXhMl3313Ral2SkrCndNJuZ8w=;
        b=ICnMoLx4dZRQvH4o3VHI5/Hm78AiyP3Nv+DNilct22PUIvcbDsU2UtTCxUS8M4OPxI
         IsU2w9hsqpTppTdrjGww4SUEPHGV6VJQldHGA6jzkP4PYLPxpnQGt62H0PabUimIlQXp
         eBNdLscensJJye/X5zmWeWZtt0NGDcYVI57ZENngiMxEqJBU4+hI9rJYNyMouXyPtRy9
         kardPYByn6ZQse0D8hLWGy+EiI8DO2Wuk61t45mkJy7jE5K356FcNeRayDLLL6g75hP1
         5m6mtEOs/gv0v8C/jUEMSPEtjRbMe5Ft5TtbktfFOWkdasVrwzJLU9fSYTmiRVAgvjKU
         QsHg==
X-Gm-Message-State: AOJu0YxJXPRSrUHubBsNvoHPGsT+PHLzf8JOOA6adQ/oR+CKLBeaBCJp
	+FCtpiRUFlgYUZ6Hf01/r7Zke9+YVVB9UumIQI567nsm52wrl+Fyo6MIrZlHX8GLOqKzXJrhtH7
	WWLHzrYE/ylVC7Qf1300V09P4TPgRmX5xQ02FmfX//MZzojQa/9pM70rz5B+6fa0jyp5lrJMLpd
	rrX0cp
X-Gm-Gg: AeBDieuPMmZo9RWE6iCmmYXCWypyozFiC0kfvfG+nHvGoOJCmpzRfJ/5HMLAb20MSqE
	IyvapVNUJiKWfLSVTqd2MxkEOrL2GiQHCXizzVVLNyum95YKRJigoCDXq4EyFdrGt6FxTHiv/F9
	G441yubgyvqwjzCDAUP/yOR3AUyX0PZQOZROL2n6YJXOa1llxXRHjSv3gm63oooCQz5EIsHdOE7
	i5cATHYt8xVFrA6KRLpY5t5p3FlbuSBrCzM7c658Dt/kyfqNYb5GVwmlDwitlJ0kNzvhfu3Pm/Y
	cuvbLsHSI7M8pZZrPCTlnBztlPfC4Kiu6GFF+FEphMRi8hmiFgQipYolarCnenEV+rUvxr6Gxfs
	/oW1uU+TVbTFRciyQonL5aXrT5ffy6RluNR+FQk+uD5D5azK4jevJHQ==
X-Received: by 2002:a17:902:ce0a:b0:2b0:af2f:b27a with SMTP id d9443c01a7336-2b5f9ec3590mr84772545ad.11.1776568558437;
        Sat, 18 Apr 2026 20:15:58 -0700 (PDT)
X-Received: by 2002:a17:902:ce0a:b0:2b0:af2f:b27a with SMTP id d9443c01a7336-2b5f9ec3590mr84772395ad.11.1776568558047;
        Sat, 18 Apr 2026 20:15:58 -0700 (PDT)
Received: from localhost.localdomain ([120.159.24.52])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fa9fedf0sm74764235ad.6.2026.04.18.20.15.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Apr 2026 20:15:57 -0700 (PDT)
From: Changwei Zou <changwei.zou@canonical.com>
To: sakari.ailus@linux.intel.com
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mchehab@kernel.org,
	changwei.zou@canonical.com
Subject: [PATCH v2] media: i2c: ov5645: Correct Y_OFFSET value at 2592x1944 resolution
Date: Sun, 19 Apr 2026 13:15:50 +1000
Message-ID: <20260419031550.15368-1-changwei.zou@canonical.com>
X-Mailer: git-send-email 2.43.0
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
	DMARC_POLICY_ALLOW(-0.50)[canonical.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[canonical.com:s=20251003];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[canonical.com:+];
	TAGGED_FROM(0.00)[bounces-59087-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[changwei.zou@canonical.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[6];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,canonical.com:email,canonical.com:dkim,canonical.com:mid]
X-Rspamd-Queue-Id: 95437422FDC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The Y_OFFSET register at (0x3812, 0x3813) is set to 6, which is
inconsistent with the OV5645 datasheet and the X_OFFSET setting.
For consistency and clarity, change the value from 6 to 4.

height = (Y_ADDR_END - Y_OFFSET * 2 - Y_ADDR_START) + 1
   = (V(0x3806, 0x3807) - V(0x3812, 0x3813) * 2 - V(0x3802, 0x3803)) + 1
   = (0x079F - 4 * 2 - 0) + 1
   = (1951 - 8 - 0) + 1
   = 1943 + 1
   = 1944

Signed-off-by: Changwei Zou <changwei.zou@canonical.com>
---
 drivers/media/i2c/ov5645.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ov5645.c b/drivers/media/i2c/ov5645.c
index b10d408034a1..0af1b12c0989 100644
--- a/drivers/media/i2c/ov5645.c
+++ b/drivers/media/i2c/ov5645.c
@@ -479,7 +479,7 @@ static const struct reg_value ov5645_setting_full[] = {
 	{ 0x380d, 0x1c },
 	{ 0x380e, 0x07 },
 	{ 0x380f, 0xb0 },
-	{ 0x3813, 0x06 },
+	{ 0x3813, 0x04 },
 	{ 0x3814, 0x11 },
 	{ 0x3815, 0x11 },
 	{ 0x3820, 0x47 },
-- 
2.43.0


