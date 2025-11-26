Return-Path: <linux-media+bounces-47762-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F7F1C8A1F7
	for <lists+linux-media@lfdr.de>; Wed, 26 Nov 2025 15:01:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 7ADF44E7AB5
	for <lists+linux-media@lfdr.de>; Wed, 26 Nov 2025 14:01:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B3E0273D75;
	Wed, 26 Nov 2025 14:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NzmKYhJm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RPTwNhFl"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30CB256B81
	for <linux-media@vger.kernel.org>; Wed, 26 Nov 2025 14:00:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764165651; cv=none; b=q6YQSEvKBstNkSOPqRGwNWegqnOqHY9J0erRWxExoBgO0t5rm5JwnQnth6GN7ftgdYLIe6nD5PVP5pK3ztw3hpbERU27u5IsBoUOGqCWZekjVF9epVaJLlBvXpt97mUfKYruEPtM2NAjAejkTiMLDDoO8o0dUJm4V8IJIhtCybU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764165651; c=relaxed/simple;
	bh=i03NQhkzED8rnlODWFptm7jI/Nkx9wqi6CFPG+MFIOE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mrbuMGf5Wa844p2uaa7DJaiHKsNwa4WhNdNNDboZwmSnuqST62BDIiLiv8AExgfL9qr/u5eCi97ecXD9ePola56XtsT8maRR9sQysJ++KWb1uXx5jYEezQdjMKHEMaxcAwd2wIPnj+OEidbzW/Cje/A8m4PbyUbf7UVWgJsbcKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NzmKYhJm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RPTwNhFl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AQAskGl1700296
	for <linux-media@vger.kernel.org>; Wed, 26 Nov 2025 14:00:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=oTopSPykg6oIxBCXsA30xuirvtAeElgurHW
	HeLRb3fw=; b=NzmKYhJmhpH3cxdC7v9zJyfllJHXpGZVKxsmO/YyMmNFh6XDviE
	FEmRhTzNFG2J8XXIvC3pHyHMp33spHQIUTqHg9SbviNjv/IPQtsi3EDovDTCC34B
	ewys2fvJg3k4ERgg+GX/Oa0FQoV3IxMzFRlUZ+ZDj5kG1JMKF2Pa1Cphu8fVBlMl
	lVyhKO57Nmod47oQAxxGRcZb/Y6Zu0EDiE/Gw4Pd+mWJAV8sTlFyV62LdkNWT9dN
	6SfWi6jn9IpBqUrnluQf/QwAZTtI5+BDsvcMSLOeneJkKFNKqecQtbiUJH6x2Eyx
	DfTtbwpJu6goH+gCLtYVGZ38q6VUBC2QQig==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ap07a0dke-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 26 Nov 2025 14:00:49 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8b2e235d4d2so2434728185a.3
        for <linux-media@vger.kernel.org>; Wed, 26 Nov 2025 06:00:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764165648; x=1764770448; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oTopSPykg6oIxBCXsA30xuirvtAeElgurHWHeLRb3fw=;
        b=RPTwNhFl2napPtlZZTAuYd04NE4iYLpiwVgHIaS9idW2J4RgAE/TOnZMMTHz+b1e3q
         dF+HmaLnugZISvJfkpN7HSmHJHMduZtwdIPxvu3k/0X/w0mJcR4RDPdg37UIMycM14po
         u1jhfg3gCy2XrQ2tMYDG6scN/XyI/Cqphfz/PXcLHQQwzsUiPPwuFVeLYk2U3YjvLyGH
         XOQv0+RnMVk6ONY35NuDy9EwJP0BY0xf8Wtvn/dp34F0W1ru3Opb/86cQfB2qOMuuuyl
         jboJP+Czny4GqmpOa4r4JSI43iE+dEWqot639S6mB5MmhPVzgWkRws4crdqS9pWrPUN4
         45RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764165648; x=1764770448;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oTopSPykg6oIxBCXsA30xuirvtAeElgurHWHeLRb3fw=;
        b=taXv1l2UAURvtS2rFwlqbD2PBfWbdppGUr5LmdowYMVBKtj5/vL9yDKu6logw9m7bF
         DVb5i+91FzrT34/Axd7oCUJ5G2u2BIoAOgpJpXYHDSwa0WfFZfgHtZDZ2VsNkRNAjZcF
         PjU1eNwVbffG3BGb0WgozEw3NtBDJ+BRyXtz15DG20Mt5JTx7FiX6KonuGAtOW3XdY8G
         brTYnmeasI++ygmM+VogYE0xTJ5aBimoeaY1Q0kDSvzhSdke2GxnBRU/YqX8hFuHKuUK
         8clKsylVDX0AQ9uKR1O6jDsoFex6AkA/ns5Q3mG82PEsPQ0EHaJEEIpV8zsgX5hR8kcj
         K6OQ==
