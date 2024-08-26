Return-Path: <linux-media+bounces-16810-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A15D95F259
	for <lists+linux-media@lfdr.de>; Mon, 26 Aug 2024 15:05:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BD95A1C2138E
	for <lists+linux-media@lfdr.de>; Mon, 26 Aug 2024 13:05:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67F1E17BEAE;
	Mon, 26 Aug 2024 13:05:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OvVYuUsc"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 433A91E519;
	Mon, 26 Aug 2024 13:05:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724677539; cv=none; b=IeBmOh1hPhXvYhnQQU+nZ5Dd52iVylHPMaStrLOoXJ5IdsH8jlZxNYkisa35JkK1tXHqGP9FTiR8Z8zejY0BSVGi5hOuBfGMf12zcPmK89HdQau/sKM9N7kSgJfKJpG1D+ex5PyK+qqnfyNAcFQoIQLZryKwU3HZDnPRlmH66s0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724677539; c=relaxed/simple;
	bh=j2r/lmA61y33v49zUYY94K+XWBgzrrigQwUGGXBaxnA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=qsAXcAplIYJ/psFPdFfmQGA4/2ei7qXDwFbBE+jcI6l6eipoHB3SEmEF0b5oGmZz01OKwoTIxGuqZ0RWetjo/zxKxVa/0w5rycinYq/AeT+WYIu543VhWkz7R+3uDAAR0iI9iV0MC9X9blDFoE+rPtu6Yu8CZLVHMqBTkU9pun8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OvVYuUsc; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724677539; x=1756213539;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=j2r/lmA61y33v49zUYY94K+XWBgzrrigQwUGGXBaxnA=;
  b=OvVYuUscftYu5LoOLM3zaoHslGilEyx/hs0dCFYqUUtYixx87j8BwVnv
   ZSFrp+HzYZzU8zpasKveYY7NLwUpFtF7KO+ElkypRXzMd3l160QcR9My1
   KTwm7u2Fg2Gvgq9mrrnzT97QwErwa6JrdBWg5Zpwoxaj6QDIbYUsiPKW4
   3HpldILtIom1FTcd9T3DhS+wS8nKx5x3a5AoUr7FY/BG339Z8lS8O2i1n
   pW52fHYiv3NwAQHuM4xDPoYW4hUht/Mr54obBMQnYLYWJQh18YAZzMmRQ
   5Hm8awroT3XCjoZM67TJUC89hqWKRUfWaMxfTHIkgBoj5ZeoRm+QgAATl
   w==;
X-CSE-ConnectionGUID: 8WDY/3BCRBybOO2zd49+zw==
X-CSE-MsgGUID: ISYQkqrRRWyO40GtdEGjfQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11176"; a="23278408"
X-IronPort-AV: E=Sophos;i="6.10,177,1719903600"; 
   d="scan'208";a="23278408"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2024 06:05:38 -0700
X-CSE-ConnectionGUID: wD9i0zzqSICHlsUqseS50g==
X-CSE-MsgGUID: j/b2cHPOQ6aqXtTFrfh/hQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,177,1719903600"; 
   d="scan'208";a="62476672"
Received: from ubuntu24.iil.intel.com ([143.185.122.15])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2024 06:05:35 -0700
Message-ID: <a717a912035b0a0f82b2f35719cca0c5269e995f.camel@intel.com>
Subject: [PATCH 2/2] uvc: Add luma 16-bit interlaced pixel format
From: Dmitry Perchanov <dmitry.perchanov@intel.com>
To: linux-media@vger.kernel.org, linux-usb@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com, mchehab@kernel.org,
 sakari.ailus@iki.fi,  demisrael@gmail.com, gregkh@linuxfoundation.org
Date: Mon, 26 Aug 2024 16:05:04 +0300
In-Reply-To: <c7c24f3f6661e5a01aae4e7ef549801411f063cb.camel@intel.com>
References: <c7c24f3f6661e5a01aae4e7ef549801411f063cb.camel@intel.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

The formats added by this patch are:

        UVC_GUID_FORMAT_Y16I

Interlaced lumina format primary use in RealSense
Depth cameras with stereo stream for left and right
image sensors.

Signed-off-by: Dmitry Perchanov <dmitry.perchanov@intel.com>
---
 drivers/media/common/uvc.c | 4 ++++
 include/linux/usb/uvc.h    | 3 +++
 2 files changed, 7 insertions(+)

diff --git a/drivers/media/common/uvc.c b/drivers/media/common/uvc.c
index c54c2268fee6..027498d37464 100644
--- a/drivers/media/common/uvc.c
+++ b/drivers/media/common/uvc.c
@@ -120,6 +120,10 @@ static const struct uvc_format_desc uvc_fmts[] =3D {
 		.guid		=3D UVC_GUID_FORMAT_Y12I,
 		.fcc		=3D V4L2_PIX_FMT_Y12I,
 	},
+	{
+		.guid		=3D UVC_GUID_FORMAT_Y16I,
+		.fcc		=3D V4L2_PIX_FMT_Y16I,
+	},
 	{
 		.guid		=3D UVC_GUID_FORMAT_Z16,
 		.fcc		=3D V4L2_PIX_FMT_Z16,
diff --git a/include/linux/usb/uvc.h b/include/linux/usb/uvc.h
index 88d96095bcb1..1c16be20c966 100644
--- a/include/linux/usb/uvc.h
+++ b/include/linux/usb/uvc.h
@@ -118,6 +118,9 @@
 #define UVC_GUID_FORMAT_Y12I \
 	{ 'Y',  '1',  '2',  'I', 0x00, 0x00, 0x10, 0x00, \
 	 0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
+#define UVC_GUID_FORMAT_Y16I \
+	{ 'Y',  '1',  '6',  'I', 0x00, 0x00, 0x10, 0x00, \
+	 0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
 #define UVC_GUID_FORMAT_Z16 \
 	{ 'Z',  '1',  '6',  ' ', 0x00, 0x00, 0x10, 0x00, \
 	 0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
--=20
2.43.0



