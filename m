Return-Path: <linux-media+bounces-55784-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YElLMy1wtGm2oAAAu9opvQ
	(envelope-from <linux-media+bounces-55784-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 21:14:37 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 50AF52899A5
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 21:14:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9F9583043057
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 20:13:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C07AB3E5579;
	Fri, 13 Mar 2026 20:13:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LipBzqsH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="b0vrZjrG"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B8FE3E5578
	for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 20:13:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773432796; cv=none; b=X6vCVILmh46OWAJsI8TneDNnoHwnIapQm415UHQntzXP+B7yS7Lt1Q5c1RDn5ABTL1Ug92JzGR580Tjnixu3Dz3xFMvlkOqPqxSStBQa8YM+QXiscCqq628D78nxnb2Cbh7ouS7WyyQdqjFB7WomMoGIaCx1Lkf4Ij5KkP6s1qA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773432796; c=relaxed/simple;
	bh=qNvkh7cq0+lWfpZKNd1a4my4sQ6mCkB4XBbYcQjPPow=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Bdg5WehEwIcABfrMGn/5uSVXNR4Tv4RbR78w3udpbXoTCi5kGAnS+yc4l6YWQi7MoOS85qCfeypjER9MgyeJkjdcIumEmoNmjThI8OZzd0UGM0EGzLI00FCOorrHc6ZtIJPl/ElV9wQvIm/wkossaqW86UD8mZk4joBWYRxZstI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LipBzqsH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b0vrZjrG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62DGC7bu481510
	for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 20:13:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	72PO5WNZKj807LYzjo1JYHn29DopxezczJh+WdbpTt8=; b=LipBzqsHCCjZorav
	585uezO2X/6fLwHMkCJ81zlZHc94PiHeV/y1mB7SG6tRMRFCzZ9nptuiZGND3dfN
	gDFHdZNcHsfYelRrB7z6ygMKvjShv3pghJFQbFx7kHAavCGIu7lzPlAf0dTsfYan
	vXYoVAhVZfwuKhpvM/+Rn2AV0BaKBVcd1Jgq9ssky4Fc9DVoUH3a8nOYvFkv2c2k
	D+HhGwz6hiQHKVfm45MF9/2IkmVgsRm7xR9b+rmI6uovbtH7A1TN/jtU00gBCJDF
	jDmJQWRIt+ZEbmZVbOBIZ5Y9IGkfc7ukX3w1cbDY2kYcZpZJyh6m5lU8n/12pRki
	SKRpNg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cvfh7tbu4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 20:13:12 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cd827a356aso1528772385a.3
        for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 13:13:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773432791; x=1774037591; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=72PO5WNZKj807LYzjo1JYHn29DopxezczJh+WdbpTt8=;
        b=b0vrZjrGI19ONW72pq2/RPYPrj+QcntTcBIqkXJOWxKvQopMpU4R1T39LHY/49k2i1
         DRW9rkNH/6+O1xa9d3pISJWAt+OuBO0+sRbe4B5VNzTz40l9WiV7fXVU0C9s5SALXfkL
         gCpLR3he6845JMaJTgI2l6ImoisjxR1XFuVdKX+VWKN0f6OZZCF7GE26TgRY4/KC9VCZ
         5y9i0+hxOIlDICZ8iyLLa9bv/Q3+rFJ5DZSYCPsi84Ema8VDfaqhkqNGh4o5JBP+UICi
         hh0YBzHRCc53o6ZAurosDl5BNZVk15m8x5hgMmg8BtbdlYG+k4u3g9LIwHyJhMaLQHGR
         0O2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773432791; x=1774037591;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=72PO5WNZKj807LYzjo1JYHn29DopxezczJh+WdbpTt8=;
        b=d8cZRfKy+khll4s+Ai6K97o3ZCH/Ub/mMm8hYwL50U7OXM0fLBkZnkQAIqNo0lFDuV
         AwjMdCfD8Nmyz8E+5OmxJo2bFrwU5EFVPCRyzg5rXHHJeEWj/b4ghGUAlI40wXRK8CsE
         ezcbfWOMdaD93YzGpgqyn86sViNshgfLiGStNGc4BPSiH+MDTK9Aygqqbbnpym7OcAR+
         J+L/5ZT7Nu1hC+UB6tlQJUQms1sUSV/AOX6BCyY6NWrYIpL+kvooMp+BVlUGJIrCbZIg
         Or+GaegU3yEBGRVHS3/S/aqQlTUefAQtve4GLpomKF8qVWNAuWwmurmuNAXuCPGjhoPz
         v45Q==
X-Gm-Message-State: AOJu0YyCKY1r9Z/7xOiZJJQ3fNgLcUxrlvPCIE4hmYFduFIYq2htGPKC
	/7zPjHW0sa2JBbgsWdBAQDTlDPIVdW2HeLVo6vyz6u8B9z1THT0gWjW7+fG3Unws2tE0V/A1n/r
	x3mnT7YYyA+/kS9+mfE6HsDENBBkLIOSm3JS7BxeFIqjWYi3FTrIGtprB2IqGikt6LA==
X-Gm-Gg: ATEYQzwDG0suQcGPX0eY7gDtEmE/bj5q7a/+sCpaFEetcGnSQX3HYKfLo96xMtOnHkb
	CYW/NUJLTOA9SAXjYKoMTHILZXraomljZPdDgMNGX0WYTP0/CocPsEM9+4pR7Ke3mtpA/2wuevc
	Veb05L8zHmGpwM9dJomsyktJq247yTnDSynz7PSwD4d8uE/mHAQdF/4l0a5ngTxM8ylx6FG9vKG
	MjnWzj7VwwtfpRfBxHV+Etyfoh1zc/aY3j2oKjK8Y98E0a7PY+co0DjOHIYp7QX7szPuItj4PTY
	MQzJZUvZYVgEjJ0rSrlGIKJtA2W2coUCHupZ0qlRPWr5D8B5U5V3c0ZNin034hWo32w6O5wiWUu
	SyffBR74SyDbtqGfyLzih+37Seb1GErwARVLDh0X3K0Bt1aAP/fXXSeRees53oaW23v55dlcO7w
	DPeRCNiXvYtVPrXvCHWrPLq4+43LOlAATxyXg=
X-Received: by 2002:a05:620a:460e:b0:8c7:8b8:e0ac with SMTP id af79cd13be357-8cdb5a06113mr647334585a.12.1773432790965;
        Fri, 13 Mar 2026 13:13:10 -0700 (PDT)
X-Received: by 2002:a05:620a:460e:b0:8c7:8b8:e0ac with SMTP id af79cd13be357-8cdb5a06113mr647328585a.12.1773432790163;
        Fri, 13 Mar 2026 13:13:10 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a155f33c15sm1681259e87.17.2026.03.13.13.13.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 13:13:07 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 13 Mar 2026 22:12:55 +0200
Subject: [PATCH v6 7/8] media: qcom: iris: split firmware_data from raw
 platform data
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260313-iris-platform-data-v6-7-1763bb837fd2@oss.qualcomm.com>
References: <20260313-iris-platform-data-v6-0-1763bb837fd2@oss.qualcomm.com>
In-Reply-To: <20260313-iris-platform-data-v6-0-1763bb837fd2@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=45327;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=qNvkh7cq0+lWfpZKNd1a4my4sQ6mCkB4XBbYcQjPPow=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBptG/EiNyp1RwDHvCC+29LmA0AVIJlu3DQrrrsf
 Z66w/OEsxmJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCabRvxAAKCRCLPIo+Aiko
 1TpRB/9Zv+YmjVzFXtj68fTnBQhdsEdtDeiZP5tBFveFOywnlzZozrD2bOfm57qropuKX3pkSwZ
 6AAqubr0+oPguRelHY4opYfECcBxYy59brQgWDtUK7ZYSaqx/h7azRX48tcmi5ArMzzVAcO87/0
 5dK6wfIpNLettEVmSQrzLq/JUtcPvZ12RVbb40/o/IKGF7RKolzAMAj+H1+pG+faVihBe6k772A
 SCM1Oq0wFweiB+ONwkr8ZrldGR0yabHlwRPTv253SbVNwho/lllqMpPA1agFcMUXnddNU81KF4A
 nB3rCJ1yCLc3AKgT6o1Nrab7dKoTB3I/kcmfWDUdXyouX0Mt
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: TS4QR__Im9ml3zE0PSNUfQuf4z6GtRRY
X-Proofpoint-GUID: TS4QR__Im9ml3zE0PSNUfQuf4z6GtRRY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDE2MSBTYWx0ZWRfXwUGhZRTpH4Ed
 MNri+CtAKN2w/XtECrtzRAisNZObye36HnDXmPNF4CNibFWeflspk6eplg0OLhGtTf4JUWvHLAb
 gjFUgERu73yFpwiBbyps9LDmEspxdDAhm0YyOzIYxvMYxg1ntFDgxhcQw7l3e9s6K4zYctK6nG3
 R1tt68RzA83uYM3Z2WfjOa0dp8hCYKxtfmISfveOmvnpA8tM2tUvstjAi3wGSOTBLxIMFR/cYWR
 l19cqbRxGZTwX24/hEb0XaQp9m5j1ow6mlTGlO9vOli6oFfxTmyZJwlCTPcCkYxJi6cA1et94KW
 j7KQyuZ07eqe9vAaacC/7CwmQ0TFAykRhnuNXhBdPuFDGpCs+g8xK+DrPlyx/5u/2zpFvChgPJk
 KxnwG++qUdgRSnA3N9lQIDvX6nxtgNP6twgA/X9C9/fLRjf0RkSTwShXpOP31nou+nkibbNBduv
 Iv4CJnFZiK8CpIMyonQ==
X-Authority-Analysis: v=2.4 cv=BpiQAIX5 c=1 sm=1 tr=0 ts=69b46fd8 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=coRdw7kJwGx05Zhg8iIA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_04,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 adultscore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130161
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,60fps:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55784-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 50AF52899A5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Having firmware-related fields in platform data results in the tying
platform data to the HFI firmware data rather than the actual hardware.
For example, SM8450 uses Gen2 firmware, so currently its platform data
should be placed next to the other gen2 platforms, although it has the
VPU2.0 core, similar to the one found on SM8250 and SC7280 and so the
hardware-specific platform data is also close to those devices.

Split firmware data to a separate struct, separating hardware-related
data from the firmware interfaces.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_buffer.c     |  82 +++----
 drivers/media/platform/qcom/iris/iris_core.h       |   2 +
 drivers/media/platform/qcom/iris/iris_ctrls.c      |   8 +-
 .../platform/qcom/iris/iris_hfi_gen1_command.c     |   8 +-
 .../platform/qcom/iris/iris_hfi_gen2_command.c     |  66 +++---
 .../platform/qcom/iris/iris_platform_common.h      |  82 ++++---
 .../media/platform/qcom/iris/iris_platform_gen1.c  |  67 +++---
 .../media/platform/qcom/iris/iris_platform_gen2.c  | 246 ++++-----------------
 drivers/media/platform/qcom/iris/iris_probe.c      |   3 +-
 drivers/media/platform/qcom/iris/iris_vidc.c       |  10 +-
 10 files changed, 205 insertions(+), 369 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_buffer.c b/drivers/media/platform/qcom/iris/iris_buffer.c
index f55b7c608116..fbe136360aa1 100644
--- a/drivers/media/platform/qcom/iris/iris_buffer.c
+++ b/drivers/media/platform/qcom/iris/iris_buffer.c
@@ -301,31 +301,31 @@ static void iris_fill_internal_buf_info(struct iris_inst *inst,
 
 void iris_get_internal_buffers(struct iris_inst *inst, u32 plane)
 {
-	const struct iris_platform_data *platform_data = inst->core->iris_platform_data;
+	const struct iris_firmware_data *firmware_data = inst->core->iris_firmware_data;
 	const u32 *internal_buf_type;
 	u32 internal_buffer_count, i;
 
 	if (inst->domain == DECODER) {
 		if (V4L2_TYPE_IS_OUTPUT(plane)) {
-			internal_buf_type = platform_data->dec_ip_int_buf_tbl;
-			internal_buffer_count = platform_data->dec_ip_int_buf_tbl_size;
+			internal_buf_type = firmware_data->dec_ip_int_buf_tbl;
+			internal_buffer_count = firmware_data->dec_ip_int_buf_tbl_size;
 			for (i = 0; i < internal_buffer_count; i++)
 				iris_fill_internal_buf_info(inst, internal_buf_type[i]);
 		} else {
-			internal_buf_type = platform_data->dec_op_int_buf_tbl;
-			internal_buffer_count = platform_data->dec_op_int_buf_tbl_size;
+			internal_buf_type = firmware_data->dec_op_int_buf_tbl;
+			internal_buffer_count = firmware_data->dec_op_int_buf_tbl_size;
 			for (i = 0; i < internal_buffer_count; i++)
 				iris_fill_internal_buf_info(inst, internal_buf_type[i]);
 		}
 	} else {
 		if (V4L2_TYPE_IS_OUTPUT(plane)) {
-			internal_buf_type = platform_data->enc_ip_int_buf_tbl;
-			internal_buffer_count = platform_data->enc_ip_int_buf_tbl_size;
+			internal_buf_type = firmware_data->enc_ip_int_buf_tbl;
+			internal_buffer_count = firmware_data->enc_ip_int_buf_tbl_size;
 			for (i = 0; i < internal_buffer_count; i++)
 				iris_fill_internal_buf_info(inst, internal_buf_type[i]);
 		} else {
-			internal_buf_type = platform_data->enc_op_int_buf_tbl;
-			internal_buffer_count = platform_data->enc_op_int_buf_tbl_size;
+			internal_buf_type = firmware_data->enc_op_int_buf_tbl;
+			internal_buffer_count = firmware_data->enc_op_int_buf_tbl_size;
 			for (i = 0; i < internal_buffer_count; i++)
 				iris_fill_internal_buf_info(inst, internal_buf_type[i]);
 		}
@@ -366,7 +366,7 @@ static int iris_create_internal_buffer(struct iris_inst *inst,
 
 int iris_create_internal_buffers(struct iris_inst *inst, u32 plane)
 {
-	const struct iris_platform_data *platform_data = inst->core->iris_platform_data;
+	const struct iris_firmware_data *firmware_data = inst->core->iris_firmware_data;
 	u32 internal_buffer_count, i, j;
 	struct iris_buffers *buffers;
 	const u32 *internal_buf_type;
@@ -374,19 +374,19 @@ int iris_create_internal_buffers(struct iris_inst *inst, u32 plane)
 
 	if (inst->domain == DECODER) {
 		if (V4L2_TYPE_IS_OUTPUT(plane)) {
-			internal_buf_type = platform_data->dec_ip_int_buf_tbl;
-			internal_buffer_count = platform_data->dec_ip_int_buf_tbl_size;
+			internal_buf_type = firmware_data->dec_ip_int_buf_tbl;
+			internal_buffer_count = firmware_data->dec_ip_int_buf_tbl_size;
 		} else {
-			internal_buf_type = platform_data->dec_op_int_buf_tbl;
-			internal_buffer_count = platform_data->dec_op_int_buf_tbl_size;
+			internal_buf_type = firmware_data->dec_op_int_buf_tbl;
+			internal_buffer_count = firmware_data->dec_op_int_buf_tbl_size;
 		}
 	} else {
 		if (V4L2_TYPE_IS_OUTPUT(plane)) {
-			internal_buf_type = platform_data->enc_ip_int_buf_tbl;
-			internal_buffer_count = platform_data->enc_ip_int_buf_tbl_size;
+			internal_buf_type = firmware_data->enc_ip_int_buf_tbl;
+			internal_buffer_count = firmware_data->enc_ip_int_buf_tbl_size;
 		} else {
-			internal_buf_type = platform_data->enc_op_int_buf_tbl;
-			internal_buffer_count = platform_data->enc_op_int_buf_tbl_size;
+			internal_buf_type = firmware_data->enc_op_int_buf_tbl;
+			internal_buffer_count = firmware_data->enc_op_int_buf_tbl_size;
 		}
 	}
 
@@ -442,7 +442,7 @@ int iris_queue_internal_deferred_buffers(struct iris_inst *inst, enum iris_buffe
 
 int iris_queue_internal_buffers(struct iris_inst *inst, u32 plane)
 {
-	const struct iris_platform_data *platform_data = inst->core->iris_platform_data;
+	const struct iris_firmware_data *firmware_data = inst->core->iris_firmware_data;
 	struct iris_buffer *buffer, *next;
 	struct iris_buffers *buffers;
 	const u32 *internal_buf_type;
@@ -451,19 +451,19 @@ int iris_queue_internal_buffers(struct iris_inst *inst, u32 plane)
 
 	if (inst->domain == DECODER) {
 		if (V4L2_TYPE_IS_OUTPUT(plane)) {
-			internal_buf_type = platform_data->dec_ip_int_buf_tbl;
-			internal_buffer_count = platform_data->dec_ip_int_buf_tbl_size;
+			internal_buf_type = firmware_data->dec_ip_int_buf_tbl;
+			internal_buffer_count = firmware_data->dec_ip_int_buf_tbl_size;
 		} else {
-			internal_buf_type = platform_data->dec_op_int_buf_tbl;
-			internal_buffer_count = platform_data->dec_op_int_buf_tbl_size;
+			internal_buf_type = firmware_data->dec_op_int_buf_tbl;
+			internal_buffer_count = firmware_data->dec_op_int_buf_tbl_size;
 		}
 	} else {
 		if (V4L2_TYPE_IS_OUTPUT(plane)) {
-			internal_buf_type = platform_data->enc_ip_int_buf_tbl;
-			internal_buffer_count = platform_data->enc_ip_int_buf_tbl_size;
+			internal_buf_type = firmware_data->enc_ip_int_buf_tbl;
+			internal_buffer_count = firmware_data->enc_ip_int_buf_tbl_size;
 		} else {
-			internal_buf_type = platform_data->enc_op_int_buf_tbl;
-			internal_buffer_count = platform_data->enc_op_int_buf_tbl_size;
+			internal_buf_type = firmware_data->enc_op_int_buf_tbl;
+			internal_buffer_count = firmware_data->enc_op_int_buf_tbl_size;
 		}
 	}
 
@@ -501,7 +501,7 @@ int iris_destroy_internal_buffer(struct iris_inst *inst, struct iris_buffer *buf
 
 static int iris_destroy_internal_buffers(struct iris_inst *inst, u32 plane, bool force)
 {
-	const struct iris_platform_data *platform_data = inst->core->iris_platform_data;
+	const struct iris_firmware_data *firmware_data = inst->core->iris_firmware_data;
 	struct iris_buffer *buf, *next;
 	struct iris_buffers *buffers;
 	const u32 *internal_buf_type;
@@ -510,19 +510,19 @@ static int iris_destroy_internal_buffers(struct iris_inst *inst, u32 plane, bool
 
 	if (inst->domain == DECODER) {
 		if (V4L2_TYPE_IS_OUTPUT(plane)) {
-			internal_buf_type = platform_data->dec_ip_int_buf_tbl;
-			len = platform_data->dec_ip_int_buf_tbl_size;
+			internal_buf_type = firmware_data->dec_ip_int_buf_tbl;
+			len = firmware_data->dec_ip_int_buf_tbl_size;
 		} else {
-			internal_buf_type = platform_data->dec_op_int_buf_tbl;
-			len = platform_data->dec_op_int_buf_tbl_size;
+			internal_buf_type = firmware_data->dec_op_int_buf_tbl;
+			len = firmware_data->dec_op_int_buf_tbl_size;
 		}
 	} else {
 		if (V4L2_TYPE_IS_OUTPUT(plane)) {
-			internal_buf_type = platform_data->enc_ip_int_buf_tbl;
-			len = platform_data->enc_ip_int_buf_tbl_size;
+			internal_buf_type = firmware_data->enc_ip_int_buf_tbl;
+			len = firmware_data->enc_ip_int_buf_tbl_size;
 		} else {
-			internal_buf_type = platform_data->enc_op_int_buf_tbl;
-			len = platform_data->enc_op_int_buf_tbl_size;
+			internal_buf_type = firmware_data->enc_op_int_buf_tbl;
+			len = firmware_data->enc_op_int_buf_tbl_size;
 		}
 	}
 
@@ -593,17 +593,17 @@ static int iris_release_internal_buffers(struct iris_inst *inst,
 
 static int iris_release_input_internal_buffers(struct iris_inst *inst)
 {
-	const struct iris_platform_data *platform_data = inst->core->iris_platform_data;
+	const struct iris_firmware_data *firmware_data = inst->core->iris_firmware_data;
 	const u32 *internal_buf_type;
 	u32 internal_buffer_count, i;
 	int ret;
 
 	if (inst->domain == DECODER) {
-		internal_buf_type = platform_data->dec_ip_int_buf_tbl;
-		internal_buffer_count = platform_data->dec_ip_int_buf_tbl_size;
+		internal_buf_type = firmware_data->dec_ip_int_buf_tbl;
+		internal_buffer_count = firmware_data->dec_ip_int_buf_tbl_size;
 	} else {
-		internal_buf_type = platform_data->enc_ip_int_buf_tbl;
-		internal_buffer_count = platform_data->enc_ip_int_buf_tbl_size;
+		internal_buf_type = firmware_data->enc_ip_int_buf_tbl;
+		internal_buffer_count = firmware_data->enc_ip_int_buf_tbl_size;
 	}
 
 	for (i = 0; i < internal_buffer_count; i++) {
diff --git a/drivers/media/platform/qcom/iris/iris_core.h b/drivers/media/platform/qcom/iris/iris_core.h
index 1592681640ab..e0ca245c8c63 100644
--- a/drivers/media/platform/qcom/iris/iris_core.h
+++ b/drivers/media/platform/qcom/iris/iris_core.h
@@ -54,6 +54,7 @@ struct qcom_ubwc_cfg_data;
  * @resets: table of iris reset clocks
  * @controller_resets: table of controller reset clocks
  * @iris_platform_data: a structure for platform data
+ * @iris_firmware_data: a pointer to the firmware (or HFI) specific data
  * @ubwc_cfg: UBWC configuration for the platform
  * @state: current state of core
  * @iface_q_table_daddr: device address for interface queue table memory
@@ -97,6 +98,7 @@ struct iris_core {
 	struct reset_control_bulk_data		*resets;
 	struct reset_control_bulk_data		*controller_resets;
 	const struct iris_platform_data		*iris_platform_data;
+	const struct iris_firmware_data		*iris_firmware_data;
 	const struct qcom_ubwc_cfg_data		*ubwc_cfg;
 	enum iris_core_state			state;
 	dma_addr_t				iface_q_table_daddr;
diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.c b/drivers/media/platform/qcom/iris/iris_ctrls.c
index 5a24aa869b2d..ef7adac3764d 100644
--- a/drivers/media/platform/qcom/iris/iris_ctrls.c
+++ b/drivers/media/platform/qcom/iris/iris_ctrls.c
@@ -332,8 +332,8 @@ void iris_session_init_caps(struct iris_core *core)
 	const struct platform_inst_fw_cap *caps;
 	u32 i, num_cap, cap_id;
 
-	caps = core->iris_platform_data->inst_fw_caps_dec;
-	num_cap = core->iris_platform_data->inst_fw_caps_dec_size;
+	caps = core->iris_firmware_data->inst_fw_caps_dec;
+	num_cap = core->iris_firmware_data->inst_fw_caps_dec_size;
 
 	for (i = 0; i < num_cap; i++) {
 		cap_id = caps[i].cap_id;
@@ -360,8 +360,8 @@ void iris_session_init_caps(struct iris_core *core)
 		}
 	}
 
-	caps = core->iris_platform_data->inst_fw_caps_enc;
-	num_cap = core->iris_platform_data->inst_fw_caps_enc_size;
+	caps = core->iris_firmware_data->inst_fw_caps_enc;
+	num_cap = core->iris_firmware_data->inst_fw_caps_enc_size;
 
 	for (i = 0; i < num_cap; i++) {
 		cap_id = caps[i].cap_id;
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
index 0017ade4adbd..3fb90a466a64 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
@@ -1033,8 +1033,8 @@ static int iris_hfi_gen1_session_set_config_params(struct iris_inst *inst, u32 p
 	};
 
 	if (inst->domain == DECODER) {
-		config_params = core->iris_platform_data->dec_input_config_params_default;
-		config_params_size = core->iris_platform_data->dec_input_config_params_default_size;
+		config_params = core->iris_firmware_data->dec_input_config_params_default;
+		config_params_size = core->iris_firmware_data->dec_input_config_params_default_size;
 		if (V4L2_TYPE_IS_OUTPUT(plane)) {
 			handler = vdec_prop_type_handle_inp_arr;
 			handler_size = ARRAY_SIZE(vdec_prop_type_handle_inp_arr);
@@ -1043,8 +1043,8 @@ static int iris_hfi_gen1_session_set_config_params(struct iris_inst *inst, u32 p
 			handler_size = ARRAY_SIZE(vdec_prop_type_handle_out_arr);
 		}
 	} else {
-		config_params = core->iris_platform_data->enc_input_config_params;
-		config_params_size = core->iris_platform_data->enc_input_config_params_size;
+		config_params = core->iris_firmware_data->enc_input_config_params;
+		config_params_size = core->iris_firmware_data->enc_input_config_params_size;
 		handler = venc_prop_type_handle_inp_arr;
 		handler_size = ARRAY_SIZE(venc_prop_type_handle_inp_arr);
 	}
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
index 639b75fca1ab..c90b22a75bc5 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
@@ -601,7 +601,7 @@ static int iris_hfi_gen2_set_super_block(struct iris_inst *inst, u32 plane)
 
 static int iris_hfi_gen2_session_set_config_params(struct iris_inst *inst, u32 plane)
 {
-	const struct iris_platform_data *pdata = inst->core->iris_platform_data;
+	const struct iris_firmware_data *fdata = inst->core->iris_firmware_data;
 	u32 config_params_size = 0, i, j;
 	const u32 *config_params = NULL;
 	int ret;
@@ -630,31 +630,31 @@ static int iris_hfi_gen2_session_set_config_params(struct iris_inst *inst, u32 p
 	if (inst->domain == DECODER) {
 		if (V4L2_TYPE_IS_OUTPUT(plane)) {
 			if (inst->codec == V4L2_PIX_FMT_H264) {
-				config_params = pdata->dec_input_config_params_default;
-				config_params_size = pdata->dec_input_config_params_default_size;
+				config_params = fdata->dec_input_config_params_default;
+				config_params_size = fdata->dec_input_config_params_default_size;
 			} else if (inst->codec == V4L2_PIX_FMT_HEVC) {
-				config_params = pdata->dec_input_config_params_hevc;
-				config_params_size = pdata->dec_input_config_params_hevc_size;
+				config_params = fdata->dec_input_config_params_hevc;
+				config_params_size = fdata->dec_input_config_params_hevc_size;
 			} else if (inst->codec == V4L2_PIX_FMT_VP9) {
-				config_params = pdata->dec_input_config_params_vp9;
-				config_params_size = pdata->dec_input_config_params_vp9_size;
+				config_params = fdata->dec_input_config_params_vp9;
+				config_params_size = fdata->dec_input_config_params_vp9_size;
 			} else if (inst->codec == V4L2_PIX_FMT_AV1) {
-				config_params = pdata->dec_input_config_params_av1;
-				config_params_size = pdata->dec_input_config_params_av1_size;
+				config_params = fdata->dec_input_config_params_av1;
+				config_params_size = fdata->dec_input_config_params_av1_size;
 			} else {
 				return -EINVAL;
 			}
 		} else {
-			config_params = pdata->dec_output_config_params;
-			config_params_size = pdata->dec_output_config_params_size;
+			config_params = fdata->dec_output_config_params;
+			config_params_size = fdata->dec_output_config_params_size;
 		}
 	} else {
 		if (V4L2_TYPE_IS_OUTPUT(plane)) {
-			config_params = pdata->enc_input_config_params;
-			config_params_size = pdata->enc_input_config_params_size;
+			config_params = fdata->enc_input_config_params;
+			config_params_size = fdata->enc_input_config_params_size;
 		} else {
-			config_params = pdata->enc_output_config_params;
-			config_params_size = pdata->enc_output_config_params_size;
+			config_params = fdata->enc_output_config_params;
+			config_params_size = fdata->enc_output_config_params_size;
 		}
 	}
 
@@ -849,24 +849,24 @@ static int iris_hfi_gen2_subscribe_change_param(struct iris_inst *inst, u32 plan
 
 	switch (inst->codec) {
 	case V4L2_PIX_FMT_H264:
-		change_param = core->iris_platform_data->dec_input_config_params_default;
+		change_param = core->iris_firmware_data->dec_input_config_params_default;
 		change_param_size =
-			core->iris_platform_data->dec_input_config_params_default_size;
+			core->iris_firmware_data->dec_input_config_params_default_size;
 		break;
 	case V4L2_PIX_FMT_HEVC:
-		change_param = core->iris_platform_data->dec_input_config_params_hevc;
+		change_param = core->iris_firmware_data->dec_input_config_params_hevc;
 		change_param_size =
-			core->iris_platform_data->dec_input_config_params_hevc_size;
+			core->iris_firmware_data->dec_input_config_params_hevc_size;
 		break;
 	case V4L2_PIX_FMT_VP9:
-		change_param = core->iris_platform_data->dec_input_config_params_vp9;
+		change_param = core->iris_firmware_data->dec_input_config_params_vp9;
 		change_param_size =
-			core->iris_platform_data->dec_input_config_params_vp9_size;
+			core->iris_firmware_data->dec_input_config_params_vp9_size;
 		break;
 	case V4L2_PIX_FMT_AV1:
-		change_param = core->iris_platform_data->dec_input_config_params_av1;
+		change_param = core->iris_firmware_data->dec_input_config_params_av1;
 		change_param_size =
-			core->iris_platform_data->dec_input_config_params_av1_size;
+			core->iris_firmware_data->dec_input_config_params_av1_size;
 		break;
 	}
 
@@ -996,29 +996,29 @@ static int iris_hfi_gen2_subscribe_property(struct iris_inst *inst, u32 plane)
 		return 0;
 
 	if (V4L2_TYPE_IS_OUTPUT(plane)) {
-		subscribe_prop_size = core->iris_platform_data->dec_input_prop_size;
-		subcribe_prop = core->iris_platform_data->dec_input_prop;
+		subscribe_prop_size = core->iris_firmware_data->dec_input_prop_size;
+		subcribe_prop = core->iris_firmware_data->dec_input_prop;
 	} else {
 		switch (inst->codec) {
 		case V4L2_PIX_FMT_H264:
-			subcribe_prop = core->iris_platform_data->dec_output_prop_avc;
+			subcribe_prop = core->iris_firmware_data->dec_output_prop_avc;
 			subscribe_prop_size =
-				core->iris_platform_data->dec_output_prop_avc_size;
+				core->iris_firmware_data->dec_output_prop_avc_size;
 			break;
 		case V4L2_PIX_FMT_HEVC:
-			subcribe_prop = core->iris_platform_data->dec_output_prop_hevc;
+			subcribe_prop = core->iris_firmware_data->dec_output_prop_hevc;
 			subscribe_prop_size =
-				core->iris_platform_data->dec_output_prop_hevc_size;
+				core->iris_firmware_data->dec_output_prop_hevc_size;
 			break;
 		case V4L2_PIX_FMT_VP9:
-			subcribe_prop = core->iris_platform_data->dec_output_prop_vp9;
+			subcribe_prop = core->iris_firmware_data->dec_output_prop_vp9;
 			subscribe_prop_size =
-				core->iris_platform_data->dec_output_prop_vp9_size;
+				core->iris_firmware_data->dec_output_prop_vp9_size;
 			break;
 		case V4L2_PIX_FMT_AV1:
-			subcribe_prop = core->iris_platform_data->dec_output_prop_av1;
+			subcribe_prop = core->iris_firmware_data->dec_output_prop_av1;
 			subscribe_prop_size =
-				core->iris_platform_data->dec_output_prop_av1_size;
+				core->iris_firmware_data->dec_output_prop_av1_size;
 			break;
 		}
 	}
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index d1daef2d874b..401069bd7396 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -201,45 +201,14 @@ enum platform_pm_domain_type {
 	IRIS_APV_HW_POWER_DOMAIN,
 };
 
-struct iris_platform_data {
+struct iris_firmware_data {
 	void (*init_hfi_ops)(struct iris_core *core);
-	u32 (*get_vpu_buffer_size)(struct iris_inst *inst, enum iris_buffer_type buffer_type);
-	const struct vpu_ops *vpu_ops;
-	const struct icc_info *icc_tbl;
-	unsigned int icc_tbl_size;
-	const struct bw_info *bw_tbl_dec;
-	unsigned int bw_tbl_dec_size;
-	const char * const *pmdomain_tbl;
-	unsigned int pmdomain_tbl_size;
-	const char * const *opp_pd_tbl;
-	unsigned int opp_pd_tbl_size;
-	const struct platform_clk_data *clk_tbl;
-	const char * const *opp_clk_tbl;
-	unsigned int clk_tbl_size;
-	const char * const *clk_rst_tbl;
-	unsigned int clk_rst_tbl_size;
-	const char * const *controller_rst_tbl;
-	unsigned int controller_rst_tbl_size;
-	u64 dma_mask;
-	const char *fwname;
-	struct iris_fmt *inst_iris_fmts;
-	u32 inst_iris_fmts_size;
-	struct platform_inst_caps *inst_caps;
+
 	const struct platform_inst_fw_cap *inst_fw_caps_dec;
 	u32 inst_fw_caps_dec_size;
 	const struct platform_inst_fw_cap *inst_fw_caps_enc;
 	u32 inst_fw_caps_enc_size;
-	const struct tz_cp_config *tz_cp_config_data;
-	u32 tz_cp_config_data_size;
-	u32 core_arch;
-	u32 hw_response_timeout;
-	u32 num_vpp_pipe;
-	bool no_aon;
-	u32 max_session_count;
-	/* max number of macroblocks per frame supported */
-	u32 max_core_mbpf;
-	/* max number of macroblocks per second supported */
-	u32 max_core_mbps;
+
 	const u32 *dec_input_config_params_default;
 	unsigned int dec_input_config_params_default_size;
 	const u32 *dec_input_config_params_hevc;
@@ -254,6 +223,7 @@ struct iris_platform_data {
 	unsigned int enc_input_config_params_size;
 	const u32 *enc_output_config_params;
 	unsigned int enc_output_config_params_size;
+
 	const u32 *dec_input_prop;
 	unsigned int dec_input_prop_size;
 	const u32 *dec_output_prop_avc;
@@ -264,6 +234,7 @@ struct iris_platform_data {
 	unsigned int dec_output_prop_vp9_size;
 	const u32 *dec_output_prop_av1;
 	unsigned int dec_output_prop_av1_size;
+
 	const u32 *dec_ip_int_buf_tbl;
 	unsigned int dec_ip_int_buf_tbl_size;
 	const u32 *dec_op_int_buf_tbl;
@@ -274,4 +245,47 @@ struct iris_platform_data {
 	unsigned int enc_op_int_buf_tbl_size;
 };
 
+struct iris_platform_data {
+	/*
+	 * XXX: remove firmware_data pointer and consider moving
+	 * get_vpu_buffer_size pointer once we have platforms supporting both
+	 * firmware kinds.
+	 */
+	const struct iris_firmware_data *firmware_data;
+	u32 (*get_vpu_buffer_size)(struct iris_inst *inst, enum iris_buffer_type buffer_type);
+
+	const struct vpu_ops *vpu_ops;
+	const struct icc_info *icc_tbl;
+	unsigned int icc_tbl_size;
+	const struct bw_info *bw_tbl_dec;
+	unsigned int bw_tbl_dec_size;
+	const char * const *pmdomain_tbl;
+	unsigned int pmdomain_tbl_size;
+	const char * const *opp_pd_tbl;
+	unsigned int opp_pd_tbl_size;
+	const struct platform_clk_data *clk_tbl;
+	const char * const *opp_clk_tbl;
+	unsigned int clk_tbl_size;
+	const char * const *clk_rst_tbl;
+	unsigned int clk_rst_tbl_size;
+	const char * const *controller_rst_tbl;
+	unsigned int controller_rst_tbl_size;
+	u64 dma_mask;
+	const char *fwname;
+	struct iris_fmt *inst_iris_fmts;
+	u32 inst_iris_fmts_size;
+	struct platform_inst_caps *inst_caps;
+	const struct tz_cp_config *tz_cp_config_data;
+	u32 tz_cp_config_data_size;
+	u32 core_arch;
+	u32 hw_response_timeout;
+	u32 num_vpp_pipe;
+	bool no_aon;
+	u32 max_session_count;
+	/* max number of macroblocks per frame supported */
+	u32 max_core_mbpf;
+	/* max number of macroblocks per second supported */
+	u32 max_core_mbps;
+};
+
 #endif
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen1.c b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
index 9925a893b404..b2d18459a811 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen1.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
@@ -332,8 +332,33 @@ static const u32 sm8250_enc_ip_int_buf_tbl[] = {
 	BUF_SCRATCH_2,
 };
 
-const struct iris_platform_data sm8250_data = {
+const struct iris_firmware_data iris_hfi_gen1_data = {
 	.init_hfi_ops = &iris_hfi_gen1_sys_ops_init,
+
+	.inst_fw_caps_dec = inst_fw_cap_sm8250_dec,
+	.inst_fw_caps_dec_size = ARRAY_SIZE(inst_fw_cap_sm8250_dec),
+	.inst_fw_caps_enc = inst_fw_cap_sm8250_enc,
+	.inst_fw_caps_enc_size = ARRAY_SIZE(inst_fw_cap_sm8250_enc),
+
+	.dec_input_config_params_default =
+		sm8250_vdec_input_config_param_default,
+	.dec_input_config_params_default_size =
+		ARRAY_SIZE(sm8250_vdec_input_config_param_default),
+	.enc_input_config_params = sm8250_venc_input_config_param,
+	.enc_input_config_params_size =
+		ARRAY_SIZE(sm8250_venc_input_config_param),
+
+	.dec_ip_int_buf_tbl = sm8250_dec_ip_int_buf_tbl,
+	.dec_ip_int_buf_tbl_size = ARRAY_SIZE(sm8250_dec_ip_int_buf_tbl),
+	.dec_op_int_buf_tbl = sm8250_dec_op_int_buf_tbl,
+	.dec_op_int_buf_tbl_size = ARRAY_SIZE(sm8250_dec_op_int_buf_tbl),
+
+	.enc_ip_int_buf_tbl = sm8250_enc_ip_int_buf_tbl,
+	.enc_ip_int_buf_tbl_size = ARRAY_SIZE(sm8250_enc_ip_int_buf_tbl),
+};
+
+const struct iris_platform_data sm8250_data = {
+	.firmware_data = &iris_hfi_gen1_data,
 	.get_vpu_buffer_size = iris_vpu_buf_size,
 	.vpu_ops = &iris_vpu2_ops,
 	.icc_tbl = sm8250_icc_table,
@@ -355,10 +380,6 @@ const struct iris_platform_data sm8250_data = {
 	.inst_iris_fmts = platform_fmts_sm8250_dec,
 	.inst_iris_fmts_size = ARRAY_SIZE(platform_fmts_sm8250_dec),
 	.inst_caps = &platform_inst_cap_sm8250,
-	.inst_fw_caps_dec = inst_fw_cap_sm8250_dec,
-	.inst_fw_caps_dec_size = ARRAY_SIZE(inst_fw_cap_sm8250_dec),
-	.inst_fw_caps_enc = inst_fw_cap_sm8250_enc,
-	.inst_fw_caps_enc_size = ARRAY_SIZE(inst_fw_cap_sm8250_enc),
 	.tz_cp_config_data = tz_cp_config_sm8250,
 	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_sm8250),
 	.hw_response_timeout = HW_RESPONSE_TIMEOUT_VALUE,
@@ -366,25 +387,10 @@ const struct iris_platform_data sm8250_data = {
 	.max_session_count = 16,
 	.max_core_mbpf = NUM_MBS_8K,
 	.max_core_mbps = ((7680 * 4320) / 256) * 60,
-	.dec_input_config_params_default =
-		sm8250_vdec_input_config_param_default,
-	.dec_input_config_params_default_size =
-		ARRAY_SIZE(sm8250_vdec_input_config_param_default),
-	.enc_input_config_params = sm8250_venc_input_config_param,
-	.enc_input_config_params_size =
-		ARRAY_SIZE(sm8250_venc_input_config_param),
-
-	.dec_ip_int_buf_tbl = sm8250_dec_ip_int_buf_tbl,
-	.dec_ip_int_buf_tbl_size = ARRAY_SIZE(sm8250_dec_ip_int_buf_tbl),
-	.dec_op_int_buf_tbl = sm8250_dec_op_int_buf_tbl,
-	.dec_op_int_buf_tbl_size = ARRAY_SIZE(sm8250_dec_op_int_buf_tbl),
-
-	.enc_ip_int_buf_tbl = sm8250_enc_ip_int_buf_tbl,
-	.enc_ip_int_buf_tbl_size = ARRAY_SIZE(sm8250_enc_ip_int_buf_tbl),
 };
 
 const struct iris_platform_data sc7280_data = {
-	.init_hfi_ops = &iris_hfi_gen1_sys_ops_init,
+	.firmware_data = &iris_hfi_gen1_data,
 	.get_vpu_buffer_size = iris_vpu_buf_size,
 	.vpu_ops = &iris_vpu2_ops,
 	.icc_tbl = sm8250_icc_table,
@@ -404,10 +410,6 @@ const struct iris_platform_data sc7280_data = {
 	.inst_iris_fmts = platform_fmts_sm8250_dec,
 	.inst_iris_fmts_size = ARRAY_SIZE(platform_fmts_sm8250_dec),
 	.inst_caps = &platform_inst_cap_sm8250,
-	.inst_fw_caps_dec = inst_fw_cap_sm8250_dec,
-	.inst_fw_caps_dec_size = ARRAY_SIZE(inst_fw_cap_sm8250_dec),
-	.inst_fw_caps_enc = inst_fw_cap_sm8250_enc,
-	.inst_fw_caps_enc_size = ARRAY_SIZE(inst_fw_cap_sm8250_enc),
 	.tz_cp_config_data = tz_cp_config_sm8250,
 	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_sm8250),
 	.hw_response_timeout = HW_RESPONSE_TIMEOUT_VALUE,
@@ -417,19 +419,4 @@ const struct iris_platform_data sc7280_data = {
 	.max_core_mbpf = 4096 * 2176 / 256 * 2 + 1920 * 1088 / 256,
 	/* max spec for SC7280 is 4096x2176@60fps */
 	.max_core_mbps = 4096 * 2176 / 256 * 60,
-	.dec_input_config_params_default =
-		sm8250_vdec_input_config_param_default,
-	.dec_input_config_params_default_size =
-		ARRAY_SIZE(sm8250_vdec_input_config_param_default),
-	.enc_input_config_params = sm8250_venc_input_config_param,
-	.enc_input_config_params_size =
-		ARRAY_SIZE(sm8250_venc_input_config_param),
-
-	.dec_ip_int_buf_tbl = sm8250_dec_ip_int_buf_tbl,
-	.dec_ip_int_buf_tbl_size = ARRAY_SIZE(sm8250_dec_ip_int_buf_tbl),
-	.dec_op_int_buf_tbl = sm8250_dec_op_int_buf_tbl,
-	.dec_op_int_buf_tbl_size = ARRAY_SIZE(sm8250_dec_op_int_buf_tbl),
-
-	.enc_ip_int_buf_tbl = sm8250_enc_ip_int_buf_tbl,
-	.enc_ip_int_buf_tbl_size = ARRAY_SIZE(sm8250_enc_ip_int_buf_tbl),
 };
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
index 10a972f96cbe..1a54a9a96285 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
@@ -906,41 +906,14 @@ static const u32 sm8550_enc_op_int_buf_tbl[] = {
 	BUF_SCRATCH_2,
 };
 
-const struct iris_platform_data sm8550_data = {
+const struct iris_firmware_data iris_hfi_gen2_data = {
 	.init_hfi_ops = iris_hfi_gen2_sys_ops_init,
-	.get_vpu_buffer_size = iris_vpu_buf_size,
-	.vpu_ops = &iris_vpu3_ops,
-	.icc_tbl = sm8550_icc_table,
-	.icc_tbl_size = ARRAY_SIZE(sm8550_icc_table),
-	.clk_rst_tbl = sm8550_clk_reset_table,
-	.clk_rst_tbl_size = ARRAY_SIZE(sm8550_clk_reset_table),
-	.bw_tbl_dec = sm8550_bw_table_dec,
-	.bw_tbl_dec_size = ARRAY_SIZE(sm8550_bw_table_dec),
-	.pmdomain_tbl = sm8550_pmdomain_table,
-	.pmdomain_tbl_size = ARRAY_SIZE(sm8550_pmdomain_table),
-	.opp_pd_tbl = sm8550_opp_pd_table,
-	.opp_pd_tbl_size = ARRAY_SIZE(sm8550_opp_pd_table),
-	.clk_tbl = sm8550_clk_table,
-	.clk_tbl_size = ARRAY_SIZE(sm8550_clk_table),
-	.opp_clk_tbl = sm8550_opp_clk_table,
-	/* Upper bound of DMA address range */
-	.dma_mask = 0xe0000000 - 1,
-	.fwname = "qcom/vpu/vpu30_p4.mbn",
-	.inst_iris_fmts = platform_fmts_sm8550_dec,
-	.inst_iris_fmts_size = ARRAY_SIZE(platform_fmts_sm8550_dec),
-	.inst_caps = &platform_inst_cap_sm8550,
+
 	.inst_fw_caps_dec = inst_fw_cap_sm8550_dec,
 	.inst_fw_caps_dec_size = ARRAY_SIZE(inst_fw_cap_sm8550_dec),
 	.inst_fw_caps_enc = inst_fw_cap_sm8550_enc,
 	.inst_fw_caps_enc_size = ARRAY_SIZE(inst_fw_cap_sm8550_enc),
-	.tz_cp_config_data = tz_cp_config_sm8550,
-	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_sm8550),
-	.core_arch = VIDEO_ARCH_LX,
-	.hw_response_timeout = HW_RESPONSE_TIMEOUT_VALUE,
-	.num_vpp_pipe = 4,
-	.max_session_count = 16,
-	.max_core_mbpf = NUM_MBS_8K * 2,
-	.max_core_mbps = ((7680 * 4320) / 256) * 60,
+
 	.dec_input_config_params_default =
 		sm8550_vdec_input_config_params_default,
 	.dec_input_config_params_default_size =
@@ -997,6 +970,39 @@ const struct iris_platform_data sm8550_data = {
 	.enc_op_int_buf_tbl_size = ARRAY_SIZE(sm8550_enc_op_int_buf_tbl),
 };
 
+const struct iris_platform_data sm8550_data = {
+	.firmware_data = &iris_hfi_gen2_data,
+	.get_vpu_buffer_size = iris_vpu_buf_size,
+	.vpu_ops = &iris_vpu3_ops,
+	.icc_tbl = sm8550_icc_table,
+	.icc_tbl_size = ARRAY_SIZE(sm8550_icc_table),
+	.clk_rst_tbl = sm8550_clk_reset_table,
+	.clk_rst_tbl_size = ARRAY_SIZE(sm8550_clk_reset_table),
+	.bw_tbl_dec = sm8550_bw_table_dec,
+	.bw_tbl_dec_size = ARRAY_SIZE(sm8550_bw_table_dec),
+	.pmdomain_tbl = sm8550_pmdomain_table,
+	.pmdomain_tbl_size = ARRAY_SIZE(sm8550_pmdomain_table),
+	.opp_pd_tbl = sm8550_opp_pd_table,
+	.opp_pd_tbl_size = ARRAY_SIZE(sm8550_opp_pd_table),
+	.clk_tbl = sm8550_clk_table,
+	.clk_tbl_size = ARRAY_SIZE(sm8550_clk_table),
+	.opp_clk_tbl = sm8550_opp_clk_table,
+	/* Upper bound of DMA address range */
+	.dma_mask = 0xe0000000 - 1,
+	.fwname = "qcom/vpu/vpu30_p4.mbn",
+	.inst_iris_fmts = platform_fmts_sm8550_dec,
+	.inst_iris_fmts_size = ARRAY_SIZE(platform_fmts_sm8550_dec),
+	.inst_caps = &platform_inst_cap_sm8550,
+	.tz_cp_config_data = tz_cp_config_sm8550,
+	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_sm8550),
+	.core_arch = VIDEO_ARCH_LX,
+	.hw_response_timeout = HW_RESPONSE_TIMEOUT_VALUE,
+	.num_vpp_pipe = 4,
+	.max_session_count = 16,
+	.max_core_mbpf = NUM_MBS_8K * 2,
+	.max_core_mbps = ((7680 * 4320) / 256) * 60,
+};
+
 /*
  * Shares most of SM8550 data except:
  * - vpu_ops to iris_vpu33_ops
@@ -1005,7 +1011,7 @@ const struct iris_platform_data sm8550_data = {
  * - fwname to "qcom/vpu/vpu33_p4.mbn"
  */
 const struct iris_platform_data sm8650_data = {
-	.init_hfi_ops = iris_hfi_gen2_sys_ops_init,
+	.firmware_data = &iris_hfi_gen2_data,
 	.get_vpu_buffer_size = iris_vpu33_buf_size,
 	.vpu_ops = &iris_vpu33_ops,
 	.icc_tbl = sm8550_icc_table,
@@ -1029,10 +1035,6 @@ const struct iris_platform_data sm8650_data = {
 	.inst_iris_fmts = platform_fmts_sm8550_dec,
 	.inst_iris_fmts_size = ARRAY_SIZE(platform_fmts_sm8550_dec),
 	.inst_caps = &platform_inst_cap_sm8550,
-	.inst_fw_caps_dec = inst_fw_cap_sm8550_dec,
-	.inst_fw_caps_dec_size = ARRAY_SIZE(inst_fw_cap_sm8550_dec),
-	.inst_fw_caps_enc = inst_fw_cap_sm8550_enc,
-	.inst_fw_caps_enc_size = ARRAY_SIZE(inst_fw_cap_sm8550_enc),
 	.tz_cp_config_data = tz_cp_config_sm8550,
 	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_sm8550),
 	.core_arch = VIDEO_ARCH_LX,
@@ -1041,64 +1043,10 @@ const struct iris_platform_data sm8650_data = {
 	.max_session_count = 16,
 	.max_core_mbpf = NUM_MBS_8K * 2,
 	.max_core_mbps = ((7680 * 4320) / 256) * 60,
-	.dec_input_config_params_default =
-		sm8550_vdec_input_config_params_default,
-	.dec_input_config_params_default_size =
-		ARRAY_SIZE(sm8550_vdec_input_config_params_default),
-	.dec_input_config_params_hevc =
-		sm8550_vdec_input_config_param_hevc,
-	.dec_input_config_params_hevc_size =
-		ARRAY_SIZE(sm8550_vdec_input_config_param_hevc),
-	.dec_input_config_params_vp9 =
-		sm8550_vdec_input_config_param_vp9,
-	.dec_input_config_params_vp9_size =
-		ARRAY_SIZE(sm8550_vdec_input_config_param_vp9),
-	.dec_input_config_params_av1 =
-		sm8550_vdec_input_config_param_av1,
-	.dec_input_config_params_av1_size =
-		ARRAY_SIZE(sm8550_vdec_input_config_param_av1),
-	.dec_output_config_params =
-		sm8550_vdec_output_config_params,
-	.dec_output_config_params_size =
-		ARRAY_SIZE(sm8550_vdec_output_config_params),
-
-	.enc_input_config_params =
-		sm8550_venc_input_config_params,
-	.enc_input_config_params_size =
-		ARRAY_SIZE(sm8550_venc_input_config_params),
-	.enc_output_config_params =
-		sm8550_venc_output_config_params,
-	.enc_output_config_params_size =
-		ARRAY_SIZE(sm8550_venc_output_config_params),
-
-	.dec_input_prop = sm8550_vdec_subscribe_input_properties,
-	.dec_input_prop_size = ARRAY_SIZE(sm8550_vdec_subscribe_input_properties),
-	.dec_output_prop_avc = sm8550_vdec_subscribe_output_properties_avc,
-	.dec_output_prop_avc_size =
-		ARRAY_SIZE(sm8550_vdec_subscribe_output_properties_avc),
-	.dec_output_prop_hevc = sm8550_vdec_subscribe_output_properties_hevc,
-	.dec_output_prop_hevc_size =
-		ARRAY_SIZE(sm8550_vdec_subscribe_output_properties_hevc),
-	.dec_output_prop_vp9 = sm8550_vdec_subscribe_output_properties_vp9,
-	.dec_output_prop_vp9_size =
-		ARRAY_SIZE(sm8550_vdec_subscribe_output_properties_vp9),
-	.dec_output_prop_av1 = sm8550_vdec_subscribe_output_properties_av1,
-	.dec_output_prop_av1_size =
-		ARRAY_SIZE(sm8550_vdec_subscribe_output_properties_av1),
-
-	.dec_ip_int_buf_tbl = sm8550_dec_ip_int_buf_tbl,
-	.dec_ip_int_buf_tbl_size = ARRAY_SIZE(sm8550_dec_ip_int_buf_tbl),
-	.dec_op_int_buf_tbl = sm8550_dec_op_int_buf_tbl,
-	.dec_op_int_buf_tbl_size = ARRAY_SIZE(sm8550_dec_op_int_buf_tbl),
-
-	.enc_ip_int_buf_tbl = sm8550_enc_ip_int_buf_tbl,
-	.enc_ip_int_buf_tbl_size = ARRAY_SIZE(sm8550_enc_ip_int_buf_tbl),
-	.enc_op_int_buf_tbl = sm8550_enc_op_int_buf_tbl,
-	.enc_op_int_buf_tbl_size = ARRAY_SIZE(sm8550_enc_op_int_buf_tbl),
 };
 
 const struct iris_platform_data sm8750_data = {
-	.init_hfi_ops = iris_hfi_gen2_sys_ops_init,
+	.firmware_data = &iris_hfi_gen2_data,
 	.get_vpu_buffer_size = iris_vpu33_buf_size,
 	.vpu_ops = &iris_vpu35_ops,
 	.icc_tbl = sm8550_icc_table,
@@ -1120,10 +1068,6 @@ const struct iris_platform_data sm8750_data = {
 	.inst_iris_fmts = platform_fmts_sm8550_dec,
 	.inst_iris_fmts_size = ARRAY_SIZE(platform_fmts_sm8550_dec),
 	.inst_caps = &platform_inst_cap_sm8550,
-	.inst_fw_caps_dec = inst_fw_cap_sm8550_dec,
-	.inst_fw_caps_dec_size = ARRAY_SIZE(inst_fw_cap_sm8550_dec),
-	.inst_fw_caps_enc = inst_fw_cap_sm8550_enc,
-	.inst_fw_caps_enc_size = ARRAY_SIZE(inst_fw_cap_sm8550_enc),
 	.tz_cp_config_data = tz_cp_config_sm8550,
 	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_sm8550),
 	.core_arch = VIDEO_ARCH_LX,
@@ -1132,60 +1076,6 @@ const struct iris_platform_data sm8750_data = {
 	.max_session_count = 16,
 	.max_core_mbpf = NUM_MBS_8K * 2,
 	.max_core_mbps = ((7680 * 4320) / 256) * 60,
-	.dec_input_config_params_default =
-		sm8550_vdec_input_config_params_default,
-	.dec_input_config_params_default_size =
-		ARRAY_SIZE(sm8550_vdec_input_config_params_default),
-	.dec_input_config_params_hevc =
-		sm8550_vdec_input_config_param_hevc,
-	.dec_input_config_params_hevc_size =
-		ARRAY_SIZE(sm8550_vdec_input_config_param_hevc),
-	.dec_input_config_params_vp9 =
-		sm8550_vdec_input_config_param_vp9,
-	.dec_input_config_params_vp9_size =
-		ARRAY_SIZE(sm8550_vdec_input_config_param_vp9),
-	.dec_input_config_params_av1 =
-		sm8550_vdec_input_config_param_av1,
-	.dec_input_config_params_av1_size =
-		ARRAY_SIZE(sm8550_vdec_input_config_param_av1),
-	.dec_output_config_params =
-		sm8550_vdec_output_config_params,
-	.dec_output_config_params_size =
-		ARRAY_SIZE(sm8550_vdec_output_config_params),
-
-	.enc_input_config_params =
-		sm8550_venc_input_config_params,
-	.enc_input_config_params_size =
-		ARRAY_SIZE(sm8550_venc_input_config_params),
-	.enc_output_config_params =
-		sm8550_venc_output_config_params,
-	.enc_output_config_params_size =
-		ARRAY_SIZE(sm8550_venc_output_config_params),
-
-	.dec_input_prop = sm8550_vdec_subscribe_input_properties,
-	.dec_input_prop_size = ARRAY_SIZE(sm8550_vdec_subscribe_input_properties),
-	.dec_output_prop_avc = sm8550_vdec_subscribe_output_properties_avc,
-	.dec_output_prop_avc_size =
-		ARRAY_SIZE(sm8550_vdec_subscribe_output_properties_avc),
-	.dec_output_prop_hevc = sm8550_vdec_subscribe_output_properties_hevc,
-	.dec_output_prop_hevc_size =
-		ARRAY_SIZE(sm8550_vdec_subscribe_output_properties_hevc),
-	.dec_output_prop_vp9 = sm8550_vdec_subscribe_output_properties_vp9,
-	.dec_output_prop_vp9_size =
-		ARRAY_SIZE(sm8550_vdec_subscribe_output_properties_vp9),
-	.dec_output_prop_av1 = sm8550_vdec_subscribe_output_properties_av1,
-	.dec_output_prop_av1_size =
-		ARRAY_SIZE(sm8550_vdec_subscribe_output_properties_av1),
-
-	.dec_ip_int_buf_tbl = sm8550_dec_ip_int_buf_tbl,
-	.dec_ip_int_buf_tbl_size = ARRAY_SIZE(sm8550_dec_ip_int_buf_tbl),
-	.dec_op_int_buf_tbl = sm8550_dec_op_int_buf_tbl,
-	.dec_op_int_buf_tbl_size = ARRAY_SIZE(sm8550_dec_op_int_buf_tbl),
-
-	.enc_ip_int_buf_tbl = sm8550_enc_ip_int_buf_tbl,
-	.enc_ip_int_buf_tbl_size = ARRAY_SIZE(sm8550_enc_ip_int_buf_tbl),
-	.enc_op_int_buf_tbl = sm8550_enc_op_int_buf_tbl,
-	.enc_op_int_buf_tbl_size = ARRAY_SIZE(sm8550_enc_op_int_buf_tbl),
 };
 
 /*
@@ -1193,7 +1083,7 @@ const struct iris_platform_data sm8750_data = {
  * - inst_caps to platform_inst_cap_qcs8300
  */
 const struct iris_platform_data qcs8300_data = {
-	.init_hfi_ops = iris_hfi_gen2_sys_ops_init,
+	.firmware_data = &iris_hfi_gen2_data,
 	.get_vpu_buffer_size = iris_vpu_buf_size,
 	.vpu_ops = &iris_vpu3_ops,
 	.icc_tbl = sm8550_icc_table,
@@ -1215,10 +1105,6 @@ const struct iris_platform_data qcs8300_data = {
 	.inst_iris_fmts = platform_fmts_sm8550_dec,
 	.inst_iris_fmts_size = ARRAY_SIZE(platform_fmts_sm8550_dec),
 	.inst_caps = &platform_inst_cap_qcs8300,
-	.inst_fw_caps_dec = inst_fw_cap_sm8550_dec,
-	.inst_fw_caps_dec_size = ARRAY_SIZE(inst_fw_cap_sm8550_dec),
-	.inst_fw_caps_enc = inst_fw_cap_sm8550_enc,
-	.inst_fw_caps_enc_size = ARRAY_SIZE(inst_fw_cap_sm8550_enc),
 	.tz_cp_config_data = tz_cp_config_sm8550,
 	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_sm8550),
 	.core_arch = VIDEO_ARCH_LX,
@@ -1227,58 +1113,4 @@ const struct iris_platform_data qcs8300_data = {
 	.max_session_count = 16,
 	.max_core_mbpf = ((4096 * 2176) / 256) * 4,
 	.max_core_mbps = (((3840 * 2176) / 256) * 120),
-	.dec_input_config_params_default =
-		sm8550_vdec_input_config_params_default,
-	.dec_input_config_params_default_size =
-		ARRAY_SIZE(sm8550_vdec_input_config_params_default),
-	.dec_input_config_params_hevc =
-		sm8550_vdec_input_config_param_hevc,
-	.dec_input_config_params_hevc_size =
-		ARRAY_SIZE(sm8550_vdec_input_config_param_hevc),
-	.dec_input_config_params_vp9 =
-		sm8550_vdec_input_config_param_vp9,
-	.dec_input_config_params_vp9_size =
-		ARRAY_SIZE(sm8550_vdec_input_config_param_vp9),
-	.dec_input_config_params_av1 =
-		sm8550_vdec_input_config_param_av1,
-	.dec_input_config_params_av1_size =
-		ARRAY_SIZE(sm8550_vdec_input_config_param_av1),
-	.dec_output_config_params =
-		sm8550_vdec_output_config_params,
-	.dec_output_config_params_size =
-		ARRAY_SIZE(sm8550_vdec_output_config_params),
-
-	.enc_input_config_params =
-		sm8550_venc_input_config_params,
-	.enc_input_config_params_size =
-		ARRAY_SIZE(sm8550_venc_input_config_params),
-	.enc_output_config_params =
-		sm8550_venc_output_config_params,
-	.enc_output_config_params_size =
-		ARRAY_SIZE(sm8550_venc_output_config_params),
-
-	.dec_input_prop = sm8550_vdec_subscribe_input_properties,
-	.dec_input_prop_size = ARRAY_SIZE(sm8550_vdec_subscribe_input_properties),
-	.dec_output_prop_avc = sm8550_vdec_subscribe_output_properties_avc,
-	.dec_output_prop_avc_size =
-		ARRAY_SIZE(sm8550_vdec_subscribe_output_properties_avc),
-	.dec_output_prop_hevc = sm8550_vdec_subscribe_output_properties_hevc,
-	.dec_output_prop_hevc_size =
-		ARRAY_SIZE(sm8550_vdec_subscribe_output_properties_hevc),
-	.dec_output_prop_vp9 = sm8550_vdec_subscribe_output_properties_vp9,
-	.dec_output_prop_vp9_size =
-		ARRAY_SIZE(sm8550_vdec_subscribe_output_properties_vp9),
-	.dec_output_prop_av1 = sm8550_vdec_subscribe_output_properties_av1,
-	.dec_output_prop_av1_size =
-		ARRAY_SIZE(sm8550_vdec_subscribe_output_properties_av1),
-
-	.dec_ip_int_buf_tbl = sm8550_dec_ip_int_buf_tbl,
-	.dec_ip_int_buf_tbl_size = ARRAY_SIZE(sm8550_dec_ip_int_buf_tbl),
-	.dec_op_int_buf_tbl = sm8550_dec_op_int_buf_tbl,
-	.dec_op_int_buf_tbl_size = ARRAY_SIZE(sm8550_dec_op_int_buf_tbl),
-
-	.enc_ip_int_buf_tbl = sm8550_enc_ip_int_buf_tbl,
-	.enc_ip_int_buf_tbl_size = ARRAY_SIZE(sm8550_enc_ip_int_buf_tbl),
-	.enc_op_int_buf_tbl = sm8550_enc_op_int_buf_tbl,
-	.enc_op_int_buf_tbl_size = ARRAY_SIZE(sm8550_enc_op_int_buf_tbl),
 };
diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
index fa561f6a736c..dd87504c2e67 100644
--- a/drivers/media/platform/qcom/iris/iris_probe.c
+++ b/drivers/media/platform/qcom/iris/iris_probe.c
@@ -251,6 +251,7 @@ static int iris_probe(struct platform_device *pdev)
 		return core->irq;
 
 	core->iris_platform_data = of_device_get_match_data(core->dev);
+	core->iris_firmware_data = core->iris_platform_data->firmware_data;
 
 	core->ubwc_cfg = qcom_ubwc_config_get_data();
 	if (IS_ERR(core->ubwc_cfg))
@@ -264,7 +265,7 @@ static int iris_probe(struct platform_device *pdev)
 	disable_irq_nosync(core->irq);
 
 	iris_init_ops(core);
-	core->iris_platform_data->init_hfi_ops(core);
+	core->iris_firmware_data->init_hfi_ops(core);
 
 	ret = iris_init_resources(core);
 	if (ret)
diff --git a/drivers/media/platform/qcom/iris/iris_vidc.c b/drivers/media/platform/qcom/iris/iris_vidc.c
index ecd8a20fedbf..807c9a20b6ba 100644
--- a/drivers/media/platform/qcom/iris/iris_vidc.c
+++ b/drivers/media/platform/qcom/iris/iris_vidc.c
@@ -243,7 +243,7 @@ static void iris_session_close(struct iris_inst *inst)
 
 static void iris_check_num_queued_internal_buffers(struct iris_inst *inst, u32 plane)
 {
-	const struct iris_platform_data *platform_data = inst->core->iris_platform_data;
+	const struct iris_firmware_data *firmware_data = inst->core->iris_firmware_data;
 	struct iris_buffer *buf, *next;
 	struct iris_buffers *buffers;
 	const u32 *internal_buf_type;
@@ -251,11 +251,11 @@ static void iris_check_num_queued_internal_buffers(struct iris_inst *inst, u32 p
 	u32 count = 0;
 
 	if (V4L2_TYPE_IS_OUTPUT(plane)) {
-		internal_buf_type = platform_data->dec_ip_int_buf_tbl;
-		internal_buffer_count = platform_data->dec_ip_int_buf_tbl_size;
+		internal_buf_type = firmware_data->dec_ip_int_buf_tbl;
+		internal_buffer_count = firmware_data->dec_ip_int_buf_tbl_size;
 	} else {
-		internal_buf_type = platform_data->dec_op_int_buf_tbl;
-		internal_buffer_count = platform_data->dec_op_int_buf_tbl_size;
+		internal_buf_type = firmware_data->dec_op_int_buf_tbl;
+		internal_buffer_count = firmware_data->dec_op_int_buf_tbl_size;
 	}
 
 	for (i = 0; i < internal_buffer_count; i++) {

-- 
2.47.3


