Return-Path: <linux-media+bounces-67697-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id wjNRNwqZV2rVXgAAu9opvQ
	(envelope-from <linux-media+bounces-67697-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2026 16:28:26 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D537C75F630
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2026 16:28:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=IB7RsLkO;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Dvqzu680;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67697-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67697-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 557B430B8D8D
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2026 14:12:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E7143F4112;
	Wed, 15 Jul 2026 14:11:14 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 609B63CE0A0
	for <linux-media@vger.kernel.org>; Wed, 15 Jul 2026 14:11:12 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784124673; cv=none; b=tlC/fKfrOi5UmAEtJWmQykrgWlrkv3tO8zWNGq423LENXg5XbPI2u/OTophIFXkuAi0tBN6PPVzZhVuDjh5rNtEaV7/LLQzbFE4EZ1QycrJ0uokahjWZ4C2zyMsOflyJ/u2ClPijLnOJAtejU4huKfi320i0y0HAke6ANyC7oF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784124673; c=relaxed/simple;
	bh=j2F1BecakdsVQPJVT1OChM6/odBNNP5n+m7cYa+S3EM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OXjTbIygxwOfUlTpv8i1epiStRp6Z+2Uz1YB7Pnwf59cPh79ewBdixb3RaxdkVqenMnQlL6IF2c4NznImaDV99l4CpWwubWt2ttRIsr2RjRqFCLnwj7Q4yEGqEDWYjnh22yIR5RmXeLhDaUFyYgLFsJb46W98/36bwWQqQeNBMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IB7RsLkO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Dvqzu680; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66FE3Wpw4097295
	for <linux-media@vger.kernel.org>; Wed, 15 Jul 2026 14:11:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uUXkx4Ku/EFI2n6r1fYOWCM/WqhVpiu7V2violHeIes=; b=IB7RsLkOApXfakX7
	llDBN0EwmrSki+Wf35W0sQDebM+75eLCHnq9hXswlZOXiUce9QEkjzrqUDQnCQol
	whhnIPzpHSAqkzBexWsmYas6bhKwzGCaypI43EFvM0arv8PO15LfUj1MpEXfY1Kg
	Th39A6ogHDiwiKzJdUN9qcsFVkaLN5fZUJpkNYraP9iSx3Ut/ymNDlMpb7OU38x1
	Lw/ok9aJWUs+fUnccuCBdVUm+jW/bpLlwFXGNlVsxpuST2MDiAgAejSvkPp2sg4o
	KJ4tARVqf6XfmqHdXCWduBpY1J6phLJjc+B4Cju2e7bEwnbLfP0+JnpiuTJhcu2T
	nyfYZw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fe8558yhr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 15 Jul 2026 14:11:11 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cc73f47bdcso98032425ad.3
        for <linux-media@vger.kernel.org>; Wed, 15 Jul 2026 07:11:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784124671; x=1784729471; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uUXkx4Ku/EFI2n6r1fYOWCM/WqhVpiu7V2violHeIes=;
        b=Dvqzu680CrQNkgJzQArP4T/L8mJ+WXFoHe5zGaakOR5eb4k8vnNs5+fMMVYd4WyIEL
         AFvz4CHwYWU3QSwLfSz2KsiLfPIGV0FHkqfpFTOXsoVIsVeKIeoLo9dDYAmZHXy9s31l
         k29m+PNdhyGfpGdcDn6DPfVYbtPSr1nhCIlbV5EbXa1u9B0HCKKHU7N0/vg4hAlzk1DX
         ZPpoc1w3gaCuCVDvOtTmNmAZ9TtgFCA9htZEia+JVi9K7sITn89iNuvztqUz/mTvevoL
         aygopdF94ktbpVJUuyCcDSi6khxEhmc4qYbjyeD4SOmhBPDVtOvnzIr1Mjzy8GtbmD/g
         hltg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784124671; x=1784729471;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uUXkx4Ku/EFI2n6r1fYOWCM/WqhVpiu7V2violHeIes=;
        b=EKl2Lm57g0lklzf/HUp3+8pCKV+OykNFhBAYJanPEp3Cpzm15PVi6DM/ngZFFotnfx
         PhEVEHCrlhg8bIWIbifIExEx8dEg0aOtGWjItvlX7BkrKTz2tR5GaBHNfpXqG9r7qhRz
         /WLU9giZIjVrxZ95ddayxPbeaCva5VRm+I/87YaxRO3ceFs9RLOnNPim0tJRV0fehWE7
         N+R672t6EZ4W5rx6tkD04MkDvJivyDlvy84psB2RhKln4H/RfXVCJP5UpvhIufovFuFq
         VliRB1GBnFxH2PYlt0TsPj+/yGqd7oWYS9CuOt3xzwRR6e5zybSjaKLL1VO97h/BVWgX
         uBzQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr/IIHF+MQgD5ulHd1F6xpNz2FAWKzDEIiOzRoQlezoCZPYh9GxNeF63Iy4H68kLgjv+TwUFDbclscJSg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzSZ8kons/L/wujnpBIoDcaEmW2ynAJ/r7FnGxTqSfmJCkfj+m3
	03BRal6Vu9X7SJqMid37z0VzCAhZUDcIp25HTK2bVw88us8LK4W0qjvnAGGYMwBZ5REBcAe9B9y
	Ld4ibQO9gKcQBoWv70UyZt2FUZlmOiDrlljqlwZ8fofgLxCaplAIj0K7KvYT/6oireA==
X-Gm-Gg: AfdE7cnvrjLdt3CrP8vaWZW2RTNR8thn6ZbBxOnOmf8W5P2Zjmnlmj7UMX+ZsxOuDPF
	rmidNcm39DnfgpKRR/XOMjT/LyED2asEDI1QyJHmkd5/ZmUc63uvYrtqlpvMUxUuzjxPBnf0VmX
	d5b9jm+LLkwjD0d0iST5OMqQg8vAHXnryGaPMIDoMgFSHD+aI/txnBDxy7ccTOaYds7sc1BYcBZ
	gyI6S4kYQJtCSVtaxNmW9G/M1bBIQ22kahqXGY61K/My6MG0srDgD0M4Y4pyOYYW3w289n98GEb
	gc/dnYoy2Plk42wPs7gjIn8HyTwjkMvnilGM1gTY8AomCecHEvu+zjK8rzXlleBDQ7mhl6Y83My
	YGSOwKYxnxR23jLZrbMb4W7I6h+wfmckttT5X2mxjuTDt
X-Received: by 2002:a17:903:3585:b0:2c9:abe1:c352 with SMTP id d9443c01a7336-2cef1327a72mr72569085ad.13.1784124670921;
        Wed, 15 Jul 2026 07:11:10 -0700 (PDT)
X-Received: by 2002:a17:903:3585:b0:2c9:abe1:c352 with SMTP id d9443c01a7336-2cef1327a72mr72568685ad.13.1784124670343;
        Wed, 15 Jul 2026 07:11:10 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf1070b68dsm2913215ad.79.2026.07.15.07.11.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 07:11:10 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Wed, 15 Jul 2026 19:40:03 +0530
Subject: [PATCH v9 09/14] media: iris: Handle CPU_CS_SCIACMDARG3 register
 write via program bootup registers hook
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260715-glymur-v9-9-8cf2cbe12a07@oss.qualcomm.com>
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
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784124602; l=3528;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=j2F1BecakdsVQPJVT1OChM6/odBNNP5n+m7cYa+S3EM=;
 b=2qipjg45gfc/Q86MUudP2IYVC2Qlg3JxMTxLLbpVLRgnMcPjCSalBAsP470+oXsfKJSpB4oGA
 RffdrC+4IIACk3ajQumdtL9pzPGYvWKLGbtd+rxWPoyoXo/jzMRA7bZ
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-GUID: dYKGUYEf4Ps1IG44bsaZH0Pdhcse8qi9
X-Authority-Analysis: v=2.4 cv=KOlqylFo c=1 sm=1 tr=0 ts=6a5794ff cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=_-2Oxswyk2Zu2Y7AJ8cA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDE0MSBTYWx0ZWRfX5ziM/inZDNNn
 Kolg9yOH+cVzjuxKNrYQyBC2AFI7NQ7V8VbUCiAD4+H18SeoO3NS1Kxb8O9BFIAmJ0hqK7masgA
 rbI3v9G9pr/8Bh9ZvN4GDdIh4fDgiaQyiCd2ynhnzW/pQJJnkKI9MoqZzZaZWh6jVpaWOxq/0no
 gsH0auu5XuJrOd6l3Xt8v2D7pG/GHgsDpQr9GpBnsNezGbkLWdXhO8Qrymx/wOBYMOf3fALe5uI
 cB/8m/ggVEZhXIRPIV8M3L6Sm0HM+GbzRuZBKtAB4sq5zLmyAxf7srb6TMVxNXgIf2eAZT7q2wc
 0u6/B8lobq28DhXazGHI33WLSzrm6RZdxZ08OJQOJQXs2CkxP2Zo7JZptQJdlKlRkrsSepnwaXd
 toCnTaN1xNVtD6EzjumTFxP42c6nRk3gcQ5mM+mUlc5Cd7lwbm1ZCCyoePLKX0SElobsA747IOb
 vnYUAdDrw6KwU0hYxXQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDE0MSBTYWx0ZWRfX2ybzzAsXiOQz
 +MhvGGOFd8s/BJ+RfCC0yNwzBG2XM9s0iKzWLSUBeI52mNDqemeUD6IxSp48DrlSM9NYyfQBtlM
 M/vgEhHOhWIVPze0MVbYICoLgHLCp1s=
X-Proofpoint-ORIG-GUID: dYKGUYEf4Ps1IG44bsaZH0Pdhcse8qi9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_03,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 impostorscore=0 malwarescore=0 spamscore=0
 clxscore=1015 priorityscore=1501 adultscore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607150141
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-67697-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,linux.dev,kernel.org,8bytes.org,arm.com,gmail.com];
	FORGED_RECIPIENTS(0.00)[m:vikash.garodia@oss.qualcomm.com,m:dikshita.agarwal@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:mchehab@kernel.org,m:joro@8bytes.org,m:will@kernel.org,m:robin.murphy@arm.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:stanimir.k.varbanov@gmail.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:iommu@lists.linux.dev,m:devicetree@vger.kernel.org,m:busanna.reddy@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,m:stanimirkvarbanov@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[busanna.reddy@oss.qualcomm.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
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
X-Rspamd-Queue-Id: D537C75F630
X-Rspamd-Action: no action

On the Glymur platform, the firmware reads CPU_CS_SCIACMDARG3 during boot
to determine the VM count and increments it by 1. Writing the default 0x1
causes the firmware to treat the VM count as 2. To avoid that write 0x0 to
CPU_CS_SCIACMDARG3 as a Glymur platform specific.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_vpu3x.c                | 6 ++++++
 drivers/media/platform/qcom/iris/iris_vpu_common.c           | 4 ++--
 drivers/media/platform/qcom/iris/iris_vpu_register_defines.h | 1 +
 3 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_vpu3x.c b/drivers/media/platform/qcom/iris/iris_vpu3x.c
index 4894cba62677..7d5007abaded 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu3x.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu3x.c
@@ -333,6 +333,11 @@ static int iris_vpu36_set_hwmode(struct iris_core *core)
 	return ret;
 }
 
+static void iris_vpu36_program_bootup_registers(struct iris_core *core)
+{
+	writel(0x0, core->reg_base + CPU_CS_SCIACMDARG3);
+}
+
 const struct vpu_ops iris_vpu3_ops = {
 	.power_off_hw = iris_vpu3_power_off_hardware,
 	.power_on_hw = iris_vpu_power_on_hw,
@@ -366,6 +371,7 @@ const struct vpu_ops iris_vpu36_ops = {
 	.power_on_hw = iris_vpu36_power_on_hw,
 	.power_off_controller = iris_vpu35_vpu4x_power_off_controller,
 	.power_on_controller = iris_vpu35_vpu4x_power_on_controller,
+	.program_bootup_registers = iris_vpu36_program_bootup_registers,
 	.calc_freq = iris_vpu3x_vpu4x_calculate_frequency,
 	.set_hwmode = iris_vpu36_set_hwmode,
 };
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers/media/platform/qcom/iris/iris_vpu_common.c
index e690c566c875..72eb8f6240b7 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
@@ -26,7 +26,6 @@
 #define QTBL_ENABLE				BIT(0)
 
 #define QTBL_ADDR				(CPU_CS_BASE_OFFS + 0x54)
-#define CPU_CS_SCIACMDARG3			(CPU_CS_BASE_OFFS + 0x58)
 #define SFR_ADDR				(CPU_CS_BASE_OFFS + 0x5C)
 #define UC_REGION_ADDR				(CPU_CS_BASE_OFFS + 0x64)
 #define UC_REGION_SIZE				(CPU_CS_BASE_OFFS + 0x68)
@@ -67,6 +66,8 @@ static void iris_vpu_setup_ucregion_memory_map(struct iris_core *core)
 		writel(value, core->reg_base + SFR_ADDR);
 	}
 
+	writel(0x1, core->reg_base + CPU_CS_SCIACMDARG3);
+
 	if (vpu_ops->program_bootup_registers)
 		vpu_ops->program_bootup_registers(core);
 }
