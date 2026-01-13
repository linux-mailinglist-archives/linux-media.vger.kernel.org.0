Return-Path: <linux-media+bounces-50603-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B4310D1B38A
	for <lists+linux-media@lfdr.de>; Tue, 13 Jan 2026 21:34:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DE5C7302D5C4
	for <lists+linux-media@lfdr.de>; Tue, 13 Jan 2026 20:33:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09D8B3126DE;
	Tue, 13 Jan 2026 20:33:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kcxkRxgk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DGMv+6F6"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AFBA28314C
	for <linux-media@vger.kernel.org>; Tue, 13 Jan 2026 20:33:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768336422; cv=none; b=vE892wsD22X+Mwn+W1jHCZ/REXgu+pPgrDPCrcomr1VJMJiU60ZrJEpLBRTCOJuCPj8J+8hZUrVrA7m8xWpjSS4CDxRIMprttuilbeVX951ck+Ac245J8jbcaFlvZQCSkkhrVgaLEHAATYepMAiwh7jFSGaNR/rZ/x7Vx5GN8N0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768336422; c=relaxed/simple;
	bh=0Td/LNDR2RTKrvU2VfyPG8mO1E8oATgnsMCmASdMIb8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=a39do8qU6yhDJRHzyoPRrQHUvvb9am+dHaZ6Dwd1729+CFO7SL5SS2N443Kh9lQM4Tw9mDS7SNPHVQsmx+b1p7DAKxWAheDdGDialkN38qF+utlX+SOYspm9XhjXQpvSEk/NewxEfGqEk3saaJB4v+GENaNuW9EjUMuAOnVgn8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kcxkRxgk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DGMv+6F6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60DG5Hcc1295170
	for <linux-media@vger.kernel.org>; Tue, 13 Jan 2026 20:33:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8Oks4Lx3iH0CoTRTkj5T3bSc++Pq4Nk/yi1DSprS+Tk=; b=kcxkRxgk5no0fX7V
	BQpesOXUEhI8Qu/6NVzDeV4bmERmjwUdjrZcVHXU83QWHKKARI0/BXhlrLCZUYTH
	amesiugM0cqMkQuvTlOMnhVyAxGYx/ded0E09gPFX/NLUJljpluxNBcbXx6+86ks
	Fc2HIstqoGnwo7YFTOhFx62G7fQtiQQNr30CH7V1uHp1NxRG+mRWqu06/iXAr5qJ
	nIqgFRsaHxVQcq0lBIHAEpMsYLZ6Co/p5iWrc7KMes7D9zlv07hfQNP+Ll354C+P
	pJdkBEqn2xamJPNGj+0HLHk/hxs2vIHjhuX9D8ekw3Y0riS6989kdPnqmtIBKSDi
	nE/YDw==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bns8v0v94-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 13 Jan 2026 20:33:38 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-12334eccc8eso57072c88.3
        for <linux-media@vger.kernel.org>; Tue, 13 Jan 2026 12:33:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768336418; x=1768941218; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8Oks4Lx3iH0CoTRTkj5T3bSc++Pq4Nk/yi1DSprS+Tk=;
        b=DGMv+6F6ZLzYlTSZ8HbYtYmGkgbgw6up1VCWn69LcfzH9yoe0P1EC4GlYcegrrT6uw
         M8zU1Nqi1QJaoSe5DtTqMYTDB/J9gd/AKn0jwT+GuU+eF9bdXkyKEfjQzkP3LhPsYeza
         by/AZ0OMysYfHbDTL0cOY1XaAmHRnj/0npAUcFmIsv6TCpPx3G6Zg853XLIuHx0PuCLq
         fVzimtKiIuy63Ce0lYc3qx17QRjYwcl0myw3xamh9/XZSIhxNzKFkr8b/NUvILOnOxSC
         b0uwVJ+efBuhgOT3SyDu6Em5O/Ph1OVB7DC8v7RvnWb+j2No53hszkgpgqnyI3ZGxilf
         UAtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768336418; x=1768941218;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8Oks4Lx3iH0CoTRTkj5T3bSc++Pq4Nk/yi1DSprS+Tk=;
        b=vTpidOclCL4ADHsHsj4haNvjNCSz6MrQGYwjMSfl2NeseYWMiE9YY6ku7stH4bOeLr
         VvyMFsowecU58TW7Mktg1BprBzpKifvUoJWPk7LYqJ2NIjwabJll5QgZeyqKxgZ39MEn
         k4i8rgF+s0+DTa7teQ7YjVcqHjtgtdgQyBCEPTwCH54A40M61qG3Kid264DNm3Kax8jW
         Qc3QCouQA6U0OtLCqr5pNbRLWZmxTmewbnT11db1ycFxZ15tMoQuDHp2gLEeJIX9nEQ8
         4LBw+jEmZ2Gfoqy7vgNBjlw9x9OxvT2pD6vXaT27rJM/SbqVDllSh70GQvqyG+L8G6Y8
         DYOg==
