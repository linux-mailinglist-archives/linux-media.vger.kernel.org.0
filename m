Return-Path: <linux-media+bounces-55962-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cCW2BA9TuGmKcAEAu9opvQ
	(envelope-from <linux-media+bounces-55962-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 19:59:27 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B7C5029F68E
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 19:59:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5445730377BC
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 18:55:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 967C63E9294;
	Mon, 16 Mar 2026 18:54:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FDWPKvlA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="A8AF4vqO"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E59743E7178
	for <linux-media@vger.kernel.org>; Mon, 16 Mar 2026 18:54:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773687294; cv=none; b=EbB0GMz88M1DFCHzchv6nYs/O9Z4dB5h+pwo6olZMtDQ+6ke6Z2DK15sEnsDT/QT4f0Rlr91gQA6cXqLGWs1bSjqOb7ME8IBvcbZF5mhaI4XhES76FvyKinWAzlg6qWZDzR4Dy7usOl+tthnv9oFUfaywmICYT/aKjUHY7wnynU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773687294; c=relaxed/simple;
	bh=upK6uBmdFj3L01J2+uso9YhOoCCeQIlN/0kiddAlHQU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tqwE4d2sAPZ7Mc2cPo8BNmhkpJ+7+oNijBdzjtYG64uP/Gvo9w1r2020qfQYtd9drfMCa+9TANQeGRqRED53QPzYO/pxr60e/dIpTCDwIFYLtICt44OBmYDkP5s9dv2wxMz3mjnwZeA0r/Ty9pNhmRGOWX0MwyFmBYZjtNzQeM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FDWPKvlA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=A8AF4vqO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62GG6dY84022427
	for <linux-media@vger.kernel.org>; Mon, 16 Mar 2026 18:54:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	z4EIReUVZDLLFKrNuhEc4keZuSe+ZzG9lS8i32XVEH8=; b=FDWPKvlAHaShaTjk
	sJM7otLKs33Mbb0iBqtXnZJef7UulujgwKa4hBv9OkIkEZHlcToLTMGnHhjd++Nu
	vclRcqntQNhBFq08RkTdfJlGpucoiJ2E6oBNQUPNBs4YNCotRwvT/ixbDcJ1lKst
	tjdQ8hWU3tBbhCSC+55IhfkB7db6L9X5fhe3VMScUmAN5OkJaQ+kcNWHX0I1xF4X
	dxZ66St4ZhAM5a17XUiW0aP73mTYDS7vud5XLQsmE5bw1cR0IC+Ak/R/WFiyPYlZ
	0H2mvGIuKwUDYw+2GZdvfUe9PMuzDi8cVxp/D3VOMxCDDD6x8CGFfnn0de23kaYY
	FgQ0Lw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cxn3fgk26-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 16 Mar 2026 18:54:49 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cd91c0262fso232716185a.1
        for <linux-media@vger.kernel.org>; Mon, 16 Mar 2026 11:54:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773687289; x=1774292089; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z4EIReUVZDLLFKrNuhEc4keZuSe+ZzG9lS8i32XVEH8=;
        b=A8AF4vqOpBmKwaxYRFnAqRzJ/7sxcB4B/5pqxKsL2Rn6HNt6KgjJ0yOe6rXPKSEKeU
         AKB+zbgQABriOi4B2OmHeK2S2kPFMRrGKfEQB6/46aASGy2cyER4Vbu9Y+RSDbJEygva
         d+dSDXrUolBnuMl041TutA5tGUxArYihKEEFMNvWAT22qfA8RPYuLLiEztKdHwX/QFBH
         2Tqf224nIGIqdEOLpULf/nMR7UrBJaG8fx4uFZ1moDNGxmENQC/tykbn0UBgEFZhPxef
         oJ0xk1Aprn8XAgnNXX6ky5A+9I2VlnRMkRXY5fYWimad4V9VjrntNlw5e+iOrcAqtacR
         rsmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773687289; x=1774292089;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=z4EIReUVZDLLFKrNuhEc4keZuSe+ZzG9lS8i32XVEH8=;
        b=Q9KlWer/BAwzSdAtiHl5qj9txVhJm1ngX5ZnY1/a4iJSouEnS9B4639clLCnftOG8i
         yYpN1rPHeehrvYsCgO18Soj/eKlxF1ugMl3z7jq4EVML7l4P2B0NBBsjvVl2eVrSdg8Q
         U9sHe5Tr1+aWliz/f6qwDq/gngLxLOvH8MXelftopTEuhDtrFOMAZ4ZMARzyCksMM+o/
         8Wcl7vZvRfNG0gR969BGBU3Lehz6s2ijCybz5GcgMIMtzEALwXO9Jf6AvpM7a5uZgr8k
         uZp9MNkeQKpOrFBaxlwePsSa6jEt2cMdFT+6dhSFOdYtL2nrVfxw1OeL+UGxxXas5382
         DrrQ==
X-Gm-Message-State: AOJu0Yxq1ZDXXXthUsOutIrTInuqRkI+7eaL/Ch+XMG5/ajfHR+yWDm9
	5IH+j9SPRPcZauZ8flG1Pt+0HYou755YFyiR1LZrdV9f6BPr6bGvhncs/05weOXFlRkNK//RU6S
	niAqDSd3AH9PdKTom25cD/gPOw+qBRIdTMTzDtHAQWkq2LQ/EEF6ov56E79s+fh9jUQ==
X-Gm-Gg: ATEYQzy4lRkwbqp8zQvtqQiqGyf/udgJRyG93G1Dr+hBpIUg9dKOaHzuLffQsRy4knD
	h5wUZ2s3WsTmRdvHZRIEON64QmGGqNsXedvwXpoz6M37v8hJ+ThG6hLJKZHYI/cpcFQmdjIcFLM
	21wc64SVRJSkXGRlAih1DkOG2pC2zIQjmzi+g6TIy29ts9QI54bjZz30/tgZxdU6NIGcVchbnjN
	zHBGxg0OOopjYZ1Z12C/Kg9AEvTi7JUZYokqPr34P5/ZsRTZ+yoayqTTnMInY1fxUIcu/hu5632
	qmGZg+nJT+q2VWdLMLBGtIvcvhxIvDp2Le8C+fzWVCw4yNKbbXdsByxpg8/+JUW59NrgtdCKyU/
	4sK7apBOD4LYVMz0PWDmR1HEX9BdeYa8byn2GxN302JmBaxaDt2VnJ0DAXErQwaIb7aaAWh+hme
	uzvE/Yg4o12X18X5CVkf1M9By5TuisrhP+VAs=
X-Received: by 2002:a05:620a:44c2:b0:8cd:e162:1ea3 with SMTP id af79cd13be357-8cde16220b0mr94486885a.58.1773687288921;
        Mon, 16 Mar 2026 11:54:48 -0700 (PDT)
X-Received: by 2002:a05:620a:44c2:b0:8cd:e162:1ea3 with SMTP id af79cd13be357-8cde16220b0mr94483285a.58.1773687288460;
        Mon, 16 Mar 2026 11:54:48 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38a67e6788csm34108041fa.33.2026.03.16.11.54.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 11:54:47 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 16 Mar 2026 20:54:39 +0200
Subject: [PATCH v7 1/8] media: qcom: iris: drop pas_id from the
 iris_platform_data struct
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260316-iris-platform-data-v7-1-fc79f003f51c@oss.qualcomm.com>
References: <20260316-iris-platform-data-v7-0-fc79f003f51c@oss.qualcomm.com>
In-Reply-To: <20260316-iris-platform-data-v7-0-fc79f003f51c@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=6161;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=upK6uBmdFj3L01J2+uso9YhOoCCeQIlN/0kiddAlHQU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpuFH0ubEYFa4Dlx9O6N7trNrYnXRPb4hC0h5oV
 GkpaBLrE5+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCabhR9AAKCRCLPIo+Aiko
 1YUYB/9dBynUJ17hd3OVea60xaYridXh8eeo8m4uvM+awJIOtMSQ3xUcj+PBJN/ssqBaXP59hH/
 UtTOGOoYCBhnoT/sVq6P2ePZXPGdkGtc2F2P1iFXO4WQDPzWXryhA01JfiPfc5e1XqF/WHbLtnU
 A5CTV5WqiFh3mn2n3w/pm/qs3YjDUhX9U3j5namADNbt/I1T4/lsJuHRrG8BVC92ypbIN/gBXeK
 PLZV7bxBTen+69OoN7diQi9/d+VQM/+snjB1mRNaFob3pxe3eanJ6cPvBRjkBwb7VRr0Ku5MWNm
 PGyes73Bs4ovJnD/jxhHG5lce48TEP6w7NmpgkBqAUh/e9/2
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=C5bkCAP+ c=1 sm=1 tr=0 ts=69b851f9 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=hYMYe-gnznq9qBW6PAEA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: 741ED1i-jXjiOzs6071lyL5KLaSUQ1dR
X-Proofpoint-ORIG-GUID: 741ED1i-jXjiOzs6071lyL5KLaSUQ1dR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDE1MCBTYWx0ZWRfX9kfu73mKmuEs
 CrCyObRJf80Q6Ipemuyfb0dhpyW3Q1n3Sfl6s+IsWRiz8yS3YNUOHSMlXUEh1SpbxHNbKH9KtTd
 2RnhAEjeKokDDAgY6QRZfuR+d4kea5uYkPXKFpgQxiNSw1/+eZCZ3RSta+aP/slku0WyI6NfsMG
 mYdqCt9SRpvcXin1WUFM0G2PreFXi13lRyVoudUz9XwctPLtv7G6GNFJeWsLvzg5OekFB4QSzYY
 3i7I6HdNFQFIvzytMa/kfIfVm7JNgAsWDxplyCqtK2+NnrBhRVtlRdc+IXEjHUDlP0U5KKfjczs
 DE4lf8BkMVPxIdSoyAGhuay7LqL6rstwQALUkf02LrgSZtUnD1AEFC+Fq39dWBOVKyiet0htasT
 q/hKg3qBqm0KoTgM9WfJsthQsL990kVNpTl8thMPemwU145rSdf4quIf1x1EpU49eUAldYUwUVw
 nXhgBOHHFWxpOQDWKxw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_05,2026-03-16_06,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
 clxscore=1015 malwarescore=0 impostorscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603160150
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55962-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B7C5029F68E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The PAS ID, the authentication service ID, used by the Iris is a
constant and it is not expected to change anytime. Drop it from the
platform data and use the constant instead.

Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_firmware.c        | 11 ++++++-----
 drivers/media/platform/qcom/iris/iris_platform_common.h |  2 --
 drivers/media/platform/qcom/iris/iris_platform_gen1.c   |  2 --
 drivers/media/platform/qcom/iris/iris_platform_gen2.c   |  4 ----
 4 files changed, 6 insertions(+), 13 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_firmware.c b/drivers/media/platform/qcom/iris/iris_firmware.c
index 5f408024e967..bc6c5c3e00c3 100644
--- a/drivers/media/platform/qcom/iris/iris_firmware.c
+++ b/drivers/media/platform/qcom/iris/iris_firmware.c
@@ -12,11 +12,12 @@
 #include "iris_core.h"
 #include "iris_firmware.h"
 
+#define IRIS_PAS_ID				9
+
 #define MAX_FIRMWARE_NAME_SIZE	128
 
 static int iris_load_fw_to_memory(struct iris_core *core, const char *fw_name)
 {
-	u32 pas_id = core->iris_platform_data->pas_id;
 	const struct firmware *firmware = NULL;
 	struct device *dev = core->dev;
 	struct resource res;
@@ -53,7 +54,7 @@ static int iris_load_fw_to_memory(struct iris_core *core, const char *fw_name)
 	}
 
 	ret = qcom_mdt_load(dev, firmware, fw_name,
-			    pas_id, mem_virt, mem_phys, res_size, NULL);
+			    IRIS_PAS_ID, mem_virt, mem_phys, res_size, NULL);
 
 	memunmap(mem_virt);
 err_release_fw:
