Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 72DBE2A6BB4
	for <lists+linux-media@lfdr.de>; Wed,  4 Nov 2020 18:33:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731507AbgKDRco (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 4 Nov 2020 12:32:44 -0500
Received: from mx07-00178001.pphosted.com ([185.132.182.106]:1605 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730019AbgKDRco (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 4 Nov 2020 12:32:44 -0500
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 0A4HVs49031157;
        Wed, 4 Nov 2020 18:32:30 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=RD8lxnzr5dJzto5A8fvjT1RmhG9atPIVNFqjK/v2cWg=;
 b=kz8KlySfDguwtPPwhOD30PU3rDNhSV/NXwCtuIhCvppuvER2jeNFvlEb/O3LkXJzQ5P2
 XUhYEiHJpISju4c38waQztEtjQaJGwcUZNCw57UyBRmaT/wI9QAT+T51G5+qB+qlvDZJ
 S1hvucJglJ5p843bJZwT48undVQziDWBI2bIO92/B6abI7Yj8O1hoXrMhqTAs7NgSAd7
 RResEqnt0n7DIDQm7JfZg7sQ+uK99G3S/qfbr6DYRP8klppXd3KxCvfYm8W3B5Rb4Lph
 lIook+BMjh6z8aRAQbNKaDkBkIqyX2lnjOVYZc4w7eCqrZVv6Qx4P24pIXlyryb9xflJ Zg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 34h00egtyr-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 04 Nov 2020 18:32:30 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E007510002A;
        Wed,  4 Nov 2020 18:32:29 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag1node1.st.com [10.75.127.1])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id CD52F225C2A;
        Wed,  4 Nov 2020 18:32:29 +0100 (CET)
Received: from localhost (10.75.127.47) by SFHDAG1NODE1.st.com (10.75.127.1)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 4 Nov 2020 18:32:29
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
Subject: [PATCH v5 4/4] ARM: dts: stm32: set bus-type in DCMI endpoint for stm32429i-eval board
Date:   Wed, 4 Nov 2020 18:32:12 +0100
Message-ID: <1604511132-4014-5-git-send-email-hugues.fruchet@st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1604511132-4014-1-git-send-email-hugues.fruchet@st.com>
References: <1604511132-4014-1-git-send-email-hugues.fruchet@st.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG6NODE2.st.com (10.75.127.17) To SFHDAG1NODE1.st.com
 (10.75.127.1)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312,18.0.737
 definitions=2020-11-04_12:2020-11-04,2020-11-04 signatures=0
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Explicitly set bus-type to parallel mode in DCMI endpoint (bus-type=5).

Signed-off-by: Hugues Fruchet <hugues.fruchet@st.com>
---
 arch/arm/boot/dts/stm32429i-eval.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/stm32429i-eval.dts b/arch/arm/boot/dts/stm32429i-eval.dts
index 67e7648..7e10ae7 100644
--- a/arch/arm/boot/dts/stm32429i-eval.dts
+++ b/arch/arm/boot/dts/stm32429i-eval.dts
@@ -188,6 +188,7 @@
 	port {
 		dcmi_0: endpoint {
 			remote-endpoint = <&ov2640_0>;
+			bus-type = <5>;
 			bus-width = <8>;
 			hsync-active = <0>;
 			vsync-active = <0>;
-- 
2.7.4

