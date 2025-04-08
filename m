Return-Path: <linux-media+bounces-29616-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 643F8A809DD
	for <lists+linux-media@lfdr.de>; Tue,  8 Apr 2025 14:58:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 18F848A801E
	for <lists+linux-media@lfdr.de>; Tue,  8 Apr 2025 12:48:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 067BF26F44B;
	Tue,  8 Apr 2025 12:43:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RrMdaAsD"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 075271E489
	for <linux-media@vger.kernel.org>; Tue,  8 Apr 2025 12:43:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744116216; cv=none; b=rlxspvS5e3qGdmLFx592FVTAZ6cFTOsnM38TQkoUVXTJoO8fmru96UZ4HyRyhU2WipaUxKDDnvqe+TlzkAdce05tr+SA7fgeZHpTfieJ1bMuRU9VekamBiEJFju0FBM/apdtbTl+yZmJqaNSxS3e8tPb9U54BPxiBine4H0daSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744116216; c=relaxed/simple;
	bh=CtIfV90G/+TA7lPkVgwMhnh2oIhA1bParUvjzjA8nuw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=fmg64NtOlwleQQBwaqlMSHno6Yx9f2/lxoZH9RqHh/xGVYy/3c3quqcSjx6IFeyvBiD0BNQFRQN0RlIKsEp2xDPU3Hai/NtJ90MkadWW/9y+Q12bvHSClmfMTjJipTeenCaEzvygF+0N39aG/ATrSxv1/XvVvHCvowhgMCv+2fY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RrMdaAsD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 538AjEKx000856
	for <linux-media@vger.kernel.org>; Tue, 8 Apr 2025 12:43:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=3xpB3/REHEHCx3wA2Wg72W
	qgNxcZhB5rfGLsrI4xfBE=; b=RrMdaAsDwzk+81SRn8Ry13cSw6jPrksO3ssr2s
	0PV21O/KRUkSeyrXNHFxQiA2vE8cZBwtoXyjSI9WjaVZtHkLILgRG5f9po3w0aCa
	1bVFtO/QoRpRGkVdwGhy+9D9F7ucIwKymJq3CW8jxn3z6ffLOwW1w7MVoy5Twzli
	j0vK54QP3b44X+5tYJiYiXlfzOyCzq6DNP7i4eiEWNV3C0hxommPA+5fS4RuwIfD
	X1zCLQLvPh3EqNe2JVyR02euFVZNakQ6COvtiro8WSPAGufW8wIpCFD/JSmReogB
	9tLhvVdpjjPlQp/PSatIo/Thc8pdEg1t5fn+Tu3a4Qp/WENA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twbe7t7n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 08 Apr 2025 12:43:34 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c54e7922a1so1200718085a.2
        for <linux-media@vger.kernel.org>; Tue, 08 Apr 2025 05:43:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744116213; x=1744721013;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3xpB3/REHEHCx3wA2Wg72WqgNxcZhB5rfGLsrI4xfBE=;
        b=jorP8C3jUJanr4u0B71YnjQ08tmMwJyoGl2+4ggCVYOjgulO4ZGiUIurHqWef3E+OR
         mJ5Ons325prneiC+nxxDyrvS0SNq8S/xILI3QwFcUNUzyV7Yj35kv6VibOQW+fMWC9ht
         oSK/NgqbNOtdMjmnMyFv1KlLgEHCzArPEn8KkGjlQfBXWQXYBLQNzef348NFhrYZN+YQ
         tl6nY4a/m0k3pN7cFmz+viMTOzC2YCxKMsYb5io+cDm0OOZPctETAo1+VqADUeME5aHy
         LKkNZ6mk9eyy2ENl+V1L66zdm2KbPuZBL2Th5mhhTFSJXW+ktc+ifiRozFkm0wm3ruQi
         txrg==
X-Gm-Message-State: AOJu0YwE9IrKvb9rlJdzbx+NzTYx3OykAAfYpUViofqLWP1uY/U20QHD
	jkHJJH5YA5ej4XQ3zsJgvbL29Ahm9f1elzy8HWchzfrXydxFZvKOrW7QU2X2deFHS9jcwi/AM9x
	i+kErPrLLp7H0CaT82JUnDFk5oyKwX2Ig3a5MKxwc+7wFAkNqsXAzPmR/ZxwFTQ==
X-Gm-Gg: ASbGncvFFi0PHEIiDBamsx6aVb+rdAzLiqazeXXtPjtXk7zc1s3rdzYOCesSYyx5Eu0
	tjN0t4MIHGSR3aeWNB4yzN7xOOU9pIobp0KSACGx4kexXGgA/hhC98OkSRUDyXE6IOuHedjnqZ8
	LlYdLN0293KNYrGhIB0FRcp0Au/4CI6WKU7LMUfrMa0iWpr9uUFADgfBM3fpc9HSqagfxcfQmz1
	lyqTW3VO4hElXquazNwEOXzTcOvDf7YwvbYw3TK0zX7NsQR4aAePQAaW0WL+Yxe6qyU6+6ABcVi
	aAAqjXZg+4na+IoU0YlAimvUSn6sxehinG5/E9ch/duYKg1xtK+qg+uHb4slLJENMxi464gABn2
	2d3xq5OIv1qo8PbYgYljCxvh8wJTe
