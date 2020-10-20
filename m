Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 564C12938FC
	for <lists+linux-media@lfdr.de>; Tue, 20 Oct 2020 12:15:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406004AbgJTKPI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 20 Oct 2020 06:15:08 -0400
Received: from mx07-00178001.pphosted.com ([185.132.182.106]:27132 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1733130AbgJTKPG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 20 Oct 2020 06:15:06 -0400
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 09KAC0Me028116;
        Tue, 20 Oct 2020 12:14:53 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=VlIPvqN556x6We0Z5ZCWHUxsDDwlLtSPq21CGa4llNs=;
 b=bdRMFVb4+TTM+B9gavHUPk0mCPSrOe2Dwqvf7nuaLZKx+wuoiz2HZLeSyIZURrrjIdVM
 Kr/0MmGdFZkXHwb74xmeeCDp4P4cdVzsTRMYe14l21OqeXczkkWFzsmPmGKJoMctk9VG
 CMrbLUhvjvZnw+R48VQyLmp4XqygPbuNxcB22A2l2Qxxo5DNaqf/7V7KObaPIdzaheGP
 +x223WRBFwgoLfL4i8GqSd4MBvmDJQlMpaocuuZpbBa5U0iVle69auFCcus6plCPb8Ap
 SBDO4Z7KwQRlQpFi4lkN34SlW18tPV+aMYx/HmUT9FqdRjON8wLMISgdtgDr+GJRXzox 2Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 347p30j15h-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 20 Oct 2020 12:14:53 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 213EA100038;
        Tue, 20 Oct 2020 12:14:53 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag1node1.st.com [10.75.127.1])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 111AD2C4CC5;
        Tue, 20 Oct 2020 12:14:53 +0200 (CEST)
Received: from localhost (10.75.127.47) by SFHDAG1NODE1.st.com (10.75.127.1)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 20 Oct 2020 12:14:52
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
Subject: [PATCH v4 1/2] media: stm32-dcmi: add support of BT656 bus
Date:   Tue, 20 Oct 2020 12:14:48 +0200
Message-ID: <1603188889-23664-2-git-send-email-hugues.fruchet@st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1603188889-23664-1-git-send-email-hugues.fruchet@st.com>
References: <1603188889-23664-1-git-send-email-hugues.fruchet@st.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG4NODE2.st.com (10.75.127.11) To SFHDAG1NODE1.st.com
 (10.75.127.1)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-10-20_04:2020-10-20,2020-10-20 signatures=0
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add support of BT656 embedded synchronization bus.
This mode allows to save hardware synchro lines hsync & vsync by replacing
them with synchro codes embedded in data stream.
This bus type is only compatible with 8 bits width data bus.
Due to reserved values 0x00 & 0xff used for synchro codes, valid data vary
from 0x1 to 0xfe, this is up to sensor to clip accordingly pixel data. As
a consequence of this clipping, JPEG is not supported with this bus type.
DCMI crop feature is also not available with this bus type.

Signed-off-by: Hugues Fruchet <hugues.fruchet@st.com>
---
 drivers/media/platform/stm32/stm32-dcmi.c | 37 +++++++++++++++++++++++++++++--
 1 file changed, 35 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/stm32/stm32-dcmi.c b/drivers/media/platform/stm32/stm32-dcmi.c
index fd1c41c..7705683 100644
--- a/drivers/media/platform/stm32/stm32-dcmi.c
+++ b/drivers/media/platform/stm32/stm32-dcmi.c
@@ -157,6 +157,7 @@ struct stm32_dcmi {
 	struct vb2_queue		queue;
 
 	struct v4l2_fwnode_bus_parallel	bus;
+	enum v4l2_mbus_type		bus_type;
 	struct completion		complete;
 	struct clk			*mclk;
 	enum state			state;
@@ -777,6 +778,23 @@ static int dcmi_start_streaming(struct vb2_queue *vq, unsigned int count)
 	if (dcmi->bus.flags & V4L2_MBUS_PCLK_SAMPLE_RISING)
 		val |= CR_PCKPOL;
 
+	/*
+	 * BT656 embedded synchronisation bus mode.
+	 *
+	 * Default SAV/EAV mode is supported here with default codes
+	 * SAV=0xff000080 & EAV=0xff00009d.
+	 * With DCMI this means LSC=SAV=0x80 & LEC=EAV=0x9d.
+	 */
+	if (dcmi->bus_type == V4L2_MBUS_BT656) {
+		val |= CR_ESS;
+
+		/* Unmask all codes */
+		reg_write(dcmi->regs, DCMI_ESUR, 0xffffffff);/* FEC:LEC:LSC:FSC */
+
+		/* Trig on LSC=0x80 & LEC=0x9d codes, ignore FSC and FEC */
+		reg_write(dcmi->regs, DCMI_ESCR, 0xff9d80ff);/* FEC:LEC:LSC:FSC */
+	}
+
 	reg_write(dcmi->regs, DCMI_CR, val);
 
 	/* Set crop */
@@ -1067,8 +1085,9 @@ static int dcmi_set_fmt(struct stm32_dcmi *dcmi, struct v4l2_format *f)
 	if (ret)
 		return ret;
 
-	/* Disable crop if JPEG is requested */
-	if (pix->pixelformat == V4L2_PIX_FMT_JPEG)
+	/* Disable crop if JPEG is requested or BT656 bus is selected */
+	if (pix->pixelformat == V4L2_PIX_FMT_JPEG &&
+	    dcmi->bus_type != V4L2_MBUS_BT656)
 		dcmi->do_crop = false;
 
 	/* pix to mbus format */
@@ -1592,6 +1611,11 @@ static int dcmi_formats_init(struct stm32_dcmi *dcmi)
 			if (dcmi_formats[i].mbus_code != mbus_code.code)
 				continue;
 
+			/* Exclude JPEG if BT656 bus is selected */
+			if (dcmi_formats[i].fourcc == V4L2_PIX_FMT_JPEG &&
+			    dcmi->bus_type == V4L2_MBUS_BT656)
+				continue;
+
 			/* Code supported, have we got this fourcc yet? */
 			for (j = 0; j < num_fmts; j++)
 				if (sd_fmts[j]->fourcc ==
@@ -1873,9 +1897,18 @@ static int dcmi_probe(struct platform_device *pdev)
 		dev_err(&pdev->dev, "CSI bus not supported\n");
 		return -ENODEV;
 	}
+
+	if (ep.bus_type == V4L2_MBUS_BT656 &&
+	    ep.bus.parallel.bus_width != 8) {
+		dev_err(&pdev->dev, "BT656 bus conflicts with %u bits bus width (8 bits required)\n",
+			ep.bus.parallel.bus_width);
+		return -ENODEV;
+	}
+
 	dcmi->bus.flags = ep.bus.parallel.flags;
 	dcmi->bus.bus_width = ep.bus.parallel.bus_width;
 	dcmi->bus.data_shift = ep.bus.parallel.data_shift;
+	dcmi->bus_type = ep.bus_type;
 
 	irq = platform_get_irq(pdev, 0);
 	if (irq <= 0)
-- 
2.7.4

