Return-Path: <linux-media+bounces-49133-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 49F35CCED3C
	for <lists+linux-media@lfdr.de>; Fri, 19 Dec 2025 08:46:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 85EE4308B365
	for <lists+linux-media@lfdr.de>; Fri, 19 Dec 2025 07:44:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FA3A2E92A6;
	Fri, 19 Dec 2025 07:43:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ObxudSi+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QqboC4EC"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE6872E7653
	for <linux-media@vger.kernel.org>; Fri, 19 Dec 2025 07:43:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766130198; cv=none; b=c3RVnOhlT7ANqClnbs/1DjpouS4Jj/6UkmBOgtcrzbqJ8dNNSa0fkduxCpb0lYf4ddlEEI1hZEuW2ryvQlQcRetIgm0FmdoHfRj1/PnrERLjVbBWPtsuHTXv9gove1Ae+BJ0960UmGHRi4afv/xcVXTe5dFL3uM38VIk3CpRzsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766130198; c=relaxed/simple;
	bh=gfSU4DV8gsUj4FijN4PF1OpqyeuI1f12jvR1HgpFGFM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EcRoRfvyAzhotVBlu6VQ/nARDu+TZtVoyfeFJnK7Du7IlLlhk5kJ60lc5sVB7lqc48zsITC7R7sxn2ZAbVCD9G+91ZnanyBYsflJm8wviS73sfcdEf2QIyhKsCBGXkCiHUQOCWMzAOb8cs8q6K1jNoMT9FCH1q2BB2+BX0WBFLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ObxudSi+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QqboC4EC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BJ4ciop3976825
	for <linux-media@vger.kernel.org>; Fri, 19 Dec 2025 07:43:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XoMH0PbrMy+EgWQ6LDLJExgdlr9mTw1ZTRuY0YoKBQM=; b=ObxudSi+8GaWEnTh
	BVIwpreT5D1RMcNbiWZtvYv6OwYWH7eXZ+l0wty8VLSAbUdSQTS/P1MsbzwERa2Z
	MyY3eeQ9LP77Zcu8Yz5Fu6WwboKEvACbROAfEootbnl6SCXij4OudU28kBTOwW0q
	06XQPvfQxbwtn/9n9MieOyBdlxWT8aHEb8oE5KEWbyTAib+jxf9e2qMeI575hOZp
	4vD+01OReeOdrZukcT4saTAq8xDKn5XCfTpa8eMACFFaA7CVcFbmbYgVP6zRhH9r
	lUyCZRu9Cx5Ctx4DiFYfRJCcUpV5slXVtCb39dkT6DEkDYWGDxbFgrT3ivxhpcHz
	2gq1xQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b4r2fhpm5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 19 Dec 2025 07:43:14 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-29f177f4d02so31195195ad.2
        for <linux-media@vger.kernel.org>; Thu, 18 Dec 2025 23:43:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766130193; x=1766734993; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XoMH0PbrMy+EgWQ6LDLJExgdlr9mTw1ZTRuY0YoKBQM=;
        b=QqboC4ECeRuhdcFVmPwFhXp6Iu+U7VruN66Vbse99s2qGEhcAd1uAth+980oJ7pNOE
         6iseTJqTJngvtJkxJwBvCGmcA0tFRcQCkxH0l2S2Gx72oDO1LGFVQMBGymmJVkZRhA8A
         4yyZwXFWE61ycRJrS+ykBolm5JTeQNE89WdKXSj/UUnaXXrzPZWKGkb7cj6xzdvFkyJN
         zzNv8esTgeeJhJhNHWTHZqG6z1LnMyR7Lih2pQ9sVpe+RQJFiXnyAfXfKRZfuXJM8nEq
         QlsmGWwnHA2ouJTk1D+Jvvt8R37QUCzgPnYSCTHaPyLoYvpj/6qsb26WkRl6lQ7L0rHE
         /p4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766130193; x=1766734993;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XoMH0PbrMy+EgWQ6LDLJExgdlr9mTw1ZTRuY0YoKBQM=;
        b=LCpRNZOhBGqmhl+1TeCLvT6ypE8gAswg9uAF9Htx1zcJoWuoZMteoU6gfR5dTxDqdD
         X13iHvHxuvnAwRebKg0yOcVY69qMZ73fyo0ED/Ov+Lxy0lG3xZLpU/cxuNadf0rVu8du
         LrPRRE9QsvrqhpkA/Hp1eeuGithyXLoYIcD57t5mCFjLhzYHJQNgo3yw4G3u93niGzvZ
         ry1BS+cH3mnbzM6Kw5S4Tz8zbWrs8zIXNWr0meA1zPzO0tlIYviWBR+LndvF37o78jR0
         2wL80s7oRgexo1E6LjQ9DmTUrsGGFJwXwGzDXBlCqTjm47UVQg8TDtlWowjux1PTKxDf
         dZYA==
