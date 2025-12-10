Return-Path: <linux-media+bounces-48550-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 943B2CB2CF2
	for <lists+linux-media@lfdr.de>; Wed, 10 Dec 2025 12:24:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0334630B0242
	for <lists+linux-media@lfdr.de>; Wed, 10 Dec 2025 11:24:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBBD12F7AB0;
	Wed, 10 Dec 2025 11:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Soy2Sv2d";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="h6Sf8sp7"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91598287510
	for <linux-media@vger.kernel.org>; Wed, 10 Dec 2025 11:24:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765365882; cv=none; b=F0jv8pUyHV3isB1V3kr7Y1aqlvH00SCrK6dpfakXohshGcpfcjiC/1lqr4MZ36MVTYMCLy3JtH+R+xyL0OU1qPauCpYkwpHq+PWcEhK5eSiOoQtNGpTtaNv+BHpkEshaMnrr+tfdHwwkBol+CHB29aajqLrqKJbFwTtHu3ZsSmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765365882; c=relaxed/simple;
	bh=7yxj017La3S2cG+gsPm3QJV2O14r9DS8t/s2bvSBZvA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=TY1OfoIhwK38IHww02zIPm2+ZwGtPTvHlqyOr/+ehOCw++M2Ln2aZ4LBHM29V2r1UnyHVDDcDC6W5gtnCK29TLVKX5PRouq/mR2X5bK0WUhj427/kP8gLCvMKyD4B8HUyCaGiCNr2N1AyhwrkuJ/Anwfi7au+zrzG1C+VksIW1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Soy2Sv2d; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h6Sf8sp7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BAB6Fnc2752650
	for <linux-media@vger.kernel.org>; Wed, 10 Dec 2025 11:24:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=3vsZSqGyU2aJPkpg4QRsl3
	w4HqIccGSAqXUBAn0TfTA=; b=Soy2Sv2drTV56Ta+WBw355coQjp6qxN+ftY7ab
	ys5MN/XPtcCpAcaA4uIhe7NisvQVraHnnQwiQrgTuuCQlFpYyt4JAQE7otxFCnf1
	7oagkCNCLOIKE0ruxtaUqlsc7wVu8dUHINyvndBkZc6WLOsNB0ySD2uxjvsb2ZaG
	36jbMST3wYSCCw/ZDuI72p+gll0AyhqRwoCeCDNA4NR6glF4IU2X1TIzG0tcUlSY
	BijHRQ07Dzn2ayc0f4S3yKfd5qEuVLQE04Oew5fa6ElGaP/ux4oHLhYNFpQgXtyW
	beLDFAMeXe6ps7hYoACmXUDIqKf+tk1JvYoKzZGR4JvAPW2g==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ay7pm81aa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 10 Dec 2025 11:24:39 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ed6ceab125so16038841cf.1
        for <linux-media@vger.kernel.org>; Wed, 10 Dec 2025 03:24:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765365878; x=1765970678; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3vsZSqGyU2aJPkpg4QRsl3w4HqIccGSAqXUBAn0TfTA=;
        b=h6Sf8sp7uolYj4+2xDHHJcmDtriRv8m1JywM4Ss7mrv7oTMcRCCPiJf2fzs2LxeJv8
         vRRfKi2U/Z3ULYBn8TOe+KVu0XHTPtWCmu/Y2P5MKIXM8xcU32aB6+Do3zgdu/3zMc3A
         ME8ungXfSxLV8+eh4s1Y6tGIqyqyocDlsmjcclqPZfv6btOJiSMQAWAqFHGXW0EspWJF
         ntBoiQhnU+ak1/S/U0mSgMdGzQpbynGNZFsSqyTuvlBZhzbKx5qQiIuHQapVYFWKaDyy
         VoshfaWHbPrAPnvVmHZYsZhzAWk4EwBVAZrXahuf7Tbjn9orKgAnRzbXF20Et8du7cDc
         w+bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765365878; x=1765970678;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3vsZSqGyU2aJPkpg4QRsl3w4HqIccGSAqXUBAn0TfTA=;
        b=GhQa6nZQH7o5a5OticzU0nt25eRp4VC+GATMxklF6hoWiJxNibAEkIBCYZ+9LRBOl6
         +4/dYvlRryyUBpDnyhnuowd94+eBLYmncz3KTj1wvU9UWTlBy89emNzJ/wj5skV7Zk8b
         EVdAqm+THae7M07LcyiJlUOcwjTbHa5TAu5xxykq+nsyOxcBN7xDDYhq6bFg75XhiBib
         ilsY64Y+pbUCqBnWrpdHlDB78KQfvaHQwwVh/luT+mGbb5xZUqnxKq7q4Zz7keds4X/O
         wVniemv9Bm4eCFPmXmEP1P+vv9jgbpSaMNKuXP6vjXRwhCj9zGgH7PCBDI3NrPp7UUFx
         ci5A==
X-Forwarded-Encrypted: i=1; AJvYcCXY7778rmeIsJs77gI5hcIsx/xjhbn0D9MCtsPEsdSOJWL38GL25EZwX8iDVj9K74AP0eyD4bE84Q5eLQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxL7bn2u+NfwVW9pV+zxT6CXAeYvWKgk9SSF9qQS8DmH/1islPL
	j17pnMdQqgVj0NKcjvDuX9ZDZpgIplRYQMJkXrvRy1V4DD3kqmUE42YpLdP6g9mFUE/4vIykO5b
	wkeB2s3waNMb0iJ8kQBKgFMifdLDhuFZLpw2BEcHoBp4TVLbcUXNjt9+QekatqmTKGw==
