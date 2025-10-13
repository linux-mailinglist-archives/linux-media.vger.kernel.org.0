Return-Path: <linux-media+bounces-44232-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 3371FBD12F4
	for <lists+linux-media@lfdr.de>; Mon, 13 Oct 2025 04:10:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id DD7324E97DD
	for <lists+linux-media@lfdr.de>; Mon, 13 Oct 2025 02:10:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AF342F39BF;
	Mon, 13 Oct 2025 02:09:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A8G3awOL"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82E3A2F25EF
	for <linux-media@vger.kernel.org>; Mon, 13 Oct 2025 02:09:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760321354; cv=none; b=YZ2Q6DVUyB0dxmLg5dElXMFBD9F19vN9GEzFWtr5VxBMrugNSHbIFHvMcBlYdgcJFN3ZmhXPEb+R5jqLVWPsxcnc5vdvAwX5FVKrMntyJblQC6Um3hAIvr+p3Nhkl1y4drL1AZ0VqlL9i5MZ4fWV81pzNNysJuYdMwm8n4W4bOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760321354; c=relaxed/simple;
	bh=wbVaP1lpyBvdUoAnAqQoSQ3X0Ci5SY+Yd6B95zwrfnU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YAdMsmuCx3N4jqviyWZMvyku7dW3ft/7tZ4vQ2Z34su8QnHZo0lzyN8qDMx9ephh0OPEAENKEe2QPdzm+2R1PWJHpfiNhexuMAmwrIkpEqSsY/RbKrokqoIC7PXxvqOLI2I6eKw0igpjKbKfgOGnLHZWmeA87+KBK0lmFjj5SAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A8G3awOL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59CLonxC005922
	for <linux-media@vger.kernel.org>; Mon, 13 Oct 2025 02:09:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Zdk3MYWDo75fxIgwdOMJLGKZRJXuA9oW4IWL2hMM1tU=; b=A8G3awOLJrpeZ5tV
	WoexDgt2tnE5eTi40iGbt5CGit31P3LrRT/jCzdPZowoXyy5JUe/KEi8hXGIEJfb
	HCymTdTdhPpFl0+YHddMyjffg2XDimCInsyhWQNY7IzK1U3cUbxB9gIs174UpxKA
	SBUZLZfPQiTK2tHImoBC5fTd4dQvv8IKfcqD2bzWkASOQLlXhbgVDyESy4c9mliB
	JaCutKJ6KqCktv9XM6o1d6Eq3uIu75LFn3lTb/w+D0a5vXpHJwKrtyXA5pLyBocV
	8ry6E4aqGq42zn09Vhn8Gjn8EPLlzNpg2F1oGAUeANLnyS7th7MDZ2a6koOLiOUo
	OmY1cA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfd8ty72-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 13 Oct 2025 02:09:11 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-78f3a8ee4d8so184559906d6.1
        for <linux-media@vger.kernel.org>; Sun, 12 Oct 2025 19:09:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760321350; x=1760926150;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zdk3MYWDo75fxIgwdOMJLGKZRJXuA9oW4IWL2hMM1tU=;
        b=v5ThwVR7lDfN5thx5JjLc5dMQulTPtT+Yu0BPgvqBYXicMDNF/8I0onS2lbIW6ESiY
         aviYOEBsnYPjzOKDlzV0I6kxL/3bwEEmMqGvrTiiH50uPXlE2EwjhVFMyaPbbJu2zyHn
         JO5QJ/QiizvY5olD//XN/erbVenvCuPH4XeBCOr/DXKUNu+PBwl1mhT+hL0k7uYuFi0a
         CVTsHSIW/k80nZXTVGXs+eVAvJ3XcfFZRl0R0jNy27fFQw6Xt89hreU2Q9ONWhMJvVAZ
         DruTbirHWYtG78Ot1Hku1fCIGvrCtlIYq5P/R7SEwlIt/C6eglVa4ojKSPD2B+5LnDOC
         0Ydg==
X-Gm-Message-State: AOJu0Yz3O3phWp1ge3ne0Gluxbdzk2ffhdtgQka/mLrR/tZvugmViFDQ
	rp82t/u/Ys2SS/9kNdiu+PWLH0lOb0h2BGHlOs1NUHizoLNYF+gvPoZJmzULWmsTHCPMbB1kuRY
	gUMt374WxiNPHX9GNpMOkqRT3QRGmJxjjS4BqJ5RdNGBpDLveQ/+ISKbGwMowgNUNgA==
X-Gm-Gg: ASbGncs/ZpyHpTuaZhy6T2TQXUfclZ1/8/xAxRjEXJbdkyaR797m75Qsk1MBfztkMfN
	Uh9Md3f7tMpiyeJ4E4Gi8Qh5E8+cqlLm2unf1u2UJ3RX/rM0ixj8wAGtXUnIAZCLe5I8pDHvMI6
	0U9gXBtTtVvTj/aeDlaZjosY9S/Hb3XWLsOdM7VbGnE6G0Tdl5kMHkof7BFwR6s/AHvzFnr1mRt
	djuoxquFgHvoJ6+uPcTmKnWjY8IwBVw/qE/ZWLCnyaEnbix8Dvk8Ky/J/65bvmhnTVHoyV2TLmb
	FOraeEr9lqvmFL/GSj+293/EpD8BMv8SD6QXFHMriFsGtxgFMK5YEdQAnqyoRhX9R9vpiq9tCMw
	uNI1syytQwBr/FFcafhdCLfneY6S9nRk2mUE0jZVg/JoDRMcEvmUk
