Return-Path: <linux-media+bounces-60347-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AFniBYWY+Wmo+AIAu9opvQ
	(envelope-from <linux-media+bounces-60347-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 05 May 2026 09:13:09 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F72E4C7ABC
	for <lists+linux-media@lfdr.de>; Tue, 05 May 2026 09:13:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D9AF530DCB0B
	for <lists+linux-media@lfdr.de>; Tue,  5 May 2026 07:03:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1980A3E5ED1;
	Tue,  5 May 2026 07:01:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GB+Fp1CK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dgqnudDM"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB3523DB655
	for <linux-media@vger.kernel.org>; Tue,  5 May 2026 07:01:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777964486; cv=none; b=gX6wHkuo7VlTHDcPfKHrCt6uLnwNu6l794dZSIQjMlh5WQOO6f9rzPDS4PUa/KRzQeB3v0EOyiMDTaSKqoqIWQgFfd+4mi8wMb121LG+kUUYF7vzA+8m+oBoZbtPCrSOBtDsIgpVGm8vtUfP8EVnxEWeeoLpF5VITOcaSgawZGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777964486; c=relaxed/simple;
	bh=70xFrnhgQm5w7ycFVlFn4+YpXwENh5y/BrI0x6UYWi4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NhYVttouu9gkeJsyOzrrRaFeZuTek5ZPgi8cUYIHF4rwN1irF6qkYyifueJTgRijob7pHr3dD1kx671EUNSC4eA69PrW09NokUVOgzSaOX1X7z0Ty1SfgBgdEaOXU4ag8+JKqJoxZXihMr/TYgoeEAGBEXkjTZ7Bq2Z67WfnB8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GB+Fp1CK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dgqnudDM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6454LTPO4128680
	for <linux-media@vger.kernel.org>; Tue, 5 May 2026 07:01:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kfW5uTXNcQiD+zRKKbRk7ZRairYKuRP1etGcVg/k4f4=; b=GB+Fp1CKJN6tG3Ks
	rF2DqPXJY6Dq/tg+CgGX30ut1aa86Rj2iFiuQr1u9Aixr5waEh/GrJLR882kBhxL
	D3Yfg6AUy0zDnDhVAVGH/psLztE3RQzTSL5SHOyEt/JD2HVTFfUCo2n1E8lR11KP
	sAV8ysuZtyYXH8iYUy8jRTjCK4SYLi+0IfemWO8lWk6RIQATdI8QqkiLPwM39gEg
	2ponL4KGzFkWjR2EFhMiDEb/zUDpyLpkrTHfl4ShFcwpsKiPcAUw3Ux9EJEa5atp
	d+z2jhNR+htZF2jgrmC2bfW/St3xzaMueJa+usAqxKmbSIFVnQn6RJHlMM25zOIm
	ClS2AA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dxsdw3uqb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 05 May 2026 07:01:23 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-362eb03240bso6127327a91.3
        for <linux-media@vger.kernel.org>; Tue, 05 May 2026 00:01:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777964483; x=1778569283; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kfW5uTXNcQiD+zRKKbRk7ZRairYKuRP1etGcVg/k4f4=;
        b=dgqnudDMC7aZdyLviGbfAehiQPptc66957FJPfyiLKTZYk+1YxSWFJr1GWS4uoRZCT
         p+n4fOVGa50+WlyVRTveIeRgsXEGu1kgfdndn9H63hys9k9+6qnrxpYM05mQC15vvlpf
         YeFcUejS6n+jhHDIbUJdIhP85ZWfC8T24mpCfzAaDdQ6ps71wxnDbO/p5ub+bvKQH94v
         f5KPDa2ee0pDcpQbSSsSKUfp+u3ZzuOopeyvarbbtDmEAzbL6k4VOLsk5A3R/1NLrn3u
         bFPt8eh+fqNJs1xHnRhqs6lFCTWOlt10JnKFWPEHzhxg9f7byCR1ryowvVXr/rl3Jx8X
         Tx7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777964483; x=1778569283;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kfW5uTXNcQiD+zRKKbRk7ZRairYKuRP1etGcVg/k4f4=;
        b=ASRDicyuqRg3RkCUGVk+9KTyjbj1NHC/xYCFEc6GGSDzLGLCzZKkxBRXOnj+m2a9U1
         n283ayVAJ5ymMH7NEivP8GPox5VaJHbVw3OwZKgxcD49NtkpfXJjXmV6rngAR0kgSadB
         jpiyu9NJvMNiuqL5MmtZ+fjG5A993ALCazTFOwn0OOEPvnnsAgVdk34bkPayg0u/p5xP
         Pz3XTUlvkwUTXh4J4J8BEdtZ1vqJMUywEFXOgeIpc2pZo6Iv+zaQWF7Vr1nfW1azsDoJ
         luatCCvpouKIGr04tIAoOjB2PjlWtwmvddU+Mgy//AWlMGoMebsTgQqZs6f1NygkD9tL
         Zr7w==
X-Gm-Message-State: AOJu0Yx1m4VSd8fGClzt4l2QdeNym2JDn6+0rXLx4hdPfaz6GeM+kwR1
	vSl+RdGHvkYkAbjPV4N6Z2++dOH0f4fWV1OrMpdsymEpD1oDHU58fMl3ubI0WKEsdUBaCOZuS9X
	ByGGZpEjDKoVWeTcvGkvrM054DuwICA9X7AcLBkdJzh6BHYkURhEBU0jtGDSWS/7A+w==
X-Gm-Gg: AeBDieuytd1Qek+QMstdU7fpUvdlsSVe7anU/6SIArqDpl5PiqMzsISoZ3ErJ1vq0iH
	Y5z7Vla2QOqAeN11bBT+bkoQd14SY3dbn0F5Zsv+DYDj0Epz7thLeliT0b8ZGbUBFGZQvmPJLdb
	0+lIzktN8oznA9ei1MoWumrdneDcXoXhguOzW6s8yZ4NxYaPJg0knoz6aBegwYcKDuIFZV6utkr
	jD/I+5Mr2JInLLodUGfhfw/eelRBhJn45zcHR2+poPFk0REZKknhkhsl/PG9BhD6vCedQMB0wih
	vP7Q6NnGTBe9vQmwx6vILUOoOT7NlLOSM+O6uBBU3J8NpDz0BkYYfIIPq7OOeyckhaRhWtbzjYC
	0rudea2VTfWbOseSXD4xWLuGTTP9loRpytAIKOjv1BWXfGPN+PiSG84PywtWP4bQYyA==
X-Received: by 2002:a17:90b:278f:b0:35d:a542:2dcb with SMTP id 98e67ed59e1d1-3650cdffacemr12905286a91.16.1777964482295;
        Tue, 05 May 2026 00:01:22 -0700 (PDT)
X-Received: by 2002:a17:90b:278f:b0:35d:a542:2dcb with SMTP id 98e67ed59e1d1-3650cdffacemr12905224a91.16.1777964481507;
        Tue, 05 May 2026 00:01:21 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-364ebec73aasm13840146a91.2.2026.05.05.00.01.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 00:01:21 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Tue, 05 May 2026 12:29:29 +0530
Subject: [PATCH v4 08/13] media: iris: Rename clock and power domain macros
 to use vcodec prefix
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260505-glymur-v4-8-17571dbd1caa@oss.qualcomm.com>
References: <20260505-glymur-v4-0-17571dbd1caa@oss.qualcomm.com>
In-Reply-To: <20260505-glymur-v4-0-17571dbd1caa@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        iommu@lists.linux.dev, Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777964421; l=16678;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=70xFrnhgQm5w7ycFVlFn4+YpXwENh5y/BrI0x6UYWi4=;
 b=yHOQ0N/ThPssYi9PHbCCRgWWT4F7VXwIBmYiayUppl/N2GmnfpAThSMg97ZaFAaCzQRbQ3oxE
 yE9BdCRbFVACw0gsX8FDoDKXrHoj+RnqRQEUOJCL3Kr6JPUpBrXyH3e
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Authority-Analysis: v=2.4 cv=a7AAM0SF c=1 sm=1 tr=0 ts=69f995c3 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=kpNcZxiqwdVgWfiEekEA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: 3jMocRIQdWX8S7MFy7CaIgQOIUVsBdCc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA1MDA2MyBTYWx0ZWRfXy/nJfceB7CPV
 Nf1J2oqWV5ja1iotelMrwdiwRL7xCR5M9pJr4Wyh/Vz916zWD5RXjvZFfcxgLQZHiqA7z9jTFV4
 k+TQOCwhkDO9gtuv98wc/PFAyID03xIzuN2RCmorIz3++6nj2hfVhs6kegPtoIYU/nJJ6uJ6Qv8
 9k9b7SomMQSDchuxJ1q3h2Q8w6aiyhHydv/gIWo0GmSce+wRHI/JWvfO7X5gpv1QKPzd6gwGxnq
 qrNUWUgEsIsIFXWqb2nKz9kgqKVTtmYS9/uMZIM0gu29FSbQhMUD2WAIRqwol+bJkh8NdKZmCNY
 p00s655ssc+37FiEaKRuZF+LcLOh+CALfSVFMQfMUS/rG6UjLMBUbg6FC0ria6OIrmvX5SFTECu
 5IFiRTd+E9kMej0ktcO/o4lESN640RBRu/AJW23SLMZL58nXN6xS6cLVl7QICDOhYJnhub4TOIA
 MNJnfz8q6faRTTm/c2A==
X-Proofpoint-ORIG-GUID: 3jMocRIQdWX8S7MFy7CaIgQOIUVsBdCc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_02,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 spamscore=0 adultscore=0 clxscore=1015
 suspectscore=0 priorityscore=1501 malwarescore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605050063
X-Rspamd-Queue-Id: 9F72E4C7ABC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-60347-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,linux.dev,kernel.org,linaro.org,gmail.com,8bytes.org,arm.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[busanna.reddy@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

The current clock and power domain enum names are too generic. Rename
them with a vcodec prefix to make the names more meaningful and to easily
accommodate vcodec1 enums for the secondary core for glymur platform.

No functional changes intended.

Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 .../platform/qcom/iris/iris_platform_common.h      | 12 ++++----
 .../media/platform/qcom/iris/iris_platform_gen1.c  |  6 ++--
 .../media/platform/qcom/iris/iris_platform_gen2.c  |  6 ++--
 .../platform/qcom/iris/iris_platform_sc7280.h      | 10 +++----
 .../platform/qcom/iris/iris_platform_sm8750.h      | 12 ++++----
 drivers/media/platform/qcom/iris/iris_vpu3x.c      | 21 +++++++-------
 drivers/media/platform/qcom/iris/iris_vpu4x.c      | 30 +++++++++++---------
 drivers/media/platform/qcom/iris/iris_vpu_common.c | 33 +++++++++++-----------
 8 files changed, 67 insertions(+), 63 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index 55ff6137d9a9..30e9d4d288c6 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -49,14 +49,14 @@ extern const struct iris_platform_data sm8650_data;
 extern const struct iris_platform_data sm8750_data;
 
 enum platform_clk_type {
-	IRIS_AXI_CLK, /* AXI0 in case of platforms with multiple AXI clocks */
+	IRIS_AXI_VCODEC_CLK,
 	IRIS_CTRL_CLK,
 	IRIS_AHB_CLK,
-	IRIS_HW_CLK,
-	IRIS_HW_AHB_CLK,
-	IRIS_AXI1_CLK,
+	IRIS_VCODEC_CLK,
+	IRIS_VCODEC_AHB_CLK,
+	IRIS_AXI_CTRL_CLK,
 	IRIS_CTRL_FREERUN_CLK,
-	IRIS_HW_FREERUN_CLK,
+	IRIS_VCODEC_FREERUN_CLK,
 	IRIS_BSE_HW_CLK,
 	IRIS_VPP0_HW_CLK,
 	IRIS_VPP1_HW_CLK,
@@ -206,7 +206,7 @@ struct icc_vote_data {
 
 enum platform_pm_domain_type {
 	IRIS_CTRL_POWER_DOMAIN,
-	IRIS_HW_POWER_DOMAIN,
+	IRIS_VCODEC_POWER_DOMAIN,
 	IRIS_VPP0_HW_POWER_DOMAIN,
 	IRIS_VPP1_HW_POWER_DOMAIN,
 	IRIS_APV_HW_POWER_DOMAIN,
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen1.c b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
index df8e6bf9430e..be6a631f8ede 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen1.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
@@ -284,9 +284,9 @@ static const char * const sm8250_pmdomain_table[] = { "venus", "vcodec0" };
 static const char * const sm8250_opp_pd_table[] = { "mx" };
 
 static const struct platform_clk_data sm8250_clk_table[] = {
-	{IRIS_AXI_CLK,  "iface"        },
-	{IRIS_CTRL_CLK, "core"         },
-	{IRIS_HW_CLK,   "vcodec0_core" },
+	{IRIS_AXI_VCODEC_CLK,	"iface"		},
+	{IRIS_CTRL_CLK,		"core"		},
+	{IRIS_VCODEC_CLK,	"vcodec0_core"	},
 };
 
 static const char * const sm8250_opp_clk_table[] = {
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
index 5da90d47f9c6..47c6b650f0b4 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
@@ -780,9 +780,9 @@ static const char * const sm8550_pmdomain_table[] = { "venus", "vcodec0" };
 static const char * const sm8550_opp_pd_table[] = { "mxc", "mmcx" };
 
 static const struct platform_clk_data sm8550_clk_table[] = {
-	{IRIS_AXI_CLK,  "iface"        },
-	{IRIS_CTRL_CLK, "core"         },
-	{IRIS_HW_CLK,   "vcodec0_core" },
+	{IRIS_AXI_VCODEC_CLK,	"iface"		},
+	{IRIS_CTRL_CLK,		"core"		},
+	{IRIS_VCODEC_CLK,	"vcodec0_core"	},
 };
 
 static const char * const sm8550_opp_clk_table[] = {
diff --git a/drivers/media/platform/qcom/iris/iris_platform_sc7280.h b/drivers/media/platform/qcom/iris/iris_platform_sc7280.h
index 0ec8f334df67..6b783e524b81 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_sc7280.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_sc7280.h
@@ -16,11 +16,11 @@ static const struct bw_info sc7280_bw_table_dec[] = {
 static const char * const sc7280_opp_pd_table[] = { "cx" };
 
 static const struct platform_clk_data sc7280_clk_table[] = {
-	{IRIS_CTRL_CLK,    "core"         },
-	{IRIS_AXI_CLK,     "iface"        },
-	{IRIS_AHB_CLK,     "bus"          },
-	{IRIS_HW_CLK,      "vcodec_core"  },
-	{IRIS_HW_AHB_CLK,  "vcodec_bus"   },
+	{IRIS_CTRL_CLK,		"core"		},
+	{IRIS_AXI_VCODEC_CLK,	"iface"		},
+	{IRIS_AHB_CLK,		"bus"		},
+	{IRIS_VCODEC_CLK,	"vcodec_core"	},
+	{IRIS_VCODEC_AHB_CLK,	"vcodec_bus"	},
 };
 
 static const char * const sc7280_opp_clk_table[] = {
diff --git a/drivers/media/platform/qcom/iris/iris_platform_sm8750.h b/drivers/media/platform/qcom/iris/iris_platform_sm8750.h
index 719056656a5b..f843f13251c5 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_sm8750.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_sm8750.h
@@ -11,12 +11,12 @@ static const char * const sm8750_clk_reset_table[] = {
 };
 
 static const struct platform_clk_data sm8750_clk_table[] = {
-	{IRIS_AXI_CLK,		"iface"			},
-	{IRIS_CTRL_CLK,		"core"			},
-	{IRIS_HW_CLK,		"vcodec0_core"		},
-	{IRIS_AXI1_CLK,		"iface1"		},
-	{IRIS_CTRL_FREERUN_CLK,	"core_freerun"		},
-	{IRIS_HW_FREERUN_CLK,	"vcodec0_core_freerun"	},
+	{IRIS_AXI_VCODEC_CLK,		"iface"			},
+	{IRIS_CTRL_CLK,			"core"			},
+	{IRIS_VCODEC_CLK,		"vcodec0_core"		},
+	{IRIS_AXI_CTRL_CLK,		"iface1"		},
+	{IRIS_CTRL_FREERUN_CLK,		"core_freerun"		},
+	{IRIS_VCODEC_FREERUN_CLK,	"vcodec0_core_freerun"	},
 };
 
 #endif
diff --git a/drivers/media/platform/qcom/iris/iris_vpu3x.c b/drivers/media/platform/qcom/iris/iris_vpu3x.c
index 3dad47be78b5..834194cb5513 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu3x.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu3x.c
@@ -209,7 +209,7 @@ static int iris_vpu33_power_off_controller(struct iris_core *core)
 
 disable_power:
 	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_CTRL_POWER_DOMAIN]);
-	iris_disable_unprepare_clock(core, IRIS_AXI_CLK);
+	iris_disable_unprepare_clock(core, IRIS_AXI_VCODEC_CLK);
 
 	return 0;
 }
@@ -218,30 +218,31 @@ static int iris_vpu35_power_on_hw(struct iris_core *core)
 {
 	int ret;
 
-	ret = iris_enable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN]);
+	ret = iris_enable_power_domains(core,
+					core->pmdomain_tbl->pd_devs[IRIS_VCODEC_POWER_DOMAIN]);
 	if (ret)
 		return ret;
 
-	ret = iris_prepare_enable_clock(core, IRIS_AXI_CLK);
+	ret = iris_prepare_enable_clock(core, IRIS_AXI_VCODEC_CLK);
 	if (ret)
 		goto err_disable_power;
 
-	ret = iris_prepare_enable_clock(core, IRIS_HW_FREERUN_CLK);
+	ret = iris_prepare_enable_clock(core, IRIS_VCODEC_FREERUN_CLK);
 	if (ret)
 		goto err_disable_axi_clk;
 
-	ret = iris_prepare_enable_clock(core, IRIS_HW_CLK);
+	ret = iris_prepare_enable_clock(core, IRIS_VCODEC_CLK);
 	if (ret)
 		goto err_disable_hw_free_clk;
 
 	return 0;
 
 err_disable_hw_free_clk:
-	iris_disable_unprepare_clock(core, IRIS_HW_FREERUN_CLK);
+	iris_disable_unprepare_clock(core, IRIS_VCODEC_FREERUN_CLK);
 err_disable_axi_clk:
-	iris_disable_unprepare_clock(core, IRIS_AXI_CLK);
+	iris_disable_unprepare_clock(core, IRIS_AXI_VCODEC_CLK);
 err_disable_power:
-	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN]);
+	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_VCODEC_POWER_DOMAIN]);
 
 	return ret;
 }