X-Gm-Message-State: AOJu0YznzyhS/EGRdmawC2MgQ+YOi899w5dJ0WvCD5/IlVpry0xi6foI
	iWclWXcB57HXCcLi8zjseJSYSXFKJ8Bt1+fk5gweDOkmbOPsQnWYf/d2/28q1rtatVSXtztjHey
	SbGqcL+YN5eZdn7ECloZYbLaM90RoGHh08ONGHraHi+ej/qCu+FUV4CblMKQy2c41jQ==
X-Gm-Gg: AY/fxX4DQ/HGucq1A5gpmAxMsk2Pxwug/KahU3MgABrFFEJB+wQ07jS5UBCT7TrDVDN
	k2ZPXX/SHPzynqiXLuJqTx99u20Cvv3sckdvxaA8LkjMrSVcSL+Zu4/ge6xJYFk7wVo0asUA/fu
	asiWBHEXPvU41qZZSZnIfWt4tDIuNfdc7uoxu5xNYIZcvHRRKYZZqrZhoavIl2ytiN0Cz9hlNGZ
	CTmpjU9e7kiYQvDOrRN/+KwDgvhMFVwMnihNsezDYpit3YZFatc1oujRptWukmFaXyi6B0m0TjA
	vzzx5BTnnvpBI9BQl3mL8kG1sDi9o1k6CDFgZ3at9Abrm+uo8JsDdr2RJkZh7aTwXzPaI4Sa8cq
	ma7pR8TBjYFg8gntZrm5RoSI8RC1HHmcUN/OF9aNOx1kW9uVoLFSTm5G4oTO5sHwVocoesw==
X-Received: by 2002:a05:7300:a28b:b0:2b0:4e90:7755 with SMTP id 5a478bee46e88-2b4873215abmr121776eec.8.1768336417934;
        Tue, 13 Jan 2026 12:33:37 -0800 (PST)
X-Received: by 2002:a05:7300:a28b:b0:2b0:4e90:7755 with SMTP id 5a478bee46e88-2b4873215abmr121757eec.8.1768336417361;
        Tue, 13 Jan 2026 12:33:37 -0800 (PST)
Received: from gu-dmadival-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b170673bc0sm19157897eec.5.2026.01.13.12.33.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 12:33:37 -0800 (PST)
From: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
Date: Tue, 13 Jan 2026 12:33:32 -0800
Subject: [RFC PATCH 1/3] media: uapi: Introduce new control for video
 encoder ROI
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260113-iris_enc_roi-v1-1-6c86eba38587@oss.qualcomm.com>
References: <20260113-iris_enc_roi-v1-0-6c86eba38587@oss.qualcomm.com>
In-Reply-To: <20260113-iris_enc_roi-v1-0-6c86eba38587@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768336416; l=4374;
 i=deepa.madivalara@oss.qualcomm.com; s=20250814; h=from:subject:message-id;
 bh=0Td/LNDR2RTKrvU2VfyPG8mO1E8oATgnsMCmASdMIb8=;
 b=ENymqkOPbznuQvfaGVxFX6x4RlaPuM9sEHqQEXbTypnU1CQw9+JJ0uzJc9e1WCBifYMbZdrGB
 SNh9dPwxZfQD5GJnf3+CNKnJg9YWnOrDgoXJ/8iIO7a5dp+eEWmeYyy
X-Developer-Key: i=deepa.madivalara@oss.qualcomm.com; a=ed25519;
 pk=MOEXgyokievn+bgpHdS6Ixh/KQYyS90z2mqIbQ822FQ=
X-Authority-Analysis: v=2.4 cv=aY5sXBot c=1 sm=1 tr=0 ts=6966ac23 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=1tTGy1hlu4sAMEPmmk4A:9
 a=QEXdDO2ut3YA:10 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-ORIG-GUID: -UjhxzRK9HTudXfB9K0XTJxQTTSy8fnr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDE2OCBTYWx0ZWRfXweKLXgJpr9bJ
 AsRHeX8CmCBUebgR3ohI6LcIPqwpNF7MiSEc4vqxUp6ZoloeATjuYwChUsDpAwu/QhTAcgIr7vG
 jTCybS4Apxx7Khk3K3LapMmuHopI2sGZgEUtRqD4U4m3Ry8NWQ+p5rA6/x5fr1W6A4sq5Nr3j/z
 5dWzRNE43C320SzU9/bVnj+aHaTEwqM40+lJqQO7Phf8534Ej6CGru2v9ornFl4GLQDxyEI8qkP
 nC8IEqmJwokxtOeMYLERYWreQacUl2+XN9oSxFpUxvRSjLt22pWVVxFf1LfbZIyKKpoSsHU8CPg
 ON3eaepxBZ8+7VAXUDt5bbFMMdbp5s7NQZU1o8rUA8NSq+4O3qTSKaCJdepMWASp+uyLhWmjSGI
 U82rhCW8ZmzuA0o6aktaD3Uw/eWNtvJykC6xHnRv0m7+6GDJszV9vOxkAMA3psbgciCFyGlKt8u
 rPwkL9NcfoQDXlVl7wQ==
X-Proofpoint-GUID: -UjhxzRK9HTudXfB9K0XTJxQTTSy8fnr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_04,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 suspectscore=0 malwarescore=0 bulkscore=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601130168

