Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 243AE1ED016
	for <lists+linux-media@lfdr.de>; Wed,  3 Jun 2020 14:47:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726085AbgFCMq0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 3 Jun 2020 08:46:26 -0400
Received: from mx07-00178001.pphosted.com ([62.209.51.94]:54376 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725930AbgFCMqY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 3 Jun 2020 08:46:24 -0400
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 053CgFPl027817;
        Wed, 3 Jun 2020 14:46:07 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=06CCTkvewu/jxSsDUiCX0HD2+u1UXjX+4+7eKItRPwI=;
 b=v005qU6sSWOiM4is5MalAN+7Rgx/k6eXwR8ETJBDg8D6Y2vunekjf3Y+nz9rUIJdxhxY
 gZ/cX85RZH0ajsYn7n7Qvy3dGp4+xRBwLs+InxtpDXQmY5LIV2ydmM7vzEFqkXVhRNHe
 X08HGEsPbqnpQkW8xZJTQIsjyD/XNlJSlcAh9bawkEWrM9PiAckxcIvHryNYgixz1NdU
 6HShuKof/9TVaYLOdTyUXTv+mSIpnVuNFmwrcg1KaDewaEQodylzspdmVAQjyDYe5ILN
 GTGzhzY1icZPDKZlt2HdYWejYfJHrxNuqeDqakMPCk2g40vh3cHZG3NR3SCBPDO5d4dE Hg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 31bcy0mp7p-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 03 Jun 2020 14:46:07 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id CC2D3100034;
        Wed,  3 Jun 2020 14:46:04 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node3.st.com [10.75.127.9])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 9CA5E2CB379;
        Wed,  3 Jun 2020 14:46:04 +0200 (CEST)
Received: from localhost (10.75.127.47) by SFHDAG3NODE3.st.com (10.75.127.9)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2; Wed, 3 Jun 2020 14:46:03
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
Subject: [PATCH v2 0/3] DCMI set minimum cpufreq requirement
Date:   Wed, 3 Jun 2020 14:45:56 +0200
Message-ID: <20200603124559.22652-1-benjamin.gaignard@st.com>
X-Mailer: git-send-email 2.15.0
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG3NODE3.st.com
 (10.75.127.9)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216,18.0.687
 definitions=2020-06-03_12:2020-06-02,2020-06-03 signatures=0
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This series allow to STM32 camera interface (DCMI) to require a minimum
frequency to the CPUs before start streaming frames from the sensor.
The minimum frequency requirement is provided in the devide-tree node.

Setting a minimum frequency for the CPUs is needed to ensure a quick handling
of the interrupts between two sensor frames and avoid dropping half of them.

Benjamin Gaignard (3):
  dt-bindings: media: stm32-dcmi: Add DCMI min frequency property
  media: stm32-dcmi: Set minimum cpufreq requirement
  ARM: dts: stm32: Set DCMI frequency requirement for stm32mp15x

 .../devicetree/bindings/media/st,stm32-dcmi.yaml   |  8 ++
 arch/arm/boot/dts/stm32mp151.dtsi                  |  1 +
 drivers/media/platform/stm32/stm32-dcmi.c          | 90 ++++++++++++++++++++--
 3 files changed, 91 insertions(+), 8 deletions(-)

-- 
2.15.0

