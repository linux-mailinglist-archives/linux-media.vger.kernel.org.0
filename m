Return-Path: <linux-media+bounces-51034-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id AB140D3A490
	for <lists+linux-media@lfdr.de>; Mon, 19 Jan 2026 11:16:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8B9B330339B2
	for <lists+linux-media@lfdr.de>; Mon, 19 Jan 2026 10:15:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 615752C0F96;
	Mon, 19 Jan 2026 10:15:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BYovHbk5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RFIYC03j"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D58B628CF77
	for <linux-media@vger.kernel.org>; Mon, 19 Jan 2026 10:15:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768817716; cv=none; b=g3yVLFg+LQ0XxPE0zjo3vnlvTG033L8Nu9AlupoRzoNb1/gK3Rvgc5Po5dCEmezNUYuHX3GeDdZAgYsiVmcHha93rSqALRPSR5sKYnmzGzwk6xc1HLAaS2WDKixRy1Lw16KwUCdaQFgs1eGOvp6q/BY6+iJNJniLzseatolTCVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768817716; c=relaxed/simple;
	bh=y+WcPq60gpKxYT213F0gMdG4bUglYphHIIxR+4d15oY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=L8Gr2JNLiIHPRmg0+FXhW1v8HpuZpdlr2pbF8vaFgj5dFZQQkJOpqGcNB4Gm92cHxXiTD+jcTuPLzL8AeoYQlByPNzPeujqVsMUuvVrvO45Yh/zr7sy3KjshK3kVyyRvFTYiVc9C/qSt2wmT10JcHLPn0Iq0WXWFOVik6ME/yqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BYovHbk5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RFIYC03j; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60J91Cm71470389
	for <linux-media@vger.kernel.org>; Mon, 19 Jan 2026 10:15:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qBlLyCTJ6WGwB2t5u9TBa0QEboxprrkOhe6UCc6dRN8=; b=BYovHbk5HfmWZWA1
	T4SsRNkqzRKEZ77jcwhuXTHyvvJRr5Pr0KZjPOK/2AxDlhGWF9JJu3aywgo9ijFA
	aeZiZfn43fZmN3c2mr2zxW+ChJTKGK9PREjaxGKLqYa8Uk84HeO6C6S1GVSRiiz/
	OUow07S9FqI25USSLoSyaGxJGh6V2aL3UvaT/vsRKQS1HAs07zrmpq73hJGCPPwC
	LwlRAOt3YtLHT2W3r8aGTZYJ5tzsBh25s/qPn6dUV+tDsgZq1K3tSnPErrMCN6bG
	4waRNQ4EMhmLVRKEaeDi5hyxT1lakk2VDkv58RTPVADK8LQWiS3y4hQm+VJzS0Ma
	G+tMaw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4br2gumrhg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 19 Jan 2026 10:15:12 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-501454cedcbso70914681cf.1
        for <linux-media@vger.kernel.org>; Mon, 19 Jan 2026 02:15:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768817712; x=1769422512; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qBlLyCTJ6WGwB2t5u9TBa0QEboxprrkOhe6UCc6dRN8=;
        b=RFIYC03j1N1a5PEi1Dpuq69dE17IbnX19oMmndv/ux/XXFC1raDQ3ZmfJrNbRdTXc0
         twR2tuehnEWZcXZSpw+pw3l60FEP++zRIKDM1gxsv+kBgHFz4FPP9OZC4XD7XHGhgk3y
         BDsAK7HajnjhV8jNx67ZsKM3Sn4aKUOKlgjRjwuFRiQE6klm6Pl7mneGEUsrxjU3j6mE
         pD0TeNG/+zoV/i7NK3e4pNoLmW3iM+hQNF/ezxZLV48Nv5V2V0lNM2NhOwbutyQAV/sG
         C4TpKyVMhKf1sfb14N9GZcRfOS7m9rYoOWIzo/d3PR8OpcixoCmZTf2jJCEpaaX59bk1
         +wwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768817712; x=1769422512;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qBlLyCTJ6WGwB2t5u9TBa0QEboxprrkOhe6UCc6dRN8=;
        b=NP/s7icX9lfo6SBfuMdhJ+cud96Ez3DtckVvBP33BJokW2hK82c2l6gVPrQHt+n6eB
         DEl/7h4V3L5zbff24h92VVvhUll/9GrgFFcFfEpm5QEKUS/jERGG0PF5YJas0NXds/vY
         HEPIATCBauQvyZuBzJaOuieXJhiKUXHRblKvjgeADEJny3QhWWRuTow93lurtNhYTc1j
         /ULcjWvBS7GZH8SYLrqMRhGRVSOKmNSe9Gf4JRzt0buq+IivMfmHFxx/N7OB0Kg7qxAB
         D5thQ01fhSSqtqSt+Jr1sBgfjJNOfpor/P5rQaI++QQ1wQYMF1EzHqrdey2pRfdqnngE
         KR+g==
X-Gm-Message-State: AOJu0Yyq+Ly4pfz8lBDFFefKVMd3WkwqBqtwmc+Jdm++gbtzuC7v37Du
	kRjfV/c8GxCyb+OHiyH9se1e56xIcGMl41tmOARAxBACr+m84+q5Y0TV4GAhS/F4tpilpWNzRRA
	dxY5ANVpGSkwfyz5DOA4uZov1266fnib9Be6fWGnLAwQznZYUkmV4qleE4kQIaHde6w==
