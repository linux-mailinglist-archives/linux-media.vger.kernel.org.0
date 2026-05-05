Return-Path: <linux-media+bounces-60344-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YAUFCZ2X+WmB+AIAu9opvQ
	(envelope-from <linux-media+bounces-60344-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 05 May 2026 09:09:17 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id DA8384C78AE
	for <lists+linux-media@lfdr.de>; Tue, 05 May 2026 09:09:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2E573305433C
	for <lists+linux-media@lfdr.de>; Tue,  5 May 2026 07:02:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBF803DEAD5;
	Tue,  5 May 2026 07:01:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UGaMBaT2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Yy/b8744"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC01F3D4122
	for <linux-media@vger.kernel.org>; Tue,  5 May 2026 07:01:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777964466; cv=none; b=SogVJMhCQZInAkWU7md4ZY5dp4RO4KmPutKR4MfthAFeq5Pm2Arr279WXMT0yxk8CzuOkyL+NKQpU52Y98FcbjTt/XU1hCNSOXmo44x9hG8W1JnOLNTU2cRwpi8yJumWe6RMfseMcH/XRm4MDpp7GY2cdTZ6xd9aaVSKl3Qay2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777964466; c=relaxed/simple;
	bh=lQ3z4JfxRQCYgSubX6j1hfl+h6PxkcR07VzhxVTyjGc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LAAexee/pO5QQy8YVwXwfRXqBXLUnkB+YMEsfp3OZfqhRaNNuE/Mt/G5wHvJ2lKa/o53Qcm0x0AvVw60sD/NeV3/KXC+QMBxI9Ik3rvoDIS8Q9/u6nulkaUXFCKepBdhAr6NMVwT5hyRzenAPg6/xxDaik+8A+exE7m9ByndjWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UGaMBaT2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Yy/b8744; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 644KmAxP366515
	for <linux-media@vger.kernel.org>; Tue, 5 May 2026 07:01:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kIHJ7/jlM1Et6nXCMTws30svegX3oTdpHgtcyGwoCNo=; b=UGaMBaT2lL8loyJA
	pPx+8SZOnlTskN0iINLrj23dpF4ZJqr3QmYUuKI2v5bt6zH6jCUMHD3DViYiAFID
	5SZvQAa1rzvXRksYp+Z9tS1w/fq91soWCNUVjVZrC+uVsVGWBao6oRY7YPLF/IUM
	PDaHHz7UQtawsXDq1KS1nCNEqeWMM116OObzcK7aMtf6vpXEC4qMznfFQvjthjw2
	4PlaTf95kO/sr6xBqa0tT9FeSgwaZPaYxy1eruBMgY+SsISceYNnaJ/iFxW51RsD
	cdUAKjngmbe9Njen5tXKlnsF/eLPgL8DztwbHBqeIBNgJk/1G8oWhVblPPJ1K/Xd
	eYKg0Q==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dxvn6u6tp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 05 May 2026 07:01:03 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-35fbaada2f3so9333880a91.0
        for <linux-media@vger.kernel.org>; Tue, 05 May 2026 00:01:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777964463; x=1778569263; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kIHJ7/jlM1Et6nXCMTws30svegX3oTdpHgtcyGwoCNo=;
        b=Yy/b8744Pnz6QxTsic+7k0b/8Z7nHeX9zp/5CEYKl8KxSoq9QYLz3nZb3515qjexDf
         cMLOZA5DNmUpF+C5JXErdoDPOzkpm5MqLbLCnmYVfrNdP4WxLPctoO3DT8lyA8XgZoeK
         ZY9vLk6lUKYZ7qIoaQfvshOtOVmo8dNq9yY1wEsuP42od8FYa28R9SrmueR558AfOSaH
         2BkfuHwd7GSrEZlHL5GzJWKmn+rqd/2tZAmPf2dQsJB90aGl/aDF3qmxUB+k/8RkxDyI
         jsAlyq3b7F/PEZ3unGsLVRO1zufp54jZ6bHZP8C/CHib4bUjB25mGex5IrpR8Uop1jVb
         XICw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777964463; x=1778569263;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kIHJ7/jlM1Et6nXCMTws30svegX3oTdpHgtcyGwoCNo=;
        b=nBVKweziqyT6w22Rq0LDgJ0NHyuLxFuBuW/mz1Gb/MQQcjSfIPAzdus7tLJmZbB5ei
         ewathQneb7K25P81ILWi6GTq1xAc2xzLf7n5aZ+EWeVjSIXPYIhFzZwk4QMavmtChr7i
         ES9fX5LQ9kB651LKm3f3uQBEqxn3MzRIRTOkza75bgjyjVAcJiVEmJ0RJr7UFcF1w9Zd
         /iG3Crq9lo/nDrZUDt1801xmHVpgpH362enIrxGEV+lSY7XnAH3kvhx1oFWCw9gPopuz
         ehMVMLgvEbnZmTK1zyH4E1gAjRKHwh+Wqz2//g8uSbVRDLiji4imMeUDd0N2hTXpBMQw
         w3rA==
X-Gm-Message-State: AOJu0Yz8+CZDzqt1GdsNAZZNgvRSvqZpUqcJGIZV+84xgO5iujLiZLyl
	tmRya4kaJeZVFoAf1dsyhvI5ERP/9cb3nUsUJvJR8x5IQhslHZWs86ipXvjEACxbKyngo7Yip56
	v09oGXeghNI6ECnj33f4TlKOb/QuXXrzW4XzmYx5ANYcY09qt0FPFFA3e99e+s6eAQA==
X-Gm-Gg: AeBDiev8Uxu0AzCwvlHhXcf5rWOG7u2BTAGpIp+gsBC48sf6+Iinaamh24H0wDlX9E9
	d1e/u4OksLPfJOKV9Ztzwg3XV4YFXdCEpV/B7xjUnl1G7mKxvP+XC5JV24dDUij+ZxhYp01ibcr
	+Xc9BonmMNolyajbwyOdgQ4vE+O92uenWmjmsP0nxKzo5C8p859Cv0+sqK6XzBWkLooQi9zGsfF
	aHPZtzcPNCORzS5qG/NW96FMhn9egLzCN1+M1PA+jPX9Ui7LC9UA9A/PAj3vsLp+HL81zJmqhTJ
	MTP4wyJXxbRBraB/Y7+DCSSvgMES/OjaAuAZLjwyfXCII+Xry7w0ycwTwNQo4RJHyMaXGPoBEW1
	FkILFeOQp2nSajdndqARJlj0cxnu/Glxal4BBYuLCSr+lfJRQGldAd6Yfs85cZ6Ncmw==
X-Received: by 2002:a17:90b:35cc:b0:35f:b6d3:da7d with SMTP id 98e67ed59e1d1-36577485fabmr2034542a91.17.1777964462160;
        Tue, 05 May 2026 00:01:02 -0700 (PDT)
X-Received: by 2002:a17:90b:35cc:b0:35f:b6d3:da7d with SMTP id 98e67ed59e1d1-36577485fabmr2034510a91.17.1777964461663;
        Tue, 05 May 2026 00:01:01 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-364ebec73aasm13840146a91.2.2026.05.05.00.00.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 00:01:01 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Tue, 05 May 2026 12:29:26 +0530
Subject: [PATCH v4 05/13] iommu: Add iris-vpu-bus to iommu_buses
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260505-glymur-v4-5-17571dbd1caa@oss.qualcomm.com>
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
        iommu@lists.linux.dev, Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777964421; l=1065;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=MN1sEQpm2XgufXMnfyVogm/WAu43GbiaX89w8VaFbuU=;
 b=yU4wGk5gMcNMl/YgYaMOseMuBSUH5Ol/F51wnfm/FMqe+aaL+AG8wYAK8NCO34c4/5rM4xA8j
 frn4+vcXcSNBHatelFfO3ExHrA/OmP6y3dlyfsQmh+rCumYZTZflQuL
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-ORIG-GUID: qX3flYPVX94_COiSdqvmz7xbdiVIaZYW
X-Authority-Analysis: v=2.4 cv=Z+vc2nRA c=1 sm=1 tr=0 ts=69f995af cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=ADq-ahcSnVbbDow3-dgA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: qX3flYPVX94_COiSdqvmz7xbdiVIaZYW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA1MDA2MyBTYWx0ZWRfX36eAuvYy3caF
 h14uTaAAp7ilue+aywFdj0QLrJ+Gy3zrTFqYNaoPqbHUxSvjhemY24tvqILXqguUEpgWP13px1s
 GXbgQuWurcvgMTabrkCnX+057rQOHhcjXGVruteqbVPRAobG+4xYrsNerCEyY6nSkz9s2Rni8Kd
 0mNczXbvImoIkDvG21wmdhX/go3ac4G0gt8nejFMTb3EkvPsJCEhdnwq+sNxQLsTooMpm1P4eHx
 tAichyotQRpzvDngRk4IRQnU3JS97D8/hDCtrm1zgAeSAWzCYtGVaU+4oMnEDLQSJD57y+3qY3s
 CcoYIUIRi039hw4ZUAPAyxTqZHdkRNhzvB+OJSRhhkMRgsl9hqp7rNPKpEzfZERe7Sz+9Ohmnxm
 OZutQDXbWTl65o+cZMSMYQ19UIzdBbgpeVamKyK6A45KakrCwEu+7frOnuOer+5oC4J/0rD8fXW
 KmqW9jNlCtJ9xKInM4g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_02,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 impostorscore=0 malwarescore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605050063
X-Rspamd-Queue-Id: DA8384C78AE
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
	TAGGED_FROM(0.00)[bounces-60344-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,linux.dev,kernel.org,linaro.org,gmail.com,8bytes.org,arm.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
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

From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>

Add iris-vpu-bus to iommu_buses[] to register the bus notifier callbacks
for device add and removal events. This ensures that when a device is
registered on iris-vpu-bus, the notifier triggers dma_configure(),
which sets up the IOMMU context for that device.

Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 drivers/iommu/iommu.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index fccdbaf6dbd5..3b65df247e52 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -13,6 +13,7 @@
 #include <linux/bug.h>
 #include <linux/types.h>
 #include <linux/init.h>
+#include <linux/iris_vpu_bus.h>
 #include <linux/export.h>
 #include <linux/slab.h>
 #include <linux/errno.h>
@@ -179,6 +180,9 @@ static const struct bus_type * const iommu_buses[] = {
 #ifdef CONFIG_CDX_BUS
 	&cdx_bus_type,
 #endif
+#if IS_ENABLED(CONFIG_VIDEO_QCOM_IRIS)
+	&iris_vpu_bus_type,
+#endif
 };
 
 /*

-- 
2.34.1


