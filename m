Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AEB8A6867F4
	for <lists+linux-media@lfdr.de>; Wed,  1 Feb 2023 15:05:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231854AbjBAOFr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Feb 2023 09:05:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231594AbjBAOFq (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 1 Feb 2023 09:05:46 -0500
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D08E193E7
        for <linux-media@vger.kernel.org>; Wed,  1 Feb 2023 06:05:45 -0800 (PST)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 311BGR6w015669;
        Wed, 1 Feb 2023 15:05:36 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=/ueCzwUrbTZtoGRhfT5itkPJmanimT3T+EK59ps9zKk=;
 b=G/45a9T6mGE3+yKrcZfH6bMFcAT86J76YmuQW64Vpd/9RcXviLBhHQu9mrJCRQacYaCf
 pmXqkEOGKI3WCdH+E5lk2zjCL8f+zCvU/rcURPzd35C+v8df3ATDMz2r55McB/8dfDtz
 GmVa4NUhjnv1oZrcExE5AqUJb3QCmi662YtCs2DUHmEM0TjLSC7U5x0aeJnbaAyoxRIT
 bpVWf9M4rTzYtjNnRqVtYsGYTxdZ0esZDFgvdQ6CovJvWcPywya7RjySk3UrgRNcgP2f
 hiTeLvd9FxRfvL3A6V2gi3krbHQfgbR3h6nGr+OiAKprw5wO9alsGfGVtIc7n6Zgxzi1 aQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3nfq2d0xg0-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 01 Feb 2023 15:05:36 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 5C4C510002A;
        Wed,  1 Feb 2023 15:05:36 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 54B1B21ADC0;
        Wed,  1 Feb 2023 15:05:36 +0100 (CET)
Received: from localhost (10.252.0.107) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.13; Wed, 1 Feb
 2023 15:05:36 +0100
From:   Benjamin Mugnier <benjamin.mugnier@foss.st.com>
To:     <linux-media@vger.kernel.org>
CC:     <sylvain.petinot@foss.st.com>, <mchehab@kernel.org>,
        <sakari.ailus@iki.fi>, <laurent.pinchart@ideasonboard.com>,
        Benjamin Mugnier <benjamin.mugnier@foss.st.com>
Subject: [PATCH 1/4] media: i2c: st-vgxy61: Remove duplicate default mode set on probe
Date:   Wed, 1 Feb 2023 15:04:14 +0100
Message-ID: <20230201140417.89195-2-benjamin.mugnier@foss.st.com>
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

At this stage the default mode is unknown.
This is done correctly by vgxy61_fill_framefmt right after.

Signed-off-by: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
---
 drivers/media/i2c/st-vgxy61.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/i2c/st-vgxy61.c b/drivers/media/i2c/st-vgxy61.c
index 826baf4e064d..df5483f14560 100644
--- a/drivers/media/i2c/st-vgxy61.c
+++ b/drivers/media/i2c/st-vgxy61.c
@@ -1332,7 +1332,6 @@ static int vgxy61_init_cfg(struct v4l2_subdev *sd,
 	struct vgxy61_dev *sensor = to_vgxy61_dev(sd);
 	struct v4l2_subdev_format fmt = { 0 };
 
-	sensor->current_mode = sensor->default_mode;
 	vgxy61_fill_framefmt(sensor, sensor->current_mode, &fmt.format,
 			     VGXY61_MEDIA_BUS_FMT_DEF);
 
-- 
2.25.1

