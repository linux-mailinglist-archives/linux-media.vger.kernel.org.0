Return-Path: <linux-media+bounces-49452-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ED8BCDB7FA
	for <lists+linux-media@lfdr.de>; Wed, 24 Dec 2025 07:31:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4469430AD3B3
	for <lists+linux-media@lfdr.de>; Wed, 24 Dec 2025 06:28:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA93E2ED86F;
	Wed, 24 Dec 2025 06:28:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="c+gxEcXW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JDGApIDc"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C215C31353E
	for <linux-media@vger.kernel.org>; Wed, 24 Dec 2025 06:28:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766557687; cv=none; b=PL8tPR5m+XGkaoMQoI4BIjo5hGYCaSPPX5g1cn8bWgM9Ops0tSbjcP+2lVrFf79HZpTa/djAsG5SZfniZSPaCLySnOxcn/IZCg/wXgLV4Hq/GHVlucwPZY1A9Vor9MYe4S92VaJE4N9E33bxbDcjtAr2PX2siUHbC10QYpH5X2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766557687; c=relaxed/simple;
	bh=uFNt44v16+VNSladcy20KcC0FS/WVmmz9c1Lp4p1lEw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hFYmfQKc8MObuL04IBrgzxdTfpl27SWaPEBjB8fw5M6R62CmyAYDnlZEYW3yv4yGDUyygF7UGx2a6xgqhtDe62NPc8+7jngU9wCfK++xRhUVYMO493niVcwtyqE5lD7Vah1s5epRVXJjeO1YaZFlVJZ/QKyFBLVxnYqDcCMn0zA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c+gxEcXW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JDGApIDc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BNJCs0a1056223
	for <linux-media@vger.kernel.org>; Wed, 24 Dec 2025 06:28:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VUTT93LKzs62jsIB8hKM06ywx/M5I0v8a0LHmaZ71W4=; b=c+gxEcXW19+c/P7i
	C6Uf4EMG+kSeHQwilmC6r1Eet9jBq3stn78T8HLAkJZAVSUZSZaSdsrL8xYMdYhC
	t84BldxVJ+Zvi7T1xWzvmgn1XYWCpsf1hYAKFrGFDI0e6dwzsTPBfkvQAntKO8uG
	95GXJZrFBghg6WFOz21Tb7AzvPqFeNZXKTmrQdG5khH9bkKNSKYIYNa2dQRmHS/Z
	bZygtwZrp9ttNp/Xqtrdi594lTmBCHww07LYGYs8qkXfahh/3P1kr0FG2cmY4Eyf
	vCNzbyTmdnYmGtvL6kEELs0iIImySpGudogYVuzHuac48+2eK/EBe3WrOlu3nWiA
	paIK9w==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b811v1j76-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 24 Dec 2025 06:28:05 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-7b9321b9312so11461405b3a.1
        for <linux-media@vger.kernel.org>; Tue, 23 Dec 2025 22:28:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766557684; x=1767162484; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VUTT93LKzs62jsIB8hKM06ywx/M5I0v8a0LHmaZ71W4=;
        b=JDGApIDcERTlTD+etEB449ySkxfUlFY5w6FujGMyKzpg3l/mdJvPEh8pdU1ZzN1ZOs
         yyALYdKh+VqVOPb8YQMTmDd8Duo1+zx1Pwp13JkAMeoGANYyUNMn+pQTwcu633mysiym
         YkFpGr5WNUzOWTH5c4Szf4GsDiFNEeWOOdqDJnv+qIOI8HknvRvm8OjEGYr7wFyTR1/V
         EsUjnT7MMEaNFXWyJqrtTxfUg32RK3X0b/38Mn7g1a+U7fn/qNoThGU3kHFGJnhvg6Sw
         wl8HRMgFxYWG2C3Drr+TWW6LJoVW5ENQ9VJPo3+xFIhVHg0S5/CpGV0/ovyUdnhiCVTF
         yRJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766557684; x=1767162484;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VUTT93LKzs62jsIB8hKM06ywx/M5I0v8a0LHmaZ71W4=;
        b=kWLpkVU8G473CTWkPZ0DKFu1ep/PuTrgyW2IiVhRIB6jQ5CNIZI9ZHSRdJlbZT0pJq
         I+IihZ6//1VizYToz+1oZ0BkRtq7EHbaYje3AxPC9YotlOW6TqzDOyh9KesULZ7ObLWz
         7Cw88RtgWiRXwy/xVMgGABo66XEi8PNlX8bRVUuXPvvtJol4ovc6DDD7Ph6dolAG4dZL
         L5vaAqjNabHOuXP2z+upY9290VEHf2fTWoPffzIq/ZZjVeNf9Zh0GD84XUzDb0Kg58/u
         Xwx9vGM0aRSzh6SixPlGUGSxNFTDRa9mV/OOa0QD+6pA6NkAiZiBxiroINVEc4QeT9mR
         XQ4Q==
X-Gm-Message-State: AOJu0YxFJZv/XQDornGC25QJx5UjAghgj3PaagHVl2bfQLvmkeheJFOT
	+OrC0s0AmqTibxuz9Eydp5cwn9iW20eWgEIEaT+Yh8zFUfqJVBn3stOHJrToKcpZKD/ZRsG+5AI
	Q2OoMEwOApRBU2GlXo9hwev6IQqKh86ofvWSzymir/YKHCsGpfv4uKIugTBIp20vDBHXBXefYBg
	==
