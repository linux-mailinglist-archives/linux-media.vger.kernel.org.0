Return-Path: <linux-media+bounces-49392-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3469ACD837E
	for <lists+linux-media@lfdr.de>; Tue, 23 Dec 2025 06:49:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D292A300CDB1
	for <lists+linux-media@lfdr.de>; Tue, 23 Dec 2025 05:49:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D13691FA272;
	Tue, 23 Dec 2025 05:49:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cse-iitm-ac-in.20230601.gappssmtp.com header.i=@cse-iitm-ac-in.20230601.gappssmtp.com header.b="ZIY9rLj3"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31E6A1B4224
	for <linux-media@vger.kernel.org>; Tue, 23 Dec 2025 05:49:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766468959; cv=none; b=cv1K0HuRg97S1I54aUWxpaUG6EjTSXtenGGlUhkQiVP3xqRC2ByBpUbCvj5kPf82YsiyTjYusnFqhfuRxTTnZbS7UAym5MmYusq415k4Gp53dq+MM4s+0t78pyxtZSdRWBN1tjqKfWiHZ4Ns0nYcNLL0ppEXG1pH2yX/LibiotU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766468959; c=relaxed/simple;
	bh=xY8s6ztPgI0v3eE5F9o/RQZ+CCnOvINklT570r72Aho=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kighNiWiE7AWNmUHSoF377nItVo3cGDwwdKjzwd8Ny4rOlg1NtPOCr2x72FO2yFOO49S7fuVgwYXGleBKWk6t4ADLZfjbvRRVcuPuosyNI+UIXB/MapVcm5PXY/LiAlehy+lmERwag35ro9jTWFfhI7wiJac8j9HfDSa4opNLG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cse.iitm.ac.in; spf=pass smtp.mailfrom=cse.iitm.ac.in; dkim=pass (2048-bit key) header.d=cse-iitm-ac-in.20230601.gappssmtp.com header.i=@cse-iitm-ac-in.20230601.gappssmtp.com header.b=ZIY9rLj3; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cse.iitm.ac.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cse.iitm.ac.in
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-7aab061e7cbso6516322b3a.1
        for <linux-media@vger.kernel.org>; Mon, 22 Dec 2025 21:49:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cse-iitm-ac-in.20230601.gappssmtp.com; s=20230601; t=1766468956; x=1767073756; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ghnk27Lh375IVPczUN98HcLESFSEZJiCHxM52A0wZU8=;
        b=ZIY9rLj3RneCyEkq0PyYBRJLRQxlOQaeHcMBbQBCoky7Oks1vxhaRnqVJp6BV86DkR
         KM0bXXvmJVufvCsc9b6X16CwxNfhnJOKC5BingKtfUrcP8n52S9LItFQDiFpomjZzaPu
         yTo5jqW8rG8kNPPykLhiFAj71NfCx0cnWRbd6aP5wwXp5a5PC2M0hljzY3eQsmWTwbff
         fSo2VILb1FFCu5yp7ItdSUy6vgvry6Wnhbs6yCQVxMHhYFQm4eP+i6KNcrqxHr2l7xW2
         PdQX8WTKQT2tIgyb6IlwuPDI1dsgfGSb1m2SF7M7yttaIgvCGFgk3zYD/ktGzFgeoe3Y
         lKzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766468956; x=1767073756;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ghnk27Lh375IVPczUN98HcLESFSEZJiCHxM52A0wZU8=;
        b=aUAdPg4nAH91OXqzJuFQit5HiOnEwUNwgMsxDYjhDJ5K9++aBpt307a4S/+NSe1V4g
         MiJ9bIQeW2/l8j4coqll/UIxdi9L9zUJMNKolxEk+HX5vQdWwhHdgZZd4FUKvLDX//q0
         UtOkMg8RQN9n9QD1gGYuDcV4Ncc9PHn7eydXbPJPjRiB061BWGIdRyzfShhBIz+i6N6+
         CwwrHFjtSIlEzlD/K8TCmZYgayqOxyFQjfjHkHzvf6RwlEHSpslR7bMEsqB+ymcdvwmq
         mCCKkwgaSHRmQMxYhtjryIPWzWe4T1I7U3H6WPwvjr+R8OYIP0VOznBcYyhfXw32rvI2
         9oYQ==
