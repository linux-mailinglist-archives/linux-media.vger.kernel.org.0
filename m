Return-Path: <linux-media+bounces-48515-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DCE8ACB1858
	for <lists+linux-media@lfdr.de>; Wed, 10 Dec 2025 01:40:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 23C0630E0F6B
	for <lists+linux-media@lfdr.de>; Wed, 10 Dec 2025 00:39:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06A811DE8B5;
	Wed, 10 Dec 2025 00:39:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EXzPPqt4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KmNMwnGp"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1ABF19995E
	for <linux-media@vger.kernel.org>; Wed, 10 Dec 2025 00:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765327183; cv=none; b=oQhWqGXu7BwZGfvxHGEVSXhDIVTAjn+jRAwQaPpBvQFOrSfizLzh7grBkBdVeXJ0Et02wXOXzVHwwqCypCivp8C57XVeaC3ruulp+DuUCx/QmizixHikcJYCJYqjVZ7m0PjRlMvKZEs67DYB0om5xVZoexBSeikzp4JefmubhTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765327183; c=relaxed/simple;
	bh=LM5cLcvrL97GVflWOVSbpoD+zNNmsN4BqP7GlTU2puY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LQu6juUmRN817vIToCwW303Qjuv2/vySJ6PPiO/SAdZI8mvDpI7uYfg3Yilord1tsPSUxGigoLbDAnj2m5m8jBDJdt4hQigr0p8eqMynWMIs1a9jyTxZiAVWR0Lb2Ss1EJGB1dzgyl3itSmLPsS05tObFma5IOuEvAVAG5nPC2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EXzPPqt4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KmNMwnGp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BA0OIOn1020426
	for <linux-media@vger.kernel.org>; Wed, 10 Dec 2025 00:39:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	15Q9ck6ovkYMJTPJoDc2Dx9iK+2vuB4WM6abfMTFsKQ=; b=EXzPPqt4GEdHpn1o
	gN+uhkW+29bO4yMNOntqni1iDNbqQ3Zf90zlUOItuCJuH3afeYQleVxyXKhBeRvK
	7DJI34TfeahEep0o2BlAECkspTgAohOgd8E3LQ8lxn58kb5YvZcZIPA6+DWLdlne
	sA0Xzg7V9WyDm8IeoEkt/aKBsS9dKnYEfnGwGyd5AtFv8mDzl0IcZEqz/mvy0BfI
	AsD+8k+QF5zGyciIzx2vBPJSx74p+mM7C0+AWgT4qEL1E3wmHp2jgr1CTmaMVegB
	jEr4wZu9ib1fX9hWfn3tJPzK6ICnw/ZXIpFpniBeJKng9fu7bNoj7efLzN3IJH57
	tNBtWg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4axpx19fum-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 10 Dec 2025 00:39:40 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-7bf693d5f0dso899066b3a.3
        for <linux-media@vger.kernel.org>; Tue, 09 Dec 2025 16:39:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765327180; x=1765931980; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=15Q9ck6ovkYMJTPJoDc2Dx9iK+2vuB4WM6abfMTFsKQ=;
        b=KmNMwnGpW6qzFuXGRiaDRRV4DJ73VRZ9aByc/ea+ud+spQaChxCH9axwyfxjxDGHMg
         x96HvGez1v8m2zwX2fYc2ViyodEiGwjX1NGkw8EZqs54nCy6M8n5IQ2K8ZDTfpU4tA0J
         +q5rYnEBtBcDCB/uq5kl13+xEEGXqlLso7G8s4LDW2wyYce7AMUDTl+fWf+niAHCP45q
         A+6KVRKhbvX0/ty4i52TD/xN4ojq1v1VCUJVnZwvmWIinJgIQgHnBC7n0Y25crUN9mIt
         zyI4LIkJpOGu/3SPJrfWc0sfWWavYACefZtZ1e9oinz/2zaMpC+DPmBDhhechJsnE4a/
         foBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765327180; x=1765931980;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=15Q9ck6ovkYMJTPJoDc2Dx9iK+2vuB4WM6abfMTFsKQ=;
        b=U/CoIB3NKPcJ4CgoygEdUKdXHG1rwOCMMNc5aLu1ZHxJq3+WRnIeZWLSZ+ZkUSP2w+
         N+jP6s97L8QTroiscIII3aQDdk0L+6UP6Q0PGTZofFu2TPISwn9K5WoW970FwnVc2FNm
         aaOIlFWBxlAVkr7BDOACuTdDyN32P61iuMvqE/yXDFzD64lb3I+I/JhfYaDW76B0C3eI
         50NFmSfWy1Saw8GZ3dRfDY7LE6KbM3DHN9SoB+tyE7vKRp/YIpkG/evamh9ifKWSGc2y
         ElMtFhOwoGDcFCV/Nok4+sWJw9FFETe9Kx5Ie4I4JFMopkQMnDzYXoaQtRTXd9I2n2Oe
         23Uw==
