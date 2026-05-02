Return-Path: <linux-media+bounces-60174-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id RvuIGgG19WnrOAIAu9opvQ
	(envelope-from <linux-media+bounces-60174-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 02 May 2026 10:25:37 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id F20794B1717
	for <lists+linux-media@lfdr.de>; Sat, 02 May 2026 10:25:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 256093010B89
	for <lists+linux-media@lfdr.de>; Sat,  2 May 2026 08:25:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C97F82FF170;
	Sat,  2 May 2026 08:25:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TbHOWqF7"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 181D22F4A0C
	for <linux-media@vger.kernel.org>; Sat,  2 May 2026 08:25:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777710327; cv=none; b=ce+2k+R2eyTvSFWClJv/ZT3XJqrI7GUU1H0T+Q/j9X6AUJ/CV43Z7kZIzsK8ZvgN84onC8eC92cda7b3cCo7tNqmh6NnaUWljaWnimQGjkxrRMfoKMOMU4/CecGjYB5phkY/QZsLFQvrBwnT2NEXev7b34NViSww/Qf2W9zDEKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777710327; c=relaxed/simple;
	bh=0WAZDhluGVrY0GiqCvIRLbyr+zl9TYqg+4LeOUz2ppk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uaNCi8+1HlpXgRoh0dn3Cry2os6igF2BsWV2U1tSboK5lVuWBwwEQxHDNP9y3y15Fjbh7P3SxaZQAkZX78NMZ2oisTWno9OqpkW9MBxVO1YMcr0dnvYHj0r2SWaQ8ljWrQV1fQvl8hR0QxzlsZ7Nw5l0xU7SaWtl0IxgbwFT/RM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TbHOWqF7; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-83537a80ab6so53681b3a.1
        for <linux-media@vger.kernel.org>; Sat, 02 May 2026 01:25:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777710325; x=1778315125; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LDLzCL5jMxLJXRki96FPHhfOoa6lvhYX7V+gzTmTkqU=;
        b=TbHOWqF7d8vAq0/E0G4GA4MWa6tZlfiDr5ZJnpKgmsO2dp/xe3gWcMKAV9NBcnPuRQ
         djud4dHn4CoGlxcJSDhqEUk8vwdLJHHy/t2gxCMEVa14tJFIQ8+V1gZCSgzgxNZJc0h2
         4Osq7JvjPuH9CI+nqSxgtnXm+W0wYnvo3soJwYLfmy4U0wGHT2GQ8k4GnrTNHG1lu5Px
         ZfqlpxTBpJYmJd7s23d13h5x/BoV/CWcctDcdtu8CBx33R6W59b2RDU3/pvUG+sT/ur9
         k93LIkq8tsytPmF7A95wmj7ZffAxdb0wPqHy4OCz1NidmhfYeWeZpU3vOdv4cP5hKEym
         IwKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777710325; x=1778315125;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LDLzCL5jMxLJXRki96FPHhfOoa6lvhYX7V+gzTmTkqU=;
        b=NdvuU/Nrfb1t/LSuSrzgqlfqt8uFNdhMFLDErxJXvjGe8c0pMJtxSQNf36loQIr0c+
         DXDh9oc4HYF/oG4GhvHcpn5ikGWE/lBtxihzk2SJqWK7b/kXsZZy3ejKUGgVsf5lzgFS
         /dkyWO7/sIgAA7n7uDHw2Hd0YP2AxbNQsM0TxXHkARfd2rhyfgvuRc6n0SQJwbx+saT/
         I1By6L+nBI7a9asAkH3OIMz3T35hjkxDU0+Wv9ryq5/eI8FZ8EjZemyF0+gIqgoj2GBw
         RYVv9wnonUTvL5QwwPdgAEquz1LzjSmvuZkg0hJsAIvX5n3FusZX5/qK4QRWoc1XrIce
         /Jfg==
X-Forwarded-Encrypted: i=1; AFNElJ94O4Q1Y4A3vs8+KBNH+fjbJxOWa125RJ63ctukndZzLUvmHv/3PllK6SR3kjrpDj6ywrT9770mYHk5rg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4drw1mGOncqx/63sciF2oxYHICiuWS9T+M9nLrba12JTZ5oVk
	qq03FCSOIIQZE2/be2D3DeA2cHNK1qTLW3zj+ZCLkXYSfQtpqLGE4xSD
X-Gm-Gg: AeBDiesbnCgZ24EGF+NZ6/cZUjql5jFn7vL0MnuxcGPQ7OvTXdiQ16qoMM0bMQquUXb
	nk27jBFBSjPSc5H24wdvht99zprMpy8K+xhuv/T4zzWxgtBqmmubcTTu4VDbPv9Nb18wI4vPk1T
	cn7nIabeHqGQhZAq2JwqPHLTk3cenBPEJqJ3sqlqVQFFLxyO6N696FEQOL/1acyXY+LfKfTVcbu
	PkQOgwQqiA/Iz9zaJsylVN73jm786H2UWy0kg4c8Vx3fz4IcIoFDfixwNqEQ3cmlO+5JqDf3dMj
	QyvhPXh/O2yAqLpnwR1WGUptbkQ3WrWY50UDoLTbXRzTVRnAHSg6YtGrJbask3TznK6YnPKDUTO
	m7T+Y7QwY4+CHB+4s5Z7yb3eUyI0y5C4bMW9ZiCezkza1m61XofT7iDfQvPtjvMiofpHrIPVPWW
	KnemURGGwh18G2Ept8dXHoc/5sVuj6N4j505kiABLi/RusJzVPXrIE
X-Received: by 2002:a05:6a00:b904:b0:82d:162c:581f with SMTP id d2e1a72fcca58-8352d2efbfcmr2346847b3a.48.1777710325373;
        Sat, 02 May 2026 01:25:25 -0700 (PDT)
Received: from shirinkaul.localdomain ([122.172.84.203])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8351d08065asm4133233b3a.3.2026.05.02.01.25.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 May 2026 01:25:24 -0700 (PDT)
From: Shirin Kaul <shirin.kaul11@gmail.com>
To: linux-staging@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	hansg@kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	andy@kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Shirin Kaul <shirin.kaul11@gmail.com>
Subject: [PATCH] staging: atomisp: isp: xnr 3.0 fix whitespace issue
Date: Sat,  2 May 2026 08:25:16 +0000
Message-ID: <20260502082516.16302-1-shirin.kaul11@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: F20794B1717
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60174-lists,linux-media=lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[shirinkaul11@gmail.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,kernel.org,linux.intel.com,vger.kernel.org,gmail.com];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.988];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-media];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FROM_HAS_DN(0.00)[]

