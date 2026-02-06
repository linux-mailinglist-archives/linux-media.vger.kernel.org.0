Return-Path: <linux-media+bounces-52283-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EIAbOzujhWmSEQQAu9opvQ
	(envelope-from <linux-media+bounces-52283-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 06 Feb 2026 09:15:55 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B578FB55E
	for <lists+linux-media@lfdr.de>; Fri, 06 Feb 2026 09:15:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DF3543058197
	for <lists+linux-media@lfdr.de>; Fri,  6 Feb 2026 08:12:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74095347BDD;
	Fri,  6 Feb 2026 08:12:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eI1ipJWT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iviuE/tl"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B72DF329E7D
	for <linux-media@vger.kernel.org>; Fri,  6 Feb 2026 08:12:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770365576; cv=none; b=ms2g2TTRUEfMSrW8p3Wv9SgS2c4Fb6fP9hPxLZ8xWwKLc+8uNhK2esGHlp2MS+W2ECWq9Uu7IhZ4WE9Jq4nWoUGTloHegG+NUXDs35f9gY+AgXbyZhazYpk59ou6WVuixpDdcnTp+jiIlyXi648aQRmcf/Xh1i4CLR7OlS7Q90g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770365576; c=relaxed/simple;
	bh=fqLCbubwJkO1NK1LuzFXSQq4v/aB+JtViJ+h1oYxVAU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fxrU09BLoe2/rlw8m8WOjCI8vcFU4mk1zZWctsqMAexV2/AknNb3BS6XP/EzoyjCUuDRLglGzt9KUOzE2kVxNYf8SYxLrtPHerVC91Dp/MxkWLaCjMO6zz+QxZXrBS4vZuXLvvJv6kSbrpFr/Oy4lW0gH7TCcEkFyapVHXnhzdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eI1ipJWT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iviuE/tl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6167Y5Aj1853591
	for <linux-media@vger.kernel.org>; Fri, 6 Feb 2026 08:12:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kWmo14Qp+CCvuISRsrvsxFQir/qnnSerwtPJphTplns=; b=eI1ipJWTxdesqUK0
	afPFqslds9Mcqk0hten8u0AooejrEdSf5zQmt7vD3iwCtJR58vWddqbY96s7G0i5
	IMyJvo0sftDpArgIljyaRv48aYHmaHRApiwVEjMHdv8/O67oTq6xn41bxVXEthGt
	S0RGsV2oZtd/U4IApweW1HsS5YnKRuw1LVHVcOnyvMO/TmIE8/ekbhllFntnJ8ev
	h3XI4PZ7VxqBzrq0YRZC750tdECQgKfhi1chOL/vxdex9SaJ2V0B/2H9M/2OGNc7
	WjWG5UN4LF1J1ruHjdYiqhmDAOcubJ+xfZo+SsMZ1Dy03OEcmklyrWl6y7c4otJ0
	NxAEUw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c5c1483pu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 06 Feb 2026 08:12:56 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-81d9b88caf2so1818502b3a.1
        for <linux-media@vger.kernel.org>; Fri, 06 Feb 2026 00:12:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770365575; x=1770970375; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kWmo14Qp+CCvuISRsrvsxFQir/qnnSerwtPJphTplns=;
        b=iviuE/tlH4suSjjTqR54898U5O7Dk2a0CGXnmIMoAle72DCZljqzQfJLSXX8X710Ey
         6zWrvKIgMQCIf5MgeIFOQgWbhkQ6o2VKk271XMFmaJ9MRqkSXDfyDrouI1R4SBR+3BNy
         CRUmDec/f8Md0Yq0S03Cah0IXEIimWTT/bbDKRKaNIcGTCp8c/OrRZwEJNunxd9oKBOe
         knGgTrTcE7ndmVSOnheOP8JE0aBdmhcda6YnaHrGZRbZRgSP+IW7BOk+6c5Ktwv0eU3u
         /Cy2rTjrjcy+LlZ99ptcZkH43Dean6F/nVOxD2/v0S6I+BNcQR25hoz/qe/W7kEHAREh
         byNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770365575; x=1770970375;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kWmo14Qp+CCvuISRsrvsxFQir/qnnSerwtPJphTplns=;
        b=YB7YhPfm4vY3P50Nw1SYzy8iJLYufMJvZSi8+DrQI/i/dTEj2ap+dPX06rcD49qGoG
         0FfgLWbK1AYtxBtntC/M0tqI3CcFfxiGF/32PU4jJ/2dSv82R7AyhoZWQMbW5AiLC9d/
         5GtzC6N4wiD1flXbzS77JV8BnHQuC2VoNKDhZHfM4OQtHUFaL0Adf0MjKpELZ+X+4z5y
         U+1RtJO31PdwzfbddcMlFR5bb5fipFyLjoc5qoMeYUARF4wkRrBytnPjMFTzn/0zn2Gr
         CnGyxaO0IfDTpFtYtvhTAUyp6lRz5MXdJQm9Lp10Iz4zkG753Zj3vxIylD+vvmapkgQk
         TiOQ==
X-Forwarded-Encrypted: i=1; AJvYcCXohJ7nh+hUdpAYLhes9xl2xQeuWLD1SctOoCCxWI3hO+BAiku1wgeyE2iTlmJqTI9OctP0yU+sPhMlrw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzSgemDc646vEOqvP6zuTJ2PRELRORxpWgvETp4Mbd9FnNjsZqK
	r8WmuDnW2vov2oymf5cImg+ga3zQL6lZ1jLmQ6sWXmXi9FXfJChEtywvfOHIGfz36pPb8DRwxia
	kLWttaxDrspQLAGE+6eogl9btFIxxbbvnjlYrKkYMk5JyswNI4s6xrsEM2zOiRAM6ww==
X-Gm-Gg: AZuq6aL/frJdy4AdgyWiIZxTzrfrL7xr3aq9sh48Q7eT/C/9snRUfW9PWKxgbQfonx0
	trIgNmKZUDpnMFMUZZyVkwDyybwU216feotmc7u1fSSolog0GVXCVFdkVKM0vRfZLNpedFml+6L
	lSN79urnyxXlheJes2/RRe452As9N9SE7V7W00m1r6vye9tdyzVAkNQo0Zulzvhd9Uf5Lc8YBDF
	ZPzT6rWjU7EZyJ+4cYAYhd9tLZ82o3uiDgbWOJxvC3I3ta6R+P4MZ6FOFfVn0t0T3YRHqB4SFNI
	QMsTuuGmxCOQrroGd7Uo1JC2LFxz0Hd8tQHhdHkLIpgCegBG6pceK9kNR1iin/IflqF8I7e4mRj
	ruv3nmapoii3qXvGwoX4H9N4ufFz1jznMwBTSsIFfqPTWbj/Ya7c/DxYgxeTpRNunQfMMFXMV9X
	b3ar2R6Rht
X-Received: by 2002:a05:6a00:10cf:b0:81f:5198:ba3a with SMTP id d2e1a72fcca58-824416394d3mr1697254b3a.19.1770365574278;
        Fri, 06 Feb 2026 00:12:54 -0800 (PST)
X-Received: by 2002:a05:6a00:10cf:b0:81f:5198:ba3a with SMTP id d2e1a72fcca58-824416394d3mr1697229b3a.19.1770365573685;
        Fri, 06 Feb 2026 00:12:53 -0800 (PST)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82441884b75sm1671866b3a.39.2026.02.06.00.12.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Feb 2026 00:12:53 -0800 (PST)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Date: Fri, 06 Feb 2026 16:12:13 +0800
Subject: [PATCH v5 4/6] media: qcom: iris: Add hierarchical coding support
 for encoder
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260206-batch2_iris_encoder_enhancements-v5-4-fb75ed8fa375@oss.qualcomm.com>
References: <20260206-batch2_iris_encoder_enhancements-v5-0-fb75ed8fa375@oss.qualcomm.com>
In-Reply-To: <20260206-batch2_iris_encoder_enhancements-v5-0-fb75ed8fa375@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770365554; l=31570;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=fqLCbubwJkO1NK1LuzFXSQq4v/aB+JtViJ+h1oYxVAU=;
 b=lTG5wW1hb6YWWRSsw95973GWU7p06zzokCLzkzE/v9Z6Oe6SdNje/Popvc8f1M57GDDklEunu
 NJb1TGtyFwpD7TbMHvHWZmRq3QniKvXRFvvAu6+Cdk3JCGGZSFRhhcx
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Authority-Analysis: v=2.4 cv=P5k3RyAu c=1 sm=1 tr=0 ts=6985a288 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=pEw79mLSGxr9eRpYBYUA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA2MDA1MiBTYWx0ZWRfX9rQIky00se+r
 fUYWcJlx8aJjh7Ig6VcXVfZjn2wcTY2Vq9Gtb8AKbDSjOCebD7bXnhHjkNFEqN+jH9SA+z2Sol/
 PfYlS3okY1sLotHMg4OS9PVtLVHqSukNVz+CswgYSS4PYqzQoLK1Lg4ySg9MII3TuUi3bq4a3io
 0O0dnmD4Znpzi09Khx2yBXw0NZNK3wl4YtjRA4KRRzM6Pcs7rmufjc9N78ztdqYLboJTc8u+KOQ
 oHEGD4UAmOMblKdQAPuOh8BjgAHMShNc+8JcqUoDMkJhebe32pfe4+8wzZXNuCIH/UDPf68EAnO
 nWlOJfx/Mod9VS4oNudgIeOYzEY7RUSmcHSBDxKXVv88dVTpnJJvarTJDt/5MW27jZNjVitAN1o
 uAmtrEza+s94sjm1kXm5a8Aoy78zC1HAOIj7jzDDw7y/wsiGWVPtxkPTVmVWnuih5vgUTyfznFx
 8hWZlWYwFKkFkI+yRQA==
X-Proofpoint-ORIG-GUID: 99y1ZPcnVztmyK3MG_5e2XkcBtB2ejWY
X-Proofpoint-GUID: 99y1ZPcnVztmyK3MG_5e2XkcBtB2ejWY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-06_02,2026-02-05_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602060052
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-52283-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
X-Rspamd-Queue-Id: 8B578FB55E
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
index e049c28db1d8395736ae6970b5efbb351ce427dd..2ae0d1aa11f8a529b8916ae0ac96e3298e250355 100644
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
+	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
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
 	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
 	u32 entropy_mode = inst->fw_caps[ENTROPY_MODE].value;
@@ -1191,6 +1316,167 @@ int iris_set_intra_period(struct iris_inst *inst, enum platform_inst_fw_cap_type
 					     &intra_period, sizeof(intra_period));
 }
 
