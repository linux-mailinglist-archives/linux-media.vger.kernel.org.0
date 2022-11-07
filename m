Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DF89561F43A
	for <lists+linux-media@lfdr.de>; Mon,  7 Nov 2022 14:23:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231367AbiKGNXh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Nov 2022 08:23:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231783AbiKGNXf (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 7 Nov 2022 08:23:35 -0500
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D16313D63
        for <linux-media@vger.kernel.org>; Mon,  7 Nov 2022 05:23:34 -0800 (PST)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2A79cxkP025006;
        Mon, 7 Nov 2022 14:23:22 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=93HIVjJuD5r2Ugdo19gSCI1s/fkRiE2zwRO+snspk5M=;
 b=axe15Oqz+1Fvj+y19o6VF99ZOIUlYiF/UDylBYDVljC8WwKATVOhAhc32zJqhvgICAAO
 IiPLGhJXsIaN1Zmbl20QcF9JEA+GHwYf7HQHT41fCqgGPbcnizDCNFbtD4aafiJlFgzN
 hOlDQnX1SdJESeQzvuVmOkMZGeWNgofTH7he/0wkzbXo4bfmQL6aSz865nI5rbnnneEm
 sATleiGwDA3ZagikFLwRLssWPWEa7T9+elJql5QeVcmbrrwkVoF+F9HP54mxD2cKs6t6
 3VDsuoLnmxwbikresXUqflwtJFfsrZvujIMRyjlVaoT//BnxOXq/WQUZ4mZq0DAVeVel Sw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3kpyjq1gwg-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 07 Nov 2022 14:23:22 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id F2C9B100040;
        Mon,  7 Nov 2022 14:23:17 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id ED819222CBD;
        Mon,  7 Nov 2022 14:23:17 +0100 (CET)
Received: from localhost (10.129.167.233) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.32; Mon, 7 Nov
 2022 14:23:17 +0100
From:   Benjamin Mugnier <benjamin.mugnier@foss.st.com>
To:     <linux-media@vger.kernel.org>
CC:     <sylvain.petinot@foss.st.com>, <mchehab@kernel.org>,
        <sakari.ailus@iki.fi>, <laurent.pinchart@ideasonboard.com>,
        Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
        kernel test robot <lkp@intel.com>
Subject: [PATCH 3/3] media: Documentation: st-vgxy61: Fix driver specific documentation not being included in the index
Date:   Mon, 7 Nov 2022 14:19:45 +0100
Message-ID: <20221107131945.40753-4-benjamin.mugnier@foss.st.com>
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

Fixes: 2378be892b6f ("media: Documentation: Add ST VGXY61 driver documentation")
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
---
 Documentation/userspace-api/media/drivers/index.rst | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/userspace-api/media/drivers/index.rst b/Documentation/userspace-api/media/drivers/index.rst
index 32f82aed47d9..0f758c8d4523 100644
--- a/Documentation/userspace-api/media/drivers/index.rst
+++ b/Documentation/userspace-api/media/drivers/index.rst
@@ -38,4 +38,5 @@ For more details see the file COPYING in the source distribution of Linux.
 	max2175
 	meye-uapi
 	omap3isp-uapi
+	st-vgxy61
 	uvcvideo
-- 
2.25.1