@@ -250,8 +251,8 @@ static void iris_vpu35_power_off_hw(struct iris_core *core)
 {
 	iris_vpu33_power_off_hardware(core);
 
-	iris_disable_unprepare_clock(core, IRIS_HW_FREERUN_CLK);
-	iris_disable_unprepare_clock(core, IRIS_AXI_CLK);
+	iris_disable_unprepare_clock(core, IRIS_VCODEC_FREERUN_CLK);
+	iris_disable_unprepare_clock(core, IRIS_AXI_VCODEC_CLK);
 }
 
 const struct vpu_ops iris_vpu3_ops = {
diff --git a/drivers/media/platform/qcom/iris/iris_vpu4x.c b/drivers/media/platform/qcom/iris/iris_vpu4x.c
index 02e100a4045f..92c0b06bbbff 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu4x.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu4x.c
@@ -27,7 +27,8 @@ static int iris_vpu4x_genpd_set_hwmode(struct iris_core *core, bool hw_mode, u32
 {
 	int ret;
 
-	ret = dev_pm_genpd_set_hwmode(core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN], hw_mode);
+	ret = dev_pm_genpd_set_hwmode(core->pmdomain_tbl->pd_devs[IRIS_VCODEC_POWER_DOMAIN],
+				      hw_mode);
 	if (ret)
 		return ret;
 
@@ -63,7 +64,7 @@ static int iris_vpu4x_genpd_set_hwmode(struct iris_core *core, bool hw_mode, u32
 		dev_pm_genpd_set_hwmode(core->pmdomain_tbl->pd_devs[IRIS_VPP0_HW_POWER_DOMAIN],
 					!hw_mode);
 restore_hw_domain_mode:
-	dev_pm_genpd_set_hwmode(core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN], !hw_mode);
+	dev_pm_genpd_set_hwmode(core->pmdomain_tbl->pd_devs[IRIS_VCODEC_POWER_DOMAIN], !hw_mode);
 
 	return ret;
 }
@@ -162,15 +163,15 @@ static int iris_vpu4x_enable_hardware_clocks(struct iris_core *core, u32 efuse_v
 {
 	int ret;
 
-	ret = iris_prepare_enable_clock(core, IRIS_AXI_CLK);
+	ret = iris_prepare_enable_clock(core, IRIS_AXI_VCODEC_CLK);
 	if (ret)
 		return ret;
 
-	ret = iris_prepare_enable_clock(core, IRIS_HW_FREERUN_CLK);
+	ret = iris_prepare_enable_clock(core, IRIS_VCODEC_FREERUN_CLK);
 	if (ret)
 		goto disable_axi_clock;
 
-	ret = iris_prepare_enable_clock(core, IRIS_HW_CLK);
+	ret = iris_prepare_enable_clock(core, IRIS_VCODEC_CLK);
 	if (ret)
 		goto disable_hw_free_run_clock;
 
@@ -198,11 +199,11 @@ static int iris_vpu4x_enable_hardware_clocks(struct iris_core *core, u32 efuse_v
 disable_bse_hw_clock:
 	iris_disable_unprepare_clock(core, IRIS_BSE_HW_CLK);
 disable_hw_clock:
-	iris_disable_unprepare_clock(core, IRIS_HW_CLK);
+	iris_disable_unprepare_clock(core, IRIS_VCODEC_CLK);
 disable_hw_free_run_clock:
-	iris_disable_unprepare_clock(core, IRIS_HW_FREERUN_CLK);
+	iris_disable_unprepare_clock(core, IRIS_VCODEC_FREERUN_CLK);
 disable_axi_clock:
-	iris_disable_unprepare_clock(core, IRIS_AXI_CLK);
+	iris_disable_unprepare_clock(core, IRIS_AXI_VCODEC_CLK);
 
 	return ret;
 }
@@ -216,9 +217,9 @@ static void iris_vpu4x_disable_hardware_clocks(struct iris_core *core, u32 efuse
 		iris_disable_unprepare_clock(core, IRIS_VPP0_HW_CLK);
 
 	iris_disable_unprepare_clock(core, IRIS_BSE_HW_CLK);
-	iris_disable_unprepare_clock(core, IRIS_HW_CLK);
-	iris_disable_unprepare_clock(core, IRIS_HW_FREERUN_CLK);
-	iris_disable_unprepare_clock(core, IRIS_AXI_CLK);
+	iris_disable_unprepare_clock(core, IRIS_VCODEC_CLK);
+	iris_disable_unprepare_clock(core, IRIS_VCODEC_FREERUN_CLK);
+	iris_disable_unprepare_clock(core, IRIS_AXI_VCODEC_CLK);
 }
 
 static int iris_vpu4x_power_on_hardware(struct iris_core *core)
@@ -226,7 +227,8 @@ static int iris_vpu4x_power_on_hardware(struct iris_core *core)
 	u32 efuse_value = readl(core->reg_base + WRAPPER_EFUSE_MONITOR);
 	int ret;
 
-	ret = iris_enable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN]);
+	ret = iris_enable_power_domains(core,
+					core->pmdomain_tbl->pd_devs[IRIS_VCODEC_POWER_DOMAIN]);
 	if (ret)
 		return ret;
 
@@ -267,7 +269,7 @@ static int iris_vpu4x_power_on_hardware(struct iris_core *core)
 		iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs
 						[IRIS_VPP0_HW_POWER_DOMAIN]);
 disable_hw_power_domain:
