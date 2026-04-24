Return-Path: <linux-media+bounces-59444-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GARGAsbA6mkDDQAAu9opvQ
	(envelope-from <linux-media+bounces-59444-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2026 03:00:54 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 71F53458A2D
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2026 03:00:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 07FC63011BDD
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2026 01:00:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DD92238166;
	Fri, 24 Apr 2026 01:00:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mKI9JnH0"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 073C529408
	for <linux-media@vger.kernel.org>; Fri, 24 Apr 2026 01:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776992424; cv=none; b=i57Xj1yXJI2/de66NLs7Bu5ckxWPH7QWckIlNsEwN76UZK/Uy5kWp6uP2nwGVYTsmo8LlRyGCphuXO0x3pmxapjaQh53ihR7Iq7c4+XQDLWgYwizT33WNJ9gVlsXoUXgngKIAD7ePajh6jhdHat9mkGrmJtj7017iq5rK5ZKpAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776992424; c=relaxed/simple;
	bh=seuihVKfF3PGLP66pmmk7T9A/+XxvxyR9hIw3SpiflA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=FFM+0ZlxnYclHld9EVTwiR+XId8rEV5JPU6rKFb/AKoLPhAkM1lsTjUqamGAZiujz4VIx7fYvFcWHClWTt8U4XPzfloR52Pt6tUrdRhUaYE60gswlBocGDFeBboZkAO1ptMbuH1K1h5n04wKjl3Qo5STiRIOs2M+CTXLFKXNOJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mKI9JnH0; arc=none smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-2d8fa0fadfeso3974729eec.1
        for <linux-media@vger.kernel.org>; Thu, 23 Apr 2026 18:00:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776992422; x=1777597222; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OhgEHn2R+5oQuceTp+T/WxlCQ7K8Q2yqWLLVCK2KJyY=;
        b=mKI9JnH0KqW5MKN6oG3YrpGZgXZOKuS0GAysSoQ7cMkjJYSsPwXxFH9PjjaOJUanzA
         7PNK7yo6qE+pg5oshWWzbu7YP7Fwg83YxPTxdba0yCUp7msBP85S7mk7n/c9+UYungtP
         v5Xw9pjEEKEEgzXX49Zebu4nhcyHB6K3+kaKoarECVRHBbcbnwtj1wsgRIM1RScI5/RW
         LJbFiHQM+QliBhxADcklZJ1Pn6iVkJvrKQ72IEOznJpk6v5Y8otswWMoi0dl9FWZ/ld3
         wE+0VcIa8jWmYEKajIIwBasIV2nl/i1cwW8Br+zpq9MWJ7OkyavHxQayfrs7moxJFNVx
         eBrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776992422; x=1777597222;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OhgEHn2R+5oQuceTp+T/WxlCQ7K8Q2yqWLLVCK2KJyY=;
        b=bB3snyK+ciz32QcndijgUsP2eHc6uvJcfBxhEUZiwzkk+3T0XcvP8c6EVE+/gAZ9Bg
         S5vVHATQG9wo0IcnLe2W0K4RMGrvSdz3fSAA3B61mmqD6fnIhAO8tp57Cny55bR3zDqd
         rNhJysF6mgiyPajcArN8ZqAzuogyRtVTVhwKsnn9yg8Y3lHEp9NudhyggpQEZPBeKjkS
         83A4ZWSTLDdY/1HDjXuTDcsqrNHCeMSUmasz62gxRnbxKRa/erDG22BIr2qAvXYqrTdg
         yFrznpZ+K9we23dfJFs6gV3LIKsQGfe/cw4uDcFbVjKy75du6aSmLkhDT9nZpj45zwZC
         1mvQ==
X-Forwarded-Encrypted: i=1; AFNElJ8qFwNX19cOQ30/zUCkBkEbM20G1ObYWQqLWrLNSMFWYrqAet7nxlMIyoVZpslBAXNTTz/6uDQeSbp8+w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw047PhrL47lzjdi24DHn7VgFaRLYFsJ73wmdVnZcWX1dt11sam
	OUx7aFHB9opNGSWdQLgvH+4I/gHWwkm7O3PGL16W9Es9pTR8wUqqZNPg
X-Gm-Gg: AeBDiet5ovvAcxXW4zl8gSowAaseTIknHWIOLPXiSgbjyKNZbkM+nyVSmEK8CO+hSM3
	VHaVmLGbiwu3LsNTa7DgG+PosNv1gz26XcIhpPsQQD5BlwsaGZ6D16mqEdxgwFChxz2Lg9hV18c
	XnjDCx1CeOrG4rd0UM3wrwuJHeeQ78vIlyNl/wQocA9XFj4GWBeELsVK9f6XsTRxl7bAKDLpNLd
	PplbvIgFreEnBwlLHlLa4vlVqeYz6mlt4pYXpuuuahsRk8JVobJKauBpiE4W8pONt5aVoHnaG+K
	7jWDLMVV1wSThBN4GMi/o7Q1L2380gZ1rptOSFbyxrrGI+m6HZmtG2j6Op7peXBYAhear5YP+9Z
	jm6sTXL530VFSoBTWk59NLciyHjs60a/lJyIa+DBN+5T4DwZxODqI4pj4Jaf0CO76KK6USGBzMa
	V2PeMGv9BxNVadOfhNrRukiXN2MJEtQY8=
X-Received: by 2002:a05:7301:3d19:b0:2c0:beb1:8507 with SMTP id 5a478bee46e88-2e41a1e3fabmr11649995eec.0.1776992421616;
        Thu, 23 Apr 2026 18:00:21 -0700 (PDT)
Received: from localhost ([201.16.171.137])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e53d8b3dd9sm29661528eec.27.2026.04.23.18.00.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 18:00:20 -0700 (PDT)
From: Mylena Angelica <mylena.asf@gmail.com>
To: hansg@kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	andy@kernel.org,
	gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Cc: ~lkcamp/patches@lists.sr.ht,
	koike@igalia.com,
	Mylena Angelica <mylena.asf@gmail.com>
Subject: [PATCH] media: atomisp: pci: hive_isp_css_common: host: vmem: fix line ending with '('
Date: Thu, 23 Apr 2026 22:00:08 -0300
Message-Id: <20260424010008.325784-1-mylena.asf@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 71F53458A2D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-59444-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	MAILSPIKE_FAIL(0.00)[2600:3c0a:e001:db::12fc:5321:query timed out];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[lists.sr.ht,igalia.com,gmail.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[mylenaasf@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

Adjust the formatting of the function call so the line no longer ends
with '(', fixing the checkpatch warning in vmem.c

Signed-off-by: Mylena Angelica <mylena.asf@gmail.com>

---

Hello!! This is is my first patch,I appreciate any feedback, thanks!
---
 .../media/atomisp/pci/hive_isp_css_common/host/vmem.c     | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/vmem.c b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/vmem.c
index 722b684fbc37..3831092154d1 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/vmem.c
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/vmem.c
@@ -38,12 +38,8 @@ inv_subword(hive_uedge w, unsigned int start, unsigned int end)
 #define move_word(target, target_bit, src) move_subword(target, target_bit, src, 0, uedge_bits)
 
 static void
-move_subword(
-    hive_uedge *target,
-    unsigned int target_bit,
-    hive_uedge src,
-    unsigned int src_start,
-    unsigned int src_end)
+move_subword(hive_uedge *target, unsigned int target_bit, hive_uedge src, unsigned int src_start,
+	     unsigned int src_end)
 {
 	unsigned int start_elem = target_bit / uedge_bits;
 	unsigned int start_bit  = target_bit % uedge_bits;
-- 
2.39.5


