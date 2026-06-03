Return-Path: <linux-media+bounces-63613-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id tiQEK4I6IGqWywAAu9opvQ
	(envelope-from <linux-media+bounces-63613-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 16:30:26 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 345F1638982
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 16:30:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=eRGj1to8;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=gWw5Jh4S;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63613-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-63613-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4A21E31AC855
	for <lists+linux-media@lfdr.de>; Wed,  3 Jun 2026 14:22:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE354481AA8;
	Wed,  3 Jun 2026 14:21:10 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1575A48125E
	for <linux-media@vger.kernel.org>; Wed,  3 Jun 2026 14:21:08 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780496470; cv=none; b=bCCDmSxjSpdDqa+W2ZQKRsHxJYmhmTsVDv3tpxWcxIF12ybUJwe/iqbLrsd0EIMwhfoDUlgTLj64zy4fewRYbdcNzUFlk/aBOhnurq2/v+7KB4JvuUFoiOH+vB9j6mOkuQGHUVrZo+BXqvaGVdRvPOhp27xY1+87bPPeyCBqG54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780496470; c=relaxed/simple;
	bh=V7PgQEmeHs85Yid9DqRUGN4/IVHySFt6tEXoQMuJaQ8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SSW0WNTmASCnm4r3NPVo25sROXktSxOkxg8Zj/Jn7kPr2lYAG3Dq3mUXUrN4w+jpJOYMljlWne3+ZL39vQPfL4kKUI03SvZaAw+VkSrrq63eoUhLE4WjFnJ87VK6Fk4qXZSMiBRbaFGwxbwMt0vEp8GbO6mqKpcYCwgugHjI3Ak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eRGj1to8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gWw5Jh4S; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 653D69WZ380244
	for <linux-media@vger.kernel.org>; Wed, 3 Jun 2026 14:21:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xMEkLXNsqb0/CW0mZDeXY4YJFWXjWp0pDdNFYzT4HSs=; b=eRGj1to8SrRar4ME
	nSFZSDo2A5G1d0KWIqYdPbg54IVoIWZFhTrBQRH5nlu7b7gyFxnQQlmzrrw74UYi
	N4HwraOBzyWW7CuqZ/pEKQH9OuBQzJJ/kcacEnw5u5PfqJm8RKAlFwqka/rUJjQ1
	DE7pyosLzwb9pjyEgXnQx2t7M2SI3TwZQSJMtFUJ7IJnBe6jnfzM+0/9Gx1vEMvc
	ADtMqr9rM6R1rPnbiVcvpK6JCLVVnm+64QEtDoIlr0EHaFsYdW/OzdfyE+FYOhYH
	8jXT8KWx0G6+QrtWKsBYHYAPULMtb7jRUO2iIVmVNdUcElV/1lO/7jBfIx70ULPO
	v+vEKw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejewhsvqp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 03 Jun 2026 14:21:08 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2befec3fd8fso47929625ad.3
        for <linux-media@vger.kernel.org>; Wed, 03 Jun 2026 07:21:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780496468; x=1781101268; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xMEkLXNsqb0/CW0mZDeXY4YJFWXjWp0pDdNFYzT4HSs=;
        b=gWw5Jh4ST46aMiCP0Y0ezX09DV++5OkzfJgsCeIKHkLffFeOQfba39wglMXwhHPtLr
         lXVni9vWLQRpcoB1CqRVZYYP8HshVVPIX/RCFmiGnIzkdloMW0NdtDQ9bvmH07Khw7pi
         HBh+nMVpAQXRKnoXzavn8By+D4AjgpWU2ZayDbp9X8XDimflV8TFncIsTIL+iCyaYIdH
         wElCIOQudtfrBTWjjU7dRpkd+2iXbynD28lKX61FLRpi0MHmJCGxdU0oR8dlTTYy4xlY
         eCcSi3J6iUK2SJZ0MjjAihOF6E80bYytZBS5OSTPTCxp1wgXVhzrt6TFA56E8UUD3Go2
         a7dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780496468; x=1781101268;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xMEkLXNsqb0/CW0mZDeXY4YJFWXjWp0pDdNFYzT4HSs=;
        b=p4QQ4MYTyCCnuBz7eGMHdEIGZ38zCpr9SfndHEfkKleYI0L7IN1idjgm791BYSHP6U
         qnlmjfRn63HPEA5MIO0Tr9Kz2FqTMlx2fAEc1jb2MZkUCv7iRckp6l4l1aKzWZwrlq+q
         WVs09KnG7ZNVFwNJa2xqlibk4Z36U4BBnJyP6EfXE/iQljEaR7AXgXznPOOeMriUSgZ8
         Bs59AxR8efRzXD2OJkyvBju/ND4umvg43xF933frqOAi01NJiW8Tv47ij9sNu28Zk4pm
         U4+tsU0V8QNwnilu+FJPRp/ejfJpbhtcMuB5ty7Aua68kVUSHvpyzha8ROxOKlD4re1a
         5/rA==
X-Forwarded-Encrypted: i=1; AFNElJ+C1o5QhuuVLx9E1nF2XDWKfVsZaQ5jN9l+JQ6reqpGtuLZrrgFABUNr822XE1pRTw03TbIvgsxYuZoiQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3EF+kW3ij10oKcZJFe++DS4u2iTDc+43v+YwANine0MY2bYV8
	6UZK/KU2lRja3YiieW7hoqHISlbf3DGha+RPRGwhKUS5ioa3g5rumRAJRvr1+S4g06ptBNiAi/d
	dSgCtfue3yZiibw/g+EA03/5WCrjlIl/wxmQBnEx/aQmDeR3Al01RclI0dpUsaFI4fg==
X-Gm-Gg: Acq92OEYIy9oBUpLkCX5WticXgI6JbfHtGLOGwY12IDMgAA57Td0FR4Naalp1Dh2qjq
	mqnTX+zWXHJ5CuSKQZfEjenn1FDDMTUGxI32jj3Pr2QtNznw1uryxo3xudLSoTvH69yRj24grNr
	YwH9SAwWNc87FA3SparTIOasuItf5CMhPbWg2dQJXJKAxfKm0KRAf8wM+NMO61c02mITWuer82D
	rhyU/f+dKInN7gfqE5TqgbT6ji3482xqsiYT6ISbJ5wwMBdGmyTlCAg4TcVO8IfPpVjJR3Y+Dwt
	o3byp8ZmZ3Y8stIzWIAqqoQ7RD/wnOfbNZunkYyy0u5ieApoKKTcfb9fY6Z8txIhWM9iDjzQO9N
	75d6pCdObgljykG4MLJhK0ZV3v53cIUNtcqJrS+YdX7BrEHmreuUwhkhg2hln1VbPBw==
X-Received: by 2002:a17:903:4b50:b0:2c0:a373:89b9 with SMTP id d9443c01a7336-2c163a24bf2mr39122585ad.6.1780496467587;
        Wed, 03 Jun 2026 07:21:07 -0700 (PDT)
X-Received: by 2002:a17:903:4b50:b0:2c0:a373:89b9 with SMTP id d9443c01a7336-2c163a24bf2mr39122085ad.6.1780496466980;
        Wed, 03 Jun 2026 07:21:06 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f6d37esm41514955ad.9.2026.06.03.07.21.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 07:21:06 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Wed, 03 Jun 2026 19:48:46 +0530
Subject: [PATCH v7 08/12] media: iris: Handle CPU_CS_SCIACMDARG3 register
 write via program bootup registers hook
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260603-glymur-v7-8-afaa55d11fe0@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780496410; l=3461;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=V7PgQEmeHs85Yid9DqRUGN4/IVHySFt6tEXoQMuJaQ8=;
 b=ajH7+RdKoqMBI5T0yRV/AwqwH7xNBXME7K/NWXkfDQNofxpXSwhe5VnQvQZ6+sco6/vGoY41A
 CwZZyp4iv9TAdwckD6UqVahn0V/uorLzVRChwsq63PpGuPpcMScDciZ
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAzMDEzNyBTYWx0ZWRfX0czWRx5Z/A8q
 bwAwT7fTA2roqhi7DtLej0hJlFPRo93gtynivz6YyaimpOkxQpzCaAS2VMr5Cc03156VfpnuWQz
 znGjtSSDHd7Oa/C+xSsGnJGo26QuroELR0pFmjqW/7ascF9y4eGJ7r9Spfmlv2dnujXi4EEBBaw
 HZaksQIH7W1D1nyy1uEGDX4GP36mQ8Jn4lN8BXVgscwtEK3I6G+aZxh6rR5TGtFHwCcVtG+97AM
 r9jmg53M7pSZIpiPMMnzp2zn8+RWBX7RW9+LIwp5RUhQRaKaQlKbD68prKQZKhbc05PMXsaayCy
 VE2R6XeXUHxvhwMyWcOfzn8tSJY9+k7Lmblpb2ILehPK1II7hKQAHien2kAYxmJCg02xmQ8j3/n
 Aoo3aZTQ6RJGwpxVTNgycdKtCnP269xECivHQDdHnBpq2Rdz9HxeA/Zc7tpxScKZwHIEUJGKrkF
 lV5eyNE2kRvlrhmOTbA==
X-Authority-Analysis: v=2.4 cv=Zewt8MVA c=1 sm=1 tr=0 ts=6a203854 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=_-2Oxswyk2Zu2Y7AJ8cA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: Lq76oEYCf5h99v_Gz2Tx0bOPvOy6ODFt
X-Proofpoint-ORIG-GUID: Lq76oEYCf5h99v_Gz2Tx0bOPvOy6ODFt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-03_05,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 suspectscore=0 malwarescore=0
 phishscore=0 bulkscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606030137
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
	TAGGED_FROM(0.00)[bounces-63613-lists,linux-media=lfdr.de];
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
X-Rspamd-Queue-Id: 345F1638982

On the Glymur platform, the firmware reads CPU_CS_SCIACMDARG3 during boot
to determine the VM count and increments it by 1. Writing the default 0x1
causes the firmware to treat the VM count as 2. To avoid that write 0x0 to
CPU_CS_SCIACMDARG3 as a Glymur platform specific.

Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_vpu3x.c                | 6 ++++++
 drivers/media/platform/qcom/iris/iris_vpu_common.c           | 4 ++--
 drivers/media/platform/qcom/iris/iris_vpu_register_defines.h | 1 +
 3 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_vpu3x.c b/drivers/media/platform/qcom/iris/iris_vpu3x.c
index f07eaf4b3be2..65896d0c1f16 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu3x.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu3x.c
@@ -313,6 +313,11 @@ static int iris_vpu36_set_hwmode(struct iris_core *core)
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
@@ -346,6 +351,7 @@ const struct vpu_ops iris_vpu36_ops = {
 	.power_on_hw = iris_vpu36_power_on_hw,
 	.power_off_controller = iris_vpu35_vpu4x_power_off_controller,
 	.power_on_controller = iris_vpu35_vpu4x_power_on_controller,
+	.program_bootup_registers = iris_vpu36_program_bootup_registers,
 	.calc_freq = iris_vpu3x_vpu4x_calculate_frequency,
 	.set_hwmode = iris_vpu36_set_hwmode,
 };
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers/media/platform/qcom/iris/iris_vpu_common.c
index f35754ef53ed..5bbcad00ce09 100644
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
index e67d98b8c91e..de6a91041ea2 100644
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


