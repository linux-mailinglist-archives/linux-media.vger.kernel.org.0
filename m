Return-Path: <linux-media+bounces-51493-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KMj3MGEhdmndMAEAu9opvQ
	(envelope-from <linux-media+bounces-51493-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 25 Jan 2026 14:57:53 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B04D80DD7
	for <lists+linux-media@lfdr.de>; Sun, 25 Jan 2026 14:57:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 901C13006511
	for <lists+linux-media@lfdr.de>; Sun, 25 Jan 2026 13:57:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BE303242D2;
	Sun, 25 Jan 2026 13:57:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iMeKPOEL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iFzmLsS6"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CE7631ED7C
	for <linux-media@vger.kernel.org>; Sun, 25 Jan 2026 13:57:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769349459; cv=none; b=QRshRobHjYoK14YPp+22ZSgQ+PEqAKSlEYhP1go8bSBlVW8QmM13DNcCzNb2q3cfEO71WeEta8gb+mrRMfoD33JRq/wcFP+3PY2DImNVjcv8NK30BUMp7ADw8jJ49pfcbNQxEC4js7I8hgDhORNKx7iT2omm1pSYGjihPt7Nhes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769349459; c=relaxed/simple;
	bh=Bmf9KEkMp4HJCg1ZJJDbmmSwGBTwEzmFyX3bT3VUuIk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KyidGu1sHvh43jB8haD6oBj128HjvrRAuTpjH1jIuWY2T3WfIxLABYtIYMoJAOVzYqqA4hz37ifvBHIlOHcKInooYHlIum+b/Y8DlAPf8+VSyT9lnw5Q+pQCBSqmiZzyOSkL+4pPcKbRrR9BinM8KUiVceNo92QlNtzw7Tlke+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iMeKPOEL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iFzmLsS6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60P2Lsvq1919759
	for <linux-media@vger.kernel.org>; Sun, 25 Jan 2026 13:57:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JArmttMS0xgGKN3K5jgd2M6cFrUBTdyxOVP5jaPlnSA=; b=iMeKPOELxZasZmmg
	5NVVY56b72MXP6GL8wgD4K4OhBHznLbVoQC4arteotaQ2LV3mfrY3ZuWAyQ4PO/A
	WbeV/HF/pjCKlXiEKTsCX0icGz6XohEfRwhEdpwAcDXv8nbN6FHLuvyOmB7uJUe+
	BpAosFByPVOfC/Dy6PCP2YbC69jSUXUUGiIIXiPWPAAMEeEIfO6vDCIYRkTVtyYx
	nZs+ojHsWQg+3XLXBpYZEYngMxIhtiwx2xPrXWoMKpou++UqB1tPxgUJId59Jhpa
	5B6iG6BJTggNUZSjvjnicXRsrYNL9kuFH1PYcOK1ekBQ9zwhTiiSvZF6TpZEV57Y
	/+KXjA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bvq6xt6en-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sun, 25 Jan 2026 13:57:36 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c52fd4cca2so1166517285a.3
        for <linux-media@vger.kernel.org>; Sun, 25 Jan 2026 05:57:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769349456; x=1769954256; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JArmttMS0xgGKN3K5jgd2M6cFrUBTdyxOVP5jaPlnSA=;
        b=iFzmLsS63Q12bcMDJBG9xu/YudOjGCQmf3Tcdd9y8VB60H2LaPE653yWDVURILmsmy
         M/3sMOxjEJKt5nnZ9XSnOW/7NG44hm2J/5P6hSk2jJ1rmczINcY9PWN/vCexibeyYy/Y
         a01aHyMpkk5QQbcXbEMxb/5uHCoRsQNoWDWluMdifOiTIsTHaegZhh9vZtWwC2Pk1VjN
         gjOWzb5Cqcxx3z0CDvkh1bmkszeZaRfsuooG7TfFo5+QKkED1AgOx+2z3v9qEHOZJCn7
         SqbyxcoTLy9VYmnRbkMB/8Lc66oHHPgJO4ZXaQhfDCUZLlylDKRbCYVOde7FmNutMDlq
         LCDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769349456; x=1769954256;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JArmttMS0xgGKN3K5jgd2M6cFrUBTdyxOVP5jaPlnSA=;
        b=w/AVrb7H5n9eLt7G8P8uLOgLF41DpSAlLKvKKyEyuIgWQzRh5xuNRTkNzXmlk4XwKx
         UOL89bhaQxBbqFxalbGB9RaN9TmlbzYCQmWkygPtjuAuoMHXlJvFQVkpg09RCyv0so6m
         wBeoLgRnaiknkrwwVT9Gt0brCqAKOMBzhqnf/MpB5+kvbdjo3XNWFm5zCOvjdiA8XN0s
         4vVr3oX0O+k4Rgd2BpeZbut8+MwuJlxdzZwKkdkSWnfTbGK9ZftrnI3K45Os6hTj6voi
         JLB/42W7zl4qy1JkrXoe6+fH7z/y2XA0fuQwKa4qvfbIEblt3KY/6R0bfYkM71qOsFlh
         JnKA==
X-Gm-Message-State: AOJu0Yxd5MnsRH6Te697zXf1wOkn02J+CLyZBGEC2my2XmNSnsD8v51c
	1T5zkVB0CwDBzz0UcqBNUNeoTcrnOZJU/hZuRHezM7Zi7CD7kg7pbiVXzE18GOLjygeZkFzibGQ
	zg1OhcyNa1sWhvYkamzi1EWpFqqEylNPxj8C3hZJas0F4Lks3CSDwpK8+qr1p2qQrNQ==
X-Gm-Gg: AZuq6aLM1LbiyL6HBbjrbKMVl7XHIpT9vLqtF+T2ApzQ/4l0joab+WiwVBH767TNuQP
	msWEZK74n3ilnXtIKC63cdzhzbjeWQcLhspw97aVV6JXbIs+clPO4B6LCM8Ou70jbPUKFK2Wn/n
	ZNycqtueZhTxjIUI4s/+Ub05SRGKw817baHN+wzC9Yv7Gy39BjRXRW4WsAg6NjeQ8Mv/UPrlAho
	ETSYwHwR2tr2LxepiVpRm7DrmHgYlhoby7P/3mElmsgsjKbNZkvHv7IVNVAWAo5Y8JCGZwKkx8m
	fWSLSZIyct2plVRgVJWNSnwgf1FjG9hHVuq1AI1Kiebt9E7daee6gYdyE0Urf98KD2CwDx3RZVJ
	PiWmVXTeyDg+D0Flt1fwa1ZAPqpy1UDzU0DT30DYMB05cGuB6h6POomJK6kNSxKqbSbXo8bSwwn
	uPkprECNP4CLUeM7CYONLUHeE=
X-Received: by 2002:a05:620a:172a:b0:8c6:ac96:f5e5 with SMTP id af79cd13be357-8c6f96e6cdemr165888685a.83.1769349455793;
        Sun, 25 Jan 2026 05:57:35 -0800 (PST)
X-Received: by 2002:a05:620a:172a:b0:8c6:ac96:f5e5 with SMTP id af79cd13be357-8c6f96e6cdemr165885785a.83.1769349455371;
        Sun, 25 Jan 2026 05:57:35 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59de4918a3asm2033621e87.52.2026.01.25.05.57.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jan 2026 05:57:34 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 25 Jan 2026 15:57:25 +0200
Subject: [PATCH v2 2/7] media: iris: introduce SM8350 and SC8280XP support
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260125-iris-sc8280xp-v2-2-552cdc3ea691@oss.qualcomm.com>
References: <20260125-iris-sc8280xp-v2-0-552cdc3ea691@oss.qualcomm.com>
In-Reply-To: <20260125-iris-sc8280xp-v2-0-552cdc3ea691@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bjorn Andersson <andersson@kernel.org>,
        David Heidelberg <david@ixit.cz>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Johan Hovold <johan+linaro@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=8971;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=Bmf9KEkMp4HJCg1ZJJDbmmSwGBTwEzmFyX3bT3VUuIk=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpdiFG3vtiAwE2ORbAocfg/zEuBuilQzilUhpHZ
 3NON3WZqbOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaXYhRgAKCRCLPIo+Aiko
 1YecB/9Xx9OT7arA2j0kx7Z4ehxPc/XzLjwjW7q5PklC3yBtNDUUB790T+SJJyyGywe/w6rJUHy
 TNQXS2c0ftf7vjPmmZK9BtWZqbXbRqoAOGxffR1LenQ752KyeQKLD4eQcebx5yfHji+O3pqgNxo
 UqGDhg6yKMKr367wQ8ziUrNm6RAfalfxIxOwRnpXu3YVcFnMdLD2jyopUl27/rJtIhmM+WyP0nz
 UxUxKmbVYl9cx5MpWZfCHuG6gfhnNPgk6b5Ke0EtOpj9FghLUGh9g4KlklVzuwVz2+VnJRm/Hb5
 5pECWY5aRkF0GgfYSiSwDt6/xlpXRv9VMcJ3+HS5IIE17uFE
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: Js7uFBmXdkJNxnjvCN1vPs7KhMwOK8RI
X-Proofpoint-ORIG-GUID: Js7uFBmXdkJNxnjvCN1vPs7KhMwOK8RI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI1MDExNSBTYWx0ZWRfX7i2OormVCew/
 mxQYgPsNJPSjxcSG+QNq0NXaIjuUaeif78/LqMtCDBAIGkKxK2eAyBrWpuUlHohUYdzpC2lyUPQ
 /OwkSCffphxvBqJpGyrB5O8BBy1+spt1JBf1hEn2FsE4fGCvsde1UBjKw7AZRPSGFXn5xz5WfZf
 j5EcK5e+Oelw1/dtTrxfo+W0GmLv/41c5+PQgDPB+q8QK1qPKBZsXPz1vsFlfH2Kv8DxPD1lzNQ
 Q6oIu33d0EGJxvE874ACeXknOFluI9cAssy5+hd8RSEdX2+lzLmg3V7m8/Os3UMldp5ZGtp5TO4
 rw4Dho1h7qsA+0/se/h956a8upN0a9PQcOt5nDuzkzkKpUNStfXICLKOIqdP1ai8cDRMBFVmkY+
 8nDKF+mQPBbhOc0cEKIbTbkz1oIYTNktgR1E5ieOaa7MCKS1lFEgxr7+ftlwh922C5mn+mmhyxL
 J5xt8UBXuTmneA/DqRw==
X-Authority-Analysis: v=2.4 cv=Htd72kTS c=1 sm=1 tr=0 ts=69762150 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=UUdjpNFb6dwvVqmIGXgA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-25_03,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 suspectscore=0 priorityscore=1501 spamscore=0
 phishscore=0 clxscore=1015 adultscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601250115
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	TAGGED_FROM(0.00)[bounces-51493-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt,linaro];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6B04D80DD7
X-Rspamd-Action: no action

SM8350 and SC8280XP have an updated version of the Iris2 core also
present on the SM8250 and SC7280 platforms. Add necessary platform data
to utilize the core on those two platforms.

The iris_platform_gen1.c is now compiled unconditionally, even if Venus
driver is enabled, but SM8250 and SC7280 are still disabled in
iris_dt_match.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/Makefile          |   5 +-
 .../platform/qcom/iris/iris_platform_common.h      |   2 +
 .../media/platform/qcom/iris/iris_platform_gen1.c  | 111 +++++++++++++++++++++
 drivers/media/platform/qcom/iris/iris_probe.c      |  10 ++
 4 files changed, 124 insertions(+), 4 deletions(-)

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
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index 5a489917580e..49dba0f50988 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -43,7 +43,9 @@ enum pipe_type {
 
 extern const struct iris_platform_data qcs8300_data;
 extern const struct iris_platform_data sc7280_data;
+extern const struct iris_platform_data sc8280xp_data;
 extern const struct iris_platform_data sm8250_data;
+extern const struct iris_platform_data sm8350_data;
 extern const struct iris_platform_data sm8550_data;
 extern const struct iris_platform_data sm8650_data;
 extern const struct iris_platform_data sm8750_data;
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen1.c b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
index df8e6bf9430e..c99ff4d4644d 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen1.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
@@ -14,6 +14,7 @@
 #include "iris_instance.h"
 
 #include "iris_platform_sc7280.h"
+#include "iris_platform_sm8350.h"
 
 #define BITRATE_MIN		32000
 #define BITRATE_MAX		160000000
@@ -392,6 +393,61 @@ const struct iris_platform_data sm8250_data = {
 	.enc_ip_int_buf_tbl_size = ARRAY_SIZE(sm8250_enc_ip_int_buf_tbl),
 };
 
+const struct iris_platform_data sm8350_data = {
+	.get_instance = iris_hfi_gen1_get_instance,
+	.init_hfi_command_ops = &iris_hfi_gen1_command_ops_init,
+	.init_hfi_response_ops = iris_hfi_gen1_response_ops_init,
+	.get_vpu_buffer_size = iris_vpu_buf_size,
+	.vpu_ops = &iris_vpu2_ops,
+	.set_preset_registers = iris_set_sm8350_preset_registers,
+	.icc_tbl = sm8250_icc_table,
+	.icc_tbl_size = ARRAY_SIZE(sm8250_icc_table),
+	.clk_rst_tbl = sm8350_clk_reset_table,
+	.clk_rst_tbl_size = ARRAY_SIZE(sm8350_clk_reset_table),
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
+	.fwname = "qcom/vpu/vpu20_p4.mbn",
+	.pas_id = IRIS_PAS_ID,
+	.inst_iris_fmts = platform_fmts_sm8250_dec,
+	.inst_iris_fmts_size = ARRAY_SIZE(platform_fmts_sm8250_dec),
+	.inst_caps = &platform_inst_cap_sm8250,
+	.inst_fw_caps_dec = inst_fw_cap_sm8250_dec,
+	.inst_fw_caps_dec_size = ARRAY_SIZE(inst_fw_cap_sm8250_dec),
+	.inst_fw_caps_enc = inst_fw_cap_sm8250_enc,
+	.inst_fw_caps_enc_size = ARRAY_SIZE(inst_fw_cap_sm8250_enc),
+	.tz_cp_config_data = tz_cp_config_sm8250,
+	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_sm8250),
+	.hw_response_timeout = HW_RESPONSE_TIMEOUT_VALUE,
+	.num_vpp_pipe = 4,
+	.max_session_count = 16,
+	.max_core_mbpf = NUM_MBS_8K,
+	.max_core_mbps = ((7680 * 4320) / 256) * 60,
+	.dec_input_config_params_default =
+		sm8250_vdec_input_config_param_default,
+	.dec_input_config_params_default_size =
+		ARRAY_SIZE(sm8250_vdec_input_config_param_default),
+	.enc_input_config_params = sm8250_venc_input_config_param,
+	.enc_input_config_params_size =
+		ARRAY_SIZE(sm8250_venc_input_config_param),
+
+	.dec_ip_int_buf_tbl = sm8250_dec_ip_int_buf_tbl,
+	.dec_ip_int_buf_tbl_size = ARRAY_SIZE(sm8250_dec_ip_int_buf_tbl),
+	.dec_op_int_buf_tbl = sm8250_dec_op_int_buf_tbl,
+	.dec_op_int_buf_tbl_size = ARRAY_SIZE(sm8250_dec_op_int_buf_tbl),
+
+	.enc_ip_int_buf_tbl = sm8250_enc_ip_int_buf_tbl,
+	.enc_ip_int_buf_tbl_size = ARRAY_SIZE(sm8250_enc_ip_int_buf_tbl),
+};
+
 const struct iris_platform_data sc7280_data = {
 	.get_instance = iris_hfi_gen1_get_instance,
 	.init_hfi_command_ops = &iris_hfi_gen1_command_ops_init,
@@ -446,3 +502,58 @@ const struct iris_platform_data sc7280_data = {
 	.enc_ip_int_buf_tbl = sm8250_enc_ip_int_buf_tbl,
 	.enc_ip_int_buf_tbl_size = ARRAY_SIZE(sm8250_enc_ip_int_buf_tbl),
 };
+
+const struct iris_platform_data sc8280xp_data = {
+	.get_instance = iris_hfi_gen1_get_instance,
+	.init_hfi_command_ops = &iris_hfi_gen1_command_ops_init,
+	.init_hfi_response_ops = iris_hfi_gen1_response_ops_init,
+	.get_vpu_buffer_size = iris_vpu_buf_size,
+	.vpu_ops = &iris_vpu2_ops,
+	.set_preset_registers = iris_set_sm8350_preset_registers,
+	.icc_tbl = sm8250_icc_table,
+	.icc_tbl_size = ARRAY_SIZE(sm8250_icc_table),
+	.clk_rst_tbl = sm8350_clk_reset_table,
+	.clk_rst_tbl_size = ARRAY_SIZE(sm8350_clk_reset_table),
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
+	.fwname = "qcom/vpu/vpu20_p2.mbn",
+	.pas_id = IRIS_PAS_ID,
+	.inst_iris_fmts = platform_fmts_sm8250_dec,
+	.inst_iris_fmts_size = ARRAY_SIZE(platform_fmts_sm8250_dec),
+	.inst_caps = &platform_inst_cap_sm8250,
+	.inst_fw_caps_dec = inst_fw_cap_sm8250_dec,
+	.inst_fw_caps_dec_size = ARRAY_SIZE(inst_fw_cap_sm8250_dec),
+	.inst_fw_caps_enc = inst_fw_cap_sm8250_enc,
+	.inst_fw_caps_enc_size = ARRAY_SIZE(inst_fw_cap_sm8250_enc),
+	.tz_cp_config_data = tz_cp_config_sm8250,
+	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_sm8250),
+	.hw_response_timeout = HW_RESPONSE_TIMEOUT_VALUE,
+	.num_vpp_pipe = 2,
+	.max_session_count = 16,
+	.max_core_mbpf = NUM_MBS_8K,
+	.max_core_mbps = ((7680 * 4320) / 256) * 60,
+	.dec_input_config_params_default =
+		sm8250_vdec_input_config_param_default,
+	.dec_input_config_params_default_size =
+		ARRAY_SIZE(sm8250_vdec_input_config_param_default),
+	.enc_input_config_params = sm8250_venc_input_config_param,
+	.enc_input_config_params_size =
+		ARRAY_SIZE(sm8250_venc_input_config_param),
+
+	.dec_ip_int_buf_tbl = sm8250_dec_ip_int_buf_tbl,
+	.dec_ip_int_buf_tbl_size = ARRAY_SIZE(sm8250_dec_ip_int_buf_tbl),
+	.dec_op_int_buf_tbl = sm8250_dec_op_int_buf_tbl,
+	.dec_op_int_buf_tbl_size = ARRAY_SIZE(sm8250_dec_op_int_buf_tbl),
+
+	.enc_ip_int_buf_tbl = sm8250_enc_ip_int_buf_tbl,
+	.enc_ip_int_buf_tbl_size = ARRAY_SIZE(sm8250_enc_ip_int_buf_tbl),
+};
diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
index ddaacda523ec..10b00d9808d2 100644
--- a/drivers/media/platform/qcom/iris/iris_probe.c
+++ b/drivers/media/platform/qcom/iris/iris_probe.c
@@ -357,11 +357,21 @@ static const struct of_device_id iris_dt_match[] = {
 		.compatible = "qcom,sc7280-venus",
 		.data = &sc7280_data,
 	},
+#endif
+	{
+		.compatible = "qcom,sc8280xp-venus",
+		.data = &sc8280xp_data,
+	},
+#if (!IS_ENABLED(CONFIG_VIDEO_QCOM_VENUS))
 	{
 		.compatible = "qcom,sm8250-venus",
 		.data = &sm8250_data,
 	},
 #endif
+	{
+		.compatible = "qcom,sm8350-venus",
+		.data = &sm8350_data,
+	},
 	{
 		.compatible = "qcom,sm8550-iris",
 		.data = &sm8550_data,

-- 
2.47.3