@@ -79,7 +80,7 @@ int iris_fw_load(struct iris_core *core)
 		return -ENOMEM;
 	}
 
-	ret = qcom_scm_pas_auth_and_reset(core->iris_platform_data->pas_id);
+	ret = qcom_scm_pas_auth_and_reset(IRIS_PAS_ID);
 	if (ret)  {
 		dev_err(core->dev, "auth and reset failed: %d\n", ret);
 		return ret;
@@ -93,7 +94,7 @@ int iris_fw_load(struct iris_core *core)
 						     cp_config->cp_nonpixel_size);
 		if (ret) {
 			dev_err(core->dev, "qcom_scm_mem_protect_video_var failed: %d\n", ret);
-			qcom_scm_pas_shutdown(core->iris_platform_data->pas_id);
+			qcom_scm_pas_shutdown(IRIS_PAS_ID);
 			return ret;
 		}
 	}
@@ -103,7 +104,7 @@ int iris_fw_load(struct iris_core *core)
 
 int iris_fw_unload(struct iris_core *core)
 {
-	return qcom_scm_pas_shutdown(core->iris_platform_data->pas_id);
+	return qcom_scm_pas_shutdown(IRIS_PAS_ID);
 }
 
 int iris_set_hw_state(struct iris_core *core, bool resume)
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index f42e1798747c..e4eefc646c7f 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -12,7 +12,6 @@
 struct iris_core;
 struct iris_inst;
 
