Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3AA2343316A
	for <lists+linux-media@lfdr.de>; Tue, 19 Oct 2021 10:44:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234866AbhJSIq0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 19 Oct 2021 04:46:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234867AbhJSIqS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 19 Oct 2021 04:46:18 -0400
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D4D4C061768;
        Tue, 19 Oct 2021 01:44:04 -0700 (PDT)
Received: by mail-pj1-x102b.google.com with SMTP id lk8-20020a17090b33c800b001a0a284fcc2so1462729pjb.2;
        Tue, 19 Oct 2021 01:44:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=Fpv8AcIulys1PXAdWath/FGKH2Raxc3fRVYv8xcpy/Y=;
        b=ZQyuDd1JPbt6Yem87TsLy2jaYyQcfhxQLoLZ3GRcSyAAfjuRfnE1vU4p0fNuBbhZr5
         KTuGHA3zN0B/zG798Fx3Sn5X2LvRBwBVWPTFXJdqIG5AVhT10CU0d0E1t9XflnPnmbk7
         dFK4owQ0ubhSm3fREJfMfW2TgFWKcm4E5oRsXFrYPKY0AwoqWOgnAusosp0wt+mR5Sb1
         AXTF55TiXmfVzuPxPLXcq9pAPUBFotptpcvKu9jX9KFPMuPHyL2ahguULvjEENZpqkSx
         bcey0AUXhU1bhwrU9tUOJ0fzrGyZAjvKoSQBAZZ9QrzRHWc4G9f+EDReyzsAdcUUt9qy
         GM0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=Fpv8AcIulys1PXAdWath/FGKH2Raxc3fRVYv8xcpy/Y=;
        b=mQhPwguFUY/yd6WFl2Dn5sK/3fkyscsmwu9Dy7HVcYLStfmI3X7oCmDcEVp3Vdyd/L
         tJl3TjhbNAQfZRCs9e5V7Z8o953SL7/cTOBYai7iy1YC5cnmtEDIdqOkjEFCciaz9BY9
         YlnWJdZl65EdR7cYARXa0MkS2J/Hn+2ebuQL4cngGhuOboCE12I+wA6Wzi8Gd9CTrDax
         t/53QQcwvelHccGwz/BQW5fFrXvrbpfGRknbSBBVQV/nn6ubbkyXktGrFEcDpL96ertf
         LSa2CHJnMwPejNLMe3g1mtvqiCHCaGaRmZf/WVCDem99lPEEsQPThKKy+N4hbxmcw2xe
         D9RQ==
X-Gm-Message-State: AOAM531lk5GyHegLee2O3LgFFkm9eyOa7OEjT8cG91KpiIr0koYCrX3E
        u6Z3tRU1gC+snEowDBqSz7Q=
X-Google-Smtp-Source: ABdhPJwjGCds8GUyFgYQKvpUI+Vs44NhfMvVq6jqaLXrSPXVrqRx350tjn7R7itLUjK2s5ZQ+KtYvQ==
X-Received: by 2002:a17:90a:7d0f:: with SMTP id g15mr4938039pjl.227.1634633043820;
        Tue, 19 Oct 2021 01:44:03 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([137.59.103.165])
        by smtp.gmail.com with ESMTPSA id c11sm1824716pji.38.2021.10.19.01.43.59
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 19 Oct 2021 01:44:03 -0700 (PDT)
From:   Dillon Min <dillon.minfei@gmail.com>
To:     mchehab@kernel.org, mchehab+huawei@kernel.org,
        hverkuil-cisco@xs4all.nl, ezequiel@collabora.com, gnurou@gmail.com,
        pihsun@chromium.org, mcoquelin.stm32@gmail.com,
        alexandre.torgue@foss.st.com, mturquette@baylibre.com,
        sboyd@kernel.org, robh+dt@kernel.org, gabriel.fernandez@st.com,
        gabriel.fernandez@foss.st.com
Cc:     patrice.chotard@foss.st.com, hugues.fruchet@foss.st.com,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v6 07/10] media: v4l2-ctrls: Add V4L2_CID_COLORFX_CBCR max setting
Date:   Tue, 19 Oct 2021 16:43:20 +0800
Message-Id: <1634633003-18132-8-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1634633003-18132-1-git-send-email-dillon.minfei@gmail.com>
References: <1634633003-18132-1-git-send-email-dillon.minfei@gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The max of V4L2_CID_COLORFX_CBCR is 0xffff, so add it to v4l2_ctrl_fill()
to sure not beyond that.

Signed-off-by: Dillon Min <dillon.minfei@gmail.com>
---
v6: no change.

 drivers/media/v4l2-core/v4l2-ctrls-defs.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
index ebe82b6ba6e6..0cb6c0f18b39 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
@@ -1400,6 +1400,12 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
 		/* Max is calculated as RGB888 that is 2^24 */
 		*max = 0xFFFFFF;
 		break;
+	case V4L2_CID_COLORFX_CBCR:
+		*type = V4L2_CTRL_TYPE_INTEGER;
+		*step = 1;
+		*min = 0;
+		*max = 0xffff;
+		break;
 	case V4L2_CID_FLASH_FAULT:
 	case V4L2_CID_JPEG_ACTIVE_MARKER:
 	case V4L2_CID_3A_LOCK:
-- 
2.7.4

