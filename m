Return-Path: <linux-media+bounces-49465-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 634FCCDC346
	for <lists+linux-media@lfdr.de>; Wed, 24 Dec 2025 13:31:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 368F0303527A
	for <lists+linux-media@lfdr.de>; Wed, 24 Dec 2025 12:31:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C4A4316912;
	Wed, 24 Dec 2025 12:31:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WTwaD4gz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gisGk052"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B8CB632
	for <linux-media@vger.kernel.org>; Wed, 24 Dec 2025 12:31:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766579477; cv=none; b=e5iit48Sc+njf6p13Cgv7z0j+irjh+DRxFMHQPGvsXDQcLrdOK54T72jEo7oYHvYLdOOaCVb3oPEu9DXzjQjnpbSPEuT8/0qRFwWJiv6VaarrYhoQ/fgreiY4zRsEtutlOWSvnL8wcm0lj7fSXSIRU1UL/Bu39mUrqrDBsPzQGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766579477; c=relaxed/simple;
	bh=XMGPulw2mWgrNr1ena2HJNYEcy3Tngt0Dhyig9K3GuI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=TISrCCerF5D6/5Vn4tQvtc1tpyJ/VCPHo+NOHiWyu4aCFpjwXA2j08+6RGPi+OBlLJfpuJKb883tmnltyNgaHjlvG26Ob7sypZdi8B/w+PP6zxUily4Z/uBKRX1FVOFrtD28WVeX8+k8YqHTA58puufTNpj5SZg6+O1np1WIPPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WTwaD4gz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gisGk052; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BOBjvdJ461418
	for <linux-media@vger.kernel.org>; Wed, 24 Dec 2025 12:31:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=5FheP6SLO0dZX7IgB2h3BI
	vLN43eCg1jp+8Im89KkGQ=; b=WTwaD4gzWVsE7DqHfdgnowZfvanetBzEJUySbT
	db+/6TmvAOpXsJguUh/cwWH1nNlaV7qyRF5ZkFY5cNr5t9sOqGlZOXL7juLRjrnV
	8cRIizzY6h7NTTjUq1iP5N5aTiU6e2o682B+pwebWmMbQdHXgUdB3gWJqV4L/nZT
	63z2Tb1jOe7lAnF/zZkGBoc4GrDCXqAQU+ufZQ1wGXgOdnaZXZA1H0hEiQVROnSl
	sJUrG/cIOxFosc6VIgy7Mx7Q54qepWlmsu+UtpA5UGZX8ZAbJxVzMDinUrP7Mi4Q
	szGl3sgojhxrU1b4G0UaFGT8gRLjH7oOA9SkOivCIWY+V9cw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7w8fu5sd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 24 Dec 2025 12:31:15 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ed6ceab125so151075821cf.1
        for <linux-media@vger.kernel.org>; Wed, 24 Dec 2025 04:31:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766579474; x=1767184274; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5FheP6SLO0dZX7IgB2h3BIvLN43eCg1jp+8Im89KkGQ=;
        b=gisGk052qXANN5vooEGYoyxLxLxIltuEI6U+re7ctWH1hi9tIoSuiQsK7+zJuQQ9K2
         FzHLg5bwc6jNeuiDp8c92ZWKvlrVd+ZPxB+oQnFGS/ujd4bhUSf7rgKLlFM+1t/AE6d9
         c7W7Ic4QpYi+DDDF5ePeL7pMmJpfGrE2SgGMnVBfIAJ/V5HeP7WCDSp/VW30bwx/gl7U
         HNyoXEu2e4ee7GKksE4oSR3il7vEAhPHCGvDVVXIkPQqOSBF96K0YxBbsIMc3WAaw0/C
         oxHVLOVPxn+OkqHNJYE9qyUPicAHxyTGy/1H8wXEe/7WhQvdlMftFYf/By9UJAqVJ04T
         18+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766579474; x=1767184274;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5FheP6SLO0dZX7IgB2h3BIvLN43eCg1jp+8Im89KkGQ=;
        b=u/3vVOS3ZZUiNyG0lNf6RKiux7eSoeM+sNOo+y5UvQIUTMFcgk8jqgALWJc7maFZa3
         q/7FlVeNjGFPEmPaPl3YaTHS9u6MW3Pz8njObMhYGFPHfgGcNOCVkk/7GJpL1mzpih0k
         KBluKjdmr20uFmvVKTvJG5QDZXOdfFqdRZ8UaeB+CZ6oDwtQ/wkqQBw34vWy0bDVqF8n
         Bnt3mjkOT5UC8RQn5S9F9trJp3XIlQEiYAEo19uDNrGcwTLHq23J549Y8zN5C00/Xv4V
         GWet/GnWkoAftQ8UAeTms/yj2GoTRq2D4QYUWY87Y/vzm6THKw+uOKUXT08Nkr1AyWLM
         cjvw==
X-Gm-Message-State: AOJu0YwJaVD1Dg0GVemMzmrp5ZvVbJA+J7XIKy/G+mKazqWbq5YkreOS
	p0oA/wxBGYdXenL+NkItOoodudOBEWlpRFPJIHBG0LA+RBJFK2fmt97rjrGq3ftlrLW01KftWhd
	vCg6PlDKdy1j5nB0sReHXM8+OPGvLZWnjOXAmdpEZGGp17GLi/Np5h0LkH+89mWszYw==