X-Gm-Gg: ASbGncu2l0NmN9+YPhsN1a0/kDPZLWvotryhsHZn+iO+Y5/EU25j2MlObb0ByReRoPg
	GuQWchQUdtj6cy2qxH/SCH/36hkoNR9k/Y+zRd6fZhzpJ+pMJUWQ3wUIHTD8IceW34d62DStTLE
	JS/55LFcE/V1X7/oXw2sfCyM/gsq7nBIeAje6OT9e5R0/N1VNn0+jOzipAoOUGsujYleO5f65Tg
	aF7s1hiiGvNargM/TZNQPV/IpkJ28ETFYkYQfzAdOo0hOSp33oWWU/Uz7ZXyKIc4u5Nq1vViqdI
	/Fz4O3wDYPP1vaai+sKmi8ov4hpc/05HCw0ZRwRTXy/GSPICegW1EHTMAj5d5zkFTrprcDNx8X4
	6dQwLt5MtOMVcQ4Ndj3ycHQPsbfxf4uJ3kTTKBtxPCgVIvUqK4O+82hlPUn0U5Ti54Y2gmDnJsc
	bXTv4iqiU5kiX8cmOZrsauROkv
X-Received: by 2002:a05:622a:1f0f:b0:4ee:209c:be59 with SMTP id d75a77b69052e-4f1b1b4bdaamr28303201cf.55.1765365878607;
        Wed, 10 Dec 2025 03:24:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH3RRz4uQPhckvuYgT5nWMxtxVKqU2SK+35nyT9fOWcD6XfeyCpvK0XnE8GHy8H0CHHQd4QFw==
X-Received: by 2002:a05:622a:1f0f:b0:4ee:209c:be59 with SMTP id d75a77b69052e-4f1b1b4bdaamr28302931cf.55.1765365878218;
        Wed, 10 Dec 2025 03:24:38 -0800 (PST)
Received: from shalem (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b79f49e3fb1sm1696851266b.60.2025.12.10.03.24.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Dec 2025 03:24:37 -0800 (PST)
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
To: Hans Verkuil <hverkuil@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: Hans de Goede <johannes.goede@oss.qualcomm.com>,
        Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
        Sebastian Reichel <sre@kernel.org>, linux-media@vger.kernel.org
Subject: [PATCH v2 regression fix for 6.19 0/5] media: ov02c10: h/vflip fixes
Date: Wed, 10 Dec 2025 12:24:31 +0100
Message-ID: <20251210112436.167212-1-johannes.goede@oss.qualcomm.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=A7Jh/qWG c=1 sm=1 tr=0 ts=69395877 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=K1k7YRTbuB37JFXKyG4A:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: 1cTl_5V2V8ZL_BYG4LMnYmeCD57Sw-uV
X-Proofpoint-ORIG-GUID: 1cTl_5V2V8ZL_BYG4LMnYmeCD57Sw-uV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEwMDA5MSBTYWx0ZWRfX534glS4jiiUi
 PuqSlfMfDcWM+zQWyzYRCPTyRPASUEIwwjvXkH12Nn72U8m+xvkR8Iuzm/Aq8ce2KyLx4n05G5b
 qNbzZvtn7VSjqUTMw4B6S/gp+m3QLUkEB6dhAmLiFSfo2q2XbZjwWP7eycBaFtmb121J734M4Ld
 5Zx+UPxZQJKrlw12APYLFvAALMnCVBKaWkfdcE+Tbgx80dCw7U4MVR88EIluPh/+EgJzaPwVPgP
 kfcranyenElcuhcY2Ff+l1Vw9KdFEmPujuS7Xb/oWW5wCC8WqQuWtd8g9BT38Xe1wJvrP2cdGRN
 hW8b4t6cnXnURog4roN0cl6tXeh6lCuFeAsqTefDowPweVbV57Xla9fqNbm/17+t3B6+BTga5LF
 S5IOgkETLUL4zGlRV/qnKqfPXyosaw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-09_05,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 priorityscore=1501 adultscore=0 phishscore=0
 suspectscore=0 clxscore=1015 bulkscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512100091

Hi All,

Commit 69fe27173396 ("media: ov02c10: Fix default vertical flip") which
has been merged this merge window is causing various problems for
laptops with a ov02c10 sensors:

1. This changes the vflip default but does not update the bayer-order
   leading to debayer artifacts and wrong colors

2. The ov02c10 driver was originally developed on a XPS 16 9640 which
   has its sensor upside down. Changing the vflip (and hflip) default
   values fixes the image being upside down on other laptops, but will
   cause a regression on Dell XPS models causing the image to be upside
   down there.

3. The mentioned commit only changes vflip, so the image now is upside-up,
   but it is still mirrored.

Patches 1-4 of this series fixes these issues. Patch 5 is a follow-up
cleanup patch.

Hans Verkuil, can you please queue these up as fixes for 6.19?

Changes in v2:
- Fix Fixes tags to use the correct commit hash
- Fix compile error in patch 4/5 when CONFIG_ACPI is not set
- Add Bryan's Reviewed-by to all patches

Regards,

Hans


Hans de Goede (5):
  media: ov02c10: Fix bayer-pattern change after default vflip change
  media: ov02c10: Adjust x-win/y-win when changing flipping to preserve
    bayer-pattern
  media: ov02c10: Fix the horizontal flip control
  media: ipu-bridge: Add DMI quirk for Dell XPS laptops with upside down
    sensors
  media: ov02c10: Remove unnecessary hflip and vflip pointers

 drivers/media/i2c/ov02c10.c          | 28 +++++++++++----------------
 drivers/media/pci/intel/Kconfig      |  2 +-
 drivers/media/pci/intel/ipu-bridge.c | 29 ++++++++++++++++++++++++++++
 3 files changed, 41 insertions(+), 18 deletions(-)

-- 
2.52.0


