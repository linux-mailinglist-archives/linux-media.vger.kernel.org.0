Return-Path: <linux-media+bounces-61222-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YPn0C0LsAmryygEAu9opvQ
	(envelope-from <linux-media+bounces-61222-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 11:00:50 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 4174A51D2E8
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 11:00:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 93F9030433D7
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 08:57:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B157939D6F0;
	Tue, 12 May 2026 08:55:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UHlAJrpL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e38z64Xb"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2759D39FCD0
	for <linux-media@vger.kernel.org>; Tue, 12 May 2026 08:55:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778576144; cv=none; b=C+hNbX/Cq3empgfCxgcbrG9WIDBR9qHZhqMdPsVDqpJIVAEYQA+6ma8k/EOrzD9Ea6eeEUf2X9dFJBsP+DetMWGBr3lMfW2CXjuVvRRc7MlJxlacyST3j2sTQI5We7/3CH144zWfaaMtr0jUtDmbNLnVvAz90AZNJc0i7hFdQ18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778576144; c=relaxed/simple;
	bh=+7NxkDI2Wh2+EYMc/jv7ryzxTAD6z+OSvF6pX5Ho7E4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Th5rmu/mht42fpramRhb6e3E1uj3lULA9U5UryJ3gw81W4u2SBh3QL3S+VFWaGL40uz4jMnxNQnqgTZ3yAdMyMVEnK88eXY9W9MGcetLNpvFSo7aAYAdu8IepCZSVY08VF+yA8JfVDbJbe4XKdalmmiJVkYv787HlHApKjsMstg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UHlAJrpL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e38z64Xb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64C5BZR13385878
	for <linux-media@vger.kernel.org>; Tue, 12 May 2026 08:55:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HX4c23/7ZwwNO0ZK16Oy/pJUBGqNwomA2SAB8l6pqCo=; b=UHlAJrpLvsvIMCD7
	o9/ZkKiGetlidzFhHbm96WKl+23ovsSZ2RfrBw9i3hwAu4RHQPa1v0zFBTYZQCA5
	9O0lGzyy/rYHzOegYY/9WoZVRLRs+lQMCQ7zNfOABdq2Bus+280Ht1Tc1gyArxEf
	oy1GWuZFQkceHPLwxbBLxBA4A7OfWAyEY6mn1oXWBvsJfOklVN4naIbOkYNmBq91
	f1dTfsW7OHD5S872z0FJPDlZT+p0pdYoSvDBWxYr+Qy5leUZM5UZp60wmMtUCkWs
	/pViBoy5XIxIRn/OZqifZcrqhfglg+j6PBBtNLZK6BUsEKmU3gGAt02RjPJ3e260
	pt65yg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e3nv4j9gf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 12 May 2026 08:55:31 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b7c904d476so57761465ad.3
        for <linux-media@vger.kernel.org>; Tue, 12 May 2026 01:55:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778576131; x=1779180931; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HX4c23/7ZwwNO0ZK16Oy/pJUBGqNwomA2SAB8l6pqCo=;
        b=e38z64XbzveTi0l/hNwh3oXJUCVAsPnPUqyXHSs2AgDYKv/BDC0xoPLenBs3LT4XzL
         ZRnW6KUw3+PfrvZ2E87aBQdDJUAJ3gP7uLSYKAfMqfHHUGCc+6Ak2SXAPqvtuGmMqCzG
         ikVhcqsEYCrq9buE5avYM68ODFzowDR3VWEHCW/v6pLOMTGoUlLd8mNV2EueKaAvL7H6
         w/H2VcSODyf/I1CxX+gEdEpZ/Vjb+ZvLy//sZRK6FWvO2ot7XDls3FW/Co2LBMugg1jt
         +huupqKUl8eYZqQdfVGbkmka8Qe6mKcx/p7ETotviaZlHEugfjfRIl+A0NMhAYcKX12l
         L3HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778576131; x=1779180931;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HX4c23/7ZwwNO0ZK16Oy/pJUBGqNwomA2SAB8l6pqCo=;
        b=rlNaJzvGKrZgt+a86eF+chzR/TMjiIuJLlVrxsi6+0YK++l62qLFrf/oIZNC7SPjT5
         8nghWpj0X/Ku+73MvmJX5iUNtJV4/1TdBANErU5cGhxM+28GPb21R0igRpPWSVu1vxCr
         SXvCz9hruCWpN2X8lIDXUpekpQzYkyG9BzobVBJx71/JWpShq+jwIeLr6oY1sDztN/b0
         cGx8Q09efHUTOIJsvULYY+75cNXgkCz5FepblwymCzPMo6RiB17txtgrCHVc7+stdiEO
         Q4USOX0DUi3XsYgKo8cO+uxiG/ajQIalt1wpNiFnat62R6HyIzkEAaVt2X4jBN4udg7A
         kOVA==
X-Gm-Message-State: AOJu0Yy26GSZJESw2j1259r/30nXozhTvYNdJG6pzqjEsbz/hMXoJgW5
	QWStMqZXejzCUGB80z5A8/jn2msaLUzhO3FyFKlczSOCEwhP8L8EPgfAgQqUcXO+lTSvug19y1w
	ztROfBDsnUmPUTYRZZJ5SOwUzs3F75LvNSUykljm9KBtj0SVZT2kEyVYpjOrwIy9Y9g==
X-Gm-Gg: Acq92OHHQ375x7BcbGmrrhPzjQ3v/rICw7v9sivzDGTaAik94eGSgSP38VaTNIZWYDt
	VylqicaMQlo/xPK/k7IRX4MQL9JTSJweR09VTcJCcRHLz/ais+IgDCwXI0BrVcoR2k83iNg7ls8
	L1Ms9WMlnxJawunVcolx0dAXg+D4n6NW7cFxlDElVTijxxoVPgeJMDb+b7l35O7JPGhsxesmHJr
	IATpXSuNUqkTnqIpuan9svsZF9+KpOzPEjfoCu4ZL6llpKLxyN+2vE/sX9gX9BfuGSNztHtgHgI
	MKrFAD7kUM1bfmzIFFVvqj1cyW2RDwbm6NOHcJaKaf6ReK0nS7ZAoqf8+2/qgx30m9gkAJkv4at
	WB9qVDX+/JYK2nlg5OsFG3KrH3yZGLd6qFCX/PUJxojLFlZvPy4f61brVRCm0kbwA+O1yKAsDaj
	Zi8IU7SJY+kH8xePd4x/RA
X-Received: by 2002:a17:902:c401:b0:2bc:ffe1:c397 with SMTP id d9443c01a7336-2bcffe1c5eemr29304535ad.23.1778576130605;
        Tue, 12 May 2026 01:55:30 -0700 (PDT)
X-Received: by 2002:a17:902:c401:b0:2bc:ffe1:c397 with SMTP id d9443c01a7336-2bcffe1c5eemr29304165ad.23.1778576129966;
        Tue, 12 May 2026 01:55:29 -0700 (PDT)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1e90854sm127641405ad.66.2026.05.12.01.55.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 01:55:29 -0700 (PDT)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Date: Tue, 12 May 2026 16:55:12 +0800
Subject: [PATCH v7 3/6] media: qcom: iris: Add B frames support for encoder
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260512-batch2_features-v7-3-4954e3b4df84@oss.qualcomm.com>
References: <20260512-batch2_features-v7-0-4954e3b4df84@oss.qualcomm.com>
In-Reply-To: <20260512-batch2_features-v7-0-4954e3b4df84@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Wangao Wang <wangao.wang@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778576115; l=8797;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=+7NxkDI2Wh2+EYMc/jv7ryzxTAD6z+OSvF6pX5Ho7E4=;
 b=VtQhII1q2xKZOpwcdORQZTimCLeP6SCLCSRkfwMTYoUx+4PHpT2rawYk6zpapMdRe0nVOUbbv
 OGeS4GJUF+RAGoq3HaCR7bZeQrVD+uNj0pIhzZbod+m9eBRlhae/dS0
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Authority-Analysis: v=2.4 cv=ZrTd7d7G c=1 sm=1 tr=0 ts=6a02eb03 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=2_V6wWdUOSEACiTAc7sA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDA5MCBTYWx0ZWRfXz5Q49Ng6sQBv
 xcqoqo8n+Crnpp6weVH53wZkUotglCUsxW8iNPhlGQ8QDP3KhCPTt1CeaPvgk33vtmfJKQPRn2V
 cXGQjL0pz0FLx1bciOzKAnaM1MAboPDsli3DVxyFmA1QXQvrdXg/2juBvVM6Q9D6eZKcfAX6wfK
 5tqyq+gM++01TBqXYzQpH/D7/z03nMUx/UjpwqO50pB9HGO53/lg22MbCZ4GSyskQDJaQ+1JlTo
 dUC84MCzFxZnaKsOEo0G8iOAlQ9JxHzYjB69GlcWIZBctPZlazl7n1GImZjf1+bRT9rZ7yl4+yS
 UGSGXZ2ThZ1zHrydM6hz+Un2GND4gHpus3Jk555Vf7qk6FhTS+QjxJxSsna7P2uylNGGTC/agI+
 01YNc9zJ1Mgiqy3FcIdqam8miz/KqJdyMDwBCqInaYF6ASwgiujyy3LuAJMatuQoIOPtVGegldp
 mlQDDBN3OADg+zElF5g==
X-Proofpoint-ORIG-GUID: uczpltz5T9vqfSbSf6RqOC-qk65ABPgK
X-Proofpoint-GUID: uczpltz5T9vqfSbSf6RqOC-qk65ABPgK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 spamscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 adultscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605120090
X-Rspamd-Queue-Id: 4174A51D2E8
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,linaro.org:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-61222-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FROM_NEQ_ENVFROM(0.00)[wangao.wang@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Add support for B-frame configuration on both gen1 and gen2 encoders by
enabling V4L2_CID_MPEG_VIDEO_B_FRAMES control.

Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-HDK
Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_ctrls.c      | 30 ++++++++++++++++++++++
 drivers/media/platform/qcom/iris/iris_ctrls.h      |  1 +
 drivers/media/platform/qcom/iris/iris_hfi_gen1.c   | 18 +++++++++++++
 .../platform/qcom/iris/iris_hfi_gen1_command.c     |  8 ++++++
 .../platform/qcom/iris/iris_hfi_gen1_defines.h     | 10 ++++++++
 drivers/media/platform/qcom/iris/iris_hfi_gen2.c   | 10 ++++++++
 .../platform/qcom/iris/iris_platform_common.h      |  2 ++
 drivers/media/platform/qcom/iris/iris_vpu_buffer.c |  6 ++++-
 8 files changed, 84 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.c b/drivers/media/platform/qcom/iris/iris_ctrls.c
index 87d10ce1a9a572c5242d425b5a02abba01f911b5..a6bd2eada52b68afd91032315c2701d8c74a9763 100644
--- a/drivers/media/platform/qcom/iris/iris_ctrls.c
+++ b/drivers/media/platform/qcom/iris/iris_ctrls.c
@@ -118,6 +118,8 @@ static enum platform_inst_fw_cap_type iris_get_cap_id(u32 id)
 		return USE_LTR;
 	case V4L2_CID_MPEG_VIDEO_FRAME_LTR_INDEX:
 		return MARK_LTR;
+	case V4L2_CID_MPEG_VIDEO_B_FRAMES:
+		return B_FRAME;
 	default:
 		return INST_FW_CAP_MAX;
 	}
@@ -225,6 +227,8 @@ static u32 iris_get_v4l2_id(enum platform_inst_fw_cap_type cap_id)
 		return V4L2_CID_MPEG_VIDEO_USE_LTR_FRAMES;
 	case MARK_LTR:
 		return V4L2_CID_MPEG_VIDEO_FRAME_LTR_INDEX;
+	case B_FRAME:
+		return V4L2_CID_MPEG_VIDEO_B_FRAMES;
 	default:
 		return 0;
 	}
