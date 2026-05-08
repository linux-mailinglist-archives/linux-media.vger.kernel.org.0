Return-Path: <linux-media+bounces-60944-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mP3UNXQz/mmHnwAAu9opvQ
	(envelope-from <linux-media+bounces-60944-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 08 May 2026 21:03:16 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 76BDA4FADD8
	for <lists+linux-media@lfdr.de>; Fri, 08 May 2026 21:03:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8DE8D30901D9
	for <lists+linux-media@lfdr.de>; Fri,  8 May 2026 19:01:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59E3540B6CA;
	Fri,  8 May 2026 19:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AsQqT+jJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PjHj7C/r"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 802673FE368
	for <linux-media@vger.kernel.org>; Fri,  8 May 2026 19:01:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778266879; cv=none; b=f2IDlJUAWNSAO934hWXF2E5f524JoVuexrXI4+YOapXPr9xSe2j8/c61eSWML0lH8CmhbW8tHrpah6GgKwnJfoNrIYPJgx8dUzwozsVI6MNwLate9er6WFnCFXFk6duXhRXPVk41Yhv1Q9+6pikzT7QdGWiaHxOQlDqnBTLHM1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778266879; c=relaxed/simple;
	bh=+CwAWBT56Jm+jcj2Q4UQDmpUtoIH5fpiVgKBMPwi0cA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pZ+tnk5nftD2d4QmHpyDpSnxfU4a7rMvUiUuBhEgH+X+bWIMH5pylMs1vNbPLjnycHjbXJflWYCCt510VSsk7wV+mVf9AncxNnf25ZsLrLXk86dHa/PZ9FpUhN57scaWHVMMTlWYg5Gk5EDZeh3616ifAqhTaKUEGVxY/LzAJGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AsQqT+jJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PjHj7C/r; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 648CGhsY852109
	for <linux-media@vger.kernel.org>; Fri, 8 May 2026 19:01:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	p/AT+OqvsZEGAlm5HKdKcAksd7hTIew5HyAoZ5502Tc=; b=AsQqT+jJK7OarVWi
	ZhySwme7r59hDAWJcia8xqZu71PeYYkKLhiWLwB9iPEMnF/ZFHaRVI4twNgu4SyA
	amYtJjue/VI/DZ0JvSTX2WZqKrj/i/w3cRT7iO6umaUPa/e0Eg1YAO0d6lhvomlI
	I+KfGWGTqTSWQCoQuqiDKa47huf/lwtPSGmB8sj2pXb9u6fFjayKAnmj/s/Z9iyJ
	YNqXLMj0WQgloWGtFGOz/QYnbWhwx2yALtyrpzaDwwK8PyBzbZz24FZjE/6D1q8l
	UuknzV7/IRXcLNTdAMxtf8suuC1wqhwkiTPYLWP3mjZGTHqgw8eJJsWuGdOluEn/
	5YliUg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e1fpthk16-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 08 May 2026 19:01:17 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-82f6e6a3a76so2323300b3a.0
        for <linux-media@vger.kernel.org>; Fri, 08 May 2026 12:01:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778266876; x=1778871676; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p/AT+OqvsZEGAlm5HKdKcAksd7hTIew5HyAoZ5502Tc=;
        b=PjHj7C/r7j8uBfGdhvkR+ZcT7lNrQULOPcqZ1SMVGoBbH3xqnVpRv6m5VuQwzfYayb
         8NK5M5vsDAtSw9Y1ezxjjy9/YGR+zTlD6r1KJYUcll5TSKs9o/T9mnIX6ZGZBLJfm6O/
         +oxTZL0LcJozNgc6JPl27krVbJau18N1vauTRcb+tTLWnoRj3z1oFBn+c6Rsc5sZtagh
         s81lFSI+SXwa1NOrsffwPN5J+6UlNkYMTxza8e0Zdbue37oXIFd/rpK7QRtOOuUtM5LE
         gOSLfhxoE7HxOZepNPL2v9kwpxNxcmt7Hh5BOJavs8jYA6aoCcH8TNL4cZ44EeyQgKrV
         zFtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778266876; x=1778871676;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=p/AT+OqvsZEGAlm5HKdKcAksd7hTIew5HyAoZ5502Tc=;
        b=RGK2UPJ51WXg90i+ax07Afk+jpQkPuZqdvKbSNAiADJ8SQJZczc2L3c3vFTDM8faF4
         aiJ+qolKdf0JcZ5cbivEbMUtaZwKi8BdD0s6iMp5dvLId3eyd/9O02v+SQbvv+oYg27H
         jxmi1F3E62FkOj9IPu06OcRihxnZKTlOzA2uxTr1vgxCa0Va+aiYMCAr9azR756mXMUU
         Crc3iLOgVdkZD0WVAQceQV0LSu9H65NY96CDCUOIGL56xfLDCjRMm3mdwXwW9mBy+5mr
         CNSef9iJvOxGCgrvk26/BAD6l4I/Hhnc2RSjg6qBvdG+nIv+5UfN77QYIe8/xY/AIaUO
         iP6w==
X-Forwarded-Encrypted: i=1; AFNElJ9lhovi3MRpl3zKpGC+7AUiS4KtenOHwmMsRwUam/W3X8NCehJ1CR7uvcbx/jkAbx4orOSD9Cl+075deQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxml0509s8dS87tW61w/DJ43bcMZFruYhp/sGY9f7LpZ9chK1Qp
	ufCtkAmpk+J0k610JNRX2+oXWKrmGLKlnSfosjsugKW2gRViy/wpAUXZGg1fPoSb/CbNNgZSK3p
	hGx54+OJSRldyb8X2vIm4STSw92Cc3Vywi4izYQ7IKbBya5QuMDdlSy7xT/TvnzCaW3VPcyzaiw
	==
X-Gm-Gg: AeBDiet3RSpGg8yOq9om+YvTagJJrEOuv1kbFfl8GS4odruyajVD9aL7lbMEoQ/2kDf
	gzN75iDbnfY81V5W8tYvVm2SAGdMVDzMBppaFexnYu7s0ePY4PFWveABNNZyV8hAUs8BOzzRusv
	N5YwxH04umDO/59BwUjReb1PYwpPGb9yX2E7e0FC60Ygq/jFrumUgrgWMR0Tcx60trq6irqjyu4
	07Tn9+DrNCFZ88qo5pP6auLEzYB8tHyBIkWtYZ56wKoP+Tkvb06RmQjnhqtsU8mB1NbHfRsLkgT
	oWNvs8WbnBKOY7MGsZbLY18bwl/pU5FA6H1cGQHHpxvR2PNKZoB9CSqw9X5YEP2NA37lQFr2OI2
	dpi7L1jOZmFtpqT1GBHTdY1IL893D4cw3Ypsa6bptIiKq3ruEeYW0JwI=
X-Received: by 2002:a05:6a00:2411:b0:82c:e0d7:2682 with SMTP id d2e1a72fcca58-83a5df487e9mr13628350b3a.25.1778266876119;
        Fri, 08 May 2026 12:01:16 -0700 (PDT)
X-Received: by 2002:a05:6a00:2411:b0:82c:e0d7:2682 with SMTP id d2e1a72fcca58-83a5df487e9mr13628308b3a.25.1778266875588;
        Fri, 08 May 2026 12:01:15 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83965a3e3ecsm13395550b3a.19.2026.05.08.12.01.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 12:01:15 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Sat, 09 May 2026 00:29:52 +0530
Subject: [PATCH v5 03/14] media: iris: Fix VM count passed to firmware
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260509-glymur-v5-3-7fbb340c5dbd@oss.qualcomm.com>
References: <20260509-glymur-v5-0-7fbb340c5dbd@oss.qualcomm.com>
In-Reply-To: <20260509-glymur-v5-0-7fbb340c5dbd@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Del Regno <angelogioacchino.delregno@collabora.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
        Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>, stable@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778266845; l=1360;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=+CwAWBT56Jm+jcj2Q4UQDmpUtoIH5fpiVgKBMPwi0cA=;
 b=kW/HQT/jSDBpkCUfRBqp0A5Yj4nOp80+ZwEGYSAUFspkAjZt561MKLpQwFXZzmu/dKkzVWx+9
 B7Tjefd1OYNBH8QV/X9SfxHeKATLIdHunm8LdBeO6zpdPfvRF4/MdRn
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-ORIG-GUID: p1pPkoATYyEp6QOnfHOH31gLNqvnhx6x
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDE5MCBTYWx0ZWRfX18/d1jYduDih
 d/8EqLJimByjBtftpvjK8U8xrNLT6whyCEXTv/CpMsj1Yql4XV/TCCeC2SJfFlzjTvIX8S3PMTO
 BRUQ1OzqWDPyDVfeMtVFEyho+2W3+31xXXjUlQMvc94XY72gpuFa6KUFtJTMxYYNCZlnXcuiicf
 CoZ3RRoP9gTl/ycZAgllOqeVruvtlDz7omROsJ6UkUitPiLyF/KCravAKCAhr31CccZGPS2SDk0
 RSbIUbRhfgW+ub6/KVHJfLnhRm8OtmxeaYlwGfTZOijByXLsOr2hifts0LoO0bEl5iLViHT2HQz
 jocDl8nyHUQezQ3Tffu3jKOvc2cWsNRWo6yNkpdP1gexOl9EMFB8xE84xfd1xAf9AJRF4tRqpZS
 jbQkHuFaTv6h1DYSkqsF8//+s+La08c8HNsEE71bMZFRprmJVEhF9sAVD5MmuFstwfW5QRYSsOA
 alUcPTxIGEApkgyG2Sw==
X-Proofpoint-GUID: p1pPkoATYyEp6QOnfHOH31gLNqvnhx6x
X-Authority-Analysis: v=2.4 cv=IYi3n2qa c=1 sm=1 tr=0 ts=69fe32fd cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=nrYi3PkkErC94SPB-twA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 clxscore=1015 bulkscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605080190
X-Rspamd-Queue-Id: 76BDA4FADD8
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[26];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60944-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[busanna.reddy@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Glymur, firmware interprets the value written to CPU_CS_SCIACMDARG3 as
the number of virtual machines (VMs) and internally adds 1 to it. Writing
1 causes firmware to treat it as 2 VMs. Since only one VM is required,
remove this write to leave the register at its reset value of 0. This does
not affect other platforms as only Glymur firmware uses this register,
earlier platform firmwares ignore it.

Fixes: abf5bac63f68 ("media: iris: implement the boot sequence of the firmware")
Cc: stable@vger.kernel.org
Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_vpu_common.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers/media/platform/qcom/iris/iris_vpu_common.c
index 69e6126dc4d9..f1f9e04b7c31 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
@@ -78,7 +78,6 @@ int iris_vpu_boot_firmware(struct iris_core *core)
 	iris_vpu_setup_ucregion_memory_map(core);
 
 	writel(ctrl_init, core->reg_base + CTRL_INIT);
-	writel(0x1, core->reg_base + CPU_CS_SCIACMDARG3);
 
 	while (!ctrl_status && count < max_tries) {
 		ctrl_status = readl(core->reg_base + CTRL_STATUS);

-- 
2.34.1


