Return-Path: <linux-media+bounces-56820-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GPYAAERKwmnvbAQAu9opvQ
	(envelope-from <linux-media+bounces-56820-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 09:24:36 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 53FAD3048DB
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 09:24:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C9B983273776
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 08:12:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80FF73D5656;
	Tue, 24 Mar 2026 08:10:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CRzjxqWv"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62E9F3D6CB7
	for <linux-media@vger.kernel.org>; Tue, 24 Mar 2026 08:10:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774339831; cv=none; b=JWHK6aBzI9ZZ19vNvVa8ToFHGJgTqvidXWHXf5TqhAoB3tt/FW4GwIIGEkUAtVr4qsIADUD9x3H1Af3uLErv4/tM6oopKzQHUXq5Umysf07ferU7YdY0ILQHLyrSItwlgfa3FSUZxdDR/BJBaNE5Onuv8ad6oAuIygKe5PHdyJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774339831; c=relaxed/simple;
	bh=N7lxxaqgYKDqE6wKjVbixL4LiZ8Yoas6+c/aXC/q1ag=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=u87pQ0v9/Crg/T63O9QR873uCP7x1GboREFDHSUGNtL8ez4CjkeUGo30dhYDbUWboLKZj7zOrmR3P2z44dW6ip8cJLhYxdVVOjfDoWnDqMoEDsixakSMiyc5glGywIQP6oTn/Z/rVX3/n0+pyUluoBUKrLFLipmUmUChcCdrKhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CRzjxqWv; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-82a07738118so1948972b3a.0
        for <linux-media@vger.kernel.org>; Tue, 24 Mar 2026 01:10:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774339824; x=1774944624; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=56cZFxb5hXm4BTweWoeqBg2xG79G3LuwO40uREqeFpQ=;
        b=CRzjxqWvu1kPe+GyO6NAdvXo/V2BF0IQrFUpla4zOH3zQClo91kQgOKMpDMK4w9R0P
         gxUxM4OkeNTerIjqsBmQROgmyYoiXgJbKTCgEhzAPs+CeV+AdHCe2zEJYWdlGVnx3oIa
         jTmfLIRYA7tQn8EYNnBCrYg8ngp4XdlBudDROOd1DWJSnYRwJYodkBU2tmuHnaCx8SMt
         +if42riCyMJ5tZP9dSEbbuiHejtI8XNUab6Enc5SRzo8DBF66nSSDi2hwbt3g7tgt13x
         CVIJDXBuRPjtOXCDGC+yI7/s3iTKR+T1MMBrEPElkcmt6c5H8tM5qX4L4AeQolIRS1FW
         JvCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774339824; x=1774944624;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=56cZFxb5hXm4BTweWoeqBg2xG79G3LuwO40uREqeFpQ=;
        b=ml78t3BpBzSNjN+ZZH1ZVjx4g6X0VZfywKwOgM9p62Z4FX50TlHpdERqnKmP38GUol
         +Zsz1GwfaoE1ERXFJ9Nsw8I+7/S9E/1bLbGn4NEbX6QC4MM9Jq6eRXl1k5XMFmKhCPen
         4xrCi4oKbUirk/dMOiYn41Ke3Vuln63evV5UeT9rb3EjTFfLDHyXHRM87IBkw68gSfzU
         kmfqaxhDNvBqIs31idPLiWg9qeluhuu3bh6SMPWFLs93fJueWffOdXwcb0nv5KP2RBst
         ZgA/T0tQTHftP0FRVJwsMfDlgRzzEuTNn0DeYgyJgXy/B3ka1vbn1jxoYkSqgWcKYJeJ
         sTyQ==
X-Forwarded-Encrypted: i=1; AJvYcCXd5QzF8DCx2cdWskVoKErFJkrl96oUs8whO5+d3LW+Ry3eqg0jYHnXngbjpbSJpWnpVj/2aPP7x5Pqeg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwGxP8EVCdDcQd83OVgowArDR1YW+nlPEknC5ROCebFJeKA8X99
	DVOjc6hklXA8TOiZYLWQyQCefa+RwIWtWbd0/KOXJ1nTMW/48qIEttJk
X-Gm-Gg: ATEYQzyb1bTRo/6jX9oWdbvIFphOBoeOKdQygxbgU9WLOVx7/uxT6XjbwklNADIsXXI
	0c1GSTPEdeVG7Utr+io3Mf8k+d9n6YFp93a6SiscmB2OUza8GIAFsS5SVwKWx/EGHdyIIOvnHU8
	b9Xn9CSduhMQeZZa5JAaSdmi0DwpISMVoBVH1dSmDEiAwSPRK1GeIfvw7TebEqp/vL2IYT7mLn2
	qMwZuL9ItZc0FW7ShvM0tn5xbRrSjmn0+O7vXUZaK+dnFNH5ZSscaZKCPj4riiQ1jo+ZvHOTG+R
	BtUIKccoB79xRnj+wz9EB/+TgEMUKW3lolSDCNZwbunbal7MpA1U1omeZerLvpLCCwTBTjU9df1
	GbjGlTawJSvChM1vh9rqYI/Q79FuoTCQNEaAd/uHyyNXjkU/p51h+3JNi2cTNAuhQyNoyCw1faf
	01KXEqlypj0zdoDAjkXOTI2vZetII/
X-Received: by 2002:a05:6300:210a:b0:398:9c9e:996c with SMTP id adf61e73a8af0-39bcec31336mr14349551637.64.1774339824143;
        Tue, 24 Mar 2026 01:10:24 -0700 (PDT)
Received: from localhost ([2401:4900:5022:1dd1:d6ca:2faa:9e13:1354])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c743a738ceasm8946308a12.0.2026.03.24.01.10.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 01:10:23 -0700 (PDT)
From: Anushka Badhe <anushkabadhe@gmail.com>
To: gregkh@linuxfoundation.org,
	mchehab@kernel.org
Cc: hansg@kernel.org,
	andy@kernel.org,
	sakari.ailus@linux.intel.com,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Anushka Badhe <anushkabadhe@gmail.com>
Subject: [PATCH] staging: atomisp: pci: remove leading whitespace at the start of the line
Date: Tue, 24 Mar 2026 13:40:07 +0530
Message-ID: <20260324081007.23165-1-anushkabadhe@gmail.com>
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
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,linux.intel.com,vger.kernel.org,lists.linux.dev,gmail.com];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56820-lists,linux-media=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[anushkabadhe@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 53FAD3048DB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Removed the whitespace at the start of the line to comply with
 linux kernel coding style.

Signed-off-by: Anushka Badhe <anushkabadhe@gmail.com>
---
 drivers/staging/media/atomisp/pci/system_local.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/system_local.c b/drivers/staging/media/atomisp/pci/system_local.c
index a8a93760d5b1..3cf35678383f 100644
--- a/drivers/staging/media/atomisp/pci/system_local.c
+++ b/drivers/staging/media/atomisp/pci/system_local.c
@@ -87,7 +87,7 @@ const hrt_address GP_DEVICE_BASE[N_GP_DEVICE_ID] = {
  * so, having multiple base addresses for
  * different timers does not help*/
 const hrt_address GP_TIMER_BASE =
-    (hrt_address)0x0000000000000600ULL;
+	(hrt_address)0x0000000000000600ULL;
 
 /* GPIO */
 const hrt_address GPIO_BASE[N_GPIO_ID] = {
-- 
2.43.0


