Return-Path: <linux-media+bounces-61698-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ML8tLn8SB2rgrQIAu9opvQ
	(envelope-from <linux-media+bounces-61698-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2026 14:33:03 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A9B9D54FA06
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2026 14:33:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 80B4E31B5C7C
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2026 11:52:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52DF648BD58;
	Fri, 15 May 2026 11:48:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U0VSyB28";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="b8SSHsXe"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41C2B481FD8
	for <linux-media@vger.kernel.org>; Fri, 15 May 2026 11:48:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778845714; cv=none; b=rRBIlxiYlhy79BD/SU3Si5+wq7xyKvojEVE+RY8MAgFMHC3SCGvdTbZcptoSG2DJ8XFXCGPA//oNOltkt0AX+8MxelwsvMqYL4pucFhcMhCubtUuc6KrdPZ/reCCwn/LwgrMUC9lMsDl0+LursXSCXHDqnxELStQ9gcPysbkaQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778845714; c=relaxed/simple;
	bh=3LZBjFNjSvRhMK03ekSlXkVYlg7os/XFnLwP9MO6T5M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=e+CqTN/Vgi3a9l8VmROACRbcfeZiC+OjSPvAtJAIPaKM4j7GQM7JdN0kOnG8p0R6h3+LNLEpxRSsNgwTLhPCmjaYL+n/3zsCvRUiR1DSvl9/Ae5i+SYtsdK0otZNqcJSwBXRzMNK1jOsoLomlFVv9gQ715vkFDFo7PUr1nGINqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U0VSyB28; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b8SSHsXe; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64FBej5P3795744
	for <linux-media@vger.kernel.org>; Fri, 15 May 2026 11:48:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kIs5lUio7E7YMx2NkuaANRPWVQRplvNz2SIkISpJQxI=; b=U0VSyB28K1gDS3aE
	ph6pliUxQYD+nNQdolMJYknIXMj6N1LOkU6q3tRT7SFZmQ870IxHc4kbCEeEin/m
	3s4VFLRrejvKUtEsfDLlh34SCVaBbOYcLCDN86PVo4INLoctumkjJyp1pUlt5qeb
	6K4gkph0FNiY/SzwJbsMtrq0Lek866RumNZGfuw3Ns/bCsFPOoJDiY0bjpg6p13E
	+v0FNOGF0qKupLZNol/RCO3qFLcvDEdhJ3aAbJ+y2E3vFXE/SCKZgEsgxrH3ojfO
	d29OF9pgzQCFQiSnzTLiSuMympk3DZtDz/4SX/bD4NB+kkZ/NkRLhizdEl0QPKZr
	dFLxDg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1su1td-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 15 May 2026 11:48:26 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50d812c898cso217222181cf.1
        for <linux-media@vger.kernel.org>; Fri, 15 May 2026 04:48:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778845706; x=1779450506; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kIs5lUio7E7YMx2NkuaANRPWVQRplvNz2SIkISpJQxI=;
        b=b8SSHsXe03XKIqHO2exbd/cTJEdzSIh0u0quoYeo/eJArKrUjTw3erJp/3aN6uYrqN
         Kb0SnHv3VgsaJ037vN010k6wSyciFkmIPThauANrg7Y1PbIll6bC5UCJTRa1cMFFG3Sn
         nAOxhKRe8/S6sU578f6/ek7h00vJNrgpmiTuQOlImbatXjZBlmkwPTQ9rNt5xf4/HMiR
         tZxbVCuRFg1Ghzpmqrr6KeQVpQccYI7Qm/WF0Sp1VFCXdRjAfgO4k8tmhpOdgRSGB9Tj
         9/2KAiSTS84ZGhqonX0yq9V4yQAQgkmlOs+66IQ+Y0ChyyTFa8EksEat5FLwZWMtBcAq
         RZGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778845706; x=1779450506;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kIs5lUio7E7YMx2NkuaANRPWVQRplvNz2SIkISpJQxI=;
        b=TaLIPSTSuc6VhanaOXf8glIi8mvFBDrlopNS1fIxOQH8WRUAc6SmHq8qHoBvuNZdEE
         KtoJmgZmEg4zl+wC4v6xAwyMq1/7FvdpAG9sPqsAN5T9sCVhmFMczwXnjutci536oSuh
         bqBx0yFZwqWu3GA6zbumIRdDZ72ypnRZMXnXbJV2VqmnFG5nr/QCuU5mB1ppS9SIiVb9
         zjxgC52U4zSnRc0wHAEO4n0GNBJczOesuMG0x13o5F7vpRjvunPN7HU5d65l4W97eGKc
         pGz8Ao525OIlbQlDCNLUjuwqax3QniycHCoNSEQjmM/JVDXuXPj6GDc1hoL3FMRKyGY8
         M52w==
X-Gm-Message-State: AOJu0Yw8afEBYNBN+iFj38JYfjSTMd7WTPwPIb2X29GB/iwi9SFv2Uh9
	PZx7zF9C2OiVuy5e9vGcFNJGk+isZfKsJ4rMGT7xt+J28yG8W6CMreB2FJXZlsW3veqlD8VRh7L
	MMo5ljAHjwYAIf7QyZVE5v5mxoHcBO+7yzJsK/LMWKjyue5Xl4NxzxKhTnbPWKK91ZQ==
X-Gm-Gg: Acq92OHs2dSBMb2ujygcMz0DEr6OppCqd9u/h7PB9Vam9BcceuBkYiY8bzo5fj0SUNZ
	qAAPBkog2bHrZggFNOb6NATLURyfx8MBiHkegQCEq7mvT3xh5wyuxiBVq3hMtdoKId/50m/cN8T
	ugKu9JLp7qTHYPNbqU1ild7Mi6Fqbugmh+szdHtXnTDVJL2t6x5QFx2r3LjBFSCbjYKuFjDPxpu
	oTJ3I56uxBOWi+BUoGm4sW2cQ7+Njex7Ar3pcC7QPaSNLr7cNLnqV52qo800lS+ljpk/ozqL34j
	kmStMFmYugSXDTnvxXH9xSbr7jHf/QKM+0wzd9W8CB4MSNO8KmJzqQyoJXTwfSecKYd5JS+NeGF
	M9TqWPwKkgWAF+RruPKCVMIQkvza6F2/72/LcZPA5/zTI1iWVHxUxpoiqUGuK/+P8X5LtQgVaTU
	URHzH4ndR+2r6R/VdHV/IW6DSy1nNEDxuJrEo=
X-Received: by 2002:a05:622a:1f96:b0:50f:ccdd:13f1 with SMTP id d75a77b69052e-5165a03f078mr50218311cf.16.1778845706146;
        Fri, 15 May 2026 04:48:26 -0700 (PDT)
X-Received: by 2002:a05:622a:1f96:b0:50f:ccdd:13f1 with SMTP id d75a77b69052e-5165a03f078mr50217721cf.16.1778845705537;
        Fri, 15 May 2026 04:48:25 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a90f11a682sm1265079e87.31.2026.05.15.04.48.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 04:48:24 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 15 May 2026 14:48:09 +0300
Subject: [PATCH v3 10/16] media: iris: add minimal GET_PROPERTY
 implementation
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260515-iris-ar50lt-v3-10-df3846e74347@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5660;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=3LZBjFNjSvRhMK03ekSlXkVYlg7os/XFnLwP9MO6T5M=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqBwf1nUSEEicmWRVL0koIcPwHeliPRrGfuCQ5L
 xuDoXKe1suJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCagcH9QAKCRCLPIo+Aiko
 1euvB/48aLOJly1Fx/5K7xUNvTikyq6bfMpYFur3cGp0Mg+itl9zVX7a6bvaSXI3uZUm3ZO6oYn
 iWESlLBaBBn/0H1LEaNzDtKMl22QV/cKIBtylgxxdbyY61rLSjy5PxC0QXvLefVyyRApFhvQ2ob
 pmZadP4SHDMGoTt1Jy/mWvBsVwlpC2AiKONwZLkCuifBzb3gGy/nVTtiEO2hWT83iK+HmEdqe3u
 KDnQkRHjrJk8d8BFHgAnDpU4Pyysvyt6AsfIyvD+MVfYYORk5Sg03nToGwvcYkIAz3Pwl+LAYCX
 sI162Eg7aa0lrKnkigD7FNsJ9PP1EHkmonv5GrbAwC9zsJXQ
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDExOSBTYWx0ZWRfX4GcET6Ceb1lG
 OYSdOFusKO0IMG4p1mskgiCO8Pku6+9DQm9HcnvxZvQDP/0cIK+YojEcolNz5hLwF0snI9VmNHz
 IuTPABL62dlYCDP8UPeEm5CB3WJfmESg4Wxom3axjPtbDTzn0FSfkOLBKUotGap9Q1cwnOzjIlY
 2LJURnhFPiv9lyTE01jGRC41txGkotytFgBdorGQ+aawaqDsTUmpBHT2j/3h6WxL5DyFLC4qN5o
 hR1X1XzmuaUIV9jEUlmkGMqxeWiGIIJoCyTBaw0b7VPk5bMKfDolneEnBMxw3gg7HuUp0OtBjhe
 Xb7uDl7Z+Ex5y7dLHvYbfiqoXXOWoXc5Ae/I/Q1ccwEeSjwWe1E29aEnoNkuWbT9xuQOWO0TrVs
 Zgi9a1K1Jriq++uTBTCEQdfnMA9Wdsv0T4v2Acb3IAWTzq1xYpG85c8DxBQcKvZVd5d1FrhU5+j
 g+aEU5uiL+vgvVFeZZw==
X-Authority-Analysis: v=2.4 cv=cZXiaHDM c=1 sm=1 tr=0 ts=6a07080a cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=4y4YWC2vBVg0P_IM3hEA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: HZ6Eu9bdHy3mwQ6QLitZu6rM7Zm1-PjD
X-Proofpoint-ORIG-GUID: HZ6Eu9bdHy3mwQ6QLitZu6rM7Zm1-PjD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 phishscore=0 suspectscore=0 adultscore=0
 bulkscore=0 impostorscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150119
X-Rspamd-Queue-Id: A9B9D54FA06
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-61698-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

AR50Lt with the Gen1 firmware requires host to read
HFI_PROPERTY_CONFIG_BUFFER_REQUIREMENTS property, otherwie it doesn't
update internal data and fails the HFI_CMD_SESSION_LOAD_RESOURCES
command. Implement minimal support for querying the properties from the
firmware.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_common.h  |  1 +
 .../platform/qcom/iris/iris_hfi_gen1_command.c      | 21 +++++++++++++++++++++
 .../platform/qcom/iris/iris_hfi_gen1_defines.h      | 15 +++++++++++++++
 .../platform/qcom/iris/iris_hfi_gen1_response.c     |  6 ++++++
 4 files changed, 43 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_common.h b/drivers/media/platform/qcom/iris/iris_hfi_common.h
index a27447eb2519..16099f9a25b6 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_common.h
+++ b/drivers/media/platform/qcom/iris/iris_hfi_common.h
@@ -121,6 +121,7 @@ struct iris_hfi_session_ops {
 	int (*session_set_property)(struct iris_inst *inst,
 				    u32 packet_type, u32 flag, u32 plane, u32 payload_type,
 				    void *payload, u32 payload_size);
+	int (*session_get_property)(struct iris_inst *inst, u32 packet_type);
 	int (*session_open)(struct iris_inst *inst);
 	int (*session_start)(struct iris_inst *inst, u32 plane);
 	int (*session_queue_buf)(struct iris_inst *inst, struct iris_buffer *buffer);
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
index 83373862655f..4e17fa3c602f 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
@@ -1063,10 +1063,31 @@ static int iris_hfi_gen1_session_set_config_params(struct iris_inst *inst, u32 p
 	return 0;
 }
 
+static int iris_hfi_gen1_session_get_property(struct iris_inst *inst, u32 packet_type)
+{
+	struct hfi_session_get_property_pkt pkt;
+	int ret;
+
+	pkt.shdr.hdr.size = sizeof(pkt);
+	pkt.shdr.hdr.pkt_type = HFI_CMD_SESSION_GET_PROPERTY;
+	pkt.shdr.session_id = inst->session_id;
+	pkt.num_properties = 1;
+	pkt.data = packet_type;
+
+	reinit_completion(&inst->completion);
+
+	ret = iris_hfi_queue_cmd_write(inst->core, &pkt, pkt.shdr.hdr.size);
+	if (ret)
+		return ret;
+
+	return iris_wait_for_session_response(inst, false);
+}
+
 static const struct iris_hfi_session_ops iris_hfi_gen1_session_ops = {
 	.session_open = iris_hfi_gen1_session_open,
 	.session_set_config_params = iris_hfi_gen1_session_set_config_params,
 	.session_set_property = iris_hfi_gen1_session_set_property,
+	.session_get_property = iris_hfi_gen1_session_get_property,
 	.session_start = iris_hfi_gen1_session_start,
 	.session_queue_buf = iris_hfi_gen1_session_queue_buffer,
 	.session_release_buf = iris_hfi_gen1_session_unset_buffers,
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h b/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
index 42226ccee3d9..1b770e830c58 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
@@ -35,6 +35,7 @@
 #define HFI_CMD_SESSION_EMPTY_BUFFER			0x211004
 #define HFI_CMD_SESSION_FILL_BUFFER			0x211005
 #define HFI_CMD_SESSION_FLUSH				0x211008
+#define HFI_CMD_SESSION_GET_PROPERTY			0x211009
 #define HFI_CMD_SESSION_RELEASE_BUFFERS			0x21100b
 #define HFI_CMD_SESSION_RELEASE_RESOURCES		0x21100c
 #define HFI_CMD_SESSION_CONTINUE			0x21100d
@@ -113,6 +114,7 @@
 #define HFI_MSG_SESSION_FLUSH				0x221006
 #define HFI_MSG_SESSION_EMPTY_BUFFER			0x221007
 #define HFI_MSG_SESSION_FILL_BUFFER			0x221008
+#define HFI_MSG_SESSION_PROPERTY_INFO			0x221009
 #define HFI_MSG_SESSION_RELEASE_RESOURCES		0x22100a
 #define HFI_MSG_SESSION_RELEASE_BUFFERS			0x22100c
 
@@ -186,6 +188,12 @@ struct hfi_session_set_property_pkt {
 	u32 data[];
 };
 
+struct hfi_session_get_property_pkt {
+	struct hfi_session_hdr_pkt shdr;
+	u32 num_properties;
+	u32 data;
+};
+
 struct hfi_sys_pc_prep_pkt {
 	struct hfi_pkt_hdr hdr;
 };
@@ -525,6 +533,13 @@ struct hfi_msg_session_fbd_uncompressed_plane0_pkt {
 	u32 data[];
 };
 
+struct hfi_msg_session_property_info_pkt {
+	struct hfi_session_hdr_pkt shdr;
+	u32 num_properties;
+	u32 property;
+	u8 data[];
+};
+
 struct hfi_msg_session_release_buffers_done_pkt {
 	struct hfi_msg_session_hdr_pkt shdr;
 	u32 num_buffers;
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
index bfd7495bf44f..23fc7194b1e3 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
@@ -591,6 +591,10 @@ static const struct iris_hfi_gen1_response_pkt_info pkt_infos[] = {
 	 .pkt = HFI_MSG_SESSION_RELEASE_BUFFERS,
 	 .pkt_sz = sizeof(struct hfi_msg_session_release_buffers_done_pkt),
 	},
+	{
+	 .pkt = HFI_MSG_SESSION_PROPERTY_INFO,
+	 .pkt_sz = sizeof(struct hfi_msg_session_property_info_pkt),
+	},
 };
 
 static void iris_hfi_gen1_handle_response(struct iris_core *core, void *response)
@@ -652,6 +656,8 @@ static void iris_hfi_gen1_handle_response(struct iris_core *core, void *response
 			iris_hfi_gen1_session_etb_done(inst, hdr);
 		} else if (hdr->pkt_type == HFI_MSG_SESSION_FILL_BUFFER) {
 			iris_hfi_gen1_session_ftb_done(inst, hdr);
+		} else if (hdr->pkt_type == HFI_MSG_SESSION_PROPERTY_INFO) {
+			complete(&inst->completion);
 		} else {
 			struct hfi_msg_session_hdr_pkt *shdr;
 

-- 
2.47.3


