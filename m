Return-Path: <linux-media+bounces-54429-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yHnSHYb0p2mtmwAAu9opvQ
	(envelope-from <linux-media+bounces-54429-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 04 Mar 2026 09:59:50 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CC1D11FD0B6
	for <lists+linux-media@lfdr.de>; Wed, 04 Mar 2026 09:59:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 73B36301FD45
	for <lists+linux-media@lfdr.de>; Wed,  4 Mar 2026 08:59:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C455B3939C6;
	Wed,  4 Mar 2026 08:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BKIk2DBN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Hr6gFnot"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57DAB37C928
	for <linux-media@vger.kernel.org>; Wed,  4 Mar 2026 08:59:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772614776; cv=none; b=OVivwamDwoaxC/CFgTMZUm24+C2J8EsAysOjaNtIrDkqleKrpOMZmKs7gtwsuLGJ062YiL91LDAkNrsLkwVFkXM1kBDSVPTNp9WliVos7K5UJigX4B6GWnsQqmlVGQ89eovDo3M1GNkrwHjTQZq2VlfwqBi8T0bEaHbQlU4wATI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772614776; c=relaxed/simple;
	bh=lH1OnYsirTmJ+XyX8lGZEnl2kKELzBLJtL7w49ticDw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=VPB6JGXdZwTMxz2X6vd7dMMhfZCfSVFpgqpfKYsKhKWGiXKkX9elY+cPQhDTibJCPBZ0ZKjzCIecQLbLk/A8FJYlLOPACoh6PE/DAFYoz/JxUz4LRdEj3Ogy0iu0G5or7Dy4oCnuUY3IAwC2czUN5CRovMrOnbfi2xzmeMWjzps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BKIk2DBN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Hr6gFnot; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6245SP8L1421898
	for <linux-media@vger.kernel.org>; Wed, 4 Mar 2026 08:59:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=zcXFPM6BgYSHhDGwd9oLNF
	jEkAgmbssikX4Xs8zgVkI=; b=BKIk2DBNghAfwNcny7Ub7PPKQJJROQDi+73QnO
	a0UccVhNc4Iw1ZxkgRPrIiZnBsUC+KF5FMzpLLNHhslvmUEt9ulYfd+pp9pPPm0m
	jkrRCnKcKr0tfdCSSkxs9Ssiaq6KGbmdygAMJZ0Tudx0VKWHWebeysy1IA8bOA4/
	g4Wvi+2cskgCkhSGeuBn14o6vl5e9vZkTpeocuwk03kMIbxY7OKgSZJfbB74GGYS
	eMHWTm9q2UA2Vxj22c73xZtCTEZ6aJuOnZa+m/l3a58Sxev05Ehemsdqz1LZSrk1
	8PmW4vvMYI2g0/Fe2P4U0ydtLrI2ex9ObLb8XwCcn2mjkPGA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cpe8u0rdm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 04 Mar 2026 08:59:33 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c70f19f0f37so3734262a12.0
        for <linux-media@vger.kernel.org>; Wed, 04 Mar 2026 00:59:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772614772; x=1773219572; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zcXFPM6BgYSHhDGwd9oLNFjEkAgmbssikX4Xs8zgVkI=;
        b=Hr6gFnotXsp0U9RtxmRryOF874A7SeZ6eA8QRJewGc7AA9OEyTWczvWeke3hjUqnFv
         LvPop+7KV2V/hWGrbwPhQ/lKVjDRUyRyq9m6m09b3vGjI5YLfPClMLb12mDx+D11IYgY
         Lk9d7haiIJenDwNgFKU25POHUVBxvXn3NOAbBQtMEnt4aT2/JPtNXrlNcHAUrfHZOWEb
         /tdVLs4d3F+NAJqPg+aXP+S9CM06Y3Feqan12/V/0yiN/yUE6HlQdL8R0TQKvBhF03Dk
         nyhngwCyatnXGP2JEAKRyaoqrKcs3/q1/6n3+G11KQootMdHQ4kmzc6lq2P5QuTIv5ww
         X/Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772614772; x=1773219572;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zcXFPM6BgYSHhDGwd9oLNFjEkAgmbssikX4Xs8zgVkI=;
        b=BZh8/YNi4skpzjAYLzXWaPULRdDG6agl3tKDwviw5UFo4Q2TmqhH7Uyk7bm/eM0ZAN
         FQsKup5QUYFvhI7Bqj+feZZdOZhe7RFDSjD61Va8rvl9vIEWqOejXoo6jnXzXLUnb60y
         97qz4z/ZX5zZIr0wMNWRPVGr/p+mwpl8UuJUfOFzf8vVo6GZHDlzoeMIL8ru/Z14G71p
         Lot1SxcwkGgYtuiVQtHKNcX/K8nx1VB4Wp07G3hdPJsz9zWiKH7kjMjr2yMZnDh+IxNP
         sEHDHeQPrNWvx7niRVr679holDVT8e1agUojlocVxYct7m4mV0bXyAxY0/imXRORbSrN
         B24Q==
X-Gm-Message-State: AOJu0YzlUiNRfU1sDQChsdY20UnY+rCwTIlYbfUl9megM9KAc9+j3o5r
	b78RI07w51K9+ggKs+rwgKZV0mhIxUOKFgaaykqkaepAJ7v3pyXKVsVm2qJ9H4Ft4ucAOg6EyMK
	vIAMDMKMPrFfA0xGeJtK0pas1aqcyrmgQ7AHFwFLNAsupDA/T/8zdx7UrV4z254WsmPLgBcY/Ug
	==
X-Gm-Gg: ATEYQzxku6BQE6EZysezi8ea+Utpp+jHrmVOzooO+taLf0QYVnvhEh0lh6FvoW9u/NM
	+9w0+8jU7knx+PiHaPMpdw9U5JDIarWo/qIlMCtx4g/uJYpjUh+mw1Uqj1MdKOiS+KXXCFZg0Yi
	tdo4yQfv4xyNaXsUwyYIju985HFb9/s/evju5Bd2Ala7dxtamVFNsQzbSTzzCDa1/kE8qwyu3JC
	al0OZVQGekzPBSJgLl3b+8Hdffnkr0QZl4eZcP98BTyyDFWLU+ODUZpC65yrFAeqigJyn2vBMGW
	/IiE0N30/DNopLLkHc3o8O5Tq+VbdCB7zZuq0N79F8WdrmIX8JKzJON5gRuGZ/3SKUjprO49CJ2
	JIJoFe+HVVVTpv6edGygpf/JC5425uUCtBxHp4f2nzzggzOLzkU+yPsE=
X-Received: by 2002:a05:6a00:4c14:b0:824:ad25:6477 with SMTP id d2e1a72fcca58-8295da1485fmr3939473b3a.30.1772614771946;
        Wed, 04 Mar 2026 00:59:31 -0800 (PST)
X-Received: by 2002:a05:6a00:4c14:b0:824:ad25:6477 with SMTP id d2e1a72fcca58-8295da1485fmr3939449b3a.30.1772614771437;
        Wed, 04 Mar 2026 00:59:31 -0800 (PST)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82739d94de6sm18266216b3a.24.2026.03.04.00.59.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 00:59:31 -0800 (PST)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Wed, 04 Mar 2026 14:28:45 +0530
Subject: [PATCH v2] media: iris: fix use-after-free of fmt_src during MBPF
 check
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260304-fix-use-after-free-of-fmt_src-during-mbpf-v2-1-b4c78d1bf764@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAET0p2kC/5WP0W7CMAxFf6XKM0ZpSprC0/5jQpOT2BBpbSBJq
 yHUf18o+4G9WLqWfO7xU2RKgbI4NU+RaAk5xKkGtWuEu+J0IQi+ZqGk6qVSPXD4gTkTIBdKwIk
 IIgOP5SsnB35OYbrAaG8MaJ0yrE13kFJU3i1RPd66Ps/vnOg+18ryXgqLFeziOIZyanpPquOhR
 U1ysDSwZU2DN3Rkss4o1FZzLRAv1jXkEtNje2NpN9ifsfmH8dJCC500ziMzo8KPmPP+PuP3S2p
 fhziv6/oLvwA+RzUBAAA=
X-Change-ID: 20260226-fix-use-after-free-of-fmt_src-during-mbpf-abc27f573400
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>, stable@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772614767; l=5492;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=lH1OnYsirTmJ+XyX8lGZEnl2kKELzBLJtL7w49ticDw=;
 b=3NKFOkaviYTXkHhvFsdDKvCWFWi1okLpkshPS8aOHTijnEaJkouiIeMGpUhMsfm8pA3fZsX9v
 J/E4wqbnyWPCQS8Wv3MwwSBQ3uUUicqHThpw9GT0YXiPyndTqOY37lY
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-ORIG-GUID: HuB5XCKmAnSlYIt_7HLgrxCwGlMzDR5F
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDA2NyBTYWx0ZWRfX4x80mOIhzv9I
 Tn/I+cv8wNE90xJelQ0x6Nd6AxmmQZH8HdK79R6BSUcK8eJrZEJBXc29B/EiuNpoqu2XkiRUP6m
 EdEtJHxuFjHz2z4F5xof0O4OtF9GE/jcVdfELB8wNOA8LdBtpXYifPLxQF49ZcEfr9v1qJIj9wD
 /bDqKQ1K71EbdyLE5x+MfHxl9PH/m04p6+MQvp1L/kb63jmZlbAPFhz6Dceh0nD8rTko5HA2Kqi
 dz1B0fKjdzFTLPHZViAL3i4M5PnToHJsCs2YwQB0wFTuCjylRxpx3sAKDgOvhfGIVd6ulOIZMFU
 l8f9SML1O7qW4f9IzUhRhprMw9WR6s0agk4aZc0mY56KP0bDifjNOf79i2L5glY27AexKvh1lV1
 PKwoVDRaWhuh5XMg7xk/QliIaDh2OSvGKtUHYJSPFvWdvG2konom6TtSPm/1O6Tj9/9r0XxvEBV
 Zj/tO0DYXgnrCWik2PQ==
X-Authority-Analysis: v=2.4 cv=FpAIPmrq c=1 sm=1 tr=0 ts=69a7f475 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=vOiXTFtDm48uhe5vJ3sA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: HuB5XCKmAnSlYIt_7HLgrxCwGlMzDR5F
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_04,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0
 adultscore=0 phishscore=0 malwarescore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603040067
X-Rspamd-Queue-Id: CC1D11FD0B6
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-54429-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[busanna.reddy@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

During concurrency testing, multiple instances can run in parallel, and
each instance uses its own inst->lock while the global core->lock
protects the list of active instances. The race happens because these
locks cover different scopes, inst->lock protects only the internals of
a single instance, while the MBPF checker walks the core list under
core->lock and reads fields like fmt_src->width and fmt_src->height.
At the same time, iris_close() may free fmt_src and fmt_dst under
inst->lock while the instance is still present in the core list. This
allows a situation where the MBPF checker, still iterating through the
core list, reaches an instance whose fmt_src was already freed by another
thread and ends up dereferencing a dangling pointer, resulting in a
use-after-free. This happens because the MBPF checker assumes that any
instance in the core list is fully valid, but the freeing of fmt_src and
fmt_dst without removing the instance from the core list is not correct.

The correct ordering is to defer freeing fmt_src and fmt_dst until after
the instance has been removed from the core list and all teardown under
the core lock has completed, ensuring that no dangling pointers are ever
exposed during MBPF checks.

Fixes: 5ad964ad5656 ("media: iris: Initialize and deinitialize encoder instance structure")
Cc: stable@vger.kernel.org
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
Changes in v2:
- Updated the commit description
- Added Fixes tag and Cc stable
- Link to v1: https://lore.kernel.org/r/20260227-fix-use-after-free-of-fmt_src-during-mbpf-v1-1-307cdafffa2a@oss.qualcomm.com
---
 drivers/media/platform/qcom/iris/iris_vdec.c | 6 ------
 drivers/media/platform/qcom/iris/iris_vdec.h | 1 -
 drivers/media/platform/qcom/iris/iris_venc.c | 6 ------
 drivers/media/platform/qcom/iris/iris_venc.h | 1 -
 drivers/media/platform/qcom/iris/iris_vidc.c | 6 ++----
 5 files changed, 2 insertions(+), 18 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c b/drivers/media/platform/qcom/iris/iris_vdec.c
index 719217399a30..99d544e2af4f 100644
--- a/drivers/media/platform/qcom/iris/iris_vdec.c
+++ b/drivers/media/platform/qcom/iris/iris_vdec.c
@@ -61,12 +61,6 @@ int iris_vdec_inst_init(struct iris_inst *inst)
 	return iris_ctrls_init(inst);
 }
 
-void iris_vdec_inst_deinit(struct iris_inst *inst)
-{
-	kfree(inst->fmt_dst);
-	kfree(inst->fmt_src);
-}
-
 static const struct iris_fmt iris_vdec_formats_cap[] = {
 	[IRIS_FMT_NV12] = {
 		.pixfmt = V4L2_PIX_FMT_NV12,
diff --git a/drivers/media/platform/qcom/iris/iris_vdec.h b/drivers/media/platform/qcom/iris/iris_vdec.h
index ec1ce55d1375..5123d2a340e1 100644
--- a/drivers/media/platform/qcom/iris/iris_vdec.h
+++ b/drivers/media/platform/qcom/iris/iris_vdec.h
@@ -9,7 +9,6 @@
 struct iris_inst;
 
 int iris_vdec_inst_init(struct iris_inst *inst);
-void iris_vdec_inst_deinit(struct iris_inst *inst);
 int iris_vdec_enum_fmt(struct iris_inst *inst, struct v4l2_fmtdesc *f);
 int iris_vdec_try_fmt(struct iris_inst *inst, struct v4l2_format *f);
 int iris_vdec_s_fmt(struct iris_inst *inst, struct v4l2_format *f);
diff --git a/drivers/media/platform/qcom/iris/iris_venc.c b/drivers/media/platform/qcom/iris/iris_venc.c
index aa27b22704eb..4d886769d958 100644
--- a/drivers/media/platform/qcom/iris/iris_venc.c
+++ b/drivers/media/platform/qcom/iris/iris_venc.c
@@ -79,12 +79,6 @@ int iris_venc_inst_init(struct iris_inst *inst)
 	return iris_ctrls_init(inst);
 }
 
-void iris_venc_inst_deinit(struct iris_inst *inst)
-{
-	kfree(inst->fmt_dst);
-	kfree(inst->fmt_src);
-}
-
 static const struct iris_fmt iris_venc_formats_cap[] = {
 	[IRIS_FMT_H264] = {
 		.pixfmt = V4L2_PIX_FMT_H264,
diff --git a/drivers/media/platform/qcom/iris/iris_venc.h b/drivers/media/platform/qcom/iris/iris_venc.h
index c4db7433da53..00c1716b2747 100644
--- a/drivers/media/platform/qcom/iris/iris_venc.h
+++ b/drivers/media/platform/qcom/iris/iris_venc.h
@@ -9,7 +9,6 @@
 struct iris_inst;
 
 int iris_venc_inst_init(struct iris_inst *inst);
-void iris_venc_inst_deinit(struct iris_inst *inst);
 int iris_venc_enum_fmt(struct iris_inst *inst, struct v4l2_fmtdesc *f);
 int iris_venc_try_fmt(struct iris_inst *inst, struct v4l2_format *f);
 int iris_venc_s_fmt(struct iris_inst *inst, struct v4l2_format *f);
diff --git a/drivers/media/platform/qcom/iris/iris_vidc.c b/drivers/media/platform/qcom/iris/iris_vidc.c
index bd38d84c9cc7..5eb1786b0737 100644
--- a/drivers/media/platform/qcom/iris/iris_vidc.c
+++ b/drivers/media/platform/qcom/iris/iris_vidc.c
@@ -289,10 +289,6 @@ int iris_close(struct file *filp)
 	v4l2_m2m_ctx_release(inst->m2m_ctx);
 	v4l2_m2m_release(inst->m2m_dev);
 	mutex_lock(&inst->lock);
-	if (inst->domain == DECODER)
-		iris_vdec_inst_deinit(inst);
-	else if (inst->domain == ENCODER)
-		iris_venc_inst_deinit(inst);
 	iris_session_close(inst);
 	iris_inst_change_state(inst, IRIS_INST_DEINIT);
 	iris_v4l2_fh_deinit(inst, filp);
@@ -304,6 +300,8 @@ int iris_close(struct file *filp)
 	mutex_unlock(&inst->lock);
 	mutex_destroy(&inst->ctx_q_lock);
 	mutex_destroy(&inst->lock);
+	kfree(inst->fmt_src);
+	kfree(inst->fmt_dst);
 	kfree(inst);
 
 	return 0;

---
base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
change-id: 20260226-fix-use-after-free-of-fmt_src-during-mbpf-abc27f573400

Best regards,
-- 
Vishnu Reddy <busanna.reddy@oss.qualcomm.com>


