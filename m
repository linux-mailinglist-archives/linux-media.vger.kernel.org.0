Return-Path: <linux-media+bounces-44964-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EFACCBEE00F
	for <lists+linux-media@lfdr.de>; Sun, 19 Oct 2025 09:57:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 67B75189E5E6
	for <lists+linux-media@lfdr.de>; Sun, 19 Oct 2025 07:58:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4649239570;
	Sun, 19 Oct 2025 07:57:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Zuso0Hl0"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7604D23C4FD
	for <linux-media@vger.kernel.org>; Sun, 19 Oct 2025 07:57:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760860632; cv=none; b=UyMtkG+BuojrKvxfVueHiVpRTHD/2UG22nov01EC+gImx8HdaCRfsBndNJlh6+avllu/8tR+v58BKDpPjihZOGg2d2HjSIcSdaR1qnNH3WIyAZyaKqOWjnGR3SIE7PBTTRO1ufYzgyTbR7gS6npqjyJOiroZ1qTkTPicp57yQEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760860632; c=relaxed/simple;
	bh=Ebl4v/VkXfD1I64iutehxYEDpuSCR37dBGPipaquSZg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AzfwU7Ql/OeyxbkURfnAprKtiFDQCnbqgAdVbhEXwUWRMk/OYT6V6VcTrJeigdDo2qWA9na7glMX/si6HTDBcU7dRs82bkuV6X8ZSIITspp+iy/bya0kNx8e/KTR1ntxgp3CmlIAMtZXX07kBK74r+0Hu6seodXxAEQwVX8/EZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Zuso0Hl0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59J60KLZ022399
	for <linux-media@vger.kernel.org>; Sun, 19 Oct 2025 07:57:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+e0kmPSERHqC5oqgfvQz5PD2Os0wmkHOTZ+f+cd7qww=; b=Zuso0Hl0+p3CeeOa
	W3DSELNAjdeJRbiiHI6/YJtUwBlf/wog2BEU2x9o5T3LLi74OdQc/QlbNUrdcy0A
	OMDpovdQsvosiZ92YqYQw8EOj3Yi9b7IBlE4zZWeNVSLGEWz9VrScrpYPKlvHs+e
	3plz2yZx5Wo5sqY8cC0AZ6H3awDjSIlbbUm6lRK+YMQm2JtEl24AzBKzSebYs7lR
	TuhLdgLPH1hk/nlvgeMfosVrhXU79VYKTFdF0ifthVLDmI1pKT6hmJyf+3TNJ1Y0
	pPkttr+yp++JR6OWwMampIKdCt9NBQf+/9w3BfwOTctbAJLlPEVxvsBTpOdzhrs7
	avYwkg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v3nf9xe8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sun, 19 Oct 2025 07:57:09 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-87c2085ff29so111788386d6.2
        for <linux-media@vger.kernel.org>; Sun, 19 Oct 2025 00:57:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760860628; x=1761465428;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+e0kmPSERHqC5oqgfvQz5PD2Os0wmkHOTZ+f+cd7qww=;
        b=BpQeklsdA/6cuc5UOzGwOPvaU47KVbCdEjmbLnVCi8Lw5CnqS1JxYs/UnSw8Xm7ZjT
         2M4yBTGbynntE80betGpR47DmVb5OAxcbm+Dx7F7g46onfV4ss/H0ckhn70S45jy8dmt
         ePGLREL7s9Tro0QkJQUMLMEK7gdd6pf4XRiNXeuh8UIl/hqBcAqb0DlgFA0jXkToUm+K
         4T3IzJqULYXsT2oF8LNx6KFGlFJZZ0i1g6trj8fhlDCS+uitdVUby8N1UQrQ6KyHk5MJ
         4VwWjlnMD+gmG0thtChIuvpLeurZqLgXN/WRi5zVVQoraxo5yY2eweShYe7xybyDxPEL
         GwTw==
X-Gm-Message-State: AOJu0Yy2y3OE4y9qJ1OMadIFG99NjP+2q6hvW0e7dY/q+SjMeC9ML4P6
	uvQHVflo5tYgP6msvSBFyFNNxmpHnF1GUAkpJWJ2RZyl24pPpL8Ib5uWP6oWJjwdpvRhywaHnnp
	Ku47jMYQeD1AGRPWMQTy/pkRgAnl9Kicz1uJxf8r6cX8YCN3sbnbXkl05eZVBqlhAySZW4p/3Dw
	==
