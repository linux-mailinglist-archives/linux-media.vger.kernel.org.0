Return-Path: <linux-media+bounces-29244-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E26F7A79082
	for <lists+linux-media@lfdr.de>; Wed,  2 Apr 2025 15:59:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 732A916CCA3
	for <lists+linux-media@lfdr.de>; Wed,  2 Apr 2025 13:59:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45CD323AE84;
	Wed,  2 Apr 2025 13:58:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z8b6JHmc"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3832E2376EB
	for <linux-media@vger.kernel.org>; Wed,  2 Apr 2025 13:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743602338; cv=none; b=l6moTeeL9MMii3pjjiWwoNEnDJ28gj9sqFRjFsPNX+VfEfeFs9babmqoPi0gZUjiDzXi3Z0GAqTaUsOw9hgyr7oYqRams5KkTNIEKschS+S7GcetuZVGiYN0FvtnsJKWKZ1c+srw33/XYytdrvy7zuRDw2lfe/BS3AdUvZEfs3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743602338; c=relaxed/simple;
	bh=E1RquFpLyZTYcfSNn+gPl7tMCMbmQmZDBrNyAAGg7mI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tGaz8YEMlrMmCRqs24eXQCVanF+JSsmUS76ek1RY+WTBozYR+rk8IqFVT0XcgJv1utNIhozJDW5eTQrmJbe0mhMGGXNZe8wXsWIld2QfeKWiurMAERPDWIzc4s51T9I/ydPsVRs5SpdHp6FF4psF/7qJWcPEaOgCqJrMfej/npo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z8b6JHmc; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-7c6a59a515aso265354385a.0
        for <linux-media@vger.kernel.org>; Wed, 02 Apr 2025 06:58:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743602336; x=1744207136; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7RKlreFQivVxqrvuN1/QXrm7XVZTtvYdxyFro8fbbwo=;
        b=Z8b6JHmc3GXqR3zSlXZx8aT3V8oAS2JYnchtS0MVYgFFv7xloIKs+isKR2eum0YN8t
         nXWCqavVqBSX6xCcUv4YzsDrbTxcjyobWn32zp+P5P934kqqjR+RsBuN7RazC6nJhCyg
         ZSdjaYNQZUu3Aiqx/76AWQNgOi9eU2bRgdazIB50+YRB9I5J+1GeXdBV6jNs/SmSw9VX
         3jwZR+DYUkAccR7nixN9AtcyzZmkseoTEQYgNsUTMgExrugfiLCKzUnN3Da8hwfvarsu
         xk996XRs4sG4uipOnyFocTXYJVRa43iiY1PUrZjxxwKh32xwmzQ2JjDmpuQqnhEYTuU4
         vbew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743602336; x=1744207136;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7RKlreFQivVxqrvuN1/QXrm7XVZTtvYdxyFro8fbbwo=;
        b=tYoqFNVrn6Tfd69b3tq6K9xFYMc10O8Ldxio1kv/GRm9e128R4x1hEB+GBIB9xOO3S
         3wisyF5UWpqi6rdEjtXL3rAL4GAxsoEpejh0t1H/UtCM1UH30e9CvpqX4pYigo+QxhiP
         fxuuhTvlMsfSnOrI670BUzzSe8Xdf/U3uBdZN0k7cAo8Ky8GSdL8qNWrODizyEf8kcEu
         eI5PoODFktE3IotGRhQ9LvzRPUebkyGHWc8Jbr82xRoJo33u88L6TuGfvmjmTKypreLH
         i9DFym23Tnhu5JGAi66+1fCn4EKVZzUH5NAnEsH3CkeFtcWgIKrvnjRLGRWiDKO75MQV
         umUg==
X-Gm-Message-State: AOJu0YwvfFi1hqJq5fWNFl/Zd9uRkUicNDbBUxpEzdH+lS0PqdHTwnhe
	vszryyXiCYoPGVraDYNiT1jPjBUyXCIYbTGTtTqSz96mcwNQ8xYz+YlnFkMRHjU=
X-Gm-Gg: ASbGncsiuXW+1O7s1Xcq+8W2LK8IAhqhzHOoP2up56JQ9PlkBPoUDIu/zqZizpmEMbm
	ufoa3mgv6KAXhFBEBF9PT172yck++g1Z0leaN2HBAMrs3TwWFNOjBAwSSUrWEZ/kHLhAxiqgNWB
	L6hYt3ESV2t/w6oaYnXbZ80oKPDDZHc66q0k8qK9sGWZFfTIR+tVAg5nnAJHh4n4UG3QhKWhnTj
	dEQ2qfFHE3W8iFjxsr5Zu2vYwEk4rLZ1DRgkRhPkLxwDJEbKmIbXz+SflIDxgRgJiiumUAZF/wO
	N/PtJBFd6V3ifEakECevdbSbeHz17tqPzE7AAr0xjxvjaLnSCZF1S7fy5D0GE81eneuG/snPoEe
	LKDuTILAT8g5MK+SE5QJgIxM=
X-Google-Smtp-Source: AGHT+IGhyWbX15a0Lzy3/ieWFeMzPPya3LsFi78CVOBfuojRqD/8rX3uad3QIOQrL2LX6wekR6vyvA==
X-Received: by 2002:ae9:e71a:0:b0:7c5:9c38:ef6b with SMTP id af79cd13be357-7c69087de5dmr2107423985a.45.1743602335819;
        Wed, 02 Apr 2025 06:58:55 -0700 (PDT)
Received: from theriatric.mshome.net (c-73-123-232-110.hsd1.ma.comcast.net. [73.123.232.110])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c5f777e02bsm789748685a.110.2025.04.02.06.58.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 06:58:55 -0700 (PDT)
From: Gabriel Shahrouzi <gshahrouzi@gmail.com>
To: linux-media@vger.kernel.org
Cc: linux-staging@lists.linux.dev,
	slongerbeam@gmail.com,
	p.zabel@pengutronix.de,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org,
	skhan@linuxfoundation.org,
	kernelmentees@lists.linuxfoundation.org,
	gshahrouzi@gmail.com
Subject: [PATCH v4] staging: media: Remove unnecessary braces for single statement block
Date: Wed,  2 Apr 2025 09:58:51 -0400
Message-ID: <20250402135851.13627-1-gshahrouzi@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unnecessary braces in single statement block to comply with kernel
coding style.

Signed-off-by: Gabriel Shahrouzi <gshahrouzi@gmail.com>
---

Changes in v2:
	- Add missing author.
	- Fix title of email.
Changes in v3:
        - Resend using git send-email to fix formatting issues in email body.
Changes in v4:
	- Use correct patch version.
---
 drivers/staging/media/imx/imx-media-of.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/media/imx/imx-media-of.c b/drivers/staging/media/imx/imx-media-of.c
index bb28daa4d713..7413551052ae 100644
--- a/drivers/staging/media/imx/imx-media-of.c
+++ b/drivers/staging/media/imx/imx-media-of.c
@@ -57,9 +57,8 @@ int imx_media_add_of_subdevs(struct imx_media_dev *imxmd,
 		of_node_put(csi_np);
 		if (ret) {
 			/* unavailable or already added is not an error */
-			if (ret == -ENODEV || ret == -EEXIST) {
+			if (ret == -ENODEV || ret == -EEXIST)
 				continue;
-			}
 
 			/* other error, can't continue */
 			return ret;
-- 
2.43.0


