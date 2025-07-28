Return-Path: <linux-media+bounces-38529-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 59DDCB136D6
	for <lists+linux-media@lfdr.de>; Mon, 28 Jul 2025 10:39:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8CC7C16365E
	for <lists+linux-media@lfdr.de>; Mon, 28 Jul 2025 08:39:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07EA722539D;
	Mon, 28 Jul 2025 08:39:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nhNUxpGT"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 031F121CC5B;
	Mon, 28 Jul 2025 08:39:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753691956; cv=none; b=Z5rFoR1GVDNgT6YWoioKgSC6JmpkQN4q2V6Bp7QJ2+FkUew8C/XG5wS03NaRShaUNCNGnlCDuZFNVNuthjQQ6KyhcB/+E5AgWo1sES0UkJaAc+x4RSazcqPTxqxA+RjpQKJ2TXvj93uabx770GxMQtaq/uBiRNEDqT/vzcy7gw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753691956; c=relaxed/simple;
	bh=gF8ZwmejygbZnCW0HUWh1Dm2FMCNOyZhGOr1l6wnPOU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CdLae+N5EXiUTjCwVyvHSzZNx9EEep34kjVSr77eJ2IauNBzQhIBBmUvtyfR0pr8NzcTdcpIzGZ2ROniw/ICnmAzdlAugex5du3+iRgYrImC2RplzGZWKVo8I99obAz5SRYHh1LWFohFpKc6R1VsAIEHsE5p4OqZDUJ4wjym5GM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nhNUxpGT; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-74b54af901bso2632866b3a.2;
        Mon, 28 Jul 2025 01:39:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753691954; x=1754296754; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Vya5qGpzWoc5p9TRlcPu5vfiEaBpqyQ4uDCZUUCsHs0=;
        b=nhNUxpGTH08fNOaxl/v8jySv5JrAZr3vL8vyJZIfJuojD3owMPgy4p96tp6T9M3Iqi
         IpdQOS+Gpa7pvFxv6s3IZfinQdpyXjUBpjWIBNjuZh6w50NtwFBqOqG9WWVggoW45vdG
         zOvBneNhTTHDtSZNL5knxpQaiyth6gGE/rqKFz50XNU/OiLP+NAaw79ZPRSkAHllE3F4
         Y3cw/HylwgTL4Xm5woUQmYnItklTRiDgryk1ECJoXeWE0dzhpljglXVnOsFFr919q2w7
         G0nU9VKLKFvnoBxa+2pt0N/ebjU9LZchJc5axMWk6Q8LVBDKlzWi0I6hG1PXuTQLoKJl
         w0dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753691954; x=1754296754;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Vya5qGpzWoc5p9TRlcPu5vfiEaBpqyQ4uDCZUUCsHs0=;
        b=DuVHsog53hIUVAaffATG3KLHlfXyfVEWm6tInuXQxHIbQWk24D2IO0WEPLjh9SeTOY
         ZSQXD9UGVUifoCeG6v+bPM3ziJJUDDpv/iyDlzgdNAmhuKfutIzk+btc6NGG/QzV4+xQ
         0WCUVl7CPBKybpzMBpQW7Z/6q27LRZeYVP7dIW19NQpAip/PBzAK5rzl6nnM9reZlyw3
         uHibMIYmE5Y/2uJrKCDAMAn5WDCoiO85fqgic2YFggveenW6hFPddreFP3SPKuDj712C
         AtZLfYQ5rGSPfbbCKZfA0KcAfxa6P6AF2ijqBzGVC9tPITvV2Jq09nDdhOqrwbF2fA2w
         cWQQ==
X-Forwarded-Encrypted: i=1; AJvYcCWFxKF24MqdqY+XkP5j+9cFoT1RqwyU1nsVQkoWgzNeifWbtgmc/Qk6/aRxk7zUb+FCxb9qcNTJ1cCNrnM=@vger.kernel.org, AJvYcCWcBlMI/WjuJ8Ry/uQRAyzobKck7r3v/OU2mi2jvL/1Ul8qEyyeiTv763yxh6ciWHoQyZMckIfze2JopEY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxGkLk+7YUR1k+wQWLa/tpO16pY0443vjE3qZ7YoYl6vcb/S8hv
	PQSri7ybefUHirOJrW4G3hCL9usSrVUqGJiG0cgwFNcfTnM0hsRYLDR+
