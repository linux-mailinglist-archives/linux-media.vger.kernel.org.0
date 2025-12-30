Return-Path: <linux-media+bounces-49750-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EFA5BCEA421
	for <lists+linux-media@lfdr.de>; Tue, 30 Dec 2025 18:05:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 57599304ED82
	for <lists+linux-media@lfdr.de>; Tue, 30 Dec 2025 17:03:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B980032B9B8;
	Tue, 30 Dec 2025 17:03:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ocJFSuld";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XVMWAFAX"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF99A2BE643
	for <linux-media@vger.kernel.org>; Tue, 30 Dec 2025 17:03:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767114204; cv=none; b=O5R805v8mxIpiMZ62+wD0egEmZNfeDi6iCrwOWLXVtJxA2F2FwLTgYaGY0n3q8Y0P1BRAyG5ufMK+J0ekvqSGM1wtMR7Pn4YOIiRJuygQJCrIBEPTY4DOlJCKIZHnfdxDg5aRjLF70i1ZFuzQnYwvL4fT4TC5jxq/+IXSCZSadU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767114204; c=relaxed/simple;
	bh=oRoX+ocgY2ZJk0eMZLmvNe0H9UR7k+ajAbrbWiFx7jQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RyA+FBaRjTyRSwXTmNuVmdsuYibIXVUJFjLizrwKWT8CQovFiosxVzWuMFjR436R2K8SyxLVEaDcZHiYbI6AYYnrytc8HzANRfF9F9FZw3k4rct38LRwpGcTv+yHUb3PFFdDAG06HB0u8Bg/7heTpgIAd7rsA+LkSEwbeGKVBJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ocJFSuld; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XVMWAFAX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BUB8nmu3971227
	for <linux-media@vger.kernel.org>; Tue, 30 Dec 2025 17:03:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wk025GDXXAr/o7mPieZPCl9bZ1YZurn1P9JWynn93R4=; b=ocJFSuldNg80yyh+
	I1q1nyPSSUkztyKeX1khtoJJ5ndSMnDQwxuqkt1BkXihd83i0b6Q7b7cmzKv+3iv
	eurr065wP7vojgepnoJhbah+vvj3Dl8xmerVzonAJ7lvs0O1FLFPTbrvs/+a+g0W
	YzqDKWO9sOuIf5jW9jMk91XMyBKpYFyR/85bNUmhd36VpbvGenUQWFMoAx/RRkCb
	NXiu4WzL6zQNbD+itwTGymTHr+HA8BxMPaZznxO/BsDGMc+Yf/wS2Z17fKPuZpVk
	asej53zdEya+goXoH2PqKusfesZ0nkot9+nAWjgtCH5mCIhZP9aOOiCc/LCJ3WpG
	Y+70Cw==