-	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN]);
+	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_VCODEC_POWER_DOMAIN]);
 
 	return ret;
 }
@@ -345,7 +347,7 @@ static void iris_vpu4x_power_off_hardware(struct iris_core *core)
 		iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs
 					   [IRIS_VPP0_HW_POWER_DOMAIN]);
 
-	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN]);
+	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_VCODEC_POWER_DOMAIN]);
 }
 
 static int iris_vpu4x_set_hwmode(struct iris_core *core)
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers/media/platform/qcom/iris/iris_vpu_common.c
index f1f9e04b7c31..73c094bc4311 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
@@ -213,7 +213,7 @@ int iris_vpu_power_off_controller(struct iris_core *core)
 disable_power:
 	iris_disable_unprepare_clock(core, IRIS_AHB_CLK);
 	iris_disable_unprepare_clock(core, IRIS_CTRL_CLK);
-	iris_disable_unprepare_clock(core, IRIS_AXI_CLK);
+	iris_disable_unprepare_clock(core, IRIS_AXI_VCODEC_CLK);
 	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_CTRL_POWER_DOMAIN]);
 
 	return 0;
@@ -221,10 +221,10 @@ int iris_vpu_power_off_controller(struct iris_core *core)
 
 void iris_vpu_power_off_hw(struct iris_core *core)
 {
-	dev_pm_genpd_set_hwmode(core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN], false);
-	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN]);
-	iris_disable_unprepare_clock(core, IRIS_HW_AHB_CLK);
-	iris_disable_unprepare_clock(core, IRIS_HW_CLK);
+	dev_pm_genpd_set_hwmode(core->pmdomain_tbl->pd_devs[IRIS_VCODEC_POWER_DOMAIN], false);
+	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_VCODEC_POWER_DOMAIN]);
+	iris_disable_unprepare_clock(core, IRIS_VCODEC_AHB_CLK);
+	iris_disable_unprepare_clock(core, IRIS_VCODEC_CLK);
 }
 
 void iris_vpu_power_off(struct iris_core *core)
