Return-Path: <linux-media+bounces-54650-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cIX4INGFqWkd9gAAu9opvQ
	(envelope-from <linux-media+bounces-54650-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 05 Mar 2026 14:32:01 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CE9B62129BF
	for <lists+linux-media@lfdr.de>; Thu, 05 Mar 2026 14:32:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F15B6302EA86
	for <lists+linux-media@lfdr.de>; Thu,  5 Mar 2026 13:30:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE61C3A4F43;
	Thu,  5 Mar 2026 13:30:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EJl/ALOh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="enJDJWG0"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35FE63822B7
	for <linux-media@vger.kernel.org>; Thu,  5 Mar 2026 13:30:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772717430; cv=none; b=pQ1Oc2PjLdUi9OeSNRHb8uFpLnnvZGK/9EqbXvhrKtW3UCqEWhHeFH+VC0bY4DZ7cbv/cdFahr4XA7ipG1TVPfZ3EcdSq7u0gWq3rg3o/hbmAZCa9ZMQOrtt8jUDf5N2wtly9eNJpK9h3okdKT70QkhNXxQpW8Vlxt3e22pWVow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772717430; c=relaxed/simple;
	bh=zVbqjpkjW7FulZscz7dxSatBpi7dmc9OK/lBG9AXHuo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=NLP2t2xXHFYvR/rgdFdEzk6xeYFS/fJvBjemIEA99hzzu1XYrbZswZHQV1bUwZmy/acMm93Sdj8jTdpfaGso/ivO5kYfbVqrqIXxXF0R0WRFK0OX/CNHNjYq5oZOV90N3YK+B9M5bxxmnTaT4EQ+l34pTasZ9iJ7Fd5r4dQ0vXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EJl/ALOh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=enJDJWG0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 625AFowd861635
	for <linux-media@vger.kernel.org>; Thu, 5 Mar 2026 13:30:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=sQ3LaKCpwhAN8tXXKc4fac
	w4IUD4LrbVBtbodb8lwk0=; b=EJl/ALOhsNlzhv4IesKhUimpwPFwbZ8u7v38Vu
	zrOFLTTuBods+7qLWlRRk2FMHrTn5PMNSLhTe0JH+8C53pAijc5Ugc4KMOKXloOh
	bX1CwwNgBogI4GvNCb9DapKKjKYmuBKjKGg1uju8cakb1q02sAIGd4CJJmBxp0Cy
	wOmlbS7deytXMTAS2s197GUd5GPTimYiLG+jEkND2YLAlVCN5a7/7o6STeryoOFH
	/ehpM4SzkTPV9ZNpGIZrXyC0zFUSGpfe6VxFQ5Sa8ZNjvhfagM8Y6Y9/ciILHGth
	aMa686chs0q23+1Jg1kC2ZQucWVpNc8lcg/bKBYPXEGhhT6w==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cps0wbdh2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 05 Mar 2026 13:30:28 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c739120475fso368539a12.3
        for <linux-media@vger.kernel.org>; Thu, 05 Mar 2026 05:30:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772717428; x=1773322228; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sQ3LaKCpwhAN8tXXKc4facw4IUD4LrbVBtbodb8lwk0=;
        b=enJDJWG04IpGJXFhetk/mzp6gNj7H3t2LApIw5f2OQc9JXs9xVvcR3F5xOXPuNJx7G
         UQ31NXrUIl8gAFrbIBfwaoCS7vCk+8bjnWh/yKpCkzTzpUCOCLshXSWhJ+J9NnhYI7Lf
         ZvRAuzjNkUk4CAqSGI4UP3ldykP8ntcd5tHX68R+a06NqK+/EHAbR7wtZ4shaaMMr1iU
         dGaYsvkYmGoRBuKMGLl/+8wWfC/b2rWs8+94JX9+oYW3/WR/nnk1ZOySolq3OWeBU9oX
         hMpVFpZnkMdzKHphKxV2mhXGMTDRGw2D+7/Za0BSSnwCJlFctkkV9gx4KRYMKQLH1BGc
         YsmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772717428; x=1773322228;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sQ3LaKCpwhAN8tXXKc4facw4IUD4LrbVBtbodb8lwk0=;
        b=hWlDWTMZoYzvI5o2RSU3BX2g0vaYXd0H4RppUH224QiuAAYWMxrNE8olWbFfU6bv4A
         UmEcnlfgyTFKq++5YzGgDQRB6lY+5fTSddEoFE4GOWVdLdk1FpWU1wGqjTm5VKVJL5nw
         fB1jDS81OwB4/mBF52u1LDKBdcCf1p/lAyF1ox9pf1BZ7YLuzVZBAkDGTJTurx5OCZpK
         GRcLhak8op+lkDgSKgrJZ0pmA2u+Co6xYICLBh0x5qdFz0l895L23nB09Q0gToXbBTIf
         yTeLrjNKi8kXBsScwAZDPvBi8Txj8mWWUMoxw4d4udoMPH7FhA+S9LJLOQGcqjRzwLk0
         aQtg==
X-Gm-Message-State: AOJu0YwqUkfj/5aHE3nGVVQ4PHxaxJn6M1sZ95YXuWj3KJxJDymzcNEj
	WxW2NFmgv9Mon/HX5PO0Zp0PbFSXSKGOLkaVT0ObX8R4DUPdZ9UsYSRHUgIfnoA2erqp5lmYwXl
	Utb6czgkUC+n6SgUoj7QpTKN5mkEvK/U3j7OwilPcuIlx1LUk9rSu7aaJxjjqENK5Hg==
X-Gm-Gg: ATEYQzzgGqSj1xJ6an9UeoUhWEBnbuOMdVxUpNXnqkUx9FeUnoKa/b1MbqJEMJVYfRw
	X8zWhXwZMnDfZ5WJUWDQ3ok9uD9hKdXer0ZLa4oZoNFodkUaBnHfJYSq9Ble2DcKSPM4UWdIQzn
	HBVAfZ6OvV3T6dD/wxb+Vfj+v69uEdd/yyHO8Qe1cDb+L/5EZAHCBqBv9Cqw5W4AaHbxi+0DExq
	HSvSWBNmLh9drf1g1k00w1jdv8qAw/nVkjCjtWeKRcdqOREwsqq1QtRClE+l/Gob7tp6RZgEzRx
	dhnXdmyPnGbcvfpFb6aeXM0eSJ3105oufs5inkZSP20Ww/6WXBb/kl8secAuyl3j3YvE0mKZtKI
	miX9+NvD/PfrWxpl/mNtFufyIbtRob7Oira4aUT+hYIzyiBA8z8loaOM=
X-Received: by 2002:a05:6a21:3b93:b0:38d:f745:4d63 with SMTP id adf61e73a8af0-3982e29a1eemr5506469637.63.1772717427423;
        Thu, 05 Mar 2026 05:30:27 -0800 (PST)
X-Received: by 2002:a05:6a21:3b93:b0:38d:f745:4d63 with SMTP id adf61e73a8af0-3982e29a1eemr5506404637.63.1772717426373;
        Thu, 05 Mar 2026 05:30:26 -0800 (PST)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7389126194sm2913390a12.24.2026.03.05.05.30.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 05:30:25 -0800 (PST)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Thu, 05 Mar 2026 19:00:14 +0530
Subject: [PATCH v2] media: iris: add FPS calculation and VPP FW overhead in
 frequency formula
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260305-update_fps_calculation-v2-1-e3b5cccb1246@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAGWFqWkC/4WOQQ6CMBBFr0JmbU0LhVZX3sMYM3QGbaKAbSEaw
 92teAA3k7zJ/y//DZGD5wj74g2BZx/90GcoNwW4K/YXFp4yQynLRlZSi2kkTHzuxnh2eHPTDVO
 uiJ1lNp2ppWkV5PIYuPPPVXw8/TjwY8r+9HtCi5GFG+53n/ZFV8uad8aSQql1idS2xNoiU2Wdt
 JqIsaGG4eu6+piG8Fo3z2qV/Zs3K6GEZkZXmQprqQ9DjNvHlCN5wTYfOC3L8gE7FPHQDwEAAA=
 =
X-Change-ID: 20260304-update_fps_calculation-98ee7f7507b1
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772717423; l=4298;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=zVbqjpkjW7FulZscz7dxSatBpi7dmc9OK/lBG9AXHuo=;
 b=j3HRaeDwFhB7TbnpIKvzvGvAu5g9kcitqICfzOIuEc0943SbnSquNyGA2NnF/ZVNlX0vgMNIG
 3DAEmgICDSnDvowKoJEZolSOzDKKUV2mfvvYuad4priuIFuYwuWDEar
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-GUID: ycQJ6lW6Y_YRkjSQaEfeD8wZPi5yD-dW
X-Authority-Analysis: v=2.4 cv=BNK+bVQG c=1 sm=1 tr=0 ts=69a98574 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=aZFUA4iBNJJznah6NdIA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDEwNyBTYWx0ZWRfX/o5L9D9szQhm
 4ff3GALZHMwEL/skSIchyMv5PSPrhNtp7/VKw2at8JkITJeh2FVatxhbv4apIfTTyyJL5GzuZTi
 qhwYgcE4gfSLVDNfGvQySnKzlMbE0KJym5OkAIqFqKE7ZambVvORBIH8DcEOpQGZ0m6Y2iu55NL
 5+tZMCBMx9V6fJttw8ibVGOLeY5ADxsYqvAI9tJ+g9cyjcD1ETy4c2fXU0d5wRLrc4N9kZ8PD4I
 2amWZ44WS4e9dWxaXB94oFjWNJqLgYwwKNe3dZyNWPfdUJAGXXldu9d0kOnEDD1y6cPcRdO1mdJ
 gzX4ZJAamQg4pQq+nCSDFU9kUSwWXVm5XfJVvGt+VolXcJAYHkZfAxT6bC5Dw56O+v3kSSg6Tf1
 9trtgTuDC5kaUKozqRXsyLHXHjTIQsk3c+5zTra6dITAZ6Wv1EW7RTwDn8n39lFwW+a6VnoMuBk
 NBAyg0Rx5FpDdjR0z8g==
X-Proofpoint-ORIG-GUID: ycQJ6lW6Y_YRkjSQaEfeD8wZPi5yD-dW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_04,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 spamscore=0 clxscore=1015 impostorscore=0
 adultscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603050107
X-Rspamd-Queue-Id: CE9B62129BF
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-54650-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
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
X-Rspamd-Action: no action

The driver was using a fixed default FPS value when calculating the VPU
frequency. This caused wrong frequency requests for high‑frame‑rate
streams, for example 4K at 240 FPS. Because of this, the hardware was
running at a lower frequency than needed.

Add the FPS measurement based on the decoder input buffer arrival rate.
The measured FPS is stored per instance and used in frequency calculation
instead of the fixed default FPS. The value is clamped so that it does
not exceed platform limits. Add a VPP firmware overhead when running in
STAGE_2.

Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
Changes in v2:
- Replaced div_u64 with mult_frac
- Link to v1: https://lore.kernel.org/r/20260304-update_fps_calculation-v1-1-4eeac373a504@oss.qualcomm.com
---
 drivers/media/platform/qcom/iris/iris_instance.h   |  2 ++
 drivers/media/platform/qcom/iris/iris_vdec.c       | 21 +++++++++++++++++++++
 drivers/media/platform/qcom/iris/iris_vpu_common.c |  6 +++++-
 3 files changed, 28 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_instance.h b/drivers/media/platform/qcom/iris/iris_instance.h
index 16965150f427..180cba36a7f2 100644
--- a/drivers/media/platform/qcom/iris/iris_instance.h
+++ b/drivers/media/platform/qcom/iris/iris_instance.h
@@ -109,6 +109,8 @@ struct iris_inst {
 	u32				metadata_idx;
 	u32				codec;
 	bool				last_buffer_dequeued;
+	u64				last_buf_recv_time_ns;
+	u32				frame_count;
 	u32				frame_rate;
 	u32				operating_rate;
 	u32				hfi_rc_type;
diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c b/drivers/media/platform/qcom/iris/iris_vdec.c
index 719217399a30..88820060e22a 100644
--- a/drivers/media/platform/qcom/iris/iris_vdec.c
+++ b/drivers/media/platform/qcom/iris/iris_vdec.c
@@ -369,6 +369,8 @@ int iris_vdec_streamon_input(struct iris_inst *inst)
 	if (ret)
 		return ret;
 
+	inst->frame_count = 0;
+
 	return iris_process_streamon_input(inst);
 }
 
@@ -411,6 +413,7 @@ int iris_vdec_qbuf(struct iris_inst *inst, struct vb2_v4l2_buffer *vbuf)
 {
 	struct iris_buffer *buf = to_iris_buffer(vbuf);
 	struct vb2_buffer *vb2 = &vbuf->vb2_buf;
+	u64 cur_buf_recv_time_ns, time_delta_ns;
 	struct vb2_queue *q;
 	int ret;
 
@@ -427,6 +430,24 @@ int iris_vdec_qbuf(struct iris_inst *inst, struct vb2_v4l2_buffer *vbuf)
 		return 0;
 	}
 
+	if (buf->type == BUF_INPUT) {
+		cur_buf_recv_time_ns = ktime_get_ns();
+
+		if (inst->frame_count == 0) {
+			inst->last_buf_recv_time_ns = cur_buf_recv_time_ns;
+			inst->frame_rate = MAXIMUM_FPS;
+		}
+		time_delta_ns = cur_buf_recv_time_ns - inst->last_buf_recv_time_ns;
+
+		if (time_delta_ns >= NSEC_PER_SEC) {
+			inst->frame_rate = clamp_t(u32, inst->frame_count, DEFAULT_FPS,
+						   MAXIMUM_FPS);
+			inst->last_buf_recv_time_ns = cur_buf_recv_time_ns;
+			inst->frame_count = 0;
+		}
+		inst->frame_count++;
+	}
+
 	iris_scale_power(inst);
 
 	return iris_queue_buffer(inst, buf);
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers/media/platform/qcom/iris/iris_vpu_common.c
index 548e5f1727fd..d621ccffa868 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
@@ -416,7 +416,7 @@ u64 iris_vpu3x_vpu4x_calculate_frequency(struct iris_inst *inst, size_t data_siz
 	u32 height, width, mbs_per_second, mbpf;
 	u64 fw_cycles, fw_vpp_cycles;
 	u64 vsp_cycles, vpp_cycles;
-	u32 fps = DEFAULT_FPS;
+	u32 fps = inst->frame_rate;
 
 	width = max(inp_f->fmt.pix_mp.width, inst->crop.width);
 	height = max(inp_f->fmt.pix_mp.height, inst->crop.height);
@@ -435,6 +435,10 @@ u64 iris_vpu3x_vpu4x_calculate_frequency(struct iris_inst *inst, size_t data_siz
 	if (inst->fw_caps[PIPE].value > 1)
 		vpp_cycles += div_u64(vpp_cycles * 59, 1000);
 
+	/* 1.05 is VPP FW overhead */
+	if (inst->fw_caps[STAGE].value == STAGE_2)
+		vpp_cycles += mult_frac(vpp_cycles, 5, 100);
+
 	vsp_cycles = fps * data_size * 8;
 	vsp_cycles = div_u64(vsp_cycles, 2);
 	/* VSP FW overhead 1.05 */

---
base-commit: f505e978d1a0442adbbde48aed38c084ddea6d6e
change-id: 20260304-update_fps_calculation-98ee7f7507b1

Best regards,
-- 
Vishnu Reddy <busanna.reddy@oss.qualcomm.com>


