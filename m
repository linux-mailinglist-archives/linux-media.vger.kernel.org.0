Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA3AE293887
	for <lists+linux-media@lfdr.de>; Tue, 20 Oct 2020 11:54:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404548AbgJTJyc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 20 Oct 2020 05:54:32 -0400
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:34560 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S2404464AbgJTJyb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 20 Oct 2020 05:54:31 -0400
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 09K9lfLh020178;
        Tue, 20 Oct 2020 11:54:19 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=2owaOvNvhateHf+UNIaUTPpoUGANl3taLAS8bX1HmYA=;
 b=o67kKC/8dfEOLlLcxZ+P8BJVdKhim6Il/aAqFHCmAospVgwR15xRa2aYyCItgE/CyyER
 dqNSw+KBiJ+kLCNHENo81/dvy4F4r0kQINBAbYA8+pmC3l6BaqIUc+RxvFFlWartmU3l
 WR+i0zbydBNgaJLmxFNN8xA1PsS3sYGMroXmPlCK2K/OAg27HEsf4fySwgHiNTTFlJVq
 tZ9DrEuDEM4ELIsJtLSJ+vMWsjMuVm/4ihkiwKRbj/5X6iRJ34QAyfICbyHa+BD66Ls4
 xUk5Nv9ojUDdZV+lW9DaittB9oQIyQxerMKBmYkX7NxKA8XTTeYxn9Ruh06S821rAOXf 1A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 347qgg2c8c-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 20 Oct 2020 11:54:19 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 4152810002A;
        Tue, 20 Oct 2020 11:54:19 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag1node1.st.com [10.75.127.1])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 30C412C41FA;
        Tue, 20 Oct 2020 11:54:19 +0200 (CEST)
Received: from localhost (10.75.127.47) by SFHDAG1NODE1.st.com (10.75.127.1)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 20 Oct 2020 11:54:18
 +0200
From:   Hugues Fruchet <hugues.fruchet@st.com>
To:     Alexandre Torgue <alexandre.torgue@st.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Rob Herring <robh+dt@kernel.org>
CC:     <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        Hugues Fruchet <hugues.fruchet@st.com>,
        Alain Volmat <alain.volmat@st.com>,
        Yannick Fertre <yannick.fertre@st.com>,
        Philippe CORNU <philippe.cornu@st.com>
Subject: [PATCH v2 2/2] media: dt-bindings: media: st,stm32-dcmi: Add support of BT656
Date:   Tue, 20 Oct 2020 11:54:06 +0200
Message-ID: <1603187646-13184-3-git-send-email-hugues.fruchet@st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1603187646-13184-1-git-send-email-hugues.fruchet@st.com>
References: <1603187646-13184-1-git-send-email-hugues.fruchet@st.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG7NODE3.st.com (10.75.127.21) To SFHDAG1NODE1.st.com
 (10.75.127.1)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-10-20_04:2020-10-20,2020-10-20 signatures=0
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add support of BT656 parallel bus mode in DCMI.
This mode is enabled when hsync-active & vsync-active
fields are not specified.

Signed-off-by: Hugues Fruchet <hugues.fruchet@st.com>
---
 .../devicetree/bindings/media/st,stm32-dcmi.yaml   | 30 ++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/st,stm32-dcmi.yaml b/Documentation/devicetree/bindings/media/st,stm32-dcmi.yaml
index 3fe778c..1ee521a 100644
--- a/Documentation/devicetree/bindings/media/st,stm32-dcmi.yaml
+++ b/Documentation/devicetree/bindings/media/st,stm32-dcmi.yaml
@@ -44,6 +44,36 @@ properties:
       bindings defined in
       Documentation/devicetree/bindings/media/video-interfaces.txt.
 
+    properties:
+      endpoint:
+        type: object
+
+        properties:
+          bus-width: true
+
+          hsync-active:
+            description:
+              If both HSYNC and VSYNC polarities are not specified, BT656
+              embedded synchronization is selected.
+            default: 0
+
+          vsync-active:
+            description:
+              If both HSYNC and VSYNC polarities are not specified, BT656
+              embedded synchronization is selected.
+            default: 0
+
+          pclk-sample: true
+
+          remote-endpoint: true
+
+        required:
+          - remote-endpoint
+
+        additionalProperties: false
+
+    additionalProperties: false
+
 required:
   - compatible
   - reg
-- 
2.7.4

