Return-Path: <linux-media+bounces-50223-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id B57B1D0202E
	for <lists+linux-media@lfdr.de>; Thu, 08 Jan 2026 11:06:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id ACBCB30060F4
	for <lists+linux-media@lfdr.de>; Thu,  8 Jan 2026 10:05:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 750E73B5300;
	Thu,  8 Jan 2026 09:41:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MqWxwzDk"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2968F3C26F8
	for <linux-media@vger.kernel.org>; Thu,  8 Jan 2026 09:40:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767865255; cv=none; b=iXTPlPngUefeiOtlYWuJFzisMR5QuN7qMyMBQy2enQE9tkNci83UDpyFQv1YN0eA3HeCtQA3x0Xg64oMaXbIk05pE2DF9XlQDT6S3URW1y4+a57LAKQnRfxaQiAaWoTUdkgDrHzVgPyiFRaFk3ozSVBM+P58i6c2JHmNzng53Nc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767865255; c=relaxed/simple;
	bh=HyxZki6nNfkVhrly9fkFjvuP1iEjFH9IVkZjZbAirVY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pD1AuGObAkr0pho1Qul43KwKsoDCcC/75YbzvvgnLFRyYxRAHv0MLA1RheUtdnnx4cqV70/ysGi7wcvgjFJ1BqvsGpxN4IsO4GTWjGn9ReaGUvf8b7wtj6TvHYNQCLkZXAAbBKuzLv3/WogkrHcUwocrZEqr2nqm46IizR5W5qM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MqWxwzDk; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-34b75fba315so2069798a91.3
        for <linux-media@vger.kernel.org>; Thu, 08 Jan 2026 01:40:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767865243; x=1768470043; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=s5Sclxc2Sofk/X67T0fLHkI5fsomZW08NQuzmRvsgLw=;
        b=MqWxwzDkSv0gqZ/lM2VBzOX8YGObJ1CuD+l0p/+g8LZz82eVJ226Jsmy48U3a1cnau
         DULFbbY3RizJjDTZuu3eXWJEU3y0RxNegqkYRLTxLNA0EgrQOq6M/N+crkkxXPlzFSk9
         l8igR4IVppJvVIAquoYveFw2yJqruEib9ERX0M4DvqPLNKAJ7qAMFz5Uz7mJPAFclXWh
         minM/RlFGzTPoWyFJhPr0YfWMWfDs5qAGxCvfnYiMcwyiXW9lNhaKQSsBqJ0BxegZRso
         npAaCpxpWZN3AUHlFx+jsYfnnGIM2/50zJNW/qFP7zOr0suNOPIy9yzNasuOAAHyaMVq
         HFcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767865243; x=1768470043;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s5Sclxc2Sofk/X67T0fLHkI5fsomZW08NQuzmRvsgLw=;
        b=wfUrvCzOS+JnSBQDrD70/uTr9NsBmtTx5xQAIAy8/AWQm8A4y60i1ampVfzbe4UwQM
         EkGrVIDbvpchfsZ3J5onBgsPDn2Hv5HF6GGQzoaYQ+UchoBD7L/OEuIKJ+QkOuMlQE9D
         TAFxRRRvWIvOhmBCWx5oEMu9pIJ9OyGvg+OndttCT4j3Yyjrq/wf6rdWyYy1eHl1s4uY
         +jc0I9kFDDXvpLqcxQ2R35JB3afQpu8xckP9Z6bBqiBAjlx+t3TGzNjGH4eE02Mn091d
         DqbmzjTl0ysvYWDuCRXw6rxsNC/XdaG7nlu4lsm6ugaR1RZYejOWyfjs97UmhkLQlgXd
         f4LA==
X-Gm-Message-State: AOJu0Yz4884gUE2KkIxdKXwLlPWNmAToBrFOdw9g6EKSmTEeyUHkTL3i
	XzQ3TInxqA9c7qsZhOkegE9W8wAx38pFqi6v9SSXKxfLpugINIw73CE=
