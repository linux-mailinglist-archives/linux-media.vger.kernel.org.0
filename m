Return-Path: <linux-media+bounces-49469-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D2F4CDC364
	for <lists+linux-media@lfdr.de>; Wed, 24 Dec 2025 13:33:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0D4B130813EE
	for <lists+linux-media@lfdr.de>; Wed, 24 Dec 2025 12:31:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 288C1304BBF;
	Wed, 24 Dec 2025 12:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aJOLPXQa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hQiXfUbm"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 931A430E822
	for <linux-media@vger.kernel.org>; Wed, 24 Dec 2025 12:31:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766579482; cv=none; b=INP1r0nchw6Sq2F+5bLzw8LsI/2GuYGtgG3ffjnGvNzxLwgMHtZzbXF+tTFHphcywPyGRjNfpC1VKGnydfac6CYJUhtplzqkQvcRctJAdOH+xir/8L80eaFHJN5Ul3PTLj1RrJsH0nBLiEY1NbJhINifNdTqxh1TMaNsOiuD9og=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766579482; c=relaxed/simple;
	bh=uqO73ZGWqzC565cWgKi2KPT/lWMs6NNQozMKSSDkSCc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AXCAlX09pfqOWAxqHnZj9MQK5t9a/Olbl/8G7K0K0Nk3ROblfADUZak2BE/+xQecNKyHZuBhWy2RSkap/3JGi6lqQjZ0Sh24TDWX6OnG0vFY2L7jF6xCfqqhnLqUYue7vrRrrD1qnp/QIz3L4Ty5S8M5IAcvvDnYXkkYti0VT2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aJOLPXQa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hQiXfUbm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BOAcAUs1598496
	for <linux-media@vger.kernel.org>; Wed, 24 Dec 2025 12:31:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gcszAlWNg2oajBi3uVozzWktKmaDL87ZWZrjHRl4rVU=; b=aJOLPXQaznnS8tA9
	0nz/kJgg+cZymdUMuWgIWVSgpV6SGGTuO5QdtvYm0INungIlf3etuluUas26FZ1v
	lz+x/At8me0kN35iHslzqKwgNBQS9o2HJpvrPys9HxXcmwaABd+ypl4Hqc3Nfx9Q
	9BDAX/X0xmuA/317ij2/lOKdMIXPccrpg4R686f3EHnhFAbIpresgmMVFsdIM8ki
	foZPPgF+1AlMnpDp0GGz9mdVKZEtWrdrUkQJTO0+hntYp7Z1jmlx0ERwggnkPwE+
	9nv0oZrcuO7KjI5AD1FL2zvlzwFwc5Sw7bBuS2rCU8MIzSBQTDXnV7QamU7qAPOl
	I4X1mw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b8683hjvw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 24 Dec 2025 12:31:19 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4f1d7ac8339so198195991cf.2
        for <linux-media@vger.kernel.org>; Wed, 24 Dec 2025 04:31:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766579478; x=1767184278; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gcszAlWNg2oajBi3uVozzWktKmaDL87ZWZrjHRl4rVU=;
        b=hQiXfUbmvlwMUvzZi9k7+JlNM3nIIyXv7jXSpYMVdKL+FezDmKFG3gx0S+XhSQKjmG
         qNcyN1RkgWEJXDTk/BtrcHZQ5xBiAaGr/2p6/MTWaSBq1FxTs8Y1uCSccNqO3UQsFpMp
         8f+7U+PCOW3qXCtRKDjT1BSDVqYAGVeFywsvgIy6QWi5jnVbAjm0k12128dV+sP81X54
         p3j/kvWlMd/yXHi+boxf9xwptCSY6vIPqfGMOWK/9ug32bLGOnX3ccU3EenE1PDMLxL4
         zuFUNaTxVXfQ0D+ZYDbShU7mqQMpSf+QVIKR008likYuTUcb1TbVHs5/hUgIrGJ/XU9w
         fKwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766579478; x=1767184278;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gcszAlWNg2oajBi3uVozzWktKmaDL87ZWZrjHRl4rVU=;
        b=pazueYF62biAXu9HSQ10bIUFI/rEcEinOqzvQxJCZlBS19S0S0bISHLOJa9ZZAONkX
         z9FWoiWLCapWH2O6supdceheMu+UmUyCFIKymWiQvjbBHKSd27oLNoVNN8veomB+Jfk9
         7i8GEXFwdUTkAEWAsyuUkr3GoYrNd9dkPnvDkvEIslLRud8JXKChmeW1KnI/nuQCFgRa
         3ToYWokIlqW/2NIMPM9Tx1mX64tmpM4uMOJ1UTlc3FZa26C453zmfc0m73fuCDnw8PJR
         nkFCJfDSz5JBdjCPWajNfPW9591WDZkYcIX2jv4hBJUnCOqf4wLpYX24QHMLQNrOIjtD
         cXDQ==
X-Gm-Message-State: AOJu0YyQfycbCBwDFWQf4XbmeGUXBKMXKatf58zjeifpNp78gbgqOI12
	xa4QJuPg0+ckj6rhPEWIQOFr9t88No3VHclhIszxTLJZXERrJ+ddm5lmweePTCBAM6P/IDk2VFc
	yEMC7avgJ2IIwp+il5ZSsbwLLnL1PA9nXmp6v7osy/e6j3l4f9/zPtqfkiBCWLFMPYyta+2sUMA
	==
