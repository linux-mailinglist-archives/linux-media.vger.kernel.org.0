Return-Path: <linux-media+bounces-49743-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 55C0FCEA3EB
	for <lists+linux-media@lfdr.de>; Tue, 30 Dec 2025 18:03:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DFFD4300DC99
	for <lists+linux-media@lfdr.de>; Tue, 30 Dec 2025 17:03:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0CD32FF65B;
	Tue, 30 Dec 2025 17:03:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mkJ7ZhgL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H2Ler9eC"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 748A686331
	for <linux-media@vger.kernel.org>; Tue, 30 Dec 2025 17:03:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767114197; cv=none; b=anKmXL4oLBwnPaM4AL4axC6VLSgjqwgNp+R8AotvQ03mfN+PFwr+19RM3NqH+GKtmN9PgDum15eSfgRGkh8JBk2q3J0LmUwEirRzYaSfaQacvoYqgvs+++s5AOmTm2q+STsGz/+3jifLNrhYW0lnNFSGbPErLW8MQD3uGKRU+lY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767114197; c=relaxed/simple;
	bh=f9B2YIIcRPsOcsdkLV9U9peSHpAFk7La2139GM+liYU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Q8PEkdVAuS9a0/v9sjdKMohmA+ES91VNezvo9TMKqoOs6NKmtijR0Tnv9LQ9qHBk7xvn2j9AYPKhX4Cc1kQnyiBoQuTFsGfTu6S3r2u2uid/wHMjXLOOqK6P58gNBBG9vljz4dXED4atRqXsYoafJxItqXVW55XgEQM8H/cK1RI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mkJ7ZhgL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H2Ler9eC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BUD7GZV2548850
	for <linux-media@vger.kernel.org>; Tue, 30 Dec 2025 17:03:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=DnbkS5EgqB37RLxHwjFj5L
	tIBPuWjE9AZUf1/XtCyBw=; b=mkJ7ZhgL1hrvnZ9roFrVIXeG4qaXRqSg4ehk3w
	9SUSQV5lhlnV967RBIf2zELVFQ/G0KDB36Bp20iCSgqeCre3w7eoGurBvsK8dnCC
	qjrsmx7dxT6hL5d3ucuySwqEaYjQMM1UY15mvnhovSZ61Cc42MhvAZUjOT3FovCY
	W9co0AN2STtpnlq96cEJSZeGKxTJYLMmc2r7MPYwxmHeqk/OUNOZYug9JHHsWNMX
	gEdwf6JTjEm7FX12b/wCqFnYxkyIcGW5REWerfLieI7eaMTXrCqyg1+9FOwyNZIm
	W71NlSETf1lh/U3Ka90lBU/xDR++Ws5xf/vkPyG7oS7sjlLA==
