Return-Path: <linux-media+bounces-58698-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +G1/JBbL3WlGjQkAu9opvQ
	(envelope-from <linux-media+bounces-58698-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 14 Apr 2026 07:05:26 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 32F4C3F5A4C
	for <lists+linux-media@lfdr.de>; Tue, 14 Apr 2026 07:05:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DC3EC30D588C
	for <lists+linux-media@lfdr.de>; Tue, 14 Apr 2026 05:01:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25BF929D26C;
	Tue, 14 Apr 2026 05:01:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DycRsYL0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cZAQh0/O"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47B7D28B4FA
	for <linux-media@vger.kernel.org>; Tue, 14 Apr 2026 05:01:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776142869; cv=none; b=D26Y3wfDQDy56jL+pyOVW0XUMyhUBrUay9FvT6z0MsctG0BKLNuJ071y967+4mUxMigZtP9S2nfvrBGPFO3Ujaza9jUG21/3Rjywl/Nn0lMAkCGiELNyi9cyUDkO98lV69d+zBUHQmBxlB+4toqYjq/BgDwT/dbDRb2PjNHJtmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776142869; c=relaxed/simple;
	bh=k/iLL6i9cSC1voO1ylu5486m6OrCS5p/BDSfTTakIQI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aySrsfY7qaoxFJcizs3/qMpUOIYdBM+2c0wA/lI/h98LSZRb8tPSltm2RMlLfREwlN9Sf2v8H+ocuSAfra6ni7lRJ/JDBcLB/189asCIZNO2LEMpeBhKG6BE0FDkmCV8pKQclXXx7juYGR6YVgmnBDLTUIJsS4uj4erAeI4d7Pk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DycRsYL0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cZAQh0/O; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63DLCS4m280804
	for <linux-media@vger.kernel.org>; Tue, 14 Apr 2026 05:01:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	D6HQxjbDqFuXOrhbP1pIiGDugFED9NzDju7QMGKMoO8=; b=DycRsYL0sKiuQLhu
	tExU6NTVmWTFp2rblL0HvuAkuRhN7bxsYbVNWev+xqHIm/u0ubNkW4AL8ZTaxAbp
	61Xuft3Bmlpy3VbWXnG/J4qjA3CuAGqYUo1+5JPtuuIPEIVNW0/W2LpzFDyD1ezc
	wk6LhneHicE4nRwjcmBU0WmwAuJx2mI5MVkBbeHCPlOp9ot7DYCTzRxNMxYPafd2
	GyKrffOpG93XHzA7qBrCR9eVMm9chpzcfltOFvBpTpTT+7No98dh5nSpEs88r1Re
	MKFof1RkX97UUHQ9XSoEkRQc/2WUIKJM3IfC1kgjsNhi9BRPtqnxmrjXWNWeTqZT
	U0fomw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh86vh21g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 14 Apr 2026 05:01:07 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b465bf993cso13018625ad.1
        for <linux-media@vger.kernel.org>; Mon, 13 Apr 2026 22:01:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776142866; x=1776747666; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D6HQxjbDqFuXOrhbP1pIiGDugFED9NzDju7QMGKMoO8=;
        b=cZAQh0/OJ/PbQtv5F3KtB6Dn3Q2ptLUbEjsuawqtIcQUo2UP/5M7sFH8FIPHN2BMaf
         Nw3KKGHity2EXyxbLKLfClD0glL8eSVJcpMMptP/quAlf0rYOvgBdARm/DNOtN3PLTuP
         2fVQvPB8SI51L2LdAOqreMLlbRlgJs33V0Uzxrbr+4+QXJZHf6XFDQLAWbOPzqKyFRIl
         29MqnRfb54k3PEng3m9oNfyb7XduiwFKsVfJL3vFrHaLzUgcCLUuseHWQMZjsxHdcPe7
         /XRPBkq3aEWfy0Vb8RIPH5wdPJmSGGNXZx8TCSPDjnekJ0ZudeKF+4jreRLDmNwgKbLe
         haJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776142866; x=1776747666;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=D6HQxjbDqFuXOrhbP1pIiGDugFED9NzDju7QMGKMoO8=;
        b=UyEQQO/1ssQ41GiST3MNhL8JxHjqa+3MLgM2dXozs/qj9UOcqU6awCmSeL8ATpKs2f
         NLU+OyURw70RNw75SDFKiXFmlPF9b83Ik43dLqw5r43mF+OQW6pxUxY1hJmY8CgM+e9j
         Q/mRsTDV8MyLErWJW69LBdQ9rWGlfJDlZpYCDIXghcAIBamWo0qbu3A9AheecrSjdrH3
         GUiwsEWCGB0VzrJAOKRrg8WrFIUEzuR6RS67oLVtCEixwbRUxgNJtx+GauyhpkPjJkbp
         RWUOoDciSWGjhXglI6OUdhAEdcGqlYgOpopAfwI7I0LxQTIyEkuNmsuf0Qd6ppA0NTW8
         H/uA==
X-Gm-Message-State: AOJu0Yys0I2nMWXm8O7OT36ioRxRpBzW/Rs3E3pKjk3mX0R50ETBM/NE
	3fnADcWYDaJSRWq2QMTNeviyXOl+6owdlq1m82OWslrxzAxr0ALxM3FZrgIQewgrcEJwUQzVJLY
	u5Rzf5wIXwinnApbpQmydMaUc9i4uViATleKSwEcUF0ZLxTv/QOkMIatQnOeGNp4Elw==
X-Gm-Gg: AeBDieuN/Bc8VKMQQulNlAzCqt8h1yZ4AensvVSxMN+8HjwYwhubQJD4avz7e/yAznF
	J7/vi/iv20kGDDmDCcVZqedHGjXzRJoHmcybeNVnKs0JscKKV6a8LYBDTTk0VSmCKP6mbKaXfC1
	3+R/YJVwqOxj2F1+immiqwyQc1KdpNKiFb5jY3Ffxpc5Brh9ZmRUAN4ReKCphcoSLmh7NTJFM5P
	PDjQhg/Y4MPU6zZq3ds6a9fPvgrI1746p9Olq6ne9hRiFLr+J0q9lP3tP3QUC1aC8ItXU0gzLW0
	FfKVjfkKFRt3hO6KI4X5aM8n9KxXq3DagxtFPTkLLRvSyAqPaOziP0M7At7D8zxfedOw6P+/dWp
	Bx5v3MUVioubgfcA/WS7WSCXR5fS8G4aHxGci+Yphi7fv98EpL+lwKmI=
X-Received: by 2002:a17:903:acb:b0:2b2:4eec:980b with SMTP id d9443c01a7336-2b2d5940ec9mr167893185ad.7.1776142866274;
        Mon, 13 Apr 2026 22:01:06 -0700 (PDT)
X-Received: by 2002:a17:903:acb:b0:2b2:4eec:980b with SMTP id d9443c01a7336-2b2d5940ec9mr167892785ad.7.1776142865748;
        Mon, 13 Apr 2026 22:01:05 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2d4db198asm134678425ad.3.2026.04.13.22.00.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 22:01:05 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Tue, 14 Apr 2026 10:30:02 +0530
Subject: [PATCH 06/11] media: iris: Fix VM count passed to firmware
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260414-glymur-v1-6-7d3d1cf57b16@oss.qualcomm.com>
References: <20260414-glymur-v1-0-7d3d1cf57b16@oss.qualcomm.com>
In-Reply-To: <20260414-glymur-v1-0-7d3d1cf57b16@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux.dev, Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        stable@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776142821; l=1298;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=k/iLL6i9cSC1voO1ylu5486m6OrCS5p/BDSfTTakIQI=;
 b=IDdYjVDuPd+/LIcDpu0hs7fw68aCaSf03QnL4XqN5BY6zxcLwqtD/gxA7DiQ6KxUkJXTgnuW0
 jr1xLST8M7hCVpscA3WPXDA5mCtM9B4AJB0TyCukzzaeACVFzkD3gOX
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-GUID: gZk0NJVcbLoVbOfDqK1BA3ow0gMn14dm
X-Authority-Analysis: v=2.4 cv=cffiaHDM c=1 sm=1 tr=0 ts=69ddca13 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=nrYi3PkkErC94SPB-twA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: gZk0NJVcbLoVbOfDqK1BA3ow0gMn14dm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDA0NSBTYWx0ZWRfX+4Y536yK13aV
 FjbJ1eLJW/J1LkCifmrBYVamSEnexrGL62AfW59Lr2dPfvsw3c9PG5ovmNbF7Sn9ju0grfBh9D0
 UfO+/IiwAZymWD5clU6aJJi2b0AjIgbWXohlCEvgBIDmUDh6MPpJf+KwlNACQXNl0P3b2E8Nhad
 d+AeLS6YrABQsqJYSsEvNR5q5BhDnyAwBa0IFaGeuhb2JbtyeMWlqRgKEt5vPBXoWLCsnh5lYaN
 DToIJfYcHnFVTKrxS59jHgsFeHrFmahdn2SUXHIyj3uQibqhAwumcoQBS7hzPBq8Q+AVOPC8nj3
 uL6JomOoBSLtfOqWKHRQ13LJl+RjqU2YXBqe6MBSxkJeom2Ku99KYRKqzvttMFgOWutBez1hYV1
 9/Ded51gclFIqd29V9ul0L+9BTpqPFjyDVRmJkZA1luG92YN5ETroDa3xr9O9jUrA8OXEn0oAvx
 pR9FPiZXxOiMUIuF/kA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_01,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 lowpriorityscore=0 suspectscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604140045
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[22];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-58698-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[busanna.reddy@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 32F4C3F5A4C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Glymur, firmware interprets the value written to CPU_CS_SCIACMDARG3 as
the number of virtual machines (VMs) and internally adds 1 to it. Writing
1 causes firmware to treat it as 2 VMs. Since only one VM is required,
remove this write to leave the register at its reset value of 0. This does
not affect other platforms as only Glymur firmware uses this register,
earlier platform firmwares ignore it.

Fixes: abf5bac63f68a ("media: iris: implement the boot sequence of the firmware")
Cc: stable@vger.kernel.org
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_vpu_common.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers/media/platform/qcom/iris/iris_vpu_common.c
index 548e5f1727fd..bfd1e762c38e 100644
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


