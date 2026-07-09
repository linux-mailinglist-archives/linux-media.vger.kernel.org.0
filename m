Return-Path: <linux-media+bounces-67143-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id eCxqJByYT2rzkQIAu9opvQ
	(envelope-from <linux-media+bounces-67143-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 09 Jul 2026 14:46:20 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 99F62731298
	for <lists+linux-media@lfdr.de>; Thu, 09 Jul 2026 14:46:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=UO+G1N46;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=NmrpZZal;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67143-lists+linux-media=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-media+bounces-67143-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id F3E28308431D
	for <lists+linux-media@lfdr.de>; Thu,  9 Jul 2026 12:37:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D776A427A06;
	Thu,  9 Jul 2026 12:36:33 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F99042378A
	for <linux-media@vger.kernel.org>; Thu,  9 Jul 2026 12:36:31 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783600593; cv=none; b=VfcB6g3/5eKRjf33RIjUjHAcL2GOjkJ3ER9DD2pDGpioMhZ8CAQYEGaB09iWct+ee8RgsPFrsnDhN/qOe2kF55G2QR2zo5Ic38OfisHf0UR9RcSqbHV5qbrDpFlv6KSfW9NAdlAZvwoUIeAQjWNFNlAbmpUnPtWnxkfnme2AbrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783600593; c=relaxed/simple;
	bh=Tm7A6NvnCCqBibOVq/RXY9HEaznEwFuEPzjPy0tdtvw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BYVIE4Q1RVJ0XaGB6SJhi1Y2F4yKYHjTQX3DQMylAVABclOsDlMtLhd3KdvCyPX95wKZWAkXaPJtmBPBkCSstkt74TPi34+NBpwvYIkf7x8f1ORku/FYsE0ZA2pM8c8gvbe1EUK97q6Wdipi5sIbGhvAqsumvnn6E6Y1vvHVARY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UO+G1N46; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NmrpZZal; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669BN5u01450398
	for <linux-media@vger.kernel.org>; Thu, 9 Jul 2026 12:36:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WSpjqSjM+b7BmSqEDHpKl292ZZ+i9qmZXnDU3Sgz5hQ=; b=UO+G1N46Vh5g1McS
	zaYY40ZYsMm+QoCuULJ96RVSXXnbNYPqaxfVybrkIMQEfpsIwhw3K5iYpB+WXvR0
	grS2JdQOIWOGhDAhh4JcAPQL3bBLVD0eLlHFdzDSAcOWJLFtnuko4nAJwug5KEse
	auyDS0it5hBm5D0lzgbCi33a5aMjRoQWHonhqw5x4erFpWwo+pk3PYQ55Ud5YaJ0
	ufSUyTarD8XsDdcb0mP00HwqC4R7lAi/EEyPbX4Lp7b0OLziyU3arPOwLA34+lwu
	soS3/A0gyF33YCQbk6htXXE6FRLRpyHvrg7LjzAxckKT8qQHzmYWQBhce3R7c4iJ
	iE5oTw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fa55vhxdk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 09 Jul 2026 12:36:30 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c88e0f04e51so1700843a12.0
        for <linux-media@vger.kernel.org>; Thu, 09 Jul 2026 05:36:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783600590; x=1784205390; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WSpjqSjM+b7BmSqEDHpKl292ZZ+i9qmZXnDU3Sgz5hQ=;
        b=NmrpZZalOLZc97H+hPYn/qRYX9wd1N1COJ7R7m1gElCF7AC6eeEh5qdrN1Dj79xEkC
         zRnBZQoqPV196TLeHEv8cvvVHko1DElSDROM/d08UhatxkXbYXzI5grCP6O5IE+J8B14
         QY+WBl3CKrHBd2C/d0cvghu+LhXrVZfe9iaPzynl8Kebg8/YbYx68tbFJ6QapBORJ3Iz
         RHS4FORMsSCjbAJBVkLmqwwoCP3f+Q4L5zv4tt9k4G4yFJaxFarmZErBn9cL7Vt83wDc
         HFdyAMDwN8pcDLuM+aVcqW4q0f0vqV+RhMZrfHe+WSH3keUTKaLaD+Ajm1BZAvWmG2vR
         hh+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783600590; x=1784205390;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WSpjqSjM+b7BmSqEDHpKl292ZZ+i9qmZXnDU3Sgz5hQ=;
        b=iJvnVAg1GhrsXa0aCYQaJ2ub2048atRo+C+3wd2F6pB2k6R1Lz0OT99tgBRLCWYyxZ
         bgerI56cutwfyAoWRrPtqcnnbRgyvHrBhXA/Ds3bF6QcBkoKEzFchR/XHULl91gKDj6Q
         gSttdCXZq6j38kpGDMvgD5Gk2iiiOr3jNMw1WaKM50iuMqtGC3cr+JhYWjapG9nGLuoI
         BXTci/DI+hbAz4mHz6zGZsjxQDpTCoTcpIqzCeWP2IKZc9Y6Aa/0XhfYPvrXAmp9Evx1
         g9X6JVq8P/exBHQTUYS42BK/Sj0ipAg8PpYdYwNlfY7AMjOf01g4shxGgDLgznfRyf5R
         a4WA==
X-Gm-Message-State: AOJu0YxUoXUg7iWUjeE0L+aB0zxXJ8kTH6EQKKRFRhOPLHMdjvLoiruP
	HJz+nyvNuXnkKytw5/NZnFsxgzYc8+RBCo1DQwBg9+PAFJJTcg2743HIxMmUigyIU8lCUuY4fXp
	w4IzdXLJeK4yZvGu1WkXUIB/Ro8rTLDRQS0bxCizjjA/4VGXBDlb+okcTl0gklEkp0Q==
X-Gm-Gg: AfdE7ckYbY6O0KaDf/MBq+eZlnhUIPoB48sWQDQ/JWLBlzcqi3EngKBlhaUi/X3qLvt
	3NalKNW4sSzdZt2eiLeg1ebY8uoqIehl2ei+7FwpIww1reOeKjaheMvEJ6dm9ZSW/eXjDYnDRXf
	4K24sGPMN3Y3o979lgKFig2tzCfCmidNE8H27yDBvrZuwUBkPz5pSxtd3cTZXW7UWjTikoxkAaN
	M8PXb90Vxw4l57AlBnXVS3jYTDmHqQIRqL4QPLB+LGRkJ+3j5wwaVJTwUotEhoPVsfgFts0UDge
	1ylWzf3TKb2rKWD00v0WpZn4QbWHL1ZNa2pgS/pZ8QKyRSutudDB0Oj5mkUP5ZxLFUfCoKzrRaQ
	BQfpo6wXAT+VOF7M6T7JdKuViH2D75U6odKwfvi5fhr3UaA==
X-Received: by 2002:a05:6a21:329e:b0:3bf:6c07:b2f7 with SMTP id adf61e73a8af0-3c0bd223269mr8640671637.58.1783600589966;
        Thu, 09 Jul 2026 05:36:29 -0700 (PDT)
X-Received: by 2002:a05:6a21:329e:b0:3bf:6c07:b2f7 with SMTP id adf61e73a8af0-3c0bd223269mr8640638637.58.1783600589500;
        Thu, 09 Jul 2026 05:36:29 -0700 (PDT)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3117483941csm31456029eec.7.2026.07.09.05.36.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 05:36:28 -0700 (PDT)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Thu, 09 Jul 2026 18:05:49 +0530
Subject: [RFC PATCH 03/11] media: iris: Add helper to create a context bank
 device
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-vpu_iommu_iova_handling-v1-3-72bb62cb2dfd@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783600568; l=2477;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=Tm7A6NvnCCqBibOVq/RXY9HEaznEwFuEPzjPy0tdtvw=;
 b=LYawI7Ra/lbR2eBFf6G7jHbubydW5b21BgH0BpO/q1y1V6Dld3LYNkV06a6ueb9CWGEYOHMhm
 l0IoiCfERJrBY0kS05Fphunx9jFWEEYLsil2E/4y3RjKO9+dnENhG/O
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDEyMiBTYWx0ZWRfX/Emdn6idXh6H
 E1lzTmiU6UsV9qn4R2cGmiz0LXkNKNA4ZCP3DwWw0WOnpfmdxrI0BrgRcU95W7iv5vrtIPlNTp1
 uobuqNVpjr/JvTz8kSDal4AaUa26xKKbG8FBuG1yin2qWG9Ts7O9i9sMirZbEMqmm90ewM/iaKj
 pk9rQzK4jZGlWmXxrdGCRr64u1CKImgnCGo4AA5gnD71UlOLAvxCxBWWcPHHsvEpjRJUfB8BaSw
 h84DK/MrDk0HOtCatPqL4R/hi1/j5b+BT0BCtS3cG95NEqnvKby/yNlOTOebHs2nwRbsg+iRja/
 yiG8V6iOh2doC2yBivZDdhyoIUSmdrXNrzITwr0irTte2hlkd//0X3zkz+rSGznNLLO8z68nNFj
 oiu1p7PdJviZQJsPU+z0c37Urp7XejuUl8gAZ2P1eL9Js9nM56gk2PSPHFjRCKuwb7ojWK+WjBB
 wJ2zkelbgXcKxNKSKRQ==
X-Authority-Analysis: v=2.4 cv=KfDidwYD c=1 sm=1 tr=0 ts=6a4f95ce cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=OuQ8cFzMgRPpZ_G5cMkA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDEyMiBTYWx0ZWRfXzQvrM+bLxxLu
 8MxtlutQFSKE9baiDG4JuRo+GsfT6VDWCXWI8X1Zr8rxC8g0X3UIj7mlsKle7isdCRErJ3S0hK3
 h494IoAxPvTgDUa0/E0djXG5EBy5iYc=
X-Proofpoint-ORIG-GUID: PNSwlpYOClyc0L2AyG3PA62y8eZQNIz0
X-Proofpoint-GUID: PNSwlpYOClyc0L2AyG3PA62y8eZQNIz0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_02,2026-07-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 adultscore=0 clxscore=1015 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090122
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-67143-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:dikshita.agarwal@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:vikash.garodia@oss.qualcomm.com,m:busanna.reddy@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[vikash.garodia@oss.qualcomm.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[plat_dev_info.name:url,vger.kernel.org:from_smtp,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vikash.garodia@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 99F62731298

The subnode in the device tree is registered as a separate device so
that it gets its own IOMMU context. Pixel/non-pixel buffers are mapped
into these iommu domain, to ensure they are within the addressable range.

Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_resources.c | 23 +++++++++++++++++++++++
 drivers/media/platform/qcom/iris/iris_resources.h |  1 +
 2 files changed, 24 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_resources.c b/drivers/media/platform/qcom/iris/iris_resources.c
index 773f6548370a257b8ae7332242544266cbbd61a9..f550d194edf58abf0687a4f5df6d06b2af35147d 100644
--- a/drivers/media/platform/qcom/iris/iris_resources.c
+++ b/drivers/media/platform/qcom/iris/iris_resources.c
@@ -141,3 +141,26 @@ int iris_disable_unprepare_clock(struct iris_core *core, enum platform_clk_type
 
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
+	plat_dev_info.parent = core->dev;
+
+	pdev = platform_device_register_full(&plat_dev_info);
+	of_node_put(child_of_node);
+	if (IS_ERR(pdev))
+		return ERR_CAST(pdev);
+
+	return &pdev->dev;
+}
diff --git a/drivers/media/platform/qcom/iris/iris_resources.h b/drivers/media/platform/qcom/iris/iris_resources.h
index 6bfbd2dc6db095ec05e53c894e048285f82446c6..ca53c01f60aef2040002f526b8f1b6a9094d1518 100644
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


