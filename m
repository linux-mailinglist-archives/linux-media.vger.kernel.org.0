Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 16C5C2A9F28
	for <lists+linux-media@lfdr.de>; Fri,  6 Nov 2020 22:37:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728493AbgKFVhM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 6 Nov 2020 16:37:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728463AbgKFVhL (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 6 Nov 2020 16:37:11 -0500
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7ED8C0613CF
        for <linux-media@vger.kernel.org>; Fri,  6 Nov 2020 13:37:10 -0800 (PST)
Received: by mail-wm1-x343.google.com with SMTP id p19so1763126wmg.0
        for <linux-media@vger.kernel.org>; Fri, 06 Nov 2020 13:37:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LEqBSYfgnwhk/ZNzzzB95lzeseOVAaohNofEs1LOZBI=;
        b=IyOOm4YcLu9epqYYgxHeyW701rsjmtWIg0P/DKB/8Q6IPcQ/t6MO1R6yd0fJQntORL
         BDMp5hef0aEIh7KkNlZRjMDPR/LMbrm2WiyYP1Y64OpSOX8OfWqHC7XCKtwCXRJ59xd8
         3A/YJPWDUiuHL6MrobUBvhafqHh21djh09wT76h1G9LAgFrUGneAdBxgvV275Real/sp
         mYTid3SjqWCnTfW7H40GyyfREXgKr6MBwPcS3WQ92MKaFJdbDa3MX5MrKY+DIB9UvRI7
         VEftWw5YuIZMb3MYgoIr3osQRBXO+NcAHvQDY5J9mpspRUZuT7z7IlQNnxz+YJWxBKYm
         O0dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LEqBSYfgnwhk/ZNzzzB95lzeseOVAaohNofEs1LOZBI=;
        b=ocifKa+UHycTcex2+0m9uS5U0EEFY64BDMhjr8A1KjyOEfxQ4tC1xrEPlrJHWmL/DK
         DjM0clmUjPjq4Qv5J9Au346BadaM5UWv8SHYm0RKCBIdrLjcJ0llXkK1seW5azvgG+Xv
         NEwIcdHelTBC4CmmfOYBKeNtDfMY3OLLPJzmCV83XzMA1Azlxt8l0yF/HUlJRZDVNuYp
         JJd0YtzGoKsTkXggzfAVl0C/ZriqX0nu1asb2HIHhwzBiFHz8G7pgBiOC037REKF1r6w
         xYHVD4rLzemn9TPYUL1Szsq1bFw9gqpmuLPZ7A2l6pSQN42QaBguN5W747U6FWyr7WAh
         Vbfg==
X-Gm-Message-State: AOAM5326hlqFUWqQfex7bIpFCEfSP6YZu+o17kMHXyH3OPx5+Uf0GVpu
        v5IVA7SKKFgYCzCtXtQiyfV+Rw==
X-Google-Smtp-Source: ABdhPJyI/kQHXmPF4Z5CgPRI1VUuTI0/V4ur2ouYJtT6Jh5hdOLOZyTcKKjzaUGMQ1xe1j6Go+iccA==
X-Received: by 2002:a1c:7215:: with SMTP id n21mr1511403wmc.173.1604698629494;
        Fri, 06 Nov 2020 13:37:09 -0800 (PST)
Received: from dell.default ([91.110.221.236])
        by smtp.gmail.com with ESMTPSA id d16sm3984942wrw.17.2020.11.06.13.37.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2020 13:37:08 -0800 (PST)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org,
        Tudor Ambarus <tudor.ambarus@microchip.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        linux-mtd@lists.infradead.org, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
Subject: [PATCH v2 07/23] mtd: spi-nor: controllers: hisi-sfc: Demote non-conformant kernel-doc
Date:   Fri,  6 Nov 2020 21:36:39 +0000
Message-Id: <20201106213655.1838861-8-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201106213655.1838861-1-lee.jones@linaro.org>
References: <20201106213655.1838861-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fixes the following W=1 kernel build warning(s):

 drivers/mtd/spi-nor/controllers/hisi-sfc.c:328: warning: Function parameter or member 'np' not described in 'hisi_spi_nor_register'
 drivers/mtd/spi-nor/controllers/hisi-sfc.c:328: warning: Function parameter or member 'host' not described in 'hisi_spi_nor_register'

Cc: Tudor Ambarus <tudor.ambarus@microchip.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>
Cc: Vignesh Raghavendra <vigneshr@ti.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: linux-mtd@lists.infradead.org
Cc: linux-media@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: linaro-mm-sig@lists.linaro.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
Reviewed-by: Vignesh Raghavendra <vigneshr@ti.com>
---
 drivers/mtd/spi-nor/controllers/hisi-sfc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/controllers/hisi-sfc.c b/drivers/mtd/spi-nor/controllers/hisi-sfc.c
index 95c502173cbda..7c26f8f565cba 100644
--- a/drivers/mtd/spi-nor/controllers/hisi-sfc.c
+++ b/drivers/mtd/spi-nor/controllers/hisi-sfc.c
@@ -320,7 +320,7 @@ static const struct spi_nor_controller_ops hisi_controller_ops = {
 	.write = hisi_spi_nor_write,
 };
 
-/**
+/*
  * Get spi flash device information and register it as a mtd device.
  */
 static int hisi_spi_nor_register(struct device_node *np,
-- 
2.25.1