X-Forwarded-Encrypted: i=1; AJvYcCUkcsVIrv/3nVNO/PUFnbZaAwNTK+wtlDDLAolIrv5Z4IDbcPs8Mmb47WODjvY387UOfiC4ylqqi8SEHg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzBlkyikeFj9pHOCyFEkVG1H2yxPWrcjEUT97pzpHWrSQFVoY1t
	cmNUgcEKUGKCb0TRUY+jsRpdjbT7PyDESsndVaymShgiNC7Qo4AHZPCP4U1ykFDWOb3+luQDhrL
	3tL12x9rZQAkZlOD9WOEAv6HwD97CqEgJVb/JzhFLuxtNgYHrJ/9GvurYEZzwYj2Dqg==
X-Gm-Gg: AY/fxX57Id3JximpIE8Az0/17TE5YiwCTMBg+oDEHzWTJnDr5+pTWiKrjWaOLLGCmD3
	YMG17WalHQaNaiDmrRSPq8JVcMLnkZAN8pbOU3Ubvpk2eLo3M0ZbZC+2XKHL+IOTwnfvSACAqbV
	Mvnuw8Hjh6i2e+ECu1ySV3EqY1CKEeA430ZwP/9Pfm+/lHwjBf9Ls7DzkAtZnVoADMXKuFeQ4l3
	REVn9mn0ZZ7qkBufoPxOd0ssKK9IOtInW49SjIjX7aDIhhuPZCnik3mP2ZvFBsDlMoLrNqCgrlJ
	yME2pUwz331O8gQawmU3EIkJWvLzqLvVYTtfMAeo/NaMraAXh4PrZf97yWkd1FPdckXo6AoR+65
	W6JILMS6OLHCMcjQzxIQ3dD4T/q2knWfAUoKtxNoy
X-Received: by 2002:a17:902:c403:b0:2a0:ccdb:218d with SMTP id d9443c01a7336-2a2f2214ee0mr19657935ad.17.1766130193489;
        Thu, 18 Dec 2025 23:43:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFXInKxSMdaF0iCkxUhfOBpCw3NQUvqObcLRu5KRtF9SeavV6t5DT+nPE829DVe9uZEgKoEeQ==
X-Received: by 2002:a17:902:c403:b0:2a0:ccdb:218d with SMTP id d9443c01a7336-2a2f2214ee0mr19657535ad.17.1766130192937;
        Thu, 18 Dec 2025 23:43:12 -0800 (PST)
