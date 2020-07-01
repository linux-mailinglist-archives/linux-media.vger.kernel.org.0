Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D67A210B78
	for <lists+linux-media@lfdr.de>; Wed,  1 Jul 2020 15:00:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730761AbgGAM7t (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Jul 2020 08:59:49 -0400
Received: from mx07-00178001.pphosted.com ([62.209.51.94]:52210 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730271AbgGAM7g (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 1 Jul 2020 08:59:36 -0400
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 061CrtBR021936;
        Wed, 1 Jul 2020 14:59:25 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=UV2eXHMfLb4/QtK9KJPbsnZv2k9uIAuEYmQYk8262qk=;
 b=SVBDlIzL6UP1mpGiU53by5ob/zgoX7lxftXv6om9p9jk1D9g1VQuPvUKozAjhPdXHhVE
 Aq0FkyJtbdCZmeCwaSdUg+d0jUyDC1uyitGBLVarJ/IkdrQ/DS7xr+FeHksx41hXnhx5
 S4a+Uz/AT4EAuH6Q9JdmSFViYwcJ6WWnlHzj9kIrxjsv16VZlvR5St5aDtmDVNrS/NsN
 9tEer9FvJhwUIKF/yq1MBBHWGoB61ZSjF8+Pnqrbv0rZOmI/JotwsEcDwAL3SSFFpwuc
 LD3xn4cydo7rTfVVPZel4XkVW7oAQy627u/zMlOrmrgkRGsie/QUv2fwWP/1ZNhCNn7t ng== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 31wuk1j3b5-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 01 Jul 2020 14:59:25 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 3313210002A;
        Wed,  1 Jul 2020 14:59:25 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node3.st.com [10.75.127.9])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 21F7F2B66DE;
        Wed,  1 Jul 2020 14:59:25 +0200 (CEST)
Received: from localhost (10.75.127.49) by SFHDAG3NODE3.st.com (10.75.127.9)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2; Wed, 1 Jul 2020 14:59:24
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
Subject: [PATCH v6 3/3] ARM: dts: stm32: Set DCMI frequency requirement for stm32mp15x
Date:   Wed, 1 Jul 2020 14:59:18 +0200
Message-ID: <20200701125918.30793-4-benjamin.gaignard@st.com>
X-Mailer: git-send-email 2.15.0
In-Reply-To: <20200701125918.30793-1-benjamin.gaignard@st.com>
References: <20200701125918.30793-1-benjamin.gaignard@st.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG8NODE1.st.com (10.75.127.22) To SFHDAG3NODE3.st.com
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

