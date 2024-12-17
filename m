Return-Path: <linux-media+bounces-23626-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D5599F54E7
	for <lists+linux-media@lfdr.de>; Tue, 17 Dec 2024 18:50:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9F6F8171B54
	for <lists+linux-media@lfdr.de>; Tue, 17 Dec 2024 17:45:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B1721F9EAB;
	Tue, 17 Dec 2024 17:41:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="4Il6JQoG"
X-Original-To: linux-media@vger.kernel.org
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A2E31527B1;
	Tue, 17 Dec 2024 17:41:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.207.212.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734457312; cv=none; b=uQpHS/w6n9NVC4ii7DgYN7zwFrNY8BHAQLWbY3f4BKMNLp2Sem3K7oNXeMseI3FjavPbkdzJFeW3lekh40CmDICa3YYPPDyvo5rCDVK22kfd/Np3CvOTKCVDhC2ZAof0MSdT+8VmkVNC0xAE9s/Q9sot1NyshiTSR1iHYP1i+zg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734457312; c=relaxed/simple;
	bh=y3EATahbm8OVe3B3vCZV++vEa1ywAVvq7bev6SxUrTw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=sn6kIYDzqAjGfT/QWnOaT9F2b/j2dUbnqBaSzM+UQtcAmTBBAZA5yCuHV7Y9STzbtUgnDbAAMYl6zm7nQotTLZxf4j0Nskh0GM2tEaJTLebjeDS5/1KY57Fs6a1oCWv+x7RgGEv6+KUvC50M3ILZrew0okbfrrVko9IS+zfLqCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=4Il6JQoG; arc=none smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BHCvnva000961;
	Tue, 17 Dec 2024 18:41:30 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	1OijE7D/bwZ86UgAtBbLF2m/QNftawfwPt9+VBoGOMA=; b=4Il6JQoG3WY0GlyR
	24B7CWyp3y4xjoxwRFaowF6hCj2OyeWfQsmHOOK60FTtuwgTVuJgvrvz13906Vys
	oF9xvPuBlGC6XTtk/ERGKX1++7LQsRH5J/7UClg93YsUDkn3vgXBqLTPMa41Wvxi
	SaCBKwDq22DdninRj4brMSwYearonpJ0e5bijzKlqypN3558Lls6kkZqgdo/StU+
	29urYt7WF1XYIjW6xgh0weDJ3jIUtwaOmdp7fTwO45Q938g2gok0ESantRv6/aDp
	8XDCgGpOYKKm25rq4GhXmlS17D07HHxcp3KdizasgBpb/n1VQk5/VutcLH+PFLw3
	qPKT7w==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 43k5ngavvg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Dec 2024 18:41:30 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 1F12D4004F;
	Tue, 17 Dec 2024 18:40:22 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 17DE52945CB;
	Tue, 17 Dec 2024 18:39:33 +0100 (CET)
Received: from localhost (10.252.23.235) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Tue, 17 Dec
 2024 18:39:32 +0100
From: Alain Volmat <alain.volmat@foss.st.com>
Date: Tue, 17 Dec 2024 18:39:25 +0100
Subject: [PATCH 8/9] media: stm32: csi: correct unsigned or useless
 variable settings
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241217-csi_dcmipp_mp25_enhancements-v1-8-2b432805d17d@foss.st.com>
References: <20241217-csi_dcmipp_mp25_enhancements-v1-0-2b432805d17d@foss.st.com>
In-Reply-To: <20241217-csi_dcmipp_mp25_enhancements-v1-0-2b432805d17d@foss.st.com>
To: Hugues Fruchet <hugues.fruchet@foss.st.com>,
        Mauro Carvalho Chehab
	<mchehab@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre
 Torgue <alexandre.torgue@foss.st.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <linux-media@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, Alain Volmat <alain.volmat@foss.st.com>
X-Mailer: b4 0.14.1
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01

