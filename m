Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 57D4C3A06FF
	for <lists+linux-media@lfdr.de>; Wed,  9 Jun 2021 00:37:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235070AbhFHWjr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Jun 2021 18:39:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234228AbhFHWjp (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 8 Jun 2021 18:39:45 -0400
Received: from mail-qk1-x730.google.com (mail-qk1-x730.google.com [IPv6:2607:f8b0:4864:20::730])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38B9CC0617A6
        for <linux-media@vger.kernel.org>; Tue,  8 Jun 2021 15:37:51 -0700 (PDT)
Received: by mail-qk1-x730.google.com with SMTP id k4so21968640qkd.0
        for <linux-media@vger.kernel.org>; Tue, 08 Jun 2021 15:37:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=pBISRGXcYaTjdyy7zFRwXRZ/Xqtc0LVrOOtyDwss3eg=;
        b=02f0lZJ5PP3Eiylz/zR/mouRFgBT9n4kVgKwIm5HemxQLen0zBBwqlvzZ7tt3c6jdk
         44M3xC65Ss+GGObi0v41j7qIMTbZ4ofRsUSfE6ORIYiC9iSURdabjKZ1ZXSwWRnyw+UE
         JHdTPrpKfY2MjFPD0aAc3W4tv6gV6uX+WG0nImNQiX51ak7LRj2Dn9ljPVn31qZtacNw
         DButh6ySOFQlQ/OecgdHyt6HT9kZP+OM5ofR/oIGYd3pk4jCXo9+hSVdI/jX7UsGmPiP
         FSH4yLiy0wAAJD9Mj37rd2MUFFtyjJSMPMTf6vi4C237AcEHtXTfMeBX8cLEyy5kWG5U
         kFwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pBISRGXcYaTjdyy7zFRwXRZ/Xqtc0LVrOOtyDwss3eg=;
        b=hqKcq+AZegz/tphaEhii43odgrrPzfJnFtPUD08wvXyOomJcaYXfotceJILBS3T4A4
         UGV780PmVaksh6nHcLU3IeRdE/R6LuCx/8xYn28SZpGoyUQxJOnT4R8CpPZ3HULSkEQ5
         nKLepuY4KG9DN+M+0WKLfyiepFRcde//Xe1mquutdrHPVlOCFTCCpR7zDRLdP2Q/u/Ru
         uwnIygV3th3IMvN6De8BdqWXw++Soky0ACDjuv/G3rguGIj7ehV9JtjM425UKS/E6+7k
         Olxr1bF+Utz7/SkUvVMkIhwfo4YCttQOjmZaEpemWMeZzRZZClzCN+zGxp7faNYivopi
         sWlw==
X-Gm-Message-State: AOAM532WsIL0+pqe3586w6MFsfl2F4h/xDmaD7EbsPadXWjGmEFhPT04
        f2wPYsA99YSue50GBQ7alOMrmQ==
X-Google-Smtp-Source: ABdhPJzYn15uMI1dfCue0mox6oIAlMHImpKRCx4PXqnoGK4XIj1dR517BqHINIa26ujrL+u+9S1Fbw==
X-Received: by 2002:a37:b3c5:: with SMTP id c188mr24031804qkf.242.1623191870438;
        Tue, 08 Jun 2021 15:37:50 -0700 (PDT)
Received: from localhost.localdomain (modemcable068.184-131-66.mc.videotron.ca. [66.131.184.68])
        by smtp.gmail.com with ESMTPSA id m3sm2324266qkh.135.2021.06.08.15.37.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jun 2021 15:37:49 -0700 (PDT)
From:   Jonathan Marek <jonathan@marek.ca>
To:     linux-arm-msm@vger.kernel.org
Cc:     robert.foss@linaro.org, andrey.konovalov@linaro.org,
        Todor Tomov <todor.too@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org (open list:QUALCOMM CAMERA SUBSYSTEM DRIVER),
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 04/17] media: camss: csid-170: fix non-10bit formats
Date:   Tue,  8 Jun 2021 18:34:53 -0400
Message-Id: <20210608223513.23193-5-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20210608223513.23193-1-jonathan@marek.ca>
References: <20210608223513.23193-1-jonathan@marek.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Use the decode_format/data_type from the "format" struct instead of a
hardcoded 10-bit format.

Fixes: eebe6d00e9bf ("media: camss: Add support for CSID hardware version Titan 170")
Signed-off-by: Jonathan Marek <jonathan@marek.ca>
Reviewed-by: Robert Foss <robert.foss@linaro.org>
---
 drivers/media/platform/qcom/camss/camss-csid-170.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csid-170.c b/drivers/media/platform/qcom/camss/camss-csid-170.c
index ac22ff29d2a9f..aa65043c33037 100644
--- a/drivers/media/platform/qcom/camss/camss-csid-170.c
+++ b/drivers/media/platform/qcom/camss/camss-csid-170.c
@@ -366,7 +366,7 @@ static void csid_configure_stream(struct csid_device *csid, u8 enable)
 			val |= input_format->width & 0x1fff << TPG_DT_n_CFG_0_FRAME_WIDTH;
 			writel_relaxed(val, csid->base + CSID_TPG_DT_n_CFG_0(0));
 
-			val = DATA_TYPE_RAW_10BIT << TPG_DT_n_CFG_1_DATA_TYPE;
+			val = format->data_type << TPG_DT_n_CFG_1_DATA_TYPE;
 			writel_relaxed(val, csid->base + CSID_TPG_DT_n_CFG_1(0));
 
 			val = tg->mode << TPG_DT_n_CFG_2_PAYLOAD_MODE;
@@ -382,8 +382,9 @@ static void csid_configure_stream(struct csid_device *csid, u8 enable)
 		val = 1 << RDI_CFG0_BYTE_CNTR_EN;
 		val |= 1 << RDI_CFG0_FORMAT_MEASURE_EN;
 		val |= 1 << RDI_CFG0_TIMESTAMP_EN;
+		/* note: for non-RDI path, this should be format->decode_format */
 		val |= DECODE_FORMAT_PAYLOAD_ONLY << RDI_CFG0_DECODE_FORMAT;
-		val |= DATA_TYPE_RAW_10BIT << RDI_CFG0_DATA_TYPE;
+		val |= format->data_type << RDI_CFG0_DATA_TYPE;
 		val |= vc << RDI_CFG0_VIRTUAL_CHANNEL;
 		val |= dt_id << RDI_CFG0_DT_ID;
 		writel_relaxed(val, csid->base + CSID_RDI_CFG0(0));
-- 
2.26.1

