Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E1CA1EF8A5
	for <lists+linux-media@lfdr.de>; Fri,  5 Jun 2020 15:06:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726888AbgFENFf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 5 Jun 2020 09:05:35 -0400
Received: from mx07-00178001.pphosted.com ([62.209.51.94]:9042 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726409AbgFENFe (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 5 Jun 2020 09:05:34 -0400
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 055D1bHP018968;
        Fri, 5 Jun 2020 15:05:23 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=zWShjHdtkDP9KEzM3tiXokZkb+o6dSeLDNYRf6d3oDE=;
 b=Z4GYj0TQc1f6MOtkTmFK6S/f3uMm+wvORJbx7H3FMmxYmtnaTa8GimkP02LWoZwsVE/n
 Ian2xwt18A66qH+6np7F4MRW+71rty2yQj9AjI05BfMBH7eEuPwcEv2IZb/yuJaAIFG9
 zU4BUy1NzTo8w0Y8fIIIlej5rrwNU2G3duM1QmnZv2o6FfBqDh1yysuigus2AXyDlKsl
 5UMEiMER3RCwpRzS1jUAb6s9uXBN97fy9DLEJGaPQ5e0LRkhjHs5DVwH3Qn2rk0SmAKr
 TZzBQaaUgt75PRZTWzB6avIZqwNJGkCE5y+VWnDMPamoucPK34sILBuZBsiXrxtvX1nh nQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 31fat4kmg8-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 05 Jun 2020 15:05:23 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id EB8E3100034;
        Fri,  5 Jun 2020 15:05:22 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node3.st.com [10.75.127.9])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D676D2C50BE;
        Fri,  5 Jun 2020 15:05:22 +0200 (CEST)
Received: from localhost (10.75.127.47) by SFHDAG3NODE3.st.com (10.75.127.9)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2; Fri, 5 Jun 2020 15:05:22
 +0200
From:   Benjamin Gaignard <benjamin.gaignard@st.com>
To:     <hugues.fruchet@st.com>, <mchehab@kernel.org>,
        <mcoquelin.stm32@gmail.com>, <alexandre.torgue@st.com>
CC:     <linux-media@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <vincent.guittot@linaro.org>,
        <valentin.schneider@arm.com>, <rjw@rjwysocki.net>,
        Benjamin Gaignard <benjamin.gaignard@st.com>
Subject: [PATCH v4 1/3] dt-bindings: media: stm32-dcmi: Add DCMI min frequency property
Date:   Fri, 5 Jun 2020 15:05:17 +0200
Message-ID: <20200605130519.4184-2-benjamin.gaignard@st.com>
X-Mailer: git-send-email 2.15.0
In-Reply-To: <20200605130519.4184-1-benjamin.gaignard@st.com>
References: <20200605130519.4184-1-benjamin.gaignard@st.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG4NODE2.st.com (10.75.127.11) To SFHDAG3NODE3.st.com
 (10.75.127.9)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216,18.0.687
 definitions=2020-06-05_04:2020-06-04,2020-06-05 signatures=0
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Document st,stm32-dcmi-min-frequency property which is used to
request CPUs minimum frequency when streaming frames.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
---
 Documentation/devicetree/bindings/media/st,stm32-dcmi.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/st,stm32-dcmi.yaml b/Documentation/devicetree/bindings/media/st,stm32-dcmi.yaml
index 3fe778cb5cc3..05ca85a2411a 100644
--- a/Documentation/devicetree/bindings/media/st,stm32-dcmi.yaml
+++ b/Documentation/devicetree/bindings/media/st,stm32-dcmi.yaml
@@ -44,6 +44,13 @@ properties:
       bindings defined in
       Documentation/devicetree/bindings/media/video-interfaces.txt.
 
+  st,stm32-dcmi-min-frequency:
+    description: DCMI minimum CPUs frequency requirement (in KHz).
+    allOf:
+      - $ref: /schemas/types.yaml#/definitions/uint32
+      - minimum: 0
+      - default: 0
+
 required:
   - compatible
   - reg
@@ -71,6 +78,7 @@ examples:
         clock-names = "mclk";
         dmas = <&dmamux1 75 0x400 0x0d>;
         dma-names = "tx";
+        st,stm32-dcmi-min-frequency = <650000>;
 
         port {
              dcmi_0: endpoint {
-- 
2.15.0

