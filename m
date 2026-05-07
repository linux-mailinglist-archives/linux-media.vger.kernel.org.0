Return-Path: <linux-media+bounces-60692-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wNwEIsDm+2kaHwAAu9opvQ
	(envelope-from <linux-media+bounces-60692-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 03:11:28 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EF97E4E1DBA
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 03:11:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B6C1A302FA3D
	for <lists+linux-media@lfdr.de>; Thu,  7 May 2026 01:11:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF0FB254AFF;
	Thu,  7 May 2026 01:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HmE4suFL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jlrkzceR"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE434245008
	for <linux-media@vger.kernel.org>; Thu,  7 May 2026 01:10:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778116254; cv=none; b=oCg4dm8zWK4VAxp5Q9wvEir0TZomQ+RkLZyn75R3sRFmkjLO4RfkHVMSx13wpoKSQipdCplFqcQ+vf2D6WNw4Um8nQf8cMM4oJAPcCh5GDFOqMbAjrHWJRmDfUM0D9BicgUN70QPWTezIOy1ZhqcS4JRvmei45Lxv4mgs0/2JXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778116254; c=relaxed/simple;
	bh=mcq8fy61nNX/KrrW1JUbvq89CB28wRxCq24uyk1o/ls=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fS/hFjrXF9hGwHTdnPy4mZce6MLNCnxCpui77GwAA3WWGOksgxwIFyCZI5JcuH0VNSSLFvj4KPLeCTuiZhG6rSXnMwJa6MGdojtE5oqUmMxoICKkPdn/lSfNTc3CK6+5q5gagpXt/izjDP530LGFPYl7G2i48bm/s+qcUcFVViQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HmE4suFL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jlrkzceR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 646JuMpv3924293
	for <linux-media@vger.kernel.org>; Thu, 7 May 2026 01:10:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bra7g2q0HW951sIO8bL8XJstduNpKmclsTNcEgSH384=; b=HmE4suFL6jSUT4uU
	SudBvpmnnUrwtQyCrnx1DbiC4j3ZJDYAFd/wSw1CunBkmUBoUhLfSJFCoFHiORks
	I7ZjDHliT6G8Sh/S6Zdp5Wt3+tjJuhjmTxJt4/aZgOxKCRYjKJZ92DBXXSgQwtYM
	2y5eVR6gXTUaHOs+HFNgYcc6jvnTPF2KB1eKrqZ9rMQhF9lS3pVWTpfSagsFgEf4
	YwyVeQZel7fEgF7lAvippSK4Y9x4rSojjFyuF+owZZHcN6vMyIAEN1qYJgRW+lsa
	92/wyhwerFzLgNZkORh49XxJJqzwd2/9ImndZSf/mEC6iHbd9Hnc0zeHvPOWknDT
	7C9Fkg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0c888u62-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 07 May 2026 01:10:51 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50d84b5f73bso8916181cf.0
        for <linux-media@vger.kernel.org>; Wed, 06 May 2026 18:10:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778116251; x=1778721051; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bra7g2q0HW951sIO8bL8XJstduNpKmclsTNcEgSH384=;
        b=jlrkzceRRt/YNzW692VD6Zcv9tb/zLXktLq/4igK8KTHYyn+6H1bxPOqXGotijIjYv
         Td9NQVauBTl1iOH3bogSysk5p9doZpVBRozw6bJ9PF9dn9ZNdyJ7HokRRJBpiAuGBOEk
         xonJT328u4qtRRNgMmBDUZrrGz7pQToOQjFtn4acSsnSFFhd7cgn1KAJhu815nrri07k
         58YSPN7IWzulOwwT+IRq9mbJuan+wZvgZ11/PY6lChgqNLDOr8KyxbRJIG0QN5vj4X6s
         UCoUjUKBYPkURYXL6nmOLGdrg5CP9peUTd1kFcc7ls4B6hmAmwaEsVu/5KIoKO3t+H+W
         ugJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778116251; x=1778721051;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bra7g2q0HW951sIO8bL8XJstduNpKmclsTNcEgSH384=;
        b=AZqgguazHn5XwpuLzNTfUR6P0fFM6t30e9DSI2no8KxjkWyORVE9/ZC4DlOUBBXPtY
         P4Ls3/NkR4OBB1d0NFz9+Zo6qwrkMfyKSTENX62nE8ZtMl1pgqBGZJi7MmapFRb5KJn8
         ki2v5j3mwBhxglTEELro2TRzlQ8UDAoM2k4+gXTmwEwwV1E/2d6TiAZy9nfwZe2uW833
         qG4QlhGkS25JYwNMKmLL/Dy2ZzywIyOm17VZ+LQVA2/mE4GzACSAG4Trs7NwROF0iVQF
         sSe2l3QIHRtAj5tYqazsOd6vEBLtcOx+jKNQcxvK9422WkFLnbt0FLS4UhcrtPYna6k2
         I3zw==
X-Forwarded-Encrypted: i=1; AFNElJ+ARY7f1lZkY9YtkqnHkVK1Lwz2S9dqVRjr4wwzv66oW0/vNZHD5kGom9hJYyrtVB5K2SbQea0y0lUR+w==@vger.kernel.org
X-Gm-Message-State: AOJu0YwH/5rOdLowwS23PTDpIwKyv0rYGb38SKuZnKL5pjtJEQpsH/v8
	y8l9X/bbJXeYgOMfA59qtJrgbH7OQaAviLcq35yojX5P/LNruNNvYvlsxwTg6n9fbtMgfdNTYhm
	q1sqryfL70kgveWgK2FZyvNizTu1Zf9QkOpfcJSIqKmb4515TLvxiWNma9ygctTLyLg==
X-Gm-Gg: AeBDies8c5yODvFms2+mg9Cn/2noisRzZSZy81NYo6Ta656tEq+4myW5xupvuXVP8oI
	J2oRH3MprYrbSJE9GzhyLR4CDpQXBbb5Y630ig/LFYjjaarmndjckJAreASH0D5xBv8ZOo55dkU
	U3f1R61Y+swgjnQNF2g3bKZRowb2JuLqI45PXLIjx6brS1Y4o2mudxRrkbIcBCeBvRMN+7NVjVD
	hi0Z7M8HwHsHGSuu8jn2zzbyyVTw6PBOF6Ot/of/2dqjXc7Ltf6ABnarjp7ZZ+ZSyfPEGYI9sg8
	JHNggMB4Fgm9l0TmARb2q3g4Zm2YWvzbii2skSZsV5Z5aW795yBN7bG/BiK47ky9sADZ4/2eYS4
	8s0GseUtPuH+dKisC9pUeVkKBxkAvkbedU1pUphI0sxpNlrbuiWaCm5Y6lA4RODMq0JRFrSQvSG
	vU25F/dtqoaeBGNc0qz2VxvnhP4BAlXW9wJ1L1uZRr6D7mJEAUyMEeXPmw
X-Received: by 2002:ac8:5952:0:b0:509:4198:5468 with SMTP id d75a77b69052e-51461c1e10dmr86160351cf.8.1778116251079;
        Wed, 06 May 2026 18:10:51 -0700 (PDT)
X-Received: by 2002:ac8:5952:0:b0:509:4198:5468 with SMTP id d75a77b69052e-51461c1e10dmr86159891cf.8.1778116250603;
        Wed, 06 May 2026 18:10:50 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a85c230e00sm5221967e87.29.2026.05.06.18.10.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 18:10:48 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 07 May 2026 04:10:40 +0300
Subject: [PATCH v5 1/7] media: iris: retrieve UBWC platform configuration
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260507-iris-ubwc-v5-1-e9a3aee53c49@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3331;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=mcq8fy61nNX/KrrW1JUbvq89CB28wRxCq24uyk1o/ls=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBp++aUuM5v4RogJfQkV3BmKwBztUcMWiNXUwe+5
 yNCUV+TVLaJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCafvmlAAKCRCLPIo+Aiko
 1ZWPB/47QjrczU8G247AzlV+ITfriITNk8BpRACt9S6dyVshzhlADn0Mlv2DUXPLylF+7eVQz4F
 1u0MtEydrPxGXo2/76J5J7R/v2opSTw9lc3em85NbyIiv4q3Mw7B1qyxb30DKI4qnH0qJw1snYO
 U/8VlPbI2DOBoKJYMFsQAn1rYasOGMqbpIhq7uQsw3kyfy6nWnZ70bZHW3e0l4Oz2j0Kzv4wqdQ
 aNhLSj2I5KQWfcDrA3x6S6GtKrYOGFQ8f0cZGvtyATTz41J7GY1UaIEtMk4kpiQRb9Zvg2fpNhB
 IE87F20jhPz+D3p1Mqn+ocyEfGcosaW++bdLIflSzST8ErUy
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: xxyMfUHf_fX8qXmDgRWQ8N7KoR9UkAA0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDAwOSBTYWx0ZWRfXy1BD0OldW7XO
 /aNhViUCMmxivP0xfqH9WKwzsEhVqZiLUv07vk+PF5xmTOCrbqacG3wpq2a8cmfFazbMTVYRXdO
 /6fQ0KWbYyMRuTazQ2pNPINCFECFNJu5NhPjx8hdYMAtEViO4wZD55QJuYjgjtXDAPlNDZBW69d
 Q9fHNgPIiguGX6g0TxNmmPQc2MJZFuUhvFbg+4kGB3RPqRT0FAyUWcWJSrdTupv/OoW1lT5LLHk
 upW9L6rkXxgCEWo9mNqG0bhHE4q0cRZyisZR51icq1xUOhbA34SY9VTL14Dk9giLq1M+tTmwxdx
 ACzUF9AFdKv+ayzD01wuWm8NtPgaDouHTZMQjrJ5r+Mtr7nds4Eyc23I/EOrUlYL4N5ki0RZmeD
 rjJ2/3XEecS8ROW4r71mBokittln+tiG8noTTiZvjKgCd5hMrUR1ORy/xjmNqzo0pxOUFTQVHcE
 yW/o46F0YY7I2aYzAyg==
X-Proofpoint-GUID: xxyMfUHf_fX8qXmDgRWQ8N7KoR9UkAA0
X-Authority-Analysis: v=2.4 cv=X8Zi7mTe c=1 sm=1 tr=0 ts=69fbe69b cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=KZIT3C-7-F78qrtZtU8A:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 spamscore=0 adultscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070009
X-Rspamd-Queue-Id: EF97E4E1DBA
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60692-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,oss.qualcomm.com,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
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

Specifying UBWC data in each driver doesn't scale and is prone to
errors. Request UBWC data from the central database in preparation to
using it through the rest of the driver.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Tested-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/Kconfig      | 1 +
 drivers/media/platform/qcom/iris/iris_core.h  | 4 ++++
 drivers/media/platform/qcom/iris/iris_probe.c | 5 +++++
 3 files changed, 10 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/Kconfig b/drivers/media/platform/qcom/iris/Kconfig
index 3c803a05305a..39b06de6c3e6 100644
--- a/drivers/media/platform/qcom/iris/Kconfig
+++ b/drivers/media/platform/qcom/iris/Kconfig
@@ -5,6 +5,7 @@ config VIDEO_QCOM_IRIS
         select V4L2_MEM2MEM_DEV
         select QCOM_MDT_LOADER if ARCH_QCOM
         select QCOM_SCM
+        select QCOM_UBWC_CONFIG
         select VIDEOBUF2_DMA_CONTIG
         help
           This is a V4L2 driver for Qualcomm iris video accelerator
diff --git a/drivers/media/platform/qcom/iris/iris_core.h b/drivers/media/platform/qcom/iris/iris_core.h
index fb194c967ad4..d10a03aa5685 100644
--- a/drivers/media/platform/qcom/iris/iris_core.h
+++ b/drivers/media/platform/qcom/iris/iris_core.h
@@ -30,6 +30,8 @@ enum domain_type {
 	DECODER	= BIT(1),
 };
 
+struct qcom_ubwc_cfg_data;
+
 /**
  * struct iris_core - holds core parameters valid for all instances
  *
@@ -52,6 +54,7 @@ enum domain_type {
  * @resets: table of iris reset clocks
  * @controller_resets: table of controller reset clocks
  * @iris_platform_data: a structure for platform data
+ * @ubwc_cfg: UBWC configuration for the platform
  * @state: current state of core
  * @iface_q_table_daddr: device address for interface queue table memory
  * @sfr_daddr: device address for SFR (Sub System Failure Reason) register memory
@@ -95,6 +98,7 @@ struct iris_core {
 	struct reset_control_bulk_data		*resets;
 	struct reset_control_bulk_data		*controller_resets;
 	const struct iris_platform_data		*iris_platform_data;
+	const struct qcom_ubwc_cfg_data		*ubwc_cfg;
 	enum iris_core_state			state;
 	dma_addr_t				iface_q_table_daddr;
 	dma_addr_t				sfr_daddr;
diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
index ddaacda523ec..492f85f518eb 100644
--- a/drivers/media/platform/qcom/iris/iris_probe.c
+++ b/drivers/media/platform/qcom/iris/iris_probe.c
@@ -10,6 +10,7 @@
 #include <linux/pm_opp.h>
 #include <linux/pm_runtime.h>
 #include <linux/reset.h>
+#include <linux/soc/qcom/ubwc.h>
 
 #include "iris_core.h"
 #include "iris_ctrls.h"
@@ -244,6 +245,10 @@ static int iris_probe(struct platform_device *pdev)
 
 	core->iris_platform_data = of_device_get_match_data(core->dev);
 
+	core->ubwc_cfg = qcom_ubwc_config_get_data();
+	if (IS_ERR(core->ubwc_cfg))
+		return PTR_ERR(core->ubwc_cfg);
+
 	ret = devm_request_threaded_irq(core->dev, core->irq, iris_hfi_isr,
 					iris_hfi_isr_handler, IRQF_TRIGGER_HIGH, "iris", core);
 	if (ret)

-- 
2.47.3


