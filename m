Return-Path: <linux-media+bounces-49748-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A1F1CEA412
	for <lists+linux-media@lfdr.de>; Tue, 30 Dec 2025 18:04:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5641F30319F3
	for <lists+linux-media@lfdr.de>; Tue, 30 Dec 2025 17:03:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4CF631E11C;
	Tue, 30 Dec 2025 17:03:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mlEW03cK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FUKrQen8"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9DAC32C326
	for <linux-media@vger.kernel.org>; Tue, 30 Dec 2025 17:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767114202; cv=none; b=Z2N0AdGuoZAdyh9pFgm5tfhfZlOb6utHg3jVRsP6lfGE8szkVwcSaDlthVtduwkuZrWcfNs4TImlHU65o0MVtUTHYOEdKIxIwQ9TMTl/dsrvMoUMPnYaZ2Nnzz/xDFJtx7SS9Je2XSohIZJKWtfEI7x5XoI8DDGNJRhSCvF386I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767114202; c=relaxed/simple;
	bh=EnGSujrAJxYkO5JDgQzjCCliMvSIPNrsoeTlC5o4gds=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eCYqmrSb7o6SUslSy04NO1Y5MT3T5o2RSjeYbg/PakKIb0h0cykNbtWhAB0Zd7bEwiavDgo+du6gW2xB72T49wvkp1CvJR80nDar3GN4K3Vr7c+ayfSXORCv/Hft1hnS0iyWwufGtjoXV3dZrIWu4wT2ukEWCH9iMwMMY+AZB9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mlEW03cK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FUKrQen8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BU9Ds2q2723267
	for <linux-media@vger.kernel.org>; Tue, 30 Dec 2025 17:03:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bmg1hpZJFZoXhQYGf7VucBoksdu2L9ui/4nDmGyH53A=; b=mlEW03cKLU0m9mbb
	sCDcImcpy7nG4wjKm1uvS7yrVCO1RRpb0AC6Fep5AZJMiL79wdCJotfu8abvCpwB
	nL2KnTWwH+gKRoxkwXHKC1Ovz6SlB+4SmqHL3qcm5fYm8PWrwOy1NPm24BYKTPy+
	o6FXYx/INO0GtmLGSYg9Gs5ycuyLCTFsLWlkMyzR1KYCT7fWGvPVvL0o7j91CMtp
	4JSusLCCvaLl8momN/5ADCrU3w93U+z+loySEjGQse23qpxRU7Fm3FGECaU+OP3b
	COt3NSXDdixm2Ja+p3mJotUdVCPCz1eFVz3P6zacoAea0Mli0YaZhXygeyzSDwS6
	kiXapQ==
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com [209.85.128.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bc0vdjf45-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 30 Dec 2025 17:03:19 +0000 (GMT)
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-78fa4ffdf74so127782167b3.1
        for <linux-media@vger.kernel.org>; Tue, 30 Dec 2025 09:03:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767114199; x=1767718999; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bmg1hpZJFZoXhQYGf7VucBoksdu2L9ui/4nDmGyH53A=;
        b=FUKrQen8ocyLycWohLpmRa01VyNPZbeX6ae1ClhmlX/5kVEUXY131yuypRI5qYoEwL
         ydibCCYJ5fqXbu2jZVBMkKdId+bgmON3/QoTrqi7aEef3VWvR1yFMd8CHckvnsNukI9f
         knZ4Pb77oOZd0/8mOiJBszOniiD7f9/waLccy0Ka7QDfJXmgBD2zinwb6Crh8Sh6amnt
         4Vvj0++BFgy5zgjPbytL/dwBgxLNc5n/gDk78dYugCJhkYDAY2MQgpOuY0gEm2Q7emaB
         QRK0APE+Awi9yaaJuqw9mFRaC1DOLO9y5vt33IUouz+5S4m1QB+URQJxjJj6uhfOAspP
         h0hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767114199; x=1767718999;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bmg1hpZJFZoXhQYGf7VucBoksdu2L9ui/4nDmGyH53A=;
        b=NfFQEWotOytikn7yc04RpfCw4svUbNrlATjaLAHNH94Cs8NAI1I2qO6LnGDiUbgHz/
         q1xRQFsTQNVPh4CNkYV7ZHSyq9Lc4Yv2959uHCRZPaZwXAnmJnem5mBI5UNyXNmpBO+u
         AWUunK429Fg0sE7ppi7z5GlEb79Zkrm4U0vl9bvaeCJHMxga+L3aeJMZetkPMu2cyp7t
         r4utr7RH4yocLhokRpPAdD/AtrPKg5NHgF12XNlOueM5eb62e7YY1TYY1N0mA4yn746L
         vo5wera076WAAqclsZPNh4Pv69Qzq1zL/Sy4UvIHIJi5nsT/axedr0XjmCWoXHMyxSyE
         Enug==
X-Gm-Message-State: AOJu0YxkXzKnKibxp1jpasIusUn3Ud0yanwjCHJ78hYyNYjF4iArTmU/
	y1so8sS7DoUjBn76dRfL2RTxr0RlSsP9eoz/R7ciiVvRTO+F7kvlNC1DSyfgqgv+u9zPSQPcTzi
	v9qYHgkkVtR1upMUuiYKM9tCU4s1KI7rvk76RKI9hS2cVT1aE2zN2VGY0b/ROK0zhsQ==
X-Gm-Gg: AY/fxX797AdjhtTpPU6C6iv/h14stCjgHQfjmQsBojjCZJeTVat47jafAPrWnHn0nNv
	9VQJE08OozbXuV17c1lSDuiwK1KyzPBXMsXyYk79hDkK+6fFJRf2dJExjmFj8b4zARf/F2qLpGI
	PA2SDptO5PNCQ4j+7W2vsHQ9IMJ+0h1S+TCqXXIlDiky5CzUU3N89C8FlXi3zV6lMw3HG3yeYXF
	IUODaIveQIAC5dlq0TTqX7ir0UtZnu4anuNpYQ+e2Z4feiA59mpB6b3fEagLOMNN9F0m7LMBfXI
	DLn9ccyutekWxzgCHBkVDhghMPN9tdJTL6II/n3+JpAcSBNw3WxXpogjJN8LLkrrz5Mf2q0w1Z6
	tmfpzZqgk6G9ENPR/c0BzlK21DMpQ9M11/9dbsDHLZr0PB7PxLXRdkqyDaVFHJFR7txky9/3apQ
	qZkCMRKoepUe+PPbxJbVOD8GkVgyDnxdsHbJPv1PFd
X-Received: by 2002:a05:690c:c94:b0:787:d0bc:e82c with SMTP id 00721157ae682-78fb4067c74mr306167447b3.59.1767114199168;
        Tue, 30 Dec 2025 09:03:19 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFNX1KqxaiFngcWtl2rE9smbHpsMlP3ol6V/sVoK/jXVUI2cxVnHcU3w4KavxAo5XeP7fKP/A==
X-Received: by 2002:a05:690c:c94:b0:787:d0bc:e82c with SMTP id 00721157ae682-78fb4067c74mr306167237b3.59.1767114198798;
        Tue, 30 Dec 2025 09:03:18 -0800 (PST)
Received: from shalem.localdomain (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037a5bdb9sm3776086266b.7.2025.12.30.09.03.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 09:03:18 -0800 (PST)
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
Date: Tue, 30 Dec 2025 18:03:02 +0100
Subject: [PATCH v5 05/14] media: mt9m114: Tweak default hblank and vblank
 for more accurate fps
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251230-mt9m114-atomisp-v5-5-763539e76094@oss.qualcomm.com>
References: <20251230-mt9m114-atomisp-v5-0-763539e76094@oss.qualcomm.com>
In-Reply-To: <20251230-mt9m114-atomisp-v5-0-763539e76094@oss.qualcomm.com>
To: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Hans de Goede <johannes.goede@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=dfONHHXe c=1 sm=1 tr=0 ts=695405d7 cx=c_pps
 a=NMvoxGxYzVyQPkMeJjVPKg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=P1BnusSwAAAA:8 a=EUspDBNiAAAA:8 a=ukL-QT8NHvV3VPxu6cQA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=kLokIza1BN8a-hAJ3hfR:22 a=D0XLA9XvdZm18NrgonBM:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMwMDE1MyBTYWx0ZWRfX0hUQhcakNEYQ
 VX7rJpKLDo3YLjA2vNvyHb7/9dVgkdrt8a+yEcrP/UeK3uOjNS0aC1nI/drGUqBA8NC1MxXEFp/
 PugvEA9MQcJ4I04b+ZsSk4Jm/0AgcLvwN4WoO7ImDJo3lk4c5/z4T+nRtADDZ9BhU9S3pYHwA76
 a5ZqnWKpf3a+5G0yNH2FCaYDRojgUN4etC3yYfhD22nz37dT+93zb0E+4MwDSw519Z0EQxYyVjb
 yCevBhjl/Gnx5QSZ8r8+802GhmSnsEQNQu8i6QHFB2D2exnU8zZmSyDgIBVbz3rqw135u/AKvL/
 cCmCQJiELnvh2VWaTOZDOGaODeT4JEd5WcCjfvAmfBtJfre+BtLCsrJ6cQhIiuskemxrVG0X03W
 EHYTNG7boyG8L+7m6C6RsAcazOHhUiS7rdYIOAEfTkW70VeYUCDfQgZGTPTUtz9Pq3um4dEjOUD
 E9ks6Y/B6ijb604foTA==
X-Proofpoint-GUID: _6VvddWCTzScTZytWN6HT8tX0qjRoUNg
X-Proofpoint-ORIG-GUID: _6VvddWCTzScTZytWN6HT8tX0qjRoUNg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-30_02,2025-12-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 clxscore=1015 phishscore=0 malwarescore=0
 suspectscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512300153

The PLL gets programmed to achieve a 48 MHz pixelclock, with the current
vblank + hblank defaults this results in a fps of:

48000000 / ((1296 + 307) * (976 + 23) = 29.974 fps

Tweak the defaults to get closer to 30 fps:

48000000 / ((1296 + 308) * (976 + 21) = 30.015 fps

This improves things from being 0.026 fps too low to 0.015 fps too high.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
---
 drivers/media/i2c/mt9m114.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/mt9m114.c b/drivers/media/i2c/mt9m114.c
index 3cb00e69623fa422bdecbe3eb36f911d92405341..b588b9d013ca8b41f9827cd12c0fcf56bb34bc38 100644
--- a/drivers/media/i2c/mt9m114.c
+++ b/drivers/media/i2c/mt9m114.c
@@ -337,8 +337,8 @@
  */
 #define MT9M114_MIN_HBLANK				303
 #define MT9M114_MIN_VBLANK				21
-#define MT9M114_DEF_HBLANK				307
-#define MT9M114_DEF_VBLANK				23
+#define MT9M114_DEF_HBLANK				308
+#define MT9M114_DEF_VBLANK				21
 
 #define MT9M114_DEF_FRAME_RATE				30
 #define MT9M114_MAX_FRAME_RATE				120

-- 
2.52.0


