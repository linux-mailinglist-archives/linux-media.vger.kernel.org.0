Return-Path: <linux-media+bounces-57831-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KMosNlaPzGnXTwYAu9opvQ
	(envelope-from <linux-media+bounces-57831-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 01 Apr 2026 05:21:58 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 82CEC3743B4
	for <lists+linux-media@lfdr.de>; Wed, 01 Apr 2026 05:21:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D2F6A30EC737
	for <lists+linux-media@lfdr.de>; Wed,  1 Apr 2026 03:15:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC05637F00C;
	Wed,  1 Apr 2026 03:15:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AeY9ttA2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SGrkAtkr"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D36E236215F
	for <linux-media@vger.kernel.org>; Wed,  1 Apr 2026 03:15:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775013322; cv=none; b=sX0LFvsLrxt7bQhO4GRYTIKnfH3NjFfYyysuU3yX7N+cMpRJUaeP58W+zPFw47r6VnZrG5qYA+RHkluW5JGE/Tl/XW2fPPvg8HluctVv1mHtA005wwddyVRxvmB6Z91ucy1OrnK9xhImccmNzWaH0bGUg895/XTREhAlfpR0q5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775013322; c=relaxed/simple;
	bh=lawW6fZz7FhbAklWYhnwX7sYVh1JylvRbotqVSrG5jo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pQSNHnuFqEIRNNbiGf57+e0/OJXISBm1ZT07R2Cc9xkDzNtnTwfw3QSV58fLFJltZkvcVpvFVkc1Yox2N1isl13PQrMReGBXMz/DjJ9oc9OO6y85X7iFmBVT4+zjOik0alFuRA3nO5RHNqRA1Ewyl9lVzqocqvBUvJF+kZ9VxDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AeY9ttA2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SGrkAtkr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62VNRGI43926956
	for <linux-media@vger.kernel.org>; Wed, 1 Apr 2026 03:15:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9Z2h0hI01eMvKFdHl8VTByM1c0vyJvxMmPHdgdgW6UE=; b=AeY9ttA26drtW8C1
	cGzPVPHGvPK4C6EDtKwXC0+oHCAVQE6ACzrZaq5VrP7vyLZ+NfJbYeErZ/tqfuiI
	WkKEavqV/HF/PberyBPfvU1SzTvFgBj6t1joKplQJZU3zz/o6Ll1ffuzGawM7m4y
	/CL8T7YZJocjayvJgPVe4YB9Uw4FYWJq/eGT9B6E/P8Vx6YrrmnazPmSwwZw3Sza
	FmIyN2c2L/dKljRM2teBwGgSXccYKkf1QJFNcyc9UV26ETzqQBrUWc+qjEPdgxQH
	2Y7+Bhjf7rCHq9O6GLghFxzcK8pvOOuHnyIy+xJArCU5qj7T+eNACddtpcrXFgG7
	/+4a/A==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8b934f61-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 01 Apr 2026 03:15:17 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c76bd4feb9fso202004a12.0
        for <linux-media@vger.kernel.org>; Tue, 31 Mar 2026 20:15:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775013316; x=1775618116; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9Z2h0hI01eMvKFdHl8VTByM1c0vyJvxMmPHdgdgW6UE=;
        b=SGrkAtkrAMZeazssrSphionPsKQXvEkAKTindex6afN/mNlpTcbfG63Ghb9NlUihFH
         8uxEFWAvXiCLXwPXIsOCUoQj1vJTTPjyOpi7wzKq+7CE+n66Hcha+tu3o60KezcaUglj
         83yqgh4afw/c1lWz7RhaYPEI19ifCPj7LQR6fH6XHZvXwyd9ApsK47CNWOjA2uLNeZDu
         o2TCPAtQzv8LnRD43vvY+xAtuAD3GnDXcGX0wqhEVMJQ1iY7No0HAaBLzAFg/h8sEb+0
         MxNLxS0RSBMbqUhydQnekBfYLm51jlDffTrKXBXeSDlSIlgx1qBBxNR/to2LKEiknhXr
         pOOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775013316; x=1775618116;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9Z2h0hI01eMvKFdHl8VTByM1c0vyJvxMmPHdgdgW6UE=;
        b=V6QHyMQONssQ3A5b5S7ixEDL9lJulKK89OMbaubLR/rF1c3OTu7/p0tMEuseowTE5J
         SWJdLzPtqK/aiL7tW1f8Y5wSJqqiyqdRYHm5qVszsZDKvf4WkEBxuTdCp7WiBrJ9oUXY
         2+GGsLWqHZ2Xumh0hAqN7hhUfsgWuKQWN/m/F0beLYL/tAFqsX7Jt2y53fFLwrc7nTbZ
         6+vFRIcUb/VBD/4D1BRBwF1dh/sZINACWC/s1IiJHf04Xf1GcHxRQKSd1CR4zCIOu+w+
         f0c9R3XhDB1iNzC7CLI31dKwLoZ8VtnzwoMLCaGxfUza1FV6OLodF/D8lh6lZ1OK2XAU
         Wu1A==
X-Forwarded-Encrypted: i=1; AJvYcCUu5KRaUmfWwEhMqsVeuTuqLnpMZ3LCxHrwVbFO8aM0jWunEdQ4qi7w9rdxSM8Vs/9I5BWRm3kDdlMrKA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyiwoF4teT95V6UkJsk0p5CFzj3gp5y9g4+YY+0XaNqWYI6zQAy
	ijTqUxUK52v7mhJHYWniANme3/aCD1hlkEHLcSryXUOYUMQ5r29QmAnO3RINWHwoaZhlszuzJRI
	2AhaCXk0LmYIdhsRxMeABgqG+DD9ATL/ZRrcR+5qJxPD2SWPT69jQt9WvcJoUFG3uBQ==
X-Gm-Gg: ATEYQzxVJUbu55rgzfilZ7pUpV7PEe9zbHMMbm7KBm3WilNSmYewwJLHfUYAqR40eQ/
	ZTl+tFMveKwYUYR6Lnf6HAq75BWS2agc4ea2QJqZRxcOhMp6hSz/3smcPREPRb3YqlopN6IzJVf
	QQL1O2iZP+17AqZtfuUykxSaGt+9VvPwp5TBhC852OsBxIdO7fZ34X172MQEGp+x6JzXk2mknbw
	+2zZKJyEy85cgwLlfhuPHA9Dcu7G7TneyDomRqjdCGrCWTx3cdU8Bzo+Er6tVpHRcXOlUy13s+O
	OfUA5uLnfrp7Qo5MfcqkqDKyTw/02z60rW47jrF6KcBqKa3ZfinXVS7Tvo/bvG0vhA+DuO5oKvG
	EWgN4IelZ21Hr0aYcgSBUN9PJxwultzI/Z/qH0f0CPa3BASW6CimbGXZvYqvUsvc2o+xhbd3fVy
	9tupQye5idXJ9j6Rmw2n4b
X-Received: by 2002:a05:6a21:32a6:b0:398:7137:272a with SMTP id adf61e73a8af0-39ef769ce4cmr1755066637.32.1775013315987;
        Tue, 31 Mar 2026 20:15:15 -0700 (PDT)
X-Received: by 2002:a05:6a21:32a6:b0:398:7137:272a with SMTP id adf61e73a8af0-39ef769ce4cmr1755036637.32.1775013315425;
        Tue, 31 Mar 2026 20:15:15 -0700 (PDT)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c76ad00a246sm3246584a12.16.2026.03.31.20.15.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 20:15:14 -0700 (PDT)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Date: Wed, 01 Apr 2026 11:13:46 +0800
Subject: [PATCH v6 4/6] media: qcom: iris: Add hierarchical coding support
 for encoder
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260401-batch2_iris_encoder_enhancements-v6-4-7022af3401ff@oss.qualcomm.com>
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
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775013294; l=31647;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=lawW6fZz7FhbAklWYhnwX7sYVh1JylvRbotqVSrG5jo=;
 b=oLOwkgUFDC9XLlNoq4WOL6ePCAyLx7CsTc3vdrPGWmpRQy9rCT85G3LDg3MnB3bCL/FVOWUA4
 gtOQdX8DxBECOghHKI44tRzhuZ9fXdHZD5KMHlMqQa2aSmSS+5nXITK
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDAyMyBTYWx0ZWRfX2cp0ITYrkLdJ
 +beZCptCUAUAGOnX+Wy8jQGTyAhIbl5XOQoFUYvmu5d8y8KhAC3D/g/fzFXuTFhN9vy7hQjnhVq
 r8qGyrBgMKU5y63QF8v48ngnzGc9uoJ2MBx8nlcUOicp2/VnAvJrt7Gnl+Teuw8r6SIcjIb6MLh
 91a/Xv85iW7SMcmn0gUZSfDjFC0Map69aBqc4TP6JDYppJfFoJtKLIVQGuleRimu0Y9aIJE0Jcw
 /ayEeB6HslcM3nLoKPEqNv1ZQPtLstB06rcPTzGqxzMU7ZiUh5RUzVNBzN0zZZOsWY5/kb8CheD
 wNkTzv2s3ByOGiW+hxW4CGp0DheZ9qXOCX78WDi3OGc5AfJMMzUM3eIkfhzxoWTFv8tNwKCqR++
 21vc+VljwZ2p0z4fZ7vSeJdTjDT/Ikbtc3Iq70tKkCz9W8WGN0952hKP2qV5Q+I+JrPkmytX4G4
 ypImpKUUX3VQUwYueMA==
X-Proofpoint-ORIG-GUID: cJY6sMurMZbu0NigVENZikPPMW_Q7MAK
X-Proofpoint-GUID: cJY6sMurMZbu0NigVENZikPPMW_Q7MAK
X-Authority-Analysis: v=2.4 cv=NLjYOk6g c=1 sm=1 tr=0 ts=69cc8dc5 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=pEw79mLSGxr9eRpYBYUA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
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
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-57831-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FROM_NEQ_ENVFROM(0.00)[wangao.wang@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 82CEC3743B4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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
 .../platform/qcom/iris/iris_hfi_gen1_command.c     |  21 +-
 .../platform/qcom/iris/iris_hfi_gen1_defines.h     |   2 +
 .../platform/qcom/iris/iris_hfi_gen2_defines.h     |  15 ++
 drivers/media/platform/qcom/iris/iris_instance.h   |   4 +
 .../platform/qcom/iris/iris_platform_common.h      |  23 ++
 .../media/platform/qcom/iris/iris_platform_gen1.c  |  94 ++++++-
 .../media/platform/qcom/iris/iris_platform_gen2.c  | 184 ++++++++++++-
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
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
index 4d1b78c819a7cc11c0cec2812170d926b5f83c11..702ca1835b816088ffec1b3a5ce315cdccb4d7c0 100644
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
index 0236f81fb47902c215a8481408950b3a329d872f..3143f7738d5d0bee6546f86b2cd87af01fc2d2fd 100644
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
@@ -156,6 +162,23 @@ enum platform_inst_fw_cap_type {
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
 
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen1.c b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
index e01389bfb0ee1e6be72230bcd6497c00d87afaae..3a4dcff8e1b313dc2550f9bb91fa57f7045f32fd 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen1.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
@@ -158,7 +158,7 @@ static const struct platform_inst_fw_cap inst_fw_cap_sm8250_enc[] = {
 		.hfi_id = HFI_PROPERTY_CONFIG_VENC_TARGET_BITRATE,
 		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
 			CAP_FLAG_DYNAMIC_ALLOWED,
-		.set = iris_set_bitrate,
+		.set = iris_set_bitrate_gen1,
 	},
 	{
 		.cap_id = BITRATE_MODE,
@@ -313,6 +313,98 @@ static const struct platform_inst_fw_cap inst_fw_cap_sm8250_enc[] = {
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
 
 static struct platform_inst_caps platform_inst_cap_sm8250 = {
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
index 0713742e019479d81028c4df821fef3af913eea5..686a12497504eb3653bbba457f8e19b011f0dcab 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
@@ -416,7 +416,7 @@ static const struct platform_inst_fw_cap inst_fw_cap_sm8550_enc[] = {
 		.hfi_id = HFI_PROP_TOTAL_BITRATE,
 		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
 			CAP_FLAG_DYNAMIC_ALLOWED,
-		.set = iris_set_bitrate,
+		.set = iris_set_bitrate_gen2,
 	},
 	{
 		.cap_id = BITRATE_PEAK,
@@ -780,6 +780,188 @@ static const struct platform_inst_fw_cap inst_fw_cap_sm8550_enc[] = {
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
 
 static struct platform_inst_caps platform_inst_cap_sm8550 = {
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


