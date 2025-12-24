Return-Path: <linux-media+bounces-49476-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B12FCDC3A6
	for <lists+linux-media@lfdr.de>; Wed, 24 Dec 2025 13:37:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5652E30F03B3
	for <lists+linux-media@lfdr.de>; Wed, 24 Dec 2025 12:31:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B157337BAB;
	Wed, 24 Dec 2025 12:31:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VSxX6ete";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SL2+eCDr"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E4C633ADB4
	for <linux-media@vger.kernel.org>; Wed, 24 Dec 2025 12:31:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766579492; cv=none; b=G4W1oUq8B8vKWGlPgf2U5FjxVBVsIsPknvvmCDICGnFNkhuZCmxnhyaCsbujldeWV/eI12ULQzWMgo0HP5rd3jQxk5jOW9MvyKEHnK6Pck22FioRYUkuMjwX/kBjQQ79C2ojDeY7sjhqNCjHsrW++819fx1GM4O/nsd/UQGe8y8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766579492; c=relaxed/simple;
	bh=QAx3poxdMUITbrtSuAqOQy/O/3u18zPYCjsBTeYAFHo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uwlk54F0b56launcNO2/k3b8dUD2umuOXw5OHF4X6dSzmlD1spiZEDeOwmB4ktlZV1nQqFu6OyPmWEgJAX1bjExWgsPHd/AoYEzT/qW2kRXx+dmsX5jDdLNfzOJ/8XJThhxc1OHpO57hnP7hdFdsBhx9PAevLdafemjrFGMrSFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VSxX6ete; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SL2+eCDr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BO84heF1056223
	for <linux-media@vger.kernel.org>; Wed, 24 Dec 2025 12:31:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hxCA5guvFG8bf+IQ3INazgaPv4GRqjUZtzXSsG34vBQ=; b=VSxX6etepuqqHilZ
	pop1CRtGYdSGpZ1O37WLxS4uEEgx/UMJBx8tDqiyOybsG3duDbnrzGV7qI4HRP2I
	U60o8rDJTPnnr3L2GAoSyrl8ixbbsFFP/qGRUiZ/CWQZ6GmhjijsJ5eApQm6K7no
	xYBgGI9ADXhOy/fWd7vfG28vx0OCFiU6R5C9fZLZCRGSqrha/+3Ew9sEwNjeRkub
	cS6osyhxvZ7tEOKTh7nmRSRV5nUstiIdh+njGihYFPeNX+18ZoKuKzsCdBlLo7CF
	f1H9xXnxjL0OyBIdyD0np+pcvyDbVBLI9WG3Q7OUG9VksDIt56vKC0Kjp9gxHU/L
	chbozg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b811v2e2y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 24 Dec 2025 12:31:30 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ee09211413so147876281cf.2
        for <linux-media@vger.kernel.org>; Wed, 24 Dec 2025 04:31:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766579488; x=1767184288; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hxCA5guvFG8bf+IQ3INazgaPv4GRqjUZtzXSsG34vBQ=;
        b=SL2+eCDrCnG10tFRIXCckVJ8zmZUjLbk4r+Z3/IvXxX2xrYFidM2Kmvp4etgQF/pcj
         W1ftSrNZW9nxeEsSfGcoa//gGlt/5IznwVlwEXNej3rMluUv9jodeulFau/EnaEmbRrM
         MA2uOBQ9DnjVPaOnPlYTLkM855KUiTqKEC8ZpUlow9YoeuCttlChaRlfW9aZfOACgonk
         SV4HaPvN6upyaUg8JKs3vaXOErIUENNEkWszAwrIYEDr+9JJEEsRtfcDn92mGsbkJlLU
         LLkTb+s7JKBGn26hiHF/OHJ+Qe1AP5SN7jppBRonIR7ARdmwd6mQhKBJbRLHGU9jx1p9
         ejbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766579488; x=1767184288;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hxCA5guvFG8bf+IQ3INazgaPv4GRqjUZtzXSsG34vBQ=;
        b=M5UgJOyRR710gIFDmEkEpWBGf7qPeL54Am5ai6Smah7K78P8yM5YAW0mxAtPqg3AMn
         AEYBm17Mbj3Q+LEy4XQfppG5K4Q7ILqDn42Z9y8KOreHJ0teVITCa7vQsDdYCWH7K6re
         K/Z9OecXS9+jn9w32AL4U7wDDCrm06tIOIeKs1pt7G1U67E71p07o/0MCX8ufpfYgb3j
         U+oSEg8BrDa0CA9XVy+2vWq5xcj3DOfRFzPMM96ZEOoA1GCb0Zar2R3/DcEsu7tAhJRY
         Tzm1AqM9oIVyj9dWPwO521ulu6OiSm3Vnp6J0J/vz1Zsp2fiak29k5Im+V6XIosOUonb
         IEbA==
X-Gm-Message-State: AOJu0Yx0K6PZQNdWXlYxvWsVKI+QSzxI4oLpa72ZvHL7jQoguG7yEJ3d
	d1DI5Oyo58q+kFUNs5rcFN7lDSuJ/hZglNiHAWg3YkJ+rZkrGQ7wElGLUMJk+TMnHiqGOuGYpqI
	oe3XZYQZCyxTFy9OJV8/DCxpG+JTu2EbQk5wSmFAVlIFP6y+bTSSCG0kY/v7oeYmlcw==
