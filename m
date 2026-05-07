Return-Path: <linux-media+bounces-60878-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WBpVH28Y/WlLXgAAu9opvQ
	(envelope-from <linux-media+bounces-60878-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 08 May 2026 00:55:43 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EAB174F0012
	for <lists+linux-media@lfdr.de>; Fri, 08 May 2026 00:55:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 0AE9C303F09F
	for <lists+linux-media@lfdr.de>; Thu,  7 May 2026 22:52:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F6713DB63D;
	Thu,  7 May 2026 22:50:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="k9BrwEGA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ksij/yuF"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22B183D5247
	for <linux-media@vger.kernel.org>; Thu,  7 May 2026 22:50:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778194254; cv=none; b=R6qNR5OOFeAbEXO4S3SWL+RPrCjt+ZzmjqnX0frLrivSlRxBcgaxRnSKgzV4I/YY6SveKfTq/oMuYe57eSGKoTms469h62kYS1nQ7pzNiWa2mKdYnqfAGikW0lblzaVvjG2ADZ2PHXGcugLWA4uhdZKKlyRUh+TjKaozTTbjKBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778194254; c=relaxed/simple;
	bh=Roey3CNSSDI4jd0q8xOJrIInRkj2PRCPZ1uqQvUJL1k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=W8kcgjFf8JdtDKzQF57z5rm3rqivXWV3ztzZRgd8zzAprqRWPNzjrF7uIDYcTrGGGFAkFGWX1Njwr0EPPCf10QjddtNCzD4nP17LcuNSx/hXAuOdWyU65StjwPLDRKGFYXNfK/cu2lMIPu4wANP/S1/vEuByXIe+ptWf7AjXiz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k9BrwEGA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ksij/yuF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 647G2x4V2384173
	for <linux-media@vger.kernel.org>; Thu, 7 May 2026 22:50:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ziRXEDGZjaNdT4wgv57F1l7Uvhd3K/Kp4qlrbJu598Q=; b=k9BrwEGAVtqjvH2f
	uLMPXebLOtNJtGUhxkDupz9/Xoca4m+XaGTT7nR3FQueV51jpZzzzxT+Ovw2L8hN
	WKPeo6d8a3YTSHhwPseRrCvXYDmce3GAh8qnRnduQS9fgqFVf7u+ncn20TIE0Qvr
	Z31RGplg3hrAajQsSgKgz5sdNLZv4n7KJLoXdhIZXyOuJAO4+uV2oAWirGrCClra
	KQn+TNh5OAJcNiZ35ansxFeUX2AJUufwq0Z6MDdBYCJWs+rhDGszUP3nTLuC0Bte
	lP7wHyINVptmwoVmbCxkrgR5oDg1QIOWxPfQETwDLzP4j7BXS0NTlLEzlJlItszB
	2sxmnQ==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0wwuhbb9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 07 May 2026 22:50:46 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-57536338b89so2079728e0c.3
        for <linux-media@vger.kernel.org>; Thu, 07 May 2026 15:50:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778194246; x=1778799046; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ziRXEDGZjaNdT4wgv57F1l7Uvhd3K/Kp4qlrbJu598Q=;
        b=Ksij/yuFTqmjPK+Xsirb6Ul1YAWe5sWOhDmFSR0KxlASPEHXklCtI9SQrwflx3nrrx
         MnDDhCCheZs2Tba3sG5/ZmDfY165cXNkUijBFMiqvDZRO5+w43Cea4e/ekitTidNGQrr
         R+qrasWvpP3xm6lskrhMOjRCDkAbcdyOI2yp8q+dgBWeSwlIC6rcYaWHOaoGdoGODiLD
         YI41Gn9rP2zcj5gMUzCOnvoKhCqt9esI3YOZ3CFkWGD5e8jGTSJyUPB3+2py7oI98kZ4
         CNDsHL6tZHf/CVEeSW2c9ox/xRsqi6SOsFH+JVRiD9M92J2EO2Nm8AaWoHjqN+p9Hb9L
         czlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778194246; x=1778799046;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ziRXEDGZjaNdT4wgv57F1l7Uvhd3K/Kp4qlrbJu598Q=;
        b=S5SkaYcWJAXK+ENX0zSKg4nPmRm3Xi4Olpvw/h0crdKTDo6IcPwAay0Fb0Bxa84OH2
         gf9Ll7ydROMOAwdst+eK+ASYbSPCqKFJaQ2EcuSkG5FE7+MuD4l5p4w72ubZew/yyk4v
         Lh7+3zuLx29+nGKTp8PhiBgN2l8KZ2ZN+4OKV6/hTcnjkZR2cPf4Uy9IePWKDVwji/nn
         Qfyj+cisEJ3S5eZ+JYluD9IjDtmThwpxzdCidTmsXCyBaDq7o6QHiSqoCij3kLJTKG+q
         tUGJCf4oo/ePTb6yOHdsQb6Omu5fkSg2EVwrfyd8ELMb4IKG2DltKBUmQzlsEKSuXe6B
         MzBQ==
X-Gm-Message-State: AOJu0Yy2IIDtl7SvVotkax/p+Hg22KVAolDDrHpQhjC58olBAfwitbKC
	k6d0VS9YkQ9ROEqLBWkUcgueu8q/mxZpjQ7m6jJaq1PTEuLBDk6iqI61oXKksyRvA3Hq6ntPysV
	7PynwKpU6ATs9WwxK3lWAYctPZsaLe4gYcNrP1XUU2RburbFQcyIfeehBDIqlHnC9Gw==
X-Gm-Gg: AeBDiev0T/GffpqCNWZYr+7qWB96cGk1pnXlS/YfiFDM28B9Y4Grn+SXSK2Rx5YhxCk
	cqDKtOmuP48weOsNQMq6uihKii2DqQ3NVa9UpBUDPAy5djCyKa/47ZKik1z0jwdvTaEEaCuCwo7
	Q/WkSXSaAIoQW0v58FqN9+iI6+5PPhCadoxlFcZbxBxjeoYsaIRBKYJFuOpStICnaJxXXeI9WZa
	zb9S7FtvHZKRcm1MHqecBEvt+BGY2MNqow6QcZdJcaSD3ETyH08iwXXiuhefxCrWWSHyKyMLbEF
	K0PUY7DVNvI1sKHy0jjkxNQnL0tZl7iQMS7pY/RFUqnMpMhGLjdAAfrm6uEvfLwZ5kjCHIsNwG5
	zWbPDrXo+Y6030HMXpR6/9A9ZGEEtHCsgNuLNcD4ohSLLjs57tK+n4Zm9x8sfoNm4GInX32llww
	IAWtqWQ1lJxX7rm/i/
X-Received: by 2002:a05:6102:6a94:b0:62f:3ba3:3039 with SMTP id ada2fe7eead31-630f8c252cemr5481583137.0.1778194245143;
        Thu, 07 May 2026 15:50:45 -0700 (PDT)
X-Received: by 2002:a05:6102:6a94:b0:62f:3ba3:3039 with SMTP id ada2fe7eead31-630f8c252cemr5481564137.0.1778194244172;
        Thu, 07 May 2026 15:50:44 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:b16a:3475:ec42:bcfa])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bcac4359dbesm102466b.48.2026.05.07.15.50.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 15:50:42 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 08 May 2026 00:49:28 +0200
Subject: [PATCH v3 13/15] media: qcom: camss: Add CAMSS Offline Processing
 Engine driver
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260508-camss-isp-ope-v3-13-bb1055274603@oss.qualcomm.com>
References: <20260508-camss-isp-ope-v3-0-bb1055274603@oss.qualcomm.com>
In-Reply-To: <20260508-camss-isp-ope-v3-0-bb1055274603@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
        devicetree@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        kieran.bingham@ideasonboard.com, johannes.goede@oss.qualcomm.com
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: yS5AHRYgRMPvsOVNzOtpACpvqpktFyKm
X-Authority-Analysis: v=2.4 cv=Nd/WEWD4 c=1 sm=1 tr=0 ts=69fd1747 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=dg9WyN4cMKTUCAbeD44A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=O8hF6Hzn-FEA:10 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDIzMiBTYWx0ZWRfX9bHd6rlhCOXY
 vHmlNhUAVjH2Kmp68s7x+TlEfbCUa3WaJpFcDQgJWMaDKn+ZoYZ0Zd++rOxhGyTW3lnbKoy+aD8
 A6vRWBVB5t8JOHZe7qOMA+Z9fW8lgliiPJcVxroOwcF645p03iHLHry/fPffgjZ2hv4qA4uBkFe
 AcV8sMxK+ACvwZfmr3AfbdxKJ3Ct4cysSru/OI9szSRqhhPYPTTS7kcGHpo72JyGSQ3RGjZW1q1
 xwa34o/sImBQuIv91QbUpxKhjNQXXEbQw6BzIgtIpM5SGl45bPznc/iFDXBgALJa6z2jMT4UYT3
 Wn+RRCz31US6XEeBIc9uEB7udS6FbPL3oFfL398Xqh1BuaPFKj7uZST9KWy+VulyrveQbs0Tm+7
 LWzdzhrnxz+S//D1BQsmo/3AFL52gddSsDZeH+H1zbGF3WhXA5MavsLWd1YX1Z7PdMu3RPehanG
 tTCQRWhM+TzKcbAOhLw==
X-Proofpoint-GUID: yS5AHRYgRMPvsOVNzOtpACpvqpktFyKm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 phishscore=0 clxscore=1015 spamscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070232
X-Rspamd-Queue-Id: EAB174F0012
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-60878-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Add a V4L2 mem-to-mem driver for the Qualcomm Offline Processing Engine
(OPE). OPE is a memory-to-memory ISP block that converts raw Bayer
frames to YUV, performing white balance, demosaic, chroma enhancement,
color correction and downscaling.

The hardware architecture consists of Fetch Engines and Write Engines,
connected through intermediate pipeline modules for pix processing.

