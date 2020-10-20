Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 592972938C3
	for <lists+linux-media@lfdr.de>; Tue, 20 Oct 2020 12:03:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405857AbgJTKCr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 20 Oct 2020 06:02:47 -0400
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:37584 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728719AbgJTKCr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 20 Oct 2020 06:02:47 -0400
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 09K9lgqw020208;
        Tue, 20 Oct 2020 12:02:36 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=JsMBxHUR3TyEsbIKx2nG3z57ppPOW5UA7QwvTV532t8=;
 b=kbnNLxlqWbCjkY2Bwk0VDNN5S51L8KJaqAsybrNqqn4MPRN6hweKMm3x/WeIaxeanjY5
 9CF9BDosAefuWyWh5aFekhyECx8mSNReU/0sM/o0C8CZdH/YIAWj7OMxQhMQ6Z6CoIO1
 I337pfElzXt2rOHPv0x2KzvGkyWFweeFm/QaqLqx0PS9qPcKTxfoYL1HmW0p07FgG5LF
 UdAKhZWeD5964qXhZSkxiAZskzAOrCkBefx+AKUL1MFo16v1tAGVwRA3CWOODrYXTBqz
 qHVQEpBTERjNVfu4lKw4kJ96UeRcdtK1Dak9kqR3GiW7gxaHoYXwCnYpYRxZIJDTg22o MA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 347qgg2e16-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 20 Oct 2020 12:02:36 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B8F74100034;
        Tue, 20 Oct 2020 12:02:35 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag1node1.st.com [10.75.127.1])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A1D6A2C41F8;
        Tue, 20 Oct 2020 12:02:35 +0200 (CEST)
Received: from localhost (10.75.127.46) by SFHDAG1NODE1.st.com (10.75.127.1)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 20 Oct 2020 12:02:35
 +0200
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
Subject: [PATCH v3 0/2] DCMI BT656 parallel bus mode support
Date:   Tue, 20 Oct 2020 12:02:30 +0200
Message-ID: <1603188152-22783-1-git-send-email-hugues.fruchet@st.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG1NODE1.st.com
 (10.75.127.1)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-10-20_04:2020-10-20,2020-10-20 signatures=0
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add support of BT656 embedded synchronization bus.
This mode allows to save hardware synchro lines hsync & vsync
by replacing them with synchro codes embedded in data stream.
This mode is enabled when hsync-active & vsync-active
fields are not specified in devicetree.

===========
= history =
===========
version 3:
  - Fix bus_width print to %u as per Sakari comment

version 2:
  - As per Sakari remark, revisit commit message and document
    BT656 parallel bus mode in bindings

version 1:
  - Initial submission

Hugues Fruchet (2):
  media: stm32-dcmi: add support of BT656 bus
  media: dt-bindings: media: st,stm32-dcmi: Add support of BT656

 .../devicetree/bindings/media/st,stm32-dcmi.yaml   | 30 ++++++++++++++++++
 drivers/media/platform/stm32/stm32-dcmi.c          | 37 ++++++++++++++++++++--
 2 files changed, 65 insertions(+), 2 deletions(-)

-- 
2.7.4

