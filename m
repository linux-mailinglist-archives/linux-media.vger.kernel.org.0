Return-Path: <linux-media+bounces-49472-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 42266CDC382
	for <lists+linux-media@lfdr.de>; Wed, 24 Dec 2025 13:35:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3D04D30BAEFD
	for <lists+linux-media@lfdr.de>; Wed, 24 Dec 2025 12:31:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED36219D074;
	Wed, 24 Dec 2025 12:31:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="l4atO4Uw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KZmegxPL"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 838F13168E5
	for <linux-media@vger.kernel.org>; Wed, 24 Dec 2025 12:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766579487; cv=none; b=Ijm2l8dDGMssuHHjMnOMKu0V9gzs73upGfRSVkU8rX2tFt1M/z5JEFLKHxmspNefL6txW7JMkVMTbXWb2QlkVU67loSTLXZumdHVxOtpR3vIixy1SrvWo4GGD0zDEdKLBTvpBhbXHVgX2XfrpM64c1u7FdMry10KRHNlhecPJwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766579487; c=relaxed/simple;
	bh=PcqEbDhwYqOzmIiok2Qn6+Jm/yIwV2Upm7KXVYVrG2Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=C0DfQt1p7dkQ8wtuTEyU1uPAedxB+ZYErtkWxN49TqmzNPsOnr0L6A+NI7xqJY9bJPgu/XrRkpj2Qu+qO8xqddnhGYjX2mDUNoJ00g4ZV03SftTB6JQglpLw1BeJAxMGt/OktTqEAJPfYXTWatQ9x4DqnF/eZcU77XHZGRk6yW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l4atO4Uw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KZmegxPL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BO3f3534134142
	for <linux-media@vger.kernel.org>; Wed, 24 Dec 2025 12:31:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zOUl8Ahg4EnNMx+NAiYHHKYQZ589n34P2RtnbvljXcU=; b=l4atO4UwYIZmU+85
	O0GlvKB3U5FZPYpETs3XdOBpsP5hqp5KNLfJ+ESzj8AP8yLDoV1asRGjuZRtxs1T
	eXMGSpSJ9OlXeBGfCTn45pRHWLrqNmXJCYGsESF4NGJ1gsPozb/ex9voBYli9hD2
	6GjYFsCiFzf+sw9JZowzkb39rVoRlUhFB2gUsulEPvejPxY9WOA6BbNWsUs8cGnT
	EeBFx+Sa8SpZ8APAImNxkPGs3oLIVXLlMp4HC4QdM+KioSlXaLZGzYxsO8/2wiyY
	iKrZK2YxTXiBQbEa+q5W3UPY1HDXg64TZC9yYYxLIeel0M7sUFxsMzmhOKr+kYqU
	rs1pyA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7x46u1a8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 24 Dec 2025 12:31:24 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ee1b7293e7so204871251cf.0
        for <linux-media@vger.kernel.org>; Wed, 24 Dec 2025 04:31:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766579483; x=1767184283; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zOUl8Ahg4EnNMx+NAiYHHKYQZ589n34P2RtnbvljXcU=;
        b=KZmegxPL5YIreSicBYZoWN6xwL8Vjy1ePiNGpbayFWSBVx4rTk589dUBmMyexaF7bv
         u8l7/mTyhIF5E52kJf4viJDtFDuKt9PMrjOX3x1G040/SroEElJKkCM4AY39oLTaz+wQ
         rF6zTDPeSDT8nH+qI4JHz+iMxF/K5XVhsPpaycnhzrV7JAM0IjC4M6bltRq5Y2X1Rjpo
         qIOBKzcrLFK3OK3VJaMK+ZV1qem2d+1agBk/UJZRBFu1aKnnCIqqkxIQ1lcG3KiZ6lT7
         JiU0s02ZjXKpeXh7b63iTl/ZD9ap2FbVEKuWkfUcPDjKMKTy3BSdumKSDAtRfdHneWko
         dYaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766579483; x=1767184283;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zOUl8Ahg4EnNMx+NAiYHHKYQZ589n34P2RtnbvljXcU=;
        b=AtYlK5DFa+lgyTlczPpXhBBmQfJXLZlA8sHzBfM8tHUnN1PcIsOWTSG1apEr3snha5
         BCJ/V1LO/EpgqSkQTzGIxjuA9ros9zmGaIsWTi48LRS0Y37cdgzAU4CVm2JTVmYJ5DHr
         v41szY1efiHr/jeNRlLHbJl5FyA7wT/mgT3Hn6DHwepVuswoWVxR2iFNjmczRRjW4gOm
         LPB7YsOeS0wnq8LWW6DEngBnN3N/WCVN6qN+vFukNcviLokHAqw4+ZGahPYyOLEs5i5i
         ks9S03OSw5DmVZKcp6ByhVAWwGUh2R+oUtrcs0p98/BNhhoecNB8otXDeHMSGZta1l8C
         h2RQ==
X-Gm-Message-State: AOJu0YxPcsHaMHo8gT4Y2eZ6iuZt0/3UzDccIe4SKZqI0M0EGUm56ljE
	gog845U7OTf9gBjqDo/yOq/Lvxli0AIOzYsuiI3hLs8trG2BMGM6MyG29HN6Awa88LK9+kH8bga
	I9knwArfwOWnVZMwh8ZLlH6SU6MxSTpwj88A/t6XDYckfK5PgKi3V4Ifq0rC4wzpKkelvrpYmKA
	==
