Return-Path: <linux-media+bounces-53824-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AOhsLeunomkK4wQAu9opvQ
	(envelope-from <linux-media+bounces-53824-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 28 Feb 2026 09:31:39 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 304681C1671
	for <lists+linux-media@lfdr.de>; Sat, 28 Feb 2026 09:31:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B2A3330D8006
	for <lists+linux-media@lfdr.de>; Sat, 28 Feb 2026 08:29:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 558543EBF05;
	Sat, 28 Feb 2026 08:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oP5Q5u+S";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="enm0kjLJ"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE5483E9F8C
	for <linux-media@vger.kernel.org>; Sat, 28 Feb 2026 08:29:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772267364; cv=none; b=tCMuOsMsbSLgKyONTX0Mx08TEjbReyxL3SEnwL6iAKXrjI2ipjAKSAzfS+hk3ypmlHllZMadJD6ZefBcfGTSP8Xdm6OkDCT3t/wah39pP1Gd0eLOySKLoKfdJQ0hNso4qFl9pGvqZbnepmWC0jJk5wHxcqI6XMIhlLNCouXI58Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772267364; c=relaxed/simple;
	bh=EGwtk4/Q786oGO+56F/YtWheBA+VGafzEs1d33vHWUw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pdJcKKHbyo5Z82/hXUiGdujgM60CHh48UpN9xiBTHBYRN1ltvldzk6rzZCDKU1WxpdaUphZn6nzuKcwF5ybGKKfWSAUVewGDDxuI4mTn7djMuW8qrEKm3+2opUyLK6epoS7FTKyX0xb/sBJFuYEU55ZUYBeSbERBO9Zd8KITsFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oP5Q5u+S; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=enm0kjLJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61S6Nn4T1782854
	for <linux-media@vger.kernel.org>; Sat, 28 Feb 2026 08:29:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NMtpybunnBrEGaDlAfxVunE0cG5JQGsdkZLlqKCz2h8=; b=oP5Q5u+SjBeDF/Re
	GIYBnBqDHCJpLrjdgYS36k/tl+PcaeMmcmsywbaZ+eR98v3bP+SptJxcBJUUPHzk
	+IEh7PJ8L6IIpVKmR+EkPFHU012pA9j9uHhkmOolrXDIlMyWx32IT25AR+ixLPy+
	oUyD/v5ziqvdmJ6DCcDX92n27vtzt9g+8SwfpYz5Eav0H0aoaL/8ShsLkTBxtyMf
	RfYOns8rYwEzLXxx7kvbKfS4EY9OQ/BThHwlNDWawYzBpRFD29OfDErY3HQB4kww
	gTRNEmU4iKEx+n2TEMbXiV/BGZxx3cO269nkHiVl5BXkIZmkGrBYhJiXem2x7t2r
	gULd7g==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cksgrrj2d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sat, 28 Feb 2026 08:29:20 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cbb8040f48so2534964485a.0
        for <linux-media@vger.kernel.org>; Sat, 28 Feb 2026 00:29:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772267359; x=1772872159; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NMtpybunnBrEGaDlAfxVunE0cG5JQGsdkZLlqKCz2h8=;
        b=enm0kjLJnNQf7yQWkw7wG3N7iyb1HEjmnNGgrZUTFINXSKzMr4to+AflHCPgczjrR4
         Moz38XYApw+FSFTYzx1RcCG8p1Y1eX9rvxMUcyfmCYVWe44WcSkHhl6rAKQftB3mAzQV
         s9gPsIKXfIuPXWlDtVaDwrRFBwofIJI3ts8FYRYjT+b75U6bGVWfH/0/rriIoPD+jo5D
         ezCmKor5mcI2vRQ1C2Qlu/+2Bs+Amr0mF8qd4kqsdL4iCj6ALjXIQAHsgeo77UJcZREM
         Ac5gYDxnBo1g7bI1beOJ5kmE2OrY6gN2oCIeUqOEUe6Tw34xKTOFeuxSqHuQ079KGmvl
         hN/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772267359; x=1772872159;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NMtpybunnBrEGaDlAfxVunE0cG5JQGsdkZLlqKCz2h8=;
        b=bybMec/EwpwTb/GccKCGb1qvgZh2pErTn+lejkah7VltEMfjJ5obbuu/clwqEqJldc
         Z8sF8JJX2vcAQmVANHehV2TNrP4Kqjg0jSwtWmsVlLwWmn/ToXp72emW7O4bfXJTv1pD
         wY3jPPW2dHFNxwDRCtzrBg0ld0wqIY6rx7RT5wfSSpTXfU/Ymf9aiRm46hVwdNz4iYbm
         N2ULrgT8HblC3arHmebPe1boJOgv4kB7lCU/5FHBsBfJCNaFRMwGsYa8KfYn9A74Nr1j
         yK3I68l9TZWaQXyao4nZCrhfd4kOlSJ2oIKXH8x6LK711uSj/XNhXslZbLaiWttytj4X
         MPbA==
X-Gm-Message-State: AOJu0YwQOsX62TmcKGOUq9EGni3+EtfvHjQ3Tj6JU/xzmiPGdFLATVs/
	+gelrMJT6XvYyYjD3l4JwuU6NahbnxUGoCRY8d1bZMvxfzVvSbkL6Y7c7BooUsxh9I8YNVk6Sft
	3f7aPWhVWqw9Tuf5/n2fchpL/oiPhdRnurhOr+oCYNaVY57s8gUI7WSG/3on8QmR4Mg==
X-Gm-Gg: ATEYQzx+QVFAaG5Rn73/khvijDfGO4IiXTr1xgQMqW5xAdMQcvNJ2TZWOZAzSpk9Otu
	dPU5UwYDsoYn7zvO/SAmlf3a1cgpPtx28tLGAGnold4HbL1mRELQyMhVY7PT4M7cJD3xTj1EP4/
	USoSlc4YPIgEDBNDOyLeQ48KyURtYtR2L5MmC8Jinf06Zo4xaa4tIY9cFV2otV94ERHdnLI7h50
	l5ebBwa/jm7/pcagLYMHK/K8PIEEPZR/PSZoactvwIYr5ubsD/+Xm2JIPga8Wfeh09xBONn2EWi
	b6Os7aNjMxRCsZXXX19KUYIgItjQFqkk9nXTrhq+kN6KdglWxf0L8na09Rid2jclpg0hv39qnZ3
	BTgYq/+oF6PfZQLiku/udaNobGr2MEIVHQFSSoLM5LZNlzKcWi7erAkLmHO0tOTuUuKlLIm3Mma
	qf7sykJFCCHVj2rbjsDKmTZ5bn07yeyRGx1Z0=
X-Received: by 2002:a05:620a:199f:b0:8c5:3256:2f47 with SMTP id af79cd13be357-8cbc8e7885cmr716748585a.68.1772267358894;
        Sat, 28 Feb 2026 00:29:18 -0800 (PST)
X-Received: by 2002:a05:620a:199f:b0:8c5:3256:2f47 with SMTP id af79cd13be357-8cbc8e7885cmr716745985a.68.1772267358329;
        Sat, 28 Feb 2026 00:29:18 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-389f2f4b158sm17970711fa.6.2026.02.28.00.29.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Feb 2026 00:29:16 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 28 Feb 2026 10:28:56 +0200
Subject: [PATCH 11/11] media: qcom: iris: split platform data from firmware
 data
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260228-iris-platform-data-v1-11-c2c53539f948@oss.qualcomm.com>
References: <20260228-iris-platform-data-v1-0-c2c53539f948@oss.qualcomm.com>
In-Reply-To: <20260228-iris-platform-data-v1-0-c2c53539f948@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=32688;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=EGwtk4/Q786oGO+56F/YtWheBA+VGafzEs1d33vHWUw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpoqdBT6GlVQE+UJA0wc2N1HbZPHFQhil1jMVRi
 9xBIagR+baJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaaKnQQAKCRCLPIo+Aiko
 1QDWB/0S/oPKVp5a7ATVKTRyuvVX7RrJe2ZJ5zdWqmER03KzP7ieWI8mbcQgi2O70OpHBt+vOw5
 h05ePMqKk9pTCsr5Mzok0qhN4T4q7FUlU2uBqEV5rocg9GxZB0wpz4fR7NBCWUCZchU37XUb7KE
 9lC3M0z4jIgLXiUfMKzVjEuQbcpZamlNO9M7yjwKHF55BLEPvTAL9vNGk53X2Kl/jEtwUTKVteO
 ONjzSdZG6XHHkYYZ8wytZv2tSVns4ooNhYnqzzRWTuMqn0Q5eej1X7ASEo4NSO+NBIDClJQZMUZ
 wURHHFMyU16DwZxXAS7Ncuh+9WHKUvt1njl+HliULBCjnEpz
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI4MDA3NyBTYWx0ZWRfX0cnb9/B99fw1
 9MhxFoNZZ2qWZnYzzeskSOpF7Au+GLbM0XdclHOFJpH0hLvasoQD7uRJB8plNUmYTw9PD+qhkA7
 E6sVzl9W62otUPJah3tELq6+faZP26lHbLDq2Uk1rHh1jliK8thYlXALMTTCtIdrtD9ZXMR4AeK
 ekgc2MdJblT138EnvoLoLHE9QIXJhWB8XHcEclsyu1J8n8KO0fOuBAcwfsrr00sBXaAadja8qzw
 ny1UEeB+oh541VWuukXCCbLswdSEYy8niYPf7fSxhaT80/R3fH9/hD5eSLphRReLbLsw1WkBCZq
 WDKhVu8i2ptNCF0pRis8qZrUJGVdiXCwvVliaanCIkWH3FmYjMrYoTq1toXvXr6/QDwvEHDKL5R
 /M+582sp0QHKZTsWikT/S1D+vTrF1sFYEBHFoiZvpH/h6DO1zwr8u6g1PEzw1/oi221cz8+qo1T
 ywPQFCiwEONMR9L0bkQ==
X-Proofpoint-GUID: mTZe5nsbeVP0d8ueIL7FnVlH8IwGfv_b
X-Proofpoint-ORIG-GUID: mTZe5nsbeVP0d8ueIL7FnVlH8IwGfv_b
X-Authority-Analysis: v=2.4 cv=Zqzg6t7G c=1 sm=1 tr=0 ts=69a2a760 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=_HI30331fBvO9VzV5UUA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-28_02,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 spamscore=0 priorityscore=1501 phishscore=0
 suspectscore=0 impostorscore=0 malwarescore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602280077
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,60fps:email,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-53824-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
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
X-Rspamd-Queue-Id: 304681C1671
X-Rspamd-Action: no action

Finalize the logical separation of the software and hardware interface
descriptions by moving hardware properties to the files specific to the
particular VPU version.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/Makefile          |   6 +-
 .../iris/{iris_platform_gen1.c => iris_hfi_gen1.c} | 135 -------------
 .../iris/{iris_platform_gen2.c => iris_hfi_gen2.c} | 222 ---------------------
 .../platform/qcom/iris/iris_platform_common.h      |   4 +
 .../platform/qcom/iris/iris_platform_sm8250.h      |  29 +++
 .../platform/qcom/iris/iris_platform_sm8550.h      |  31 +++
 .../media/platform/qcom/iris/iris_platform_vpu2.c  | 126 ++++++++++++
 .../media/platform/qcom/iris/iris_platform_vpu3.c  | 214 ++++++++++++++++++++
 8 files changed, 408 insertions(+), 359 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/Makefile b/drivers/media/platform/qcom/iris/Makefile
index 2fde45f81727..67a12f42b3a6 100644
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
+             iris_platform_vpu3.o \
              iris_power.o \
              iris_probe.o \
              iris_resources.o \
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen1.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1.c
similarity index 65%
rename from drivers/media/platform/qcom/iris/iris_platform_gen1.c
rename to drivers/media/platform/qcom/iris/iris_hfi_gen1.c
index 961a78729306..b316d800dab6 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen1.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1.c
@@ -3,38 +3,17 @@
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
 #define BITRATE_PEAK_DEFAULT	(BITRATE_DEFAULT * 2)
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
@@ -248,56 +227,6 @@ static const struct platform_inst_fw_cap inst_fw_cap_sm8250_enc[] = {
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
-static const char * const sm8250_opp_pd_table[] = { "mx" };
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
 static const u32 sm8250_dec_ip_int_buf_tbl[] = {
 	BUF_BIN,
 	BUF_SCRATCH_1,
@@ -330,67 +259,3 @@ const struct iris_firmware_data iris_hfi_gen1_data = {
 	.enc_ip_int_buf_tbl = sm8250_enc_ip_int_buf_tbl,
 	.enc_ip_int_buf_tbl_size = ARRAY_SIZE(sm8250_enc_ip_int_buf_tbl),
 };
-
-const struct iris_platform_data sm8250_data = {
-	.firmware_data = &iris_hfi_gen1_data,
-	.vpu_ops = &iris_vpu2_ops,
-	.set_preset_registers = iris_vpu_set_preset_registers,
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
-	.hw_response_timeout = HW_RESPONSE_TIMEOUT_VALUE,
-	.num_vpp_pipe = 4,
-	.max_session_count = 16,
-	.max_core_mbpf = NUM_MBS_8K,
-	.max_core_mbps = ((7680 * 4320) / 256) * 60,
-};
-
-const struct iris_platform_data sc7280_data = {
-	.firmware_data = &iris_hfi_gen1_data,
-	.vpu_ops = &iris_vpu2_ops,
-	.set_preset_registers = iris_vpu_set_preset_registers,
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
-	.hw_response_timeout = HW_RESPONSE_TIMEOUT_VALUE,
-	.num_vpp_pipe = 1,
-	.no_aon = true,
-	.max_session_count = 16,
-	.max_core_mbpf = 4096 * 2176 / 256 * 2 + 1920 * 1088 / 256,
-	/* max spec for SC7280 is 4096x2176@60fps */
-	.max_core_mbps = 4096 * 2176 / 256 * 60,
-};
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
similarity index 73%
rename from drivers/media/platform/qcom/iris/iris_platform_gen2.c
rename to drivers/media/platform/qcom/iris/iris_hfi_gen2.c
index 92e9c7812e0f..a0bad72fe5b0 100644
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
 static const u32 sm8550_dec_ip_int_buf_tbl[] = {
 	BUF_BIN,
 	BUF_COMV,
@@ -857,148 +780,3 @@ const struct iris_firmware_data iris_hfi_gen2_vpu33_data = {
 	.enc_op_int_buf_tbl = sm8550_enc_op_int_buf_tbl,
 	.enc_op_int_buf_tbl_size = ARRAY_SIZE(sm8550_enc_op_int_buf_tbl),
 };
-
-const struct iris_platform_data sm8550_data = {
-	.firmware_data = &iris_hfi_gen2_data,
-	.vpu_ops = &iris_vpu3_ops,
-	.set_preset_registers = iris_vpu_set_preset_registers,
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
-	.core_arch = VIDEO_ARCH_LX,
-	.hw_response_timeout = HW_RESPONSE_TIMEOUT_VALUE,
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
-	.firmware_data = &iris_hfi_gen2_vpu33_data,
-	.vpu_ops = &iris_vpu33_ops,
-	.set_preset_registers = iris_vpu_set_preset_registers,
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
-	.core_arch = VIDEO_ARCH_LX,
-	.hw_response_timeout = HW_RESPONSE_TIMEOUT_VALUE,
-	.num_vpp_pipe = 4,
-	.max_session_count = 16,
-	.max_core_mbpf = NUM_MBS_8K * 2,
-	.max_core_mbps = ((7680 * 4320) / 256) * 60,
-};
-
-const struct iris_platform_data sm8750_data = {
-	.firmware_data = &iris_hfi_gen2_vpu33_data,
-	.vpu_ops = &iris_vpu35_ops,
-	.set_preset_registers = iris_vpu_set_preset_registers,
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
-	.core_arch = VIDEO_ARCH_LX,
-	.hw_response_timeout = HW_RESPONSE_TIMEOUT_VALUE,
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
-	.vpu_ops = &iris_vpu3_ops,
-	.set_preset_registers = iris_vpu_set_preset_registers,
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
-	.core_arch = VIDEO_ARCH_LX,
-	.hw_response_timeout = HW_RESPONSE_TIMEOUT_VALUE,
-	.num_vpp_pipe = 2,
-	.max_session_count = 16,
-	.max_core_mbpf = ((4096 * 2176) / 256) * 4,
-	.max_core_mbps = (((3840 * 2176) / 256) * 120),
-};
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index be3449861993..0a918abe43bc 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -40,6 +40,10 @@ enum pipe_type {
 	PIPE_4 = 4,
 };
 
+extern const struct iris_firmware_data iris_hfi_gen1_data;
+extern const struct iris_firmware_data iris_hfi_gen2_data;
+extern const struct iris_firmware_data iris_hfi_gen2_vpu33_data;
+
 extern const struct iris_platform_data qcs8300_data;
 extern const struct iris_platform_data sc7280_data;
 extern const struct iris_platform_data sm8250_data;
diff --git a/drivers/media/platform/qcom/iris/iris_platform_sm8250.h b/drivers/media/platform/qcom/iris/iris_platform_sm8250.h
new file mode 100644
index 000000000000..9c4cab5c9d0e
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
+static const char * const sm8250_opp_pd_table[] = { "mx" };
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
index 000000000000..b029229cede5
--- /dev/null
+++ b/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
@@ -0,0 +1,126 @@
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
+static struct iris_fmt platform_fmts_sm8250_dec[] = {
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
+static struct platform_inst_caps platform_inst_cap_sm8250 = {
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
+static const struct icc_info sm8250_icc_table[] = {
+	{ "cpu-cfg",    1000, 1000     },
+	{ "video-mem",  1000, 15000000 },
+};
+
+static const char * const sm8250_clk_reset_table[] = { "bus", "core" };
+
+static const char * const sm8250_pmdomain_table[] = { "venus", "vcodec0" };
+
+static const struct tz_cp_config tz_cp_config_sm8250[] = {
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
+	.vpu_ops = &iris_vpu2_ops,
+	.set_preset_registers = iris_vpu_set_preset_registers,
+	.icc_tbl = sm8250_icc_table,
+	.icc_tbl_size = ARRAY_SIZE(sm8250_icc_table),
+	.bw_tbl_dec = sc7280_bw_table_dec,
+	.bw_tbl_dec_size = ARRAY_SIZE(sc7280_bw_table_dec),
+	.pmdomain_tbl = sm8250_pmdomain_table,
+	.pmdomain_tbl_size = ARRAY_SIZE(sm8250_pmdomain_table),
+	.opp_pd_tbl = sc7280_opp_pd_table,
+	.opp_pd_tbl_size = ARRAY_SIZE(sc7280_opp_pd_table),
+	.clk_tbl = sc7280_clk_table,
+	.clk_tbl_size = ARRAY_SIZE(sc7280_clk_table),
+	.opp_clk_tbl = sc7280_opp_clk_table,
+	/* Upper bound of DMA address range */
+	.dma_mask = 0xe0000000 - 1,
+	.fwname = "qcom/vpu/vpu20_p1.mbn",
+	.inst_iris_fmts = platform_fmts_sm8250_dec,
+	.inst_iris_fmts_size = ARRAY_SIZE(platform_fmts_sm8250_dec),
+	.inst_caps = &platform_inst_cap_sm8250,
+	.tz_cp_config_data = tz_cp_config_sm8250,
+	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_sm8250),
+	.hw_response_timeout = HW_RESPONSE_TIMEOUT_VALUE,
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
+	.vpu_ops = &iris_vpu2_ops,
+	.set_preset_registers = iris_vpu_set_preset_registers,
+	.icc_tbl = sm8250_icc_table,
+	.icc_tbl_size = ARRAY_SIZE(sm8250_icc_table),
+	.clk_rst_tbl = sm8250_clk_reset_table,
+	.clk_rst_tbl_size = ARRAY_SIZE(sm8250_clk_reset_table),
+	.bw_tbl_dec = sm8250_bw_table_dec,
+	.bw_tbl_dec_size = ARRAY_SIZE(sm8250_bw_table_dec),
+	.pmdomain_tbl = sm8250_pmdomain_table,
+	.pmdomain_tbl_size = ARRAY_SIZE(sm8250_pmdomain_table),
+	.opp_pd_tbl = sm8250_opp_pd_table,
+	.opp_pd_tbl_size = ARRAY_SIZE(sm8250_opp_pd_table),
+	.clk_tbl = sm8250_clk_table,
+	.clk_tbl_size = ARRAY_SIZE(sm8250_clk_table),
+	.opp_clk_tbl = sm8250_opp_clk_table,
+	/* Upper bound of DMA address range */
+	.dma_mask = 0xe0000000 - 1,
+	.fwname = "qcom/vpu-1.0/venus.mbn",
+	.inst_iris_fmts = platform_fmts_sm8250_dec,
+	.inst_iris_fmts_size = ARRAY_SIZE(platform_fmts_sm8250_dec),
+	.inst_caps = &platform_inst_cap_sm8250,
+	.tz_cp_config_data = tz_cp_config_sm8250,
+	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_sm8250),
+	.hw_response_timeout = HW_RESPONSE_TIMEOUT_VALUE,
+	.num_vpp_pipe = 4,
+	.max_session_count = 16,
+	.max_core_mbpf = NUM_MBS_8K,
+	.max_core_mbps = ((7680 * 4320) / 256) * 60,
+};
diff --git a/drivers/media/platform/qcom/iris/iris_platform_vpu3.c b/drivers/media/platform/qcom/iris/iris_platform_vpu3.c
new file mode 100644
index 000000000000..fb7fd2604169
--- /dev/null
+++ b/drivers/media/platform/qcom/iris/iris_platform_vpu3.c
@@ -0,0 +1,214 @@
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
+#define VIDEO_ARCH_LX 1
+
+static struct iris_fmt platform_fmts_sm8550_dec[] = {
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
+static const struct icc_info sm8550_icc_table[] = {
+	{ "cpu-cfg",    1000, 1000     },
+	{ "video-mem",  1000, 15000000 },
+};
+
+static const struct bw_info sm8550_bw_table_dec[] = {
+	{ ((4096 * 2160) / 256) * 60, 1608000 },
+	{ ((4096 * 2160) / 256) * 30,  826000 },
+	{ ((1920 * 1080) / 256) * 60,  567000 },
+	{ ((1920 * 1080) / 256) * 30,  294000 },
+};
+
+static const char * const sm8550_pmdomain_table[] = { "venus", "vcodec0" };
+
+static const char * const sm8550_opp_pd_table[] = { "mxc", "mmcx" };
+
+static const char * const sm8550_opp_clk_table[] = {
+	"vcodec0_core",
+	NULL,
+};
+
+static const struct tz_cp_config tz_cp_config_sm8550[] = {
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
+	.vpu_ops = &iris_vpu3_ops,
+	.set_preset_registers = iris_vpu_set_preset_registers,
+	.icc_tbl = sm8550_icc_table,
+	.icc_tbl_size = ARRAY_SIZE(sm8550_icc_table),
+	.clk_rst_tbl = sm8550_clk_reset_table,
+	.clk_rst_tbl_size = ARRAY_SIZE(sm8550_clk_reset_table),
+	.bw_tbl_dec = sm8550_bw_table_dec,
+	.bw_tbl_dec_size = ARRAY_SIZE(sm8550_bw_table_dec),
+	.pmdomain_tbl = sm8550_pmdomain_table,
+	.pmdomain_tbl_size = ARRAY_SIZE(sm8550_pmdomain_table),
+	.opp_pd_tbl = sm8550_opp_pd_table,
+	.opp_pd_tbl_size = ARRAY_SIZE(sm8550_opp_pd_table),
+	.clk_tbl = sm8550_clk_table,
+	.clk_tbl_size = ARRAY_SIZE(sm8550_clk_table),
+	.opp_clk_tbl = sm8550_opp_clk_table,
+	/* Upper bound of DMA address range */
+	.dma_mask = 0xe0000000 - 1,
+	.fwname = "qcom/vpu/vpu30_p4_s6.mbn",
+	.inst_iris_fmts = platform_fmts_sm8550_dec,
+	.inst_iris_fmts_size = ARRAY_SIZE(platform_fmts_sm8550_dec),
+	.inst_caps = &platform_inst_cap_qcs8300,
+	.tz_cp_config_data = tz_cp_config_sm8550,
+	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_sm8550),
+	.core_arch = VIDEO_ARCH_LX,
+	.hw_response_timeout = HW_RESPONSE_TIMEOUT_VALUE,
+	.num_vpp_pipe = 2,
+	.max_session_count = 16,
+	.max_core_mbpf = ((4096 * 2176) / 256) * 4,
+	.max_core_mbps = (((3840 * 2176) / 256) * 120),
+};
+
+const struct iris_platform_data sm8550_data = {
+	.firmware_data = &iris_hfi_gen2_data,
+	.vpu_ops = &iris_vpu3_ops,
+	.set_preset_registers = iris_vpu_set_preset_registers,
+	.icc_tbl = sm8550_icc_table,
+	.icc_tbl_size = ARRAY_SIZE(sm8550_icc_table),
+	.clk_rst_tbl = sm8550_clk_reset_table,
+	.clk_rst_tbl_size = ARRAY_SIZE(sm8550_clk_reset_table),
+	.bw_tbl_dec = sm8550_bw_table_dec,
+	.bw_tbl_dec_size = ARRAY_SIZE(sm8550_bw_table_dec),
+	.pmdomain_tbl = sm8550_pmdomain_table,
+	.pmdomain_tbl_size = ARRAY_SIZE(sm8550_pmdomain_table),
+	.opp_pd_tbl = sm8550_opp_pd_table,
+	.opp_pd_tbl_size = ARRAY_SIZE(sm8550_opp_pd_table),
+	.clk_tbl = sm8550_clk_table,
+	.clk_tbl_size = ARRAY_SIZE(sm8550_clk_table),
+	.opp_clk_tbl = sm8550_opp_clk_table,
+	/* Upper bound of DMA address range */
+	.dma_mask = 0xe0000000 - 1,
+	.fwname = "qcom/vpu/vpu30_p4.mbn",
+	.inst_iris_fmts = platform_fmts_sm8550_dec,
+	.inst_iris_fmts_size = ARRAY_SIZE(platform_fmts_sm8550_dec),
+	.inst_caps = &platform_inst_cap_sm8550,
+	.tz_cp_config_data = tz_cp_config_sm8550,
+	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_sm8550),
+	.core_arch = VIDEO_ARCH_LX,
+	.hw_response_timeout = HW_RESPONSE_TIMEOUT_VALUE,
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
+	.firmware_data = &iris_hfi_gen2_vpu33_data,
+	.vpu_ops = &iris_vpu33_ops,
+	.set_preset_registers = iris_vpu_set_preset_registers,
+	.icc_tbl = sm8550_icc_table,
+	.icc_tbl_size = ARRAY_SIZE(sm8550_icc_table),
+	.clk_rst_tbl = sm8650_clk_reset_table,
+	.clk_rst_tbl_size = ARRAY_SIZE(sm8650_clk_reset_table),
+	.controller_rst_tbl = sm8650_controller_reset_table,
+	.controller_rst_tbl_size = ARRAY_SIZE(sm8650_controller_reset_table),
+	.bw_tbl_dec = sm8550_bw_table_dec,
+	.bw_tbl_dec_size = ARRAY_SIZE(sm8550_bw_table_dec),
+	.pmdomain_tbl = sm8550_pmdomain_table,
+	.pmdomain_tbl_size = ARRAY_SIZE(sm8550_pmdomain_table),
+	.opp_pd_tbl = sm8550_opp_pd_table,
+	.opp_pd_tbl_size = ARRAY_SIZE(sm8550_opp_pd_table),
+	.clk_tbl = sm8550_clk_table,
+	.clk_tbl_size = ARRAY_SIZE(sm8550_clk_table),
+	.opp_clk_tbl = sm8550_opp_clk_table,
+	/* Upper bound of DMA address range */
+	.dma_mask = 0xe0000000 - 1,
+	.fwname = "qcom/vpu/vpu33_p4.mbn",
+	.inst_iris_fmts = platform_fmts_sm8550_dec,
+	.inst_iris_fmts_size = ARRAY_SIZE(platform_fmts_sm8550_dec),
+	.inst_caps = &platform_inst_cap_sm8550,
+	.tz_cp_config_data = tz_cp_config_sm8550,
+	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_sm8550),
+	.core_arch = VIDEO_ARCH_LX,
+	.hw_response_timeout = HW_RESPONSE_TIMEOUT_VALUE,
+	.num_vpp_pipe = 4,
+	.max_session_count = 16,
+	.max_core_mbpf = NUM_MBS_8K * 2,
+	.max_core_mbps = ((7680 * 4320) / 256) * 60,
+};
+
+const struct iris_platform_data sm8750_data = {
+	.firmware_data = &iris_hfi_gen2_vpu33_data,
+	.vpu_ops = &iris_vpu35_ops,
+	.set_preset_registers = iris_vpu_set_preset_registers,
+	.icc_tbl = sm8550_icc_table,
+	.icc_tbl_size = ARRAY_SIZE(sm8550_icc_table),
+	.clk_rst_tbl = sm8750_clk_reset_table,
+	.clk_rst_tbl_size = ARRAY_SIZE(sm8750_clk_reset_table),
+	.bw_tbl_dec = sm8550_bw_table_dec,
+	.bw_tbl_dec_size = ARRAY_SIZE(sm8550_bw_table_dec),
+	.pmdomain_tbl = sm8550_pmdomain_table,
+	.pmdomain_tbl_size = ARRAY_SIZE(sm8550_pmdomain_table),
+	.opp_pd_tbl = sm8550_opp_pd_table,
+	.opp_pd_tbl_size = ARRAY_SIZE(sm8550_opp_pd_table),
+	.clk_tbl = sm8750_clk_table,
+	.clk_tbl_size = ARRAY_SIZE(sm8750_clk_table),
+	.opp_clk_tbl = sm8550_opp_clk_table,
+	/* Upper bound of DMA address range */
+	.dma_mask = 0xe0000000 - 1,
+	.fwname = "qcom/vpu/vpu35_p4.mbn",
+	.inst_iris_fmts = platform_fmts_sm8550_dec,
+	.inst_iris_fmts_size = ARRAY_SIZE(platform_fmts_sm8550_dec),
+	.inst_caps = &platform_inst_cap_sm8550,
+	.tz_cp_config_data = tz_cp_config_sm8550,
+	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_sm8550),
+	.core_arch = VIDEO_ARCH_LX,
+	.hw_response_timeout = HW_RESPONSE_TIMEOUT_VALUE,
+	.num_vpp_pipe = 4,
+	.max_session_count = 16,
+	.max_core_mbpf = NUM_MBS_8K * 2,
+	.max_core_mbps = ((7680 * 4320) / 256) * 60,
+};

-- 
2.47.3


