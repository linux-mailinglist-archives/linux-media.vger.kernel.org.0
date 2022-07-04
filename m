Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 456AA565F5B
	for <lists+linux-media@lfdr.de>; Tue,  5 Jul 2022 00:08:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229784AbiGDWIV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 4 Jul 2022 18:08:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229719AbiGDWIU (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 4 Jul 2022 18:08:20 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF8C412627
        for <linux-media@vger.kernel.org>; Mon,  4 Jul 2022 15:08:17 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id t25so17631028lfg.7
        for <linux-media@vger.kernel.org>; Mon, 04 Jul 2022 15:08:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=a34faQtwagl20LrpWELh2gVhWLFPcXFobQBVS2MYvUM=;
        b=BmPaZMzmINyiXzdBJ1CkiXt6rp0AucG7wVHWs+yErIAGPvQUd3BdoYl4xY4WdXk2Nh
         APvlTMuijWgZ95wQFa7uJbliJKvVFYQO1o7KOImx+UbLUsv9uvM9eT5G7xYv3iciFs6r
         /FSS2CL81qYZPcAdv/ufvIjP3iHZdQ+y/zCsT4fVsVOq6pJZrHft/oh/+C+6t8gAz2do
         9t61lwF6Kq+gHRM0yRUcDq+NW7E+Xyb3ukbkXmXYL/5ZthQxld7nWO20vaAU8FMLhSw7
         4xvoH59qpT/l8sd9oCUDwkAFCDRspNEJpKap/JZj0h2Zg9TA5oYI5aZBt7K6kEXXFpyB
         zQIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=a34faQtwagl20LrpWELh2gVhWLFPcXFobQBVS2MYvUM=;
        b=GeKVYcAA4U68bU3xXwxz1nAp2ZNEuPgcOTNrnjst8Pyc1SfZs4Toy1lVtj/iVZIRQU
         iYeEbPxDuae/af9VHTSGfMmkv/ZmgNIbeqB6GiOdaMeZoqaLEZALKaOqI80f21riT8FG
         FhlILr0/u1p/hwL9DfdI4BBF5apiqv4gs3l3GcmFmJ7NGDTwtK+HLf8ElB/xsFsVq5X+
         AI/T5l+UoDdDAtwLiHGjt6kWhtK7fGxPNLBTuOU3eGRnIPl2r2kDDM5F+2mP4UR6OY4G
         ubEB7mcGAgiaKYTCR9WT8q8b4OC9Ae6ugNm4Sac9gwA3IPbdBvJlcKvO3kZs5dyfHNKb
         4Gwg==
X-Gm-Message-State: AJIora89W0Wkakq3AX3n33DgnEQ0fy4RRPwsvLEqRVUNlh5fnufOKVYg
        KDYovs1xqAZ4tih+TQsduXf1OQ==
X-Google-Smtp-Source: AGRyM1s5qdCw9sHSYyY+4oX9sJnPEq2SyUJJKeGHJC5ARAOe5WA/3fb8iJX/Wjcmf+Z6SKXVb1Bc2A==
X-Received: by 2002:a05:6512:2508:b0:480:f1cb:64a5 with SMTP id be8-20020a056512250800b00480f1cb64a5mr21167875lfb.0.1656972496056;
        Mon, 04 Jul 2022 15:08:16 -0700 (PDT)
Received: from localhost.localdomain (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id h18-20020a05651c125200b0025a91928236sm5230329ljh.90.2022.07.04.15.08.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Jul 2022 15:08:15 -0700 (PDT)
From:   Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To:     Robert Foss <robert.foss@linaro.org>,
        Todor Tomov <todor.too@gmail.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: [PATCH v2] media: camss: Do not attach an already attached power domain on MSM8916 platform
Date:   Tue,  5 Jul 2022 01:08:14 +0300
Message-Id: <20220704220814.629130-1-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The change to dynamically allocated power domains neglected a case of
CAMSS on MSM8916 platform, where a single VFE power domain is neither
attached, linked or managed in runtime in any way explicitly.

This is a special case and it shall be kept as is, because the power
domain management is done outside of the driver, and it's very different
in comparison to all other platforms supported by CAMSS.

Fixes: 6b1814e26989 ("media: camss: Allocate power domain resources dynamically")
Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
Changes from v1 to v2:
* corrected the fixed commit id, which is found on media/master

 drivers/media/platform/qcom/camss/camss.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 932968e5f1e5..7a929f19e79b 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -1465,6 +1465,14 @@ static int camss_configure_pd(struct camss *camss)
 		return camss->genpd_num;
 	}
 
+	/*
+	 * If a platform device has just one power domain, then it is attached
+	 * at platform_probe() level, thus there shall be no need and even no
+	 * option to attach it again, this is the case for CAMSS on MSM8916.
+	 */
+	if (camss->genpd_num == 1)
+		return 0;
+
 	camss->genpd = devm_kmalloc_array(dev, camss->genpd_num,
 					  sizeof(*camss->genpd), GFP_KERNEL);
 	if (!camss->genpd)
@@ -1698,6 +1706,9 @@ void camss_delete(struct camss *camss)
 
 	pm_runtime_disable(camss->dev);
 
+	if (camss->genpd_num == 1)
+		return;
+
 	for (i = 0; i < camss->genpd_num; i++) {
 		device_link_del(camss->genpd_link[i]);
 		dev_pm_domain_detach(camss->genpd[i], true);
-- 
2.33.0