X-Gm-Gg: AY/fxX6Ewis6/TBgNlOxg56p+d4zvYkjeNATEOK79O2SnIrSuVFQjKVWA/B3shmyr5q
	8zHtah3HmqRkMeJtmqTeLyqTokvVI5KHWtkC90urL5vddmBK/KtM4b7jSR3KarUekbI9LkHkz1c
	s3SpEFUqk4FofZY+DRZIoB9W3uJRA0U8mwgsOxuC2e9GjpaaY/B/JWYDPn7I3TeBTIXBD1PNTn2
	b8WjIlj0XWAg6BCTL9bwilXFeTBuBD8RL0kfQm31lsMoFZeJO5J2tsNCkAyIjKnWYIV2gnxtOTs
	FNsiNO9uRUpvTLb5q2vH78YBenkIV6+R4pRYpODAHu9WPJy6GLFW3G6oyebyPYs61CRRmiUjYrs
	Bk4R2Z/UwmoDbDNyfa19YIrRopPZRE+HT4HI/5V31tmM6G4ZxnqN7C59hY1/dP2zF+mlQ++nAyY
	ZwZjfUkijjGqAUuvlZGaRpQ3h3/vji4pve+HfFWdXH
X-Received: by 2002:a05:622a:1aaa:b0:4ee:1227:479a with SMTP id d75a77b69052e-4f4abdd1c34mr255789241cf.84.1766579483492;
        Wed, 24 Dec 2025 04:31:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHJMqD0KLcylsKHMUZp+3fu2rjgJFkp1M+QUZi5VVzvpEMKi5CyGkdxLGsXfjb6XJmqSO1TGg==
X-Received: by 2002:a05:622a:1aaa:b0:4ee:1227:479a with SMTP id d75a77b69052e-4f4abdd1c34mr255788891cf.84.1766579483117;
        Wed, 24 Dec 2025 04:31:23 -0800 (PST)
Received: from shalem.localdomain (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f0b12dsm1750304066b.48.2025.12.24.04.31.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 04:31:21 -0800 (PST)
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
Date: Wed, 24 Dec 2025 13:31:16 +0100
Subject: [PATCH v4 07/15] media: mt9m114: Avoid a reset low spike during
 probe()
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251224-mt9m114-atomisp-v4-7-60b25da7a1bc@oss.qualcomm.com>
References: <20251224-mt9m114-atomisp-v4-0-60b25da7a1bc@oss.qualcomm.com>
In-Reply-To: <20251224-mt9m114-atomisp-v4-0-60b25da7a1bc@oss.qualcomm.com>
To: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Hans de Goede <johannes.goede@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: M1z73_6lrp6_nynf58h07cab2-BeCf5a
X-Proofpoint-GUID: M1z73_6lrp6_nynf58h07cab2-BeCf5a
X-Authority-Analysis: v=2.4 cv=aOf9aL9m c=1 sm=1 tr=0 ts=694bdd1c cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=P1BnusSwAAAA:8 a=EUspDBNiAAAA:8 a=RFAlwJ6oiccnoQ4oFZsA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=D0XLA9XvdZm18NrgonBM:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDEwOSBTYWx0ZWRfX2T9g7tIemecx
 m+vCPz50KRwYAhOKJfs0QVRm4ywS3u6QNlRSCyFooF0URoRJbE2JAHFAdukbG62XwMz/iUVUdUf
 Q1rqV4h+RBWew9qn1Rca7M8Dx79A+TN+6wOCYUvDghg21nA4y8HWszgrLsViDAPWnpmymi+iVUM
 Cc/vEspbmsuOuuv4duAIPw+UD8ZpRaIZTA59VyzUp5UlimQXRpcc1YLRgcq5sN6UZroUCWVAeTj
 uHM6c1phGp/u6V4KATggdD7/mQ+q6HjAemzHc5RWuCHFRfM+KJS6Ri2RWuHQAmdoYnkgy2x6io9
 rUGGIH5slS1anSWePz6MLEtz3sVMiu+h9ITfYBWReqQmdKLaqApqMRAlsJCVEXXaShHlb7zZH2t
 HHpKEoL+bLT5lYHp3hxt53jIAmDNplunY1zImkWkqf0z2xkH9udiOuL26AHs48NEcWElu2BgVu8
 EEaSGvsnIB5jUx64mYA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_03,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 suspectscore=0 spamscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512240109

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
index d58445826c090f377db473f7926c1b612874ff78..60afc32acee4df1e7d4f820838b72f6aa3506f8d 100644
--- a/drivers/media/i2c/mt9m114.c
+++ b/drivers/media/i2c/mt9m114.c
@@ -2455,7 +2455,7 @@ static int mt9m114_probe(struct i2c_client *client)
 		goto error_ep_free;
 	}
 
-	sensor->reset = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_LOW);
+	sensor->reset = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_HIGH);
 	if (IS_ERR(sensor->reset)) {
 		ret = PTR_ERR(sensor->reset);
 		dev_err_probe(dev, ret, "Failed to get reset GPIO\n");

-- 
2.52.0


