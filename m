Return-Path: <linux-media+bounces-20871-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C7439BC76F
	for <lists+linux-media@lfdr.de>; Tue,  5 Nov 2024 08:53:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AF00A1C222A2
	for <lists+linux-media@lfdr.de>; Tue,  5 Nov 2024 07:53:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 253451FF7A1;
	Tue,  5 Nov 2024 07:52:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="M480Qcui"
X-Original-To: linux-media@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D73A31FF058;
	Tue,  5 Nov 2024 07:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730793132; cv=none; b=Ww5Mk6Wp6hxZFxeRUE8xAwxtkc1fkcCstE0Zm56hDtoUYL0ypfye0Glm362YTHq9QGn81g35Hnm4gj4dNSGkgypnPphMbx+Ky1bBBrIgA5TcwXPKvk5D36fK5I/ma2ZQUOyZdEoytJSc9M5I9upT++/q9ki0vJDdzeF9JerY/T8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730793132; c=relaxed/simple;
	bh=b4urTh22AIvaqz2EmuC9UlyYLkWnaPQp2f86++BSplA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=DdYZRSLwgVsihhPe0KLLYu/9rikVFrCzIZmmDTvYEL7krgOjLsQu54/fvwm1gA5/z8Qqr9wEdsAGRK35NcLE3gC06QyOR+Qdqw8Bm5G9Jr01WuvOM4I/YzgYHD9jtmuLfoxhJihfuHJUIN017XF0hSIoiNyadiGv51FUR+9/Gic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=M480Qcui; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A53GSeR022439;
	Tue, 5 Nov 2024 08:51:57 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	Boh51om16/6cUq1DCmo9haIf3b5vZQi+saUvgPu/98Y=; b=M480QcuiNz5z7pQA
	LXJocxUpAq5ZgtUAwLy8QkxMolyCxe02Ar4CZMgwmCSJgXbqmLNccXCwpowO6TZP
	mty4EsT32g2tE3is2pQv56E1X9n9kG+bHbjkJC+cJnHSnbOBDBWvy3YzXveZ8W0B
	uyzhY/Hp4N3VqVo72bFly3+s7AoM+EoPEVr2V+mrTgPn9j2j6Ig0kPqKDFwntbJ4
	AI4idtYgtjfaNZrX6SgHZu1LE2gUd1eDqxyYQoMT2kmkYpgn/zjnZgU/rvnGSpN4
	yIQfsQNWR3h6g6gCxVKn27c7o/O4OVeZWDOcH0EyTQm9xDYdeYMBJnG6pxR/L1Mz
	+8IyLQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 42nxh3rnj1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 05 Nov 2024 08:51:57 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id CBF384004F;
	Tue,  5 Nov 2024 08:50:22 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 026A62504FA;
	Tue,  5 Nov 2024 08:49:31 +0100 (CET)
Received: from localhost (10.129.178.213) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Tue, 5 Nov
 2024 08:49:30 +0100
From: Alain Volmat <alain.volmat@foss.st.com>
Date: Tue, 5 Nov 2024 08:49:07 +0100
Subject: [PATCH v2 04/15] media: stm32: dcmipp: use
 v4l2_subdev_is_streaming
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241105-csi_dcmipp_mp25-v2-4-b9fc8a7273c2@foss.st.com>
References: <20241105-csi_dcmipp_mp25-v2-0-b9fc8a7273c2@foss.st.com>
In-Reply-To: <20241105-csi_dcmipp_mp25-v2-0-b9fc8a7273c2@foss.st.com>
To: Hugues Fruchet <hugues.fruchet@foss.st.com>,
        Mauro Carvalho Chehab
	<mchehab@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre
 Torgue <alexandre.torgue@foss.st.com>,
        Hans Verkuil
	<hverkuil-cisco@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Rob
 Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor
 Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
CC: <linux-media@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, Alain Volmat <alain.volmat@foss.st.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01

Rely on v4l2_subdev_is_streaming in order to know if the subdev
is streaming or not instead of relying on a local variable.

Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
---
 drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c | 6 +-----
 drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-parallel.c | 5 +----
 2 files changed, 2 insertions(+), 9 deletions(-)

diff --git a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c
index 5a361ad6b0234c5de03c12b0b7b9d428eae63c06..50500112eab9a7b10a0c5e29773e31ded1a66628 100644
--- a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c
+++ b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c
@@ -78,7 +78,6 @@ struct dcmipp_byteproc_device {
 	struct v4l2_subdev sd;
 	struct device *dev;
 	void __iomem *regs;
-	bool streaming;
 };
 
 static const struct v4l2_mbus_framefmt fmt_default = {
@@ -239,11 +238,10 @@ static int dcmipp_byteproc_set_fmt(struct v4l2_subdev *sd,
 				   struct v4l2_subdev_state *sd_state,
 				   struct v4l2_subdev_format *fmt)
 {
-	struct dcmipp_byteproc_device *byteproc = v4l2_get_subdevdata(sd);
 	struct v4l2_mbus_framefmt *mf;
 	struct v4l2_rect *crop, *compose;
 
-	if (byteproc->streaming)
+	if (v4l2_subdev_is_streaming(sd))
 		return -EBUSY;
 
 	mf = v4l2_subdev_state_get_format(sd_state, fmt->pad);
@@ -495,8 +493,6 @@ static int dcmipp_byteproc_s_stream(struct v4l2_subdev *sd, int enable)
 		}
 	}
 
-	byteproc->streaming = enable;
-
 	return 0;
 }
 
diff --git a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-parallel.c b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-parallel.c
index 62c5c3331cfecdf5fcf0a5d20b4051b1b024968e..05e8897ae37a4b6c8e16c066e83ff5b1d1e07635 100644
--- a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-parallel.c
+++ b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-parallel.c
@@ -129,7 +129,6 @@ struct dcmipp_par_device {
 	struct v4l2_subdev sd;
 	struct device *dev;
 	void __iomem *regs;
-	bool streaming;
 };
 
 static const struct v4l2_mbus_framefmt fmt_default = {
@@ -230,7 +229,7 @@ static int dcmipp_par_set_fmt(struct v4l2_subdev *sd,
 	struct dcmipp_par_device *par = v4l2_get_subdevdata(sd);
 	struct v4l2_mbus_framefmt *mf;
 
-	if (par->streaming)
+	if (v4l2_subdev_is_streaming(sd))
 		return -EBUSY;
 
 	mf = v4l2_subdev_state_get_format(sd_state, fmt->pad);
@@ -370,8 +369,6 @@ static int dcmipp_par_s_stream(struct v4l2_subdev *sd, int enable)
 		reg_clear(par, DCMIPP_PRCR, DCMIPP_PRCR_ENABLE);
 	}
 
-	par->streaming = enable;
-
 	return ret;
 }
 

-- 
2.25.1


