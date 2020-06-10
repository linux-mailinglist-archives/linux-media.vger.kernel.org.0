Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B1B9C1F54A9
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2020 14:25:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728981AbgFJMZU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 10 Jun 2020 08:25:20 -0400
Received: from mx07-00178001.pphosted.com ([62.209.51.94]:3998 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728973AbgFJMZU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 10 Jun 2020 08:25:20 -0400
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 05ACI8aY011853;
        Wed, 10 Jun 2020 14:25:04 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=zWShjHdtkDP9KEzM3tiXokZkb+o6dSeLDNYRf6d3oDE=;
 b=lK9774uvrYbZCJxM/8TyE1xEC0G84Bwoa9/uAW5IojR7iydzTmokegAkuXHbSWfLYDsP
 +Enf1x2pLmDln/EkdQphXrjbaPWSY9iQuUKsV3YCqOLUAJVoXz5F2JQ8RKzPhctOenAy
 HD8kV1tzJtVRPBytgRNKWN4Nwm0DeQUj8DcmMCAE0mYJmWXvaw3fUF2GrTdeDYHrOnux
 wf96AS3Wdzt9Kfg9tHhOWcYiDNd9g0lnSFQuV5vfZjmXKRqu52YXzY8lyx6mr1KmXh44
 NRQDz0SKR8oDyvVF8U5Q4U+OiP+T4aVomn+uRa9tcUnp9wFLwfQq4DpNjiIKRSKqe01p hA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 31g0wvw0m9-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 10 Jun 2020 14:25:04 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id ACD9B10002A;
        Wed, 10 Jun 2020 14:25:03 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node3.st.com [10.75.127.9])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 978802106E9;
        Wed, 10 Jun 2020 14:25:03 +0200 (CEST)
Received: from localhost (10.75.127.49) by SFHDAG3NODE3.st.com (10.75.127.9)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2; Wed, 10 Jun 2020 14:25:03
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
Subject: [PATCH v6 1/3] dt-bindings: media: stm32-dcmi: Add DCMI min frequency property
Date:   Wed, 10 Jun 2020 14:24:58 +0200
Message-ID: <20200610122500.4304-2-benjamin.gaignard@st.com>
X-Mailer: git-send-email 2.15.0
In-Reply-To: <20200610122500.4304-1-benjamin.gaignard@st.com>
References: <20200610122500.4304-1-benjamin.gaignard@st.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG5NODE2.st.com (10.75.127.14) To SFHDAG3NODE3.st.com
 (10.75.127.9)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216,18.0.687
 definitions=2020-06-10_07:2020-06-10,2020-06-10 signatures=0
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

