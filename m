Return-Path: <linux-media+bounces-67691-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id XGZFIoiVV2rmXQAAu9opvQ
	(envelope-from <linux-media+bounces-67691-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2026 16:13:28 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DAC075F36C
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2026 16:13:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=V8vZWrnI;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=HOq7f4r7;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67691-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67691-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 82318304F3AE
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2026 14:11:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10AC936E468;
	Wed, 15 Jul 2026 14:10:37 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62BF4376A1E
	for <linux-media@vger.kernel.org>; Wed, 15 Jul 2026 14:10:33 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784124636; cv=none; b=sJstNRRGVkyKal3Rh/V/8a9Y9zhSMvgGOEhrUw+A7NAocLfgacfC/kOPAssLbuDOuzHvHM2/GGgwHQBkq+Pg3rlIdu4tT7U0Uh2u+NU89XlwWFKil1tW+0xDePT2ETgfWSoA+9VmOIque7Np27lJDn6gXp1rtVSCWB3Q261Kr9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784124636; c=relaxed/simple;
	bh=Z7a+KeKlfsd6hODeCUGUk5GwLjPusVx49RSzZ6ytvIQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pwy9s7cmFpkV3mijpM2j+FEfuyy0HQP0vqk9/fW5g0/yOZ+6JxurFponhx3So5w8l6+ZNZkl/WLGpjBEN91kapPcBmRV5Flm5itsBHX2m/eRUvXju2GtDl38lvKUz3Y7PT0lOp9JBnuKUE9PuoU1BJ6N5A54OKyrqrKRIztXcwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V8vZWrnI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HOq7f4r7; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66FE4UEv4025796
	for <linux-media@vger.kernel.org>; Wed, 15 Jul 2026 14:10:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rccCrQapLXpGKmzhslQnhMFu7V0TczQtmSRgtHbcpXA=; b=V8vZWrnIY8F4lR2l
	4RXYe33gqTTTrtUP+tiuXZlpBjph2VhscMKCWaapZJ2KySvfQestzd5W1+h8zPrv
	4cYbFWIoxSCnB7FWK6k2vnQ1bzKvg3xkfgkzlxpgGimqBoWCy4kgv/HuuKzgUaFB
	xm8R1Asdb/h/P0/hHzAIUCQKRvULIBj7V+YOTpyxS46AZRVfFo8WY8EDStIm2x6N
	S2yuD51XFbnh4oUcFb13FEIBoqTwIfFIcN3pYgKI1bor78fyK+vHV4gJ/SkUDF6i
	PlfFsRb76cL/D3BWL0Gi5lFP30I24zadIYEWMRY0VEyOlGyLn+rA2UGAgwrzRyD/
	KErCrg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fe03vjpcw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 15 Jul 2026 14:10:32 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2caa9a3cf7aso7830055ad.0
        for <linux-media@vger.kernel.org>; Wed, 15 Jul 2026 07:10:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784124631; x=1784729431; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rccCrQapLXpGKmzhslQnhMFu7V0TczQtmSRgtHbcpXA=;
        b=HOq7f4r7JL+mOzq63uIaGCaC0tS3pSjuhShg3X37wrkkhqfs0ZHfaFocMd/rGQTLjD
         2pM2UWxmXwhk0t0jxMNuUBvnNOpsF5dBjB2QCFgFv/WYjjYSwGAj3uFFSD2w87Yv/XkU
         R1u0sLRHvzOjvOr3VtMZu8S0VMCaFWpdlkStfKFQNbexiiPBTHGdfWPx33f1SbUoM2xQ
         qpsVQhrOdbt3NA1XVJ4mKp222XAvlY16C3FjjWhi/gDSrMwoMHdgJFV2nUHsCBrXslau
         qrFlrEtOloK2mJHHQgbr1Gcl3gqQgCKq1yMjrjO7EByl5fUzG10YwrnJ3XEwp81Ns7W8
         mXPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784124631; x=1784729431;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rccCrQapLXpGKmzhslQnhMFu7V0TczQtmSRgtHbcpXA=;
        b=g9HtJ+yVULdEbVc9zyRZdcWV6asBnWrdCRQmT71a1NT13yVw1nQqcdrRuvMq9XrI1o
         J9OAdnRksuMfVGhkrxyfPQ/0v38irsRWe1lFe2YADHqy7TrZdPDj6ael2CsFOmoF/Tm/
         61FjTMYX7yQRxxlKSlM9n9+O09y4o35E+Ayillmo9LHmaEYLoyZ3w2ZOZQO9E12k5O45
         LqNm/Z4Nos+HmpmYTQjWcPppupFfGJHbRvhwpEcj7zkU15gkloVmD2VO9uqJk5WEnDFu
         6jFiAa7yi3ZBte5t39m78vPHtFRbO3kxhrGe+rdlMVmwmNEeNkbZKhvjCWgJqi1gNxYc
         gjxg==
X-Forwarded-Encrypted: i=1; AHgh+Rol9dbTOHfPxmgQ4VI6tuyzUzF3R1DjzxbtSSCYahlgJdcgN/rD51NU0jPTHtZPjTylpmWTf6Rh9vgDfw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwC/pT2uKF2Pgp8rvITNDFKi33Mf8QfseFDXAmhBo+XGz1EExXK
	qhobLC3+Mptc2SyEOGQOPV9fOL3OClScqgY37l+nkIwzVMzWxIfEweQmBIeMSUCrstLY8Ev1AJt
	lxidX3OEDsNRnT68JFPqTxWJ97tyywxeZhR5DJJQRfdOBmTG7nsXl8b09SpjKmAFsUQ==
X-Gm-Gg: AfdE7clZuSPzPM4uCm1pdDyyo8GsMk+sytpqY4JHQktc1c4Rg85FkccEU66m01FeNUL
	pLYAHVyz2MiOta8jF+IyX7Hs33l2z3z4MvoRRwf6NBtUv2YwgjfKYkSNBa4W2oKbPzwAcC/gWWv
	rsLvLpADOA7G/ocYNIr3w3sm3n+dtxXkZS/VJEgcUkx4+8iPr+KUv2zBDjgPNiB3pxPjAtvFR+a
	L0oiRYUv3CoAFMyATa6zHXGR+xextcTrwnXnnFZUfmQEMJ84grtKH1eZvfe1SCQ1fR/UmS2c/3o
	c6Hq0Teiyy7ZE6lVdiETNpkyI/ff1q1cXi1Bk8M+EbeuvI9rnQHM4zM4UA78KxlGf8bDJ7rlOgr
	iNc2C1do9vbmA8510B8s2fAQ7gXw2Z3safSFODiuBFWL0
X-Received: by 2002:a17:902:e542:b0:2c9:d277:2cdb with SMTP id d9443c01a7336-2cea16fc0cfmr159084095ad.9.1784124631178;
        Wed, 15 Jul 2026 07:10:31 -0700 (PDT)
X-Received: by 2002:a17:902:e542:b0:2c9:d277:2cdb with SMTP id d9443c01a7336-2cea16fc0cfmr159083485ad.9.1784124630603;
        Wed, 15 Jul 2026 07:10:30 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf1070b68dsm2913215ad.79.2026.07.15.07.10.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 07:10:30 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Wed, 15 Jul 2026 19:39:57 +0530
Subject: [PATCH v9 03/14] media: iris: Add helper to create a context bank
 device
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260715-glymur-v9-3-8cf2cbe12a07@oss.qualcomm.com>
References: <20260715-glymur-v9-0-8cf2cbe12a07@oss.qualcomm.com>
In-Reply-To: <20260715-glymur-v9-0-8cf2cbe12a07@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Daniel J Blueman <daniel@quora.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784124602; l=2769;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=YR+PjYPX5zksaKJC/NvxWsdFNoGva+12VxA4G3rAknc=;
 b=bD+EReDXs3o480Zk1OghwCSx7mBFpmiw7ZRkROj5f0g9INqbdS/VO/svLYrOaoh2nS4yIFN8Q
 YyPxQHza2wWBJsxxNDlMSwHuKqIMINy0LMsqXjZJTzA0fcQDQJhWmW7
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Authority-Analysis: v=2.4 cv=Ife3n2qa c=1 sm=1 tr=0 ts=6a5794d8 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=t9ty7G3lAAAA:8 a=11-_c5lL_m6SPrwGrosA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=CsAS6f0m0zARWR-uHzm3:22
X-Proofpoint-ORIG-GUID: 5Y5KPVoEpyD0Ce4k5ypIkLVjEcEuTKYp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDE0MSBTYWx0ZWRfX85JtlHEyZWln
 WGHtt1F6vvThUwP4WWg6NbcMbekrqP5z1QCp0CMse/x6WpR/HWZIIgNtWTmng6srN11F03d89SB
 yGwfs2fqO85OC5baMOx39lta08Yj2BeaMcn4reK4w7nZ8PXMP/KSaOOOOXeF6jzjTxxa4GQABHf
 fScB+8qsU9pEc2YFKmzFEjbGejjeuyQy3mmL/xwMYNzuownTh4MT0VrBNFUxM4x9jf7e5YGMtYM
 Z0V47E5KfeMLrs1fBJThudUffJ5yTpcBwxx256V6lRVUxphPHibyV29F7iduOsO8wbuUSt2NZXs
 vKC911FwsVyPjhZSVH23qR0w3W8RVj3P2ni9JVK4xIqmcv+6/3+C2YUpUjiddnfvIqXz5WMwIRQ
 XZCyDpsOqkbcRTenbM/HDkMNmLG2uxTujvHIiPZbuMLJgEpDu2lICfUa+NSx8Da9gRRy3mYchEs
 w6kb1qECWqEqN6rm9iw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDE0MSBTYWx0ZWRfX7m10w4O1LsNC
 7bm1yE1122oUYWTB+iIqzYk0TSRMIVp18QzgsGvcRKGXSeOG7d2R42y9l0UgbPqrZr8m26V6X+8
 SklgS/Su5H3Y7mUbCXf7KqjtURzcLZM=
X-Proofpoint-GUID: 5Y5KPVoEpyD0Ce4k5ypIkLVjEcEuTKYp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_03,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 bulkscore=0 clxscore=1015 adultscore=0
 impostorscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607150141
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-67691-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,linux.dev,kernel.org,8bytes.org,arm.com,gmail.com];
	FORGED_RECIPIENTS(0.00)[m:vikash.garodia@oss.qualcomm.com,m:dikshita.agarwal@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:mchehab@kernel.org,m:joro@8bytes.org,m:will@kernel.org,m:robin.murphy@arm.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:stanimir.k.varbanov@gmail.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:iommu@lists.linux.dev,m:devicetree@vger.kernel.org,m:busanna.reddy@oss.qualcomm.com,m:daniel@quora.org,m:krzk@kernel.org,m:conor@kernel.org,m:stanimirkvarbanov@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[busanna.reddy@oss.qualcomm.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,plat_dev_info.id:url,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,plat_dev_info.name:url,qualcomm.com:dkim,qualcomm.com:email,quora.org:email];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[busanna.reddy@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1DAC075F36C
X-Rspamd-Action: no action

From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>

The subnode in the device tree is registered as a separate device so
that it gets its own IOMMU context. Pixel/non-pixel buffers are mapped
into these iommu domain, to ensure they are within the addressable range.

Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Tested-by: Daniel J Blueman <daniel@quora.org>
---
 drivers/media/platform/qcom/iris/iris_resources.c | 28 +++++++++++++++++++++++
 drivers/media/platform/qcom/iris/iris_resources.h |  1 +
 2 files changed, 29 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_resources.c b/drivers/media/platform/qcom/iris/iris_resources.c
index 773f6548370a..a685915a19e9 100644
--- a/drivers/media/platform/qcom/iris/iris_resources.c
+++ b/drivers/media/platform/qcom/iris/iris_resources.c
@@ -5,6 +5,7 @@
 
 #include <linux/clk.h>
 #include <linux/devfreq.h>
+#include <linux/dma-mapping.h>
 #include <linux/interconnect.h>
 #include <linux/pm_domain.h>
 #include <linux/pm_opp.h>
@@ -141,3 +142,30 @@ int iris_disable_unprepare_clock(struct iris_core *core, enum platform_clk_type
 
 	return 0;
 }
+
+struct device *iris_create_cb_dev(struct iris_core *core, const char *name)
+{
+	struct platform_device_info plat_dev_info = {};
+	struct device_node *child_of_node;
+	struct platform_device *pdev;
+
+	child_of_node = of_get_child_by_name(core->dev->of_node, name);
+	if (!child_of_node)
+		return NULL;
+
+	plat_dev_info.dma_mask = core->iris_platform_data->dma_mask;
+	plat_dev_info.fwnode = &child_of_node->fwnode;
+	plat_dev_info.name = child_of_node->name;
+	plat_dev_info.id = PLATFORM_DEVID_AUTO;
+	plat_dev_info.parent = core->dev;
+
+	pdev = platform_device_register_full(&plat_dev_info);
+	of_node_put(child_of_node);
+	if (IS_ERR(pdev))
+		return ERR_CAST(pdev);
+
+	dma_set_max_seg_size(&pdev->dev, DMA_BIT_MASK(32));
+	dma_set_seg_boundary(&pdev->dev, DMA_BIT_MASK(32));
+
+	return &pdev->dev;
+}
diff --git a/drivers/media/platform/qcom/iris/iris_resources.h b/drivers/media/platform/qcom/iris/iris_resources.h
index 6bfbd2dc6db0..ca53c01f60ae 100644
--- a/drivers/media/platform/qcom/iris/iris_resources.h
+++ b/drivers/media/platform/qcom/iris/iris_resources.h
@@ -15,5 +15,6 @@ int iris_unset_icc_bw(struct iris_core *core);
 int iris_set_icc_bw(struct iris_core *core, unsigned long icc_bw);
 int iris_disable_unprepare_clock(struct iris_core *core, enum platform_clk_type clk_type);
 int iris_prepare_enable_clock(struct iris_core *core, enum platform_clk_type clk_type);
+struct device *iris_create_cb_dev(struct iris_core *core, const char *name);
 
 #endif

-- 
2.34.1


