Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 320557C267
	for <lists+linux-media@lfdr.de>; Wed, 31 Jul 2019 14:57:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387983AbfGaM4r (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 31 Jul 2019 08:56:47 -0400
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:32536 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727090AbfGaM4q (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 31 Jul 2019 08:56:46 -0400
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
        by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x6VCpUJh016802;
        Wed, 31 Jul 2019 14:56:27 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=lcqx0uZw6dlZ+99bC8ZqWM7F55NO2x68BB/LQEBznPQ=;
 b=fC5Mvih1s6e2NHIa7kpJqYmXDYNq5LPcYDGyWs9UN+KhhqsDI8Oaba0sHyd1pCDeDUPV
 bhlDGWDGqrtjuFkX3xtVdbkQHvskitO6AZRDm07MIyIewmctAFvNiY3JhcG3qZ/FSgwk
 Wptqa+Tzqhb8iUz5o9pv5L64GCBFfzQP/v1syJOREnhzsGL3B6qdyW19ikLeHoF9aCOm
 LTrtlOkhmEYvZxWuWgGpgz867OkHPzWWtaQx6VnP02KFIVStB7BxUbABptMEQSHzDAZW
 6z1CxQLaEWqSWYXrZFdw+8+w2CnKuA9GENaeJ+/xDfFHWrAcoq2zsFsUhbXBT6hWowIT KA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx08-00178001.pphosted.com with ESMTP id 2u0bra4m1u-1
        (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
        Wed, 31 Jul 2019 14:56:27 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 168B231;
        Wed, 31 Jul 2019 12:56:26 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas22.st.com [10.75.90.92])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id F3F25CB312;
        Wed, 31 Jul 2019 14:56:25 +0200 (CEST)
Received: from SAFEX1HUBCAS23.st.com (10.75.90.47) by Safex1hubcas22.st.com
 (10.75.90.92) with Microsoft SMTP Server (TLS) id 14.3.439.0; Wed, 31 Jul
 2019 14:56:25 +0200
Received: from localhost (10.201.23.19) by webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Wed, 31 Jul 2019 14:56:25
 +0200
From:   Hugues Fruchet <hugues.fruchet@st.com>
To:     Alexandre Torgue <alexandre.torgue@st.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
CC:     <linux-media@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        Benjamin Gaignard <benjamin.gaignard@linaro.org>,
        Yannick Fertre <yannick.fertre@st.com>,
        Philippe CORNU <philippe.cornu@st.com>,
        "Hugues Fruchet" <hugues.fruchet@st.com>,
        Mickael GUENE <mickael.guene@st.com>
Subject: [PATCH v4 0/3] DCMI bridge support
Date:   Wed, 31 Jul 2019 14:56:20 +0200
Message-ID: <1564577783-18627-1-git-send-email-hugues.fruchet@st.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.201.23.19]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2019-07-31_06:,,
 signatures=0
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patch serie allows to connect non-parallel camera sensor to
DCMI thanks to a bridge connected in between such as STMIPID02 [1].

Media controller support is introduced first, then support of
several sub-devices within pipeline with dynamic linking
between them.
In order to keep backward compatibility with applications
relying on V4L2 interface only, format set on video node
is propagated to all sub-devices connected to camera interface.

[1] https://www.spinics.net/lists/devicetree/msg278002.html

===========
= history =
===========
version 4:
  - Also drop subdev nodes registry as suggested by Hans:
    https://www.spinics.net/lists/arm-kernel/msg743375.html

version 3:
  - Drop media device registry to not expose media controller
    interface to userspace as per Laurent' suggestion:
    https://www.spinics.net/lists/linux-media/msg153417.html
  - Prefer "source" instead of "sensor" and keep it in 
    dcmi_graph_entity struct, move asd as first member
    of struct as per Sakari' suggestion:
    https://www.spinics.net/lists/linux-media/msg153119.html
  - Drop dcmi_graph_deinit() as per Sakari' suggestion:
    https://www.spinics.net/lists/linux-media/msg153417.html

version 2:
  - Fix bus_info not consistent between media and V4L:
    https://www.spinics.net/lists/arm-kernel/msg717676.html
  - Propagation of format set on video node to the sub-devices
    chain connected on camera interface

version 1:
  - Initial submission

Hugues Fruchet (3):
  media: stm32-dcmi: improve sensor subdev naming
  media: stm32-dcmi: add media controller support
  media: stm32-dcmi: add support of several sub-devices

 drivers/media/platform/Kconfig            |   2 +-
 drivers/media/platform/stm32/stm32-dcmi.c | 283 +++++++++++++++++++++++++-----
 2 files changed, 236 insertions(+), 49 deletions(-)

-- 
2.7.4

