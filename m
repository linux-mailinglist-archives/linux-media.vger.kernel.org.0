Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7600B2A6BB6
	for <lists+linux-media@lfdr.de>; Wed,  4 Nov 2020 18:33:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731553AbgKDRcp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 4 Nov 2020 12:32:45 -0500
Received: from mx07-00178001.pphosted.com ([185.132.182.106]:44664 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727006AbgKDRcn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 4 Nov 2020 12:32:43 -0500
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 0A4HWDPo031393;
        Wed, 4 Nov 2020 18:32:26 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=0dGU7EjDFLfbmr+icg3Fbkz2c9T0BmmFtSmomDOPn/8=;
 b=r32wWw0ILSyyemrPcRcdQkBs2p/wHEoF0ErSHQ1Tu3f2H0m8Y0OWsMatCqJET75jaB0y
 7tDQmlKwlW5GpTYWyByfPTz+N7GG7sWq9Wq2D0jCfSMmynFnLU0XyJ6Qoc/73y/BAqOg
 5NjyASLRVEzmaJhRL02F4lJDApMwIqPY3Bv3HdiCgPn8+4VjLd/sbxFYcFevpL288NMf
 1yxcXATEdf98acbeZuiKm+P8zAVNPoYR/dV5DSpo54tzgxQqlvQrQWV+yLVcLOa/Soei
 qqRLqOymu9oKKTiNYNN+Rt5OZ0K+JHT2bhjXQ8hvIUqEgnvx5D1+d2cRt/NA1OzHbcVE nQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 34h00egtyd-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 04 Nov 2020 18:32:26 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7038410002A;
        Wed,  4 Nov 2020 18:32:25 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag1node1.st.com [10.75.127.1])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id F24F5225C2A;
        Wed,  4 Nov 2020 18:32:24 +0100 (CET)
Received: from localhost (10.75.127.47) by SFHDAG1NODE1.st.com (10.75.127.1)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 4 Nov 2020 18:32:24
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
Subject: [PATCH v5 0/4] DCMI BT656 parallel bus mode support
Date:   Wed, 4 Nov 2020 18:32:08 +0100
Message-ID: <1604511132-4014-1-git-send-email-hugues.fruchet@st.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG7NODE1.st.com (10.75.127.19) To SFHDAG1NODE1.st.com
 (10.75.127.1)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312,18.0.737
 definitions=2020-11-04_12:2020-11-04,2020-11-04 signatures=0
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add support of BT656 embedded synchronization bus.
This mode allows to save hardware synchro lines hsync & vsync
by replacing them with synchro codes embedded in data stream.
Add "bus-type" property and make it required so that there is no
ambiguity between parallel mode (bus-type=5) and BT656 mode (bus-type=6).

===========
= history =
===========
version 5:
  - Add revisited bindings and devicetree with explicit use of "bus-type"

version 4:
  - Fix typo in commit message

version 3:
  - Fix bus_width print to %u as per Sakari comment

version 2:
  - As per Sakari remark, revisit commit message and document
    BT656 parallel bus mode in bindings

version 1:
  - Initial submission

Hugues Fruchet (4):
  media: stm32-dcmi: add support of BT656 bus
  media: dt-bindings: media: st,stm32-dcmi: add support of BT656 bus
  ARM: dts: stm32: set bus-type in DCMI endpoint for stm32mp157c-ev1
    board
  ARM: dts: stm32: set bus-type in DCMI endpoint for stm32429i-eval
    board

 .../devicetree/bindings/media/st,stm32-dcmi.yaml   | 38 ++++++++++++++++++++++
 arch/arm/boot/dts/stm32429i-eval.dts               |  1 +
 arch/arm/boot/dts/stm32mp157c-ev1.dts              |  1 +
 drivers/media/platform/stm32/stm32-dcmi.c          | 37 +++++++++++++++++++--
 4 files changed, 75 insertions(+), 2 deletions(-)

-- 
2.7.4

