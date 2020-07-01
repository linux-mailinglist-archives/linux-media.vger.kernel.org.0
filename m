Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B6BC3210B85
	for <lists+linux-media@lfdr.de>; Wed,  1 Jul 2020 15:02:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730801AbgGANBp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Jul 2020 09:01:45 -0400
Received: from mx07-00178001.pphosted.com ([62.209.51.94]:25378 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730271AbgGANBm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 1 Jul 2020 09:01:42 -0400
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 061Crs4w021831;
        Wed, 1 Jul 2020 15:01:33 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=BPg1bCVg0walO+NYuFbF25pediBiPKNmiMXAhb/AmP4=;
 b=fZ1ivIvpDVStRCamFjYjcFR539ZUa5+G/VP9wmcClnzVzC6LoZwhKkYzsCSpi2UceGHg
 bSGP9tT8DNR6I+IyZPyiAc53IonWtceDuE+qXixYHmZBI+bIyiwx4ulOmpZeMIYaPxfq
 6ZE7MWQFMPpBX6qqUmviMz2qo3u+MinCnfsJPt2JZIL+aIuNGD5ZODhDUBKZUB/tUqvT
 qKwhAEW5zQNcJjhb1LTLNKRMOahlqgMYbqkz3WeW1A0gcDaFm9A+kN1sfzpGZJoruQcY
 kxwv+84DYCO9fH88i/Eyvhm1S4IGOXiiepjiHFiHQjFwQ+4vAI8vO+zj7ut5tg73h4EJ 7g== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 31wuk1j457-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 01 Jul 2020 15:01:33 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 2971610003A;
        Wed,  1 Jul 2020 15:01:33 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node3.st.com [10.75.127.9])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0FA852B66E2;
        Wed,  1 Jul 2020 15:01:33 +0200 (CEST)
Received: from localhost (10.75.127.49) by SFHDAG3NODE3.st.com (10.75.127.9)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2; Wed, 1 Jul 2020 15:01:32
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
Subject: [PATCH v7 0/3] DCMI set minimum cpufreq requirement
Date:   Wed, 1 Jul 2020 15:01:26 +0200
Message-ID: <20200701130129.30961-1-benjamin.gaignard@st.com>
X-Mailer: git-send-email 2.15.0
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG6NODE3.st.com (10.75.127.18) To SFHDAG3NODE3.st.com
 (10.75.127.9)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-07-01_08:2020-07-01,2020-07-01 signatures=0
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This series allow to STM32 camera interface (DCMI) to require a minimum
frequency to the CPUs before start streaming frames from the sensor.
The minimum frequency requirement is provided in the devide-tree node.

Setting a minimum frequency for the CPUs is needed to ensure a quick handling
of the interrupts between two sensor frames and avoid dropping half of them.

version 7:
- rebase on v5.8-rc3
- add reviewed and ack-by 
- fix test condition 

version 6:
- come back to version 4 and follow Valentin's suggestions about notifier

version 5:
- add a mutex to protect dcmi_irq_notifier_notify()
- register notifier a probe time

version 4:
- simplify irq affinity handling by using only dcmi_irq_notifier_notify() 

version 3:
- add a cpumask field to track boosted CPUs
- add irq_affinity_notify callback
- protect cpumask field with a mutex 

Benjamin Gaignard (3):
  dt-bindings: media: stm32-dcmi: Add DCMI min frequency property
  media: stm32-dcmi: Set minimum cpufreq requirement
  ARM: dts: stm32: Set DCMI frequency requirement for stm32mp15x

 .../devicetree/bindings/media/st,stm32-dcmi.yaml   |   8 ++
 arch/arm/boot/dts/stm32mp151.dtsi                  |   1 +
 drivers/media/platform/stm32/stm32-dcmi.c          | 138 +++++++++++++++++++--
 3 files changed, 139 insertions(+), 8 deletions(-)

-- 
2.15.0

