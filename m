Return-Path: <linux-media+bounces-57481-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6D0HGdB0yGkNmQUAu9opvQ
	(envelope-from <linux-media+bounces-57481-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 29 Mar 2026 01:39:44 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B2F173505BF
	for <lists+linux-media@lfdr.de>; Sun, 29 Mar 2026 01:39:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BE934302416B
	for <lists+linux-media@lfdr.de>; Sun, 29 Mar 2026 00:34:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A5951F91E3;
	Sun, 29 Mar 2026 00:33:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mn00lTsg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YsuNXXSa"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE5F1AD5A
	for <linux-media@vger.kernel.org>; Sun, 29 Mar 2026 00:33:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774744438; cv=none; b=RO/V4amxuIxsRzsHAa+sLNCt/V/KkYGdoY0iAekJhq0SwkR07pADdFmtR1hn05eG7tltuMqkg4rG5UIdgnPPfozsnuG7l9hJ8iWpU5J+18vwD3T5LSEeGE4ZPwwNAotigc7ks8WsuBrS4PoBPieTfrWtiDnuIPWTVZb9TsKZ3qE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774744438; c=relaxed/simple;
	bh=kcfLdyf/i3n/sbqGsrBheZhzMefHPbw3GIuF/eF39z8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hYyTJvo80QCnP8WOOeiBwdqXbLv238/OUfQNq9s39ppuAdNfJ11JXpKOXYuZv52sTMsOwqM/TghIWMzlN27IeJDCwAnB1nHknh1clOJ4Ve4TJeNwYsNop+/+UjuR3SdnKXRM+gNw1YL68q13ZmHNTPHFkJe2ztrdrFIQHlbm9+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mn00lTsg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YsuNXXSa; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62SNsVQS3765422
	for <linux-media@vger.kernel.org>; Sun, 29 Mar 2026 00:33:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SHGz70sVQAWjt0T4tpLvkWNhrXs1fZmLj6aUbGd/pwE=; b=mn00lTsgaKbvyYNz
	+XfaiHLlq2bE9AgX8aNYX/Ps7py8V9RBZbMrijAWrK0Z67mVyRMOUX+WUBjvDg22
	mVlgv/3PVpcU2qb3154E8+uEDxdK+LWMa3oH6/XXiHMtoo/RXnBtymHsJ0uVev4Y
	OkuTDIdxrZIAQE8M7HcHPNrhtQ76OeNBCDOkOz9sATYqHYUgBCNApqdEfq3NRdtv
	cBf8npRqWKvWY6V1xWdbyjLQprd3zVmDcZ8d4WKR5PItGS+pNcGf4E+3KOIfZo6b
	FpSfbRZ7t/dA2bsf38i7lpHiNiG8NweDjiESqs1/awFJPXcZIeSVJb8X3i5Nr2JE
	6UZP6w==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d685h9nub-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sun, 29 Mar 2026 00:33:56 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-89cc1d6dbe4so164141426d6.3
        for <linux-media@vger.kernel.org>; Sat, 28 Mar 2026 17:33:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774744435; x=1775349235; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SHGz70sVQAWjt0T4tpLvkWNhrXs1fZmLj6aUbGd/pwE=;
        b=YsuNXXSaxMq7BOKFJmX5hItpdRcqJ5ePc+YTfoI7TN5sW4RcvoiIzgoMTmam3TmsYa
         jMDvrigloUfkwJ8lvQV3A+UrUyxRN6a5tfXwNtuPWdXWnDUcBU95lmjoFqTA9yg6Kv7G
         ria9XHFRPljOKwCdsOtr0MqhL7RY8t7qZBEweeiv4XhKSnwgqzsAq15G0qgbYXN5d+7Q
         G1/2Ip3faibzyZyImDuYZP0bghrmTchpDiai7iNSh7NNbRPhtEItur9QRO4RP0eEOvlW
         Uv+VvQCpQ2Wb8QfxfXbVM1ynhsVMNRpOGEwK7xupm3I02xxcv2/UzNdCN6ua72Nj3M8g
         MCog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774744435; x=1775349235;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SHGz70sVQAWjt0T4tpLvkWNhrXs1fZmLj6aUbGd/pwE=;
        b=hPRqjusgQwi0AwOqvtY/80lueGETvNK+q5ZvRQ4kETBpgHbR90vgE8bh/pv7cGLhBr
         Zn3iDTPmXd9tCdbgi2Ij0PWwtsgyOYI++MNYb5xXtb0EJgeGXBDYUxaJ3buqxYSWYMvm
         rWaerOTxC9jKlxc5y7D8nBhZjDdxJJL9t8UcmYFPmALWPKY2xAbhyZ2vvx0XwkAtNeju
         7e1byDa04F8htHmWtQQixshSKb9GvRVlJflWrwmdEf4hiXUTJDPCsF1RDD0a0zxemF4X
         NdBWFuLi11nq5EYBosLFvhRa4C5yp/JAg2qddbGeCyTjvNmtlTxIGC95T+M3kGfGEQ2N
         jTHg==
X-Gm-Message-State: AOJu0Yx3iNwo8+zJyis5+J6Q9N9EymbIoNSAzP45c7Z9LbBdwdBZ2yJ1
	VZ4YGh0yPLP920E4R34eJUD/tNJeqaT5IL1TgiAIWL/mAKkCUrhUhTwiQuY7AgaV/3D5QQdYmCJ
	oWtGTGzM1QnmWidlDCfZ/R3Cplui+oRBOe97oOmbgMtTRn6fvcjcZbtDxWID3K/awMw==
X-Gm-Gg: ATEYQzxWQCVnfuctujWlFpZfsBphZFqQ6L6d+YioTVYgZPSKHrXdIQkzyzTz8bToAMO
	6j7n3FprEt9ozFV+56WkZ5BApn8r/ilNqQeD+bjGuRuEFDiHKwugv9SSoIuGcSazpsiGCV/Pqrn
	2J0luWzP0d4w9iP8PJoUvjiBIuY8YMf6XoXsho5AVvrUr6riNttHkeVI69tCe6RlH9ZDnPvcrkC
	Jcx3jTWJSuPQGVvzU5MzmRAududbm/vxdtncVH2D0EUA7Y95PmA74sr8bV5N+lDfVymYcO2vfsj
	wm96SRgStNXfBWqdxhqYggwTgMAaruk2tSSlYgnK5oMZd3KKfK++6McwXlZJtsV2fOV8eI+X4I9
	3XEVcEFFGhS+l9lpj1OivojJCrOSpkC4xbMEYL6KR88OeGBr9wRz7S0mPH0djI/anNN0fhxxfDm
	dSoROpL1lAz03Ri2xsWzReuHGXOoajUhXbr6U=
X-Received: by 2002:a05:6214:4b09:b0:89c:6b92:1c1a with SMTP id 6a1803df08f44-89ce8ea7176mr115676216d6.51.1774744434510;
        Sat, 28 Mar 2026 17:33:54 -0700 (PDT)
X-Received: by 2002:a05:6214:4b09:b0:89c:6b92:1c1a with SMTP id 6a1803df08f44-89ce8ea7176mr115676006d6.51.1774744433909;
        Sat, 28 Mar 2026 17:33:53 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38c83892035sm7024731fa.22.2026.03.28.17.33.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Mar 2026 17:33:51 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 29 Mar 2026 02:33:10 +0200
Subject: [PATCH v11 09/11] media: qcom: iris: split platform data from
 firmware data
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260329-iris-platform-data-v11-9-eea672b03a95@oss.qualcomm.com>
References: <20260329-iris-platform-data-v11-0-eea672b03a95@oss.qualcomm.com>
In-Reply-To: <20260329-iris-platform-data-v11-0-eea672b03a95@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=31819;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=kcfLdyf/i3n/sbqGsrBheZhzMefHPbw3GIuF/eF39z8=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpyHNJlqdoHXJNRo7btc41jhqNu/xM5sq7k2IMW
 o81arOHs8mJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCachzSQAKCRCLPIo+Aiko
 1chmB/469mXQ3HtFWLfQNLuu7xUInCD6/EpravwKLGXenSUJt4J6pFhE71VANoAqWJSMBo04ERc
 xhu4vLxh4OtT5brQINJVRZcG9jWomqIzOuWFvjAhlMQbOu5TsfJRxTvELwSaXJJYSFrjsduvrpS
 gg8WytqLWttOceiASCDrN7vb8YS9ybeVPqDoaFF6bdrLk2UzLEWmb9Z991TbZay4J2C2JXVn2aZ
 JW6ViRp9uSiBMaI5+lTC1zxBXctFICW0mkjUstu4iMxD6ZDqgzsRjknjpia6omqI91DqX6v/Gz8
 c4xyPzo4lr/Rn+rESgfV1UsIMGYFBj8RJym6rfmXHHLzG0Np
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=csKWUl4i c=1 sm=1 tr=0 ts=69c87374 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=UeMVAvltljHvvOQHH34A:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI5MDAwMiBTYWx0ZWRfX17dklkDgZ2Vz
 rXjYZQahs4XKdGQcy36PjxpywSmVPpsjZ8i81kGx0PJrw2wsRjzol7XIbYLx0KsMxx2yqJ3GStB
 ksmRoMti2ewDELgDGaSAz0XLKQumXzVbNwAedme8QdpFnpsZtw/EcG2RNX3Heg9xV+Hw6Fa7qOp
 sSwDMLVhGHsWMrV83MhKVnYEJ9S1TJ6O20idg7VGiwtJ8TSkX1eIwdq8i798D7WnU7GJdi+rLO6
 NhaFTCyXym7zEAhXHT44JJ58UZaePVhT1IYAV9tLI+s/XEhtqWhN0pv7B3AiF9q21pyzpHrezz3
 xFogkibI5jheHdO/51Iq58owbGLRqnxaIzVFJgQbjStT+smT01pHJHXarimJCTtOJdzMAw4urcU
 5xxOfzBY7Lb5L1ayAX2jsFCZfYq1ywWDatyukc+He5ckHgydvhoP8Oe0XLD74xMbbSmCP5Bi/XH
 XUQTAncg3+QwJGPYw1g==
X-Proofpoint-ORIG-GUID: 28pNQjxSWwSNqkfXDDB70XhbkO_xPPNm
X-Proofpoint-GUID: 28pNQjxSWwSNqkfXDDB70XhbkO_xPPNm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-28_03,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 clxscore=1015 adultscore=0 impostorscore=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603290002
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,60fps:email,qualcomm.com:dkim,qualcomm.com:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-57481-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B2F173505BF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Finalize the logical separation of the software and hardware interface
descriptions by moving hardware properties to the files specific to the
particular VPU version.

Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/Makefile          |   6 +-
 .../iris/{iris_platform_gen1.c => iris_hfi_gen1.c} | 134 -------------
 .../iris/{iris_platform_gen2.c => iris_hfi_gen2.c} | 214 ---------------------
 .../platform/qcom/iris/iris_platform_common.h      |   3 +
 .../platform/qcom/iris/iris_platform_sm8250.h      |  29 +++
 .../platform/qcom/iris/iris_platform_sm8550.h      |  31 +++
 .../media/platform/qcom/iris/iris_platform_vpu2.c  | 124 ++++++++++++
 .../media/platform/qcom/iris/iris_platform_vpu3x.c | 204 ++++++++++++++++++++
 8 files changed, 395 insertions(+), 350 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/Makefile b/drivers/media/platform/qcom/iris/Makefile
index 2fde45f81727..48e415cbc439 100644
--- a/drivers/media/platform/qcom/iris/Makefile
+++ b/drivers/media/platform/qcom/iris/Makefile
@@ -4,14 +4,16 @@ qcom-iris-objs += iris_buffer.o \
              iris_ctrls.o \
              iris_firmware.o \
              iris_hfi_common.o \
+             iris_hfi_gen1.o \
              iris_hfi_gen1_command.o \
              iris_hfi_gen1_response.o \
+             iris_hfi_gen2.o \
              iris_hfi_gen2_command.o \
              iris_hfi_gen2_packet.o \
              iris_hfi_gen2_response.o \
              iris_hfi_queue.o \
-             iris_platform_gen1.o \
-             iris_platform_gen2.o \
+             iris_platform_vpu2.o \
+             iris_platform_vpu3x.o \
              iris_power.o \
              iris_probe.o \
              iris_resources.o \
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen1.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1.c
similarity index 67%
rename from drivers/media/platform/qcom/iris/iris_platform_gen1.c
rename to drivers/media/platform/qcom/iris/iris_hfi_gen1.c
index 8875f90d487e..60f51a1ba941 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen1.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1.c
@@ -3,38 +3,16 @@
  * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
-#include "iris_core.h"
 #include "iris_ctrls.h"
 #include "iris_platform_common.h"
-#include "iris_resources.h"
 #include "iris_hfi_gen1.h"
 #include "iris_hfi_gen1_defines.h"
 #include "iris_vpu_buffer.h"
-#include "iris_vpu_common.h"
-#include "iris_instance.h"
-
-#include "iris_platform_sc7280.h"
 
 #define BITRATE_MIN		32000
 #define BITRATE_MAX		160000000
-#define BITRATE_PEAK_DEFAULT	(BITRATE_DEFAULT * 2)
 #define BITRATE_STEP		100
 
-static struct iris_fmt platform_fmts_sm8250_dec[] = {
-	[IRIS_FMT_H264] = {
-		.pixfmt = V4L2_PIX_FMT_H264,
-		.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
-	},
-	[IRIS_FMT_HEVC] = {
-		.pixfmt = V4L2_PIX_FMT_HEVC,
-		.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
-	},
-	[IRIS_FMT_VP9] = {
-		.pixfmt = V4L2_PIX_FMT_VP9,
-		.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
-	},
-};
-
 static struct platform_inst_fw_cap inst_fw_cap_sm8250_dec[] = {
 	{
 		.cap_id = PIPE,
@@ -248,56 +226,6 @@ static const struct platform_inst_fw_cap inst_fw_cap_sm8250_enc[] = {
 	},
 };
 
-static struct platform_inst_caps platform_inst_cap_sm8250 = {
-	.min_frame_width = 128,
-	.max_frame_width = 8192,
-	.min_frame_height = 128,
-	.max_frame_height = 8192,
-	.max_mbpf = 138240,
-	.mb_cycles_vsp = 25,
-	.mb_cycles_vpp = 200,
-	.max_frame_rate = MAXIMUM_FPS,
-	.max_operating_rate = MAXIMUM_FPS,
-};
-
-static const struct icc_info sm8250_icc_table[] = {
-	{ "cpu-cfg",    1000, 1000     },
-	{ "video-mem",  1000, 15000000 },
-};
-
-static const char * const sm8250_clk_reset_table[] = { "bus", "core" };
-
-static const struct bw_info sm8250_bw_table_dec[] = {
-	{ ((4096 * 2160) / 256) * 60, 2403000 },
-	{ ((4096 * 2160) / 256) * 30, 1224000 },
-	{ ((1920 * 1080) / 256) * 60,  812000 },
-	{ ((1920 * 1080) / 256) * 30,  416000 },
-};
-
-static const char * const sm8250_pmdomain_table[] = { "venus", "vcodec0" };
-
-static const char * const sm8250_opp_pd_table[] = { "mx", "mmcx" };
-
-static const struct platform_clk_data sm8250_clk_table[] = {
-	{IRIS_AXI_CLK,  "iface"        },
-	{IRIS_CTRL_CLK, "core"         },
-	{IRIS_HW_CLK,   "vcodec0_core" },
-};
-
-static const char * const sm8250_opp_clk_table[] = {
-	"vcodec0_core",
-	NULL,
-};
-
-static const struct tz_cp_config tz_cp_config_sm8250[] = {
-	{
-		.cp_start = 0,
-		.cp_size = 0x25800000,
-		.cp_nonpixel_start = 0x01000000,
-		.cp_nonpixel_size = 0x24800000,
-	},
-};
-
 static const u32 sm8250_vdec_input_config_param_default[] = {
 	HFI_PROPERTY_CONFIG_VIDEOCORES_USAGE,
 	HFI_PROPERTY_PARAM_UNCOMPRESSED_FORMAT_SELECT,
@@ -356,65 +284,3 @@ const struct iris_firmware_data iris_hfi_gen1_data = {
 	.enc_ip_int_buf_tbl = sm8250_enc_ip_int_buf_tbl,
 	.enc_ip_int_buf_tbl_size = ARRAY_SIZE(sm8250_enc_ip_int_buf_tbl),
 };
-
-const struct iris_platform_data sm8250_data = {
-	.firmware_data = &iris_hfi_gen1_data,
-	.get_vpu_buffer_size = iris_vpu_buf_size,
-	.vpu_ops = &iris_vpu2_ops,
-	.icc_tbl = sm8250_icc_table,
-	.icc_tbl_size = ARRAY_SIZE(sm8250_icc_table),
-	.clk_rst_tbl = sm8250_clk_reset_table,
-	.clk_rst_tbl_size = ARRAY_SIZE(sm8250_clk_reset_table),
-	.bw_tbl_dec = sm8250_bw_table_dec,
-	.bw_tbl_dec_size = ARRAY_SIZE(sm8250_bw_table_dec),
-	.pmdomain_tbl = sm8250_pmdomain_table,
-	.pmdomain_tbl_size = ARRAY_SIZE(sm8250_pmdomain_table),
-	.opp_pd_tbl = sm8250_opp_pd_table,
-	.opp_pd_tbl_size = ARRAY_SIZE(sm8250_opp_pd_table),
-	.clk_tbl = sm8250_clk_table,
-	.clk_tbl_size = ARRAY_SIZE(sm8250_clk_table),
-	.opp_clk_tbl = sm8250_opp_clk_table,
-	/* Upper bound of DMA address range */
-	.dma_mask = 0xe0000000 - 1,
-	.fwname = "qcom/vpu-1.0/venus.mbn",
-	.inst_iris_fmts = platform_fmts_sm8250_dec,
-	.inst_iris_fmts_size = ARRAY_SIZE(platform_fmts_sm8250_dec),
-	.inst_caps = &platform_inst_cap_sm8250,
-	.tz_cp_config_data = tz_cp_config_sm8250,
-	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_sm8250),
-	.num_vpp_pipe = 4,
-	.max_session_count = 16,
-	.max_core_mbpf = NUM_MBS_8K,
-	.max_core_mbps = ((7680 * 4320) / 256) * 60,
-};
-
-const struct iris_platform_data sc7280_data = {
-	.firmware_data = &iris_hfi_gen1_data,
-	.get_vpu_buffer_size = iris_vpu_buf_size,
-	.vpu_ops = &iris_vpu2_ops,
-	.icc_tbl = sm8250_icc_table,
-	.icc_tbl_size = ARRAY_SIZE(sm8250_icc_table),
-	.bw_tbl_dec = sc7280_bw_table_dec,
-	.bw_tbl_dec_size = ARRAY_SIZE(sc7280_bw_table_dec),
-	.pmdomain_tbl = sm8250_pmdomain_table,
-	.pmdomain_tbl_size = ARRAY_SIZE(sm8250_pmdomain_table),
-	.opp_pd_tbl = sc7280_opp_pd_table,
-	.opp_pd_tbl_size = ARRAY_SIZE(sc7280_opp_pd_table),
-	.clk_tbl = sc7280_clk_table,
-	.clk_tbl_size = ARRAY_SIZE(sc7280_clk_table),
-	.opp_clk_tbl = sc7280_opp_clk_table,
-	/* Upper bound of DMA address range */
-	.dma_mask = 0xe0000000 - 1,
-	.fwname = "qcom/vpu/vpu20_p1.mbn",
-	.inst_iris_fmts = platform_fmts_sm8250_dec,
-	.inst_iris_fmts_size = ARRAY_SIZE(platform_fmts_sm8250_dec),
-	.inst_caps = &platform_inst_cap_sm8250,
-	.tz_cp_config_data = tz_cp_config_sm8250,
-	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_sm8250),
-	.num_vpp_pipe = 1,
-	.no_aon = true,
-	.max_session_count = 16,
-	.max_core_mbpf = 4096 * 2176 / 256 * 2 + 1920 * 1088 / 256,
-	/* max spec for SC7280 is 4096x2176@60fps */
-	.max_core_mbps = 4096 * 2176 / 256 * 60,
-};
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
similarity index 77%
rename from drivers/media/platform/qcom/iris/iris_platform_gen2.c
rename to drivers/media/platform/qcom/iris/iris_hfi_gen2.c
index 05fbab276100..ce8490d64854 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
@@ -4,40 +4,15 @@
  * Copyright (c) 2025 Linaro Ltd
  */
 
-#include "iris_core.h"
 #include "iris_ctrls.h"
 #include "iris_hfi_gen2.h"
 #include "iris_hfi_gen2_defines.h"
 #include "iris_platform_common.h"
 #include "iris_vpu_buffer.h"
-#include "iris_vpu_common.h"
-
-#include "iris_platform_qcs8300.h"
-#include "iris_platform_sm8650.h"
-#include "iris_platform_sm8750.h"
 
 #define VIDEO_ARCH_LX 1
 #define BITRATE_MAX				245000000
 
-static struct iris_fmt platform_fmts_sm8550_dec[] = {
-	[IRIS_FMT_H264] = {
-		.pixfmt = V4L2_PIX_FMT_H264,
-		.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
-	},
-	[IRIS_FMT_HEVC] = {
-		.pixfmt = V4L2_PIX_FMT_HEVC,
-		.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
-	},
-	[IRIS_FMT_VP9] = {
-		.pixfmt = V4L2_PIX_FMT_VP9,
-		.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
-	},
-	[IRIS_FMT_AV1] = {
-		.pixfmt = V4L2_PIX_FMT_AV1,
-		.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
-	},
-};
-
 static const struct platform_inst_fw_cap inst_fw_cap_sm8550_dec[] = {
 	{
 		.cap_id = PROFILE_H264,
@@ -742,58 +717,6 @@ static const struct platform_inst_fw_cap inst_fw_cap_sm8550_enc[] = {
 	},
 };
 
-static struct platform_inst_caps platform_inst_cap_sm8550 = {
-	.min_frame_width = 96,
-	.max_frame_width = 8192,
-	.min_frame_height = 96,
-	.max_frame_height = 8192,
-	.max_mbpf = (8192 * 4352) / 256,
-	.mb_cycles_vpp = 200,
-	.mb_cycles_fw = 489583,
-	.mb_cycles_fw_vpp = 66234,
-	.num_comv = 0,
-	.max_frame_rate = MAXIMUM_FPS,
-	.max_operating_rate = MAXIMUM_FPS,
-};
-
-static const struct icc_info sm8550_icc_table[] = {
-	{ "cpu-cfg",    1000, 1000     },
-	{ "video-mem",  1000, 15000000 },
-};
-
-static const char * const sm8550_clk_reset_table[] = { "bus" };
-
-static const struct bw_info sm8550_bw_table_dec[] = {
-	{ ((4096 * 2160) / 256) * 60, 1608000 },
-	{ ((4096 * 2160) / 256) * 30,  826000 },
-	{ ((1920 * 1080) / 256) * 60,  567000 },
-	{ ((1920 * 1080) / 256) * 30,  294000 },
-};
-
-static const char * const sm8550_pmdomain_table[] = { "venus", "vcodec0" };
-
-static const char * const sm8550_opp_pd_table[] = { "mxc", "mmcx" };
-
-static const struct platform_clk_data sm8550_clk_table[] = {
-	{IRIS_AXI_CLK,  "iface"        },
-	{IRIS_CTRL_CLK, "core"         },
-	{IRIS_HW_CLK,   "vcodec0_core" },
-};
-
-static const char * const sm8550_opp_clk_table[] = {
-	"vcodec0_core",
-	NULL,
-};
-
-static const struct tz_cp_config tz_cp_config_sm8550[] = {
-	{
-		.cp_start = 0,
-		.cp_size = 0x25800000,
-		.cp_nonpixel_start = 0x01000000,
-		.cp_nonpixel_size = 0x24800000,
-	},
-};
-
 static const u32 sm8550_vdec_input_config_params_default[] = {
 	HFI_PROP_BITSTREAM_RESOLUTION,
 	HFI_PROP_CROP_OFFSETS,
@@ -971,140 +894,3 @@ const struct iris_firmware_data iris_hfi_gen2_data = {
 	.enc_op_int_buf_tbl = sm8550_enc_op_int_buf_tbl,
 	.enc_op_int_buf_tbl_size = ARRAY_SIZE(sm8550_enc_op_int_buf_tbl),
 };
-
-const struct iris_platform_data sm8550_data = {
-	.firmware_data = &iris_hfi_gen2_data,
-	.get_vpu_buffer_size = iris_vpu_buf_size,
-	.vpu_ops = &iris_vpu3_ops,
-	.icc_tbl = sm8550_icc_table,
-	.icc_tbl_size = ARRAY_SIZE(sm8550_icc_table),
-	.clk_rst_tbl = sm8550_clk_reset_table,
-	.clk_rst_tbl_size = ARRAY_SIZE(sm8550_clk_reset_table),
-	.bw_tbl_dec = sm8550_bw_table_dec,
-	.bw_tbl_dec_size = ARRAY_SIZE(sm8550_bw_table_dec),
-	.pmdomain_tbl = sm8550_pmdomain_table,
-	.pmdomain_tbl_size = ARRAY_SIZE(sm8550_pmdomain_table),
-	.opp_pd_tbl = sm8550_opp_pd_table,
-	.opp_pd_tbl_size = ARRAY_SIZE(sm8550_opp_pd_table),
-	.clk_tbl = sm8550_clk_table,
-	.clk_tbl_size = ARRAY_SIZE(sm8550_clk_table),
-	.opp_clk_tbl = sm8550_opp_clk_table,
-	/* Upper bound of DMA address range */
-	.dma_mask = 0xe0000000 - 1,
-	.fwname = "qcom/vpu/vpu30_p4.mbn",
-	.inst_iris_fmts = platform_fmts_sm8550_dec,
-	.inst_iris_fmts_size = ARRAY_SIZE(platform_fmts_sm8550_dec),
-	.inst_caps = &platform_inst_cap_sm8550,
-	.tz_cp_config_data = tz_cp_config_sm8550,
-	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_sm8550),
-	.num_vpp_pipe = 4,
-	.max_session_count = 16,
-	.max_core_mbpf = NUM_MBS_8K * 2,
-	.max_core_mbps = ((7680 * 4320) / 256) * 60,
-};
-
-/*
- * Shares most of SM8550 data except:
- * - vpu_ops to iris_vpu33_ops
- * - clk_rst_tbl to sm8650_clk_reset_table
- * - controller_rst_tbl to sm8650_controller_reset_table
- * - fwname to "qcom/vpu/vpu33_p4.mbn"
- */
-const struct iris_platform_data sm8650_data = {
-	.firmware_data = &iris_hfi_gen2_data,
-	.get_vpu_buffer_size = iris_vpu33_buf_size,
-	.vpu_ops = &iris_vpu33_ops,
-	.icc_tbl = sm8550_icc_table,
-	.icc_tbl_size = ARRAY_SIZE(sm8550_icc_table),
-	.clk_rst_tbl = sm8650_clk_reset_table,
-	.clk_rst_tbl_size = ARRAY_SIZE(sm8650_clk_reset_table),
-	.controller_rst_tbl = sm8650_controller_reset_table,
-	.controller_rst_tbl_size = ARRAY_SIZE(sm8650_controller_reset_table),
-	.bw_tbl_dec = sm8550_bw_table_dec,
-	.bw_tbl_dec_size = ARRAY_SIZE(sm8550_bw_table_dec),
-	.pmdomain_tbl = sm8550_pmdomain_table,
-	.pmdomain_tbl_size = ARRAY_SIZE(sm8550_pmdomain_table),
-	.opp_pd_tbl = sm8550_opp_pd_table,
-	.opp_pd_tbl_size = ARRAY_SIZE(sm8550_opp_pd_table),
-	.clk_tbl = sm8550_clk_table,
-	.clk_tbl_size = ARRAY_SIZE(sm8550_clk_table),
-	.opp_clk_tbl = sm8550_opp_clk_table,
-	/* Upper bound of DMA address range */
-	.dma_mask = 0xe0000000 - 1,
-	.fwname = "qcom/vpu/vpu33_p4.mbn",
-	.inst_iris_fmts = platform_fmts_sm8550_dec,
-	.inst_iris_fmts_size = ARRAY_SIZE(platform_fmts_sm8550_dec),
-	.inst_caps = &platform_inst_cap_sm8550,
-	.tz_cp_config_data = tz_cp_config_sm8550,
-	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_sm8550),
-	.num_vpp_pipe = 4,
-	.max_session_count = 16,
-	.max_core_mbpf = NUM_MBS_8K * 2,
-	.max_core_mbps = ((7680 * 4320) / 256) * 60,
-};
-
-const struct iris_platform_data sm8750_data = {
-	.firmware_data = &iris_hfi_gen2_data,
-	.get_vpu_buffer_size = iris_vpu33_buf_size,
-	.vpu_ops = &iris_vpu35_ops,
-	.icc_tbl = sm8550_icc_table,
-	.icc_tbl_size = ARRAY_SIZE(sm8550_icc_table),
-	.clk_rst_tbl = sm8750_clk_reset_table,
-	.clk_rst_tbl_size = ARRAY_SIZE(sm8750_clk_reset_table),
-	.bw_tbl_dec = sm8550_bw_table_dec,
-	.bw_tbl_dec_size = ARRAY_SIZE(sm8550_bw_table_dec),
-	.pmdomain_tbl = sm8550_pmdomain_table,
-	.pmdomain_tbl_size = ARRAY_SIZE(sm8550_pmdomain_table),
-	.opp_pd_tbl = sm8550_opp_pd_table,
-	.opp_pd_tbl_size = ARRAY_SIZE(sm8550_opp_pd_table),
-	.clk_tbl = sm8750_clk_table,
-	.clk_tbl_size = ARRAY_SIZE(sm8750_clk_table),
-	.opp_clk_tbl = sm8550_opp_clk_table,
-	/* Upper bound of DMA address range */
-	.dma_mask = 0xe0000000 - 1,
-	.fwname = "qcom/vpu/vpu35_p4.mbn",
-	.inst_iris_fmts = platform_fmts_sm8550_dec,
-	.inst_iris_fmts_size = ARRAY_SIZE(platform_fmts_sm8550_dec),
-	.inst_caps = &platform_inst_cap_sm8550,
-	.tz_cp_config_data = tz_cp_config_sm8550,
-	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_sm8550),
-	.num_vpp_pipe = 4,
-	.max_session_count = 16,
-	.max_core_mbpf = NUM_MBS_8K * 2,
-	.max_core_mbps = ((7680 * 4320) / 256) * 60,
-};
-
-/*
- * Shares most of SM8550 data except:
- * - inst_caps to platform_inst_cap_qcs8300
- */
-const struct iris_platform_data qcs8300_data = {
-	.firmware_data = &iris_hfi_gen2_data,
-	.get_vpu_buffer_size = iris_vpu_buf_size,
-	.vpu_ops = &iris_vpu3_ops,
-	.icc_tbl = sm8550_icc_table,
-	.icc_tbl_size = ARRAY_SIZE(sm8550_icc_table),
-	.clk_rst_tbl = sm8550_clk_reset_table,
-	.clk_rst_tbl_size = ARRAY_SIZE(sm8550_clk_reset_table),
-	.bw_tbl_dec = sm8550_bw_table_dec,
-	.bw_tbl_dec_size = ARRAY_SIZE(sm8550_bw_table_dec),
-	.pmdomain_tbl = sm8550_pmdomain_table,
-	.pmdomain_tbl_size = ARRAY_SIZE(sm8550_pmdomain_table),
-	.opp_pd_tbl = sm8550_opp_pd_table,
-	.opp_pd_tbl_size = ARRAY_SIZE(sm8550_opp_pd_table),
-	.clk_tbl = sm8550_clk_table,
-	.clk_tbl_size = ARRAY_SIZE(sm8550_clk_table),
-	.opp_clk_tbl = sm8550_opp_clk_table,
-	/* Upper bound of DMA address range */
-	.dma_mask = 0xe0000000 - 1,
-	.fwname = "qcom/vpu/vpu30_p4_s6.mbn",
-	.inst_iris_fmts = platform_fmts_sm8550_dec,
-	.inst_iris_fmts_size = ARRAY_SIZE(platform_fmts_sm8550_dec),
-	.inst_caps = &platform_inst_cap_qcs8300,
-	.tz_cp_config_data = tz_cp_config_sm8550,
-	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_sm8550),
-	.num_vpp_pipe = 2,
-	.max_session_count = 16,
-	.max_core_mbpf = ((4096 * 2176) / 256) * 4,
-	.max_core_mbps = (((3840 * 2176) / 256) * 120),
-};
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index 5af6d9f49f01..6dfead673393 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -40,6 +40,9 @@ enum pipe_type {
 	PIPE_4 = 4,
 };
 
