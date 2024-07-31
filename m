Return-Path: <linux-media+bounces-15636-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E8C5942BFD
	for <lists+linux-media@lfdr.de>; Wed, 31 Jul 2024 12:34:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 608011C23153
	for <lists+linux-media@lfdr.de>; Wed, 31 Jul 2024 10:34:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F2571AC454;
	Wed, 31 Jul 2024 10:34:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EDjqtvn6"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E36C161311;
	Wed, 31 Jul 2024 10:34:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722422043; cv=none; b=l/I5J4LwVBD3ZlC44Mk60N9K30du74x8CWKEXKxC6T02/T5R95IqJb2EHYx8IkCBHTG4iWUwL5bJkzcu6NNsZyYCwkH1jZGgHoiA2e3BmWyn98+7RYaBqrGP5g9Zj08bJMkzzO1+uMrZoWcyOFzjsBFO6B9NepOAu9Y/XTc8EZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722422043; c=relaxed/simple;
	bh=dOa8hT4xWqQ2AnDtQygL24wv+0L76YIYrzot6K+GRtw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=o0yja5SCdznpeBC+MjsUh6rI35LfWnTcm4eonpDPQJcX8kYBDKbmYxnnvMofp2EG6c8LZBR2GU1iw4h38MWGktLxkTPKAigs6qe48weUzCbmrt8n4Ckhdxrn6LzrRi1tp2hdmbeFLgF78GynWlq5Y9rxi+I+REGb1OkSdcaMYzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EDjqtvn6; arc=none smtp.client-ip=209.85.160.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-2610623f445so3795280fac.1;
        Wed, 31 Jul 2024 03:34:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722422041; x=1723026841; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CLpJAlwrYnKpG4yNN+f5PTDXi5Vm9RWGLixCvfhYZ0w=;
        b=EDjqtvn6HJw5z9cHytCcpGGpavcdfP2kd4ItnJjtcdKLx3nGH0atfwVyv71L2hndsW
         eoulHjA7jZTBEpvy1bMq8F8rr+2wbl5oMSUXqI2N9t4xv9ILCH+v15czPIm7SxmD1Tam
         HCIErnXNJFonWKSUk9fe3qV8l3qL64fNPsucILetWNCjc09kCQheExAY3d/YeIUByLv/
         uWbNoZGPv5o19Anp3Zd1UxVnuY2rXG4XToMdp+NoYR0T07ss+lAaguYhEfc9bVFiOSci
         4GDR/PKGfqKKktmuXg6Lii2366SbyDhZ/smju6qyccwFmYMnyksRf2ehPvRWxIotgsgV
         rZFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722422041; x=1723026841;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CLpJAlwrYnKpG4yNN+f5PTDXi5Vm9RWGLixCvfhYZ0w=;
        b=FUDhuQ5/pd3uauV4GpXkJh5IeimuxDSlqSOc06w7BzfHK7shto0nfEKrbED3or2FUT
         7zi5M9YwgIplhH2AfrF1LiiknxFeKfdwnwIlAnuNL+7K0YvIVPYBQP0Ul0uuKuLPzKNw
         XIIDfEpBDRDiAhnytVGxUxIPfzlNEzWHDRaDZTIWfOnbYFt1btVxHqVfYZ4rdx2IfNSq
         YCqQIcZbkMpNP4DW5E3Mb2cNYfMflvQN2AdXb/vJpEK2yWHiOgfABL+gJMOXN9/aeNp4
         KQjGNGhVVg0/vfjcXvh5kdXlY3bFzVP4eNbLnIZPm8lipAdHc27RSdB2qGZDPXNAAV6U
         2PVQ==
X-Forwarded-Encrypted: i=1; AJvYcCUQJEfet/ekbH/oDL7NmdZXPp3QcvSgAtUtZk22xo2Xdf+S7VI1UbTePouJRJPOt4jkY4JVkVCsWKDlgZrjWpGehi7Bg8sclzW4K9Z/DTR5D+UV8875/ZxC3NlYiZgtjgc55qbxoKoI1CQ=
X-Gm-Message-State: AOJu0YxKUoLKvSYGySHNQGKXp3ZwUg4627YTfWpGyKZMYto62IVzZSun
	JbJMrxsI8IuvO8fyGj42r4JEJPJhSNYOYnddko5Mq7LPDTQSC0Zv
X-Google-Smtp-Source: AGHT+IG0a80aavBWEprMsVQIzBNeMtP25uSHl/X9jrMtPKSQsZSgH8vwwvHyW892+ooHawHz5yMqIw==
X-Received: by 2002:a05:6870:6488:b0:260:faa1:4453 with SMTP id 586e51a60fabf-267d4cfc02dmr16644539fac.8.1722422041368;
        Wed, 31 Jul 2024 03:34:01 -0700 (PDT)
Received: from localhost.localdomain ([211.171.34.11])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70ead6e1a89sm9734940b3a.30.2024.07.31.03.33.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jul 2024 03:34:00 -0700 (PDT)
From: Kartik Kulkarni <kartik.koolks@gmail.com>
To: hdegoede@redhat.com,
	mchehab@kernel.org,
	akari.ailus@linux.intel.com,
	gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: ~lkcamp/patches@lists.sr.ht,
	helen.koike@collabora.com,
	kartik.koolks@gmail.com
Subject: [PATCH v2] staging: atomisp: bnr: fix trailing statement
Date: Wed, 31 Jul 2024 10:33:53 +0000
Message-Id: <20240731103353.39245-1-kartik.koolks@gmail.com>
X-Mailer: git-send-email 2.20.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix checkpatch error trailing statements should be on next line in
ia_css_bnr.host.c:48

Signed-off-by: Kartik Kulkarni <kartik.koolks@gmail.com>
---
v2: Move Signed-off-by line above the exclusion block
---
 .../atomisp/pci/isp/kernels/bnr/bnr_1.0/ia_css_bnr.host.c      | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/bnr/bnr_1.0/ia_css_bnr.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/bnr/bnr_1.0/ia_css_bnr.host.c
index 457a004e1..b75cfd309 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/bnr/bnr_1.0/ia_css_bnr.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/bnr/bnr_1.0/ia_css_bnr.host.c
@@ -45,7 +45,8 @@ ia_css_bnr_dump(
     const struct sh_css_isp_bnr_params *bnr,
     unsigned int level)
 {
-	if (!bnr) return;
+	if (!bnr)
+		return;
 	ia_css_debug_dtrace(level, "Bayer Noise Reduction:\n");
 	ia_css_debug_dtrace(level, "\t%-32s = %d\n",
 			    "bnr_gain_all", bnr->gain_all);
-- 
2.20.1