X-Gm-Message-State: AOJu0Ywy+Csdf52QVYmkBYyIKbOUTVROqRam6PmWU3DjktHJYaD7xIoM
	BN2fq7cDoKtndhuRRfUbXWI7shjkfdWZLWrMB/l6H5wn3n4PoRiCIPtP6G9DoYzOdiuYBVfhvWk
	cXiSzx2A3pDdUcwmUQbb/DoAc0jhuJ7culwWNOrg3mnhEx3L3QKgG9aPbT4NBnQ7ltw==
X-Gm-Gg: AY/fxX6PkWOAMSKtmMhDaorzRFcWOg8Lzh63xjIOVMi7clzXzrD3MkXwzVuzCc/6OZn
	PSyg6SFfkxDfcr5xQnUeNFQg3/w8dy/EI+wISbfBR/ucrUB3jBUaQGTsh/xDsDMIr+LaOJeBt8S
	ueD1yzqXq5sPjs8hBVTCUB8Fpj5uzHeoZnnso57/6HEkhNZSOy58eE105tAPK1AJGZUxyq0ccr+
	t1s+XERqkunujIsnM1ZN4g7ylV+BGKatGUyPA0OwpJyhL6IWDpF7j9YkWCHuda5334A47oKSj1q
	YodDXTf7pkaDNjNOFzsF0d+1vNDK55sOWG40IvqqVl38VcPgpEGfGWt8ETw6kQ/R9tGy1nEsouC
	7m2Dh+lOTQusR0ERGmPV1Wm9/No3phG3F1lnnZu/yOVdv/nKWsNshGDlngOaJ7ikYqrLXHA==
X-Received: by 2002:a05:7300:fd18:b0:2ab:ca55:b76e with SMTP id 5a478bee46e88-2ac055ebd5dmr329974eec.9.1765327180145;
        Tue, 09 Dec 2025 16:39:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEYFbzbHs+Cv0xPIKB3DK0EyWKH0o8MME4eKs/ZruNQOUZXKUnl7tmEavS54+IVCIT7u5a/Zw==
X-Received: by 2002:a05:7300:fd18:b0:2ab:ca55:b76e with SMTP id 5a478bee46e88-2ac055ebd5dmr329957eec.9.1765327179534;
        Tue, 09 Dec 2025 16:39:39 -0800 (PST)
Received: from gu-dmadival-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2aba822b615sm46666784eec.0.2025.12.09.16.39.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 16:39:39 -0800 (PST)
From: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
Date: Tue, 09 Dec 2025 16:39:34 -0800
Subject: [PATCH v9 1/5] media: uapi: videodev2: Add support for AV1
 stateful decoder
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251209-av1d_stateful_v3-v9-1-718e3b3934b1@oss.qualcomm.com>
References: <20251209-av1d_stateful_v3-v9-0-718e3b3934b1@oss.qualcomm.com>
In-Reply-To: <20251209-av1d_stateful_v3-v9-0-718e3b3934b1@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, kernel test robot <lkp@intel.com>,
        Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Hans Verkuil <hverkuil+cisco@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765327177; l=2597;
 i=deepa.madivalara@oss.qualcomm.com; s=20250814; h=from:subject:message-id;
 bh=LM5cLcvrL97GVflWOVSbpoD+zNNmsN4BqP7GlTU2puY=;
 b=gwl3TbJGa4i46Mm6ZkDKnVBJY+wgF5KOZVI98IEcAaPTqAZpaPu3Wm3iMzWBn2uyjp3fgukGI
 OHZOjZiyhHZCPBjK7LbxbJmu9+7MoVBky/UCD/piCZve6BGlYQqVg+N
X-Developer-Key: i=deepa.madivalara@oss.qualcomm.com; a=ed25519;
 pk=MOEXgyokievn+bgpHdS6Ixh/KQYyS90z2mqIbQ822FQ=
