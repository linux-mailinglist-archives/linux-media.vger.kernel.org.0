Return-Path: <linux-media+bounces-29499-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 56F50A7DD98
	for <lists+linux-media@lfdr.de>; Mon,  7 Apr 2025 14:25:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E0DAD3AE712
	for <lists+linux-media@lfdr.de>; Mon,  7 Apr 2025 12:25:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E752E24633C;
	Mon,  7 Apr 2025 12:25:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OG3RbSfy"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC2872459CD
	for <linux-media@vger.kernel.org>; Mon,  7 Apr 2025 12:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744028726; cv=none; b=LVFgIqPMhq3qaB4slAEKfvtrqomDiKfMcoBDjrKddO7gmr5hazBvBZYRI8iCWZveskISQrqivDJ2Bb1pQkxyWZl6T27yFa2YT3CVE4zNT1Y/u0D5QZLURiX91I4EOsgNlFCIsTEsiPXIQDaDdT1vmzK/Ao5VvyjtR3I/NJh/y3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744028726; c=relaxed/simple;
	bh=xmKme93midQ+JJDFdHWVCcn+RtOTg7o4q+QA9nKEd+0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Mth3j3UP+AET+D2cOF3T9W1t+Se2Ni07hdYBCzvHQKtL9mZTp03x8mg+cFI8BGW+b02RJzD0es1zKejRQhQXU0wkavCcc3m4eHLNzJmHW3VH3oBqYDPzZQxdRvy+rHGMNar8lRR8jIF09WDUuOFUoqbsTU29H0qhRHy7AfdgLkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OG3RbSfy; arc=none smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-6e8f94c2698so22280326d6.0
        for <linux-media@vger.kernel.org>; Mon, 07 Apr 2025 05:25:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744028724; x=1744633524; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0cn9ebfllB7wRop82dN1NbH3lkIi5hYOeluU75VAyu0=;
        b=OG3RbSfyLfa5swAWt5Cv4ZQlygT5gsrPJLWQLjlW2vNMKjeAsX6SdmTjH9QCodG0C0
         1os2u3t9uEHoAje+I5yJELI/T0bBo9VMQdqY3IO+1EtNA4OQ/38Jb1BDhzHMhFJ7ZNHY
         QWHsFg0aPasyHVMdpBiElAQbL4bzDNKrSv2IeRZYtB1e+DO4WF5hBXrdTT2jy14zAiim
         kOBf3qMIgsGJUkzmP1AxClGwaO2LUlD5GI1ng8J0WhX9CXK/FL9arSWdT66xfg4SeMfR
         TKBIYXAV7AcCzWnLXNqWT/O3F61wqVSFY2jUpLtaeMVxKuT088Ul3eiAJiBVUUPreqAf
         Cfeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744028724; x=1744633524;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0cn9ebfllB7wRop82dN1NbH3lkIi5hYOeluU75VAyu0=;
        b=a4Gs1Dw3n8XtAiypSaypFzhOTMsrPf+5c+ipJ0QCdXKaiZs9oMz5LA6Dnl7h7sGF2c
         3HouNM8oFUtPMoy7xf2wcj640s82N+71iPEYB4d9ptfjTioylFwo+29yj3iLikUYnNKa
         huE7PdfGTQQ8qNBezYyyIoR6ng+MmSu6Jf4ppXHRCv726XbUB/CFZbJj6T29CKBSdOO0
         Jmh19Po0IfDH7+qePEfj1PwzIRiz4DFg41XWOBBhVnUjDvaxauB0MoB5kikWzqpIdV5o
         Zx3NIRAa0kjJiBJRgXnGZLfx+oW/vK4a6kzbb6PDFz+iYk3j9moO4LBTqtyJG1s/cvNj
         iFag==
X-Gm-Message-State: AOJu0Yzd4EuEfzYmqV83Mco24n4FJufipH9jNemuW5zDK9BL43WyJjGe
	tbeBDu7+Pp0NOBHDBVfsI4+whmSWMPkYcj0B+SfFL0MVNIgrehruiLfpKiD/i8w=
X-Gm-Gg: ASbGncu28q62B7/USCnzr4wqWhssPInA9kQ33vA+Bw62PU2ry7IOJlwsgNvaEGOatgs
	Eonsm9RcjJOQnrERahuu9mNPtukLb4QK1ohznj1baCxtO0Yv9PTorSCAWUInyt5KbADEIa1PCPt
	mPtBeSLYKReOnEkEbENu38/7gNrO5SEjZnjt4qHrSn9Zy9NyGktQmIqrMfxYEfakmS1kyF10bD3
	9T9Sr8wXmUafSrSvb5hEyn1MlgSPY58iAo2CcZtm+VBETPHLRr/X4GJc1NlXs4FnZZPbi2slPaM
	R17O9RHkAhzPWcnovX69UqN1CMW066D/7I0PKsQhxNtjrLuoOeylilGpSOQ=
X-Google-Smtp-Source: AGHT+IHC07CSqBBMnII1zKPWrQHUZaz3gKIakHZohts7j8jkKwQpEDDVdIgVf4BIIJ1UETe9wk/4kg==
X-Received: by 2002:a05:6214:2a8c:b0:6ea:d033:2853 with SMTP id 6a1803df08f44-6f0584ea122mr180835396d6.16.1744028723680;
        Mon, 07 Apr 2025 05:25:23 -0700 (PDT)
Received: from theriatric.mshome.net ([73.123.232.110])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6ef0f1501ccsm57166626d6.118.2025.04.07.05.25.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 05:25:23 -0700 (PDT)
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
Subject: [PATCH v5] media: imx:  Remove unnecessary braces for single statement block
Date: Mon,  7 Apr 2025 08:25:20 -0400
Message-ID: <20250407122520.364124-1-gshahrouzi@gmail.com>
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
Changes in v5:
	- Use media prefix.
	- Add driver in the subject line.
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


