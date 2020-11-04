Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 049C62A6BB3
	for <lists+linux-media@lfdr.de>; Wed,  4 Nov 2020 18:33:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731180AbgKDRcm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 4 Nov 2020 12:32:42 -0500
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:9672 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726950AbgKDRcl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 4 Nov 2020 12:32:41 -0500
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 0A4HHFWl032201;
        Wed, 4 Nov 2020 18:32:28 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=qYfPxMthkznc92y4PPwL9Vj3JHriBF17CldNWKVusdQ=;
 b=UypEoQROkbPFehrf3Y6uitAKpcTaEtMbBt8UjmE8yquPFSXL5zxRgSZz1SRQ8vwUaEbP
 q6v7KUAg64Kf9I+54x/S4UYoo82ylECg0+st0BFeLGLBYfPROogN4Zv6qwruPvrQCg+m
 7zFTrFZqO5F7H4YKfGWwCctNv3kuaAdzhydvFCiFPM9OKb9vg0X5jgHruxL0DRwVLOUy
 EYzqwOGBcSJMdRASVsilfba1pixmDlU1U8njn0viLGx1DeY/3b1he9BbafcZm9Xa+Pp/
 N5t/iPizoGmKTJCcAMe1fx+9hybdUpgqg6FmIdzZYuAHIsnOHS8ZpAsSBzeKBAsKXmfE Lw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 34h031ubqn-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 04 Nov 2020 18:32:28 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 704A910002A;
        Wed,  4 Nov 2020 18:32:27 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag1node1.st.com [10.75.127.1])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 64583225C2A;
        Wed,  4 Nov 2020 18:32:27 +0100 (CET)
Received: from localhost (10.75.127.44) by SFHDAG1NODE1.st.com (10.75.127.1)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 4 Nov 2020 18:32:26
 +0100
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
Subject: [PATCH v5 2/4] media: dt-bindings: media: st,stm32-dcmi: add support of BT656 bus
Date:   Wed, 4 Nov 2020 18:32:10 +0100
Message-ID: <1604511132-4014-3-git-send-email-hugues.fruchet@st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1604511132-4014-1-git-send-email-hugues.fruchet@st.com>
References: <1604511132-4014-1-git-send-email-hugues.fruchet@st.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG1NODE1.st.com (10.75.127.1) To SFHDAG1NODE1.st.com
 (10.75.127.1)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312,18.0.737
 definitions=2020-11-04_11:2020-11-04,2020-11-04 signatures=0
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add support of BT656 embedded synchronization bus mode in DCMI driver.
Add "bus-type" property and make it required so that there is no
ambiguity between parallel mode (bus-type=5) and BT656 mode (bus-type=6).
BT656 mode allows to save hardware synchro lines hsync & vsync by replacing
them with synchro codes embedded in data stream, hence hsync-active &
vsync-active properties are useless in this mode.
With DCMI, BT656 bus mode is only compatible with 8 bits width data bus.

Signed-off-by: Hugues Fruchet <hugues.fruchet@st.com>
---
 .../devicetree/bindings/media/st,stm32-dcmi.yaml   | 38 ++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/st,stm32-dcmi.yaml b/Documentation/devicetree/bindings/media/st,stm32-dcmi.yaml
index 3fe778c..c18574b 100644
--- a/Documentation/devicetree/bindings/media/st,stm32-dcmi.yaml
+++ b/Documentation/devicetree/bindings/media/st,stm32-dcmi.yaml
@@ -44,6 +44,43 @@ properties:
       bindings defined in
       Documentation/devicetree/bindings/media/video-interfaces.txt.
 
+    properties:
+      endpoint:
+        type: object
+
+        properties:
+          bus-type:
+            enum: [5, 6]
+            default: 5
+
+          bus-width:
+            enum: [8, 10, 12, 14]
+            default: 8
+
+          remote-endpoint: true
+
+        allOf:
+          - if:
+              properties:
+                bus-type:
+                  const: 6
+
+            then:
+              properties:
+                hsync-active: false
+                vsync-active: false
+                bus-width:
+                  enum: [8]
+
+        required:
+          - remote-endpoint
+          - bus-type
+          - pclk-sample
+
+        unevaluatedProperties: false
+
+    additionalProperties: false
+
 required:
   - compatible
   - reg
@@ -75,6 +112,7 @@ examples:
         port {
              dcmi_0: endpoint {
                    remote-endpoint = <&ov5640_0>;
+                   bus-type = <5>;
                    bus-width = <8>;
                    hsync-active = <0>;
                    vsync-active = <0>;
-- 
2.7.4

