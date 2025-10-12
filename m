Return-Path: <linux-media+bounces-44206-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E823BBD0777
	for <lists+linux-media@lfdr.de>; Sun, 12 Oct 2025 18:26:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2618E3C2A20
	for <lists+linux-media@lfdr.de>; Sun, 12 Oct 2025 16:24:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C73F2F1FE7;
	Sun, 12 Oct 2025 16:24:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Cee6ndNl"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DFE52ECD07
	for <linux-media@vger.kernel.org>; Sun, 12 Oct 2025 16:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760286232; cv=none; b=A65GtFsAODQylvAU3suJ9nJMJElkXj/HeeTEmptkIO0JUX9sfvQ9Z2n4pjrkpxOJGcJX/TtcrLs1tPhG8ojZ+jZAmrl837rMPKodv33nl7LHKA1lKDr8sDjm/4rPqPXRRYh8dkdfC+k6mILO00cA3gpIU7ZjOTC5MOBRZO+Z9mM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760286232; c=relaxed/simple;
	bh=/XlkIw+30ImRJ1vZ+oZYrGWc5+GeaSVpL8dMGuZakzQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ESK4zYhTEvXyhxQR6ODgbD2vM7tfEOQz9/c8hxrmbSsvi9IQXnYIwN4EpfMq79oZZ5JWa83vqxIA1wZIbIzge+JVzS2ssSZXWLLA+8w1AK3jun/tQS/w3CFAmmUQCYq7VZ+WJPb4lpCCDDPLL2ss9cuP/VKYmQOw5gpOLFggiTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Cee6ndNl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59CDiA1Q028881
	for <linux-media@vger.kernel.org>; Sun, 12 Oct 2025 16:23:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HUM+cJTKntoj0TSOmVPixlbOh3sBmLzYWf/L9aPHlHQ=; b=Cee6ndNlbE46aEUx
	COuCekN0tGIOIJlxm2t81ICnn5phyZOWfuYbh3sXi/lssTFF27qEjbWBXJQVZoqi
	kJrz37IQqGhFqv6XjBIARjE0ZQdWRc7Il6H9g9vSUN0I2GvQoMhZxyNsyiadmzT4
	Th2BfmHQH4CiJZLaruThBkturxxCZ7DgjEY4YzZAUeNsVKCVgckf7apXLre2z9GM
	ys2xjUuKUJa2mJJJLpMIfm8JroFC0x8/PvpQyrGuxcJVFVtTAMobwIYkOr213mhi
	0qrX+5Nz/rDMhoUavCLrZsWBlCUw9mZs91U/cc/ZUy7zqZogs3Y4gzT+sH2zybd7
	ge4Gwg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfbht9gv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sun, 12 Oct 2025 16:23:43 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8635d475523so1930581285a.3
        for <linux-media@vger.kernel.org>; Sun, 12 Oct 2025 09:23:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760286222; x=1760891022;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HUM+cJTKntoj0TSOmVPixlbOh3sBmLzYWf/L9aPHlHQ=;
        b=Fy/hBh2Ji7VWKPEkOnINwzi161WRkU8/eC+Kl501FAEz5jgEMyH2mNQsXlyJyBgjDU
         kCRMBh07mukvL/nQ/VBJm+ivg9GboeQklI3k/TfadqLAciBa5GX3v+KXY5vXsWZ4CJr+
         gGK/+eBRlhtt30wtrBgFcGOT6DXmdchvFX+D8qOG2oeHWy8W7+ZB0yBf6Xq7RuJg6T3W
         y49MtO5UQf9exBQ+Hp0kVBsgzu5yeUfTiBYzJ9WHz/PSYKaFXR5ymF/BoIESfXdcGWcV
         qu2cmZxGt1vHOmEdTP5K+hbcgZVtNVeYhDlmC23qZJBwmNyfBQ22ztLmeygR536QLiI4
         n28A==
X-Gm-Message-State: AOJu0YwmDjVb872oLhx5al7KAO0H12UpjMAPRX1IAvqQcDs+JlM6Pil+
	bw0FNzm7sGldPCPdwbm2yntCtg9s/vaWRxLbcTVTv4eCBkBlo+KM1t40UOkr4Xk7tB6K7AG5rLJ
	ZBv6aASGxhLpcuvmjpmHpwk3ZXsGzPP2xlAr7BkUim6awaPl5GiKLtil02dj7w5VhKQ==
