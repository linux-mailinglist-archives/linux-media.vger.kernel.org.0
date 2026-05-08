Return-Path: <linux-media+bounces-60943-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gIGcNEYz/mmHnwAAu9opvQ
	(envelope-from <linux-media+bounces-60943-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 08 May 2026 21:02:30 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E8C14FAD6E
	for <lists+linux-media@lfdr.de>; Fri, 08 May 2026 21:02:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 495A7307997E
	for <lists+linux-media@lfdr.de>; Fri,  8 May 2026 19:01:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F171D41325E;
	Fri,  8 May 2026 19:01:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iel1ax2r";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OAZhpWSI"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 455473D903C
	for <linux-media@vger.kernel.org>; Fri,  8 May 2026 19:01:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778266871; cv=none; b=fhEl9kJPDw8bTM2gvCsJ3mPNUuQ/+omFrGeyBQUGTjeqFwXsQ/vLJGkAghAbqypngGQOf0TsVdXzlNS+GZBQqTfA0NPpHLzsBaV+MgjSGjWKuYvRvQSz221/9nFUDzHgAYykng+3NiBObFWSY3zYFD9eoVLOxUIkTav8Fo+JJPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778266871; c=relaxed/simple;
	bh=ECsH5Gs45CqpRqX5C/jNn1QZ5iDd0NScn6UK3/KsjCA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=d0OAxqadXfe2tMLPxFhlePpSGLXI93dOGSE5Mg8YHMa3L+SrPz7GtvfIeWWXPZjF+cBtf7kYfUQ9SDzaz9FcydI7bXIoenirhMaIlQ9taqJGS4oGfpmWxjiOv96vrlqVXFCXm10IiS6a16UptmGJwpCB7LOl4zRwyPhiFOTKobc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iel1ax2r; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OAZhpWSI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 648GWNnM2335604
	for <linux-media@vger.kernel.org>; Fri, 8 May 2026 19:01:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fVj1LCoNAbiYzDIsSvQ2jgFnqlAo1QVaSmbijliR4Pw=; b=iel1ax2rWwLeO8uZ
	D6yJn+0z+XjVZA72k9D5bRPJhMSmXyjx8TszMpMcdCpmpefZ0FzZeaA6yZULSurC
	o1J0PfV1r7xBL5qNUabH7LmldPwb4rGDwOBOIFZ7mbYrE80r+OR8f4OioX2NyPnD
	eJ6dRM5lLpW9U8HeNOOe4UTKye7tcOoeqA4STQAtNluiEXMwnaE9Ja7VykIQlR/R
	j7qX5dpXrAZHdRYH82Js+uYqks4Us7YJasAvcZsNvkCkaC3YxdYSDQRIv5r8BKml
	UR5akM1jgReQtOFpbJD8vdr/jbKuIzpnpU9Ltmbgw40UngID18yUIBEbnpoArlBi
	iO4yog==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e1keh8gh6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 08 May 2026 19:01:09 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c8252a49ffcso2778635a12.1
        for <linux-media@vger.kernel.org>; Fri, 08 May 2026 12:01:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778266869; x=1778871669; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fVj1LCoNAbiYzDIsSvQ2jgFnqlAo1QVaSmbijliR4Pw=;
        b=OAZhpWSInhZKhJoUdF5LckMdDUK5aU0jSjXgq0xlSQDw5vK2qw54LjIGh9OHchfsSP
         mhRtauH+ReyStG1KK/4o4Zexflaj0meY63ZJG1mRSMulNzYwwawIJYBpN5xiHkJeWXS/
         LDCRU3DNWlDKufv77M74ZTC0pXyoM6UdNsdqm5+SgWSf/I+kPtSu1g4NmZTPjditkKaj
         VA/M63vp2LOFRLofjKPL4KovR9iXogo1n8+e8U3ZOH3U7FyVrFwYNMhJuUllnXp7wPSz
         bZrXLmS9cF7TnQT7Xyz3PjzmvrmLbeHAzHLOb4JKQyUFsS7u+xgYRyslSjUnP2snQZf4
         EE8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778266869; x=1778871669;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fVj1LCoNAbiYzDIsSvQ2jgFnqlAo1QVaSmbijliR4Pw=;
        b=oWUg6bySZdgNv0t0wvhNoB5sgwKCOD0OqBhV3vs10RJ2Ry9c4ftTYl0zhS0O9dvfi4
         ukywmLh0lZN7x4hGOfGOblEDZEvsxX2olKtYtWo6R6HzpDiQ5vjZNUiplT8F3PZVSUZ3
         /zvDIKaQ4h2oMxLRUD9lnSwz0aTv7lA3F+qcwWunTB17iyLxU3Cy4z14L7Ypy5dz7RQc
         NhI4SyhZ/p5QiWjIUi1W3g/OUfuNyVbVJD8KYKgAtLDoCx/NXYHUtGSU7RbssFg4DbIL
         TiaXzOGTtoMcnv2NXO3OtESNlg5rhCUIkT8l71hkKrHGWaKib4R1AA8fOtUtJUxh8nTm
         WYfA==
X-Forwarded-Encrypted: i=1; AFNElJ/0Y7K+VUZat71xLjrZ8ZIR0JjUb8vZILVOc7EAbWYIpPEj0KndmFP4WlhY/OYawTdPcThD6two9xqdZg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwiJxjkrkQBz3DeVWOLwbBPnWcoRUV4rk27oIgDxRyw5TMgdra3
	5o82PAa2+7/Z+LmsH/32xjMq4+j0mw/f7CUYkrb4ooi+tpf5zFFFPXfJiyetP0Lu7bNzn/QLAaI
	S7d0DxaaucfcnjYHQfBQ9BDkUUNBVLm3XetCBcZNCBWgo+2DED4V/rPqbkG+iscOts3N+lrGjWg
	==
X-Gm-Gg: Acq92OHVpWcye7CXNUYzuMWni0I0wXGgOanFmLpeKBiv9i8q9JquX1wPqGgqZCnzqsn
	r1jolkQbhbE2vQ8LVMUFDg3UgZrjSSTvPpoOUUuQrbWvlGzf6XlSU6cbUCpP7DJp/1YQY12n2ty
	5nsW/wLHk/0N9R3jPIj7djPzp1EfWZPHfnrbjeZ9B/iZ8D3uKBd+ydRcZPQrynqA2D18H/dzjq4
	SBqhwVlxOnCm8mpLWn+5mk/oeIVBUCetGszYHy8qqFeISxvzV/kXrxBQG0wajA3N3BTG+EGCFjJ
	6TGhSz8uojg4TTKvL211Eyqz+TNEP1Oz6+0QdsvFnfRWNXE7CKfAAr7neoJTr4ThYXtjWe0GID+
	c3DZTy/6uTZ13cVr1MsNO6ji5fMJduAG5NhP8qGXQBBizsVT8ccGmkYg=
X-Received: by 2002:a05:6a00:2386:b0:82f:390a:69c7 with SMTP id d2e1a72fcca58-83a5e347c04mr14043030b3a.33.1778266868615;
        Fri, 08 May 2026 12:01:08 -0700 (PDT)
X-Received: by 2002:a05:6a00:2386:b0:82f:390a:69c7 with SMTP id d2e1a72fcca58-83a5e347c04mr14042970b3a.33.1778266868032;
        Fri, 08 May 2026 12:01:08 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83965a3e3ecsm13395550b3a.19.2026.05.08.12.01.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 12:01:07 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Sat, 09 May 2026 00:29:51 +0530
Subject: [PATCH v5 02/14] iommu: Add iris-vpu-bus to iommu_buses
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260509-glymur-v5-2-7fbb340c5dbd@oss.qualcomm.com>
References: <20260509-glymur-v5-0-7fbb340c5dbd@oss.qualcomm.com>
In-Reply-To: <20260509-glymur-v5-0-7fbb340c5dbd@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Del Regno <angelogioacchino.delregno@collabora.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
        Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778266845; l=1118;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=WbVuGY0YNDSgJ/NUQMQmGYDqgQRedyuwh2xVr1Rt3qk=;
 b=g4ip/Dem418f0yjnajSGGs74S3S3o+EBtTgU2gWCC0Y8pQtMZowyDugB0vnAvvkDMUhHColtn
 EHdVoMJlf9gBkirrywja/++JGIhsXzm42t+xad8qNcttOjkBs2PFyVN
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Authority-Analysis: v=2.4 cv=CJIamxrD c=1 sm=1 tr=0 ts=69fe32f5 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=ZGoT60Gb6PEvP4nDRaMA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: 11ZCGc1MROGCW4ATDYnYdsp5cRTNaU1v
X-Proofpoint-ORIG-GUID: 11ZCGc1MROGCW4ATDYnYdsp5cRTNaU1v
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDE5MCBTYWx0ZWRfXwzcacgM5W1+0
 NDiRpTJgKbXkY4z64MOSv35buxXZx6Tc/RuXD15Q+gmZiNqW6nU362Cm/Oi1dv3s/r4tdZOv7ak
 u86jBJQ9ATYZe76iwvH0F9vKKK7WK+5DOJx3ScWXUH+yIzgTmTwnTnQSJ6D82NU+vwKUVnAKMuV
 tYp5GUqciOViwboGyPZo4h5TgYn8o+Gc6Ex/fJLjH6RteX5Kcko4A7X0RCPrhkAbSaG5TbjTqMI
 co3JJCH48x2g90SFqdvhkIGpwZmt3vWD0PUNWWGCWJaYzDkFGC+3pmQOZARzZ7fB59Kk/eoayaY
 lQPywuohAeVKcah5boTFxE3BBEvrom20g/6rqU/L16wDqbRQczmJkv6OgDgWi8cmUTH2MmXAcFI
 jiCCKsJiW8iDPEZuJcL4lHvlvqK512XIWFu3+EnDl9HCemO+52RMhdOlmE5RI6aaiWWczCSnWqv
 vC7WSR7NZKEhsdI65/g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 adultscore=0 spamscore=0 impostorscore=0
 phishscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605080190
X-Rspamd-Queue-Id: 4E8C14FAD6E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[25];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60943-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[busanna.reddy@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>

Add iris-vpu-bus to iommu_buses[] to register the bus notifier callbacks
for device add and removal events. This ensures that when a device is
registered on iris-vpu-bus, the notifier triggers dma_configure(),
which sets up the IOMMU context for that device.

Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 drivers/iommu/iommu.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index fccdbaf6dbd5..903a8bd118be 100644
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
+#ifdef CONFIG_QCOM_IRIS_VPU_BUS
+	&iris_vpu_bus_type,
+#endif
 };
 
 /*

-- 
2.34.1


