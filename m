Return-Path: <linux-media+bounces-18159-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F2E729754C4
	for <lists+linux-media@lfdr.de>; Wed, 11 Sep 2024 15:56:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 54203B24F94
	for <lists+linux-media@lfdr.de>; Wed, 11 Sep 2024 13:56:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C97D11A265E;
	Wed, 11 Sep 2024 13:52:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="xkObBTgK"
X-Original-To: linux-media@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60216184559;
	Wed, 11 Sep 2024 13:52:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726062739; cv=none; b=UIBzUvdNZDODzouQys9f/BiMSXiQUvJhx2U/2W6ZriClkc4L6YQCU2SALHN4oce8aRxMCp2ZTXmdkpuoxLxbUTHDPDH4gtEEfEdd3inhjaHqSstFPyhw//BZ55H6ElBxyP7Kvg44ff+m3hTnrg08hVyBWxB3ohHLuUy/qa7WUcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726062739; c=relaxed/simple;
	bh=w7YZZ7M2J1qwRQNpxWASohH6Da7AAxMcg7SUuO9d6x8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZJM2nHzWDuj1HoNByfnkjG/quwKWXKvUL3qt3OdUXauDEXBfe6qnxgD64Jc2FpQl/c62g0yqPX8ZAA5WGJo541pDmy7B+tRXnhfX2uDR9QJyjMZYW4twQuqATgX+r1neo5M5axYvOUTz+lY4n0ANSgGE2Ha1QN3G8yJcmg4elQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=xkObBTgK; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48B8oOqa007343;
	Wed, 11 Sep 2024 15:51:37 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	14gR+MCsBOivysdEUAEkA0MzfErSkPe5fIcIjROePWs=; b=xkObBTgKLxefMuuu
	yeOsvcerwQVyrZ15rJiZAUvLc0A8KLaJ9DeCsnvtc8BLjZlXzz90XLH0sadv1EZ5
	nQgSufU8nnKONbBqGZ9xtGFiRdPAx5DmuHrzyeW1/E3NDdE8JiV36WDZXXb/hbuT
	KUk+4JCrQCa5+a5aC9xmn/cBYah+4E2af64hQ5cEGRElcWP8KlqDOiU/7Qwo5Yjw
	eNq7ycx+Z/sddWQlTpq8Uj/JHwBEjAztESdTtaZ0a/QHIOBYxh6aDmmsTB1MG8+/
	1vMnI33aDJy2sEX2udOaMf44+4GBOayvJB5TLC1qF7Bw0tO0FYsGsDKEpdtfQpRL
	jVOE4w==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 41gyeh7d6w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Sep 2024 15:51:37 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 0F1924004C;
	Wed, 11 Sep 2024 15:50:14 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 81FC5231534;
	Wed, 11 Sep 2024 15:50:14 +0200 (CEST)
Received: from localhost (10.48.86.208) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Wed, 11 Sep
 2024 15:50:14 +0200
From: Hugues Fruchet <hugues.fruchet@foss.st.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Ezequiel Garcia
	<ezequiel@vanguardiasur.com.ar>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Hans
 Verkuil <hverkuil-cisco@xs4all.nl>,
        Fritz Koenig <frkoenig@chromium.org>,
        Sebastian Fricke <sebastian.fricke@collabora.com>,
        Daniel Almeida
	<daniel.almeida@collabora.com>,
        Andrzej Pietrasiewicz
	<andrzej.p@collabora.com>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-rockchip@lists.infradead.org>,
        <linux-stm32@st-md-mailman.stormreply.com>
CC: Hugues Fruchet <hugues.fruchet@foss.st.com>
Subject: [PATCH 1/2] media: uapi: add WebP VP8 frame flag
Date: Wed, 11 Sep 2024 15:50:10 +0200
Message-ID: <20240911135011.161217-2-hugues.fruchet@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240911135011.161217-1-hugues.fruchet@foss.st.com>
References: <20240911135011.161217-1-hugues.fruchet@foss.st.com>
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

Add a flag indicating that VP8 bitstream is a WebP picture.

Signed-off-by: Hugues Fruchet <hugues.fruchet@foss.st.com>
---
 .../userspace-api/media/v4l/ext-ctrls-codec-stateless.rst      | 3 +++
 include/uapi/linux/v4l2-controls.h                             | 1 +
 2 files changed, 4 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec-stateless.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec-stateless.rst
index 0da635691fdc..bb08aacddc9c 100644
--- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec-stateless.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec-stateless.rst
@@ -1062,6 +1062,9 @@ FWHT Flags
     * - ``V4L2_VP8_FRAME_FLAG_SIGN_BIAS_ALT``
       - 0x20
       - Sign of motion vectors when the alt frame is referenced.
+    * - ``V4L2_VP8_FRAME_FLAG_WEBP``
+      - 0x40
+      - Indicates that this frame is a WebP picture.
 
 .. c:type:: v4l2_vp8_entropy_coder_state
 
diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
index 974fd254e573..e41b62f2cb2b 100644
--- a/include/uapi/linux/v4l2-controls.h
+++ b/include/uapi/linux/v4l2-controls.h
@@ -1897,6 +1897,7 @@ struct v4l2_vp8_entropy_coder_state {
 #define V4L2_VP8_FRAME_FLAG_MB_NO_SKIP_COEFF	0x08
 #define V4L2_VP8_FRAME_FLAG_SIGN_BIAS_GOLDEN	0x10
 #define V4L2_VP8_FRAME_FLAG_SIGN_BIAS_ALT	0x20
+#define V4L2_VP8_FRAME_FLAG_WEBP		0x40
 
 #define V4L2_VP8_FRAME_IS_KEY_FRAME(hdr) \
 	(!!((hdr)->flags & V4L2_VP8_FRAME_FLAG_KEY_FRAME))
-- 
2.25.1


