Return-Path: <linux-media+bounces-60694-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GLsQOvLm+2kaHwAAu9opvQ
	(envelope-from <linux-media+bounces-60694-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 03:12:18 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A1B24E1DF5
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 03:12:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2381530598F9
	for <lists+linux-media@lfdr.de>; Thu,  7 May 2026 01:11:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B46F8274B23;
	Thu,  7 May 2026 01:10:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A9f0awT8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XjR+smxF"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C24D257855
	for <linux-media@vger.kernel.org>; Thu,  7 May 2026 01:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778116259; cv=none; b=NdliADjQiwo+41EpkAwFb7b+rOK3fpJcdm912k1AucdKb1unvWSA8VSHn7SoCyIX0aU81KKBQ05zZA9oPCqBHp3qNuPftpbT3QV4gCsXmVDkwsYd3mCP/SGbUX3vJVq7+kVYaSrWghnH+YYX6XmPIPhc6G60wjjMWu8gqc8pWAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778116259; c=relaxed/simple;
	bh=vCjp6Otef/xE5vbuvwNoduQVTq2eHsexFqb6kzgabfE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=G7isxc+c6qPxiWwYDcCCLP40J+cdUVOI5xNz2dtubOmQcRKZ3hZmbGtlZR2/d6OePFd0y+ITKaUOaQMxOfVVI3b8Nt05Nbx4jynInf9UJsCnEE04CjB7Glhyv2gIF8v0v5bDOMRmqi8EG/XhhAnx3khqFXwR3XhOxMsIscYH3jE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A9f0awT8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XjR+smxF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 646GPwDd1953203
	for <linux-media@vger.kernel.org>; Thu, 7 May 2026 01:10:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JXzLPzKJmMMfBleWuh+IFIAqE4Ffe4ls9p1aUztqIUU=; b=A9f0awT8VJX4k5QM
	m3yUA5bje7Z9ipB2kjAFeiwwxBKosM+JNHQRl25xxZChnjoxbj+NjHo82IcbaSXE
	i/o+osF4pBMLrXeisAlb+8RM9QpR4bKC8LROYSSOSB3FMlqyHzSogVjIt+7T6ySv
	NndNk1aI2WXjbtsUtdqQi0W8QY6Jr4d/v6qB+4B68SpkqMNU/erGi6YFICpjKHZR
	ImWFX9uBaLOnMZaD2M93siZ8xE9iON5fraBkBJIVYNDrMNhLnjY84+JyssJ48M5o
	UneUqTOfWfghuonXRJwa8MNgdfQ3WKU9XBkg9M0HBGJ3hJdgfBtjyPtmUNIQ6OXr
	m9/52Q==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e03jc322s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 07 May 2026 01:10:54 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8eaee67d1bcso73221485a.0
        for <linux-media@vger.kernel.org>; Wed, 06 May 2026 18:10:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778116253; x=1778721053; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JXzLPzKJmMMfBleWuh+IFIAqE4Ffe4ls9p1aUztqIUU=;
        b=XjR+smxFOxiEg0VM4Eeb8zzs7runA5oMdDrgSvstoH0T3ZT9DUAtkzQPEyr39oKslm
         q+PgHdQ64nhk02kwsLTaZFMe14/ukRclQACeaOQ1j0LT78fGLTQBhsRsQras+siJj9mU
         BEGJYbWJXDsIEyA51cmvHJqUQSB8AeqwwnXPxXiru4yLMQBZBN32ysHl7toZ3fQMRt+K
         PxBtyrZVrDMKJqugms16tGqkGYm/yClmcAe7tc2Rp3PdbjTT2iTsKshrxeE25KwAQSE9
         oN14pQPztzAzulAnyh4qiHRvrL3S1cBgDnJB9je//8ZgdOw2Pbd013aLpkqlkkGhxOZN
         211w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778116253; x=1778721053;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JXzLPzKJmMMfBleWuh+IFIAqE4Ffe4ls9p1aUztqIUU=;
        b=Dr0sVLxvp8Nn4uck7O0Cacbqui7mpVrZmnhWLbVD17bEOwdge3QfgTlChRD18Kqu5g
         KYNlaSYMSzxyuw8QAwrO4UBZJXqZHrPokiQMuwAdhkxMGmIY794H0aw7jwI37iyUDAU1
         eszR0V4L60sRy1uK1eLw6zqmBE3M2Husn+hKBrVapspA0EuW401O/Yy1aeQ0f1e4HeCB
         bkcw8/YDGwqIlZ+ZaroAc6FWMMF6jGj4IVrwmAczkEep6kV6++qtiqWcOleTpHVX7JAl
         UFBei6MtvBqdPLIINjWzeH2xWvr5w7Ee5z/XJoCkbEShOAe6+tzW6tNf/Giv4cRIsqby
         mezQ==
X-Forwarded-Encrypted: i=1; AFNElJ/fPm981IOt9abixITXuxT9Lhddcmmik9fRTG9CSwLxhEHVkRrU1ADM0Gm0cfK/SAn0hTZRzM3ZvcmVCQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxPNem282gdLyY/qUmnK13upVgQoccfP/u3nZH0IO6DSJpm0o+X
	oh7qW1mZRP+kOgt0Kta4H54fQIPzSDdw6K3YmZfQmd7/Ae8BuDfcD/7PxMVrRY7XrZmaspMW/cy
	VMi1XZpKjNhztPz53CqM4Z/gUTH0BmyRteCzdyTvipwhJh4+4mpmUIm0QtLmupkJ+cw==
X-Gm-Gg: AeBDiesMj4cQKbekMLb0g0xvzbfAiAafPbhcrohRwEpagZIev99ximyxAblUgk+O6+u
	XNGw7w2JslKIBWmj/dfGUiHLMPRQDm9mmPP0OKCkGt6TJ0cNWp2eBNqQX8eEZoWEe77wtvPc9pb
	l9EOL6E/4O7paqrVaPkOHzo+0zUZUkOoGqGQtrPXBHOb9cr8vO0yIzQYDOW0wrog66w/NbusWsw
	85vi8IEaE7OG1twPO1yoBgfBzi/ADJZBdsv0ntLYkKFi+VlxPISnk8ZnZwLlOxF9Xn1+U9S9kfu
	IUMIYnsfKYXVDAFg49YG6w4bHB5aEX89a2ulennAZoqcRlOzGVhuQkxnvu9zbwFJYw2yk0BwCoV
	flXAWjsUBzku2Do2jlgIyTmtb8p3xccOSCFV5aAoUlLw/giRCU6eP1bV0zo+FmTdR2/GOhiZ4Na
	zMrSCemDkJKrVn2vpU5SY9LS5OGiWWxfft/BUpj/jCVRjulQ==
X-Received: by 2002:a05:620a:4455:b0:8cd:c0b6:87f7 with SMTP id af79cd13be357-904d68db2bdmr902369085a.46.1778116253384;
        Wed, 06 May 2026 18:10:53 -0700 (PDT)
X-Received: by 2002:a05:620a:4455:b0:8cd:c0b6:87f7 with SMTP id af79cd13be357-904d68db2bdmr902362885a.46.1778116252824;
        Wed, 06 May 2026 18:10:52 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a85c230e00sm5221967e87.29.2026.05.06.18.10.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 18:10:51 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 07 May 2026 04:10:41 +0300
Subject: [PATCH v5 2/7] media: iris: don't specify min_acc_length in the
 source code
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260507-iris-ubwc-v5-2-e9a3aee53c49@oss.qualcomm.com>
References: <20260507-iris-ubwc-v5-0-e9a3aee53c49@oss.qualcomm.com>
In-Reply-To: <20260507-iris-ubwc-v5-0-e9a3aee53c49@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-media@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Wangao Wang <wangao.wang@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=3117;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=vCjp6Otef/xE5vbuvwNoduQVTq2eHsexFqb6kzgabfE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBp++aUwStBP0KISULKId+sYvvMoEbkTcp0zpSJy
 8v4NGsGDxCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCafvmlAAKCRCLPIo+Aiko
 1Z/dB/46Ju/VYuPxTbeC2ZusqZ6QR4CkkUQN6vmmN9PRqyP7wbEiYIg0LHqvd5X1nnnLioUcxFE
 VcdyLvSlozvh9PxrG2EcozCgAlQS/asjo7ICWmmhOuJn0lfuwCHMZZTHvkaEf0eSPchuQVvnpv3
 lubrzIMV9yLsXTM3TQ4HOCv2R327Yx4TdgRKQs3TS47s3krjFLIorw/VcLHN10qPW+kb8jLoEQd
 xFf6oPs+J40B/Lhsv13fwq0gTSOjh9KB4IztHJdIf0VGh0YIIdaPe3dmYlvq1IIniBKypwCX3Hl
 g+99CYfaA1EKr8fHJnPwoE3KdWJGnjW4TxK4Uu7+9Cb/Eq0f
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDAwOSBTYWx0ZWRfX/jPYGpDhpktA
 dtKB5YU360b70CHkz8CyhQAhXor6iI6Qxq90RxTFP/s2D1+0XjxGE51AarknTSt8J7sOdjOshlK
 U0eHxJOgP0E7WpNHbCBKD5n3R2JFVegYu7qP4agQLCVerqUHmU6FpiR8FPDadQ1FGOVKDwuUcQ0
 51VfbEi740vrAFlSAeCjpMn4uN5X0BM4PwMy6ouT8iQ52s0ViNKs9Kz0Z7LznIfk6KpwYDTCLBe
 S1V/Iv8j847v1y8NugvilBgpqXOuO213rsDuxrkDs0Jal1AfOphaSkOo8XRvYEjEvfPL8zf/jvI
 SvSOqZZdYCovcB+Iw0KsxNNlmI/tGWeuipeeI9RpyG9Stu2PZesR8SJuUyS0qPiNtCOEoHJlpL8
 EjR2AQjEgzNSRrKbanXbfFfqGGJOSlXTz50Ssy+i90wp36r6qhoSpuIZkMpZY+DKRRafGetFTHi
 okuqzhfccju6qyMIasw==
X-Proofpoint-ORIG-GUID: MYrgQTGcmwaVQ72-37f5uOJwBNthd_y4
X-Proofpoint-GUID: MYrgQTGcmwaVQ72-37f5uOJwBNthd_y4
X-Authority-Analysis: v=2.4 cv=EpHiaycA c=1 sm=1 tr=0 ts=69fbe69e cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=qS6nuPEoivtXufaKKhMA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070009
X-Rspamd-Queue-Id: 6A1B24E1DF5
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60694-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,oss.qualcomm.com,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

The min_acc length can be calculated from the platform UBWC
configuration. Use the freshly introduced helper and calculate min_acc
length based on the platform UBWC configuration instead of specifying it
directly in the source.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Tested-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c | 6 +++++-
 drivers/media/platform/qcom/iris/iris_platform_common.h | 1 -
 drivers/media/platform/qcom/iris/iris_platform_gen2.c   | 1 -
 3 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
index d77fa29f44fc..aa4520b27739 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
@@ -3,6 +3,9 @@
  * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
+#include <linux/printk.h>
+#include <linux/soc/qcom/ubwc.h>
+
 #include "iris_hfi_common.h"
 #include "iris_hfi_gen2.h"
 #include "iris_hfi_gen2_packet.h"
@@ -120,6 +123,7 @@ static void iris_hfi_gen2_create_packet(struct iris_hfi_header *hdr, u32 pkt_typ
 
 void iris_hfi_gen2_packet_sys_init(struct iris_core *core, struct iris_hfi_header *hdr)
 {
+	const struct qcom_ubwc_cfg_data *ubwc = core->ubwc_cfg;
 	u32 payload = 0;
 
 	iris_hfi_gen2_create_header(hdr, 0, core->header_id++);
@@ -146,7 +150,7 @@ void iris_hfi_gen2_packet_sys_init(struct iris_core *core, struct iris_hfi_heade
 				    &payload,
 				    sizeof(u32));
 
-	payload = core->iris_platform_data->ubwc_config->mal_length;
+	payload = qcom_ubwc_min_acc_length_64b(ubwc) ? 64 : 32;
 	iris_hfi_gen2_create_packet(hdr,
 				    HFI_PROP_UBWC_MAL_LENGTH,
 				    HFI_HOST_FLAGS_NONE,
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index 5a489917580e..08a9529e599b 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -77,7 +77,6 @@ struct tz_cp_config {
 
 struct ubwc_config_data {
 	u32	max_channels;
-	u32	mal_length;
 	u32	highest_bank_bit;
 	u32	bank_swzl_level;
 	u32	bank_swz2_level;
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
index 5da90d47f9c6..01c6ffa7e084 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
@@ -792,7 +792,6 @@ static const char * const sm8550_opp_clk_table[] = {
 
 static struct ubwc_config_data ubwc_config_sm8550 = {
 	.max_channels = 8,
-	.mal_length = 32,
 	.highest_bank_bit = 16,
 	.bank_swzl_level = 0,
 	.bank_swz2_level = 1,

-- 
2.47.3