X-Gm-Gg: ASbGnctv2w8jHl6DdzZqXp5Cqrc7uGawMQZIQFZw40JoSGdoUa5iKA4/iQlSrgXixxF
	qrvUo+Tttw3vlbie3gLZ3LdP3FOX+ynALV3LDYFgQla+zNKpgfCpWb8Eqd9vg2ViLOeGYkLiaYL
	f54oGpI2B33dLN28I85gDhFaMdWHn9a2CGqYCZ4alCknGa6ttvdd6QHQH4SCgS7VMT5jUlDcFSJ
	UFbU3bzP29QKguY7Rl7PHKJDNXB+3db6oYx5b5r49bgCb94fUCh36J2mr5GHqil0LL2D51AspbI
	kpUUuoaKio54YuTiuApn29P4yhUSMd1cKOnu0h4KCiK///LjLhmVg5PyczqKaiPwGFxPNGdQVKw
	qzO/jDpRiHKH4vyBT1oXD9cyXvZXyVBtDb5BkxcBe4Gm3M8FZdBn+
X-Received: by 2002:a05:620a:1aaa:b0:85a:1020:63d7 with SMTP id af79cd13be357-883521dbb61mr2434433285a.47.1760286222236;
        Sun, 12 Oct 2025 09:23:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHHBYXOzwONO9kVZyil/dw34TySyD+6pIngj6wc/pdezQPpAFjhCWme3kHRKMbraemUDA5eIQ==
X-Received: by 2002:a05:620a:1aaa:b0:85a:1020:63d7 with SMTP id af79cd13be357-883521dbb61mr2434430785a.47.1760286221813;
        Sun, 12 Oct 2025 09:23:41 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-590881fe5besm3112637e87.50.2025.10.12.09.23.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Oct 2025 09:23:41 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 12 Oct 2025 19:23:31 +0300
Subject: [PATCH v2 4/8] media: iris: stop encoding PIPE value into fw_caps
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251012-iris-sc7280-v2-4-d53a1a4056c3@oss.qualcomm.com>
References: <20251012-iris-sc7280-v2-0-d53a1a4056c3@oss.qualcomm.com>
In-Reply-To: <20251012-iris-sc7280-v2-0-d53a1a4056c3@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3598;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=/XlkIw+30ImRJ1vZ+oZYrGWc5+GeaSVpL8dMGuZakzQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBo69YE9WP9zEatolepYmFytvcnCgF8zYPcW5KSj
 l/0l/KKoamJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaOvWBAAKCRCLPIo+Aiko
 1RvCB/4oz2P50mg+GiHwrflyGtjswsPxBbXfZD+fvueM28prVD6xZPRaxCsYYscI8cW2XFH5Fp8
 Qk4TD08z8gUQkbKE0BOv2L9L+9wV2oN9cRg7kuUBK0Sn2W76IDsxahpwLQnLHmbNA6xv2/l7uOt
 UOFllxnKSNEuHqpnDiFMNkQnrNuz68/W6j7GFW7dgDM0YXdmjw658QH77eH7xLKuLAmFZxdLB6o
 L/IrIgT9S58k3K8UsZvdAvp6yveeMXp7QGaAhFobR7Btvastt/f3g+pfIT9uxsX03GPEmeDuQ7y
 YFiWxQ4atVHD91uHaonWqye0IDQNbvsOrE4Ws2JqDJBRa3bl
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxOCBTYWx0ZWRfX7HgbKFW6BcR9
 JbYJwDpfvJ938ipmdhRLUToMmXPZTZXZuNXYqWFAab0TbkT042cd1lGCiL7VefNiE9mlyuJKZ6E
 tGIAXHhe5wUDlEgNadQ5OLnVwxUrnv4RGsT2h2TJjC/XrFnKFTAhiDluV0Qxcz2iwLzsg9/7P8N
 FsPytP6zcFG+vIMMvEg9VDpGOSwF9gYN2YlwngJA9M+gaj5rE0kUlhgTNpJsa0H01s3lQdfNhX7
 +hOsGGkltlbtfEyvY42Y22Q1N/YMyg9y3j9/iSh2eG8cIzV7d+MFLPtiii2Y2LB5GjJ7UkM1N9C
 Bw9hqjjVMfXfxWiDiESk468I7mbqX+tmbOwpO1e454V2U3gj2D+3253kVBv1ov743aGv5hayHYe
 ejwb2+jNqbV0YWtf+7nzBmOZJsD3SA==
