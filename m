Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 772EC38F254
	for <lists+linux-media@lfdr.de>; Mon, 24 May 2021 19:36:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233449AbhEXRh5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 24 May 2021 13:37:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233192AbhEXRh5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 24 May 2021 13:37:57 -0400
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62E52C061574;
        Mon, 24 May 2021 10:36:29 -0700 (PDT)
Received: by mail-pf1-x42b.google.com with SMTP id c17so21404100pfn.6;
        Mon, 24 May 2021 10:36:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=c2PFrLBKSjV93vDkDe3MMz5yssgQhCzdNdJZDXUr3dA=;
        b=cGMEWwLkB3WRMDS2Nzsf6ajs45C1vqzU7DT46SJlnXcR1I+Oox6+Pn+0xZjUjpkhlO
         +2LrnEDUzvPEPhZnxfiM+Jxt6qtrUWJ8TTu2jrBfNX9WYmRnBs0z8syt6+rs/ryck3xw
         t2UJpXhQbKhH8xhUabKDWLYNI5e38wixPH/DBQPvOE6B4oOuTLMgSrrC3c4+V7QHGtD3
         /nNO/leWN7AKJXFnX3lS5Ub+HAPnKCCZJh0KKsY0DYZijOdKhKASrJ4v1Ex1pm32X555
         5T1uCgZeX65fRYGYtP0ga7lQ1JajTFtTkOiETfMXfdVJBSQrjOlzJewHF37zY3+ngZ4L
         GZ4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=c2PFrLBKSjV93vDkDe3MMz5yssgQhCzdNdJZDXUr3dA=;
        b=fhCfhV2WiqPD/sQpRwd70TfdQsndUEgR9ua0XSZpKiD03kqD/kCWSR2arGvHtKIxu3
         Bf1zEf5a1FtQFOR7W7vIysMLiAxvOJGlfNX1BOSIxgpoqcRdx3RwJzphGSn+Fxm74kuL
         df5n/QlZ48AgDezj/4OQNUNOAESAIjC0Hk6TTPOYkDgE6VxkdrATsBjedD0kHZoxeFJW
         IgUfhPHYiflRqeKe5DTdecNxcn6EfpORa0no6Lhs53e9u+EmwzAQ3xRNWLzA2C9TwH8R
         GBQwySzP7aXpS5wdpSZFaO8Wq2GgEBnaIRsvOPf3gbwzCp2ZiWcPjA1sCaECgPi7Ucoa
         DJfw==
X-Gm-Message-State: AOAM532UoF1xeoOCmkR3FsfCnb6pH7JSSvJvIE0/BWnq/r83al1cjyKk
        +BSmZGDigNfv2r/FQhf/j7E=
X-Google-Smtp-Source: ABdhPJzkvPAxXh9nkkOdcUM/c8/yPtKtXC4SzqXpHCZzkTzyOMeTvqBJtO6sDuXM2+cngYM3hS/x0w==
X-Received: by 2002:aa7:8b56:0:b029:2b9:77be:d305 with SMTP id i22-20020aa78b560000b02902b977bed305mr26113787pfd.61.1621877788544;
        Mon, 24 May 2021 10:36:28 -0700 (PDT)
Received: from andromeda.localdomain ([223.223.153.90])
        by smtp.gmail.com with ESMTPSA id n23sm12128477pff.93.2021.05.24.10.36.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 May 2021 10:36:28 -0700 (PDT)
From:   Aniket Bhattacharyea <aniketmail669@gmail.com>
To:     mchehab@kernel.org, sakari.ailus@linux.intel.com,
        gregkh@linuxfoundation.org, andriy.shevchenko@linux.intel.com
Cc:     linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org,
        Aniket Bhattacharyea <aniketmail669@gmail.com>
Subject: [PATCH v2] media: atomisp: Fix whitespace at the beginning of line
Date:   Mon, 24 May 2021 23:06:09 +0530
Message-Id: <20210524173609.672153-1-aniketmail669@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patch fixes whitespace at the beginning of line by wrapping after
the type name and aligning the arguments with the open parenthesis.
Identified by checkpatch: WARNING: please, no spaces at the start of a 
line.

Signed-off-by: Aniket Bhattacharyea <aniketmail669@gmail.com>
---
Changes in v2:
  - Wrap after the type name instead of replacing whitespace with tabs

 drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
index 135994d44802..d8c9e31314b2 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
@@ -1040,10 +1040,10 @@ static struct camera_sensor_platform_data acpi_gmin_plat = {
 	.get_vcm_ctrl = gmin_get_vcm_ctrl,
 };
 
-struct camera_sensor_platform_data *gmin_camera_platform_data(
-    struct v4l2_subdev *subdev,
-    enum atomisp_input_format csi_format,
-    enum atomisp_bayer_order csi_bayer)
+struct camera_sensor_platform_data *
+gmin_camera_platform_data(struct v4l2_subdev *subdev,
+			  enum atomisp_input_format csi_format,
+			  enum atomisp_bayer_order csi_bayer)
 {
 	u8 pmic_i2c_addr = gmin_detect_pmic(subdev);
 	struct gmin_subdev *gs;
-- 
2.31.1

