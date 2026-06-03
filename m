Return-Path: <linux-media+bounces-63606-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id bOIRGRA6IGp5ywAAu9opvQ
	(envelope-from <linux-media+bounces-63606-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 16:28:32 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id CCB6763892B
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 16:28:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=lkK6l5Zd;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=IaSKz28H;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63606-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-63606-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9B8CA309B1C8
	for <lists+linux-media@lfdr.de>; Wed,  3 Jun 2026 14:20:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 582E339769F;
	Wed,  3 Jun 2026 14:20:27 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97910393DFB
	for <linux-media@vger.kernel.org>; Wed,  3 Jun 2026 14:20:25 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780496426; cv=none; b=SM70gsnnt6W4Vu0T0zbbmriJg3dLnBBle+wxOeHcrdmWKcOu8Qr3oht08WIgDHNjyVN+h6aCh4dYCMTwFfG524PhvmNPXWnI0IlbiezqXr8fesz7aYA7dbPrT4aszCE5a75BKJMBYjD01v1LchEGV38ZSDa32PDyqyKKwLTPg18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780496426; c=relaxed/simple;
	bh=0F6NYH2vBOPGXFbInvg3unabFPXg6JrkTEoOs8NbdW8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FGqLYmBKylDcKkzAnsS0IgnKy9r7rehw7/duOYp+IbdqPPtVCJNPyL58yi2p7agDAe8SMLqduvLwFWLO3iw/hiUwwpW0rNWCOLMr3Y3mzdwXI4uY08Z72vXG6kIqqT8NJ4msfui34J8AAvOG0LkDXiOEZd0cd1kcQ/wZ+eLc5QY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lkK6l5Zd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IaSKz28H; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 653CW96i3077979
	for <linux-media@vger.kernel.org>; Wed, 3 Jun 2026 14:20:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kMD0vi07CEccdmp8qLavRITVcgt4Oz8v3SLZupcLXoA=; b=lkK6l5ZdrcjKz7W3
	z5DJ1oBqp14j55ForPBtXses8rXUFPXz03cv3BbIXiTSRzJcsy8PFZli+3nqghaY
	nbyLdjxAnOR8GBnR8ESvosZQZb/gwdOva5hBoV6mZSwv0XlM7BV2XrmAY4blWY1F
	mJE+a5dN+oWZVHofW+mwxFKMTDM7cJNmyKso1nH9wL70quhD6SpNydbl15PR5kfN
	6mamsxIMCRGqSf7vXCgk0ObSh7afbp6X6VKEqI5Iuox4dHjkrNC0akc8IJFVMG9X
	WenqWl2JjtTW4UTAYym/N2Gn9NecZ7YfSCI5qeAsAMvINJUxAMzLGclQ7mYVRCOm
	5nKaHA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejabbtvdt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 03 Jun 2026 14:20:24 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2c0bf6904a6so66075185ad.1
        for <linux-media@vger.kernel.org>; Wed, 03 Jun 2026 07:20:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780496424; x=1781101224; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kMD0vi07CEccdmp8qLavRITVcgt4Oz8v3SLZupcLXoA=;
        b=IaSKz28H4+Y+YjApxp5UMWZ735Qu1Eo4KDHeFX/6FK0UCVRVWeMXEsHl9DiYIUCQg4
         4n3e0LDppONIxQ6F9KNLRKGBqNmy9pTUSTkXZtphq8H25zJDMmt2gU9XV/8JxN2U0s66
         OpTATj43QfXB2glzSef5B9KJXRaTvR+Md9MrOdwGx1ddOiuWyWPKke3um/ReFtaSmoRK
         ZKpaH7TH0G7SIsA/bwmV07Jbvv0zVXFEpp1B/L+CTBafN49whz6hQ0bwxZ7L46FNImx/
         SINgNFRUGbZl0Yxm+4ikBP/vzDjvTB/4x0MydnEIU4HI+gW6puXe6r0tGbofiax4yJXq
         Sbww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780496424; x=1781101224;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kMD0vi07CEccdmp8qLavRITVcgt4Oz8v3SLZupcLXoA=;
        b=cxRCq709zWQGqkuk5mYHf34RpQPiJjynCHnRhYfK+N5wLn8buUr1aAuYDl3UD9ZBlr
         ABkMFwT+/+ZPeCoAzQw83vY5BnuYJjuSpn4d8SoSsamWFZDwj4m0lij+KBoAqPAXHInu
         scs4t2MyjyCN9u7rbHIIGqz514W0efiUl1cSGDbpfx3xJzepyPc0clmQ/XhnzdlUu3Hk
         vwlUdMaA8veW2RxHXrizPV6+FrFwJA2NlPWBuCdPwlN1nEz/Byv+iJ+DW/OSRY9nH4G1
         p04vpU4whYBHJbabMLOczlmgse7EUAtiH1NvNk3nEbdYYqj3sVMHTYfS6OZvRL0qxF/P
         pWbw==
X-Forwarded-Encrypted: i=1; AFNElJ8P8on+DKT84UCbIRiQFUd+3Vyl8f2YH2e0uvBBGbmv//uaaIFy1N0XBsP1S3vLL6qgTFEGjneNgH9ucA==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywlh4VqaHvWUUnDNAoBEOiAcdfUu75k86NI1gSSPbb2Nsi3qM7b
	j4Hs179IrKu4xFOel9bDHMC6T4BmMV47gvHdL7Z2hLYeOoP9b/GXDITYKLz7N1KU3NH08fXzL74
	Xyd6O1FP8VF5+nf8rmS/3Nd/pdbXZ8KqsM1kZrvGkNYlIJCtLWFjKN+rEylfCvKtaaA==
X-Gm-Gg: Acq92OH/Uqx1Ag5JcrmS32XVd3Y/+4W8OcCfxmWHN7FQlJsnYVsST1IrOmn/+w4++KE
	p22hEyQLN7IHFBYRcZAkleI54TOR+oVgfo6B3u51+GYbW7WUy8kCBxRC6I6OS736kA5s9PEjNMQ
	S4MGvZwxpuOO5FGfC9kY1UEqNUCxhLuKCn7v+xzn/mO6CjzOSxyiqKcVi5tH8dbIJ/VKs5hkrwA
	LSjXeJtXYQyAct14cwAKMgWeQ0rUs1caOK+4nMpAyeoF8Uq8FPZB/Yn7nVUxgzDdlvmSbt281b2
	E5U62zKJ1yR+HxzRwqtwCqqy4tUfbxmMw/qwhz4j0dNE+PkomPVTZf3GwfTYcXk6jfkTTJ/tPMg
	CqtZeLyIGhCG1HjY1Wt2xNC6/gwTf7YeTdagQ29q7w3LpHepCWlZdkKDes+h+cHPp7w==
X-Received: by 2002:a17:902:f787:b0:2c0:bb2d:a314 with SMTP id d9443c01a7336-2c1640ab375mr42523335ad.28.1780496424084;
        Wed, 03 Jun 2026 07:20:24 -0700 (PDT)
X-Received: by 2002:a17:902:f787:b0:2c0:bb2d:a314 with SMTP id d9443c01a7336-2c1640ab375mr42522565ad.28.1780496423356;
        Wed, 03 Jun 2026 07:20:23 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f6d37esm41514955ad.9.2026.06.03.07.20.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 07:20:23 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Wed, 03 Jun 2026 19:48:39 +0530
Subject: [PATCH v7 01/12] media: iris: Add iris vpu bus support
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260603-glymur-v7-1-afaa55d11fe0@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780496410; l=5398;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=lgs97ZMLfMsrUuRVQ2JpjplW6O7nx8Egm5QQ2cPQxEY=;
 b=UhBVV+0OiyAWuPE/lzW4Rta3udej9PFLi+yMOhT5AFGAvH2GsPTojUKXK7U0r61ZUAhraimM3
 /dFowAfO0cCBNr4M3NWexEKON1jnYZvh+BAE48lyN2wP086fG9jLVZs
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAzMDEzNyBTYWx0ZWRfXwttrmQYHXxK4
 XILF+TP940gQ8y/6o3oXW8bUgP/xfjtrzxE8Mg6eWriC6eXN9esmkTDn0h8f7W7x85e/9VoxqER
 4rfK+QjdSnm2lNQPJdVWC+Fbzq3Mj8/2QnnQ59D/JAf2QrMhHBGTUvA3yrZcX0Xm4x1BIjSpsPV
 i+XI7/7SSKCCziEpzp9I+ptl12XkGVMMZeqfwpH8oRuBmYzZvDpXwpY3AzB82s5Q0OuCkTloMvi
 s2WPRI/gxdz77L/mxrC9APdrgDI3wPv5MUt8awQWP7ixjytxzw1QY9kdgo/gsXnX/v7Kr9QUDfK
 rltPxJ4QeBJjNQUhmpMQ8HYTxisrgxdVEjXVXpvqO/MumE8z9pUeMFmdCJMIrDJcdukWAVMbSgl
 ALQkSRRsI3A7fc2z7C90DVGDWeBC4P9xdFKUNS+VFsL1t4Qftcn0ZkjO2O/kZQAtW3Q4pAaIffg
 FFJV7QC2VRKSLJxC41w==
X-Authority-Analysis: v=2.4 cv=UqZT8ewB c=1 sm=1 tr=0 ts=6a203828 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=6cGehGV22KE80QuxIsQA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: OthzDql-ftnQHnKqrMbkdk1y--CxaQvZ
X-Proofpoint-GUID: OthzDql-ftnQHnKqrMbkdk1y--CxaQvZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-03_05,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 clxscore=1015 spamscore=0 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606030137
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-63606-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,linux.dev,kernel.org,8bytes.org,arm.com,gmail.com];
	FORGED_RECIPIENTS(0.00)[m:vikash.garodia@oss.qualcomm.com,m:dikshita.agarwal@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:joro@8bytes.org,m:will@kernel.org,m:robin.murphy@arm.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:stanimir.k.varbanov@gmail.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:iommu@lists.linux.dev,m:devicetree@vger.kernel.org,m:busanna.reddy@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,m:stanimirkvarbanov@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[busanna.reddy@oss.qualcomm.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
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
X-Rspamd-Queue-Id: CCB6763892B

From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>

On glymur platform, firmware loading needs a separate IOMMU mapping with
its own stream ID. This stream ID is defined in the device tree with the
associated firmware function ID in the iommu-map property. To create this
mapping, a separate child device is needed so the firmware memory can be
isolated in its own IOMMU context.

Introduce a new bus called iris-vpu-bus. This creates a dynamic device,
and its dma_configure() callback calls of_dma_configure_id() with the
function ID provided by the client to map the corresponding stream ID.
This sets up a dedicated IOMMU context for the child device.

Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 MAINTAINERS                                     |  1 +
 drivers/media/platform/qcom/iris/Kconfig        |  4 ++
 drivers/media/platform/qcom/iris/Makefile       |  1 +
 drivers/media/platform/qcom/iris/iris_vpu_bus.c | 61 +++++++++++++++++++++++++
 include/linux/iris_vpu_bus.h                    | 25 ++++++++++
 5 files changed, 92 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index c9f2780b2d31..508a1150ffad 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22230,6 +22230,7 @@ L:	linux-arm-msm@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/media/qcom,*-iris.yaml
 F:	drivers/media/platform/qcom/iris/
+F:	include/linux/iris_vpu_bus.h
 
 QUALCOMM NAND CONTROLLER DRIVER
 M:	Manivannan Sadhasivam <mani@kernel.org>
diff --git a/drivers/media/platform/qcom/iris/Kconfig b/drivers/media/platform/qcom/iris/Kconfig
index af78a1775937..76c9fcd253df 100644
--- a/drivers/media/platform/qcom/iris/Kconfig
+++ b/drivers/media/platform/qcom/iris/Kconfig
@@ -1,3 +1,6 @@
+config QCOM_IRIS_VPU_BUS
+        bool
+
 config VIDEO_QCOM_IRIS
         tristate "Qualcomm iris V4L2 decoder driver"
         depends on VIDEO_DEV
@@ -5,6 +8,7 @@ config VIDEO_QCOM_IRIS
         select V4L2_MEM2MEM_DEV
         select QCOM_MDT_LOADER
         select QCOM_SCM
+        select QCOM_IRIS_VPU_BUS
         select QCOM_UBWC_CONFIG
         select VIDEOBUF2_DMA_CONTIG
         help
diff --git a/drivers/media/platform/qcom/iris/Makefile b/drivers/media/platform/qcom/iris/Makefile
index 48e415cbc439..6deadd531c8e 100644
--- a/drivers/media/platform/qcom/iris/Makefile
+++ b/drivers/media/platform/qcom/iris/Makefile
@@ -30,3 +30,4 @@ qcom-iris-objs += iris_buffer.o \
              iris_vpu_common.o \
 
 obj-$(CONFIG_VIDEO_QCOM_IRIS) += qcom-iris.o
+obj-$(CONFIG_QCOM_IRIS_VPU_BUS) += iris_vpu_bus.o
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_bus.c b/drivers/media/platform/qcom/iris/iris_vpu_bus.c
new file mode 100644
index 000000000000..e3327b227332
--- /dev/null
+++ b/drivers/media/platform/qcom/iris/iris_vpu_bus.c
@@ -0,0 +1,61 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#include <linux/device.h>
+#include <linux/iris_vpu_bus.h>
+#include <linux/of_device.h>
+#include <linux/slab.h>
+
+static int iris_vpu_bus_dma_configure(struct device *dev)
+{
+	const u32 *iommu_fid = (const u32 *)dev_get_platdata(dev);
+
+	return of_dma_configure_id(dev, dev->parent->of_node, true, iommu_fid);
+}
+
+const struct bus_type iris_vpu_bus_type = {
+	.name = "iris-vpu-bus",
+	.dma_configure = iris_vpu_bus_dma_configure,
+};
+EXPORT_SYMBOL_GPL(iris_vpu_bus_type);
+
+static void iris_vpu_bus_release_device(struct device *dev)
+{
+	kfree(dev);
+}
+
+struct device *iris_vpu_bus_create_device(struct device *parent_device, const char *name,
+					  u64 dma_mask, const u32 *iommu_fid)
+{
+	struct device *dev;
+	int ret;
+
+	dev = kzalloc_obj(*dev);
+	if (!dev)
+		return ERR_PTR(-ENOMEM);
+
+	dev->release = iris_vpu_bus_release_device;
+	dev->bus = &iris_vpu_bus_type;
+	dev->parent = parent_device;
+	dev->coherent_dma_mask = dma_mask;
+	dev->dma_mask = &dev->coherent_dma_mask;
+	dev->platform_data = (void *)iommu_fid;
+	dev_set_name(dev, "%s", name);
+
+	ret = device_register(dev);
+	if (ret) {
+		put_device(dev);
+		return ERR_PTR(ret);
+	}
+
+	return dev;
+}
+EXPORT_SYMBOL_GPL(iris_vpu_bus_create_device);
+
+static int __init iris_vpu_bus_init(void)
+{
+	return bus_register(&iris_vpu_bus_type);
+}
+postcore_initcall(iris_vpu_bus_init);
diff --git a/include/linux/iris_vpu_bus.h b/include/linux/iris_vpu_bus.h
new file mode 100644
index 000000000000..62af9ee7e288
--- /dev/null
+++ b/include/linux/iris_vpu_bus.h
@@ -0,0 +1,25 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#ifndef _LINUX_IRIS_VPU_BUS_H
+#define _LINUX_IRIS_VPU_BUS_H
+
+#include <linux/device.h>
+
+#ifdef CONFIG_QCOM_IRIS_VPU_BUS
+extern const struct bus_type iris_vpu_bus_type;
+
+struct device *iris_vpu_bus_create_device(struct device *parent_device, const char *name,
+					  u64 dma_mask, const u32 *iommu_fid);
+#else
+static inline struct device *iris_vpu_bus_create_device(struct device *parent_device,
+							const char *name, u64 dma_mask,
+							const u32 *iommu_fid)
+{
+	return ERR_PTR(-ENODEV);
+}
+#endif
+
+#endif /* _LINUX_IRIS_VPU_BUS_H */

-- 
2.34.1