Add compound control, V4L2_CID_MPEG_VIDEO_ENC_ROI, for
video encoder Region of Interest to allow applications to specify
different quality levels for specific regions in video frames. Define
struct v4l2_ctrl_enc_roi_params to hold up to 10 rectangular ROI,
regions and their corresponding delta_qp value (v4l2_roi_param)
that adjust quantization relative to the frame's base value.

This enables use cases like prioritizing quality for faces in video
conferencing or important objects in surveillance footage while reducing
bitrate for less critical areas.

Signed-off-by: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
---
 .../userspace-api/media/v4l/ext-ctrls-codec.rst         |  7 +++++++
 include/media/v4l2-ctrls.h                              |  1 +
 include/uapi/linux/v4l2-controls.h                      |  1 +
 include/uapi/linux/videodev2.h                          | 17 +++++++++++++++++
 4 files changed, 26 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
index c8890cb5e00ac05649e6c344c2a6b938b2ec1b24..0eecb46bb356c01411dfc313b92376593bcd86f6 100644
--- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
@@ -1668,6 +1668,13 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type -
     Codecs need to always use the specified range, rather then a HW custom range.
     Applicable to encoders
 
+``V4L2_CID_MPEG_VIDEO_ENC_ROI (struct)``
+    Defines the control id to configure specific delta QP for one or more
+    rectangular regions of interest. The struct v4l2_ctrl_enc_roi_params
+    is defined to hold up to 10 v4l2_rect regions and their corresponding
+    delta_qp with a range of -31 to 30.
+    Applicable to encoders
+
 .. raw:: latex
 
     \normalsize
diff --git a/include/media/v4l2-ctrls.h b/include/media/v4l2-ctrls.h
index 31fc1bee3797bfe532931889188c8f7a9dedad39..c44fad7f51db45a437dd3287aa16830585ac42f3 100644
--- a/include/media/v4l2-ctrls.h
+++ b/include/media/v4l2-ctrls.h
@@ -91,6 +91,7 @@ union v4l2_ctrl_ptr {
 	struct v4l2_ctrl_av1_frame *p_av1_frame;
 	struct v4l2_ctrl_av1_film_grain *p_av1_film_grain;
 	struct v4l2_rect *p_rect;
+	struct v4l2_ctrl_enc_roi_params *p_enc_roi_params;
 	void *p;
 	const void *p_const;
 };
diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
index f84ed133a6c9b2ddc1aedbd582ddf78cb71f34e5..5f2621365593ee19a7792fb25ea29acf6a7860f1 100644
--- a/include/uapi/linux/v4l2-controls.h
+++ b/include/uapi/linux/v4l2-controls.h
@@ -918,6 +918,7 @@ enum v4l2_mpeg_video_av1_level {
 };
 
 #define V4L2_CID_MPEG_VIDEO_AVERAGE_QP  (V4L2_CID_CODEC_BASE + 657)
+#define V4L2_CID_MPEG_VIDEO_ENC_ROI  (V4L2_CID_CODEC_BASE + 658)
 
 /*  MPEG-class control IDs specific to the CX2341x driver as defined by V4L2 */
 #define V4L2_CID_CODEC_CX2341X_BASE				(V4L2_CTRL_CLASS_CODEC | 0x1000)
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index add08188f06890182a5c399a223c1ab0a546cae1..18a5ae34842721c2647a7a76365e4d299d2b8a44 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -1909,6 +1909,7 @@ struct v4l2_ext_control {
 		struct v4l2_ctrl_av1_film_grain __user *p_av1_film_grain;
 		struct v4l2_ctrl_hdr10_cll_info __user *p_hdr10_cll_info;
 		struct v4l2_ctrl_hdr10_mastering_display __user *p_hdr10_mastering_display;
+		struct v4l2_ctrl_enc_roi_params __user *p_enc_roi_params;
 		void __user *ptr;
 	} __attribute__ ((packed));
 } __attribute__ ((packed));
@@ -1990,6 +1991,8 @@ enum v4l2_ctrl_type {
 	V4L2_CTRL_TYPE_AV1_TILE_GROUP_ENTRY = 0x281,
 	V4L2_CTRL_TYPE_AV1_FRAME	    = 0x282,
 	V4L2_CTRL_TYPE_AV1_FILM_GRAIN	    = 0x283,
+
+	V4L2_CTRL_TYPE_ENC_ROI_PARAMS	    = 0x284,
 };
 
 /*  Used in the VIDIOC_QUERYCTRL ioctl for querying controls */
@@ -2540,6 +2543,20 @@ struct v4l2_streamparm {
 	} parm;
 };
 
+/* Roi format
+ */
+#define VIDEO_MAX_ROI_REGIONS         10
+
+struct v4l2_roi_param {
+	struct v4l2_rect roi_rect;
+	__s32 delta_qp;
+};
+
+struct v4l2_ctrl_enc_roi_params {
+	__u32 num_roi_regions;
+	struct v4l2_roi_param roi_params[VIDEO_MAX_ROI_REGIONS];
+};
+
 /*
  *	E V E N T S
  */

-- 
2.34.1