The driver exposes three video nodes per pipeline instance:
  - ope_input: Bayer RAW input (V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
  - ope_disp_output: YUV output     (V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE)
  - ope_params: ISP parameters (V4L2_BUF_TYPE_META_OUTPUT)

Hardware features:
  - Stripe-based processing (up to 336 pixels wide per stripe)
  - White balance (CLC_WB)
  - Demosaic / Bayer-to-RGB (CLC_DEMO)
  - RGB-to-YUV conversion (CLC_CHROMA_ENHAN)
  - Color correction matrix (CLC_CC)
  - MN downscaler for chroma and luma planes

Default configuration values are based on public standards such as BT.601.

Processing Model:
OPE processes frames in stripes of up to 336 pixels. Therefore, frames must
be split into stripes for processing. Each stripe is configured after the
previous one has been acquired (double buffered registers). To minimize
inter-stripe latency, stripe configurations are generated ahead of time.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/Kconfig          |   18 +
 drivers/media/platform/qcom/camss/Makefile         |    3 +
 drivers/media/platform/qcom/camss/camss-isp-ope.c  | 3025 ++++++++++++++++++++
 .../media/platform/qcom/camss/camss-isp-pipeline.c |   11 +
 .../media/platform/qcom/camss/camss-isp-pipeline.h |    2 +
 5 files changed, 3059 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/Kconfig b/drivers/media/platform/qcom/camss/Kconfig
index d77482f3f5eadc65856806b9b237d65ea484f267..aae87e109b336a953a25a7b3bc8ada66b29135ce 100644
--- a/drivers/media/platform/qcom/camss/Kconfig
+++ b/drivers/media/platform/qcom/camss/Kconfig
@@ -21,3 +21,21 @@ config VIDEO_QCOM_CAMSS_ISP
 
 	  This module is selected automatically by drivers that need it.
 
+config VIDEO_QCOM_CAMSS_OPE
+	tristate "Qualcomm CAMSS Offline Processing Engine (OPE) driver"
+	depends on V4L_PLATFORM_DRIVERS
+	depends on VIDEO_DEV
+	depends on (ARCH_QCOM && IOMMU_DMA) || COMPILE_TEST
+	select MEDIA_CONTROLLER
+	select VIDEO_QCOM_CAMSS_ISP
+	select V4L2_ISP
+	select VIDEOBUF2_DMA_CONTIG
+	select VIDEOBUF2_VMALLOC
+	help
+	  Enable support for the Qualcomm Offline Processing Engine (OPE).
+	  OPE is a memory-to-memory ISP block that converts raw Bayer frames
+	  to YUV, performing white balance, demosaic, chroma enhancement and
+	  downscaling. Found on QCM2290 and related SoCs.
+
+	  To compile this driver as a module, choose M here: the module
+	  will be called qcom-camss-ope.
diff --git a/drivers/media/platform/qcom/camss/Makefile b/drivers/media/platform/qcom/camss/Makefile
index fba6f34b8d9f70ea258f7ae1a293a8d58d866498..9d47e4f5fe6dc8d168d866813732655eb0c547a6 100644
--- a/drivers/media/platform/qcom/camss/Makefile
+++ b/drivers/media/platform/qcom/camss/Makefile
@@ -37,3 +37,6 @@ qcom-camss-isp-objs := camss-isp-bufq.o \
 
 obj-$(CONFIG_VIDEO_QCOM_CAMSS_ISP) += qcom-camss-isp.o
 
+qcom-camss-ope-objs := camss-isp-ope.o
+
+obj-$(CONFIG_VIDEO_QCOM_CAMSS_OPE) += qcom-camss-ope.o
diff --git a/drivers/media/platform/qcom/camss/camss-isp-ope.c b/drivers/media/platform/qcom/camss/camss-isp-ope.c
new file mode 100644
index 0000000000000000000000000000000000000000..1febe3e7417f90dc59deca47a2c164b97116fec6
--- /dev/null
+++ b/drivers/media/platform/qcom/camss/camss-isp-ope.c
@@ -0,0 +1,3025 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * camss-ope.c
+ *
+ * Qualcomm MSM Camera Subsystem - Offline Processing Engine
+ *
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/*
+ * This driver provides driver implementation for the Qualcomm Offline
+ * Processing Engine (OPE). OPE is a memory-to-memory hardware block
+ * designed for image processing on a source frame. Typically, the input
+ * frame originates from the SoC CSI capture path, though not limited to.
+ *
+ * The hardware architecture consists of Fetch Engines and Write Engines,
+ * connected through intermediate pipeline modules:
+ *   [FETCH ENGINES] => [Pipeline Modules] => [WRITE ENGINES]
+ *
+ * Current Configuration:
+ *     Fetch Engine: One fetch engine is used for Bayer frame input.
+ *     Write Engines: Two display write engines for Y and UV planes output.
+ *
+ * Only a subset of the pipeline modules are enabled:
+ *   CLC_WB: White balance for channel gain configuration
+ *   CLC_DEMO: Demosaic for Bayer to RGB conversion
+ *   CLC_CC: Color Correct, coefficient based RGB correction
+ *   CLC_CHROMA_ENHAN: for RGB to YUV conversion
+ *   CLC_DOWNSCALE*: Downscaling for UV (YUV444 -> YUV422/YUV420) and YUV planes
+ *
+ * Default configuration values are based on public standards such as BT.601.
+ *
+ * Processing Model:
+ * OPE processes frames in stripes of up to 336 pixels. Therefore, frames must
+ * be split into stripes for processing. Each stripe is configured after the
+ * previous one has been acquired (double buffered registers). To minimize
+ * inter-stripe latency, the stripe configurations are generated ahead of time.
+ */
+
+#include <linux/bitfield.h>
+#include <linux/clk.h>
+#include <linux/completion.h>
+#include <linux/delay.h>
+#include <linux/dma-mapping.h>
+#include <linux/interconnect.h>
+#include <linux/interrupt.h>
+#include <linux/io.h>
+#include <linux/iopoll.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/pm_clock.h>
+#include <linux/pm_domain.h>
+#include <linux/pm_opp.h>
+#include <linux/pm_runtime.h>
+#include <linux/slab.h>
+#include <linux/units.h>
+
+#include <media/v4l2-device.h>
+#include <media/media-device.h>
+#include <media/v4l2-ctrls.h>
+#include <media/v4l2-event.h>
+#include <media/v4l2-fh.h>
+#include <media/v4l2-ioctl.h>
+#include "camss-isp-bufq.h"
+#include "camss-isp-pipeline.h"
+#include "camss-isp-sched.h"
+#include <media/videobuf2-dma-contig.h>
+#include <media/videobuf2-vmalloc.h>
+
+#include <uapi/linux/camss-config.h>
+
+#include "camss-isp-params.h"
+
+#define OPE_NAME	"qcom-camss-ope"
+
+/* Format descriptor */
+struct ope_fmt {
+	u32		fourcc;
+	unsigned int	depth;
+	unsigned int	align;
+	unsigned int	num_planes;
+	u32		mbus_code;
+};
+
+/* Per-queue format state */
+struct ope_fmt_state {
+	const struct ope_fmt	*fmt;
+	unsigned int		width;
+	unsigned int		height;
+	struct v4l2_rect	crop;
+	unsigned int		bytesperline;
+	unsigned int		sizeimage;
+	enum v4l2_colorspace	colorspace;
+	enum v4l2_xfer_func	xfer_func;
+	enum v4l2_ycbcr_encoding	ycbcr_enc;
+	enum v4l2_quantization	quantization;
+	unsigned int		sequence;
+	struct v4l2_fract	timeperframe;
+};
+
+/* -------- Register layout -------- */
+
+#define OPE_TOP_HW_VERSION					0x000
+#define		OPE_TOP_HW_VERSION_STEP		GENMASK(15, 0)
+#define		OPE_TOP_HW_VERSION_REV		GENMASK(27, 16)
+#define		OPE_TOP_HW_VERSION_GEN		GENMASK(31, 28)
+#define OPE_TOP_RESET_CMD					0x004
+#define		OPE_TOP_RESET_CMD_HW		BIT(0)
+#define		OPE_TOP_RESET_CMD_SW		BIT(1)
+#define OPE_TOP_IRQ_STATUS					0x014
+#define OPE_TOP_IRQ_MASK					0x018
+#define		OPE_TOP_IRQ_STATUS_RST_DONE	BIT(0)
+#define		OPE_TOP_IRQ_STATUS_WE		BIT(1)
+#define		OPE_TOP_IRQ_STATUS_FE		BIT(2)
+#define		OPE_TOP_IRQ_STATUS_VIOL		BIT(3)
+#define		OPE_TOP_IRQ_STATUS_IDLE		BIT(4)
+#define OPE_TOP_IRQ_CLEAR					0x01c
+#define OPE_TOP_IRQ_CMD						0x024
+#define		OPE_TOP_IRQ_CMD_CLEAR		BIT(0)
+#define OPE_TOP_VIOLATION_STATUS				0x028
+
+/* Fetch engine */
+#define OPE_BUS_RD_INPUT_IF_IRQ_MASK				0x00c
+#define OPE_BUS_RD_INPUT_IF_IRQ_CLEAR				0x010
+#define OPE_BUS_RD_INPUT_IF_IRQ_CMD				0x014
+#define		OPE_BUS_RD_INPUT_IF_IRQ_CMD_CLEAR	BIT(0)
+#define OPE_BUS_RD_INPUT_IF_IRQ_STATUS				0x018
+#define OPE_BUS_RD_INPUT_IF_CMD					0x01c
+#define		OPE_BUS_RD_INPUT_IF_CMD_GO_CMD		BIT(0)
+#define OPE_BUS_RD_CLIENT_0_CORE_CFG				0x050
+#define		OPE_BUS_RD_CLIENT_0_CORE_CFG_EN	BIT(0)
+#define OPE_BUS_RD_CLIENT_0_CCIF_META_DATA			0x054
+#define		OPE_BUS_RD_CLIENT_0_CCIF_MD_PIX_PATTERN GENMASK(7, 2)
+#define OPE_BUS_RD_CLIENT_0_ADDR_IMAGE				0x058
+#define OPE_BUS_RD_CLIENT_0_RD_BUFFER_SIZE			0x05c
+#define OPE_BUS_RD_CLIENT_0_RD_STRIDE				0x060
+#define OPE_BUS_RD_CLIENT_0_UNPACK_CFG_0			0x064
+
+/* Write engines */
+#define OPE_BUS_WR_INPUT_IF_IRQ_MASK_0				0x018
+#define OPE_BUS_WR_INPUT_IF_IRQ_MASK_1				0x01c
+#define OPE_BUS_WR_INPUT_IF_IRQ_CLEAR_0				0x020
+#define OPE_BUS_WR_INPUT_IF_IRQ_STATUS_0			0x028
+#define		OPE_BUS_WR_INPUT_IF_IRQ_STATUS_0_RUP_DONE	BIT(0)
+#define		OPE_BUS_WR_INPUT_IF_IRQ_STATUS_0_BUF_DONE	BIT(8)
+#define		OPE_BUS_WR_INPUT_IF_IRQ_STATUS_0_CONS_VIOL	BIT(28)
+#define		OPE_BUS_WR_INPUT_IF_IRQ_STATUS_0_VIOL		BIT(30)
+#define		OPE_BUS_WR_INPUT_IF_IRQ_STATUS_0_IMG_SZ_VIOL	BIT(31)
+#define OPE_BUS_WR_INPUT_IF_IRQ_CMD				0x030
+#define		OPE_BUS_WR_INPUT_IF_IRQ_CMD_CLEAR	BIT(0)
+#define OPE_BUS_WR_VIOLATION_STATUS				0x064
+#define OPE_BUS_WR_IMAGE_SIZE_VIOLATION_STATUS			0x070
+#define OPE_BUS_WR_CLIENT_CFG(c)				(0x200 + (c) * 0x100)
+#define		OPE_BUS_WR_CLIENT_CFG_EN		BIT(0)
+#define		OPE_BUS_WR_CLIENT_CFG_AUTORECOVER	BIT(4)
+#define OPE_BUS_WR_CLIENT_ADDR_IMAGE(c)				(0x204 + (c) * 0x100)
+#define OPE_BUS_WR_CLIENT_IMAGE_CFG_0(c)			(0x20c + (c) * 0x100)
+#define OPE_BUS_WR_CLIENT_IMAGE_CFG_1(c)			(0x210 + (c) * 0x100)
+#define OPE_BUS_WR_CLIENT_IMAGE_CFG_2(c)			(0x214 + (c) * 0x100)
+#define OPE_BUS_WR_CLIENT_PACKER_CFG(c)				(0x218 + (c) * 0x100)
+#define OPE_BUS_WR_CLIENT_MAX	4
+
+/* Pipeline modules */
+#define OPE_PP_CLC_WB_GAIN_MODULE_CFG				(0x200 + 0x60)
+#define		OPE_PP_CLC_WB_GAIN_MODULE_CFG_EN	BIT(0)
+#define OPE_PP_CLC_WB_GAIN_WB_CFG(ch)				(0x200 + 0x68 + 4 * (ch))
+
+#define OPE_PP_CLC_CC_BASE					0x400
+#define OPE_PP_CLC_CC_MODULE_CFG				(OPE_PP_CLC_CC_BASE + 0x60)
+#define		OPE_PP_CLC_CC_MODULE_CFG_EN		BIT(0)
+#define OPE_PP_CLC_CC_COEFF_A_CFG_0				(OPE_PP_CLC_CC_BASE + 0x68)
+#define		OPE_PP_CLC_CC_COEFF_A_CFG_0_A0		GENMASK(11, 0)
+#define		OPE_PP_CLC_CC_COEFF_A_CFG_0_A1		GENMASK(27, 16)
+#define OPE_PP_CLC_CC_COEFF_A_CFG_1				(OPE_PP_CLC_CC_BASE + 0x6c)
+#define		OPE_PP_CLC_CC_COEFF_A_CFG_1_A2		GENMASK(11, 0)
+#define OPE_PP_CLC_CC_COEFF_B_CFG_0				(OPE_PP_CLC_CC_BASE + 0x70)
+#define		OPE_PP_CLC_CC_COEFF_B_CFG_0_B0		GENMASK(11, 0)
+#define		OPE_PP_CLC_CC_COEFF_B_CFG_0_B1		GENMASK(27, 16)
+#define OPE_PP_CLC_CC_COEFF_B_CFG_1				(OPE_PP_CLC_CC_BASE + 0x74)
+#define		OPE_PP_CLC_CC_COEFF_B_CFG_1_B2		GENMASK(11, 0)
+#define OPE_PP_CLC_CC_COEFF_C_CFG_0				(OPE_PP_CLC_CC_BASE + 0x78)
+#define		OPE_PP_CLC_CC_COEFF_C_CFG_0_C0		GENMASK(11, 0)
+#define		OPE_PP_CLC_CC_COEFF_C_CFG_0_C1		GENMASK(27, 16)
+#define OPE_PP_CLC_CC_COEFF_C_CFG_1				(OPE_PP_CLC_CC_BASE + 0x7c)
+#define		OPE_PP_CLC_CC_COEFF_C_CFG_1_C2		GENMASK(11, 0)
+#define OPE_PP_CLC_CC_COEFF_K_CFG_0				(OPE_PP_CLC_CC_BASE + 0x80)
+#define		OPE_PP_CLC_CC_COEFF_K_CFG_0_K0		GENMASK(12, 0)
+#define OPE_PP_CLC_CC_COEFF_K_CFG_1				(OPE_PP_CLC_CC_BASE + 0x84)
+#define		OPE_PP_CLC_CC_COEFF_K_CFG_1_K1		GENMASK(12, 0)
+#define OPE_PP_CLC_CC_COEFF_K_CFG_2				(OPE_PP_CLC_CC_BASE + 0x88)
+#define		OPE_PP_CLC_CC_COEFF_K_CFG_2_K2		GENMASK(12, 0)
+#define OPE_PP_CLC_CC_COEFF_M_CFG				(OPE_PP_CLC_CC_BASE + 0x8c)
+#define		OPE_PP_CLC_CC_COEFF_M_CFG_M		GENMASK(11, 0)
+
+#define OPE_PP_CLC_DEMO_MODULE_CFG				(0x800 + 0x60)
+#define		OPE_PP_CLC_DEMO_MODULE_CFG_EN		BIT(0)
+#define		OPE_PP_CLC_DEMO_MODULE_CFG_DYN_G_CLAMP_EN BIT(4)
+#define OPE_PP_CLC_DEMO_INTERP_COEFF_CFG			(0x800 + 0x68)
+#define		OPE_PP_CLC_DEMO_INTERP_COEFF_CFG_LAMBDA_G  GENMASK(15, 8)
+#define		OPE_PP_CLC_DEMO_INTERP_COEFF_CFG_LAMBDA_RB GENMASK(7, 0)
+#define OPE_PP_CLC_DEMO_INTERP_CLASSIFIER_CFG_0			(0x800 + 0x6c)
+#define		OPE_PP_CLC_DEMO_INTERP_CLASSIFIER_CFG_0_AK GENMASK(15, 0)
+#define OPE_PP_CLC_DEMO_INTERP_CLASSIFIER_CFG_1			(0x800 + 0x70)
+#define		OPE_PP_CLC_DEMO_INTERP_CLASSIFIER_CFG_1_WK GENMASK(15, 0)
+
+#define OPE_PP_CLC_DOWNSCALE_MN_DS_C_PRE_BASE			0x1c00
+#define OPE_PP_CLC_DOWNSCALE_MN_DS_Y_DISP_BASE			0x3000
+#define OPE_PP_CLC_DOWNSCALE_MN_DS_C_DISP_BASE			0x3200
+#define OPE_PP_CLC_CROP_RND_CLAMP_Y_DISP_BASE			0x3400
+#define OPE_PP_CLC_CROP_RND_CLAMP_C_DISP_BASE			0x3600
+#define OPE_PP_CLC_CROP_RND_CLAMP_HW_STATUS(base)		((base) + 0x04)
+#define		OPE_PP_CLC_CROP_RND_CLAMP_HEIGHT_VIOL	BIT(2)
+#define		OPE_PP_CLC_CROP_RND_CLAMP_WIDTH_VIOL	BIT(1)
+#define OPE_PP_CLC_CROP_RND_CLAMP_MODULE_CFG(base)		((base) + 0x60)
+#define		OPE_PP_CLC_CROP_RND_CLAMP_EN		BIT(0)
+#define		OPE_PP_CLC_CROP_RND_CLAMP_CROP_EN	BIT(9)
+#define OPE_PP_CLC_CROP_RND_CLAMP_CROP_LINE_CFG(base)		((base) + 0x68)
+#define OPE_PP_CLC_CROP_RND_CLAMP_CROP_PIXEL_CFG(base)		((base) + 0x6c)
+#define		OPE_PP_CLC_CROP_RND_CLAMP_CROP_FIRST	GENMASK(29, 16)
+#define		OPE_PP_CLC_CROP_RND_CLAMP_CROP_LAST	GENMASK(13, 0)
+#define OPE_PP_CLC_DOWNSCALE_MN_CFG(ds)			((ds) + 0x60)
+#define		OPE_PP_CLC_DOWNSCALE_MN_CFG_EN		BIT(0)
+#define OPE_PP_CLC_DOWNSCALE_MN_DS_CFG(ds)			((ds) + 0x64)
+#define		OPE_PP_CLC_DOWNSCALE_MN_DS_CFG_H_SCALE_EN BIT(9)
+#define		OPE_PP_CLC_DOWNSCALE_MN_DS_CFG_V_SCALE_EN BIT(10)
+#define OPE_PP_CLC_DOWNSCALE_MN_DS_IMAGE_SIZE_CFG(ds)		((ds) + 0x68)
+#define OPE_PP_CLC_DOWNSCALE_MN_DS_MN_H_CFG(ds)		((ds) + 0x6c)
+#define OPE_PP_CLC_DOWNSCALE_MN_DS_MN_V_CFG(ds)		((ds) + 0x74)
+
+#define OPE_PP_CLC_CHROMA_ENHAN_MODULE_CFG			(0x1200 + 0x60)
+#define		OPE_PP_CLC_CHROMA_ENHAN_MODULE_CFG_EN	BIT(0)
+#define OPE_PP_CLC_CHROMA_ENHAN_LUMA_CFG_0			(0x1200 + 0x68)
+#define		OPE_PP_CLC_CHROMA_ENHAN_LUMA_CFG_0_V0	GENMASK(11, 0)
+#define		OPE_PP_CLC_CHROMA_ENHAN_LUMA_CFG_0_V1	GENMASK(27, 16)
+#define OPE_PP_CLC_CHROMA_ENHAN_LUMA_CFG_1			(0x1200 + 0x6c)
+#define		OPE_PP_CLC_CHROMA_ENHAN_LUMA_CFG_1_K	GENMASK(31, 23)
+#define OPE_PP_CLC_CHROMA_ENHAN_LUMA_CFG_2			(0x1200 + 0x70)
+#define		OPE_PP_CLC_CHROMA_ENHAN_LUMA_CFG_2_V2	GENMASK(11, 0)
+#define OPE_PP_CLC_CHROMA_ENHAN_COEFF_A_CFG			(0x1200 + 0x74)
+#define		OPE_PP_CLC_CHROMA_ENHAN_COEFF_A_CFG_AP	GENMASK(11, 0)
+#define		OPE_PP_CLC_CHROMA_ENHAN_COEFF_A_CFG_AM	GENMASK(27, 16)
+#define OPE_PP_CLC_CHROMA_ENHAN_COEFF_B_CFG			(0x1200 + 0x78)
+#define		OPE_PP_CLC_CHROMA_ENHAN_COEFF_B_CFG_BP	GENMASK(11, 0)
+#define		OPE_PP_CLC_CHROMA_ENHAN_COEFF_B_CFG_BM	GENMASK(27, 16)
+#define OPE_PP_CLC_CHROMA_ENHAN_COEFF_C_CFG			(0x1200 + 0x7C)
+#define		OPE_PP_CLC_CHROMA_ENHAN_COEFF_C_CFG_CP	GENMASK(11, 0)
+#define		OPE_PP_CLC_CHROMA_ENHAN_COEFF_C_CFG_CM	GENMASK(27, 16)
+#define OPE_PP_CLC_CHROMA_ENHAN_COEFF_D_CFG			(0x1200 + 0x80)
+#define		OPE_PP_CLC_CHROMA_ENHAN_COEFF_D_CFG_DP	GENMASK(11, 0)
+#define		OPE_PP_CLC_CHROMA_ENHAN_COEFF_D_CFG_DM	GENMASK(27, 16)
+#define OPE_PP_CLC_CHROMA_ENHAN_CHROMA_CFG_0			(0x1200 + 0x84)
+#define		OPE_PP_CLC_CHROMA_ENHAN_CHROMA_CFG_0_KCB GENMASK(31, 21)
+#define OPE_PP_CLC_CHROMA_ENHAN_CHROMA_CFG_1			(0x1200 + 0x88)
+#define		OPE_PP_CLC_CHROMA_ENHAN_CHROMA_CFG_1_KCR GENMASK(31, 21)
+
+/* -------- OPE-specific constants -------- */
+
+#define OPE_STRIPE_MAX_W	336
+#define OPE_STRIPE_MAX_H	8192
+#define OPE_STRIPE_MIN_W	16
+#define OPE_STRIPE_MIN_H	OPE_STRIPE_MIN_W
+#define OPE_MAX_STRIPE		16
+#define OPE_ALIGN_H		1
+#define OPE_ALIGN_W		1
+#define OPE_MIN_W		24
+#define OPE_MIN_H		16
+#define OPE_MAX_W		(OPE_STRIPE_MAX_W * OPE_MAX_STRIPE)
+#define OPE_MAX_H		OPE_STRIPE_MAX_H
+#define OPE_RESET_TIMEOUT_MS	100
+#define DEFAULT_FRAMERATE	60
+
+/* Downscaler fixed-point helpers */
+#define Q21(v)			(((uint64_t)(v)) << 21)
+#define DS_Q21(n, d)		((uint32_t)(((uint64_t)(n) << 21) / (d)))
+#define DS_RESOLUTION(in, out) \
+	(((out) * 128 <= (in)) ? 0x0 : \
+	 ((out) * 16  <= (in)) ? 0x1 : \
+	 ((out) * 8   <= (in)) ? 0x2 : 0x3)
+#define DS_OUTPUT_PIX(in, phase_init, phase_step) \
+	((Q21(in) - (phase_init)) / (phase_step))
+#define OPE_WB(n, d)		(((n) << 10) / (d))
+
+enum ope_downscaler {
+	OPE_DS_C_PRE,
+	OPE_DS_C_DISP,
+	OPE_DS_Y_DISP,
+	OPE_DS_MAX,
+};
+
+static const u32 ope_ds_base[OPE_DS_MAX] = {
+	OPE_PP_CLC_DOWNSCALE_MN_DS_C_PRE_BASE,
+	OPE_PP_CLC_DOWNSCALE_MN_DS_C_DISP_BASE,
+	OPE_PP_CLC_DOWNSCALE_MN_DS_Y_DISP_BASE,
+};
+
+enum ope_wr_client {
+	OPE_WR_CLIENT_VID_Y,
+	OPE_WR_CLIENT_VID_C,
+	OPE_WR_CLIENT_DISP_Y,
+	OPE_WR_CLIENT_DISP_C,
+	OPE_WR_CLIENT_MAX,
+};
+
+enum ope_pixel_pattern {
+	OPE_PIXEL_PATTERN_RGRGRG,
+	OPE_PIXEL_PATTERN_GRGRGR,
+	OPE_PIXEL_PATTERN_BGBGBG,
+	OPE_PIXEL_PATTERN_GBGBGB,
+	OPE_PIXEL_PATTERN_YCBYCR,
+	OPE_PIXEL_PATTERN_YCRYCB,
+	OPE_PIXEL_PATTERN_CBYCRY,
+	OPE_PIXEL_PATTERN_CRYCBY,
+};
+
+enum ope_stripe_location {
+	OPE_STRIPE_LOCATION_FULL,
+	OPE_STRIPE_LOCATION_LEFT,
+	OPE_STRIPE_LOCATION_RIGHT,
+	OPE_STRIPE_LOCATION_MIDDLE,
+};
+
+enum ope_unpacker_format {
+	OPE_UNPACKER_FMT_PLAIN_8	= 1,
+	OPE_UNPACKER_FMT_PLAIN_16_10BPP	= 2,
+	OPE_UNPACKER_FMT_MIPI_10	= 13,
+};
+
+enum ope_packer_format {
+	OPE_PACKER_FMT_PLAIN_8		= 1,
+	OPE_PACKER_FMT_PLAIN_8_ODD_EVEN = 2,
+	OPE_PACKER_FMT_MIPI_10		= 12,
+};
+
+struct ope_hw_fmt {
+	u32			fourcc;
+	enum ope_pixel_pattern	pattern;
+	enum ope_unpacker_format	unpacker;
+	enum ope_packer_format	packer;
+};
+
+static const struct ope_hw_fmt ope_hw_fmts[] = {
+	{ V4L2_PIX_FMT_SBGGR10P, OPE_PIXEL_PATTERN_BGBGBG,
+	  OPE_UNPACKER_FMT_MIPI_10,  OPE_PACKER_FMT_MIPI_10 },
+	{ V4L2_PIX_FMT_SGBRG10P, OPE_PIXEL_PATTERN_GBGBGB,
+	  OPE_UNPACKER_FMT_MIPI_10,  OPE_PACKER_FMT_MIPI_10 },
+	{ V4L2_PIX_FMT_SGRBG10P, OPE_PIXEL_PATTERN_GRGRGR,
+	  OPE_UNPACKER_FMT_MIPI_10,  OPE_PACKER_FMT_MIPI_10 },
+	{ V4L2_PIX_FMT_SRGGB10P, OPE_PIXEL_PATTERN_RGRGRG,
+	  OPE_UNPACKER_FMT_MIPI_10,  OPE_PACKER_FMT_MIPI_10 },
+	{ V4L2_PIX_FMT_SRGGB8,   OPE_PIXEL_PATTERN_RGRGRG,
+	  OPE_UNPACKER_FMT_PLAIN_8,  OPE_PACKER_FMT_PLAIN_8 },
+	{ V4L2_PIX_FMT_SBGGR8,   OPE_PIXEL_PATTERN_BGBGBG,
+	  OPE_UNPACKER_FMT_PLAIN_8,  OPE_PACKER_FMT_PLAIN_8 },
+	{ V4L2_PIX_FMT_SGBRG8,   OPE_PIXEL_PATTERN_GBGBGB,
+	  OPE_UNPACKER_FMT_PLAIN_8,  OPE_PACKER_FMT_PLAIN_8 },
+	{ V4L2_PIX_FMT_SGRBG8,   OPE_PIXEL_PATTERN_GRGRGR,
+	  OPE_UNPACKER_FMT_PLAIN_8,  OPE_PACKER_FMT_PLAIN_8 },
+	{ V4L2_PIX_FMT_NV24,     OPE_PIXEL_PATTERN_YCBYCR,
+	  OPE_UNPACKER_FMT_PLAIN_8,  OPE_PACKER_FMT_PLAIN_8 },
+	{ V4L2_PIX_FMT_NV42,     OPE_PIXEL_PATTERN_YCRYCB,
+	  OPE_UNPACKER_FMT_PLAIN_8,  OPE_PACKER_FMT_PLAIN_8_ODD_EVEN },
+	{ V4L2_PIX_FMT_NV16,     OPE_PIXEL_PATTERN_CBYCRY,
+	  OPE_UNPACKER_FMT_PLAIN_8,  OPE_PACKER_FMT_PLAIN_8 },
+	{ V4L2_PIX_FMT_NV61,     OPE_PIXEL_PATTERN_CBYCRY,
+	  OPE_UNPACKER_FMT_PLAIN_8,  OPE_PACKER_FMT_PLAIN_8_ODD_EVEN },
+	{ V4L2_PIX_FMT_NV12,     OPE_PIXEL_PATTERN_CBYCRY,
+	  OPE_UNPACKER_FMT_PLAIN_8,  OPE_PACKER_FMT_PLAIN_8 },
+	{ V4L2_PIX_FMT_NV21,     OPE_PIXEL_PATTERN_CBYCRY,
+	  OPE_UNPACKER_FMT_PLAIN_8,  OPE_PACKER_FMT_PLAIN_8_ODD_EVEN },
+	{ V4L2_PIX_FMT_GREY,     OPE_PIXEL_PATTERN_RGRGRG,
+	  OPE_UNPACKER_FMT_PLAIN_8,  OPE_PACKER_FMT_PLAIN_8 },
+};
+
+static const struct ope_hw_fmt *ope_find_hw_fmt(u32 fourcc)
+{
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(ope_hw_fmts); i++)
+		if (ope_hw_fmts[i].fourcc == fourcc)
+			return &ope_hw_fmts[i];
+
+	return NULL;
+}
+
+static const struct ope_fmt ope_input_fmts[] = {
+	{ V4L2_PIX_FMT_SBGGR10P, 10, 2, 1, MEDIA_BUS_FMT_SBGGR10_1X10 },
+	{ V4L2_PIX_FMT_SGBRG10P, 10, 2, 1, MEDIA_BUS_FMT_SGBRG10_1X10 },
+	{ V4L2_PIX_FMT_SGRBG10P, 10, 2, 1, MEDIA_BUS_FMT_SGRBG10_1X10 },
+	{ V4L2_PIX_FMT_SRGGB10P, 10, 2, 1, MEDIA_BUS_FMT_SRGGB10_1X10 },
+	{ V4L2_PIX_FMT_SRGGB8,    8, 0, 1, MEDIA_BUS_FMT_SRGGB8_1X8 },
+	{ V4L2_PIX_FMT_SBGGR8,    8, 0, 1, MEDIA_BUS_FMT_SBGGR8_1X8 },
+	{ V4L2_PIX_FMT_SGBRG8,    8, 0, 1, MEDIA_BUS_FMT_SGBRG8_1X8 },
+	{ V4L2_PIX_FMT_SGRBG8,    8, 0, 1, MEDIA_BUS_FMT_SGRBG8_1X8 },
+};
+
+static const struct ope_fmt ope_output_fmts[] = {
+	{ V4L2_PIX_FMT_NV24,  24, 0, 1, MEDIA_BUS_FMT_YUV8_1X24 },
+	{ V4L2_PIX_FMT_NV42,  24, 0, 1, MEDIA_BUS_FMT_YUV8_1X24 },
+	{ V4L2_PIX_FMT_NV16,  16, 1, 1, MEDIA_BUS_FMT_YUYV8_2X8 },
+	{ V4L2_PIX_FMT_NV61,  16, 1, 1, MEDIA_BUS_FMT_YUYV8_2X8 },
+	{ V4L2_PIX_FMT_NV12,  12, 1, 1, MEDIA_BUS_FMT_YUYV8_1_5X8 },
+	{ V4L2_PIX_FMT_NV21,  12, 1, 1, MEDIA_BUS_FMT_YUYV8_1_5X8 },
+	{ V4L2_PIX_FMT_GREY,   8, 0, 1, MEDIA_BUS_FMT_Y8_1X8 },
+};
+
+struct ope_dsc_config {
+	u32 input_width;
+	u32 input_height;
+	u32 output_width;
+	u32 output_height;
+	u32 phase_step_h;
+	u32 phase_step_v;
+	u32 crop_last_pixel;
+	u32 crop_last_line;
+};
+
+struct ope_stripe {
+	struct {
+		dma_addr_t addr;
+		u32 width;
+		u32 height;
+		u32 stride;
+		enum ope_stripe_location location;
+		enum ope_pixel_pattern	pattern;
+		enum ope_unpacker_format format;
+	} src;
+	struct {
+		dma_addr_t addr;
+		u32 width;
+		u32 height;
+		u32 stride;
+		u32 x_init;
+		enum ope_packer_format format;
+		bool enabled;
+	} dst[OPE_WR_CLIENT_MAX];
+	struct ope_dsc_config dsc[OPE_DS_MAX];
+};
+
+/* OPE tuning parameter state */
+
+/* Demosaic (CLC_DEMO) coefficients — internal only, not user-configurable. */
+#define CAMSS_PARAMS_INTERNAL	(-1)
+
+struct ope_params_demo {
+	struct v4l2_isp_params_block_header header;
+	u8 lambda_rb;
+	u8 lambda_g;
+	u16 a_k;
+	u16 w_k;
+	u16 _pad;
+};
+
+/* OPE tuning parameter state */
+struct ope_config {
+	struct camss_params_wb_gain		wb_gain;
+	struct camss_params_chroma_enhan	chroma_enhan;
+	struct camss_params_color_correct	color_correct;
+	struct ope_params_demo			demo;
+};
+
+enum ope_entity {
+	OPE_ENTITY_FRAME_IN,
+	OPE_ENTITY_PARAMS,
+	OPE_ENTITY_PROC,
+	OPE_ENTITY_DISP,
+	OPE_ENTITY_DISP_OUT,
+	OPE_ENTITY_COUNT
+};
+
+enum ope_queue_idx {
+	OPE_QUEUE_FRAME_IN,
+	OPE_QUEUE_DISP_OUT,
+	OPE_QUEUE_PARAMS,
+	OPE_QUEUE_COUNT
+};
+
+/* per-context state */
+struct ope_ctx {
+	struct camss_isp_bufq	*bufq;
+	struct camss_isp_job	job;
+	struct ope_dev		*ope;
+	struct mutex		vbq_lock;
+	struct vb2_queue	vqs[OPE_QUEUE_COUNT];
+
+	unsigned int		framerate;
+	struct ope_fmt_state	fmt_in;
+	struct ope_fmt_state	fmt_out;
+	u32			proc_mbus_code;
+	struct v4l2_rect	disp_compose;
+
+	struct list_head	list;
+	bool			started;
+
+	struct ope_config	config;
+	u8			current_stripe;
+	struct ope_stripe	stripe[OPE_MAX_STRIPE];
+};
+
+/* Per OPE device state */
+struct ope_dev {
+	struct device		*dev;
+	struct v4l2_device	v4l2_dev;
+	struct media_device	mdev;
+	struct camss_isp_pipeline	*pipeline;
+	struct mutex		mutex;
+	struct camss_isp_sched	sched;
+
+	struct icc_path		*icc_data;
+	struct icc_path		*icc_config;
+
+	void __iomem		*base;
+	void __iomem		*base_rd;
+	void __iomem		*base_wr;
+	void __iomem		*base_pp;
+
+	struct completion	reset_complete;
+
+	struct list_head	ctx_list;
+	struct ope_ctx		*shared_ctx;
+	unsigned int		open_count;
+
+	/* Currently active hardware context (set at job start) */
+	struct ope_ctx		*hw_ctx;
+};
+
+/* -------- Register accessors -------- */
+
+static inline u32 ope_read(struct ope_dev *ope, u32 reg)
+{
+	return readl(ope->base + reg);
+}
+
+static inline void ope_write(struct ope_dev *ope, u32 reg, u32 val)
+{
+	writel(val, ope->base + reg);
+}
+
+static inline void ope_write_wr(struct ope_dev *ope, u32 reg, u32 val)
+{
+	writel_relaxed(val, ope->base_wr + reg);
+}
+
+static inline u32 ope_read_wr(struct ope_dev *ope, u32 reg)
+{
+	return readl_relaxed(ope->base_wr + reg);
+}
+
+static inline void ope_write_rd(struct ope_dev *ope, u32 reg, u32 val)
+{
+	writel_relaxed(val, ope->base_rd + reg);
+}
+
+static inline void ope_write_pp(struct ope_dev *ope, u32 reg, u32 val)
+{
+	writel_relaxed(val, ope->base_pp + reg);
+}
+
+static inline void ope_start(struct ope_dev *ope)
+{
+	wmb(); /* ensure all register writes are visible before GO_CMD */
+	ope_write_rd(ope, OPE_BUS_RD_INPUT_IF_CMD, OPE_BUS_RD_INPUT_IF_CMD_GO_CMD);
+}
+
+/* -------- Stripe helpers -------- */
+
+static inline enum ope_stripe_location ope_stripe_location(unsigned int idx, unsigned int count)
+{
+	if (count == 1)
+		return OPE_STRIPE_LOCATION_FULL;
+	if (idx == 0)
+		return OPE_STRIPE_LOCATION_LEFT;
+	if (idx == count - 1)
+		return OPE_STRIPE_LOCATION_RIGHT;
+
+	return OPE_STRIPE_LOCATION_MIDDLE;
+}
+
+static inline bool ope_stripe_is_last(const struct ope_stripe *s)
+{
+	return s && (s->src.location == OPE_STRIPE_LOCATION_RIGHT ||
+		     s->src.location == OPE_STRIPE_LOCATION_FULL);
+}
+
+static inline struct ope_stripe *ope_current_stripe(struct ope_ctx *ctx)
+{
+	if (ctx->current_stripe >= OPE_MAX_STRIPE)
+		return NULL;
+
+	return &ctx->stripe[ctx->current_stripe];
+}
+
+static inline unsigned int ope_stripe_index(struct ope_ctx *ctx,
+					     const struct ope_stripe *stripe)
+{
+	return stripe - &ctx->stripe[0];
+}
+
+static inline struct ope_stripe *ope_prev_stripe(struct ope_ctx *ctx,
+						  struct ope_stripe *stripe)
+{
+	unsigned int idx = ope_stripe_index(ctx, stripe);
+
+	return idx ? &ctx->stripe[idx - 1] : NULL;
+}
+
+static void ope_gen_stripe_chroma_dsc(struct ope_ctx *ctx,
+				      struct ope_stripe *stripe)
+{
+	struct ope_dsc_config *dsc = &stripe->dsc[OPE_DS_C_PRE];
+	u32 dst_fourcc = ctx->fmt_out.fmt->fourcc;
+
+	dsc->input_width  = stripe->src.width;
+	dsc->input_height = stripe->src.height;
+
+	switch (dst_fourcc) {
+	case V4L2_PIX_FMT_NV61:
+	case V4L2_PIX_FMT_NV16:
+		dsc->output_width = dsc->input_width / 2;
+		dsc->output_height = dsc->input_height;
+		break;
+	case V4L2_PIX_FMT_NV12:
+	case V4L2_PIX_FMT_NV21:
+		dsc->output_width = dsc->input_width / 2;
+		dsc->output_height = dsc->input_height / 2;
+		break;
+	default:
+		dsc->output_width = dsc->input_width;
+		dsc->output_height = dsc->input_height;
+	}
+
+	dsc->phase_step_h = DS_Q21(dsc->input_width, dsc->output_width);
+	dsc->phase_step_v = DS_Q21(dsc->input_height, dsc->output_height);
+}
+
+static void ope_gen_stripe_dsc(struct ope_ctx *ctx, struct ope_stripe *stripe,
+			u32 h_scale, u32 v_scale)
+{
+	struct ope_dsc_config *dsc_c = &stripe->dsc[OPE_DS_C_DISP];
+	struct ope_dsc_config *dsc_y = &stripe->dsc[OPE_DS_Y_DISP];
+	unsigned int sw = stripe->src.width;
+	unsigned int sw_c = stripe->dsc[OPE_DS_C_PRE].output_width;
+
+	dsc_c->phase_step_h = dsc_y->phase_step_h = h_scale;
+	dsc_c->phase_step_v = dsc_y->phase_step_v = v_scale;
+
+	dsc_c->input_width  = stripe->dsc[OPE_DS_C_PRE].output_width;
+	dsc_c->input_height = stripe->dsc[OPE_DS_C_PRE].output_height;
+	dsc_y->input_width  = stripe->src.width;
+	dsc_y->input_height = stripe->src.height;
+
+	/*
+	 * WE width/height = DS_OUTPUT_PIX (floor).  The scaler may deliver
+	 * floor or floor+1 pixels/lines; CROP_RND_CLAMP clips the output to
+	 * exactly floor so the WE always receives the expected count.
+	 */
+	dsc_y->output_width  = DS_OUTPUT_PIX(sw, 0, h_scale);
+	dsc_y->output_height = DS_OUTPUT_PIX(stripe->src.height, 0, v_scale);
+	dsc_c->output_width  = DS_OUTPUT_PIX(sw_c, 0, h_scale);
+	dsc_c->output_height = DS_OUTPUT_PIX(stripe->dsc[OPE_DS_C_PRE].output_height, 0, v_scale);
+
+	dsc_y->crop_last_pixel = dsc_y->output_width  - 1;
+	dsc_y->crop_last_line  = dsc_y->output_height - 1;
+	dsc_c->crop_last_pixel = dsc_c->output_width  - 1;
+	dsc_c->crop_last_line  = dsc_c->output_height - 1;
+}
+
+static void ope_gen_stripe_yuv_dst(struct ope_ctx *ctx, struct ope_stripe *stripe, dma_addr_t dst)
+{
+	const struct ope_fmt_state *fo = &ctx->fmt_out;
+	unsigned int img_h = fo->height;
+	unsigned int bpl = fo->bytesperline; /* Y-plane row stride in bytes */
+	const struct ope_hw_fmt *hw = ope_find_hw_fmt(fo->fmt->fourcc);
+	struct ope_stripe *prev = ope_prev_stripe(ctx, stripe);
+	const struct v4l2_rect *compose = &ctx->disp_compose;
+	dma_addr_t y_base = dst + compose->top * bpl;
+	dma_addr_t c_base;
+	u32 x_init = compose->left;
+	u32 c_x_init;
+
+	switch (fo->fmt->fourcc) {
+	case V4L2_PIX_FMT_NV24:
+	case V4L2_PIX_FMT_NV42:
+		/* YUV444: C plane starts after Y plane; full-height, 2 bytes/luma-col */
+		c_base = dst + bpl * img_h + compose->top * bpl * 2;
+		c_x_init = compose->left * 2;
+		break;
+	case V4L2_PIX_FMT_NV16:
+	case V4L2_PIX_FMT_NV61:
+		/* YUV422: C plane = Y plane size; full-height, 1 byte/luma-col */
+		c_base = dst + bpl * img_h + compose->top * bpl;
+		c_x_init = compose->left;
+		break;
+	default:
+		/* YUV420 (NV12/NV21): C plane = Y/2 height, 1 byte/luma-col */
+		c_base = dst + bpl * img_h + (compose->top / 2) * bpl;
+		c_x_init = compose->left;
+		break;
+	}
+
+	stripe->dst[OPE_WR_CLIENT_DISP_Y].enabled = true;
+	stripe->dst[OPE_WR_CLIENT_DISP_C].enabled = true;
+
+	/* Y plane */
+	if (prev)
+		x_init = prev->dst[OPE_WR_CLIENT_DISP_Y].x_init +
+			 prev->dst[OPE_WR_CLIENT_DISP_Y].width;
+
+	stripe->dst[OPE_WR_CLIENT_DISP_Y].addr   = y_base;
+	stripe->dst[OPE_WR_CLIENT_DISP_Y].x_init = x_init;
+	stripe->dst[OPE_WR_CLIENT_DISP_Y].width  = stripe->dsc[OPE_DS_Y_DISP].output_width;
+	stripe->dst[OPE_WR_CLIENT_DISP_Y].height = stripe->dsc[OPE_DS_Y_DISP].output_height;
+	stripe->dst[OPE_WR_CLIENT_DISP_Y].stride = bpl;
+	stripe->dst[OPE_WR_CLIENT_DISP_Y].format = OPE_PACKER_FMT_PLAIN_8;
+
+	/* UV plane */
+	x_init = c_x_init;
+	if (prev)
+		x_init = prev->dst[OPE_WR_CLIENT_DISP_C].x_init +
+			 prev->dst[OPE_WR_CLIENT_DISP_C].width;
+
+	stripe->dst[OPE_WR_CLIENT_DISP_C].addr   = c_base;
+	stripe->dst[OPE_WR_CLIENT_DISP_C].x_init = x_init;
+	stripe->dst[OPE_WR_CLIENT_DISP_C].format = hw ? hw->packer : OPE_PACKER_FMT_PLAIN_8;
+	stripe->dst[OPE_WR_CLIENT_DISP_C].width  = stripe->dsc[OPE_DS_C_DISP].output_width * 2;
+	stripe->dst[OPE_WR_CLIENT_DISP_C].height = stripe->dsc[OPE_DS_C_DISP].output_height;
+
+	switch (fo->fmt->fourcc) {
+	case V4L2_PIX_FMT_NV42:
+	case V4L2_PIX_FMT_NV24:
+		stripe->dst[OPE_WR_CLIENT_DISP_C].stride = bpl * 2;
+		break;
+	case V4L2_PIX_FMT_GREY:
+		stripe->dst[OPE_WR_CLIENT_DISP_C].enabled = false;
+		break;
+	default:
+		stripe->dst[OPE_WR_CLIENT_DISP_C].stride = bpl;
+	}
+}
+
+static void ope_gen_stripes(struct ope_ctx *ctx, dma_addr_t src, dma_addr_t dst)
+{
+	const struct ope_fmt_state *fi = &ctx->fmt_in;
+	const struct v4l2_rect *crop = &fi->crop;
+	const struct v4l2_rect *compose = &ctx->disp_compose;
+	const struct ope_hw_fmt *src_hw = ope_find_hw_fmt(fi->fmt->fourcc);
+	unsigned int num_stripes, width, x_out, x_out_c, i;
+	u32 h_scale, v_scale;
+
+	/* Advance source pointer to the crop origin */
+	src += crop->top * fi->bytesperline + crop->left * fi->fmt->depth / 8;
+	width = crop->width;
+	num_stripes = DIV_ROUND_UP(crop->width, OPE_STRIPE_MAX_W);
+	h_scale = DS_Q21(crop->width, compose->width);
+	v_scale = DS_Q21(crop->height, compose->height);
+
+	x_out = x_out_c = 0;
+
+	for (i = 0; i < num_stripes; i++) {
+		struct ope_stripe *stripe = &ctx->stripe[i];
+		unsigned int sw;
+
+		memset(stripe, 0, sizeof(*stripe));
+
+		stripe->src.addr = src;
+		stripe->src.width = width;
+		stripe->src.height = crop->height;
+		stripe->src.stride = fi->bytesperline;
+		stripe->src.location = ope_stripe_location(i, num_stripes);
+		stripe->src.pattern = src_hw ? src_hw->pattern : 0;
+		stripe->src.format = src_hw ? src_hw->unpacker : 0;
+
+		/* Ensure last stripe is wide enough */
+		if (width > OPE_STRIPE_MAX_W && width < OPE_STRIPE_MAX_W + OPE_STRIPE_MIN_W)
+			stripe->src.width -= OPE_STRIPE_MIN_W * 2;
+
+		v4l_bound_align_image(&stripe->src.width,
+				      OPE_STRIPE_MIN_W, OPE_STRIPE_MAX_W,
+				      fi->fmt->align,
+				      &stripe->src.height,
+				      OPE_STRIPE_MIN_H, OPE_STRIPE_MAX_H,
+				      OPE_ALIGN_H, 0);
+
+		sw = stripe->src.width;
+
+		width -= stripe->src.width;
+		src += stripe->src.width * fi->fmt->depth / 8;
+
+		/*
+		 * Last-stripe adjustment: grow the input width (up to the
+		 * available remaining input) until the scaler delivers at
+		 * least the remaining output pixels for both Y and C.
+		 * CROP_RND_CLAMP then clips the scaler output to exactly
+		 * the remaining pixels so the total sums to fo->width.
+		 */
+		if (ope_stripe_is_last(stripe)) {
+			unsigned int rem_y = compose->width - x_out;
+			unsigned int rem_c = compose->width / 2 - x_out_c;
+			unsigned int s;
+
+			for (s = OPE_STRIPE_MIN_W; s <= sw; s += 2) {
+				if (DS_OUTPUT_PIX(s, 0, h_scale) >= rem_y &&
+				    DS_OUTPUT_PIX(s / 2, 0, h_scale) >= rem_c) {
+					stripe->src.width = s;
+					break;
+				}
+			}
+		}
+
+		ope_gen_stripe_chroma_dsc(ctx, stripe);
+		ope_gen_stripe_dsc(ctx, stripe, h_scale, v_scale);
+		ope_gen_stripe_yuv_dst(ctx, stripe, dst);
+
+		x_out += stripe->dsc[OPE_DS_Y_DISP].output_width;
+		x_out_c += stripe->dsc[OPE_DS_C_DISP].output_width;
+
+		/* Width in bytes for the fetch engine */
+		stripe->src.width = stripe->src.width * fi->fmt->depth / 8;
+	}
+}
+
+/* -------- Pipeline IQ module programming -------- */
+
+static bool ope_module_update(struct ope_ctx *ctx, u32 module_cfg_reg, u32 enable_mask,
+			      struct v4l2_isp_params_block_header *hdr, bool force)
+{
+	bool enable = !(hdr->flags & V4L2_ISP_PARAMS_FL_BLOCK_DISABLE);
+	bool dirty  = hdr->flags & CAMSS_ISP_PARAMS_FL_BLOCK_DIRTY;
+
+	/* skip if neither forced (new context) nor dirty (updated params) */
+	if (!force && !dirty)
+		return false;
+
+	hdr->flags &= ~CAMSS_ISP_PARAMS_FL_BLOCK_DIRTY;
+
+	ope_write_pp(ctx->ope, module_cfg_reg, enable ? enable_mask : 0);
+
+	/* If module is disabled, not need to update content */
+	if (!enable)
+		return false;
+
+	dev_dbg(ctx->ope->dev, "IQ module (%u) update (flags:0x%x)\n", hdr->type, hdr->flags);
+
+	return true;
+}
+
+static void ope_prog_wb(struct ope_ctx *ctx, bool force)
+{
+	struct camss_params_wb_gain *wb = &ctx->config.wb_gain;
+	struct ope_dev *ope = ctx->ope;
+
+	if (!ope_module_update(ctx, OPE_PP_CLC_WB_GAIN_MODULE_CFG,
+			       OPE_PP_CLC_WB_GAIN_MODULE_CFG_EN,
+			       &wb->header, force))
+		return;
+
+	ope_write_pp(ope, OPE_PP_CLC_WB_GAIN_WB_CFG(0), wb->g_gain);
+	ope_write_pp(ope, OPE_PP_CLC_WB_GAIN_WB_CFG(1), wb->b_gain);
+	ope_write_pp(ope, OPE_PP_CLC_WB_GAIN_WB_CFG(2), wb->r_gain);
+}
+
+static void ope_prog_bayer2rgb(struct ope_ctx *ctx, bool force)
+{
+	struct ope_params_demo *demo = &ctx->config.demo;
+	struct ope_dev *ope = ctx->ope;
+
+	if (!ope_module_update(ctx, OPE_PP_CLC_DEMO_MODULE_CFG,
+			       OPE_PP_CLC_DEMO_MODULE_CFG_EN |
+			       OPE_PP_CLC_DEMO_MODULE_CFG_DYN_G_CLAMP_EN,
+			       &demo->header, force))
+		return;
+
+	ope_write_pp(ope, OPE_PP_CLC_DEMO_INTERP_COEFF_CFG,
+		     FIELD_PREP(OPE_PP_CLC_DEMO_INTERP_COEFF_CFG_LAMBDA_G,  demo->lambda_g) |
+		     FIELD_PREP(OPE_PP_CLC_DEMO_INTERP_COEFF_CFG_LAMBDA_RB, demo->lambda_rb));
+	ope_write_pp(ope, OPE_PP_CLC_DEMO_INTERP_CLASSIFIER_CFG_0,
+		     FIELD_PREP(OPE_PP_CLC_DEMO_INTERP_CLASSIFIER_CFG_0_AK, demo->a_k));
+	ope_write_pp(ope, OPE_PP_CLC_DEMO_INTERP_CLASSIFIER_CFG_1,
+		     FIELD_PREP(OPE_PP_CLC_DEMO_INTERP_CLASSIFIER_CFG_1_WK, demo->w_k));
+}
+
+static void ope_prog_rgb2yuv(struct ope_ctx *ctx, bool force)
+{
+	struct camss_params_chroma_enhan *cc = &ctx->config.chroma_enhan;
+	struct ope_dev *ope = ctx->ope;
+
+	if (!ope_module_update(ctx, OPE_PP_CLC_CHROMA_ENHAN_MODULE_CFG,
+			       OPE_PP_CLC_CHROMA_ENHAN_MODULE_CFG_EN,
+			       &cc->header, force))
+		return;
+
+	ope_write_pp(ope, OPE_PP_CLC_CHROMA_ENHAN_LUMA_CFG_0,
+		     FIELD_PREP(OPE_PP_CLC_CHROMA_ENHAN_LUMA_CFG_0_V0, cc->luma_v0) |
+		     FIELD_PREP(OPE_PP_CLC_CHROMA_ENHAN_LUMA_CFG_0_V1, cc->luma_v1));
+	ope_write_pp(ope, OPE_PP_CLC_CHROMA_ENHAN_LUMA_CFG_2,
+		     FIELD_PREP(OPE_PP_CLC_CHROMA_ENHAN_LUMA_CFG_2_V2, cc->luma_v2));
+	ope_write_pp(ope, OPE_PP_CLC_CHROMA_ENHAN_LUMA_CFG_1,
+		     FIELD_PREP(OPE_PP_CLC_CHROMA_ENHAN_LUMA_CFG_1_K, cc->luma_k));
+	ope_write_pp(ope, OPE_PP_CLC_CHROMA_ENHAN_COEFF_A_CFG,
+		     FIELD_PREP(OPE_PP_CLC_CHROMA_ENHAN_COEFF_A_CFG_AP, cc->coeff_ap) |
+		     FIELD_PREP(OPE_PP_CLC_CHROMA_ENHAN_COEFF_A_CFG_AM, cc->coeff_am));
+	ope_write_pp(ope, OPE_PP_CLC_CHROMA_ENHAN_COEFF_B_CFG,
+		     FIELD_PREP(OPE_PP_CLC_CHROMA_ENHAN_COEFF_B_CFG_BP, cc->coeff_dp) |
+		     FIELD_PREP(OPE_PP_CLC_CHROMA_ENHAN_COEFF_B_CFG_BM, cc->coeff_dm));
+	ope_write_pp(ope, OPE_PP_CLC_CHROMA_ENHAN_COEFF_C_CFG,
+		     FIELD_PREP(OPE_PP_CLC_CHROMA_ENHAN_COEFF_C_CFG_CP, cc->coeff_cp) |
+		     FIELD_PREP(OPE_PP_CLC_CHROMA_ENHAN_COEFF_C_CFG_CM, cc->coeff_cm));
+	ope_write_pp(ope, OPE_PP_CLC_CHROMA_ENHAN_COEFF_D_CFG,
+		     FIELD_PREP(OPE_PP_CLC_CHROMA_ENHAN_COEFF_D_CFG_DP, cc->coeff_dp) |
+		     FIELD_PREP(OPE_PP_CLC_CHROMA_ENHAN_COEFF_D_CFG_DM, cc->coeff_dm));
+	ope_write_pp(ope, OPE_PP_CLC_CHROMA_ENHAN_CHROMA_CFG_0,
+		     FIELD_PREP(OPE_PP_CLC_CHROMA_ENHAN_CHROMA_CFG_0_KCB, cc->kcb));
+	ope_write_pp(ope, OPE_PP_CLC_CHROMA_ENHAN_CHROMA_CFG_1,
+		     FIELD_PREP(OPE_PP_CLC_CHROMA_ENHAN_CHROMA_CFG_1_KCR, cc->kcr));
+}
+
+static void ope_prog_color_correct(struct ope_ctx *ctx, bool force)
+{
+	struct camss_params_color_correct *cc = &ctx->config.color_correct;
+	struct ope_dev *ope = ctx->ope;
+
+	if (!ope_module_update(ctx, OPE_PP_CLC_CC_MODULE_CFG,
+			       OPE_PP_CLC_CC_MODULE_CFG_EN,
+			       &cc->header, force))
+		return;
+
+	ope_write_pp(ope, OPE_PP_CLC_CC_COEFF_A_CFG_0,
+		     FIELD_PREP(OPE_PP_CLC_CC_COEFF_A_CFG_0_A0, cc->a[0]) |
+		     FIELD_PREP(OPE_PP_CLC_CC_COEFF_A_CFG_0_A1, cc->a[1]));
+	ope_write_pp(ope, OPE_PP_CLC_CC_COEFF_A_CFG_1,
+		     FIELD_PREP(OPE_PP_CLC_CC_COEFF_A_CFG_1_A2, cc->a[2]));
+	ope_write_pp(ope, OPE_PP_CLC_CC_COEFF_B_CFG_0,
+		     FIELD_PREP(OPE_PP_CLC_CC_COEFF_B_CFG_0_B0, cc->b[0]) |
+		     FIELD_PREP(OPE_PP_CLC_CC_COEFF_B_CFG_0_B1, cc->b[1]));
+	ope_write_pp(ope, OPE_PP_CLC_CC_COEFF_B_CFG_1,
+		     FIELD_PREP(OPE_PP_CLC_CC_COEFF_B_CFG_1_B2, cc->b[2]));
+	ope_write_pp(ope, OPE_PP_CLC_CC_COEFF_C_CFG_0,
+		     FIELD_PREP(OPE_PP_CLC_CC_COEFF_C_CFG_0_C0, cc->c[0]) |
+		     FIELD_PREP(OPE_PP_CLC_CC_COEFF_C_CFG_0_C1, cc->c[1]));
+	ope_write_pp(ope, OPE_PP_CLC_CC_COEFF_C_CFG_1,
+		     FIELD_PREP(OPE_PP_CLC_CC_COEFF_C_CFG_1_C2, cc->c[2]));
+	ope_write_pp(ope, OPE_PP_CLC_CC_COEFF_K_CFG_0,
+		     FIELD_PREP(OPE_PP_CLC_CC_COEFF_K_CFG_0_K0, cc->k[0]));
+	ope_write_pp(ope, OPE_PP_CLC_CC_COEFF_K_CFG_1,
+		     FIELD_PREP(OPE_PP_CLC_CC_COEFF_K_CFG_1_K1, cc->k[1]));
+	ope_write_pp(ope, OPE_PP_CLC_CC_COEFF_K_CFG_2,
+		     FIELD_PREP(OPE_PP_CLC_CC_COEFF_K_CFG_2_K2, cc->k[2]));
+	ope_write_pp(ope, OPE_PP_CLC_CC_COEFF_M_CFG,
+		     FIELD_PREP(OPE_PP_CLC_CC_COEFF_M_CFG_M, cc->m));
+}
+
+static void ope_prog_crop_rnd_clamp(struct ope_dev *ope, const struct ope_stripe *stripe)
+{
+	static const u32 crop_bases[] = {
+		OPE_PP_CLC_CROP_RND_CLAMP_Y_DISP_BASE,
+		OPE_PP_CLC_CROP_RND_CLAMP_C_DISP_BASE,
+	};
+	static const enum ope_downscaler ds_idx[] = {
+		OPE_DS_Y_DISP,
+		OPE_DS_C_DISP,
+	};
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(crop_bases); i++) {
+		const struct ope_dsc_config *dsc = &stripe->dsc[ds_idx[i]];
+		u32 cbase = crop_bases[i];
+
+		if (!dsc->output_width || !dsc->output_height) {
+			ope_write_pp(ope,  OPE_PP_CLC_CROP_RND_CLAMP_MODULE_CFG(cbase), 0);
+			continue;
+		}
+
+		ope_write_pp(ope, OPE_PP_CLC_CROP_RND_CLAMP_CROP_PIXEL_CFG(cbase),
+			     FIELD_PREP(OPE_PP_CLC_CROP_RND_CLAMP_CROP_FIRST, 0) |
+			     FIELD_PREP(OPE_PP_CLC_CROP_RND_CLAMP_CROP_LAST,
+					dsc->crop_last_pixel));
+		ope_write_pp(ope, OPE_PP_CLC_CROP_RND_CLAMP_CROP_LINE_CFG(cbase),
+			     FIELD_PREP(OPE_PP_CLC_CROP_RND_CLAMP_CROP_FIRST, 0) |
+			     FIELD_PREP(OPE_PP_CLC_CROP_RND_CLAMP_CROP_LAST, dsc->crop_last_line));
+		ope_write_pp(ope, OPE_PP_CLC_CROP_RND_CLAMP_MODULE_CFG(cbase),
+			     OPE_PP_CLC_CROP_RND_CLAMP_EN | OPE_PP_CLC_CROP_RND_CLAMP_CROP_EN);
+	}
+}
+
+static void ope_prog_stripe(struct ope_ctx *ctx, struct ope_stripe *stripe)
+{
+	struct ope_dev *ope = ctx->ope;
+	int i;
+
+	dev_dbg(ope->dev, "ctx=%p programming stripe %u\n",
+		ctx, (unsigned int)(stripe - ctx->stripe));
+
+	/* Fetch Engine */
+	ope_write_rd(ope, OPE_BUS_RD_CLIENT_0_UNPACK_CFG_0, stripe->src.format);
+	ope_write_rd(ope, OPE_BUS_RD_CLIENT_0_RD_BUFFER_SIZE,
+		     (stripe->src.width << 16) | stripe->src.height);
+	ope_write_rd(ope, OPE_BUS_RD_CLIENT_0_ADDR_IMAGE, stripe->src.addr);
+	ope_write_rd(ope, OPE_BUS_RD_CLIENT_0_RD_STRIDE, stripe->src.stride);
+	ope_write_rd(ope, OPE_BUS_RD_CLIENT_0_CCIF_META_DATA,
+		     FIELD_PREP(OPE_BUS_RD_CLIENT_0_CCIF_MD_PIX_PATTERN,
+				stripe->src.pattern));
+	ope_write_rd(ope, OPE_BUS_RD_CLIENT_0_CORE_CFG,
+		     OPE_BUS_RD_CLIENT_0_CORE_CFG_EN);
+
+	/* Write Engines */
+	for (i = 0; i < OPE_WR_CLIENT_MAX; i++) {
+		if (!stripe->dst[i].enabled) {
+			ope_write_wr(ope, OPE_BUS_WR_CLIENT_CFG(i), 0);
+			continue;
+		}
+		ope_write_wr(ope, OPE_BUS_WR_CLIENT_ADDR_IMAGE(i),
+			     stripe->dst[i].addr);
+		ope_write_wr(ope, OPE_BUS_WR_CLIENT_IMAGE_CFG_0(i),
+			     (stripe->dst[i].height << 16) | stripe->dst[i].width);
+		ope_write_wr(ope, OPE_BUS_WR_CLIENT_IMAGE_CFG_1(i),
+			     stripe->dst[i].x_init);
+		ope_write_wr(ope, OPE_BUS_WR_CLIENT_IMAGE_CFG_2(i),
+			     stripe->dst[i].stride);
+		ope_write_wr(ope, OPE_BUS_WR_CLIENT_PACKER_CFG(i),
+			     stripe->dst[i].format);
+		ope_write_wr(ope, OPE_BUS_WR_CLIENT_CFG(i),
+			     OPE_BUS_WR_CLIENT_CFG_EN |
+			     OPE_BUS_WR_CLIENT_CFG_AUTORECOVER);
+	}
+
+	/* Downscalers */
+	for (i = 0; i < OPE_DS_MAX; i++) {
+		struct ope_dsc_config *dsc = &stripe->dsc[i];
+		u32 base = ope_ds_base[i];
+		u32 cfg = 0;
+
+		if (dsc->input_width != dsc->output_width) {
+			dsc->phase_step_h |=
+				DS_RESOLUTION(dsc->input_width,
+					      dsc->output_width) << 30;
+			cfg |= OPE_PP_CLC_DOWNSCALE_MN_DS_CFG_H_SCALE_EN;
+		}
+		if (dsc->input_height != dsc->output_height) {
+			dsc->phase_step_v |=
+				DS_RESOLUTION(dsc->input_height,
+					      dsc->output_height) << 30;
+			cfg |= OPE_PP_CLC_DOWNSCALE_MN_DS_CFG_V_SCALE_EN;
+		}
+
+		ope_write_pp(ope, OPE_PP_CLC_DOWNSCALE_MN_DS_CFG(base), cfg);
+		ope_write_pp(ope, OPE_PP_CLC_DOWNSCALE_MN_DS_IMAGE_SIZE_CFG(base),
+			     ((dsc->input_width - 1) << 16) | (dsc->input_height - 1));
+		ope_write_pp(ope, OPE_PP_CLC_DOWNSCALE_MN_DS_MN_H_CFG(base),
+			     dsc->phase_step_h);
+		ope_write_pp(ope, OPE_PP_CLC_DOWNSCALE_MN_DS_MN_V_CFG(base),
+			     dsc->phase_step_v);
+		ope_write_pp(ope, OPE_PP_CLC_DOWNSCALE_MN_CFG(base),
+			     cfg ? OPE_PP_CLC_DOWNSCALE_MN_CFG_EN : 0);
+
+		dev_dbg(ope->dev,
+			"DS[%d] cfg=0x%x in=%ux%u out=%ux%u\n",
+			i, cfg,
+			dsc->input_width, dsc->input_height,
+			dsc->output_width, dsc->output_height);
+	}
+
+	ope_prog_crop_rnd_clamp(ope, stripe);
+}
+
+static void ope_params_apply_wb(void *priv, const union camss_isp_params_block *block)
+{
+	struct ope_ctx *ctx = priv;
+
+	ctx->config.wb_gain = block->wb_gain;
+	ctx->config.wb_gain.header.flags |= CAMSS_ISP_PARAMS_FL_BLOCK_DIRTY;
+}
+
+static void ope_params_apply_chroma_enhan(void *priv, const union camss_isp_params_block *block)
+{
+	struct ope_ctx *ctx = priv;
+
+	ctx->config.chroma_enhan = block->chroma_enhan;
+	ctx->config.chroma_enhan.header.flags |= CAMSS_ISP_PARAMS_FL_BLOCK_DIRTY;
+}
+
+static void ope_params_apply_color_correct(void *priv, const union camss_isp_params_block *block)
+{
+	struct ope_ctx *ctx = priv;
+
+	ctx->config.color_correct = block->color_correct;
+	ctx->config.color_correct.header.flags |= CAMSS_ISP_PARAMS_FL_BLOCK_DIRTY;
+}
+
+static const struct v4l2_isp_params_block_type_info ope_params_type_info[] = {
+	[CAMSS_PARAMS_WB_GAIN]      = { sizeof(struct camss_params_wb_gain) },
+	[CAMSS_PARAMS_CHROMA_ENHAN] = { sizeof(struct camss_params_chroma_enhan) },
+	[CAMSS_PARAMS_COLOR_CORRECT] = { sizeof(struct camss_params_color_correct) },
+};
+
+static const camss_isp_params_handler_fn ope_params_handlers[] = {
+	[CAMSS_PARAMS_WB_GAIN]      = ope_params_apply_wb,
+	[CAMSS_PARAMS_CHROMA_ENHAN] = ope_params_apply_chroma_enhan,
+	[CAMSS_PARAMS_COLOR_CORRECT] = ope_params_apply_color_correct,
+};
+
+static void ope_apply_params(struct ope_ctx *ctx)
+{
+	struct vb2_v4l2_buffer *vbuf;
+
+	vbuf = camss_isp_bufq_next(ctx->bufq, OPE_QUEUE_PARAMS);
+	if (!vbuf)
+		return;
+
+	camss_isp_params_apply(ctx->ope->dev, &vbuf->vb2_buf,
+			       ope_params_type_info,
+			       ope_params_handlers,
+			       ARRAY_SIZE(ope_params_handlers),
+			       ctx);
+}
+
+/* Default/initial tuning parameters */
+static const struct ope_config ope_default_config = {
+	.wb_gain = {
+		.header.type = CAMSS_PARAMS_WB_GAIN,
+		.header.flags = V4L2_ISP_PARAMS_FL_BLOCK_ENABLE |
+				CAMSS_ISP_PARAMS_FL_BLOCK_DIRTY,
+		.g_gain = OPE_WB(1, 1),
+		.b_gain = OPE_WB(3, 2),
+		.r_gain = OPE_WB(3, 2),
+	},
+	.demo = {
+		.header.type = CAMSS_PARAMS_INTERNAL,
+		.header.flags = V4L2_ISP_PARAMS_FL_BLOCK_ENABLE |
+				CAMSS_ISP_PARAMS_FL_BLOCK_DIRTY,
+		.lambda_rb = 0,
+		.lambda_g  = 128,
+		.a_k       = 128,
+		.w_k       = 102,
+	},
+	.chroma_enhan = { /* RGB -> YUV values from BT.601 */
+		.header.type = CAMSS_PARAMS_CHROMA_ENHAN,
+		.header.flags = V4L2_ISP_PARAMS_FL_BLOCK_ENABLE |
+				CAMSS_ISP_PARAMS_FL_BLOCK_DIRTY,
+		.luma_v0  = 0x04d,
+		.luma_v1  = 0x096,
+		.luma_v2  = 0x01d,
+		.luma_k   = 0,
+		.coeff_ap = 0x0e6,
+		.coeff_am = 0x0e6,
+		.coeff_cp = 0x0b3,
+		.coeff_cm = 0x0b3,
+		.coeff_dp = 0xfb3,
+		.coeff_dm = 0xfb3,
+		.kcb      = 128,
+		.kcr      = 128,
+	},
+	.color_correct = {
+		.header.type = CAMSS_PARAMS_COLOR_CORRECT,
+		.header.flags = V4L2_ISP_PARAMS_FL_BLOCK_DISABLE |
+				CAMSS_ISP_PARAMS_FL_BLOCK_DIRTY,
+	}
+};
+
+/* -------- Job scheduling -------- */
+static bool ope_job_ready(void *priv)
+{
+	struct ope_ctx *ctx = priv;
+
+	return ctx->started &&
+	       camss_isp_bufq_num_ready(ctx->bufq, OPE_QUEUE_FRAME_IN)  >= 1 &&
+	       camss_isp_bufq_num_ready(ctx->bufq, OPE_QUEUE_DISP_OUT) >= 1;
+}
+
+static void ope_job_finish(struct ope_ctx *ctx, enum vb2_buffer_state state)
+{
+	struct vb2_v4l2_buffer *src, *dst, *params;
+	bool requeue = false;
+
+	src    = camss_isp_bufq_remove(ctx->bufq, OPE_QUEUE_FRAME_IN);
+	dst    = camss_isp_bufq_remove(ctx->bufq, OPE_QUEUE_DISP_OUT);
+	params = camss_isp_bufq_remove(ctx->bufq, OPE_QUEUE_PARAMS);
+
+	if (dst) {
+		dst->sequence = ctx->fmt_in.sequence++;
+		dst->vb2_buf.timestamp = src->vb2_buf.timestamp;
+	}
+
+	if (dst)
+		camss_isp_buf_done(dst, state);
+	if (src)
+		camss_isp_buf_done(src, state);
+	if (params)
+		camss_isp_buf_done(params, state);
+
+	if (ope_job_ready(ctx) && state == VB2_BUF_STATE_DONE)
+		requeue = true;
+
+	dev_dbg(ctx->ope->dev, "done ctx=%p continue=%s\n", ctx, requeue ? "yes" : "no");
+
+	ctx->ope->hw_ctx = NULL;
+	camss_isp_sched_job_finish(&ctx->ope->sched, &ctx->job, requeue);
+}
+
+static dma_addr_t ope_buf_dma_addr(struct ope_ctx *ctx, unsigned int queue_idx)
+{
+	struct vb2_v4l2_buffer *vbuf = camss_isp_bufq_next(ctx->bufq, queue_idx);
+
+	if (!vbuf)
+		return 0;
+
+	return vb2_dma_contig_plane_dma_addr(&vbuf->vb2_buf, 0);
+}
+
+static void ope_run_job(void *priv, bool ctx_changed)
+{
+	struct ope_ctx *ctx = priv;
+	struct ope_dev *ope = ctx->ope;
+	dma_addr_t src, dst;
+
+	src = ope_buf_dma_addr(ctx, OPE_QUEUE_FRAME_IN);
+	dst = ope_buf_dma_addr(ctx, OPE_QUEUE_DISP_OUT);
+
+	if (!src || !dst) {
+		dev_warn(ope->dev, "Job cannot run, missing buffer\n");
+		camss_isp_sched_job_finish(&ope->sched, &ctx->job, false);
+		return;
+	}
+
+	dev_dbg(ope->dev, "start ctx=%p->%p src=%pad dst=%pad\n",
+		ope->hw_ctx, ctx, &src, &dst);
+
+	ope_apply_params(ctx);
+	ope_gen_stripes(ctx, src, dst);
+
+	ope_prog_wb(ctx, ctx_changed);
+	ope_prog_bayer2rgb(ctx, ctx_changed);
+	ope_prog_color_correct(ctx, ctx_changed);
+	ope_prog_rgb2yuv(ctx, ctx_changed);
+
+	ctx->current_stripe = 0;
+	ope->hw_ctx = ctx;
+	ope_prog_stripe(ctx, &ctx->stripe[0]);
+
+	ope_start(ope);
+}
+
+static void ope_abort_job(void *priv)
+{
+	struct ope_ctx *ctx = priv;
+
+	dev_dbg(ctx->ope->dev, "job abort ctx=%p\n", ctx);
+	ope_write(ctx->ope, OPE_TOP_RESET_CMD, OPE_TOP_RESET_CMD_SW);
+
+	/* Scheduler will wait for completion (on reset complete isr) */
+}
+
+static void ope_try_schedule(struct ope_ctx *ctx)
+{
+	camss_isp_sched_try_run(&ctx->ope->sched, &ctx->job);
+}
+
+static const struct camss_isp_job_ops ope_job_ops = {
+	.ready = ope_job_ready,
+	.run   = ope_run_job,
+	.abort = ope_abort_job,
+};
+
+/* -------- Interrupt handlers -------- */
+
+static void ope_fe_irq(struct ope_dev *ope)
+{
+	u32 status = readl_relaxed(ope->base_rd + OPE_BUS_RD_INPUT_IF_IRQ_STATUS);
+
+	writel_relaxed(status, ope->base_rd + OPE_BUS_RD_INPUT_IF_IRQ_CLEAR);
+	writel_relaxed(OPE_BUS_RD_INPUT_IF_IRQ_CMD_CLEAR,
+		       ope->base_rd + OPE_BUS_RD_INPUT_IF_IRQ_CMD);
+}
+
+static void ope_we_irq(struct ope_dev *ope, struct ope_ctx *ctx)
+{
+	u32 status;
+
+	status = ope_read_wr(ope, OPE_BUS_WR_INPUT_IF_IRQ_STATUS_0);
+	ope_write_wr(ope, OPE_BUS_WR_INPUT_IF_IRQ_CLEAR_0, status);
+	ope_write_wr(ope, OPE_BUS_WR_INPUT_IF_IRQ_CMD, OPE_BUS_WR_INPUT_IF_IRQ_CMD_CLEAR);
+
+	if (!ctx)
+		return;
+
+	if (status & OPE_BUS_WR_INPUT_IF_IRQ_STATUS_0_CONS_VIOL) {
+		u32 viol = ope_read_wr(ope, OPE_BUS_WR_VIOLATION_STATUS);
+
+		dev_err_ratelimited(ope->dev, "constraint violation (clients=0x%x)\n", viol);
+		ope_write(ctx->ope, OPE_TOP_RESET_CMD, OPE_TOP_RESET_CMD_SW);
+	}
+
+	if (status & OPE_BUS_WR_INPUT_IF_IRQ_STATUS_0_IMG_SZ_VIOL) {
+		u32 viol = ope_read_wr(ope, OPE_BUS_WR_IMAGE_SIZE_VIOLATION_STATUS);
+		int i;
+
+		for (i = 0; i < OPE_WR_CLIENT_MAX; i++) {
+			if (BIT(i) & viol)
+				dev_err_ratelimited(ope->dev, "WE%d: image size violation\n", i);
+		}
+		ope_write(ctx->ope, OPE_TOP_RESET_CMD, OPE_TOP_RESET_CMD_SW);
+	}
+
+	if (status & OPE_BUS_WR_INPUT_IF_IRQ_STATUS_0_VIOL) {
+		u32 viol = ope_read_wr(ope, OPE_BUS_WR_VIOLATION_STATUS);
+
+		dev_err_ratelimited(ope->dev, "fatal violation (status=0x%08x)\n", viol);
+		ope_write(ctx->ope, OPE_TOP_RESET_CMD, OPE_TOP_RESET_CMD_SW);
+	}
+
+	if (status & OPE_BUS_WR_INPUT_IF_IRQ_STATUS_0_RUP_DONE) {
+		/* Register update done: program next stripe (double-buffered) */
+		struct ope_stripe *stripe = ope_current_stripe(ctx);
+
+		if (stripe && !ope_stripe_is_last(stripe))
+			ope_prog_stripe(ctx, stripe + 1);
+	}
+}
+
+
+static void __ope_irq_init(struct ope_dev *ope)
+{
+	ope_write(ope, OPE_TOP_IRQ_MASK,
+		  OPE_TOP_IRQ_STATUS_RST_DONE |
+		  OPE_TOP_IRQ_STATUS_WE |
+		  OPE_TOP_IRQ_STATUS_VIOL |
+		  OPE_TOP_IRQ_STATUS_IDLE);
+	ope_write_wr(ope, OPE_BUS_WR_INPUT_IF_IRQ_MASK_0,
+		     OPE_BUS_WR_INPUT_IF_IRQ_STATUS_0_RUP_DONE |
+		     OPE_BUS_WR_INPUT_IF_IRQ_STATUS_0_CONS_VIOL |
+		     OPE_BUS_WR_INPUT_IF_IRQ_STATUS_0_VIOL |
+		     OPE_BUS_WR_INPUT_IF_IRQ_STATUS_0_IMG_SZ_VIOL);
+}
+
+static irqreturn_t ope_irq(int irq, void *dev_id)
+{
+	struct ope_dev *ope = dev_id;
+	struct ope_ctx *ctx;
+	u32 status;
+
+	/*
+	 * hw_ctx is safe to read here without a lock: ope_run_job() sets it
+	 * before calling ope_start(), so the hardware cannot raise an IRQ
+	 * before hw_ctx is visible.  ope_job_finish() clears it in IRQ context
+	 * (i.e. here), so the clear is serialised with this read by the IRQ
+	 * itself.
+	 */
+	ctx = ope->hw_ctx;
+
+	status = ope_read(ope, OPE_TOP_IRQ_STATUS);
+	ope_write(ope, OPE_TOP_IRQ_CLEAR, status);
+	ope_write(ope, OPE_TOP_IRQ_CMD, OPE_TOP_IRQ_CMD_CLEAR);
+
+	if (status & OPE_TOP_IRQ_STATUS_RST_DONE) {
+		dev_dbg(ope->dev, "reset done ctx=%p\n", ctx);
+		if (ctx)
+			ope_job_finish(ctx, VB2_BUF_STATE_ERROR);
+		complete(&ope->reset_complete);
+	}
+
+	if (status & OPE_TOP_IRQ_STATUS_VIOL)
+		dev_warn(ope->dev, "OPE violation: 0x%08x\n",
+			 ope_read(ope, OPE_TOP_VIOLATION_STATUS));
+
+	if (status & OPE_TOP_IRQ_STATUS_FE)
+		ope_fe_irq(ope);
+
+	if (status & OPE_TOP_IRQ_STATUS_WE)
+		ope_we_irq(ope, ctx);
+
+	if ((status & OPE_TOP_IRQ_STATUS_IDLE) && ctx) {
+		struct ope_stripe *stripe = ope_current_stripe(ctx);
+
+		dev_dbg(ope->dev, "stripe %u done ctx=%p\n", ctx->current_stripe, ctx);
+
+		if (ope_stripe_is_last(stripe)) {
+			ctx->current_stripe = 0;
+			ope_job_finish(ctx, VB2_BUF_STATE_DONE);
+		} else {
+			ctx->current_stripe++;
+			ope_start(ope);
+		}
+	}
+
+	return IRQ_HANDLED;
+}
+
+/* -------- vb2 queue private data -------- */
+
+struct ope_vq_priv {
+	struct ope_ctx	*ctx;
+	unsigned int	queue_idx;
+};
+
+static inline struct ope_ctx *ope_ctx_from_vq(struct vb2_queue *q)
+{
+	return ((struct ope_vq_priv *)vb2_get_drv_priv(q))->ctx;
+}
+
+static inline unsigned int ope_idx_from_vq(struct vb2_queue *q)
+{
+	return ((struct ope_vq_priv *)vb2_get_drv_priv(q))->queue_idx;
+}
+
+/* -------- vb2 ops -------- */
+
+static int ope_queue_setup(struct vb2_queue *q, unsigned int *nbuffers,
+			   unsigned int *nplanes, unsigned int sizes[],
+			   struct device *alloc_devs[])
+{
+	struct ope_ctx *ctx = ope_ctx_from_vq(q);
+	unsigned int idx = ope_idx_from_vq(q);
+	unsigned int size;
+
+	if (idx == OPE_QUEUE_FRAME_IN)
+		size = ctx->fmt_in.sizeimage ? ctx->fmt_in.sizeimage : PAGE_SIZE;
+	else if (idx == OPE_QUEUE_DISP_OUT)
+		size = ctx->fmt_out.sizeimage ? ctx->fmt_out.sizeimage : PAGE_SIZE;
+	else
+		size = v4l2_isp_params_buffer_size(CAMSS_PARAMS_MAX_PAYLOAD);
+
+	if (*nplanes) {
+		if (*nplanes != 1 || sizes[0] < size)
+			return -EINVAL;
+	} else {
+		*nplanes = 1;
+		sizes[0] = size;
+	}
+
+	return 0;
+}
+
+static int ope_buf_prepare(struct vb2_buffer *vb)
+{
+	struct ope_ctx *ctx = ope_ctx_from_vq(vb->vb2_queue);
+	unsigned int idx = ope_idx_from_vq(vb->vb2_queue);
+	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
+	unsigned int sizeimage;
+
+	if (idx == OPE_QUEUE_FRAME_IN)
+		sizeimage = ctx->fmt_in.sizeimage;
+	else if (idx == OPE_QUEUE_DISP_OUT)
+		sizeimage = ctx->fmt_out.sizeimage;
+	else
+		sizeimage = v4l2_isp_params_buffer_size(CAMSS_PARAMS_MAX_PAYLOAD);
+
+	if (V4L2_TYPE_IS_OUTPUT(vb->vb2_queue->type)) {
+		if (vb->vb2_queue->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) {
+			if (vbuf->field == V4L2_FIELD_ANY)
+				vbuf->field = V4L2_FIELD_NONE;
+			if (vbuf->field != V4L2_FIELD_NONE)
+				return -EINVAL;
+		}
+	}
+
+	if (vb2_plane_size(vb, 0) < sizeimage)
+		return -EINVAL;
+
+	if (V4L2_TYPE_IS_CAPTURE(vb->vb2_queue->type))
+		vb2_set_plane_payload(vb, 0, sizeimage);
+
+	return 0;
+}
+
+static void ope_buf_queue(struct vb2_buffer *vb)
+{
+	struct ope_ctx *ctx = ope_ctx_from_vq(vb->vb2_queue);
+	unsigned int idx = ope_idx_from_vq(vb->vb2_queue);
+	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
+
+	camss_isp_bufq_queue(ctx->bufq, idx, vbuf);
+	ope_try_schedule(ctx);
+}
+
+/* -------- Power scaling -------- */
+
+static inline unsigned long ope_pixclk(const struct ope_fmt_state *fs, unsigned int fps)
+{
+	return (unsigned long)fs->width * fs->height * fps;
+}
+
+static inline unsigned int ope_load_avg(const struct ope_fmt_state *fs, unsigned int fps)
+{
+	return mult_frac(ope_pixclk(fs, fps), fs->fmt->depth, 1000) / 8;
+}
+
+static inline unsigned int ope_load_peak(const struct ope_fmt_state *fs, unsigned int fps)
+{
+	return ope_load_avg(fs, fps) * 2;
+}
+
+static inline unsigned int ope_load_config(const struct ope_fmt_state *fs, unsigned int fps)
+{
+	unsigned int stripe_count = fs->width / OPE_STRIPE_MAX_W + 1;
+
+	/* In worst case we have ~50 32-bit registers to write */
+	return mult_frac(stripe_count * 50 * 4, fps, 1000);
+}
+
+static void ope_adjust_power(struct ope_dev *ope)
+{
+	unsigned int loadavg = 0, loadpeak = 0, loadconfig = 0;
+	unsigned long pixclk = 0;
+	struct dev_pm_opp *opp;
+	struct ope_ctx *ctx;
+	int ret;
+
+	list_for_each_entry(ctx, &ope->ctx_list, list) {
+		unsigned int fps;
+
+		if (!ctx->started)
+			continue;
+
+		fps = ctx->framerate ? ctx->framerate : DEFAULT_FRAMERATE;
+
+		pixclk     += ope_pixclk(&ctx->fmt_in, fps);
+		loadavg    += ope_load_avg(&ctx->fmt_in,  fps);
+		loadavg    += ope_load_avg(&ctx->fmt_out, fps);
+		loadpeak   += ope_load_peak(&ctx->fmt_in,  fps);
+		loadpeak   += ope_load_peak(&ctx->fmt_out, fps);
+		loadconfig += ope_load_config(&ctx->fmt_in, fps);
+	}
+
+	/* 30% margin for overhead */
+	pixclk = mult_frac(pixclk, 13, 10);
+
+	dev_dbg(ope->dev, "adjust power: clk=%luHz avg=%uKBps peak=%uKBps cfg=%uKBps\n",
+		pixclk, loadavg, loadpeak, loadconfig);
+
+	opp = dev_pm_opp_find_freq_ceil(ope->dev, &pixclk);
+	if (IS_ERR(opp))
+		dev_warn(ope->dev, "Requested pixel clock %luHz exceeds hardware limit\n", pixclk);
+	else
+		dev_pm_opp_put(opp);
+
+	ret = dev_pm_opp_set_rate(ope->dev, pixclk);
+	if (ret)
+		dev_warn(ope->dev, "Failed to set OPP rate: %d\n", ret);
+
+	ret = icc_set_bw(ope->icc_data, loadavg, loadpeak);
+	if (ret)
+		dev_warn(ope->dev, "Failed to set data path BW: %d\n", ret);
+
+	ret = icc_set_bw(ope->icc_config, loadconfig, loadconfig * 5);
+	if (ret)
+		dev_warn(ope->dev, "Failed to set config path BW: %d\n", ret);
+}
+
+static int ope_start_streaming(struct vb2_queue *q, unsigned int count)
+{
+	struct ope_ctx *ctx = ope_ctx_from_vq(q);
+	unsigned int idx = ope_idx_from_vq(q);
+	int ret;
+
+	dev_dbg(ctx->ope->dev, "streaming start ctx=%p queue=%u\n", ctx, idx);
+
+	ret = pm_runtime_resume_and_get(ctx->ope->dev);
+	if (ret) {
+		dev_err(ctx->ope->dev, "resume failed (%d)\n", ret);
+		return ret;
+	}
+
+	if (idx == OPE_QUEUE_FRAME_IN) {
+		ctx->fmt_in.sequence = 0;
+		ctx->started = true;
+		ope_adjust_power(ctx->ope);
+		__ope_irq_init(ctx->ope);
+	}
+
+	ope_try_schedule(ctx);
+
+	return 0;
+}
+
+static void ope_stop_streaming(struct vb2_queue *q)
+{
+	struct ope_ctx *ctx = ope_ctx_from_vq(q);
+	unsigned int idx = ope_idx_from_vq(q);
+
+	dev_dbg(ctx->ope->dev, "streaming stop ctx=%p queue=%u\n", ctx, idx);
+
+	if (idx == OPE_QUEUE_FRAME_IN) {
+		ctx->started = false;
+		ope_adjust_power(ctx->ope);
+	}
+
+	camss_isp_bufq_drain(ctx->bufq, idx, VB2_BUF_STATE_ERROR);
+
+	pm_runtime_put(ctx->ope->dev);
+}
+
+static const struct vb2_ops ope_vb2_ops = {
+	.queue_setup = ope_queue_setup,
+	.buf_prepare = ope_buf_prepare,
+	.buf_queue = ope_buf_queue,
+	.start_streaming = ope_start_streaming,
+	.stop_streaming = ope_stop_streaming,
+};
+
+static int ope_init_vq(struct ope_ctx *ctx, unsigned int idx)
+{
+	struct ope_dev *ope = ctx->ope;
+	struct ope_vq_priv *qpriv;
+	struct vb2_queue *q = &ctx->vqs[idx];
+
+	qpriv = devm_kzalloc(ope->dev, sizeof(*qpriv), GFP_KERNEL);
+	if (!qpriv)
+		return -ENOMEM;
+
+	qpriv->ctx = ctx;
+	qpriv->queue_idx = idx;
+	q->drv_priv = qpriv;
+	q->ops = &ope_vb2_ops;
+	q->lock = &ctx->vbq_lock;
+	q->dev = ope->dev;
+	q->buf_struct_size = sizeof(struct camss_isp_buf);
+	q->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_COPY;
+
+	if (idx == OPE_QUEUE_PARAMS) {
+		q->type = V4L2_BUF_TYPE_META_OUTPUT;
+		q->mem_ops = &vb2_vmalloc_memops;
+		q->io_modes = VB2_MMAP | VB2_USERPTR;
+	} else if (idx == OPE_QUEUE_DISP_OUT) {
+		q->type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
+		q->mem_ops = &vb2_dma_contig_memops;
+		q->io_modes = VB2_MMAP | VB2_DMABUF;
+	} else {
+		q->type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE;
+		q->mem_ops = &vb2_dma_contig_memops;
+		q->io_modes = VB2_MMAP | VB2_DMABUF;
+	}
+
+	return vb2_queue_init(q);
+}
+
+/* -------- Format helpers -------- */
+
+static const struct ope_fmt *ope_find_fmt(const struct ope_fmt *fmts,
+					  unsigned int n, u32 fourcc)
+{
+	unsigned int i;
+
+	for (i = 0; i < n; i++)
+		if (fmts[i].fourcc == fourcc)
+			return &fmts[i];
+
+	return NULL;
+}
+
+static const struct ope_fmt *ope_fmt_try(struct ope_dev *ope, bool is_output,
+					 struct v4l2_pix_format_mplane *pix)
+{
+	const struct ope_fmt *fmts = is_output ? ope_output_fmts : ope_input_fmts;
+	unsigned int n = is_output ? ARRAY_SIZE(ope_output_fmts) : ARRAY_SIZE(ope_input_fmts);
+	unsigned int max_w = OPE_MAX_W, max_h = OPE_MAX_H;
+	const struct ope_fmt *fmt;
+	unsigned int bytesperline;
+
+	fmt = ope_find_fmt(fmts, n, pix->pixelformat);
+	if (!fmt) {
+		fmt = &fmts[0];
+		pix->pixelformat = fmt->fourcc;
+	}
+
+	v4l_bound_align_image(&pix->width,  OPE_MIN_W, max_w, fmt->align,
+			      &pix->height, OPE_MIN_H, max_h, 0, 0);
+
+	pix->num_planes = 1;
+	pix->field = V4L2_FIELD_NONE;
+	if (!pix->colorspace)
+		pix->colorspace = is_output ? V4L2_COLORSPACE_SRGB : V4L2_COLORSPACE_RAW;
+	/*
+	 * Output formats are semi-planar or grey-scale (Y plane only) always
+	 * using 1 byte per Y value. pix->bytesperline stores the Y-plane bpl.
+	 * Depth tracks the total storage size including the second combined
+	 * Cb + Cr plane which directly follows the Y plane and is used for
+	 * sizeimage calculations rather then for bytesperline.
+	 */
+	if (is_output)
+		bytesperline = pix->width;
+	else
+		bytesperline = pix->width * fmt->depth / 8;
+
+	if (pix->plane_fmt[0].bytesperline < bytesperline)
+		pix->plane_fmt[0].bytesperline = bytesperline;
+
+
+	if (is_output)
+		pix->plane_fmt[0].sizeimage =
+			(u64)pix->plane_fmt[0].bytesperline * pix->height * fmt->depth / 8;
+	else
+		pix->plane_fmt[0].sizeimage = pix->plane_fmt[0].bytesperline * pix->height;
+
+	return fmt;
+}
+
+/* -------- ioctl helpers/ops -------- */
+
+static inline unsigned int ope_queue_idx_from_file(struct file *file)
+{
+	return (unsigned int)(uintptr_t)video_get_drvdata(video_devdata(file));
+}
+
+static struct vb2_queue *ope_vq_from_file(struct file *file, struct ope_ctx *ctx)
+{
+	unsigned int idx = ope_queue_idx_from_file(file);
+
+	if (idx >= OPE_QUEUE_COUNT)
+		return NULL;
+
+	return &ctx->vqs[idx];
+}
+
+static struct ope_ctx *ope_ctx_from_file(struct file *file)
+{
+	struct ope_dev *ope = container_of(video_devdata(file)->v4l2_dev,
+					   struct ope_dev, v4l2_dev);
+
+	return ope->shared_ctx;
+}
+
+static int ope_querycap(struct file *file, void *priv, struct v4l2_capability *cap)
+{
+	strscpy(cap->driver, OPE_NAME, sizeof(cap->driver));
+	strscpy(cap->card, "Qualcomm CAMSS OPE", sizeof(cap->card));
+
+	return 0;
+}
+
+static int ope_enum_fmt_vid_out(struct file *file, void *priv, struct v4l2_fmtdesc *f)
+{
+	if (f->index >= ARRAY_SIZE(ope_input_fmts))
+		return -EINVAL;
+
+	f->pixelformat = ope_input_fmts[f->index].fourcc;
+
+	return 0;
+}
+
+static int ope_g_fmt_vid_out(struct file *file, void *priv, struct v4l2_format *f)
+{
+	struct ope_ctx *ctx = ope_ctx_from_file(file);
+	struct ope_fmt_state *fs = &ctx->fmt_in;
+	struct v4l2_pix_format_mplane *pix = &f->fmt.pix_mp;
+
+	pix->pixelformat		= fs->fmt->fourcc;
+	pix->width			= fs->width;
+	pix->height			= fs->height;
+	pix->num_planes			= 1;
+	pix->field			= V4L2_FIELD_NONE;
+	pix->colorspace			= fs->colorspace;
+	pix->xfer_func			= fs->xfer_func;
+	pix->ycbcr_enc			= fs->ycbcr_enc;
+	pix->quantization		= fs->quantization;
+	pix->plane_fmt[0].bytesperline	= fs->bytesperline;
+	pix->plane_fmt[0].sizeimage	= fs->sizeimage;
+
+	return 0;
+}
+
+static int ope_try_fmt_vid_out(struct file *file, void *priv, struct v4l2_format *f)
+{
+	struct ope_ctx *ctx = ope_ctx_from_file(file);
+
+	ope_fmt_try(ctx->ope, false, &f->fmt.pix_mp);
+
+	return 0;
+}
+
+static int ope_s_fmt_vid_out(struct file *file, void *priv, struct v4l2_format *f)
+{
+	struct ope_ctx *ctx = ope_ctx_from_file(file);
+	const struct ope_fmt *fmt;
+
+	if (vb2_is_busy(&ctx->vqs[OPE_QUEUE_FRAME_IN]))
+		return -EBUSY;
+
+	fmt = ope_fmt_try(ctx->ope, false, &f->fmt.pix_mp);
+	ctx->fmt_in.fmt		    = fmt;
+	ctx->fmt_in.width	    = f->fmt.pix_mp.width;
+	ctx->fmt_in.height	    = f->fmt.pix_mp.height;
+	ctx->fmt_in.bytesperline    = f->fmt.pix_mp.plane_fmt[0].bytesperline;
+	ctx->fmt_in.sizeimage	    = f->fmt.pix_mp.plane_fmt[0].sizeimage;
+	ctx->fmt_in.colorspace	    = f->fmt.pix_mp.colorspace;
+	ctx->fmt_in.xfer_func	    = f->fmt.pix_mp.xfer_func;
+	ctx->fmt_in.ycbcr_enc	    = f->fmt.pix_mp.ycbcr_enc;
+	ctx->fmt_in.quantization    = f->fmt.pix_mp.quantization;
+
+	/* Reset crop to full input frame */
+	ctx->fmt_in.crop.left   = 0;
+	ctx->fmt_in.crop.top    = 0;
+	ctx->fmt_in.crop.width  = ctx->fmt_in.width;
+	ctx->fmt_in.crop.height = ctx->fmt_in.height;
+
+	return 0;
+}
+
+static int ope_enum_fmt_vid_cap(struct file *file, void *priv, struct v4l2_fmtdesc *f)
+{
+	struct ope_ctx *ctx = ope_ctx_from_file(file);
+	unsigned int i, n = 0;
+
+	for (i = 0; i < ARRAY_SIZE(ope_output_fmts); i++) {
+		if (ope_output_fmts[i].mbus_code != ctx->proc_mbus_code)
+			continue;
+		if (n++ == f->index) {
+			f->pixelformat = ope_output_fmts[i].fourcc;
+			return 0;
+		}
+	}
+
+	return -EINVAL;
+}
+
+static int ope_g_fmt_vid_cap(struct file *file, void *priv, struct v4l2_format *f)
+{
+	struct ope_ctx *ctx = ope_ctx_from_file(file);
+	struct ope_fmt_state *fs = &ctx->fmt_out;
+	struct v4l2_pix_format_mplane *pix = &f->fmt.pix_mp;
+
+	pix->pixelformat		= fs->fmt->fourcc;
+	pix->width			= fs->width;
+	pix->height			= fs->height;
+	pix->num_planes			= 1;
+	pix->field			= V4L2_FIELD_NONE;
+	pix->colorspace			= fs->colorspace;
+	pix->xfer_func			= fs->xfer_func;
+	pix->ycbcr_enc			= fs->ycbcr_enc;
+	pix->quantization		= fs->quantization;
+	pix->plane_fmt[0].bytesperline	= fs->bytesperline;
+	pix->plane_fmt[0].sizeimage	= fs->sizeimage;
+
+	return 0;
+}
+
+static int ope_try_fmt_vid_cap(struct file *file, void *priv, struct v4l2_format *f)
+{
+	struct ope_ctx *ctx = ope_ctx_from_file(file);
+
+	ope_fmt_try(ctx->ope, true, &f->fmt.pix_mp);
+
+	return 0;
+}
+
+static int ope_s_fmt_vid_cap(struct file *file, void *priv, struct v4l2_format *f)
+{
+	struct ope_ctx *ctx = ope_ctx_from_file(file);
+	const struct ope_fmt *fmt;
+
+	if (vb2_is_busy(&ctx->vqs[OPE_QUEUE_DISP_OUT]))
+		return -EBUSY;
+
+	fmt = ope_fmt_try(ctx->ope, true, &f->fmt.pix_mp);
+
+	ctx->fmt_out.fmt	    = fmt;
+	ctx->fmt_out.width	    = f->fmt.pix_mp.width;
+	ctx->fmt_out.height	    = f->fmt.pix_mp.height;
+	ctx->fmt_out.bytesperline   = f->fmt.pix_mp.plane_fmt[0].bytesperline;
+	ctx->fmt_out.sizeimage	    = f->fmt.pix_mp.plane_fmt[0].sizeimage;
+	ctx->fmt_out.colorspace	    = f->fmt.pix_mp.colorspace;
+	ctx->fmt_out.xfer_func	    = f->fmt.pix_mp.xfer_func;
+	ctx->fmt_out.ycbcr_enc	    = f->fmt.pix_mp.ycbcr_enc;
+	ctx->fmt_out.quantization   = f->fmt.pix_mp.quantization;
+	/* Sync proc mbus code with selected pixel format */
+	ctx->proc_mbus_code = fmt->mbus_code;
+	/* Reset scaler output to full crop (no scaling) */
+	ctx->disp_compose.left = 0;
+	ctx->disp_compose.top = 0;
+	ctx->disp_compose.width = ctx->fmt_in.crop.width;
+	ctx->disp_compose.height = ctx->fmt_in.crop.height;
+
+	return 0;
+}
+
+/* Input crop */
+static int ope_g_selection(struct file *file, void *priv,
+			   struct v4l2_selection *s)
+{
+	struct ope_ctx *ctx = ope_ctx_from_file(file);
+
+	if (s->type != V4L2_BUF_TYPE_VIDEO_OUTPUT &&
+	    s->type != V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
+		return -EINVAL;
+
+	switch (s->target) {
+	case V4L2_SEL_TGT_CROP:
+		s->r = ctx->fmt_in.crop;
+		return 0;
+	case V4L2_SEL_TGT_CROP_DEFAULT:
+	case V4L2_SEL_TGT_CROP_BOUNDS:
+		s->r.left = s->r.top = 0;
+		s->r.width = ctx->fmt_in.width;
+		s->r.height = ctx->fmt_in.height;
+		return 0;
+	}
+
+	return -EINVAL;
+}
+
+static int ope_s_selection(struct file *file, void *priv,
+			   struct v4l2_selection *s)
+{
+	struct ope_ctx *ctx = ope_ctx_from_file(file);
+
+	if (s->type != V4L2_BUF_TYPE_VIDEO_OUTPUT && s->type != V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
+		return -EINVAL;
+	if (s->target != V4L2_SEL_TGT_CROP)
+		return -EINVAL;
+	if (vb2_is_busy(&ctx->vqs[OPE_QUEUE_FRAME_IN]))
+		return -EBUSY;
+
+	s->r.left = clamp_t(int, s->r.left, 0, (int)ctx->fmt_in.width - OPE_MIN_W);
+	s->r.top = clamp_t(int, s->r.top,  0, (int)ctx->fmt_in.height - OPE_MIN_H);
+	s->r.width = clamp(s->r.width,  (unsigned int)OPE_MIN_W,
+			   ctx->fmt_in.width  - (unsigned int)s->r.left);
+	s->r.height = clamp(s->r.height, (unsigned int)OPE_MIN_H,
+			    ctx->fmt_in.height - (unsigned int)s->r.top);
+	ctx->fmt_in.crop = s->r;
+
+	return 0;
+}
+
+static int ope_g_fmt_meta(struct file *file, void *priv, struct v4l2_format *f)
+{
+	f->fmt.meta.dataformat = V4L2_META_FMT_QCOM_ISP_PARAMS;
+	f->fmt.meta.buffersize = v4l2_isp_params_buffer_size(CAMSS_PARAMS_MAX_PAYLOAD);
+
+	return 0;
+}
+
+static int ope_enum_fmt_meta_out(struct file *file, void *priv, struct v4l2_fmtdesc *f)
+{
+	if (f->index > 0)
+		return -EINVAL;
+
+	f->pixelformat = V4L2_META_FMT_QCOM_ISP_PARAMS;
+
+	return 0;
+}
+
+static int ope_g_parm(struct file *file, void *priv, struct v4l2_streamparm *sp)
+{
+	struct ope_ctx *ctx = ope_ctx_from_file(file);
+
+	if (!V4L2_TYPE_IS_OUTPUT(sp->type))
+		return -EINVAL;
+
+	sp->parm.output.capability = V4L2_CAP_TIMEPERFRAME;
+	sp->parm.output.timeperframe = ctx->fmt_in.timeperframe;
+
+	return 0;
+}
+
+static int ope_s_parm(struct file *file, void *priv, struct v4l2_streamparm *sp)
+{
+	struct ope_ctx *ctx = ope_ctx_from_file(file);
+	struct v4l2_fract *tpf = &sp->parm.output.timeperframe;
+
+	if (!V4L2_TYPE_IS_OUTPUT(sp->type))
+		return -EINVAL;
+
+	if (vb2_is_busy(&ctx->vqs[OPE_QUEUE_FRAME_IN]))
+		return -EBUSY;
+
+	if (!tpf->denominator)
+		tpf->denominator = 1;
+	if (!tpf->numerator)
+		tpf->numerator = 1;
+
+	ctx->fmt_in.timeperframe = *tpf;
+	ctx->framerate = tpf->denominator / tpf->numerator;
+	sp->parm.output.capability = V4L2_CAP_TIMEPERFRAME;
+
+	ope_adjust_power(ctx->ope);
+
+	return 0;
+}
+
+static int ope_enum_framesizes(struct file *file, void *priv, struct v4l2_frmsizeenum *fsize)
+{
+	unsigned int idx = ope_queue_idx_from_file(file);
+	const struct ope_fmt *fmts;
+	unsigned int n;
+
+	if (idx == OPE_QUEUE_FRAME_IN) {
+		fmts = ope_input_fmts;
+		n = ARRAY_SIZE(ope_input_fmts);
+	} else {
+		fmts = ope_output_fmts;
+		n = ARRAY_SIZE(ope_output_fmts);
+	}
+
+	if (fsize->index > 0 || !ope_find_fmt(fmts, n, fsize->pixel_format))
+		return -EINVAL;
+
+	fsize->type = V4L2_FRMSIZE_TYPE_STEPWISE;
+	fsize->stepwise.min_width = OPE_MIN_W;
+	fsize->stepwise.max_width = OPE_MAX_W;
+	fsize->stepwise.step_width = 1;
+	fsize->stepwise.min_height = OPE_MIN_H;
+	fsize->stepwise.max_height = OPE_MAX_H;
+	fsize->stepwise.step_height = 1;
+
+	return 0;
+}
+
+static int ope_reqbufs(struct file *file, void *priv, struct v4l2_requestbuffers *rb)
+{
+	struct ope_ctx *ctx = ope_ctx_from_file(file);
+	struct vb2_queue *vq = ope_vq_from_file(file, ctx);
+	int ret;
+
+	if (!vq)
+		return -EINVAL;
+
+	if (vb2_queue_is_busy(vq, file))
+		return -EBUSY;
+
+	ret = vb2_reqbufs(vq, rb);
+	if (!ret)
+		vq->owner = rb->count ? file->private_data : NULL;
+
+	return ret;
+}
+
+static int ope_querybuf(struct file *file, void *priv, struct v4l2_buffer *buf)
+{
+	struct ope_ctx *ctx = ope_ctx_from_file(file);
+	struct vb2_queue *vq = ope_vq_from_file(file, ctx);
+
+	return vq ? vb2_querybuf(vq, buf) : -EINVAL;
+}
+
+static int ope_qbuf(struct file *file, void *priv, struct v4l2_buffer *buf)
+{
+	struct ope_ctx *ctx = ope_ctx_from_file(file);
+	struct video_device *vdev = video_devdata(file);
+	struct vb2_queue *vq = ope_vq_from_file(file, ctx);
+
+	if (!vq)
+		return -EINVAL;
+	if (vb2_queue_is_busy(vq, file))
+		return -EBUSY;
+
+	return vb2_qbuf(vq, vdev->v4l2_dev->mdev, buf);
+}
+
+static int ope_dqbuf(struct file *file, void *priv, struct v4l2_buffer *buf)
+{
+	struct ope_ctx *ctx = ope_ctx_from_file(file);
+	struct vb2_queue *vq = ope_vq_from_file(file, ctx);
+
+	return vq ? vb2_dqbuf(vq, buf, file->f_flags & O_NONBLOCK) : -EINVAL;
+}
+
+static int ope_prepare_buf(struct file *file, void *priv, struct v4l2_buffer *buf)
+{
+	struct ope_ctx *ctx = ope_ctx_from_file(file);
+	struct video_device *vdev = video_devdata(file);
+	struct vb2_queue *vq = ope_vq_from_file(file, ctx);
+
+	if (!vq)
+		return -EINVAL;
+	if (vb2_queue_is_busy(vq, file))
+		return -EBUSY;
+
+	return vb2_prepare_buf(vq, vdev->v4l2_dev->mdev, buf);
+}
+
+static int ope_create_bufs(struct file *file, void *priv, struct v4l2_create_buffers *create)
+{
+	struct ope_ctx *ctx = ope_ctx_from_file(file);
+	struct vb2_queue *vq = ope_vq_from_file(file, ctx);
+	int ret;
+
+	if (!vq)
+		return -EINVAL;
+	if (vb2_queue_is_busy(vq, file))
+		return -EBUSY;
+	ret = vb2_create_bufs(vq, create);
+	if (!ret && create->count)
+		vq->owner = file->private_data;
+
+	return ret;
+}
+
+static int ope_expbuf(struct file *file, void *priv, struct v4l2_exportbuffer *eb)
+{
+	struct ope_ctx *ctx = ope_ctx_from_file(file);
+	struct vb2_queue *vq = ope_vq_from_file(file, ctx);
+
+	if (!vq)
+		return -EINVAL;
+	if (vb2_queue_is_busy(vq, file))
+		return -EBUSY;
+
+	return vb2_expbuf(vq, eb);
+}
+
+static int ope_streamon(struct file *file, void *priv, enum v4l2_buf_type type)
+{
+	struct ope_ctx *ctx = ope_ctx_from_file(file);
+	struct vb2_queue *vq = ope_vq_from_file(file, ctx);
+
+	if (!vq)
+		return -EINVAL;
+	if (vb2_queue_is_busy(vq, file))
+		return -EBUSY;
+
+	return vb2_streamon(vq, type);
+}
+
+static int ope_streamoff(struct file *file, void *priv, enum v4l2_buf_type type)
+{
+	struct ope_ctx *ctx = ope_ctx_from_file(file);
+	struct vb2_queue *vq = ope_vq_from_file(file, ctx);
+
+	if (!vq)
+		return -EINVAL;
+
+	if (vb2_queue_is_busy(vq, file))
+		return -EBUSY;
+
+	camss_isp_sched_cancel(&ctx->ope->sched, &ctx->job);
+
+	return vb2_streamoff(vq, type);
+}
+
+/* -------- proc subdev ops -------- */
+
+enum ope_proc_pad {
+	OPE_PROC_PAD_SINK_IN,
+	OPE_PROC_PAD_SINK_PAR,
+	OPE_PROC_PAD_SOURCE,
+	OPE_PROC_PADS_NUM,
+};
+
+static int ope_proc_get_fmt(struct v4l2_subdev *sd, struct v4l2_subdev_state *state,
+			    struct v4l2_subdev_format *fmt)
+{
+	struct ope_ctx *ctx = container_of(sd->v4l2_dev, struct ope_dev, v4l2_dev)->shared_ctx;
+
+	if (fmt->pad == OPE_PROC_PAD_SOURCE) {
+		/* Source carries the scaler output (compose) size */
+		fmt->format.width = ctx ? ctx->disp_compose.width : 640;
+		fmt->format.height = ctx ? ctx->disp_compose.height : 480;
+		fmt->format.code = ctx ? ctx->proc_mbus_code : MEDIA_BUS_FMT_YUYV8_1_5X8;
+		fmt->format.field = V4L2_FIELD_NONE;
+		fmt->format.colorspace = V4L2_COLORSPACE_SRGB;
+	} else if (fmt->pad == OPE_PROC_PAD_SINK_IN) {
+		fmt->format.width = ctx ? ctx->fmt_in.width : 640;
+		fmt->format.height = ctx ? ctx->fmt_in.height : 480;
+		fmt->format.code = ctx ? ctx->fmt_in.fmt->mbus_code : MEDIA_BUS_FMT_SRGGB8_1X8;
+		fmt->format.field = V4L2_FIELD_NONE;
+		fmt->format.colorspace = V4L2_COLORSPACE_RAW;
+	} else { /* Params sink (pad1): no image format */
+		fmt->format.width = 0;
+		fmt->format.height = 0;
+		fmt->format.code = MEDIA_BUS_FMT_FIXED;
+		fmt->format.field = V4L2_FIELD_NONE;
+		fmt->format.colorspace = V4L2_COLORSPACE_DEFAULT;
+	}
+
+	return 0;
+}
+
+static int ope_proc_set_fmt(struct v4l2_subdev *sd, struct v4l2_subdev_state *state,
+			    struct v4l2_subdev_format *fmt)
+{
+	struct ope_dev *ope = container_of(sd->v4l2_dev, struct ope_dev, v4l2_dev);
+	struct ope_ctx *ctx = ope->shared_ctx;
+
+	if (!ctx && fmt->which == V4L2_SUBDEV_FORMAT_ACTIVE)
+		return -ENODEV;
+
+	if (fmt->pad != OPE_PROC_PAD_SOURCE)
+		return ope_proc_get_fmt(sd, state, fmt);
+
+	unsigned int i;
+
+	/* Validate mbus code: must match one of the output formats */
+	for (i = 0; i < ARRAY_SIZE(ope_output_fmts); i++)
+		if (ope_output_fmts[i].mbus_code == fmt->format.code)
+			goto valid;
+
+	fmt->format.code = MEDIA_BUS_FMT_YUYV8_1_5X8;
+
+valid:
+	/* Clamp to crop size: OPE can only downscale */
+	fmt->format.width = clamp(fmt->format.width, (unsigned int)OPE_MIN_W,
+				  ctx->fmt_in.crop.width);
+	fmt->format.height = clamp(fmt->format.height, (unsigned int)OPE_MIN_H,
+				   ctx->fmt_in.crop.height);
+	fmt->format.field = V4L2_FIELD_NONE;
+	fmt->format.colorspace = V4L2_COLORSPACE_SRGB;
+
+	if (fmt->which == V4L2_SUBDEV_FORMAT_ACTIVE) {
+		ctx->proc_mbus_code = fmt->format.code;
+		ctx->disp_compose.width = fmt->format.width;
+		ctx->disp_compose.height = fmt->format.height;
+		/* Clip compose origin if it no longer fits */
+		ctx->disp_compose.left = clamp_t(int, ctx->disp_compose.left, 0,
+						 (int)ctx->fmt_out.width -
+						 (int)ctx->disp_compose.width);
+		ctx->disp_compose.top = clamp_t(int, ctx->disp_compose.top, 0,
+						(int)ctx->fmt_out.height -
+						(int)ctx->disp_compose.height);
+	}
+
+	return 0;
+}
+
+static int ope_proc_enum_mbus_code(struct v4l2_subdev *sd,
+				   struct v4l2_subdev_state *state,
+				   struct v4l2_subdev_mbus_code_enum *code)
+{
+	unsigned int n = 0;
+
+	if (code->pad != OPE_PROC_PAD_SOURCE)
+		return -EINVAL;
+
+	/* Enumerate unique mbus codes from output format table */
+	for (unsigned int i = 0; i < ARRAY_SIZE(ope_output_fmts); i++) {
+		u32 mc = ope_output_fmts[i].mbus_code;
+		bool seen = false;
+
+		for (unsigned int j = 0; j < i; j++) {
+			if (ope_output_fmts[j].mbus_code == mc) {
+				seen = true;
+				break;
+			}
+		}
+
+		if (seen)
+			continue;
+
+		if (n++ == code->index) {
+			code->code = mc;
+			return 0;
+		}
+	}
+
+	return -EINVAL;
+}
+
+static int ope_proc_init_state(struct v4l2_subdev *sd, struct v4l2_subdev_state *state)
+{
+	unsigned int pad;
+
+	for (pad = 0; pad < OPE_PROC_PADS_NUM; pad++) {
+		struct v4l2_subdev_format fmt = {
+			.which = V4L2_SUBDEV_FORMAT_TRY,
+			.pad = pad
+		};
+		int ret;
+
+		ret = ope_proc_get_fmt(sd, state, &fmt);
+		if (ret)
+			return ret;
+
+		*v4l2_subdev_state_get_format(state, pad) = fmt.format;
+	}
+
+	return 0;
+}
+
+static int ope_proc_get_selection(struct v4l2_subdev *sd,
+				  struct v4l2_subdev_state *state,
+				  struct v4l2_subdev_selection *sel)
+{
+	struct ope_ctx *ctx = container_of(sd->v4l2_dev, struct ope_dev, v4l2_dev)->shared_ctx;
+
+	if (sel->pad != OPE_PROC_PAD_SINK_IN)
+		goto source;
+
+	switch (sel->target) {
+	case V4L2_SEL_TGT_CROP:
+		sel->r = ctx ? ctx->fmt_in.crop : (struct v4l2_rect){ 0, 0, 640, 480 };
+		return 0;
+	case V4L2_SEL_TGT_CROP_DEFAULT:
+	case V4L2_SEL_TGT_CROP_BOUNDS:
+		sel->r.left = sel->r.top = 0;
+		sel->r.width = ctx ? ctx->fmt_in.width : 640;
+		sel->r.height = ctx ? ctx->fmt_in.height : 480;
+		return 0;
+	}
+
+source:
+	if (sel->pad != OPE_PROC_PAD_SOURCE)
+		return -EINVAL;
+
+	switch (sel->target) {
+	case V4L2_SEL_TGT_COMPOSE:
+		sel->r = ctx ? ctx->disp_compose : (struct v4l2_rect){ 0, 0, 640, 480 };
+		return 0;
+	case V4L2_SEL_TGT_COMPOSE_DEFAULT:
+		sel->r.left = sel->r.top = 0;
+		sel->r.width = ctx ? ctx->fmt_in.crop.width : 640;
+		sel->r.height = ctx ? ctx->fmt_in.crop.height : 480;
+		return 0;
+	case V4L2_SEL_TGT_COMPOSE_BOUNDS:
+		sel->r.left = sel->r.top = 0;
+		sel->r.width = ctx ? ctx->fmt_out.width : 640;
+		sel->r.height = ctx ? ctx->fmt_out.height : 480;
+		return 0;
+	}
+
+	return -EINVAL;
+}
+
+static int ope_proc_set_selection(struct v4l2_subdev *sd,
+				  struct v4l2_subdev_state *state,
+				  struct v4l2_subdev_selection *sel)
+{
+	struct ope_dev *ope = container_of(sd->v4l2_dev, struct ope_dev, v4l2_dev);
+	struct ope_ctx *ctx = ope->shared_ctx;
+
+	if (!ctx)
+		return -ENODEV;
+
+	if (sel->pad == OPE_PROC_PAD_SINK_IN) {
+		if (sel->target != V4L2_SEL_TGT_CROP)
+			return -EINVAL;
+		sel->r.left = clamp_t(int, sel->r.left, 0,
+				      (int)ctx->fmt_in.width - OPE_MIN_W);
+		sel->r.top = clamp_t(int, sel->r.top,  0,
+				     (int)ctx->fmt_in.height - OPE_MIN_H);
+		sel->r.width = clamp(sel->r.width,  (unsigned int)OPE_MIN_W,
+				     ctx->fmt_in.width  - (unsigned int)sel->r.left);
+		sel->r.height = clamp(sel->r.height, (unsigned int)OPE_MIN_H,
+				      ctx->fmt_in.height - (unsigned int)sel->r.top);
+		if (sel->which == V4L2_SUBDEV_FORMAT_ACTIVE)
+			ctx->fmt_in.crop = sel->r;
+		return 0;
+	}
+
+	if (sel->pad == OPE_PROC_PAD_SOURCE) {
+		if (sel->target != V4L2_SEL_TGT_COMPOSE)
+			return -EINVAL;
+		/* Scale size: clamp to crop (downscale only) */
+		sel->r.width = clamp(sel->r.width,  (unsigned int)OPE_MIN_W,
+				      ctx->fmt_in.crop.width);
+		sel->r.height = clamp(sel->r.height, (unsigned int)OPE_MIN_H,
+				      ctx->fmt_in.crop.height);
+		/* Placement: clamp origin to output buffer bounds */
+		sel->r.left = clamp_t(int, sel->r.left, 0,
+				      (int)ctx->fmt_out.width  - (int)sel->r.width);
+		sel->r.top = clamp_t(int, sel->r.top,  0,
+				     (int)ctx->fmt_out.height - (int)sel->r.height);
+		if (sel->which == V4L2_SUBDEV_FORMAT_ACTIVE)
+			ctx->disp_compose = sel->r;
+		return 0;
+	}
+
+	return -EINVAL;
+}
+
+static const struct v4l2_subdev_pad_ops ope_proc_pad_ops = {
+	.get_fmt	= ope_proc_get_fmt,
+	.set_fmt	= ope_proc_set_fmt,
+	.enum_mbus_code	= ope_proc_enum_mbus_code,
+	.get_selection	= ope_proc_get_selection,
+	.set_selection	= ope_proc_set_selection,
+};
+
+static const struct v4l2_subdev_internal_ops ope_proc_internal_ops = {
+	.init_state = ope_proc_init_state,
+};
+
+static const struct v4l2_subdev_ops ope_proc_ops = {
+	.pad = &ope_proc_pad_ops,
+};
+
+/* -------- disp subdev ops -------- */
+
+enum ope_disp_pad {
+	OPE_DISP_PAD_SINK,
+	OPE_DISP_PAD_SOURCE,
+	OPE_DISP_PADS_NUM,
+};
+
+static int ope_disp_get_fmt(struct v4l2_subdev *sd,
+			    struct v4l2_subdev_state *state,
+			    struct v4l2_subdev_format *fmt)
+{
+	struct ope_ctx *ctx = container_of(sd->v4l2_dev,
+					   struct ope_dev, v4l2_dev)->shared_ctx;
+	u32 mbus = ctx ? ctx->proc_mbus_code : MEDIA_BUS_FMT_YUYV8_1_5X8;
+
+	/* Both sink and source reflect the scaler output (compose) size */
+	fmt->format.width  = ctx ? ctx->disp_compose.width  : 640;
+	fmt->format.height = ctx ? ctx->disp_compose.height : 480;
+	fmt->format.code   = mbus;
+	fmt->format.field  = V4L2_FIELD_NONE;
+	fmt->format.colorspace = (fmt->pad == OPE_DISP_PAD_SOURCE && ctx)
+				? ctx->fmt_out.colorspace : V4L2_COLORSPACE_SRGB;
+
+	return 0;
+}
+
+static int ope_disp_set_fmt(struct v4l2_subdev *sd,
+			    struct v4l2_subdev_state *state,
+			    struct v4l2_subdev_format *fmt)
+{
+	struct ope_dev *ope = container_of(sd->v4l2_dev, struct ope_dev, v4l2_dev);
+	struct ope_ctx *ctx = ope->shared_ctx;
+
+	if (!ctx)
+		return -ENODEV;
+
+	/* Both pads are read-only: size is set via ope_proc source S_FMT */
+	return ope_disp_get_fmt(sd, state, fmt);
+}
+
+
+static int ope_disp_init_state(struct v4l2_subdev *sd,
+			       struct v4l2_subdev_state *state)
+{
+	unsigned int pad;
+
+	for (pad = 0; pad < OPE_DISP_PADS_NUM; pad++) {
+		struct v4l2_subdev_format fmt = {
+			.which = V4L2_SUBDEV_FORMAT_TRY,
+			fmt.pad = pad
+		};
+		int ret;
+
+		ret = ope_disp_get_fmt(sd, state, &fmt);
+		if (ret)
+			return ret;
+
+		*v4l2_subdev_state_get_format(state, pad) = fmt.format;
+	}
+
+	return 0;
+}
+
+static const struct v4l2_subdev_pad_ops ope_disp_pad_ops = {
+	.get_fmt = ope_disp_get_fmt,
+	.set_fmt = ope_disp_set_fmt,
+};
+
+static const struct v4l2_subdev_internal_ops ope_disp_internal_ops = {
+	.init_state = ope_disp_init_state,
+};
+
+static const struct v4l2_subdev_ops ope_disp_ops = {
+	.pad = &ope_disp_pad_ops,
+};
+
+/* -------- disp-output video ops -------- */
+
+static int ope_disp_output_link_validate(struct media_link *link)
+{
+	struct video_device *vdev = media_entity_to_video_device(link->sink->entity);
+	struct v4l2_subdev *sd = media_entity_to_v4l2_subdev(link->source->entity);
+	struct ope_ctx *ctx = video_get_drvdata(vdev);
+	struct v4l2_subdev_format sd_fmt = {
+		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
+		.pad   = link->source->index,
+	};
+	int ret;
+
+	if (!ctx)
+		return 0;
+
+	ret = v4l2_subdev_call(sd, pad, get_fmt, NULL, &sd_fmt);
+	if (ret)
+		return ret;
+
+	if (ctx->fmt_out.fmt->mbus_code != sd_fmt.format.code) {
+		dev_dbg(ctx->ope->dev, "link validate: mbus 0x%04x incompatible with %.4s\n",
+			sd_fmt.format.code, (char *)&ctx->fmt_out.fmt->fourcc);
+		return -EPIPE;
+	}
+
+	return 0;
+}
+
+static const struct media_entity_operations ope_disp_output_entity_ops = {
+	.link_validate = ope_disp_output_link_validate,
+};
+
+static const struct v4l2_ioctl_ops ope_video_ioctl_ops = {
+	.vidioc_querycap		= ope_querycap,
+	.vidioc_enum_fmt_vid_out	= ope_enum_fmt_vid_out,
+	.vidioc_g_fmt_vid_out_mplane	= ope_g_fmt_vid_out,
+	.vidioc_try_fmt_vid_out_mplane	= ope_try_fmt_vid_out,
+	.vidioc_s_fmt_vid_out_mplane	= ope_s_fmt_vid_out,
+	.vidioc_enum_fmt_vid_cap	= ope_enum_fmt_vid_cap,
+	.vidioc_g_fmt_vid_cap_mplane	= ope_g_fmt_vid_cap,
+	.vidioc_try_fmt_vid_cap_mplane	= ope_try_fmt_vid_cap,
+	.vidioc_s_fmt_vid_cap_mplane	= ope_s_fmt_vid_cap,
+	.vidioc_g_selection		= ope_g_selection,
+	.vidioc_s_selection		= ope_s_selection,
+	.vidioc_enum_framesizes		= ope_enum_framesizes,
+	.vidioc_g_parm			= ope_g_parm,
+	.vidioc_s_parm			= ope_s_parm,
+	.vidioc_reqbufs			= ope_reqbufs,
+	.vidioc_querybuf		= ope_querybuf,
+	.vidioc_qbuf			= ope_qbuf,
+	.vidioc_dqbuf			= ope_dqbuf,
+	.vidioc_prepare_buf		= ope_prepare_buf,
+	.vidioc_create_bufs		= ope_create_bufs,
+	.vidioc_expbuf			= ope_expbuf,
+	.vidioc_streamon		= ope_streamon,
+	.vidioc_streamoff		= ope_streamoff,
+	.vidioc_subscribe_event		= v4l2_ctrl_subscribe_event,
+	.vidioc_unsubscribe_event	= v4l2_event_unsubscribe,
+};
+
+static const struct v4l2_ioctl_ops ope_meta_ioctl_ops = {
+	.vidioc_querycap		= ope_querycap,
+	.vidioc_enum_fmt_meta_out	= ope_enum_fmt_meta_out,
+	.vidioc_g_fmt_meta_out		= ope_g_fmt_meta,
+	.vidioc_s_fmt_meta_out		= ope_g_fmt_meta,
+	.vidioc_try_fmt_meta_out	= ope_g_fmt_meta,
+	.vidioc_reqbufs			= ope_reqbufs,
+	.vidioc_querybuf		= ope_querybuf,
+	.vidioc_qbuf			= ope_qbuf,
+	.vidioc_dqbuf			= ope_dqbuf,
+	.vidioc_prepare_buf		= ope_prepare_buf,
+	.vidioc_create_bufs		= ope_create_bufs,
+	.vidioc_expbuf			= ope_expbuf,
+	.vidioc_streamon		= ope_streamon,
+	.vidioc_streamoff		= ope_streamoff,
+};
+
+/* -------- File/Context ops -------- */
+
+static struct ope_ctx *ope_ctx_create(struct ope_dev *ope)
+{
+	struct ope_ctx *ctx;
+	unsigned int i;
+	int ret;
+
+	ctx = kvzalloc(sizeof(*ctx), GFP_KERNEL);
+	if (!ctx)
+		return ERR_PTR(-ENOMEM);
+
+	ctx->ope = ope;
+
+	mutex_init(&ctx->vbq_lock);
+
+	ctx->bufq = camss_isp_bufq_init(OPE_QUEUE_COUNT);
+	if (IS_ERR(ctx->bufq)) {
+		ret = PTR_ERR(ctx->bufq);
+		kvfree(ctx);
+		return ERR_PTR(ret);
+	}
+
+	camss_isp_job_init(&ctx->job, &ope_job_ops, ctx);
+	ctx->config = ope_default_config;
+
+	/* Default input format */
+	ctx->fmt_in.fmt		 = &ope_input_fmts[0];
+	ctx->fmt_in.width	 = OPE_MIN_W;
+	ctx->fmt_in.height	 = OPE_MIN_H;
+	ctx->fmt_in.bytesperline = OPE_MIN_W * ope_input_fmts[0].depth / 8;
+	ctx->fmt_in.sizeimage	 = ctx->fmt_in.bytesperline * OPE_MIN_H;
+	ctx->fmt_in.colorspace	 = V4L2_COLORSPACE_RAW;
+	ctx->fmt_in.crop	 = (struct v4l2_rect){ 0, 0, OPE_MIN_W, OPE_MIN_H };
+	ctx->fmt_in.timeperframe.numerator = 1;
+	ctx->fmt_in.timeperframe.denominator = DEFAULT_FRAMERATE;
+
+	/* Default output format */
+	ctx->fmt_out.fmt	  = &ope_output_fmts[0];
+	ctx->fmt_out.width	  = OPE_MIN_W;
+	ctx->fmt_out.height	  = OPE_MIN_H;
+	ctx->fmt_out.bytesperline = OPE_MIN_W;
+	ctx->fmt_out.sizeimage	  = (u64)ope_output_fmts[0].depth * OPE_MIN_W * OPE_MIN_H / 8;
+	ctx->fmt_out.colorspace	  = V4L2_COLORSPACE_SRGB;
+	ctx->disp_compose	  = (struct v4l2_rect){ 0, 0, OPE_MIN_W, OPE_MIN_H };
+	ctx->proc_mbus_code	  = ope_output_fmts[0].mbus_code;
+
+	for (i = 0; i < OPE_QUEUE_COUNT; i++) {
+		ret = ope_init_vq(ctx, i);
+		if (ret) {
+			while (i--)
+				vb2_queue_release(&ctx->vqs[i]);
+			camss_isp_bufq_release(ctx->bufq);
+			kvfree(ctx);
+			return ERR_PTR(ret);
+		}
+	}
+
+	INIT_LIST_HEAD(&ctx->list);
+	list_add(&ctx->list, &ope->ctx_list);
+	ope->shared_ctx = ctx;
+
+	return ctx;
+}
+
+static void ope_ctx_destroy(struct ope_ctx *ctx)
+{
+	struct ope_dev *ope = ctx->ope;
+	unsigned int i;
+
+	list_del(&ctx->list);
+	camss_isp_sched_cancel(&ope->sched, &ctx->job);
+	for (i = 0; i < OPE_QUEUE_COUNT; i++)
+		vb2_queue_release(&ctx->vqs[i]);
+	camss_isp_bufq_release(ctx->bufq);
+	mutex_destroy(&ctx->vbq_lock);
+	kvfree(ctx);
+}
+
+static int ope_open(struct file *file)
+{
+	struct video_device *vdev = video_devdata(file);
+	struct ope_dev *ope = container_of(vdev->v4l2_dev, struct ope_dev, v4l2_dev);
+	struct ope_ctx *ctx;
+	struct v4l2_fh *fh;
+	int ret = 0;
+
+	fh = kzalloc(sizeof(*fh), GFP_KERNEL);
+	if (!fh)
+		return -ENOMEM;
+
+	if (mutex_lock_interruptible(&ope->mutex)) {
+		kfree(fh);
+		return -ERESTARTSYS;
+	}
+
+	/*
+	 * For now, only a single shared context is supported,
+	 * until media multi-context support is available.
+	 */
+	if (!ope->shared_ctx) {
+		ctx = ope_ctx_create(ope);
+		if (IS_ERR(ctx)) {
+			ret = PTR_ERR(ctx);
+			goto unlock;
+		}
+	} else {
+		ctx = ope->shared_ctx;
+	}
+
+	v4l2_fh_init(fh, vdev);
+	v4l2_fh_add(fh, file);
+	ope->open_count++;
+
+unlock:
+	if (ret)
+		kfree(fh);
+	mutex_unlock(&ope->mutex);
+	return ret;
+}
+
+static int ope_release(struct file *file)
+{
+	struct v4l2_fh *fh = file_to_v4l2_fh(file);
+	struct ope_ctx *ctx = ope_ctx_from_file(file);
+	struct ope_dev *ope = ctx->ope;
+
+	v4l2_fh_del(fh, file);
+	v4l2_fh_exit(fh);
+	kfree(fh);
+
+	mutex_lock(&ope->mutex);
+
+	if (--ope->open_count == 0) {
+		ope->shared_ctx = NULL;
+		mutex_unlock(&ope->mutex);
+		ope_ctx_destroy(ctx);
+	} else {
+		mutex_unlock(&ope->mutex);
+	}
+
+	return 0;
+}
+
+static __poll_t ope_poll(struct file *file, poll_table *wait)
+{
+	unsigned int idx = ope_queue_idx_from_file(file);
+	struct ope_ctx *ctx = ope_ctx_from_file(file);
+	struct v4l2_fh *fh = file_to_v4l2_fh(file);
+	struct vb2_queue *vq;
+	unsigned long flags;
+	__poll_t rc = 0;
+
+	if (idx >= OPE_QUEUE_COUNT)
+		return EPOLLERR;
+
+	vq = &ctx->vqs[idx];
+
+	poll_wait(file, &vq->done_wq, wait);
+	poll_wait(file, &fh->wait, wait);
+
+	spin_lock_irqsave(&vq->done_lock, flags);
+	if (!list_empty(&vq->done_list)) {
+		if (V4L2_TYPE_IS_OUTPUT(vq->type))
+			rc |= EPOLLOUT | EPOLLWRNORM;
+		else
+			rc |= EPOLLIN | EPOLLRDNORM;
+	}
+	spin_unlock_irqrestore(&vq->done_lock, flags);
+
+	if (v4l2_event_pending(fh))
+		rc |= EPOLLPRI;
+
+	return rc;
+}
+
+static int ope_mmap(struct file *file, struct vm_area_struct *vma)
+{
+	unsigned int idx = ope_queue_idx_from_file(file);
+	struct ope_ctx *ctx = ope_ctx_from_file(file);
+
+	if (idx >= OPE_QUEUE_COUNT)
+		return -EINVAL;
+
+	return vb2_mmap(&ctx->vqs[idx], vma);
+}
+
+static const struct v4l2_file_operations ope_fops = {
+	.owner		= THIS_MODULE,
+	.open		= ope_open,
+	.release	= ope_release,
+	.poll		= ope_poll,
+	.unlocked_ioctl	= video_ioctl2,
+	.mmap		= ope_mmap,
+};
+
+/* Pipeline descriptor  */
+static const struct camss_isp_entity_desc ope_entity_descs[] = {
+	[OPE_ENTITY_FRAME_IN] = {
+		.name      = "ope_input",
+		.obj_type  = MEDIA_ENTITY_TYPE_VIDEO_DEVICE,
+		.function  = MEDIA_ENT_F_IO_V4L,
+		.vdev.caps = V4L2_CAP_VIDEO_OUTPUT_MPLANE | V4L2_CAP_STREAMING,
+		.vdev.drvdata = (void *)(uintptr_t)OPE_QUEUE_FRAME_IN,
+		.vdev.fops = &ope_fops,
+		.vdev.ioctl_ops = &ope_video_ioctl_ops,
+		.pads = (const struct camss_isp_pad_desc[]) {
+			{ MEDIA_PAD_FL_SOURCE, OPE_ENTITY_PROC, OPE_PROC_PAD_SINK_IN, 0 },
+			{ }
+		},
+	},
+	[OPE_ENTITY_DISP_OUT] = {
+		.name      = "ope_disp_output",
+		.obj_type  = MEDIA_ENTITY_TYPE_VIDEO_DEVICE,
+		.function  = MEDIA_ENT_F_IO_V4L,
+		.vdev.caps = V4L2_CAP_VIDEO_CAPTURE_MPLANE | V4L2_CAP_STREAMING,
+		.vdev.drvdata = (void *)(uintptr_t)OPE_QUEUE_DISP_OUT,
+		.vdev.fops = &ope_fops,
+		.vdev.ioctl_ops = &ope_video_ioctl_ops,
+		.vdev.entity_ops = &ope_disp_output_entity_ops,
+		.pads = (const struct camss_isp_pad_desc[]) {
+			{ MEDIA_PAD_FL_SINK, OPE_ENTITY_DISP, OPE_DISP_PAD_SOURCE, 0 },
+			{ }
+		},
+	},
+	[OPE_ENTITY_PARAMS] = {
+		.name      = "ope_params",
+		.obj_type  = MEDIA_ENTITY_TYPE_VIDEO_DEVICE,
+		.function  = MEDIA_ENT_F_IO_V4L,
+		.vdev.caps = V4L2_CAP_META_OUTPUT | V4L2_CAP_STREAMING,
+		.vdev.drvdata = (void *)(uintptr_t)OPE_QUEUE_PARAMS,
+		.vdev.fops = &ope_fops,
+		.vdev.ioctl_ops = &ope_meta_ioctl_ops,
+		.pads = (const struct camss_isp_pad_desc[]) {
+			{ MEDIA_PAD_FL_SOURCE, OPE_ENTITY_PROC, OPE_PROC_PAD_SINK_PAR, 0 },
+			{ }
+		},
+	},
+	[OPE_ENTITY_PROC] = {
+		.name       = "ope_proc",
+		.obj_type   = MEDIA_ENTITY_TYPE_V4L2_SUBDEV,
+		.function   = MEDIA_ENT_F_PROC_VIDEO_ISP,
+		.subdev.ops = &ope_proc_ops,
+		.subdev.internal_ops = &ope_proc_internal_ops,
+		.pads = (const struct camss_isp_pad_desc[]) {
+			{ MEDIA_PAD_FL_SINK,   OPE_ENTITY_FRAME_IN, 0, 0 },
+			{ MEDIA_PAD_FL_SINK,   OPE_ENTITY_PARAMS, 0, 0 },
+			{ MEDIA_PAD_FL_SOURCE, OPE_ENTITY_DISP, OPE_DISP_PAD_SINK, MEDIA_LNK_FL_ENABLED },
+			{ }
+		},
+	},
+	[OPE_ENTITY_DISP] = {
+		.name     = "ope_disp",
+		.obj_type = MEDIA_ENTITY_TYPE_V4L2_SUBDEV,
+		.function = MEDIA_ENT_F_PROC_VIDEO_SCALER,
+		.subdev.ops = &ope_disp_ops,
+		.subdev.internal_ops = &ope_disp_internal_ops,
+		.pads = (const struct camss_isp_pad_desc[]) {
+			{ MEDIA_PAD_FL_SINK,   OPE_ENTITY_PROC, OPE_PROC_PAD_SOURCE, 0 },
+			{ MEDIA_PAD_FL_SOURCE, OPE_ENTITY_DISP_OUT, 0, 0 },
+			{ }
+		},
+	},
+};
+
+static int ope_v4l2_init(struct ope_dev *ope)
+{
+	int ret;
+
+	mutex_init(&ope->mutex);
+	INIT_LIST_HEAD(&ope->ctx_list);
+	camss_isp_sched_init(&ope->sched);
+
+	ope->mdev.dev = ope->dev;
+	strscpy(ope->mdev.model, OPE_NAME, sizeof(ope->mdev.model));
+	media_device_init(&ope->mdev);
+	ope->v4l2_dev.mdev = &ope->mdev;
+
+	ret = v4l2_device_register(ope->dev, &ope->v4l2_dev);
+	if (ret)
+		goto err_mdev_cleanup;
+
+	ret = media_device_register(&ope->mdev);
+	if (ret)
+		goto err_v4l2;
+
+	ope->pipeline = camss_isp_pipeline_alloc(OPE_ENTITY_COUNT);
+	if (IS_ERR(ope->pipeline)) {
+		ret = PTR_ERR(ope->pipeline);
+		goto err_media;
+	}
+
+	ret = camss_isp_pipeline_register(ope->pipeline, &ope->v4l2_dev,
+					 ope_entity_descs, ARRAY_SIZE(ope_entity_descs));
+	if (ret) {
+		camss_isp_pipeline_free(ope->pipeline);
+		ope->pipeline = NULL;
+		goto err_media;
+	}
+
+	ope->pipeline->drv_priv = ope;
+	return 0;
+
+err_media:
+	media_device_unregister(&ope->mdev);
+err_v4l2:
+	v4l2_device_unregister(&ope->v4l2_dev);
+err_mdev_cleanup:
+	media_device_cleanup(&ope->mdev);
+	return ret;
+}
+
+static void ope_v4l2_cleanup(struct ope_dev *ope)
+{
+	if (ope->pipeline) {
+		camss_isp_pipeline_unregister(ope->pipeline);
+		camss_isp_pipeline_free(ope->pipeline);
+		ope->pipeline = NULL;
+	}
+	media_device_unregister(&ope->mdev);
+	v4l2_device_unregister(&ope->v4l2_dev);
+	media_device_cleanup(&ope->mdev);
+	camss_isp_sched_destroy(&ope->sched);
+}
+
+static int ope_soft_reset(struct ope_dev *ope)
+{
+	u32 version;
+	int ret;
+
+	ret = pm_runtime_resume_and_get(ope->dev);
+	if (ret)
+		return dev_err_probe(ope->dev, ret, "resume failed\n");
+
+	version = ope_read(ope, OPE_TOP_HW_VERSION);
+	dev_dbg(ope->dev, "HW version %u.%u.%u\n",
+		(u32)FIELD_GET(OPE_TOP_HW_VERSION_GEN, version),
+		(u32)FIELD_GET(OPE_TOP_HW_VERSION_REV, version),
+		(u32)FIELD_GET(OPE_TOP_HW_VERSION_STEP, version));
+
+	reinit_completion(&ope->reset_complete);
+	ope_write(ope, OPE_TOP_RESET_CMD, OPE_TOP_RESET_CMD_SW);
+
+	if (!wait_for_completion_timeout(&ope->reset_complete,
+					 msecs_to_jiffies(OPE_RESET_TIMEOUT_MS))) {
+		dev_err(ope->dev, "Reset timeout\n");
+		pm_runtime_put(ope->dev);
+		return -ETIMEDOUT;
+	}
+
+	pm_runtime_put(ope->dev);
+
+	return 0;
+}
+
+static int ope_init_power(struct ope_dev *ope)
+{
+	struct dev_pm_domain_list *pmdomains;
+	struct device *dev = ope->dev;
+	int ret;
+
+	ope->icc_data = devm_of_icc_get(dev, "data");
+	if (IS_ERR(ope->icc_data))
+		return dev_err_probe(dev, PTR_ERR(ope->icc_data),
+				     "failed to get interconnect data path\n");
+
+	ope->icc_config = devm_of_icc_get(dev, "config");
+	if (IS_ERR(ope->icc_config))
+		return dev_err_probe(dev, PTR_ERR(ope->icc_config),
+				     "failed to get interconnect config path\n");
+
+	devm_pm_domain_attach_list(dev, NULL, &pmdomains);
+
+	ret = devm_pm_opp_set_clkname(dev, "core");
+	if (ret)
+		return ret;
+
+	ret = devm_pm_opp_of_add_table(dev);
+	if (ret && ret != -ENODEV)
+		return dev_err_probe(dev, ret, "invalid OPP table\n");
+
+	ret = devm_pm_runtime_enable(dev);
+	if (ret)
+		return ret;
+
+	ret = devm_pm_clk_create(dev);
+	if (ret)
+		return ret;
+
+	ret = of_pm_clk_add_clks(dev);
+	if (ret < 0)
+		return ret;
+
+	return 0;
+}
+
+static int ope_init_mmio(struct ope_dev *ope)
+{
+	struct platform_device *pdev = to_platform_device(ope->dev);
+
+	ope->base = devm_platform_ioremap_resource_byname(pdev, "top");
+	if (IS_ERR(ope->base))
+		return PTR_ERR(ope->base);
+
+	ope->base_rd = devm_platform_ioremap_resource_byname(pdev, "bus_read");
+	if (IS_ERR(ope->base_rd))
+		return PTR_ERR(ope->base_rd);
+
+	ope->base_wr = devm_platform_ioremap_resource_byname(pdev, "bus_write");
+	if (IS_ERR(ope->base_wr))
+		return PTR_ERR(ope->base_wr);
+
+	ope->base_pp = devm_platform_ioremap_resource_byname(pdev, "pipeline");
+	if (IS_ERR(ope->base_pp))
+		return PTR_ERR(ope->base_pp);
+
+	return 0;
+}
+
+static int ope_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct ope_dev *ope;
+	int ret, irq;
+
+	ope = devm_kzalloc(dev, sizeof(*ope), GFP_KERNEL);
+	if (!ope)
+		return -ENOMEM;
+
+	ope->dev = dev;
+	init_completion(&ope->reset_complete);
+
+	ret = dma_set_mask(dev, DMA_BIT_MASK(32));
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to set DMA mask\n");
+
+	ret = ope_init_power(ope);
+	if (ret)
+		return dev_err_probe(dev, ret, "Power init failed\n");
+
+	ret = ope_init_mmio(ope);
+	if (ret)
+		return dev_err_probe(dev, ret, "MMIO init failed\n");
+
+	irq = platform_get_irq(pdev, 0);
+	if (irq < 0)
+		return dev_err_probe(dev, irq, "Unable to get IRQ\n");
+
+	ret = devm_request_irq(dev, irq, ope_irq, 0, "camss-ope", ope);
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "Requesting IRQ failed\n");
+
+	ret = ope_soft_reset(ope);
+	if (ret)
+		return ret;
+
+	ret = ope_v4l2_init(ope);
+	if (ret)
+		return dev_err_probe(dev, ret, "V4L2 init failed\n");
+
+	platform_set_drvdata(pdev, ope);
+
+	return 0;
+}
+
+static void ope_remove(struct platform_device *pdev)
+{
+	struct ope_dev *ope = platform_get_drvdata(pdev);
+
+	ope_v4l2_cleanup(ope);
+}
+
+static const struct of_device_id ope_dt_ids[] = {
+	{ .compatible = "qcom,qcm2290-camss-ope" },
+	{ },
+};
+MODULE_DEVICE_TABLE(of, ope_dt_ids);
+
+static const struct dev_pm_ops ope_pm_ops = {
+	SET_RUNTIME_PM_OPS(pm_clk_suspend, pm_clk_resume, NULL)
+};
+
+static struct platform_driver ope_driver = {
+	.probe  = ope_probe,
+	.remove = ope_remove,
+	.driver = {
+		.name           = OPE_NAME,
+		.of_match_table = ope_dt_ids,
+		.pm             = &ope_pm_ops,
+	},
+};
+
+module_platform_driver(ope_driver);
+
+MODULE_DESCRIPTION("CAMSS Offline Processing Engine");
+MODULE_AUTHOR("Loic Poulain <loic.poulain@oss.qualcomm.com>");
+MODULE_LICENSE("GPL");
+/* Downscaler fixed-point helpers */
diff --git a/drivers/media/platform/qcom/camss/camss-isp-pipeline.c b/drivers/media/platform/qcom/camss/camss-isp-pipeline.c
index 8e44bedb0a41e3cf4fc7e3a138c1f48854f5efc8..625e6a65137fa980fb1a8c2b8a8132623f5b7b62 100644
--- a/drivers/media/platform/qcom/camss/camss-isp-pipeline.c
+++ b/drivers/media/platform/qcom/camss/camss-isp-pipeline.c
@@ -194,6 +194,8 @@ static int isp_register_vdev(struct camss_isp_pipeline_entity *slot,
 		vdev->fops = desc->vdev.fops;
 	if (desc->vdev.ioctl_ops)
 		vdev->ioctl_ops = desc->vdev.ioctl_ops;
+	if (desc->vdev.entity_ops)
+		vdev->entity.ops = desc->vdev.entity_ops;
 
 	vdev->entity.obj_type = MEDIA_ENTITY_TYPE_VIDEO_DEVICE;
 	vdev->entity.function = desc->function ? desc->function : MEDIA_ENT_F_IO_V4L;
@@ -222,6 +224,10 @@ static int isp_register_subdev(struct camss_isp_pipeline_entity *slot,
 	strscpy(sd->name, desc->name, sizeof(sd->name));
 	sd->entity.function = desc->function ?
 			      desc->function : MEDIA_ENT_F_V4L2_SUBDEV_UNKNOWN;
+	/* Create a /dev/v4l-subdevN node so userspace can query pad formats */
+	sd->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
+	if (desc->subdev.internal_ops)
+		sd->internal_ops = desc->subdev.internal_ops;
 
 	ret = media_entity_pads_init(&sd->entity, slot->num_pads, slot->pads);
 	if (ret)
@@ -349,6 +355,11 @@ int camss_isp_pipeline_register(struct camss_isp_pipeline *pipeline,
 		}
 	}
 
+	/* Create /dev/v4l-subdevN nodes for all registered subdevs */
+	ret = v4l2_device_register_subdev_nodes(v4l2_dev);
+	if (ret)
+		goto err_unregister;
+
 	return 0;
 
 err_unregister:
diff --git a/drivers/media/platform/qcom/camss/camss-isp-pipeline.h b/drivers/media/platform/qcom/camss/camss-isp-pipeline.h
index 5dfa32dcafc0a944ca2c160fb5846a2c73214acc..06654948e1eceb7e35aedcabcd8ac3bd92280018 100644
--- a/drivers/media/platform/qcom/camss/camss-isp-pipeline.h
+++ b/drivers/media/platform/qcom/camss/camss-isp-pipeline.h
@@ -76,10 +76,12 @@ struct camss_isp_entity_desc {
 			void					*drvdata;
 			const struct v4l2_file_operations	*fops;
 			const struct v4l2_ioctl_ops		*ioctl_ops;
+			const struct media_entity_operations	*entity_ops;
 		} vdev;
 		/* MEDIA_ENTITY_TYPE_V4L2_SUBDEV */
 		struct {
 			const struct v4l2_subdev_ops		*ops;
+			const struct v4l2_subdev_internal_ops	*internal_ops;
 		} subdev;
 	};
 };

-- 
2.34.1


