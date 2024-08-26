Return-Path: <linux-media+bounces-16820-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 453A595F3D7
	for <lists+linux-media@lfdr.de>; Mon, 26 Aug 2024 16:28:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C308BB21883
	for <lists+linux-media@lfdr.de>; Mon, 26 Aug 2024 14:28:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47F3F189B9B;
	Mon, 26 Aug 2024 14:28:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WnUS5WbL"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2DFC1E864
	for <linux-media@vger.kernel.org>; Mon, 26 Aug 2024 14:28:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724682492; cv=none; b=uXO+24qwtxD1N4eIrNuTCIMo/dvAh3/waWqlYhCW6iXU87MMOrUZGcUevBAz7v4Gkz57vvuqyK2/+Ro1p+add+3/nA6G4iDsRcX2ueQE1we2VrCmtusFi4MA2ga+eXi00/DEvmB+SF97gUZpIVEGgKxSU5O9oWR3hIrrP5Mq19U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724682492; c=relaxed/simple;
	bh=6xZvVCR9gV/QYjMs3/yklGWxQ9SxEkGFrlW/mLvZpXU=;
	h=Message-ID:Subject:From:To:Cc:Date:Content-Type:MIME-Version; b=tQGnooAc6PfLTsqE6jTz5Sn/arG+VxReDmMsD7E09E6n0wd/E8uEi+q/9PMV4J2JE5KvguRinpBnB80n0qaf3sFgbat/Y85A7z5h2KE/pys8aaaW61BEjjliD6ZNtrIWjOMIakr5M8wSmiobpOPtIwT953K++hR69OACHFS7Zns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WnUS5WbL; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724682491; x=1756218491;
  h=message-id:subject:from:to:cc:date:
   content-transfer-encoding:mime-version;
  bh=6xZvVCR9gV/QYjMs3/yklGWxQ9SxEkGFrlW/mLvZpXU=;
  b=WnUS5WbL1sF30bMqItvZ3ozSu0MZ+dMf1uoidDg/1mtOQBD9GjL4DKel
   6+Ic0GCoeqwuwwT0AH5KnvrYEA3pQRl3Bm099Dw5qjbpgrFhC6WhNFsoy
   uBOxpSMBCWziI1/alBQLoDcqbbJ1IVgy6cpLImYhcXs4aZADUPOPXUz/r
   IGKiziAABy9CuLLJsz+PO0SSGicTASR+ge6A/OHRL3JT3Wdiy+lCPJPE3
   ClJHCc7T7GR5NXf9341Nefr7q6gl/tb3XrhBQIzBNgmog/jhO1akLt8/N
   yynUiQbfhfUrRBkVrf66VrVe7UhjVhB6YRBq0TivK0PMEk+sCX2AtyniK
   w==;
X-CSE-ConnectionGUID: IzADx+bnR2GH7J9sizoxRw==
X-CSE-MsgGUID: aec9DCUiSxu89N3fPy3Agg==
X-IronPort-AV: E=McAfee;i="6700,10204,11176"; a="34487356"
X-IronPort-AV: E=Sophos;i="6.10,177,1719903600"; 
   d="scan'208";a="34487356"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2024 07:28:11 -0700
X-CSE-ConnectionGUID: k90+ABTYTpetM0dns7KYMw==
X-CSE-MsgGUID: GVaKTQQ5QleQvZwawmZK6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,177,1719903600"; 
   d="scan'208";a="63060607"
Received: from ubuntu24.iil.intel.com ([143.185.122.15])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2024 07:28:09 -0700
Message-ID: <d1fbfbbff5c8247a3130499985a53218c5b55c61.camel@intel.com>
Subject: [PATCH] media: uvcvideo: RealSense D421 Depth module metadata.
From: Dmitry Perchanov <dmitry.perchanov@intel.com>
To: linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com, mchehab@kernel.org,
 sakari.ailus@iki.fi,  demisrael@gmail.com
Date: Mon, 26 Aug 2024 17:27:50 +0300
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

RealSense(R) D421 Depth module is low cost solution for 3D-stereo vision.
The module supports extended sensor metadata format D4XX.
USB descriptor: https://paste.debian.net/1327587/

Signed-off-by: Dmitry Perchanov <dmitry.perchanov@intel.com>
---
 drivers/media/usb/uvc/uvc_driver.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc=
_driver.c
index f0febdc08c2d..427fa5759c3f 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -3072,6 +3072,15 @@ static const struct usb_device_id uvc_ids[] =3D {
 	  .bInterfaceSubClass	=3D 1,
 	  .bInterfaceProtocol	=3D 0,
 	  .driver_info		=3D UVC_INFO_META(V4L2_META_FMT_D4XX) },
+	/* Intel D421 Depth Module */
+	{ .match_flags		=3D USB_DEVICE_ID_MATCH_DEVICE
+				| USB_DEVICE_ID_MATCH_INT_INFO,
+	  .idVendor		=3D 0x8086,
+	  .idProduct		=3D 0x1155,
+	  .bInterfaceClass	=3D USB_CLASS_VIDEO,
+	  .bInterfaceSubClass	=3D 1,
+	  .bInterfaceProtocol	=3D 0,
+	  .driver_info		=3D UVC_INFO_META(V4L2_META_FMT_D4XX) },
 	/* Generic USB Video Class */
 	{ USB_INTERFACE_INFO(USB_CLASS_VIDEO, 1, UVC_PC_PROTOCOL_UNDEFINED) },
 	{ USB_INTERFACE_INFO(USB_CLASS_VIDEO, 1, UVC_PC_PROTOCOL_15) },
--=20
2.43.0



