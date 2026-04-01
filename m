Return-Path: <linux-media+bounces-57829-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SIgVKf2OzGnXTwYAu9opvQ
	(envelope-from <linux-media+bounces-57829-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 01 Apr 2026 05:20:29 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CCD5374359
	for <lists+linux-media@lfdr.de>; Wed, 01 Apr 2026 05:20:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F2BD5302A059
	for <lists+linux-media@lfdr.de>; Wed,  1 Apr 2026 03:15:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3185837E315;
	Wed,  1 Apr 2026 03:15:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Gq+HiU4i";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RdhCAJ1i"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76A5B37C0E5
	for <linux-media@vger.kernel.org>; Wed,  1 Apr 2026 03:15:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775013311; cv=none; b=H6iDU5SPRttllDY+1XMrGwErqT0MYDaFYeiS9JbBrfVeucjkAOIqAlGH/miBDu8oU25p306IU7m2Tm7C3oPaGEdkUiZ5Kn5sQhb/t4ZJFRHdBCY7M9o93Af/+RlS6HUsEE7R8xQvvgcu2MAko8trt+oLorAeD6xTjrNzPt+Dj1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775013311; c=relaxed/simple;
	bh=j86wGS3jWRd7rZd6LgWXeDycpOm+OZGdSNkp2qG1Z4s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ApmQz+jLjT/ogHIN3F6R0Wa0bxOyXFKtAdG1ByxuzfmxRoW8SHnwoA/XE7l7DMvqtlplYvZr3wp0wjWLiI4WLjIMZcoZRwFBWf23nhDG/jNZhDNRVEEIzLToQd2Qw1fGfYQv5fHzJ14yhrukvpqcI8cSISenfaIjwxKwV+HyEpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Gq+HiU4i; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RdhCAJ1i; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62VNCLBs3926847
	for <linux-media@vger.kernel.org>; Wed, 1 Apr 2026 03:15:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eS9P0AXbwYC2yfkhIKecNQHViBYIDNoJVyZfcxh0K/I=; b=Gq+HiU4iT178sqOE
	NOOzKiAL59xnKiDWq2Kb/6wy36pn/+xtXAhXPpDZCHauZyx8FKWbLZnRjqpnQv90
	biMWfY/4IEhiklRd1tVNKoTXII33Uwj/TItzrX1BX2i/+onnvSREokvDTLqQeCh7
	Qs5c9SEPNA7W6cvxYtqBInAQLtq6Y2opY/wf6UMNH68GjGO3WvlRw/aUJ0FPvQIV
	j9l3qUy2X9nVfQnXg/pfiMr0UFm1SUGSJTsfKPlHvwNvUI3k03v6lU51gW3oKJFl
	5sqquUtoGKDSDuFnEnph1OMEfpL4UgCA9wWr5U8WjFPqhwdZRGJMA8FR0YJ8O4oc
	T4pWqQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8b934f5f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 01 Apr 2026 03:15:08 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c76b69fb9d6so341051a12.1
        for <linux-media@vger.kernel.org>; Tue, 31 Mar 2026 20:15:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775013308; x=1775618108; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eS9P0AXbwYC2yfkhIKecNQHViBYIDNoJVyZfcxh0K/I=;
        b=RdhCAJ1iJ1zSruG7OiZVtRB7VQLPwodG45Q7g/86asZymyysGlYLkcxywFvKtgCIfa
         c0Izf/d3aZHJ3LaCdc04+ZkXahACxfJ7aJ53C4Nr+n8NVJJ692EO3SOc6OssfhTIWd1P
         DuLXLnB70eTQRo4/Xa9k6c6oRTw8dOsWYn/7b76ziMoGaxWQCSURQz4g8s9Sjj+gMg01
         GGz62k4D2gJtMMRYKovDZPNgQotqwFWYrmQVNWDxVhTGR5JLaX5c1Z+3JcNLxQI4kCMy
         UOjUlTdKcpl8WtxJDHi9ry0KkItYnKDUxVHPHkCVH2NScyPbqeZvhsIWsGDmQc12TXz+
         R42Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775013308; x=1775618108;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eS9P0AXbwYC2yfkhIKecNQHViBYIDNoJVyZfcxh0K/I=;
        b=dgDFuLm7N7W7rxUwq0PMQ80OHyz9+mDK3401q4s6qifVWk8bPaDLwKoTi1148cN75g
         bnU7jDdrQMod7R7FDF4zf6Jyac6poenc86ThJfBvWG0MGqrvcJUPB2ascOB9NG2PcTm0
         5sAlA51gm9qgywKLHdR8AeSkKJZOg42WLFhgNlZikwo8exvuqc/5whUYIxlKtarITQlx
         zTsHC/Q/hUgn0e/1fsdkXm77bskwfdei4jaKiTgBwK2v5tfYB/mf7d20/LRE2NmKn61S
         lQuCxlNh4QqKcauvM4qGOZ7UxdYuv8tm2r5ymGcsrvjmNzzgYMpZfrYb/mBa9ebs6+wI
         HcIQ==
X-Forwarded-Encrypted: i=1; AJvYcCWMlTH56rlmRoGqBoALZ9MTK5nlzbPJCisNGBFxlcXFOZJnrVkwQkZhFBmxn2x7afjXLTjJjBthW1ZFsw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyEC8cdUVLp52r0CxDsdeEwdbG5ymo/Sx+ymZC8tr1M9XWPNX3S
	f6ZmH3UltRpRUXtNBnmQnRyllDBUm0fvZ6QbBFxIK3LTq9FCojw3jGvcHNk4BpscXxpjhdrK71y
	cJ9OerdudCvqEOdf8NyuwQelDMSZemPKhHrRyrrKZMQN+RHbQUZpSIBtLpTP1tiyYGg==
X-Gm-Gg: ATEYQzzz9SBmE8OOF351CzYm3qIiX8vqDfUxEKJ+062Z6FH7GDTX2yBPhD1UyqRF8RC
	phEksYqQJ9hCGbsPLeBFEDzsbJQgNOvo9OQ/b6fu/sxRorCyn5+vTpp8M3Q1uj5FlgUf9IDZ1aM
	0S0Vvgv8PyR/4LMXNUzM3Pmk5uimZg9z6d8m/vL5tIl5rRuJnU+Fk8W3nTmEYByD7JwYzmWcZDh
	6WmS4VVN8Pfj//fg0FHQQiZ9vC43BvymCGXJlhlNPNxx5wvSuGhnxH+EpA/LNAHdSgQba+w/n32
	8jCxxcCx7qaoo+lCy2RBS0EDhFTPHczb3U5zpIOUxe6pbhh2uA8y9GX5pgS5QOhxXNCuBiEmEa9
	G6CRqrtrb4NyqaL2P+2SOg8MeKSgPeyyOVO23kIQAsyBRrf8NMHZ+GD+YDXcoFvXwfIO2+vkL9s
	50LpZbz74bCqSMzP75RBPF
X-Received: by 2002:a05:6a21:4ed8:10b0:39e:f994:f696 with SMTP id adf61e73a8af0-39ef995d86amr882811637.20.1775013308042;
        Tue, 31 Mar 2026 20:15:08 -0700 (PDT)
X-Received: by 2002:a05:6a21:4ed8:10b0:39e:f994:f696 with SMTP id adf61e73a8af0-39ef995d86amr882787637.20.1775013307471;
        Tue, 31 Mar 2026 20:15:07 -0700 (PDT)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c76ad00a246sm3246584a12.16.2026.03.31.20.15.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 20:15:06 -0700 (PDT)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Date: Wed, 01 Apr 2026 11:13:44 +0800
Subject: [PATCH v6 2/6] media: qcom: iris: Add Long-Term Reference support
 for encoder
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260401-batch2_iris_encoder_enhancements-v6-2-7022af3401ff@oss.qualcomm.com>
References: <20260401-batch2_iris_encoder_enhancements-v6-0-7022af3401ff@oss.qualcomm.com>
In-Reply-To: <20260401-batch2_iris_encoder_enhancements-v6-0-7022af3401ff@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: quic_qiweil@quicinc.com, Renjiang Han <renjiang.han@oss.qualcomm.com>,
        Wangao Wang <wangao.wang@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775013294; l=16401;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=j86wGS3jWRd7rZd6LgWXeDycpOm+OZGdSNkp2qG1Z4s=;
 b=AA8buOO/8Hyuy+Z6TqpLgg1wMaDoJPw3gOzqlGCTxMmKZinkMKsf46b+jQLzt22QBs0CUtxvC
 sKC1gj4bgDMBmihkT6C2/bK7yRNTNrJ+SMGS/mPyCrUbR2Edh2q/gT+
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDAyMyBTYWx0ZWRfXzVSVX2s1Rdlf
 8Sd30h94UPwWJKWvZytb/u00sPdbSwESp/JYfbcu6S/P+tx2qy7cVBO8eHrQq4Nu2O/E3hUljez
 01/SMGkroheI1CeAsqylL4gPjwgN5vis9K8fT3dQD40u62S9b4FWbci7Wk8RuEBHocRpr9aNK/+
 tGK2PXYf9Vmn335hYGy71NqpIlhZq6kKzp6PARJWkwD9rFB349B+l+WsKoSGSa0/0YyPuZ6NrbQ
 94WP+Kk5Qm1n4d/5ld+1WlWdG8Uml7VSQfK12f/ByaC9SUTvt7wUlCJv+zlzVaZQ9W2zq+jOIyf
 5ZqKIaX6dnlWTdOej2Gl6H3xVXovnOuaznWGagKehdiIDAK4+iTRAWKf2KxMRCgsdSaGjapOyoS
 b0RjXFNllQp/LdaYg5iR6qwP9+QPHozzGNrqgOOg4MEPi4pZoVkMT4khrug/KVkiNZQwx+s678j
 pGhg4Jvu7bUCMYkerzw==
X-Proofpoint-ORIG-GUID: G-Zzewo48WPWMDGqy8pClupjg-U5yWQ6
X-Proofpoint-GUID: G-Zzewo48WPWMDGqy8pClupjg-U5yWQ6
X-Authority-Analysis: v=2.4 cv=NLjYOk6g c=1 sm=1 tr=0 ts=69cc8dbc cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=QunbDvX0_-zBgmAapgUA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_01,2026-03-31_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 impostorscore=0 spamscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 clxscore=1015 lowpriorityscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604010023
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-57829-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,linaro.org:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wangao.wang@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4CCD5374359
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add Long-Term Reference(LTR) frame support for both gen1 and gen2
encoders by enabling the following V4L2 controls:
V4L2_CID_MPEG_VIDEO_LTR_COUNT
V4L2_CID_MPEG_VIDEO_USE_LTR_FRAMES
V4L2_CID_MPEG_VIDEO_FRAME_LTR_INDEX

Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-HDK
Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_ctrls.c      | 128 +++++++++++++++++++++
 drivers/media/platform/qcom/iris/iris_ctrls.h      |   5 +
 .../platform/qcom/iris/iris_hfi_gen1_command.c     |  25 ++++
 .../platform/qcom/iris/iris_hfi_gen1_defines.h     |  24 ++++
 .../platform/qcom/iris/iris_hfi_gen2_defines.h     |   3 +
 .../platform/qcom/iris/iris_platform_common.h      |   6 +
 .../media/platform/qcom/iris/iris_platform_gen1.c  |  30 +++++
 .../media/platform/qcom/iris/iris_platform_gen2.c  |  30 +++++
 drivers/media/platform/qcom/iris/iris_vpu_buffer.c |  20 +++-
 9 files changed, 267 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.c b/drivers/media/platform/qcom/iris/iris_ctrls.c
index 287cfc53294169cf5b75375105abc3c8c2d2a551..87d10ce1a9a572c5242d425b5a02abba01f911b5 100644
--- a/drivers/media/platform/qcom/iris/iris_ctrls.c
+++ b/drivers/media/platform/qcom/iris/iris_ctrls.c
@@ -112,6 +112,12 @@ static enum platform_inst_fw_cap_type iris_get_cap_id(u32 id)
 		return IR_TYPE;
 	case V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD:
 		return IR_PERIOD;
+	case V4L2_CID_MPEG_VIDEO_LTR_COUNT:
+		return LTR_COUNT;
+	case V4L2_CID_MPEG_VIDEO_USE_LTR_FRAMES:
+		return USE_LTR;
+	case V4L2_CID_MPEG_VIDEO_FRAME_LTR_INDEX:
+		return MARK_LTR;
 	default:
 		return INST_FW_CAP_MAX;
 	}
