Return-Path: <linux-media+bounces-44228-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FFEDBD12D0
	for <lists+linux-media@lfdr.de>; Mon, 13 Oct 2025 04:09:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 678714E8A95
	for <lists+linux-media@lfdr.de>; Mon, 13 Oct 2025 02:09:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 775A32D9ECB;
	Mon, 13 Oct 2025 02:09:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b+2rrARX"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0056927E045
	for <linux-media@vger.kernel.org>; Mon, 13 Oct 2025 02:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760321347; cv=none; b=aKk440YUFilgTbVSFyN/r/B7lH8HnixfQgkV44SMgSP/EUVVM2XDTp28HOIGDRiuuP7ktYO+YiW3r+fZ2ceAzYbjKWEmwPzejIu5tIe1dsUzDmKfSgvmZCpvmLf4BCV0FtYVxs5l7TeU+V9aJoe3gp3FS6AUXFLfhgwtpW/I82I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760321347; c=relaxed/simple;
	bh=uoVbn3VVUUigPywid2f2V13SpTXgIyshJR5BshILzqU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MMmXpDwxYb0WC3qbOfb8AczGa2wLN28jpyNwDiekfsfoANB/Fv5T1TaRHZF6JZ0avP3UaD6GAKvQiShBntkLKxFto29qfkOLMqxhdV7/97ltmXXDrm7d4ZzWs21VitMnxa0FNpi9RFmKjyphuJCi8CkOuAhmYkLe/2oD6zXm+fw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b+2rrARX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59CMLrcW017623
	for <linux-media@vger.kernel.org>; Mon, 13 Oct 2025 02:09:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	j7hD3U2/iftBn6nPxqDaD4P+oLTZnUv6Tt0CD8XpPOk=; b=b+2rrARXi5ld0C7U
	SKEBLTrxL+eBSnli+3URaxZ+aHIvTURZR8zC6SGB0jQKa2MwJsztMxrj4LcpnEfe
	/x6NpM41tYMcS4pEOoPp2wSUWnva6o4d8MckMy7bXbCRPmAUy7N1MZaknnZp+f7Z
	/gzbiPsBabYOKG2KMs8xuF2q9Nt3IFkBzyNYybVg+Rf5+2fy/KtkfhjVYYuwgW4P
	JzmRcJgQXRxz4lEI71b4dTqgy6TR8keSHXBX1ZG2UYvWARZa1gFxQT1tXh2kUiKG
	dLnqHrY8L2auU5C9sEhLMvF7dxTaiMZb+fci79KPdGLq9rwXOH0U6OYXrwQoACQi
	vi9BtQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfby2y6a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 13 Oct 2025 02:09:04 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8892285b436so315453785a.0
        for <linux-media@vger.kernel.org>; Sun, 12 Oct 2025 19:09:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760321344; x=1760926144;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j7hD3U2/iftBn6nPxqDaD4P+oLTZnUv6Tt0CD8XpPOk=;
        b=L3H9AxfmxwK33y0S6snS3prf4Mcg0W0p61/auZzKUA4B728RbsiXtHBj/PA8pTyLaz
         UJhuNqksq6LV5W+dHyZgb/V/Jo9DLC+h1p/JH900FIuDJZul1bJ+sryCb7O0J4FCbx9W
         rMU0QE4URaD3Czbh0g3rqjuNe3NsXw95GsPw/4OlHyPw9QfBwy9ZM6I+DEjqD4zT3/ke
         5gTkn6gNqGK5IAH3ziOmfpAZApacnSaAK0tCZHSmvRtXIICeyhxQqjJz54c/drHv01Au
         3kalY2WDQBH01YRNKXVzY0qe+UK9wRvcGENT36c3wlz/NIraijeg9GiXJRPgkcoz9gAr
         eW9g==
X-Gm-Message-State: AOJu0YzeADVZWSYSVdQSGMJ4WwI3b6xmKyjDwN05cISuovE4SFvwm6SR
	s6uoVKjSAardiHnYiZ7qCEeY00MyHmYYJjPYKeI/DS/N/0GgSEZGFdXQ7M7VpwgzCJYhe/ZUPIt
	1A5oAdDe6MucTgCaSx/8W3fqjkkKEAR1F0TfY8WmHSj1IFNL7a6UAu/IMD/PWnRSOKA==
