Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5FAC72BEC8
	for <lists+linux-media@lfdr.de>; Tue, 28 May 2019 07:57:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727547AbfE1F5X (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 May 2019 01:57:23 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:37613 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727536AbfE1F5X (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 May 2019 01:57:23 -0400
Received: by mail-pf1-f196.google.com with SMTP id a23so10788420pff.4
        for <linux-media@vger.kernel.org>; Mon, 27 May 2019 22:57:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=dct7sUqIN4yTDR2HFtwSyXfQaPLYionNUf3R7g65wJc=;
        b=hwSZWxSlG9xeAnA9TUeD7ON0voDdUj314TGa+yz9do/gM6mzbANrtu0Ks/sFbwBm63
         rKJQTeV99HciujXRGhmL2Z91P9RLUC5gzPp/HTBeW0iwdSsZZPNvjc3r7EbGBrX8f2mR
         1QJ1d3JZUAftEP/UEB13JiDPfSCNfe/IM6iME=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dct7sUqIN4yTDR2HFtwSyXfQaPLYionNUf3R7g65wJc=;
        b=HmlScECwkn+EqkhtpVpfH3MZuOyJk8jch1UoDlH2RVs1oQ7kVJO86/ORyCjHTssobW
         wgjWKxKhhB/xiYeslHg5qtPak6oPJ2RmSVUJhlWiiDy1uOJnZEH27OVy3pGacHJJHs0z
         qmwMLbtkCVUOSB+zRRAIVDZUtF/38LGcme0AioR6oHpt1VOBsY0K8ItzfQ7SHitthL/5
         8MTJZXM0VcqJMohagGqbODrskBA/AIyhXsv4xaALesWMh/aXHLhVsgEGc3lCU+RSlx75
         8+Ym2BQ69i5sZ+ejDsRjdj04tkUBCAcJ8X8ncVgzEJBQKOtC7/tKB4zh3SKDwV2wc46d
         e6wA==
X-Gm-Message-State: APjAAAWZs96JTWmHFlSUjhDWYMafMIOzmuwU2APWL0lfaHwo+dvGti+d
        6NyTvPvmnlDVFsCuZTCJBBYGY1/DN1w=
X-Google-Smtp-Source: APXvYqwgF6QrvKVy4NuktZ4Afik+l8WeNLrMISF78vUJAwwwPB3Dap6m/TxwNSRrS/H7YEFHvMRX2A==
X-Received: by 2002:a17:90a:1aa8:: with SMTP id p37mr3381669pjp.17.1559023042073;
        Mon, 27 May 2019 22:57:22 -0700 (PDT)
Received: from acourbot.tok.corp.google.com ([2401:fa00:4:4:9712:8cf1:d0f:7d33])
        by smtp.gmail.com with ESMTPSA id w1sm13950551pfg.51.2019.05.27.22.57.19
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 27 May 2019 22:57:21 -0700 (PDT)
From:   Alexandre Courbot <acourbot@chromium.org>
To:     Yunfei Dong <yunfei.dong@mediatek.com>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Alexandre Courbot <acourbot@chromium.org>
Subject: [RFCv1 04/12] media: mtk-vcodec: fix copyright indent
Date:   Tue, 28 May 2019 14:56:27 +0900
Message-Id: <20190528055635.12109-5-acourbot@chromium.org>
X-Mailer: git-send-email 2.22.0.rc1.257.g3120a18244-goog
In-Reply-To: <20190528055635.12109-1-acourbot@chromium.org>
References: <20190528055635.12109-1-acourbot@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Yunfei Dong <yunfei.dong@mediatek.com>

Minor identation fix for copyright notice in a few source files.

Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
[acourbot: refactor, cleanup and split]
Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
---
 .../platform/mtk-vcodec/mtk_vcodec_drv.h      | 26 +++++++++----------
 .../platform/mtk-vcodec/mtk_vcodec_enc.c      | 26 +++++++++----------
 .../platform/mtk-vcodec/mtk_vcodec_enc_pm.c   | 24 ++++++++---------
 3 files changed, 38 insertions(+), 38 deletions(-)

diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
index 109c7578a8b2..76905e2d56a7 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
@@ -1,17 +1,17 @@
 /*
-* Copyright (c) 2016 MediaTek Inc.
-* Author: PC Chen <pc.chen@mediatek.com>
-*         Tiffany Lin <tiffany.lin@mediatek.com>
-*
-* This program is free software; you can redistribute it and/or modify
-* it under the terms of the GNU General Public License version 2 as
-* published by the Free Software Foundation.
-*
-* This program is distributed in the hope that it will be useful,
-* but WITHOUT ANY WARRANTY; without even the implied warranty of
-* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-* GNU General Public License for more details.
-*/
+ * Copyright (c) 2016 MediaTek Inc.
+ * Author: PC Chen <pc.chen@mediatek.com>
+ *         Tiffany Lin <tiffany.lin@mediatek.com>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ */
 
 #ifndef _MTK_VCODEC_DRV_H_
 #define _MTK_VCODEC_DRV_H_
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
index 2d5a61c06287..32d8ce9c8f6e 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
@@ -1,17 +1,17 @@
 /*
-* Copyright (c) 2016 MediaTek Inc.
-* Author: PC Chen <pc.chen@mediatek.com>
-*         Tiffany Lin <tiffany.lin@mediatek.com>
-*
-* This program is free software; you can redistribute it and/or modify
-* it under the terms of the GNU General Public License version 2 as
-* published by the Free Software Foundation.
-*
-* This program is distributed in the hope that it will be useful,
-* but WITHOUT ANY WARRANTY; without even the implied warranty of
-* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-* GNU General Public License for more details.
-*/
+ * Copyright (c) 2016 MediaTek Inc.
+ * Author: PC Chen <pc.chen@mediatek.com>
+ *         Tiffany Lin <tiffany.lin@mediatek.com>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ */
 
 #include <media/v4l2-event.h>
 #include <media/v4l2-mem2mem.h>
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_pm.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_pm.c
index 39375b8ea27c..2fdae50173be 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_pm.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_pm.c
@@ -1,16 +1,16 @@
 /*
-* Copyright (c) 2016 MediaTek Inc.
-* Author: Tiffany Lin <tiffany.lin@mediatek.com>
-*
-* This program is free software; you can redistribute it and/or modify
-* it under the terms of the GNU General Public License version 2 as
-* published by the Free Software Foundation.
-*
-* This program is distributed in the hope that it will be useful,
-* but WITHOUT ANY WARRANTY; without even the implied warranty of
-* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-* GNU General Public License for more details.
-*/
+ * Copyright (c) 2016 MediaTek Inc.
+ * Author: Tiffany Lin <tiffany.lin@mediatek.com>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ */
 
 #include <linux/clk.h>
 #include <linux/of_address.h>
-- 
2.22.0.rc1.257.g3120a18244-goog

