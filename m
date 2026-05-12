Return-Path: <linux-media+bounces-61223-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6C27M3XsAmryygEAu9opvQ
	(envelope-from <linux-media+bounces-61223-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 11:01:41 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F064E51D319
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 11:01:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id BD15D3048BE8
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 08:57:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED7553A6F04;
	Tue, 12 May 2026 08:55:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kl4E7P+t";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hNN7kBQD"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FED83A5452
	for <linux-media@vger.kernel.org>; Tue, 12 May 2026 08:55:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778576150; cv=none; b=ULiZlAsWfu0/0kpRaefJJ6INb/44zhoWzAV2BKvZPKpM5HgiW4SLIh7C1VHmPRfKwqt9mMT2BHMatJyCC3S9PQMyZ6zrTaI+GILjbpnoUewjcfa0E2lRoPyfKgq3JrL43Y8WMH7eh6RkBIFklWMcf2FFEz0Vsz3qUWoL6nsUYjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778576150; c=relaxed/simple;
	bh=JWthXrwt2jsnrPtnSVWGCqc79fLIHu/WFtE4yTyR7gk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=A5nh95rc+f+w3YfgWrPMpynoaqsuaU3EC52//NTN9/KPmupGW44zWCkroBN64oi5Tuoy83NT8pii4gNLVCmKforYGX9XVOc2CaN9s1boOV1y+6Eo9XA80KNecGBTJgy5VOg3EMopGvGyu5A8Gtwen1l/e3d5+27q5nUx45+7vXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kl4E7P+t; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hNN7kBQD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64C5Bv6o2574392
	for <linux-media@vger.kernel.org>; Tue, 12 May 2026 08:55:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GSjDPqa8mA8IkXiaQe888faLXc7yZrZ0hWCLQjnHg8A=; b=kl4E7P+tvN92uCSb
	Sj5sxj7vkGPyBBQj8F83KAgoPPH/YMtJzxJyz8uD+p9jHRNWoWKNu6dwGzG5ijJg
	xwyxzOrBz0wK88ehBfWmQnfDLqJ5ueNGlWGdhX6vezzOUXdf+m6ek5Vng+fZov7j
	GPbfFG4hCwBPfLsNBcsVJ1KxzYiu2Oa/wcaGwEVJLDxjj+3gq1yH981GhOMwGQ+p
	sCmcQhVlQAUTFdx1NOm+7VDUmY74gAk69vSVUTnjRGXyan6HQIYNDRCLOPIURwYk
	yfuW3KEBdaOwScafUAxiyW23+peCp8ZyjdPVoSPkH4VWpf6PC3a2ENQfx2ZbV7yF
	o3SLdA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e3nv2ab5d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 12 May 2026 08:55:35 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ba3245a43dso44364965ad.0
        for <linux-media@vger.kernel.org>; Tue, 12 May 2026 01:55:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778576135; x=1779180935; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GSjDPqa8mA8IkXiaQe888faLXc7yZrZ0hWCLQjnHg8A=;
        b=hNN7kBQD1xDC+MFVjbYLNxV81ROL5E12FhLsOK6AVnr79/879NzeenrFqg3B/c+Pwi
         684h4584H1ipmJ9sGCFbiRfu4mCT/alwDkOyAZiHBgnqQgWHflMfCIPB5S3nGQtWHoRV
         kViuOjzoGVp21KSBH00aIRgn3PTGLqvLkaiUkZcHmkk2gIEd57kF2KMpHDhqQAICtes/
         LKbJgKS/vfNUndx7HTN/NcDC4oEeW6Fze2AW+uPRHyD3Lqh/Ua0y5bJeixkcAXyfzPFg
         9/x178G1t3V+gyrErb34yXA4/uoa0qlcGTp8JuqB80+Db2X+a6aIumYuany+KmCyTu5R
         rZTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778576135; x=1779180935;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GSjDPqa8mA8IkXiaQe888faLXc7yZrZ0hWCLQjnHg8A=;
        b=eIIp3HiSYxJBGfPcQl2+xtvNrBUJLhtj3Dd+Mmfujt2QYI/CyYTK/9XrHyjakUzgvx
         v0Q58xEDz21nXZjy6b+qub4P+9EBh2XXS+03AXLqJA2hbiHGB5YP43gXJQjgh9c2DUSJ
         ndm9tGV3PP7WofADXiJgzhCS8oT/8IDkHnE0f/OkD07+c//s/yKjjQ4uGaxA38QXahYG
         NhF9qurrPwS2HtnerwQu+Hvt7VjxQKuz0TS7GOWXF4YrQfaU2h+MxMLQtkMUf6BznTR5
         0dqvppaB6/dp6/PyD873YVqEE+bAxeU2lVAcc0RKn+Pec5wpoCcvh/HAk1y3ExRIFiGR
         wlvQ==
X-Gm-Message-State: AOJu0YwPEYzyu4k6M7Px6qE16aHeJ/YSLuNHmsMQWmFTpNlDE6YXA5s/
	yPvnWqwVx20/k/M2Gtwh5aPR7M0NuYxbpIZycaem2brRyUA4OLUVJ5M8RoQvsjfu899rwyVI0Js
	XKngURBd/IEesJHq6zIgTXvX7Qm5s7kVvvWPpWe2XfzFa+0FjrYdYXZf+Nfh+GTLw9A==
X-Gm-Gg: Acq92OGjsavlvlMhmLAuuPfRdnSJUVRkTbYRLxUBx/ld8IGZzWYGkHbpCmNzcC9GjEh
	Se8iFIJxChdDZfnlt6NdQf8EvYpQcJe8HA09cH/hbProntZuAsdUNECg0rDjEMIvosQhSqACAVf
	lx7S/eA4SNeIOrSQCLe6s01cviIpxTVRaRlvPig8p4x5vGmvmtEFIGHjJSL01ZwVDmtdPfl5XKr
	oJGobUqq6Z1eTMK5ErJ/sjuKQJ67LX6io7ET7hcvUAA2tSwCQOhMrt9u0XbPySjEjf+QNNdxiF1
	VEgQpSFBHieXf1db+KbSiLJhuPkAuA7D2KerfrM3XdHXPtdb/5GAFH5ORCX4A6M1csMdIDsUCz5
	KrpY/SuGnHKgcBeyx0ji01iOm4t+5IQQO+HQqwECYurRRx4ShCIQp/UH1wZnOUfwQ0PY+RbHfHO
	AASYTA5yAxgM8jlgPwqCSZ
X-Received: by 2002:a17:903:2ace:b0:2ba:9e1c:7cbb with SMTP id d9443c01a7336-2bd012ae0e6mr23868455ad.34.1778576134217;
        Tue, 12 May 2026 01:55:34 -0700 (PDT)
X-Received: by 2002:a17:903:2ace:b0:2ba:9e1c:7cbb with SMTP id d9443c01a7336-2bd012ae0e6mr23867945ad.34.1778576133529;
        Tue, 12 May 2026 01:55:33 -0700 (PDT)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1e90854sm127641405ad.66.2026.05.12.01.55.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 01:55:33 -0700 (PDT)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Date: Tue, 12 May 2026 16:55:13 +0800
Subject: [PATCH v7 4/6] media: qcom: iris: Add hierarchical coding support
 for encoder
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260512-batch2_features-v7-4-4954e3b4df84@oss.qualcomm.com>
References: <20260512-batch2_features-v7-0-4954e3b4df84@oss.qualcomm.com>
In-Reply-To: <20260512-batch2_features-v7-0-4954e3b4df84@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Wangao Wang <wangao.wang@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778576115; l=31608;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=JWthXrwt2jsnrPtnSVWGCqc79fLIHu/WFtE4yTyR7gk=;
 b=Q1R6G7tpsym4ixIvCrXCdfmt6Np+/GiAennMlyCXVIyuqa0tO79ECv1kfaeDmjgK6tP2BHv16
 GSC5VQ0JyvgCre95DLgm9NvA9cnEh1fuy9rVgmTpDiBPK4u3geCaF/q
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Authority-Analysis: v=2.4 cv=IsAutr/g c=1 sm=1 tr=0 ts=6a02eb07 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=pEw79mLSGxr9eRpYBYUA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: HqNT8TbaaHuLHYetfuBxukVwK-VA0J4N
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDA5MCBTYWx0ZWRfX0KRGFO7rd/1f
 nKLG/xuWlIbQloWWvaFjVrzHsSjBtcknUxaAyU58WEN03NjAmH9dj32XRU281REG0YZUvHP9RdR
 a693PrmDFalCheB//1VQIlszvlUgsYvdVhmESe9B71FMZdU3hnPvdb6Bc5l1udNR4iWWj6+1qQp
 7CNKzaDavhQClsOh03nUEGC2ypktfy0HE3C1fQFE3+jMumrAsxoDrGC+u8aCLXC+70YyhRs9qjC
 g4ZrdUKepK/W225DkWSUMjSO1fbvU8O9AcoWNtGT7ZO9/1srju7R3b0mLJAij1vG8HutTtdn2sn
 9hLooswB4md8FlxAwCGTGBWoH7ETP6O5ZJjSt84DLGDTXTKjCyA7KOz47UIuZqmnj/kBWnkHjdq
 m8qcesxT9eFNbKZYwpB7PN0ry82JFhO1SYv8575A8l/iLKowNnBCnoEMybRhRSAWV0gdB9nbtq/
 VpktRaoYEoYdSZrMMnQ==
X-Proofpoint-ORIG-GUID: HqNT8TbaaHuLHYetfuBxukVwK-VA0J4N
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 clxscore=1015 phishscore=0
 malwarescore=0 impostorscore=0 priorityscore=1501 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605120090
X-Rspamd-Queue-Id: F064E51D319
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-61223-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FROM_NEQ_ENVFROM(0.00)[wangao.wang@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Add hierarchical coding support for both gen1 and gen2 encoders by enabling
 the following V4L2 controls:
H264:
V4L2_CID_MPEG_VIDEO_H264_HIERARCHICAL_CODING,
V4L2_CID_MPEG_VIDEO_H264_HIERARCHICAL_CODING_TYPE,
V4L2_CID_MPEG_VIDEO_H264_HIERARCHICAL_CODING_LAYER
HEVC(gen2 only):
V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_TYPE,
V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_LAYER

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_ctrls.c      | 288 ++++++++++++++++++++-
 drivers/media/platform/qcom/iris/iris_ctrls.h      |   7 +-
 drivers/media/platform/qcom/iris/iris_hfi_gen1.c   |  94 ++++++-
 .../platform/qcom/iris/iris_hfi_gen1_command.c     |  21 +-
 .../platform/qcom/iris/iris_hfi_gen1_defines.h     |   2 +
 drivers/media/platform/qcom/iris/iris_hfi_gen2.c   | 184 ++++++++++++-
 .../platform/qcom/iris/iris_hfi_gen2_defines.h     |  15 ++
 drivers/media/platform/qcom/iris/iris_instance.h   |   4 +
 .../platform/qcom/iris/iris_platform_common.h      |  23 ++
 drivers/media/platform/qcom/iris/iris_vpu_buffer.c |  28 ++
 10 files changed, 658 insertions(+), 8 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.c b/drivers/media/platform/qcom/iris/iris_ctrls.c
index a6bd2eada52b68afd91032315c2701d8c74a9763..10e33b8a73f60759c4f1cb17b5c95897f0e1468f 100644
--- a/drivers/media/platform/qcom/iris/iris_ctrls.c
+++ b/drivers/media/platform/qcom/iris/iris_ctrls.c
@@ -120,6 +120,40 @@ static enum platform_inst_fw_cap_type iris_get_cap_id(u32 id)
 		return MARK_LTR;
 	case V4L2_CID_MPEG_VIDEO_B_FRAMES:
 		return B_FRAME;
+	case V4L2_CID_MPEG_VIDEO_H264_HIERARCHICAL_CODING:
+		return LAYER_ENABLE;
+	case V4L2_CID_MPEG_VIDEO_H264_HIERARCHICAL_CODING_TYPE:
+		return LAYER_TYPE_H264;
+	case V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_TYPE:
+		return LAYER_TYPE_HEVC;
+	case V4L2_CID_MPEG_VIDEO_H264_HIERARCHICAL_CODING_LAYER:
+		return LAYER_COUNT_H264;
+	case V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_LAYER:
+		return LAYER_COUNT_HEVC;
+	case V4L2_CID_MPEG_VIDEO_H264_HIER_CODING_L0_BR:
+		return LAYER0_BITRATE_H264;
+	case V4L2_CID_MPEG_VIDEO_H264_HIER_CODING_L1_BR:
+		return LAYER1_BITRATE_H264;
+	case V4L2_CID_MPEG_VIDEO_H264_HIER_CODING_L2_BR:
+		return LAYER2_BITRATE_H264;
+	case V4L2_CID_MPEG_VIDEO_H264_HIER_CODING_L3_BR:
+		return LAYER3_BITRATE_H264;
+	case V4L2_CID_MPEG_VIDEO_H264_HIER_CODING_L4_BR:
+		return LAYER4_BITRATE_H264;
+	case V4L2_CID_MPEG_VIDEO_H264_HIER_CODING_L5_BR:
+		return LAYER5_BITRATE_H264;
+	case V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L0_BR:
+		return LAYER0_BITRATE_HEVC;
+	case V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L1_BR:
+		return LAYER1_BITRATE_HEVC;
+	case V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L2_BR:
+		return LAYER2_BITRATE_HEVC;
+	case V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L3_BR:
+		return LAYER3_BITRATE_HEVC;
+	case V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L4_BR:
+		return LAYER4_BITRATE_HEVC;
+	case V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L5_BR:
+		return LAYER5_BITRATE_HEVC;
 	default:
 		return INST_FW_CAP_MAX;
 	}
@@ -229,6 +263,40 @@ static u32 iris_get_v4l2_id(enum platform_inst_fw_cap_type cap_id)
 		return V4L2_CID_MPEG_VIDEO_FRAME_LTR_INDEX;
 	case B_FRAME:
 		return V4L2_CID_MPEG_VIDEO_B_FRAMES;
+	case LAYER_ENABLE:
+		return V4L2_CID_MPEG_VIDEO_H264_HIERARCHICAL_CODING;
+	case LAYER_TYPE_H264:
+		return V4L2_CID_MPEG_VIDEO_H264_HIERARCHICAL_CODING_TYPE;
+	case LAYER_TYPE_HEVC:
+		return V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_TYPE;
+	case LAYER_COUNT_H264:
+		return V4L2_CID_MPEG_VIDEO_H264_HIERARCHICAL_CODING_LAYER;
+	case LAYER_COUNT_HEVC:
+		return V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_LAYER;
+	case LAYER0_BITRATE_H264:
+		return V4L2_CID_MPEG_VIDEO_H264_HIER_CODING_L0_BR;
+	case LAYER1_BITRATE_H264:
+		return V4L2_CID_MPEG_VIDEO_H264_HIER_CODING_L1_BR;
+	case LAYER2_BITRATE_H264:
+		return V4L2_CID_MPEG_VIDEO_H264_HIER_CODING_L2_BR;
+	case LAYER3_BITRATE_H264:
+		return V4L2_CID_MPEG_VIDEO_H264_HIER_CODING_L3_BR;
+	case LAYER4_BITRATE_H264:
+		return V4L2_CID_MPEG_VIDEO_H264_HIER_CODING_L4_BR;
+	case LAYER5_BITRATE_H264:
+		return V4L2_CID_MPEG_VIDEO_H264_HIER_CODING_L5_BR;
+	case LAYER0_BITRATE_HEVC:
+		return V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L0_BR;
+	case LAYER1_BITRATE_HEVC:
+		return V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L1_BR;
+	case LAYER2_BITRATE_HEVC:
+		return V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L2_BR;
+	case LAYER3_BITRATE_HEVC:
+		return V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L3_BR;
+	case LAYER4_BITRATE_HEVC:
+		return V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L4_BR;
+	case LAYER5_BITRATE_HEVC:
+		return V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L5_BR;
 	default:
 		return 0;
 	}
