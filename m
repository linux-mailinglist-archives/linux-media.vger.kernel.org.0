Return-Path: <linux-media+bounces-60207-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qMDfL42K92lPiwIAu9opvQ
	(envelope-from <linux-media+bounces-60207-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 03 May 2026 19:49:01 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 61D8C4B6D60
	for <lists+linux-media@lfdr.de>; Sun, 03 May 2026 19:49:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8B35B30068F5
	for <lists+linux-media@lfdr.de>; Sun,  3 May 2026 17:48:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7401939A045;
	Sun,  3 May 2026 17:48:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G5aXWjIO"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0322A387590
	for <linux-media@vger.kernel.org>; Sun,  3 May 2026 17:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777830536; cv=none; b=lumkaoOWTZUggufdOOAHnRsQI3Fjeee33hSr3QV8aZB25kBAHBSvG+BpDj6wnL2ELxx+nqBQeRH5VeJgpZ7iXYgRFCpQlb/HWIYElmNiXBNS8KW3UI9RexBHZlG4xqmFyoQ+HVJNolyfOoft1CgbPFAcILrLCSoghMxpQfycs4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777830536; c=relaxed/simple;
	bh=/VBCVobtHzG7OXxoZIYCYhtm+ZiWDosbxNPjzk1hMxU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=tEd1JlDeUjcWJ2w1uPIKTiUMzN+qK8zWa6UPvETYCmLatCMN2pcBvrqlRvDzaKK65kZSnh9/f1/rKD8oHzQ7/e5ZMJ5LoStuKYJUSSpd2XFCEfSY3L+TYp2JEqeGXQxjkpgCSPZniY5XxyjBtc9hrqfTLaGZ2BuWDQZAZjSneuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G5aXWjIO; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-44b729aa7c5so104778f8f.2
        for <linux-media@vger.kernel.org>; Sun, 03 May 2026 10:48:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777830533; x=1778435333; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qSI2mfYYxwzI4OYRUhcEFSauAAw2yTVtrnw16ToaeQA=;
        b=G5aXWjIOW7iyb9nAv1lmJINjyhqxlcRRfZRGrGIEsLm6IWtA3IGwYgFWgNWgc6tljj
         23o4O8hEiCwSMVNjnHGA4ZzgeA7Denu//mZFGLXb63PjOtoAqPNI9h64R2jZeeIuNMlb
         gRkR3aw/B0BZaSQfGlf1N9/2JvmfOn4UVZZ1MDC9cWunql+5+0pDwqEf7j1ZmRQM4E1U
         dIsEa8iSUp1tg9rgEe3/u5nDUrLRp8xCTaA1M8aJUdTQLuKqv0USPCPpcsedDaJEbeYf
         DIHPvt7cmbAw+VGXp4HfujB+A7WMBp415WZDri2ZMFklAYn6Xx1k4k7t8ZC86Pq0BYV3
         Z44Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777830533; x=1778435333;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qSI2mfYYxwzI4OYRUhcEFSauAAw2yTVtrnw16ToaeQA=;
        b=QUM2UTIWPlte6rQzmn/I7Tojn4lpIF1GpUZyztUn9FBl/fdEwn5sfEVcEassEijyxF
         KQirUnqx9qScfwVxSvJn7ck5YY/PAOf/a4C06jAGqZcLVWJnHASV9M446KEIoMMKCuL3
         mXCwPV8tKAwHH8Z/ImdEgKAkYK8VopHWRndGr54bSKc/yu5wYHSIzbursCB1XFQQHU4C
         iYEJkFwnTn+gurRfFImJPPEQXObOvCFu7vFmtMN4vUUaTCQ5S5KtWhW1iJm4X82YETwV
         vbpyHJ+hUChnFa/jjEn/uJN0OWepGaJY/qDoJmPGGsaKV1HsO2qsxLrcxlK99OY90CVo
         jxOA==
X-Forwarded-Encrypted: i=1; AFNElJ+dXvMpVyrn5w8TPh+Ay84QlWZGSz6320EQ5C+mLzKdaYHny1eT4ljtjkDUNYbSqD9zCtDtIKI97gb+Zw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxAn/aoKHsfaHij0906SM80biBWsZXX/+Bid+xj7+CzO2qC6JFg
	tx6SBuRraC3OkmwuuXJrSrfsCsUCUbNlDa8lQWrvDYct6zJwzr8XALYD
X-Gm-Gg: AeBDieuwLUnAw+qd+py6oGo5zMw8b1bBnWrM7Hyz4CS7Z2bCZg8bARZHEDwCqk+lw1L
	wOZBrfsff+pwoSEijeDmsNQ+vVsQkmKfq1JDwvDvbNbi9SZaFCnNt+6wUXsSNyvOQcY+/QpxcMN
	j6VIrHFp7N4IevLC/WzHoZFdrtXeLe1TZM7+4wToNvpwrpkWvyfotSHA6mcJ3JitSEJ6gYuZnjw
	2BXfDtadvf41Xu/Rh3X+zDLZzVUXYIEwqN8O8jjHVA3dd90bYpgSx2pytTDDnMTV7KmaTLlZatI
	o7RjwKduOE9XbW0aDG4YEQj6dieCtOpImNicGp8MNQHttb4EUQiAazT4eMS67+pbsdpkDaHeZ+D
	U7lbz/1ZJqiUH4QuVAGvRKQJllXduQ6XwVkfdM8J7Tj1Ny9OT1yRvVmvd8rrE69k9lvJG+sk8hZ
	mj1BI6nkShW0sExlhsvA1HhhEndeMFM/YVwnLbie2Kw1SqVOWpHOSnzMw=
X-Received: by 2002:adf:e00b:0:20b0:449:4c24:b6c6 with SMTP id ffacd0b85a97d-44bb35dbda5mr3147314f8f.2.1777830533210;
        Sun, 03 May 2026 10:48:53 -0700 (PDT)
Received: from localhost.localdomain ([82.215.118.79])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-44a986aab44sm21155287f8f.29.2026.05.03.10.48.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 May 2026 10:48:52 -0700 (PDT)
From: Stepan Ionichev <sozdayvek@gmail.com>
To: hansg@kernel.org
Cc: mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	andy@kernel.org,
	gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Stepan Ionichev <sozdayvek@gmail.com>
Subject: [PATCH] staging: media: atomisp: fix typos in input_formatter_rst() comment
Date: Sun,  3 May 2026 21:47:55 +0500
Message-Id: <20260503164755.1899-1-sozdayvek@gmail.com>
X-Mailer: git-send-email 2.33.0.windows.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 61D8C4B6D60
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,linux.intel.com,linuxfoundation.org,vger.kernel.org,lists.linux.dev,gmail.com];
	TAGGED_FROM(0.00)[bounces-60207-lists,linux-media=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sozdayvek@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-media];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]

Fix two typos in the TEMPORARY HACK comment in input_formatter_rst():

  WICH         -> WHICH
  STREAM2MEMRY -> STREAM2MEMORY

No functional change.

Signed-off-by: Stepan Ionichev <sozdayvek@gmail.com>
---
 .../atomisp/pci/hive_isp_css_common/host/input_formatter.c      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_formatter.c b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_formatter.c
index 40b3f1e48..e15fb7e0d 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_formatter.c
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_formatter.c
@@ -59,7 +59,7 @@ void input_formatter_rst(
 	rst = HIVE_IF_SRST_MASK[ID];
 
 	/* TEMPORARY HACK: THIS RESET BREAKS THE METADATA FEATURE
-	 * WICH USES THE STREAM2MEMRY BLOCK.
+	 * WHICH USES THE STREAM2MEMORY BLOCK.
 	 * MUST BE FIXED PROPERLY
 	 */
 	if (!HIVE_IF_BIN_COPY[ID]) {
-- 
2.33.0.windows.2


