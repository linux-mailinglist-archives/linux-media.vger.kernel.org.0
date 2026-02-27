Return-Path: <linux-media+bounces-53754-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uNQ/JJHWoWlcwgQAu9opvQ
	(envelope-from <linux-media+bounces-53754-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 27 Feb 2026 18:38:25 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AB0C1BB895
	for <lists+linux-media@lfdr.de>; Fri, 27 Feb 2026 18:38:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 49A0D3178B23
	for <lists+linux-media@lfdr.de>; Fri, 27 Feb 2026 17:33:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB48643E4A7;
	Fri, 27 Feb 2026 17:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WvyyA0xd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Bd4/LNQQ"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C08843E9C0
	for <linux-media@vger.kernel.org>; Fri, 27 Feb 2026 17:33:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772213635; cv=none; b=pLTtCNNbZdwhQoPj9/abqeNgkhkNigBRyDnr2fEqFZNrcoWyBz3oY/x0X7TAJ2vjRrM1s3oJYIe0ueBpWnU2mBTRZlerJ3Etd/SHirkKZMI6Jkb86WGT7m4co1KMu1IE/dGbpYIBSN0FXTAGfmYpMu7/SqYegnHBWfkxNuW5e3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772213635; c=relaxed/simple;
	bh=VmTmjGCN/lcGm+HdCAtCWpH0HxtgLlcDvVY7nIg4XiI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=MaUZ9pT537ZQ7lB93CgSnecGIjYHzACh/gPzkvBBtwgNv1Z85Lz1koImU2iHFmnA4xk64oYPqAzNh1GRjHWzh2VFke36Z1iA0NoeMaEFJefU/bft3ZQB/YmhtIXN7E7+P8hPGgv2T0A8dQ88uC5Dz1DMSIKfz5BcILKiRAutsgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WvyyA0xd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Bd4/LNQQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61RH0IsO131618
	for <linux-media@vger.kernel.org>; Fri, 27 Feb 2026 17:33:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=lW0+TWgoljFW/y3/+h2gH2
	3nIF20VK5qAqHwp2WcaGU=; b=WvyyA0xdJaQhB9/xWBTJStAYo808BEYExuxB7I
	pOn33+NjYEYnzQneog+XXPIZ88naPKWfVW9DZ3nxtNT/h68hlqM1vq0F2UbJag3J
	FY3XXxsZH9lih1/VbGBxxKx1w742YeHdhsFFn481/Q0ufkEjUXITJwJD1QPXcTco
	T32I6kbfKJh4dXNy3BWrOnPnd1YqekjI3ZVAqrZ8cCX5R6/lTPpGxBx8n8XBeNIV
	pcod4icfQQnlv9OQRhJMDVcFZ5e8pIva2B7dW+GNcL5UB4VRqc6qAt5SShK1Oc7u
	VSC7aqXNzIJpvjXFrWGRUVRJj+S6guZ+ZHBwJCckMW+Onh0w==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ck43rafmc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 27 Feb 2026 17:33:53 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2aaf0dbd073so22988525ad.3
        for <linux-media@vger.kernel.org>; Fri, 27 Feb 2026 09:33:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772213633; x=1772818433; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lW0+TWgoljFW/y3/+h2gH23nIF20VK5qAqHwp2WcaGU=;
        b=Bd4/LNQQmyek1+IoWzbtRwmW9BqZ83RMxRA224S0xWfVQqQSeWhs+XaeCmOBYgrAPJ
         kl2VZT9n8qrubXCw1Ob07Dcs/Ewe/6YAeE429kwlEuGXpC/5l+hwe9ZCFSatotKmHf/6
         NfVELcXrs495Xpk0yqH7ocxw56VoLCCNuzMvFre6lB82jFy/YOmcYZ5WNsiGcVrf+DuA
         nTFNFccwidlm+q6NW41Gqt+9k6rPFo61XIuh9+7J9UqyJhWcQY7TLcgD2aawtSluP7Dp
         Pf8R7wZT4AQ1Eyqkf6tNRlP0NHLOVk1nsyJK8lCYovrVFXHDh85G7HhcaZXLRanSQlyE
         bwgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772213633; x=1772818433;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lW0+TWgoljFW/y3/+h2gH23nIF20VK5qAqHwp2WcaGU=;
        b=gYHC7cgDOy6Y415gxG/ejJNcNQCtNZSlrwlk50rSriAEOQg53XXD1uODedF7MhrZXk
         mM8fH39/ryObvKOz8iPbxCwYr84Qc2L5gt7M3LKhfzSQ0rSzhfgBYqDqbsp8uONGP5Eo
         JAdCfQ+WyaG/rhZdCRtmpN6uHUNZMLESnO1J494y4cWCUob8gGwgJ/fTWXeLKXjF7q8a
         /Ur+1GpwADBNuZ2jHOVcIwP34BYvjetu0gF6rXgQQLEcnEAcFYEN8SmBwaSQ9iZwec/y
         cPDuOy1f0nPRXlTyAFF+TTknpXAvpbF/xirdifGBLEu74u+o8VzG75heofIoGxvBHH4/
         yHLg==
X-Gm-Message-State: AOJu0YyBmDDnc+z3rG13+ONcxAbn+134xTxXwtRl7h08e3jQTrQgsQaX
	3zk7YD3w934ze8+ovXdaaRRYAFvahGK74kAEusZzIEx0xP9tVbx2sJ27vxozFGgWL0yJiHZsKZ+
	EHsCFn00+xY2thO+Gh2lhgZdR9xltqtfX5qeLzSs7sA/cCk1ca9VsZwSYKjcUQoe+IjFW3wQX0w
	==
X-Gm-Gg: ATEYQzxXYJtJyxANy6wWC8NbHj7CW+dTwMFMygQFZG5xLCtLigncav8rjSCy1aAyUcd
	2IribVdD95Dpa03uOxXJ3ByraR5OiutWdW3Cr6Klkqf2j5B+5P9JyIvftop+s79XZUf82IiO4I6
	CV+Bewf+9TDQMnb8calWW/8nHixA0L7RYRn1TgfibiymBwmlGrPFrnGHYTCxKYiCoCveB8qTwoN
	9dw728mLsLUyKZgrq+ZnDamCeB/wIsHu6VllUeuDZepZFSXrCe6GNfplmnn3HZL7WFLvLrG1gAx
	/B2Nu+PVSFJ13mXGYnX5sr5yF+66gYf4ShTCDcfrVd3Jn09D8TgOWRV+nh2ao6qTfil/Gespldi
	uolTvXI4cT5TdRRfvi13erivQWhRqQruKMPfo2C+nPSQAK9JJrc9q2NI=
X-Received: by 2002:a17:903:b46:b0:2aa:cfee:a476 with SMTP id d9443c01a7336-2ae2e4da143mr32264795ad.48.1772213632579;
        Fri, 27 Feb 2026 09:33:52 -0800 (PST)
X-Received: by 2002:a17:903:b46:b0:2aa:cfee:a476 with SMTP id d9443c01a7336-2ae2e4da143mr32264485ad.48.1772213632002;
        Fri, 27 Feb 2026 09:33:52 -0800 (PST)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2adfb5b2309sm61974475ad.19.2026.02.27.09.33.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 09:33:51 -0800 (PST)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Fri, 27 Feb 2026 23:03:00 +0530
Subject: [PATCH] media: iris: fix use-after-free of fmt_src during MBPF
 check
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260227-fix-use-after-free-of-fmt_src-during-mbpf-v1-1-307cdafffa2a@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAEvVoWkC/yWNywrCMBBFf6Vk7UCamib6K1Ikj5maRR9OUhFK/
 91gl+fCPWcXGTlhFvdmF4yflNMyV2gvjQgvN48IKVYWSqpeKtUDpS9sGcFRQQZiRFgIaCrPzAH
 ixmkeYfIrgfNBGdKmu0opqm9lrOd/6zGczPjearKco/CuisMyTancmz6i6si2TqO0Hi150mijw
 RuhD0Y57TXVgBiO4wduA6vKxwAAAA==
X-Change-ID: 20260226-fix-use-after-free-of-fmt_src-during-mbpf-abc27f573400
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772213628; l=4535;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=VmTmjGCN/lcGm+HdCAtCWpH0HxtgLlcDvVY7nIg4XiI=;
 b=X53wKqc1CWuLtmrkjaIQTbNgNb5W36m17vnVI47MpWpXjPWIJZT19m6wRwc3jom+YmIBIeXtx
 BiCAZzBwWWaCAqVOIM3bpn4fwfYvOVbbOGesW2/t7ov2iEQieUchGp1
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-ORIG-GUID: CSRpK0X4xKI3gLAl9muQQ9tCo3iULyKV
X-Proofpoint-GUID: CSRpK0X4xKI3gLAl9muQQ9tCo3iULyKV
X-Authority-Analysis: v=2.4 cv=DOqCIiNb c=1 sm=1 tr=0 ts=69a1d581 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=ZdNiY0Q2JvzWvSwJNXMA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI3MDE1NSBTYWx0ZWRfXwntM9YOrEvh1
 8P+YswL6f2L0z/n035IXKzblZbRpqRk7BR8gmWPSJNOFEo/ZyLrkZN+UKeu1W3dZkH+Cc8pruWC
 ifn1q+6bZDj31ZOsv4FXnP4825FJ4IXilWxeqz31OBijKo6xRITYPu2A+ByK2nUSmOQJHk4PE7M
 lyFnlB0YabN8cARymBd4SliEWyNIMWjlBu6v8/9atdblhbTehEetHnuJQH+ZZLF+iIcl9VGU+vX
 fkAeNVTPeoH+/V9x9LOaRl8yyzOSXBrn5OdNT3pv+dZ1jN0abrctPa+XcNKuniHgk5TbA0LLvKr
 9Cq5wl30QLLV2AZmO2u/q2mGp5RHwNJza3tMTlHufgFT7IcxiM9ftlzK94PjcmpE6ps1TIgMF6A
 rXugJcilK6akVoA6ucz8S0sCCBWVmgVG+d5P5bZeG0jyOpYuZLShLTiBk3K0M1tIOhXUUGmvO+Y
 4yBfjd5yFnqvLnCgZTw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-27_03,2026-02-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 clxscore=1011 suspectscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602270155
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-53754-lists,linux-media=lfdr.de];
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
X-Rspamd-Queue-Id: 3AB0C1BB895
X-Rspamd-Action: no action

A race condition was observed during concurrency testing. the core MBPF
check walks the list of active instances and reads fields such as fmt_src
height and width. At the same time, iris_close() could free these format
structures before the instance was removed from core list. this creates a
use-after-free window where the MBPF checker access the freed memory and
read invalid values.

To fix this, the freeing of fmt_src and fmt_dst is moved to the end
of iris_close(), after the instance has been removed from the core
list and teardown is complete. This avoids accessing dangling pointers
during the MBPF check.

Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
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