X-Gm-Gg: ASbGncsj5jQtBs5DykBsPJCPUx2nWhdJ+3H6GK1lhHnlhgwUT4+zxCHTc0mh2blX6k+
	4TlKnj4A87jYewSN3nlAJF1rGly0S/v86tDRxESv60L7H1J8UcY2f1+f+3R0+H/Uf2QgbV4lOdk
	CDxdR4sM+EyOXHJzqABet4R0pbnlJfnfDFRyTJheZFwS2OOqAp4GxF9PAjbskU4Db7KSn0PJDTk
	Tfak7KQg8WBPmlCVjQyVkB1DThZTt7QLxk/+MHmBHzFJ35r9yOuAoPSrcXAPnWN5/uUK3J8GvvB
	hw6PAjJLYI3WcCBDje1a/hCwS94amCcrF6Ivegnb51EYqqy0hmiq7E79obahjlnl2pW35xFTzPD
	+EVWKI93qcA0dJpZ9l0pqOS0WNtdiwCFx/ENDk4IFGsTfyuE5h6Mk
X-Received: by 2002:ac8:5d04:0:b0:4b0:8890:105e with SMTP id d75a77b69052e-4e6eacb2f3fmr299040741cf.2.1760321343803;
        Sun, 12 Oct 2025 19:09:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFg9IS6kDYK0T9iuv5+5IKPmABEcvmmR+Hu2ZOr9fhDnfEnA2k3E7/moaPiHre7oJQH2DJs7w==
X-Received: by 2002:ac8:5d04:0:b0:4b0:8890:105e with SMTP id d75a77b69052e-4e6eacb2f3fmr299040461cf.2.1760321343363;
        Sun, 12 Oct 2025 19:09:03 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-590881e4f99sm3563419e87.7.2025.10.12.19.09.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Oct 2025 19:09:02 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 13 Oct 2025 05:08:56 +0300
Subject: [PATCH v3 2/8] media: iris: turn platform data into constants
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251013-iris-sc7280-v3-2-f3bceb77a250@oss.qualcomm.com>
References: <20251013-iris-sc7280-v3-0-f3bceb77a250@oss.qualcomm.com>
In-Reply-To: <20251013-iris-sc7280-v3-0-f3bceb77a250@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4265;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=uoVbn3VVUUigPywid2f2V13SpTXgIyshJR5BshILzqU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBo7F85wT360XX5JJ5aVEXCPwFeNzXXzItY1KvTt
 Klk0f3RqGiJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaOxfOQAKCRCLPIo+Aiko
 1cuYB/9eE/F3PizE+HSWV/gj/yb2/fZ7u38lHtfvb9s7aGBbFBQrQ1/7CnhtW/1jgTvTxMDX7O6
 rCdz4zf6SvEQZZdbHybkybwoRxwMMSbb6hTrvsczv6Z3Q1abmZvD8dcrvxY/5DAA3zrde+N/x1u
 HjrpcYTUDJ1ztgFsPqEUViFsSEZV0k0Lq+1RpqdJjcGi3u9c+t4y3WP1DSes7YW2HExAUAks2WG
 qVCztx1hBwE8pVQEHKSeB7O3FHV8GPSbPdAoMa+GJfEqI4x4i2bVsgLhg+6egi/mWlCgf7jAh2R
 GGnbmJYqd7MDwFl3kxToQozl5OvfzyH3NPdWuO8uplFCCw08
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxOCBTYWx0ZWRfX72CPju6PsQlL
 zAlZdL5HUPo2kLQ6sLUjM9Tkdi7/dk8gLp9LBXFqYhAblTOmOXVtT5tCiC1m12muwSsnFsCfRun
 kLIxkYllkqdZfrfGsHR7eHF7azK/B5naUApl3/GgzTTzOj2aiv9p07CiPY7Jquf35MXOo/I0PBU
 Lx99SK8UbRwcxJhVMNQn/87CPmfa5crpYoHDqepbe2KvYsBpcvpJ+LkVnwMXyqjNp1CP8BQtuV/
 noDTTjIpzpT4NZHXJtbGl4wGhOCzfpHDoDP85803hDa49MlOLxYedq8Ttl6Hz80iQDk8A9XKgsT
 rioKoAqx1n0jVeQpjvzmlmEHjrVBaIFQ73LzBjqPapbiXsYUkXRLREWU4zDYctAZqCpvNCxKmtV
 E0LqjO5IynxG3wBYBEe9n89cihWfIA==
X-Proofpoint-GUID: KxTAD4VWZ4NhUlrt8Y02bFhMUgYsOUEU
X-Proofpoint-ORIG-GUID: KxTAD4VWZ4NhUlrt8Y02bFhMUgYsOUEU
X-Authority-Analysis: v=2.4 cv=A+Bh/qWG c=1 sm=1 tr=0 ts=68ec5f40 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=x6icFKpwvdMA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=vHBkZ3WG4vhFy3QD8MgA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-13_01,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 spamscore=0 clxscore=1015 bulkscore=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110018

