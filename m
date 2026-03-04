Return-Path: <linux-media+bounces-54447-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qI1GAdL5p2mtmwAAu9opvQ
	(envelope-from <linux-media+bounces-54447-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 04 Mar 2026 10:22:26 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B4451FD81E
	for <lists+linux-media@lfdr.de>; Wed, 04 Mar 2026 10:22:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D671D30A3CFB
	for <lists+linux-media@lfdr.de>; Wed,  4 Mar 2026 09:20:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9FDB395261;
	Wed,  4 Mar 2026 09:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EJLxzpsA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SUkFCX09"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49A1239768F
	for <linux-media@vger.kernel.org>; Wed,  4 Mar 2026 09:20:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772616025; cv=none; b=GLFZK38bIvNI2ypq+EcsRh+gRLsfmL4jrmdWlgOIqUak7QMvCHhZF4k4uFqWzVoXytMo9/NH6PJ4IuAmZwBhd/HHArOFZZKVPnFgEAjE2h/li+xO2H+RZXuSvpFzjtp6QFy4MHN5elNvd15t0LD5TbyGJp2ia8X3of2i6eP0LUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772616025; c=relaxed/simple;
	bh=8ABxF8KGWyosxpUtDGwgLl2L+AgpEgGxwR2CtQsrr9o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Tw6wvhMzRDX5qj+r8HiCbAUtI/igkcZbwGJx3yDg3sU0vNEWAonJahCgF9x4pS/gno6gImbKAYryJbGyrJc2S/4pfsg7RfoMgstlhKRTUpOG0m7iyyQEgsX+3neFCN4hvxFyOKKzXIZw9XkZc3n0EpnWkE7RfOyvdAEmqDMkQLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EJLxzpsA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SUkFCX09; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6246DWYS1203738
	for <linux-media@vger.kernel.org>; Wed, 4 Mar 2026 09:20:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=/M3P51h1a1yRann62VX77s
	1NXUJKicz1Y0SDE55UB5Q=; b=EJLxzpsA+/w8ts3WmSF2pXGIAkzsMUVwccnPC5
	vL5OfHiBJwnaNzkMYbmd/XBCBUmf2whww83iUz58PXpGerDqSw8JMEyeRJUsIOkD
	l6irhr/vzlJkiho2l2zENMLtbuwhCwu3H6E3iq1TnlLKSDrZN+W/JCO6ychubRrD
	P023RPMZb/4liBIDfMc2Q/ifg9VjI1atgS/EmGLdo6JPW1LYt0ATop6ktug3WEK6
	R2cPpkM6e2F3wkFPIXBNZy2RU4XmiXnxyPu6GS4R5kDhchTBKozSd8PCPksz5g9c
	COTyJkjKscs6vfIpp6e/c39JX0FeGMW1UfoIXaMJ/vWYOJ5w==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cpf9c0mwr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 04 Mar 2026 09:20:20 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-354bc535546so5411760a91.3
        for <linux-media@vger.kernel.org>; Wed, 04 Mar 2026 01:20:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772616019; x=1773220819; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/M3P51h1a1yRann62VX77s1NXUJKicz1Y0SDE55UB5Q=;
        b=SUkFCX09ZUDfYxLa7dDtBgreTlEM5HQJoFRyYH1MY3CxiMbU5P4cJTaNy0oTuTNi8k
         c+XBN0YY2nA0czoRlKRCFIVFcGZSb0rbKs5ko8wvqy1HwS2eLsYrogJDIl9blRk8eZat
         dkAvOEGuRF7I2CeKdrRvlQu2a7pnIxF1FrVkTOofB0yHD9Sq+lGLq4eaOMwnmwtbVEUT
         ar6TicknmJzKD8gdQnk/Rz8v02743heOhnmnXGn1bjuBW09dPVQu9BuBvjAOmeb4IyUv
         5IX8/S92RB9ldPS5bf8xp9cKKFEnFqZ+r5tuq7+TwuqaQKg19j/BAaDRpBOTdeyAjyle
         uujA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772616019; x=1773220819;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/M3P51h1a1yRann62VX77s1NXUJKicz1Y0SDE55UB5Q=;
        b=MeCFdU8u4lUI51b+Px/N88lmr0QAKDn5uWXeK7M2B7VfUuWlVkRkajSiLvN9TsDkaI
         maBSsKACmhlCXVmAsUBh+iJuWet7pGwcHTEfoBa5hDxfZ2BTwuffJ/Ex2bFoSxSUxPi+
         GQQJqWhDqOFxJdCf3x57L8B2BNJnLf3BvSRWLcdSothmBHdlIQT23EdF19mFG0Iu7S7r
         ppt/uURufQ9+8d05KaT/ETfbyOnW2Rui+ONiJIZSQz7E/2oI1vaWrOiJh0QggHG2Eby7
         wanR/xNFC1ArxlqhTWO02GP4GEHzAb6jS9bgLyZaxviXqJHoCtfHSf9Rb1Re46RExtDQ
         dV1w==
X-Gm-Message-State: AOJu0YzO6w/FCJsSO0WG2QxxCwj3/jeb8YlBvUB9BjFxlzeieONi5SQ1
	YT3VpTtS3yb8DhuLY9VvwMC8J3qfoSdia982IEuD6jHLgF59UCRp+bv9J291ADD9KFJv7T2PsqG
	IIqxuII3Ib4hJxsVFQ//Xa0zG3j0eYURLtJB/5VV3tjjRwhH0NMPz4naITHkA8udrQw==
X-Gm-Gg: ATEYQzyaeCT47eCIsURBO0qw29lF7FljbsEPfZqgJmyA53J62mbuzsyPFwzbQseUy8h
	KN13FjjreLariJrToduQFyMJDTCDgkZND5mXGBswb1i49o4xTpu1a1l80uInWHnyZm9jalmZfdG
	wsehrVmod+/24WVsx0eqFZSJOdSXpd1TPFLR1T98b479OiBsq7FSA4PIji6r4w64tqfbnzirKsF
	IrU3PzYJdA2j/WGxnIWUCxNgTEtNpwCCi6yBvNsFD1paOEUxA30IKeM4wakLNZuME4G/1RJkv2C
	ch7+iXXCQqrK6dHPhsYJQfhvbN4X7TYmz9F+qSw5THFf7Gm39iiopKIxTt+JwgwnCVvzAAbKD4p
	5Nhx6hRXayzpITNPkkzHZ5sBQSF9WP0Jvh5sjM/DysJmmuIvH1dxf+Ls=
X-Received: by 2002:a17:90b:2ccf:b0:354:bd08:4802 with SMTP id 98e67ed59e1d1-359a6a7c458mr1241516a91.35.1772616019487;
        Wed, 04 Mar 2026 01:20:19 -0800 (PST)
X-Received: by 2002:a17:90b:2ccf:b0:354:bd08:4802 with SMTP id 98e67ed59e1d1-359a6a7c458mr1241499a91.35.1772616018970;
        Wed, 04 Mar 2026 01:20:18 -0800 (PST)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae4651e409sm123643265ad.44.2026.03.04.01.20.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 01:20:18 -0800 (PST)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Wed, 04 Mar 2026 14:48:54 +0530
Subject: [PATCH] media: iris: add FPS calculation and VPP FW overhead in
 frequency formula
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260304-update_fps_calculation-v1-1-4eeac373a504@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAP34p2kC/yWMWwqDMBAAryL73UDUaGKvUkTW7KYN+GoSS0G8e
 0P9nIGZAyIHzxHuxQGBPz76dclQ3gqwL1yeLDxlhkpWraylEvtGmHhwWxwsTnafMOVEdIZZO91
 IPZaQ4y2w89//+NFfHPi953+6JIwYWdh1nn26F66RDXfaUIlSqQppHImVQabaWGkUEWNLLUN/n
 j+xY9wLtAAAAA==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772616015; l=4136;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=8ABxF8KGWyosxpUtDGwgLl2L+AgpEgGxwR2CtQsrr9o=;
 b=3pv5kCDvQZyFvKiptpI/HpmnbMCL4Q6+sQGcxCof/YQtHdtCPqLdNTyWjgagdYeb6a/jIMEy8
 R90QfE/2394DNFLI/ehIOldVdh484LgMkHmSsUxm3yVhou6zdvO5OGl
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDA3MCBTYWx0ZWRfX0/Aunk4JIRX6
 Wavei8d1f3ufci+eQ1zvYSGDjfiYqQyzb2upL4ePuopwqB9JgvS+jlIEEuI58rD6mu5OGHLP4/D
 xkbCQhTnYeEdcHWhtlzHi9tUKbXIPMOjFo4IzX+ZS41nso0mualE/rdkLh4BzlJW/9xWgE6Y6z/
 LZ6U6vrJ7fONp/p/6wpgg4rrhlKPjPoImuAPxl3pRXPhUo8ooarl4xEiaaiwbn1BUNDn0/b0qn7
 UXaTIPGQi2q6TtjkrmilMA9/NYYkbbdjlHa5bs5m76lSNkGuuVdxfOUQSW4uBZZvulJDvAXX7wR
 ncue2gXXehKfuDOn2HCdg0mOW53jJ2NWK1JQXDQjeYN0SWYDZLCEPb0pbknnD6SakkduxZ1vKBa
 6BePGME4bghHJ4nC/v/8JQenEP8QVX7Q5AVFOg8BsvbF0n/VZLA7yjeTO0/oNu1xSIHRtyn+Zn0
 mfGbFVjRuWH00eFwmcA==
X-Proofpoint-GUID: K8PFw06eps-RkubDiX7Dlgnnq7Zfnyxi
X-Authority-Analysis: v=2.4 cv=S4LUAYsP c=1 sm=1 tr=0 ts=69a7f954 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=aZFUA4iBNJJznah6NdIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: K8PFw06eps-RkubDiX7Dlgnnq7Zfnyxi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_04,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 clxscore=1015 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603040070
X-Rspamd-Queue-Id: 5B4451FD81E
X-Rspamd-Server: lfdr
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-54447-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
index 548e5f1727fd..3ccc8feff678 100644
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
 
+	/* 1.050 is VPP FW overhead */
+	if (inst->fw_caps[STAGE].value == STAGE_2)
+		vpp_cycles += div_u64(vpp_cycles * 50, 1000);
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


