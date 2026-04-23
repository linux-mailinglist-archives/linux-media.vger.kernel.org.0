Return-Path: <linux-media+bounces-59420-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2NfRLRsi6mkYvAIAu9opvQ
	(envelope-from <linux-media+bounces-59420-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 23 Apr 2026 15:43:55 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C7BBD45331A
	for <lists+linux-media@lfdr.de>; Thu, 23 Apr 2026 15:43:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D27093091640
	for <lists+linux-media@lfdr.de>; Thu, 23 Apr 2026 13:32:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFF8F303CAE;
	Thu, 23 Apr 2026 13:31:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gg7QXMgw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AdR4xRtS"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E3832FFDCB
	for <linux-media@vger.kernel.org>; Thu, 23 Apr 2026 13:31:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776951102; cv=none; b=Q0T/myI2VT1FOozbON+NY4f9YV7t/N+S1X2Or569fTOnJ0btVhVqrdKB+wuZB9r3IB7GTSZ38K65XARyorS0NjxAJkWA+VOT4lQtGUiHiv8IRft36WxB7SviB8BcDQu6CGeQ/fMrTjs2O7u744KrQHDr51DoGYB4GQVy6ZZzUUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776951102; c=relaxed/simple;
	bh=ebFEmvXGGkqJKD9mFiIVA1LtU6HQ5Bywf5jEMGrP3G0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pcOGCyUAPPFabJTCdxFxmeaA0toEAB7/wtlAxYEYu5CdO1GqFjxF2Q9uPq3aDdhyT8hwhjV++SU/NTbCMWCzBuBHfFZgkOqrF8ec9jSHLCgy47wnnt8Bve+qQGrS0YmkRXeZF7LCEKLjLVWvS64Xy4TBJgfsBtGoHSRGhL4KJfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gg7QXMgw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AdR4xRtS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63N8uJsc3413388
	for <linux-media@vger.kernel.org>; Thu, 23 Apr 2026 13:31:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	m8HVxJ0pTOUMaGM5sF22jVvxmxUgeEH0LTk097GA07s=; b=gg7QXMgwOV1shweU
	RcerV4o2vU+G0PAZKT37xgsx1XatL3FYPGu/gX41xZUkofpC9P0GYLlein6D+KDw
	uEghegjDPPw9vINbXnFQeKoT9F17MvLu2/PkYcA71HBO2y/0GGBcZ6tgAn3dSLru
	dKlItWKwsvh3dGq3UtzPScZw3oVG9MgF6ri4t+TmdbArx7Qv9sCzkAaB359X6DEq
	wcDHWDhKNehWssmONfMoxmcFpB5Xcym2LPhv0DUfTnDBaeEmZ2bV8MmubF6AyKdg
	+qvh5YssFPbg0mGgpQ0d+dbA2NB26kTqNX5ib9SLZLE05tZ6nnh2tUvgXvkA4tU5
	AbV+UA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dq1h6c5rt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 23 Apr 2026 13:31:39 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2aad5fec175so93573515ad.2
        for <linux-media@vger.kernel.org>; Thu, 23 Apr 2026 06:31:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776951098; x=1777555898; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m8HVxJ0pTOUMaGM5sF22jVvxmxUgeEH0LTk097GA07s=;
        b=AdR4xRtSI5R6G+s5zJQfdMgFGhRTGE+DC2Tn6zd43WUE3LiS3XKvtT3vmG3TDH1UOM
         7NSAPsyKbODvamHo5bI2RL3VLxpin24CsZ+siBTrFJ2SjDKKdz3NnlY7x6+Afec1bVIf
         qD1gcwGrOhwI3Oi0Hi/YtVa9pBL1YliHybTZ4c+L8pmFXQbMo+81ii5l16t5gCzt+ia9
         1WzPMosoXYQQbXpVwfwyfbFsvLIFCFVmusYvJU2b3DBguEfl3JUPTzTWHB0LZqVkoZwY
         ZGyVg/czanUtTC7zCMgOZkKAKk7yO0SR6rt/Z+avKjZPB1soItDmCFESwZf/xFJ29NeC
         HHSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776951098; x=1777555898;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=m8HVxJ0pTOUMaGM5sF22jVvxmxUgeEH0LTk097GA07s=;
        b=gr7NvLjQmswOBWvLS8zw8MKlk0sGKCOZoEF05BOKSqCJXEBbYkOqd9DNKLWLVEcvS3
         ybKAua4mNpuEpTxhVhT//CMLRqV+3+7I3tlByR2OF0RdZMpMxYcx43U6QPvmIIGg2Ln8
         FHuoCbQPv1bNi6nb77GPNpZ8SDG0RrZeF5ooIQRIE6b7z2gNlM+osdee37L+vsJQ0qfB
         Umb3miypsN7ePFlx7sTyv5nZY0xgVCnYY//jCl9/et1T+Cal8lI4iMAb7kpvp3c3L4cP
         VvL7GDu3C0I10SAGdttpKKfMTjBOi2uirMejthceObMpl1QTACb9GLjXc1fcR/qg/YYf
         5ncQ==
X-Gm-Message-State: AOJu0Ywx8kHx7JAyvp+sHSrNoFw91hDj7OQ19azahivQrLELl43vQpeE
	tDc6rFALgJ7t82GkWl2SUyOtYWzCqK2F398+VnwzRYhBbc1mx/o6CaJuuXC4OKg8aGyQRpGLEHz
	L5HoEELES4HJMr/aCzKFht3tcyllxP+VApczNkZ8KshaVyzV5ZqJe8Y/f0CLW25Fuhw==
X-Gm-Gg: AeBDieuNZPgEI+X6bYyj/09sP0m0TkLRItxLluDmah7qYSTEci8mL6YDzy1EiqpqLL1
	4/1IuYy3MGwEji8gUiJDFTJhB4yQ0yQ+16LG0UB0SdUZaaapUoQ1N+2YoSDjXQFcZwfGXvLeRrv
	hKPTmnm929ZRnXO5yXzv3+Xhtn6lUCTYKMdMQ0lK9LpxUwchPmkiN2xQo2VoTmsYB9uRWHYYvJS
	/5KJFeA9fwv7PTwI7Yq0MWAER8v++VFBNkiRegu44I0WP4kXxZ0j8aSvahd+FD2oMrM+Z0cJlHz
	JnKHvU1u+QceXtKqNnE1sQmKIENVv0PzJbitibiAJ35hEZ2qZ+VsxIDn1gvTZAoghb0+nVHXODc
	5yVmqe0LZIER/RDAMYW+JABK23sJteeQ35lRIzdiIyqrHSwjA9gg3hewGAtfGeRb/NQ==
X-Received: by 2002:a17:903:3688:b0:2b2:501c:ba8 with SMTP id d9443c01a7336-2b5f9f7d700mr214914145ad.26.1776951098368;
        Thu, 23 Apr 2026 06:31:38 -0700 (PDT)
X-Received: by 2002:a17:903:3688:b0:2b2:501c:ba8 with SMTP id d9443c01a7336-2b5f9f7d700mr214913615ad.26.1776951097773;
        Thu, 23 Apr 2026 06:31:37 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fab0cbaasm198795635ad.54.2026.04.23.06.31.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 06:31:37 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Thu, 23 Apr 2026 18:59:40 +0530
Subject: [PATCH v2 11/13] media: iris: Select DMA_CONTEXT_BUS to create
 firmware device
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260423-glymur-v2-11-0296bccb9f4e@oss.qualcomm.com>
References: <20260423-glymur-v2-0-0296bccb9f4e@oss.qualcomm.com>
In-Reply-To: <20260423-glymur-v2-0-0296bccb9f4e@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Thierry Reding <thierry.reding@kernel.org>,
        Mikko Perttunen <mperttunen@nvidia.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux.dev, driver-core@lists.linux.dev,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776950985; l=1132;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=ebFEmvXGGkqJKD9mFiIVA1LtU6HQ5Bywf5jEMGrP3G0=;
 b=bQ2hOZeQXviL9nyF3kRsnvZT4zluN72vayk4KkSLYRcfIp5ZJavRUHXeaeh7XDtSU5FxhOQqO
 0m/xHMr57rABgvyiSf0X1xDEkWlvlf58cukHzX9Ec8r7jTMd6Tw/pND
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Authority-Analysis: v=2.4 cv=f4Z4wuyM c=1 sm=1 tr=0 ts=69ea1f3b cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=LyCF3VY0PmB3I9bQj-wA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIzMDEzNCBTYWx0ZWRfX7aYDXhEtj5Ck
 1mCbeMKdwTso/JxgsHkO4jS3i5O7mphgTuKZUPMhrv2bZAwCWG6R9mUAlrzGmIZvVR0SxOif7AY
 qljvV3QDI3nzMm3FBkK7MbWMC+bm1cvHnjMaE/TtGjnKzJ5rYBdupOZMk1yxL75J5/Llhjd8xwR
 Tqs/yKcX/z3wWZJVyy67r7wP4ONvbXNvrOD1vUGe+V7X7gWCwrJ2JhpIgLkERfjv0+swxCgWC/7
 xQII6U3CSmvFWWk3/QwTEfN03P+rlDY2go5Vz6lfll3jArFTywRCrXhIvgCV5+w0JV3Nyd1BKa2
 oRZNo6Ru0VKoWpkhD6Rt/uO8cTN8Jy3VkPmVf8btcODgOKfdb6Y6IIu+kDggbPQ2w5dlzUTAnp/
 6v7oC/MoqdgyB6t3GEescNzQ8WNoxVvRRS9IaPd4TgcHk/YadkH71KPkPq92ENokCwz8FPmFG74
 Q+M50ipuD7UCAIsO98g==
X-Proofpoint-GUID: BxWZKSQyLwrES26WwB2S3hvmTp4GeY4A
X-Proofpoint-ORIG-GUID: BxWZKSQyLwrES26WwB2S3hvmTp4GeY4A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 bulkscore=0 malwarescore=0 clxscore=1015
 spamscore=0 suspectscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604230134
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[32];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-59420-lists,linux-media=lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,oss.qualcomm.com,linux.dev,8bytes.org,arm.com,linaro.org,linuxfoundation.org,nvidia.com,gmail.com,ffwll.ch];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[busanna.reddy@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	MAILSPIKE_FAIL(0.00)[2600:3c15:e001:75::12fc:5321:server fail];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C7BBD45331A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Iris need a firmware device to enable secure PAS (peripheral
authentication service) support in case of non-Gunyah. This device
requires its own IOMMU context for memory isolation. The generic
dma-context-bus provides the infrastructure to create the device and
configure its firmware stream ID.

Select DMA_CONTEXT_BUS to ensure this bus is available when
VIDEO_QCOM_IRIS is enabled.

Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/qcom/iris/Kconfig b/drivers/media/platform/qcom/iris/Kconfig
index 3c803a05305a..de1fc4b07ff8 100644
--- a/drivers/media/platform/qcom/iris/Kconfig
+++ b/drivers/media/platform/qcom/iris/Kconfig
@@ -6,6 +6,7 @@ config VIDEO_QCOM_IRIS
         select QCOM_MDT_LOADER if ARCH_QCOM
         select QCOM_SCM
         select VIDEOBUF2_DMA_CONTIG
+        select DMA_CONTEXT_BUS
         help
           This is a V4L2 driver for Qualcomm iris video accelerator
           hardware. It accelerates decoding operations on various

-- 
2.34.1