@@ -1161,6 +1165,32 @@ int iris_set_use_and_mark_ltr(struct iris_inst *inst, enum platform_inst_fw_cap_
 					     &hfi_val, sizeof(u32));
 }
 
+int iris_set_intra_period(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
+{
+	const struct iris_hfi_session_ops *hfi_ops = inst->hfi_session_ops;
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
 	const struct iris_hfi_session_ops *hfi_ops = inst->hfi_session_ops;
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
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1.c
index 6db693a602aca296f032dfc31987071f8e15bd1c..792441463b4bad19da5a45b46c4dafcf2caa75c3 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1.c
@@ -273,6 +273,24 @@ static const struct platform_inst_fw_cap inst_fw_cap_sm8250_enc[] = {
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
 
 static const u32 sm8250_vdec_input_config_param_default[] = {
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
index a441c897aaabdf1ecae37d34032cd22d4f987233..05e7b5ff2b9224b201cf87858c0375ac6866e9bb 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
@@ -720,6 +720,14 @@ iris_hfi_gen1_packet_session_set_property(struct hfi_session_set_property_pkt *p
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
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
index 495327160ec292f5fdc8f9532054c58046a10250..27878b70e516bec0eefbb094b58ecba882332bf5 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
@@ -745,6 +745,16 @@ static const struct platform_inst_fw_cap inst_fw_cap_sm8550_enc[] = {
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
 
 static const u32 sm8550_vdec_input_config_params_default[] = {
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index 2f4392e6a42ea9280d48ae46791277394b2f3be8..422e83ae07884ce72d6e9aba8c176f474384b0f0 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -157,6 +157,8 @@ enum platform_inst_fw_cap_type {
 	LTR_COUNT,
 	USE_LTR,
 	MARK_LTR,
+	B_FRAME,
+	INTRA_PERIOD,
 	INST_FW_CAP_MAX,
 };
 
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
index 891aed5091c7a0fd0bf1f1a3a7737d49e6d8cea2..0ed82dc2b8af8c789df1b8c10c1a5afc51ef39d8 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
@@ -936,11 +936,15 @@ static u32 iris_vpu_enc_bin_size(struct iris_inst *inst)
 
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


