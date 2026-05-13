Return-Path: <linux-media+bounces-61435-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UBZxLbt1BGqdJwIAu9opvQ
	(envelope-from <linux-media+bounces-61435-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 14:59:39 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 366CE5337A6
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 14:59:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 068F031DE0F7
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 12:52:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33E1B47DFB6;
	Wed, 13 May 2026 12:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BJVLcoDj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WDSV6x+D"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11778478E5D
	for <linux-media@vger.kernel.org>; Wed, 13 May 2026 12:49:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778676577; cv=none; b=ZAJKj7Tlu7X08qSSC3ECZ5fBI10ZBonxDiHhsTKmT+w+2mpQ2xkkcN+egHOmV0p9MxUt4/aiVeLvOr8JWFDxpOhJ4NF52BVDuJkITed8lTw6Xn1QDgw8DFGnBkrsrhHVkx1zcDFTgHW6rWgnymiO/EugmDZk1k9o2cJwqMZmw34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778676577; c=relaxed/simple;
	bh=PZMTLxLwbvZOwA8LX8WRjQ2jAtxisx1shd7n6n36z4Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PbKebD4GpZEZLZupKvX3lYGOzCVUj1t0+Xqo7Yu2kri4n6Szs60UGEmzEwvzU87ifLJ3ceURhzcimSdosuV/Rj6HCe0Pza+kCwA4JBhEAj8Xi4N2F+Q80Zf5PrBI5YYjNnr9hE1SyYjkS1O2swb2MkQsYwO0H2jgAddKNtixaJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BJVLcoDj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WDSV6x+D; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DAWD2d2321248
	for <linux-media@vger.kernel.org>; Wed, 13 May 2026 12:49:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cruwuhjqGa0rMbt22zZ45ZYZ3826Tz+/AC4t/AIJui4=; b=BJVLcoDjbkZ7BvQC
	//hNu/ZkUIPjIMYvWSuK+RMfjekXDozwxoyXJmniYpeCD2fKIQbT7o4FUj3as+Tq
	m9H1ewYxvlGf/k8ZwvJgD1In67oSKj+jw/aoJua7hWVZT+u4EcNyrMPGDDHxZRIk
	HBDkFjzex1whHAcnScdt75+6aoiB6i5MMQ+qYaKLrPC2DERpa7oNbkdXvR9DMsdV
	bk0oWOgcIo+NEFJHgpD7E92tl3u6KRZoQcTGmkY1XtFihbPC1FKA7Fun2O+jQWRB
	XnMhm87QZUWMB9eTra7DiIpQh8FHWDRS5vU5zb24dTyraG9N6pVW+O4TqPbqP2u1
	9MFj2g==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4hgu9y2f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 13 May 2026 12:49:30 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50ff0bef198so136391001cf.2
        for <linux-media@vger.kernel.org>; Wed, 13 May 2026 05:49:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778676569; x=1779281369; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cruwuhjqGa0rMbt22zZ45ZYZ3826Tz+/AC4t/AIJui4=;
        b=WDSV6x+Dyh6oqFH7ReCqbl/a9zUQH7VawINYxFPoLMJL9qWnVYZ4DazaBu2sYOis2X
         EfqJu0YUvoH85snXsCo2tiXvKcjtKXpBVY9TgbyyZ6UoW2X/9/JwB9ZwTpl73CoN5i6C
         sIezZ2oSEaHJhXYmlyo71UuiZFEYxxSxOX87ZyU1+ZcN4q+rgRWRHPD7nJYt1lY9WPRc
         RNfAi8rYvF70oWymtuYGGcvfyGv67ts/lXBHSlPPgyzss0cx3qlgt0+fzAQoNkLiMgZy
         Pe32HaWjQf/BQPQQ9mcUumofdyN7uNEE4p0dmCRAqNIXRHXs7F5CgD4+ABJeWYwdDEGD
         61KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778676569; x=1779281369;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cruwuhjqGa0rMbt22zZ45ZYZ3826Tz+/AC4t/AIJui4=;
        b=b7EowUJRsglIwMPC2Ie9el4/7GQZPA7FP4bYIldVlbhh1WarQQBnRdrE/J46702rYm
         32duX3AGZIffjl7OO/SC4SIsdVRJStt7weqCKGcWIQlGgYgG8pYM8sQSpmui00knPard
         sVyrhPDRZ2b+Zcy3FUSuIxaSIj3z297kNK8/sBTuh14RQAttsYLMC2BEDKe7J5QCem0b
         aAKwftvDx7qHcQXbjjeKphdihPABn/ldgJ6AeBGkKrecokgasZcw1l3hdiSF7RJ/+CDm
         ZFo1pmOhNTHu2VVkX/rlq3qRgBV0ztN/lMRhKDqAKWIi6NWSf8szQT9QhvnwdXL4GsvS
         BkkA==
X-Gm-Message-State: AOJu0Yy4n40YB2bYW1vJEnBwBZWp+Xw0cUXlhOF1ucbrDr+9I8K8m0bg
	+doBDZCuRvUXuYpH7DarbkDfxNSV+GJQXfURm1ULo6dN0OC9Zp/iY5e35vh23hrhQlLzLFiztLS
	ea0otZ91gRr6WiHZyV+Bt0/oxuIatwJ0lIdvFgrU+4fpfvz7p5/7LvOP+nOH/w8jmSg==
X-Gm-Gg: Acq92OGjFqcOPopGhbnCxSuh5Z4FfAVawhhNsJvpKwv7hjeh9ZksrRUyuEReFNCuexJ
	rqGAUWYa/jjZAcqzHAcP4vhqe7G1z/2ohFrMHk7If47O1AZidk3NknO9ZZ4/b3ZkKTocyAYqmp0
	Hc6/D9F0qMYb/zRLiZhSMJ8guUiRmsiDWcyJhruVTK12kBx/dgVlV9dEx3yvr/jKDk1bmIwOJSg
	vvKI49dN2cZTsxiaDEoAox209JGHJYFYP+V0q8+IX+qpApZnBs6t9jdNC1XqpETu8ak8kPl0C/q
	zLj/k8SMOrJyc8BJroK11cwsdJiNt1/WhmE2N54+2Rv49QGGUdcPlDG+ei/n4MQQP/rfSS2iFuG
	HKSagQ2RzUKNhr9Fnp90IG5blT3cXK/faC7UkIcotXVWk6Rh4eINKLaLMtLODKN4XXKzXsIerV1
	0I8oyf4zHTV+6bdimrzzzQJLXLulg8TL7oHqU=
X-Received: by 2002:ac8:7d4d:0:b0:50f:c109:b78 with SMTP id d75a77b69052e-5162f6978b0mr41931571cf.60.1778676569189;
        Wed, 13 May 2026 05:49:29 -0700 (PDT)
X-Received: by 2002:ac8:7d4d:0:b0:50f:c109:b78 with SMTP id d75a77b69052e-5162f6978b0mr41927001cf.60.1778676563929;
        Wed, 13 May 2026 05:49:23 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-393f5f5f15asm41106841fa.17.2026.05.13.05.49.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 05:49:22 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 13 May 2026 15:45:41 +0300
Subject: [PATCH v2 07/16] media: iris: Add platform flag for instantaneous
 bandwidth voting
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-iris-ar50lt-v2-7-411e5f7bdc4c@oss.qualcomm.com>
References: <20260513-iris-ar50lt-v2-0-411e5f7bdc4c@oss.qualcomm.com>
In-Reply-To: <20260513-iris-ar50lt-v2-0-411e5f7bdc4c@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=4991;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=2AZDVaVeHjBN9ieMkt6OZ54VG8WgR2+oqvqtNSNqUsY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqBHNAgfaSs5ARk7leg1w8+Z0GaPXa9OAPL3Hxf
 v01WqAvQBOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCagRzQAAKCRCLPIo+Aiko
 1cYZB/9HoHcOSYLAeyPxLkp4spzUEb9wPcH2p9KIVPAfwC93AFLD80RP7QojH74dRDfh++aZjAc
 3ZNa7C0guGXOTA1pE+I9kEp8svz7Z1pmuCygQAT9xikfU3FpsOKi8S80TA3+zUjgkMICr27uBw3
 sJr0YwjaYEo+KSm5fH20NnIzvTVg7y5sH8DZdSdudV1/hnC7zENtWuIxLSpjN+hmyqOltK76WuA
 PEj0/k6PPSTszazBYT51gV3Qobr+a21oL5RyEQ2e7Blx7EKcSfNCoXZJLn5J2GUgs5qyCauEMF0
 SBOXo3sx8/j8giLHGW/qobgPbwTzh4omTZXFWUUPFtPUIW6D
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=X4di7mTe c=1 sm=1 tr=0 ts=6a04735a cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=hZPXDZ8rEFHKWOVG6IQA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: vAe9ZpkPArDyOzeBLDTGQhNG_TufeP4A
X-Proofpoint-ORIG-GUID: vAe9ZpkPArDyOzeBLDTGQhNG_TufeP4A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDEzMiBTYWx0ZWRfX6Do43zu0zQN5
 CoajzXu+X1cRbJ7vBQ9qUslkcHGm6W/bMM6SOwhVa+V9gXribV6aOh6hC5MK3TlaZxDgewsaj/s
 eas08U2OFF78xYNOq9kqu/ex7vVoFXPLgmxkB6m01PbMtm5GIML500FYoAg27BGSMhlM5qXlfRF
 8PeaFiT4Apv5WciPTY/b2zzm8+3RJx3TW/pmRL3qkwI02aqJGXy22QEwVFvCx3j/CxzTE5NIcnC
 edihx/w2lRAvZv4zuCer4h3MbYmAW2Wd2cdHRplPzEigKuIPJ8ScdCMfyZwyiQdFhc+oGZOoZMz
 UnvYDGEMitibSMt58jVLTJ371chV7FvGftvZ1BOqvmlX+fN/oJqbRwmMmiG2qRSJAoolyG3xfBE
 Diz/CJQbJFgckNgRFs28Om9t/MQixGmkZzRX+VdsCkqx+743jKmoL3x33VntOj3nuqbeW03w/XA
 +arJvRnWwG1CfqiyNhQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 phishscore=0 malwarescore=0 suspectscore=0 spamscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605130132
X-Rspamd-Queue-Id: 366CE5337A6
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-61435-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,60fps:email];
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
X-Rspamd-Action: no action

