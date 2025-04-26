Return-Path: <linux-media+bounces-31094-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 85C86A9DCF0
	for <lists+linux-media@lfdr.de>; Sat, 26 Apr 2025 21:30:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D20539257E8
	for <lists+linux-media@lfdr.de>; Sat, 26 Apr 2025 19:30:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EF8C1E98EF;
	Sat, 26 Apr 2025 19:30:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V3YgwuPe"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01F1114D2A0;
	Sat, 26 Apr 2025 19:30:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745695845; cv=none; b=XQm+wLnGPCTTszhakYxce77I/AAIuPrbWi4FcEARaGQ/42EWOQo1A9//oEmQaw5w4SWq9NsqBxV0ElgnE5mWuqVi23TBfUDZwFSLjaWgXc4x58jyFtCbgtiVTpuG5t+ubZT2polJBxLj9/Yvs83VIpH+rczE2/t0QcU4AREEAto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745695845; c=relaxed/simple;
	bh=+UMWPfZQGprhjvZC3NEM1Phb2xl1Ra+yrRsJZw1MGzA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=YOCOJVeVEYTi6nWfd8Jk9GLmiD31HZnsPGTYYB11i1e19g2yAKWWdZGlZ5WkHqNvYioUjZeqtE59ESPSE8FBemut9Ku5kMoq5H4DedNIrrEzKknqQtfMmYft0SPqhOfZPYfYOStg0XYmkMgxLtMUZ1r7fgHpc1CXtfWX+vP5nhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V3YgwuPe; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-acb39c45b4eso533357966b.1;
        Sat, 26 Apr 2025 12:30:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745695842; x=1746300642; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=A/pCvwb99p1XOTcj4o1cOPpPIeZSgX90ZCLw51SM5Aw=;
        b=V3YgwuPesdUVSuH17EbB51NdYUOMT8XxT8wWT7GfOzLRDedla27EFFz3RmtqsLEqkD
         0WS87FUwVLojTUNWawGJ/F/2CFTRwEt64+z5CVjCtNPPVhXbIp80DHgitgCoSJHgKArK
         NBI4hKtxy2A4uu+8sgcsnbcAOcVbA6Gy66pw6Uzj935v8Rf8ZRIIkWiaRwe+1pMiMpNG
         VUo21CNeeiqAaHXhI8okTfMHv/RPFnRZBENStbFBP77U/ChbLvGzZrnIrFiRiI0yEFG+
         zopegQbW5cutS+NjpA4/Tocu03T94hwDmZKKXjp/px9YKFX1lLaJMazexmZUlTVXkNuH
         0VQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745695842; x=1746300642;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A/pCvwb99p1XOTcj4o1cOPpPIeZSgX90ZCLw51SM5Aw=;
        b=NrLD9hmN3ggDqEXhKe//GXG1pmGIb8ILhZ7fXeicDFpl+tkOUhe3+4/97L+0OL7VYd
         +gRWLJZx9PHix742CCa1RkH5i0FW4TJ93daJCe13WE6No5PcndGJXZgQ4nlvlkjyAjxL
         XOQNgHWni5oMcQtjy8Ol3ULeqqcmTaEccX7IH9zOYlIq5ISNLdm+q/WP+s3s8gQbyw6S
         VSEtn6WDF5uhJ9CC6H8DQyqsAGrfUIVaNcAStH4J7n5TVdfseZ/MAD6XE0cdRKbE+UwA
         h6HZdwKbpF2VdmlPROZSQUQBH9KzLJ4w5QYldXDwnhSvOVPDGcm/nkLF7KSuClY3/S0I
         yzbw==
X-Forwarded-Encrypted: i=1; AJvYcCWEvie3WvzMQR4n0LYCxQX1ohFfObMZllvqin49bndVq93zTg/3rb8PLxQp+b3p1OKXcEOHUvvgyTzqL78=@vger.kernel.org
X-Gm-Message-State: AOJu0YyayF2t3ZPAjUuC7fIVPgnwewlifFWnht0fUVjvIGrVp3WTfrG2
	1ojt7e87llZw3d/GDZjd8QV675aeLxk3tRMMryq0Q6lYl34DT5ma
X-Gm-Gg: ASbGncu8ErNCsQARl74Xi8ls2y24c/mcjM+p2CnjoNSV5oD7R26RagZBw2LDjeW2OAx
	ddevlvgT0PzazVWVedQs/GzmhYitGPbQ9q31t5DiQqEx5Cn440oO0Y4HABOO2lb7fLzWtLBO1fu
	Np3wtbxWaxpikLUxIJokbSTeO9j/LkoBclLN2sJj917I8oBiNEwcabHZwdxCVpcjh2S425+1c3x
	UVdqNRmB1krJcLWzCRbl6ORrlATiOxa/BS5n0smr5F1ydVRng9lhhXxkHQzx7Id0WrnkUDm7tHT
	z/wnWcUaYaGSmqQBIUZEGU8DVneJIHSP49mlE/dvnEUJeTyWGMsKPTrmwxD8VpEFgtR8c0IXU/T
	a77py1WAZ4W990CKb06+JEUbzK7CmtObzglB7777ufx8BCz12ngcJEyIxjH4wQehEZxbf6w0V9e
	Xqpw==
X-Google-Smtp-Source: AGHT+IH61R8D2jHhsglCOU8QAPHAO5jpQ7rR6j8uwaUOp/yV6DrlRdqQrnlWcLhIGfK7gMZVpwNXxA==
X-Received: by 2002:a17:907:c0e:b0:acb:ac30:61f2 with SMTP id a640c23a62f3a-ace73a45d9emr606873666b.18.1745695841967;
        Sat, 26 Apr 2025 12:30:41 -0700 (PDT)
Received: from chimera.arnhem.chello.nl (2001-1c08-0706-8b00-3c37-b7fb-5879-3e83.cable.dynamic.v6.ziggo.nl. [2001:1c08:706:8b00:3c37:b7fb:5879:3e83])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f7011fbfbdsm3061867a12.12.2025.04.26.12.30.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Apr 2025 12:30:41 -0700 (PDT)
From: Thomas Andreatta <thomasandreatta2000@gmail.com>
X-Google-Original-From: Thomas Andreatta <thomas.andreatta2000@gmail.com>
To: andy@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Thomas Andreatta <thomas.andreatta2000@gmail.com>
Subject: [PATCH] staging: media: atomisp: fixed spaces to tabs
Date: Sat, 26 Apr 2025 21:30:33 +0200
Message-Id: <20250426193033.483124-1-thomas.andreatta2000@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Removed spaces and substituted them with tabs.

Signed-off-by: Thomas Andreatta <thomas.andreatta2000@gmail.com>
---
 drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
index e176483df301..0d5e35845ed7 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
@@ -518,7 +518,7 @@ static int gmin_subdev_add(struct gmin_subdev *gs)
 
 	/*WA:CHT requires XTAL clock as PLL is not stable.*/
 	gs->clock_src = gmin_get_var_int(dev, false, "ClkSrc",
-				         VLV2_CLK_PLL_19P2MHZ);
+						VLV2_CLK_PLL_19P2MHZ);
 
 	/*
 	 * Get ACPI _PR0 derived clock here already because it is used
-- 
2.34.1


