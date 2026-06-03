Return-Path: <linux-media+bounces-63614-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id T5JdBzY6IGp/ywAAu9opvQ
	(envelope-from <linux-media+bounces-63614-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 16:29:10 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AAC65638944
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 16:29:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=ICVnMEpG;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=JGElS9Tj;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63614-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-63614-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D339330C7708
	for <lists+linux-media@lfdr.de>; Wed,  3 Jun 2026 14:22:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72C5F481FA8;
	Wed,  3 Jun 2026 14:21:18 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AB4B481675
	for <linux-media@vger.kernel.org>; Wed,  3 Jun 2026 14:21:15 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780496477; cv=none; b=kEQxWtRigameiHxkjdgI9jVfwYkTY6jmsQ3NSy/p71Ry8Xi36lvqrBZiSRPqwW83nCS3XZbkMftZ9CssfQ3jnh1eG2VDACMYLz0XaZgL4QEpuIpPmZSQ8ntvXbrfK5gVsmKIE3Bm5nBO7VYRT5uOFnkREYbOy1WDk/J3vM/ps1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780496477; c=relaxed/simple;
	bh=Qr55YK4UILDSpCn5z9LzoeijZ/rblrUh2BUSItpdnHY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DlJ2mgDSHpf74NfRD0qPsP2Yi8MuN1nsw+29EnDlA+Hy+ErDkc8VtlfK1NY2HnDujGfZmfxiPoNbslAh/YYbXmP/XieNgIKXEp+Vytz4vf74NQDx8GSimYlsQZnZYFPUjwdL5OaZpsVnPPDZRjUeKj4qOkfiYd1qtl86YLPrwQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ICVnMEpG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JGElS9Tj; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 653BxDtC1740497
	for <linux-media@vger.kernel.org>; Wed, 3 Jun 2026 14:21:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5w17hADckfm07BVuITcdxu8kpxJXFJgj4fHmSWRoO2w=; b=ICVnMEpGYyVb0y3q
	bUUot6s9eljgrHGKQVw+eqJz/0c67hk8stGdmmpeyRiBmzrCpZRMlTShUp7iCq6m
	AD11sziJSFXs5ZPzuAQTwyg7mMoTNlVRTw0xwsL6ZWU/9uWyiXo1t4vo8ZODH0e1
	C/YxK5wvAz8QSGA1hw1xbLoY2/u2AsVwAMx0tk/qN760dgeI5sU0KFjYimP28v7q
	9OkZMHztrNtojAax4n1X9gul7UYcC//a28KYlrGJ46gSNboXulUezqt7CT1msicJ
	SLXhZA5WC/IeazJr9Ub8gBV4GmEQx2WMTsOkcjwTMy+Fmd1z2MeBRBO8Y8O5pSc7
	WOogZg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejdq7t7st-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 03 Jun 2026 14:21:14 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2c0c36f1cc0so68447135ad.3
        for <linux-media@vger.kernel.org>; Wed, 03 Jun 2026 07:21:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780496474; x=1781101274; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5w17hADckfm07BVuITcdxu8kpxJXFJgj4fHmSWRoO2w=;
        b=JGElS9Tj4Q+DDBk2qdnaX4wxpXc/jyduOqwQg3Qh42amroQ628blvXFODdjLeIEcL8
         g4njWubgivgpIjVAx20fx8OBkJrup2IY9K3Xxt9CI0LORW0Jsqyt9rJrxh1SI7JlFubS
         MSgYBAUv1GETK5sxRVXaR3JkUQMD0J3Swq1txyNjSS3ny9G2EWf0hbrNtYTsrXS326kg
         UqvnHC5O1y6CgztZdebOCEZ8pVn9Lx5Ru4uhjTWlcsknHbkATLg7k5aRk01ZIXqSh1Vd
         AtwNpjw9ZJECDDTZfAbGZBTqrioD7qvW4r4ocZfujDUa/nUy64AX2b2Z9zZK/n2DBsF/
         jbiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780496474; x=1781101274;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5w17hADckfm07BVuITcdxu8kpxJXFJgj4fHmSWRoO2w=;
        b=OTjioeALhr8ojcP2t7DNa3YpwA98tZHOWlvuN7Q9qzjRfjPJ1e8dCTQttVuv7cxwIG
         Yn1EE2uDqoJMJJhDneYKEn/BPQF9RIicF5I40cTFxK2hA8FoZoPM0xa/j24s+Ez0S2P0
         bGGNR5r26QBdItmVcdFxmAhZzo/EZ4IZN2+8f0k4bcvwA82AeOiE65Lh2ACmxWyvGazl
         SoWjDaK5SS4KYbcPrmEKK90F6hXaueKFb4O4zYtryNJzIpqdjySjYwVXKRWw55Rk1h5d
         66FebtPd9NGnNYnrwukyoeiGrWKBxun2uOjAN/y5CeONoPsI7XGpXiNMbGFMZ/UcjkYa
         NMeQ==
X-Forwarded-Encrypted: i=1; AFNElJ8r2a1HE3Ioa+/rsjwrFBYc3aHIPJ/wQiv0KB1UzIGzLp9Jlz4lMvOG5O1RuVi5v8DXSDjNaQqaPmloUg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yya6b9mSAmzMxMtZaFK3xhAivF8/PiHsNwqxJ+4Mm8Mau9AgzVR
	yUuKVNTQW5p9YGpHqJAlnT3dqX5ruItgDEhjFesNWSgeJ8e62RyIguzqcwrJXJLJhqsK1/bKvEx
	tSHDHfRHLaJW3SE8HGqtNDT6BRNx8Mq6SKspGJDfAZVEKWvrKasNS73lJ+ZciH/MtdA==
X-Gm-Gg: Acq92OH1VDyhYSW7fXF2nHsSsvgj3hAfTjIgzdTl0koNeNvXvsXodLGmXF5Dpsj8HCZ
	Nqe51UwXkNfcod7mWaQ3Yfjue5qomcReYYwzyLjwvPIp0+8k1KaZ0ZsVaRHojFJ1xrjxAoHom9K
	ocsvM9xSiqNnkMmW34Hl1SnE075Jq0uENzwG2LNyMmEzH8W+Xpn/HczN9tFZJ2NIuNdOIuuiMg4
	8jP0QM4/AhMoW4U6J0U8yR2hcp1rSV48Rf9/vMiNxwaoFkJoEF4mlQ0nFh4cMw3Rr+a0406N7jb
	4WR7dI/ULKHdd6YhKR1rCWFH3Rt4JUrtd/CWxZY/P7T6w1eh/2jFoKVN765kebRW+ybuYhezm5n
	p+0A0nZfJVS1ifCYENljVTDX7boldFvUfiam99u9YnBs1XA02V+ktJN9Iz07d+V28pQ==
X-Received: by 2002:a17:903:37cf:b0:2c0:cce6:a45e with SMTP id d9443c01a7336-2c1644dcebbmr37765055ad.38.1780496473644;
        Wed, 03 Jun 2026 07:21:13 -0700 (PDT)
X-Received: by 2002:a17:903:37cf:b0:2c0:cce6:a45e with SMTP id d9443c01a7336-2c1644dcebbmr37764645ad.38.1780496473097;
        Wed, 03 Jun 2026 07:21:13 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f6d37esm41514955ad.9.2026.06.03.07.21.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 07:21:12 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Wed, 03 Jun 2026 19:48:47 +0530
Subject: [PATCH v7 09/12] media: iris: Add support to select core for dual
 core platforms
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260603-glymur-v7-9-afaa55d11fe0@oss.qualcomm.com>
References: <20260603-glymur-v7-0-afaa55d11fe0@oss.qualcomm.com>
In-Reply-To: <20260603-glymur-v7-0-afaa55d11fe0@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
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
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780496410; l=17586;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=Qr55YK4UILDSpCn5z9LzoeijZ/rblrUh2BUSItpdnHY=;
 b=ke/y/GaEFdPaqCo1MPEHiYucw0V2m6mKbtEB+ZSyJqec0uJlpIgY7LLsvzHb0Eilq8q+yh8c8
 0Dq4CFH+XgZD9AZD5o8GDskgK6N7j1aoEjqfjwvwzjZFf50yjrl0rQv
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAzMDEzNyBTYWx0ZWRfX50o5PfL+sEFm
 pdlEu9Hl9uzJPfbee4Afx9DphE/hpwwyT+QQh+qVchfOOTMYKq9oEfwnkZlyCGQ55up5/FQHLZW
 RuRfRDs0r300dF3yRjYUBUs4kbEEY4VBEDoJ5sGK2ibFn4KylBeJ+Jx54F0Fozb2R45W6xCzouZ
 dDJbB9BcyFGhSH+RKxnJlh9MfzUtDaN7QN9tPo4LLZ8SdtqW9UiNQJE+KlX+wSLft4Y5cj9HR2V
 JOWzP30GBh++JC5R1YFTIvWmSPWduGAGP42MWL/5KJJPR7XorJw4nKVTebY2NxkpWuFADbB6lae
 GTyFSlEp+vE0FaWLAe/3dLt5bDS2sfzlsgrO95o/06y3BoAfRNtajg9eq0BnbwKGWiaH28g6NqA
 pPLoOIeYG1XioxD4BQqBx3sNU/LUqCxfkkZyUTWp7r5PEg7Qb6fwH/jgmSvcuMTxi/legHgYFfH
 xWjEWJV/UIWBd3Q9meg==
X-Proofpoint-ORIG-GUID: ViCZ6HN1eoYe-BiLYcnbvy-4m65HMUGf
X-Proofpoint-GUID: ViCZ6HN1eoYe-BiLYcnbvy-4m65HMUGf
X-Authority-Analysis: v=2.4 cv=ccniaHDM c=1 sm=1 tr=0 ts=6a20385a cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=pq9AK7GQSdwHzPcdQgIA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-03_05,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 adultscore=0 phishscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606030137
X-Rspamd-Action: no action
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
	TAGGED_FROM(0.00)[bounces-63614-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,linux.dev,kernel.org,8bytes.org,arm.com,gmail.com];
	FORGED_RECIPIENTS(0.00)[m:vikash.garodia@oss.qualcomm.com,m:dikshita.agarwal@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:joro@8bytes.org,m:will@kernel.org,m:robin.murphy@arm.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:stanimir.k.varbanov@gmail.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:iommu@lists.linux.dev,m:devicetree@vger.kernel.org,m:busanna.reddy@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,m:stanimirkvarbanov@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[busanna.reddy@oss.qualcomm.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
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
X-Rspamd-Queue-Id: AAC65638944

On platforms with two video codec cores, select the hardware core for
a new session based on the current Macroblocks Per Frame (MBPF) and
Macroblocks Per Second (MBPS) load on each core. The selected core is
communicated to the firmware via the HFI_PROP_CORE_ID property at
stream-on time.

Since both cores share the same clock source, the required clock
frequency is the maximum of the aggregated frequencies across both
cores.

The total session count limit is scaled by the number of cores, since
each core independently supports sessions up to its own limit.

Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_common.c     | 10 ++++
 drivers/media/platform/qcom/iris/iris_common.h     |  1 +
 drivers/media/platform/qcom/iris/iris_core.h       |  5 ++
 drivers/media/platform/qcom/iris/iris_hfi_common.h |  1 +
 .../platform/qcom/iris/iris_hfi_gen2_command.c     | 19 +++++++
 .../platform/qcom/iris/iris_hfi_gen2_defines.h     |  1 +
 drivers/media/platform/qcom/iris/iris_instance.h   |  2 +
 drivers/media/platform/qcom/iris/iris_power.c      | 20 +++++--
 drivers/media/platform/qcom/iris/iris_utils.c      | 58 +++++++++++++-------
 drivers/media/platform/qcom/iris/iris_utils.h      |  3 +-
 drivers/media/platform/qcom/iris/iris_vb2.c        |  4 ++
 drivers/media/platform/qcom/iris/iris_vidc.c       |  6 ++-
 drivers/media/platform/qcom/iris/iris_vpu3x.c      | 63 ++++++++++++++++++++++
 drivers/media/platform/qcom/iris/iris_vpu_common.h |  2 +
 14 files changed, 171 insertions(+), 24 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_common.c b/drivers/media/platform/qcom/iris/iris_common.c
index 25836561bcf3..abea6807a59e 100644
--- a/drivers/media/platform/qcom/iris/iris_common.c
+++ b/drivers/media/platform/qcom/iris/iris_common.c
@@ -46,6 +46,16 @@ void iris_set_ts_metadata(struct iris_inst *inst, struct vb2_v4l2_buffer *vbuf)
 	inst->metadata_idx++;
 }
 
+int iris_set_core_id(struct iris_inst *inst)
+{
+	const struct iris_hfi_session_ops *hfi_ops = inst->hfi_session_ops;
+
+	if (!inst->core_id)
+		return 0;
+
+	return hfi_ops->session_set_core_id(inst, inst->core_id);
+}
+
 int iris_process_streamon_input(struct iris_inst *inst)
 {
 	const struct iris_hfi_session_ops *hfi_ops = inst->hfi_session_ops;
diff --git a/drivers/media/platform/qcom/iris/iris_common.h b/drivers/media/platform/qcom/iris/iris_common.h
index b2a27b781c9a..34e32c60f768 100644
--- a/drivers/media/platform/qcom/iris/iris_common.h
+++ b/drivers/media/platform/qcom/iris/iris_common.h
@@ -11,6 +11,7 @@ struct iris_buffer;
 
 int iris_vb2_buffer_to_driver(struct vb2_buffer *vb2, struct iris_buffer *buf);
 void iris_set_ts_metadata(struct iris_inst *inst, struct vb2_v4l2_buffer *vbuf);
+int iris_set_core_id(struct iris_inst *inst);
 int iris_process_streamon_input(struct iris_inst *inst);
 int iris_process_streamon_output(struct iris_inst *inst);
 int iris_session_streamoff(struct iris_inst *inst, u32 plane);
diff --git a/drivers/media/platform/qcom/iris/iris_core.h b/drivers/media/platform/qcom/iris/iris_core.h
index ee601fa68ff1..14756d506594 100644
--- a/drivers/media/platform/qcom/iris/iris_core.h
+++ b/drivers/media/platform/qcom/iris/iris_core.h
@@ -36,6 +36,11 @@ enum domain_type {
 	DECODER	= BIT(1),
 };
 
+enum iris_vcodec_core_id {
+	IRIS_VCODEC0 = 1,
+	IRIS_VCODEC1,
+};
+
 struct qcom_ubwc_cfg_data;
 
 /**
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_common.h b/drivers/media/platform/qcom/iris/iris_hfi_common.h
index a27447eb2519..47786529998d 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_common.h
+++ b/drivers/media/platform/qcom/iris/iris_hfi_common.h
@@ -131,6 +131,7 @@ struct iris_hfi_session_ops {
 	int (*session_drain)(struct iris_inst *inst, u32 plane);
 	int (*session_resume_drain)(struct iris_inst *inst, u32 plane);
 	int (*session_close)(struct iris_inst *inst);
+	int (*session_set_core_id)(struct iris_inst *inst, u32 core_id);
 };
 
 struct hfi_subscription_params {
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
index 7ac69af63ead..1d8b47e7164e 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
@@ -1291,6 +1291,24 @@ static int iris_hfi_gen2_session_release_buffer(struct iris_inst *inst, struct i
 					inst_hfi_gen2->packet->size);
 }
 
+static int iris_hfi_gen2_set_core_id(struct iris_inst *inst, u32 core_id)
+{
+	struct iris_inst_hfi_gen2 *inst_hfi_gen2 = to_iris_inst_hfi_gen2(inst);
+	u32 payload = core_id;
+
+	iris_hfi_gen2_packet_session_command(inst,
+					     HFI_PROP_CORE_ID,
+					     HFI_HOST_FLAGS_NONE,
+					     HFI_PORT_NONE,
+					     inst->session_id,
+					     HFI_PAYLOAD_U32,
+					     &payload,
+					     sizeof(u32));
+
+	return iris_hfi_queue_cmd_write(inst->core, inst_hfi_gen2->packet,
+					inst_hfi_gen2->packet->size);
+}
+
 static const struct iris_hfi_session_ops iris_hfi_gen2_session_ops = {
 	.session_open = iris_hfi_gen2_session_open,
 	.session_set_config_params = iris_hfi_gen2_session_set_config_params,
@@ -1304,6 +1322,7 @@ static const struct iris_hfi_session_ops iris_hfi_gen2_session_ops = {
 	.session_drain = iris_hfi_gen2_session_drain,
 	.session_resume_drain = iris_hfi_gen2_session_resume_drain,
 	.session_close = iris_hfi_gen2_session_close,
+	.session_set_core_id = iris_hfi_gen2_set_core_id,
 };
 
 static struct iris_inst *iris_hfi_gen2_get_instance(void)
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
index d09096a9d5f9..9177ac782c4f 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
@@ -56,6 +56,7 @@
 #define HFI_PROP_BUFFER_HOST_MAX_COUNT		0x03000123
 #define HFI_PROP_BUFFER_FW_MIN_OUTPUT_COUNT	0x03000124
 #define HFI_PROP_PIC_ORDER_CNT_TYPE		0x03000128
+#define HFI_PROP_CORE_ID			0x030001a9
 
 enum hfi_rate_control {
 	HFI_RC_VBR_CFR		= 0x00000000,
diff --git a/drivers/media/platform/qcom/iris/iris_instance.h b/drivers/media/platform/qcom/iris/iris_instance.h
index c54d8ec8562a..5be54493acdd 100644
--- a/drivers/media/platform/qcom/iris/iris_instance.h
+++ b/drivers/media/platform/qcom/iris/iris_instance.h
@@ -34,6 +34,7 @@ enum iris_fmt_type_cap {
  *
  * @list: used for attach an instance to the core
  * @core: pointer to core structure
+ * @core_id: specifies the hardware core on which the session runs
  * @session_id: id of current video session
  * @hfi_session_ops: iris HFI session ops
  * @ctx_q_lock: lock to serialize queues related ioctls
@@ -81,6 +82,7 @@ enum iris_fmt_type_cap {
 struct iris_inst {
 	struct list_head		list;
 	struct iris_core		*core;
+	u32				core_id;
 	u32				session_id;
 	const struct iris_hfi_session_ops	*hfi_session_ops;
 	struct mutex			ctx_q_lock;/* lock to serialize queues related ioctls */
diff --git a/drivers/media/platform/qcom/iris/iris_power.c b/drivers/media/platform/qcom/iris/iris_power.c
index 91aa21d4070e..a875647b3162 100644
--- a/drivers/media/platform/qcom/iris/iris_power.c
+++ b/drivers/media/platform/qcom/iris/iris_power.c
@@ -75,14 +75,12 @@ static int iris_vote_interconnects(struct iris_inst *inst)
 	return iris_set_interconnects(inst);
 }
 
-static int iris_set_clocks(struct iris_inst *inst)
+static u64 iris_get_required_freq(struct iris_inst *inst)
 {
 	struct iris_core *core = inst->core;
 	struct iris_inst *instance;
 	u64 freq = 0;
-	int ret;
 
-	mutex_lock(&core->lock);
 	list_for_each_entry(instance, &core->instances, list) {
 		if (!instance->max_input_data_size)
 			continue;
@@ -90,6 +88,22 @@ static int iris_set_clocks(struct iris_inst *inst)
 		freq += instance->power.min_freq;
 	}
 
+	return freq;
+}
+
+static int iris_set_clocks(struct iris_inst *inst)
+{
+	const struct vpu_ops *vpu_ops = inst->core->iris_platform_data->vpu_ops;
+	struct iris_core *core = inst->core;
+	u64 freq;
+	int ret;
+
+	mutex_lock(&core->lock);
+	if (vpu_ops->get_required_freq)
+		freq = vpu_ops->get_required_freq(inst);
+	else
+		freq = iris_get_required_freq(inst);
+
 	core->power.clk_freq = freq;
 	ret = iris_opp_set_rate(core->dev, freq);
 	mutex_unlock(&core->lock);
diff --git a/drivers/media/platform/qcom/iris/iris_utils.c b/drivers/media/platform/qcom/iris/iris_utils.c
index 29b07d88507e..391855c42164 100644
--- a/drivers/media/platform/qcom/iris/iris_utils.c
+++ b/drivers/media/platform/qcom/iris/iris_utils.c
@@ -7,6 +7,7 @@
 #include <media/v4l2-mem2mem.h>
 
 #include "iris_instance.h"
+#include "iris_vpu_common.h"
 #include "iris_utils.h"
 
 bool iris_res_is_less_than(u32 width, u32 height,
@@ -23,7 +24,7 @@ bool iris_res_is_less_than(u32 width, u32 height,
 	return false;
 }
 
-int iris_get_mbpf(struct iris_inst *inst)
+u32 iris_get_mbpf(struct iris_inst *inst)
 {
 	struct v4l2_format *inp_f = inst->fmt_src;
 	u32 height = max(inp_f->fmt.pix_mp.height, inst->crop.height);
@@ -32,6 +33,13 @@ int iris_get_mbpf(struct iris_inst *inst)
 	return NUM_MBS_PER_FRAME(height, width);
 }
 
+u32 iris_get_mbps(struct iris_inst *inst)
+{
+	u32 fps = max(inst->frame_rate, inst->operating_rate);
+
+	return iris_get_mbpf(inst) * fps;
+}
+
 bool iris_split_mode_enabled(struct iris_inst *inst)
 {
 	return inst->fmt_dst->fmt.pix_mp.pixelformat == V4L2_PIX_FMT_NV12 ||
@@ -87,40 +95,52 @@ struct iris_inst *iris_get_instance(struct iris_core *core, u32 session_id)
 	return NULL;
 }
 
-int iris_check_core_mbpf(struct iris_inst *inst)
+static int iris_check_core_load(struct iris_inst *inst, bool mbpf)
 {
-	struct iris_core *core = inst->core;
+	const struct iris_platform_data *platform_data = inst->core->iris_platform_data;
+	u32 max_load = mbpf ? platform_data->max_core_mbpf : platform_data->max_core_mbps;
 	struct iris_inst *instance;
-	u32 total_mbpf = 0;
+	u32 total_load = 0;
 
-	mutex_lock(&core->lock);
-	list_for_each_entry(instance, &core->instances, list)
-		total_mbpf += iris_get_mbpf(instance);
-	mutex_unlock(&core->lock);
+	list_for_each_entry(instance, &inst->core->instances, list)
+		total_load += mbpf ? iris_get_mbpf(instance) : iris_get_mbps(instance);
 
-	if (total_mbpf > core->iris_platform_data->max_core_mbpf)
+	if (total_load > max_load)
 		return -ENOMEM;
 
 	return 0;
 }
 
-int iris_check_core_mbps(struct iris_inst *inst)
+int iris_check_core_mbpf(struct iris_inst *inst)
 {
+	const struct vpu_ops *vpu_ops = inst->core->iris_platform_data->vpu_ops;
 	struct iris_core *core = inst->core;
-	struct iris_inst *instance;
-	u32 total_mbps = 0, fps = 0;
+	int ret;
 
 	mutex_lock(&core->lock);
-	list_for_each_entry(instance, &core->instances, list) {
-		fps = max(instance->frame_rate, instance->operating_rate);
-		total_mbps += iris_get_mbpf(instance) * fps;
-	}
+	if (vpu_ops->check_core_load)
+		ret = vpu_ops->check_core_load(inst, true);
+	else
+		ret = iris_check_core_load(inst, true);
 	mutex_unlock(&core->lock);
 
-	if (total_mbps > core->iris_platform_data->max_core_mbps)
-		return -ENOMEM;
+	return ret;
+}
 
-	return 0;
+int iris_check_core_mbps(struct iris_inst *inst)
+{
+	const struct vpu_ops *vpu_ops = inst->core->iris_platform_data->vpu_ops;
+	struct iris_core *core = inst->core;
+	int ret;
+
+	mutex_lock(&core->lock);
+	if (vpu_ops->check_core_load)
+		ret = vpu_ops->check_core_load(inst, false);
+	else
+		ret = iris_check_core_load(inst, false);
+	mutex_unlock(&core->lock);
+
+	return ret;
 }
 
 bool is_rotation_90_or_270(struct iris_inst *inst)
diff --git a/drivers/media/platform/qcom/iris/iris_utils.h b/drivers/media/platform/qcom/iris/iris_utils.h
index b5705d156431..a9958359d2dc 100644
--- a/drivers/media/platform/qcom/iris/iris_utils.h
+++ b/drivers/media/platform/qcom/iris/iris_utils.h
@@ -43,7 +43,8 @@ static inline enum iris_buffer_type iris_v4l2_type_to_driver(u32 type)
 
 bool iris_res_is_less_than(u32 width, u32 height,
 			   u32 ref_width, u32 ref_height);
-int iris_get_mbpf(struct iris_inst *inst);
+u32 iris_get_mbpf(struct iris_inst *inst);
+u32 iris_get_mbps(struct iris_inst *inst);
 bool iris_split_mode_enabled(struct iris_inst *inst);
 struct iris_inst *iris_get_instance(struct iris_core *core, u32 session_id);
 void iris_helper_buffers_done(struct iris_inst *inst, unsigned int type,
diff --git a/drivers/media/platform/qcom/iris/iris_vb2.c b/drivers/media/platform/qcom/iris/iris_vb2.c
index a2ea2d67f60d..dbb89396e651 100644
--- a/drivers/media/platform/qcom/iris/iris_vb2.c
+++ b/drivers/media/platform/qcom/iris/iris_vb2.c
@@ -176,6 +176,10 @@ int iris_vb2_start_streaming(struct vb2_queue *q, unsigned int count)
 	if (ret)
 		goto error;
 
+	ret = iris_set_core_id(inst);
+	if (ret)
+		goto error;
+
 	if (V4L2_TYPE_IS_OUTPUT(q->type)) {
 		if (inst->domain == DECODER)
 			ret = iris_vdec_streamon_input(inst);
diff --git a/drivers/media/platform/qcom/iris/iris_vidc.c b/drivers/media/platform/qcom/iris/iris_vidc.c
index 14d63dc76c9b..059d020f28c3 100644
--- a/drivers/media/platform/qcom/iris/iris_vidc.c
+++ b/drivers/media/platform/qcom/iris/iris_vidc.c
@@ -41,16 +41,20 @@ static void iris_v4l2_fh_deinit(struct iris_inst *inst, struct file *filp)
 
 static void iris_add_session(struct iris_inst *inst)
 {
+	const struct iris_platform_data *plat = inst->core->iris_platform_data;
+	u32 max_session_count = plat->max_session_count;
 	struct iris_core *core = inst->core;
 	struct iris_inst *iter;
 	u32 count = 0;
 
+	max_session_count *= max(plat->num_cores, 1);
+
 	mutex_lock(&core->lock);
 
 	list_for_each_entry(iter, &core->instances, list)
 		count++;
 
-	if (count < core->iris_platform_data->max_session_count)
+	if (count < max_session_count)
 		list_add_tail(&inst->list, &core->instances);
 
 	mutex_unlock(&core->lock);
diff --git a/drivers/media/platform/qcom/iris/iris_vpu3x.c b/drivers/media/platform/qcom/iris/iris_vpu3x.c
index 65896d0c1f16..9f8dacfa768d 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu3x.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu3x.c
@@ -318,6 +318,67 @@ static void iris_vpu36_program_bootup_registers(struct iris_core *core)
 	writel(0x0, core->reg_base + CPU_CS_SCIACMDARG3);
 }
 
+static int iris_vpu36_check_core_load(struct iris_inst *inst, bool mbpf)
+{
+	const struct iris_platform_data *platform_data = inst->core->iris_platform_data;
+	u32 max_load = mbpf ? platform_data->max_core_mbpf : platform_data->max_core_mbps;
+	u32 max_session_cnt = platform_data->max_session_count;
+	u32 core0_session_cnt = 0, core1_session_cnt = 0;
+	u32 core0_load = 0, core1_load = 0;
+	bool select_core0, select_core1;
+	struct iris_inst *instance;
+	u32 load, new_load;
+
+	inst->core_id = 0;
+
+	list_for_each_entry(instance, &inst->core->instances, list) {
+		load = mbpf ? iris_get_mbpf(instance) : iris_get_mbps(instance);
+
+		if (instance->core_id == IRIS_VCODEC0) {
+			core0_load += load;
+			core0_session_cnt++;
+		} else if (instance->core_id == IRIS_VCODEC1) {
+			core1_load += load;
+			core1_session_cnt++;
+		}
+	}
+
+	new_load = mbpf ? iris_get_mbpf(inst) : iris_get_mbps(inst);
+
+	select_core0 = core0_load + new_load <= max_load && core0_session_cnt < max_session_cnt;
+	select_core1 = core1_load + new_load <= max_load && core1_session_cnt < max_session_cnt;
+
+	if (select_core0 && select_core1)
+		inst->core_id = (core0_load <= core1_load) ? IRIS_VCODEC0 : IRIS_VCODEC1;
+	else if (select_core0)
+		inst->core_id = IRIS_VCODEC0;
+	else if (select_core1)
+		inst->core_id = IRIS_VCODEC1;
+	else
+		return -ENOMEM;
+
+	return 0;
+}
+
+static u64 iris_vpu36_get_required_freq(struct iris_inst *inst)
+{
+	u64 vcodec0_freq = 0, vcodec1_freq = 0;
+	struct iris_core *core = inst->core;
+	struct iris_inst *instance;
+
+	list_for_each_entry(instance, &core->instances, list) {
+		if (!instance->max_input_data_size)
+			continue;
+
+		if (instance->core_id == IRIS_VCODEC0)
+			vcodec0_freq += instance->power.min_freq;
+		else
+			vcodec1_freq += instance->power.min_freq;
+	}
+
+	return max(vcodec0_freq, vcodec1_freq);
+}
+
 const struct vpu_ops iris_vpu3_ops = {
 	.power_off_hw = iris_vpu3_power_off_hardware,
 	.power_on_hw = iris_vpu_power_on_hw,
@@ -354,4 +415,6 @@ const struct vpu_ops iris_vpu36_ops = {
 	.program_bootup_registers = iris_vpu36_program_bootup_registers,
 	.calc_freq = iris_vpu3x_vpu4x_calculate_frequency,
 	.set_hwmode = iris_vpu36_set_hwmode,
+	.check_core_load = iris_vpu36_check_core_load,
+	.get_required_freq = iris_vpu36_get_required_freq,
 };
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.h b/drivers/media/platform/qcom/iris/iris_vpu_common.h
index e2e3e66574fa..0aebe3c74f00 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.h
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.h
@@ -25,6 +25,8 @@ struct vpu_ops {
 	int (*set_hwmode)(struct iris_core *core);
 	int (*init_cb_devs)(struct iris_core *core);
 	void (*deinit_cb_devs)(struct iris_core *core);
+	int (*check_core_load)(struct iris_inst *inst, bool mbpf);
+	u64 (*get_required_freq)(struct iris_inst *inst);
 };
 
 int iris_vpu_boot_firmware(struct iris_core *core);

-- 
2.34.1


