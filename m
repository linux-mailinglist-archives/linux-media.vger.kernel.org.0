Return-Path: <linux-media+bounces-57359-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UCbNOdDpxmloQAUAu9opvQ
	(envelope-from <linux-media+bounces-57359-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 21:34:24 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6688034B0E1
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 21:34:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 61272316C3C0
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 20:22:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68AC5392C34;
	Fri, 27 Mar 2026 20:20:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hRYHpQTf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J78XIAkN"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B7D73A7F4F
	for <linux-media@vger.kernel.org>; Fri, 27 Mar 2026 20:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774642809; cv=none; b=XbZf7YDUHXv4Iw+eleDnq70jebz8MQ5FvZhryNEN/LPSpSjcyUaw9gJ0QouZ8n9apTacUMX54ry8IiG1/yqQ68gw5xtmQEMHD61ZlSOehpCaxFtmwdUyVE6KQxm4Jwx8JNGLvk8TKNM0aytmyC+dZ2LdIWLWIR4AY/oMNwEnIqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774642809; c=relaxed/simple;
	bh=Sjkopt6DE1KjMmnlYS+KL4p1o+7A4uaEPfALTWUuNnQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mxTUw0iGMac+5JUZGIwE01TrJwIDqMBD7mtyygYkpj9al5ul6kN9qsGYfkI02KuQaUcjVYGRQ0HG2FQtetHdEY6UnZX5ODm8i2snNaXJFCeqKKzjopteZuUytZbA8Ynhv4ziGGdPKcjeYz8y4JgNTinIqaZ9MirzGlQhy0FXl/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hRYHpQTf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J78XIAkN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62RIKOQ63234177
	for <linux-media@vger.kernel.org>; Fri, 27 Mar 2026 20:20:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QKlKMp4CxZTt/vapbQeq8RXp1kuuPuBSN620uIJs00I=; b=hRYHpQTfWGrmGu78
	3adgtOhIoL4Y9p8AHbSdejsVY2I8sGbMBZCh1i3mutLQKlA69Xpby/Mer+bM8+fw
	kq50jFphA7Oi4CDV61b1bfnrT0Z3CJ3J7YZpaUqBqA5My9WuCK0bCF0uSLVfUpkj
	N2JQ8+ly68OUNJXEYZvaaWxhLkErG99Jhb9ORLvJ7VppH2K6vurDFQZnMaIbX7sv
	ebenrYdsF16AG4wzPziI4j5tF6OQVfso6omQHfCzvkxXSMCuKUan8ymLM09ugDNF
	9INkHbnkIYbL++XXsLM91t+mYDEw1wBd7tVXa7N7CG+6SJXxB4RHWb+HkmUhk4Y1
	veVGnw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d5y2graxc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 27 Mar 2026 20:20:06 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50939597b85so58400321cf.2
        for <linux-media@vger.kernel.org>; Fri, 27 Mar 2026 13:20:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774642805; x=1775247605; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QKlKMp4CxZTt/vapbQeq8RXp1kuuPuBSN620uIJs00I=;
        b=J78XIAkNHUkXFNz7ddW767vAsewgc3Q1/Mjn52U1GgRyQXJc7+oKubFXrq/BVPdwLi
         /Qx/6YdG579SQZlYIuF//gHEvRcH3KXiJv6+m0E/W8PgRpysk0R5iKpuBoYKOcvgzFOi
         /mfD2FIDzQe45YtDuA0+rgH+sPK+DLalrjBV45gTPW5ou/aRoabzCEBfXcljfCy7wEO7
         DVwGTI7kjUFGvwyF5bhlowAKVyOcTgIusjSyRq+TneazAOF3OOjZSinef1pYadwhDREu
         EaeEObvogqmtZca7EuR9SF3Ks4MPFnik+hzrIi1njbWx/0NhegHzu1ZT0vS2DkkT8EGb
         cOww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774642805; x=1775247605;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QKlKMp4CxZTt/vapbQeq8RXp1kuuPuBSN620uIJs00I=;
        b=nKn0JPRuPxI599gxJuBBbF+kiV5pdFBghdk2+vMlcD5W4JfNmzMqrRo8vNj8KK7gTL
         XtRTVD33K19dIyYkJFbmLD1hMscTIcQ4bDx0LSny+AzNNimeudt70i5pLO1Vqa5RCi5x
         PeFLa4+w/axI5VcctqlJ4DIeWjfh5MI0iKWNil0yJjqclLdFZGThAO17VgjwaReTuaq4
         lh8UypBu3w66Waqwdh4gGwbV9Bg6NgaS5isarx56ASgcoUMBrVZI79eYF/HHTvRfk9p3
         0xpIkl2y5veoR2kvrFa+0VdlNGk0YLwV4Saj7rUlf/0KP6w2x5BNqekXe6SyMdZJUIvz
         /h/w==
X-Gm-Message-State: AOJu0YxIQxzJKaJGoWv2vg3UVWvn5DY06jXIFoXwxWPhWh7wFLs9YHEo
	JigvdWZ4ax44uU/HpfpcqMU1FEDbi/EyLeZU/pWJh1gNFsrRCfpboTExO22UeKgqST9n75WDEO7
	qUsiJDKuRmP/UG4GJzv96pYKOISWiJn9r7+8PXLhMYpt4k1MbUlhGxWxh5AvMdY3KeQ==
X-Gm-Gg: ATEYQzzopybSUn8sQ4elQH8D9biezizeO/t7KnMC4117OKR3vf+CmtrZRmDGQFMtJZr
	7BvgCp+b8ooMvCNuJWO/K6zsR5FdQuAq5nxMEf7ypz0T4uxvmyXRl+rpv+EBGxQiy/sdfce07yQ
	25WTzjJ5OKhhDEFjPASn3ianIyEGAXSXGVvkJbiQ/n5zmMp0QzEQ4MHOV5NSm9BlMILXq4AzM2o
	D8FLQdmb/K8Jlaqzg+9kqNWczjOWf6nESenmPQuN51Z+LByOUIIP7zU/Bghl3l3PJjlyP1tD3Vf
	YxtjO/BTf7pMJPqDHuEPkHyVXfRN+XsWDIQzf3TrggakIDPYGToMy4hRdJRVmOYmfwCOjLMHdSU
	tZ7ug33lDmuHtCXXOvCnE36sRxTWWnXcMA01n7gwFUSowAfXCzzHRttYM08dn3iTNMSo3WF1ZDe
	N3IlpeIA5KDnT9Q0+pYKhumetbpnrdQoZHW0k=
X-Received: by 2002:ac8:5848:0:b0:50b:41b7:d6c2 with SMTP id d75a77b69052e-50ba39353a2mr51090371cf.47.1774642805313;
        Fri, 27 Mar 2026 13:20:05 -0700 (PDT)
X-Received: by 2002:ac8:5848:0:b0:50b:41b7:d6c2 with SMTP id d75a77b69052e-50ba39353a2mr51089891cf.47.1774642804764;
        Fri, 27 Mar 2026 13:20:04 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38c838931acsm506581fa.19.2026.03.27.13.20.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 13:20:03 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 27 Mar 2026 22:19:56 +0200
Subject: [PATCH v5 4/4] media: qcom: venus: flip the venus/iris switch
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260327-venus-iris-flip-switch-v5-4-2f4b6c636927@oss.qualcomm.com>
References: <20260327-venus-iris-flip-switch-v5-0-2f4b6c636927@oss.qualcomm.com>
In-Reply-To: <20260327-venus-iris-flip-switch-v5-0-2f4b6c636927@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5432;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=Sjkopt6DE1KjMmnlYS+KL4p1o+7A4uaEPfALTWUuNnQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpxuZr5r6OVOXEdzWas4EPQjAiJUEbw3UkgCdwv
 DATYz18u6qJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCacbmawAKCRCLPIo+Aiko
 1aIHB/0drkiE8COAyTwG3I6NtvLdH+wqx3VfHE525Wjy5OIjUKAZue4VLoohz4BpWNv9nEXuLW2
 mFNJQY/yKcJLvosOAAeugg0FyV5PZLxnFSAsivsgISS0+pO0w34ga/8PHZsFHv8RIm3ekO70nda
 y0VI+i23F46mD7qrYlet/PxsEd1sEcXNSvBx8FAxGcx536iAq+htojrmIHeCElT3gt530j1dXUp
 um9+5CATUhwKCQRmkYcf9PxO1K2eBfOsesEFaKi1XcWxUZ3/2OtLssi9kINQKofgaW9uksMml4t
 mPuxykXCqeOeXMTXwGGG8A4RnAkHjzEIJOOVrZkRQzvmB9Ua
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDE0MiBTYWx0ZWRfXy/L5L2Z6NAoN
 BPcPM9basabks+aSX3hki/9IRTTvksd/AcYWPAFIyUIpe5afmQMRxRxdtQnWJHlgaXtEkKC+Tvj
 v9EGUJK3fS12qRTqN0eCGzHzeSYDVke0ck9TLzu20Bbxt0DwgLb7damsPZgCRj0EVvjfZrWLz/K
 IDvunvqxe1LOxkbG4stmwAMMd8salsQOnv2LS+Oo1MQ4E/PLXH6emvXsGagasfzLqMJdaYBMdRL
 K1TNzIP14m0dYy9IRgadLEqWaT6Sy4HGn2Frtvz3GV+kpdYFVk0eX/jg5frzG6Y1PSDnqEVmiBE
 nd43IdnqTMkXWsBcFaMlaCnlnU+nT3M4NptPZG1t7T5pWFvmEfhx4EHw5WTnXN//MqStwRkvuR/
 sRv4N4SGAeEjsl2/MeGJqfZvUI/t1PP8kktN7KnMUdASOjAN5FnQRo9odteDrH3kI4UXqpwuX1B
 bUr/j0DPGJXaZkuq4gg==
X-Proofpoint-GUID: kJfgsHsyUi2Yl2Xy515U1NHJkVr3Y7Ht
X-Authority-Analysis: v=2.4 cv=M7RA6iws c=1 sm=1 tr=0 ts=69c6e676 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=PTCOktDilvW4XOe9n6IA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: kJfgsHsyUi2Yl2Xy515U1NHJkVr3Y7Ht
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-27_01,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 clxscore=1015 phishscore=0 adultscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603270142
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-57359-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,0.0.0.30:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6688034B0E1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

With the Iris and Venus driver having more or less feature parity for
"HFI 6xx" platforms and with Iris gaining support for SC7280, flip the
switch. Use Iris by default for SM8250 and SC7280, the platforms which
are supported by both drivers, and use Venus only if Iris is not
compiled at all. Use IS_ENABLED to strip out the code and data
structures which are used by the disabled platforms.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/Makefile     |  5 +----
 drivers/media/platform/qcom/iris/iris_probe.c |  2 --
 drivers/media/platform/qcom/venus/core.c      |  6 ++++++
 drivers/media/platform/qcom/venus/core.h      | 11 +++++++++++
 4 files changed, 18 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/Makefile b/drivers/media/platform/qcom/iris/Makefile
index 2abbd3aeb4af..2fde45f81727 100644
--- a/drivers/media/platform/qcom/iris/Makefile
+++ b/drivers/media/platform/qcom/iris/Makefile
@@ -10,6 +10,7 @@ qcom-iris-objs += iris_buffer.o \
              iris_hfi_gen2_packet.o \
              iris_hfi_gen2_response.o \
              iris_hfi_queue.o \
+             iris_platform_gen1.o \
              iris_platform_gen2.o \
              iris_power.o \
              iris_probe.o \
@@ -26,8 +27,4 @@ qcom-iris-objs += iris_buffer.o \
              iris_vpu_buffer.o \
              iris_vpu_common.o \
 
-ifeq ($(CONFIG_VIDEO_QCOM_VENUS),)
-qcom-iris-objs += iris_platform_gen1.o
-endif
-
 obj-$(CONFIG_VIDEO_QCOM_IRIS) += qcom-iris.o
diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
index ddaacda523ec..7b612ad37e4f 100644
--- a/drivers/media/platform/qcom/iris/iris_probe.c
+++ b/drivers/media/platform/qcom/iris/iris_probe.c
@@ -352,7 +352,6 @@ static const struct of_device_id iris_dt_match[] = {
 		.compatible = "qcom,qcs8300-iris",
 		.data = &qcs8300_data,
 	},
-#if (!IS_ENABLED(CONFIG_VIDEO_QCOM_VENUS))
 	{
 		.compatible = "qcom,sc7280-venus",
 		.data = &sc7280_data,
@@ -361,7 +360,6 @@ static const struct of_device_id iris_dt_match[] = {
 		.compatible = "qcom,sm8250-venus",
 		.data = &sm8250_data,
 	},
-#endif
 	{
 		.compatible = "qcom,sm8550-iris",
 		.data = &sm8550_data,
diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index 7e639760c41d..45ce57406a4e 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -949,6 +949,7 @@ static const struct venus_resources sc7180_res = {
 	.enc_nodename = "video-encoder",
 };
 
+#if (!IS_ENABLED(CONFIG_VIDEO_QCOM_IRIS))
 static const struct freq_tbl sm8250_freq_table[] = {
 	{ 0, 444000000 },
 	{ 0, 366000000 },
@@ -1069,6 +1070,7 @@ static const struct venus_resources sc7280_res = {
 	.dec_nodename = "video-decoder",
 	.enc_nodename = "video-encoder",
 };
+#endif
 
 static const struct bw_tbl qcm2290_bw_table_dec[] = {
 	{ 352800, 597000, 0, 746000, 0 }, /* 1080p@30 + 720p@30 */
@@ -1125,11 +1127,15 @@ static const struct of_device_id venus_dt_match[] = {
 	{ .compatible = "qcom,msm8998-venus", .data = &msm8998_res, },
 	{ .compatible = "qcom,qcm2290-venus", .data = &qcm2290_res, },
 	{ .compatible = "qcom,sc7180-venus", .data = &sc7180_res, },
+#if (!IS_ENABLED(CONFIG_VIDEO_QCOM_IRIS))
 	{ .compatible = "qcom,sc7280-venus", .data = &sc7280_res, },
+#endif
 	{ .compatible = "qcom,sdm660-venus", .data = &sdm660_res, },
 	{ .compatible = "qcom,sdm845-venus", .data = &sdm845_res, },
 	{ .compatible = "qcom,sdm845-venus-v2", .data = &sdm845_res_v2, },
+#if (!IS_ENABLED(CONFIG_VIDEO_QCOM_IRIS))
 	{ .compatible = "qcom,sm8250-venus", .data = &sm8250_res, },
+#endif
 	{ }
 };
 MODULE_DEVICE_TABLE(of, venus_dt_match);
diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
index 7506f5d0f609..c7acacaa53b8 100644
--- a/drivers/media/platform/qcom/venus/core.h
+++ b/drivers/media/platform/qcom/venus/core.h
@@ -54,8 +54,10 @@ enum vpu_version {
 	VPU_VERSION_AR50,
 	VPU_VERSION_AR50_LITE,
 	VPU_VERSION_IRIS1,
+#if (!IS_ENABLED(CONFIG_VIDEO_QCOM_IRIS))
 	VPU_VERSION_IRIS2,
 	VPU_VERSION_IRIS2_1,
+#endif
 };
 
 struct firmware_version {
@@ -525,13 +527,22 @@ struct venus_inst {
 #define IS_V1(core)	((core)->res->hfi_version == HFI_VERSION_1XX)
 #define IS_V3(core)	((core)->res->hfi_version == HFI_VERSION_3XX)
 #define IS_V4(core)	((core)->res->hfi_version == HFI_VERSION_4XX)
+#if (!IS_ENABLED(CONFIG_VIDEO_QCOM_IRIS))
 #define IS_V6(core)	((core)->res->hfi_version == HFI_VERSION_6XX)
+#else
+#define IS_V6(core)	(0)
+#endif
 
 #define IS_AR50(core)		((core)->res->vpu_version == VPU_VERSION_AR50)
 #define IS_AR50_LITE(core)	((core)->res->vpu_version == VPU_VERSION_AR50_LITE)
 #define IS_IRIS1(core)		((core)->res->vpu_version == VPU_VERSION_IRIS1)
+#if (!IS_ENABLED(CONFIG_VIDEO_QCOM_IRIS))
 #define IS_IRIS2(core)		((core)->res->vpu_version == VPU_VERSION_IRIS2)
 #define IS_IRIS2_1(core)	((core)->res->vpu_version == VPU_VERSION_IRIS2_1)
+#else
+#define IS_IRIS2(core)		(0)
+#define IS_IRIS2_1(core)	(0)
+#endif
 
 static inline bool is_lite(struct venus_core *core)
 {

-- 
2.47.3


