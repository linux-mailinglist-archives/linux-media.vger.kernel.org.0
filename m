Return-Path: <linux-media+bounces-67141-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Jc2oObGXT2q4kQIAu9opvQ
	(envelope-from <linux-media+bounces-67141-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 09 Jul 2026 14:44:33 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E2E6973122F
	for <lists+linux-media@lfdr.de>; Thu, 09 Jul 2026 14:44:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=KU2euAsZ;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Ujv16wp6;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67141-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67141-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3513C303FBBC
	for <lists+linux-media@lfdr.de>; Thu,  9 Jul 2026 12:36:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0F4A426D00;
	Thu,  9 Jul 2026 12:36:23 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4E95425CEA
	for <linux-media@vger.kernel.org>; Thu,  9 Jul 2026 12:36:21 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783600583; cv=none; b=oQ+hFLXCE0rnfHXuDMLMRb86VBHQXH60DtarLqHdIjJmflQMsYOkCsh0q+VEdXsas7vq/hEg1gCq2HG7GfIxAOTjLSw2TM8Xz9N/Th0i1ysDbtmoOb3RkRLzeyrbT0U+DLS/yUd9/TbphAUXkqBmzRxvs444hkZsO6vbK8Z+M+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783600583; c=relaxed/simple;
	bh=FZhQkSnMM9dPRPxJpT7lhmUWUWrvHN2Yh6Z3YZfE28o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iAd2MZ420Ukj5zNHXyn7dYjzvJM137b7MvlqQUyDQSckqp30P7TrGuphZt6vlznkUtUvD1miiAj7gMbBxd5NFLVoiA5m/vgFnIt73gS6ylI5CbDDzgmgd9kFf0taM7Yq5Or7ja1TrfGCJtZ4XyjpQHFbuDDZrvj03gPbaM8jTz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KU2euAsZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ujv16wp6; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669BNS9o1672672
	for <linux-media@vger.kernel.org>; Thu, 9 Jul 2026 12:36:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dPsIbfhFbiIZwzH+o9iSm89+g03Kl0ZAvMuM06ZLGc8=; b=KU2euAsZzJHruV8i
	NlofZbkin2W4jax4po89X+daOfnPZHOLg6Qflp8WWl1H64hfKr5aohqTuSfh7WXN
	fN4cR3BrFdhAYusvXKoIVPK9UX/SBrWebnsx2HlM0+fxOJfp43w5Ta1VDW9zif6g
	iBN50IEtevJFcrAw+HHAmsnbUURel9DiV4vutg+CDQixK0zq7A1tw0yuzp8Ybhbo
	bPJe6AirB1ujmbQhGZfrs0rdakjeECIaAOUG9pN8xHcxeCSTdPwYlnWfiXwczDu2
	cb5oTS//WiBI47x+1WnHPmVmKbHrz3gS4BbPUbama/bfOqCtaogEvnhWoh4h+TiT
	d5WbAA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9sqsc8us-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 09 Jul 2026 12:36:20 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-37fca5f21b1so758536a91.0
        for <linux-media@vger.kernel.org>; Thu, 09 Jul 2026 05:36:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783600580; x=1784205380; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dPsIbfhFbiIZwzH+o9iSm89+g03Kl0ZAvMuM06ZLGc8=;
        b=Ujv16wp6EvjbB/KZGRcjoix3k6mFe4wiV6wKe6NymKrZF8H1I4PWQPgv7aQtgMbgBS
         a36h6kqBf0vuJU+qcfPxAE0ykXs7UJO16PuRW0W+bIULvWOwgXojoMti3Fo94ebU1Yjg
         tA4xbdsU1QTUIcD5QnaJdCyWhN8rPwBhh9+tbpweTWW5cIq+uvDWMKWq19DQHBGN8v3p
         f0ffNIw4PQZLhbdX76m3JcVxyfM93LDkRfLagExsx7UcdDUATQb1yWX1CUpohGssgsQz
         iq45hOWZlsjLRHhtEfp3idcUHypqt1ACmr9zpGbX4GDnl8Z02myOusPFjCljgMqI2YZb
         2DKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783600580; x=1784205380;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dPsIbfhFbiIZwzH+o9iSm89+g03Kl0ZAvMuM06ZLGc8=;
        b=Tq2/NAXAMc7dxYfU55vOzboziUp/ceXX3fGzEclNnHFKBnSsaXKUTSprXb1ET1tChW
         DvvP9qYtvHhHViL70AScy8TbNakfYIyrBXzbrgSufN+vOQh5jWLj4xvF6Lt44qFe54Sl
         AQ3Lb7MNYyjiT05otbGIR/WQfsNA89T/YXgmBsgghA7ehlN+F2L3jts97FE3bzB3s0RY
         iozmHOUgdpE3lyRviCPmRxqq+9jfuJuc4MGuoHkmbAS8uZPeBuk+fc8GCWQgaZkZYRdZ
         meXbJ4LzF4OQtXzoRm/Ah4+40VLRFdBosUS3ka5hgBF8VisXzaPljpv/2Y+mhmaYKGON
         kz1w==
X-Gm-Message-State: AOJu0YxM0lEDJqv0obdZ4HE+2yabUWHdF42dZrehg7AoXW1W1Y18apGs
	w1ADrS1MnJ0GJvySHZ+k416Buf8mQ9egwzXGDnwQtNXFrP0fEskvi6d5TinuNSLriPMso0Sm2eC
	DnrsDAS2+pZcNp7MBE+Ulub2qR1e99dYXCjdjSX4u923eOZ+2OCrPTQGjQFZ7WK+Bkg==
X-Gm-Gg: AfdE7cm3EashDc2r1DGMIHODM7kn9mvMgx1BVE77tbefLazXMGKWKa8zUOGONYrZCqc
	RlOGBhcTEL4XjP+b5kEccPqUYuttw+jyAKLk2l+wmcI0z6sT9Eb9WJ7uzDucQhgrdXe2s6x1mtF
	4WnMNGTmgFXc/tI4GrQBMzibaGKukdx0PdhUd5oUms7m+pp037T5CVQlaBfK0Tpa5v2GpE8rXmd
	lfezuXIZxQm7cLvy8vSd1nDNpBUDRg4/ASMDUySzbHaJuWF81+DgQEoDeE9JB6vxHS2fkfKv4M/
	DuqONQEIBUudPzuWLdlyMe6T/Fa5l7xdGrTeLW/cFdDoxyGH79ii+/GVffDL1tAFtM9JJ+uXY5k
	vPjekBZ+BfjlpXZDvjysodlQs0WdBp9s9uKhZASyLumPCmA==
X-Received: by 2002:a17:90b:584e:b0:387:d9cc:7dc2 with SMTP id 98e67ed59e1d1-38b75deba5fmr3144350a91.20.1783600579608;
        Thu, 09 Jul 2026 05:36:19 -0700 (PDT)
X-Received: by 2002:a17:90b:584e:b0:387:d9cc:7dc2 with SMTP id 98e67ed59e1d1-38b75deba5fmr3144306a91.20.1783600579081;
        Thu, 09 Jul 2026 05:36:19 -0700 (PDT)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3117483941csm31456029eec.7.2026.07.09.05.36.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 05:36:18 -0700 (PDT)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Thu, 09 Jul 2026 18:05:47 +0530
Subject: [RFC PATCH 01/11] dt-bindings: media: qcom,sm8550-iris: Add vpu
 sub nodes
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-vpu_iommu_iova_handling-v1-1-72bb62cb2dfd@oss.qualcomm.com>
References: <20260709-vpu_iommu_iova_handling-v1-0-72bb62cb2dfd@oss.qualcomm.com>
In-Reply-To: <20260709-vpu_iommu_iova_handling-v1-0-72bb62cb2dfd@oss.qualcomm.com>
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783600568; l=4197;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=FZhQkSnMM9dPRPxJpT7lhmUWUWrvHN2Yh6Z3YZfE28o=;
 b=4BmCNtKT8f49d4eMVC+mn7H7tvLVXZyANyc+VdD7aWOA75ngBiXNUSDb2vnPWOMSpEi+HyuBM
 lmVTcccir5LDaSMqYrSoxqAMMxo/AfGdv9whGYUXYEz7u3eBjk6CfDZ
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDEyMiBTYWx0ZWRfX1ql/cfvf3cyH
 Cd0Tz7L1TgPbcVuUdOyVOUiY2MhtNqYlyY8dUsKlSRSMRWf8o+ZBx4fPDfL+ahxg0ViHqdRa9X8
 4t7lZiiyXpTaVMCCrqf5F8aOiE9DpIQ=
X-Proofpoint-GUID: 1EESuZ4bnvM4M4fLv9NHzFgOy65u9etY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDEyMiBTYWx0ZWRfXwpPLV1pQmLB+
 71ZLo5W6VMtH0tmn7Ht/i/mFSmnba8huhVjY/L27Dl/GG2od9JZJthbziuy/mRu4C/hYNrxGmFH
 DemIeSSw9P5P9BlIdNXdJKOrNBOXK/vEf7nzVfjVcK944YIvtz6vRSJFO3/EYEb0NUFTIC+HYav
 CYG1ISUxtKu2YrlvlH4b3Dhn+UZ9d7pDoJPLafhV/+b+kbzfH/4T0XAzd1emwOwok1l5yTddUaT
 kZr0nOoxe+pdOTuLmXSALr2DB1gRehoXkwYECcsBbk8f5USj8Rvj8RiJePv4AOGzlII6npTWOdY
 H7dhmB2dTkuOZ4w5BO1dashWtgGxjN5i3QtCnvwgvnXy1Yk6YPBH990lR2Mp6kC+7EvXFl4/5MT
 aQ2RdHmziG0DKsB25XVeYCl0iYnLJiAoxE3giG+EZl7y81NkT8indK8RelBvV5e8I388mgdQ6g4
 iUJ9bj6lfO2kG0twniw==
X-Authority-Analysis: v=2.4 cv=Sv2gLvO0 c=1 sm=1 tr=0 ts=6a4f95c4 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8 a=WNFrAvLKAt7umNMUY5kA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: 1EESuZ4bnvM4M4fLv9NHzFgOy65u9etY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_02,2026-07-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090122
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-67141-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:dikshita.agarwal@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:vikash.garodia@oss.qualcomm.com,m:busanna.reddy@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[vikash.garodia@oss.qualcomm.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,gitlab.freedesktop.org:url];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vikash.garodia@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E2E6973122F

VPU hardwares have a limitation where VPU streams are associated with
dedicated addressable address range, as illustrated below

    +-----------------------------------------------------------+
    | Stream A reserved region (600 MB)                         |
    | 0x00000000 - 0x25800000                                   |
    +-----------------------------------------------------------+
    | Stream B reserved region (3.5 GB)                         |
    | 0x00000000 - 0xe0000000                                   |
    +-----------------------------------------------------------+
    | Other reserved regions                                    |
    +-----------------------------------------------------------+

Mapping a stream outside its expected range can cause unintended
behavior, including device crashes, as reported at:
https://gitlab.freedesktop.org/drm/msm/-/work_items/100

To address this limitation, the subset of stream/s are now represented as
sub nodes, so that they can be associated to the respective addressable
range.
The limitation could be exposed when running usecase like concurrent
video sessions. The binding have been validated with higher concurrent
sessions across the SOCs supported under this schema.

Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
---
 .../bindings/media/qcom,sm8550-iris.yaml           | 66 +++++++++++++++++++++-
 1 file changed, 63 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
index 0400ca1bff05dcef6b742c3fbf77e38adca9f280..bf4d24ce90bd38666704274390b98be450f708c0 100644
--- a/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
@@ -91,6 +91,51 @@ properties:
   opp-table:
     type: object
 
+  '#address-cells':
+    const: 2
+
+  '#size-cells':
+    const: 2
+
+  non-pixel:
+    type: object
+    description:
+      Non pixel context bank is needed when video hardware have distinct iommus for non pixel
+      buffers. Non pixel buffers are compressed and internal buffers.
+    properties:
+      iommus:
+        maxItems: 1
+      memory-region:
+        maxItems: 1
+    required:
+      - iommus
+      - memory-region
+    additionalProperties: false
+
+  pixel:
+    type: object
+    description:
+      Pixel context bank is needed when video hardware have distinct iommus for pixel buffers.
+      Pixel buffers are uncompressed buffers.
+    properties:
+      iommus:
+        maxItems: 1
+    required:
+      - iommus
+    additionalProperties: false
+
+  firmware:
+    type: object
+    description:
+      Firmware context bank represents the firmware processing domain of the VPU. Required to boot
+      VPU when no hypervisor is present.
+    properties:
+      iommus:
+        maxItems: 1
+    required:
+      - iommus
+    additionalProperties: false
+
 required:
   - compatible
   - power-domain-names
@@ -98,9 +143,15 @@ required:
   - interconnect-names
   - resets
   - reset-names
-  - iommus
   - dma-coherent
 
+oneOf:
+  - required:
+      - iommus
+  - required:
+      - non-pixel
+      - pixel
+
 allOf:
   - if:
       properties:
@@ -177,12 +228,21 @@ examples:
         resets = <&gcc GCC_VIDEO_AXI0_CLK_ARES>;
         reset-names = "bus";
 
-        iommus = <&apps_smmu 0x1940 0x0000>,
-                 <&apps_smmu 0x1947 0x0000>;
         dma-coherent;
 
         operating-points-v2 = <&iris_opp_table>;
 
+        #address-cells = <2>;
+        #size-cells = <2>;
+        iris_non_pixel: non-pixel {
+            iommus = <&apps_smmu 0x1940 0x0000>;
+            memory-region = <&iris_resv>;
+        };
+
+        iris_pixel: pixel {
+            iommus = <&apps_smmu 0x1947 0x0000>;
+        };
+
         iris_opp_table: opp-table {
             compatible = "operating-points-v2";
 

-- 
2.34.1


