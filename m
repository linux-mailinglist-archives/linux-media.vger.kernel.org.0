Return-Path: <linux-media+bounces-49753-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id D1EEACEA418
	for <lists+linux-media@lfdr.de>; Tue, 30 Dec 2025 18:04:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 303D03009EEF
	for <lists+linux-media@lfdr.de>; Tue, 30 Dec 2025 17:04:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0FE133032C;
	Tue, 30 Dec 2025 17:03:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dSQnCcK9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OfYqQFlu"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13B5532ED41
	for <linux-media@vger.kernel.org>; Tue, 30 Dec 2025 17:03:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767114208; cv=none; b=NScPshtP4TSJ8+6NR6jwwxPAhLu1W33GkH61besa4kgZ2godKd+mp84kPcwaGxMb7kLl1MaA5UQ0wh1lFMA629pufmuiBg0lWX8SJ/H4Svy5fkPSUwe/lA7haJPT4IojwmpU1hhyXUddOZqBchltAScHrcJSFZgN2G8Lvg4eqpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767114208; c=relaxed/simple;
	bh=6usY9CmleW8bXuPB6wDztjSP8whC1JATtuo1A5bWtr8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iOUNw1DidC8VjLTcYRJhnzymPj4/PKmjeCu4n5Gv/dCyzrLtOzB5uPECk0RrYfJw6n5uM0USoHkQwVHCt5kANJ/LqIiD6E74Dy17+Fme15KBcT9ZwMDjUc5vY5SEke3qqZG21OknrLd9dF+PKa9r5+9ov2aluRW1gsVY0dAa9BE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dSQnCcK9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OfYqQFlu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BUCtUfL714641
	for <linux-media@vger.kernel.org>; Tue, 30 Dec 2025 17:03:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JAHyzWd/rQ7jQWjpw0jxDJML05N6s5N2tFOai8WJLk8=; b=dSQnCcK9fosbFJxG
	ROSFgOm5yzOrD9F81D7hUNa2hrAUZ2gFNmFmHmtx0LgUHf4ZvKDksHu+akwunRly
	CL83peeHL6mF2EpW5oTc/wYMaU6XGvOdC4Vz7icd8iHP0CKeT8WHH/xM6VBYnbMc
	6njw6iSfeKN6eKZ4VafM77L/s63lzUG1P+RrIQHmA/REkM7iouMo6GOPOcWlnV4F
	MGfhcheIYJCQCCMmh58SBblCQBPPxiCbddVa8o12h/MN6acTG2moiIXl80ExZ9N0
	YEDqxc4hwHGDIvbxXYR2w/RbpEqmzGVWOFK/4RAl/vW//QFZaWubkBv0jbzaTQUV
	mI95IQ==
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com [209.85.128.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bcf5yrjru-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 30 Dec 2025 17:03:24 +0000 (GMT)
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-790157636e4so50695567b3.2
        for <linux-media@vger.kernel.org>; Tue, 30 Dec 2025 09:03:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767114204; x=1767719004; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JAHyzWd/rQ7jQWjpw0jxDJML05N6s5N2tFOai8WJLk8=;
        b=OfYqQFluOM2PAQW4eyxPtcVayIz+Vs9Qh9fASIwrcHZz7tpUXvMj1rc7c+NUr+qDzE
         dEImb1f/2cPpa1Zm0vys8hAno7P34kQ1uOQ5GK1deINPU54jq5RPwUq/DcDx8MA+bjSG
         usUCaiDvrY0t2yOciRUdh9Brx832jDX69RuXguryGkKgbZHmKJ9sWxsZoVDKdV9i8+0G
         I5HzWOnUIHGTiskaQERHPUtg1Xxo1TwpDHSf8BLIeqiKy5mTCmovma3FRYs2GNqc7rxl
         DqBu9Mn/Oj1KA8w/b5mCdOC9sjO+jxe0CmtN0w+SGOIa6twz8J97avy8qc+6D4kO0m0C
         kHaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767114204; x=1767719004;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JAHyzWd/rQ7jQWjpw0jxDJML05N6s5N2tFOai8WJLk8=;
        b=bVrsQ/c3ot7d4y7h6pz0ckDJiPjPlpoyRvKuDLofFtH18uZUgcrwFjxWDZszThYHgS
         r9Gf6EhLhCC3PgmrN0Z0k1f0LIFqrV7FBsLNQ1/NagtYyC2MlqEe1deFKSc6pwjruWM3
         uRmGua6X9A39Aw9sgPFdbEW6tl4U799IR02IZg9iPptRvEDR6u7M83nSP1s8tOXGshJe
         wY7iGtBI3dvg6FH4C2ytfUMXI9eMHyhsY5ak4Tzxb6XmlmCbjhxIE6fYy5qpU3MsrDqv
         Tfh0ZfPOZ/tSXAncWpMmJoZk7KF6r1ZJ7+yAaOPI/bUZfCSDtXUbVLmlysBH659njPkY
         ss0w==
X-Gm-Message-State: AOJu0YxAnyxuU6iqQhda0qMjx374bf5Z7qaBhxDqDZoT1h+w/LP+/2p6
	ah7VL8rb25h1HCIphkyGfbqOgAs/Ok66qDnNqK4l7/HFS5GfsoFHNSSBN3JReH45WigpLgatXQP
	xwulr8MHx+2YkMjpb5xJr3cfAxW3BH6O+8BOiKiQ4esc8PctW++jn7vbq6rB1PFO6rg==
X-Gm-Gg: AY/fxX6HdT4im55R3ZAlR8sCmD6t/PA5cirg2101Hew6VEcym6hbfJQ2wBGCyYqaq5M
	C4cOsPsGbxYYOibyhk9ppAHf11hsineQ73zXQgA+mAHrxB2Qb3FvPPf9BBeJCxrTxA7Xi+AFrJx
	mTxFrMGHu2flrRbOnXi4JS4AlT+FeT3/HB47DBY5K6fdiQz+2pqZas75iM5eoCvB7DuR8qwm8A6
	7endHnyA+eiQkhdZeIxGUy0O3DfLHPpOiaAe6ZH+Ytplny0YufS2J9zqoL4qMVO0HZzJs3K5QdW
	ki98b2JJkkQPzJr3R6VyAa/mK9MTxhOwqnP7sJyzzcsj07jHVgyvppbdcD1mD/lmwAKXYWtiVz3
	BECyIIs1PJWLKbTn3dHyDg9uBdXy0kN0J3Eg1xzWxblzI1qn+0hUjrBw8XrMfJCu8PtURhFhxAt
	5FEfj9OyQBw/eNdWYEE2TO9wKDHoqR/rKUK8DhiSZu
X-Received: by 2002:a05:690c:6187:b0:786:62bb:f6f5 with SMTP id 00721157ae682-78fb3f36848mr615294057b3.17.1767114204302;
        Tue, 30 Dec 2025 09:03:24 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFBp1BH9D0/S/XfpnMAORfjkp0QXCfWa4tCbafDVaurAXf8BwCMOK+fggle/tnGTgKWHIwz0A==
X-Received: by 2002:a05:690c:6187:b0:786:62bb:f6f5 with SMTP id 00721157ae682-78fb3f36848mr615293557b3.17.1767114203862;
        Tue, 30 Dec 2025 09:03:23 -0800 (PST)
Received: from shalem.localdomain (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037a5bdb9sm3776086266b.7.2025.12.30.09.03.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 09:03:23 -0800 (PST)
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
Date: Tue, 30 Dec 2025 18:03:07 +0100
Subject: [PATCH v5 10/14] media: mt9m114: Update source pad selection and
 format when sink pad format changes
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251230-mt9m114-atomisp-v5-10-763539e76094@oss.qualcomm.com>
References: <20251230-mt9m114-atomisp-v5-0-763539e76094@oss.qualcomm.com>
In-Reply-To: <20251230-mt9m114-atomisp-v5-0-763539e76094@oss.qualcomm.com>
To: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Hans de Goede <johannes.goede@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMwMDE1MyBTYWx0ZWRfX/xSkWT/2cVd/
 4Pn4kLk5iXt7HHXx9WedH+hIqhEIOX24rzDDlmaqqrWrdtm6ii5Yg0Ie/Hd+pwz4mLfyi/9hzUP
 o3mJibpO2lkNpBie/iEm9OaFwfRztHDfokXCKZLeEyRBeLaMn2TbvbYJohPRgSxDT0mct1aN+gZ
 0O4xONV1d/qFqiYg3C56JkfPjG8koD8R0fSz50GckwzDrS/KEKxh9/TtgzexYBWEECjuY5SYpim
 lIgVBR3HRGu94rA9Vo9KPJOz756pINURki6j/OOXwF4hazxtg1VmDAzpUzG6MQK8H466/rwToTt
 yBR3xYvTPntSwLAXl3BpMwO80z5XWrvrR3Bkkvdl1JMueDTd4KwHdJxlrfB17vDUtYO1THVxfcR
 FWqGYV36r39K215ZuXTDD3Fx9jpi3D9e7lAvWqM37eEjg/5SfT8sjMvOvb31c7uo/yoT4brTFZX
 maLqdt//qxh51QNqtIQ==
X-Proofpoint-ORIG-GUID: YkNjbyGmvXEiNwppj1Q5AqKtiCOVJgxh
X-Authority-Analysis: v=2.4 cv=KvNAGGWN c=1 sm=1 tr=0 ts=695405dc cx=c_pps
 a=0mLRTIufkjop4KoA/9S1MA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=P1BnusSwAAAA:8 a=EUspDBNiAAAA:8 a=4fCGRzqWpDqLba0_WKEA:9 a=QEXdDO2ut3YA:10
 a=WgItmB6HBUc_1uVUp3mg:22 a=D0XLA9XvdZm18NrgonBM:22
X-Proofpoint-GUID: YkNjbyGmvXEiNwppj1Q5AqKtiCOVJgxh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-30_02,2025-12-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 adultscore=0 priorityscore=1501 suspectscore=0
 bulkscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512300153

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
index 9ef237943a085e058c17c8ffe50636ca2e4d95c3..d111f9e45d2d9c47de315d06ee8a6adb28700146 100644
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


