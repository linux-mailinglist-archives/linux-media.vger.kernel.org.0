Return-Path: <linux-media+bounces-15566-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B3BD941209
	for <lists+linux-media@lfdr.de>; Tue, 30 Jul 2024 14:39:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 259752843B0
	for <lists+linux-media@lfdr.de>; Tue, 30 Jul 2024 12:38:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36C2719EED3;
	Tue, 30 Jul 2024 12:38:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BB30WSnH"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59EE6757FC;
	Tue, 30 Jul 2024 12:38:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722343130; cv=none; b=Sn5g8lGmaELwZBeAuxMsTW6NRH57KIJ35Er+JtsEhOT62l4eFnZ4IyEOfXORFY06H28VFE6YMuY5DR13Iue7vex0Qth09E5e0OiFHH+CRaxqSi1m4BVomqZ2yem4HT4ksh2GHeCaK+zSg2MP+G/URZkvuyAYmRJh12U11jASDNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722343130; c=relaxed/simple;
	bh=scfzS0K0VaYL1XByFe1MCrgJqGcJUkxVr2FuHOjIQh8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Psi/iVbOwPoaGrSOFlUJDn34us2+Y2yHdTms+4G/UJk5IfQj6uutNsYM849Gf346kcNSZ+XdqdTTzwpUZ8R6jVlW7PRyRoml+2C7getkx8iNvLwNJ1Ie4JZOSrgo8QvUCV/zMlhv217zSbNJ6SKzcwJqYhVcvyxZPuFZQKBe2lA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BB30WSnH; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1fc6ee64512so28936085ad.0;
        Tue, 30 Jul 2024 05:38:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722343129; x=1722947929; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OXzR6gxYVqwUfoPPIjjw4WoNbj2GDAwK/nIZ01IJrvI=;
        b=BB30WSnHJ4cPJhcgONUg3LnWtCuzTnChnrULMkMaxUpcPHgNdsmSPMgQW7opvBOVnE
         g7/+mL5zlDmCqeFuuw/HzCGk8GIxlh86itZs1Spx+a9oIQKYwi5G3c3y4qobeo/CAmNa
         6Rj2xPsOawP0MsIyAg5k/yytsTzalbeoR/subV+SOG2DTefk+qHRZ1UOQJ5b2LbYZWhJ
         j1wDQCkyZlJUduVAP3wwP2fZqxw91LRxCrDyfR4uzuxiyEgw72F30Xy/a8wojHB2EoMZ
         v7U/ho0lJy/z8BBZNcP8rjdy4VwCEBEX5E1m365Td31H8Xsl2k0/rZBVY/EUkeejHNNA
         zFyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722343129; x=1722947929;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OXzR6gxYVqwUfoPPIjjw4WoNbj2GDAwK/nIZ01IJrvI=;
        b=FUgqQyXNsI5ekUk3bwCjWt/R7Rpx5Ok9KkhXsXIgPgsvt/bP9criFplF0YJV9ESV8h
         YTvdc1EVuz886wNyPviXBjJwaBXmXhh/dg6z8S4lXObAwHyXIhjiQ0XpmsBbQWssUB9J
         pHZdLPPKM0LGDOvG9cNg342/I10a+SGvUjZuPriB0VYFEuj1nGIDrk9heQ7WWBl7d64o
         yITXkcc76o8Z62tsJt6Vf1v0JDzk0/n6ctNGPb6aFUfr9znD2uYzSfZYsmaI2aPB/eZL
         uO9WnB+hWZuIAJugh0D6SN/t7aSonRPm54v9Os0wYNPzddZhO9Iol2F+/2HX2/2FrmL4
         Cbzw==
X-Forwarded-Encrypted: i=1; AJvYcCUnbo0o63f2XA/EHgaJdJrTjb1X0wWdnktzqPV0c7mwGCfiOsFwp1/+5Y9Potfnp6xzMk2+yLDGbmGIqeN36ZrNfx0c8s+EfRlhsCW8eyXyIIfeoiKyQwg/y3mZhP3zGhar5++3cKNVSDU=
X-Gm-Message-State: AOJu0YyseTRI7tLYjpUjbxRjXumYDoN+xAZsFq2VCnbriYX5SbtPsdeq
	BKWz9KYaoVP2tJZoPjL8RpCwmyf2kaKZuNej/CYo0JsiV2bKoSkB
X-Google-Smtp-Source: AGHT+IGpg4llAy6pM/N8Vx3JTRndVzPaI10cX2cZwlz6kJDnN+2KRVmAKdhoAZ4FK5shGeCXTTduew==
X-Received: by 2002:a17:902:e80d:b0:1fd:a412:5dff with SMTP id d9443c01a7336-1ff048e4db4mr109497115ad.43.1722343128495;
        Tue, 30 Jul 2024 05:38:48 -0700 (PDT)
Received: from localhost.localdomain ([211.171.34.11])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fed7ce7e4asm101081865ad.83.2024.07.30.05.38.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jul 2024 05:38:48 -0700 (PDT)
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
Subject: [PATCH] staging: atomisp: bnr: fix trailing statement
Date: Tue, 30 Jul 2024 12:38:42 +0000
Message-Id: <20240730123842.37487-1-kartik.koolks@gmail.com>
X-Mailer: git-send-email 2.20.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix checkpatch error trailing statements should be on next line in
ia_css_bnr.host.c:48.
---
Newbie to contributing to kernel code
---

Signed-off-by: Kartik Kulkarni <kartik.koolks@gmail.com>
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


