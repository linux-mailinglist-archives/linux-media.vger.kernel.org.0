Return-Path: <linux-media+bounces-19013-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D452498E4E2
	for <lists+linux-media@lfdr.de>; Wed,  2 Oct 2024 23:26:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9DD2D283C7F
	for <lists+linux-media@lfdr.de>; Wed,  2 Oct 2024 21:26:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9BDA21733E;
	Wed,  2 Oct 2024 21:26:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m6hBmE0k"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB8C3745F4;
	Wed,  2 Oct 2024 21:26:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727904371; cv=none; b=kpOeMpIoKJf1pXRCUvareAbATf+oMngHGFitoUtKpINcrocScHHhBh2Nj7Vc4Z6L0XnVar7bYP9h8tVIUS58v2frHpmRuEa2YJDkmaZStEMvI+Rb4+3PhI2deFszhy9F7bxtw0bLpoMsepe7IPWq4ZKCzB3dgeYgMLRDQxl3ViE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727904371; c=relaxed/simple;
	bh=WIwETBohO3aK9eE6zcNFUPL5J+2Bzg5RoaeesKmYV9s=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Wu3580FylWOA79f+9iug2gqkP5sgPsFrJ51yIHbSGa3212Vh728zx0ByrLPR/3lQC/gp52SeSAgf8RkXro8pd+yyzLny1zGj43zHXP2eC/yYEt78OmNdvlza1xMK6E1J+b8ZlTMC+tRXBZbkx+lutC9YEoZPMj6i9T+OnbHXXFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m6hBmE0k; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-37cca239886so163194f8f.2;
        Wed, 02 Oct 2024 14:26:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727904368; x=1728509168; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AOcvVNK2WrdfDj49WbWGeh8ACZyxjrA10kZzplCrF5s=;
        b=m6hBmE0kJkmSMjiyFG4s+iFZeX7g1Yu0/XaKWyZb3A5i/s+rxFki782AfwGmtdefdU
         ZmJCOqMwGMf7I+6AGLIKCbLjzfxa5Mu3YfnHKzglNKtmnbrOtTHUNI6XTBtWuCKIEvnI
         jrq/97w2py4cF/QFnFjCWzk+d2BACYlHWm5TcDHH5+qi8XswIyEH9dFQOBpfjsvJ1wUM
         Xny9BSMRcweiNCP6uPuRhrvHXaG4INTkTK0/nGqe2eo76zI2EDpnM0UhumnliB60/fLe
         fGTHMgbLgv/O2LQuZVZbQQxQEEq/rw6fXUJ29yH8iY/nVikDzYiQf/2EjMpFiOyq2JE+
         Ujzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727904368; x=1728509168;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AOcvVNK2WrdfDj49WbWGeh8ACZyxjrA10kZzplCrF5s=;
        b=dLr1gAfnOtMhCI26jJR6Y6xCKItR9Lm3IdCdM2xslkyHaYtMXRtkHt2kJr8uu3haQP
         GdI9PygqN3IfMdqLJfjXjTrnDi6yD639hDv5ctgSkTzcA8qqsVM0MKKSnJBf1asET1ZH
         NcivfJAPH0x3QBP+o9eDgwn8yqpf86LfKFuGQ+B85bUaCisD3x66OaFDhmYNlhImiXO7
         yIF5WRil4NgKlNTUJZC9v0ZRyN3zrpElkMi6Pn7GBUSaI5j2EvkP4L98oSDVIA+4v6Nm
         Ca87YW2HkAR+Ug6k1Nl6FFnURKJZG98yN/T49xERFl4czqqEZ3mBLYpW7ZbzqqzgUZuC
         4vLA==
X-Forwarded-Encrypted: i=1; AJvYcCUlfKZF5R6e0EyGNGwucZCP05uthUF9XOnIuU3zvn7RNGSqU5IenaIv0D2G9fmy3eD/sC4AJxvza1yZD+Vj@vger.kernel.org, AJvYcCWsjbTjQZuXtiP1haY/9ik42qdNWmH16LfemAl9iS+1SAYiMaOcva9hk45vnmi/wwD2layP3iMLaIs4bS3qocc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzfjRCG3bzqd07iFRMky7VZk5voEccJ8NBpuvqW9C669Z4luzZT
	RkpzFCS7FPi1OAZgFXcE4F1f9AnMrzVoVm0RKCWOOIAvZcZ3ikUqu8Ra0HUX
X-Google-Smtp-Source: AGHT+IGX4piJLhOGfOs086Byo34hoHy5E/XyRszjATF6s//1hp1I6WKzQZuu6BRm6QZ7TLDIn84myw==
X-Received: by 2002:adf:fc50:0:b0:37c:cd3e:6fdf with SMTP id ffacd0b85a97d-37cfba0a496mr2794089f8f.42.1727904367703;
        Wed, 02 Oct 2024 14:26:07 -0700 (PDT)
Received: from void.void ([141.226.9.42])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37cd56e645fsm14638998f8f.59.2024.10.02.14.26.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Oct 2024 14:26:07 -0700 (PDT)
From: Andrew Kreimer <algonell@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Andrew Kreimer <algonell@gmail.com>
Subject: [PATCH] media: platform: fix a typo
Date: Thu,  3 Oct 2024 00:26:02 +0300
Message-Id: <20241002212602.11601-1-algonell@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix a typo in comments.

Signed-off-by: Andrew Kreimer <algonell@gmail.com>
---
 drivers/media/platform/ti/omap/omap_voutdef.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/ti/omap/omap_voutdef.h b/drivers/media/platform/ti/omap/omap_voutdef.h
index b586193341d2..159e5e670d91 100644
--- a/drivers/media/platform/ti/omap/omap_voutdef.h
+++ b/drivers/media/platform/ti/omap/omap_voutdef.h
@@ -48,7 +48,7 @@
 #define VRFB_TX_TIMEOUT         1000
 #define VRFB_NUM_BUFS		4
 
-/* Max buffer size tobe allocated during init */
+/* Max buffer size to be allocated during init */
 #define OMAP_VOUT_MAX_BUF_SIZE (VID_MAX_WIDTH*VID_MAX_HEIGHT*4)
 
 enum dma_channel_state {
-- 
2.39.5


