Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 263244D483C
	for <lists+linux-media@lfdr.de>; Thu, 10 Mar 2022 14:38:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242494AbiCJNiB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Mar 2022 08:38:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242537AbiCJNh6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Mar 2022 08:37:58 -0500
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10D6114EF6D
        for <linux-media@vger.kernel.org>; Thu, 10 Mar 2022 05:36:56 -0800 (PST)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 22AAWjrW023817
        for <linux-media@vger.kernel.org>; Thu, 10 Mar 2022 14:36:55 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=lfactqUkR5E9ZfJ2zEvCzB/RC4V10vE3GEhE/dE6Jaw=;
 b=RfHe7y8EKiTprNUTfpNWV8s3If203XpOvXs1zn11obyVB/MFwYPqTTcDAUnStaUXA54+
 TbG9EIjh5/hUdYzBgpJUt20GsknDVgOtkUcm9ke6KECYSGJJarwhyGP0XJ2B4156rXnO
 X+jwNrsS4Fl8d+k7/ydvsHEC8i3OuMkvQRYit7BN2Up1zPD3W7h8dGYJ2BPuA1C9Sr9D
 LOudsJ1Ei68gy4m6VeFxUWaA4KRbOf9rM5LmZ/PsM4XWNdDITQuZgfeNWowhpodHEPhk
 ifMfCNodn0Mjo0z+H1A062d7GEryAhEn6LxdyyOKCV4w0IN29p5dIKrBF5hdeP8m5L23 sA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3ekymmsb12-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
        for <linux-media@vger.kernel.org>; Thu, 10 Mar 2022 14:36:55 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C061110002A
        for <linux-media@vger.kernel.org>; Thu, 10 Mar 2022 14:36:54 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node1.st.com [10.75.127.4])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2C4BC209727
        for <linux-media@vger.kernel.org>; Thu, 10 Mar 2022 14:36:54 +0100 (CET)
Received: from localhost (10.75.127.48) by SFHDAG2NODE1.st.com (10.75.127.4)
 with Microsoft SMTP Server (TLS) id 15.0.1497.26; Thu, 10 Mar 2022 14:36:53
 +0100
From:   Benjamin Mugnier <benjamin.mugnier@foss.st.com>
To:     <linux-media@vger.kernel.org>
CC:     <alain.volmat@foss.st.com>, <hugues.fruchet@foss.st.com>,
        <sylvain.petinot@foss.st.com>,
        Benjamin Mugnier <benjamin.mugnier@foss.st.com>
Subject: [PATCH 0/2] media: Add ST VGXY61 camera sensor driver
Date:   Thu, 10 Mar 2022 14:32:53 +0100
Message-ID: <20220310133255.1946530-1-benjamin.mugnier@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE1.st.com
 (10.75.127.4)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-10_03,2022-03-09_01,2022-02-23_01
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

This series adds a driver for the ST VGXY61 camera sensor.  This camera sensor is using the i2c bus
for control and the csi-2 bus for data.

Tested on DragonBoard 410c and on Raspberry Pi 4. DT bindings are in 1/2, and the driver in
2/2.

Benjamin Mugnier (2):
  media: dt-bindings: media: i2c: Add ST VGXY61 camera sensor binding
  media: i2c: Add driver for ST VGXY61 camera sensor

 .../bindings/media/i2c/st,st-vgxy61.yaml      |  134 ++
 MAINTAINERS                                   |   10 +
 drivers/media/i2c/Kconfig                     |   11 +
 drivers/media/i2c/Makefile                    |    1 +
 drivers/media/i2c/st-vgxy61.c                 | 1919 +++++++++++++++++
 5 files changed, 2075 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/st,st-vgxy61.yaml
 create mode 100644 drivers/media/i2c/st-vgxy61.c

-- 
2.25.1