@@ -78,7 +79,6 @@ int iris_vpu_boot_firmware(struct iris_core *core)
 	iris_vpu_setup_ucregion_memory_map(core);
 
 	writel(ctrl_init, core->reg_base + CTRL_INIT);
-	writel(0x1, core->reg_base + CPU_CS_SCIACMDARG3);
 
 	while (!ctrl_status && count < max_tries) {
 		ctrl_status = readl(core->reg_base + CTRL_STATUS);
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_register_defines.h b/drivers/media/platform/qcom/iris/iris_vpu_register_defines.h
index c44c85eac3b5..3782454b7d06 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_register_defines.h
+++ b/drivers/media/platform/qcom/iris/iris_vpu_register_defines.h
@@ -29,6 +29,7 @@
 #define CPU_CS_A2HSOFTINTCLR			(CPU_CS_BASE_OFFS + 0x1C)
 #define CLEAR_XTENSA2HOST_INTR			BIT(0)
 
+#define CPU_CS_SCIACMDARG3			(CPU_CS_BASE_OFFS + 0x58)
 #define CPU_CS_H2XSOFTINTEN			(CPU_CS_BASE_OFFS + 0x148)
 #define HOST2XTENSA_INTR_ENABLE			BIT(0)
 

-- 
2.34.1


