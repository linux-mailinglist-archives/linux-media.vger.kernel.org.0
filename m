Return-Path: <linux-media+bounces-20031-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BAC689A9CE9
	for <lists+linux-media@lfdr.de>; Tue, 22 Oct 2024 10:37:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E4CBF1C213EF
	for <lists+linux-media@lfdr.de>; Tue, 22 Oct 2024 08:37:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8067117BED2;
	Tue, 22 Oct 2024 08:37:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="mMqQid0v"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com [209.85.217.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0942140E38
	for <linux-media@vger.kernel.org>; Tue, 22 Oct 2024 08:37:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729586238; cv=none; b=iF4O9U2fOpBpPof1TunL3HQuFMeweQgWgV/nM9TEFbmsQldh5CxPzFtxlbUxvY10wG6HbSMQCG3eyqaA8lMObn4rFibd24UEjYmFMWxXlHYczjwyceii2xJEWWRJTeI4GF5YgOiprOWlHHph6vo898KqHA6wz8dlOm/+40+PAZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729586238; c=relaxed/simple;
	bh=2+tHBXLB52nrb5ur8WQTqZDtTXdTlh2/ORRFsQyeWeg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=NhuOwyXQU8c+cbpLRhRus9ojs7TCvuox0O5X5Yy5BTtkFRH9/JPNhOKy9aFgkxMqjLpOXiYP7X7eIWuEbDDAhuYo42WWxP/j1sIHeOQE8TPanfHh0FByPd8BK8WUFOTb7so29B6fJxgxMK2g4BmawdC7FQI3IhJKQnZB5Gbx/3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=mMqQid0v; arc=none smtp.client-ip=209.85.217.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-4a4864b8f98so1406711137.2
        for <linux-media@vger.kernel.org>; Tue, 22 Oct 2024 01:37:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1729586235; x=1730191035; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PYBU5LVKi1NBKSVbybBbkXcGxUCfltoJjMWsJSkrdSo=;
        b=mMqQid0v8LL1ITEE8DRPl8JeIEAbBrQ67jJvl9ZPyjFIejVsI+xcZ5/GvCafAsmBUz
         6RyHPTbdJNf1aXj3g4tDw8SGZNkUUgbZC7DvUAfxzPYX2V6YauQkzpr5oqrf2mwcsllS
         0B4O78tGjgBFvzaOA8JWEq41dxhkAchJdhsXo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729586235; x=1730191035;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PYBU5LVKi1NBKSVbybBbkXcGxUCfltoJjMWsJSkrdSo=;
        b=hNPFUCmhN5U2FrclZnlu4vdKIKpbcVHSSH8Qi6/3IID6r4J+4BVHgdhHdIdVNKqq95
         bVa+vKvotVkkPg+So15hvjqlQqRDDrXGcD1BO8U2h5SB1kwkJz4wtjBcnIjDCLILp+D2
         2ksYlWfhUx8eghplPCt4OY/O9oQEMePs7ZOb+Sz6yvQKIs0UFdBkO0GvsBDMTC1Ljpwv
         7xNjK3Q/5NLEG8xMJMnVokHfQSDYCy6A+WqDXSRRzOeMoNjx/TZtq7DnU0yPVJGlojkJ
         McI3cESt59sSbUeKcyIfrOYZgeSHFi9cziuOaJmsLWHBld7S+kti5RawBYmQz/ZXLew3
         IT1Q==
X-Gm-Message-State: AOJu0YyY2Pad0wgSmcHLNVL52VTiauoLbYRaNcvOpU/EVauhytymvrrf
	e+rgapI302gs74cSqUa5EXRxsBjtG8QR5+IHm1Fvnzl8k26KecMBh4Hx5ZeRug==
X-Google-Smtp-Source: AGHT+IHmy8BIavT1N3KqQl/mbI9rUUbK3P3RCOywFOoBOEnGDDkVRqT1bLldV/imxr6JYpZUT/3qSQ==
X-Received: by 2002:a05:6102:5092:b0:4a3:aa99:5ef1 with SMTP id ada2fe7eead31-4a5d6bd71d2mr10940099137.25.1729586235669;
        Tue, 22 Oct 2024 01:37:15 -0700 (PDT)
Received: from denia.c.googlers.com (76.224.245.35.bc.googleusercontent.com. [35.245.224.76])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-460d3c95aafsm27324541cf.40.2024.10.22.01.37.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2024 01:37:14 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 22 Oct 2024 08:37:13 +0000
Subject: [PATCH] media: uvcvideo: Reorder uvc_status_init()
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241022-order_status-v1-1-3904fafca340@chromium.org>
X-B4-Tracking: v=1; b=H4sIADhkF2cC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxNDAyMj3fyilNSi+OKSxJLSYt0kwxRLC9M0cxMj42QloJaCotS0zAqwcdG
 xtbUALdUpDF4AAAA=
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.13.0

Only initialize the input device if the interrupt endpoint has been
properly initialized.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_status.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_status.c b/drivers/media/usb/uvc/uvc_status.c
index 06c867510c8f..02c90acf6964 100644
--- a/drivers/media/usb/uvc/uvc_status.c
+++ b/drivers/media/usb/uvc/uvc_status.c
@@ -262,8 +262,6 @@ int uvc_status_init(struct uvc_device *dev)
 	if (ep == NULL)
 		return 0;
 
-	uvc_input_init(dev);
-
 	dev->status = kzalloc(sizeof(*dev->status), GFP_KERNEL);
 	if (!dev->status)
 		return -ENOMEM;
@@ -289,6 +287,8 @@ int uvc_status_init(struct uvc_device *dev)
 		dev->status, sizeof(*dev->status), uvc_status_complete,
 		dev, interval);
 
+	uvc_input_init(dev);
+
 	return 0;
 }
 

---
base-commit: 698b6e3163bafd61e1b7d13572e2c42974ac85ec
change-id: 20241022-order_status-b1d985f7423c

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>


