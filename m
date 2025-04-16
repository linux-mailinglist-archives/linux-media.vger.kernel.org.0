Return-Path: <linux-media+bounces-30386-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B862DA90ECE
	for <lists+linux-media@lfdr.de>; Thu, 17 Apr 2025 00:46:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C4E17447600
	for <lists+linux-media@lfdr.de>; Wed, 16 Apr 2025 22:46:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6D5924293B;
	Wed, 16 Apr 2025 22:46:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NGMIisRs"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD747242910
	for <linux-media@vger.kernel.org>; Wed, 16 Apr 2025 22:46:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744843568; cv=none; b=VHWgdLHcxnra3ZdnaDNaKVto2pzXQ4zzqR/dJlh25/C+THrkLMNJgwoBhbXgEYWMxP4aCiDYUdwue9CXS2dlDNy0a4p8S+aeoMoqwqcH1yLbBAHeTAlr+iMfslKAkJV1cbQrQtTKyNIF9RNQvCVKSqQ8OzifwmsNZSW3gjYGZLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744843568; c=relaxed/simple;
	bh=CtIfV90G/+TA7lPkVgwMhnh2oIhA1bParUvjzjA8nuw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=BxXxpMsGc1zCRNCgyDVtByBhoa4OVz2W16lACO4xq0kdPJ2XGB60ODszgNhYxzeKbnKKWajvxG71gLXQuBG1Iad8bGaovDu+sFciV/KBW5N2Zb2O/8DqgMFjnziBEOHdgHOs31ost3WA0I5sPgaVTiyEA/eLdwahIgHkzExgaUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NGMIisRs; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53GLTJce020551
	for <linux-media@vger.kernel.org>; Wed, 16 Apr 2025 22:46:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=3xpB3/REHEHCx3wA2Wg72W
	qgNxcZhB5rfGLsrI4xfBE=; b=NGMIisRsFClNE6vwKm6e3TRKimrTBkQkyUojKl
	KltfrJg4MEb6qIVMs/UFZ0QBt09WkBCEmqCVnSXVq3TwJPdPen2ECZP2eZqYjvd4
	epbDgAQBGKakoEl2dUqjp5ScGG0GSveKv5mmTtgQZFVlH23WQczoldhTFSjT6DAs
	aRiwn/AGpddY179CNxM7QmrVjx/AdUrDhueOyrZckcqYRZTxBG7L/kWAZeHjqz7f
	020bnZk2jenqYR9KJYAGo3VfC1jVhqimKG1ydnsMcBcPW+EPTP6+o0SQnV0Wr4/u
	GndEjYS1QQjrjpENQVXktgz2/Q9j9wctwhM+AxEskpb2wk7Q==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yg8wmys0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 16 Apr 2025 22:46:05 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6f2b0a75decso4779236d6.2
        for <linux-media@vger.kernel.org>; Wed, 16 Apr 2025 15:46:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744843564; x=1745448364;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3xpB3/REHEHCx3wA2Wg72WqgNxcZhB5rfGLsrI4xfBE=;
        b=rJcSafoihux8k1VkD/aw4mZPgsJHH+6Mpb/vGGKs4EG8SekY4O6hQC0Y33IJLC7fCv
         ImzHlqzaoY1130mpAGr/GfMwVrOIB5EwDShag8D6gUCoJSJJywN8vqyRH4puMt8TwbAr
         CNWpJXjZVz1KU/ll8l4Bjt7X/TUo634Jlo9sIZS8TFPkUkZV9nnB3lOxfXQIr42bA1zm
         Jv/EF33u1XhUFTENKYNL1CeEuZF+SuuW3AaYq+5KC0asmLsVKYIkuigDOetyxqoEhYx8
         r/cWPIi1kHMvytVVAG0lme+sTV3P3ClW4Dzb+bs/HA1RYwT9lcxL1dQ00qxS7TeC/2Mh
         WNJA==