+int iris_set_layer_type(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
+{
+	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
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
+	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
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
+	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
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
+	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
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
 	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
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
index 87871fed09ed753760b6057ad4afa87be5f91b69..39fc728646d3808c50481ccdfa15ef0dfab05576 100644
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
index 16965150f427b901778dd5decf10a1379450b2f4..84b939f390d940c01db4b1c56270a123cabca2e3 100644
--- a/drivers/media/platform/qcom/iris/iris_instance.h
+++ b/drivers/media/platform/qcom/iris/iris_instance.h
@@ -74,6 +74,8 @@ struct iris_fmt {
  * @enc_raw_height: source image height for encoder instance
  * @enc_scale_width: scale width for encoder instance
  * @enc_scale_height: scale height for encoder instance
+ * @hfi_layer_type: hierarchical coding layer type
+ * @hfi_layer_count: hierarchical coding layer count
  */
 
 struct iris_inst {
@@ -116,6 +118,8 @@ struct iris_inst {
 	u32				enc_raw_height;
 	u32				enc_scale_width;
 	u32				enc_scale_height;
+	u32				hfi_layer_type;
+	u32				hfi_layer_count;
 };
 
 #endif
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index 67acd98e467df037d49d2ea1830038c0c8fecbaf..3efe3121459c610af55ad2f930b21c376f0a085b 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -32,6 +32,12 @@ struct iris_inst;
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
@@ -167,6 +173,23 @@ enum platform_inst_fw_cap_type {
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
index e9016609127b83b933a18e44250fd43d25f05959..65156584326a1a83588e8055f1318ba1b62e6510 100644
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
index a7ee63e5cbd8b476d765f29ecb3a7d5d52fae269..f87c713e1153388d5724a5a2add48022367d8737 100644
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


