Return-Path: <linux-media+bounces-63158-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iFqtOInNG2prGQkAu9opvQ
	(envelope-from <linux-media+bounces-63158-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 31 May 2026 07:56:25 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8264D6149D1
	for <lists+linux-media@lfdr.de>; Sun, 31 May 2026 07:56:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3A099303B4E2
	for <lists+linux-media@lfdr.de>; Sun, 31 May 2026 05:55:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2E2132470A;
	Sun, 31 May 2026 05:55:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eLuF/427";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Omz2gJHL"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED4EC3264EA
	for <linux-media@vger.kernel.org>; Sun, 31 May 2026 05:55:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780206934; cv=none; b=m7w1MuF9z/5qe7JjlX0IliAQ/ACdbpkNdOtViud95xf5BXokHC/GhH/FKyWCYDkdF0WpqMe3chUbuorQkYNs/Ly6oZnt6uqvcdY3ScrELq67eVnmE7bExlfZzJH47dTzvpq4DpvDSZCoJzxQgvocASfgX1UnNkTtAo+9NRfEIV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780206934; c=relaxed/simple;
	bh=2wDUGwNJnnoaQiVEwY7nGl7/imywJz1LeFcyb3cZxEc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nJ0Rfx9Byqh9J6g6F4SL+c/lfYuJ1Q5+BqepMYWV7nuodAVlCPZmHJPW7IS+bvjLHgqGLiCRjN8VaRkeGKkkyDIHb60Iuw234MD6XtS+2G2c0ExH+VwJRBUcqPYBwbqXu0S62LiM9zw2klI6+3orckMUr2SpUBazvAXteFitVvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eLuF/427; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Omz2gJHL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64UNRlak1306106
	for <linux-media@vger.kernel.org>; Sun, 31 May 2026 05:55:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BXM56e/y7AP/IChoOzUGo6IPhuY5BvOU0TGBXjBtMEM=; b=eLuF/427Mw84TC4r
	Z9WzOCmiWQZVcSDN1H98pOsKVWoaX7DZPz9kfC7x4NlGqhzodNklTolZzWHVhldz
	RBLnD57v7cIw9TnXGUwNHPjBM/JRqSvZOJ0Iui8DLjOY2VJ2Fwk6NZF391cLE4/0
	2nUAlFTre/Q7u3XLNiIPlsxb1CxWZTOy2ca+FhbM0iyN8aaZGu5tJIZbF5a02sIt
	JnlWtY1KHRUBBB0IxAL2BrZzK+fZLiVBHzlSJK5Aha7Sc0rCBsnZbA8kgT+LM25s
	oB+4oHjMYinkdDs3WeiYWwMwDzeTaa0/4/DEastswHH1l0+j2xMyzY+Y4+LtFz7x
	BCHyXA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4efrncau2c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sun, 31 May 2026 05:55:32 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2c0bf6904a6so6723355ad.1
        for <linux-media@vger.kernel.org>; Sat, 30 May 2026 22:55:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780206931; x=1780811731; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BXM56e/y7AP/IChoOzUGo6IPhuY5BvOU0TGBXjBtMEM=;
        b=Omz2gJHLMV7OQm8OlvWjbmN2Te1VkH1opAPfMTX4pNqCtXNc155vvLsnBsGL3+0NfZ
         xtg1THGtDR1HD2bGRq6PvM3uYGwnahxGMudeB7CscCZC2AdfM1RmBgCcxuCEaYzgMBlT
         E6MgEQmJglsFg9obF/MhsYy8w4RqwBcCSCle9bx+tZtkj7MQbrUtIPfDmWt6NbP+6ve7
         6fcE71ZZeGncHpQAaKDOUMIOEdb1sC74QoXe9DBCwBMWucTDEtlisje6z5U6Ic7Z1Afm
         NzvjpMxa44X6JkJVNUO5w6r5Q1hfvxx+x9YXlueAyKzVYlflwoyjrgk2+ekKWgmsOvEK
         BBpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780206931; x=1780811731;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BXM56e/y7AP/IChoOzUGo6IPhuY5BvOU0TGBXjBtMEM=;
        b=Lk/wWp+h4IXrByhD33R2x4ipsMuaXdYtBjLluGQqjpjL9Y2GID6tJynHlx+4LGQXwW
         6Nx8/2VJDXEHJ317GWnjUFs8vTMVhw2bmqjbHS728PnL7evm9Egd6dqF3NE91GbF8vQ5
         0hE4hTPMWZdo9x3wVu9tH3O/V1e0X8uFLQFnjDSOLN2dwaQ7TUFYV5g5lTzslJAI+GDv
         gwDPHSczQgzIDT0XBiADO58x2mBQ6c6+mJjTnI6axKpn7M9WIK8Yz6pJu3L/OfQIcVYV
         m3rnEEi2e2uEAEMUJbsOWIKGJ3k2ABrcpqKEQ77M93iqNHWQ2ZQJtMvcAkJKoxBaR0Qm
         9PFw==
X-Gm-Message-State: AOJu0YyO2qu5EkWCqsiRe6rVXAlbWS9oMQJdp4vm1VMj0lpKzSEWBz3V
	v3yEfQwAbGMSjzG79Lkau5SlEdEM8qFhCeCAzM31Mb/9ztQxlXyYNSpLOZ+veVlEWsTntGKjLWl
	aDmriwcClzI7sHUTo5ICR5ppZdj/P/w2gp0I2lDza0C4v7lf98+lYQSAiwg0lE4cTxg==
X-Gm-Gg: Acq92OGznki1IFblhnsp8bo+8hoDSMDcwe0thKffbN4oqaO4pI+ca1thq/z6w+tnSyT
	+A1JISFAj618orNIw0pos8pOIisOZvDFyWEbA1Cnv6rtzMC05A9pK9HL4m0MWO5dzVb098alqq5
	09sg1F7i5C7A0GoUPy0WiGa/G5fmFD2Vgf5HzQWJGupV98qHDPPwwKC+l8ooWBsJLGIzQohOCpS
	NaT7pXDfrnvysRE8rfcKhNEBEgWzrhYTBdAIX8ZRgBYRU18bddm7AI10jlzZAQj50JeLHeBiDcf
	n9eJb/f/JnUGlJTANY0Gc39NHQdf0T2fg9+ycUTRR2p+Ki2WL5GNreklUO59qdM/9SbVB/K3I+C
	k/NlHsuW98TuQsMaJCTR1WonVRbvYZtO9OoHrQeKLMxGtvgQta+yzDh/qjyzPf2u/IA==
X-Received: by 2002:a17:903:1905:b0:2ba:924b:3948 with SMTP id d9443c01a7336-2bf367e4391mr77834385ad.15.1780206931511;
        Sat, 30 May 2026 22:55:31 -0700 (PDT)
X-Received: by 2002:a17:903:1905:b0:2ba:924b:3948 with SMTP id d9443c01a7336-2bf367e4391mr77834065ad.15.1780206931035;
        Sat, 30 May 2026 22:55:31 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf239e702fsm67124375ad.4.2026.05.30.22.55.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 May 2026 22:55:30 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Sun, 31 May 2026 11:20:35 +0530
Subject: [PATCH v3 1/7] media: qcom: iris: Centralize internal buffer table
 selection
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260531-iris-code-improvement-v3-1-4c699c3dd719@oss.qualcomm.com>
References: <20260531-iris-code-improvement-v3-0-4c699c3dd719@oss.qualcomm.com>
In-Reply-To: <20260531-iris-code-improvement-v3-0-4c699c3dd719@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780206921; l=8143;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=BZOdvz5iarQDnl8uGdnmlUoVqz3/4hTjx21nuSXgFvI=;
 b=03jCnFQheIXzUvky9qOzq4x7dQ6FDyu4wTNiebYH+IT83uTXII/QHXGW3d850PoMWl+Vl2dv4
 g/sZ2OfV9pUCvX81x/TV69lArDXznK7qjtYbno6SRKncTfZlw3/Dj0L
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-GUID: iolaBGBpSw3PZZvoozrpA9gHzZ6fDxGx
X-Proofpoint-ORIG-GUID: iolaBGBpSw3PZZvoozrpA9gHzZ6fDxGx
X-Authority-Analysis: v=2.4 cv=FcIHAp+6 c=1 sm=1 tr=0 ts=6a1bcd54 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=22hBRqbxvLe5Obw_dBcA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTMxMDA2MiBTYWx0ZWRfX3nCV6I+dxuN3
 wqHe/gEAs2MXOy1Egny+apmgjMsTdxGQESg0VbS14/cp4Jo78VQlJ8gHL6WNcX/imIKrVls5dgt
 d/nd+IGNrto23dQmrAA3OiF0qMheCth38ocNHIJZKrBKZHgb7d9oyE+QRUjol5YFpBgMKHu6bAx
 PHxiOLNSFj9Kx/7UchogmLQlowjXyaIiNzda73rPls3hw5PpZN74rqAL55rtpfyOPVsIDx9q7H7
 j4YS7aq8uU1A8KFKlWaAaZ2nEqy5ZrDkMdktvySl4r3mrnS8lCuJEgrWU8N/YsId/G84c7kSOOH
 yME2s6R/mqTbCNtZK1NjpVwGFtPu1rm5XQftaQvhyKG9BFD83dCm9fc1X1McNeXWbedx5PHmvob
 A9UNjtTXQm+x5zH5Vn6zhTEpjou5vTfPbCKBp1r8KRE7yzGFLrvEJPa7p2z5syCqcySkNPjpsxE
 IrMMFObBk9yjfrUExBA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-31_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 clxscore=1015 impostorscore=0 adultscore=0
 spamscore=0 bulkscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605310062
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-63158-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[busanna.reddy@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8264D6149D1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

Internal buffer table dispatch is duplicated across multiple Iris code
paths, which is error‑prone and makes future changes harder to reason
about.

Consolidate the buffer dispatch logic into a single helper so that table
selection is defined in exactly one place and keep call sites minimal.
No functional change intended.

Reviewed-by: Bryan O'Donoghue <bod@kernel.org>
Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_buffer.c | 107 ++++++-------------------
 1 file changed, 26 insertions(+), 81 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_buffer.c b/drivers/media/platform/qcom/iris/iris_buffer.c
index ef7f6f931557..73b4d3381e47 100644
--- a/drivers/media/platform/qcom/iris/iris_buffer.c
+++ b/drivers/media/platform/qcom/iris/iris_buffer.c
@@ -299,39 +299,41 @@ static void iris_fill_internal_buf_info(struct iris_inst *inst,
 	buffers->min_count = iris_vpu_buf_count(inst, buffer_type);
 }
 
-void iris_get_internal_buffers(struct iris_inst *inst, u32 plane)
+static void iris_get_int_buf_tbl(struct iris_inst *inst, u32 plane,
+				 const u32 **internal_buf_type, u32 *internal_buffer_count)
 {
 	const struct iris_firmware_data *firmware_data = inst->core->iris_firmware_data;
-	const u32 *internal_buf_type;
-	u32 internal_buffer_count, i;
 
 	if (inst->domain == DECODER) {
 		if (V4L2_TYPE_IS_OUTPUT(plane)) {
-			internal_buf_type = firmware_data->dec_ip_int_buf_tbl;
-			internal_buffer_count = firmware_data->dec_ip_int_buf_tbl_size;
-			for (i = 0; i < internal_buffer_count; i++)
-				iris_fill_internal_buf_info(inst, internal_buf_type[i]);
+			*internal_buf_type = firmware_data->dec_ip_int_buf_tbl;
+			*internal_buffer_count = firmware_data->dec_ip_int_buf_tbl_size;
 		} else {
-			internal_buf_type = firmware_data->dec_op_int_buf_tbl;
-			internal_buffer_count = firmware_data->dec_op_int_buf_tbl_size;
-			for (i = 0; i < internal_buffer_count; i++)
-				iris_fill_internal_buf_info(inst, internal_buf_type[i]);
+			*internal_buf_type = firmware_data->dec_op_int_buf_tbl;
+			*internal_buffer_count = firmware_data->dec_op_int_buf_tbl_size;
 		}
 	} else {
 		if (V4L2_TYPE_IS_OUTPUT(plane)) {
-			internal_buf_type = firmware_data->enc_ip_int_buf_tbl;
-			internal_buffer_count = firmware_data->enc_ip_int_buf_tbl_size;
-			for (i = 0; i < internal_buffer_count; i++)
-				iris_fill_internal_buf_info(inst, internal_buf_type[i]);
+			*internal_buf_type = firmware_data->enc_ip_int_buf_tbl;
+			*internal_buffer_count = firmware_data->enc_ip_int_buf_tbl_size;
 		} else {
-			internal_buf_type = firmware_data->enc_op_int_buf_tbl;
-			internal_buffer_count = firmware_data->enc_op_int_buf_tbl_size;
-			for (i = 0; i < internal_buffer_count; i++)
-				iris_fill_internal_buf_info(inst, internal_buf_type[i]);
+			*internal_buf_type = firmware_data->enc_op_int_buf_tbl;
+			*internal_buffer_count = firmware_data->enc_op_int_buf_tbl_size;
 		}
 	}
 }
 
+void iris_get_internal_buffers(struct iris_inst *inst, u32 plane)
+{
+	const u32 *internal_buf_type;
+	u32 internal_buffer_count, i;
+
+	iris_get_int_buf_tbl(inst, plane, &internal_buf_type, &internal_buffer_count);
+
+	for (i = 0; i < internal_buffer_count; i++)
+		iris_fill_internal_buf_info(inst, internal_buf_type[i]);
+}
+
 static int iris_create_internal_buffer(struct iris_inst *inst,
 				       enum iris_buffer_type buffer_type, u32 index)
 {
@@ -366,29 +368,12 @@ static int iris_create_internal_buffer(struct iris_inst *inst,
 
 int iris_create_internal_buffers(struct iris_inst *inst, u32 plane)
 {
-	const struct iris_firmware_data *firmware_data = inst->core->iris_firmware_data;
 	u32 internal_buffer_count, i, j;
 	struct iris_buffers *buffers;
 	const u32 *internal_buf_type;
 	int ret;
 
-	if (inst->domain == DECODER) {
-		if (V4L2_TYPE_IS_OUTPUT(plane)) {
-			internal_buf_type = firmware_data->dec_ip_int_buf_tbl;
-			internal_buffer_count = firmware_data->dec_ip_int_buf_tbl_size;
-		} else {
-			internal_buf_type = firmware_data->dec_op_int_buf_tbl;
-			internal_buffer_count = firmware_data->dec_op_int_buf_tbl_size;
-		}
-	} else {
-		if (V4L2_TYPE_IS_OUTPUT(plane)) {
-			internal_buf_type = firmware_data->enc_ip_int_buf_tbl;
-			internal_buffer_count = firmware_data->enc_ip_int_buf_tbl_size;
-		} else {
-			internal_buf_type = firmware_data->enc_op_int_buf_tbl;
-			internal_buffer_count = firmware_data->enc_op_int_buf_tbl_size;
-		}
-	}
+	iris_get_int_buf_tbl(inst, plane, &internal_buf_type, &internal_buffer_count);
 
 	for (i = 0; i < internal_buffer_count; i++) {
 		buffers = &inst->buffers[internal_buf_type[i]];
@@ -442,30 +427,13 @@ int iris_queue_internal_deferred_buffers(struct iris_inst *inst, enum iris_buffe
 
 int iris_queue_internal_buffers(struct iris_inst *inst, u32 plane)
 {
-	const struct iris_firmware_data *firmware_data = inst->core->iris_firmware_data;
 	struct iris_buffer *buffer, *next;
 	struct iris_buffers *buffers;
 	const u32 *internal_buf_type;
 	u32 internal_buffer_count, i;
 	int ret;
 
-	if (inst->domain == DECODER) {
-		if (V4L2_TYPE_IS_OUTPUT(plane)) {
-			internal_buf_type = firmware_data->dec_ip_int_buf_tbl;
-			internal_buffer_count = firmware_data->dec_ip_int_buf_tbl_size;
-		} else {
-			internal_buf_type = firmware_data->dec_op_int_buf_tbl;
-			internal_buffer_count = firmware_data->dec_op_int_buf_tbl_size;
-		}
-	} else {
-		if (V4L2_TYPE_IS_OUTPUT(plane)) {
-			internal_buf_type = firmware_data->enc_ip_int_buf_tbl;
-			internal_buffer_count = firmware_data->enc_ip_int_buf_tbl_size;
-		} else {
-			internal_buf_type = firmware_data->enc_op_int_buf_tbl;
-			internal_buffer_count = firmware_data->enc_op_int_buf_tbl_size;
-		}
-	}
+	iris_get_int_buf_tbl(inst, plane, &internal_buf_type, &internal_buffer_count);
 
 	for (i = 0; i < internal_buffer_count; i++) {
 		buffers = &inst->buffers[internal_buf_type[i]];
@@ -501,30 +469,13 @@ int iris_destroy_internal_buffer(struct iris_inst *inst, struct iris_buffer *buf
 
 static int iris_destroy_internal_buffers(struct iris_inst *inst, u32 plane, bool force)
 {
-	const struct iris_firmware_data *firmware_data = inst->core->iris_firmware_data;
 	struct iris_buffer *buf, *next;
 	struct iris_buffers *buffers;
 	const u32 *internal_buf_type;
 	u32 i, len;
 	int ret;
 
-	if (inst->domain == DECODER) {
-		if (V4L2_TYPE_IS_OUTPUT(plane)) {
-			internal_buf_type = firmware_data->dec_ip_int_buf_tbl;
-			len = firmware_data->dec_ip_int_buf_tbl_size;
-		} else {
-			internal_buf_type = firmware_data->dec_op_int_buf_tbl;
-			len = firmware_data->dec_op_int_buf_tbl_size;
-		}
-	} else {
-		if (V4L2_TYPE_IS_OUTPUT(plane)) {
-			internal_buf_type = firmware_data->enc_ip_int_buf_tbl;
-			len = firmware_data->enc_ip_int_buf_tbl_size;
-		} else {
-			internal_buf_type = firmware_data->enc_op_int_buf_tbl;
-			len = firmware_data->enc_op_int_buf_tbl_size;
-		}
-	}
+	iris_get_int_buf_tbl(inst, plane, &internal_buf_type, &len);
 
 	for (i = 0; i < len; i++) {
 		buffers = &inst->buffers[internal_buf_type[i]];
@@ -593,18 +544,12 @@ static int iris_release_internal_buffers(struct iris_inst *inst,
 
 static int iris_release_input_internal_buffers(struct iris_inst *inst)
 {
-	const struct iris_firmware_data *firmware_data = inst->core->iris_firmware_data;
 	const u32 *internal_buf_type;
 	u32 internal_buffer_count, i;
 	int ret;
 
-	if (inst->domain == DECODER) {
-		internal_buf_type = firmware_data->dec_ip_int_buf_tbl;
-		internal_buffer_count = firmware_data->dec_ip_int_buf_tbl_size;
-	} else {
-		internal_buf_type = firmware_data->enc_ip_int_buf_tbl;
-		internal_buffer_count = firmware_data->enc_ip_int_buf_tbl_size;
-	}
+	iris_get_int_buf_tbl(inst, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
+			     &internal_buf_type, &internal_buffer_count);
 
 	for (i = 0; i < internal_buffer_count; i++) {
 		ret = iris_release_internal_buffers(inst, internal_buf_type[i]);

-- 
2.34.1


