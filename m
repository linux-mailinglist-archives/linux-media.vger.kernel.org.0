Return-Path: <linux-media+bounces-59195-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +G37OVoc52lR4AEAu9opvQ
	(envelope-from <linux-media+bounces-59195-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 21 Apr 2026 08:42:34 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 45891437136
	for <lists+linux-media@lfdr.de>; Tue, 21 Apr 2026 08:42:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 125F8300A743
	for <lists+linux-media@lfdr.de>; Tue, 21 Apr 2026 06:42:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28BB3366075;
	Tue, 21 Apr 2026 06:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="j5/+Ds2m";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IRI8xe93"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58B9A38D
	for <linux-media@vger.kernel.org>; Tue, 21 Apr 2026 06:42:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776753746; cv=none; b=bx/+RI65YO13lJ5liickKI4JptVGHRrsk25MLn4QxoQUetdQZR8I2kvPrpvXI+QpCcpXftnd8A3icCgVduevQzprTG8pKCum6My7xYPutdyPNu8+ZUBYMaahtgkZ6FOAwFgb20RELkFIMRS5lM7MneEyDm+LATfBcOC3PcvUg14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776753746; c=relaxed/simple;
	bh=05qs4iJw/E363fXqW+vj64b2hqUQnJwWqHGcIQ6W40s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=aTdxn9hn9vmQnh3x9/glWs8TSVAF8Pn/F76jKiZrm/XxC77p2lPUyfaXbwv41HAtfPxL1zhkivTtwfVatO3bGkidQSYRLGPYp/hoVmvMsr45oImexqhEzDnMYvZ/67O/d3QthOtu11YcxROY4GyEH0ePSJBooLqlPwnK+1aIEJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=j5/+Ds2m; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IRI8xe93; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63L0vsqs2755820
	for <linux-media@vger.kernel.org>; Tue, 21 Apr 2026 06:42:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=XmfMQ0ea6M69YBw5OM85XY
	UOlkf2qV98wbPscfhzPy0=; b=j5/+Ds2mrHRIG7ocsRszdMF3iU+9lMrGwXk4U+
	Lwtn+4qLqrDgwvnWSQGfwJxJ+1l6z1eVKhWL2FBg38u31PhVzbcOwK9/NjgZ3JWP
	6Yjwue3jfPBfxgHA9VETe3BViYfUZ91dVBWsV5G7Y6OfVCyeJ1DVqaMlVB/kL3wc
	s+0GKC3GuqyfKLPfwTQsibq+4ein0PjHBuZjMcUGQKfKUAC+KRIrqinLN/7S/U7a
	bdHF14gHMtGbhJUBg8W84O/fJd5Ehn8ZtSU+R9zch5Ygw/bRdANRpS8KQErmXkjH
	gTxoiJx5YrvehM4r+VyhzRJFH3OekTk/scrVOvrMrfOpRbQg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dnh7xm4tt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 21 Apr 2026 06:42:24 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-82f8bbb4045so2451166b3a.2
        for <linux-media@vger.kernel.org>; Mon, 20 Apr 2026 23:42:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776753744; x=1777358544; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XmfMQ0ea6M69YBw5OM85XYUOlkf2qV98wbPscfhzPy0=;
        b=IRI8xe93wLXjm7CUQBGuDyj7/vasisUh3CgZTvgDU63w14oRLajB/kAKxm0yhNNXDM
         6BsqKkWKxUAFIAz88m8xOVRoDnjaJx4kXTxKNye7FG8FD5PQ4rij+BbwMzfAYPD0/43q
         V2vhohIT1Rz2Q5GaBIby+l11bO+jROMOYeZDR3BVMuTEBydoP0mvyEAvJ93xSfh6mIt6
         Al7j+LwIOXzD1usr4VUN3x3ef1RED1gD6lOLONjpIskgO+tjIMK51so2RBwZGdshmonX
         BVrxWrTSToOkvn5IZADWGqo/hbDrzRis/qrwyUFKlpcP8OSuHh2Nk7+TvHGpvItwjmWF
         Y3nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776753744; x=1777358544;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XmfMQ0ea6M69YBw5OM85XYUOlkf2qV98wbPscfhzPy0=;
        b=Olf32i7N6rT+4bfzzdBP8mKJZKV2ZGXBCuPRaMuhhUZ9C6qVjcUR9YntJ4ncy7t6pX
         oxJO0IoRWsznb0Hhhz8yVeCUEQ2406fQfxx0vh7e4/S8EhSh8SQvJ8gdpmOtf0EYlkgF
         Dwc1qiPrcwhAmHLB42LoxgFkRWx/Ut0UQUuCnTPsnxuwlSlOZQkM+wrS1Af+sJ+Th8Wj
         QBQyHc70Vz9YXT9q8zzg4R7ZHmF53SDOPGwLE63hERnJ1MRadpVOmM8GDt73/63dSedz
         DRaX2bIuuwZlvQJSG6s7y23Ku2EQgS0+4xzG6wZCYEADS0Xz9l0fp76O0HcjxzvZ8J7c
         Eniw==
X-Gm-Message-State: AOJu0Yz7mnJEiKqfgFQKXTkYkWD4HVcEYJBIvmYtdNhPx9vLJVFH8GSN
	Pq+vzLolJ6sE/jtzP4lHq6sZErugNS3/6ToFBKW/BKyzGjCWrYVZZwgX1CzStEQ4k0mZiqBQoTI
	u10ctcEb/5EeD9GYd2MKvLyOl70ffwFKUe3ug8fuIisdtevTxp5/KBCIHnBnenZf74g==
X-Gm-Gg: AeBDieujhcMWV8iERzRm3gp8Bvvg0ZkgIHzVyhO8pDkeur8FNG8iJvGNLgkwXjkweJ/
	BAcSDjUgAcfOzrZW35HiiqlQGlxmO13npTnKRiM4buRss5eaABCorux/dsa2Ut3fABSzcOkQK2c
	/mP4If11ZSb5SVK6K6NrWEKI26oWcrxLjaQ/u9DA/wvXmENmBXnYBg3z2a9bcKOD3BvCeChOSnc
	JoYWRx0HX321GbZgXNTKqW9g+YHGiKC1MoHodKxMEQxePeGlbIdppAUPO4NS5HJWDWKdhnUwOFN
	4Kw+/ZnEM24dkBMOF1pDDl+4iZl66yrfoZNx5hR2BOH1geaIK/L9s+PKlGfiJ8NlZPhuK6iaGwg
	Ym/s/+UJ7ECPb7wSTP90d0/yfXQXBxI/tJ66Ca4dC/kek/9lT/SAfZ040TtOclcReSA==
X-Received: by 2002:a05:6a00:17a1:b0:82c:e0d7:2681 with SMTP id d2e1a72fcca58-82f8c8888b4mr16968894b3a.16.1776753743807;
        Mon, 20 Apr 2026 23:42:23 -0700 (PDT)
X-Received: by 2002:a05:6a00:17a1:b0:82c:e0d7:2681 with SMTP id d2e1a72fcca58-82f8c8888b4mr16968856b3a.16.1776753743276;
        Mon, 20 Apr 2026 23:42:23 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ebb3829sm13282285b3a.31.2026.04.20.23.42.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 23:42:22 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Tue, 21 Apr 2026 12:11:36 +0530
Subject: [PATCH] media: iris: optimize COMV buffer allocation for VPU3x and
 VPU4x
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260421-optimize_comv_buffer-v1-1-7c9a24da3ad3@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAB8c52kC/x3MQQqAIBBA0avErBPUQqmrREjZWLMoQysi6e5Jy
 7f4P0HEQBihLRIEvCiS3zJEWYBdhm1GRlM2SC4Vr6Vgfj9opQeN9etlxtM5DGxALbhWulK8gZz
 uAR3d/7br3/cDI1Mc4WYAAAA=
X-Change-ID: 20260421-optimize_comv_buffer-ae7107673609
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776753739; l=5374;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=05qs4iJw/E363fXqW+vj64b2hqUQnJwWqHGcIQ6W40s=;
 b=DLr7T9FGHdTJgZ+BnQogk3E3AAHqp4SyrjWkECPNF7YWj9MaWVIEU6tMxy8c3RpOpq24mRz6x
 Tw1ZH+uVaLDDfoyMiPNnMJTBJiPn+Sa80fSqwFGa/Hhgd+NOxRmuERZ
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIxMDA2NCBTYWx0ZWRfX5H6I+g8BEbip
 P3uNNRnrPdP+m5bjUWHlNKQZw8BAexMMohHSmf8P731uoh0aMb/cBNuUQhHvj+Weoj8k21Ko7Ah
 pw9YL/1Nf1rCyfOOA/I9J+u8ZmIgVCBkD1j76i+Pit8P0VtmHKdMsSwRBtGyIQbg09rG17wUkql
 iKkI9BQKex1WgCIISPJFJb0TzcWETTFIcvUv7V5XbRHXrI1Q7q8XfhllUWDLQEccg81OW0eNx81
 W0C4/ybh9ZtA2sh/H2u/844Y59WA4LYb0xHNd4ReWN0i4HZL9twWnRppss4B4T3AGFVOSdPye8T
 RnEOFfNQUCkcnG0jv6jBkjstIizCp6NJNWDT0nlDW/XxmiIfl7SSuvdJCNhFoU84JnfH+kYhPwI
 57QItp9GP+PJO43CGpjOMLNUqnP2J7M2Gg0wq0R3DyMfVHX315fiCB/y744IR98JEi2FJ4dNCe2
 UAwb5RklKe1QgJwQymA==
X-Authority-Analysis: v=2.4 cv=BPmDalQG c=1 sm=1 tr=0 ts=69e71c50 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=j38ZDAiZc1g5DDA0oLoA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: 12gKYi09984WOy0-WgAYdUJLwDFezwJY
X-Proofpoint-GUID: 12gKYi09984WOy0-WgAYdUJLwDFezwJY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-21_01,2026-04-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 malwarescore=0 spamscore=0
 lowpriorityscore=0 impostorscore=0 suspectscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604210064
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-59195-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FROM_NEQ_ENVFROM(0.00)[busanna.reddy@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 45891437136
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The existing iris_vpu_dec_comv_size() used VIDEO_MAX_FRAME (32) as
num_comv count unconditionally when calculating the COMV buffer size.
This resulted in an oversized COMV buffer allocation throughout decode
session, wasting memory regardless of actual number of buffers required.

For VPU3x and VPU4x platforms, introduce iris_vpu3x_4x_dec_comv_size() to
replace iris_vpu_dec_comv_size(). It derives num_comv dynamically, it
uses inst->fw_min_count once the firmware has reported its minimum buffer
requirements, and fallback to inst->buffers[BUF_OUTPUT].min_count during
initialization before firmware has communicated its requirements. This
aligns the COMV buffer size to the actual count needed rather than always
allocating with fixed VIDEO_MAX_FRAME value.

Additionally, during iris_vdec_inst_init(), fw_min_count was initialized
to MIN_BUFFERS instead of 0. This masked the fallback logic and caused the
COMV size calculation to use MIN_BUFFERS even before firmware had reported
its actual requirements. Fix this by initializing fw_min_count to 0.

During testing of 1080p AVC, it reduces the COMV buffer size from 32.89MB
to 6.16MB per decode session, significantly reducing memory consumption.

Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_vdec.c       |  2 +-
 drivers/media/platform/qcom/iris/iris_vpu_buffer.c | 24 +++++++++++++++++++---
 drivers/media/platform/qcom/iris/iris_vpu_buffer.h |  1 +
 3 files changed, 23 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c b/drivers/media/platform/qcom/iris/iris_vdec.c
index 719217399a30..f433065e08b2 100644
--- a/drivers/media/platform/qcom/iris/iris_vdec.c
+++ b/drivers/media/platform/qcom/iris/iris_vdec.c
@@ -24,7 +24,7 @@ int iris_vdec_inst_init(struct iris_inst *inst)
 	inst->fmt_src = kzalloc_obj(*inst->fmt_src);
 	inst->fmt_dst = kzalloc_obj(*inst->fmt_dst);
 
-	inst->fw_min_count = MIN_BUFFERS;
+	inst->fw_min_count = 0;
 
 	f = inst->fmt_src;
 	f->type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE;
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
index 9270422c1601..57237543b229 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
@@ -731,6 +731,23 @@ static u32 iris_vpu_dec_comv_size(struct iris_inst *inst)
 	u32 height = f->fmt.pix_mp.height;
 	u32 width = f->fmt.pix_mp.width;
 
+	if (inst->codec == V4L2_PIX_FMT_H264)
+		return hfi_buffer_comv_h264d(width, height, num_comv);
+	else if (inst->codec == V4L2_PIX_FMT_HEVC)
+		return hfi_buffer_comv_h265d(width, height, num_comv);
+
+	return 0;
+}
+
+static u32 iris_vpu3x_4x_dec_comv_size(struct iris_inst *inst)
+{
+	struct v4l2_format *f = inst->fmt_src;
+	u32 height = f->fmt.pix_mp.height;
+	u32 width = f->fmt.pix_mp.width;
+	u32 num_comv;
+
+	num_comv = inst->fw_min_count ? inst->fw_min_count : inst->buffers[BUF_OUTPUT].min_count;
+
 	if (inst->codec == V4L2_PIX_FMT_H264)
 		return hfi_buffer_comv_h264d(width, height, num_comv);
 	else if (inst->codec == V4L2_PIX_FMT_HEVC)
@@ -739,7 +756,8 @@ static u32 iris_vpu_dec_comv_size(struct iris_inst *inst)
 		if (inst->fw_caps[DRAP].value)
 			return 0;
 		else
-			return hfi_buffer_comv_av1d(width, height, num_comv);
+			return hfi_buffer_comv_av1d(width, height,
+						    num_comv + AV1D_COMV_BUFFER_OVERHEAD);
 	}
 
 	return 0;
@@ -2025,7 +2043,7 @@ u32 iris_vpu_buf_size(struct iris_inst *inst, enum iris_buffer_type buffer_type)
 
 	static const struct iris_vpu_buf_type_handle dec_internal_buf_type_handle[] = {
 		{BUF_BIN,         iris_vpu_dec_bin_size             },
-		{BUF_COMV,        iris_vpu_dec_comv_size            },
+		{BUF_COMV,        iris_vpu3x_4x_dec_comv_size       },
 		{BUF_NON_COMV,    iris_vpu_dec_non_comv_size        },
 		{BUF_LINE,        iris_vpu_dec_line_size            },
 		{BUF_PERSIST,     iris_vpu_dec_persist_size         },
@@ -2098,7 +2116,7 @@ u32 iris_vpu4x_buf_size(struct iris_inst *inst, enum iris_buffer_type buffer_typ
 
 	static const struct iris_vpu_buf_type_handle dec_internal_buf_type_handle[] = {
 		{BUF_BIN,         iris_vpu_dec_bin_size         },
-		{BUF_COMV,        iris_vpu_dec_comv_size        },
+		{BUF_COMV,        iris_vpu3x_4x_dec_comv_size   },
 		{BUF_NON_COMV,    iris_vpu_dec_non_comv_size    },
 		{BUF_LINE,        iris_vpu4x_dec_line_size      },
 		{BUF_PERSIST,     iris_vpu4x_dec_persist_size   },
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_buffer.h b/drivers/media/platform/qcom/iris/iris_vpu_buffer.h
index 12640eb5ed8c..7a9cc1c92da3 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_buffer.h
+++ b/drivers/media/platform/qcom/iris/iris_vpu_buffer.h
@@ -110,6 +110,7 @@ struct iris_inst;
 #define MAX_PE_NBR_DATA_LCU16_LINE_BUFFER_SIZE 96
 #define AV1D_NUM_HW_PIC_BUF    16
 #define AV1D_NUM_FRAME_HEADERS 16
+#define AV1D_COMV_BUFFER_OVERHEAD 7
 #define SIZE_AV1D_SEQUENCE_HEADER 768
 #define SIZE_AV1D_METADATA        512
 #define SIZE_AV1D_FRAME_HEADER    1280

---
base-commit: 4fbeef21f5387234111b5d52924e77757626faa5
change-id: 20260421-optimize_comv_buffer-ae7107673609

Best regards,
-- 
Vishnu Reddy <busanna.reddy@oss.qualcomm.com>