X-Received: by 2002:ac8:5d0e:0:b0:4e5:4531:2a4e with SMTP id d75a77b69052e-4e6ead7c558mr259927561cf.78.1760321350428;
        Sun, 12 Oct 2025 19:09:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFbtDwhTw3wFDerFdKWqV9V4ypofI8gQE0PqdpTVBNF3CPN31e1q51G61ezYb3csieopyoRCg==
X-Received: by 2002:ac8:5d0e:0:b0:4e5:4531:2a4e with SMTP id d75a77b69052e-4e6ead7c558mr259927361cf.78.1760321350051;
        Sun, 12 Oct 2025 19:09:10 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-590881e4f99sm3563419e87.7.2025.10.12.19.09.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Oct 2025 19:09:09 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 13 Oct 2025 05:09:00 +0300
Subject: [PATCH v3 6/8] media: iris: rename sm8250 platform file to gen1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251013-iris-sc7280-v3-6-f3bceb77a250@oss.qualcomm.com>
References: <20251013-iris-sc7280-v3-0-f3bceb77a250@oss.qualcomm.com>
In-Reply-To: <20251013-iris-sc7280-v3-0-f3bceb77a250@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1430;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=wbVaP1lpyBvdUoAnAqQoSQ3X0Ci5SY+Yd6B95zwrfnU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBo7F85pdysF02W4HqhSIvGSDCIJ7GrLbDMZVFsc
 dv4gTglv9iJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaOxfOQAKCRCLPIo+Aiko
 1cRWCACwpvVooIFThA50z6RkSDlGk5bW6Iqs+IuB0eI3woWhV7hRWW/PJ3X8v0V/1KF5sUn8VP1
 9nIRRUhzLBBiX3KQRN5W3yXXK0odowR3+EHWcWkywXgxw+LDC2MCqIoEaao1eVeWq6GEIHioHUp
 cKcmhm9dhAjwIMfhByfudrN4sbyfKyKolTbhw8m/slzG/myvffVax548hQ2lOsA8wM9sskaS4Uf
 ysTgkdfyGJvoSBl29Ku3hs/1XTh18jYrkT7sOhWObdT2DKStN21kilNoj2PFNsqRukpF29z9iq/
 LxXLQdHysdYupMj9Qb2hGhZZpipeOdM+qvJ5Dik7tPq0OU1j
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: LA2aSUX7PDFzvuCG-DmRuDoSOFnOOqeQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxOCBTYWx0ZWRfXwvSjHFLN7Psj
 v860ph/uy8/IyDGV6RWJNG5Sskoa0T94oYzHE7wQBISW8vbxe0sMIt3hpR6TbyxxdiKFowBtbFu
 UndLx7oXeZWEfgX0fY0v+55Bex5F4qsfskc9z+3CF1pBW62C0oX6afrPjize/IbEs4sGjB5LNh0
 GJ855M+TfuJNS2WkCDpLMSKt6Nxe8WmIV8rsTMgoibmATAduWY2PA9x2/YiDn4arh5gE7KrZh9f
 VeUG+uGyM5Sm/cWhNqofVWA+a2Hz6PS6VZFdVPA1+ApvK4f8XPCb109jK1NInr/JLJeGg4B3VAW
 9ard2v00vl5ek2kW+EklQQgd0FEJwdp9Qit7WLXWGvMhXYU90dA+4MeyPihbSUR0ajyLOiUNeOg
 OmYZLHdTdZktiaWq3GqopDFdkmFlWg==
X-Proofpoint-GUID: LA2aSUX7PDFzvuCG-DmRuDoSOFnOOqeQ
X-Authority-Analysis: v=2.4 cv=PdTyRyhd c=1 sm=1 tr=0 ts=68ec5f47 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=OYuIXoeRUKmE5Kzn4ZAA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-13_01,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110018

In preparation to adding more Gen1 platforms, which will share a
significant amount of data, rename the SM8250 platform file to
iris_platform_gen1.c.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/Makefile                               | 2 +-
 .../platform/qcom/iris/{iris_platform_sm8250.c => iris_platform_gen1.c} | 0
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/Makefile b/drivers/media/platform/qcom/iris/Makefile
index 13270cd6d899852dded675b33d37f5919b81ccba..fad3be044e5fe783db697a592b4f09de4d42d0d2 100644
--- a/drivers/media/platform/qcom/iris/Makefile
+++ b/drivers/media/platform/qcom/iris/Makefile
@@ -26,7 +26,7 @@ qcom-iris-objs += iris_buffer.o \
              iris_vpu_common.o \
 
 ifeq ($(CONFIG_VIDEO_QCOM_VENUS),)
-qcom-iris-objs += iris_platform_sm8250.o
+qcom-iris-objs += iris_platform_gen1.o
 endif
 
 obj-$(CONFIG_VIDEO_QCOM_IRIS) += qcom-iris.o
diff --git a/drivers/media/platform/qcom/iris/iris_platform_sm8250.c b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
similarity index 100%
rename from drivers/media/platform/qcom/iris/iris_platform_sm8250.c
rename to drivers/media/platform/qcom/iris/iris_platform_gen1.c

-- 
2.47.3


