Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 31D58125C47
	for <lists+linux-media@lfdr.de>; Thu, 19 Dec 2019 08:49:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726620AbfLSHtJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 Dec 2019 02:49:09 -0500
Received: from mail-pg1-f196.google.com ([209.85.215.196]:35247 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726340AbfLSHtJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 Dec 2019 02:49:09 -0500
Received: by mail-pg1-f196.google.com with SMTP id l24so2683875pgk.2;
        Wed, 18 Dec 2019 23:49:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Cc2K+67LYBIe1wlU0KMoxIXTHe2Mxn9atwFHlAASaBc=;
        b=qbhTXT5ET9SDOMyNwxgQEaMUl3s/f4tsQ+NbxGPJS+HZmopD2S4cgDzblFyx8tJ2cW
         iLKndu/LM9VnKzhMykp3S3o69j3vDmB8mtQ5C0si9Cl93EVTYaJkjXnAdFMudxRm3aVc
         1MN/FWBVuB3llwpRwyz19Z/58vQOb/Glo4ytvucJT4PwIa94quDAR+4uCoTC5VYLqgVF
         D8F4gJb3Nws9+js6vAJX+F3a2uZHkfW7gKOm05axmEBTbyfziT0RMiPLHIsDNj9hsiwt
         Pwk4w1vMFsQFZM9y4JwzZL4n/IRtFQXqj+l7Cy1PjMvql44T4K77bl4GFpxJgxyNSPpg
         5muQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Cc2K+67LYBIe1wlU0KMoxIXTHe2Mxn9atwFHlAASaBc=;
        b=MwfqnVf3PwGK0WywQlgcy5v0/H2Gu2C8jSMQ3EDeI5/DC5DOSxMJSQPQqc7W4agEGQ
         y19FQ6l2gl5+g/V+QF4pCW1EVZdQaoKqRghl6IdHNL5RpxcvllwDgIvXtwoNKXhFMnlu
         FQ/yBkoPBu519lTAZr1QedGMLua7H9iv34Wq/ZwUH5hnQSkF/veljtbqwfVbeindYAoW
         X2tH7B3ZdVswDhj/YMaSespOQ+FcVkTbmz0iAMno55tmOgVlRwnVjobD1foTpWCjShhS
         Yja1NdXJ7lo3/uMVVJbkv/Q0wf98lmN++6RKEK/UCOIX4/rnbLPHivKykl1GbjVmhof/
         gCiQ==
X-Gm-Message-State: APjAAAUKUOWYNwFG5ExuMdpoGIfnPEOQypHM5lXGvGZrK5ww4ZhlTF2c
        Oa25ffBXK7CAgV3iQLMwQkQ=
X-Google-Smtp-Source: APXvYqxfUSM2tNaFVpvSx3HyCJoLF4HSvr2nQoyjdT9+P32XOjCXQELLDSJlKCRe0qE9NMvVxTwlkQ==
X-Received: by 2002:aa7:8b55:: with SMTP id i21mr8258670pfd.249.1576741748987;
        Wed, 18 Dec 2019 23:49:08 -0800 (PST)
Received: from suzukaze.ipads-lab.se.sjtu.edu.cn ([202.120.40.82])
        by smtp.gmail.com with ESMTPSA id e7sm6661561pfe.168.2019.12.18.23.49.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2019 23:49:08 -0800 (PST)
From:   Chuhong Yuan <hslester96@gmail.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Chuhong Yuan <hslester96@gmail.com>
Subject: [PATCH] media: omap3isp: fix the incorrect check in omap3isp_csiphy_acquire
Date:   Thu, 19 Dec 2019 15:48:56 +0800
Message-Id: <20191219074856.15104-1-hslester96@gmail.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The check in omap3isp_csiphy_acquire() does not check for ERR_PTR.
Besides, sometimes vdd can be optional and therefore NULL.
Revise the check to fix this issue.

Fixes: 121e9f1c4c49 ("[media] omap3isp: CCP2/CSI2 receivers")
Signed-off-by: Chuhong Yuan <hslester96@gmail.com>
---
 drivers/media/platform/omap3isp/ispcsiphy.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/omap3isp/ispcsiphy.c b/drivers/media/platform/omap3isp/ispcsiphy.c
index 6dc7359c5131..4f46d99a4228 100644
--- a/drivers/media/platform/omap3isp/ispcsiphy.c
+++ b/drivers/media/platform/omap3isp/ispcsiphy.c
@@ -261,10 +261,10 @@ int omap3isp_csiphy_acquire(struct isp_csiphy *phy, struct media_entity *entity)
 {
 	int rval;
 
-	if (phy->vdd == NULL) {
+	if (IS_ERR(phy->vdd)) {
 		dev_err(phy->isp->dev,
 			"Power regulator for CSI PHY not available\n");
-		return -ENODEV;
+		return PTR_ERR(phy->vdd);
 	}
 
 	mutex_lock(&phy->mutex);
-- 
2.24.0