X-Gm-Gg: ASbGncuZaXuvmygAYKZ1I6STcH69OVQZxsp8yShLLeNc9q6pq5UIPPnFTbCNyo/9hco
	HiVu44pS45rB1mnKCJFqBO/tLO39HKmGfzUbIsXNEr226lBpvzLYauhsWRClo2LPuJKA6w0zLZX
	gu/GP1X7kMrTLV8eZKrAqvScNbitmSk+UfmQjvZd8BzAMpOAY9m+BBggrhj9imyU/nZa15paAkv
	+3kW8DGmJSa/hPmfUDM458Q98VZ3qe0owRn4XigEED0/ZOdIYqRpmSZV3xJ+WE4u5DISAfi6sb0
	O327l7+mYtYbkshIpPLe4BQM7kStyjwBaJP2VnEJOCB7vmGwEaRV/Y5twFrz5tsvLyraWx8p6t0
	lkiRLZxVevO0TWYFiimQuzgr3k4++oxdJ9RnkDLKtc7jqTS+oKdSTye2bB6AkeuXF9mIr4+8xQz
	DXW973FyoShd4=
X-Received: by 2002:ac8:580a:0:b0:4e8:beac:1151 with SMTP id d75a77b69052e-4e8beac14c7mr6065651cf.58.1760860628111;
        Sun, 19 Oct 2025 00:57:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGDctdAhTGoH2UVH4SIDDcoeLsFaivxMV8gksU2P+0NHGGMP1let3HDtxEPPUwme+DeMzOSFQ==
X-Received: by 2002:ac8:580a:0:b0:4e8:beac:1151 with SMTP id d75a77b69052e-4e8beac14c7mr6065531cf.58.1760860627615;
        Sun, 19 Oct 2025 00:57:07 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-591deeaf4cesm1357027e87.30.2025.10.19.00.57.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Oct 2025 00:57:07 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 19 Oct 2025 10:56:52 +0300
Subject: [PATCH v4 5/6] media: iris: rename sm8250 platform file to gen1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251019-iris-sc7280-v4-5-ee6dcee6e741@oss.qualcomm.com>
References: <20251019-iris-sc7280-v4-0-ee6dcee6e741@oss.qualcomm.com>
In-Reply-To: <20251019-iris-sc7280-v4-0-ee6dcee6e741@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1493;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=Ebl4v/VkXfD1I64iutehxYEDpuSCR37dBGPipaquSZg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBo9JnECS8dwDhbb6wsBiT73LflWqJdL+MdmheXt
 gM9pKy93qaJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaPSZxAAKCRCLPIo+Aiko
 1ZLYB/9dd3i8u8x3HW0QEmpoIkw1Ko/osxFOOmA+2TF/8rLI4a33AczPjU0+Bsj7lelv0QM2JXh
 iWuIVG67FB5hWZYHyEPz3uekZCBVe+a0BaCeZeC1/w+OmE6AdiLo+NITUXHio3fXR/FP0WOX7lV
 6V8XxQuActxxASDQv9Al+M2v5KmjrUkP8E81/mZthVbB2/o6hY/Q1S3bXBRylqlRhQKxnNH+CAp
 g2zyfg1IqpjmpmP3nXoPxuCmqRw/E/z4mXvPBwaRjwkhLXFi3EPD3OR+wXXa4RzoBtlruaVo8xl
 Y6+fSnFOVtiYy3VCw6zeaz0agOmvXTGoklLQJxW+6LqYHUR6
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: g1iB2zMZiROTYbyXZTP3Fs1DsPkSF1D3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAyNyBTYWx0ZWRfX9hlv+YimDZ1k
 SvCiKrsO61hffddS0oEHqCj+2SzOUjbTKYLGIG5hEKqmWtYHpG/TvLsFQSHm0ezZJMLIS5V9B4D
 QIkDQJDEGM1jUOzhqjcuXbUqJCdF22aNaOechAq6cFhFcIO1hnBaJN7FgDtOe8xkhRTcM4+KDuv
 kI/bDBqW2GrShVScOvs5AlMzYP/VSPMXCOho9NkEnTJQYxOj2mzStV677QNNhoUBu1uTRWz5jwF
 eJEmtalouCCHArq7sdqm0o33MlNhWsijRO4aUMVaMXUzxNP+4+xomwul/KnH1j3H3kxZeX+72vI
 6ri30mtHaeSCDZvRCcaryf4Ja+LiFHiIFiI+jkJ+14en/V5lOzhyUdH+P9+AUAJSBDp0YZpcoW9
 K8EQWFLNvDmbfGQoz30Mjsu4p9QUnQ==
X-Proofpoint-GUID: g1iB2zMZiROTYbyXZTP3Fs1DsPkSF1D3
X-Authority-Analysis: v=2.4 cv=EYjFgfmC c=1 sm=1 tr=0 ts=68f499d5 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=OYuIXoeRUKmE5Kzn4ZAA:9 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-19_03,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 spamscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180027

In preparation to adding more Gen1 platforms, which will share a
significant amount of data, rename the SM8250 platform file to
iris_platform_gen1.c.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
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