X-Gm-Message-State: AOJu0YyqocBn+AEXkCxGT4jF1Yix+l3luxkd7Lokm36U9jnYVWqdutko
	0b8TRVCz4XWmV/ied6s+kgJvW+5BywbONpa0e7hIWMLbVN3LpQ10UPjuM/kivshZvxzHr0nqw88
	TTLbkZjXlFZvbP9QWOWh7NDf5rB4bz5ARR5x2PRTbwxnuQRdI/i/TmQSPEXkPWHHeItaAgA==
X-Gm-Gg: ASbGncvAKEIOEyBffo7gywNanCGzwvF5BFuHK20hnlSd72IIytVtlNW1RZLf7XSyyI4
	bSuwaUwXwe5GdoteUoeyn7fpJfdyRGNgi78N0AaAj99HpzWiXaC7qnmoAMX4ns1tDAl86hXbFrG
	e0fPBhoinJo5Cxg/JeHbs9qFOzzpfS94Ac7mK7ERL2u01JUWDIn3N3xGl1swJVApkKsTn5FiIq1
	amzm7NhrmerwmP4xveyPnd++O0tpsggCKhZeCS0rNeUN1g8BYgHi9Mhq2uXvT8Adhk5oiOHS30i
	4vMmNUW2wOucnHRsJT/WTphREB3z1dyqYtrOoHNqnUTjYcFUNhbezkdwbfS58XuqhSMvVdpjVV8
	JfNvC3wFNlZduEOgA/7G02QrV
X-Received: by 2002:a05:6214:d4b:b0:6d4:dae:6250 with SMTP id 6a1803df08f44-6f2b302858dmr71349916d6.34.1744843564566;
        Wed, 16 Apr 2025 15:46:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE9tZ/XnA8LdET7DMlXwkk7hqnEIeM28Aor9U2eHv6gu3wYYeeudC2Nu3p2fsDBtVqdBUYDkQ==
X-Received: by 2002:a05:6214:d4b:b0:6d4:dae:6250 with SMTP id 6a1803df08f44-6f2b302858dmr71349696d6.34.1744843564325;
        Wed, 16 Apr 2025 15:46:04 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d660aa795sm181278e87.192.2025.04.16.15.46.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 15:46:03 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 17 Apr 2025 01:46:01 +0300
Subject: [PATCH RESEND] media: adv7511-v4l2: use constants for BT.2020
 colorimetry
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250417-adv7511-ec-const-v1-1-74301e17646e@oss.qualcomm.com>
To: Hans Verkuil <hverkuil@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1122;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=CtIfV90G/+TA7lPkVgwMhnh2oIhA1bParUvjzjA8nuw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoADMrEiDk/OfM3hC9M8DFAReZrjB5dH8MS/HXe
 +UksddrMhqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaAAzKwAKCRCLPIo+Aiko
 1dppB/9zli6R0pMGVsGcTpyYKryn04WnXMRVtL9AT0HBT43uyPCrRco5ufy3iQipaBkwiIdF137
 8q77vCCNpN0nhOaBmBn+6TtUkonNvXmmY5ymekHwxK2/2hlMTEWQZcIrniu0TffRrMP41bLW2sB
 Y8s9d6+vnIPvMA8inN8Uaoplk2bJNl6XlNEPEH/yeomykjYW3FySqZ3IEFufti0KmQXHTu8UsIW
 JmMlqjK3DFWpLdIwtZ/uCn1hqMMDaPaHhaoqnk3cui4krbrl8LhKhvWVuxPIBcpSYv2ohTOJWxf
 oI0HD5hyOdZm54O1/fDE0GrZ2M2y+EnJESFkmDPszH/rXUVH
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=E9TNpbdl c=1 sm=1 tr=0 ts=6800332d cx=c_pps a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=19vmYW5QbdR4jg4F7bgA:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: mdX0XBWiHEyNkjueKbtdjWDTTe3jXAPb
X-Proofpoint-GUID: mdX0XBWiHEyNkjueKbtdjWDTTe3jXAPb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-16_09,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 mlxscore=0 bulkscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 suspectscore=0 mlxlogscore=795 spamscore=0 priorityscore=1501
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504160182

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