X-Gm-Gg: ASbGncu07ipXF25nOn+pXX3mJWz19y3dK2M4v/VUsKB7AKhB8PLl38iyIg/pP5lqlos
	0KbEzhoQCIE5N6S7od5poyX6+bWqHoIrIcDvJO7JWo1Yyeh07vhMPDvxb0BH1+HXMv5Wz99gsKA
	77xcTOiaN/NAzXS5rpx40linx8JRXZ9vKhMbeS0KldhVPmh5tfXpjXcsQPQLeMFak7oMwlILw8J
	XNqTce8oJcMMF1GNxrc+C0TjQuejtELT/jgcPepC/jEL53dT3/jTqueNW3aUHezFT87Lu12Kwwr
	PTh7UYBc+JZq8Ey6M1ssmrHIh8ZWTQ+9M7ZBXfk4jauDtvXe0IzEmO8C8cXfJDbhjT0UioaKD8f
	Fy1IYoSFMVFBNCBUuVk8hKgTlxJaP7t+76jnApLr85krPzVNDMo7JGxTpX4q/tWaYKN5DGz5DM1
	gd7g==
X-Google-Smtp-Source: AGHT+IEH2/sc/SWyEm3YwKUm+g3xqVnAUkH4+qhsnIfwtnWuwd9hSNX3nrpt7A9JzeGixvSqgN7rjg==
X-Received: by 2002:a05:6a21:998b:b0:215:efed:acfc with SMTP id adf61e73a8af0-23d6ffe5ee1mr17612525637.7.1753691954094;
        Mon, 28 Jul 2025 01:39:14 -0700 (PDT)
Received: from SIQOL-WIN-0002-DARSHAN.localdomain ([49.36.70.111])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b3f7f6b54e8sm4275819a12.57.2025.07.28.01.39.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Jul 2025 01:39:13 -0700 (PDT)
From: "Darshan R." <rathod.darshan.0896@gmail.com>
To: hansg@kernel.org
Cc: mchehab@kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	jogidishank503@gmail.com,
	Darshan R <rathod.darshan.0896@gmail.com>
Subject: [PATCH v2] staging: media: atomisp: Fix indentation and styling in output kernel code
Date: Mon, 28 Jul 2025 08:39:43 +0000
Message-ID: <20250728083943.10851-1-rathod.darshan.0896@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Darshan R <rathod.darshan.0896@gmail.com>

Update formatting of function definitions and if statements to match kernel
coding standards. This improves readability and ensures consistency across
the codebase.

These are non-functional changes intended to address common checkpatch
warnings and prepare the driver for eventual mainline inclusion.

Signed-off-by: Darshan R. <rathod.darshan.0896@gmail.com>
---
 .../output/output_1.0/ia_css_output.host.c    | 22 ++++++++++---------
 1 file changed, 12 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/output/output_1.0/ia_css_output.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/output/output_1.0/ia_css_output.host.c
index d09365e0c471..4f84c6d3622a 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/output/output_1.0/ia_css_output.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/output/output_1.0/ia_css_output.host.c
@@ -34,9 +34,9 @@ static const struct ia_css_output1_configuration default_output1_configuration
 
 void
 ia_css_output_encode(
-    struct sh_css_isp_output_params *to,
-    const struct ia_css_output_config *from,
-    unsigned int size)
+	struct sh_css_isp_output_params *to,
+	const struct ia_css_output_config *from,
+	unsigned int size)
 {
 	(void)size;
 	to->enable_hflip = from->enable_hflip;
@@ -74,7 +74,7 @@ int ia_css_output0_config(struct sh_css_isp_output_isp_config       *to,
 }
 
 int ia_css_output1_config(struct sh_css_isp_output_isp_config       *to,
-		          const struct ia_css_output1_configuration *from,
+			  const struct ia_css_output1_configuration *from,
 			  unsigned int size)
 {
 	return ia_css_output_config(to, (const struct ia_css_output_configuration *)from, size);
@@ -95,7 +95,7 @@ int ia_css_output_configure(const struct ia_css_binary     *binary,
 }
 
 int ia_css_output0_configure(const struct ia_css_binary    *binary,
-			    const struct ia_css_frame_info *info)
+			     const struct ia_css_frame_info *info)
 {
 	if (info) {
 		struct ia_css_output0_configuration config =
@@ -124,10 +124,12 @@ int ia_css_output1_configure(const struct ia_css_binary     *binary,
 
 void
 ia_css_output_dump(
-    const struct sh_css_isp_output_params *output,
-    unsigned int level)
+	const struct sh_css_isp_output_params *output,
+	unsigned int level)
 {
-	if (!output) return;
+	if (!output)
+		return;
+
 	ia_css_debug_dtrace(level, "Horizontal Output Flip:\n");
 	ia_css_debug_dtrace(level, "\t%-32s = %d\n",
 			    "enable", output->enable_hflip);
@@ -138,8 +140,8 @@ ia_css_output_dump(
 
 void
 ia_css_output_debug_dtrace(
-    const struct ia_css_output_config *config,
-    unsigned int level)
+	const struct ia_css_output_config *config,
+	unsigned int level)
 {
 	ia_css_debug_dtrace(level,
 			    "config.enable_hflip=%d",
-- 
2.43.0


