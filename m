Return-Path: <linux-media+bounces-55685-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aJD3KHQPtGlvfwAAu9opvQ
	(envelope-from <linux-media+bounces-55685-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 14:21:56 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 83403283AEB
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 14:21:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id AFF783040A07
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 13:21:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 361D83976B9;
	Fri, 13 Mar 2026 13:20:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QXxciobJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="On44iUYd"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A797A3976A3
	for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 13:20:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773408035; cv=none; b=BSf2lcVnyFn5Ckzalkmu1PmXh2MTTP0QqK0MbPXiSRtjXY43t2mABDWytEKcb/BMxh+I/POKzGAR95e3hkKMYSsyzcaIkGOy8BZlVqdV5vY1Y/0+cA9avJ26LT16hp4z7GUDsWTteXsbOTWlNFtGte2e1wkfmyJBg8iPnNFLqek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773408035; c=relaxed/simple;
	bh=0lhwz2GDhjJccpcaQkd+oJUE1mfWYeMI5kJ2acMGxnc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rhmEBoq9I0jgrAlzXwpGo4PLqAazgRJOLdWxm3nyiWKMd3mvS7VFt6wNAyJ6E23YVdukyEJUMkgFzAzsqi9jxRQ/EAcshN3gqmxtt0FJfvT/WQHMtwuc/Rb1N7Vfa+sIoXbpgZ86SaZRfBQBmfFj5r59M+j5kawgefDUDxu/iGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QXxciobJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=On44iUYd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62D7iLtS2262552
	for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 13:20:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4F9nsNfa79aeW6n/ixoZUFyCpjEcfZKeyDWXPLWxujc=; b=QXxciobJCjHsoGaj
	P+jIXpueQ1T0mtnUDXSDnmscrtWUmxctpN3RigIwc4GZPkxPy18iYuW+PebEXPAq
	FPpOMuEj+S9BQ1tzkC3+K7D0oWQ+PDPQUj/QmseakkuAE6eUEw4HT1o54L7LZ0gD
	RmiYeTMMpaYXZ/+XULIHmiN96wlZsLegNKH41sJ0EvNii1yLUUz8zgVsgjCsHydu
	/S/sPfWW3US63sTQSW8vzuVT9B6RLSsKE+XnFT3nKUqjSoyB8drY6dHMyFY+Caar
	ioqtywaWF+lvcaCc+sQK7oVGMcp48+Sj3QCC5Ap0kQHtW7sQ/9KYlV6cU6OfM4/n
	I8IzLg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cvef4s4jg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 13:20:31 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c73b1376f98so8702494a12.0
        for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 06:20:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773408031; x=1774012831; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4F9nsNfa79aeW6n/ixoZUFyCpjEcfZKeyDWXPLWxujc=;
        b=On44iUYd+A2uVJUVy7v/DTXSTo9Sh7WvOei+Zxfptdcf6dpkl9SmQbsCQAWqLMsSgZ
         xjYfHssdLa5l/divTS2MiNAB+9/7RUe1+ZVTlaSlNtwJeakkGkhmY0ciudsqW8vr5dKO
         ZZavoyQgjxyzWXqqRJi0hR7CupHaKBEyVR78+YXSyNpwgNzD7JogFXkS+dT4hKCf3ugo
         hjqCUN99L0SnsmIEfqDS5DXkYOQrGTrVOwcRKHGljmZuaoWhqOkAL2hQx3rETaYBSH0z
         XNxSr6MDrLfpoNvbDW+QNs4H7OUuZPLvpTRMDuelnF/2xIQLWRAKiKLOYTKrwtcr4Sa8
         +ogQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773408031; x=1774012831;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4F9nsNfa79aeW6n/ixoZUFyCpjEcfZKeyDWXPLWxujc=;
        b=PYifz9r1bHztQ7vRrEp/Na7pYKvKKN++kDcIOg9McbD4efrrZRU94SmcyDdzoGih8u
         GUlV6nIWYKHsVS3ikdTvggeK2cmH3gbkMoi62WQ9g9yaURze//9hU4IjqK0cfoC8ZMPQ
         IgKgMLIEH1UojALgcnQeza+c8lLd+CcwUh6RJ5mH4ZKgjMszqWCJ6VHrh0uQXAZM/RPq
         XNB/1/KqnjzstqTZEpCdlYned8fHt0eVTAqUeIMlPDXPB4EZeYwcVBoZ/TWwtdoHSZiX
         wKOwc6aLRLr1q29bSmS4Oz+bqCqa0KhP4HkCoG5iSsoG6hXRcF1pBLk62eu2bF+zDg2g
         D/cg==
X-Forwarded-Encrypted: i=1; AJvYcCWSuTGkFhZbBoQPWVGOL/FaBmLWEFu+F9kGs9bDY4pBWULimwDI65Jm0H6XgKmTLdeirLWycTkgchM07g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0uZQSlbChK2m5kzpb82ImPHyGZNNo7YB4VepBMJgreFR+N1Oq
	0PQ28EXKGuvm0b7ngOPJtn/ljL+Iw/KY6sV9xXAVAQlVkARHH+Y3wK7xmAB4VgOdX1pbg1w+OwP
	Dzq7fB5v1uvVGMkUdYzow3NsYCHW6d3LOJH6GvqMgFtLDnC/x6NHN2EY7i7n7zxJjOQ==
X-Gm-Gg: ATEYQzwqSWnE8pkoZ1MhpMUxv0xH1HprlDzI0nuSk7tEGNTek0Y3VP+J7XM6+HFUsWC
	2hW8UKlsZ22M7Dyzx3xjMAaV4KhrjtvGlzE0qt8mg67wQD5cMr87S7wTfT6iZcCCIEYkhH14u/r
	hwHj9MspN4Mn+VkR1ACX3a3OJ/awdPlLEE5T4Zd6JuhOSCo82ygpplaxOzrayAPUq0WUhmYvuTE
	ErkQ1rLFpmAcEB/OFS4IIaYxrvRl7KOVyFvjydSkOigADw1vTrI0QdL7NBHISp9VcEvU2cBp8VJ
	tYRe2XuPqWU7XDFHzpD5AWW5NwZlcDwmBdV37ATrrwGpo0Ld9lSAUDMKzeCuurO3+N5keB9Nhf6
	DK6348Ut67tClDb+WnjkD+LDoacGOyQHI96Io9e3rZ/d8IF/o/PK+5Kh0
X-Received: by 2002:a05:6a21:d83:b0:398:a027:4729 with SMTP id adf61e73a8af0-398ecd61750mr3046012637.55.1773408031162;
        Fri, 13 Mar 2026 06:20:31 -0700 (PDT)
X-Received: by 2002:a05:6a21:d83:b0:398:a027:4729 with SMTP id adf61e73a8af0-398ecd61750mr3045989637.55.1773408030646;
        Fri, 13 Mar 2026 06:20:30 -0700 (PDT)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82a0724407csm5775254b3a.8.2026.03.13.06.20.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 06:20:30 -0700 (PDT)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Fri, 13 Mar 2026 18:49:38 +0530
Subject: [PATCH v3 4/7] media: iris: add context bank devices using
 iommu-map
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260313-kaanapali-iris-v3-4-9c0d1a67af4b@oss.qualcomm.com>
References: <20260313-kaanapali-iris-v3-0-9c0d1a67af4b@oss.qualcomm.com>
In-Reply-To: <20260313-kaanapali-iris-v3-0-9c0d1a67af4b@oss.qualcomm.com>
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux.dev, Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773407994; l=8180;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=0lhwz2GDhjJccpcaQkd+oJUE1mfWYeMI5kJ2acMGxnc=;
 b=zAt3JN8iKdg4o8FqqkscPxekNQSgxCasQo7rUCKTLirHeNWrQoLU7HtDMiEBJzp0MMLyPllqw
 evNcu6xRZXyBNpYRXcZTEU2dxHtP1eIwgV9JDgE/BO/ry8ngu3dgihD
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Proofpoint-ORIG-GUID: prRdJq5YMJA_jK3rUemPpQ_n-fkZAcNE
X-Proofpoint-GUID: prRdJq5YMJA_jK3rUemPpQ_n-fkZAcNE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDEwNiBTYWx0ZWRfXyDrgJH6IQ3gG
 JAL5sxtBlvTuIGNhp7QP8qzX1sUm3S8hscc9Ti0/E8ckQZp07qJZzqqFcIVkOK3JEAzIUih5w4z
 ahyNckTerHzGh/fE2iJtVhH19KK0nEFJe4zRBPsfDRg05lJS9JEr99P2xqLfLAjPQM3ytlxU6W1
 wCDCUzzX3QLnnWOr9Dyu9w+oZ6FbfBYW0R0+RjPmOng5hNkXvCoyG13vq4Ey7a2JjTofBNdcBse
 CsJN7OlxTuKnvPwLLQmEGu0lSbCFHBp390Y86wifqWViagIk+x+zdvqi4gc2xxzo1X7YlFWX1WC
 v9/guGVecJNy8gLQK+OiERR5TIaIj7kQWF8lIGiNzxwks3DZwNtdVp5hEU6CXmfi/8gu+YAGdGk
 BMVg4fl3MKHFHHMs73cXI0CTC5MTm8V/MkzmueYOFk/f8/IaSwkVOOIylOfBiw83xo7oXl+dWRs
 aGaIrTsllhH3yowZpcQ==
X-Authority-Analysis: v=2.4 cv=S9nUAYsP c=1 sm=1 tr=0 ts=69b40f1f cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=SfyqL-E6UMM09KjvQ6sA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_02,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 malwarescore=0 priorityscore=1501 suspectscore=0
 clxscore=1015 lowpriorityscore=0 phishscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130106
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[24];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55685-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vikash.garodia@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 83403283AEB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Introduce different context banks(CB) and the associated buffer region.
Different stream IDs from VPU would be associated to one of these CB.
Multiple CBs are needed to increase the IOVA for the video usecases like
higher concurrent sessions.

Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_core.h       |  2 +
 .../platform/qcom/iris/iris_platform_common.h      | 14 +++++
 drivers/media/platform/qcom/iris/iris_probe.c      | 66 ++++++++++++++++++++--
 drivers/media/platform/qcom/iris/iris_resources.c  | 46 +++++++++++++++
 drivers/media/platform/qcom/iris/iris_resources.h  |  1 +
 5 files changed, 125 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_core.h b/drivers/media/platform/qcom/iris/iris_core.h
index fb194c967ad4f9b5e00cd74f0d41e0b827ef14db..62364bd6909e9a03d223bac86962dc9094a40243 100644
--- a/drivers/media/platform/qcom/iris/iris_core.h
+++ b/drivers/media/platform/qcom/iris/iris_core.h
@@ -34,6 +34,7 @@ enum domain_type {
  * struct iris_core - holds core parameters valid for all instances
  *
  * @dev: reference to device structure
+ * @cb_devs: array of context bank devices (eg: bitstream, non-pixel, pixel, etc)
  * @reg_base: IO memory base address
  * @irq: iris irq
  * @v4l2_dev: a holder for v4l2 device structure
@@ -77,6 +78,7 @@ enum domain_type {
 
 struct iris_core {
 	struct device				*dev;
+	struct device				*cb_devs[IRIS_MAX_REGION];
 	void __iomem				*reg_base;
 	int					irq;
 	struct v4l2_device			v4l2_dev;
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index 2273243d1a80446233dd82dcd77444aa043ad064..df63a06b8401cd367c69ab8909af227f04bf69bf 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -204,6 +204,18 @@ struct icc_vote_data {
 	u32 fps;
 };
 
+enum iris_buffer_region {
+	IRIS_UNKNOWN_REGION,
+	IRIS_BITSTREAM_REGION,
+	IRIS_NON_PIXEL_REGION,
+	IRIS_PIXEL_REGION,
+	IRIS_SECURE_BITSTREAM_REGION,
+	IRIS_SECURE_NON_PIXEL_REGION,
+	IRIS_SECURE_PIXEL_REGION,
+	IRIS_FIRMWARE_REGION,
+	IRIS_MAX_REGION,
+};
+
 struct iris_context_bank {
 	char *name;
 	u32 f_id;
@@ -252,6 +264,8 @@ struct iris_platform_data {
 	u32 inst_fw_caps_enc_size;
 	const struct tz_cp_config *tz_cp_config_data;
 	u32 tz_cp_config_data_size;
+	const struct iris_context_bank *cb_data;
+	const u32 cb_data_size;
 	u32 core_arch;
 	u32 hw_response_timeout;
 	struct ubwc_config_data *ubwc_config;
diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
index ddaacda523ecb9990af0dd0640196223fbcc2cab..439e6e0fe8adf8287f81d26257ef2a7e9f21e53d 100644
--- a/drivers/media/platform/qcom/iris/iris_probe.c
+++ b/drivers/media/platform/qcom/iris/iris_probe.c
@@ -123,6 +123,55 @@ static int iris_init_resets(struct iris_core *core)
 				     core->iris_platform_data->controller_rst_tbl_size);
 }
 
+static void iris_destroy_child_device(struct iris_core *core, const struct iris_context_bank *cb)
+{
+	u32 index, region_mask = cb->region_mask;
+	struct device *dev = NULL;
+
+	while (region_mask) {
+		index = __ffs(region_mask);
+		dev = core->cb_devs[index];
+		core->cb_devs[index] = NULL;
+		region_mask &= ~BIT(index);
+	}
+
+	if (dev)
+		device_unregister(dev);
+}
+
+static void iris_deinit_context_bank_devices(struct iris_core *core)
+{
+	const struct iris_context_bank *cb;
+	int i;
+
+	for (i = 0; i < core->iris_platform_data->cb_data_size; i++) {
+		cb = &core->iris_platform_data->cb_data[i];
+		iris_destroy_child_device(core, cb);
+	}
+}
+
+static int iris_init_context_bank_devices(struct iris_core *core)
+{
+	const struct iris_context_bank *cb;
+	int ret, i;
+
+	for (i = 0; i < core->iris_platform_data->cb_data_size; i++) {
+		cb = &core->iris_platform_data->cb_data[i];
+
+		ret = iris_create_child_device_and_map(core, cb);
+		if (ret)
+			goto err_deinit_cb;
+	}
+
+	return 0;
+
+err_deinit_cb:
+	while (i-- > 0)
+		iris_destroy_child_device(core, &core->iris_platform_data->cb_data[i]);
+
+	return ret;
+}
+
 static int iris_init_resources(struct iris_core *core)
 {
 	int ret;
@@ -193,6 +242,7 @@ static void iris_remove(struct platform_device *pdev)
 		return;
 
 	iris_core_deinit(core);
+	iris_deinit_context_bank_devices(core);
 
 	video_unregister_device(core->vdev_dec);
 	video_unregister_device(core->vdev_enc);
@@ -275,12 +325,18 @@ static int iris_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, core);
 
-	dma_mask = core->iris_platform_data->dma_mask;
-
-	ret = dma_set_mask_and_coherent(dev, dma_mask);
+	ret = iris_init_context_bank_devices(core);
 	if (ret)
 		goto err_vdev_unreg_enc;
 
+	dma_mask = core->iris_platform_data->dma_mask;
+
+	if (device_iommu_mapped(core->dev)) {
+		ret = dma_set_mask_and_coherent(core->dev, dma_mask);
+		if (ret)
+			goto err_deinit_cb;
+	}
+
 	dma_set_max_seg_size(&pdev->dev, DMA_BIT_MASK(32));
 	dma_set_seg_boundary(&pdev->dev, DMA_BIT_MASK(32));
 
@@ -288,10 +344,12 @@ static int iris_probe(struct platform_device *pdev)
 	pm_runtime_use_autosuspend(core->dev);
 	ret = devm_pm_runtime_enable(core->dev);
 	if (ret)
-		goto err_vdev_unreg_enc;
+		goto err_deinit_cb;
 
 	return 0;
 
+err_deinit_cb:
+	iris_deinit_context_bank_devices(core);
 err_vdev_unreg_enc:
 	video_unregister_device(core->vdev_enc);
 err_vdev_unreg_dec:
diff --git a/drivers/media/platform/qcom/iris/iris_resources.c b/drivers/media/platform/qcom/iris/iris_resources.c
index 773f6548370a257b8ae7332242544266cbbd61a9..a2e648f4cdb8c63db89396d49f32bbc06d870ea5 100644
--- a/drivers/media/platform/qcom/iris/iris_resources.c
+++ b/drivers/media/platform/qcom/iris/iris_resources.c
@@ -6,6 +6,7 @@
 #include <linux/clk.h>
 #include <linux/devfreq.h>
 #include <linux/interconnect.h>
+#include <linux/iris_vpu_bus.h>
 #include <linux/pm_domain.h>
 #include <linux/pm_opp.h>
 #include <linux/pm_runtime.h>
@@ -141,3 +142,48 @@ int iris_disable_unprepare_clock(struct iris_core *core, enum platform_clk_type
 
 	return 0;
 }
+
+static void iris_device_release(struct device *dev)
+{
+	dev_set_drvdata(dev, NULL);
+	kfree(dev);
+}
+
+int iris_create_child_device_and_map(struct iris_core *core, const struct iris_context_bank *cb)
+{
+	u32 index, region_mask = cb->region_mask;
+	struct device *dev;
+	int ret;
+
+	dev = kzalloc_obj(*dev);
+	if (!dev)
+		return -ENOMEM;
+
+	dev->release = iris_device_release;
+	dev->bus = &iris_vpu_bus_type;
+	dev->parent = core->dev;
+	dev->coherent_dma_mask = core->iris_platform_data->dma_mask;
+	dev->dma_mask = &dev->coherent_dma_mask;
+
+	dev_set_name(dev, "%s", cb->name);
+	dev_set_drvdata(dev, (void *)cb);
+
+	ret = device_register(dev);
+	if (ret) {
+		put_device(dev);
+		return ret;
+	}
+
+	if (!device_iommu_mapped(dev)) {
+		device_unregister(dev);
+		return 0;
+	}
+
+	while (region_mask) {
+		index = __ffs(region_mask);
+		core->cb_devs[index] = dev;
+		region_mask &= ~BIT(index);
+	}
+
+	return 0;
+}
diff --git a/drivers/media/platform/qcom/iris/iris_resources.h b/drivers/media/platform/qcom/iris/iris_resources.h
index 6bfbd2dc6db095ec05e53c894e048285f82446c6..c573016535b87d4fd140cad967d926cc1de63382 100644
--- a/drivers/media/platform/qcom/iris/iris_resources.h
+++ b/drivers/media/platform/qcom/iris/iris_resources.h
@@ -15,5 +15,6 @@ int iris_unset_icc_bw(struct iris_core *core);
 int iris_set_icc_bw(struct iris_core *core, unsigned long icc_bw);
 int iris_disable_unprepare_clock(struct iris_core *core, enum platform_clk_type clk_type);
 int iris_prepare_enable_clock(struct iris_core *core, enum platform_clk_type clk_type);
+int iris_create_child_device_and_map(struct iris_core *core, const struct iris_context_bank *cb);
 
 #endif

-- 
2.34.1