Correct several missing unsigned type missing for loop variables
and also remove useless initialization of variables.

Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
---
 drivers/media/platform/st/stm32/stm32-csi.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/media/platform/st/stm32/stm32-csi.c b/drivers/media/platform/st/stm32/stm32-csi.c
index 1be12c9dcf55..602b0879f21e 100644
--- a/drivers/media/platform/st/stm32/stm32-csi.c
+++ b/drivers/media/platform/st/stm32/stm32-csi.c
@@ -357,7 +357,7 @@ static inline struct stm32_csi_dev *to_csidev(struct v4l2_subdev *sd)
 static int stm32_csi_setup_lane_merger(struct stm32_csi_dev *csidev)
 {
 	u32 lmcfgr = 0;
-	int i;
+	unsigned int i;
 
 	for (i = 0; i < csidev->num_lanes; i++) {
 		if (!csidev->lanes[i] || csidev->lanes[i] > STM32_CSI_LANES_MAX) {
@@ -595,20 +595,20 @@ static int stm32_csi_start_vc(struct stm32_csi_dev *csidev,
 {
 	struct v4l2_mbus_framefmt *mbus_fmt;
 	const struct stm32_csi_fmts *fmt;
-	u32 cfgr1 = 0;
-	int ret = 0;
 	u32 status;
+	u32 cfgr1;
+	int ret;
 
 	mbus_fmt = v4l2_subdev_state_get_format(state, STM32_CSI_PAD_SOURCE);
 	fmt = stm32_csi_code_to_fmt(mbus_fmt->code);
 
 	/* If the mbus code is JPEG, don't enable filtering */
 	if (mbus_fmt->code == MEDIA_BUS_FMT_JPEG_1X8) {
-		cfgr1 |= STM32_CSI_VCXCFGR1_ALLDT;
+		cfgr1 = STM32_CSI_VCXCFGR1_ALLDT;
 		cfgr1 |= fmt->input_fmt << STM32_CSI_VCXCFGR1_CDTFT_SHIFT;
 		dev_dbg(csidev->dev, "VC%d: enable AllDT mode\n", vc);
 	} else {
-		cfgr1 |= fmt->datatype << STM32_CSI_VCXCFGR1_DT0_SHIFT;
+		cfgr1 = fmt->datatype << STM32_CSI_VCXCFGR1_DT0_SHIFT;
 		cfgr1 |= fmt->input_fmt << STM32_CSI_VCXCFGR1_DT0FT_SHIFT;
 		cfgr1 |= STM32_CSI_VCXCFGR1_DT0EN;
 		dev_dbg(csidev->dev, "VC%d: enable DT0(0x%x)/DT0FT(0x%x)\n",
@@ -634,8 +634,8 @@ static int stm32_csi_start_vc(struct stm32_csi_dev *csidev,
 
 static int stm32_csi_stop_vc(struct stm32_csi_dev *csidev, u32 vc)
 {
-	int ret = 0;
 	u32 status;
+	int ret;
 
 	/* Stop the Virtual Channel */
 	writel_relaxed(STM32_CSI_CR_VCXSTOP(vc) | STM32_CSI_CR_CSIEN,
@@ -714,7 +714,7 @@ static int stm32_csi_enable_streams(struct v4l2_subdev *sd,
 static int stm32_csi_init_state(struct v4l2_subdev *sd,
 				struct v4l2_subdev_state *state)
 {
-	int i;
+	unsigned int i;
 
 	for (i = 0; i < sd->entity.num_pads; i++)
 		*v4l2_subdev_state_get_format(state, i) = fmt_default;
@@ -879,7 +879,8 @@ static irqreturn_t stm32_csi_irq_thread(int irq, void *arg)
 static int stm32_csi_get_resources(struct stm32_csi_dev *csidev,
 				   struct platform_device *pdev)
 {
-	int irq, ret, i;
+	unsigned int i;
+	int irq, ret;
 
 	csidev->base = devm_platform_get_and_ioremap_resource(pdev, 0, NULL);
 	if (IS_ERR(csidev->base))

-- 
2.34.1


