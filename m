Return-Path: <linux-media+bounces-61694-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sLeaAnUWB2rgrQIAu9opvQ
	(envelope-from <linux-media+bounces-61694-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2026 14:49:57 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 0917A54FEA4
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2026 14:49:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id BD6B8313D244
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2026 11:52:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACF4848A2B2;
	Fri, 15 May 2026 11:48:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="crxSJPnk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OJbznKVS"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD409480344
	for <linux-media@vger.kernel.org>; Fri, 15 May 2026 11:48:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778845709; cv=none; b=tx3mya2LDBOw1tJNwDir3d+MrPt4wVqZb8OviPjb057/xy236wee1MIkPEwEu/cMGGzqg8dZUyzDFAGahMQsQs5U+3B/THetCLptx3rblkIkKhreNMsqta1o1dwA+36MMgz6KMlMDu6nguiW6QfVHM+oQmftsa/RB65/xghZBZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778845709; c=relaxed/simple;
	bh=kRKs4Ld/R5wPud9lDZEt6GV0QZ16SIkZn9USZSX7X/s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Imvs8ingvt7dXDjMnADOlhIuKTkekEYVTGfg94VXAJhzTKlFY7BjXu/9POTQFgUz3s+vRFOWwdCHGC2pDLnmpxFGFKAyDXgdQb8lqi1lSwrZ13tGOCLjKZTOE7VUzJkP5wPoR52q4rJ0sHxXo2Q59DrUmm5ppSrZv5huTjoLKP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=crxSJPnk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OJbznKVS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64FBF1t03219672
	for <linux-media@vger.kernel.org>; Fri, 15 May 2026 11:48:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ereORPv71dmyzxkJLNhe5MuVEc7N5EYW40Eup96NbL4=; b=crxSJPnkYP5J1fkO
	h9m6GS2KOcWJXNrGoQiNpZ9imPjlY/r3cAMV7jn/nLUZUVeCZOVzuXDED2vwEV1h
	6LH0iIFkgqNs4C6UYDOtBQFFedAyLg7W4rAU9e0ItBhi2WC3Q1dJxE+cibHP7dMp
	UD9YWv0NU8WjghJj56UjCEIfeU5oVdfGqrKPmcmwXW2Aq8O72b5ZgZfcN9uMOiOU
	bGTBK4LA8c30GpX+JAX2JPQqjaKbLyCx8DEcNpbS6kUNgDjMhNs2tW50QQ8gNzda
	atNGEZ9K/6cYS217tEqPYjgqICgNJs3v3VS8FyjPMaB4StqzhhrSh/LUjDAW7SNk
	nzCCgw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1s32yv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 15 May 2026 11:48:23 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50fbc49bef6so137394051cf.0
        for <linux-media@vger.kernel.org>; Fri, 15 May 2026 04:48:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778845703; x=1779450503; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ereORPv71dmyzxkJLNhe5MuVEc7N5EYW40Eup96NbL4=;
        b=OJbznKVSN2/jSk/N9Dmj8FHpjCpygXwwgcP8cMyhtFf/baOeRcpZK1SBaN2TWW+DJu
         xEbg82cLOAmotqnSok24nCxd59VVWDIIPndUQTsPOsS4TliL/L5xJOZcEZLb8oeAEs5Z
         j/Lr3dKNDPM1/wiRwn5CTBBFD4K8RE3+VtENIpIjOpZT0JRBSWtlAC2WHL/Kp9LJtW/S
         0KQ3Hux3AvZZh+7M7j6RrYSNPTduSIS8hcHV1/hkhAA91nMsnCnY2uwLlac5FUB0+IU4
         Jy+P53zGwa5DZ4JWw73KyXXWyzo4rtlibC85JzNeR03fw1BnqOnqURAbnkNOOG5u2RuP
         USqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778845703; x=1779450503;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ereORPv71dmyzxkJLNhe5MuVEc7N5EYW40Eup96NbL4=;
        b=L+ie9yK3s3geVQO4XhgaDID6Rhi5+/URl76eJv7XMUBfDmbc+YkOLOv5lV3m4buXFv
         nUmqbb91GDU50TofJUGdUGL3GYemfkGcNeX6jlX1lpRSOk1U/ZuxLuLyq6MBdH25+l3g
         h4vRjs+vxboLO+XVdfvSn/Nt1/+PRzM9Q6d1czszTNKIRpdLX0FnyNHmD616JYJzQ79t
         dkVPqWBbIYqa6mNorBTZ04txUkTNvtoj9WVM328eheRkLNcFOeQEgWVF+Mz+AT3V2hVl
         3B6GSvtKV9YUbWQsURI1vYpGuW3JBmik5Cqo2AF25i8xnkTZRhTlhaIsJltVQyYC7teM
         jrTw==
X-Gm-Message-State: AOJu0Yysiz9mLNSRSBZgESPiaE4hUsfnFrbBZuEDx4umUjh8T5JsPjmD
	Y/Dc1xOEaiyp1mVTyvZLrezAxdYgNTt2WB/oiuRUNt9pPVvjcV8fEnZ4cgRXK4W9vxdmVG4Mij8
	FSJfNTzC8ft+ubfYXKscw6iWbKB+Ko92Sywz0zlso5MM9zfcMNlbsHoo+U0B/oJnTEA==
X-Gm-Gg: Acq92OEdWrZBG7LOBNgDySloccQJH+e6Fmg3Taty21SYhryGAy4ks0ZYXpJ6OG6nm0h
	vjKKh+dxQw8IipB11DtbJy1+8FsRTTNNIHNBO7Z2eERGMOcpd3KQo4cpSDbeZjxzCWjnDEr5g/4
	FUv/ndHpEwOW+r3jHy1qN7w4z5XKPyqcI6A8edy8PWz0LQY5U8pPJXBmhlt6akX5nY3smtFTedL
	nbx3jDVAkoKBJaLB7EMF21gyG7eYavOHa+AmeFa7Jp4rNr92y5cKfgeSPBk5qQ5y5aNoGhiEFHY
	Usq7cw7e2JGwXZmTeTyA2aWKfRTQ+OSbBEUj1iv5q7VFKWkXYTOOpMCzv0umZmN5esfysrHA2wZ
	hQ5PMxqYvkJnH7dbjACjv6PwKRR7Fwn4Sad/w77c7bBX5VgOrThyXv+IhZhHqX8Wi0q9cUl1rnE
	PG8Tyol726G/aDabetjMIH1kQlLas+zAmuEvQ=
X-Received: by 2002:a05:622a:8596:b0:50f:b9e6:e056 with SMTP id d75a77b69052e-5165a1e6733mr38964981cf.29.1778845702983;
        Fri, 15 May 2026 04:48:22 -0700 (PDT)
X-Received: by 2002:a05:622a:8596:b0:50f:b9e6:e056 with SMTP id d75a77b69052e-5165a1e6733mr38964481cf.29.1778845702533;
        Fri, 15 May 2026 04:48:22 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a90f11a682sm1265079e87.31.2026.05.15.04.48.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 04:48:21 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 15 May 2026 14:48:07 +0300
Subject: [PATCH v3 08/16] media: iris: skip PIPE if it is not supported by
 the platform
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260515-iris-ar50lt-v3-8-df3846e74347@oss.qualcomm.com>
References: <20260515-iris-ar50lt-v3-0-df3846e74347@oss.qualcomm.com>
In-Reply-To: <20260515-iris-ar50lt-v3-0-df3846e74347@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1159;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=kRKs4Ld/R5wPud9lDZEt6GV0QZ16SIkZn9USZSX7X/s=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqBwf1dzSPYUNXXCAOdUKHIEe8uETw5V1d4cuvO
 zeJEq4oI2+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCagcH9QAKCRCLPIo+Aiko
 1eyRCACZTIolvT1g8ucoISptBMFImSKXBpdskGTfE4rzNWnqgntrg6+BxvpmbbqoIADGWgXpIet
 ijO+qYJhtajgbZlHVVQZLmhMAf0zvPOguTa6FWPqKszuIDjZ5t/4DusDiJrE+nani/K3D7iJLr7
 slPBOJ8yS+ePRHsVD2LYkfkU8SU5NrYHo2wN+Q4eZMwS/Wo6apOT+1H/WJJeZdZplSRY8MaPj0y
 yudpDutg0N+UeXPWMaftEhDbteGwKfK2DTc+K1tAf7GKPIZSQCjo551ek6V0tJzWNcgIuDXGRMq
 ji2DtGnoK1q8t7dN0I58ZewzaetTkVEghD94y7R+2KGDj8pG
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDExOSBTYWx0ZWRfX0kbpKCnyCufQ
 eTQekfrPQ6pvR/k9gHZpTg5ve4EJ7S4QXUjQtPjIIMcX0VQNARo4Z1MC8Z3uKjbnQ4M03HTQJgc
 C8qKsgbRDi7Tw3R2T1ADrv/+9HK0jzWOgWRiOE4cpn/BlLgsdbmGU0KsLhrgFUm3WcW/hDXt44t
 gl+xS6PUEleA/KTU+dIZ3gJYldqO9r8owYtt8wvPPtw4gg7FGvUwZTbQFACIaXKCrXmmBuaod/1
 FNvnA8IFekRxaXZt/mbwQRAb6cS7snucbIguFIe33TF4rcahG2WzMZp+1lto9K3Kr46GeC43pFn
 sImqRa4D/v7gqKYyVVDmcwBGIpKv/zpqzQB5UaCpp+DpgNoOc2RHDLNIPJ4NuVbIWR/rSClsASH
 OpWvV+ACLNV5m0UfZUh49VXM0zdKrrbsNROI8mryhlp7oa+cCU8QvCV6N55mCsGZU/ksUOB+VfT
 AS1YuducnJl7+kAwe5w==
X-Proofpoint-GUID: PDhZuCXrFsC4RrIU4asiVjpB5_9JuxV5
X-Proofpoint-ORIG-GUID: PDhZuCXrFsC4RrIU4asiVjpB5_9JuxV5
X-Authority-Analysis: v=2.4 cv=HJ7z0Itv c=1 sm=1 tr=0 ts=6a070807 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=9TuWGWrZIemhly9L:21 a=xqWC_Br6kY4A:10
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=DRvvl89rPFtLv9ObwM0A:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 phishscore=0 spamscore=0
 clxscore=1015 impostorscore=0 adultscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150119
X-Rspamd-Queue-Id: 0917A54FEA4
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-61694-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

AR50Lt doesn't support HFI_PROPERTY_PARAM_WORK_ROUTE. Tables for AR50LT
won't have corresponding entry in the capability tables. Let
iris_set_pipe() silently skip propgramming the property if there is no
corresponding capability.

Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_ctrls.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.c b/drivers/media/platform/qcom/iris/iris_ctrls.c
index ef7adac3764d..f438dddc19ba 100644
--- a/drivers/media/platform/qcom/iris/iris_ctrls.c
+++ b/drivers/media/platform/qcom/iris/iris_ctrls.c
@@ -450,6 +450,9 @@ int iris_set_pipe(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
 	u32 work_route = inst->fw_caps[PIPE].value;
 	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
 
+	if (!hfi_id)
+		return 0;
+
 	return hfi_ops->session_set_property(inst, hfi_id,
 					     HFI_HOST_FLAGS_NONE,
 					     iris_get_port_info(inst, cap_id),

-- 
2.47.3


