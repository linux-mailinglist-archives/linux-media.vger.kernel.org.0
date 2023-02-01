Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 819536867F7
	for <lists+linux-media@lfdr.de>; Wed,  1 Feb 2023 15:08:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231921AbjBAOIA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Feb 2023 09:08:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230261AbjBAOH7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 1 Feb 2023 09:07:59 -0500
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB9FF4491
        for <linux-media@vger.kernel.org>; Wed,  1 Feb 2023 06:07:57 -0800 (PST)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 311A0wos027540;
        Wed, 1 Feb 2023 15:07:47 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=crd94H66aCetGRnD+HyS9R8AfwddIFLkwQ3BPMOPvEQ=;
 b=wAsxJ0IOyRLCOfsd5V5Rs4wk2fmsjA+0M6Uy2wai2jhh/hSctJu3Ec+ibtEq90TOnyuV
 Z80RcPq4hW/S6oaqdjx4oBBQPJIdWRgA78HepY0bayIskN0NrM+Jhowt5YFgeMAPjUIT
 pq7qVexMbcMjtgAA9Fy8f7wGQ179s+tdqK2baOhNbBk/qvOXbYUuBu3CUEBzJ0K6r50F
 EfYj+GzU2iMIhmchQR+TeR8CZ3uoTLPQ+vt4+hRPHHO/UJ6qXU7WwCYCO1dgjd/EYjte
 VmlCRSdDOQ3xWPVvlf1nvGNZOQC2Fzpnf1mHJxj0mDvwSOUAiP0CeRHBxLpOwHwXTLo8 JA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3nfny51efv-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 01 Feb 2023 15:07:47 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 629A310002A;
        Wed,  1 Feb 2023 15:07:47 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5C99921ED5B;
        Wed,  1 Feb 2023 15:07:47 +0100 (CET)
Received: from localhost (10.252.0.107) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.13; Wed, 1 Feb
 2023 15:07:47 +0100
From:   Benjamin Mugnier <benjamin.mugnier@foss.st.com>
To:     <linux-media@vger.kernel.org>
CC:     <sylvain.petinot@foss.st.com>, <mchehab@kernel.org>,
        <sakari.ailus@iki.fi>, <laurent.pinchart@ideasonboard.com>,
        Benjamin Mugnier <benjamin.mugnier@foss.st.com>
Subject: [PATCH 3/4] media: i2c: st-vgxy61: Fix control flow error on probe
Date:   Wed, 1 Feb 2023 15:04:16 +0100
Message-ID: <20230201140417.89195-4-benjamin.mugnier@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230201140417.89195-1-benjamin.mugnier@foss.st.com>
References: <20230201140417.89195-1-benjamin.mugnier@foss.st.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.252.0.107]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-01_04,2023-01-31_01,2022-06-22_01
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

In case of error 'update_hdr' now goes through 'power_off' instead of
returning, effectively shutting down the sensor.

Signed-off-by: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
---
 drivers/media/i2c/st-vgxy61.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/i2c/st-vgxy61.c b/drivers/media/i2c/st-vgxy61.c
index e51234aebb16..2988ba60be94 100644
--- a/drivers/media/i2c/st-vgxy61.c
+++ b/drivers/media/i2c/st-vgxy61.c
@@ -1868,11 +1868,11 @@ static int vgxy61_probe(struct i2c_client *client)
 	vgxy61_fill_framefmt(sensor, sensor->current_mode, &sensor->fmt,
 			     VGXY61_MEDIA_BUS_FMT_DEF);
 
+	mutex_init(&sensor->lock);
+
 	ret = vgxy61_update_hdr(sensor, sensor->hdr);
 	if (ret)
-		return ret;
-
-	mutex_init(&sensor->lock);
+		goto error_power_off;
 
 	ret = vgxy61_init_controls(sensor);
 	if (ret) {
@@ -1911,8 +1911,8 @@ static int vgxy61_probe(struct i2c_client *client)
 	media_entity_cleanup(&sensor->sd.entity);
 error_handler_free:
 	v4l2_ctrl_handler_free(sensor->sd.ctrl_handler);
-	mutex_destroy(&sensor->lock);
 error_power_off:
+	mutex_destroy(&sensor->lock);
 	vgxy61_power_off(dev);
 
 	return ret;
-- 
2.25.1