@@ -251,7 +251,7 @@ int iris_vpu_power_on_controller(struct iris_core *core)
 	if (ret)
 		goto err_disable_power;
 
-	ret = iris_prepare_enable_clock(core, IRIS_AXI_CLK);
+	ret = iris_prepare_enable_clock(core, IRIS_AXI_VCODEC_CLK);
 	if (ret)
 		goto err_disable_power;
 
@@ -268,7 +268,7 @@ int iris_vpu_power_on_controller(struct iris_core *core)
 err_disable_ctrl_clock:
 	iris_disable_unprepare_clock(core, IRIS_CTRL_CLK);
 err_disable_axi_clock:
-	iris_disable_unprepare_clock(core, IRIS_AXI_CLK);
+	iris_disable_unprepare_clock(core, IRIS_AXI_VCODEC_CLK);
 err_disable_power:
 	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_CTRL_POWER_DOMAIN]);
 
@@ -279,31 +279,32 @@ int iris_vpu_power_on_hw(struct iris_core *core)
 {
 	int ret;
 
-	ret = iris_enable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN]);
+	ret = iris_enable_power_domains(core,
+					core->pmdomain_tbl->pd_devs[IRIS_VCODEC_POWER_DOMAIN]);
 	if (ret)
 		return ret;
 
