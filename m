Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9CEDA210B8C
	for <lists+linux-media@lfdr.de>; Wed,  1 Jul 2020 15:02:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730815AbgGANBw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Jul 2020 09:01:52 -0400
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:60898 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1730803AbgGANBr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 1 Jul 2020 09:01:47 -0400
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 061Csp0S018108;
        Wed, 1 Jul 2020 15:01:38 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=eATTJBKFe9xtHFNw51fuR/4wmHzfQ83BFYADbY/lsfQ=;
 b=QmVZm+U8z7ND9/jI1A3A56Ty+xZfhbroo7it7zEOiKlytRMpe7zeLx8poca9OJ7Kr/Hi
 uwe1hpHD1Slc++gJiJZi0LjvHLQF+ehZ7o9Lel3SXXCQNdbXAD5KQWBGOqnJfcwpB6+j
 FeaEGAzwYmReM+HgarCzIS+UJHuq9NxDeqUxruJXY9A04lizlB/ibfokO8PHdy0/z8vq
 rUJiskgdHj4Y4pfORE/d9ZS8GB0IXn4dgQbpmYQ6rn/eQa/Iug3w5F6FQ+OQHqN8DqKR
 T3iC2l01QDWai26G9VOLDSBsNLyAcArGBdPx3ZsH91/v3920DkR+frp7D0aw2z35SMJK Iw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 31ww0ga3jw-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 01 Jul 2020 15:01:38 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B8F00100039;
        Wed,  1 Jul 2020 15:01:36 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node3.st.com [10.75.127.9])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A99EB2B66DF;
        Wed,  1 Jul 2020 15:01:36 +0200 (CEST)
Received: from localhost (10.75.127.51) by SFHDAG3NODE3.st.com (10.75.127.9)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2; Wed, 1 Jul 2020 15:01:35
 +0200
From:   Benjamin Gaignard <benjamin.gaignard@st.com>
To:     <hugues.fruchet@st.com>, <mchehab@kernel.org>,
        <mcoquelin.stm32@gmail.com>, <alexandre.torgue@st.com>,
        <robh+dt@kernel.org>
CC:     <linux-media@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <vincent.guittot@linaro.org>,
        <valentin.schneider@arm.com>, <rjw@rjwysocki.net>,
        <devicetree@vger.kernel.org>,
        Benjamin Gaignard <benjamin.gaignard@st.com>
Subject: [PATCH v7 3/3] ARM: dts: stm32: Set DCMI frequency requirement for stm32mp15x
Date:   Wed, 1 Jul 2020 15:01:29 +0200
Message-ID: <20200701130129.30961-4-benjamin.gaignard@st.com>
X-Mailer: git-send-email 2.15.0
In-Reply-To: <20200701130129.30961-1-benjamin.gaignard@st.com>
References: <20200701130129.30961-1-benjamin.gaignard@st.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG6NODE3.st.com (10.75.127.18) To SFHDAG3NODE3.st.com
 (10.75.127.9)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-07-01_08:2020-07-01,2020-07-01 signatures=0
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Make sure that CPUs will at least run at 650Mhz when streaming
sensor frames.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
---
 arch/arm/boot/dts/stm32mp151.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/stm32mp151.dtsi b/arch/arm/boot/dts/stm32mp151.dtsi
index 36f38a95b4de..b3af20869fa5 100644
--- a/arch/arm/boot/dts/stm32mp151.dtsi
+++ b/arch/arm/boot/dts/stm32mp151.dtsi
@@ -1093,6 +1093,7 @@
 			clock-names = "mclk";
 			dmas = <&dmamux1 75 0x400 0x0d>;
 			dma-names = "tx";
+			st,stm32-dcmi-min-frequency = <650000>;
 			status = "disabled";
 		};
 
-- 
2.15.0