Received: from WANGAOW-LAB01.ap.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3d4cb90sm14007325ad.51.2025.12.18.23.43.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 23:43:12 -0800 (PST)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Date: Fri, 19 Dec 2025 15:42:31 +0800
Subject: [PATCH v2 3/6] media: qcom: iris: Add B frames support for encoder
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251219-batch2_iris_encoder_enhancements-v2-3-371f7fe24801@oss.qualcomm.com>
References: <20251219-batch2_iris_encoder_enhancements-v2-0-371f7fe24801@oss.qualcomm.com>
In-Reply-To: <20251219-batch2_iris_encoder_enhancements-v2-0-371f7fe24801@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: quic_qiweil@quicinc.com, Renjiang Han <renjiang.han@oss.qualcomm.com>,
        Wangao Wang <wangao.wang@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766130176; l=8694;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=gfSU4DV8gsUj4FijN4PF1OpqyeuI1f12jvR1HgpFGFM=;
 b=Ry/yCkebnQIoejvrNhNTOcN83UGtBq84zY7VKQtpjzo0y++AQaMhTVrPo/PWFJ62tl1Zcj2G8
 1wgWs9uNyKtBNDTINIf8i8vYhahGnGVf8HNCMpVAhxPIpVZGjV33kek
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Authority-Analysis: v=2.4 cv=NODYOk6g c=1 sm=1 tr=0 ts=69450212 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=pbVt0xer8RvNRR6Ob3QA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: U0tcNg-AetBCfIQOhOMju5NRghhifbUO
X-Proofpoint-GUID: U0tcNg-AetBCfIQOhOMju5NRghhifbUO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDA2MiBTYWx0ZWRfX0gratLPmEzzX
 wXR7u/w13ryl3KYSIFg+ZNF+1z4a8hn6L0p6hBE5btLCiFjxXMtdmNEz2J48mdVFtMll+tt1Lab
 sr5aP339icp1PZdAhdso2RmyCTesi6OWzxbQYXwn0vy+k82w0x98OjzTtwYahWpy4DnOGbl9rLy
 PdXdL0sOv1cr5ma4VEF65lb+3POTA0oGc441GbL4PtTc9ndyhKqewBvNS8cupx/3n8+aEyej1Ue
 9KpHjiOa0u1Mpvh7rCPJ76MEIl6Ar3NSS6ssLryqKAAsZW5etjvznCMJP/vLiE7ZH0RCQ94p+wj
 M+ktXJGNX4RdTDaDB9kH68ziSqDuX7nUHzIkLbZ/TmKH+vMLssot4LNj5cMRpRNdXYlY3A+XayB
 fF2g7NQuJyrL3/oE3Tq+6MrfCfpKvzXAllnPlrmxq9FSCcem5H5cl8q5u5p33g20cOVdwuvRjL5
 gue4GhwpIu7EC3Y5odg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_02,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 suspectscore=0 impostorscore=0 bulkscore=0
 adultscore=0 malwarescore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512190062

Add support for B-frame configuration on both gen1 and gen2 encoders by
enabling V4L2_CID_MPEG_VIDEO_B_FRAMES control.

Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_ctrls.c      | 30 ++++++++++++++++++++++
 drivers/media/platform/qcom/iris/iris_ctrls.h      |  1 +
 .../platform/qcom/iris/iris_hfi_gen1_command.c     |  8 ++++++
 .../platform/qcom/iris/iris_hfi_gen1_defines.h     | 10 ++++++++
 .../platform/qcom/iris/iris_platform_common.h      |  2 ++
 .../media/platform/qcom/iris/iris_platform_gen1.c  | 18 +++++++++++++
 .../media/platform/qcom/iris/iris_platform_gen2.c  | 10 ++++++++
 drivers/media/platform/qcom/iris/iris_vpu_buffer.c |  6 ++++-
 8 files changed, 84 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.c b/drivers/media/platform/qcom/iris/iris_ctrls.c
index 428203af725ab5697ee42b5adf9557c65fafd7f4..02106a4c47db7a8b2e6461acb9d24a22291ff3cb 100644
--- a/drivers/media/platform/qcom/iris/iris_ctrls.c
+++ b/drivers/media/platform/qcom/iris/iris_ctrls.c
@@ -114,6 +114,8 @@ static enum platform_inst_fw_cap_type iris_get_cap_id(u32 id)
 		return USE_LTR;
 	case V4L2_CID_MPEG_VIDEO_FRAME_LTR_INDEX:
 		return MARK_LTR;
+	case V4L2_CID_MPEG_VIDEO_B_FRAMES:
+		return B_FRAME;
 	default:
 		return INST_FW_CAP_MAX;
 	}