Received: from mail-yx1-f71.google.com (mail-yx1-f71.google.com [74.125.224.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bc7399s9w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 30 Dec 2025 17:03:14 +0000 (GMT)
Received: by mail-yx1-f71.google.com with SMTP id 956f58d0204a3-645528427b4so13638984d50.3
        for <linux-media@vger.kernel.org>; Tue, 30 Dec 2025 09:03:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767114194; x=1767718994; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DnbkS5EgqB37RLxHwjFj5LtIBPuWjE9AZUf1/XtCyBw=;
        b=H2Ler9eCbvQZtV0ZS7h2/a0YOuiKhyqAiqqEwVeP/fQ2cHqLnwxGfLgZEd+U126hq3
         X5WPf0aEDC0j4uJ0WgPCS4TwjT4YimfpcqtwAes+AMYqx8ijwBi1PQ6BBkvCLgPnulLs
         ew644nGj+Aze5biIcUbslOm27tSoMjvO4PMPiA1zkft6doZv5tUWqx7YY8GuXOTpE2pd
         hrUxOCvnuKO3e6EZrGyb/dY9KWMjDYsJ14ZVX5a2oOAKpzFk5ok1K/Em5rw6HtV8UYaj
         IpAjHUH1bdhJv+tNOpy0vTGleAs0MzjYXIDvTooLEZZNKZ4kIwS/xj5yeaXZ/xy810tB
         8KHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767114194; x=1767718994;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DnbkS5EgqB37RLxHwjFj5LtIBPuWjE9AZUf1/XtCyBw=;
        b=X+0OSIugn3b7MIs5ynDNe8v2N8rcqVXSx3Wvt07YbnKasXIjESDkZbDyqAh3j3Oltb
         8NNLArZt3/GMIhur88QUd36W4EM0vWMqtHP7bTIvym/HbCLvisC/F/cIZgBzITWVSg2j
         25oOqeEg9TPZ0eyHi/s23l2yjR7HPL5coYDDfG++4keDdczb62NX9U5TALZMnnNAByu9
         QXoSIPMQkuqgSyF2GIUxZDtFmGMFOJfFJkySunRR2hGox6PnJ9ki0cyXsQgnekB2hrAP
         KHK2iGdjQrJgvPS0HFcIb2O+b3dYtF48A+l+CYzULYv8gDPg/5mU28miHJiQhrexH0vu
         hu5w==
X-Gm-Message-State: AOJu0YwoirgixLg31mzgwzFkxiZBt8Ozf7bxKfPI2R4qi25062Rh5yuS
	D7VlDxKu0bDGRQheF1Qm5pXMiiYIROfmvSbRkLiedZTHcNiwnJR+rFrNb4Ow0SpOyyIQ187UOoj
	1V60RA6T1sM1uloCKEfZJ6mFdIsOhL/bKAK3FSfJWJkHKDud+ZmKWV7uvJxiT7Q4Smw==
X-Gm-Gg: AY/fxX5A8/PLQolOyNI7OMh1BgEbVZPBQoIu6a/1jCU8cDJl8wXSVLzSFcmxRStYkPv
	fR4EJwT4hel/W8TuTm0e3Q43kENIWE0Z2ar0ZSmnjP4Ypfo6S05I0QsLKnvhctW2gSvkUBy96zs
	Y3ixjNcDGB+WOMIb5tugVFHrF5XW19ERN4Gf8gR97Mum2j9DXlxpsLJhsk+IxZSGXDmh0vl9Dkp
	2ooSB/83uOKYnhX+CBvB0VE1UU+wxTNnuK4bh8yyPwhYPoikSmnVGaAukeug08sy9yzMqfvzUYl
	PyqBzjzxPU5pEAtJ/riQHqrrhvCBUCGt+HlnrG5ZsiIZFF5xi+v3tTJuucn6SmeRGPwwuO9cV1+
	pNfnjN2lv9iqEyoHVu/H7ynvyFUv1kI2uVCyqWJD9qGYRJ4alF4+6ULaOePz70KgMG4h2Hx+9jO
	U/rCOUHqTKLV5esilRw3H6jJh2DPTwuyPzaP7Je7iq
X-Received: by 2002:a05:690e:1894:b0:646:7a21:f03c with SMTP id 956f58d0204a3-6467a21f1c1mr23306313d50.81.1767114193461;
        Tue, 30 Dec 2025 09:03:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFV0y38exXPUheUD7Hj3uxt5NCC/2uamLPwG4PK/UqHZNOYBx3lvaz0SzhG3pduPwsHu0ZZgw==
X-Received: by 2002:a05:690e:1894:b0:646:7a21:f03c with SMTP id 956f58d0204a3-6467a21f1c1mr23306275d50.81.1767114192988;
        Tue, 30 Dec 2025 09:03:12 -0800 (PST)
Received: from shalem.localdomain (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037a5bdb9sm3776086266b.7.2025.12.30.09.03.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 09:03:12 -0800 (PST)
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
Subject: [PATCH v5 00/14] media: mt9m114: Changes to make it work with
 atomisp devices
Date: Tue, 30 Dec 2025 18:02:57 +0100
Message-Id: <20251230-mt9m114-atomisp-v5-0-763539e76094@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WOQQ6DIBREr2JY9xv4INWuvEfjAhWVVMSCNW2Md
 y+66K6bSd5i3sxGgvZGB3JLNuL1aoJxU4TskpBmUFOvwbSRCVLMGKIAuxSWMQFqcdaEGThTouV
 ScswVia3Z6868T+O9itx5Z2EZvFY/D5VYIM0kylTmXDBgEKdCXz60n/SYOt8fpsGExfnPeW0Vh
 +//i1UABUlrzFp1VaxuShdC+nypsXHWpjFIte/7F4TNhlvvAAAA
X-Change-ID: 20251224-mt9m114-atomisp-31a4d366328a
To: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Hans de Goede <johannes.goede@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: iWj15fSRRFvrN2Ad_PekeKy-oTXtVjar
X-Authority-Analysis: v=2.4 cv=HrV72kTS c=1 sm=1 tr=0 ts=695405d2 cx=c_pps
 a=ngMg22mHWrP7m7pwYf9JkA==:117 a=EL5vKT8FNufO0qat:21 a=xqWC_Br6kY4A:10
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=8DEaqStWjIEYF4fk1IgA:9 a=QEXdDO2ut3YA:10 a=yHXA93iunegOHmWoMUFd:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMwMDE1MyBTYWx0ZWRfX6DFbjMMWQs3m
 qf6gmjrZJGYxPMLt1EsWI64sEKw4HPsm8xw2xuVbkh42sskqlFGT0++vDlSX6ItKwamqbNjyu3V
 1jMlLx96fexXin3ei+2MKMp7O7+wEjHPXAKLvw490eV5Sjliib86G8rdaL+ohk92D6K0zSKp3q0
 mqHObPKSKyfVWnuoTGsqvi9qXCPcQ4p8bBLkMeygGlFatKdvETPevPmDn5dSHn6A3qDPxSBPHKQ
 H3YRJpdmIChJz0pHc85WM8anZPlJJdxq0vqlH7skE8Z7keJMQi7djcvJYOzHpbnB6HQ9qoMJWYy
 SHmxNzAR4PCqbfazBbxmQMNRyDsm+xV53cUxzrzjUSSRiS2P0z809iJwsT/aq3d8qae5Tuh7v8H
 ghHF0tN13y8J8BC+2UOltAn4VkUjDGIqU9Du80hZ+O7qWY3Cs+OgZY1+nVz2UFFTDkleXcrsrBj
 6OemK7GdK14ZR0PtuWw==
X-Proofpoint-ORIG-GUID: iWj15fSRRFvrN2Ad_PekeKy-oTXtVjar
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-30_02,2025-12-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 adultscore=0 suspectscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512300153

Hi All,

Here is v5 of my series to make the "mainline" mt9m114 driver work
on devices with an atomisp CSI2 receiver / ISP. This has been tested on
an Asus T100TA.

All patches have a Reviewed-by from Laurent now, so I believe that this
is ready for merging now.

Changes in v5:
- Move PLL-setup comment to mt9m114.c and squash it into
  "[PATCH v5 02/14] media: mt9m114: Use aptina-PLL helper to get PLL values"
- Use sensor->pll.ext_clock instead of calling clk_get_rate()
- Drop "and identify it " from comment in probe()
- Link to v4: https://lore.kernel.org/r/20251224-mt9m114-atomisp-v4-0-60b25da7a1bc@oss.qualcomm.com

Changes in v4:
- Drop "media: mt9m114: Add support for clock-frequency property" this is
  not longer necessary with the new vl2_sensor_clk_get() helper
- Add "media: aptina-pll: Add comment documenting the PLL chain"
- Rework "media: mt9m114: Drop start-, stop-streaming sequence from
  initialize" moving mt9m114_initialize() to mt9m114_start_streaming() and
  dropping the config_change_pending flag
- Address comments from Laurent about commit message and comment wording
- Some small code tweaks based on suggestions from Laurent

Changes in v3:
- Document that using 768Mhz for out_clock_max does not work
- Improve "media: mt9m114: Put sensor in reset on power down" commit message
- Drop setting of the MT9M114_CAM_OUTPUT_FORMAT_BT656_CROP_SCALE_DISABLE bit
- Split "media: mt9m114: Fix scaler bypass mode" into multiple patches,
  addressing various review comments as part of this

Changes in v2:
- Rebase on top of sailus/media_tree.git/fixes which now has 4 of
  the patches from Mathis': "MT9M114 driver bugfix and improvements"
  series, this avoids most of the conlicts between the 2 series
- Add Laurent's Reviewed-by to some of the patches
- Add select VIDEO_APTINA_PLL to Kconfig
- Use correct aptina_pll_limits
- After setting reset high wait 20 clk cycles before disabling
  the clk and regulators
- When bypassing the scalar make ifp_get_selection() / ifp_set_selection()
  fill sel->r with a rectangle of (0,0)/wxh and return 0 instead of
  returning -EINVAL

Regards,

Hans

---
Hans de Goede (14):
      media: aptina-pll: Debug log p1 min and max values
      media: mt9m114: Use aptina-PLL helper to get PLL values
      media: mt9m114: Lower minimum vblank value
      media: mt9m114: Fix default hblank and vblank values
      media: mt9m114: Tweak default hblank and vblank for more accurate fps
      media: mt9m114: Avoid a reset low spike during probe()
      media: mt9m114: Put sensor in reset on power down
      media: mt9m114: Add and use mt9m114_ifp_get_border() helper function
      media: mt9m114: Adjust IFP selections and source format when source format changes to/from RAW10
      media: mt9m114: Update source pad selection and format when sink pad format changes
      media: mt9m114: Don't allow changing the IFP crop/compose selections when bypassing the scaler
      media: mt9m114: Drop start-, stop-streaming sequence from initialize
      media: mt9m114: Return -EPROBE_DEFER if no endpoint is found
      media: mt9m114: Add ACPI enumeration support

 drivers/media/i2c/Kconfig      |   1 +
 drivers/media/i2c/aptina-pll.c |   2 +
 drivers/media/i2c/mt9m114.c    | 271 +++++++++++++++++++++++++++++------------
 3 files changed, 193 insertions(+), 81 deletions(-)
---
base-commit: b70886ff5833cf499e77af77d2324ce8f68b60ce
change-id: 20251224-mt9m114-atomisp-31a4d366328a

Best regards,
-- 
Hans de Goede <johannes.goede@oss.qualcomm.com>


