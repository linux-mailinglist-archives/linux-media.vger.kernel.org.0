Return-Path: <linux-media+bounces-49749-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BCE5CEA41B
	for <lists+linux-media@lfdr.de>; Tue, 30 Dec 2025 18:05:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 04E78304C297
	for <lists+linux-media@lfdr.de>; Tue, 30 Dec 2025 17:03:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B30032B9A8;
	Tue, 30 Dec 2025 17:03:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="giGSEiNU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SMM7xsrM"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 299BD322C73
	for <linux-media@vger.kernel.org>; Tue, 30 Dec 2025 17:03:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767114204; cv=none; b=qgffEvbcO127B5qqML+XYgCuA2HTSrgf3OVC7REoEqQVaVlQXTrDtXBgfFzU9eWABpKotf5APLLCpP47bhsy7F9eof9dr7R3OsV3WB5KexxV7H8NplgqRgYvw3KI04sKnmbKlyaW5vJYOXC9rgkZs07bBu+1xwkDdnpQMbuwYhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767114204; c=relaxed/simple;
	bh=UCis1fko66KzZ+L6ClmuRfXXvUzWLabDwbCJizpiy08=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tQoWSMSfd/B7Paupx8NR5beLiHG9pZLFF766LFK/0VcA3N4u0/Y4f6LK5kqbzzGKquDaOosKgiwhZ3LjyFcNDDpv5i7sbTh7n15Nq3wW2rntiic8Jj49CWuGUXKLRECoUMBDTkPQLjGtzlVW1kH2hk9pFyGqpJ1P3Etbl4oJ0aw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=giGSEiNU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SMM7xsrM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BUE3nHU3555712
	for <linux-media@vger.kernel.org>; Tue, 30 Dec 2025 17:03:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HbwNW9LRtglxUm2Bf6AsaFVw+CZYAV4zcyYuRhRwcqE=; b=giGSEiNUXN0JMYFc
	Ns9879oE2yqNSLegG+qvWPad7zrwM2yn2V/6wHX2f/1RINQIi0Zpl6OBH1pgKgd+
	Xu+gJbkWhpvJ8UdRph7lUDus0a6bC48O61EIaanAejWihuiQ71nwzC9jBiX+ekvW
	xG2bl67NOoKfMVs12LQSWfZtArF/j5b4U2VEyOSqUSv2NeIvkqYuAVXxJos7tNWK
	9KqNaIPBbcsiV42xCd9+EOdgt809+GevlC4eywlNLMzyz2V0AE+JYAg+0LT4+N8x
	+D1FePyIU5jaUsWwqglss3Xbey9rzsuS3mfODtE8AxXWdGAoHVJUzd6SK4308erw
	y+sxoQ==
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com [209.85.128.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bc7461s3d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 30 Dec 2025 17:03:20 +0000 (GMT)
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-78f92e123f5so125113067b3.2
        for <linux-media@vger.kernel.org>; Tue, 30 Dec 2025 09:03:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767114200; x=1767719000; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HbwNW9LRtglxUm2Bf6AsaFVw+CZYAV4zcyYuRhRwcqE=;
        b=SMM7xsrMNx6l0O25amzYRiJUuHG7BDPpqEgaLT/Klfu11NTWK04xCf/rrXd3gmJ5D4
         UbwqQG4fteNIy7ZyIv4X+R4ljndWqVy+4oAMJ7njKoBcxMhZip6Sj7PMrktYpskj9dKS
         1kPch3NqUaQudlCJLHzj3jF0K0Xx4h77OA6WKlbDkCkoIv65Gvdkyp581gkXx9G7vGm2
         KZPhBs0ATNllGb8/agnu2Ac8i7fWr772NrLN2Qu45FArdPawsQJVGsYWb46oM5aKf9k1
         f5jiXCOlm/Ryqdt/WO5PtuKdm+bUSCnJa9vDOPDqSweTjOXXSHEbbiNdEqox/Jr4qMmA
         RudA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767114200; x=1767719000;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HbwNW9LRtglxUm2Bf6AsaFVw+CZYAV4zcyYuRhRwcqE=;
        b=UwjjiGro6I8CFEWEgLFI+GYFGGrrrcvgyMTs/XJsEvJlJbLGx/IYzNfxcpFqVmiyCH
         BAmW8WjVA2qi7+l+3S6bXguM2oeixFq5QEmX+2k98ktDV/kbKyeEO82i5Fn2CBbV9nFd
         AA0TrKvfosqjH6mLIIkCXMYlh3m6/jsxZpSzBp0YqMsf7SWbrB0Vg1Za01ix9+hmhSq0
         i1P25XM/QeaSuDen2p14+D1eIWKd1Ct7NoaNEtATcwYAtteqSqF4rxE+ICg/q0lK9LGy
         L++zSEFozPkPbexJ+e3l+NPq8Sp7bSLAzOyeNCrtJHOcrbMQU7APMalFpov6H6Nj3Ldn
         KdAw==
X-Gm-Message-State: AOJu0Yz8wr3Ye8ExWMcDB7eqQjulcqGeC+8iHNmeEaK3cNTRSRpTXctD
	fwDbvQp9/Dn43i/RuAm1JY0BQX090KwFnMuMjIp2KmFClFXK5/zRN3T0EoJJq+mTp7b2e7nmlpS
	D/Lle2+sqbqNDSv7vZ40AV0CkplZ8Ry9jG6rs/VXV/ip5+k057NUJ2xG1S6ZZ4nkG2Q==
X-Gm-Gg: AY/fxX5uyYjt+WdNNbel0q0KN/zpAdd9Gaxr2p/tmY96sqzOcOUcJfOY1BKhwzJCjy1
	2xdhD7Dhb1+p78UgcF0vomHxMLqxmNsxTab5vAFSwvjhTwhN15xhLbKuN0GMarkZA1mlJgvCaff
	2wqflYqmLJRPSFAyA1HirhiPMFhXyxOdXBCLY0qgnLV9euiZNhcpuIeEluAke5DKRM6hL+YXG29
	BczjiSNDLAwiGm/itSeIXQTLs+UrOEX2CD7B9rCe6o5SxTy6sNS5mUGq0eJ+zHDo5/7fsjNh35X
	dUnqPjUJkviRi5ZNVNC5aJ96KvfyDLP33HWGFt1Weyyi4YI+HjbxnyOCGv6Mq7rYqoJLSS2nhbK
	nC4qB8w/RiObC6apNK418iDG52guOBOQVo+aJbsOPfOUm0fNK1xdQrxdWED64BFUAECGnA/OTv2
	cpF8xx/Kuv6T/Ml5qskFmcIcNUUFTqt77gdOA0ffXW
X-Received: by 2002:a05:690c:9c0a:b0:78f:a872:fabc with SMTP id 00721157ae682-78fb3efa10amr317708547b3.11.1767114200236;
        Tue, 30 Dec 2025 09:03:20 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEl4lQHYh7DWs+x05wWfdtOKSLXV4LCN7QQWlMMcMXElXg0Bn0inderbFtuyFE61LHfQXIL9g==
X-Received: by 2002:a05:690c:9c0a:b0:78f:a872:fabc with SMTP id 00721157ae682-78fb3efa10amr317708227b3.11.1767114199801;
        Tue, 30 Dec 2025 09:03:19 -0800 (PST)
Received: from shalem.localdomain (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037a5bdb9sm3776086266b.7.2025.12.30.09.03.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 09:03:19 -0800 (PST)
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
Date: Tue, 30 Dec 2025 18:03:03 +0100
Subject: [PATCH v5 06/14] media: mt9m114: Avoid a reset low spike during
 probe()
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251230-mt9m114-atomisp-v5-6-763539e76094@oss.qualcomm.com>
References: <20251230-mt9m114-atomisp-v5-0-763539e76094@oss.qualcomm.com>
In-Reply-To: <20251230-mt9m114-atomisp-v5-0-763539e76094@oss.qualcomm.com>
To: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Hans de Goede <johannes.goede@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=Do9bOW/+ c=1 sm=1 tr=0 ts=695405d8 cx=c_pps
 a=72HoHk1woDtn7btP4rdmlg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=P1BnusSwAAAA:8 a=EUspDBNiAAAA:8 a=RFAlwJ6oiccnoQ4oFZsA:9 a=QEXdDO2ut3YA:10
 a=kA6IBgd4cpdPkAWqgNAz:22 a=D0XLA9XvdZm18NrgonBM:22
X-Proofpoint-GUID: HQ2n2RfR15bd_Qd57EGsX02Ra5AtsNf1
X-Proofpoint-ORIG-GUID: HQ2n2RfR15bd_Qd57EGsX02Ra5AtsNf1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMwMDE1MyBTYWx0ZWRfX9TkC3iQL5pzE
 OMOOy8JuNoIY5IIV5DyTWxjbG3xEo8aoM5WLHvJ5LsbyeUJBU4TkR3nqoq6IX8BffWLQVUjGylo
 Yg8vvvuuO4aAkg266dxk3y1moMOXLq9G7TNSPLaw8l2hImAGOtb6AYf5xnRIUJTlttDD+WlwFhE
 k+LA5e4aI5NyoST+WCzQ8wt8xLpjTTgVk6ikioovguvFb8QkWUcszg5/DNoSgALL9BVHfDdRSgj
 KdwXLRzQKcB4K+Dck09fL0kr+hI305Midg/4xiWMazOLB82wxZrk8TdmSCNbpWZiKTmrMgNZsxa
 4t35jqZrK5zn6NmAEMqwAArI2XxwphxBE6SAvWRrTncUR3XtkxgIjj6YelU5L87q+7KUxklVLqT
 tALvfEy53R25v+6Rg09wqNDp0nXmbOe9tdyXW3yOMrZu39m/PBuz85sRJe4kY2r7dsVuetwLDwY
 1NoypBsMbsylGMDz7sA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-30_02,2025-12-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 bulkscore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 malwarescore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512300153

mt9m114_probe() requests the reset GPIO in output low state:

	sensor->reset = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_LOW);

and then almost immediately afterwards calls mt9m114_power_on() which does:

		gpiod_set_value(sensor->reset, 1);
		fsleep(duration);
		gpiod_set_value(sensor->reset, 0);

which means that if the reset pin was high before this code runs that
it will very briefly be driven low because of passing GPIOD_OUT_LOW when
requesting the GPIO only to be driven high again possibly directly after
that. Such a very brief driving low of the reset pin may put the chip in
a confused state.

Request the GPIO in high (reset the chip) state instead to avoid this,
turning the initial gpiod_set_value() in mt9m114_power_on() into a no-op.
and the fsleep() ensures that it will stay high long enough to properly
reset the chip.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
---
 drivers/media/i2c/mt9m114.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/mt9m114.c b/drivers/media/i2c/mt9m114.c
index b588b9d013ca8b41f9827cd12c0fcf56bb34bc38..8cabe04a1a64619c97edbaba09e6286b1a514604 100644
--- a/drivers/media/i2c/mt9m114.c
+++ b/drivers/media/i2c/mt9m114.c
@@ -2467,7 +2467,7 @@ static int mt9m114_probe(struct i2c_client *client)
 		goto error_ep_free;
 	}
 
-	sensor->reset = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_LOW);
+	sensor->reset = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_HIGH);
 	if (IS_ERR(sensor->reset)) {
 		ret = PTR_ERR(sensor->reset);
 		dev_err_probe(dev, ret, "Failed to get reset GPIO\n");

-- 
2.52.0