@@ -213,6 +219,12 @@ static u32 iris_get_v4l2_id(enum platform_inst_fw_cap_type cap_id)
 		return V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD_TYPE;
 	case IR_PERIOD:
 		return V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD;
+	case LTR_COUNT:
+		return V4L2_CID_MPEG_VIDEO_LTR_COUNT;
+	case USE_LTR:
+		return V4L2_CID_MPEG_VIDEO_USE_LTR_FRAMES;
+	case MARK_LTR:
+		return V4L2_CID_MPEG_VIDEO_FRAME_LTR_INDEX;
 	default:
 		return 0;
 	}
@@ -1033,6 +1045,122 @@ int iris_set_ir_period_gen2(struct iris_inst *inst, enum platform_inst_fw_cap_ty
 					     &ir_period, sizeof(u32));
 }
 
+int iris_set_ltr_count_gen1(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
+{
+	const struct iris_hfi_session_ops *hfi_ops = inst->hfi_session_ops;
+	u32 ltr_count = inst->fw_caps[cap_id].value;
+	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
+	struct hfi_ltr_mode ltr_mode;
+
+	if (!ltr_count)
+		return -EINVAL;
+
+	ltr_mode.count = ltr_count;
+	ltr_mode.mode = HFI_LTR_MODE_MANUAL;
+	ltr_mode.trust_mode = 1;
+
+	return hfi_ops->session_set_property(inst, hfi_id,
+					     HFI_HOST_FLAGS_NONE,
+					     iris_get_port_info(inst, cap_id),
+					     HFI_PAYLOAD_STRUCTURE,
+					     &ltr_mode, sizeof(ltr_mode));
+}
+
+int iris_set_use_ltr(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
+{
+	const struct iris_hfi_session_ops *hfi_ops = inst->hfi_session_ops;
+	struct vb2_queue *sq = v4l2_m2m_get_src_vq(inst->m2m_ctx);
+	struct vb2_queue *dq = v4l2_m2m_get_dst_vq(inst->m2m_ctx);
+	u32 ltr_count = inst->fw_caps[LTR_COUNT].value;
+	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
+	struct hfi_ltr_use ltr_use;
+
+	if (!vb2_is_streaming(sq) && !vb2_is_streaming(dq))
+		return -EINVAL;
+
+	if (!ltr_count)
+		return -EINVAL;
+
+	ltr_use.ref_ltr = inst->fw_caps[cap_id].value;
+	ltr_use.use_constrnt = true;
+	ltr_use.frames = 0;
+
+	return hfi_ops->session_set_property(inst, hfi_id,
+					     HFI_HOST_FLAGS_NONE,
+					     iris_get_port_info(inst, cap_id),
+					     HFI_PAYLOAD_STRUCTURE,
+					     &ltr_use, sizeof(ltr_use));
+}
+
+int iris_set_mark_ltr(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
+{
+	const struct iris_hfi_session_ops *hfi_ops = inst->hfi_session_ops;
+	struct vb2_queue *sq = v4l2_m2m_get_src_vq(inst->m2m_ctx);
+	struct vb2_queue *dq = v4l2_m2m_get_dst_vq(inst->m2m_ctx);
+	u32 ltr_count = inst->fw_caps[LTR_COUNT].value;
+	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
+	struct hfi_ltr_mark ltr_mark;
+
+	if (!vb2_is_streaming(sq) && !vb2_is_streaming(dq))
+		return -EINVAL;
+
+	if (!ltr_count)
+		return -EINVAL;
+
+	ltr_mark.mark_frame = inst->fw_caps[cap_id].value;
+
+	return hfi_ops->session_set_property(inst, hfi_id,
+					     HFI_HOST_FLAGS_NONE,
+					     iris_get_port_info(inst, cap_id),
+					     HFI_PAYLOAD_STRUCTURE,
+					     &ltr_mark, sizeof(ltr_mark));
+}
+
+int iris_set_ltr_count_gen2(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
+{
+	const struct iris_hfi_session_ops *hfi_ops = inst->hfi_session_ops;
+	u32 ltr_count = inst->fw_caps[cap_id].value;
+	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
+
+	if (!ltr_count)
+		return -EINVAL;
+
+	if (inst->hfi_rc_type == HFI_RC_CBR_VFR ||
+	    inst->hfi_rc_type == HFI_RC_CBR_CFR ||
+	    inst->hfi_rc_type == HFI_RC_OFF) {
+		inst->fw_caps[LTR_COUNT].value = 0;
+		return -EINVAL;
+	}
+
+	return hfi_ops->session_set_property(inst, hfi_id,
+					     HFI_HOST_FLAGS_NONE,
+					     iris_get_port_info(inst, cap_id),
+					     HFI_PAYLOAD_U32,
+					     &ltr_count, sizeof(u32));
+}
+
+int iris_set_use_and_mark_ltr(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
+{
+	const struct iris_hfi_session_ops *hfi_ops = inst->hfi_session_ops;
+	struct vb2_queue *sq = v4l2_m2m_get_src_vq(inst->m2m_ctx);
+	struct vb2_queue *dq = v4l2_m2m_get_dst_vq(inst->m2m_ctx);
+	u32 ltr_count = inst->fw_caps[LTR_COUNT].value;
+	u32 hfi_val = inst->fw_caps[cap_id].value;
+	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
+
+	if (!vb2_is_streaming(sq) && !vb2_is_streaming(dq))
+		return -EINVAL;
+
+	if (!ltr_count || hfi_val == INVALID_DEFAULT_MARK_OR_USE_LTR)
+		return -EINVAL;
+
+	return hfi_ops->session_set_property(inst, hfi_id,
+					     HFI_HOST_FLAGS_NONE,
+					     iris_get_port_info(inst, cap_id),
+					     HFI_PAYLOAD_U32,
+					     &hfi_val, sizeof(u32));
+}
+
 int iris_set_properties(struct iris_inst *inst, u32 plane)
 {
 	const struct iris_hfi_session_ops *hfi_ops = inst->hfi_session_ops;
diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.h b/drivers/media/platform/qcom/iris/iris_ctrls.h
index a0d5338bdc910bd30407132e8b700c333ad74e4c..996c83fdc6f492dc252771129fc1d62e8b7a7e07 100644
--- a/drivers/media/platform/qcom/iris/iris_ctrls.h
+++ b/drivers/media/platform/qcom/iris/iris_ctrls.h
@@ -36,6 +36,11 @@ int iris_set_rotation(struct iris_inst *inst, enum platform_inst_fw_cap_type cap
 int iris_set_flip(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
 int iris_set_ir_period_gen1(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
 int iris_set_ir_period_gen2(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
+int iris_set_ltr_count_gen1(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
+int iris_set_ltr_count_gen2(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
+int iris_set_use_ltr(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
+int iris_set_mark_ltr(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
+int iris_set_use_and_mark_ltr(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
 int iris_set_properties(struct iris_inst *inst, u32 plane);
 
 #endif
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
index 2923052f8d8ed6bdcdf6c5314f1b912238a34cd9..63377886b2fbe373a09492793b7638a75d443544 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
@@ -695,6 +695,31 @@ iris_hfi_gen1_packet_session_set_property(struct hfi_session_set_property_pkt *p
 		packet->shdr.hdr.size += sizeof(u32) + sizeof(*intra_refresh);
 		break;
 	}
+	case HFI_PROPERTY_PARAM_VENC_LTRMODE: {
+		struct hfi_ltr_mode *in = pdata, *ltr_mode = prop_data;
+
+		ltr_mode->mode = in->mode;
+		ltr_mode->count = in->count;
+		ltr_mode->trust_mode = in->trust_mode;
+		packet->shdr.hdr.size += sizeof(u32) + sizeof(*ltr_mode);
+		break;
+	}
+	case HFI_PROPERTY_CONFIG_VENC_USELTRFRAME: {
+		struct hfi_ltr_use *in = pdata, *ltr_use = prop_data;
+
+		ltr_use->frames = in->frames;
+		ltr_use->ref_ltr = in->ref_ltr;
+		ltr_use->use_constrnt = in->use_constrnt;
+		packet->shdr.hdr.size += sizeof(u32) + sizeof(*ltr_use);
+		break;
+	}
+	case HFI_PROPERTY_CONFIG_VENC_MARKLTRFRAME: {
+		struct hfi_ltr_mark *in = pdata, *ltr_mark = prop_data;
+
+		ltr_mark->mark_frame = in->mark_frame;
+		packet->shdr.hdr.size += sizeof(u32) + sizeof(*ltr_mark);
+		break;
+	}
 	default:
 		return -EINVAL;
 	}
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h b/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
index 04c79ee0463d7f32a2042044fe4564718cc01561..34249fc0d047918c2463517b8303e30df3666b97 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
@@ -147,8 +147,16 @@
 #define HFI_INTRA_REFRESH_RANDOM		0x5
 
 #define HFI_PROPERTY_PARAM_VENC_INTRA_REFRESH			0x200500d
+
+#define HFI_LTR_MODE_DISABLE			0x0
+#define HFI_LTR_MODE_MANUAL			0x1
+#define HFI_LTR_MODE_PERIODIC			0x2
+
+#define HFI_PROPERTY_PARAM_VENC_LTRMODE				0x200501c
 #define HFI_PROPERTY_PARAM_VENC_MAX_NUM_B_FRAMES		0x2005020
 #define HFI_PROPERTY_CONFIG_VENC_TARGET_BITRATE			0x2006001
+#define HFI_PROPERTY_CONFIG_VENC_MARKLTRFRAME			0x2006009
+#define HFI_PROPERTY_CONFIG_VENC_USELTRFRAME			0x200600a
 #define HFI_PROPERTY_CONFIG_VENC_SYNC_FRAME_SEQUENCE_HEADER	0x2006008
 
 struct hfi_pkt_hdr {
@@ -460,6 +468,22 @@ struct hfi_intra_refresh {
 	u32 mbs;
 };
 
+struct hfi_ltr_mode {
+	u32 mode;
+	u32 count;
+	u32 trust_mode;
+};
+
+struct hfi_ltr_use {
+	u32 ref_ltr;
+	u32 use_constrnt;
+	u32 frames;
+};
+
+struct hfi_ltr_mark {
+	u32 mark_frame;
+};
+
 struct hfi_event_data {
 	u32 error;
 	u32 height;
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
index cecf771c55dd36a13616344ff4583bf1d0544e17..aec19efc41a5ef47bbad2471d3c4575704859743 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
@@ -71,6 +71,9 @@ enum hfi_rate_control {
 #define HFI_PROP_MIN_QP_PACKED			0x0300012f
 #define HFI_PROP_MAX_QP_PACKED			0x03000130
 #define HFI_PROP_IR_RANDOM_PERIOD		0x03000131
+#define HFI_PROP_LTR_COUNT			0x03000134
+#define HFI_PROP_LTR_MARK			0x03000135
+#define HFI_PROP_LTR_USE			0x03000136
 #define HFI_PROP_TOTAL_BITRATE			0x0300013b
 #define HFI_PROP_MAX_GOP_FRAMES			0x03000146
 #define HFI_PROP_MAX_B_FRAMES			0x03000147
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index 5af6d9f49f01b8e85c6e39330fbfbb79caf8bf7d..de9ab929aedfeba7aa2d9ee34a345811266b2ab5 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -28,6 +28,9 @@ struct iris_inst;
 #define MAX_QP_HEVC				63
 #define DEFAULT_QP				20
 #define BITRATE_DEFAULT			20000000
+#define INVALID_DEFAULT_MARK_OR_USE_LTR		-1
+#define MAX_LTR_FRAME_COUNT_GEN1		4
+#define MAX_LTR_FRAME_COUNT_GEN2		2
 
 enum stage_type {
 	STAGE_1 = 1,
@@ -148,6 +151,9 @@ enum platform_inst_fw_cap_type {
 	VFLIP,
 	IR_TYPE,
 	IR_PERIOD,
+	LTR_COUNT,
+	USE_LTR,
+	MARK_LTR,
 	INST_FW_CAP_MAX,
 };
 
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen1.c b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
index 11ab3c1c75ea7de30e786a655765c3571ac506cc..45b4aeb7a84592983511890bd7fd499c1dd22df4 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen1.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
@@ -265,6 +265,36 @@ static const struct platform_inst_fw_cap inst_fw_cap_sm8250_enc[] = {
 		.flags = CAP_FLAG_OUTPUT_PORT,
 		.set = iris_set_ir_period_gen1,
 	},
+	{
+		.cap_id = LTR_COUNT,
+		.min = 0,
+		.max = MAX_LTR_FRAME_COUNT_GEN1,
+		.step_or_mask = 1,
+		.value = 0,
+		.hfi_id = HFI_PROPERTY_PARAM_VENC_LTRMODE,
+		.flags = CAP_FLAG_OUTPUT_PORT,
+		.set = iris_set_ltr_count_gen1,
+	},
+	{
+		.cap_id = USE_LTR,
+		.min = 0,
+		.max = ((1 << MAX_LTR_FRAME_COUNT_GEN1) - 1),
+		.step_or_mask = 0,
+		.value = 0,
+		.hfi_id = HFI_PROPERTY_CONFIG_VENC_USELTRFRAME,
+		.flags = CAP_FLAG_INPUT_PORT | CAP_FLAG_DYNAMIC_ALLOWED,
+		.set = iris_set_use_ltr,
+	},
+	{
+		.cap_id = MARK_LTR,
+		.min = 0,
+		.max = (MAX_LTR_FRAME_COUNT_GEN1 - 1),
+		.step_or_mask = 1,
+		.value = 0,
+		.hfi_id = HFI_PROPERTY_CONFIG_VENC_MARKLTRFRAME,
+		.flags = CAP_FLAG_INPUT_PORT | CAP_FLAG_DYNAMIC_ALLOWED,
+		.set = iris_set_mark_ltr,
+	},
 };
 
 static struct platform_inst_caps platform_inst_cap_sm8250 = {
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
index 7cc21572fed98d95616e2aa827a8f0b427671825..176bf2141954a74c59dda99ac3af37befbf6a572 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
@@ -740,6 +740,36 @@ static const struct platform_inst_fw_cap inst_fw_cap_sm8550_enc[] = {
 			CAP_FLAG_DYNAMIC_ALLOWED,
 		.set = iris_set_ir_period_gen2,
 	},
+	{
+		.cap_id = LTR_COUNT,
+		.min = 0,
+		.max = MAX_LTR_FRAME_COUNT_GEN2,
+		.step_or_mask = 1,
+		.value = 0,
+		.hfi_id = HFI_PROP_LTR_COUNT,
+		.flags = CAP_FLAG_OUTPUT_PORT,
+		.set = iris_set_ltr_count_gen2,
+	},
+	{
+		.cap_id = USE_LTR,
+		.min = 0,
+		.max = ((1 << MAX_LTR_FRAME_COUNT_GEN2) - 1),
+		.step_or_mask = 0,
+		.value = 0,
+		.hfi_id = HFI_PROP_LTR_USE,
+		.flags = CAP_FLAG_INPUT_PORT | CAP_FLAG_DYNAMIC_ALLOWED,
+		.set = iris_set_use_and_mark_ltr,
+	},
+	{
+		.cap_id = MARK_LTR,
+		.min = INVALID_DEFAULT_MARK_OR_USE_LTR,
+		.max = (MAX_LTR_FRAME_COUNT_GEN2 - 1),
+		.step_or_mask = 1,
+		.value = INVALID_DEFAULT_MARK_OR_USE_LTR,
+		.hfi_id = HFI_PROP_LTR_MARK,
+		.flags = CAP_FLAG_INPUT_PORT | CAP_FLAG_DYNAMIC_ALLOWED,
+		.set = iris_set_use_and_mark_ltr,
+	},
 };
 
 static struct platform_inst_caps platform_inst_cap_sm8550 = {
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
index 9270422c16019ba658ee8813940cb9110ad030a1..891aed5091c7a0fd0bf1f1a3a7737d49e6d8cea2 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
@@ -934,6 +934,19 @@ static u32 iris_vpu_enc_bin_size(struct iris_inst *inst)
 				  num_vpp_pipes, inst->hfi_rc_type);
 }
 
+static inline u32 hfi_buffer_get_recon_count(struct iris_inst *inst)
+{
+	u32 num_ref = 1;
+	u32 ltr_count;
+
+	ltr_count = inst->fw_caps[LTR_COUNT].value;
+
+	if (ltr_count)
+		num_ref = num_ref + ltr_count;
+
+	return num_ref;
+}
+
 static u32 iris_vpu_dec_partial_size(struct iris_inst *inst)
 {
 	struct v4l2_format *f = inst->fmt_src;
@@ -968,7 +981,7 @@ static u32 iris_vpu_enc_comv_size(struct iris_inst *inst)
 {
 	u32 height = iris_vpu_enc_get_bitstream_height(inst);
 	u32 width = iris_vpu_enc_get_bitstream_width(inst);
-	u32 num_recon = 1;
+	u32 num_recon = hfi_buffer_get_recon_count(inst);
 	u32 lcu_size = 16;
 
 	if (inst->codec == V4L2_PIX_FMT_HEVC) {
@@ -1677,10 +1690,9 @@ static u32 iris_vpu_enc_scratch2_size(struct iris_inst *inst)
 {
 	u32 frame_height = iris_vpu_enc_get_bitstream_height(inst);
 	u32 frame_width = iris_vpu_enc_get_bitstream_width(inst);
-	u32 num_ref = 1;
+	u32 num_ref = hfi_buffer_get_recon_count(inst);
 
-	return hfi_buffer_scratch2_enc(frame_width, frame_height, num_ref,
-				       false);
+	return hfi_buffer_scratch2_enc(frame_width, frame_height, num_ref, false);
 }
 
 static u32 iris_vpu_enc_vpss_size(struct iris_inst *inst)

-- 
2.43.0


