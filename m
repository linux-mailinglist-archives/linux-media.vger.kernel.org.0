Return-Path: <linux-media+bounces-48573-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 12EAFCB3CD7
	for <lists+linux-media@lfdr.de>; Wed, 10 Dec 2025 19:59:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4E4CE308971E
	for <lists+linux-media@lfdr.de>; Wed, 10 Dec 2025 18:59:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E2DA329C70;
	Wed, 10 Dec 2025 18:59:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cNLajhpQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Xp0neCTG"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B964832549B
	for <linux-media@vger.kernel.org>; Wed, 10 Dec 2025 18:59:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765393153; cv=none; b=SyGhlCreSDYenFmdpNyDK6V5NZwR2Y+2hSilvmUcuhqpCRXaALjDo7enSsWau0hDUTV+fo5uWfuzzxhGskS0aA0CAPdcqZGXyDxKxZvd+AgNkFG3NjHGmLnTSL8qvhw8MVUOQ3yCVOSugZtfBnaglt5BNVb/e6og5UGLXaYTVGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765393153; c=relaxed/simple;
	bh=LM5cLcvrL97GVflWOVSbpoD+zNNmsN4BqP7GlTU2puY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oTadNlzvedYh9RXdbuADRPYF9R3BPvlccNbUk2sF8BDzHo23DcpkE0GZQRKUfsOBypPP9i2QYckT5+5HIKHXsy6kszPq+0BvoNjTci5htHItFWUatmXVQCHI7Vosa40Hyq05Xl2mNP4OGv1/wrKssu/V+4tYBq42YRAnyWQirKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cNLajhpQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Xp0neCTG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BAIRpGS3759979
	for <linux-media@vger.kernel.org>; Wed, 10 Dec 2025 18:59:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	15Q9ck6ovkYMJTPJoDc2Dx9iK+2vuB4WM6abfMTFsKQ=; b=cNLajhpQxYwx8IGy
	3VUuW2sqT6bFN0+n8VQpgG2Q9Aj/K7M/oIuCXaYFmAszSgtdUSGwOW9BEasPwq5C
	UBz1xkvcGtNuuAncLE+4zRttUzpiJcAmxo3A6A09ho/tS1NVebMvTlAxHran/e0p
	vHakOFPm7Wy6TncTFTxZfnvDQE34jiuPSa5pi/GvZaRqOGzAMvnsKoq1WwRLopAi
	iYAjCQJldsuRcJafpUhVPLoLvO1j8Eq8YLsx+Up3y18609K4Ev6Er+Z/YRO0O4bY
	zIA+dBfDL+T2EnTLeGJgjfYoVX6YlEx2Ngc9xuTtAYza9uF6caeYV2QA+FKhMg/k
	5AOypQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aybhp8u6u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 10 Dec 2025 18:59:10 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-34922e61ea0so41330a91.1
        for <linux-media@vger.kernel.org>; Wed, 10 Dec 2025 10:59:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765393150; x=1765997950; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=15Q9ck6ovkYMJTPJoDc2Dx9iK+2vuB4WM6abfMTFsKQ=;
        b=Xp0neCTGwA5o8IYpZbQbGX9ZeZlRVQ9wsRRL0d6Cxyi9AkRzoj1CEcagnrp3f6kUyq
         3wRIHKRBh1VFAOHj7mFA9yJWnA3UfOueXU3MXzLtOkzW5im6H7jMSXnBwl47dkBHDl3k
         oxwOM9S+qo1zFb3hIRQskgqacxNOfM6b7n6i6lY/E1yVDrZiTAw28okl0tFPYHAX655j
         r9svuj51vqv6hx95XwWNo4I6FwCwqsODCLmqg+Mhun6TJnH71oCuUQDlVtiqx88li7Km
         GOQF69KFdCRCcTyFMooZ6sY/Pet/wc81Fh3UTc8jZtHw1TpZdKb9KW1wmNRBchg4uaRK
         w0Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765393150; x=1765997950;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=15Q9ck6ovkYMJTPJoDc2Dx9iK+2vuB4WM6abfMTFsKQ=;
        b=QAGRgHxm2dPTWdSZQsldzC7gI24fGJrpkrP2Jnxl3C6XOqlp+vyGBWoRnr/1uKbzHH
         IXTrYaSd1Ku472pDyq1SDwKt/UxInMT/bI2kmu0/VvXN20415vc6czO2Lp3+u11Q6Y3U
         9XeFgWeenfQSmIMa5ELl1GeeSw7E1Ofsmix0kj9B6K/X9SvF9anbzhnxZhNw8oQTQd/V
         FtNkhSCbvb9/7sdKRv50Mm5UHIE8QnMtnPCtln7u9lxyKp+2FdiFZXXsy2I+VZRAxwOg
         sP333DfGeoI2BrLmMMpBmIG01sfXFFRf1WmVnrpAJAISjIkdLk8WxZRpNO6QWGpr2LXP
         HXkQ==
