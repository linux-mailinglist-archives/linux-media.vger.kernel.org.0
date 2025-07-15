Return-Path: <linux-media+bounces-37774-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CBE9AB058D7
	for <lists+linux-media@lfdr.de>; Tue, 15 Jul 2025 13:31:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2148A4A1DC8
	for <lists+linux-media@lfdr.de>; Tue, 15 Jul 2025 11:31:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7516D2D949D;
	Tue, 15 Jul 2025 11:31:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JnW3X1/A"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A6EA8462;
	Tue, 15 Jul 2025 11:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752579068; cv=none; b=PpHUWYMOVSadl5yKz6g50ywEX4kssQ3AWErVAlsbzmSIH64YflBL2Atw8/b+Oo17BVJ5LshxisfhKCWF8hBSPG8PKFBAbTwGqsyzkamfKvdomOOThry480X8sjaef0wH0Fe0nL3lV/fbPjxD6wJZBh0pKOx7AzdVwLqv8Qyj3sg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752579068; c=relaxed/simple;
	bh=moyOARuy8RSKpwVuPpYdyJGAqnZcsYNekcY6gapip6I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pCnipNvqggXsjEDTipn6ytk6OBzgpPUu0F6BNrFaRhylntjUjWSRx6jo0HGvB8T86lhigIgitQixK+2X+XLdfFcAujPmTiBjV/UFt5NblmROW4zElhYRPu/bTntxXZt+6VXVxLZUDJwWwm793J48T11/YuDBpK8cfUlb0/TxBdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JnW3X1/A; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-23dc5bcf49eso65126335ad.2;
        Tue, 15 Jul 2025 04:31:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752579067; x=1753183867; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MB3mRNaYQABufvdOOekFqRmL/bjqRmQ6jJVEm64MslE=;
        b=JnW3X1/AyBV/80qLD4BNiK1EELTy6fd12/3fw4rIt0lqFlzKojPT5kZIz6xCGHZ06a
         FC3WTbiKbnCa6c2yg3qis+HFHbb6l0AVZDv40BiLuZ6bt0scTpgoBOKJ6MA8x+th28gI
         x2rKasoN3C7oA9rQ0UJ/oPUJ6Z/Pfjjh0xMZHmF8fbcTXcpsi/91pQUg9IXFKYERN1rb
         lPiOjVn++VN1kG67K18ozrNv4fb3G4MGFQW+raDAgBK0i4sLCOyMyRIX+/z/vRKydnJD
         PRsQOMneUSP65WarGESn2YjyE+DA7qlyzP83puVpwWH1y5Inq4FnM8UAO8jus53uMrsM
         iCHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752579067; x=1753183867;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MB3mRNaYQABufvdOOekFqRmL/bjqRmQ6jJVEm64MslE=;
        b=a8SZzvosYWezfs5PObWPeqfFoaZhfTROp5pbT/YZKXVKeKX6RPSEzgOMmZkZ53lBQi
         nwon+ZR8e+JgIWuvYDuttyKxu9oWcZD1Kc/RjpGc63fRB4vw5XGqifOMTo1FdAkXEXvc
         KWI0E3cF1Tc45FfZkUpKvUXJKJAtod5gizoPbTOeL6pqTPGQp25Wz0RgP8bbi2LGeN+z
         OK/VXMpz5MKDKSjWkS/5kll2rrMqBzSIV3bn2GBkPhSgiDdvjc6al0Kk/JXHSUojDpDL
         rjy3FgUlk38CJSWILX4NZyHZwrqYzDisJHZwMRlRJFPSsXd/SL4dYldPlv//dGjrIz04
         6bLg==
