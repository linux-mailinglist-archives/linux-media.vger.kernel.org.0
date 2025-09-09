Return-Path: <linux-media+bounces-42134-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C5FB7B5068C
	for <lists+linux-media@lfdr.de>; Tue,  9 Sep 2025 21:46:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7219416F6A6
	for <lists+linux-media@lfdr.de>; Tue,  9 Sep 2025 19:46:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1752319E7F7;
	Tue,  9 Sep 2025 19:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S3NHo08h"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B34EE1A5BBC
	for <linux-media@vger.kernel.org>; Tue,  9 Sep 2025 19:46:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757447207; cv=none; b=iplszoAWD5kPNX9IPRrrpNJeSL0dkSEhy+GuvqVnoAgysLHpiIMEcxCgnkWh/zqKnWbRV6go9tH6f1XMecJnOZKBaT1yAl/nFJa1pD6v4iPlKJm9x2PGjk6kAp9qVJHi/JZf4vJPiK63oDRulqqWCQxK5ue/YhYoDKxsYpGJMig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757447207; c=relaxed/simple;
	bh=bxllsDf1Lp5l4wjG0+72sWfLlBUmHJTnSL+neH2MmYE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=b4L04eiNRTLvJ9HcLFLrnjPuqCQnqCnXGBi9NHAc2V5QhkSqOGVkT02f2RrzqOFLTn+F6U+H3U/5FB5aJTKLqa7coCGgISSxj8PemM/D+BdmvONdWprnAfnIDIPH/dvlsPwSMwpl8p4AJ1DoSqVD8V3u9C8PyawI6z1SyluaJLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S3NHo08h; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 589HQnN4030510
	for <linux-media@vger.kernel.org>; Tue, 9 Sep 2025 19:46:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=5steLRplPiLvefWuDpnbGIk+jjoaaF/CqJG
	o3p0Oykg=; b=S3NHo08hi5lyx5mDsSx3B7xaaTgM7tPKMem0kGKIsnoA1mpmZOx
	2wgTlDZeC0P/fckpfQ5i+cZkT49P24l0w0ciAWLyxV0HOefBY3TKrXoSW5wWJ9aB
	0W7pdUka6RDxsgB/K6iEIfCi2pdDCd92mL8JBrOzq9ed4P5HcbzCPgHZ3uuZdVsx
	5i56ZWFFtBcWIFH9tv18waP4QBQaAAI9ezzHX90s++mH7gNUQRiOse862IQTamaz
	A59peSJpaQRpZo5UXMswFV+BZbOykcya9AmntZaNZ7L8dNOcQK+w9SNDiiyXBFgo
	KsZtUvTZUkUSw31UMlvsOrrV76yPvkEJbdA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490c9j9k1p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 09 Sep 2025 19:46:44 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-728a71d8fd9so184189396d6.0
        for <linux-media@vger.kernel.org>; Tue, 09 Sep 2025 12:46:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757447203; x=1758052003;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5steLRplPiLvefWuDpnbGIk+jjoaaF/CqJGo3p0Oykg=;
        b=YKLoKfmCFS0+2GgATv1Y9wAuJw324dzNZTY0+iHP4WDsiUICMVFnMoE8SsrEeBvTAs
         lSfY4Q0C8b6p5Jvj4sUqfRavsDZhBzFbFLJQZObzEPmM2FPfijL5auASCJpfb3eIomTu
         /FDJtbluNgcQt8R8nT5unZ6ssmEsG5pJU1dlNv6mfmP7ZACMCHfL593tAtbuxwRyo/E0
         RRIwRkwf4Y0XSR/DD0Lp/ulPS3ajtEdRkSOnR6IPfeQE0U14i1iecUMPK5w031GRb8Nl
         XZDgz0uZJ96k16B0RtHM1LC1u6KYJfBle2TQxh8KvBFTYu1ZV0Vo6vstF+xYy6NTQB8f
         cdxQ==
X-Gm-Message-State: AOJu0Ywl1ahlPJj/b2FE94NKK7zwPXMcc0FyuY4NEjUXUZWTLbJw06eO
	dAYVBV9sOnG1VQ94QCblBqc+/mzyJkBRA3TKzXCwondYe3UamFwB7pzZtyb8ySylsdAMxQXt4XS
	n3QatNC1cLj9F/TdytgCOpQsAj3ueQjqnslKIiDXJXjux9gfxvjJunc8zDeEVs96MaQ==
X-Gm-Gg: ASbGnctvLe1EduOSVSTz6yJ8kkfhGUuNkzr0jN86R7UXpR8q9R7GCIQOrdgz8Fs2h/w
	qTdkRf4vhbMRrf7Z7CSs4qYN1w7aO/0tr7u8TG43yeshL3cpd/Vo2w1HsJ9GquDaMDVnVP1i6BG
	nJUUH1xgzUjwnHX/0uqWwQyMKWLo8LfnqP77p2uVatWdTQ8H84nkHboFw+eUXTJHu5oYcS1Tz1A
	ue1xmlVuGLox3XUAdhzIueYFk+M6bABI2V0t2PvRvhmmUCNYdUHV8tyEs8yKjyoA4MYXepMWZBW
	j0K0aQopwngc0HJ6EWC1w+LxOKLrZgutIkGW4xU1xkhIlU/xwFbG7z0dJSD9ZQ/S84tA7XzHGmw
	=