X-Received: by 2002:a05:620a:46ac:b0:7c3:d711:6ffb with SMTP id af79cd13be357-7c774e003b7mr2286227685a.41.1744116212587;
        Tue, 08 Apr 2025 05:43:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG/Nz8lK9iMbIJtrIxVHXEofAsKm0l5bjpW/a54PJaq3+8xRjj1sYavaFIxtR7N8enoCNOugA==
X-Received: by 2002:a05:620a:46ac:b0:7c3:d711:6ffb with SMTP id af79cd13be357-7c774e003b7mr2286224785a.41.1744116212259;
        Tue, 08 Apr 2025 05:43:32 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30f031263b3sm18622891fa.22.2025.04.08.05.43.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 05:43:31 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 08 Apr 2025 15:43:28 +0300
Subject: [PATCH] media: adv7511-v4l2: use constants for BT.2020 colorimetry
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250408-adv7511-ec-const-v1-1-6a7f86b0a5f1@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAO8Z9WcC/x3MQQqAIBBA0avErBtQs6yuEi3MppqNhoYE0d2Tl
 m/x/wOJIlOCsXogUubEwRfIugJ3WL8T8loMSqhWaNGjXbNppURy6IJPFy66M0PXaKGbAUp2Rtr
 4/pfT/L4fHOt/WWIAAAA=
X-Change-ID: 20250408-adv7511-ec-const-b46796340439
To: Hans Verkuil <hverkuil@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1122;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=CtIfV90G/+TA7lPkVgwMhnh2oIhA1bParUvjzjA8nuw=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ/pXyc/7Tzr/3nbxyZQHCn9lOVX3zlrMICrNyyvkeDy78
 /Gfy38FOhmNWRgYuRhkxRRZfApapsZsSg77sGNqPcwgViaQKQxcnAJwo6ez/48TlVzoF9mrXfz3
 JfvkJS9Dk2e0JS1d9ewu26L1Vx8rrJ/xcV7axOgtbXnsOq2yKyrK5sgHuizutwzjZxUJUJH3iQn
 /vWRdaFxksbrJrPbQNXZqexdKPLJpl1X7fU5Mcv2mNAFD1+/1G/6whzK9SyoPfKEUkmTCoW3hav
 Bi5nVFi2YnbecPUa/6p18TkLc0fyX3J2KDd/jxe3db8312ifCcTm9Qf8FUz/fm0DRVgWst79dN1
 gpK3PVNtbXhoQa/7cy6+r8xwfwBDDHbEh/WPdgvL841XXA3B4PHI2EjMenZZbquh2VNFMQjTHO/
 vq1o3Bmycm8s12r+4lSG98pscauNWM0CjaI2nnEJMAYA
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: aO91f3Y-25nnhxNE7_MzC2_Uk5S4TmI0
X-Authority-Analysis: v=2.4 cv=T7OMT+KQ c=1 sm=1 tr=0 ts=67f519f6 cx=c_pps a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=19vmYW5QbdR4jg4F7bgA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: aO91f3Y-25nnhxNE7_MzC2_Uk5S4TmI0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-08_04,2025-04-08_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 mlxlogscore=777 lowpriorityscore=0 adultscore=0 phishscore=0 bulkscore=0
 mlxscore=0 malwarescore=0 suspectscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504080090

Replace numeric values with constants from hdmi.h.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/i2c/adv7511-v4l2.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/adv7511-v4l2.c b/drivers/media/i2c/adv7511-v4l2.c
index f95a99d85360aa782279a127eee37132f9ad08fb..853c7806de928da2129f603e7cb673440a1fcfac 100644
--- a/drivers/media/i2c/adv7511-v4l2.c
+++ b/drivers/media/i2c/adv7511-v4l2.c
@@ -1370,9 +1370,9 @@ static int adv7511_set_fmt(struct v4l2_subdev *sd,
 	case V4L2_COLORSPACE_BT2020:
 		c = HDMI_COLORIMETRY_EXTENDED;
 		if (y && format->format.ycbcr_enc == V4L2_YCBCR_ENC_BT2020_CONST_LUM)
-			ec = 5; /* Not yet available in hdmi.h */
+			ec = HDMI_EXTENDED_COLORIMETRY_BT2020_CONST_LUM;
 		else
-			ec = 6; /* Not yet available in hdmi.h */
+			ec = HDMI_EXTENDED_COLORIMETRY_BT2020;
 		break;
 	default:
 		break;

---
base-commit: 2bdde620f7f2bff2ff1cb7dc166859eaa0c78a7c
change-id: 20250408-adv7511-ec-const-b46796340439

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


