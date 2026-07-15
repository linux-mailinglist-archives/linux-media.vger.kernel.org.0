Return-Path: <linux-media+bounces-67690-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id pNtBIF2VV2reXQAAu9opvQ
	(envelope-from <linux-media+bounces-67690-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2026 16:12:45 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CBDD75F356
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2026 16:12:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=AQDuOgD2;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=GBzC8+ZD;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67690-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67690-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id DD415301BBAF
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2026 14:11:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79E0437187E;
	Wed, 15 Jul 2026 14:10:30 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D55E8370ACA
	for <linux-media@vger.kernel.org>; Wed, 15 Jul 2026 14:10:26 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784124629; cv=none; b=GCxAukXQfci/BTDtW6zzZIXBK7cNwB7iOfG+ape3lQ65a57FlYTPAP3HYPGj6RiP3fPZfZHBSESfeYA727gxOgMpEMZoa/SU/FwAyySrxd3L9HTN/dsIa89bNKjk7DSEOfvDmQLEZHMKi87AZla+nbxDTtQOMWxl+FgO7w3V3lI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784124629; c=relaxed/simple;
	bh=tBM4xBzn/Xu0jRn9xB3qtH2PBSvLI/9VGMLOvNw3o5I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=duttjls/1I7TyB7mnX6oNdbOkoyGWX9QPzqvMt3LOijXATqgR5ilrGj22sbXHae7rvsELSQjj/7ehmBVpXg80ytBBL2ejtJvyGSUhHYXDDXWGAvKm+vj+fSXN7bzyOxEHPbNbQExDrrAzzX5tSjtiejyaCi8pBxGiFbgZ+Vgy0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AQDuOgD2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GBzC8+ZD; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66FE43Qv3926958
	for <linux-media@vger.kernel.org>; Wed, 15 Jul 2026 14:10:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mG+MV9RqZD61fcJc7fhHYvKrob3dAixJSqJ0wMGBFsQ=; b=AQDuOgD2MPFx9Qk+
	jDvhXq33rTOeaktqP5IzDqtn7k7bRJ27BeoGxWQnnqKJTeyJ9jyUp7Bny46xAdlF
	lnNSJoTCCuVoXExD8ydeftMvOkU55zKEXspr5XGZMJIdC29ACW8zb6falFpcQ/2L
	5Pk/rZ/NIBc9my3hCuSTth/vSzzaffFvpymxtBT0TKH11L5iLUj7p+DAmAC2m5k9
	KBSP/DSRmS6JVykgq97Pg06r2UraJs1Sw0VVn3SthKWQcYfvItovrrWc65lpmTwp
	xOgUHAtfORPRnoXZyaxfZoxGXaRhzsuTlCq2lNfSS0+E85yyYDirV/ycLwGlOtrB
	GNrtWg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fe7q611x2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 15 Jul 2026 14:10:25 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cce02cb769so28189125ad.1
        for <linux-media@vger.kernel.org>; Wed, 15 Jul 2026 07:10:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784124624; x=1784729424; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mG+MV9RqZD61fcJc7fhHYvKrob3dAixJSqJ0wMGBFsQ=;
        b=GBzC8+ZDEvbYmXuRmK2bF0Yr55/kcXiTediOT/PxWpfv519tfkJYjX3hCAySPAjcuQ
         bL8jx4PB3Aa5XwJSENOAzMt8Es+yquzqHWjbHMSteJuYVc1PW8hOgpfaMtRy6DnV63iU
         OrJQwLFh0g9smcb32nHEyvF5T73x5Je6lsd6X5f79HKuFxTz6robnvPZUmtxiG+WWW/H
         oNH86b3N90wIdxE51A2HbPcajzeug13Elp6dOAuILyzWS9TszLlHq7t7qxkcFbjE93pU
         2drJMilbDrK8oARylOBRTNDKyR2deHMU3rs9xkFgPduXt3mPTaZOFtUj2/m5sQInzo8F
         qwqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784124624; x=1784729424;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mG+MV9RqZD61fcJc7fhHYvKrob3dAixJSqJ0wMGBFsQ=;
        b=fKnYtRpkAlbZwINCtvEYTR8F670bdPUJja+uOOQYtMAuMgvS/dgXGhu7Qb1nQiwEwo
         HW+o9esYZl6zW/LaKUHxKNAqGKpaQwAAfvDoNBCJYyKHdzV+D3Mn3vPP9IOMXsbJHOEb
         upeR0CTlrKk3apo52sLsVUGluaeRYkaYaafG9sLrsTLYRAaFc5OhHZTMKNBaDaYi6W64
         qKJGC53BmVyddhZJBPeZscsPTVOhdjQge1oz/5WutGznBVa0uFMDY8dNrtrut6r2wA6Z
         YyCYcJjC51OX77SLgJ0NBxxysNkqrDyzomt8k6G8sLAa1jSR8ryfCzSFbYqV91jyAw83
         5bCw==
X-Forwarded-Encrypted: i=1; AHgh+RpEl5W3Mb8p6tkOehiHfUCOkNO06tu1Toir+Mx8q4CwIOpmJP5IjCS9qMFEcItp9vVoE4E6Zu8dikJLSg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxO4wEPZn0cgGgK1rDTXuiOhwkUNML/fnKGRHN4KfPRCnS+P7y/
	rfLQwGQeZmMVWOMQMLfRRn8Ty6hH9wQXSC/pfIhd+98+GPzj4aiOSACA/4Y5JQibEDfkQ998J9c
	rT/TchpAWp4z6ZcORHJmUFyCnu96nXU4GmlA4OjmQ2tKLnxI9Fk4KF7PuV+klYzMzgg==
X-Gm-Gg: AfdE7cngOBTpLAUQ2r+N0k/Bk7zsaLIdqRs7/G7ygdphx9vquqpM34LsRMGNAHXv8bg
	vYwnwud602/+G8Qd24eyCYBgzmNiWDgGRIuePx5fuBliO8zudLi06J6/8Phd5dmaDuB21A2OmRK
	++1gVd8tdUf85FKeHuy0UGI17UszlBu1eVScE9N2uKupA2oDC7jYME9NnYq0/9pDKMSVQf9thF7
	l53cObZKZaf4tB8XXydraroaLjxdhlvF2e5oHS0JctDI9JWonGesDN1mCyyKYDHMxrhIywb4KZY
	vmIUBNYKMguBX+7nPEXwDoGtDwRFok4RERwpfL+pRZ0hXWoqeg9JColeg2S8SNO5pdLgJJODcSz
	Z7HSzGfRTFpq66kXYJIqkwnxL/M9RMnMfUGkmfc0i/XCn
X-Received: by 2002:a17:902:c405:b0:2c9:bd64:8c8b with SMTP id d9443c01a7336-2ce9ee1143amr182310185ad.31.1784124624389;
        Wed, 15 Jul 2026 07:10:24 -0700 (PDT)
X-Received: by 2002:a17:902:c405:b0:2c9:bd64:8c8b with SMTP id d9443c01a7336-2ce9ee1143amr182309755ad.31.1784124623841;
        Wed, 15 Jul 2026 07:10:23 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf1070b68dsm2913215ad.79.2026.07.15.07.10.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 07:10:23 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Wed, 15 Jul 2026 19:39:56 +0530
Subject: [PATCH v9 02/14] media: iris: Add hooks to initialize and tear
 down context banks
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260715-glymur-v9-2-8cf2cbe12a07@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784124602; l=3226;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=vPJQbRQVpDgoYGPs3GH5JVsYjK3ZXwBn3AcrWWr9aTo=;
 b=YMlHOOpdBxPUQfilr8FFvs7rxdpEwUrOIv6CUO72aj/DfFHXZ1yBpMUAyh3JdQPWw6a4B1g7i
 0vDkxE1LkISBimhCDQKIHtl9/ukK1HkLgY3dv2aXdOluIoc0X7ucy6/
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDE0MSBTYWx0ZWRfX/4PHuwQ3jdIL
 DYWfWmzZI4SBGEpqR/89VIxOdTJvOqy3CVNcQNYKUOS/IQ7ZFK5RjPTaeX4N81tzpQEq4R1eT6q
 K1lEFxI19Ep65f5pXzarn9NLLM3FSR4=
X-Proofpoint-ORIG-GUID: 5Vbaj6GCCt4FLb5om8tcXNAjFEmZW0vo
X-Proofpoint-GUID: 5Vbaj6GCCt4FLb5om8tcXNAjFEmZW0vo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDE0MSBTYWx0ZWRfX3Yh271/yM5c3
 kiZRySU64To52p04mB+IxFHIjAJVQmCZeibzJUqkqfNH+A+LlSd0xbsLLdBgxbo/jrIFxUrZKRh
 ptzc/bXBabIan1cYL1wnfPxlo5UTuqnwzXq5I4jROopi1n/i+zzVGgParB4ZqJKHPaI3it97PMt
 8RnD/rVT6dQHIpwe7Mco2sZRIRjIusOtiwL62wQSePkvp2dIXBHFsZpPgRZIBjHNBGIfj3CIBCQ
 +4KwCb0XVI4tU4j3jeidXGoujPY+hgVyoeOaxPUqUwWCalMeWIQR9mWNyycUTjy+drQhbEymIcQ
 OkPAl45JUQtAKsQ7/w8+7ZfKXMoQyK6O2xZNOmN3BHkCjKgCqXz6orckdr1CRKC+8/ooGysd+rP
 NgiYbY5NTrRilo206vILmiV0mFi4QwBk31zFBjbP79e9prXIcVsOvacVsLd1j2LySAW8eqcYQm1
 spz1bW8Z11ke0oo06hA==
X-Authority-Analysis: v=2.4 cv=BajoFLt2 c=1 sm=1 tr=0 ts=6a5794d1 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=t9ty7G3lAAAA:8 a=UiTy4FYwoVgUUf68WHMA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=CsAS6f0m0zARWR-uHzm3:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_03,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 malwarescore=0 clxscore=1015 bulkscore=0
 impostorscore=0 adultscore=0 spamscore=0 priorityscore=1501
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
	TAGGED_FROM(0.00)[bounces-67690-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,linux.dev,kernel.org,8bytes.org,arm.com,gmail.com];
	FORGED_RECIPIENTS(0.00)[m:vikash.garodia@oss.qualcomm.com,m:dikshita.agarwal@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:mchehab@kernel.org,m:joro@8bytes.org,m:will@kernel.org,m:robin.murphy@arm.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:stanimir.k.varbanov@gmail.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:iommu@lists.linux.dev,m:devicetree@vger.kernel.org,m:busanna.reddy@oss.qualcomm.com,m:daniel@quora.org,m:krzk@kernel.org,m:conor@kernel.org,m:stanimirkvarbanov@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[busanna.reddy@oss.qualcomm.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email];
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
X-Rspamd-Queue-Id: 1CBDD75F356
X-Rspamd-Action: no action

From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>

Add platform hooks to set up and tear down context bank devices.
Different iris platforms may require different context bank setup, so
let platform data provide the required operations via vpu_ops.

Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Tested-by: Daniel J Blueman <daniel@quora.org>
---
 drivers/media/platform/qcom/iris/iris_probe.c      | 25 +++++++++++++++++++++-
 drivers/media/platform/qcom/iris/iris_vpu_common.h |  2 ++
 2 files changed, 26 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
index c2dcb50a2782..2594f5a67378 100644
--- a/drivers/media/platform/qcom/iris/iris_probe.c
+++ b/drivers/media/platform/qcom/iris/iris_probe.c
@@ -15,6 +15,7 @@
 #include "iris_core.h"
 #include "iris_ctrls.h"
 #include "iris_vidc.h"
+#include "iris_vpu_common.h"
 
 static int iris_init_icc(struct iris_core *core)
 {
@@ -150,6 +151,20 @@ static int iris_init_resources(struct iris_core *core)
 	return iris_init_resets(core);
 }
 
+static int iris_init_cb_devs(struct iris_core *core)
+{
+	if (core->iris_platform_data->vpu_ops->init_cb_devs)
+		return core->iris_platform_data->vpu_ops->init_cb_devs(core);
+
+	return 0;
+}
+
+static void iris_deinit_cb_devs(struct iris_core *core)
+{
+	if (core->iris_platform_data->vpu_ops->deinit_cb_devs)
+		core->iris_platform_data->vpu_ops->deinit_cb_devs(core);
+}
+
 static int iris_register_video_device(struct iris_core *core, enum domain_type type)
 {
 	struct video_device *vdev;
@@ -207,6 +222,8 @@ static void iris_remove(struct platform_device *pdev)
 
 	v4l2_device_unregister(&core->v4l2_dev);
 
+	iris_deinit_cb_devs(core);
+
 	mutex_destroy(&core->lock);
 }
 
@@ -273,10 +290,14 @@ static int iris_probe(struct platform_device *pdev)
 
 	iris_session_init_caps(core);
 
-	ret = v4l2_device_register(dev, &core->v4l2_dev);
+	ret = iris_init_cb_devs(core);
 	if (ret)
 		return ret;
 
+	ret = v4l2_device_register(dev, &core->v4l2_dev);
+	if (ret)
+		goto err_cb_deinit;
+
 	ret = iris_register_video_device(core, DECODER);
 	if (ret)
 		goto err_v4l2_unreg;
@@ -310,6 +331,8 @@ static int iris_probe(struct platform_device *pdev)
 	video_unregister_device(core->vdev_dec);
 err_v4l2_unreg:
 	v4l2_device_unregister(&core->v4l2_dev);
+err_cb_deinit:
+	iris_deinit_cb_devs(core);
 
 	return ret;
 }
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.h b/drivers/media/platform/qcom/iris/iris_vpu_common.h
index 09799a375c14..a8df9af0d3da 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.h
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.h
@@ -22,6 +22,8 @@ struct vpu_ops {
 	void (*program_bootup_registers)(struct iris_core *core);
 	u64 (*calc_freq)(struct iris_inst *inst, size_t data_size);
 	int (*set_hwmode)(struct iris_core *core);
+	int (*init_cb_devs)(struct iris_core *core);
+	void (*deinit_cb_devs)(struct iris_core *core);
 };
 
 int iris_vpu_boot_firmware(struct iris_core *core);

-- 
2.34.1