X-Received: by 2002:a05:6214:2262:b0:72d:8061:93f9 with SMTP id 6a1803df08f44-7393ec168a2mr106215056d6.37.1757447203582;
        Tue, 09 Sep 2025 12:46:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHicJvN6Ujucn2Isb8qJ82mIwVum40z8rVje70UXWdGxfkdDyrQ4DkGVKF4ygrOam+Eb1NvNA==
X-Received: by 2002:a05:6214:2262:b0:72d:8061:93f9 with SMTP id 6a1803df08f44-7393ec168a2mr106214806d6.37.1757447203103;
        Tue, 09 Sep 2025 12:46:43 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.qualcomm.com ([2a01:e0a:82c:5f0:15ba:6482:f5ef:4039])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-62bfef68a44sm1743963a12.21.2025.09.09.12.46.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 12:46:42 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
To: bryan.odonoghue@linaro.org
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        hans@jjverkuil.nl, Loic Poulain <loic.poulain@oss.qualcomm.com>,
        kernel test robot <lkp@intel.com>
Subject: [PATCH] media: qcom: camss: Add missing header bitfield.h
Date: Tue,  9 Sep 2025 21:46:36 +0200
Message-Id: <20250909194636.2243539-1-loic.poulain@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAyMiBTYWx0ZWRfX0ncRMmf+rClO
 WCB7QiI74KfYL8+3W1FW2kMJVPvX7d4RoKTWx4qPFhf0BL1SM4ucTBI1Y6mZWHo/cIUjjkjbPSr
 NCmOyyXBjTdOWnZKfuQgufarmHpaAe6GWqMgrYxga9Ome4qtJeaJg6XblLRFrHWrHdAYXAXnVkb
 kcp5RO72Fbv8i377fcSsaA0duZJvMCAiwg3f6uQcJWn2uqhPfoqjovstbhpRiGjLee0MafkqLZb
 1ov8UYVLu3qKK3hnRKxOa1E6/2/FNenn1ZFHV0iLXratukkBYj4MFpSbztHxgWUh4z+tta01a/g
 JluzJb95+a23pJEbKFN4lh8TBT0/0yA0NHb7I3luIBq4/q9uN3dGx2f2FlLQo6tVEnTJBIQxmgB
 CvJjYIUu
X-Proofpoint-ORIG-GUID: FQx1wqFFT-WXNjkhZPAFTeEeuWiRdpFF
X-Authority-Analysis: v=2.4 cv=PpOTbxM3 c=1 sm=1 tr=0 ts=68c08424 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=yJojWOMRYYMA:10
 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=d6NsCnqxkaT3_V1LjFAA:9
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: FQx1wqFFT-WXNjkhZPAFTeEeuWiRdpFF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-09_03,2025-09-08_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 spamscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 adultscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060022

Add the <linux/bitfield.h> header to prevent erros:
>> drivers/media/platform/qcom/camss/camss-vfe-340.c:186:21: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     186 |                         if (bus_status & TFE_BUS_IRQ_MASK_RUP_DONE(i))
         |                                          ^
   drivers/media/platform/qcom/camss/camss-vfe-340.c:36:40: note: expanded from macro 'TFE_BUS_IRQ_MASK_RUP_DONE'
      36 | #define         TFE_BUS_IRQ_MASK_RUP_DONE(sc)   FIELD_PREP(TFE_BUS_IRQ_MASK_RUP_DONE_MASK, BIT(sc))
         |                                                 ^
   drivers/media/platform/qcom/camss/camss-vfe-340.c:191:21: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     191 |                         if (bus_status & TFE_BUS_IRQ_MASK_BUF_DONE(i))
         |                                          ^
   drivers/media/platform/qcom/camss/camss-vfe-340.c:38:40: note: expanded from macro 'TFE_BUS_IRQ_MASK_BUF_DONE'
      38 | #define         TFE_BUS_IRQ_MASK_BUF_DONE(sg)   FIELD_PREP(TFE_BUS_IRQ_MASK_BUF_DONE_MASK, BIT(sg))
         |                                                 ^
   2 errors generated.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202509100228.xLeeYzpG-lkp@intel.com/
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss-csid-340.c | 1 +
 drivers/media/platform/qcom/camss/camss-vfe-340.c  | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss-csid-340.c b/drivers/media/platform/qcom/camss/camss-csid-340.c
index 7a8fbae3009b..22a30510fb79 100644
--- a/drivers/media/platform/qcom/camss/camss-csid-340.c
+++ b/drivers/media/platform/qcom/camss/camss-csid-340.c
@@ -6,6 +6,7 @@
  */
 
 #include <linux/completion.h>
+#include <linux/bitfield.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
 #include <linux/kernel.h>
diff --git a/drivers/media/platform/qcom/camss/camss-vfe-340.c b/drivers/media/platform/qcom/camss/camss-vfe-340.c
index 55f24eb06758..30d7630b3e8b 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe-340.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe-340.c
@@ -6,6 +6,7 @@
  */
 
 #include <linux/delay.h>
+#include <linux/bitfield.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
 #include <linux/iopoll.h>
-- 
2.34.1