-#define IRIS_PAS_ID				9
 #define HW_RESPONSE_TIMEOUT_VALUE               (1000) /* milliseconds */
 #define AUTOSUSPEND_DELAY_VALUE			(HW_RESPONSE_TIMEOUT_VALUE + 500) /* milliseconds */
 
@@ -226,7 +225,6 @@ struct iris_platform_data {
 	unsigned int controller_rst_tbl_size;
 	u64 dma_mask;
 	const char *fwname;
-	u32 pas_id;
 	struct iris_fmt *inst_iris_fmts;
 	u32 inst_iris_fmts_size;
 	struct platform_inst_caps *inst_caps;
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen1.c b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
index aa71f7f53ee3..07ed572e895b 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen1.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
@@ -360,7 +360,6 @@ const struct iris_platform_data sm8250_data = {
 	/* Upper bound of DMA address range */
 	.dma_mask = 0xe0000000 - 1,
 	.fwname = "qcom/vpu-1.0/venus.mbn",
-	.pas_id = IRIS_PAS_ID,
 	.inst_iris_fmts = platform_fmts_sm8250_dec,
 	.inst_iris_fmts_size = ARRAY_SIZE(platform_fmts_sm8250_dec),
 	.inst_caps = &platform_inst_cap_sm8250,
@@ -413,7 +412,6 @@ const struct iris_platform_data sc7280_data = {
 	/* Upper bound of DMA address range */
 	.dma_mask = 0xe0000000 - 1,
 	.fwname = "qcom/vpu/vpu20_p1.mbn",
-	.pas_id = IRIS_PAS_ID,
 	.inst_iris_fmts = platform_fmts_sm8250_dec,
 	.inst_iris_fmts_size = ARRAY_SIZE(platform_fmts_sm8250_dec),
 	.inst_caps = &platform_inst_cap_sm8250,
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
index a526b50a1cd3..1f23ddb972f0 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
@@ -934,7 +934,6 @@ const struct iris_platform_data sm8550_data = {
 	/* Upper bound of DMA address range */
 	.dma_mask = 0xe0000000 - 1,
 	.fwname = "qcom/vpu/vpu30_p4.mbn",
-	.pas_id = IRIS_PAS_ID,
 	.inst_iris_fmts = platform_fmts_sm8550_dec,
 	.inst_iris_fmts_size = ARRAY_SIZE(platform_fmts_sm8550_dec),
 	.inst_caps = &platform_inst_cap_sm8550,
@@ -1038,7 +1037,6 @@ const struct iris_platform_data sm8650_data = {
 	/* Upper bound of DMA address range */
 	.dma_mask = 0xe0000000 - 1,
 	.fwname = "qcom/vpu/vpu33_p4.mbn",
-	.pas_id = IRIS_PAS_ID,
 	.inst_iris_fmts = platform_fmts_sm8550_dec,
 	.inst_iris_fmts_size = ARRAY_SIZE(platform_fmts_sm8550_dec),
 	.inst_caps = &platform_inst_cap_sm8550,
@@ -1133,7 +1131,6 @@ const struct iris_platform_data sm8750_data = {
 	/* Upper bound of DMA address range */
 	.dma_mask = 0xe0000000 - 1,
 	.fwname = "qcom/vpu/vpu35_p4.mbn",
-	.pas_id = IRIS_PAS_ID,
 	.inst_iris_fmts = platform_fmts_sm8550_dec,
 	.inst_iris_fmts_size = ARRAY_SIZE(platform_fmts_sm8550_dec),
 	.inst_caps = &platform_inst_cap_sm8550,
@@ -1232,7 +1229,6 @@ const struct iris_platform_data qcs8300_data = {
 	/* Upper bound of DMA address range */
 	.dma_mask = 0xe0000000 - 1,
 	.fwname = "qcom/vpu/vpu30_p4_s6.mbn",
-	.pas_id = IRIS_PAS_ID,
 	.inst_iris_fmts = platform_fmts_sm8550_dec,
 	.inst_iris_fmts_size = ARRAY_SIZE(platform_fmts_sm8550_dec),
 	.inst_caps = &platform_inst_cap_qcs8300,

-- 
2.47.3


