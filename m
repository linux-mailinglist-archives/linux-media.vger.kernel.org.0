Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C08D51CCBE3
	for <lists+linux-media@lfdr.de>; Sun, 10 May 2020 17:14:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729278AbgEJPOl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 10 May 2020 11:14:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728762AbgEJPOj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 10 May 2020 11:14:39 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09AEDC061A0C;
        Sun, 10 May 2020 08:14:39 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id k12so15149000wmj.3;
        Sun, 10 May 2020 08:14:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fSiqQx+dS2DH5/7Z+5RFak3EL/tL8gjUAScqxR3I9Ig=;
        b=htfSLEntu2cDoFyzW55Ez0akzIiqQIzbD2U7kHnKZfCPf7WvvKVgQEUi4RXmxWwMVS
         anL1gttCCVxdug4AmNGXtoKrn4RJ4AI+q3rPqBDfbJ6DpstEMO9gMM7F0A0Q/gwslTKZ
         wQaBfcMUVDll3+U+BMzFBzWjhWLAuNYj7tARyYjsbXQ18T8EhEAzfqPRtD8oJsfZAnm6
         ayU8YEJW2mqP/bxxYE8i7Hyu9DHYCMupQR80qNBX+EnITViBi/zPKOhP9pVuN60a42si
         o/0SceoyqzWQjnw6ms4ublu+rnT9pUM+BYccT9dIGZXneql7xX/jt50kzWDxTbbyRGsl
         mL1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fSiqQx+dS2DH5/7Z+5RFak3EL/tL8gjUAScqxR3I9Ig=;
        b=s3QvPwSmiWIfLGl6f2hrgaPRXY7ZPKFDwwrOp1S2tCgChT0azprMiO+e+BADVIgLpq
         mR5yN88fMZPmheoHg1IsWMZlsNc0C1JbmqhF78B+p71j3CXSgazEZU0zcJttEGcgR5gC
         jHIxVZiRW911ehbB1WFNhCcVmfYiNybQm8bTS4c2rRh6XtIhUaVBgIEqChvRwN88jAcN
         uogA1h7RYiOvefoIW6IUT9vqCtitE3USMaBqCnngUTfmYtFh1U+VFMsbYxHXu3i1/peV
         B7YE5JnORmb2wrg556GWO5yQqURWv+bhRzSSKirgMOlS4v0tC8CDK1OxAZbwKFwjtD8C
         /D+w==
X-Gm-Message-State: AGi0Puax5R8RL5pYHShaoEPgso4n0n6b0160hXDrukOOjGtTemVFoj2c
        UeT8od65HoGt9FWIufeoX+U=
X-Google-Smtp-Source: APiQypKHq0xF/2rO0nARKm3P7lZbXZ8UfDRsiNC37FYfZqeIwfU1JvtB5rfs0No52N+UvpDLi5tM/w==
X-Received: by 2002:a05:600c:2299:: with SMTP id 25mr5662257wmf.138.1589123677516;
        Sun, 10 May 2020 08:14:37 -0700 (PDT)
Received: from skynet.lan (198.red-83-49-57.dynamicip.rima-tde.net. [83.49.57.198])
        by smtp.gmail.com with ESMTPSA id d133sm25176897wmc.27.2020.05.10.08.14.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2020 08:14:37 -0700 (PDT)
From:   =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
To:     computersforpeace@gmail.com, kdasu.kdev@gmail.com,
        miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
        sumit.semwal@linaro.org, linux-mtd@lists.infradead.org,
        bcm-kernel-feedback-list@broadcom.com,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
Cc:     =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
Subject: [PATCH 2/3] nand: brcmnand: fix CS0 layout
Date:   Sun, 10 May 2020 17:14:05 +0200
Message-Id: <20200510151406.2527856-2-noltari@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200510151406.2527856-1-noltari@gmail.com>
References: <20200510151406.2527856-1-noltari@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Only v3.3-v5.0 have a different CS0 layout.
v3.3- controllers use the same layout for every CS.

Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
---
 drivers/mtd/nand/raw/brcmnand/brcmnand.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/brcmnand/brcmnand.c b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
index 6a08dd07b058..72b268d8e3a4 100644
--- a/drivers/mtd/nand/raw/brcmnand/brcmnand.c
+++ b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
@@ -606,8 +606,9 @@ static int brcmnand_revision_init(struct brcmnand_controller *ctrl)
 	} else {
 		ctrl->cs_offsets = brcmnand_cs_offsets;
 
-		/* v5.0 and earlier has a different CS0 offset layout */
-		if (ctrl->nand_version <= 0x0500)
+		/* v3.3-5.0 have a different CS0 offset layout */
+		if (ctrl->nand_version >= 0x0303 &&
+		    ctrl->nand_version <= 0x0500)
 			ctrl->cs0_offsets = brcmnand_cs_offsets_cs0;
 	}
 
-- 
2.26.2

