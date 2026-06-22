Return-Path: <linux-media+bounces-65395-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 8xeiNNCBOWpZugcAu9opvQ
	(envelope-from <linux-media+bounces-65395-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 22 Jun 2026 20:41:20 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F4D66B1D35
	for <lists+linux-media@lfdr.de>; Mon, 22 Jun 2026 20:41:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=J51aE2C2;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65395-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-65395-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A659F3034BE3
	for <lists+linux-media@lfdr.de>; Mon, 22 Jun 2026 18:41:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2255346AF1;
	Mon, 22 Jun 2026 18:41:09 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10ED617C211
	for <linux-media@vger.kernel.org>; Mon, 22 Jun 2026 18:41:07 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782153669; cv=none; b=mpYoK78Fd9w/xPD9J5qk5al4PM3Vv+vIVE06WD6QcfOgOvqckJG4QLdCEHIYMoufYqytusFQpvnq4NlLX488pIX+UDkyIQPN1Ar94HFOp/tVZwcoPmZmnmryHXNqAyYXF79kJf1k9iQ7RZ3eIEfHC8of5zcT6RXyciVAWKEsI0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782153669; c=relaxed/simple;
	bh=QeEq5i4Tu4Wan8t2fXqRKe8h0/XaRyVMXGFLscEryHA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FTd9Esc0bbzylt3k9PifjC5iaQROWfe/R3CAr0Iv/ahX8eErPVUi6/hFg8LYUVOtiUzGK1As6WEi0mrH+ODnHLDbPiLj+sK+xX1efsY2Pxb9KD3GuqhxIzsH5iYiZnN+xGgPKrKM7nd/59d2rbtOK6k6jkfASbStgSOJuiOtU40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J51aE2C2; arc=none smtp.client-ip=209.85.214.180
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2c6c101aeafso30640535ad.0
        for <linux-media@vger.kernel.org>; Mon, 22 Jun 2026 11:41:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782153667; x=1782758467; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RcUIRySx3K6VFSNCzqOOyoprOtBlK+mP3pHOAXeTPA8=;
        b=J51aE2C27lLY8FUxHGNqAMRigDBLD2vAeTFFJyyQPqq9UW5ZlSb3F0dU2ovGEPfqqN
         VhZnU9fkAvgNsyVqFFwasXajxAqabEsBpzTJcpuNQm+YPNXTkwsfSd+J3IssMRybngz0
         ze06jkWyEoA4FR6Hh77OLr15znuNCGSjpUND9zxkHrFDF9z4SHOdPbvy1J+cVnnwWOJE
         qogLyakmRJ8JYxWnJsKJ/8AWgmCuuCGVnodsbU8JIC+wp+nqqsCfqLcADPyMmiYebcSQ
         lmD/NcnhZp/yY5WRz9dCKk+anIRaYnGlW0VOawq5PQGWdy/1RQm1rFjMdRel+GP32fDL
         POtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782153667; x=1782758467;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RcUIRySx3K6VFSNCzqOOyoprOtBlK+mP3pHOAXeTPA8=;
        b=q78P3SkrTD8VUx3+4Ah36WiGIIzG1YBfMdBbxogPmTuOvoRUAClpGqzTheTaQSHiN2
         bgT/QyQTljygUVaBwY0k7ICVyrP+3jqAxzPk73YkDx7Gnu7aXCRNbrHQhrLKGJSIlS4g
         +5eYdu5yzWgaebEK7XIpWD2pns7QptLMr4cZWtgSQWBqJwIJ7qpfcPcRkdaA2rsWt5QN
         LatVBs/csYZDqYLsw6QcSTmnioZt5IPvbeX1ORaS24wnCJ3yzPvOPfxsb/yM8mOGhg9n
         uHvz8ahBPk1rdHf/NI7rG8rwm8uY3PbjCiNIF3/B03S7Y0V4hJKNerhjc5r8OvEsIRJl
         YLeg==
X-Gm-Message-State: AOJu0Yz9jeigVO4MROKUyQJ35JfPTaha6XNcLqriDBH2m1L+z4iZb3Bz
	k1fgISP9JNzWdpaAbcEodpgTCaRObyErfsldcMAUnT8BYWZgTZS/JFSz
X-Gm-Gg: AfdE7cmgO+0y5oaBb96llRxZ+xpK9jEJIHJ6C+t39PuiD/UFVsNAeO9RBpbpsIreQiS
	Q4KtV+A5mA3hlw1YrVNmZKdv43yQRWfmvKqdFWfPlwh1htimFlexvB2OPKdaWtFjy5+c3auBvjc
	/AH7GnFWQIWc/OnZLsuDHqJerJ3SG1zbxiCJJ6xpsvlra/MmcWP5rByKDVD9YvZXylHCE1RpWzn
	5ybN4LUWELCFDT+lblNseXUK4+9UQzNtPRNJwDJWASUTj0kE+wS+7XIZTkTVO5WWOGGd9XdsUmc
	vW2cVo0EbnVgYFmbwsU3X3VdJpM2jSAt8Su6DqUhsZr3PRptZv3IGofO5nq1ruewnwAHbXRFF2b
	J2hl2h98RZs8gLgOiBRdn99XtgA+fIkB2yH5nnj9f6LXeXFujFLhRvmIlcdh+eKX7gdtbw0r1mM
	i1kp+sZs5hAnmpHYpMgx9qWPjFI0b705tYVY1r0yr10GSg4aqTGUSqD0XXpG88ev4vYpOt6hcdL
	P5ih4L+
X-Received: by 2002:a17:903:1a45:b0:2bf:3309:ecce with SMTP id d9443c01a7336-2c71901c61fmr165658945ad.28.1782153667110;
        Mon, 22 Jun 2026 11:41:07 -0700 (PDT)
Received: from localhost.localdomain ([115.99.236.201])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7439f901bsm82452205ad.44.2026.06.22.11.41.03
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 22 Jun 2026 11:41:06 -0700 (PDT)
From: Mani Bharadwaj <manibharadwajcr@gmail.com>
To: hansg@kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	andy@kernel.org,
	gregkh@linuxfoundation.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Mani Bharadwaj <manibharadwajcr@gmail.com>
Subject: [PATCH v3] staging: media: atomisp: anr: move trailing statement to its own line
Date: Tue, 23 Jun 2026 00:11:00 +0530
Message-ID: <20260622184100.33490-1-manibharadwajcr@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.linux.dev,gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-65395-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:hansg@kernel.org,m:mchehab@kernel.org,m:sakari.ailus@linux.intel.com,m:andy@kernel.org,m:gregkh@linuxfoundation.org,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-staging@lists.linux.dev,m:manibharadwajcr@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[manibharadwajcr@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[manibharadwajcr@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2F4D66B1D35

Move the return statement in ia_css_anr_dump() to its own line
to fix the following checkpatch error:

  ERROR: trailing statements should be on next line

No functional change.

Changes in v3:
- Fix subject prefix: add missing 'media:' subsystem tag
  per Media CI bot feedback.

Signed-off-by: Mani Bharadwaj <manibharadwajcr@gmail.com>
---
 .../atomisp/pci/isp/kernels/anr/anr_1.0/ia_css_anr.host.c      | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/anr/anr_1.0/ia_css_anr.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/anr/anr_1.0/ia_css_anr.host.c
index 899d56623..fd50a20ac 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/anr/anr_1.0/ia_css_anr.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/anr/anr_1.0/ia_css_anr.host.c
@@ -36,7 +36,8 @@ ia_css_anr_dump(
     const struct sh_css_isp_anr_params *anr,
     unsigned int level)
 {
-	if (!anr) return;
+	if (!anr)
+		return;
 	ia_css_debug_dtrace(level, "Advance Noise Reduction:\n");
 	ia_css_debug_dtrace(level, "\t%-32s = %d\n",
 			    "anr_threshold", anr->threshold);
-- 
2.54.0