X-Forwarded-Encrypted: i=1; AJvYcCUooSMr5wZw/kGxbT02mcsc3JVyq2fIpzQkr1V1O2kW202DfwPVy8vdHp4ZxXRBPQN/mgYZqFjbgfo44KA=@vger.kernel.org, AJvYcCWQWWm8D/VcdYS3xuFkFpX1kajEhZGkbFPXC7Oh454xWsHlUjoMdqnY9LfOSwsLghNi7uEiCnII/vhxdvw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz54tyO2oTkLwDMKJj006H1TXCq1XAzBYV5eHIraqJ33Q6e3BBV
	ovB4PKqxsyNPA9c4rlP/W9tVXG5vzDUx4gMQIQoIF741BJ2+WL8hOlEe0mLP8QNz
X-Gm-Gg: ASbGnctbcjl3MglrN33ObA5GjGFJCM3wam6seewnjRXJ4oo+vlBdfRRQN32PmyVxMG/
	rVCh4rXtfBmQyhCL8lJYIuxEy5mX5FZ8zTP6c0Uf59q1m3YCSygbCYB1rBmtk26GC8rAf0b86od
	s20xC/u3j64Z1MeOg+2xCWch4ZWZlumCpJW0YC3PbXNAy0UOpzutM48myNAE36zvLu2gh/rhOpb
	LhqVqngZYFohi4fss8JU+N0XUOFHjmSGsTgu41Q+mx5+P1AvTGfpQzjYeigRNv7RBl4iA5BNXbF
	xPkEdgLYTljbZF8Y/MzIGSWjtaAraIaf3YTVZWu2+BZ4Pa5RRyiVLTP4SI49P7d7IoT+kpiqTsN
	cucioMvE2res4h8Cal1UjwB/JIotpc6MOoXovFFbcTcPl9TvPs59ZOnNj6DjtwyOiAjUfwHP0Ly
	k=
X-Google-Smtp-Source: AGHT+IGmHOZ9OMS1zAMyxgpr/bncWsGTANPbrsoKFtlV1jH0mzf7bvoTC8FLSJtindJQXpmb+iJTPQ==
X-Received: by 2002:a17:902:cf52:b0:23e:90c:8213 with SMTP id d9443c01a7336-23e090c838amr88695615ad.8.1752579066402;
        Tue, 15 Jul 2025 04:31:06 -0700 (PDT)
Received: from SIQOL-WIN-0002-DARSHAN.localdomain ([27.57.176.233])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de42ae74esm107719875ad.74.2025.07.15.04.31.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 04:31:05 -0700 (PDT)
From: Darshan Rathod <darshanrathod475@gmail.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Darshan Rathod <darshanrathod475@gmail.com>
Subject: [PATCH] media: uvcvideo: Fix assignment in if condition
Date: Tue, 15 Jul 2025 11:30:56 +0000
Message-ID: <20250715113056.2519-1-darshanrathod475@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The function uvc_input_init() used an assignment of the return value
of input_register_device() within the condition of an if statement.

This coding style is discouraged by the Linux kernel coding style guide
as it can be confused with a comparison and hide potential bugs.
The checkpatch.pl script flags this as an error:
"ERROR: do not use assignment in if condition"

Separate the assignment into its own statement before the conditional
check to improve code readability and adhere to the kernel's
coding standards.

Signed-off-by: Darshan Rathod <darshanrathod475@gmail.com>
---
 drivers/media/usb/uvc/uvc_status.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/usb/uvc/uvc_status.c b/drivers/media/usb/uvc/uvc_status.c
index ee01dce4b783..3c29c0bb3f7c 100644
--- a/drivers/media/usb/uvc/uvc_status.c
+++ b/drivers/media/usb/uvc/uvc_status.c
@@ -62,7 +62,8 @@ static int uvc_input_init(struct uvc_device *dev)
 	__set_bit(EV_KEY, input->evbit);
 	__set_bit(KEY_CAMERA, input->keybit);
 
-	if ((ret = input_register_device(input)) < 0)
+	ret = input_register_device(input);
+	if (ret < 0)
 		goto error;
 
 	dev->input = input;
-- 
2.43.0