X-Gm-Message-State: AOJu0Yw+7drmQMYaaQtZq7rmdv94F1FJ9RurDBQu10QThhZQX70wfqLG
	QOrHOGgqfMoKxL1Wa5ZqVt3R3R+JnBQcfa/mY7EvvbwAdfeuO3O22g5vzzzKXsvNlZJPLYJa5X/
	7NRi4BubuwJYYJcPvHCqEvJBc9lyoltfFoA2U+SrTDqGEHl19b6OMw0a2eDSp19tRRA==
X-Gm-Gg: ASbGncvbMmsqB6nCqRAk2gDWzRkQuJcV0jUrSrwoIbW3JXv7MvPKLUm3/7msK4/m6Ce
	YzKZG0DJi3h1KpFnhzZf+sTqVWgdqM8nU3/XKlxrNBmpK1mnOXh87XEvpza0b8JlIanvMA0UkEJ
	8Pq9hNe0d6bk7hagPcWbhXdQ8S4M8c/UlW8P1ed7KrQ4KoOHHbTbUu8XiWP/y5D+bZmQhrnSD/d
	+00MTIsmFbU1b+D6q80ZEt3zMFlPnWareNo72AX7E4xEXh2OhRHvhSuCsyPiUJooFcaAaVxkRQ5
	Fn8KqlalaB8igEQt1WWBzid22nm97vzaL2qGs7ubF8XIcgaprL0LLhuGKms+LrOMDjhhabLAVp/
	6PyH/6xr5WoN9estgiIzx/b7+yDatNut7Kww6rAlO4rIp4BA1P2Ix9XFXD+xupxM=
X-Received: by 2002:a05:620a:1a28:b0:8b2:74e5:b3e with SMTP id af79cd13be357-8b33d24b0f1mr2564375785a.36.1764165646449;
        Wed, 26 Nov 2025 06:00:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFWVAuC0rdSn2Gg8VbbpBlSqY1UpuO4qCabqSt2pZmOhKD7ZB/El6iGIscbifH4DczyeKa7JA==
X-Received: by 2002:a05:620a:1a28:b0:8b2:74e5:b3e with SMTP id af79cd13be357-8b33d24b0f1mr2564356285a.36.1764165645205;
        Wed, 26 Nov 2025 06:00:45 -0800 (PST)