@@ -217,6 +219,8 @@ static u32 iris_get_v4l2_id(enum platform_inst_fw_cap_type cap_id)
 		return V4L2_CID_MPEG_VIDEO_USE_LTR_FRAMES;
 	case MARK_LTR:
 		return V4L2_CID_MPEG_VIDEO_FRAME_LTR_INDEX;
+	case B_FRAME:
+		return V4L2_CID_MPEG_VIDEO_B_FRAMES;
 	default:
 		return 0;
 	}
@@ -1153,6 +1157,32 @@ int iris_set_use_and_mark_ltr(struct iris_inst *inst, enum platform_inst_fw_cap_
 					     &hfi_val, sizeof(u32));
 }
 
+int iris_set_intra_period(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
+{
+	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
+	u32 gop_size = inst->fw_caps[GOP_SIZE].value;
+	u32 b_frame = inst->fw_caps[B_FRAME].value;
+	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
+	struct hfi_intra_period intra_period;
+
+	if (!gop_size || b_frame >= gop_size)
+		return -EINVAL;
+
+	/*
+	 * intra_period represents the length of a GOP, which includes both P-frames
+	 * and B-frames. The counts of P-frames and B-frames within a GOP must be
+	 * communicated to the firmware.
+	 */
+	intra_period.pframes = (gop_size - 1) / (b_frame + 1);
+	intra_period.bframes = b_frame;
+
+	return hfi_ops->session_set_property(inst, hfi_id,
+					     HFI_HOST_FLAGS_NONE,
+					     iris_get_port_info(inst, cap_id),
+					     HFI_PAYLOAD_STRUCTURE,
+					     &intra_period, sizeof(intra_period));
+}
+
 int iris_set_properties(struct iris_inst *inst, u32 plane)
 {
 	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.h b/drivers/media/platform/qcom/iris/iris_ctrls.h
index 996c83fdc6f492dc252771129fc1d62e8b7a7e07..609258c81517b71523b682ca994786cdd020b07f 100644
--- a/drivers/media/platform/qcom/iris/iris_ctrls.h
+++ b/drivers/media/platform/qcom/iris/iris_ctrls.h
@@ -41,6 +41,7 @@ int iris_set_ltr_count_gen2(struct iris_inst *inst, enum platform_inst_fw_cap_ty
 int iris_set_use_ltr(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
 int iris_set_mark_ltr(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
 int iris_set_use_and_mark_ltr(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
+int iris_set_intra_period(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
 int iris_set_properties(struct iris_inst *inst, u32 plane);
 
 #endif
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
index 139e7a9321d30d3e348671f99b0fa81afed4827e..fe51eccb903be146e83a4fb2faf4b4092875dea4 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
@@ -718,6 +718,14 @@ iris_hfi_gen1_packet_session_set_property(struct hfi_session_set_property_pkt *p
 		packet->shdr.hdr.size += sizeof(u32) + sizeof(*ltr_mark);
 		break;
 	}
+	case HFI_PROPERTY_CONFIG_VENC_INTRA_PERIOD: {
+		struct hfi_intra_period *in = pdata, *intra_period = prop_data;
+
+		intra_period->pframes = in->pframes;
+		intra_period->bframes = in->bframes;
+		packet->shdr.hdr.size += sizeof(u32) + sizeof(*intra_period);
+		break;
+	}
 	default:
 		return -EINVAL;
 	}
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h b/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
index 34249fc0d047918c2463517b8303e30df3666b97..4343661e86065f5623b2c02c7ee808a3c47a8c41 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
@@ -155,6 +155,7 @@
 #define HFI_PROPERTY_PARAM_VENC_LTRMODE				0x200501c
 #define HFI_PROPERTY_PARAM_VENC_MAX_NUM_B_FRAMES		0x2005020
 #define HFI_PROPERTY_CONFIG_VENC_TARGET_BITRATE			0x2006001
+#define HFI_PROPERTY_CONFIG_VENC_INTRA_PERIOD			0x2006003
 #define HFI_PROPERTY_CONFIG_VENC_MARKLTRFRAME			0x2006009
 #define HFI_PROPERTY_CONFIG_VENC_USELTRFRAME			0x200600a
 #define HFI_PROPERTY_CONFIG_VENC_SYNC_FRAME_SEQUENCE_HEADER	0x2006008
@@ -484,6 +485,15 @@ struct hfi_ltr_mark {
 	u32 mark_frame;
 };
 
+struct hfi_max_num_b_frames {
+	u32 max_num_b_frames;
+};
+
+struct hfi_intra_period {
+	u32 pframes;
+	u32 bframes;
+};
+
 struct hfi_event_data {
 	u32 error;
 	u32 height;
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index c48dfb6d47734fadd4f2e4123c93560f55355b86..34deb32eb5be0899fee779ff99b3f4b8bd91529f 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -154,6 +154,8 @@ enum platform_inst_fw_cap_type {
 	LTR_COUNT,
 	USE_LTR,
 	MARK_LTR,
+	B_FRAME,
+	INTRA_PERIOD,
 	INST_FW_CAP_MAX,
 };
 
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen1.c b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
index 13cee5f72a443b85136d30b41b589aeb0db8eb9a..78f3a44f4ef037a5291330627b3e94750b624f4d 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen1.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
@@ -279,6 +279,24 @@ static const struct platform_inst_fw_cap inst_fw_cap_sm8250_enc[] = {
 		.flags = CAP_FLAG_INPUT_PORT | CAP_FLAG_DYNAMIC_ALLOWED,
 		.set = iris_set_mark_ltr,
 	},
+	{
+		.cap_id = B_FRAME,
+		.min = 0,
+		.max = 3,
+		.step_or_mask = 1,
+		.value = 0,
+		.flags = CAP_FLAG_OUTPUT_PORT,
+	},
+	{
+		.cap_id = INTRA_PERIOD,
+		.min = 0,
+		.max = 1,
+		.step_or_mask = 1,
+		.value = 0,
+		.hfi_id = HFI_PROPERTY_CONFIG_VENC_INTRA_PERIOD,
+		.flags = CAP_FLAG_OUTPUT_PORT,
+		.set = iris_set_intra_period,
+	},
 };
 
 static struct platform_inst_caps platform_inst_cap_sm8250 = {
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
index 99d8e1e59e6bfd5e4ab0fd2b5831f74c54b6e87d..56b6a73bff8ae8e1da06a7b53632712932abe5bb 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
@@ -667,6 +667,16 @@ static const struct platform_inst_fw_cap inst_fw_cap_sm8550_enc[] = {
 		.flags = CAP_FLAG_INPUT_PORT | CAP_FLAG_DYNAMIC_ALLOWED,
 		.set = iris_set_use_and_mark_ltr,
 	},
+	{
+		.cap_id = B_FRAME,
+		.min = 0,
+		.max = 1,
+		.step_or_mask = 1,
+		.value = 0,
+		.hfi_id = HFI_PROP_MAX_B_FRAMES,
+		.flags = CAP_FLAG_OUTPUT_PORT,
+		.set = iris_set_u32,
+	},
 };
 
 static struct platform_inst_caps platform_inst_cap_sm8550 = {
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
index b7413edfbc5646fbdee6139d1e6897d730e2c8d1..b5fb616916e5c7bf46998fc14510af9c9341cf10 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
@@ -670,11 +670,15 @@ static u32 iris_vpu_enc_bin_size(struct iris_inst *inst)
 
 static inline u32 hfi_buffer_get_recon_count(struct iris_inst *inst)
 {
+	u32 bframe_count, ltr_count;
 	u32 num_ref = 1;
-	u32 ltr_count;
 
+	bframe_count = inst->fw_caps[B_FRAME].value;
 	ltr_count = inst->fw_caps[LTR_COUNT].value;
 
+	if (bframe_count)
+		num_ref = 2;
+
 	if (ltr_count)
 		num_ref = num_ref + ltr_count;
 

-- 
2.43.0


