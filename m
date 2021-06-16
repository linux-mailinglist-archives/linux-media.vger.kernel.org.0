Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 298533A94BB
	for <lists+linux-media@lfdr.de>; Wed, 16 Jun 2021 10:06:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232049AbhFPIIh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Jun 2021 04:08:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231913AbhFPIIb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Jun 2021 04:08:31 -0400
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E13DC061574;
        Wed, 16 Jun 2021 01:06:25 -0700 (PDT)
Received: by mail-pf1-x430.google.com with SMTP id a127so1528881pfa.10;
        Wed, 16 Jun 2021 01:06:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YdAvqSN9IrBpwcAVh+YaiCOGf2leXfPRHSsFP/+CzLg=;
        b=O8OchRwXxf015VFZj2fAZ7u6kOSYiXsDrOnC0/3v7rxOFVEdrMuBjFE8/OrAs2gU1p
         tHY1kNHAWAbOIZNGy7AO082NOo/NlcZwPZQpIBGe6x9u+QIjzZSUc+Mibjw0maguKqHI
         V3fwVZBJbohaQA3ki9J//sK88fZvNuMMkfBHw6uYwAVV9BO/zmtzAKFRW/9C8aJ+h83h
         ZpFSi1KQDfz3KE2TQkIGPtXx2UxYaFN33pnxJyGlzTowasoc2v45JuY8of4E2WXu/cHW
         d27D0REy0KglHrdNcLlMsvDRWwSUoPok3a4qU/+7NODrO31H55O5tj0Jr2yp9UZFwhT1
         tr7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YdAvqSN9IrBpwcAVh+YaiCOGf2leXfPRHSsFP/+CzLg=;
        b=WsE17llnubuZeZFGEyZZHKdB9S3TwTzqzvK1SmOpK81NweEnEnd053Pk9oVbKCD5+5
         ZdFHQS61TMffk+btUnRd0xA3RcMX+sDWt90+NfnZ0VEC2Aos0V6T5z+bcbKoXeL8ztrq
         ojozKOdADcK2rEPLezVHCFagZrXODFCp2jrKrZTBYuzmBQuRzy60oWNDmP3dJmQrvwoh
         FQQJYGQPYxVauKfyyKuDCLQzxg5tR5PnQA6iRpwqHKX0iPakPlqfltwamJzUWeLtA3+y
         Jjesgl7aMLgvshmOEwefuiF/Z6s9CyKMttstzjzobpvpb6ryoHvi7JeP0xPROr8RpivA
         W6sg==
X-Gm-Message-State: AOAM533HDk59QWnqlNjFlZbtCereiE5NjKMuoNK9hR3D0fAS4SAcx304
        dLc4UrzTN8YcZqwJuGBD9Qg=
X-Google-Smtp-Source: ABdhPJyVsLKSyPIN4jBBWZJM//oSD8E7AVjybje35BbaD0pETS39QF/kWiPWlOs/V1/DV89eN51QFg==
X-Received: by 2002:a62:7848:0:b029:2f7:4ecc:f14 with SMTP id t69-20020a6278480000b02902f74ecc0f14mr8333315pfc.77.1623830784952;
        Wed, 16 Jun 2021 01:06:24 -0700 (PDT)
Received: from localhost.localdomain ([103.220.76.197])
        by smtp.gmail.com with ESMTPSA id v1sm1348717pjg.19.2021.06.16.01.06.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jun 2021 01:06:24 -0700 (PDT)
From:   Herman <herman.yim88@gmail.com>
X-Google-Original-From: Herman <yanshuaijun@yulong.com>
To:     mchehab@kernel.org
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Herman <yanshuaijun@yulong.com>
Subject: [PATCH] drivers/media/platform/marvell-ccic/mcam-core.c : fix typo 'gettig' > 'getting'
Date:   Wed, 16 Jun 2021 16:03:16 +0800
Message-Id: <20210616080316.4858-1-yanshuaijun@yulong.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Change 'gettig' into 'getting'.

Signed-off-by: Herman <yanshuaijun@yulong.com>
---
 drivers/media/platform/marvell-ccic/mcam-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/marvell-ccic/mcam-core.c b/drivers/media/platform/marvell-ccic/mcam-core.c
index 141bf5d97a04..fcff9d9d498d 100644
--- a/drivers/media/platform/marvell-ccic/mcam-core.c
+++ b/drivers/media/platform/marvell-ccic/mcam-core.c
@@ -692,7 +692,7 @@ static void mcam_dma_sg_done(struct mcam_camera *cam, int frame)
  * Scatter/gather mode requires stopping the controller between
  * frames so we can put in a new DMA descriptor array.  If no new
  * buffer exists at frame completion, the controller is left stopped;
- * this function is charged with gettig things going again.
+ * this function is charged with getting things going again.
  */
 static void mcam_sg_restart(struct mcam_camera *cam)
 {
-- 
2.25.1

