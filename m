Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0029411FA57
	for <lists+linux-media@lfdr.de>; Sun, 15 Dec 2019 19:09:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726676AbfLOSJk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 15 Dec 2019 13:09:40 -0500
Received: from mail-lj1-f194.google.com ([209.85.208.194]:34560 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726267AbfLOSJb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 15 Dec 2019 13:09:31 -0500
Received: by mail-lj1-f194.google.com with SMTP id m6so4251861ljc.1;
        Sun, 15 Dec 2019 10:09:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=VmZvyuWnyMjyosw1/AewOLN2QYH7RAhMY4SlplBdnDg=;
        b=HFvqKztJi0rfRz/czGQzT3+JIaAebM6DOwS2JXt1X1H4Q2cn5kVkkMylVSd3gB2BUP
         nqFOSB/7qgNP5EDrQSb+Da99cxuh/WgBbgKPz9aF0d5RVQU3LrAQ9ZX5aZzkngxaR/g8
         MA1AlbC55gEFVk4zQye7K+QFCmT528fAsO3jDf1LxmSzQPys2NHsxt6f1J2sQEZSpv8A
         ypPgr6jYlFVPvnVorGLcln0EoOEUPGv60xRg+TidEwWyfGwdZW+MBwAQWJOqhjcdSsAq
         3lqlGy0JvZKqpchTurnZhYhXHzXOfEG6Yh1+9KGPLTb3NaGikdhefaaxFmv84X29Mffl
         ycXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VmZvyuWnyMjyosw1/AewOLN2QYH7RAhMY4SlplBdnDg=;
        b=NU5uYguz4uESeCjs2inXCf5/TXTrjXTBqc1hdy9521kEWf+ROVcsNitxtpPG79rMPE
         ViFE9zcUnhKqKRfQuU4nfBWO8ozKuiEtqOdyP4EVr6UrUD7g6Wp9h4GOdA84D7u/rQ66
         PTw5F+IzcgCxa2wJWnsyphRaU6uvSP1WLPjmreoRNJt9S1G8OhLreiVV6WZKwlxDaUq+
         9Xw7RALs77/zYl79/Nd5R0A40Xmg7dWUNCT5XC1MrTNWpBi1gLfLGxrI+9zkQ+3rKD83
         TjPqlLYiuwfZ2ct0Q5EAVluwSDZA5Bj98LJjGbY9kVohdRmV0t+sMQc2L74mWbl1yLKf
         fdAA==
X-Gm-Message-State: APjAAAVp2bKAXfUdjAUMnaacbyBp0G3DXU8ydLmcwGsDpBolEMSNaVPt
        LktWh4ocMK1ipdD3aO1yO/w=
X-Google-Smtp-Source: APXvYqysxGsK6/xpWY5BjP3RIq3vp7cdqPyr4DSYQnG/nA7yMy23kX+zxHuLmwh9De5Qpjc4z7HDHQ==
X-Received: by 2002:a2e:3e08:: with SMTP id l8mr17187483lja.236.1576433369351;
        Sun, 15 Dec 2019 10:09:29 -0800 (PST)
Received: from localhost.localdomain (79-139-233-37.dynamic.spd-mgts.ru. [79.139.233.37])
        by smtp.gmail.com with ESMTPSA id t27sm8871875ljd.26.2019.12.15.10.09.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Dec 2019 10:09:28 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>
Cc:     linux-media@vger.kernel.org, linux-tegra@vger.kernel.org,
        devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/3] media: staging: tegra-vde: Sort headers alphabetically
Date:   Sun, 15 Dec 2019 21:07:51 +0300
Message-Id: <20191215180752.5408-3-digetx@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191215180752.5408-1-digetx@gmail.com>
References: <20191215180752.5408-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Keep the alphabetical order for consistency.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/staging/media/tegra-vde/vde.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/tegra-vde/vde.h b/drivers/staging/media/tegra-vde/vde.h
index d369f1466bc7..5561291b0c88 100644
--- a/drivers/staging/media/tegra-vde/vde.h
+++ b/drivers/staging/media/tegra-vde/vde.h
@@ -10,11 +10,11 @@
 
 #include <linux/completion.h>
 #include <linux/dma-direction.h>
+#include <linux/iova.h>
 #include <linux/list.h>
 #include <linux/miscdevice.h>
 #include <linux/mutex.h>
 #include <linux/types.h>
-#include <linux/iova.h>
 
 struct clk;
 struct dma_buf;
-- 
2.24.0