-	ret = iris_prepare_enable_clock(core, IRIS_HW_CLK);
+	ret = iris_prepare_enable_clock(core, IRIS_VCODEC_CLK);
 	if (ret)
 		goto err_disable_power;
 
-	ret = iris_prepare_enable_clock(core, IRIS_HW_AHB_CLK);
+	ret = iris_prepare_enable_clock(core, IRIS_VCODEC_AHB_CLK);
 	if (ret && ret != -ENOENT)
 		goto err_disable_hw_clock;
 
 	return 0;
 
 err_disable_hw_clock:
-	iris_disable_unprepare_clock(core, IRIS_HW_CLK);
+	iris_disable_unprepare_clock(core, IRIS_VCODEC_CLK);
 err_disable_power:
-	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN]);
+	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_VCODEC_POWER_DOMAIN]);
 
 	return ret;
 }
 
 int iris_vpu_set_hwmode(struct iris_core *core)
 {
-	return dev_pm_genpd_set_hwmode(core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN], true);
+	return dev_pm_genpd_set_hwmode(core->pmdomain_tbl->pd_devs[IRIS_VCODEC_POWER_DOMAIN], true);
 }
 
 int iris_vpu_switch_to_hwmode(struct iris_core *core)
@@ -366,7 +367,7 @@ int iris_vpu35_vpu4x_power_off_controller(struct iris_core *core)
 disable_power:
 	iris_disable_unprepare_clock(core, IRIS_CTRL_CLK);
 	iris_disable_unprepare_clock(core, IRIS_CTRL_FREERUN_CLK);
-	iris_disable_unprepare_clock(core, IRIS_AXI1_CLK);
+	iris_disable_unprepare_clock(core, IRIS_AXI_CTRL_CLK);
 
 	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_CTRL_POWER_DOMAIN]);
 
@@ -383,7 +384,7 @@ int iris_vpu35_vpu4x_power_on_controller(struct iris_core *core)
 	if (ret)
 		return ret;
 
-	ret = iris_prepare_enable_clock(core, IRIS_AXI1_CLK);
+	ret = iris_prepare_enable_clock(core, IRIS_AXI_CTRL_CLK);
 	if (ret)
 		goto err_disable_power;
 
@@ -400,7 +401,7 @@ int iris_vpu35_vpu4x_power_on_controller(struct iris_core *core)
 err_disable_ctrl_free_clk:
 	iris_disable_unprepare_clock(core, IRIS_CTRL_FREERUN_CLK);
 err_disable_axi1_clk:
-	iris_disable_unprepare_clock(core, IRIS_AXI1_CLK);
+	iris_disable_unprepare_clock(core, IRIS_AXI_CTRL_CLK);
 err_disable_power:
 	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_CTRL_POWER_DOMAIN]);
 

-- 
2.34.1


