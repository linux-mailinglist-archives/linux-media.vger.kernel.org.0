Return-Path: <linux-media+bounces-21630-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CA7719D391C
	for <lists+linux-media@lfdr.de>; Wed, 20 Nov 2024 12:06:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 561201F252F7
	for <lists+linux-media@lfdr.de>; Wed, 20 Nov 2024 11:06:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC7261AA783;
	Wed, 20 Nov 2024 11:04:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="EuKa8k0+"
X-Original-To: linux-media@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C6601A3A94;
	Wed, 20 Nov 2024 11:04:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732100672; cv=none; b=LwTo32eXOysTk58QhiG/9YgO5S7tCRjpxzw7+33bYKBkvxtUvuINHVyfvIpDwt3ajxT8XKomlRDUWBLRq4zWmW8nF4eLE0f4+S0/lb2BZi867Xa7cx5BOqLnRpRy7VQAIIVh+sVIibrsQWNz0FQz4eT8Y1p4wzl+8FZxyMNHfPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732100672; c=relaxed/simple;
	bh=c00YpZrOvk8h5EfnVSx/hdWDNSHEG442lrQ5D5CFujY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kGEY5ditcnST5FeuMfUgVISMBOaU5c6AGGyl7b3zjsh9dv8B/LyXaemmCiovP6r6+Qvtz1k/sOj/dHRdySvMnnOt/6GijXSnEU3W66/1IgeoD+3l7FCUovEHLdKeYu+sjscFhNS05R9KViEhkzGyr6/gBU4oJxHqcynleUl8Q98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=EuKa8k0+; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AK8d7jw032500;
	Wed, 20 Nov 2024 12:04:09 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	/Dbvvpr5F1AcVwc5RPbRkCNMcMQ9ZOjtxIpGdKqkWAw=; b=EuKa8k0+0VFa76c3
	qJIa14P2ahIEGKT0qAQQADwp7jdtyjmUMZQoICq1+YQSrqf4ibMHBm9WU1D/3feF
	oaPWDMNPlUBzTfzJRSykeT13w6vktBqSZuqdcuYqPLU30ycri/vKVs+vn5nANtoM
	bCQHuVq0oq9yXXK6dw2pQ8bd0UBi1TQYWKZhifN9stnw82NbrfvLXKhX2RhOa1vN
	plNVCYY2TATMDAyICizBA4RUyP1Jz4mAr/+kWjOIwilmqWi/atRA5MUk08zxS3S+
	9zaJwQIYvHk75AXCjP8xYn+7oSz6o/WKi+vFyQv1GnPwrDo/PpOxJgbzGIsAPPdO
	jotKew==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 42y5u3y765-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 Nov 2024 12:04:09 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 5B4C440076;
	Wed, 20 Nov 2024 12:02:47 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2E26A278711;
	Wed, 20 Nov 2024 12:01:35 +0100 (CET)
Received: from localhost (10.48.86.208) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Wed, 20 Nov
 2024 12:01:34 +0100
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
Subject: [PATCH v2 1/3] media: uapi: add WebP uAPI
Date: Wed, 20 Nov 2024 12:01:03 +0100
Message-ID: <20241120110105.244413-2-hugues.fruchet@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241120110105.244413-1-hugues.fruchet@foss.st.com>
References: <20241120110105.244413-1-hugues.fruchet@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01

This patch adds the WebP picture decoding kernel uAPI.

This design is based on currently available VP8 API implementation and
aims to support the development of WebP stateless video codecs
on Linux.

Signed-off-by: Hugues Fruchet <hugues.fruchet@foss.st.com>
---
 Documentation/userspace-api/media/v4l/biblio.rst  |  9 +++++++++
 .../userspace-api/media/v4l/pixfmt-compressed.rst | 15 +++++++++++++++
 drivers/media/v4l2-core/v4l2-ioctl.c              |  1 +
 include/uapi/linux/videodev2.h                    |  1 +
 4 files changed, 26 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/biblio.rst b/Documentation/userspace-api/media/v4l/biblio.rst