@@ -575,7 +643,64 @@ int iris_set_header_mode_gen2(struct iris_inst *inst, enum platform_inst_fw_cap_
 				     &hfi_val, sizeof(u32));
 }
 
-int iris_set_bitrate(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
+int iris_set_bitrate_gen1(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
+{
+	const struct iris_hfi_session_ops *hfi_ops = inst->hfi_session_ops;
+	u32 entropy_mode = inst->fw_caps[ENTROPY_MODE].value;
+	u32 bitrate = inst->fw_caps[cap_id].value;
+	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
+	struct hfi_bitrate hfi_val;
+	u32 max_bitrate;
+
+	if (!(inst->fw_caps[cap_id].flags & CAP_FLAG_CLIENT_SET) && cap_id != BITRATE)
+		return -EINVAL;
+
+	if (inst->codec == V4L2_PIX_FMT_HEVC) {
+		max_bitrate = CABAC_MAX_BITRATE;
+	} else {
+		if (entropy_mode == V4L2_MPEG_VIDEO_H264_ENTROPY_MODE_CABAC)
+			max_bitrate = CABAC_MAX_BITRATE;
+		else
+			max_bitrate = CAVLC_MAX_BITRATE;
+	}
+
+	hfi_val.bitrate = min(bitrate, max_bitrate);
+
+	switch (cap_id) {
+	case BITRATE:
+	case LAYER0_BITRATE_H264:
+		hfi_val.layer_id = 0;
+		break;
+	case LAYER1_BITRATE_H264:
+		hfi_val.layer_id = 1;
+		break;
+	case LAYER2_BITRATE_H264:
+		hfi_val.layer_id = 2;
+		break;
+	case LAYER3_BITRATE_H264:
+		hfi_val.layer_id = 3;
+		break;
+	case LAYER4_BITRATE_H264:
+		hfi_val.layer_id = 4;
+		break;
+	case LAYER5_BITRATE_H264:
+		hfi_val.layer_id = 5;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	if (hfi_val.layer_id > 0 && !inst->fw_caps[LAYER_ENABLE].value)
+		return -EINVAL;
+
+	return hfi_ops->session_set_property(inst, hfi_id,
+					     HFI_HOST_FLAGS_NONE,
+					     iris_get_port_info(inst, cap_id),
+					     HFI_PAYLOAD_STRUCTURE,
+					     &hfi_val, sizeof(hfi_val));
+}
+
+int iris_set_bitrate_gen2(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
 {
 	const struct iris_hfi_session_ops *hfi_ops = inst->hfi_session_ops;
 	u32 entropy_mode = inst->fw_caps[ENTROPY_MODE].value;
@@ -1191,6 +1316,167 @@ int iris_set_intra_period(struct iris_inst *inst, enum platform_inst_fw_cap_type
 					     &intra_period, sizeof(intra_period));
 }
 
+int iris_set_layer_type(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
+{
+	const struct iris_hfi_session_ops *hfi_ops = inst->hfi_session_ops;
+	u32 layer_enable = inst->fw_caps[LAYER_ENABLE].value;
+	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
+	u32 layer_type;
+
+	if (inst->hfi_rc_type == HFI_RATE_CONTROL_CQ ||
+	    inst->hfi_rc_type == HFI_RATE_CONTROL_OFF)
+		return -EINVAL;
+
+	if (inst->codec == V4L2_PIX_FMT_H264) {
+		if (!layer_enable || !inst->fw_caps[LAYER_COUNT_H264].value)
+			return -EINVAL;
+
+		if (inst->fw_caps[LAYER_TYPE_H264].value ==
+			V4L2_MPEG_VIDEO_H264_HIERARCHICAL_CODING_P) {
+			if (inst->hfi_rc_type == HFI_RC_VBR_CFR)
+				layer_type = HFI_HIER_P_HYBRID_LTR;
+			else
+				layer_type = HFI_HIER_P_SLIDING_WINDOW;
+		} else if (inst->fw_caps[LAYER_TYPE_H264].value ==
+			V4L2_MPEG_VIDEO_H264_HIERARCHICAL_CODING_B) {
+			if (inst->hfi_rc_type == HFI_RC_VBR_CFR)
+				layer_type = HFI_HIER_B;
+			else
+				return -EINVAL;
+		} else {
+			return -EINVAL;
+		}
+	} else if (inst->codec == V4L2_PIX_FMT_HEVC) {
+		if (!inst->fw_caps[LAYER_COUNT_HEVC].value)
+			return -EINVAL;
+
+		if (inst->fw_caps[LAYER_TYPE_HEVC].value ==
+			V4L2_MPEG_VIDEO_HEVC_HIERARCHICAL_CODING_P) {
+			layer_type = HFI_HIER_P_SLIDING_WINDOW;
+		} else if (inst->fw_caps[LAYER_TYPE_HEVC].value ==
+			V4L2_MPEG_VIDEO_HEVC_HIERARCHICAL_CODING_B) {
+			if (inst->hfi_rc_type == HFI_RC_VBR_CFR)
+				layer_type = HFI_HIER_B;
+			else
+				return -EINVAL;
+		} else {
+			return -EINVAL;
+		}
+	} else {
+		return -EINVAL;
+	}
+
+	inst->hfi_layer_type = layer_type;
+
+	return hfi_ops->session_set_property(inst, hfi_id,
+					     HFI_HOST_FLAGS_NONE,
+					     iris_get_port_info(inst, cap_id),
+					     HFI_PAYLOAD_U32_ENUM,
+					     &layer_type, sizeof(u32));
+}
+
+int iris_set_layer_count_gen1(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
+{
+	const struct iris_hfi_session_ops *hfi_ops = inst->hfi_session_ops;
+	struct vb2_queue *sq = v4l2_m2m_get_src_vq(inst->m2m_ctx);
+	struct vb2_queue *dq = v4l2_m2m_get_dst_vq(inst->m2m_ctx);
+	u32 layer_enable = inst->fw_caps[LAYER_ENABLE].value;
+	u32 layer_count = inst->fw_caps[cap_id].value;
+	u32 hfi_id, ret;
+
+	if (!layer_enable || !layer_count)
+		return -EINVAL;
+
+	inst->hfi_layer_count = layer_count;
+
+	if (!vb2_is_streaming(sq) && !vb2_is_streaming(dq)) {
+		hfi_id = HFI_PROPERTY_PARAM_VENC_HIER_P_MAX_NUM_ENH_LAYER;
+		ret = hfi_ops->session_set_property(inst, hfi_id,
+						    HFI_HOST_FLAGS_NONE,
+						    iris_get_port_info(inst, cap_id),
+						    HFI_PAYLOAD_U32,
+						    &layer_count, sizeof(u32));
+		if (ret)
+			return ret;
+	}
+
+	hfi_id = inst->fw_caps[cap_id].hfi_id;
+	return hfi_ops->session_set_property(inst, hfi_id,
+					     HFI_HOST_FLAGS_NONE,
+					     iris_get_port_info(inst, cap_id),
+					     HFI_PAYLOAD_U32,
+					     &layer_count, sizeof(u32));
+}
+
+int iris_set_layer_count_gen2(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
+{
+	const struct iris_hfi_session_ops *hfi_ops = inst->hfi_session_ops;
+	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
+	u32 layer_type = inst->hfi_layer_type;
+	u32 layer_count, layer_count_max;
+
+	layer_count = (inst->codec == V4L2_PIX_FMT_H264) ?
+		inst->fw_caps[LAYER_COUNT_H264].value :
+		inst->fw_caps[LAYER_COUNT_HEVC].value;
+
+	if (!layer_count)
+		return -EINVAL;
+
+	if (layer_type == HFI_HIER_B) {
+		layer_count_max = MAX_LAYER_HB;
+	} else if (layer_type == HFI_HIER_P_HYBRID_LTR) {
+		layer_count_max = MAX_AVC_LAYER_HP_HYBRID_LTR;
+	} else if (layer_type == HFI_HIER_P_SLIDING_WINDOW) {
+		if (inst->codec == V4L2_PIX_FMT_H264) {
+			layer_count_max = MAX_AVC_LAYER_HP_SLIDING_WINDOW;
+		} else {
+			if (inst->hfi_rc_type == HFI_RC_VBR_CFR)
+				layer_count_max = MAX_HEVC_VBR_LAYER_HP_SLIDING_WINDOW;
+			else
+				layer_count_max = MAX_HEVC_LAYER_HP_SLIDING_WINDOW;
+		}
+	} else {
+		return -EINVAL;
+	}
+
+	if (layer_count > layer_count_max)
+		layer_count = layer_count_max;
+
+	layer_count += 1; /* base layer */
+	inst->hfi_layer_count = layer_count;
+
+	return hfi_ops->session_set_property(inst, hfi_id,
+					     HFI_HOST_FLAGS_NONE,
+					     iris_get_port_info(inst, cap_id),
+					     HFI_PAYLOAD_U32,
+					     &layer_count, sizeof(u32));
+}
+
+int iris_set_layer_bitrate(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
+{
+	const struct iris_hfi_session_ops *hfi_ops = inst->hfi_session_ops;
+	struct vb2_queue *sq = v4l2_m2m_get_src_vq(inst->m2m_ctx);
+	struct vb2_queue *dq = v4l2_m2m_get_dst_vq(inst->m2m_ctx);
+	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
+	u32 bitrate = inst->fw_caps[cap_id].value;
+
+	/* ignore layer bitrate when total bitrate is set */
+	if (inst->fw_caps[BITRATE].flags & CAP_FLAG_CLIENT_SET)
+		return 0;
+
+	if (!(inst->fw_caps[cap_id].flags & CAP_FLAG_CLIENT_SET))
+		return -EINVAL;
+
+	if (!vb2_is_streaming(sq) && !vb2_is_streaming(dq))
+		return -EINVAL;
+
+	return hfi_ops->session_set_property(inst, hfi_id,
+					     HFI_HOST_FLAGS_NONE,
+					     iris_get_port_info(inst, cap_id),
+					     HFI_PAYLOAD_U32,
+					     &bitrate, sizeof(u32));
+}
+
 int iris_set_properties(struct iris_inst *inst, u32 plane)
 {
 	const struct iris_hfi_session_ops *hfi_ops = inst->hfi_session_ops;
diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.h b/drivers/media/platform/qcom/iris/iris_ctrls.h
index 609258c81517b71523b682ca994786cdd020b07f..3c462ec9190be8935176b290588f224fe4f144a4 100644
--- a/drivers/media/platform/qcom/iris/iris_ctrls.h
+++ b/drivers/media/platform/qcom/iris/iris_ctrls.h
@@ -22,7 +22,8 @@ int iris_set_level(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id
 int iris_set_profile_level_gen1(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
 int iris_set_header_mode_gen1(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
 int iris_set_header_mode_gen2(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
-int iris_set_bitrate(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
+int iris_set_bitrate_gen1(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
+int iris_set_bitrate_gen2(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
 int iris_set_peak_bitrate(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
 int iris_set_bitrate_mode_gen1(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
 int iris_set_bitrate_mode_gen2(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
@@ -42,6 +43,10 @@ int iris_set_use_ltr(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_
 int iris_set_mark_ltr(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
 int iris_set_use_and_mark_ltr(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
 int iris_set_intra_period(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
+int iris_set_layer_type(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
+int iris_set_layer_count_gen1(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
+int iris_set_layer_count_gen2(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
+int iris_set_layer_bitrate(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
 int iris_set_properties(struct iris_inst *inst, u32 plane);
 
 #endif
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1.c
index 792441463b4bad19da5a45b46c4dafcf2caa75c3..ca1545d28b5310d8c45a905287dcb69f6184d9cc 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1.c
@@ -136,7 +136,7 @@ static const struct platform_inst_fw_cap inst_fw_cap_sm8250_enc[] = {
 		.hfi_id = HFI_PROPERTY_CONFIG_VENC_TARGET_BITRATE,
 		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
 			CAP_FLAG_DYNAMIC_ALLOWED,
-		.set = iris_set_bitrate,
+		.set = iris_set_bitrate_gen1,
 	},
 	{
 		.cap_id = BITRATE_MODE,
@@ -291,6 +291,98 @@ static const struct platform_inst_fw_cap inst_fw_cap_sm8250_enc[] = {
 		.flags = CAP_FLAG_OUTPUT_PORT,
 		.set = iris_set_intra_period,
 	},
+	{
+		.cap_id = LAYER_ENABLE,
+		.min = 0,
+		.max = 1,
+		.step_or_mask = 1,
+		.value = 0,
+		.flags = CAP_FLAG_OUTPUT_PORT,
+	},
+	{
+		.cap_id = LAYER_TYPE_H264,
+		.min = V4L2_MPEG_VIDEO_H264_HIERARCHICAL_CODING_P,
+		.max = V4L2_MPEG_VIDEO_H264_HIERARCHICAL_CODING_P,
+		.step_or_mask = BIT(V4L2_MPEG_VIDEO_H264_HIERARCHICAL_CODING_P),
+		.value = V4L2_MPEG_VIDEO_H264_HIERARCHICAL_CODING_P,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
+	},
+	{
+		.cap_id = LAYER_COUNT_H264,
+		.min = 0,
+		.max = MAX_HIER_CODING_LAYER_GEN1,
+		.step_or_mask = 1,
+		.value = 0,
+		.hfi_id = HFI_PROPERTY_CONFIG_VENC_HIER_P_ENH_LAYER,
+		.flags = CAP_FLAG_OUTPUT_PORT,
+		.set = iris_set_layer_count_gen1,
+	},
+	{
+		.cap_id = LAYER0_BITRATE_H264,
+		.min = 1,
+		.max = BITRATE_MAX,
+		.step_or_mask = 1,
+		.value = BITRATE_DEFAULT,
+		.hfi_id = HFI_PROPERTY_CONFIG_VENC_TARGET_BITRATE,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
+			CAP_FLAG_DYNAMIC_ALLOWED,
+		.set = iris_set_bitrate_gen1,
+	},
+	{
+		.cap_id = LAYER1_BITRATE_H264,
+		.min = 1,
+		.max = BITRATE_MAX,
+		.step_or_mask = 1,
+		.value = BITRATE_DEFAULT,
+		.hfi_id = HFI_PROPERTY_CONFIG_VENC_TARGET_BITRATE,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
+			CAP_FLAG_DYNAMIC_ALLOWED,
+		.set = iris_set_bitrate_gen1,
+	},
+	{
+		.cap_id = LAYER2_BITRATE_H264,
+		.min = 1,
+		.max = BITRATE_MAX,
+		.step_or_mask = 1,
+		.value = BITRATE_DEFAULT,
+		.hfi_id = HFI_PROPERTY_CONFIG_VENC_TARGET_BITRATE,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
+			CAP_FLAG_DYNAMIC_ALLOWED,
+		.set = iris_set_bitrate_gen1,
+	},
+	{
+		.cap_id = LAYER3_BITRATE_H264,
+		.min = 1,
+		.max = BITRATE_MAX,
+		.step_or_mask = 1,
+		.value = BITRATE_DEFAULT,
+		.hfi_id = HFI_PROPERTY_CONFIG_VENC_TARGET_BITRATE,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
+			CAP_FLAG_DYNAMIC_ALLOWED,
+		.set = iris_set_bitrate_gen1,
+	},
+	{
+		.cap_id = LAYER4_BITRATE_H264,
+		.min = 1,
+		.max = BITRATE_MAX,
+		.step_or_mask = 1,
+		.value = BITRATE_DEFAULT,
+		.hfi_id = HFI_PROPERTY_CONFIG_VENC_TARGET_BITRATE,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
+			CAP_FLAG_DYNAMIC_ALLOWED,
+		.set = iris_set_bitrate_gen1,
+	},
+	{
+		.cap_id = LAYER5_BITRATE_H264,
+		.min = 1,
+		.max = BITRATE_MAX,
+		.step_or_mask = 1,
+		.value = BITRATE_DEFAULT,
+		.hfi_id = HFI_PROPERTY_CONFIG_VENC_TARGET_BITRATE,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
+			CAP_FLAG_DYNAMIC_ALLOWED,
+		.set = iris_set_bitrate_gen1,
+	},
 };
 
 static const u32 sm8250_vdec_input_config_param_default[] = {
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
index 05e7b5ff2b9224b201cf87858c0375ac6866e9bb..4cb54e5e4f1f15137d08027ac9a0d46c46784ea8 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
@@ -604,11 +604,10 @@ iris_hfi_gen1_packet_session_set_property(struct hfi_session_set_property_pkt *p
 		break;
 	}
 	case HFI_PROPERTY_CONFIG_VENC_TARGET_BITRATE: {
-		struct hfi_bitrate *brate = prop_data;
-		u32 *in = pdata;
+		struct hfi_bitrate *in = pdata, *brate = prop_data;
 
-		brate->bitrate = *in;
-		brate->layer_id = 0;
+		brate->bitrate = in->bitrate;
+		brate->layer_id = in->layer_id;
 		packet->shdr.hdr.size += sizeof(u32) + sizeof(*brate);
 		break;
 	}
@@ -728,6 +727,20 @@ iris_hfi_gen1_packet_session_set_property(struct hfi_session_set_property_pkt *p
 		packet->shdr.hdr.size += sizeof(u32) + sizeof(*intra_period);
 		break;
 	}
+	case HFI_PROPERTY_PARAM_VENC_HIER_P_MAX_NUM_ENH_LAYER: {
+		u32 *in = pdata;
+
+		packet->data[1] = *in;
+		packet->shdr.hdr.size += sizeof(u32) + sizeof(u32);
+		break;
+	}
+	case HFI_PROPERTY_CONFIG_VENC_HIER_P_ENH_LAYER: {
+		u32 *in = pdata;
+
+		packet->data[1] = *in;
+		packet->shdr.hdr.size += sizeof(u32) + sizeof(u32);
+		break;
+	}
 	default:
 		return -EINVAL;
 	}
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h b/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
index 4343661e86065f5623b2c02c7ee808a3c47a8c41..0e4dee19238464a9671a94eaab8eeda2d7f7ca9f 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
@@ -154,11 +154,13 @@
 
 #define HFI_PROPERTY_PARAM_VENC_LTRMODE				0x200501c
 #define HFI_PROPERTY_PARAM_VENC_MAX_NUM_B_FRAMES		0x2005020
+#define HFI_PROPERTY_PARAM_VENC_HIER_P_MAX_NUM_ENH_LAYER	0x2005026
 #define HFI_PROPERTY_CONFIG_VENC_TARGET_BITRATE			0x2006001
 #define HFI_PROPERTY_CONFIG_VENC_INTRA_PERIOD			0x2006003
 #define HFI_PROPERTY_CONFIG_VENC_MARKLTRFRAME			0x2006009
 #define HFI_PROPERTY_CONFIG_VENC_USELTRFRAME			0x200600a
 #define HFI_PROPERTY_CONFIG_VENC_SYNC_FRAME_SEQUENCE_HEADER	0x2006008
+#define HFI_PROPERTY_CONFIG_VENC_HIER_P_ENH_LAYER		0x200600b
 
 struct hfi_pkt_hdr {
 	u32 size;
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
index 27878b70e516bec0eefbb094b58ecba882332bf5..7a85c1d4e5e699dc7c615865035b43d94217ce16 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
@@ -391,7 +391,7 @@ static const struct platform_inst_fw_cap inst_fw_cap_sm8550_enc[] = {
 		.hfi_id = HFI_PROP_TOTAL_BITRATE,
 		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
 			CAP_FLAG_DYNAMIC_ALLOWED,
-		.set = iris_set_bitrate,
+		.set = iris_set_bitrate_gen2,
 	},
 	{
 		.cap_id = BITRATE_PEAK,
@@ -755,6 +755,188 @@ static const struct platform_inst_fw_cap inst_fw_cap_sm8550_enc[] = {
 		.flags = CAP_FLAG_OUTPUT_PORT,
 		.set = iris_set_u32,
 	},
+	{
+		.cap_id = LAYER_ENABLE,
+		.min = 0,
+		.max = 1,
+		.step_or_mask = 1,
+		.value = 0,
+		.flags = CAP_FLAG_OUTPUT_PORT,
+	},
+	{
+		.cap_id = LAYER_TYPE_H264,
+		.min = V4L2_MPEG_VIDEO_H264_HIERARCHICAL_CODING_B,
+		.max = V4L2_MPEG_VIDEO_H264_HIERARCHICAL_CODING_P,
+		.step_or_mask = BIT(V4L2_MPEG_VIDEO_H264_HIERARCHICAL_CODING_B) |
+				BIT(V4L2_MPEG_VIDEO_H264_HIERARCHICAL_CODING_P),
+		.value = V4L2_MPEG_VIDEO_H264_HIERARCHICAL_CODING_P,
+		.hfi_id = HFI_PROP_LAYER_ENCODING_TYPE,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
+		.set = iris_set_layer_type,
+	},
+	{
+		.cap_id = LAYER_TYPE_HEVC,
+		.min = V4L2_MPEG_VIDEO_HEVC_HIERARCHICAL_CODING_B,
+		.max = V4L2_MPEG_VIDEO_HEVC_HIERARCHICAL_CODING_P,
+		.step_or_mask = BIT(V4L2_MPEG_VIDEO_HEVC_HIERARCHICAL_CODING_B) |
+				BIT(V4L2_MPEG_VIDEO_HEVC_HIERARCHICAL_CODING_P),
+		.value = V4L2_MPEG_VIDEO_HEVC_HIERARCHICAL_CODING_P,
+		.hfi_id = HFI_PROP_LAYER_ENCODING_TYPE,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
+		.set = iris_set_layer_type,
+	},
+	{
+		.cap_id = LAYER_COUNT_H264,
+		.min = 0,
+		.max = 5,
+		.step_or_mask = 1,
+		.value = 0,
+		.hfi_id = HFI_PROP_LAYER_COUNT,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_DYNAMIC_ALLOWED,
+		.set = iris_set_layer_count_gen2,
+	},
+	{
+		.cap_id = LAYER_COUNT_HEVC,
+		.min = 0,
+		.max = 5,
+		.step_or_mask = 1,
+		.value = 0,
+		.hfi_id = HFI_PROP_LAYER_COUNT,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_DYNAMIC_ALLOWED,
+		.set = iris_set_layer_count_gen2,
+	},
+	{
+		.cap_id = LAYER0_BITRATE_H264,
+		.min = 1,
+		.max = BITRATE_MAX,
+		.step_or_mask = 1,
+		.value = BITRATE_DEFAULT,
+		.hfi_id = HFI_PROP_BITRATE_LAYER1,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
+			CAP_FLAG_DYNAMIC_ALLOWED,
+		.set = iris_set_layer_bitrate,
+	},
+	{
+		.cap_id = LAYER1_BITRATE_H264,
+		.min = 1,
+		.max = BITRATE_MAX,
+		.step_or_mask = 1,
+		.value = BITRATE_DEFAULT,
+		.hfi_id = HFI_PROP_BITRATE_LAYER2,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
+			CAP_FLAG_DYNAMIC_ALLOWED,
+		.set = iris_set_layer_bitrate,
+	},
+	{
+		.cap_id = LAYER2_BITRATE_H264,
+		.min = 1,
+		.max = BITRATE_MAX,
+		.step_or_mask = 1,
+		.value = BITRATE_DEFAULT,
+		.hfi_id = HFI_PROP_BITRATE_LAYER3,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
+			CAP_FLAG_DYNAMIC_ALLOWED,
+		.set = iris_set_layer_bitrate,
+	},
+	{
+		.cap_id = LAYER3_BITRATE_H264,
+		.min = 1,
+		.max = BITRATE_MAX,
+		.step_or_mask = 1,
+		.value = BITRATE_DEFAULT,
+		.hfi_id = HFI_PROP_BITRATE_LAYER4,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
+			CAP_FLAG_DYNAMIC_ALLOWED,
+		.set = iris_set_layer_bitrate,
+	},
+	{
+		.cap_id = LAYER4_BITRATE_H264,
+		.min = 1,
+		.max = BITRATE_MAX,
+		.step_or_mask = 1,
+		.value = BITRATE_DEFAULT,
+		.hfi_id = HFI_PROP_BITRATE_LAYER5,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
+			CAP_FLAG_DYNAMIC_ALLOWED,
+		.set = iris_set_layer_bitrate,
+	},
+	{
+		.cap_id = LAYER5_BITRATE_H264,
+		.min = 1,
+		.max = BITRATE_MAX,
+		.step_or_mask = 1,
+		.value = BITRATE_DEFAULT,
+		.hfi_id = HFI_PROP_BITRATE_LAYER6,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
+			CAP_FLAG_DYNAMIC_ALLOWED,
+		.set = iris_set_layer_bitrate,
+	},
+	{
+		.cap_id = LAYER0_BITRATE_HEVC,
+		.min = 1,
+		.max = BITRATE_MAX,
+		.step_or_mask = 1,
+		.value = BITRATE_DEFAULT,
+		.hfi_id = HFI_PROP_BITRATE_LAYER1,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
+			CAP_FLAG_DYNAMIC_ALLOWED,
+		.set = iris_set_layer_bitrate,
+	},
+	{
+		.cap_id = LAYER1_BITRATE_HEVC,
+		.min = 1,
+		.max = BITRATE_MAX,
+		.step_or_mask = 1,
+		.value = BITRATE_DEFAULT,
+		.hfi_id = HFI_PROP_BITRATE_LAYER2,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
+			CAP_FLAG_DYNAMIC_ALLOWED,
+		.set = iris_set_layer_bitrate,
+	},
+	{
+		.cap_id = LAYER2_BITRATE_HEVC,
+		.min = 1,
+		.max = BITRATE_MAX,
+		.step_or_mask = 1,
+		.value = BITRATE_DEFAULT,
+		.hfi_id = HFI_PROP_BITRATE_LAYER3,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
+			CAP_FLAG_DYNAMIC_ALLOWED,
+		.set = iris_set_layer_bitrate,
+	},
+	{
+		.cap_id = LAYER3_BITRATE_HEVC,
+		.min = 1,
+		.max = BITRATE_MAX,
+		.step_or_mask = 1,
+		.value = BITRATE_DEFAULT,
+		.hfi_id = HFI_PROP_BITRATE_LAYER4,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
+			CAP_FLAG_DYNAMIC_ALLOWED,
+		.set = iris_set_layer_bitrate,
+	},
+	{
+		.cap_id = LAYER4_BITRATE_HEVC,
+		.min = 1,
+		.max = BITRATE_MAX,
+		.step_or_mask = 1,
+		.value = BITRATE_DEFAULT,
+		.hfi_id = HFI_PROP_BITRATE_LAYER5,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
+			CAP_FLAG_DYNAMIC_ALLOWED,
+		.set = iris_set_layer_bitrate,
+	},
+	{
+		.cap_id = LAYER5_BITRATE_HEVC,
+		.min = 1,
+		.max = BITRATE_MAX,
+		.step_or_mask = 1,
+		.value = BITRATE_DEFAULT,
+		.hfi_id = HFI_PROP_BITRATE_LAYER6,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
+			CAP_FLAG_DYNAMIC_ALLOWED,
+		.set = iris_set_layer_bitrate,
+	}
 };
 
 static const u32 sm8550_vdec_input_config_params_default[] = {
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
index aec19efc41a5ef47bbad2471d3c4575704859743..d09096a9d5f934acf072b05c2cf80f3007c3aa7e 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
@@ -74,7 +74,22 @@ enum hfi_rate_control {
 #define HFI_PROP_LTR_COUNT			0x03000134
 #define HFI_PROP_LTR_MARK			0x03000135
 #define HFI_PROP_LTR_USE			0x03000136
+
+enum hfi_layer_encoding_type {
+	HFI_HIER_P_SLIDING_WINDOW	= 0x1,
+	HFI_HIER_P_HYBRID_LTR		= 0x2,
+	HFI_HIER_B			= 0x3,
+};
+
+#define HFI_PROP_LAYER_ENCODING_TYPE		0x03000138
+#define HFI_PROP_LAYER_COUNT			0x03000139
 #define HFI_PROP_TOTAL_BITRATE			0x0300013b
+#define HFI_PROP_BITRATE_LAYER1			0x0300013c
+#define HFI_PROP_BITRATE_LAYER2			0x0300013d
+#define HFI_PROP_BITRATE_LAYER3			0x0300013e
+#define HFI_PROP_BITRATE_LAYER4			0x0300013f
+#define HFI_PROP_BITRATE_LAYER5			0x03000140
+#define HFI_PROP_BITRATE_LAYER6			0x03000141
 #define HFI_PROP_MAX_GOP_FRAMES			0x03000146
 #define HFI_PROP_MAX_B_FRAMES			0x03000147
 #define HFI_PROP_QUALITY_MODE			0x03000148
diff --git a/drivers/media/platform/qcom/iris/iris_instance.h b/drivers/media/platform/qcom/iris/iris_instance.h
index 352af99699dd57641fd942d1fe3df9eb377d26b6..0041b0cc400195aaa29f4ed12c54372c26693441 100644
--- a/drivers/media/platform/qcom/iris/iris_instance.h
+++ b/drivers/media/platform/qcom/iris/iris_instance.h
@@ -77,6 +77,8 @@ struct iris_fmt {
  * @enc_raw_height: source image height for encoder instance
  * @enc_scale_width: scale width for encoder instance
  * @enc_scale_height: scale height for encoder instance
+ * @hfi_layer_type: hierarchical coding layer type
+ * @hfi_layer_count: hierarchical coding layer count
  */
 
 struct iris_inst {
@@ -120,6 +122,8 @@ struct iris_inst {
 	u32				enc_raw_height;
 	u32				enc_scale_width;
 	u32				enc_scale_height;
+	u32				hfi_layer_type;
+	u32				hfi_layer_count;
 };
 
 #endif
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index 422e83ae07884ce72d6e9aba8c176f474384b0f0..7ca37ca2dcca695816b2a285d0fe494a32b3671b 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -31,6 +31,12 @@ struct iris_inst;
 #define INVALID_DEFAULT_MARK_OR_USE_LTR		-1
 #define MAX_LTR_FRAME_COUNT_GEN1		4
 #define MAX_LTR_FRAME_COUNT_GEN2		2
+#define MAX_LAYER_HB				3
+#define MAX_AVC_LAYER_HP_HYBRID_LTR		5
+#define MAX_AVC_LAYER_HP_SLIDING_WINDOW		3
+#define MAX_HEVC_LAYER_HP_SLIDING_WINDOW	3
+#define MAX_HEVC_VBR_LAYER_HP_SLIDING_WINDOW	5
+#define MAX_HIER_CODING_LAYER_GEN1		6
 
 enum stage_type {
 	STAGE_1 = 1,
@@ -159,6 +165,23 @@ enum platform_inst_fw_cap_type {
 	MARK_LTR,
 	B_FRAME,
 	INTRA_PERIOD,
+	LAYER_ENABLE,
+	LAYER_TYPE_H264,
+	LAYER_TYPE_HEVC,
+	LAYER_COUNT_H264,
+	LAYER_COUNT_HEVC,
+	LAYER0_BITRATE_H264,
+	LAYER1_BITRATE_H264,
+	LAYER2_BITRATE_H264,
+	LAYER3_BITRATE_H264,
+	LAYER4_BITRATE_H264,
+	LAYER5_BITRATE_H264,
+	LAYER0_BITRATE_HEVC,
+	LAYER1_BITRATE_HEVC,
+	LAYER2_BITRATE_HEVC,
+	LAYER3_BITRATE_HEVC,
+	LAYER4_BITRATE_HEVC,
+	LAYER5_BITRATE_HEVC,
 	INST_FW_CAP_MAX,
 };
 
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
index 0ed82dc2b8af8c789df1b8c10c1a5afc51ef39d8..c2cd4adc082394a9ab6f32a37fe4e57678019d89 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
@@ -936,6 +936,8 @@ static u32 iris_vpu_enc_bin_size(struct iris_inst *inst)
 
 static inline u32 hfi_buffer_get_recon_count(struct iris_inst *inst)
 {
+	u32 layer_count = inst->hfi_layer_count;
+	u32 layer_type = inst->hfi_layer_type;
 	u32 bframe_count, ltr_count;
 	u32 num_ref = 1;
 
@@ -945,9 +947,35 @@ static inline u32 hfi_buffer_get_recon_count(struct iris_inst *inst)
 	if (bframe_count)
 		num_ref = 2;
 
+	/* The shift operation here is rounding logic, similar to [(x+1)/2]. */
+	if (layer_type == HFI_HIER_P_HYBRID_LTR)
+		num_ref = (layer_count + 1) >> 1;
+
+	if (layer_type == HFI_HIER_P_SLIDING_WINDOW) {
+		if (inst->codec == V4L2_PIX_FMT_HEVC)
+			num_ref = (layer_count + 1) >> 1;
+		else if (inst->codec == V4L2_PIX_FMT_H264 && layer_count < 4)
+			num_ref = (layer_count - 1);
+		else
+			num_ref = layer_count;
+	}
+
 	if (ltr_count)
 		num_ref = num_ref + ltr_count;
 
+	/*
+	 * The expression (1 << layers - 2) + 1 accounts for the number of reference
+	 * frames in the Adaptive Hierarchical B-frame encoding case. In this scheme,
+	 * the number of frames in a sub-GOP is related to (2^(number of layers) - 1),
+	 * hence the use of the shift operation.
+	 */
+	if (layer_type == HFI_HIER_B) {
+		if (inst->codec == V4L2_PIX_FMT_HEVC)
+			num_ref	= layer_count;
+		else
+			num_ref = (1 << (layer_count - 2)) + 1;
+	}
+
 	return num_ref;
 }
 

-- 
2.43.0


