Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6631B1EF89E
	for <lists+linux-media@lfdr.de>; Fri,  5 Jun 2020 15:06:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726917AbgFENFl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 5 Jun 2020 09:05:41 -0400
Received: from mx07-00178001.pphosted.com ([62.209.51.94]:19996 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726735AbgFENFf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 5 Jun 2020 09:05:35 -0400
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 055D2VRf024213;
        Fri, 5 Jun 2020 15:05:25 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=UV2eXHMfLb4/QtK9KJPbsnZv2k9uIAuEYmQYk8262qk=;
 b=RiKGn1k8pGhuEWzNuWjBbtxEnQzasCQ5waWTwL3TEQcZjYAB1Padx75Qdg+NNyxYxAQl
 5WwG0NMUSFaB0Ky86OgzwTMjTIEDWaUxYkRFNgjCxanSdUg2TA+3ILcPPX19Z+eh7oh5
 RmHDHx8bTXxrGsxJsz4Nm3O65obdvnjmmDc4C2+fhTYdWwpxt3VXG1MHIQxAcJi7P10I
 ipNrHlKoUaBwJoK56WiWXmqkwjrCTaYP/QRC4pFFYtsaggbvWm5+vPXNuqfYAQW2q+KX
 bNn8m/8awz06j3VUBxs83zLlgxSSEFJK2UYp9RG67jHpT+/EW+xFYY6tZpX27BWVsLZK OA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 31fasmbmm8-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 05 Jun 2020 15:05:25 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 372C810002A;
        Fri,  5 Jun 2020 15:05:25 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node3.st.com [10.75.127.9])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 295362C50BE;
        Fri,  5 Jun 2020 15:05:25 +0200 (CEST)
Received: from localhost (10.75.127.47) by SFHDAG3NODE3.st.com (10.75.127.9)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2; Fri, 5 Jun 2020 15:05:24
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
Subject: [PATCH v4 3/3] ARM: dts: stm32: Set DCMI frequency requirement for stm32mp15x
Date:   Fri, 5 Jun 2020 15:05:19 +0200
Message-ID: <20200605130519.4184-4-benjamin.gaignard@st.com>
X-Mailer: git-send-email 2.15.0
In-Reply-To: <20200605130519.4184-1-benjamin.gaignard@st.com>
References: <20200605130519.4184-1-benjamin.gaignard@st.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG5NODE3.st.com (10.75.127.15) To SFHDAG3NODE3.st.com
 (10.75.127.9)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216,18.0.687
 definitions=2020-06-05_04:2020-06-04,2020-06-05 signatures=0
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
index 3ea05ba48215..f6d7bf4f8231 100644
--- a/arch/arm/boot/dts/stm32mp151.dtsi
+++ b/arch/arm/boot/dts/stm32mp151.dtsi
@@ -1091,6 +1091,7 @@
 			clock-names = "mclk";
 			dmas = <&dmamux1 75 0x400 0x0d>;
 			dma-names = "tx";
+			st,stm32-dcmi-min-frequency = <650000>;
 			status = "disabled";
 		};
 
-- 
2.15.0