X-Forwarded-Encrypted: i=1; AJvYcCUF6N7plzPok/Hej80D02bDh0T0pDtfa611JuvGqeNj/g6fyVTqm4fvqHmsqBl7/0H67ai+KuhMhk2FBQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywfs5xsudwAjgaRVn6QgNs2riopa4aNWQ16GsFEhx2z2ZUkduEs
	mxkEfeJK29ZcWziQXgg1gLumVwLrglptZVRd1pJ3MVrh2dVwiTLBOrqjZ2q5a4vByyA=
X-Gm-Gg: AY/fxX41cSPSKCMfgqbOeMMfnATiDQI83vcwJpiCovk7sxujVuFkeMlwTMB+Ac1Lqkn
	pjH5sye3aaez+y/IKc3IacI198GvrAE6P18DN/QUBPR+IzXwS0Anuar9416KCvUc3SpAy+76GHX
	kuTHxY50pb5gI72dApuK8SXP+LJhHD2Cw2ki/e3vaz0D8BK0LWQr0wCHgq/6WH9sSwCxJ7ge62j
	ke2oITbBUWqfJFZw0p/3HeZdomuEkjtVO3Pm+hxmDksePxcyvcqDRn9fsEsPkFsnxRVT3HGOGSb
	asNnCRXaXUwqPxywwuiCjx7gB7we9eRMEoeF33s/ZkXj229UCUyXgVd1TWKhKd6q2j2IjkkZpV+
	SzDbLO6wwK+nQgRTGd3XtkawDKL1f7Gk+GCp5bH2nGA2z04DcxHZRLYQBmcigZx2hD18JWoyvE5
	NBNBunGeLL8WXj9cH7j1GavSxq
X-Google-Smtp-Source: AGHT+IESOyjjQEV9cmHpzOZNpIr+8MrRuRllRcSqhZYjGKbchs0xAx7vP4yzg/aNsBH7TSdefCA1sg==
X-Received: by 2002:a05:6a20:244c:b0:361:3bdd:65f7 with SMTP id adf61e73a8af0-376a75ef393mr13550597637.13.1766468956481;
        Mon, 22 Dec 2025 21:49:16 -0800 (PST)
Received: from localhost.localdomain ([103.158.43.19])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2a2f3d5d3fasm115282995ad.69.2025.12.22.21.49.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 21:49:16 -0800 (PST)
From: Abdun Nihaal <nihaal@cse.iitm.ac.in>
To: mchehab@kernel.org
Cc: Abdun Nihaal <nihaal@cse.iitm.ac.in>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] media: i2c/tw9906: Fix potential memory leak in tw9906_probe()
Date: Tue, 23 Dec 2025 11:19:01 +0530
Message-ID: <20251223054903.69043-1-nihaal@cse.iitm.ac.in>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In one of the error paths in tw9906_probe(), the memory allocated in
v4l2_ctrl_handler_init() and v4l2_ctrl_new_std() is not freed. Fix that
by calling v4l2_ctrl_handler_free() on the handler in that error path.

Cc: stable@vger.kernel.org
Fixes: a000e9a02b58 ("[media] tw9906: add Techwell tw9906 video decoder")
Signed-off-by: Abdun Nihaal <nihaal@cse.iitm.ac.in>
---
Compile tested only. Issue found using static analysis.

 drivers/media/i2c/tw9906.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/i2c/tw9906.c b/drivers/media/i2c/tw9906.c
index 6220f4fddbab..0ab43fe42d7f 100644
--- a/drivers/media/i2c/tw9906.c
+++ b/drivers/media/i2c/tw9906.c
@@ -196,6 +196,7 @@ static int tw9906_probe(struct i2c_client *client)
 
 	if (write_regs(sd, initial_registers) < 0) {
 		v4l2_err(client, "error initializing TW9906\n");
+		v4l2_ctrl_handler_free(hdl);
 		return -EINVAL;
 	}
 
-- 
2.43.0


