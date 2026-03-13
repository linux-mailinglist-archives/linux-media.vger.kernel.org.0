Return-Path: <linux-media+bounces-55592-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kMgEB/fCs2mEagAAu9opvQ
	(envelope-from <linux-media+bounces-55592-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 08:55:35 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7452927F0F9
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 08:55:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 76D2C3153C4C
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 07:52:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9CEF36E483;
	Fri, 13 Mar 2026 07:52:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GTO4DyB6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Cp4fOf/9"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58331370D4E
	for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 07:52:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773388371; cv=none; b=Ncgm+Zk/7riqLU/O6V12jj6j1uZiYU85224eM+lBeTQlbQ2mjPT6XyCzm31sCLwK1kbz/jC8EXVjVm3B+8lrJClNWS4MkBHbjxn5j7aYm9grA9zrJNKs+mFY4r6qnWT4BJhwdXX5zf6K8uhbN3Fvn1QBw9Ex3lL89YZYze9pq74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773388371; c=relaxed/simple;
	bh=Knwl9TIGW90PmwXP68VpHHyknWQzY2+lfOIWG1iTcOE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jz6xK3uTWGCTmTu0owW6MO+qq2RTCFeZdS0Lma6xn9481/faaD/6i3bypzX1wjyNo1uuGhOH/5vvOSn3A/MLK1QSIkAvOfzp7c6vQAx/ie4HJUeRQROP3kDbz5OsVtKGpFPcJM1jKUR2JwKyQMt2xiYLBF1QCmG1gSs4m05wphQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GTO4DyB6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Cp4fOf/9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62D7iL9i2262547
	for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 07:52:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WkIxi4+/C28jrvf8ES6/SIOuPsWcpSdm1apYAbDQVp0=; b=GTO4DyB6/+t5RXVu
	9eKrlc6DMngajESOiJUT9Rpu5PSb7s0S5eNCO/7kAxns1uJb7xzj7rydKyj8CP14
	sgIUoM5uih9WL6tfHWz+7vGROYXs21p+v2G8/uBJsi/7TDqkAhnbzEJPE0xD8Xwr
	NUGmioYGhfCgBakkL7Brh9IoHw1/QVxTbGnRdtIpZHtiiaaNbfkbKZZrnGXFZopq
	uThR0AEA9DRvG2Wn7zqxR/lMWC+J91NOuiDtH0iSpMAL6+5iehDC5zwsLAHwrbHQ
	COcpqHNOBCmonjB3qYR5DFvxGj9a2Nr0fP0Wxq41EmdQ4qBWTruydq4XV6W9grwc
	BySuXQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cvef4r17p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 07:52:48 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cd722c1a69so1156728685a.0
        for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 00:52:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773388367; x=1773993167; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WkIxi4+/C28jrvf8ES6/SIOuPsWcpSdm1apYAbDQVp0=;
        b=Cp4fOf/9bO7yZxU2FfChgqxH8P/E0uL0d2Ihetog1ySmCsrn3C2FeXqWHzGcaWOVTd
         cVbFCUXrPmaLlourssPO4v8VQV8Y6PCjOaZ1mcOoVQsuXeGfiXDyppx1QiT3qchWfktE
         a582WBPBAvYA63CFPWqOKxbMwZkM1S0aVAB9HyiQ3TbE3fUbXifLnoAkhmTyuA7IBEAE
         aJ2tg9pelzR0nL2EzJ81haky1TW4qiiSGlUjaDBRzPKLKm3ualQZ49fnta5hqXE9H6NU
         QQz1+HQ9SvVJIz76FsVqFFLfH9CCbiVzlq4kx1lh1K+wpHdvUwk1D9YyvmmGDDNKsqQh
         WWvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773388367; x=1773993167;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WkIxi4+/C28jrvf8ES6/SIOuPsWcpSdm1apYAbDQVp0=;
        b=qPZqqGwDvxYCZBmxa+aNdzXUiTgHw0XAT4iHA5oII3ujiKP8vRA7rMdKkQZuN5P0HR
         HFXK9/QZzgoaLeVVRQCWkyEtvZEFjOHhZ/GHD1whnPIGC1X/esUZIgLsHwvEQVoNgaTP
         LYD00JhPfyPHJYmGQqSW16FjT09PihWlqiuxzyyu8WMjEojDaJsOyxaZsHMBLjL6uAeQ
         OLBoTbo+M8zIvHD+0qF3DWCq05OXlOt2apodisH70Ba73fGEK/1r0FpGVWYUmz8NsH9u
         xKRlHPrxvuofODFI3uoYepMCO9vZCPKjRjNv9niEoG9RlHSj3v4VHsfFhsiG0uGkR9wy
         1HQw==
X-Gm-Message-State: AOJu0YxaRo3OWloCU9tg9ZwFQ6FmoXgjc0g5sPM0TsHtQk7MR2dGepoc
	WWaL+8iWM74OyavYntV2lyc/5Hf4VQm3B1NinOqLn7wExxosV5yhAkG0Npf3X/woDuIHfc/vEX7
	ovrHI2v2hwfGbbo3CQvki88iimBNWBb9d7pdRmMVAJX6d3IJvJRTSs6umYbYAWLxPNLetucD6Cg
	==
X-Gm-Gg: ATEYQzzI7uuaQiZXVHar4LNaphM2w2MXDY+bzI94pKSW/uyOOA6eoqK2nXZm5NzVoG7
	5vKsWW4j4MPSs13QMSN/5rD6JpB4i2ecfDGzQ7uqymZRq7ZajynUQ0RUdIZNmmTLNc7qdY/KXpR
	Lc0r6FoOmtxM+/4pgXIQmGXVFtlYrlmIxUHBwDIzNbmC8NMkNvgKU03FMqXln9HcNbPpXdWny8R
	jGKBH6q0DF5So3BJ3U0XvpD+rK7JgmDRa+HdK9YdkQBWcNdq6Vj6a/KNxU8SF4SDMB8cZDud6oE
	2GnSOJM8kBfPw22IRHwhwfbjnY4wZQZY3TBF9OriYPIUnwKlg+24WmN/F43Pn1i3rxjyQ+amUGD
	4BE8FGla1vJPIVus3LWDkOBVTPKDko16buA7eA8w7YLqYamCDoxFhJ5tijx45bS7bHLh+KxtZy6
	EACKFE7y/B4U5lM95DeMcV4xpAPVQpNq5HNRM=
X-Received: by 2002:a05:620a:4095:b0:8cd:75d5:5456 with SMTP id af79cd13be357-8cdb5b70723mr312974185a.66.1773388367205;
        Fri, 13 Mar 2026 00:52:47 -0700 (PDT)
X-Received: by 2002:a05:620a:4095:b0:8cd:75d5:5456 with SMTP id af79cd13be357-8cdb5b70723mr312972485a.66.1773388366708;
        Fri, 13 Mar 2026 00:52:46 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a1563775a2sm1347475e87.89.2026.03.13.00.52.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 00:52:45 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 13 Mar 2026 09:52:38 +0200
Subject: [PATCH v5 6/8] media: qcom: iris: move get_instance to
 iris_hfi_sys_ops
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260313-iris-platform-data-v5-6-180484af4490@oss.qualcomm.com>
References: <20260313-iris-platform-data-v5-0-180484af4490@oss.qualcomm.com>
In-Reply-To: <20260313-iris-platform-data-v5-0-180484af4490@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=9196;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=Knwl9TIGW90PmwXP68VpHHyknWQzY2+lfOIWG1iTcOE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBps8JDMx7JcdCIibSD0o3HqN7pPooCC+D9ui9DF
 7nj7CWoZ3GJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCabPCQwAKCRCLPIo+Aiko
 1RWNCACiGM69SMWdoKZFCjvc+XH+CjevQW0iXK0GPeIVkuwPBu7N08hcOGniLDWL+O5y3FDcq4W
 OWNzR2Dpx3AvxK1kaxAZLiPjljoOduOizrSLmgXsVNWWRbSY73qDGOu5+1mc+eWzElbMyNfbKwU
 ncaWffWnAHbtYbpjBvLC+d4YE4osKMkx+Lhdr3r94jtB3/5K5NcuFCD04TTi8bjAwtfhDmMlkPC
 r8EsqiuqDB8qv45D0uzbaagnwZjyq2+izaeruoOhCJ6aFhJS1afrIMMpwgZPHPUR9XnWcQc5KOH
 dWMeEm3fsFw3LOFaWqbzd6BwjbnKFxY76GrCmf/mZlFBaVb0
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: JYZtRxp6URHIyhR7wCaKcbKq4X0JYpLy
X-Proofpoint-GUID: JYZtRxp6URHIyhR7wCaKcbKq4X0JYpLy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDA2MSBTYWx0ZWRfX0F7x4pvQ6TP4
 z5jSUfKMtXRwqH0jw3Mlk80qguZnfdG5VpGTFLHsQ4l4nfx7JWosP4cOV1DRX2VR1dd3BHgILGG
 swqK5HWM08r4ZAHT+VD+S93bd+MxvtQ/eMjSIa38jzQSc3enWo/5yHdmlD9QvIx6KJT6qVxuJnh
 nf6SC/oiISicTwNzZ/9/vw8+juxWVQ35xPz+8PRd4663UOpOZItBVzImh4uKef4RjC1iNDP7coU
 ZnxF1LTr0GwCpuCQxUoE9PEYsmQeg+t7G9z3uE25RMZyIdH0myCuYM3Cx507EB5/ETrxjR48yLt
 KRSa4lvdgCknfIS/ox9/gsW0kFuF4iMeFB0SvjZk5/oi012NCnnRpP9OUGa9S70BpCNsXQ1dWct
 lNh53bhY2ipD8LLZHKjMucZEhSuShxOaKrhElQJ7PjQsyw9fasqcJrvOUZVNBGnOg6Y0mz9utR1
 127+Po8BHHalc7hTSfQ==
X-Authority-Analysis: v=2.4 cv=S9nUAYsP c=1 sm=1 tr=0 ts=69b3c250 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=65xn1vM8G5_EQ4liwbMA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_01,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 malwarescore=0 priorityscore=1501 suspectscore=0
 clxscore=1015 lowpriorityscore=0 phishscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130061
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55592-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
X-Rspamd-Queue-Id: 7452927F0F9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The get_instance() is a callback tightly connected to the HFI
implementation. Move it into the new iris_hfi_sys_ops structure, merging
all core callbacks into a single vtable.

Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_common.h |  2 ++
 drivers/media/platform/qcom/iris/iris_hfi_gen1.h   |  2 --
 .../platform/qcom/iris/iris_hfi_gen1_command.c     | 28 ++++++++++----------
 drivers/media/platform/qcom/iris/iris_hfi_gen2.h   |  1 -
 .../platform/qcom/iris/iris_hfi_gen2_command.c     | 30 ++++++++++++----------
 .../platform/qcom/iris/iris_platform_common.h      |  1 -
 .../media/platform/qcom/iris/iris_platform_gen1.c  |  2 --
 .../media/platform/qcom/iris/iris_platform_gen2.c  |  4 ---
 drivers/media/platform/qcom/iris/iris_vidc.c       |  2 +-
 9 files changed, 34 insertions(+), 38 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_common.h b/drivers/media/platform/qcom/iris/iris_hfi_common.h
index 9aa84a1d8f95..a27447eb2519 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_common.h
+++ b/drivers/media/platform/qcom/iris/iris_hfi_common.h
@@ -112,6 +112,8 @@ struct iris_hfi_sys_ops {
 	int (*sys_pc_prep)(struct iris_core *core);
 
 	void (*sys_hfi_response_handler)(struct iris_core *core);
+
+	struct iris_inst *(*sys_get_instance)(void);
 };
 
 struct iris_hfi_session_ops {
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1.h b/drivers/media/platform/qcom/iris/iris_hfi_gen1.h
index 38e9d262d7df..c37adf65055a 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1.h
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1.h
@@ -7,10 +7,8 @@
 #define __IRIS_HFI_GEN1_H__
 
 struct iris_core;
-struct iris_inst;
 
 void iris_hfi_gen1_sys_ops_init(struct iris_core *core);
 void iris_hfi_gen1_response_handler(struct iris_core *core);
-struct iris_inst *iris_hfi_gen1_get_instance(void);
 
 #endif
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
index 26b7feb05d15..0017ade4adbd 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
@@ -1076,6 +1076,19 @@ static const struct iris_hfi_session_ops iris_hfi_gen1_session_ops = {
 	.session_close = iris_hfi_gen1_session_close,
 };
 
+static struct iris_inst *iris_hfi_gen1_get_instance(void)
+{
+	struct iris_inst *out;
+
+	out = kzalloc_obj(*out);
+	if (!out)
+		return NULL;
+
+	out->hfi_session_ops = &iris_hfi_gen1_session_ops;
+
+	return out;
+}
+
 static const struct iris_hfi_sys_ops iris_hfi_gen1_sys_ops = {
 	.sys_init = iris_hfi_gen1_sys_init,
 	.sys_image_version = iris_hfi_gen1_sys_image_version,
@@ -1083,22 +1096,11 @@ static const struct iris_hfi_sys_ops iris_hfi_gen1_sys_ops = {
 	.sys_pc_prep = iris_hfi_gen1_sys_pc_prep,
 
 	.sys_hfi_response_handler = iris_hfi_gen1_response_handler,
+
+	.sys_get_instance = iris_hfi_gen1_get_instance,
 };
 
 void iris_hfi_gen1_sys_ops_init(struct iris_core *core)
 {
 	core->hfi_sys_ops = &iris_hfi_gen1_sys_ops;
 }
-
-struct iris_inst *iris_hfi_gen1_get_instance(void)
-{
-	struct iris_inst *out;
-
-	out = kzalloc_obj(*out);
-	if (!out)
-		return NULL;
-
-	out->hfi_session_ops = &iris_hfi_gen1_session_ops;
-
-	return out;
-}
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2.h b/drivers/media/platform/qcom/iris/iris_hfi_gen2.h
index 6cc6d9890c12..21ab58e0aa84 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2.h
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2.h
@@ -36,6 +36,5 @@ struct iris_inst_hfi_gen2 {
 
 void iris_hfi_gen2_sys_ops_init(struct iris_core *core);
 void iris_hfi_gen2_response_handler(struct iris_core *core);
-struct iris_inst *iris_hfi_gen2_get_instance(void);
 
 #endif
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
index 0c98d680bf09..639b75fca1ab 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
@@ -1315,6 +1315,20 @@ static const struct iris_hfi_session_ops iris_hfi_gen2_session_ops = {
 	.session_close = iris_hfi_gen2_session_close,
 };
 
+static struct iris_inst *iris_hfi_gen2_get_instance(void)
+{
+	struct iris_inst_hfi_gen2 *out;
+
+	/* The allocation is intentionally larger than struct iris_inst. */
+	out = kzalloc_obj(*out);
+	if (!out)
+		return NULL;
+
+	out->inst.hfi_session_ops = &iris_hfi_gen2_session_ops;
+
+	return &out->inst;
+}
+
 static const struct iris_hfi_sys_ops iris_hfi_gen2_sys_ops = {
 	.sys_init = iris_hfi_gen2_sys_init,
 	.sys_image_version = iris_hfi_gen2_sys_image_version,
@@ -1322,23 +1336,11 @@ static const struct iris_hfi_sys_ops iris_hfi_gen2_sys_ops = {
 	.sys_pc_prep = iris_hfi_gen2_sys_pc_prep,
 
 	.sys_hfi_response_handler = iris_hfi_gen2_response_handler,
+
+	.sys_get_instance = iris_hfi_gen2_get_instance,
 };
 
 void iris_hfi_gen2_sys_ops_init(struct iris_core *core)
 {
 	core->hfi_sys_ops = &iris_hfi_gen2_sys_ops;
 }
-
-struct iris_inst *iris_hfi_gen2_get_instance(void)
-{
-	struct iris_inst_hfi_gen2 *out;
-
-	/* The allocation is intentionally larger than struct iris_inst. */
-	out = kzalloc_obj(*out);
-	if (!out)
-		return NULL;
-
-	out->inst.hfi_session_ops = &iris_hfi_gen2_session_ops;
-
-	return &out->inst;
-}
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index 6b76a9046f9a..d1daef2d874b 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -203,7 +203,6 @@ enum platform_pm_domain_type {
 
 struct iris_platform_data {
 	void (*init_hfi_ops)(struct iris_core *core);
-	struct iris_inst *(*get_instance)(void);
 	u32 (*get_vpu_buffer_size)(struct iris_inst *inst, enum iris_buffer_type buffer_type);
 	const struct vpu_ops *vpu_ops;
 	const struct icc_info *icc_tbl;
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen1.c b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
index dc74da04771b..9925a893b404 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen1.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
@@ -333,7 +333,6 @@ static const u32 sm8250_enc_ip_int_buf_tbl[] = {
 };
 
 const struct iris_platform_data sm8250_data = {
-	.get_instance = iris_hfi_gen1_get_instance,
 	.init_hfi_ops = &iris_hfi_gen1_sys_ops_init,
 	.get_vpu_buffer_size = iris_vpu_buf_size,
 	.vpu_ops = &iris_vpu2_ops,
@@ -385,7 +384,6 @@ const struct iris_platform_data sm8250_data = {
 };
 
 const struct iris_platform_data sc7280_data = {
-	.get_instance = iris_hfi_gen1_get_instance,
 	.init_hfi_ops = &iris_hfi_gen1_sys_ops_init,
 	.get_vpu_buffer_size = iris_vpu_buf_size,
 	.vpu_ops = &iris_vpu2_ops,
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
index 19e99e1c2aff..10a972f96cbe 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
@@ -907,7 +907,6 @@ static const u32 sm8550_enc_op_int_buf_tbl[] = {
 };
 
 const struct iris_platform_data sm8550_data = {
-	.get_instance = iris_hfi_gen2_get_instance,
 	.init_hfi_ops = iris_hfi_gen2_sys_ops_init,
 	.get_vpu_buffer_size = iris_vpu_buf_size,
 	.vpu_ops = &iris_vpu3_ops,
@@ -1006,7 +1005,6 @@ const struct iris_platform_data sm8550_data = {
  * - fwname to "qcom/vpu/vpu33_p4.mbn"
  */
 const struct iris_platform_data sm8650_data = {
-	.get_instance = iris_hfi_gen2_get_instance,
 	.init_hfi_ops = iris_hfi_gen2_sys_ops_init,
 	.get_vpu_buffer_size = iris_vpu33_buf_size,
 	.vpu_ops = &iris_vpu33_ops,
@@ -1100,7 +1098,6 @@ const struct iris_platform_data sm8650_data = {
 };
 
 const struct iris_platform_data sm8750_data = {
-	.get_instance = iris_hfi_gen2_get_instance,
 	.init_hfi_ops = iris_hfi_gen2_sys_ops_init,
 	.get_vpu_buffer_size = iris_vpu33_buf_size,
 	.vpu_ops = &iris_vpu35_ops,
@@ -1196,7 +1193,6 @@ const struct iris_platform_data sm8750_data = {
  * - inst_caps to platform_inst_cap_qcs8300
  */
 const struct iris_platform_data qcs8300_data = {
-	.get_instance = iris_hfi_gen2_get_instance,
 	.init_hfi_ops = iris_hfi_gen2_sys_ops_init,
 	.get_vpu_buffer_size = iris_vpu_buf_size,
 	.vpu_ops = &iris_vpu3_ops,
diff --git a/drivers/media/platform/qcom/iris/iris_vidc.c b/drivers/media/platform/qcom/iris/iris_vidc.c
index 7e03d63578e1..ecd8a20fedbf 100644
--- a/drivers/media/platform/qcom/iris/iris_vidc.c
+++ b/drivers/media/platform/qcom/iris/iris_vidc.c
@@ -156,7 +156,7 @@ int iris_open(struct file *filp)
 
 	pm_runtime_put_sync(core->dev);
 
-	inst = core->iris_platform_data->get_instance();
+	inst = core->hfi_sys_ops->sys_get_instance();
 	if (!inst)
 		return -ENOMEM;
 

-- 
2.47.3


