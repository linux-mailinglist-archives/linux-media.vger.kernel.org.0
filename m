Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7202F28632F
	for <lists+linux-media@lfdr.de>; Wed,  7 Oct 2020 18:06:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728979AbgJGQGE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Oct 2020 12:06:04 -0400
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:49540 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728177AbgJGQGD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 7 Oct 2020 12:06:03 -0400
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 097Fprpj028954;
        Wed, 7 Oct 2020 18:05:55 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=AMt0mdBSuzkiudzNdejXkVPMDzES74v23TlSkvD5yGA=;
 b=EjvhFnOer2kuZB5HcDFz6In7XD7IcVzIcKyoPKNPRZcbYTYuO882kR3pa5N+2d1lz3xY
 M1lgloOTvqaazW1mQ2Z/tLMVBK3v1Xum6TbReapQvXFba5mPNVtgtftC9I7+j5F1Lhqa
 2kr5W/DM5jjmj0eR7mVtgQq4bWD2W7pVV+U7Q/mgF4ptmQYh9sLBCnoVKhYDWV54Isia
 sAlfGRmygekPw0bme8wm9ii83XVFNPg/EUs5fyWYAtmMUe/QFOPklWHTPpuUN6crsxzc
 BL4ntExCVvRnBwSbJSCtkL06VumB0diHRCExnXWVGEcwlSm2kXbiY3FJYaLAusyowWaP 7A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 3402tk5ums-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 07 Oct 2020 18:05:55 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 6CDD710002A;
        Wed,  7 Oct 2020 18:05:55 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag1node1.st.com [10.75.127.1])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 57B9D2BA2C7;
        Wed,  7 Oct 2020 18:05:55 +0200 (CEST)
Received: from localhost (10.75.127.46) by SFHDAG1NODE1.st.com (10.75.127.1)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 7 Oct 2020 18:05:54
 +0200
From:   Hugues Fruchet <hugues.fruchet@st.com>
To:     Alexandre Torgue <alexandre.torgue@st.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>
CC:     <linux-media@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        Alain Volmat <alain.volmat@st.com>,
        Yannick Fertre <yannick.fertre@st.com>,
        Philippe CORNU <philippe.cornu@st.com>,
        Hugues Fruchet <hugues.fruchet@st.com>
Subject: [PATCH] media: stm32-dcmi: remove deprecated dmaengine_terminate_all()
Date:   Wed, 7 Oct 2020 18:05:52 +0200
Message-ID: <1602086752-8987-1-git-send-email-hugues.fruchet@st.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG3NODE3.st.com (10.75.127.9) To SFHDAG1NODE1.st.com
 (10.75.127.1)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-10-07_10:2020-10-06,2020-10-07 signatures=0
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Replace dmaengine_terminate_all() by dmaengine_terminate_sync()
to ensure that all pending dma operations are really finished.
This is not ensured by dmaengine_terminate_all() and this API
is deprecated, so better to use the _sync() variant.

Signed-off-by: Hugues Fruchet <hugues.fruchet@st.com>
Reviewed-by: Philippe CORNU <philippe.cornu@st.com>
---
 drivers/media/platform/stm32/stm32-dcmi.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/stm32/stm32-dcmi.c b/drivers/media/platform/stm32/stm32-dcmi.c
index fd1c41c..3283337 100644
--- a/drivers/media/platform/stm32/stm32-dcmi.c
+++ b/drivers/media/platform/stm32/stm32-dcmi.c
@@ -324,7 +324,7 @@ static int dcmi_start_dma(struct stm32_dcmi *dcmi,
 	}
 
 	/*
-	 * Avoid call of dmaengine_terminate_all() between
+	 * Avoid call of dmaengine_terminate_sync() between
 	 * dmaengine_prep_slave_single() and dmaengine_submit()
 	 * by locking the whole DMA submission sequence
 	 */
@@ -438,7 +438,7 @@ static void dcmi_process_jpeg(struct stm32_dcmi *dcmi)
 	}
 
 	/* Abort DMA operation */
-	dmaengine_terminate_all(dcmi->dma_chan);
+	dmaengine_terminate_sync(dcmi->dma_chan);
 
 	/* Restart capture */
 	if (dcmi_restart_capture(dcmi))
@@ -882,7 +882,7 @@ static void dcmi_stop_streaming(struct vb2_queue *vq)
 
 	/* Stop all pending DMA operations */
 	mutex_lock(&dcmi->dma_lock);
-	dmaengine_terminate_all(dcmi->dma_chan);
+	dmaengine_terminate_sync(dcmi->dma_chan);
 	mutex_unlock(&dcmi->dma_lock);
 
 	pm_runtime_put(dcmi->dev);
-- 
2.7.4

