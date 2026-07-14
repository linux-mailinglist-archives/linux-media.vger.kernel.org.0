Return-Path: <linux-media+bounces-67588-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 7zlcHpOIVmrP8QAAu9opvQ
	(envelope-from <linux-media+bounces-67588-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 14 Jul 2026 21:05:55 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CF24B75817D
	for <lists+linux-media@lfdr.de>; Tue, 14 Jul 2026 21:05:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=ntLDKs2f;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=P05NHPSe;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67588-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67588-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2FCDF3224607
	for <lists+linux-media@lfdr.de>; Tue, 14 Jul 2026 19:01:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B47C241A910;
	Tue, 14 Jul 2026 19:01:03 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 736F6352000
	for <linux-media@vger.kernel.org>; Tue, 14 Jul 2026 19:00:33 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784055663; cv=none; b=JrXf2HGctjN42FLmeShZVeOP35yrBXo11ZfaIKT24T3Dlgqt4+MqNx24Aophp7iYBZ5kgTaBvM7X7lCGZ1CVPCiVsiXXTKtL/QvPoZsbDu9gQzKfhUfKx02H/+XR8xG/TpHf5NNbNsGO/0Pqr4GROPHz9Mo+xXDgNH6+7IF2hY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784055663; c=relaxed/simple;
	bh=Vs+Xz11NwshWpusj/GLSlzFZoBVvFw1FfW1E2XVtmFM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FI3CKM++OR0FbY6wk/Ev2u8PCv2lS1aQ7xRliU8hXoB6QEtHj4dawu78cPYCnpYyAXnXwzsE/dwenTKmknodpqdk51Bnz4Q9OvFtzd960spbiLJpEqw5YfrkRkd9a1jdXLr2a6LdYbefwFU5n0OXHqJnqr5eO6endayGT+ilSyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ntLDKs2f; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P05NHPSe; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66EIwCBG1448533
	for <linux-media@vger.kernel.org>; Tue, 14 Jul 2026 19:00:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VuN2KvyH7xNc5tPonuLvz3YrBSAEUeGAvGNJm5LjkOI=; b=ntLDKs2fRXparKR2
	TbBIBJctpv0kyLtpgdMby49/G1OHbCsXhpiXD3tj0/+MDlYFU/c0+KvnoILi+lwM
	xtn6JrEz25ZzgoyDfkQtWKhEqsC3jcmNzDSovZsVc/yiK5ns8KIquRbFutWZBwRX
	TR+l4cexxs5BOUuKIuxOnPuTY5vuxtQJzkjkvY14uyfBXt7VKvrZiWgdE2gONWA9
	qThATKQT3nFbxqZ7KuA4jOf1RoC1jhuSILH1B8NMjCusrVHVNig9R9IyavdyfV70
	8j7oBmcYK/KlNyyW554BBDbYNV712rXoLHGdnJKnVR3D6by6lXx67HsIQ5hWWqhe
	1DCMbw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fds9hrcc4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 14 Jul 2026 19:00:32 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3883dc4ad23so1615664a91.0
        for <linux-media@vger.kernel.org>; Tue, 14 Jul 2026 12:00:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784055632; x=1784660432; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VuN2KvyH7xNc5tPonuLvz3YrBSAEUeGAvGNJm5LjkOI=;
        b=P05NHPSercUg6NK9mWYMPDMd444i3mRPu6A+eZprsaNH4IL+AgaRR6H78hWS1WGNvN
         4yuy4aXndr+QM0FmEcjShzSn7IxK6eBzc+Gp6jaXLqjLLK34Uf98S1SURimx2zSmkZAd
         VGG5Jl2l9+Plf21MMYFJuJwQBT6xqzO+lycvaXuSeCmqw3FBnU7d0KSyMKWSynIEwamj
         OF8o5q00Vhl3+EXlPg8zM7paYbNjUyW6kGEq8LiKWhE9OYpwPXO01zwV8VNnZiywW3Py
         hKrCzsX6Qk/8+CuRl62JNVdBiKzqcy89exx1KH47sg+01T2zXMjpSgIX1XG1Lwfe4edt
         kU4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784055632; x=1784660432;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VuN2KvyH7xNc5tPonuLvz3YrBSAEUeGAvGNJm5LjkOI=;
        b=SmgfXZ0UBnRjQFrzFy4nR9XWjV/VQ/adYUKykfMIYQkNHCc/7bkC/R47TrMTFonU/J
         vbXuIvb6PJzi2gHYJBhRgDvO1YAWPMEjTr/5ZuTsSJoAtEZyZvK6QIuAzF2+Ohcim0Kl
         mdtArjBPKvuW+owzVGg4j6ZZaK8Xc1Q5Kovbk3y2tIgKqQ7nRxq4He1bLQVZMRtnJpzd
         HuCjgLJbGO6Xm1F4OhvKYO2H7QSwFgXKtW2r1hQc3k9eX2aopmV/jvNmqdxRbJiDocbT
         2u+Wal6Np8M7rr3agsrOX+E3cv/hSLhqw5EgcE05PNVfqNsi0EBuMhIBI/zMDWpH22IM
         o62A==
X-Gm-Message-State: AOJu0YzpZNl0COf+pPpbq0R1myLjo7gqXyihGB2FKXdRbd8f74RGN4Ai
	0LsHKVZb01JVU4A8ZgxaDUjV6Spj6+/LbYP1m3NRTp7BPSlgwYHK47nSOQhDNyGGBc38VVfEXwT
	EhXm1wcJvcDgPUkW7yS42Y9PHakN+phuGSeKOPJAMot6O1I5RLbh+e2HUxGRmJlf9Yg==
X-Gm-Gg: AfdE7clGywFZ7SLoxlI5d740pgPLh+GTmccCY5B1SXRW03WVAY0ey7sDOlg4awM4Ie5
	bQNwpSVRA3SR8pA4rxBT81bAryhNFLiCYT+C37IE1Y0WgrrgaXIETBc73i6hasXcGxCg+uOBT2y
	WceHE7VxvY7mI9K9QxvR0oIrXtH6+zPNLmW+kfcEEgz6JbPIfqAbkebBEyKCVxVllzva+Er1odu
	Kb2zeKiFmEQEawdB5dYdPsU18xtLEum5kw9bynICXStXAsGdAqnE653Y332pn8FeitvyXO92tUr
	zs0Zs1Ha4LX5NeXYz1jY+JQix54xjswcH/Fu+dO6exd3tPBM76rYp7EeFrHKNULTXEVgXbLfZIc
	TA1DXlwminjtTSECflYJEH4u+WcMKGErBJgN+gLK/6tYFgNGr52Ro2Mv9XVoqFuXt4yJBYy8=
X-Received: by 2002:a17:90b:2dc1:b0:37f:e7e7:ad1 with SMTP id 98e67ed59e1d1-38dc7c0eb95mr10610095a91.5.1784055631857;
        Tue, 14 Jul 2026 12:00:31 -0700 (PDT)
X-Received: by 2002:a17:90b:2dc1:b0:37f:e7e7:ad1 with SMTP id 98e67ed59e1d1-38dc7c0eb95mr10610063a91.5.1784055631237;
        Tue, 14 Jul 2026 12:00:31 -0700 (PDT)
Received: from gu-dmadival-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3119d5cf176sm56634528eec.12.2026.07.14.12.00.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 12:00:30 -0700 (PDT)
From: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
Date: Tue, 14 Jul 2026 12:00:26 -0700
Subject: [PATCH v2 2/3] media: v4l2-core: Add support for video encoder ROI
 control
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260714-enc_roi_enable-v2-2-63683f9dbcef@oss.qualcomm.com>
References: <20260714-enc_roi_enable-v2-0-63683f9dbcef@oss.qualcomm.com>
In-Reply-To: <20260714-enc_roi_enable-v2-0-63683f9dbcef@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>,
        kernel test robot <lkp@intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784055629; l=6648;
 i=deepa.madivalara@oss.qualcomm.com; s=20250814; h=from:subject:message-id;
 bh=Vs+Xz11NwshWpusj/GLSlzFZoBVvFw1FfW1E2XVtmFM=;
 b=w1bKnZDnzQRaC5KmOqiT8LaQarRRPRjbcH6pbgtdj6PiiWVO/Og/G0vATKAZQDplea0EOD2+a
 UGu3NhW5DdvAx85/nWUrf5NPqESCUIbLN3p9NGPsbB/3p/yWSICBX2R
X-Developer-Key: i=deepa.madivalara@oss.qualcomm.com; a=ed25519;
 pk=MOEXgyokievn+bgpHdS6Ixh/KQYyS90z2mqIbQ822FQ=
X-Authority-Analysis: v=2.4 cv=Ib+3n2qa c=1 sm=1 tr=0 ts=6a568750 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=9XNArsbAKfxwOWEdJiAA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: GNdUFOAEEowr1fl0KLlRzHYEPweUYsY3
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDE5NiBTYWx0ZWRfX/1PjN2AYhfkj
 dsNQ7cAwgsV1k97WTX+mRb2RYeMdlDD3sa0ItjCqi00Nb7nZzsQJdxrNTAmZOdrvtFI7LfBfnV1
 FeEACqztTZXH3ote0rQUil8vMetS97A=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDE5NiBTYWx0ZWRfX/k9W58MmGTC1
 dbgoX2uljlnZ+WX1KPxkGhLyGjzr8IEmpPQHSDc5/P9SPeagGPnJDnwOg40nsNCUKQGWDF6Q7wk
 HIoqo7A8nw4UlTYup6746acEiH5YSc62+jXwsWFZzsozyYTBRYx/wUpvnnvrJYe6lNvB7l9cnx4
 iBWVr6JG15G9icehGMu7zlRFe80pg+LT6I8amqUft1vGr1NIL4H/OKCQYVOza1dB0spM1KlfXkO
 9GxlRdboju8tRJE9rXfuMTRnpUaSr+rOjDjRdIlWIAru+8RZYSFY91Rzv4ybffd0k+XObkZj+JN
 izRDxYgLM/9i9jzdltyp4KgZj1CxFNKumR4Qe+4cKn8Kkim1JA3pY6ji/pE4ZLlz0r4PBiPkyMP
 HI/7szPPQfaZ+N8rUXg3QQrYM7r+VhIoDW5auimub7hJwGtQGCzrJGif4KOzIFFFStBhropyf80
 mWP7JYoirNyklyN8P7A==
X-Proofpoint-GUID: GNdUFOAEEowr1fl0KLlRzHYEPweUYsY3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_05,2026-07-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 phishscore=0 malwarescore=0 adultscore=0
 impostorscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607140196
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-67588-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[deepa.madivalara@oss.qualcomm.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:mchehab@kernel.org,m:vikash.garodia@oss.qualcomm.com,m:dikshita.agarwal@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:deepa.madivalara@oss.qualcomm.com,m:lkp@intel.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[deepa.madivalara@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CF24B75817D

Add necessary support for controls V4L2_CID_MPEG_VIDEO_ROI_MB_DELTA_QP
and V4L2_CID_MPEG_VIDEO_ROI_MB_SIZE.

Signed-off-by: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
---
 drivers/media/v4l2-core/v4l2-ctrls-api.c  |  1 +
 drivers/media/v4l2-core/v4l2-ctrls-core.c | 40 +++++++++++++++++++++++++++++--
 drivers/media/v4l2-core/v4l2-ctrls-defs.c | 10 ++++++++
 include/media/v4l2-ctrls.h                |  3 ++-
 4 files changed, 51 insertions(+), 3 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-ctrls-api.c b/drivers/media/v4l2-core/v4l2-ctrls-api.c
index 93d8d4012d0f4fef004e417d0aee2ae44b1b30bd..7d41cfd7378baaa929d4da0266c45f731bb54285 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-api.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-api.c
@@ -980,6 +980,7 @@ int __v4l2_ctrl_modify_range(struct v4l2_ctrl *ctrl,
 	case V4L2_CTRL_TYPE_U8:
 	case V4L2_CTRL_TYPE_U16:
 	case V4L2_CTRL_TYPE_U32:
+	case V4L2_CTRL_TYPE_S8:
 		if (ctrl->is_array)
 			return -EINVAL;
 		ret = check_range(ctrl->type, min, max, step, def);
diff --git a/drivers/media/v4l2-core/v4l2-ctrls-core.c b/drivers/media/v4l2-core/v4l2-ctrls-core.c
index ba047d7d86010bf0cf8f8fbf2dc343883d6bdae0..15b69dce0127e7c8546c2d23ae5458ace10301a0 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-core.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-core.c
@@ -287,6 +287,14 @@ static void __v4l2_ctrl_type_op_init(const struct v4l2_ctrl *ctrl, u32 from_idx,
 			memset(ptr.p_u32 + from_idx, 0, elems * sizeof(u32));
 		}
 		break;
+	case V4L2_CTRL_TYPE_S8:
+		if (value) {
+			for (i = from_idx; i < tot_elems; i++)
+				ptr.p_s8[i] = value;
+		} else {
+			memset(ptr.p_s8 + from_idx, 0, elems * sizeof(s8));
+		}
+		break;
 	default:
 		for (i = from_idx; i < tot_elems; i++) {
 			switch (which) {
@@ -367,6 +375,9 @@ void v4l2_ctrl_type_op_log(const struct v4l2_ctrl *ctrl)
 	case V4L2_CTRL_TYPE_U32:
 		pr_cont("%u", (unsigned)*ptr.p_u32);
 		break;
+	case V4L2_CTRL_TYPE_S8:
+		pr_cont("%d", *ptr.p_s8);
+		break;
 	case V4L2_CTRL_TYPE_AREA:
 		pr_cont("%ux%u", ptr.p_area->width, ptr.p_area->height);
 		break;
@@ -481,6 +492,21 @@ EXPORT_SYMBOL(v4l2_ctrl_type_op_log);
 	0;							\
 })
 
+#define ROUND_TO_RANGE_SIGNED(val, offset_type, ctrl)			\
+({								\
+	offset_type offset;					\
+	if ((ctrl)->maximum >= 0 &&				\
+	    val >= (ctrl)->maximum - (s32)((ctrl)->step / 2))	\
+		val = (ctrl)->maximum;				\
+	else							\
+		val += (s32)((ctrl)->step / 2);			\
+	val = clamp_t(typeof(val), val,				\
+		      (ctrl)->minimum, (ctrl)->maximum);	\
+	offset = (val) - (ctrl)->minimum;			\
+	offset = (ctrl)->step * (offset / (s32)(ctrl)->step);	\
+	val = (ctrl)->minimum + offset;				\
+})
+
 /* Validate a new control */
 
 #define zero_padding(s) \
@@ -1365,6 +1391,8 @@ static int std_validate_compound(const struct v4l2_ctrl *ctrl, u32 idx,
 			return -EINVAL;
 		break;
 
+	case V4L2_CID_MPEG_VIDEO_ROI_MB_DELTA_QP:
+		break;
 	default:
 		return -EINVAL;
 	}
@@ -1378,6 +1406,7 @@ static int std_validate_elem(const struct v4l2_ctrl *ctrl, u32 idx,
 	size_t len;
 	u64 offset;
 	s64 val;
+	s32 tmp;
 
 	switch ((u32)ctrl->type) {
 	case V4L2_CTRL_TYPE_INTEGER:
@@ -1403,7 +1432,11 @@ static int std_validate_elem(const struct v4l2_ctrl *ctrl, u32 idx,
 		return ROUND_TO_RANGE(ptr.p_u16[idx], u16, ctrl);
 	case V4L2_CTRL_TYPE_U32:
 		return ROUND_TO_RANGE(ptr.p_u32[idx], u32, ctrl);
-
+	case V4L2_CTRL_TYPE_S8:
+		tmp = ptr.p_s8[idx];
+		ROUND_TO_RANGE_SIGNED(tmp, s32, ctrl);
+		ptr.p_s8[idx] = (s8)tmp;
+		return 0;
 	case V4L2_CTRL_TYPE_BOOLEAN:
 		ptr.p_s32[idx] = !!ptr.p_s32[idx];
 		return 0;
@@ -1556,6 +1589,7 @@ void cur_to_new(struct v4l2_ctrl *ctrl)
 		return;
 	if (ctrl->is_dyn_array)
 		ctrl->new_elems = ctrl->elems;
+
 	ptr_to_ptr(ctrl, ctrl->p_cur, ctrl->p_new, ctrl->new_elems);
 }
 
@@ -1998,6 +2032,9 @@ static struct v4l2_ctrl *v4l2_ctrl_new(struct v4l2_ctrl_handler *hdl,
 	case V4L2_CTRL_TYPE_U32:
 		elem_size = sizeof(u32);
 		break;
+	case V4L2_CTRL_TYPE_S8:
+		elem_size = sizeof(s8);
+		break;
 	case V4L2_CTRL_TYPE_MPEG2_SEQUENCE:
 		elem_size = sizeof(struct v4l2_ctrl_mpeg2_sequence);
 		break;
@@ -2215,7 +2252,6 @@ static struct v4l2_ctrl *v4l2_ctrl_new(struct v4l2_ctrl_handler *hdl,
 
 	if (flags & V4L2_CTRL_FLAG_HAS_WHICH_MIN_MAX) {
 		void *ptr = ctrl->p_def.p;
-
 		if (p_min.p_const) {
 			ptr += elem_size;
 			ctrl->p_min.p = ptr;
diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
index e062f2088490470c42d6c579ff7675be454a29b0..8f895060799ea13443143edd398dfb97f4ba0085 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
@@ -974,6 +974,8 @@ const char *v4l2_ctrl_get_name(u32 id)
 	case V4L2_CID_MPEG_VIDEO_AVERAGE_QP:			return "Average QP Value";
 	case V4L2_CID_FWHT_I_FRAME_QP:				return "FWHT I-Frame QP Value";
 	case V4L2_CID_FWHT_P_FRAME_QP:				return "FWHT P-Frame QP Value";
+	case V4L2_CID_MPEG_VIDEO_ROI_MB_DELTA_QP:		return "Encoder ROI MB Delta QP";
+	case V4L2_CID_MPEG_VIDEO_ROI_MB_SIZE:			return "Encoder ROI MB Size";
 
 	/* VPX controls */
 	case V4L2_CID_MPEG_VIDEO_VPX_NUM_PARTITIONS:		return "VPX Number of Partitions";
@@ -1622,6 +1624,14 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
 	case V4L2_CID_COLORIMETRY_HDR10_MASTERING_DISPLAY:
 		*type = V4L2_CTRL_TYPE_HDR10_MASTERING_DISPLAY;
 		break;
+	case V4L2_CID_MPEG_VIDEO_ROI_MB_DELTA_QP:
+		*type = V4L2_CTRL_TYPE_S8;
+		*flags |= V4L2_CTRL_FLAG_DYNAMIC_ARRAY;
+		break;
+	case V4L2_CID_MPEG_VIDEO_ROI_MB_SIZE:
+		*type = V4L2_CTRL_TYPE_U8;
+		*flags |= V4L2_CTRL_FLAG_READ_ONLY;
+		break;
 	default:
 		*type = V4L2_CTRL_TYPE_INTEGER;
 		break;
diff --git a/include/media/v4l2-ctrls.h b/include/media/v4l2-ctrls.h
index a1806ddbc797efa52e83cd3f685ef70d5b5483d2..9a68a3555e349f1e55aa01af5c10f08201d62bae 100644
--- a/include/media/v4l2-ctrls.h
+++ b/include/media/v4l2-ctrls.h
@@ -27,6 +27,7 @@ struct video_device;
 
 /**
  * union v4l2_ctrl_ptr - A pointer to a control value.
+ * @p_s8:			Pointer to a 8-bit signed value.
  * @p_s32:			Pointer to a 32-bit signed value.
  * @p_s64:			Pointer to a 64-bit signed value.
  * @p_u8:			Pointer to a 8-bit unsigned value.
@@ -61,10 +62,10 @@ struct video_device;
  * @p_const:			Pointer to a constant compound value.
  */
 union v4l2_ctrl_ptr {
+	s8 *p_s8;
 	s32 *p_s32;
 	s64 *p_s64;
 	u8 *p_u8;
-	s8 *p_s8;
 	u16 *p_u16;
 	u32 *p_u32;
 	char *p_char;

-- 
2.34.1