X-Gm-Gg: AY/fxX6OjvwYqsyyX8ENiEwxfGDPaVvjvKmZ/s22m7S3FWJxyQUXuriHW4Oqig1LpTr
	rqbSJbpkm4GGPZLyen0fdEpL7XQ8CTL5mb/MM+BLiKSBFCo1pGmsTaMqJP3NTkhmfjGcWKZEsn6
	WkTKGOGCes3k6vIOXy5oggS9LdIUCuDEl1qLWl9zHIV7gDDY3zvL+z6q2cIc3x3ctJ5fBLY/Fjh
	AAtzGOS6uSBYH4+sLeZppCN+ACc6QzrQfcdgo/zqQjG4msbdg1/DvasyC2a4tXUurvRFNtWvHLO
	VVMPLBAP/WoLEFMkj/aW8iIx8m4drdqoNuc3cM9NCjr0YSn7FtaYTSImYBb70QTTHv8MGZEBYGd
	DvIbTFqyAgHjZajHLjXgWA8yLOWXLyGN7CvO0D12ytBzU6waLudobd66L/KvQZgrR75OomXp6gn
	iThOahHSpcELHHWKcCpOefowpeIX767k9OBTVluAH+
X-Received: by 2002:a05:622a:4106:b0:4ee:1913:9616 with SMTP id d75a77b69052e-4f4abd6e3camr274204121cf.51.1766579478364;
        Wed, 24 Dec 2025 04:31:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH1kke9MZ8as/ZFSCGVjzCSIL3m4LQO+hjMndFmOH9EQEu0hc7VGZWNWpxiaGSc9Nne0Wkmpg==
X-Received: by 2002:a05:622a:4106:b0:4ee:1913:9616 with SMTP id d75a77b69052e-4f4abd6e3camr274203661cf.51.1766579477861;
        Wed, 24 Dec 2025 04:31:17 -0800 (PST)
Received: from shalem.localdomain (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f0b12dsm1750304066b.48.2025.12.24.04.31.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 04:31:17 -0800 (PST)
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
Date: Wed, 24 Dec 2025 13:31:13 +0100
Subject: [PATCH v4 04/15] media: mt9m114: Lower minimum vblank value
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251224-mt9m114-atomisp-v4-4-60b25da7a1bc@oss.qualcomm.com>
References: <20251224-mt9m114-atomisp-v4-0-60b25da7a1bc@oss.qualcomm.com>
In-Reply-To: <20251224-mt9m114-atomisp-v4-0-60b25da7a1bc@oss.qualcomm.com>
To: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Hans de Goede <johannes.goede@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: C3sDaB_r1loYs3NrC3jEyacclk0I-RkR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDEwOSBTYWx0ZWRfX1FYhALEIsaQL
 XqIjNAaB4WXiZdG4Rwalt4buagqaZWb9Tp8DqJRQIN0b9J0Z9fHNv4SDFBTOQNDAGpu+Dcx5ym4
 PCfnaFn5ae1cFkgA6L9DsKER6n8cUh9NZVshJO+dUwh/+ZspI+iSE8lU1DUIcc8V45nSVtFvAtF
 2CQYApKe5jjk5VCa6zh0MdTLOTXi8kOQVgkJDR/WpHzmivHf+AD7akVAh2MOVB33IAkxZhgu8xm
 TirFSy8nPSAI/O5W1vciBm5/DXfh/A4JHHqObslaRHQw6WElgCHSr5A29+8CY53mkoyeoppUVFv
 7U0CrRTl5r2KN0s934dQgluLT2k6g0qK/Pns0Su+w4SZOAogc55NtrEUUTPeIQUG1bVfgnZ7w4S
 NpmXRVrO2XGIVN9U3xKbjXYCvBzDlrTZ8FwqQFsLoWo5YYDRW0gXBA72BL9oFweTjFoCYaUIYxf
 ty2m63yraOU5hFQrLew==
X-Authority-Analysis: v=2.4 cv=HqV72kTS c=1 sm=1 tr=0 ts=694bdd17 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=P1BnusSwAAAA:8 a=EUspDBNiAAAA:8 a=qoDHQqv3VgfKNNLz41EA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=D0XLA9XvdZm18NrgonBM:22
X-Proofpoint-ORIG-GUID: C3sDaB_r1loYs3NrC3jEyacclk0I-RkR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_03,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512240109

As the comment above the defines says, the minimum values are undocumented
so the lowest values seen in register lists are used.

The version of the mt9m114 driver shipped together with the atomisp code
uses 21 for vblank in its register lists, lower MT9M114_MIN_VBLANK
accordingly.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
---
 drivers/media/i2c/mt9m114.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/mt9m114.c b/drivers/media/i2c/mt9m114.c
index d1635f49ee047ca696f6053f6c17e30d736ab795..f63ab4bd040a4a62833d8bc716f94fc29aa03bd7 100644
--- a/drivers/media/i2c/mt9m114.c
+++ b/drivers/media/i2c/mt9m114.c
@@ -329,13 +329,13 @@
 
 /*
  * The minimum amount of horizontal and vertical blanking is undocumented. The
- * minimum values that have been seen in register lists are 303 and 38, use
+ * minimum values that have been seen in register lists are 303 and 21, use
  * them.
  *
  * Set the default to achieve 1280x960 at 30fps with a 48 MHz pixclock.
  */
 #define MT9M114_MIN_HBLANK				303
-#define MT9M114_MIN_VBLANK				38
+#define MT9M114_MIN_VBLANK				21
 #define MT9M114_DEF_HBLANK				323
 #define MT9M114_DEF_VBLANK				39
 

-- 
2.52.0


