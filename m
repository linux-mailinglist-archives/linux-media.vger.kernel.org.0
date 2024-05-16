Return-Path: <linux-media+bounces-11570-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FAB58C7A8F
	for <lists+linux-media@lfdr.de>; Thu, 16 May 2024 18:42:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 49875284317
	for <lists+linux-media@lfdr.de>; Thu, 16 May 2024 16:42:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4CAC79DF;
	Thu, 16 May 2024 16:42:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=melexis.com header.i=@melexis.com header.b="LnDRW9sO"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA3D58BFA
	for <linux-media@vger.kernel.org>; Thu, 16 May 2024 16:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715877745; cv=none; b=ODy8LLbPyf8jSNF82aHkguNVoEbs2IzJDw3da3f0jma7J+cMsUudy0wDSmqhU2CTzE4iNHBqCGj/QjuyqIHRTe1VnZkPqhmC9IwZzxiQ0+I5H4/EyGQ9w2xPSZfRHd4phoNAlHq5eT70Q1VCMNtaI8jM/WwoZYq4BlQ/dhQ7OBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715877745; c=relaxed/simple;
	bh=UwgZknUu6CAOz/IR9be36P6hpO03NDzOxnGjt8+Y30I=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=glIlzGPHtrDrig0J7CJIx4w/IX6jJMhceqzVGKxYkgVxJ2ahxXvaFN0eD5k3Ceng7feHOHuJbGPkeTQ569+dk9m+J0vXSdJXNsSl2McrgCdfsJKF+wUNkFWVytfFfbV17k5ua/Q2HqoiQnljg9hpY1rbaLkOXrttsGRH85GXZug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=melexis.com; spf=pass smtp.mailfrom=melexis.com; dkim=pass (2048-bit key) header.d=melexis.com header.i=@melexis.com header.b=LnDRW9sO; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=melexis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=melexis.com
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a5a88339780so364770666b.0
        for <linux-media@vger.kernel.org>; Thu, 16 May 2024 09:42:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=melexis.com; s=google; t=1715877742; x=1716482542; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8dfDoFjby3SyG/aRSMt4bJnHeuy60vGajFgy+PGk0RM=;
        b=LnDRW9sOcAzbgiinfza8PjVTnmLmCzl+CbVJ8rP1KXbIL7jn/FpurtjlBEvzn5JWCk
         aL1UMskdCNJCbdObuckYMUpznBzfV43O4sCUBe82VWLfOC6kgiwOCE0Y4k9X1pqLejZJ
         P9M0A+CPTLy4dquCLxTQijw6o15tfsnCUZ0aUw+c2YaIwjp3CPJJxrkrlxp/9A12SKvh
         3MggeZxtfYb55gaI23XSzDnzsen4OK+FwcxlVaMz8I0K+q8ZwMReBTskatOWwMiV4sOt
         Ys34YvLop5YRZ6wVGEmJLcg1Hnp6OlmjnsfODpDRqTpih55nStVXuRbx1aI83gYrOllC
         K+ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715877742; x=1716482542;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8dfDoFjby3SyG/aRSMt4bJnHeuy60vGajFgy+PGk0RM=;
        b=wopRhccDCTUufp+Bg0s8WYLVO+7AtTgPdetvgLVrxeJvR2Jqhz7IIf3KhWQPPdg5HD
         CgvSheCZepKNxg0T0gTuqd4t8mToQ52SApesrU70y3DCYyYInqLnur1nuQ8EASX1Ez0Z
         Ihh/WCXMde/pGdr6Nulzwn1t0gnNHJ0IrnrdhraD02aXnRgqUqkuyh3f/WWUYcWtm2bb
         agHMJ9Y8VdlR76Dv00fx3/OozvjQhTtWXOFiKAbjJfOM+GV2sYdxC9kZ5WRKggJawW1O
         Oig0U8ky6bGoS7UqILRyPfMGMXdpaHWIOWMT0naiaOY48CGXaOgLBNWFs30vInPVHRSp
         SSYw==
X-Gm-Message-State: AOJu0YyAt5ZkZpono2tSEjJgTdjuSXzNuePbUKF5vBpQEBOJ6qeOB3UC
	0h6C4y3YxLXQbMoNCiRbnb7C0RUjE9DcjYigzovmQU7YJRexN/bbjvKA1aUzhXvAMXZV1q1lLV6
	HmF0LLFIxzEjGOraFwbYKkb8+zUECPu7bVP8p2YED9n/hCFJv6hlr+UUWJbXgHfn8y6LP2l06ee
	ETxq1SQtzUqEC7hZW5KE2VwBLFXQF2Wzaj1fE6kg5+
X-Google-Smtp-Source: AGHT+IHHSSq+yHl61xDILgBVZtLr68A2+EBy/A0zA/FYVAkD1jgORtv0oxqn9sts+GSSH2kJCM/fPQ==
X-Received: by 2002:a17:907:7d8b:b0:a5a:669c:286b with SMTP id a640c23a62f3a-a5a669c290emr975549666b.19.1715877742286;
        Thu, 16 May 2024 09:42:22 -0700 (PDT)
Received: from melexis ([91.192.181.19])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a5a1781d342sm1006647266b.6.2024.05.16.09.42.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 May 2024 09:42:22 -0700 (PDT)
From: Volodymyr Kharuk <vkh@melexis.com>
To: <linux-media@vger.kernel.org>
Cc: Andrii Kyselov <ays@melexis.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	devicetree@vger.kernel.org,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Volodymyr Kharuk <vkh@melexis.com>
Subject: [PATCH v6 07/10] media: v4l: ctrls: Add user control base for mlx7502x
Date: Thu, 16 May 2024 19:41:52 +0300
Message-Id: <4fa9a631f1435c799324cc5689e12f454ee6c904.1715871189.git.vkh@melexis.com>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <cover.1715871189.git.vkh@melexis.com>
References: <cover.1715871189.git.vkh@melexis.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a control base for mlx7502x and reserve 16 controls.

Signed-off-by: Volodymyr Kharuk <vkh@melexis.com>
---
 include/uapi/linux/v4l2-controls.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
index 3ac204818bdf..224a0f6b888c 100644
--- a/include/uapi/linux/v4l2-controls.h
+++ b/include/uapi/linux/v4l2-controls.h
@@ -216,6 +216,12 @@ enum v4l2_colorfx {
  */
 #define V4L2_CID_USER_THP7312_BASE		(V4L2_CID_USER_BASE + 0x11c0)
 
+/*
+ * The base for Melexis ToF 7502x driver controls.
+ * We reserve 16 controls for this driver.
+ */
+#define V4L2_CID_USER_MLX7502X_BASE		(V4L2_CID_USER_BASE + 0x11d0)
+
 /* MPEG-class control IDs */
 /* The MPEG controls are applicable to all codec controls
  * and the 'MPEG' part of the define is historical */
-- 
BR,
Volodymyr Kharuk