X-Proofpoint-ORIG-GUID: wZOhLv70JTUcoWSOKfaKitkiy85CFdx_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEwMDAwMyBTYWx0ZWRfX+fkY7wmqWiPT
 WsOTyM0s4HMNVKhMoGGA3mkAF6+C6WC0J5plhAfgsyGk+Xsj7RwE3H3X3m/W16+uoFTWuczS64R
 XnJj2YXqqKzs7IVwg/BrVivhWJLPnGyrAKiRdKMBaPU2W/7xpk47kNq22RyH9yJzAJxmJHNMu17
 ZECsX2Z5DB1hoy1bVqmvrIj/mFJT5ec3drqYbqnVXWhlQuJO388mnMIyC7m6IBqPWMZDUaBFDJ0
 yjFkYsZ0BGS1c+KxfX54qyt5DBQkJ9HyHw2ELaSWtIXPgcyJsNEH2K6DqWiB+5wui1bRuslRFc3
 blH3coRTOdnnx3G5CdLz6H5J2sVPACYshX7G1hZBSEp2Aj8UM+jbH4grLrq/ER7kXEIxRjPYjJv
 kY46Qa1J0HPv9eQXY6w/8k0blAggoQ==
X-Proofpoint-GUID: wZOhLv70JTUcoWSOKfaKitkiy85CFdx_
X-Authority-Analysis: v=2.4 cv=Su6dKfO0 c=1 sm=1 tr=0 ts=6938c14d cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=QX4gbG5DAAAA:8 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=5q8hE9cQKCNJD2usWYQA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22 a=cvBusfyB2V15izCimMoJ:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-09_05,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 malwarescore=0 impostorscore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512100003

Introduce a new pixel format, V4L2_PIX_FMT_AV1, to the
Video4Linux2(V4L2) API. This format is intended for AV1
bitstreams in stateful decoding/encoding workflows.
The fourcc code 'AV10' is used to distinguish
this format from the existing V4L2_PIX_FMT_AV1_FRAME,
which is used for stateless AV1 decoder implementation.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Reviewed-by: Hans Verkuil <hverkuil+cisco@kernel.org>
Signed-off-by: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
---
 Documentation/userspace-api/media/v4l/pixfmt-compressed.rst | 8 ++++++++
 include/uapi/linux/videodev2.h                              | 1 +
 2 files changed, 9 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/pixfmt-compressed.rst b/Documentation/userspace-api/media/v4l/pixfmt-compressed.rst
index c7efb0465db6480fe35be8557728c196e0e530f4..235f955d3cd5cfc83b0d3d424e6625b14c07266c 100644
--- a/Documentation/userspace-api/media/v4l/pixfmt-compressed.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-compressed.rst
@@ -275,6 +275,14 @@ Compressed Formats
         of macroblocks to decode a full corresponding frame to the matching
         capture buffer.
 
+    * .. _V4L2-PIX-FMT-AV1:
+
+      - ``V4L2_PIX_FMT_AV1``
+      - 'AV01'
+      - AV1 compressed video frame. This format is adapted for implementing AV1
+        pipeline. The decoder implements stateful video decoder and expects one
+        temporal unit per buffer in OBU stream format.
+        The encoder generates one Temporal Unit per buffer.
 .. raw:: latex
 
     \normalsize
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index add08188f06890182a5c399a223c1ab0a546cae1..848e86617d5c87d76f15663403c2f3f0e709073b 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -775,6 +775,7 @@ struct v4l2_pix_format {
 #define V4L2_PIX_FMT_H264_SLICE v4l2_fourcc('S', '2', '6', '4') /* H264 parsed slices */
 #define V4L2_PIX_FMT_HEVC_SLICE v4l2_fourcc('S', '2', '6', '5') /* HEVC parsed slices */
 #define V4L2_PIX_FMT_AV1_FRAME v4l2_fourcc('A', 'V', '1', 'F') /* AV1 parsed frame */
+#define V4L2_PIX_FMT_AV1      v4l2_fourcc('A', 'V', '0', '1') /* AV1 */
 #define V4L2_PIX_FMT_SPK      v4l2_fourcc('S', 'P', 'K', '0') /* Sorenson Spark */
 #define V4L2_PIX_FMT_RV30     v4l2_fourcc('R', 'V', '3', '0') /* RealVideo 8 */
 #define V4L2_PIX_FMT_RV40     v4l2_fourcc('R', 'V', '4', '0') /* RealVideo 9 & 10 */

-- 
2.34.1