X-Gm-Gg: AY/fxX66V2n4m0V1L2y9QP7yrisQBrF45hZiUFWiGhzDctjcyjpZFCpkWuoLCDtJWWV
	KZ1yYc5vTydbHgr0H/L6PTh+EkZG5vyRYa3yE7NfySTd5sU3CqT5oowUCJsWhyR50SlUGMpC3Rb
	aAb5yt7ndFpbjG5xaAvrmf0zVLQiSX6eegLstSCRHPHsiR1lpLTLyX9voLIZRBipDToEFamfC7d
	yi79eyBk5oCMlsdNuzQEDv38oHsMUeHzm906D6qluwth02NIxR3va8tqsfcYHqTvb4h9wAyumy2
	vBSLjcpHqjpiPC74N+04Q5kfRhJ6xbNmopdEp9jlDWiuWvvOUHJNXzve6a5ZWKFTqI7ZtNDnxHg
	HQuEwk2us39SRj3QVUltMOMpq3UuhTzHNB5TGCH8vBNX9R+6TKRhSaNS2tlgtKXGjdks3BvMMP+
	thNWULlq7/4d4+fKWi43EIjH/loDcBitMURCC2Kfy3cHMSc4HPImjdcvbNKCWjvGBIhIWhWr5sT
	SATF5O3
X-Google-Smtp-Source: AGHT+IGA0UEhRwr63Gu5xiKlrZZ3FbUDz3z1/JjxeBG/PvE4VB4E4W7wD6q3MMuPkLYc91Kof5SjHw==
X-Received: by 2002:a17:90b:2c84:b0:32e:389b:8762 with SMTP id 98e67ed59e1d1-34f68adb8a1mr4850271a91.0.1767865243137;
        Thu, 08 Jan 2026 01:40:43 -0800 (PST)
Received: from DESKTOP-BKIPFGN (ec2-54-169-177-146.ap-southeast-1.compute.amazonaws.com. [54.169.177.146])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34f5fa93ee7sm7333918a91.7.2026.01.08.01.40.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 01:40:42 -0800 (PST)
From: Kery Qi <qikeyu2017@gmail.com>
To: mchehab@kernel.org
Cc: linux-media@vger.kernel.org,
	Kery Qi <qikeyu2017@gmail.com>
Subject: [PATCH] media: ttusb-budget: validate DiSEqC msg_len before memcpy (CVE-2014-8884 style)
Date: Thu,  8 Jan 2026 17:40:33 +0800
Message-ID: <20260108094033.1650-1-qikeyu2017@gmail.com>
X-Mailer: git-send-email 2.50.1.windows.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ttusb_send_diseqc() builds a fixed 12-byte stack buffer and copies
cmd->msg into it using cmd->msg_len without any bounds check. A crafted
(or buggy) msg_len can make memcpy() write past the end of the stack
buffer.

If this code path is reachable, a local user can trigger the issue via
the DVB frontend DiSEqC master command ioctl by supplying an oversized
msg_len.

Fix by rejecting cmd->msg_len values that do not fit into the remaining
space of the local buffer before calling memcpy(), mirroring the
defensive check used in the CVE-2014-8884 fix.

Although this appears to be dead/unreachable code today, keep it
hardened to avoid future regressions.

Signed-off-by: Kery Qi <qikeyu2017@gmail.com>
---
 drivers/media/usb/ttusb-budget/dvb-ttusb-budget.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/usb/ttusb-budget/dvb-ttusb-budget.c b/drivers/media/usb/ttusb-budget/dvb-ttusb-budget.c
index 9e016b71aa91..946c763281cf 100644
--- a/drivers/media/usb/ttusb-budget/dvb-ttusb-budget.c
+++ b/drivers/media/usb/ttusb-budget/dvb-ttusb-budget.c
@@ -456,7 +456,9 @@ static int ttusb_send_diseqc(struct dvb_frontend* fe,
 	b[4] = 0xFF;		/* send diseqc master, not burst */
 	b[5] = cmd->msg_len;
 
-	memcpy(b + 5, cmd->msg, cmd->msg_len);
+	if (cmd->msg_len > sizeof(b) - 6)
+		return -EINVAL;
+	memcpy(b + 6, cmd->msg, cmd->msg_len);
 
 	/* Diseqc */
 	if ((err = ttusb_cmd(ttusb, b, 4 + b[3], 0))) {
-- 
2.34.1


