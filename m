Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D72933DA89
	for <lists+linux-media@lfdr.de>; Tue, 16 Mar 2021 18:21:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238777AbhCPRUe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 Mar 2021 13:20:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238782AbhCPRUJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 Mar 2021 13:20:09 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89FDCC0613D7
        for <linux-media@vger.kernel.org>; Tue, 16 Mar 2021 10:20:08 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id ci14so73317183ejc.7
        for <linux-media@vger.kernel.org>; Tue, 16 Mar 2021 10:20:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=b2Yxcn9pIayZrG5IbORXfcFifUWLDIXNoqZkK9xbrmo=;
        b=Rkm6MKZcVytPjrLJ6z6n4fqg1Je9JRLtajs8uQHdKyurfUT+udf94hdM/AeP+4J2tC
         BeXQSmg2kh7fDTBp5BkopuDNPLtUiMxk8/yeC2gaBWHZjQx09n2Nv1elTjTZitE7siUx
         Oh3GgbGc74MeGZYh90IsmSlQwyMLm+chfzyRvdF5ZBFY6O0yy5zcbYFySCxfPbFiOWrx
         XRBVIcd83ykdpKEOa427BKcr5Zyfyhk8CUAatjbF5f+xr9p7F+CJwBkyux8wKFBfoHmP
         zIBHjE/h5oxUv/ggUFvBKI1bcXlghssP8YajK3VrBHGR61Ndhbg2Rb7rKZFF940ye7vs
         K60w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=b2Yxcn9pIayZrG5IbORXfcFifUWLDIXNoqZkK9xbrmo=;
        b=N88EJ5FgzbNdTRGw1WNRCC8CUf6szDnhSJtsomgNxCIcJTNgQ91i4OzMmAwbUTuwwl
         m9SAYiortTyfKQ73fPsFaIO0x7NdpiVDhJpyRUfvgIqeB7uSK1O7ADlGW2dvA/Zt2yjV
         FO/ysWmGDZ1ScpEYP7dVTUal6os1TkPICHM6G8fogPzZ7lD28tWryILVoMEViExmyBYJ
         VOBdCsT6hcx3jC88UJkfgaiwF3LQHz5GxgwCn8hXnzRwB++z3Uob9Sq4Q6LRMneIGaFQ
         MW5rk0um3ITTYaNkz55vbnjSP6g4XbDGIghqqrfYuuLuqO2ZPr8l6/LMn7rWe7X3uQ92
         GQSA==
X-Gm-Message-State: AOAM530ioh2mfwS7adsIUswfDhlmoqVS0rnuCeaORmrVWt7FS6XMP8lc
        YaJQYHIJ7lGDAKQ4Hy8kVxotpg==
X-Google-Smtp-Source: ABdhPJxbpOBrnF7xZ8Xw5p13WWrU0ejEI8V9oBAS0uu/QVHWeQQrSHUXBvFxHhf+CurDO4gehB8HFQ==
X-Received: by 2002:a17:906:5607:: with SMTP id f7mr30097440ejq.262.1615915207159;
        Tue, 16 Mar 2021 10:20:07 -0700 (PDT)
Received: from localhost.localdomain ([37.120.1.234])
        by smtp.gmail.com with ESMTPSA id u1sm10571584edv.90.2021.03.16.10.20.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Mar 2021 10:20:06 -0700 (PDT)
From:   Robert Foss <robert.foss@linaro.org>
To:     robert.foss@linaro.org, todor.too@gmail.com, agross@kernel.org,
        bjorn.andersson@linaro.org, mchehab@kernel.org, robh+dt@kernel.org,
        angelogioacchino.delregno@somainline.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Rob Herring <robh@kernel.org>, Tomasz Figa <tfiga@chromium.org>,
        Azam Sadiq Pasha Kapatrala Syed <akapatra@quicinc.com>,
        Sarvesh Sridutt <Sarvesh.Sridutt@smartwirelesscompute.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jonathan Marek <jonathan@marek.ca>
Subject: [PATCH v9 01/22] media: camss: Fix vfe_isr_comp_done() documentation
Date:   Tue, 16 Mar 2021 18:19:10 +0100
Message-Id: <20210316171931.812748-2-robert.foss@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210316171931.812748-1-robert.foss@linaro.org>
References: <20210316171931.812748-1-robert.foss@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Function name in comment is wrong, and was changed to be
the same as the actual function name.

The comment was changed to kerneldoc format.

Signed-off-by: Robert Foss <robert.foss@linaro.org>
Reviewed-by: Andrey Konovalov <andrey.konovalov@linaro.org>
---


Changes since v1:
 - Bjorn: Fix function doc name & use kerneldoc format

Changes since v5:
 - Nicolas: Fixed typo in commit message
 - Andrey: Added r-b



 drivers/media/platform/qcom/camss/camss-vfe.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index b2c95b46ce66..f50e08c4fd11 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -1076,8 +1076,8 @@ static void vfe_isr_wm_done(struct vfe_device *vfe, u8 wm)
 	spin_unlock_irqrestore(&vfe->output_lock, flags);
 }
 
-/*
- * vfe_isr_wm_done - Process composite image done interrupt
+/**
+ * vfe_isr_comp_done() - Process composite image done interrupt
  * @vfe: VFE Device
  * @comp: Composite image id
  */
-- 
2.27.0

