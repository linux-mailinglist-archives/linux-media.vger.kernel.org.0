Return-Path: <linux-media+bounces-59903-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sJw1Hkhn8WmKggEAu9opvQ
	(envelope-from <linux-media+bounces-59903-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 04:04:56 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A481148E382
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 04:04:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AB21D306501E
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 02:04:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1BC637AA91;
	Wed, 29 Apr 2026 02:04:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XbaQViRX"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52FDC33CEB0
	for <linux-media@vger.kernel.org>; Wed, 29 Apr 2026 02:04:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777428253; cv=none; b=BWIwkY6WNRlg4yAVsO5R5q4TxVCaxgJNvpXyn5VmuzkQduFlmxgU9v3RBAiGUDjL3avtwnbDNavEPzSZaIeyGN6ODWCrPKV3Y05wL3/NYdmEZIoqcQNMeGaikviCN7NLyBcbBvIG/BlN1eFzu7BmNktFsupxxlBaet+rE6R6Lps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777428253; c=relaxed/simple;
	bh=pNGEUxqIkLRneAEGdlVmHnoRx/bC4NAD7Q0cryc4cmw=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=J//5fVWUhOLkEWmw2yB1e64dNutkdHjO0rVm7AGljbSB0hydimL0NxgISxMxA8ptnLljoXejbsP5fR+Nsfqc4Les5+nOCNxzKM9Y0agXMJJlUaX3uIfjCxZJxC2Q5YxTx0qH+YWA8/WqA/V3c2Xy8JSpIWl0wqHfimQ2fEUqNS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XbaQViRX; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-35e576110adso288209a91.0
        for <linux-media@vger.kernel.org>; Tue, 28 Apr 2026 19:04:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777428252; x=1778033052; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=sLFx8y717mpRNSW+VB91MFPyF4gRDJ4SBy20vx1VnSU=;
        b=XbaQViRXZ4ZExNlBODKhjNRUN1m7l/GHKhIJMiyTb4q5Ec3FNmvGnY1oS0kB/UvIoT
         sDsVbASEDTKEpfVSLlJuU4tPtvyejhRFRYYBTxq8uja7R+FzPQsoLHOEnoc1PkNs1FRe
         sULn8RXxjnyBb55196b8A43LZX926o4nIVNpjgsszUTrtGgnUximU0ZI7hfMs1nQqICk
         IHz5kx65G3V5kkF7ttzo2l/MBFthwMK8UBco/BrD89Yd5T1g2rTSiakB7lCQwR7x+Sjo
         vCwGf/jNwdWfb/eRKISnFeduH+lWqWxvllF6WuQRqyxI60qHAHfTz5WOvMHXW0cOC6Av
         z48Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777428252; x=1778033052;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sLFx8y717mpRNSW+VB91MFPyF4gRDJ4SBy20vx1VnSU=;
        b=Ad6EmlyyAbPqZBRbc56vy6n1qt2P22szJvu26eImL+sOds6c4ewtt5jkQkTYigcEu6
         VoQDbzcK/Reo+9qZxDr5xpn/NVJ7qAwWrcZCteQgntU8w3HiLCpg3SjHpT4E/P64B9kc
         Xe8QAPpGnyiep8PzkCQSM/yJO67nk6gjdEXjpQDM0I7plEbR/Psa3IMKfXsRXLKbVR7R
         lt3+lPLas/RrrwYjrVOPiTKFmEAFARTDILRQDksUcsKgVQmbWsXoMu37RIs/25l71OVk
         okDuGnDTfjY6LepEP71VhMwTAF+BQRpRWJLQAjiGN27wV86+aaLU7880FF3x7lryxMDh
         i1fQ==
X-Forwarded-Encrypted: i=1; AFNElJ/r9Me1L2IhiWmtWBT+45gABBYMBnVHbqabEFWN1bDp+JCtYwT6gwG4lD7ddKahe0TfyLfyapClYbC+Hw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3FlPoEBJulHhBok+KfsK3fFSqObcVdIstE+Y8ncgp4d1qInCe
	dkIN2VzCbvz1oJ5l4K9JfYGR2H3XaPA49+hfzy8WPMxvdhcgTqf2OTi0g44cY3av
X-Gm-Gg: AeBDietYuZwAOPCCrzvIZ6icc0haciXHDoAWoLLWV5s0yILaFoq0q/MdPmx1B2zE/vc
	sk+CYfK9Dhv72lHp0VCMpyJDkZtMF0L9SnurshSHztsnLO1HtoGVbJwkg/79eAqLCUdak9fI01g
	humPVp7yP0j2dLr2rCDUdDZcK2hY+kaVMElJIb1R0NlX+I3gm4iNfUXyq2iWX8LrOM38MNAxbTt
	Tz6gNMM6rcb/fOa+eZ+lvx97Rb6MRB9YoHH8Deb7wGSSJMuW2MEVUXm0PxflmTMH3kdyJd8pVWq
	GLE7dUt7ule6e3U8r/G4SuNRZSRmTcwASV7dVhDkBXLQaLBh+PvKY+xd2s9QyZZrlGaor7yv2L1
	qvdXC5SuEoT7gbx5t2oOjIWDV4Lfuymfu7suDzjmFxm0uqMvmKC9YTVdYDCPwWwz3OCjQT9zgmf
	WQdQP1x9jiQTKkAVm7R7Qbzb216MO0IA6nWska3PPY7D8rX44R0N8lEUKuhm6g6q5kdLGH+cDl4
	DzzZFCOLAtTAuWXws9zEPN7JHw=
X-Received: by 2002:a17:90b:584b:b0:35e:579a:7e9a with SMTP id 98e67ed59e1d1-364a2612c72mr963116a91.7.1777428251574;
        Tue, 28 Apr 2026 19:04:11 -0700 (PDT)
Received: from archlinux (S010680dac2bce256.cg.shawcable.net. [174.0.186.197])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-364a119e0b4sm366943a91.5.2026.04.28.19.04.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 19:04:11 -0700 (PDT)
From: auth <skunkolee@gmail.com>
To: Andy Shevchenko <andy@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Kees Cook <kees@kernel.org>,
	auth <skunkolee@gmail.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Ingo Molnar <mingo@kernel.org>,
	linux-kernel@vger.kernel.org (open list:INTEL MID (Mobile Internet Device) PLATFORM),
	linux-media@vger.kernel.org (open list:STAGING - ATOMISP DRIVER),
	linux-staging@lists.linux.dev (open list:STAGING SUBSYSTEM)
Subject: [PATCH] staging: media: atomisp: ov2722: clean up ov2722_startup()
Date: Tue, 28 Apr 2026 20:03:31 -0600
Message-ID: <20260429020335.83143-1-skunkolee@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: A481148E382
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-59903-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,linux.intel.com,linuxfoundation.org,gmail.com,vger.kernel.org,lists.linux.dev];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[skunkolee@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

Replace misleading comment with description of the function's purpose. Also replace return ret with return 0 since ret is guaranteed to be zero at that point.

Signed-off-by: auth <skunkolee@gmail.com>
---
 drivers/staging/media/atomisp/i2c/atomisp-ov2722.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c b/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c
index 2c41c496daa6..5f3712d6b81f 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c
@@ -599,7 +599,7 @@ static int ov2722_s_power(struct v4l2_subdev *sd, int on)
 	return ret;
 }
 
-/* TODO: remove it. */
+/* Initialize OV2722 sensor */
 static int ov2722_startup(struct v4l2_subdev *sd)
 {
 	struct ov2722_device *dev = to_ov2722_sensor(sd);
@@ -619,7 +619,7 @@ static int ov2722_startup(struct v4l2_subdev *sd)
 		return ret;
 	}
 
-	return ret;
+	return 0;
 }
 
 static int ov2722_set_fmt(struct v4l2_subdev *sd,
-- 
2.54.0