index 35674eeae20d..df3e963fc54f 100644
--- a/Documentation/userspace-api/media/v4l/biblio.rst
+++ b/Documentation/userspace-api/media/v4l/biblio.rst
@@ -447,3 +447,12 @@ AV1
 :title:     AV1 Bitstream & Decoding Process Specification
 
 :author:    Peter de Rivaz, Argon Design Ltd, Jack Haughton, Argon Design Ltd
+
+.. _webp:
+
+WEBP
+====
+
+:title:     WEBP picture Bitstream & Decoding Process Specification
+
+:author:    Google (https://developers.google.com/speed/webp)
diff --git a/Documentation/userspace-api/media/v4l/pixfmt-compressed.rst b/Documentation/userspace-api/media/v4l/pixfmt-compressed.rst
index 806ed73ac474..e664e70b0619 100644
--- a/Documentation/userspace-api/media/v4l/pixfmt-compressed.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-compressed.rst
@@ -169,6 +169,21 @@ Compressed Formats
 	this pixel format. The output buffer must contain the appropriate number
 	of macroblocks to decode a full corresponding frame to the matching
 	capture buffer.
+    * .. _V4L2-PIX-FMT-WEBP-FRAME:
+
+      - ``V4L2_PIX_FMT_WEBP_FRAME``
+      - 'WEBP'
+      - WEBP VP8 parsed frame, excluding WEBP RIFF header, keeping only the VP8
+	bistream including the frame header, as extracted from the container.
+	This format is adapted for stateless video decoders that implement a
+	WEBP pipeline with the :ref:`stateless_decoder`.
+	Metadata associated with the frame to decode is required to be passed
+	through the ``V4L2_CID_STATELESS_VP8_FRAME`` control.
+	See the :ref:`associated Codec Control IDs <v4l2-codec-stateless-vp8>`.
+	Exactly one output and one capture buffer must be provided for use with
+	this pixel format. The output buffer must contain the appropriate number
+	of macroblocks to decode a full corresponding frame to the matching
+	capture buffer.
 
     * .. _V4L2-PIX-FMT-VP9:
 
diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index 0304daa8471d..e2ff03d0d773 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -1501,6 +1501,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
 		case V4L2_PIX_FMT_VC1_ANNEX_L:	descr = "VC-1 (SMPTE 412M Annex L)"; break;
 		case V4L2_PIX_FMT_VP8:		descr = "VP8"; break;
 		case V4L2_PIX_FMT_VP8_FRAME:    descr = "VP8 Frame"; break;
+		case V4L2_PIX_FMT_WEBP_FRAME:    descr = "WEBP VP8 Frame"; break;
 		case V4L2_PIX_FMT_VP9:		descr = "VP9"; break;
 		case V4L2_PIX_FMT_VP9_FRAME:    descr = "VP9 Frame"; break;
 		case V4L2_PIX_FMT_HEVC:		descr = "HEVC"; break; /* aka H.265 */
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index e7c4dce39007..09fff269e852 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -757,6 +757,7 @@ struct v4l2_pix_format {
 #define V4L2_PIX_FMT_VC1_ANNEX_L v4l2_fourcc('V', 'C', '1', 'L') /* SMPTE 421M Annex L compliant stream */
 #define V4L2_PIX_FMT_VP8      v4l2_fourcc('V', 'P', '8', '0') /* VP8 */
 #define V4L2_PIX_FMT_VP8_FRAME v4l2_fourcc('V', 'P', '8', 'F') /* VP8 parsed frame */
+#define V4L2_PIX_FMT_WEBP_FRAME v4l2_fourcc('W', 'B', 'P', 'F') /* WEBP VP8 parsed frame */
 #define V4L2_PIX_FMT_VP9      v4l2_fourcc('V', 'P', '9', '0') /* VP9 */
 #define V4L2_PIX_FMT_VP9_FRAME v4l2_fourcc('V', 'P', '9', 'F') /* VP9 parsed frame */
 #define V4L2_PIX_FMT_HEVC     v4l2_fourcc('H', 'E', 'V', 'C') /* HEVC aka H.265 */
-- 
2.25.1


