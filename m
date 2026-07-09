Return-Path: <linux-media+bounces-67211-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ybZmFg/5T2pkrQIAu9opvQ
	(envelope-from <linux-media+bounces-67211-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 09 Jul 2026 21:39:59 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C5A8E735178
	for <lists+linux-media@lfdr.de>; Thu, 09 Jul 2026 21:39:58 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=eaYl5mGD;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=PfcvtA6M;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67211-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-67211-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BABFF307F413
	for <lists+linux-media@lfdr.de>; Thu,  9 Jul 2026 19:37:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53D783D3337;
	Thu,  9 Jul 2026 19:37:25 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FAE43CF680
	for <linux-media@vger.kernel.org>; Thu,  9 Jul 2026 19:37:22 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783625844; cv=none; b=EZh1LzWayDzEfpXVZgZdl8hvXhDao+9jtBdg2JHayomzR9z8evM27wktQrEUJE+zhbcNqIgvZZ7KYFr6xi5pFt/ggJOSExXl5d6hmqW/2MfBKVM9qSQAsSzhf5TJrfkJkQdGkScDfb6RscXEFNqlPWZY4V48I5x5TWagI3Xa+H0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783625844; c=relaxed/simple;
	bh=rIQryLxWSljvGbcXBGXxmTE4bIVbZ/i0cqQXVKaBxTo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VptMaYb/J4rmKduCNrVB66zvqKvlVbYM+2J7QhZBnapCoeYfmrd5iiYJ8MF2FnB0U8w3fKLrZqoHf59V21H/DpudhaSR+hFtz1dla98gHKBzxuXRaTUU8mhEKIcDmavH7AefbwNWO4P8sof4kdRtX8eFDt9f56VrJrsvilgccQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eaYl5mGD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PfcvtA6M; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669HYWlg2521669
	for <linux-media@vger.kernel.org>; Thu, 9 Jul 2026 19:37:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GBaCQdiQ6p3n1Oeb3orZ3PcC3y+0WrOV0Xt+zgaVGKY=; b=eaYl5mGDQm801o+B
	SlIbA9OspHWp+Akslsn6X/O+yuWz6f4RQo3VWFCvUWZjP6VdunUgsMOcHG00fdCy
	hecy6YyjK+zMCJ/aoZp1kz+uO1Rx5EK80Ah4cZ2mLBA8HsBxgroPFdzHbV4WigF2
	eJg/yeFDieKOteMqeQZ3UQkbYzvooeht+PVpd+LYLTjwVgzPEz18yW4SpKCgBcuB
	77Gv4uNRlde66fi+9jjmkXpmUvOWvkQZYpBdyBDcl4wMG0yJgAUNmbHZXV2+j/QQ
	SlKwTcmbc2EuSbOrQHSxWIgRA+LA/oNiH2J8HxA2pM8xZDHIIXf4UjJYKBzjbToq
	9dOZ9w==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4faekn94vy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 09 Jul 2026 19:37:21 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-738ffe90415so46392137.3
        for <linux-media@vger.kernel.org>; Thu, 09 Jul 2026 12:37:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783625841; x=1784230641; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GBaCQdiQ6p3n1Oeb3orZ3PcC3y+0WrOV0Xt+zgaVGKY=;
        b=PfcvtA6MB1vKIae0uiJvSqT3DV9ndCG7o4yg1sR5j1fnSe/27tSxlHeickWDuzi1ti
         R6gnAQqCXYcaNo+l5NzcNXmhZogfR6ef9mJLr2d8OLjURsO9WES+g7/KCvXDrp+K6gR9
         nfdiCB6Vi++TOepNFLiTTYMpG4cP4yV3FPniY0TL0/AUBl02k3NrLckd9dXWj2SZ/+uy
         VDsokI/nJ3l1o3n/Ue3q6WvnzsAf7eISTF34ZqYwao09b/N7wLpKS75GfZa04+Pjw0al
         HTr8hfyu4ySU3UjBS2ifVpxnQSvJgv7zYlaISEhy1wY4BF+NLq/A8HpX5KSLb3anZ5SE
         5qcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783625841; x=1784230641;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GBaCQdiQ6p3n1Oeb3orZ3PcC3y+0WrOV0Xt+zgaVGKY=;
        b=SHMYkRBAya+T+y+/wgH4yBxOqgIu5ehO7401PKm11DReYSVdITFBPACtDgjpivgwhk
         /89weuBTBWTC0YNH9rFyT7Xf3hPLM56vk57M1Ub6ahSZfRBuVxn6zH6Gl13CVwM0NKax
         O+M5xmmLG/4KdwS4PzS3SMARvtfebv51w1/GVmk0/opcWOprbJYTseWGXn0vL9xzHYPd
         pomrKwVp4/upNFErp4QtXuAca5pjJqAR9ejMG+wZIjbOUloXarJR5G34nuszuyRYTHoL
         x4AKhDiRp+ByIdwlUNZWhxTa/kHOwule9aYeMYFRR8mi3e95tDT2Yf12DpcoACY08L2o
         6saA==
X-Gm-Message-State: AOJu0YzPgdfNt0DSFijwW1z2UbxjUxNxwSbVuPEkUda8gPkKwbfU1PnX
	95A8RXXxaX3n+xtn8UiBbMW3xGLRuMpSY45X4T5x4t5RNQATomsop+N+P9P3iZYiOLEZ866qB/T
	Yhr9uq05ykhCBGKCycbtUEE5S7xu3B8qApXRa2hKnB6gZvgzJ9izR9cRVlGVPATKsew==
X-Gm-Gg: AfdE7cmAc5hd2W+OyjjtxL6fUhSZLotHAIarLWpeZQe/VU4lMoA0NknS+tH1cM4dtqw
	FxZHClBZgbqgeCKBWBxP5Dj83DxUr9j2Zw2lkMmpLnhhE3wRZZ1agY08o8niM9rBr+nhXHDXcOP
	EPzruldwN45sB0H7aBjQ5CEL1zy9K0B0klrXJsEano+DOZjxhsnMu4DKwxzWcHvObmw8vC9LyFN
	oGdo/FiL7QqgJtu3t2Mt7k5VHz4BtyyOChCwC5ur2ihoVvKzjCDO+ACee2THdfzY0l7sxwSNn+o
	PlJEcYWahIMKzMBz5kVIXNqBBPRl2SclWCB/wJpzCoRbdBRJHSbcJd/YZHRS7SrjNKl/KF4XsBB
	5Ftu66a8psd5Qfx0taSBA+MiuCzdpODwDtuH0EwnTExbqIGWdBD2yib9qEeYJNcnuhFeknD6dST
	KbbOntLSs6YqTLyaUgC8Czbg49
X-Received: by 2002:a05:6102:5789:b0:73e:9fae:5844 with SMTP id ada2fe7eead31-744e0426fd6mr4666439137.27.1783625840973;
        Thu, 09 Jul 2026 12:37:20 -0700 (PDT)
X-Received: by 2002:a05:6102:5789:b0:73e:9fae:5844 with SMTP id ada2fe7eead31-744e0426fd6mr4666418137.27.1783625840508;
        Thu, 09 Jul 2026 12:37:20 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b01caa635dsm46400e87.62.2026.07.09.12.37.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 12:37:17 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 09 Jul 2026 22:37:05 +0300
Subject: [PATCH 8/9] media: iris: move the encode format list into the
 firmware data
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-iris-vp8-v1-8-6af3ab578a7c@oss.qualcomm.com>
References: <20260709-iris-vp8-v1-0-6af3ab578a7c@oss.qualcomm.com>
In-Reply-To: <20260709-iris-vp8-v1-0-6af3ab578a7c@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6857;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=rIQryLxWSljvGbcXBGXxmTE4bIVbZ/i0cqQXVKaBxTo=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqT/he+UX6A0qsm7QwLpjLDTC/QCVBHOQn+t6eo
 OxrwvDWz3GJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCak/4XgAKCRCLPIo+Aiko
 1X51B/98E/IzOGucYgIpwBe1Vlooq/UaSePGBXpR5BPZopdozSXkwpc6t4c5OI4rllacuVPwbQY
 gOjUB4l2AxbeuGo2m1yHY2zZjT8x2FfCAfN6Cd68GFsxvcbvOx+cQivE/ocVdC/4taNiWoFy+DV
 E1xKZ7DA6F57uQHv+WnzgcvopNJ2fDLvLjL9bc6XACnXXTngeBdiJN+auMVfK3oUBHFjWiQ62Ol
 7ay0gjLFmaoCa0c2nKKRKYRm1ITb2QiGdnJgR+paViHhYbNf786MNaB+uuyrQ4pnqROmv44KR+a
 JhgTA3Tf69iA+d6/CcPy6r81gVSuTccPfXmUMzXZYhYDDy/3
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDE5NCBTYWx0ZWRfX1P4P9OuZdy0B
 aiN33lLTWobDapDtwOLRJOZY4tQ7O35dN6VgLqisFojyQF0OA8xU0JLyD45S7cXtB66SZ74Tssg
 12LwMKLX8de/7TdjPzONdujfqiwsl9k=
X-Authority-Analysis: v=2.4 cv=SNlykuvH c=1 sm=1 tr=0 ts=6a4ff871 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=vsNcFQPsCN0v3r4H6SkA:9 a=QEXdDO2ut3YA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-GUID: S7A0hv4gEylBBB06wjhxXeLsOr5vzcJn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDE5NCBTYWx0ZWRfX/oOcy9mdMkVA
 eerr4xVDGbdBt0w8HWsQDf+bzDFDTmlm6/6/gJjVNHrUO9VbFmjUbjkt+zbhAtwYlvbMUn5oOH2
 2xzp/bWT11wgX7ZFcDUBn1pKaMMBzgyxspaE0iUGbwJbT3dInUZIiXn/nfFnC5RSrqK3yAan6sa
 DVVJnrgw/JU+11FLuEEZLfXm4qr0FURPVqrM4dAEarhbaE1jPnnBFt6+pHCbS7fNOMHlV5A3enh
 Nc6K5Ko7bPhTU89sXacYOuM0tzK2yEaQ6MFGuYZzi9JDZaXDMGIu6P07//AF66r/ekPZn6kJLOu
 VEh764BGbtZD6AAtNCA/uOh845e3dBBW3Yzx0p11S/cHyd9apy6qvE6Y+Rv+MlAEbWOkiK6OkzX
 YMcxEEkAfDsfa16iIbkIfn2gr0aNFYl7TUgUyjfnGdyrQHqaJac8DhnfW9UM8q0MXDdPsWCBc76
 IgUx8u6uM17Ltz+HiWg==
X-Proofpoint-ORIG-GUID: S7A0hv4gEylBBB06wjhxXeLsOr5vzcJn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_04,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 impostorscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090194
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-67211-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:vikash.garodia@oss.qualcomm.com,m:dikshita.agarwal@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:hverkuil+cisco@kernel.org,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:hverkuil@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C5A8E735178

Like the decode format list, the set of supported encode formats depends
on the firmware generation, but it was kept in the encoder's built-in
iris_venc_formats_cap[] array. A single static array cannot describe the
different format sets the same SoC exposes depending on which firmware it
booted.

Move the encode format list into struct iris_firmware_data next to the
decode list, and drop the static iris_venc_formats_cap[] array. Each
firmware data instance now carries the exact set of encode formats its
generation supports, so the formats advertised to userspace always match
the running firmware.

No functional change: every SoC advertises the same encode formats as
before.

Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_gen1.c        |  9 +++++++++
 drivers/media/platform/qcom/iris/iris_hfi_gen2.c        | 11 +++++++++++
 drivers/media/platform/qcom/iris/iris_platform_common.h | 12 +++++++-----
 drivers/media/platform/qcom/iris/iris_venc.c            | 13 ++++---------
 4 files changed, 31 insertions(+), 14 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1.c
index 4b05c2a47b0b..0451ee321840 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1.c
@@ -467,6 +467,11 @@ static const u32 iris_hfi_gen1_ar50lt_dec_fmts[] = {
 	V4L2_PIX_FMT_VP9,
 };
 
+static const u32 iris_hfi_gen1_enc_fmts[] = {
+	V4L2_PIX_FMT_H264,
+	V4L2_PIX_FMT_HEVC,
+};
+
 const struct iris_firmware_data iris_hfi_gen1_data = {
 	.init_hfi_ops = &iris_hfi_gen1_sys_ops_init,
 
@@ -477,6 +482,8 @@ const struct iris_firmware_data iris_hfi_gen1_data = {
 
 	.dec_fmts = iris_hfi_gen1_dec_fmts,
 	.dec_fmts_size = ARRAY_SIZE(iris_hfi_gen1_dec_fmts),
+	.enc_fmts = iris_hfi_gen1_enc_fmts,
+	.enc_fmts_size = ARRAY_SIZE(iris_hfi_gen1_enc_fmts),
 
 	.dec_input_config_params_default =
 		sm8250_vdec_input_config_param_default,
@@ -721,6 +728,8 @@ const struct iris_firmware_data iris_hfi_gen1_ar50lt_data = {
 
 	.dec_fmts = iris_hfi_gen1_ar50lt_dec_fmts,
 	.dec_fmts_size = ARRAY_SIZE(iris_hfi_gen1_ar50lt_dec_fmts),
+	.enc_fmts = iris_hfi_gen1_enc_fmts,
+	.enc_fmts_size = ARRAY_SIZE(iris_hfi_gen1_enc_fmts),
 
 	.dec_input_config_params_default =
 		sm8250_vdec_input_config_param_default,
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
index 6c1d562ab8c2..665de0275a0b 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
@@ -1249,6 +1249,11 @@ static const u32 iris_hfi_gen2_vpu2_dec_fmts[] = {
 	V4L2_PIX_FMT_VP9,
 };
 
+static const u32 iris_hfi_gen2_enc_fmts[] = {
+	V4L2_PIX_FMT_H264,
+	V4L2_PIX_FMT_HEVC,
+};
+
 const struct iris_firmware_data iris_hfi_gen2_data = {
 	.init_hfi_ops = iris_hfi_gen2_sys_ops_init,
 
@@ -1261,6 +1266,8 @@ const struct iris_firmware_data iris_hfi_gen2_data = {
 
 	.dec_fmts = iris_hfi_gen2_dec_fmts,
 	.dec_fmts_size = ARRAY_SIZE(iris_hfi_gen2_dec_fmts),
+	.enc_fmts = iris_hfi_gen2_enc_fmts,
+	.enc_fmts_size = ARRAY_SIZE(iris_hfi_gen2_enc_fmts),
 
 	.dec_input_config_params_default =
 		sm8550_vdec_input_config_params_default,
@@ -1335,6 +1342,8 @@ const struct iris_firmware_data iris_hfi_gen2_vpu2_data = {
 
 	.dec_fmts = iris_hfi_gen2_vpu2_dec_fmts,
 	.dec_fmts_size = ARRAY_SIZE(iris_hfi_gen2_vpu2_dec_fmts),
+	.enc_fmts = iris_hfi_gen2_enc_fmts,
+	.enc_fmts_size = ARRAY_SIZE(iris_hfi_gen2_enc_fmts),
 
 	.dec_input_config_params_default =
 		sm8550_vdec_input_config_params_default,
@@ -1955,6 +1964,8 @@ const struct iris_firmware_data iris_hfi_gen2_ar50lt_data = {
 	.inst_fw_caps_enc_size = ARRAY_SIZE(inst_fw_cap_gen2_ar50lt_enc),
 	.dec_fmts = iris_hfi_gen2_vpu2_dec_fmts,
 	.dec_fmts_size = ARRAY_SIZE(iris_hfi_gen2_vpu2_dec_fmts),
+	.enc_fmts = iris_hfi_gen2_enc_fmts,
+	.enc_fmts_size = ARRAY_SIZE(iris_hfi_gen2_enc_fmts),
 	.dec_input_config_params_default =
 		sm8550_vdec_input_config_params_default,
 	.dec_input_config_params_default_size =
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index 3d631effe307..7e670d04c10c 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -259,14 +259,16 @@ struct iris_firmware_data {
 	u32 inst_fw_caps_enc_size;
 
 	/*
-	 * List of coded formats supported by this firmware generation, used to
-	 * advertise decode (bitstream) formats to userspace. This lives in the
-	 * firmware data because a single SoC can boot either firmware
-	 * generation, and some codecs (e.g. VP8, MPEG2, AV1) are only supported
-	 * by one generation.
+	 * Lists of coded formats supported by this firmware generation, used
+	 * to advertise decode (bitstream) and encode (capture) formats to
+	 * userspace. These live in the firmware data because a single SoC can
+	 * boot either firmware generation, and some codecs (e.g. VP8, MPEG2,
+	 * AV1) are only supported by one generation.
 	 */
 	const u32 *dec_fmts;
 	unsigned int dec_fmts_size;
+	const u32 *enc_fmts;
+	unsigned int enc_fmts_size;
 
 	const u32 *dec_input_config_params_default;
 	unsigned int dec_input_config_params_default_size;
diff --git a/drivers/media/platform/qcom/iris/iris_venc.c b/drivers/media/platform/qcom/iris/iris_venc.c
index 2f2c56bf9122..91749e580d5b 100644
--- a/drivers/media/platform/qcom/iris/iris_venc.c
+++ b/drivers/media/platform/qcom/iris/iris_venc.c
@@ -80,11 +80,6 @@ int iris_venc_inst_init(struct iris_inst *inst)
 	return iris_ctrls_init(inst);
 }
 
-static const u32 iris_venc_formats_cap[] = {
-	V4L2_PIX_FMT_H264,
-	V4L2_PIX_FMT_HEVC,
-};
-
 static const u32 iris_venc_formats_out[] = {
 	V4L2_PIX_FMT_NV12,
 	V4L2_PIX_FMT_QC08C,
@@ -111,8 +106,8 @@ static bool check_format(struct iris_inst *inst, u32 pixfmt, u32 type)
 		}
 		break;
 	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
-		fmt = iris_venc_formats_cap;
-		size = ARRAY_SIZE(iris_venc_formats_cap);
+		fmt = inst->core->iris_firmware_data->enc_fmts;
+		size = inst->core->iris_firmware_data->enc_fmts_size;
 		break;
 	default:
 		return false;
@@ -143,8 +138,8 @@ static u32 find_format_by_index(struct iris_inst *inst, u32 index, u32 type)
 		}
 		break;
 	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
-		fmt = iris_venc_formats_cap;
-		size = ARRAY_SIZE(iris_venc_formats_cap);
+		fmt = inst->core->iris_firmware_data->enc_fmts;
+		size = inst->core->iris_firmware_data->enc_fmts_size;
 		break;
 	default:
 		return 0;

-- 
2.47.3