Received: from mail-yx1-f69.google.com (mail-yx1-f69.google.com [74.125.224.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bcdky0t6s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 30 Dec 2025 17:03:22 +0000 (GMT)
Received: by mail-yx1-f69.google.com with SMTP id 956f58d0204a3-644790187b7so13749263d50.1
        for <linux-media@vger.kernel.org>; Tue, 30 Dec 2025 09:03:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767114201; x=1767719001; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wk025GDXXAr/o7mPieZPCl9bZ1YZurn1P9JWynn93R4=;
        b=XVMWAFAXxYIYVG8AiV43AnMBm1QMq7tsaLs1XZHV+x+hh+z3lM94oU5d9T+G8bASZh
         MpnUIrUQcQoM3XDZtJ0t/Acg94/WF3XznfwS69IYJ1gVyP/ahPVsOVWv/TcvT3ht/dLg
         ruk9AjOSYjZg2U7uguyKR/8oxLy1ivX3NmXbcB5RtaKWAJekXtDzPrq2bnGBlMWOC8HS
         7nbq2lEOD6jw+yedBNIh72e7Sji3xJdW9uakM41286URftd6yi2YreXXoaS3+tfAx1q2
         Z7Iz+VAYrY/LDqP8WX3fm5Ov1fG5Av7LPPXjGGNEUnkqh3wCiR5MxzDcWJzVpvKviHgj
         WCig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767114201; x=1767719001;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wk025GDXXAr/o7mPieZPCl9bZ1YZurn1P9JWynn93R4=;
        b=mt9AMyAu6sOVsxZPMcLPSHi2NcAKHm7N2gugJyBFJYOmcdC4SgkXGIGUJYWcXb0RGB
         wrRrhwKa8FL77+tEgE7OrN+wXfjxUZAzxKnUNpVtpLy8Bw1BDGHYTbkNQ1C+MPjuNMmU
         jEnlK4dIg87RuwhHFbtYHz4veoow6Q6i0pb7h3ttXr2RVwPQg4geA91msSu3JYBvNCZA
         0X7UlUHFz3Xp+tJCmsrkzQ6XBC1sEF5DkrHpX1kGpB6kw+Z/aeGUwT16lnrM6EtMfVxL
         F+cVy4rDRMtUIBtmQNTS04pDmH7Fty6qv90YRpN54M30ixoEwHPcJcJ8O0t0dkhUNTh8
         ncAw==
X-Gm-Message-State: AOJu0YyTg/6zx1EazeJYs4WLFuigLz7Bdbwd550YZ848VzaQuEiV9YNq
	Ccy3oy4lcxJ19lJlB60r9yrr2BpjFUB6WegUtjBkprBqlHyLLuR1F2XgVyqoTUQ3Kn5IpkxJKYP
	e2DvEwYEjEYD+qN7n24+g4VyS7QQu8qhRLGnOVkjqjb9/FSIiGZ1+QIawZmfQzc6wIg==
X-Gm-Gg: AY/fxX5ZxAP/TYhN79nYGlO+F0zlJZhf1Hf0v2354oYtPnhq6lt2GQ836SYuJ3Kp1Zm
	oMN+uFlmSaxKKWwE15UPDyOnyrcdm4EUSMpExovj71CX/mnN2CxNWfLL2X4sZ94uMaRAjyJApGk
	8FaU3AmlLHyCM4iYvhZcVLTrexe5x+sco5amArMI+y1T0oK8skHwUyC+DZnYRCJgZcFWU+pAsoT
	53xLLQ5yT/XZ1gaLPvxyQbuOHGF0QxHxdmIWi5JF//LYpwXqQNWz4AmeswQsFWq1HQmWI7/PcoU
	2NaVdVGZdakvjxhCcH/PVf1AL3d2BP7k9cHwvuQ7c9XizJX2lP7BFrCdEUNLXhSzAbW6ec6uOgJ
	MUszas0ir59ieDt5JDPuuiaC46PcfKyn/taeUPsUh8qPoFP6CAKFH47czcF5RKnQs3DooVzqNd3
	lwR0WYXgXtns1K2aR+QlBILg34z8kcURSxsXyxQEHc
X-Received: by 2002:a05:690e:1882:b0:646:7ae4:11e7 with SMTP id 956f58d0204a3-6467ae4196dmr19976129d50.14.1767114201364;
        Tue, 30 Dec 2025 09:03:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFYj0u9YMO26hwabawdbKgl+y19XUwwFtwBt46iDjvzgtgKIEshmJu/7s8jPc1ZsXfG5TMdzg==
X-Received: by 2002:a05:690e:1882:b0:646:7ae4:11e7 with SMTP id 956f58d0204a3-6467ae4196dmr19976093d50.14.1767114200846;
        Tue, 30 Dec 2025 09:03:20 -0800 (PST)
Received: from shalem.localdomain (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037a5bdb9sm3776086266b.7.2025.12.30.09.03.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 09:03:20 -0800 (PST)
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
Date: Tue, 30 Dec 2025 18:03:04 +0100
Subject: [PATCH v5 07/14] media: mt9m114: Put sensor in reset on power down
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251230-mt9m114-atomisp-v5-7-763539e76094@oss.qualcomm.com>
References: <20251230-mt9m114-atomisp-v5-0-763539e76094@oss.qualcomm.com>
In-Reply-To: <20251230-mt9m114-atomisp-v5-0-763539e76094@oss.qualcomm.com>
To: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Hans de Goede <johannes.goede@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMwMDE1MyBTYWx0ZWRfXwMFXLR9/D4R7
 7GKMhmVWY6jLnQc8jAWP4Ud7D+da76+OgC7yEqzZu+zgjSZi4+Xgn4yqrlvPzdE7fTw1hs6W98M
 TxwK+7sdYC0bTB2UUmoXyZKeh1Q9Zj1MV/wK59YsJAjhXlq/CSv0xCWM87i252EOEb/E7CGkC9O
 ZXWcc/rrszJ+Q0dGARYENPrXgoiBJCAUNFe8xQHfPVikL7H66whIKS9lHUotL1PPhS2k2I8Angx
 sxSgCzarg7GONMUMlxwKh6hdWWnvAeZ6CLLlPLtAi6f8GiM1X61porDftRnL4mDC8LqBPeTovhn
 3RbS9Z1aX/PH5BWjpcWw+ISeSd2V6eFbJzIY/E2ZYwCNUPVnlmXx+9jiLAzOXBmYL4R58u7UXKH
 Xw25IgjuDHYQdvXB0qAH4+6N97d1miutnSaJR5OLah2rrEDA2QBIyiIxw/ksAtxxBHidT8E8yaU
 W5hOu/oIvpmWEYL5Ztw==
X-Authority-Analysis: v=2.4 cv=Wskm8Nfv c=1 sm=1 tr=0 ts=695405da cx=c_pps
 a=J+5FMm3BkXb42VdG8aMU9w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=P1BnusSwAAAA:8 a=EUspDBNiAAAA:8 a=8zVg_k_I0LZdQ-rHxRQA:9 a=QEXdDO2ut3YA:10
 a=Epx66wHExT0cjJnnR-oj:22 a=D0XLA9XvdZm18NrgonBM:22
X-Proofpoint-GUID: 11Un140IT3vFJ5TzHxQpUP-_DCqRGMyP
X-Proofpoint-ORIG-GUID: 11Un140IT3vFJ5TzHxQpUP-_DCqRGMyP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-30_02,2025-12-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 clxscore=1015 adultscore=0 bulkscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512300153

Put the sensor back in reset on power down. Putting the sensor in reset
reduces power-consumption by putting all the data / ctrl pins in High-Z
mode. This helps save power on designs where the regulators may need to
stay on while the sensor is powered down.

This also ensures that the sensor is properly reset on power up,
since now the sensor will see a reset high to low transition after
the regulators have been turned on.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
---
Changes in v3:
- Improve commit message

Changes in v2
- After setting reset high wait 20 clk cycles before disabling
  the clk and regulators
---
 drivers/media/i2c/mt9m114.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/media/i2c/mt9m114.c b/drivers/media/i2c/mt9m114.c
index 8cabe04a1a64619c97edbaba09e6286b1a514604..948074e976bb124470d6a8677a24e096c3033f71 100644
--- a/drivers/media/i2c/mt9m114.c
+++ b/drivers/media/i2c/mt9m114.c
@@ -2228,6 +2228,13 @@ static int mt9m114_power_on(struct mt9m114 *sensor)
 
 static void mt9m114_power_off(struct mt9m114 *sensor)
 {
+	unsigned int duration;
+
+	gpiod_set_value(sensor->reset, 1);
+	/* Power off takes 10 clock cycles. Double it to be safe. */
+	duration = DIV_ROUND_UP(2 * 10 * 1000000, clk_get_rate(sensor->clk));
+	fsleep(duration);
+
 	clk_disable_unprepare(sensor->clk);
 	regulator_bulk_disable(ARRAY_SIZE(sensor->supplies), sensor->supplies);
 }

-- 
2.52.0