X-Gm-Gg: AY/fxX7m7ZYQA8RTToA5RV4sC1E6EC0E653D5jOIc1iBPJqpt22BDjuwLL7bZelTU8R
	XuhfWJHqtBzeXsqzB3chw+GQlbzrCYrfDf87iUHO7EBgHWX/NSe4NpSZz1kvg6eehLcNT4z9Pgv
	iBXYMGpA8hK9wy56eBBbScmVBBbv3ehJmjEwOf6shCjSqoQNtZl79hSLjfe2IcVJf9X6sn2xe9R
	qPJLkjBvXjB49riJqNllJmwct226HLqvuPXGlSbh5A+Scs1IO4JiHMuJxyzq4+1JQKUBFNT2r/u
	Q1Tc5I/pVTqXQEB9NJkXkLlG5aG8iEXbHumSfH44238sWxYO/0eQAGiKFuA9IJVxTGxQWKdybOp
	SXThEwV41APGI/GD6OXXBzpMdOzb9yq9mGqgjlfK9+z0TO0w=
X-Received: by 2002:a05:6a00:ad08:b0:807:3ce8:58bb with SMTP id d2e1a72fcca58-8073ce85e26mr2495927b3a.12.1766557684299;
        Tue, 23 Dec 2025 22:28:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEetZusp4r/t67X4n+UM25nReI7/guSHCsVpzSsGU3LKTeAF+acxysyBkAwTm9CwntmMO1VYQ==
X-Received: by 2002:a05:6a00:ad08:b0:807:3ce8:58bb with SMTP id d2e1a72fcca58-8073ce85e26mr2495907b3a.12.1766557683834;
        Tue, 23 Dec 2025 22:28:03 -0800 (PST)
Received: from hu-dikshita-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7eb85f15sm15618908b3a.68.2025.12.23.22.28.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 22:28:03 -0800 (PST)
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Date: Wed, 24 Dec 2025 11:57:14 +0530
Subject: [PATCH 5/6] media: iris: gen2: Add sanity check for session stop
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251224-iris-fixes-v1-5-5f79861700ec@oss.qualcomm.com>
References: <20251224-iris-fixes-v1-0-5f79861700ec@oss.qualcomm.com>
In-Reply-To: <20251224-iris-fixes-v1-0-5f79861700ec@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766557663; l=1178;
 i=dikshita.agarwal@oss.qualcomm.com; s=20240917; h=from:subject:message-id;
 bh=uFNt44v16+VNSladcy20KcC0FS/WVmmz9c1Lp4p1lEw=;
 b=9TGR5Pw1RDMwFvktNoiXTDKVAFp1rPowhOUSpIlVuAfAa22mlq46+3ngJw747/AmbbewAmpj9
 s6Xu/6ilbKgDxdQEPRQzy3DDnCyiT8qb9Rah1eZmnPB4j79Cwwui1fx
X-Developer-Key: i=dikshita.agarwal@oss.qualcomm.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDA1MyBTYWx0ZWRfX0GpU+qMh6XQR
 gbtVPtAChjouqPgvam8LfhGCGUVyEi3dEKtY3lkW/dGVjnIdtodiV0oTUH+uxuPBTnd60xJ0Mjl
 RMhqFRl1t2aCPPF1BJ+5347+jmokOB5TrOhYqxrlty3QA47rE2a0nT1qeJJw4vTGUoVcmvu098t
 IHrw7ef4vzHAWHHoCFPloLSehqnY69MnciB+9HQlmdKQqrDOp/kXQ5SEWCd2SXdunAIsDDrnDvL
 T6BKcT0e8oyUSEbuxsAi0gCUq1YY87OjjZy4aBfaERa7Nu6K3AXLGf24mxzco/1934/3IHKbxy/
 WxVjqZi7sJQSPDaenImuuu2h4E4jxs/z6jSQ9cTre2LXsSkh15BKLNianZNS9hn4++4jWObDcfK
 n/1W8IMD9/vDHd/8sdzD8quXCs6rbag9rDCrkWbCwkATYQwFAi9/xd5riYrCy7okkLfHCPpYD53
 VwBnm20Mw8OY0ie2JGw==
X-Proofpoint-ORIG-GUID: Gs1ZPDn_oI4ScUu7eh8mZDGF8pyG03Z7
X-Authority-Analysis: v=2.4 cv=WegBqkhX c=1 sm=1 tr=0 ts=694b87f5 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=hJpQIKcYsydMz8RtK9gA:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: Gs1ZPDn_oI4ScUu7eh8mZDGF8pyG03Z7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 bulkscore=0 adultscore=0 spamscore=0
 phishscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512240053

In iris_kill_session, inst->state is set to IRIS_INST_ERROR and
session_close is executed, which will kfree(inst_hfi_gen2->packet).
If stop_streaming is called afterward, it will cause a crash.

Add a NULL check for inst_hfi_gen2->packet before sendling STOP packet
to firmware to fix that.

Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
index 6a772db2ec33fb002d8884753a41dc98b3a8439d..59e41adcce9aadd7c60bb1d369d68a4954f62aef 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
@@ -963,6 +963,9 @@ static int iris_hfi_gen2_session_stop(struct iris_inst *inst, u32 plane)
 	struct iris_inst_hfi_gen2 *inst_hfi_gen2 = to_iris_inst_hfi_gen2(inst);
 	int ret = 0;
 
+	if (!inst_hfi_gen2->packet)
+		return -EINVAL;
+
 	reinit_completion(&inst->completion);
 
 	iris_hfi_gen2_packet_session_command(inst,

-- 
2.34.1