X-Gm-Gg: AY/fxX4lxJr/9BWpkgz95AcszmFfcEMxzuP48Cclfhe2p9bnOgBvdYMYu0mQvv8CToq
	n0/1NW0Lne8vN4iHS+XG4r1NnnlWJzMhNE8fgcCjSRWT9ke9On62X6MTX3VjJEbGbaWi3vslBz8
	m+wkvOsYbREIacUmGE1J8P+fPSfmo0B/mhqr3kJ8UEIKENEqzFtNYLiEpx3+4InH2aBWOjQO7B7
	Zq4exaPYKN+JuWQG7qtoqcyOqF6bQs2UpQsgiS6XpSjXcy5S6CgQis/KIWPkVGm1LzQLclkX8Kd
	ObPUtBujjeMTJIDsM+CrvTPh+leYJmn9CQKc3oeB3RdOa0L2kUkbQUCVLHGzJZgt2XLapEhfE/x
	EN7zrGwYVA8rdu1CQLIFMMV0uPHya05fPpxTV8z8SzifFL2DPSa0Pzm+yEFC8hvUVVwuywewnoK
	K7OHRvLoxVSW0QN8YQjz6FIwfFiYadlbGOQNBHs2HH
X-Received: by 2002:a05:622a:1650:b0:4f1:b9e8:1d34 with SMTP id d75a77b69052e-4f4abd9e891mr232625141cf.61.1766579487962;
        Wed, 24 Dec 2025 04:31:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGmfwU+Vw9reRepTpr2BZ/gSShpDjlNKsHiR9ZBc4KGg+QFVNxgALBWUcu4ARxcxHI1Uxzk5g==
X-Received: by 2002:a05:622a:1650:b0:4f1:b9e8:1d34 with SMTP id d75a77b69052e-4f4abd9e891mr232624791cf.61.1766579487550;
        Wed, 24 Dec 2025 04:31:27 -0800 (PST)
Received: from shalem.localdomain (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f0b12dsm1750304066b.48.2025.12.24.04.31.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 04:31:27 -0800 (PST)
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
Date: Wed, 24 Dec 2025 13:31:20 +0100
Subject: [PATCH v4 11/15] media: mt9m114: Update source pad selection and
 format when sink pad format changes
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251224-mt9m114-atomisp-v4-11-60b25da7a1bc@oss.qualcomm.com>
References: <20251224-mt9m114-atomisp-v4-0-60b25da7a1bc@oss.qualcomm.com>
In-Reply-To: <20251224-mt9m114-atomisp-v4-0-60b25da7a1bc@oss.qualcomm.com>
To: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Hans de Goede <johannes.goede@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDEwOSBTYWx0ZWRfX1fu0xnFhmVuj
 j135A0d6XAWBdxnVRLp4vrT33AOHRuMi4Clj3Ndhgy9QEcltzsWhPyIXaJa9PO6TGo3mCF9sFZh
 nJqap5ABuyYrZUQc4XW2zx42Jy7Etm9T20lWUa17THW/+aYtYg6qROSLEfVDLDWneKhs63bMGNf
 rZ7s9NDaxR0F+K8A+bI5D7nhVCtZtLvujvwbaCuPa6yotnsq7iQNjQ39NYNA4UPIQhEy7kHy0Oy
 MN//dcb0KHYz5seEs/xacRnDvnBHHY9dL4cWQCh8Z1XBQaHvLF9mJRxgznVCJjdhLTLzKThW1Uw
 FCbOK1tTSEfOlYiz9JUpyZGdL55Z2SG2MaDmljXRyaePTBNJ7p7GteCy8/WwJ9mN3RYjhvc/R5Q
 PI96IUbIQPzNNagOI31YPQNpj9sWGvO8UNx4/iV9aqIK2v4MTIKP8Sw0ruwWOx37oNHS7uYkzFK
 MT6gjHkBdCtifle0yCA==
X-Proofpoint-ORIG-GUID: YKPpsVuxi5DafBXbwoftLh2p3Mca2nYk
X-Authority-Analysis: v=2.4 cv=WegBqkhX c=1 sm=1 tr=0 ts=694bdd22 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=P1BnusSwAAAA:8 a=EUspDBNiAAAA:8 a=4fCGRzqWpDqLba0_WKEA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=D0XLA9XvdZm18NrgonBM:22
X-Proofpoint-GUID: YKPpsVuxi5DafBXbwoftLh2p3Mca2nYk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_03,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 bulkscore=0 adultscore=0 spamscore=0
 phishscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512240109

Call mt9m114_ifp_update_sel_and_src_fmt() on sink pad format changes to
propagate these downstream.

This is necessary in 2 different scenarios:

1. When passing through RAW10 bypassing the scaler then any sink pad format
changes must be propagated to the crop/compose selections and to the source
pad format.

2. When the scaler is active, then the crop-rectangle cannot be bigger then
the sink pad format minus a 4 pixel border all around. If the sink format
change reduces the size then things also needs to be propagated downstream.

Rather then adding extra code to check for these conditions, simply always
propagate sink pad format changes downstream.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
---
Changes in v4:
- Address comments from Laurent about commit message and comment wording
---
 drivers/media/i2c/mt9m114.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/i2c/mt9m114.c b/drivers/media/i2c/mt9m114.c
index a9162457bf649404ac2057328799f1be61558481..8e0b5bf6db621d12b36f578b6374377c69503976 100644
--- a/drivers/media/i2c/mt9m114.c
+++ b/drivers/media/i2c/mt9m114.c
@@ -1892,6 +1892,9 @@ static int mt9m114_ifp_set_fmt(struct v4l2_subdev *sd,
 		format->height = clamp(ALIGN(fmt->format.height, 8),
 				       MT9M114_PIXEL_ARRAY_MIN_OUTPUT_HEIGHT,
 				       MT9M114_PIXEL_ARRAY_HEIGHT);
+
+		/* Propagate changes downstream. */
+		mt9m114_ifp_update_sel_and_src_fmt(state);
 	} else {
 		const struct mt9m114_format_info *info;
 

-- 
2.52.0


