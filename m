Return-Path: <linux-media+bounces-12203-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B20CA8D4150
	for <lists+linux-media@lfdr.de>; Thu, 30 May 2024 00:22:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 664611F24323
	for <lists+linux-media@lfdr.de>; Wed, 29 May 2024 22:22:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9661415D5A8;
	Wed, 29 May 2024 22:22:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Z8b6vpnw"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B729416E865
	for <linux-media@vger.kernel.org>; Wed, 29 May 2024 22:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717021367; cv=none; b=uhE2Ghuyko9+OMY8zs4GXZkiYzdqtJ8WZnPP4cwUaNZO3QLx14sfbM/XUeQCHr3TGXcohvfr6HadFP20taKCxK+jwJsomFRkng2AWxk7rtx1DHmw4S5lseQlMFJao1Qk0cqEspnNh+zZFtq6bLRlUAKS/sstgfJ5/M7zlYWLFvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717021367; c=relaxed/simple;
	bh=UxA2qtiqfxDG9uZLSQcoaok7bEvrc5eEMMxcAY149Io=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kHgZX804yFMrcuZ1A55IH7nEzhYJdCaYxxmuaS60c6gZLCYOAIOocq09kfjfa4rtd9ADjXRfopKTX1yO790kAR+iC2OJqT5i5QEZTMTVj+baod5asW42fD8UXB+XA/dtH/EdDnjo8rm3YlK3t1o2grbz1ZEny5X4c+69pkyexvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Z8b6vpnw; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-6f8eaa14512so255067b3a.3
        for <linux-media@vger.kernel.org>; Wed, 29 May 2024 15:22:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1717021365; x=1717626165; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YInXUn/tjsoZlo026MsGMd50nvwe5mYFFBvGfyOU/BI=;
        b=Z8b6vpnwZf5YNVHBi7Rq6goHMdYg9O6NasMagg0F4x7rQsNt64WAhe1EEPc2y46Ioi
         4rB9j9gwTezH6Bka9t3qkMH7TGeFHPJOpuR7+qak2BjsM560mDAyAHsz9Gp11HpN1BD0
         yPXbFkIL189hyv0FhAnu4OzdFBj0aKLulVN6Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717021365; x=1717626165;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YInXUn/tjsoZlo026MsGMd50nvwe5mYFFBvGfyOU/BI=;
        b=CIWC7cwScl2M4kiI5n0ZQcgz+JNgYbaAgu0H6uhb5FaCkOxm5ww+xkRoVGLBX36p7m
         98NGm3BpPwkxsGl3DY7gZCDDExu6hU7paWPEmY1RpR0iUTq/WbOyzpMD2oCfEJmc8FYH
         xZDA01bJGuUZ1UsJJ1jMsx5K5nVEjaRMyAZBIo6rmskwAjP1qjvKcDa2eZhgDELpz45/
         vDO4NviS/eiEqIaMBJFG8R+2N1QklEws/ySs6lQjqAph/TopAk3qxvsmmWG8DuilD6PO
         41sjtXWijGMb/ppVRLeOsQLNNydhDvf75XGqhJXDnE8dKGY8pHb2eY7NhNVig+CjxmlT
         4f4w==
X-Gm-Message-State: AOJu0Yw+O2hkBAnHvrOZZNX6P1f4eiLtnJyV0mNrId7irdygShUdWbFh
	NM0jlyNiFDg8BWQ6vV6Q4mjjWSmlUpAbhIYa7a08i0Ae34CgbQGjXPDVvhcy49+W0BhsBQYd55s
	=
X-Google-Smtp-Source: AGHT+IFG0viy3faWYW03NDQO8xr03e0QAuU7ZhzQfRQR4tU2N1U7vdEGq8CHpsx6wB9k99rQ0dn2yg==
X-Received: by 2002:a05:6a00:f8f:b0:6ea:baf6:5720 with SMTP id d2e1a72fcca58-702310ed552mr434361b3a.3.1717021364819;
        Wed, 29 May 2024 15:22:44 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e13:6:830c:275a:982a:7b83])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-7022d7c6b0csm437080b3a.73.2024.05.29.15.22.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 May 2024 15:22:44 -0700 (PDT)
From: Fritz Koenig <frkoenig@chromium.org>
To: linux-media@vger.kernel.org
Cc: mchehab@kernel.org,
	Fritz Koenig <frkoenig@chromium.org>
Subject: [PATCH] Documentation: Fix v4l2_ctrl_vp8_frame struct
Date: Wed, 29 May 2024 15:22:24 -0700
Message-ID: <20240529222224.1582708-1-frkoenig@chromium.org>
X-Mailer: git-send-email 2.45.1.288.g0e0cd299f1-goog
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Description and control were out of sync.

Signed-off-by: Fritz Koenig <frkoenig@chromium.org>
---
 .../userspace-api/media/v4l/ext-ctrls-codec-stateless.rst     | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec-stateless.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec-stateless.rst
index 786127b1e206..22bde00d42df 100644
--- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec-stateless.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec-stateless.rst
@@ -971,8 +971,8 @@ FWHT Flags
       - ``horizontal_scale``
       - Horizontal scaling factor.
     * - __u8
-      - ``vertical_scaling factor``
-      - Vertical scale.
+      - ``vertical_scale``
+      - Vertical scaling factor.
     * - __u8
       - ``version``
       - Bitstream version.
-- 
2.45.1.288.g0e0cd299f1-goog