X-Gm-Message-State: AOJu0Yy/HbyjmYPap3zOPgk0T5UsgBP3fHO2TZFvSY+GgUU9o8bL/wPD
	iDb/OlFeeBRrQR/C1lk9EpuZBU/i3lS7QyKWy1Es20KsdIvA5d7Lc4LagkuDExqVSanTzXD72Hy
	N6XO0HJJCcloBXP2P7TLWhQzIKZf3GJs1PK5+zbdKJK3mErsqp4AGO+v/DWB8AbswLQ==
X-Gm-Gg: ASbGnct/bng8y44l8yk2eeqr+ruPk8J6cL8ZdnNkRAwUcILBL+YptR2Rziw9ClkU7qd
	UzUfisOiEEZKjfxesp1vbtPakG3IoycuIit3YJeWDt2yfPl+45iIQ/TA1FdQpUdbJBn523fdVyi
	6TEv3eYTGMib7Pi+Z82CD/QUy5RArcsUnnw97oyWls6dWhDmVj8IdWmntflO9ddQyXDMRS6ojqR
	MzmCoriKzcm2890tXuXJcgJVcaig51jWXAjpuvfyuY+COltpmFrxmwuD64734rlaIiMo2wOdzO2
	Hooj87aVs1AJg35WT/ZGOo2KYSHlUZmBTge92EsZtwBSjkqukke525y83QRVGYOYxFIKgsUHr5Y
	HfPtFUIlTjAOt46J/fVGbDqUzpAOAgraKomWG1GpaCvvOz4HAWg9mPuMCPEIzS1VC3iGKcQ==
X-Received: by 2002:a05:7022:3847:b0:119:e56a:4fff with SMTP id a92af1059eb24-11f296c903fmr1367466c88.4.1765393149455;
        Wed, 10 Dec 2025 10:59:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHmm7TOqb5Wsr9vjMnsG/AxVUxUEuqG+eQa6sUBm/Oe4q0VNYvOhbHKhM0y1KW6fNblIaPANQ==
X-Received: by 2002:a05:7022:3847:b0:119:e56a:4fff with SMTP id a92af1059eb24-11f296c903fmr1367455c88.4.1765393148912;
        Wed, 10 Dec 2025 10:59:08 -0800 (PST)
Received: from gu-dmadival-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11f2e1bb45csm778008c88.1.2025.12.10.10.59.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Dec 2025 10:59:08 -0800 (PST)
From: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
Date: Wed, 10 Dec 2025 10:59:04 -0800
Subject: [PATCH v10 1/5] media: uapi: videodev2: Add support for AV1
 stateful decoder
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251210-av1d_stateful_v3-v10-1-cf4379a3dcff@oss.qualcomm.com>
References: <20251210-av1d_stateful_v3-v10-0-cf4379a3dcff@oss.qualcomm.com>
In-Reply-To: <20251210-av1d_stateful_v3-v10-0-cf4379a3dcff@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765393147; l=2597;
 i=deepa.madivalara@oss.qualcomm.com; s=20250814; h=from:subject:message-id;
 bh=LM5cLcvrL97GVflWOVSbpoD+zNNmsN4BqP7GlTU2puY=;
 b=Mc9ERiswvO7xPCDBJYucmt77ZdjvAUaLqQj25sFvp5KoxkrExFdX90DFU0El3qUbLeO+gw4KH
 yaMS62n24d+AUPz6lgcCBs+VUqV/EdIjdfK1OI+rbW8ek8Vy2QqSzdO
X-Developer-Key: i=deepa.madivalara@oss.qualcomm.com; a=ed25519;
 pk=MOEXgyokievn+bgpHdS6Ixh/KQYyS90z2mqIbQ822FQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEwMDE1NSBTYWx0ZWRfX+daLyVJniY01
 aQxy8dQI0MvNm4UAfeWX+hgXwidz+AUA1INJ/vfu9Lnc16OIOzdcfgxB+lxrP6ixCiQr5n48tv1
 O/s79teh/IdWljdL6sAmjMKN9nLYB+rRuqwPizRP+C2bOyBfMysB8QI+8xOcVRDkljjEw3g/vGE
 8NwgRNbtAzHAix4rHL9L8LkBQhu2IhqphlZvGtFeWK9XvREsAMz5ltsZEwNd/7RuSiuC/fmQ93E
 /pVXxReLO3Q9mCZ3v+dNihRIQQAHgFdxhOvFQMSkyfPFsRZk2MsVo7KteihvkxmEBWDJy4SVJJj
 wAuyKVTT2FtUDwmtJgMidgrVkTY2LAN4BxvMzMSRXtKSFLTMEJYzUjruL5D1gC4oApCOC3QgozN
 3nOmsvCTaVhBcv+JNv+/AGh4vDyvvg==
X-Proofpoint-ORIG-GUID: PXO0KtpfkvWnHm5ZFREK-2le83DCTEGc
X-Proofpoint-GUID: PXO0KtpfkvWnHm5ZFREK-2le83DCTEGc
X-Authority-Analysis: v=2.4 cv=LJ9rgZW9 c=1 sm=1 tr=0 ts=6939c2fe cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=QX4gbG5DAAAA:8 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=5q8hE9cQKCNJD2usWYQA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=cvBusfyB2V15izCimMoJ:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-10_02,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512100155

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


