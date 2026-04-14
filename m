Return-Path: <linux-media+bounces-58701-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KNYwNTPK3WknjQkAu9opvQ
	(envelope-from <linux-media+bounces-58701-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 14 Apr 2026 07:01:39 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B59D83F5948
	for <lists+linux-media@lfdr.de>; Tue, 14 Apr 2026 07:01:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id EDD9F3016519
	for <lists+linux-media@lfdr.de>; Tue, 14 Apr 2026 05:01:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFF9B2FC893;
	Tue, 14 Apr 2026 05:01:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cVbK0L6/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KAr7pv5L"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D42F22F6911
	for <linux-media@vger.kernel.org>; Tue, 14 Apr 2026 05:01:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776142888; cv=none; b=RXrVpRfAlhS3XPeSfHIithlEUUDAG3fs2OUmZWoWApWi1iPb8V0j9QBxvI7UW0VodXKhTI37Au4jxtDST+a8WTNV3L/xxponQ9fKyx5q9zHFb+naywdbk2NA1/UyUPk/20At24XyCgmBEbF1gXsNNqb3wKJOPAXRuFyugMZri1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776142888; c=relaxed/simple;
	bh=Na5TubomgVuDD7yKf84igivMKpdfxkQPlVnbL5NqEQE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BgjIaNp8zcZn4hEmc6Xb5cs9euY9w6x9JqDhKHhhL/2EYDcW3DYiYeusq2GXgpGRz3yZ2qIYDCDz2gTPXH55WfwaruBNhuq8qrVf/YrAcS15Lz7F+/lKSlsze8fvRVmvYNLFEYHQlFDFSShJzESh19rViZAp8enh9CBtWKthIv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cVbK0L6/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KAr7pv5L; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63DLD8He395289
	for <linux-media@vger.kernel.org>; Tue, 14 Apr 2026 05:01:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LmFJLF69G/HzboWBVC7yI7ZUIn4bIbcDXzoAqxDyCG8=; b=cVbK0L6/coVs0Ggt
	LVPO+Falsz8Xh1rA6o2TK4F+FyiUYskjFwQ6eU8JWRGkMH1Loz/qMsH+iSnbgLWK
	ICDirvKkkeN+Qt1jmHlZXfcE2GrFcv5jDXRCklDkYX1Jwuce9DzPpaCSNMXlzO4m
	ES7EKW9yKSBgAkM3rK01lEHBGUYc32xbg0ykAH8wRRPkiLCOKieE9QvkvoAEG2lk
	kgo1es4nHjd+dmbL+b8GSVzHhOy5QSMT/VJKG8HshbE7DoEnsItp+1m4DWGDaN+H
	Jgdyq7rI1n0myI/VWT0GBvXZgHQ6KQ5lXGfJPbBgLQT/e6v4iuLxApqIwLUCXkM2
	2DCgnA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh870s2mb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 14 Apr 2026 05:01:25 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b24af7ca99so72865745ad.1
        for <linux-media@vger.kernel.org>; Mon, 13 Apr 2026 22:01:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776142885; x=1776747685; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LmFJLF69G/HzboWBVC7yI7ZUIn4bIbcDXzoAqxDyCG8=;
        b=KAr7pv5LBn0/Xkw4TR0tcTu3Z30hTfpqEGHsULy7AXR0D/yWkTdghMV/jmeN4YumAi
         4oxqvZRk454s3qw7sd4Na1axX1dCLGWGfDhKBts3H31j125L0Uk1zcPFLx5r6MPQclpz
         mdt0nU/UGRUExHFEgCIpD8GFB6Ga7Q7EKtzb8S3LqGZzogir5cWTor6E9l8JqNsx4eGj
         7rRA//EUwoOu5DyFSRj6PeG1bbxgCAMVzNBB8PDPfyqG4THtdfusB79S3fUDM6zIMaXH
         UIo0poi2rvH6jolc6mygRa2XMxDpKt2vrE2mLIDHaK3xEpOy+A6MJo4+kTs6q9SXJwTf
         tZCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776142885; x=1776747685;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LmFJLF69G/HzboWBVC7yI7ZUIn4bIbcDXzoAqxDyCG8=;
        b=l1TizbX/MDpdeu7RZ/SYp4DenV31xvQMjxAoDMudh6MCP43QNm5fKSXZpWPeycZJvN
         zzD3ckFdmK4tQNcNKGCMgOto9/FMCRRNhABTtR78vPjXkg3sn+6NcED88C+qKKVmoQ6P
         If8WYApJXf19SesvYxA+Pn0RAdEMClZrcyGaVqrLm9aIww3qGrvpjCEo9umN+fyQt71R
         MtE4dBXI3J2JrzK0+0pyJlZz4oArcSr3OsE/bhIF9d3+gv3Ns2GR8vKklSltJRdoYmiS
         TL5YkvgmVXEwrrlTHhgT18kohUSrsALnWowGzrXvrNK/+rLhyOqQTfjyVyrfN08HjnqB
         gcFg==
X-Gm-Message-State: AOJu0Yyrvfjii/7oRUSbBWcK+AjsnJabU61srvLYaIXipVHROnTdyuYl
	bi+e74jDPujq0yEtsp2cY4sI0RzHOFjP25ckhKc6R2Zv1Rgbo2Szsb3yi37YGGAd5IBIrg1BsU4
	G0ZPS9T0f63DpUCwiIHCJbR/W+gWwUqn9D1BqAEqHMywlee1WAkyA5RP2OsV/7T0pEw==
X-Gm-Gg: AeBDiesByTBD+Yl46ic/4ks2ugfVdjcJP2xfbMjf0aXMhbmhKArEH+1iwUeIYRLIzS/
	qnM0JC0+Df+nq/WL7cc0Xm/2EB6/UzYRpUQmXhiyWut9OWcLrP+pSiCW2HE2egunp11ZGn2uQoh
	Y/1V0t89fR1QFXDuxFf6gdpayrEgpx+HGdGrV9vmV1VphkRqY/QKno9tOpckXfmmag2S/abWB6A
	mGnCejOXxrkRc1woSrQxF+PPwaVhcvYwb4jR8zYAHEgRhPLwrFo6aAnLXRNaUCNFf2TXNzcED6j
	Mcf0sLBBBwYxvrHCHRFnUoyeiqkRjpLv/+1HSN9HKmgSV73AUnrYlxEM8rzSczAU9vl9H52Rafs
	6WHAkoQ9ao/5mRTAvWKs4+44qPY2QHc5dn16NbUEBnP5YhRf8PqDEW20=
X-Received: by 2002:a17:902:ebc1:b0:2b4:5e0f:c239 with SMTP id d9443c01a7336-2b45e0fde9amr59672045ad.10.1776142884693;
        Mon, 13 Apr 2026 22:01:24 -0700 (PDT)
X-Received: by 2002:a17:902:ebc1:b0:2b4:5e0f:c239 with SMTP id d9443c01a7336-2b45e0fde9amr59671465ad.10.1776142884139;
        Mon, 13 Apr 2026 22:01:24 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2d4db198asm134678425ad.3.2026.04.13.22.01.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 22:01:23 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Tue, 14 Apr 2026 10:30:05 +0530
Subject: [PATCH 09/11] media: iris: Add support to select core for dual
 core platforms
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260414-glymur-v1-9-7d3d1cf57b16@oss.qualcomm.com>
References: <20260414-glymur-v1-0-7d3d1cf57b16@oss.qualcomm.com>
In-Reply-To: <20260414-glymur-v1-0-7d3d1cf57b16@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux.dev, Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776142821; l=8976;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=Na5TubomgVuDD7yKf84igivMKpdfxkQPlVnbL5NqEQE=;
 b=IZjZXUDzGpLRRoljt6U6FOwySMBheBu/yARjYTCSmn64Bz49ZwpCy8BgX1YCG9fQy7xGXKsiv
 emY63IfGR7IBrLtzyPRJ/LUqB1J6/HcaKV3bMVV7bOmxZ6104Sgd/jG
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-ORIG-GUID: tWolAsdtpV9Z-_epxd-hF2OtqM2WM7iL
X-Proofpoint-GUID: tWolAsdtpV9Z-_epxd-hF2OtqM2WM7iL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDA0NSBTYWx0ZWRfX7BR/DcMbHLd9
 7DjQf8D/MgC1DzkdJKis/3RlzvtYmP0xVkUs+GUmUyoCjqrufQzY69WVB0fpb3JMl2C+MTtaKOJ
 W+w+cNs6mvStm/GwqY9ULIlnMwaKogn9r/JQBs+fPhjy5e7udiK9otGgiMphc09E14PNG/Ef5xa
 OC1crCbQ+Zr5kk4+q6pmVGqQIWRztNkTw6yeekPSSas8qMJ2glbsEGgvsvcIk89gmk8aGt/l/1M
 GhM0n6SYOVpW7OnkjDNT48khD1OmtMSp2d90wkx1GxxqQD0TXx0kutq6nFT+TQ8ZahIHVEL0Yyx
 rpR6OzlaQaLwRoCoc0JpdjzI1ERvZzQ75DN3lAtNbX7Fl+KBxWRGSOsgoVonkeZKPBq7xy9FyuZ
 mSim1reSZyW4UwTdhJ3BY9zmfa1nbwxZvWOTSJOXd7OjByH3j9g0aKGodY/pSbQG3mk12yZzf/s
 JiK+ggY50IOnO3XmUAQ==
X-Authority-Analysis: v=2.4 cv=MK9QXsZl c=1 sm=1 tr=0 ts=69ddca25 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=y4DQSFRNPWCXgWzwaCEA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_01,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 clxscore=1015 suspectscore=0 spamscore=0 bulkscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604140045
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-58701-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[busanna.reddy@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B59D83F5948
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Select the hardware core (vcodec) for a session, based on load when the
platform supports dual vcodec cores. Assign the session to vcodec if its
MBPF/MBPS capacity allows it, otherwise assign to vcodec1. Communicate
the selected vcodec core to firmware using new HFI_PROP_CORE_ID property.

Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_common.c     |  7 +++
 drivers/media/platform/qcom/iris/iris_hfi_common.h |  1 +
 .../platform/qcom/iris/iris_hfi_gen2_command.c     | 19 ++++++
 .../platform/qcom/iris/iris_hfi_gen2_defines.h     |  1 +
 drivers/media/platform/qcom/iris/iris_instance.h   |  2 +
 .../platform/qcom/iris/iris_platform_common.h      |  1 +
 drivers/media/platform/qcom/iris/iris_utils.c      | 68 +++++++++++++++++-----
 7 files changed, 83 insertions(+), 16 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_common.c b/drivers/media/platform/qcom/iris/iris_common.c
index 7f1c7fe144f7..e31d4c988c55 100644
--- a/drivers/media/platform/qcom/iris/iris_common.c
+++ b/drivers/media/platform/qcom/iris/iris_common.c
@@ -49,11 +49,18 @@ void iris_set_ts_metadata(struct iris_inst *inst, struct vb2_v4l2_buffer *vbuf)
 int iris_process_streamon_input(struct iris_inst *inst)
 {
 	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
+	bool dual_core = inst->core->iris_platform_data->dual_core;
 	enum iris_inst_sub_state set_sub_state = 0;
 	int ret;
 
 	iris_scale_power(inst);
 
+	if (dual_core) {
+		ret = hfi_ops->session_set_core_id(inst, inst->core_id);
+		if (ret)
+			return ret;
+	}
+
 	ret = hfi_ops->session_start(inst, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
 	if (ret)
 		return ret;
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_common.h b/drivers/media/platform/qcom/iris/iris_hfi_common.h
index 3edb5ae582b4..fbaf852a6b99 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_common.h
+++ b/drivers/media/platform/qcom/iris/iris_hfi_common.h
@@ -124,6 +124,7 @@ struct iris_hfi_command_ops {
 	int (*session_drain)(struct iris_inst *inst, u32 plane);
 	int (*session_resume_drain)(struct iris_inst *inst, u32 plane);
 	int (*session_close)(struct iris_inst *inst);
+	int (*session_set_core_id)(struct iris_inst *inst, u32 core_id);
 };
 
 struct iris_hfi_response_ops {
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
index 30bfd90d423b..9d9fae587297 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
@@ -1300,6 +1300,24 @@ static int iris_hfi_gen2_session_release_buffer(struct iris_inst *inst, struct i
 					inst_hfi_gen2->packet->size);
 }
 
+static int iris_hfi_gen2_set_core_id(struct iris_inst *inst, u32 core_id)
+{
+	struct iris_inst_hfi_gen2 *inst_hfi_gen2 = to_iris_inst_hfi_gen2(inst);
+	u32 payload = core_id;
+
+	iris_hfi_gen2_packet_session_command(inst,
+					     HFI_PROP_CORE_ID,
+					     HFI_HOST_FLAGS_NONE,
+					     HFI_PORT_NONE,
+					     inst->session_id,
+					     HFI_PAYLOAD_U32,
+					     &payload,
+					     sizeof(u32));
+
+	return iris_hfi_queue_cmd_write(inst->core, inst_hfi_gen2->packet,
+					inst_hfi_gen2->packet->size);
+}
+
 static const struct iris_hfi_command_ops iris_hfi_gen2_command_ops = {
 	.sys_init = iris_hfi_gen2_sys_init,
 	.sys_image_version = iris_hfi_gen2_sys_image_version,
@@ -1317,6 +1335,7 @@ static const struct iris_hfi_command_ops iris_hfi_gen2_command_ops = {
 	.session_drain = iris_hfi_gen2_session_drain,
 	.session_resume_drain = iris_hfi_gen2_session_resume_drain,
 	.session_close = iris_hfi_gen2_session_close,
+	.session_set_core_id = iris_hfi_gen2_set_core_id,
 };
 
 void iris_hfi_gen2_command_ops_init(struct iris_core *core)
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
index cecf771c55dd..1926a5344427 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
@@ -56,6 +56,7 @@
 #define HFI_PROP_BUFFER_HOST_MAX_COUNT		0x03000123
 #define HFI_PROP_BUFFER_FW_MIN_OUTPUT_COUNT	0x03000124
 #define HFI_PROP_PIC_ORDER_CNT_TYPE		0x03000128
+#define HFI_PROP_CORE_ID			0x030001A9
 
 enum hfi_rate_control {
 	HFI_RC_VBR_CFR		= 0x00000000,
diff --git a/drivers/media/platform/qcom/iris/iris_instance.h b/drivers/media/platform/qcom/iris/iris_instance.h
index 16965150f427..dd341ca5be57 100644
--- a/drivers/media/platform/qcom/iris/iris_instance.h
+++ b/drivers/media/platform/qcom/iris/iris_instance.h
@@ -37,6 +37,7 @@ struct iris_fmt {
  *
  * @list: used for attach an instance to the core
  * @core: pointer to core structure
+ * @core_id: specifies the hardware core on which the session runs
  * @session_id: id of current video session
  * @ctx_q_lock: lock to serialize queues related ioctls
  * @lock: lock to seralise forward and reverse threads
@@ -79,6 +80,7 @@ struct iris_fmt {
 struct iris_inst {
 	struct list_head		list;
 	struct iris_core		*core;
+	u32				core_id;
 	u32				session_id;
 	struct mutex			ctx_q_lock;/* lock to serialize queues related ioctls */
 	struct mutex			lock; /* lock to serialize forward and reverse threads */
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index e3c1aff770dd..aeb70f54be10 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -258,6 +258,7 @@ struct iris_platform_data {
 	const struct tz_cp_config *tz_cp_config_data;
 	u32 tz_cp_config_data_size;
 	u32 core_arch;
+	bool dual_core;
 	u32 hw_response_timeout;
 	struct ubwc_config_data *ubwc_config;
 	u32 num_vpp_pipe;
diff --git a/drivers/media/platform/qcom/iris/iris_utils.c b/drivers/media/platform/qcom/iris/iris_utils.c
index cfc5b576ec56..38ede9f76d0b 100644
--- a/drivers/media/platform/qcom/iris/iris_utils.c
+++ b/drivers/media/platform/qcom/iris/iris_utils.c
@@ -90,18 +90,51 @@ struct iris_inst *iris_get_instance(struct iris_core *core, u32 session_id)
 	return NULL;
 }
 
-int iris_check_core_mbpf(struct iris_inst *inst)
+static u32 iris_get_mbps(struct iris_inst *inst)
 {
-	struct iris_core *core = inst->core;
-	struct iris_inst *instance;
-	u32 total_mbpf = 0;
+	u32 fps = max(inst->frame_rate, inst->operating_rate);
+
+	return iris_get_mbpf(inst) * fps;
+}
+
+static void iris_get_core_load(struct iris_core *core, u32 *core_load, bool mbpf)
+{
+	bool dual_core = core->iris_platform_data->dual_core;
+	struct iris_inst *inst;
+	u32 load;
 
 	mutex_lock(&core->lock);
-	list_for_each_entry(instance, &core->instances, list)
-		total_mbpf += iris_get_mbpf(instance);
+	list_for_each_entry(inst, &core->instances, list) {
+		if (mbpf)
+			load = iris_get_mbpf(inst);
+		else
+			load = iris_get_mbps(inst);
+
+		if (inst->core_id == BIT(0))
+			core_load[0] += load;
+		else if (dual_core && inst->core_id == BIT(1))
+			core_load[1] += load;
+	}
 	mutex_unlock(&core->lock);
+}
 
-	if (total_mbpf > core->iris_platform_data->max_core_mbpf)
+int iris_check_core_mbpf(struct iris_inst *inst)
+{
+	struct iris_core *core = inst->core;
+	u32 max_core_mbpf = core->iris_platform_data->max_core_mbpf;
+	bool dual_core = core->iris_platform_data->dual_core;
+	u32 core_mbpf[2] = {0, 0}, new_mbpf;
+
+	inst->core_id = 0;
+	iris_get_core_load(core, core_mbpf, true);
+	new_mbpf = iris_get_mbpf(inst);
+
+	if (core_mbpf[0] + new_mbpf <= max_core_mbpf)
+		inst->core_id = BIT(0);
+	else if (dual_core && core_mbpf[1] + new_mbpf <= max_core_mbpf)
+		inst->core_id = BIT(1);
+
+	if (!inst->core_id)
 		return -ENOMEM;
 
 	return 0;
@@ -110,17 +143,20 @@ int iris_check_core_mbpf(struct iris_inst *inst)
 int iris_check_core_mbps(struct iris_inst *inst)
 {
 	struct iris_core *core = inst->core;
-	struct iris_inst *instance;
-	u32 total_mbps = 0, fps = 0;
+	u32 max_core_mbps = core->iris_platform_data->max_core_mbps;
+	bool dual_core = core->iris_platform_data->dual_core;
+	u32 core_mbps[2] = {0, 0}, new_mbps;
 
-	mutex_lock(&core->lock);
-	list_for_each_entry(instance, &core->instances, list) {
-		fps = max(instance->frame_rate, instance->operating_rate);
-		total_mbps += iris_get_mbpf(instance) * fps;
-	}
-	mutex_unlock(&core->lock);
+	inst->core_id = 0;
+	iris_get_core_load(core, core_mbps, false);
+	new_mbps = iris_get_mbps(inst);
+
+	if (core_mbps[0] + new_mbps <= max_core_mbps)
+		inst->core_id = BIT(0);
+	else if (dual_core && core_mbps[1] + new_mbps <= max_core_mbps)
+		inst->core_id = BIT(1);
 
-	if (total_mbps > core->iris_platform_data->max_core_mbps)
+	if (!inst->core_id)
 		return -ENOMEM;
 
 	return 0;

-- 
2.34.1