Make all struct iris_platform_data instances constant, they are not
modified at runtime.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_platform_common.h | 10 +++++-----
 drivers/media/platform/qcom/iris/iris_platform_gen2.c   |  8 ++++----
 drivers/media/platform/qcom/iris/iris_platform_sm8250.c |  2 +-
 3 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index 17ed86bf78bb3b0bc3f0862253fba6505ac3d164..5ffc1874e8c6362b1c650e912c230e9c4e3bd160 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -41,11 +41,11 @@ enum pipe_type {
 	PIPE_4 = 4,
 };
 
-extern struct iris_platform_data qcs8300_data;
-extern struct iris_platform_data sm8250_data;
-extern struct iris_platform_data sm8550_data;
-extern struct iris_platform_data sm8650_data;
-extern struct iris_platform_data sm8750_data;
+extern const struct iris_platform_data qcs8300_data;
+extern const struct iris_platform_data sm8250_data;
+extern const struct iris_platform_data sm8550_data;
+extern const struct iris_platform_data sm8650_data;
+extern const struct iris_platform_data sm8750_data;
 
 enum platform_clk_type {
 	IRIS_AXI_CLK, /* AXI0 in case of platforms with multiple AXI clocks */
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
index cbf38e13f89e5c4c46e759fbb86777854d751552..b444e816355624bca8248cce9da7adcd7caf6c5b 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
@@ -737,7 +737,7 @@ static const u32 sm8550_enc_op_int_buf_tbl[] = {
 	BUF_SCRATCH_2,
 };
 
-struct iris_platform_data sm8550_data = {
+const struct iris_platform_data sm8550_data = {
 	.get_instance = iris_hfi_gen2_get_instance,
 	.init_hfi_command_ops = iris_hfi_gen2_command_ops_init,
 	.init_hfi_response_ops = iris_hfi_gen2_response_ops_init,
@@ -827,7 +827,7 @@ struct iris_platform_data sm8550_data = {
  * - controller_rst_tbl to sm8650_controller_reset_table
  * - fwname to "qcom/vpu/vpu33_p4.mbn"
  */
-struct iris_platform_data sm8650_data = {
+const struct iris_platform_data sm8650_data = {
 	.get_instance = iris_hfi_gen2_get_instance,
 	.init_hfi_command_ops = iris_hfi_gen2_command_ops_init,
 	.init_hfi_response_ops = iris_hfi_gen2_response_ops_init,
@@ -912,7 +912,7 @@ struct iris_platform_data sm8650_data = {
 	.enc_op_int_buf_tbl_size = ARRAY_SIZE(sm8550_enc_op_int_buf_tbl),
 };
 
-struct iris_platform_data sm8750_data = {
+const struct iris_platform_data sm8750_data = {
 	.get_instance = iris_hfi_gen2_get_instance,
 	.init_hfi_command_ops = iris_hfi_gen2_command_ops_init,
 	.init_hfi_response_ops = iris_hfi_gen2_response_ops_init,
@@ -998,7 +998,7 @@ struct iris_platform_data sm8750_data = {
  * - inst_caps to platform_inst_cap_qcs8300
  * - inst_fw_caps to inst_fw_cap_qcs8300
  */
-struct iris_platform_data qcs8300_data = {
+const struct iris_platform_data qcs8300_data = {
 	.get_instance = iris_hfi_gen2_get_instance,
 	.init_hfi_command_ops = iris_hfi_gen2_command_ops_init,
 	.init_hfi_response_ops = iris_hfi_gen2_response_ops_init,
diff --git a/drivers/media/platform/qcom/iris/iris_platform_sm8250.c b/drivers/media/platform/qcom/iris/iris_platform_sm8250.c
index e29cba993fde922b579eb7e5a59ae34bb46f9f0f..66a5bdd24d8a0e98b0554a019438bf4caa1dc43c 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_sm8250.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_sm8250.c
@@ -314,7 +314,7 @@ static const u32 sm8250_enc_ip_int_buf_tbl[] = {
 	BUF_SCRATCH_2,
 };
 
-struct iris_platform_data sm8250_data = {
+const struct iris_platform_data sm8250_data = {
 	.get_instance = iris_hfi_gen1_get_instance,
 	.init_hfi_command_ops = &iris_hfi_gen1_command_ops_init,
 	.init_hfi_response_ops = iris_hfi_gen1_response_ops_init,

-- 
2.47.3


