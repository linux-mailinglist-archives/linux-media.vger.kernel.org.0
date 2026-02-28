Return-Path: <linux-media+bounces-53849-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sBK3IZgKo2nY9AQAu9opvQ
	(envelope-from <linux-media+bounces-53849-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 28 Feb 2026 16:32:40 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 516CB1C3F81
	for <lists+linux-media@lfdr.de>; Sat, 28 Feb 2026 16:32:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6C393307E355
	for <lists+linux-media@lfdr.de>; Sat, 28 Feb 2026 15:27:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C88E47ECCF;
	Sat, 28 Feb 2026 15:26:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="phCeuvQS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UUFgcuJH"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D30247B423
	for <linux-media@vger.kernel.org>; Sat, 28 Feb 2026 15:26:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772292410; cv=none; b=BTZSLUtvYqXo2H/wjtBBcj66jSQfcUc/gn25j632kn4MFYQLOXxO2V1HOkXVk0bTQmmha0ryVt5WuP/tvtAfXby6LwLlfdhvUJD7dhK5Z+imMVyG3b6Oc/BZvOsazfCYFovWWl05r4IhAAEQuP874qefQNk1W3W27mkBIQU5o1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772292410; c=relaxed/simple;
	bh=EGwtk4/Q786oGO+56F/YtWheBA+VGafzEs1d33vHWUw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=vC5XOh9DLIGB8FybQB55dV2aRlfkQmw3vS1WUHbgPcT7KnhNstJFn4J+vIsjLVesE2UQXH3HDXpikHZq0/q5opK3lVM6ZHQy6ibNPe/k1hadLjCn00Wy9ogfdFg5oHEHmjpHmeDF7ZDjcFCTND+1Q3sesvrQH9EOUSz0C2Zxqq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=phCeuvQS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UUFgcuJH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61SERKX44082276
	for <linux-media@vger.kernel.org>; Sat, 28 Feb 2026 15:26:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NMtpybunnBrEGaDlAfxVunE0cG5JQGsdkZLlqKCz2h8=; b=phCeuvQScASnEmPa
	3Hr6LfDc/T8kHc60rPmoOjLYrxmZMSywU3SlYIQVY9NtMzk64Fx/lNADDUuTG0MM
	pMadp3w0wOOecOuhRLKrELEnFa7UgRi0ANDsEZDTxzzZTJki91Ulo7EtcINFCZ51
	tb2p8n4Ggj4yweVUT4SVhrqZ+Zukm9aBJeTseSb7oo1fIhGbTW+V1s0F6UwP3x8R
	PAmHULnrfWp2vsAx31d05uP/4nMJO7fM3rX8PD+cz/DmOKA4a8FLou2CtB5uMQFG
	31M72OrTMKpx1aXVh8/ZY2hIFCs4miIOzuRSDEdb7Iy2xEPIB/iG/Ypr9k3v09SM
	Lc4wRQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ckshch6y8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sat, 28 Feb 2026 15:26:47 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c882774f0dso2495886085a.2
        for <linux-media@vger.kernel.org>; Sat, 28 Feb 2026 07:26:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772292406; x=1772897206; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NMtpybunnBrEGaDlAfxVunE0cG5JQGsdkZLlqKCz2h8=;
        b=UUFgcuJH7rhwohf36FbgZdr63E1rviDQRG72qsYUOAKQWvOougSHzsOLfKLELkbWWC
         PzspMWYNWzbKl5VdvJMM6xVWBUipxidxySp4+GaQ13pwlqp69603bgPZnYmafaPWGNMk
         xVAotCd/+HIZ0T31DtvN9zFmhoLMm0s6z/SXGrbYxI/KbdPvxFd/LIKXDCrimJiHrmAk
         t8Ts/vsa+6WDOf3qX0kNcO0lRoH6WSugq2W4WcFVU0Q91DykbQLDwmpX+1z9FfIeobmS
         UOBo3YGkEotEqLo4ao9CslbYSbvwU8QS6fxzCCm5iM0+ASXCNIcQC/UT2dOXQX4uf1w2
         r7Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772292406; x=1772897206;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NMtpybunnBrEGaDlAfxVunE0cG5JQGsdkZLlqKCz2h8=;
        b=M4eg8qAgFdXR9pLlQZyrTmT+jRkQmiZtU7dUkh9yLyHNWsy/7NYe4STob2hGA3ipQU
         JCXfxwnMew+sRTspM3/9R96PYgVE6Fivq0NQbgxLI4WgDhiJcSP1aXBQHNynvrzLcgYd
         mHNsR63/U4DOTNSEp+yTsFkO5j7F1WUtpqZWz8s7L44+g7bZk57EbmpQjrOmvqCo/uuF
         9Kh4XexQQ4KXVJRqYUXIlRnwYve4dI8CiwrJMKU6DBeanFVQYgj9eGF/L1A4w91W6HgI
         GxH68ZOgaiJrtkCrOyWwj5qMXUOmykKlztyMOA1ckw71Vn6WU88u3N1708WxdVJfC/aY
         xccg==
X-Gm-Message-State: AOJu0Yy0+vYPJzqH+5vVxwploQJSjO8aKFlKqeFYoKmqgKo1Z23fkd3P
	vABFJfVAMRKTHQtymU8DirjxISGRTlfoGOwpE0EREu9t3OSWRXAL0OlcYH8cricaBYeh4Tmg7xQ
	6S1sQ+S3d05LjScaZIJ3X78PCbKOy1atTcJtV2cdTd2c9MOQ/mwRj5XfAlzeCndvOAQ==
X-Gm-Gg: ATEYQzzC0LUdrm3rkVG7YQYJNeG+dvi86cKERCaxeFGWImCoDOor3j33tr8gmQr2R5z
	MyJaCCiEnCYFYRNbVCpndf7AOCefKIMlPnSTXVLNmOJjqN7YOWi13Ri+uPER8llYpnskfuwLrnB
	s8JNHxnRdhTUPytCrFAxf3pdx4AMO2sD+d1Lr6anIAijQxDuA5+xWk0OrUDHgWZlb8VSWvSOOqE
	3mEOhUApebkfH29MPrp/EudMO04acS7hiSZ3dVTOqurZ01NJquGZvQ2ehWJlrFn2KMJ6pd2op61
	7WcAvQyGEMT59fQ5dN7UATg7w9KXoYwynQP4lrcQF71w9wleokQjOfMjL2vUYY5oOTIvivIYJbY
	OcPTx7HyhEGZW9kaNJALa7aVxzZ/PZereqOAz6GFkot/LZQjAHXkcKjo7XSSvGqLw01buEGiW3b
	1AlfX/wWDCTGL8yL5lmPcEBrrLU5Y9Z6LrvQo=
X-Received: by 2002:a05:620a:4410:b0:8ca:3d7c:e767 with SMTP id af79cd13be357-8cbc8df1c36mr853724385a.52.1772292406031;
        Sat, 28 Feb 2026 07:26:46 -0800 (PST)
X-Received: by 2002:a05:620a:4410:b0:8ca:3d7c:e767 with SMTP id af79cd13be357-8cbc8df1c36mr853719685a.52.1772292405376;
        Sat, 28 Feb 2026 07:26:45 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a115b57922sm625558e87.63.2026.02.28.07.26.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Feb 2026 07:26:44 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 28 Feb 2026 17:26:38 +0200
Subject: [PATCH v2 11/11] media: qcom: iris: split platform data from
 firmware data
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260228-iris-platform-data-v2-11-acf036a3c84c@oss.qualcomm.com>
References: <20260228-iris-platform-data-v2-0-acf036a3c84c@oss.qualcomm.com>
In-Reply-To: <20260228-iris-platform-data-v2-0-acf036a3c84c@oss.qualcomm.com>
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
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpowkoAl8wAEY/RHelraYhd7XuAbvSxG/P25fhe
 ezW+o2S0HKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaaMJKAAKCRCLPIo+Aiko
 1RemB/0SeJwcbNQiHe3CI00L5N9Z61POJNLpKotrpxu9r4BQN2t1NcoRtxjXSqmpSCScw6bbxcl
 U0VCt1+cuhkjAHR2v65mrHGnIeq2YWwzjDJjaGvqdBQTE69cpQoCRGUnyhCcUQANRsl1zLZy3y1
 +CiMkCSmNe9zOeOqD3qAoReLjebm4/IXlHBOmhamzfRG6dJlL6naHxoxU6Cw3Qb3JG4O18S2QHf
 uG8A/5mXFovqCySj8Of3dAGs7T5E3XjD1G9fTy6NK0ipLXlC1mQSn2I8i0V1TpbppKXhGXctw7B
 0JzD4CxRvUadyqKtit5ciBE3aAACict0s0OzmXpuaahYpRZW
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: UOQePmhHotSYcXb0BV6LjcmYxNMi2gkl
X-Proofpoint-GUID: UOQePmhHotSYcXb0BV6LjcmYxNMi2gkl
X-Authority-Analysis: v=2.4 cv=SO9PlevH c=1 sm=1 tr=0 ts=69a30937 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=_HI30331fBvO9VzV5UUA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI4MDE0MiBTYWx0ZWRfX3o9lHASG4E0t
 BP0kgOllMTGHvaThQe1Z4El5u4OmFSFhRVeqxy93j7iECqGPX0Clwd66cHqyhlQ3VuXOzLUWtL/
 RGOxfLa8w51hUdfGb2YwCFIfLxezeGqhTg7/hN7sZJU+YghJ8CdnejVs8KKzu7b+VdGueoh025A
 eFISHxucuU9y19kHYE06oThedcLfTxBIQIlWnO1veskcAwNeFXzfurYl1TkKKocLly4gfljFhH6
 o3IzCGRN9VBYnxHFvdMvN27wriuSh9IEQBm3qzEdncl2cx5TWkPz++bLiodNXmbItFybzDL00dH
 mMnBt8WpRgLTK8wXH7u3G6gPf94d7sXDXHEcMqXDEFHDQHgpE4ckcp8d2efiGX+tPLp37c3WIy5
 CeuWgFdnWq98t7Ud7qjFqYbck+ZbpTPAykc4Pbyn2q5sh2ug3CN2SgOrdbuVcmfvTdgiLNkln9f
 RnfXgpBN6T/rmNr734w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-28_05,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 impostorscore=0 spamscore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602280142
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,60fps:email,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-53849-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
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
X-Rspamd-Queue-Id: 516CB1C3F81
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