X-Gm-Gg: AY/fxX4QP5LZdR35UtHb83ga+/NZpnThJti9G8mSx0UdCIpYEaTIL1x8gJ8oKtJW+0P
	5QygdJSspingto5nrcoSwBYZz6448cu4oGAKZVJbe1CovWYXXUdEgaF9WTIRV1bBgqOMirTKgRg
	v/67ek+ds65jd3Em/uHiDQfTDxzhRiPOcuWhxM0KTEdyx0+jvXBHbgqI83v+jr41Di3bNhow6V/
	/PaB50slDx8r+kRFPfHyuSWk2wBn6KNhYlS30z85Tbgz77jd5eu5k8GwJdE8SkseV/j4B0hHG9P
	m0z+JNCFMCcNILPGTMbGfxOpBU7UjD5V+vil/r0YBCpoRR4MVlArYV4b4LVVpeS6fCoo40Pseap
	JsFCWuw6Ro4CePcPkR0pqgoHw31AZzIatlyA+jmUYOlQFKjIuuX1jIKzPEN6fDs/+FqRwbNzLU6
	8j9mfAtrIHF/asCD0XnMR7OhmhRVkYdTLdtgXaYSsE
X-Received: by 2002:ac8:5182:0:b0:4f4:c080:15e5 with SMTP id d75a77b69052e-4f4c0801616mr138357841cf.1.1766579474117;
        Wed, 24 Dec 2025 04:31:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGxzFc3qJ4WV4O7f2EOfiwXfL5C4CLXHvpwv0Xx64vIwIwE1VXzvXg7+XzfDn2/eSxaf4u//w==
X-Received: by 2002:ac8:5182:0:b0:4f4:c080:15e5 with SMTP id d75a77b69052e-4f4c0801616mr138357231cf.1.1766579473208;
        Wed, 24 Dec 2025 04:31:13 -0800 (PST)
Received: from shalem.localdomain (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f0b12dsm1750304066b.48.2025.12.24.04.31.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 04:31:12 -0800 (PST)
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
Subject: [PATCH v4 00/15] media: mt9m114: Changes to make it work with
 atomisp devices
Date: Wed, 24 Dec 2025 13:31:09 +0100
Message-Id: <20251224-mt9m114-atomisp-v4-0-60b25da7a1bc@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/z3NQQqDMBCF4avIrDtiJjFoV96jdBHqGEMbI5NQC
 uLdG7ro8lu8/x2QWQJnuDYHCL9DDmmrMJcGHqvbPGOYq4E66hWRwVjGqJRBV1IMeUetnJm1tZo
 GB3W1Cy/h8yve7tWLpIhlFXb/TmdppK63ZFs7aKNQYb3KfnqybPxqk3g4zy82cffvmwAAAA==
X-Change-ID: 20251224-mt9m114-atomisp-31a4d366328a
To: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Hans de Goede <johannes.goede@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: g9sXX42wMrC_J34JSHbhxZELnQifW99Q
X-Proofpoint-ORIG-GUID: g9sXX42wMrC_J34JSHbhxZELnQifW99Q
X-Authority-Analysis: v=2.4 cv=QutTHFyd c=1 sm=1 tr=0 ts=694bdd13 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=EL5vKT8FNufO0qat:21 a=xqWC_Br6kY4A:10
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=8DEaqStWjIEYF4fk1IgA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDEwOSBTYWx0ZWRfX58U3AfDCQOj8
 Es0uCKWdOC6Sf7UUthsZgv18ecLTlL8uAI7Cyh3tbv5PWxk+JxCUfoQ2EGRAj3MD3DnB7rq4fTC
 /K2D9k1cT68RJxZp877zpgxgXBPTw/npjkpPN7NdJGYs0r6J34qCN6S0BovI8Ll3coy53DcerjH
 eUILP5NHnmeaOg8VFLiU9DrPsCXlM2CWV+aGYLV2CHNO/m9xR0BfUBotIbAu4DD1/Dk2u8Hd53H
 QLKcmMawuime4kogTl82NU0hTB/AyKQk/go7K9sK6TEFpjJpFb16q7QF6DiLXt4WQ0JuX2yVo4E
 smWf4igdNePJsekoJB5677Un9Pxc+rTWUwLgI6zdeE5brrWLq3PFILYGRirH/wncyEaD0pixbdi
 HVlA4pznA5fZQJF4eqczBlKkQKPlIpA9IrdgvbJlTJpO0U3k9red/UV3ra+YJuny5F1tJJIjmws
 IC46e3DoSWegyNnNeig==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_03,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 bulkscore=0 impostorscore=0 spamscore=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512240109

Hi All,

Here is v4 of my series to make the "mainline" mt9m114 driver work
on devices with an atomisp CSI2 receiver / ISP. This has been tested on
an Asus T100TA.

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
Hans de Goede (15):
      media: aptina-pll: Debug log p1 min and max values
      media: aptina-pll: Add comment documenting the PLL chain
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
 drivers/media/i2c/aptina-pll.c |  12 ++
 drivers/media/i2c/mt9m114.c    | 257 ++++++++++++++++++++++++++++-------------
 3 files changed, 190 insertions(+), 80 deletions(-)
---
base-commit: b70886ff5833cf499e77af77d2324ce8f68b60ce
change-id: 20251224-mt9m114-atomisp-31a4d366328a

Best regards,
-- 
Hans de Goede <johannes.goede@oss.qualcomm.com>


