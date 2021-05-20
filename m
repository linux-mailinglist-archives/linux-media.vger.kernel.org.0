Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 000BA38B3B9
	for <lists+linux-media@lfdr.de>; Thu, 20 May 2021 17:51:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232163AbhETPwh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 May 2021 11:52:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231264AbhETPwg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 May 2021 11:52:36 -0400
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 051B1C061574;
        Thu, 20 May 2021 08:51:15 -0700 (PDT)
Received: by mail-pl1-x62c.google.com with SMTP id t9so867916ply.6;
        Thu, 20 May 2021 08:51:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KW9angPw3uBUocOgesJzJUAk5OzLa/Lg9bikp5kRKbI=;
        b=FMbOqziRLgDKIZoWVAdq8CFZExQjsUcNnzkU5XVLJrZgi4uqiPGSGOLrfd8gxVRxIq
         a9PRb8Ser/wJRuid5nhVLdrRQa7OpTvgP6evYiZH+aMKFVkTIlET5hKudlwh/Ve+QQ1K
         WtteAcDqv6cTEjySsyVmOAS4CNILvov/RMbODt11213ToyFVMBbFTMpEuRDqHQStzi1p
         A1lkt7pOCBFQfjvPovSIA1N7e7MjiycBBdQ29ApmUdc7oOdRr1VMFDCyYLch073JG8ia
         nVaPLr2cuCsutc8xEQZFwJG7nPC/k23LqEdm69KaMWmav7i6C9Cux5JPVRZ6mu0sY+m9
         tA4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KW9angPw3uBUocOgesJzJUAk5OzLa/Lg9bikp5kRKbI=;
        b=iBt1nZhPDArWLIbmyy6Ed1MM2cXE8I2rGCU/+l3o35UOim4WXyGYocZ2sdjMHLwBIQ
         6Ilp0CkoN318BS1Wq6Y+gCyOHwep+0rF2Wg3xolrJFRhxBjJQYCCZ7nfx7mdDVspNQuG
         MY8iwyoTW7N+pqBJrpdMbcznIv1s7L3mr9zUWtfGXSTovUHrfyjSnEJVflSbA6qSxEPp
         RDe7zQKkSUjN1FafO+LXT3QVkKEwmP14kApsBPFbwPgFf9fUf5ZGq1Jy3mh5rW0/FkJI
         k6RSZn/rOrE9Y1VgHLOMpZV/qE6T9DLvNrrPoAzlIjR995mMlj4dNS75t+gzfd8tdrF7
         9rXQ==
X-Gm-Message-State: AOAM5338rG57hGMEBLHjcsUabVJT94ku3f7nYULMmdyvd8LyPXOphCBh
        hydLp0TxRnl8/eAD8i6Vjr4=
X-Google-Smtp-Source: ABdhPJzBzF8qJsOJYgA1P8WydvG77IGPxwaK/mnu+iKrKmuJISR7ik1B3/24JEWJNshZ5QPZPVIuNA==
X-Received: by 2002:a17:90b:703:: with SMTP id s3mr5660936pjz.69.1621525874481;
        Thu, 20 May 2021 08:51:14 -0700 (PDT)
Received: from andromeda.localdomain ([103.192.117.174])
        by smtp.gmail.com with ESMTPSA id v8sm2279270pff.220.2021.05.20.08.51.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 May 2021 08:51:14 -0700 (PDT)
From:   Aniket Bhattacharyea <aniketmail669@gmail.com>
To:     mchehab@kernel.org, sakari.ailus@linux.intel.com,
        gregkh@linuxfoundation.org, andriy.shevchenko@linux.intel.com
Cc:     linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org,
        Aniket Bhattacharyea <aniketmail669@gmail.com>
Subject: [PATCH] media: atomisp: Replace whitespace at the beginning of line
Date:   Thu, 20 May 2021 21:20:13 +0530
Message-Id: <20210520155013.929465-1-aniketmail669@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patch replaces the whitespaces at the beginning of line with tabs.
Identified by checkpatch: WARNING: please, no spaces at the start of a line.

Signed-off-by: Aniket Bhattacharyea <aniketmail669@gmail.com>
---
 drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
index 135994d44802..93ac7e183344 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
@@ -1041,9 +1041,9 @@ static struct camera_sensor_platform_data acpi_gmin_plat = {
 };
 
 struct camera_sensor_platform_data *gmin_camera_platform_data(
-    struct v4l2_subdev *subdev,
-    enum atomisp_input_format csi_format,
-    enum atomisp_bayer_order csi_bayer)
+	struct v4l2_subdev *subdev,
+	enum atomisp_input_format csi_format,
+	enum atomisp_bayer_order csi_bayer)
 {
 	u8 pmic_i2c_addr = gmin_detect_pmic(subdev);
 	struct gmin_subdev *gs;
-- 
2.31.1