X-Proofpoint-ORIG-GUID: wTL1SPr9rf310zdH0mCR4Qtoej9yIHwT
X-Authority-Analysis: v=2.4 cv=bodBxUai c=1 sm=1 tr=0 ts=68ebd60f cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=Fn2TP4Vc3OsuT4lKjqUA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: wTL1SPr9rf310zdH0mCR4Qtoej9yIHwT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-12_06,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0 suspectscore=0
 bulkscore=0 priorityscore=1501 clxscore=1015 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510110018

The value of the PIPE property depends on the number of pipes available
on the platform and is frequently the only difference between several
fw_caps. In order to reduce duplciation, use num_vpp_pipe from the
iris_platform_data rather than hardcoding the value into the fw_cap.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_ctrls.c            | 6 +++++-
 drivers/media/platform/qcom/iris/iris_platform_gen2.c    | 4 ++--
 drivers/media/platform/qcom/iris/iris_platform_qcs8300.h | 4 ++--
 drivers/media/platform/qcom/iris/iris_platform_sm8250.c  | 4 ++--
 4 files changed, 11 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.c b/drivers/media/platform/qcom/iris/iris_ctrls.c
index 0e9adb3982a49cfd7cbe5110cfd5f573f0f7bb38..8db3fa222bdb92a7ffff3dfe62d33f16c0550757 100644
--- a/drivers/media/platform/qcom/iris/iris_ctrls.c
+++ b/drivers/media/platform/qcom/iris/iris_ctrls.c
@@ -318,7 +318,11 @@ void iris_session_init_caps(struct iris_core *core)
 			continue;
 
 		core->inst_fw_caps_dec[cap_id].idx = i;
-		core->inst_fw_caps_dec[cap_id].value = caps[i].value;
+		if (cap_id == PIPE)
+			core->inst_fw_caps_dec[cap_id].value =
+				core->iris_platform_data->num_vpp_pipe;
+		else
+			core->inst_fw_caps_dec[cap_id].value = caps[i].value;
 	}
 
 	caps = core->iris_platform_data->inst_fw_caps_enc;
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
index b444e816355624bca8248cce9da7adcd7caf6c5b..7ad03a800356ae9fb73bdbd6d09928d0b500cb3c 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
@@ -161,9 +161,9 @@ static const struct platform_inst_fw_cap inst_fw_cap_sm8550_dec[] = {
 	{
 		.cap_id = PIPE,
 		.min = PIPE_1,
-		.max = PIPE_4,
+		/* .max is set via platform data */
 		.step_or_mask = 1,
-		.value = PIPE_4,
+		/* .value is set via platform data */
 		.hfi_id = HFI_PROP_PIPE,
 		.set = iris_set_pipe,
 	},
diff --git a/drivers/media/platform/qcom/iris/iris_platform_qcs8300.h b/drivers/media/platform/qcom/iris/iris_platform_qcs8300.h
index 87517361a1cf4b6fe53b8a1483188670df52c7e7..612526a938eed0554fc0da99e12c26d22e04bb6e 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_qcs8300.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_qcs8300.h
@@ -147,9 +147,9 @@ static const struct platform_inst_fw_cap inst_fw_cap_qcs8300_dec[] = {
 	{
 		.cap_id = PIPE,
 		.min = PIPE_1,
-		.max = PIPE_2,
+		/* .max is set via platform data */
 		.step_or_mask = 1,
-		.value = PIPE_2,
+		/* .value is set via platform data */
 		.hfi_id = HFI_PROP_PIPE,
 		.set = iris_set_pipe,
 	},
diff --git a/drivers/media/platform/qcom/iris/iris_platform_sm8250.c b/drivers/media/platform/qcom/iris/iris_platform_sm8250.c
index 66a5bdd24d8a0e98b0554a019438bf4caa1dc43c..2b3b8bd00a6096acaae928318d9231847ec89855 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_sm8250.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_sm8250.c
@@ -21,9 +21,9 @@ static const struct platform_inst_fw_cap inst_fw_cap_sm8250_dec[] = {
 	{
 		.cap_id = PIPE,
 		.min = PIPE_1,
-		.max = PIPE_4,
+		/* .max is set via platform data */
 		.step_or_mask = 1,
-		.value = PIPE_4,
+		/* .value is set via platform data */
 		.hfi_id = HFI_PROPERTY_PARAM_WORK_ROUTE,
 		.set = iris_set_pipe,
 	},

-- 
2.47.3