+extern const struct iris_firmware_data iris_hfi_gen1_data;
+extern const struct iris_firmware_data iris_hfi_gen2_data;
+
 extern const struct iris_platform_data qcs8300_data;
 extern const struct iris_platform_data sc7280_data;
 extern const struct iris_platform_data sm8250_data;
diff --git a/drivers/media/platform/qcom/iris/iris_platform_sm8250.h b/drivers/media/platform/qcom/iris/iris_platform_sm8250.h
new file mode 100644
index 000000000000..50306043eb8e
--- /dev/null
+++ b/drivers/media/platform/qcom/iris/iris_platform_sm8250.h
@@ -0,0 +1,29 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef __IRIS_PLATFORM_SM8250_H__
+#define __IRIS_PLATFORM_SM8250_H__
+
+static const struct bw_info sm8250_bw_table_dec[] = {
+	{ ((4096 * 2160) / 256) * 60, 2403000 },
+	{ ((4096 * 2160) / 256) * 30, 1224000 },
+	{ ((1920 * 1080) / 256) * 60,  812000 },
+	{ ((1920 * 1080) / 256) * 30,  416000 },
+};
+
+static const char * const sm8250_opp_pd_table[] = { "mx", "mmcx" };
+
+static const struct platform_clk_data sm8250_clk_table[] = {
+	{IRIS_AXI_CLK,  "iface"        },
+	{IRIS_CTRL_CLK, "core"         },
+	{IRIS_HW_CLK,   "vcodec0_core" },
+};
+
+static const char * const sm8250_opp_clk_table[] = {
+	"vcodec0_core",
+	NULL,
+};
+
+#endif
diff --git a/drivers/media/platform/qcom/iris/iris_platform_sm8550.h b/drivers/media/platform/qcom/iris/iris_platform_sm8550.h
new file mode 100644
index 000000000000..a9d9709c2e35
--- /dev/null
+++ b/drivers/media/platform/qcom/iris/iris_platform_sm8550.h
@@ -0,0 +1,31 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#ifndef __IRIS_PLATFORM_SM8550_H__
+#define __IRIS_PLATFORM_SM8550_H__
+
+static const char * const sm8550_clk_reset_table[] = { "bus" };
+
+static const struct platform_clk_data sm8550_clk_table[] = {
+	{IRIS_AXI_CLK,  "iface"        },
+	{IRIS_CTRL_CLK, "core"         },
+	{IRIS_HW_CLK,   "vcodec0_core" },
+};
+
+static struct platform_inst_caps platform_inst_cap_sm8550 = {
+	.min_frame_width = 96,
+	.max_frame_width = 8192,
+	.min_frame_height = 96,
+	.max_frame_height = 8192,
+	.max_mbpf = (8192 * 4352) / 256,
+	.mb_cycles_vpp = 200,
+	.mb_cycles_fw = 489583,
+	.mb_cycles_fw_vpp = 66234,
+	.num_comv = 0,
+	.max_frame_rate = MAXIMUM_FPS,
+	.max_operating_rate = MAXIMUM_FPS,
+};
+
+#endif
diff --git a/drivers/media/platform/qcom/iris/iris_platform_vpu2.c b/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
new file mode 100644
index 000000000000..ab2a19aa9c36
--- /dev/null
+++ b/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
@@ -0,0 +1,124 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#include "iris_core.h"
+#include "iris_ctrls.h"
+#include "iris_platform_common.h"
+#include "iris_resources.h"
+#include "iris_hfi_gen1.h"
+#include "iris_hfi_gen1_defines.h"
+#include "iris_vpu_buffer.h"
+#include "iris_vpu_common.h"
+#include "iris_instance.h"
+
+#include "iris_platform_sc7280.h"
+#include "iris_platform_sm8250.h"
+
+static struct iris_fmt iris_fmts_vpu2_dec[] = {
+	[IRIS_FMT_H264] = {
+		.pixfmt = V4L2_PIX_FMT_H264,
+		.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
+	},
+	[IRIS_FMT_HEVC] = {
+		.pixfmt = V4L2_PIX_FMT_HEVC,
+		.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
+	},
+	[IRIS_FMT_VP9] = {
+		.pixfmt = V4L2_PIX_FMT_VP9,
+		.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
+	},
+};
+
+static struct platform_inst_caps platform_inst_cap_vpu2 = {
+	.min_frame_width = 128,
+	.max_frame_width = 8192,
+	.min_frame_height = 128,
+	.max_frame_height = 8192,
+	.max_mbpf = 138240,
+	.mb_cycles_vsp = 25,
+	.mb_cycles_vpp = 200,
+	.max_frame_rate = MAXIMUM_FPS,
+	.max_operating_rate = MAXIMUM_FPS,
+};
+
+static const struct icc_info iris_icc_info_vpu2[] = {
+	{ "cpu-cfg",    1000, 1000     },
+	{ "video-mem",  1000, 15000000 },
+};
+
+static const char * const iris_clk_reset_table_vpu2[] = { "bus", "core" };
+
+static const char * const iris_pmdomain_table_vpu2[] = { "venus", "vcodec0" };
+
+static const struct tz_cp_config tz_cp_config_vpu2[] = {
+	{
+		.cp_start = 0,
+		.cp_size = 0x25800000,
+		.cp_nonpixel_start = 0x01000000,
+		.cp_nonpixel_size = 0x24800000,
+	},
+};
+
+const struct iris_platform_data sc7280_data = {
+	.firmware_data = &iris_hfi_gen1_data,
+	.get_vpu_buffer_size = iris_vpu_buf_size,
+	.vpu_ops = &iris_vpu2_ops,
+	.icc_tbl = iris_icc_info_vpu2,
+	.icc_tbl_size = ARRAY_SIZE(iris_icc_info_vpu2),
+	.bw_tbl_dec = sc7280_bw_table_dec,
+	.bw_tbl_dec_size = ARRAY_SIZE(sc7280_bw_table_dec),
+	.pmdomain_tbl = iris_pmdomain_table_vpu2,
+	.pmdomain_tbl_size = ARRAY_SIZE(iris_pmdomain_table_vpu2),
+	.opp_pd_tbl = sc7280_opp_pd_table,
+	.opp_pd_tbl_size = ARRAY_SIZE(sc7280_opp_pd_table),
+	.clk_tbl = sc7280_clk_table,
+	.clk_tbl_size = ARRAY_SIZE(sc7280_clk_table),
+	.opp_clk_tbl = sc7280_opp_clk_table,
+	/* Upper bound of DMA address range */
+	.dma_mask = 0xe0000000 - 1,
+	.fwname = "qcom/vpu/vpu20_p1.mbn",
+	.inst_iris_fmts = iris_fmts_vpu2_dec,
+	.inst_iris_fmts_size = ARRAY_SIZE(iris_fmts_vpu2_dec),
+	.inst_caps = &platform_inst_cap_vpu2,
+	.tz_cp_config_data = tz_cp_config_vpu2,
+	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu2),
+	.num_vpp_pipe = 1,
+	.no_aon = true,
+	.max_session_count = 16,
+	.max_core_mbpf = 4096 * 2176 / 256 * 2 + 1920 * 1088 / 256,
+	/* max spec for SC7280 is 4096x2176@60fps */
+	.max_core_mbps = 4096 * 2176 / 256 * 60,
+};
+
+const struct iris_platform_data sm8250_data = {
+	.firmware_data = &iris_hfi_gen1_data,
+	.get_vpu_buffer_size = iris_vpu_buf_size,
+	.vpu_ops = &iris_vpu2_ops,
+	.icc_tbl = iris_icc_info_vpu2,
+	.icc_tbl_size = ARRAY_SIZE(iris_icc_info_vpu2),
+	.clk_rst_tbl = iris_clk_reset_table_vpu2,
+	.clk_rst_tbl_size = ARRAY_SIZE(iris_clk_reset_table_vpu2),
+	.bw_tbl_dec = sm8250_bw_table_dec,
+	.bw_tbl_dec_size = ARRAY_SIZE(sm8250_bw_table_dec),
+	.pmdomain_tbl = iris_pmdomain_table_vpu2,
+	.pmdomain_tbl_size = ARRAY_SIZE(iris_pmdomain_table_vpu2),
+	.opp_pd_tbl = sm8250_opp_pd_table,
+	.opp_pd_tbl_size = ARRAY_SIZE(sm8250_opp_pd_table),
+	.clk_tbl = sm8250_clk_table,
+	.clk_tbl_size = ARRAY_SIZE(sm8250_clk_table),
+	.opp_clk_tbl = sm8250_opp_clk_table,
+	/* Upper bound of DMA address range */
+	.dma_mask = 0xe0000000 - 1,
+	.fwname = "qcom/vpu-1.0/venus.mbn",
+	.inst_iris_fmts = iris_fmts_vpu2_dec,
+	.inst_iris_fmts_size = ARRAY_SIZE(iris_fmts_vpu2_dec),
+	.inst_caps = &platform_inst_cap_vpu2,
+	.tz_cp_config_data = tz_cp_config_vpu2,
+	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu2),
+	.num_vpp_pipe = 4,
+	.max_session_count = 16,
+	.max_core_mbpf = NUM_MBS_8K,
+	.max_core_mbps = ((7680 * 4320) / 256) * 60,
+};
diff --git a/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c b/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
new file mode 100644
index 000000000000..c2496aa0f851
--- /dev/null
+++ b/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
@@ -0,0 +1,204 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2025 Linaro Ltd
+ */
+
+#include "iris_core.h"
+#include "iris_ctrls.h"
+#include "iris_hfi_gen2.h"
+#include "iris_hfi_gen2_defines.h"
+#include "iris_platform_common.h"
+#include "iris_vpu_buffer.h"
+#include "iris_vpu_common.h"
+
+#include "iris_platform_qcs8300.h"
+#include "iris_platform_sm8550.h"
+#include "iris_platform_sm8650.h"
+#include "iris_platform_sm8750.h"
+
+static struct iris_fmt iris_fmts_vpu3x_dec[] = {
+	[IRIS_FMT_H264] = {
+		.pixfmt = V4L2_PIX_FMT_H264,
+		.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
+	},
+	[IRIS_FMT_HEVC] = {
+		.pixfmt = V4L2_PIX_FMT_HEVC,
+		.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
+	},
+	[IRIS_FMT_VP9] = {
+		.pixfmt = V4L2_PIX_FMT_VP9,
+		.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
+	},
+	[IRIS_FMT_AV1] = {
+		.pixfmt = V4L2_PIX_FMT_AV1,
+		.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
+	},
+};
+
+static const struct icc_info iris_icc_info_vpu3x[] = {
+	{ "cpu-cfg",    1000, 1000     },
+	{ "video-mem",  1000, 15000000 },
+};
+
+static const struct bw_info iris_bw_table_dec_vpu3x[] = {
+	{ ((4096 * 2160) / 256) * 60, 1608000 },
+	{ ((4096 * 2160) / 256) * 30,  826000 },
+	{ ((1920 * 1080) / 256) * 60,  567000 },
+	{ ((1920 * 1080) / 256) * 30,  294000 },
+};
+
+static const char * const iris_pmdomain_table_vpu3x[] = { "venus", "vcodec0" };
+
+static const char * const iris_opp_pd_table_vpu3x[] = { "mxc", "mmcx" };
+
+static const char * const iris_opp_clk_table_vpu3x[] = {
+	"vcodec0_core",
+	NULL,
+};
+
+static const struct tz_cp_config tz_cp_config_vpu3[] = {
+	{
+		.cp_start = 0,
+		.cp_size = 0x25800000,
+		.cp_nonpixel_start = 0x01000000,
+		.cp_nonpixel_size = 0x24800000,
+	},
+};
+
+/*
+ * Shares most of SM8550 data except:
+ * - inst_caps to platform_inst_cap_qcs8300
+ */
+const struct iris_platform_data qcs8300_data = {
+	.firmware_data = &iris_hfi_gen2_data,
+	.get_vpu_buffer_size = iris_vpu_buf_size,
+	.vpu_ops = &iris_vpu3_ops,
+	.icc_tbl = iris_icc_info_vpu3x,
+	.icc_tbl_size = ARRAY_SIZE(iris_icc_info_vpu3x),
+	.clk_rst_tbl = sm8550_clk_reset_table,
+	.clk_rst_tbl_size = ARRAY_SIZE(sm8550_clk_reset_table),
+	.bw_tbl_dec = iris_bw_table_dec_vpu3x,
+	.bw_tbl_dec_size = ARRAY_SIZE(iris_bw_table_dec_vpu3x),
+	.pmdomain_tbl = iris_pmdomain_table_vpu3x,
+	.pmdomain_tbl_size = ARRAY_SIZE(iris_pmdomain_table_vpu3x),
+	.opp_pd_tbl = iris_opp_pd_table_vpu3x,
+	.opp_pd_tbl_size = ARRAY_SIZE(iris_opp_pd_table_vpu3x),
+	.clk_tbl = sm8550_clk_table,
+	.clk_tbl_size = ARRAY_SIZE(sm8550_clk_table),
+	.opp_clk_tbl = iris_opp_clk_table_vpu3x,
+	/* Upper bound of DMA address range */
+	.dma_mask = 0xe0000000 - 1,
+	.fwname = "qcom/vpu/vpu30_p4_s6.mbn",
+	.inst_iris_fmts = iris_fmts_vpu3x_dec,
+	.inst_iris_fmts_size = ARRAY_SIZE(iris_fmts_vpu3x_dec),
+	.inst_caps = &platform_inst_cap_qcs8300,
+	.tz_cp_config_data = tz_cp_config_vpu3,
+	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu3),
+	.num_vpp_pipe = 2,
+	.max_session_count = 16,
+	.max_core_mbpf = ((4096 * 2176) / 256) * 4,
+	.max_core_mbps = (((3840 * 2176) / 256) * 120),
+};
+
+const struct iris_platform_data sm8550_data = {
+	.firmware_data = &iris_hfi_gen2_data,
+	.get_vpu_buffer_size = iris_vpu_buf_size,
+	.vpu_ops = &iris_vpu3_ops,
+	.icc_tbl = iris_icc_info_vpu3x,
+	.icc_tbl_size = ARRAY_SIZE(iris_icc_info_vpu3x),
+	.clk_rst_tbl = sm8550_clk_reset_table,
+	.clk_rst_tbl_size = ARRAY_SIZE(sm8550_clk_reset_table),
+	.bw_tbl_dec = iris_bw_table_dec_vpu3x,
+	.bw_tbl_dec_size = ARRAY_SIZE(iris_bw_table_dec_vpu3x),
+	.pmdomain_tbl = iris_pmdomain_table_vpu3x,
+	.pmdomain_tbl_size = ARRAY_SIZE(iris_pmdomain_table_vpu3x),
+	.opp_pd_tbl = iris_opp_pd_table_vpu3x,
+	.opp_pd_tbl_size = ARRAY_SIZE(iris_opp_pd_table_vpu3x),
+	.clk_tbl = sm8550_clk_table,
+	.clk_tbl_size = ARRAY_SIZE(sm8550_clk_table),
+	.opp_clk_tbl = iris_opp_clk_table_vpu3x,
+	/* Upper bound of DMA address range */
+	.dma_mask = 0xe0000000 - 1,
+	.fwname = "qcom/vpu/vpu30_p4.mbn",
+	.inst_iris_fmts = iris_fmts_vpu3x_dec,
+	.inst_iris_fmts_size = ARRAY_SIZE(iris_fmts_vpu3x_dec),
+	.inst_caps = &platform_inst_cap_sm8550,
+	.tz_cp_config_data = tz_cp_config_vpu3,
+	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu3),
+	.num_vpp_pipe = 4,
+	.max_session_count = 16,
+	.max_core_mbpf = NUM_MBS_8K * 2,
+	.max_core_mbps = ((7680 * 4320) / 256) * 60,
+};
+
+/*
+ * Shares most of SM8550 data except:
+ * - vpu_ops to iris_vpu33_ops
+ * - clk_rst_tbl to sm8650_clk_reset_table
+ * - controller_rst_tbl to sm8650_controller_reset_table
+ * - fwname to "qcom/vpu/vpu33_p4.mbn"
+ */
+const struct iris_platform_data sm8650_data = {
+	.firmware_data = &iris_hfi_gen2_data,
+	.get_vpu_buffer_size = iris_vpu33_buf_size,
+	.vpu_ops = &iris_vpu33_ops,
+	.icc_tbl = iris_icc_info_vpu3x,
+	.icc_tbl_size = ARRAY_SIZE(iris_icc_info_vpu3x),
+	.clk_rst_tbl = sm8650_clk_reset_table,
+	.clk_rst_tbl_size = ARRAY_SIZE(sm8650_clk_reset_table),
+	.controller_rst_tbl = sm8650_controller_reset_table,
+	.controller_rst_tbl_size = ARRAY_SIZE(sm8650_controller_reset_table),
+	.bw_tbl_dec = iris_bw_table_dec_vpu3x,
+	.bw_tbl_dec_size = ARRAY_SIZE(iris_bw_table_dec_vpu3x),
+	.pmdomain_tbl = iris_pmdomain_table_vpu3x,
+	.pmdomain_tbl_size = ARRAY_SIZE(iris_pmdomain_table_vpu3x),
+	.opp_pd_tbl = iris_opp_pd_table_vpu3x,
+	.opp_pd_tbl_size = ARRAY_SIZE(iris_opp_pd_table_vpu3x),
+	.clk_tbl = sm8550_clk_table,
+	.clk_tbl_size = ARRAY_SIZE(sm8550_clk_table),
+	.opp_clk_tbl = iris_opp_clk_table_vpu3x,
+	/* Upper bound of DMA address range */
+	.dma_mask = 0xe0000000 - 1,
+	.fwname = "qcom/vpu/vpu33_p4.mbn",
+	.inst_iris_fmts = iris_fmts_vpu3x_dec,
+	.inst_iris_fmts_size = ARRAY_SIZE(iris_fmts_vpu3x_dec),
+	.inst_caps = &platform_inst_cap_sm8550,
+	.tz_cp_config_data = tz_cp_config_vpu3,
+	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu3),
+	.num_vpp_pipe = 4,
+	.max_session_count = 16,
+	.max_core_mbpf = NUM_MBS_8K * 2,
+	.max_core_mbps = ((7680 * 4320) / 256) * 60,
+};
+
+const struct iris_platform_data sm8750_data = {
+	.firmware_data = &iris_hfi_gen2_data,
+	.get_vpu_buffer_size = iris_vpu33_buf_size,
+	.vpu_ops = &iris_vpu35_ops,
+	.icc_tbl = iris_icc_info_vpu3x,
+	.icc_tbl_size = ARRAY_SIZE(iris_icc_info_vpu3x),
+	.clk_rst_tbl = sm8750_clk_reset_table,
+	.clk_rst_tbl_size = ARRAY_SIZE(sm8750_clk_reset_table),
+	.bw_tbl_dec = iris_bw_table_dec_vpu3x,
+	.bw_tbl_dec_size = ARRAY_SIZE(iris_bw_table_dec_vpu3x),
+	.pmdomain_tbl = iris_pmdomain_table_vpu3x,
+	.pmdomain_tbl_size = ARRAY_SIZE(iris_pmdomain_table_vpu3x),
+	.opp_pd_tbl = iris_opp_pd_table_vpu3x,
+	.opp_pd_tbl_size = ARRAY_SIZE(iris_opp_pd_table_vpu3x),
+	.clk_tbl = sm8750_clk_table,
+	.clk_tbl_size = ARRAY_SIZE(sm8750_clk_table),
+	.opp_clk_tbl = iris_opp_clk_table_vpu3x,
+	/* Upper bound of DMA address range */
+	.dma_mask = 0xe0000000 - 1,
+	.fwname = "qcom/vpu/vpu35_p4.mbn",
+	.inst_iris_fmts = iris_fmts_vpu3x_dec,
+	.inst_iris_fmts_size = ARRAY_SIZE(iris_fmts_vpu3x_dec),
+	.inst_caps = &platform_inst_cap_sm8550,
+	.tz_cp_config_data = tz_cp_config_vpu3,
+	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu3),
+	.num_vpp_pipe = 4,
+	.max_session_count = 16,
+	.max_core_mbpf = NUM_MBS_8K * 2,
+	.max_core_mbps = ((7680 * 4320) / 256) * 60,
+};

-- 
2.47.3