X-Gm-Gg: AY/fxX69a4wA0puwF0Trmx+Ur9F6xJLNJEdwOqcTBilH8bFv2C5AaTYnfNjySyZZJnt
	ZuAbSIb0927H56h12WgDB2UBCEKNx6DkHt+rg27anGL8QaeIXva56aPTNVrLun5Z3Gn/XOYXTC4
	Iesp90snLcQffb0lne5PUycFxqvZRf2GEH4MVoRi/FFtN3IgwjBMNk3apj8aunAbgMx4NQ0thxL
	I80NPsDzyy6WW22u4qtsln54DfnSZYSusFPV89r80lV6u9YhoFt9w/R5B7xx6ZV/KGBtaJxOerz
	3Zj3wW2uJAUNyInPxQloFwQchnyZdJU2PgtbHz/vtPTPCCrMwyqv3e+OzElcBs5iQDN7/lx2rGZ
	6ngpqEkMUBBB3a7ETHudlMw9Sd5DTgZ+c0TC8mmRLXKlDm5Oz+6vvA9o1H+eqFiICSnIoFeylnP
	Ej
X-Received: by 2002:a05:622a:6207:b0:502:9e5b:2d83 with SMTP id d75a77b69052e-502c495f44cmr26573591cf.75.1768817712016;
        Mon, 19 Jan 2026 02:15:12 -0800 (PST)
X-Received: by 2002:a05:622a:6207:b0:502:9e5b:2d83 with SMTP id d75a77b69052e-502c495f44cmr26573461cf.75.1768817711592;
        Mon, 19 Jan 2026 02:15:11 -0800 (PST)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8942e6d8640sm77208166d6.50.2026.01.19.02.15.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 02:15:11 -0800 (PST)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Mon, 19 Jan 2026 18:15:02 +0800
Subject: [PATCH v3 2/2] media: i2c: imx412: Extend the power-on waiting
 time
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260119-imx412-v3-2-8b46929af773@oss.qualcomm.com>
References: <20260119-imx412-v3-0-8b46929af773@oss.qualcomm.com>
In-Reply-To: <20260119-imx412-v3-0-8b46929af773@oss.qualcomm.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768817703; l=789;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=y+WcPq60gpKxYT213F0gMdG4bUglYphHIIxR+4d15oY=;
 b=WWspEKYqgtiCH+aFemziMB4S2+AybXVWrdB7LpnT2DnC7KR5K2CnvNLjSUErZSZeMFlWqAdza
 PHUFvbEijtkBwLZCvpJ952QsrHdNnK8WWXedDw0Se848UBr1SzUWSdU
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDA4NCBTYWx0ZWRfX+2COr9CoBEwj
 YJHshXfaoN0JFCrbCWQjDseDc18tWnQdGPHDtq81c4rMv11VRm7K1D2BRpDqqKBJDUqKW/Oh80e
 x5qbxX/OhgPn6ZcS7Yf6AR3wQ7Nkjbqfui30gnIzgLzvklJE8tOr1SdRpYcfC2TKBWM+M0fEcwY
 orR/JwOYTpR1eFIHFAiwos/Wloz204maa1FM2436YxduSX81BgMJOrokbwBAhvxAw9fZiu/p1fl
 aG/v4Mw7xxN4WXguww72LDRqy4xlrrSaYVmG9Of7JPxIK7Wg7Q4kTvmLhpwsRTxzLEvyWwcth2m
 Brjm6hmUwYbtwu+gU6T9sSEBsoIM6n5Rrag6Ffr34eQ/weDeyvjM0xaP7Dixf9c4ye89lzAYGwi
 FMCKOFZpxffO76WkyTzy1oEg/hzjIdyHWn1UdeyMp6Fivj3j2eNYoXRRoz0rykZqRekkbsjMGdE
 pOEuZuXSn79p8h6YINA==
X-Authority-Analysis: v=2.4 cv=Sev6t/Ru c=1 sm=1 tr=0 ts=696e0430 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=r8GCDS4tHU10FJMKL5oA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: 0yBqrqW4cHNZAbpqEevTmNiALSjzBbwR
X-Proofpoint-ORIG-GUID: 0yBqrqW4cHNZAbpqEevTmNiALSjzBbwR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-19_02,2026-01-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 impostorscore=0 spamscore=0 bulkscore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601190084

The Arducam IMX577 module requires a longer reset time than the 1000µs
configured in the current driver. Increase the wait time after power-on
to ensure proper initialization.

Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
 drivers/media/i2c/imx412.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/imx412.c b/drivers/media/i2c/imx412.c
index ebc2fb706442365f541540bf4ce9d307d42e0061..23a418edfeac067fc347e18c868396e20ece6b12 100644
--- a/drivers/media/i2c/imx412.c
+++ b/drivers/media/i2c/imx412.c
@@ -1039,7 +1039,7 @@ static int imx412_power_on(struct device *dev)
 
 	gpiod_set_value_cansleep(imx412->reset_gpio, 0);
 
-	usleep_range(1000, 1200);
+	usleep_range(10000, 12000);
 
 	return 0;
 

-- 
2.34.1


