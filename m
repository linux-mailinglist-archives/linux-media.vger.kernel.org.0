Return-Path: <linux-media+bounces-60340-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oNQoISiX+WmB+AIAu9opvQ
	(envelope-from <linux-media+bounces-60340-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 05 May 2026 09:07:20 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id EEB1A4C77CF
	for <lists+linux-media@lfdr.de>; Tue, 05 May 2026 09:07:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7EC7630AAFCE
	for <lists+linux-media@lfdr.de>; Tue,  5 May 2026 07:01:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CF8F3D9042;
	Tue,  5 May 2026 07:00:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XIYAc0wF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FzB5dxSr"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEBA03D170D
	for <linux-media@vger.kernel.org>; Tue,  5 May 2026 07:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777964442; cv=none; b=a1u1wM11zEx14TD7Snjr1QhYAJdrYjSMB7GEuVISmBkkYzdikgejrHu8Y2zuCBDhhYtQjS+LNOyRlNnLP2aT9jvvUk69jVpf+/0fUBoQM8LjBvk85fcFhJHVFeQRW4dY3WHhacitI2fL8ly38yN/iz8joVQaDi/FUG9dZAUbJBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777964442; c=relaxed/simple;
	bh=XCLAciwoGLa2sJvy/DDGRqny4ifzNwzjaeJeVzt0PYg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ku1UeCztJpnlPywHLAC6RSAY8ulyl9ctAqLOE29QPJkeU4E+/aoiICaNwltJExhMSY3K97RrLDFqfSgI5K4C1CC7bO9Sjy/kI4hd1cD1sEakSK/hRQm3jL30L9Gfxv1qHcII68wHIkxT43gbf/KlM37pZSNBSVBzK+nHOr29osU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XIYAc0wF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FzB5dxSr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6455nB2P299216
	for <linux-media@vger.kernel.org>; Tue, 5 May 2026 07:00:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mCM0+/uGCzj/hM4vy1/xEsxuxsqzm+PtmpUe54/lVkk=; b=XIYAc0wFJxzEGvc/
	aUOolG4rOkBmutVXUNU8SM1/TVb6OL9iXDBL+kom2dgZnmX9RYWvTs4JOoOd2wvC
	D34o3YbCKlu+k/Oxen181/BNCJSusv0IsA/XC05XKLQb+6CBJQjARnClpb+GLt3Y
	im6Q8ddCxXFEF1vA3rO8rNa55ygB8vNsYQt34QxjrwVxjvAKSh9YNOvRAwc5vjk4
	B7wuy8MOacnb9VRXE1vIyXYDDQomFu8BmtVjoMcLoXnFrSpsqCHFf95bSFgEY73A
	8hfeTRsHWcGWCij8E2bBZc0+KKcHV4aVy3hA9aiWoSdUkO1bdACZK9YNPzeKiBj0
	/XrNyQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dxvndb8um-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 05 May 2026 07:00:41 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-365312a27a8so2012073a91.0
        for <linux-media@vger.kernel.org>; Tue, 05 May 2026 00:00:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777964440; x=1778569240; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mCM0+/uGCzj/hM4vy1/xEsxuxsqzm+PtmpUe54/lVkk=;
        b=FzB5dxSrjnUru1qrgWGOAuHMuLY06ElEVEiI9g4M52svqHIOLtMdCrLZE21XLdzcKU
         1GwLRKIw7k9tYks2+p8NJV8IjNBblqUhgPHUKouSeMaOu72EP6oe675F2EJgIwyfpF0j
         TgyexYcxjt9EOH+84lWza9/VuoBOzpCFSA6zAmCVWiYpD68ZFpD0TV4dkNUCz9HP+heb
         2Xw/8gXr1HEYDdmFZCURW3j7ayaj71S0Q6nLQ6e4X/9lK0LmIswHtYxW2vMbxjyi4xVe
         9+RqVu1B8LBAnRq+OeqUWmU0e5uFOwHNZ83fqeNqCc5A2HiEQd8hdrFFmJFW7+7AKPh3
         CGRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777964440; x=1778569240;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mCM0+/uGCzj/hM4vy1/xEsxuxsqzm+PtmpUe54/lVkk=;
        b=DZ3n7C2DaBdIuT0L6/xxjdIvdID548BKTjq1sL6uF5/jmZuoDRnIC65K8MhfGNAnnm
         Yv0XOefkynQLlvEFxqS7kK3Ve17qXkga+vfwQNakQZB7BFDKLiQiI9S647C9NTSsDrPA
         NhifcARwWhu1R3rcobdsHIVfHAHiEj5DWxrsDVLzJyzC0DNkMI5r3tIx0bna1nY85ky4
         96hoWF7Rt4ZMjHdHPT89BW8yZchilbnM/dHqwWWIRqb4ah/BAb9PAH1rNBoLUlMHB4Y6
         G1Wdm9hA1c2RBlstWJbQfVWUk4nGMlovULJDwXq9pQ78cXNHyIw1lmqGDFsAfCn2edXw
         RPEw==
X-Gm-Message-State: AOJu0YxPaY1mMLixXp0iFEy/hjm7cytOpLRJuPtx4xB2/RV2st4CVO4I
	Xhymo89Qa4Usfi3ne5MSflUZOZXRVDFsRACDO77/QRs/4ByayKrfEC8Jp8bQ5O/C5XlOWuQ2agJ
	ItjbzZm7vnDvrMhpr2VVI0NO1aRdw8Vb5jbtzj2bm586WBvTP796wn6Muid40+5mZeg==
X-Gm-Gg: AeBDievRDISF+itXQ9/BVDJjzHs+1tLujr/sNs2IXGCVx0keoOll5twDHvaYb6z0nZe
	HK7CZs8tF0F+5J3XAzD/I30B06TNvA/SXsoLn4qm+Kg2DDSMwXgB6SpiorNci0MOk/rFST8yJK3
	PfYDjKx2XRaH+dvDRHQ0R4faa93XkuayJVrJdTlLMYo/6wE6bm8vEREzcZ5Qy80KPg9DLmmX6IT
	ir8XHMaNJsbxFNXTTNvQy5R18vfb8gCsU7CGQako0sRFmzHv/QPHtJaskLPYqnWPAT0Lio7fpNB
	NCAOQK5gGIlyQ8wGMhZRTOr7nw0/9EYD9OQ0lIpAXKRGkyjT/F5Fq7p4jVS5cMZZTVRyajWJgEJ
	FF4+koWk4Aii95Jpyc8nnQSBEi3aBJteJ/sQUsXd9mXvlGn9CEVWOFxKV5LMMOuXXvQ==
X-Received: by 2002:a17:90b:3c85:b0:361:45df:103 with SMTP id 98e67ed59e1d1-365773ba9b6mr1999157a91.12.1777964440140;
        Tue, 05 May 2026 00:00:40 -0700 (PDT)
X-Received: by 2002:a17:90b:3c85:b0:361:45df:103 with SMTP id 98e67ed59e1d1-365773ba9b6mr1998752a91.12.1777964434865;
        Tue, 05 May 2026 00:00:34 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-364ebec73aasm13840146a91.2.2026.05.05.00.00.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 00:00:34 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Tue, 05 May 2026 12:29:22 +0530
Subject: [PATCH v4 01/13] media: iris: Fix VM count passed to firmware
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260505-glymur-v4-1-17571dbd1caa@oss.qualcomm.com>
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
        iommu@lists.linux.dev, Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        stable@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777964421; l=1361;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=XCLAciwoGLa2sJvy/DDGRqny4ifzNwzjaeJeVzt0PYg=;
 b=ktXf49S5sgx6u8kMejEzA6UiVMOHVQS4joL+4BEKP49XKZ4vQFp65+/vb+24gDkEP4GS3Qp+Z
 Jr0woULZO/2CoeWozlpPFfxeMfe4S8Akw5yLupWJ66leYOiL915/QLW
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-ORIG-GUID: J9qZbZO4Z7Mz3FuFO6-p0OGdbd_Bl8s-
X-Authority-Analysis: v=2.4 cv=d9jFDxjE c=1 sm=1 tr=0 ts=69f99599 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=nrYi3PkkErC94SPB-twA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: J9qZbZO4Z7Mz3FuFO6-p0OGdbd_Bl8s-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA1MDA2MiBTYWx0ZWRfX9bCKTZbE3sV5
 5gFwxOWxRFhpsVs2JZr9BzSPPSOj4fr4X9qkobsPO1cDkdh7DaDAjJLDFJt+ztHKyiY6Jb0+P1T
 8oPvxldpIsGwfRCRHEmfK/uWxnyHlavlCs5+TZ1/6OWIz+HdGxvSabsLt+pJPyZD6P2GokRXRdh
 YaWgidyGtLkBwMmOYQecR40xv3SZTQynltBIZGoGEVfyIlWnDwKEb2SHuAJR0bXiHHBpI0dPNvs
 iE2WPDNgjBDVQyZa1aHfOh78VD3DI3j++GeNKRmDdp6fOiv9VbiQRRwHNVkHkHvPVn+cADI5IJi
 sc311w+Yve/8Q4tm1E+AAUgUZwfE61WddqDKQwSf4Ks6SkuQBWUSA+uMZqgZS9gZKiWLh9yN7vl
 6VxTvfB4Tf1qK92ZBT6Y6tb7GDUycOMMmsP/ubGYn/B1Lbq9coYRdNuLNbxYGh5z/gnAnCHiiQ5
 JHN/EvXVjLLn5xrTnSg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_02,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 spamscore=0 clxscore=1015 phishscore=0
 malwarescore=0 bulkscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605050062
X-Rspamd-Queue-Id: EEB1A4C77CF
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
	TAGGED_FROM(0.00)[bounces-60340-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,linux.dev,kernel.org,linaro.org,gmail.com,8bytes.org,arm.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
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

On Glymur, firmware interprets the value written to CPU_CS_SCIACMDARG3 as
the number of virtual machines (VMs) and internally adds 1 to it. Writing
1 causes firmware to treat it as 2 VMs. Since only one VM is required,
remove this write to leave the register at its reset value of 0. This does
not affect other platforms as only Glymur firmware uses this register,
earlier platform firmwares ignore it.

Fixes: abf5bac63f68a ("media: iris: implement the boot sequence of the firmware")
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


