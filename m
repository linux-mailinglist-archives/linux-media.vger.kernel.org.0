Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D321B6867FC
	for <lists+linux-media@lfdr.de>; Wed,  1 Feb 2023 15:08:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232154AbjBAOI6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Feb 2023 09:08:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232110AbjBAOI5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 1 Feb 2023 09:08:57 -0500
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D5C85B5B7
        for <linux-media@vger.kernel.org>; Wed,  1 Feb 2023 06:08:56 -0800 (PST)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 311BGLn9014994;
        Wed, 1 Feb 2023 15:08:48 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=bB2ZFryYdXmjA3QU26KIfacyh2vp4Fg50keWaR/xbYg=;
 b=D6i4Im4n/lJHUPGHHuOZaq83NyuOxYDoS3FUZt8pXRslIryjHFeLiidbSTjk08OFyYpa
 03VS5oDOqPQYx6JM8T15e1hELfEJxkhqEdgCio/73YZoXFAeSYj07MuttHVFB6Ns/5SW
 27S7EoQY3cO3O4K/k8K2XaG1S7BkArUr2GkiXevfK9dRnitoTKc01E0EZi7T+QPhTsvj
 hYGxZtJzJRpbI1lOcx4OM46+Fjjq+IyNJIvbRcEsudbnkyeE5JxgUFcUd3f9HvtR5L/h
 YR372iSMfmKHr2Py7GI7YWYA9REqErrvXc2T1fUJ2TLm/lgJrj2Ys2sHmr118XSFhSfx uA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3nfq2d0y7b-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 01 Feb 2023 15:08:48 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C42F210002A;
        Wed,  1 Feb 2023 15:08:47 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id BE37C21F0A7;
        Wed,  1 Feb 2023 15:08:47 +0100 (CET)
Received: from localhost (10.252.0.107) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.13; Wed, 1 Feb
 2023 15:08:47 +0100
From:   Benjamin Mugnier <benjamin.mugnier@foss.st.com>
To:     <linux-media@vger.kernel.org>
CC:     <sylvain.petinot@foss.st.com>, <mchehab@kernel.org>,
        <sakari.ailus@iki.fi>, <laurent.pinchart@ideasonboard.com>,
        Benjamin Mugnier <benjamin.mugnier@foss.st.com>
Subject: [PATCH 4/4] media: i2c: st-vgxy61: Use VGXY61_NB_POLARITIES instead of hardcoded value in tx_from_ep
Date:   Wed, 1 Feb 2023 15:04:17 +0100
Message-ID: <20230201140417.89195-5-benjamin.mugnier@foss.st.com>
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

Signed-off-by: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
---
 drivers/media/i2c/st-vgxy61.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/st-vgxy61.c b/drivers/media/i2c/st-vgxy61.c
index 2988ba60be94..33ff2cf20fbf 100644
--- a/drivers/media/i2c/st-vgxy61.c
+++ b/drivers/media/i2c/st-vgxy61.c
@@ -1546,7 +1546,7 @@ static int vgxy61_tx_from_ep(struct vgxy61_dev *sensor,
 	sensor->nb_of_lane = l_nb;
 
 	dev_dbg(&client->dev, "tx uses %d lanes", l_nb);
-	for (i = 0; i < 5; i++) {
+	for (i = 0; i < VGXY61_NB_POLARITIES; i++) {
 		dev_dbg(&client->dev, "log2phy[%d] = %d\n", i, log2phy[i]);
 		dev_dbg(&client->dev, "phy2log[%d] = %d\n", i, phy2log[i]);
 		dev_dbg(&client->dev, "polarity[%d] = %d\n", i, polarities[i]);
-- 
2.25.1

