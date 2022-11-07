Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2AC1961F434
	for <lists+linux-media@lfdr.de>; Mon,  7 Nov 2022 14:22:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232127AbiKGNWg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Nov 2022 08:22:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232065AbiKGNWb (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 7 Nov 2022 08:22:31 -0500
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47A161C918
        for <linux-media@vger.kernel.org>; Mon,  7 Nov 2022 05:22:30 -0800 (PST)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2A7ATngn017280;
        Mon, 7 Nov 2022 14:22:23 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=kb9RZ/r3E2cixBVG5vFI+uVAUo9rvsuQ5N/MP6Lr2sY=;
 b=Wg7xrrKPGKj93OBEUdTus6OxkGYBcMdzCqTD9w4fGF9Um0AfbGy01Yy2+bZqrQwomrA2
 h7Y3WJq3Zd8GM+d+7DzIuQcyvu6FllRg6GsuQMmr3QRyFkHKXCLvu9FsFy7d8B0B0edS
 YZXzhWjXQZeSecAMRFMcfZUTKVYqK1iwVFWWeQwQyXAG3jZSfaVzlZxg7+HGv9iOpFZV
 VtuRS8wCfsWqsQVgU7fPJszjUiYz81skp7HkyA8rcPcBwe0hjnABWbwklm8HMudqfrjv
 yykzEvtOcCkjkJSkRfxJJAIq6Isjzqw0hVI1jhWrcwbVJ+F3nl2ymz0Fm3BlIzSJex6b nA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3kq0aps0wk-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 07 Nov 2022 14:22:23 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 9E45310003D;
        Mon,  7 Nov 2022 14:22:17 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 99CEF21BF7F;
        Mon,  7 Nov 2022 14:22:17 +0100 (CET)
Received: from localhost (10.129.167.233) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.32; Mon, 7 Nov
 2022 14:22:17 +0100
From:   Benjamin Mugnier <benjamin.mugnier@foss.st.com>
To:     <linux-media@vger.kernel.org>
CC:     <sylvain.petinot@foss.st.com>, <mchehab@kernel.org>,
        <sakari.ailus@iki.fi>, <laurent.pinchart@ideasonboard.com>,
        Benjamin Mugnier <benjamin.mugnier@foss.st.com>
Subject: [PATCH 2/3] media: Documentation: st-vgxy61: Remove quotes around 'No HDR' identifier
Date:   Mon, 7 Nov 2022 14:19:44 +0100
Message-ID: <20221107131945.40753-3-benjamin.mugnier@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221107131945.40753-1-benjamin.mugnier@foss.st.com>
References: <20221107131945.40753-1-benjamin.mugnier@foss.st.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.129.167.233]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-07_06,2022-11-07_01,2022-06-22_01
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Signed-off-by: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
---
 Documentation/userspace-api/media/drivers/st-vgxy61.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/userspace-api/media/drivers/st-vgxy61.rst b/Documentation/userspace-api/media/drivers/st-vgxy61.rst
index fb08aef03502..d9e3b80e3a96 100644
--- a/Documentation/userspace-api/media/drivers/st-vgxy61.rst
+++ b/Documentation/userspace-api/media/drivers/st-vgxy61.rst
@@ -21,5 +21,5 @@ The ST VGXY61 driver implements the following controls:
     * - HDR substraction
       - This involves subtracting the short exposure frame from the long
         exposure frame.
-    * - "No HDR"
+    * - No HDR
       - This mode is used for standard dynamic range (SDR) exposures.
-- 
2.25.1

