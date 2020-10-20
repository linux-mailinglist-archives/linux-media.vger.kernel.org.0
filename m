Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 462132938FE
	for <lists+linux-media@lfdr.de>; Tue, 20 Oct 2020 12:15:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406015AbgJTKPN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 20 Oct 2020 06:15:13 -0400
Received: from mx07-00178001.pphosted.com ([185.132.182.106]:42815 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1733121AbgJTKPF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 20 Oct 2020 06:15:05 -0400
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 09KABwYN028101;
        Tue, 20 Oct 2020 12:14:54 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=2owaOvNvhateHf+UNIaUTPpoUGANl3taLAS8bX1HmYA=;
 b=vkei+O0JeeZH9h5B2x/KRSVKk/WJMzzXtpj59BCQ/ayBtD6wd658aKiL37d/JUciP6bR
 5+zjso03K4eIY8eJ594KtmXSYxTkg9xLfiydxfLwzjPnTZDP5hN1YR+bzM13FXJ7XJS0
 pereqf+QF5KtjqkZMgXKjWKj9RlMNIKYYd+JzCRGx48kms98ARtr2+kammGwR4IY0ey3
 jIuDsZ1PivrgXvB03pVlOJ5ZhEYUHV42jUXPgVPLwq2ZYqnzB8D76sAuKSzLvsiilXGM
 m8gXaPu1AE2TdfC3GHGtwrZeyhWzgdERGgBUJwTaCMlEmD/mjM2+VUVSWjRTWjSS4vK+ ww== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 347p30j15j-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 20 Oct 2020 12:14:54 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id CD8A110002A;
        Tue, 20 Oct 2020 12:14:53 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag1node1.st.com [10.75.127.1])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id BE5A92C4CC5;
        Tue, 20 Oct 2020 12:14:53 +0200 (CEST)
Received: from localhost (10.75.127.46) by SFHDAG1NODE1.st.com (10.75.127.1)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 20 Oct 2020 12:14:53
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
Subject: [PATCH v4 2/2] media: dt-bindings: media: st,stm32-dcmi: Add support of BT656
Date:   Tue, 20 Oct 2020 12:14:49 +0200
Message-ID: <1603188889-23664-3-git-send-email-hugues.fruchet@st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1603188889-23664-1-git-send-email-hugues.fruchet@st.com>
References: <1603188889-23664-1-git-send-email-hugues.fruchet@st.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG3NODE3.st.com (10.75.127.9) To SFHDAG1NODE1.st.com
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