Fix spaces by replacing them with tabs in function calls to comply
with kernel coding style.

Signed-off-by: Shirin Kaul <shirin.kaul11@gmail.com>
---
 .../kernels/xnr/xnr_3.0/ia_css_xnr3.host.c    | 20 +++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/xnr/xnr_3.0/ia_css_xnr3.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/xnr/xnr_3.0/ia_css_xnr3.host.c
index e90dea58215b..3da73001d645 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/xnr/xnr_3.0/ia_css_xnr3.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/xnr/xnr_3.0/ia_css_xnr3.host.c
@@ -34,8 +34,8 @@ static const s16 x[XNR3_LOOK_UP_TABLE_POINTS] = {
 
 static const s16 a[XNR3_LOOK_UP_TABLE_POINTS] = {
 	-7213, -5580, -4371, -3421, -2722, -2159, -6950, -5585,
-	    -4529, -3697, -3010, -2485, -2070, -1727, -1428, 0
-    };
+	-4529, -3697, -3010, -2485, -2070, -1727, -1428, 0
+	};
 
 static const s16 b[XNR3_LOOK_UP_TABLE_POINTS] = {
 	4096, 3603, 3178, 2811, 2497, 2226, 1990, 1783,
@@ -125,9 +125,9 @@ compute_blending(int strength)
 
 void
 ia_css_xnr3_encode(
-    struct sh_css_isp_xnr3_params *to,
-    const struct ia_css_xnr3_config *from,
-    unsigned int size)
+	struct sh_css_isp_xnr3_params *to,
+	const struct ia_css_xnr3_config *from,
+	unsigned int size)
 {
 	int kernel_size = XNR_FILTER_SIZE;
 	int adjust_factor = roundup_pow_of_two(kernel_size);
@@ -180,9 +180,9 @@ ia_css_xnr3_encode(
 */
 void
 ia_css_xnr3_vmem_encode(
-    struct sh_css_isp_xnr3_vmem_params *to,
-    const struct ia_css_xnr3_config *from,
-    unsigned int size)
+	struct sh_css_isp_xnr3_vmem_params *to,
+	const struct ia_css_xnr3_config *from,
+	unsigned int size)
 {
 	unsigned int i, j, base;
 	const unsigned int total_blocks = 4;
@@ -232,8 +232,8 @@ ia_css_xnr3_vmem_encode(
 /* Dummy Function added as the tool expects it*/
 void
 ia_css_xnr3_debug_dtrace(
-    const struct ia_css_xnr3_config *config,
-    unsigned int level)
+	const struct ia_css_xnr3_config *config,
+	unsigned int level)
 {
 	(void)config;
 	(void)level;
-- 
2.43.0


