Return-Path: <linux-media+bounces-18249-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D54297804F
	for <lists+linux-media@lfdr.de>; Fri, 13 Sep 2024 14:44:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 54F211F22FF0
	for <lists+linux-media@lfdr.de>; Fri, 13 Sep 2024 12:44:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 317A91DA2EE;
	Fri, 13 Sep 2024 12:44:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e1M6L6uf"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FD901DA2E4
	for <linux-media@vger.kernel.org>; Fri, 13 Sep 2024 12:44:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726231456; cv=none; b=uZY3Jmg06SemdzjA9+p/3cPDhpK+qDqw3CP+oK8sINVDh0myezG2DqT18Ubt27xbkZcM4ftIi9KPsuuuTt9gc7KLu8gD9DVbrxZ8H5XWC3N4SHjBT9YiOyNscnAo4rM2u8pVay6Fje3L6D7kF2oMe78qyuevTZRS/b6H4GNJG+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726231456; c=relaxed/simple;
	bh=jK0/es1PZjMksQsfU2mnXI4t0IVZ2DRf3nSgV+ca8Iw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=abfA5GKlxrSPwgmdU7oKd9+nzZ87ZrnPF41pUJuplM3V9T72Jy8eivC6PsjOnvrTH7hBmKc7ahGorLy09qRfkxNEKHRAMOy0OoMO3dghDfX4DXvsY7S9jYOApQ/Gm5MYQYDIH0pWEvh+33SkdVQ5KtGiHLjUYcO+DMSR1THwDMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e1M6L6uf; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-6db20e22c85so17435297b3.0
        for <linux-media@vger.kernel.org>; Fri, 13 Sep 2024 05:44:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726231454; x=1726836254; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Yn/Kez8T8o9sqObldWaSIHHHR1rchxwHaNVyqiyIOL4=;
        b=e1M6L6uf19Cs58ar13WZkkt6V8VJ/ca2msYNB8r5SKGe1u4mVXji3T6LwdsiKcsQAl
         RIYiiccYzTyJcNDEg7W6sidRK10DB7sygxOq8yViZFmRLvY17nlEyF9wRjXC/oWndx8m
         oLpNNm0b/599TXDXNkH68RSnjCX//X3HV+iGdJvnakO1KnAYL9IFXv9SufKtdJTXIsKM
         AFGuQOMC2N4Tyn3CfHhXIVZYmrAqkjtXqC/MxUPgP6ASV07JwiDwU5EdHjx0txVJ+8xl
         Lge80gadzC7SEy3R1xRtgOj0i+bLZJAwKE1Bg6QeNG+3E8WR0rgwloAoDXkCxNfu69B+
         dItQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726231454; x=1726836254;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Yn/Kez8T8o9sqObldWaSIHHHR1rchxwHaNVyqiyIOL4=;
        b=n9kUxz6xFXBWOW1PcmycOrKKZq5tt5WP6vCvk/0B+tR8ax8IoXXklSvCEzxPA5R1sH
         dBqiXRb3wj9qdprQm+pqsMWvB1OWKmpH8Kh+K5gHWkjDqt7R71ZqqHInV74sCuUHXYxQ
         aFnnIUEfD4WnzLeXbQ5ah4cZGe3IvU5o/zidIt1ULtlfO7Zfzq39HvEm1G1mAgsGYnR4
         exBoP9mlaKIZjZWsCA933AlPItJq5OZG7ggP3tQtc4mTom64Ok/RgtvehSpXVN96+3XO
         YzWprzKUBqr6VgyaczrfXMQ3OJJ3p+h0HwePYXHVsXRiUX0II+2LJ/8d6V9WySWLf7GC
         suZA==
X-Gm-Message-State: AOJu0YwIw906VNde44XMAqkd0q17k9PAJsRHU0c101ZiMRTRW4XUQNV2
	cAb4XuPWTqLWDIItWrv60N5JIAktnH3Rcbb+vKEE4ToHqSLrNB+9
X-Google-Smtp-Source: AGHT+IHcXtgTblRw+zwz5dbwyj5DnGJk6Z/rSN9Z8arkwewLW7hv7iMfnxrNDDpaBXPutv/ZS6FspQ==
X-Received: by 2002:a05:690c:d90:b0:6d3:c673:e57a with SMTP id 00721157ae682-6dbb6aeb336mr62202787b3.5.1726231454053;
        Fri, 13 Sep 2024 05:44:14 -0700 (PDT)
Received: from kendra-linux.. ([64.234.79.138])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6db96462116sm13755327b3.43.2024.09.13.05.44.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Sep 2024 05:44:13 -0700 (PDT)
From: kendra.j.moore3443@gmail.com
To: sean@mess.org
Cc: linux-media@vger.kernel.org,
	Kendra Moore <kendra.j.moore3443@gmail.com>
Subject: [PATCH] docs: fix misspelling in lirc-set-send-duty-cycle
Date: Fri, 13 Sep 2024 08:43:19 -0400
Message-ID: <20240913124319.6385-1-kendra.j.moore3443@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Kendra Moore <kendra.j.moore3443@gmail.com>

Corrected a minor misspelling on line 30. This patch changes
'cicle' to 'cycle'.

Signed-off-by: Kendra Moore <kendra.j.moore3443@gmail.com>
---
 .../userspace-api/media/rc/lirc-set-send-duty-cycle.rst         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/userspace-api/media/rc/lirc-set-send-duty-cycle.rst b/Documentation/userspace-api/media/rc/lirc-set-send-duty-cycle.rst
index 2979752acbcd..a94750d00898 100644
--- a/Documentation/userspace-api/media/rc/lirc-set-send-duty-cycle.rst
+++ b/Documentation/userspace-api/media/rc/lirc-set-send-duty-cycle.rst
@@ -27,7 +27,7 @@ Arguments
     File descriptor returned by open().
 
 ``duty_cycle``
-    Duty cicle, describing the pulse width in percent (from 1 to 99) of
+    Duty cycle, describing the pulse width in percent (from 1 to 99) of
     the total cycle. Values 0 and 100 are reserved.
 
 Description
-- 
2.43.0


