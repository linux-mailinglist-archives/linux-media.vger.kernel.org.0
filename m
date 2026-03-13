Return-Path: <linux-media+bounces-55786-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CG0gLnhztGmUoQAAu9opvQ
	(envelope-from <linux-media+bounces-55786-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 21:28:40 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CA9B289B46
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 21:28:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 328E03012D36
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 20:28:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2EA63E3174;
	Fri, 13 Mar 2026 20:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lIldUwTI"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26B293CF671
	for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 20:28:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773433715; cv=none; b=qghj16o+2ZF57cF980YPXjrd59Rs9v8kCe0uXsDeznFN/nj5vWlXjH9hrLv78ZD8Ouj4N/a4uQW5GD3/Cjf7FxlZK02PNP6NX4ZaVPwPLOUBr9mrS/0Id8swJXljWwgXKA5kYF6Rk4CnxgZLw5CKPieMhHSAWA8/aNOyUdaBWto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773433715; c=relaxed/simple;
	bh=ii9fJhTNRCUfnNusQUvOKz4dkevUob11vFbmcLrbY/E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=TmHPSwHgiWSyijQX8jXiHUk4O69fwWshdaLx0KyOOlSKev1CdxnCMaSpb+bjzxJtVdIUJM6Ug/6C9jNUjjh/myaDs+FXe3RdVhvEZDDukjeVJb7MBMjyXUWQ/QQfVE9rzpNBJZvY2by1Cz+nSnjId5uPAx0KxZRVaa9NCTdKKuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lIldUwTI; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2a871daa98fso19847835ad.1
        for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 13:28:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773433713; x=1774038513; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=N8+xm/zzL7SoctPYMLA/7E47XuiprZZpUPBZzC9PZac=;
        b=lIldUwTIcy2/T0+d+c8ke4O4N0cwpUXay7+Dvpqr/MOXagzjB+4sTekPMXQ26AI6Yb
         Yr4Z0e6HNWnsNHM7nKa4f75JlxfoiD/r4OtUDWP1KCaw8W6YLS85VR8CGTm3o4LX4DY+
         RB8fpsQJGGi9mAUZCti/+pi30t5IYfs7+mavxpTtH2bX7ry19trQQ6fY7rLGbQOgLkMk
         F5hGoz+ZnMv8O7Dg9GH330mSOpQKbLaDj+HA2mNM5HF/r+FzA6fV2D4m4DHk6ZuZDjsA
         TTTdSF4fWZwrnjRxd0rMGNL5V86gL6mJDWZjf1HbexXK5uwmkyq83iusjUKaLk/eG0ku
         Yw7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773433713; x=1774038513;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N8+xm/zzL7SoctPYMLA/7E47XuiprZZpUPBZzC9PZac=;
        b=KasJp0lBCS5qlXbVmJX7Kz8afLIA3r+njPU8MxjKptITl+wzTmuJJWgI5vSXZBjGFA
         WbO20/afXFs9n/2o5Dik5jHsR7Uc7mglH+KC0Xw/PEFKmmAY1aM/wqfYdQez22Xh3Oxt
         yeD8m9J7wlBYIy5k3M7lUxQK3WszWvIYe1fo2KbPU9tIqZa19yOd5aTomcT8mpQww5rW
         9Fv648eG1zVXE6fjJuPmaAQr4aXmP2gu1WhxpNJB35vshlOVXORS9ryx0b6sA/JyRBUK
         6Z4viZEAnfElq3BjZ+I2bEFRCiZXLuk1MhSMDUh7Z7abhIvQo0kNelzydEFLoSO61hxF
         UReQ==
X-Gm-Message-State: AOJu0YzXvfdmJumVnC7y1aOJEiWUZMayWGnSxsi4UomohRzVwilIyuG4
	cp+Klc+oOfjLBzfmtNtCv7uMS3Uohxp5hi2Y7sFlWlNGLTcwGw9lD85/
X-Gm-Gg: ATEYQzzsroPXKhKgumkXyy5fVbs+cn5C1pMXdSzu6KQ6SKZ01X8RjEbEQjz3/AgBnPo
	Asyju1WFb1KUgnz3CMrZTgf00sYfNT0AUEfeFpO0reW+5P7DO5BVXCDPbDXAlpDUZt+rOOO80zy
	O6277prqog8K1ryJZnLP+cvv59fg5CoOoEFjx7RoJGMaOF1lNYV8sypNjw+x+8rAkNv8cCdZ6st
	mCtJ3pXhfn40stKyqGZpPGPT1TgZtKleAONRn6fKmwciZAF4dAtAchEPgoDxE+0xger44FGhjCE
	zlW0gqBwH/7ezvTQPqvyy6DFOFl1zDlayPRnCa0FtCXgSepUqqY+4KUnn/UrokHoyfjXJaWwVau
	58nFMzIdQf69zNFOlqP+IkIZZ05u8X8JFTcMNNaAk0AhzwfqdPDGNTF7536808ECBJUY52PF+yR
	oyyvLIFms5p2jAjDyprjY9CqnYCg==
X-Received: by 2002:a17:902:f683:b0:2ae:508e:5019 with SMTP id d9443c01a7336-2aecaa4bc64mr47344505ad.20.1773433713568;
        Fri, 13 Mar 2026 13:28:33 -0700 (PDT)
Received: from [127.0.1.1] ([103.216.213.160])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2aece8629bbsm29165095ad.88.2026.03.13.13.28.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 13:28:33 -0700 (PDT)
From: Atharv Dubey <atharvd440@gmail.com>
Date: Sat, 14 Mar 2026 01:58:24 +0530
Subject: [PATCH] scsi: buslogic: replace strcpy() with strscpy()
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260314-strcpy-v1-1-0b38691fe11e@gmail.com>
X-B4-Tracking: v=1; b=H4sIAGdztGkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDY0MT3eKSouSCSt2URHMDS2MLYzNTU0MloOKCotS0zAqwQdGxtbUA3uU
 JO1gAAAA=
X-Change-ID: 20260314-strcpy-da7093836551
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Khalid Aziz <khalid@gonehiking.org>, 
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-scsi@vger.kernel.org, Atharv Dubey <atharvd440@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773433708; l=1867;
 i=atharvd440@gmail.com; s=20260314; h=from:subject:message-id;
 bh=ii9fJhTNRCUfnNusQUvOKz4dkevUob11vFbmcLrbY/E=;
 b=e1iEuhHK4OpMzbGVX2kfHOCk6zBJiBUHK2QGH7bsEP/kyKyNuZ1ws8jK2RNUnANqyburlIpPk
 BGxSyK0Z7dVBoeys3l2dAfwTy9KmNg1WRwps6UQOyDa4Lv/YtSCPUvm
X-Developer-Key: i=atharvd440@gmail.com; a=ed25519;
 pk=T6i1xWOKT/RUSDYATSgyVG/4X7ac8jPjRSG1mMAcqVk=
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-55786-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[atharvd440@gmail.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 5CA9B289B46
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

strcpy() is deprecated as it does not perform bounds checking[1].
Using it can risk buffer overflows if the source string exceeds
the destination.

Replace occurrences of strcpy() with the safer strscpy() where
the size of buffer is being checked.

Compile tested.

[1] Documentation/process/deprecated.rst

Signed-off-by: Atharv Dubey <atharvd440@gmail.com>
---
 drivers/scsi/BusLogic.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/scsi/BusLogic.c b/drivers/scsi/BusLogic.c
index da6599ae3d0d..c070f3b8197e 100644
--- a/drivers/scsi/BusLogic.c
+++ b/drivers/scsi/BusLogic.c
@@ -1262,7 +1262,7 @@ static bool __init blogic_rdconfig(struct blogic_adapter *adapter)
 		for (i = 0; i < sizeof(fpinfo->model); i++)
 			*tgt++ = fpinfo->model[i];
 		*tgt++ = '\0';
-		strcpy(adapter->fw_ver, FLASHPOINT_FW_VER);
+		strscpy(adapter->fw_ver, FLASHPOINT_FW_VER);
 		adapter->scsi_id = fpinfo->scsi_id;
 		adapter->ext_trans_enable = fpinfo->ext_trans_enable;
 		adapter->parity = fpinfo->parity;
@@ -3451,12 +3451,12 @@ static void blogic_msg(enum blogic_msglevel msglevel, char *fmt,
 	va_end(args);
 	if (msglevel == BLOGIC_ANNOUNCE_LEVEL) {
 		static int msglines = 0;
-		strcpy(&adapter->msgbuf[adapter->msgbuflen], buf);
+		strscpy(&adapter->msgbuf[adapter->msgbuflen], buf);
 		adapter->msgbuflen += len;
 		if (++msglines <= 2)
 			printk("%sscsi: %s", blogic_msglevelmap[msglevel], buf);
 	} else if (msglevel == BLOGIC_INFO_LEVEL) {
-		strcpy(&adapter->msgbuf[adapter->msgbuflen], buf);
+		strscpy(&adapter->msgbuf[adapter->msgbuflen], buf);
 		adapter->msgbuflen += len;
 		if (begin) {
 			if (buf[0] != '\n' || len > 1)

---
base-commit: 173b959a8bb814f55660f7c34ddedd4e75c203d2
change-id: 20260314-strcpy-da7093836551

Best regards,
-- 
Atharv Dubey <atharvd440@gmail.com>