From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

AR50LT require explicit instantaneous bandwidth (IB) voting in addition
to average bandwidth (AB) when configuring interconnect QoS. This
requirement is due to QSB (Qualcomm System Bus) 128b to
QNS ( Qualcomm Network Switch) 256b conversion at video noc in AR50LT
which is not needed for other IRIS cores.

In preparation of adding support for AR50LT core, introduce
platform-configurable IB multiplier and enable IB voting for all SoCs.
Existing platforms default to IB == AB, while AR50LT requires 2x peak
bandwidth.

Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_platform_common.h | 1 +
 drivers/media/platform/qcom/iris/iris_platform_vpu2.c   | 2 ++
 drivers/media/platform/qcom/iris/iris_platform_vpu3x.c  | 4 ++++
 drivers/media/platform/qcom/iris/iris_resources.c       | 2 ++
 4 files changed, 9 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index 51d8faf6fd1a..e1dc226066c1 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -284,6 +284,7 @@ struct iris_platform_data {
 	u32 num_vpp_pipe;
 	bool no_aon;
 	u32 wd_intr_mask;
+	u32 icc_ib_multiplier;
 	u32 max_session_count;
 	/* max number of macroblocks per frame supported */
 	u32 max_core_mbpf;
diff --git a/drivers/media/platform/qcom/iris/iris_platform_vpu2.c b/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
index eeef453c583f..e2fddc29abc7 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
@@ -97,6 +97,7 @@ const struct iris_platform_data sc7280_data = {
 	.num_vpp_pipe = 1,
 	.no_aon = true,
 	.wd_intr_mask = WRAPPER_INTR_STATUS_A2HWD_BMSK,
+	.icc_ib_multiplier = 1,
 	.max_session_count = 16,
 	.max_core_mbpf = 4096 * 2176 / 256 * 2 + 1920 * 1088 / 256,
 	/* max spec for SC7280 is 4096x2176@60fps */
@@ -128,6 +129,7 @@ const struct iris_platform_data sm8250_data = {
 	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu2),
 	.num_vpp_pipe = 4,
 	.wd_intr_mask = WRAPPER_INTR_STATUS_A2HWD_BMSK,
+	.icc_ib_multiplier = 1,
 	.max_session_count = 16,
 	.max_core_mbpf = NUM_MBS_8K,
 	.max_core_mbps = ((7680 * 4320) / 256) * 60,
diff --git a/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c b/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
index 5fbaff5c01ca..8c1c8b19fa99 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
@@ -109,6 +109,7 @@ const struct iris_platform_data qcs8300_data = {
 	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu3),
 	.num_vpp_pipe = 2,
 	.wd_intr_mask = WRAPPER_INTR_STATUS_A2HWD_BMSK,
+	.icc_ib_multiplier = 1,
 	.max_session_count = 16,
 	.max_core_mbpf = ((4096 * 2176) / 256) * 4,
 	.max_core_mbps = (((3840 * 2176) / 256) * 120),
@@ -139,6 +140,7 @@ const struct iris_platform_data sm8550_data = {
 	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu3),
 	.num_vpp_pipe = 4,
 	.wd_intr_mask = WRAPPER_INTR_STATUS_A2HWD_BMSK,
+	.icc_ib_multiplier = 1,
 	.max_session_count = 16,
 	.max_core_mbpf = NUM_MBS_8K * 2,
 	.max_core_mbps = ((7680 * 4320) / 256) * 60,
@@ -177,6 +179,7 @@ const struct iris_platform_data sm8650_data = {
 	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu3),
 	.num_vpp_pipe = 4,
 	.wd_intr_mask = WRAPPER_INTR_STATUS_A2HWD_BMSK,
+	.icc_ib_multiplier = 1,
 	.max_session_count = 16,
 	.max_core_mbpf = NUM_MBS_8K * 2,
 	.max_core_mbps = ((7680 * 4320) / 256) * 60,
@@ -207,6 +210,7 @@ const struct iris_platform_data sm8750_data = {
 	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu3),
 	.num_vpp_pipe = 4,
 	.wd_intr_mask = WRAPPER_INTR_STATUS_A2HWD_BMSK,
+	.icc_ib_multiplier = 1,
 	.max_session_count = 16,
 	.max_core_mbpf = NUM_MBS_8K * 2,
 	.max_core_mbps = ((7680 * 4320) / 256) * 60,
diff --git a/drivers/media/platform/qcom/iris/iris_resources.c b/drivers/media/platform/qcom/iris/iris_resources.c
index 773f6548370a..caeaf199cef7 100644
--- a/drivers/media/platform/qcom/iris/iris_resources.c
+++ b/drivers/media/platform/qcom/iris/iris_resources.c
@@ -18,6 +18,7 @@
 
 int iris_set_icc_bw(struct iris_core *core, unsigned long icc_bw)
 {
+	u32 icc_ib_multiplier = core->iris_platform_data->icc_ib_multiplier;
 	unsigned long bw_kbps = 0, bw_prev = 0;
 	const struct icc_info *icc_tbl;
 	int ret = 0, i;
@@ -36,6 +37,7 @@ int iris_set_icc_bw(struct iris_core *core, unsigned long icc_bw)
 				return ret;
 
 			core->icc_tbl[i].avg_bw = bw_kbps;
+			core->icc_tbl[i].peak_bw = bw_kbps * icc_ib_multiplier;
 
 			core->power.icc_bw = bw_kbps;
 			break;

-- 
2.47.3


