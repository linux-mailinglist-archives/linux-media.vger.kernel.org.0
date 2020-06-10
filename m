Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F060E1F54A7
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2020 14:25:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729020AbgFJMZX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 10 Jun 2020 08:25:23 -0400
Received: from mx07-00178001.pphosted.com ([62.209.51.94]:49501 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728957AbgFJMZU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 10 Jun 2020 08:25:20 -0400
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 05ACI9fo011911;
        Wed, 10 Jun 2020 14:25:03 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=zLwEj7MqWWxOTNW8GUFQe1h25GWD27n/XUQYErjbCu4=;
 b=T8HZuzc35YFPNmd9RYJdN0RxeUHNbBUfiVbuwcWWUqe+Jl1MQAHpIV2HjmfERUJsi92t
 ZuMAp+gAOXXHJOaH5aRJWd8wN8YxoycXNpk0p5XoV0Uq98dartXq2FlKWb4a6fzYztwb
 5CX4SgDTXB2k3i3m/g1NgKeWYB5fTSJiytFzgF4NQ5Dwz6o/+lCb7idQHYnRR8e03h91
 VvvcPm+i/ZPTA33zrmzddBDHk2gN/ULHzkDMDO7suJxMzFEuzBA48IRhN6nr83no2BZl
 j7SBWBK6EqVKqalc9LK1ADMrDT8MAQclNhQbE8Q4x+iaQMug4YhzvTae5g1DkpvdX/mj SQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 31g0wvw0m6-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 10 Jun 2020 14:25:03 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 99ECE10002A;
        Wed, 10 Jun 2020 14:25:02 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node3.st.com [10.75.127.9])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8256F2106E9;
        Wed, 10 Jun 2020 14:25:02 +0200 (CEST)
Received: from localhost (10.75.127.51) by SFHDAG3NODE3.st.com (10.75.127.9)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2; Wed, 10 Jun 2020 14:25:02
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
Subject: [PATCH v6 0/3] DCMI set minimum cpufreq requirement
Date:   Wed, 10 Jun 2020 14:24:57 +0200
Message-ID: <20200610122500.4304-1-benjamin.gaignard@st.com>
X-Mailer: git-send-email 2.15.0
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG7NODE2.st.com (10.75.127.20) To SFHDAG3NODE3.st.com
 (10.75.127.9)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216,18.0.687
 definitions=2020-06-10_07:2020-06-10,2020-06-10 signatures=0
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This series allow to STM32 camera interface (DCMI) to require a minimum
frequency to the CPUs before start streaming frames from the sensor.
The minimum frequency requirement is provided in the devide-tree node.

Setting a minimum frequency for the CPUs is needed to ensure a quick handling
of the interrupts between two sensor frames and avoid dropping half of them.

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

