Return-Path: <linux-media+bounces-51470-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qHgtJen+dWmMKQEAu9opvQ
	(envelope-from <linux-media+bounces-51470-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 25 Jan 2026 12:30:49 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AAC9B803C7
	for <lists+linux-media@lfdr.de>; Sun, 25 Jan 2026 12:30:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3C9693012C6A
	for <lists+linux-media@lfdr.de>; Sun, 25 Jan 2026 11:30:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76A0631A7F9;
	Sun, 25 Jan 2026 11:30:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SQX92km5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KdviRKLV"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8173131986C
	for <linux-media@vger.kernel.org>; Sun, 25 Jan 2026 11:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769340615; cv=none; b=BTE+CAyzHTAaJlR6LEDrveeLgHSPe1qh13kytZmGRilr7Bb0geD6s4WCRrjrwmtDVlXtGXLdjnlgtb5QNIR3MEDIrt8SQ3r/wnSDZmomQn+4b+z7ub0Yk7m4AOkFzwqR/g6OoUMkrhjtev0n4iS5VWww5EYQiB9VYsdbduVId70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769340615; c=relaxed/simple;
	bh=ytVe+uou8BTNPny5/OojRD5KZD6kFH473n9t0J/PfrQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EjEphvoqjW9K4cPwfQy64iAf4GvwKcW3GX1TMPv8wMzHi+/W51z4OL1bNBDui9J8zLDWKqB2AELdxbWGWDMW96NOXID0QlnGmqr9zOLJjPIW2fvNZyAZKJbPERWXsHuG7sn+hb6fcgzQajv2W44YXMFHLKS+cz1pOKDQpUl7gas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SQX92km5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KdviRKLV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60P2pDiZ3557044
	for <linux-media@vger.kernel.org>; Sun, 25 Jan 2026 11:30:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NJcvqpUgtFMAP25ZnC2KVh0TcJY9dbo30bXKJAK5phM=; b=SQX92km5QecDrX9Y
	+acwKvRlgQAKuVY6T2oXyTZXvzufoXXlRFVyA9nb62KDGbdtmIu6KDeQaX6EQc7i
	5wOYHIW4WVX0Da4pXfuml4K7jzvbjiV35wPU9EJMhQmZ8hgbM20Jibo8DL9A/Ott
	F90DygrwK1e0IcfRQ5UQD5St591R1VDAEFg2Pl8DOVv1DkTM/m2H3bL+yxcIlgIV
	kyasXhEt4ZMp1MDwtdmaf4o0Tk9mQDR2l9WlPsbcrT/Cu+4Ez9+Ik/ynkrWYJ1gL
	UiI0exxdgQUqfwVviySHb7UQNrCupCW99aLZnc+o3TwywZwzcKAdOYMmvPE+mAUT
	bvGrRg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bvq2q20eh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sun, 25 Jan 2026 11:30:13 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-88a39993e5fso108564256d6.3
        for <linux-media@vger.kernel.org>; Sun, 25 Jan 2026 03:30:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769340613; x=1769945413; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NJcvqpUgtFMAP25ZnC2KVh0TcJY9dbo30bXKJAK5phM=;
        b=KdviRKLVunZmWBPC607EMKma7gZ2iNBaKqxzUYOXPyMirax/WbyXAoR1Xx4Cb0RgA8
         pZHIPZQ7dw328HXPUGwM0+NCcRizI0fSCaz6MXWqs0sR8r+12vKxFgrVxIx/CqqPKGoB
         UP+aqCeXZp0wJV17ADntCRQcE7LA9YqmiFXwGb1GTHe/ND5GPaAzW97U4dkdAqRui7su
         +CCHuM4/JRwSZ0Ij8lET+5/3lvZWj57DOgKqworioZFRI/vtncWEai35XRieERwYp5Gz
         C0dRL8ZO2Ebn/YlTreMhBs89zDKV16KGZq97ZsOSgu9x4/RUVJG3zOW1M4hu9nrTJa8S
         1S1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769340613; x=1769945413;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NJcvqpUgtFMAP25ZnC2KVh0TcJY9dbo30bXKJAK5phM=;
        b=m/Ywc5gXQEzYt1JYw+VqPJ0C0ck65trjIuL9l62ULkhHH4F91kky2TP6fje5M0mjNg
         qJzxlZmbM66UFoyXLykV/OnU5CNg8NJEldFoXfid/rbFHwsclANtgV11yro/jPlvFGAs
         2/bxhQSHudOD2oypXamurPgCNT17v7BeOvJ8tCXhDHpiKpl2VAKDOXFebS8VtKrlo1PM
         zR1/tBdSnNMJmPDUv/xu5WE0tulD2KrkBypVbbdJlLFcB8UmxCmm60djkth+8UaBe4hT
         ssVZ1siBl7EQhNoI8tAaH0YuTee6sldZqsnvMC24I6T35QtUTCG66dEx2aTtyQnk2F10
         Q0wA==
X-Forwarded-Encrypted: i=1; AJvYcCUjXM5j2F61m/US2dd/DBYRESj83FpgDd0WpVa2hfjLvtVCeSOvUB/rpjCFaec6jNyL1loUutWq+YmvyA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyWmaiVlpWw5tkzfVrtRHeXIlTaH5ykluouoalf1Ey4znQiPl4Z
	O6vqh97OVbqPaWsowSriArFa32uxdSRs1j86kiRRCpJ0enWa1T70Ak5aAumC0NTWsHZV/VSO9Je
	8JJX4HNrLY2uKbgbXOATY1Ug+hE25ZEcpdfLCP+D1jx3CjDkxgi0Puym4ZuyHyMUatw==
X-Gm-Gg: AZuq6aKfJepfgIC0rowTM1Ho4mnkH9xeiQcJ47FRgAbLOKDGg+JmYKxZHLhzwV6R/p2
	4ABMd4tqJKNvJ3dvQzhqd4xkS8CdQH9nwLfR0CYXzrg29lPab80Se5W/KtOe3cLCuswnaAzoeqT
	wJdjEbmszfe0j3lG2aoUwTV0N0jkpPgqMaNQTgeFzkFN7FLs+VbqoRLYd2IeTe2OzXsFoA4hifa
	dqIRGr5Q+kKX+xGvNO/XpOjXQmTjW0KtEZE6/Pw1LFE+vMiNPtIScLoF2MWwzqToVfGRBLLAlFq
	2ReusLHB/pnge25MqWj39r6pAOAVLtBrmHMI9KCtVebS39dwbEGfg5AFIiLbJPjvhw3WcoXUQeu
	n2l2qIFqyfPzwcuPeUgpeGcXsMDYJeSX4CFPnOLdCkd8o+enrs1jRjTPEY5QDB9O8h9M/Fa7mQK
	2R28U7/GJDeWRm0uKRY2rr85w=
X-Received: by 2002:a05:6214:250b:b0:88f:cd35:cc8f with SMTP id 6a1803df08f44-894b077cab2mr15835646d6.39.1769340612714;
        Sun, 25 Jan 2026 03:30:12 -0800 (PST)
X-Received: by 2002:a05:6214:250b:b0:88f:cd35:cc8f with SMTP id 6a1803df08f44-894b077cab2mr15835336d6.39.1769340612267;
        Sun, 25 Jan 2026 03:30:12 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-385d9fec3c9sm18583451fa.15.2026.01.25.03.30.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jan 2026 03:30:11 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 25 Jan 2026 13:30:03 +0200
Subject: [PATCH v4 1/9] soc: qcom: ubwc: add helper to get min_acc length
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260125-iris-ubwc-v4-1-1ff30644ac81@oss.qualcomm.com>
References: <20260125-iris-ubwc-v4-0-1ff30644ac81@oss.qualcomm.com>
In-Reply-To: <20260125-iris-ubwc-v4-0-1ff30644ac81@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-media@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Wangao Wang <wangao.wang@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1424;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=ytVe+uou8BTNPny5/OojRD5KZD6kFH473n9t0J/PfrQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpdf6+rvTjfORBmAGtkJaWo7TYCL436V5jH9N5/
 7M8QvBqPpaJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaXX+vgAKCRCLPIo+Aiko
 1dr4CACWDCwPjdjT+Ybs16qoXhrm/d4xsBKUhoOVYgecuVhnIph4NPRElf4FQ1l1qtjUMBeMZII
 O9wNUbIDqQg2oGahgMh5iVHY06+BuqtPjO3PF9+FPP4pGFK4rDee0nAJgEuWoE8bXRQtk+2wAWa
 4iLy9p/88N3f7df8zQ2OWgVOmFzvgdk7JuAVG4O9d/x1GLYc9IOPaoDzIGfVULU263Gnl8yGEJR
 OKH35R15GVSBHfUe1kdwMZXGKnkh2mZ1Saf1O5VtNfdHdmbHe5Wd03jqo/RLCuHqe3Nam9x8U/z
 vteYakKw41nKaidjFSZr2vGUuELvOygw7Z7hisjy3gv4Hpv3
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: 4GjWaK8OR-dj698UnVx7MBboauENpj5V
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI1MDA5NSBTYWx0ZWRfXw0BapvTXHO/B
 Eyn0fpL2ORXcQR1dF6Umyu/V48+A47jw4mlLN8f7i01gVw6fCnTMMKVfOqmDmCdhE1l4acMBz8S
 6NU4292cG1/kAu5H26rm6ZsY2H1cmuMZA0bclGrO4S9hDp4BNHtPwv+I6BE2RKGxDrM8kcIhHJO
 fSBIjFrNsI0/45mHPCxkXJaYMMWM8s7k+OxOe9QoDayoK5R15ViF/C4DdOa/KNTrcl83vHfBWc6
 RB2gzhp9G6rpsP+Ax/NwcbRv2mT8/Pr/Emcwb226C65ERo0b+nL+7ZEu+yzLlIvbpazWe04zliS
 rrsM7XzZYZ8lqJS+f9TMmWUgWfo4CMGjfG8ExGOmc/37dkbAA0VKMcB4OPn+bxIOSYdE4zEt24e
 M/jEgHiog4/w+LFoofYH5n2m09XUO0i24Ykklf5ZsmJV4APu+LrEfcjiaNrzVueOizTSGQY4/cs
 357afNRSVB6/xsXLPgA==
X-Proofpoint-ORIG-GUID: 4GjWaK8OR-dj698UnVx7MBboauENpj5V
X-Authority-Analysis: v=2.4 cv=POECOPqC c=1 sm=1 tr=0 ts=6975fec5 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=KKAkSRfTAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ZnE8w8QzOYjIZ_Lrp0IA:9
 a=4tUkUnfIpJ8A:10 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-25_02,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015
 bulkscore=0 priorityscore=1501 spamscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601250095
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	TAGGED_FROM(0.00)[bounces-51470-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,oss.qualcomm.com,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linaro.org:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: AAC9B803C7
X-Rspamd-Action: no action

MDSS and GPU drivers use different approaches to get min_acc length.
Add helper function that can be used by all the drivers.

The helper reflects our current best guess, it blindly copies the
approach adopted by the MDSS drivers and it matches current values
selected by the GPU driver.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Acked-by: Bjorn Andersson <andersson@kernel.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Tested-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 include/linux/soc/qcom/ubwc.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/include/linux/soc/qcom/ubwc.h b/include/linux/soc/qcom/ubwc.h
index f052e241736c..5bdeca18d54d 100644
--- a/include/linux/soc/qcom/ubwc.h
+++ b/include/linux/soc/qcom/ubwc.h
@@ -74,4 +74,14 @@ static inline bool qcom_ubwc_get_ubwc_mode(const struct qcom_ubwc_cfg_data *cfg)
 	return ret;
 }
 
+/*
+ * This is the best guess, based on the MDSS driver, which worked so far.
+ */
+static inline bool qcom_ubwc_min_acc_length_64b(const struct qcom_ubwc_cfg_data *cfg)
+{
+	return cfg->ubwc_enc_version == UBWC_1_0 &&
+		(cfg->ubwc_dec_version == UBWC_2_0 ||
+		 cfg->ubwc_dec_version == UBWC_3_0);
+}
+
 #endif /* __QCOM_UBWC_H__ */

-- 
2.47.3


