Return-Path: <linux-media+bounces-18762-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 62F8E989B58
	for <lists+linux-media@lfdr.de>; Mon, 30 Sep 2024 09:24:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 12BDB1F21E7C
	for <lists+linux-media@lfdr.de>; Mon, 30 Sep 2024 07:24:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C84EF156C6C;
	Mon, 30 Sep 2024 07:24:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="tnJNQ0YZ"
X-Original-To: linux-media@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77437155398;
	Mon, 30 Sep 2024 07:24:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.207.212.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727681051; cv=none; b=go3l19jhxhyMBbkzC0xygdLja3udPCK+BI1bDzIC3tvKhMBX+JABzfAxlCQwOXJ/khQe3VXUpIxKnr8SCZW/eaFwMFR1/l0VHPYmbXIVkz8AlfjzMHkSftFwABDiY7/GZ4VHEBe+laHYjVU4M00yELPSpoDYIc86hVsOO8lafMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727681051; c=relaxed/simple;
	bh=KPkdZJR4jn1ve9SjvvpCS5e1jcq1I2+AXyH4rJBjMZg=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=CWQxe3FOlvr+eMPM2gnJS/b1jK6HEWsFqMRP27VB2isbnP5i5Z2jotGyoZtpXpe+yUMTc9+6GZxx+BxMLa+IEOPUYAnI8XcqPRScY6rV57UWmbSteO8HB8biXipbc7C8zQ1OyYV2DQ85JE/WjQt7CbOaFPuUnDaS5EOX+MnpgbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=tnJNQ0YZ; arc=none smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48U65xMf003251;
	Mon, 30 Sep 2024 08:54:11 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=selector1; bh=TupV0Brvfq7wiAHvg+5/zM
	piO80TJ5UsN6TLmJdrXA4=; b=tnJNQ0YZlzt0H+nEMtYXomrJyE4l2AeAnTyE3f
	Txqdeg+XtakWIQR9blEQ4Y6cswEXvlErW5vHanVlJDPFmen3FZS/d0mTh9aRYVJR
	nGYcW/96A6XughTYkzk2RS28MuJgDxepvZpay5oaDQ4ZP4HrVeDS2slYiAx39m1b
	SSeRNqHX68N8e5QW6Skjbtmog3YXs1V/v4cL7KK770vRuYlhUf9JY6CdGpYXoaJg
	ziagQ9CEc9EPHbRP8emJ91hMT2e3k5I9p2dPDhxRQyGdLoZTvm1wJHacoq6wrtMP
	E5qAFp2mqOD/eSCkhuPaTtv4jxLDxK5WpTbgPgbA4GK7Qrdg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 41x8pc6g8d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 30 Sep 2024 08:54:11 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id B1B4840057;
	Mon, 30 Sep 2024 08:53:14 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0431424BCB1;
	Mon, 30 Sep 2024 08:51:43 +0200 (CEST)
Received: from localhost (10.129.178.213) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Mon, 30 Sep
 2024 08:51:42 +0200
From: Alain Volmat <alain.volmat@foss.st.com>
To: Alain Volmat <alain.volmat@foss.st.com>,
        Sakari Ailus
	<sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
CC: <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] media: i2c: gc2145: introduce enable/disable_streams ops
Date: Mon, 30 Sep 2024 08:51:38 +0200
Message-ID: <20240930065139.1490217-1-alain.volmat@foss.st.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01

Introduce enable_streams and disable_streams pad ops and
replace s_stream with the v4l2_subdev_s_stream_helper
function.

Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
---
 drivers/media/i2c/gc2145.c | 31 +++++++++++--------------------
 1 file changed, 11 insertions(+), 20 deletions(-)

diff --git a/drivers/media/i2c/gc2145.c b/drivers/media/i2c/gc2145.c
index 667bb756d056..ab3c086c3ad6 100644
--- a/drivers/media/i2c/gc2145.c
+++ b/drivers/media/i2c/gc2145.c
@@ -899,9 +899,11 @@ static int gc2145_config_mipi_mode(struct gc2145 *gc2145,
 	return ret;
 }
 
-static int gc2145_start_streaming(struct gc2145 *gc2145,
-				  struct v4l2_subdev_state *state)
+static int gc2145_enable_streams(struct v4l2_subdev *sd,
+				 struct v4l2_subdev_state *state, u32 pad,
+				 u64 streams_mask)
 {
+	struct gc2145 *gc2145 = to_gc2145(sd);
 	struct i2c_client *client = v4l2_get_subdevdata(&gc2145->sd);
 	const struct gc2145_format *gc2145_format;
 	struct v4l2_mbus_framefmt *fmt;
@@ -967,8 +969,11 @@ static int gc2145_start_streaming(struct gc2145 *gc2145,
 	return ret;
 }
 
-static void gc2145_stop_streaming(struct gc2145 *gc2145)
+static int gc2145_disable_streams(struct v4l2_subdev *sd,
+				  struct v4l2_subdev_state *state, u32 pad,
+				  u64 streams_mask)
 {
+	struct gc2145 *gc2145 = to_gc2145(sd);
 	struct i2c_client *client = v4l2_get_subdevdata(&gc2145->sd);
 	int ret = 0;
 
@@ -983,22 +988,6 @@ static void gc2145_stop_streaming(struct gc2145 *gc2145)
 
 	pm_runtime_mark_last_busy(&client->dev);
 	pm_runtime_put_autosuspend(&client->dev);
-}
-
-static int gc2145_set_stream(struct v4l2_subdev *sd, int enable)
-{
-	struct gc2145 *gc2145 = to_gc2145(sd);
-	struct v4l2_subdev_state *state;
-	int ret = 0;
-
-	state = v4l2_subdev_lock_and_get_active_state(sd);
-
-	if (enable)
-		ret = gc2145_start_streaming(gc2145, state);
-	else
-		gc2145_stop_streaming(gc2145);
-
-	v4l2_subdev_unlock_state(state);
 
 	return ret;
 }
@@ -1129,7 +1118,7 @@ static const struct v4l2_subdev_core_ops gc2145_core_ops = {
 };
 
 static const struct v4l2_subdev_video_ops gc2145_video_ops = {
-	.s_stream = gc2145_set_stream,
+	.s_stream = v4l2_subdev_s_stream_helper,
 };
 
 static const struct v4l2_subdev_pad_ops gc2145_pad_ops = {
@@ -1138,6 +1127,8 @@ static const struct v4l2_subdev_pad_ops gc2145_pad_ops = {
 	.set_fmt = gc2145_set_pad_format,
 	.get_selection = gc2145_get_selection,
 	.enum_frame_size = gc2145_enum_frame_size,
+	.enable_streams = gc2145_enable_streams,
+	.disable_streams = gc2145_disable_streams,
 };
 
 static const struct v4l2_subdev_ops gc2145_subdev_ops = {
-- 
2.25.1


