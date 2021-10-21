Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9359D436CE7
	for <lists+linux-media@lfdr.de>; Thu, 21 Oct 2021 23:44:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232142AbhJUVqQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 21 Oct 2021 17:46:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231446AbhJUVqP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 21 Oct 2021 17:46:15 -0400
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5B4FC061348
        for <linux-media@vger.kernel.org>; Thu, 21 Oct 2021 14:43:58 -0700 (PDT)
Received: by mail-wr1-x435.google.com with SMTP id o20so1637419wro.3
        for <linux-media@vger.kernel.org>; Thu, 21 Oct 2021 14:43:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rVsX/c7kjoIBrsa1pB/uPlnMXLUXd3Lv33bxgw1Tcn8=;
        b=X2hgBu6EmOq+5+GbdwchkLW3jUqmjbZnpd4As3IHlUmmXtbkr1cMIQ8Hr2WyFcb0Wg
         si6N7tos0Buplu1KQu7bapZJRH7/MzZCCgMOVa1sIfST4BALanCJkW7xXxT14WYYYRij
         y6zqEhwV8SiZ/DApAmNIemT5CtSp4Q/DPbDfIc5y+ht6Ce2gjjGKSG4HDETIhR/hNy+K
         UPWemCJ/IhsoldswDq6fC/+vPNiNI6OYj4dh0b5q3WEEKFfksfZAF00/B35ij90X7zCI
         zlNEj7yQQMRUKUQqGDcfCXYntFsLjLAujxD9hJB8/3VlAcCl7+pxtiGnw1m67yVNz3JB
         r+yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rVsX/c7kjoIBrsa1pB/uPlnMXLUXd3Lv33bxgw1Tcn8=;
        b=nF5jr18gD8OxSN6dlTUR4YrWr+zGUajBunGprz1ufwtLYEdcfMTQ4Whf3NS/ijRtkr
         4dzm+T1nQzHIHCKhOS3MIzhUb9VPrxbizM4ECcVSQfsXZ6nhN4bb4w4e6C0ou+XmLJ/u
         h+FzbPwl1usi3AlScAA3oP2EHTXY/64wV8ynK5fiVlWa+WryqdO4c1py/HWXEL8rbskh
         gPdBv2HN7E7+mZtVTsQBAwmK30X8Jyo90n86xFgq6Oq5qL82obb5HkqzhbtlhOir2LCN
         sN9fgTD0wTll+fYH6bf6HolsZIpIeKDqiWcF3thKO7bprCPHIGTovIGaVuESF1HEkoz5
         Z7ng==
X-Gm-Message-State: AOAM531Mbj2a6TtXlzCLkQtaZZUoF6e9gKQhOAAmISFk65gaUsjmni2b
        gpRdlOO1/w77IZ6pU1kkecyFSFcdv+w=
X-Google-Smtp-Source: ABdhPJyy+9WS5jRdEoUAk2HOa1k4XwMomH9IGFzxaGtgd+srl+JmvN3d+gUcRRleiD36inHkj2v2CQ==
X-Received: by 2002:a05:6000:2a1:: with SMTP id l1mr10753108wry.87.1634852637551;
        Thu, 21 Oct 2021 14:43:57 -0700 (PDT)
Received: from localhost.localdomain (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net. [86.13.91.161])
        by smtp.gmail.com with ESMTPSA id r205sm6378507wma.3.2021.10.21.14.43.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Oct 2021 14:43:57 -0700 (PDT)
From:   Daniel Scally <djrscally@gmail.com>
To:     linux-media@vger.kernel.org, paul.kocialkowski@bootlin.com
Cc:     Yong Zhi <yong.zhi@intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Dan Scally <djrscally@gmail.com>,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        hdegoede@redhat.com, laurent.pinchart@ideasonboard.com,
        kieran.bingham@ideasonboard.com
Subject: [PATCH v3 02/16] media: i2c: Fix incorrect value in comment
Date:   Thu, 21 Oct 2021 22:43:17 +0100
Message-Id: <20211021214331.1188787-3-djrscally@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211021214331.1188787-1-djrscally@gmail.com>
References: <20211021214331.1188787-1-djrscally@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The PLL configuration defined here sets 72MHz (which is correct), not
80MHz. Correct the comment.

Reviewed-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Signed-off-by: Daniel Scally <djrscally@gmail.com>
---
Changes in v3:

	- None

 drivers/media/i2c/ov8865.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ov8865.c b/drivers/media/i2c/ov8865.c
index 4c3039be9fe3..7513b54a2aa8 100644
--- a/drivers/media/i2c/ov8865.c
+++ b/drivers/media/i2c/ov8865.c
@@ -713,7 +713,7 @@ static const struct ov8865_pll2_config ov8865_pll2_config_native = {
 /*
  * EXTCLK = 24 MHz
  * DAC_CLK = 360 MHz
- * SCLK = 80 MHz
+ * SCLK = 72 MHz
  */
 
 static const struct ov8865_pll2_config ov8865_pll2_config_binning = {
-- 
2.25.1