Received: from trex.. (125.red-79-144-189.dynamicip.rima-tde.net. [79.144.189.125])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7fa41d2sm40702051f8f.22.2025.11.26.06.00.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 06:00:44 -0800 (PST)
From: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
To: jorge.ramirez@oss.qualcomm.com, vikash.garodia@oss.qualcomm.com,
        dikshita.agarwal@oss.qualcomm.com, bod@kernel.org, mchehab@kernel.org
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2] media: venus: assign unique bus_info strings for encoder and decoder
Date: Wed, 26 Nov 2025 15:00:24 +0100
Message-ID: <20251126140041.754071-1-jorge.ramirez@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=ZZEQ98VA c=1 sm=1 tr=0 ts=69270811 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=QCpOfKHlYVe8AePir1+hrw==:17
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=owfriIHii3yi9sGd5oQA:9
 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: prA7EnL6k2DTswZe7ty7AIRiDt8G8J9D
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI2MDExNSBTYWx0ZWRfX/dxyMlAEBm6F
 9hU7TftN7YPkgF5dzVfnn9IkT1nSUNgk9Wp2XqH5NI2/WDZs0YhPL4Je138zdbZMkQuQjLCROrj
 LO7poTyg460q5ZbGZumPDs0hi4xLbv4n+8Ile2P3Q/SQMEpqD1n3lQBLBR6BCN1BbTCu0zguUxX
 bKF4qyB3yv3W1RVn49UWW31dKyozyMZ/bG7BO+6pvuAergumcxBfSs+A8w7sb2C7lJ7eeoizwfQ
 t5eVBGuX9cBqvxAPtIa9FfJKPDfrBWuxIWSvUADO52n4KQ9TPeJpPcNijsl19WrGHH0hhqeGa12
 ioApcBsktVtInOO0eR/jOV3U8l7USkB+ot0+YzkI+Fca/Ztkj46vwSKTJ+FolmuUdublLp1yf+Z
 fcsi+TE21c7wfSRm26HYgB/uRZSF0Q==
X-Proofpoint-GUID: prA7EnL6k2DTswZe7ty7AIRiDt8G8J9D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 adultscore=0 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511260115

The Venus encoder and decoder video devices currently report the same
bus_info string ("platform:qcom-venus").

Assign unique bus_info identifiers by appending ":dec" and ":enc" to the
parent device name. With this change v4l2-ctl will display two separate
logical devices

Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/venus/vdec.c | 6 +++++-
 drivers/media/platform/qcom/venus/venc.c | 6 +++++-
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
index 4a6641fdffcf..16587767e597 100644
--- a/drivers/media/platform/qcom/venus/vdec.c
+++ b/drivers/media/platform/qcom/venus/vdec.c
@@ -433,9 +433,13 @@ vdec_g_selection(struct file *file, void *fh, struct v4l2_selection *s)
 static int
 vdec_querycap(struct file *file, void *fh, struct v4l2_capability *cap)
 {
+	struct venus_inst *inst = to_inst(file);
+	struct venus_core *core = inst->core;
+
 	strscpy(cap->driver, "qcom-venus", sizeof(cap->driver));
 	strscpy(cap->card, "Qualcomm Venus video decoder", sizeof(cap->card));
-	strscpy(cap->bus_info, "platform:qcom-venus", sizeof(cap->bus_info));
+	snprintf(cap->bus_info, sizeof(cap->bus_info),
+		 "plat:%s:dec", dev_name(core->dev));
 
 	return 0;
 }
diff --git a/drivers/media/platform/qcom/venus/venc.c b/drivers/media/platform/qcom/venus/venc.c
index b478b982a80d..0b5843ba536f 100644
--- a/drivers/media/platform/qcom/venus/venc.c
+++ b/drivers/media/platform/qcom/venus/venc.c
@@ -144,9 +144,13 @@ static int venc_v4l2_to_hfi(int id, int value)
 static int
 venc_querycap(struct file *file, void *fh, struct v4l2_capability *cap)
 {
+	struct venus_inst *inst = to_inst(file);
+	struct venus_core *core = inst->core;
+
 	strscpy(cap->driver, "qcom-venus", sizeof(cap->driver));
 	strscpy(cap->card, "Qualcomm Venus video encoder", sizeof(cap->card));
-	strscpy(cap->bus_info, "platform:qcom-venus", sizeof(cap->bus_info));
+	snprintf(cap->bus_info, sizeof(cap->bus_info),
+		 "plat:%s:enc", dev_name(core->dev));
 
 	return 0;
 }
-- 
2.43.0


