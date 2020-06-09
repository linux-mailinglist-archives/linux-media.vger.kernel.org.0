Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6973E1F3A3C
	for <lists+linux-media@lfdr.de>; Tue,  9 Jun 2020 13:59:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729118AbgFIL7A (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 9 Jun 2020 07:59:00 -0400
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:39476 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726395AbgFIL6r (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 9 Jun 2020 07:58:47 -0400
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 059Bqvon011403;
        Tue, 9 Jun 2020 13:58:32 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=UV2eXHMfLb4/QtK9KJPbsnZv2k9uIAuEYmQYk8262qk=;
 b=u1OyNj4wmzH1WqEapVeXG4DIXGN+mCrBe0N901xIQxKR9VXxYP+4ymbwgFnsMH7Hk48+
 NmRP1j2FDl0KNyG88neEcWsP+ZfYZSDUxarwExqv+fbwrYr/W52tmN7NZrBFBVZ3WMKJ
 tErkQjmm+aBVijF0llzKzhjK7pMboE2i0ApVA8uwWQoDpUe4O0QvODlQorcXxIoLAUpl
 gTI7SzFFn16RWnGJqTktIQyBebMUYG3o2ydubbxE2PK5jHRRXaVeQiIBQbgaW3Sdb3hn
 JvnJHC/3ZKdKjKVnx9FPlyqOT2uZtN5atU0iJiOrn0fQaXquX4CDflPpY4p+B2qFMpXL pQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 31g21fy1rx-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 09 Jun 2020 13:58:32 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1072E10002A;
        Tue,  9 Jun 2020 13:58:32 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node3.st.com [10.75.127.9])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 04DF52ACA01;
        Tue,  9 Jun 2020 13:58:32 +0200 (CEST)
Received: from localhost (10.75.127.51) by SFHDAG3NODE3.st.com (10.75.127.9)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2; Tue, 9 Jun 2020 13:58:31
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
Subject: [PATCH v5 3/3] ARM: dts: stm32: Set DCMI frequency requirement for stm32mp15x
Date:   Tue, 9 Jun 2020 13:58:25 +0200
Message-ID: <20200609115825.10748-4-benjamin.gaignard@st.com>
X-Mailer: git-send-email 2.15.0
In-Reply-To: <20200609115825.10748-1-benjamin.gaignard@st.com>
References: <20200609115825.10748-1-benjamin.gaignard@st.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG6NODE1.st.com (10.75.127.16) To SFHDAG3NODE3.st.com
 (10.75.127.9)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216,18.0.687
 definitions=2020-06-09_03:2020-06-09,2020-06-09 signatures=0
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

