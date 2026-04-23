Return-Path: <linux-media+bounces-59396-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gP4aICkK6mm1sQIAu9opvQ
	(envelope-from <linux-media+bounces-59396-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 23 Apr 2026 14:01:45 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 06302451A52
	for <lists+linux-media@lfdr.de>; Thu, 23 Apr 2026 14:01:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5D73E305BFD6
	for <lists+linux-media@lfdr.de>; Thu, 23 Apr 2026 12:00:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18CBB3EBF3A;
	Thu, 23 Apr 2026 12:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FHG0VN0Y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SLSAmm+J"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 212193EBF03
	for <linux-media@vger.kernel.org>; Thu, 23 Apr 2026 12:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776945641; cv=none; b=pN2WsrTrgxe67jG6/WB6gNARmPqNBc/bNBC38eDsZHTsXnxP005unrZS6uVnsnubcj7A9NubtNh3z0kY7BwCJw8KGVpo8ZgCIS89VdbALC3jVg8NiTFVlpC1T9laKhT4rQI5troWZ1zPBIhsFB3IzgrRtPu/hbR0fybOr+mBrgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776945641; c=relaxed/simple;
	bh=/4u0s68y0bWzXBNSs/02FvXVElc68mI24erTIfYoe/4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XdbCk0oJ2Q+JiFFbOjXJ40dxOGRtdG8qnYrOqopnKPy9b+/Tylb947+c79+qryoEcDXDfsJXClK8YhIiD/gQ81fm0xpzihiI5RlUWFzwRWjT92Z485AASHy2cfI2p4N7ZlYbA4DP3HW6LO8xYoycM/c21M7aL2I/llgY2ViBFo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FHG0VN0Y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SLSAmm+J; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63N8uPgE1565901
	for <linux-media@vger.kernel.org>; Thu, 23 Apr 2026 12:00:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	o5jbzVWWdj9OVgnOnF4MDpI7MkUgPzEgugSFsM8ZzIc=; b=FHG0VN0YYIyONPdl
	OQgyXaS5n0Jf8nCM4nFsvp3ucGFFMe9HWtEldvb2xOcG5HhviisgNSuWIXIczxw1
	FqbgyB6XYsDiDhwt5KaMjIhFRgYnLbWcY3is1s4Z0ub2CtmS1lHBlrXpBkKW8Tqa
	7dPRck2oFzQ2An0pYEtW3TzPH9400ioT7KRn9S/Pg5+H7mzTvmTpmDDLW/cRQjbI
	3qFeETHYvedCR5bNGD9AAD4BuSpXbzqP4OiAIo3ZSOW3VVATM3SL+aeOTUiQJmzJ
	C9fWKOSEuTRwUYTbXxCE/RjRDFjOIbV786NG65fCmLUDQn6FiKoW5WzP+k2Y9j3a
	qmns/A==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dq16wuwe6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 23 Apr 2026 12:00:38 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b24e9b4d82so68140215ad.1
        for <linux-media@vger.kernel.org>; Thu, 23 Apr 2026 05:00:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776945638; x=1777550438; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o5jbzVWWdj9OVgnOnF4MDpI7MkUgPzEgugSFsM8ZzIc=;
        b=SLSAmm+J+6/r2cJvtoXhr/VGy5wlF7Mn7UdR6AMzMTmu7Gbc1QbDpHas9nFWI753eI
         JtJQTcN60cBHQhLPQFpmKF/IQPEOKXdk2OW6MSK5xkKTlv+y3yMfMuhFL2BIZe+mfLlc
         W/IBvvI73ihgNOCN2OUKg5iCEMtqi9OggPS5hJRG8/0AjXjPAnKbfFWNgpGmEqvfXLQz
         b5do1Rkvy2kGUGfDIjWoiXnxE0gy1ioxdCk8c5K6HyvBqZIM/a8FmNjrKcg+WgDA127Y
         xTS3j3X9a7YWabeVxZ867gn/HyDUp77I685chthqHtXPYNBYG9JTJpV46dsjRqWDw9NL
         IDPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776945638; x=1777550438;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=o5jbzVWWdj9OVgnOnF4MDpI7MkUgPzEgugSFsM8ZzIc=;
        b=oTp3KwyUfISoC7Lhxt77YYLpeVUvohSMRgzN8IfTASSDdAGQTiVY3gqOp9f5gkyzPV
         nftQrKR1YMF6XqUqjPH3zE7/URgAnMKxIKxoLyWvLgdFkpd7Ww+d+Eb/GSa+QwFqBvUv
         3y3dM1FONYnKaclTSmXlW+7vB1HniFtM6pjeZhbHF7zSGFwlCWhRDs4we3bwWGhE8sZr
         UvQV9s38mOCNSXDO0jtPXtEM0M1eAF9jl9u1nZX/I2PNkix6QAJQLtG/6YXzdpu4JVzt
         r4sY5fK8K4I/s44LVM1vuz/09jJQ34q4xJjKqwZtuNPMl/icmEy/+/YcC9Ff+++E+jyg
         4z4g==
X-Gm-Message-State: AOJu0YyMbztt0/25CTOi+4yO5ulNERx8UpfzAe/TXBh6KCl4YRIaYq3x
	6DS1scdoNWK/KJ4VG2v7CgfzP2wyjbV4iiFIIsJIu9OTegVly/XwWJtA3ks7D/Ez2eX/C/VXd8y
	PxdvE8a6TbmNyKLz5tt2r7WFyfBnhvexg34OF3Fz5N0043zBwsa7I2RDw00pMxKTCbg==
X-Gm-Gg: AeBDietHbyjCMcicgwYLLT6msMJkW9EttM5Oq147B3pMUkVPOkGlIYjegWnJvNMN/QO
	gdFY/q22NnbClt1B6vBSOkfF5fD5B8zH3i36Un3SjLjrWQI+tSn7HGvD1vPTZZ9NxJ44XGY8TVc
	w5gbPP+YbkcoQECQ4De3p4MVM6YPDA140iPeitcXXAAyvQweOs45kGynAExBVkmmqIXQU+dfFKr
	7lz1hoYkFl3ZdtwjC3y27IQtNAQLuOZ8zYCmCExaZOayNiSOI+kvMemSvC1sxPHMYbRyo8CTdVe
	EiNHbu4xjF+olcadqDiYECMpLks3yOivOW62A922wOIXXRUoWzlzGE8X68viNApwyV+SbUkNj0V
	XRB9FGvicksNUZWONKgJhMKy9YFWZajcMYLBEMA1R0zmL61p/3a6NzZ6PZ7RFs6GLPqVA6Q==
X-Received: by 2002:a17:903:3910:b0:2b7:88f9:9c28 with SMTP id d9443c01a7336-2b788f9a0c6mr98976735ad.5.1776945637714;
        Thu, 23 Apr 2026 05:00:37 -0700 (PDT)
X-Received: by 2002:a17:903:3910:b0:2b7:88f9:9c28 with SMTP id d9443c01a7336-2b788f9a0c6mr98976455ad.5.1776945637034;
        Thu, 23 Apr 2026 05:00:37 -0700 (PDT)
Received: from hu-dikshita-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5faa4f092sm194790355ad.36.2026.04.23.05.00.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 05:00:36 -0700 (PDT)
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Date: Thu, 23 Apr 2026 17:30:05 +0530
Subject: [PATCH v2 1/7] media: qcom: iris: Centralize internal buffer table
 selection
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260423-iris-code-improvement-v2-1-9e9cbf00f9c9@oss.qualcomm.com>
References: <20260423-iris-code-improvement-v2-0-9e9cbf00f9c9@oss.qualcomm.com>
In-Reply-To: <20260423-iris-code-improvement-v2-0-9e9cbf00f9c9@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
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
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776945627; l=8089;
 i=dikshita.agarwal@oss.qualcomm.com; s=20240917; h=from:subject:message-id;
 bh=/4u0s68y0bWzXBNSs/02FvXVElc68mI24erTIfYoe/4=;
 b=uVLutiKCBlDPAHjHyZPNgKYlQUw3O79i35dizeLGIlZU5EuGoFp85LH87npx6bP+mK9iV7SPE
 fklTvPnX1VPB7+cH+K+pCWvbXg/WR25pu+z0Inb6M5DzMZMJ3fFZDnb
X-Developer-Key: i=dikshita.agarwal@oss.qualcomm.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIzMDExOSBTYWx0ZWRfX4kspdwCWkLjl
 jkwAJ2PxOqbYKtYYGy1nvthOz9aOLHAO7UjAsjstxfgUXVttjzblB6kJ5Bzilmao2KvXTltHNKh
 r9UgehXdPBeJh/8j8yrOjFnuCgNLUwu+k8W2MFPnnVfOotjKrmSxXS4BzDLIL40E3nnOvCfb+lB
 pcjK6elokQ0BE4XUIthVW4AkbPxThETcreEOkqH+4CXsUvJ1gg81VK+8HQZhFHrS5zk1cawU/yD
 ISDhi/RoE86gU9i6bnDOi0S6V/o0W+5JRPtCNFU1gMR8gRiXIlqD3t0X2HghythjsMlxvtIzF3u
 jCcAOcQFhi0NGAYpaV6TB4e9kCEB/5NCW5Qpe0kzqyJRoJkyqLADlS2QpnOSEEw7+HcoSn1dObg
 zsp5Q5R961qIiHGU5ZiI6hvP4NCqPHgI4lyzJrJD5BjBybkdeOY5fpxD+s7AtbkYzqHV+tH5AMN
 M9Q0U+Moc+n540Qdn3Q==
X-Authority-Analysis: v=2.4 cv=dL+WXuZb c=1 sm=1 tr=0 ts=69ea09e7 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=YO4-hHwgDu7wuGDVLqgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: SahFZnlpOX_Yal4KeaihkYhAF9GtcOOK
X-Proofpoint-ORIG-GUID: SahFZnlpOX_Yal4KeaihkYhAF9GtcOOK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 adultscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604230119
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-59396-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dikshita.agarwal@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MAILSPIKE_FAIL(0.00)[172.105.105.114:query timed out];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 06302451A52
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Internal buffer table dispatch is duplicated across multiple Iris code
paths, which is error‑prone and makes future changes harder to reason
about.

Consolidate the buffer dispatch logic into a single helper so that table
selection is defined in exactly one place and keep call sites minimal.
No functional change intended.

Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_buffer.c | 107 ++++++-------------------
 1 file changed, 26 insertions(+), 81 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_buffer.c b/drivers/media/platform/qcom/iris/iris_buffer.c
index 9151f43bc6b9c2c34c803de4231d1e6de0bec6c4..5b31c511da6e735943e2561683016cb9414d760c 100644
--- a/drivers/media/platform/qcom/iris/iris_buffer.c
+++ b/drivers/media/platform/qcom/iris/iris_buffer.c
@@ -299,39 +299,41 @@ static void iris_fill_internal_buf_info(struct iris_inst *inst,
 	buffers->min_count = iris_vpu_buf_count(inst, buffer_type);
 }
 
-void iris_get_internal_buffers(struct iris_inst *inst, u32 plane)
+static void iris_get_int_buf_tbl(struct iris_inst *inst, u32 plane,
+				 const u32 **internal_buf_type, u32 *internal_buffer_count)
 {
 	const struct iris_platform_data *platform_data = inst->core->iris_platform_data;
-	const u32 *internal_buf_type;
-	u32 internal_buffer_count, i;
 
 	if (inst->domain == DECODER) {
 		if (V4L2_TYPE_IS_OUTPUT(plane)) {
-			internal_buf_type = platform_data->dec_ip_int_buf_tbl;
-			internal_buffer_count = platform_data->dec_ip_int_buf_tbl_size;
-			for (i = 0; i < internal_buffer_count; i++)
-				iris_fill_internal_buf_info(inst, internal_buf_type[i]);
+			*internal_buf_type = platform_data->dec_ip_int_buf_tbl;
+			*internal_buffer_count = platform_data->dec_ip_int_buf_tbl_size;
 		} else {
-			internal_buf_type = platform_data->dec_op_int_buf_tbl;
-			internal_buffer_count = platform_data->dec_op_int_buf_tbl_size;
-			for (i = 0; i < internal_buffer_count; i++)
-				iris_fill_internal_buf_info(inst, internal_buf_type[i]);
+			*internal_buf_type = platform_data->dec_op_int_buf_tbl;
+			*internal_buffer_count = platform_data->dec_op_int_buf_tbl_size;
 		}
 	} else {
 		if (V4L2_TYPE_IS_OUTPUT(plane)) {
-			internal_buf_type = platform_data->enc_ip_int_buf_tbl;
-			internal_buffer_count = platform_data->enc_ip_int_buf_tbl_size;
-			for (i = 0; i < internal_buffer_count; i++)
-				iris_fill_internal_buf_info(inst, internal_buf_type[i]);
+			*internal_buf_type = platform_data->enc_ip_int_buf_tbl;
+			*internal_buffer_count = platform_data->enc_ip_int_buf_tbl_size;
 		} else {
-			internal_buf_type = platform_data->enc_op_int_buf_tbl;
-			internal_buffer_count = platform_data->enc_op_int_buf_tbl_size;
-			for (i = 0; i < internal_buffer_count; i++)
-				iris_fill_internal_buf_info(inst, internal_buf_type[i]);
+			*internal_buf_type = platform_data->enc_op_int_buf_tbl;
+			*internal_buffer_count = platform_data->enc_op_int_buf_tbl_size;
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
-	const struct iris_platform_data *platform_data = inst->core->iris_platform_data;
 	u32 internal_buffer_count, i, j;
 	struct iris_buffers *buffers;
 	const u32 *internal_buf_type;
 	int ret;
 
-	if (inst->domain == DECODER) {
-		if (V4L2_TYPE_IS_OUTPUT(plane)) {
-			internal_buf_type = platform_data->dec_ip_int_buf_tbl;
-			internal_buffer_count = platform_data->dec_ip_int_buf_tbl_size;
-		} else {
-			internal_buf_type = platform_data->dec_op_int_buf_tbl;
-			internal_buffer_count = platform_data->dec_op_int_buf_tbl_size;
-		}
-	} else {
-		if (V4L2_TYPE_IS_OUTPUT(plane)) {
-			internal_buf_type = platform_data->enc_ip_int_buf_tbl;
-			internal_buffer_count = platform_data->enc_ip_int_buf_tbl_size;
-		} else {
-			internal_buf_type = platform_data->enc_op_int_buf_tbl;
-			internal_buffer_count = platform_data->enc_op_int_buf_tbl_size;
-		}
-	}
+	iris_get_int_buf_tbl(inst, plane, &internal_buf_type, &internal_buffer_count);
 
 	for (i = 0; i < internal_buffer_count; i++) {
 		buffers = &inst->buffers[internal_buf_type[i]];
@@ -442,30 +427,13 @@ int iris_queue_internal_deferred_buffers(struct iris_inst *inst, enum iris_buffe
 
 int iris_queue_internal_buffers(struct iris_inst *inst, u32 plane)
 {
-	const struct iris_platform_data *platform_data = inst->core->iris_platform_data;
 	struct iris_buffer *buffer, *next;
 	struct iris_buffers *buffers;
 	const u32 *internal_buf_type;
 	u32 internal_buffer_count, i;
 	int ret;
 
-	if (inst->domain == DECODER) {
-		if (V4L2_TYPE_IS_OUTPUT(plane)) {
-			internal_buf_type = platform_data->dec_ip_int_buf_tbl;
-			internal_buffer_count = platform_data->dec_ip_int_buf_tbl_size;
-		} else {
-			internal_buf_type = platform_data->dec_op_int_buf_tbl;
-			internal_buffer_count = platform_data->dec_op_int_buf_tbl_size;
-		}
-	} else {
-		if (V4L2_TYPE_IS_OUTPUT(plane)) {
-			internal_buf_type = platform_data->enc_ip_int_buf_tbl;
-			internal_buffer_count = platform_data->enc_ip_int_buf_tbl_size;
-		} else {
-			internal_buf_type = platform_data->enc_op_int_buf_tbl;
-			internal_buffer_count = platform_data->enc_op_int_buf_tbl_size;
-		}
-	}
+	iris_get_int_buf_tbl(inst, plane, &internal_buf_type, &internal_buffer_count);
 
 	for (i = 0; i < internal_buffer_count; i++) {
 		buffers = &inst->buffers[internal_buf_type[i]];
@@ -501,30 +469,13 @@ int iris_destroy_internal_buffer(struct iris_inst *inst, struct iris_buffer *buf
 
 static int iris_destroy_internal_buffers(struct iris_inst *inst, u32 plane, bool force)
 {
-	const struct iris_platform_data *platform_data = inst->core->iris_platform_data;
 	struct iris_buffer *buf, *next;
 	struct iris_buffers *buffers;
 	const u32 *internal_buf_type;
 	u32 i, len;
 	int ret;
 
-	if (inst->domain == DECODER) {
-		if (V4L2_TYPE_IS_OUTPUT(plane)) {
-			internal_buf_type = platform_data->dec_ip_int_buf_tbl;
-			len = platform_data->dec_ip_int_buf_tbl_size;
-		} else {
-			internal_buf_type = platform_data->dec_op_int_buf_tbl;
-			len = platform_data->dec_op_int_buf_tbl_size;
-		}
-	} else {
-		if (V4L2_TYPE_IS_OUTPUT(plane)) {
-			internal_buf_type = platform_data->enc_ip_int_buf_tbl;
-			len = platform_data->enc_ip_int_buf_tbl_size;
-		} else {
-			internal_buf_type = platform_data->enc_op_int_buf_tbl;
-			len = platform_data->enc_op_int_buf_tbl_size;
-		}
-	}
+	iris_get_int_buf_tbl(inst, plane, &internal_buf_type, &len);
 
 	for (i = 0; i < len; i++) {
 		buffers = &inst->buffers[internal_buf_type[i]];
@@ -593,18 +544,12 @@ static int iris_release_internal_buffers(struct iris_inst *inst,
 
 static int iris_release_input_internal_buffers(struct iris_inst *inst)
 {
-	const struct iris_platform_data *platform_data = inst->core->iris_platform_data;
 	const u32 *internal_buf_type;
 	u32 internal_buffer_count, i;
 	int ret;
 
-	if (inst->domain == DECODER) {
-		internal_buf_type = platform_data->dec_ip_int_buf_tbl;
-		internal_buffer_count = platform_data->dec_ip_int_buf_tbl_size;
-	} else {
-		internal_buf_type = platform_data->enc_ip_int_buf_tbl;
-		internal_buffer_count = platform_data->enc_ip_int_buf_tbl_size;
-	}
+	iris_get_int_buf_tbl(inst, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
+			     &internal_buf_type, &internal_buffer_count);
 
 	for (i = 0; i < internal_buffer_count; i++) {
 		ret = iris_release_internal_buffers(inst, internal_buf_type[i]);

-- 
2.34.1


