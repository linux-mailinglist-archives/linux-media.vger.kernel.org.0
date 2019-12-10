Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 460AE11833B
	for <lists+linux-media@lfdr.de>; Tue, 10 Dec 2019 10:14:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727110AbfLJJOl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Dec 2019 04:14:41 -0500
Received: from mail-pj1-f66.google.com ([209.85.216.66]:37260 "EHLO
        mail-pj1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726911AbfLJJOl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Dec 2019 04:14:41 -0500
Received: by mail-pj1-f66.google.com with SMTP id ep17so7157892pjb.4;
        Tue, 10 Dec 2019 01:14:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7LJAEL/RYeb/hyqghWxhKEWAkwMEjLLMOZ9drwDPAyM=;
        b=OLe0T9xnTls3kCryailPhNJaENtGPGHxVRpt2r7ywfQ73fUODwfvOKvXGA6HRRh0Hl
         89joYDbR7ry9//bdD493PFueHBxAK65WnhzzgIc6S/P1Cvx2oNSSZFzMSJsBcWcY50sy
         n28aEmBn5zuRaOV1RnnGXFJSuNp32v0a25NcTY885gzTriUEEJR1Wr18eMGLdK3HsYzx
         fpEaS3w0eXHhrbMy0GTW9FAhGrdPYkPVywNIz7U4f1C8rea+R1PQbYbioBXSoA+t4nan
         Z5PcySh8ZIBuYjL16jD2wJVpyd30NC7CybbVyvojW5DB0EEh/l4cq005gskkNk+YwDwl
         lx7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7LJAEL/RYeb/hyqghWxhKEWAkwMEjLLMOZ9drwDPAyM=;
        b=UsSJprSDrpGBLiYFl6nYBDPFEq3Npp+rWzQ5sE87bjinwLl20O3MnP8WBzkUXUAusb
         ILTyc/qltJMAf524ogHG1sx2C7t7nK7va0e94XPOzu+6mAYepVRsmPz7i6eKu8ERPeq5
         Cf3e78eUpjYb+16iM7ETVdoFcKTxHnavjsRvEbYp/iPTtDWykwKrIqhTbJkhKBxOommO
         ba9rlYtfSLAlVDhyW9hiZTIIfrZCNwDZ97VkIUvqKd+puZOYe/25mPeWjdKjTRHUiDQ0
         dv6BAhqPQUzLsuJvPbmosWiyTNyYpHGtQgnvVucYVhVZOYwTk+w9KkBl+1Wkzlf28ZXZ
         SHSQ==
X-Gm-Message-State: APjAAAUGjT6G3OtX14z6TOSVHNMd6Gl6A9l16YVvTTZCAXWvNsgkkC0v
        30CXC555NgbDm1KdEE/1OD2oOBOn
X-Google-Smtp-Source: APXvYqy64m+fUsvCsYgVNQir1Pmsf7+rq5KT/DqucMSXZlRI/g4/twjg0Lx2crxKW6lozBJm+R7xjQ==
X-Received: by 2002:a17:90a:28a1:: with SMTP id f30mr4288985pjd.77.1575969280420;
        Tue, 10 Dec 2019 01:14:40 -0800 (PST)
Received: from suzukaze.ipads-lab.se.sjtu.edu.cn ([202.120.40.82])
        by smtp.gmail.com with ESMTPSA id bo9sm2150744pjb.21.2019.12.10.01.14.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2019 01:14:39 -0800 (PST)
From:   Chuhong Yuan <hslester96@gmail.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Chuhong Yuan <hslester96@gmail.com>
Subject: [PATCH] media: omap3isp: add checks for devm_regulator_get
Date:   Tue, 10 Dec 2019 17:14:28 +0800
Message-Id: <20191210091428.23448-1-hslester96@gmail.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The driver misses checks for devm_regulator_get().
Add checks to fix it.

Signed-off-by: Chuhong Yuan <hslester96@gmail.com>
---
 drivers/media/platform/omap3isp/isp.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/media/platform/omap3isp/isp.c b/drivers/media/platform/omap3isp/isp.c
index 327c5716922a..ef3502182c3a 100644
--- a/drivers/media/platform/omap3isp/isp.c
+++ b/drivers/media/platform/omap3isp/isp.c
@@ -2312,7 +2312,16 @@ static int isp_probe(struct platform_device *pdev)
 
 	/* Regulators */
 	isp->isp_csiphy1.vdd = devm_regulator_get(&pdev->dev, "vdd-csiphy1");
+	if (IS_ERR(isp->isp_csiphy1.vdd)) {
+		ret = PTR_ERR(isp->isp_csiphy1.vdd);
+		goto error;
+	}
+
 	isp->isp_csiphy2.vdd = devm_regulator_get(&pdev->dev, "vdd-csiphy2");
+	if (IS_ERR(isp->isp_csiphy2.vdd)) {
+		ret = PTR_ERR(isp->isp_csiphy2.vdd);
+		goto error;
+	}
 
 	/* Clocks
 	 *
-- 
2.24.0

