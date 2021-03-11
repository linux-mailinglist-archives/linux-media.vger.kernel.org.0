Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF85633782A
	for <lists+linux-media@lfdr.de>; Thu, 11 Mar 2021 16:42:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234223AbhCKPlY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Mar 2021 10:41:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234238AbhCKPlG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Mar 2021 10:41:06 -0500
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28C81C061574
        for <linux-media@vger.kernel.org>; Thu, 11 Mar 2021 07:41:06 -0800 (PST)
Received: by mail-wm1-x32f.google.com with SMTP id g25so1581062wmh.0
        for <linux-media@vger.kernel.org>; Thu, 11 Mar 2021 07:41:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kKmhv2Y0oUyyi/VXeYaxzp9JGOustNOwjC5/Ra6ht2Q=;
        b=qgnAy80K0P4ESBNv8l3gm6xQ52lXJ5JFgOP6sl9KO4Cuha2cLxIireMBCSbdQ7egGf
         mT5mSjE3JbBjRYkVyknxVYZgcm8N+UmsoYuLA+NrBD+LVItCeI1vcQ6HHG0Id6xke8XU
         bTacpY5cbA9wjhzMWmm0/dWCxeJMP6FSn85I3Bwh7TmVnJb90698r31mc31SsmIcbsW5
         MG6QJFPAD2ORQE4+hzQzEV81XkfOWsNjqtxlhNbAtANCPx8vYL8Yttn6jsBQ0Q9FY+Bf
         Kdv67OSQ7lr26cOgy8RhOtwtaSIYeHIvMhQ+wJI7Wm/Ilm/ZB+I+C3YiUKMTMwghOE3z
         RHzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kKmhv2Y0oUyyi/VXeYaxzp9JGOustNOwjC5/Ra6ht2Q=;
        b=B8xgM41V7e0nPckA23E4YFCCuzvlTn0YokkBMysGjxP7WWQ/V6CPOuVO2Bx5c6+oo9
         gOGj7LshMvN+VEhqkm2HI8YuhkYZ6z/WITCdFLbJy+DkOn+2vrNk6rJaDoqgwfIFTMaB
         KI3Z8sm1pVmKG2kkaJpbHh5kW7fW2mAaYe+/f1VtGLnKvPb+VmUfholyydwGl2oOyKQv
         rNER+Q2VnZcGICc74sMArcOcoAzrxzVostslMSjm5Z+nUgEXNOxGxDpdtiquFRb4Ituy
         387XMRsDkExWC32SnyQY4yKGhHpfmMSB0Sbg0tdXUH7Y3LJP1uXex51DVF61iBNjVfVR
         OvSw==
X-Gm-Message-State: AOAM533sFlQdhoKf7n0jqhVnySmNi3ISqu4yGsvv6iPcPci1ud6YwQZE
        ZJz/7cR3nG9meJ9nK8DgAuI=
X-Google-Smtp-Source: ABdhPJwgR89QBqoRghUCewrCWayclTBmXDuP7KmBhKWoB55wtpWDGR4+HiegDvgrfhvj7ywLxPIrEw==
X-Received: by 2002:a1c:498b:: with SMTP id w133mr9146215wma.134.1615477264937;
        Thu, 11 Mar 2021 07:41:04 -0800 (PST)
Received: from arch-x1c3.. ([2a00:5f00:102:0:b16d:9752:8f38:7d6b])
        by smtp.gmail.com with ESMTPSA id a17sm4008547wmj.9.2021.03.11.07.41.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Mar 2021 07:41:04 -0800 (PST)
From:   Emil Velikov <emil.l.velikov@gmail.com>
To:     Ezequiel Garcia <ezequiel@collabora.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        Nicolas Ferre <nicolas.ferre@microchip.com>
Cc:     emil.l.velikov@gmail.com
Subject: [PATCH v2 02/10] media: hantro: imx: reuse MB_DIM define
Date:   Thu, 11 Mar 2021 15:40:47 +0000
Message-Id: <20210311154055.3496076-3-emil.l.velikov@gmail.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210311154055.3496076-1-emil.l.velikov@gmail.com>
References: <20210311154055.3496076-1-emil.l.velikov@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Emil Velikov <emil.velikov@collabora.com>

Swap the hardcoded 16 with MB_DIM define.

Fixes: 8e4aaa687863 ("media: hantro: add initial i.MX8MQ support")
Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
Signed-off-by: Emil Velikov <emil.velikov@collabora.com>
---
 drivers/staging/media/hantro/imx8m_vpu_hw.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/hantro/imx8m_vpu_hw.c b/drivers/staging/media/hantro/imx8m_vpu_hw.c
index c222de075ef4..1f48c1956cd2 100644
--- a/drivers/staging/media/hantro/imx8m_vpu_hw.c
+++ b/drivers/staging/media/hantro/imx8m_vpu_hw.c
@@ -109,10 +109,10 @@ static const struct hantro_fmt imx8m_vpu_dec_fmts[] = {
 		.frmsize = {
 			.min_width = 48,
 			.max_width = 3840,
-			.step_width = 16,
+			.step_width = MB_DIM,
 			.min_height = 48,
 			.max_height = 2160,
-			.step_height = 16,
+			.step_height = MB_DIM,
 		},
 	},
 	{
-- 
2.30.1

