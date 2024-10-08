Return-Path: <linux-media+bounces-19225-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B4C8999469F
	for <lists+linux-media@lfdr.de>; Tue,  8 Oct 2024 13:23:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 360131F22899
	for <lists+linux-media@lfdr.de>; Tue,  8 Oct 2024 11:23:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68A971DE8BD;
	Tue,  8 Oct 2024 11:21:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="rCaAjxNX"
X-Original-To: linux-media@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D263D1D2200;
	Tue,  8 Oct 2024 11:21:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728386498; cv=none; b=E6cTM1PrYp9uLZarQy3OWV/gdlB33usB/UNSgjwsw0x/Qojwyacw8B1tSxi1YYv0aY2oFJwhihAeNcafssIXeXA3kJy+PFtqKghkYZ5q+UkPCDdiSK/WDgt1CwU0MXcDl6n1sZFo9wV2kvKt3yJKKnK9EPiTYTR5zj9MXB3GAr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728386498; c=relaxed/simple;
	bh=XD9uM8l4G2YFDOj2yp3FrGOiS3X4EzCJZb5f6o3aGnc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=THK3nOUm+scOb9NfR5Y7sbGJPgVzTwbvfbh9cWpK7Kcb/71v41eHGOU9NrOySuCrnuMdPqbBiu+lB4v1h4dp86kFQBiEsSUthHJMZmPtQaTO7DGea4ainXpp2D9vYzcYSrViQ0eCCRD56PZxh42IagUZ7wKYPUWTHYqPQyV/BEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=rCaAjxNX; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 498AAvSq018601;
	Tue, 8 Oct 2024 13:21:21 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	eS1Ydz5dJzG64YExvLeeU/gUoCifHif4ti+YMahrQnU=; b=rCaAjxNXcB3ZLUZc
	lE5Vrxs0C+fTZO+AtD8lSKCuYCLp8vowGUXAsGgrCiRjXiOcR4trxGqADUey4OWu
	cXTxncQH9I5praz1tl89kX8FQcYODSkVHsgTYvAG2rltTL3yWTSyXDNg0xl2qCrR
	Epbb5BtmpmcWPMxj75h7k6zRSalfVtoMH7PzwugxxDRrViQaYSUYlP1iWM+Z+Gbh
	fzVpyhE3Fu/LhhQn8wbGM0J94iSxdAZr/mu0kc3CxcBXCm0h87EwsQLOiqC9PyZc
	4mRlCEV5/rVysCaaGBGh5e5KCtoIpm2pQGMLgbL6UtZL+J6P2uQFhDPGwSvzRuCi
	qQbG4w==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 422xs1dykd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 08 Oct 2024 13:21:20 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 2A6BF40049;
	Tue,  8 Oct 2024 13:20:15 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 38C4928518F;
	Tue,  8 Oct 2024 13:18:16 +0200 (CEST)
Received: from localhost (10.129.178.213) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Tue, 8 Oct
 2024 13:18:15 +0200
From: Alain Volmat <alain.volmat@foss.st.com>
Date: Tue, 8 Oct 2024 13:18:06 +0200
Subject: [PATCH 04/15] media: stm32: dcmipp: use v4l2_subdev_is_streaming
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241008-csi_dcmipp_mp25-v1-4-e3fd0ed54b31@foss.st.com>
References: <20241008-csi_dcmipp_mp25-v1-0-e3fd0ed54b31@foss.st.com>
In-Reply-To: <20241008-csi_dcmipp_mp25-v1-0-e3fd0ed54b31@foss.st.com>
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
X-Mailer: b4 0.14.0
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
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
index 5a361ad6b023..50500112eab9 100644
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
index 62c5c3331cfe..05e8897ae37a 100644
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


