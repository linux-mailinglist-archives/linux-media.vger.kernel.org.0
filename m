Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5468951CC75
	for <lists+linux-media@lfdr.de>; Fri,  6 May 2022 01:05:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1386544AbiEEXH5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 May 2022 19:07:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1386537AbiEEXH4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 5 May 2022 19:07:56 -0400
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F297E5EDC4
        for <linux-media@vger.kernel.org>; Thu,  5 May 2022 16:04:14 -0700 (PDT)
Received: by mail-wr1-x432.google.com with SMTP id e2so7867106wrh.7
        for <linux-media@vger.kernel.org>; Thu, 05 May 2022 16:04:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1mOFZVAVxl7g10hAI7IzlpJUn6DPse6wOzh3kxxLU+Y=;
        b=nHSvwpz4zVnOxsKgT1TyjyCdXNT9+2+S6zof06xnlNeweAwBwN7x5cvLMcdAF3Q5rh
         AMWGpb0Gp2c/JAKO9GQQLNPrFdz54uE/g2GMB25hxBYx9IiXs4IQo4VmUqPI0xrXuOy/
         anxHE0qNXHF70Bk4R7C6Zxg9+Owo9unaqGUaNgDK8IUWfvtGgToydwOM+Weivc/P9EOc
         XwUAjSBGtVZ7ggL1kpJPMSWk7dBHhh6Z5XHfOnRoyw/oONuQCZTzUS5kKuwyuC1OkZP5
         NmtlXmTAVQ9bGHkUg6EVMrY8pTXqqoewP7tPamZ/iDund70DPTaqJL6wHPTjCX1t2quz
         1F/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1mOFZVAVxl7g10hAI7IzlpJUn6DPse6wOzh3kxxLU+Y=;
        b=HtIylMgXernGXWxpi6rXyo4sn+Z9PZUVFrPXPc2CsEtqLwsLwG6tx5504rLOsBnBd4
         PY8gsnULJt7Z8q8xNiu03ifL+zLVdZjQm6GaFg1Y0ZMvLluLPDW1O4eWjuxi/lfD06Yl
         8/zgp34KVlsnXzlrNydcc9bKcwQQawEN2ym7IOasG7N+NQ95hOieBAbPdw0h1R9/pyg+
         Y21vo9pCH+i7LGgRM2ONOCwI6d6sJKBjhepH40V3K5iqwRnNCdA0U13qOxdk3dOJoJRt
         I5FmPz+DOE6dPvXN7Mq3YP8o3jqdPr7wZMUC/7zFBgR2h3pL+nIZ9m6p3iXtVfBHWdUM
         P+fQ==
X-Gm-Message-State: AOAM532DTTZKrLuyRYskI9vrR1h9HEoD9S6RGDiwHeuHGEdHwcZgJ+9d
        ZxuXQXsrEFhf8FQHBBtWUajGtrjLOWI=
X-Google-Smtp-Source: ABdhPJzGHWGG1VQVCFU1ONbiNferA32w658N9GWR74DlDzAaGibmi8kXFRWHHHnX2axzPCOVeO9y7g==
X-Received: by 2002:a5d:564c:0:b0:20a:d53c:70e3 with SMTP id j12-20020a5d564c000000b0020ad53c70e3mr315177wrw.0.1651791853629;
        Thu, 05 May 2022 16:04:13 -0700 (PDT)
Received: from localhost.localdomain (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net. [86.13.91.161])
        by smtp.gmail.com with ESMTPSA id o20-20020a05600c339400b003942a244f33sm6782130wmp.12.2022.05.05.16.04.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 May 2022 16:04:13 -0700 (PDT)
From:   Daniel Scally <djrscally@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     yong.zhi@intel.com, sakari.ailus@linux.intel.com,
        bingbu.cao@intel.com, tian.shu.qiu@intel.com,
        andriy.shevchenko@linux.intel.com, hverkuil-cisco@xs4all.nl
Subject: [PATCH v4 02/15] media: ipu3-cio2: Add support for V4L2_PIX_FMT_IPU3_Y10
Date:   Fri,  6 May 2022 00:03:49 +0100
Message-Id: <20220505230402.449643-3-djrscally@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220505230402.449643-1-djrscally@gmail.com>
References: <20220505230402.449643-1-djrscally@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

We have platforms where a camera sensor transmits Y10 data to
the CIO2 device - add support for that (packed) format to the
ipu3-cio2 driver.

Signed-off-by: Daniel Scally <djrscally@gmail.com>
---
Changes in v4:
	- None

Changes in v3:

	- None

Changes in v2:

	- None

 drivers/media/pci/intel/ipu3/ipu3-cio2-main.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c b/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c
index 0e9b0503b62a..93cc0577b6db 100644
--- a/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c
+++ b/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c
@@ -65,6 +65,11 @@ static const struct ipu3_cio2_fmt formats[] = {
 		.fourcc		= V4L2_PIX_FMT_IPU3_SRGGB10,
 		.mipicode	= 0x2b,
 		.bpp		= 10,
+	}, {
+		.mbus_code	= MEDIA_BUS_FMT_Y10_1X10,
+		.fourcc		= V4L2_PIX_FMT_IPU3_Y10,
+		.mipicode	= 0x2b,
+		.bpp		= 10,
 	},
 };
 
-- 
2.25.1

