Return-Path: <linux-media+bounces-59311-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WL2/L4+u6GkhOwIAu9opvQ
	(envelope-from <linux-media+bounces-59311-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 22 Apr 2026 13:18:39 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2612E4452AA
	for <lists+linux-media@lfdr.de>; Wed, 22 Apr 2026 13:18:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 948D0305E1E7
	for <lists+linux-media@lfdr.de>; Wed, 22 Apr 2026 11:16:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2549299944;
	Wed, 22 Apr 2026 11:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F8NedmIT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RNeKjPru"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CDA8286D57
	for <linux-media@vger.kernel.org>; Wed, 22 Apr 2026 11:16:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776856618; cv=none; b=O9VnHD1IxEzSZHAJmKldnvNRHCymG5a2CTIMMIrW1YXl4586XkmcRMEudnNaYUl7Bxb9yPCaHPO498phnsFDUSytExDD8pB4YRDttFaD+kikwTbLPuKwpFYF2jK2drkkaKVk6TFduxtjbyWdcP8hq9HP2eGgQ9EGXoFz1GBQf/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776856618; c=relaxed/simple;
	bh=G6ZFBPo0z9LQpTfYNT7xUXOr5jQoLY8ztbN1qAozn6I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LxSspr+0auA/zixQk3fYKA1m7PC7B2hscWFKQKcnN84hdMBP0rpgu1LHOkej++/jvKqhCHs9rRdKeAy7PfLbBMNL7YUv2fIfUvY/Xl6DEvIMNSYAiyacGAe7WiWR5Mkmg84d3ucwd5MGqnrzgXmHDU1lS82VK2ADxdWRljQHBOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F8NedmIT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RNeKjPru; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63MAsXPX976179
	for <linux-media@vger.kernel.org>; Wed, 22 Apr 2026 11:16:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7QfYSMr6guIMXdf3O06pHgZqjV/R1TMVX9fUxgcBlDw=; b=F8NedmITBx0SGJb+
	nY4Xi6S/VvxmYFvcP27A+lu9ld93v2odprx4tSDLYhZai+1PWjOgzYxeeSeR9JpF
	0QHQzmxSZJ3+FCgPuflgaYITQZq8arJKHFl+rhOPEs2HzKXpeZfE/OhOy8iQKfuH
	I3Fl08NklOFgbQE8YD8j14YbtPkBke6BUY7Uev6a/Me7wF9JExX3468HkMPKAol4
	jPaNixFobAZLNxP9wwqm49+ZxnU0waJr7MeLeSpB/s34+/7DU8UoSqz70CW5ZBzZ
	VzfCbHz3LDkJds2nBHYqe7N+3Z+G+IRf5dB1Kn+Zpxvodjl23ieq7U38m8JkYFkK
	Fb6iOw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dpeneb6dg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 22 Apr 2026 11:16:55 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-82f543bae3cso2869133b3a.1
        for <linux-media@vger.kernel.org>; Wed, 22 Apr 2026 04:16:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776856615; x=1777461415; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7QfYSMr6guIMXdf3O06pHgZqjV/R1TMVX9fUxgcBlDw=;
        b=RNeKjPruC6z3Zmubba67AMnong8D06qDpHQ9ZDr7fZPsiCnYCKQuLSlhm0iy9jLGxj
         0AZHBKs63Hqev8jtJtwgtXueIA0HIiQM61vlpSx0EanOAamFLgJr+TcA9Kl9YS9++MMV
         vAA2xHxc5IL65PmGCoWWZRcCxZyyb2xx8kEmHPwNSGFrje673sTlEsDmxpVu6CzQBzbP
         tBlDXQ/1lF2aEWXl6ZQMhrzXJkHBfhpGuO+lo0AyDyqBgFyv/hNsTafZzgLzx+Cay4I7
         h2YtsyxuBH+QLlpStrCZTckuxtg2fqLBQWBc7dZ9bAwfqvZhG6DangnkipQy8BzmuvNb
         siIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776856615; x=1777461415;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7QfYSMr6guIMXdf3O06pHgZqjV/R1TMVX9fUxgcBlDw=;
        b=OS8ssadpNzD+MIedMbf+6eOZvJYANzsLA//8AJ53XY5BfVyAHSsHLL+oNYFyHNGOVL
         JJbp7xrP9qFI8B0jYRlSTYJsUUMG2vnSo3G3Lj1CXYRuMuStFQUZugDJhSlx1vSkUmc2
         gYBjZiCB23vnGIt1zuwzu2CGxut56NfNIiFvQTXngVX1Zz0Tr7HBb3UmzTQxwoyM1G81
         EPc/6D5wFAZXD7D/3VIVBVE8SyJzqxFGvW2j2OhK2cA+6u8+yqVbjKkOk5YEhsUudwkx
         mO0oTGS4S074BWes6E57Vy5eH1ENmN/xbY2obeAxAXTBOjbj5aFwC4Y32f3Fvtty2fEo
         m9DQ==
X-Gm-Message-State: AOJu0YzW5t+0DYLUmueroONaXTBBxHf1JhbZJhXPBfccJ4fWcedNwsF5
	PKnq+uzvrOpF8f6lVJhv9mXgnAoHtYVfJxwIAdzMug9IgCmloMgEXAuODjjB/DqBluBlQ7Fxl2+
	J8qzx4A2VaBkoQGlYQaZ9U6YMnB1V5RWr0CwlcXHk466lCNLHOYnSXcNMVDtWGkNBCw==
X-Gm-Gg: AeBDietqLZD1Tzfva6usbKtkMt7J3kLtsnb4XKQAa0v8jpqm6lEo8ZFLGh9SdF0T42f
	FJbBw6HXYkejNrdZqRgCKgicPN515I7+TdoNRazpI2OTY9TEAi7sr5X0ExymIWTT7hv1eT1ZWSM
	kFTvo4AyAatt6IIq5QbwUZff1S9ngtBk86VeQAyDUGIeQq0ZxniPAKQoYBfRNDfaQBIGiZ+OWZt
	ESdWFvehU7LIcWRxyeBKMUQd916P2ObK2NwqSVyfBedXTDKuiJL3foURSd5x+8KoQiERnyCmLTL
	ag6p28Lfx98u/uno3UfxYVKRiEnHY/Xpbnz4Zj+B36kKZb7Am/DzBp/Q7sFXFuSqbEZ6eYcg/TE
	wLnP6Y56q0nrBvlUT22rawz9dBOeEipCtKg7pV3jt67uuDA4klu1w+ybhd4AloMRFZpl+ww==
X-Received: by 2002:a05:6a00:94e2:b0:7e8:3fcb:9b03 with SMTP id d2e1a72fcca58-82f8b531fe8mr18696178b3a.25.1776856615167;
        Wed, 22 Apr 2026 04:16:55 -0700 (PDT)
X-Received: by 2002:a05:6a00:94e2:b0:7e8:3fcb:9b03 with SMTP id d2e1a72fcca58-82f8b531fe8mr18696144b3a.25.1776856614610;
        Wed, 22 Apr 2026 04:16:54 -0700 (PDT)
Received: from hu-dikshita-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ebe901csm21100782b3a.48.2026.04.22.04.16.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 04:16:54 -0700 (PDT)
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Date: Wed, 22 Apr 2026 16:46:34 +0530
Subject: [PATCH 1/7] media: qcom: iris: Centralize internal buffer table
 selection
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260422-iris-code-improvement-v1-1-8e150482212d@oss.qualcomm.com>
References: <20260422-iris-code-improvement-v1-0-8e150482212d@oss.qualcomm.com>
In-Reply-To: <20260422-iris-code-improvement-v1-0-8e150482212d@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776856606; l=7994;
 i=dikshita.agarwal@oss.qualcomm.com; s=20240917; h=from:subject:message-id;
 bh=G6ZFBPo0z9LQpTfYNT7xUXOr5jQoLY8ztbN1qAozn6I=;
 b=efO/sBo+hgCNafAVgACO5Nw+pI3JmSKKRsDsbn2bt7dyuth8qPRvNzHD3dLVixe3iqy/LA31d
 oErJRweHuT5CX4+3bpS2SpF1LIiCFZpXnwsZ3H3hSTTSJtbG4hAoG5m
X-Developer-Key: i=dikshita.agarwal@oss.qualcomm.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDEwOCBTYWx0ZWRfX+nzzzClqVCcS
 NkPct5B4AfXoD1wdi7B4f/2z95JMfFUnHJJWgFz/krAMU34ntSdJ16psAKgGwBHrbnAlufK+sYh
 wGHWqyIz6Wr3k9/p1+f2JAVZWtKIB33YV4FRJvoDJd8JRhhIUE+QMXD3YDitZx1cWoLInRLEYu8
 vosj4nbr+Ja7d/BkTCTgjw4JKdT/pWtwO2n5RDhH4uojOAJ4TmVeDNCA3jHZGAj/6Pha6Ca9ggl
 yfFS1op2gfZ2Bmdd3tTfA1WbQuLmsCa6HLSBRvTTid1nM55+du9I5O6ioHuvuKlv1u0y382jhPm
 LtHMEnAqsqHxAYcd2rID8Uz7KX/+huxsAIoRwfTHCwSb1FICg3k3sMO67uUyE+XWclNhDooSPjK
 VA3vapZOz/ewgctmimZGiWuulWPacMmJpp1PFADc1yOrerb1SU/Ptkz+31W8L71W20FWZ1Y9rvh
 D314wft32KFt5v4iA8Q==
X-Proofpoint-GUID: Os2taGsSv3U_46mLNMELtiEgfxxKn_5u
X-Proofpoint-ORIG-GUID: Os2taGsSv3U_46mLNMELtiEgfxxKn_5u
X-Authority-Analysis: v=2.4 cv=RoT16imK c=1 sm=1 tr=0 ts=69e8ae27 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=YO4-hHwgDu7wuGDVLqgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-22_01,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 adultscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604220108
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
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-59311-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dikshita.agarwal@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2612E4452AA
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
index 9151f43bc6b9c2c34c803de4231d1e6de0bec6c4..137a69c99bcc24a72f4f27e516b8fb4d6509c0ad 100644
--- a/drivers/media/platform/qcom/iris/iris_buffer.c
+++ b/drivers/media/platform/qcom/iris/iris_buffer.c
@@ -299,39 +299,41 @@ static void iris_fill_internal_buf_info(struct iris_inst *inst,
 	buffers->min_count = iris_vpu_buf_count(inst, buffer_type);
 }
 
-void iris_get_internal_buffers(struct iris_inst *inst, u32 plane)
+static void iris_get_int_buf_tbl(struct iris_inst *inst, u32 plane,
+				 const u32 **buf_tbl, u32 *buf_tbl_size)
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
+			*buf_tbl = platform_data->dec_ip_int_buf_tbl;
+			*buf_tbl_size = platform_data->dec_ip_int_buf_tbl_size;
 		} else {
-			internal_buf_type = platform_data->dec_op_int_buf_tbl;
-			internal_buffer_count = platform_data->dec_op_int_buf_tbl_size;
-			for (i = 0; i < internal_buffer_count; i++)
-				iris_fill_internal_buf_info(inst, internal_buf_type[i]);
+			*buf_tbl = platform_data->dec_op_int_buf_tbl;
+			*buf_tbl_size = platform_data->dec_op_int_buf_tbl_size;
 		}
 	} else {
 		if (V4L2_TYPE_IS_OUTPUT(plane)) {
-			internal_buf_type = platform_data->enc_ip_int_buf_tbl;
-			internal_buffer_count = platform_data->enc_ip_int_buf_tbl_size;
-			for (i = 0; i < internal_buffer_count; i++)
-				iris_fill_internal_buf_info(inst, internal_buf_type[i]);
+			*buf_tbl = platform_data->enc_ip_int_buf_tbl;
+			*buf_tbl_size = platform_data->enc_ip_int_buf_tbl_size;
 		} else {
-			internal_buf_type = platform_data->enc_op_int_buf_tbl;
-			internal_buffer_count = platform_data->enc_op_int_buf_tbl_size;
-			for (i = 0; i < internal_buffer_count; i++)
-				iris_fill_internal_buf_info(inst, internal_buf_type[i]);
+			*buf_tbl = platform_data->enc_op_int_buf_tbl;
+			*buf_tbl_size = platform_data->enc_op_int_buf_tbl_size;
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


