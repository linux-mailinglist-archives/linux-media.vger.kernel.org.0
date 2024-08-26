Return-Path: <linux-media+bounces-16808-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F09D295F243
	for <lists+linux-media@lfdr.de>; Mon, 26 Aug 2024 15:00:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2FD851C210FB
	for <lists+linux-media@lfdr.de>; Mon, 26 Aug 2024 13:00:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6195917279E;
	Mon, 26 Aug 2024 13:00:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VDyyy37Y"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19F957E1;
	Mon, 26 Aug 2024 13:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724677225; cv=none; b=oD+2UmRdaTHh03yOy8RDczjMbr4llyLC4thzwnkQQaDgTVGxLu+igP9LTE+A3OvLzH0yiWEN7EYIKTLqxCrEyvqiZ8y/PzHukfsUMniZ2nfjqt5d240qaBpMGZeIl2ebglPdXHKLGFZHq51CD+CGX1jRwOS8FjQ3QWxT30MAw7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724677225; c=relaxed/simple;
	bh=3is/A/6g/chRI0kNCB8CMXeXg4vbikXwkTlsMBaPK0g=;
	h=Message-ID:Subject:From:To:Cc:Date:Content-Type:MIME-Version; b=AD6DY8sa/yU1XVIHsmj2ChQOYaRteLM+n73A014DTCIz6UV0eyhnNtvdBUseNknCwb3+HfhO8MR0cDrYGRbYgFqADeb+DxHeUzxOy4nWlyy1CM7UVudEtiBnUDy8t1sj9ZChKN2xKiW48nwmySp8BgdfO67mkS6cYXH3zEpCV0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VDyyy37Y; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724677225; x=1756213225;
  h=message-id:subject:from:to:cc:date:
   content-transfer-encoding:mime-version;
  bh=3is/A/6g/chRI0kNCB8CMXeXg4vbikXwkTlsMBaPK0g=;
  b=VDyyy37Y7eUnLEPtzUnMBxQaWSRUAYsD50EOww+BQ3L6uYWRuvTYpauP
   S2z6tpfO1JenDtvOdfAD++l1doEp5VsiIyvpDOWCWAZmPPX0fid7xGKmi
   O1zJHWP8uz9l8l3dW7LDtAmifHyrDyBQdfChOVAIVpJZg6FvwOs6qutNb
   rlb7BksEcTAXFAcczWpDsi/fl5vppA8ewty8B5uc/QLPBgUtVDZiGgp7v
   ES2iDZR/5Hm4TVg7hxxTKRxxZPtx/h6KNipve9YGrfUcnV/Nj+bWye7k1
   tqrgN/SNGgRtfMnKU4cnDCJ0wnEfC6a1aN8SiwDlt+dF9ad0YlcmMIpRS
   g==;
X-CSE-ConnectionGUID: OCoUDrfQQbGSDX6h7KL1sg==
X-CSE-MsgGUID: oMd3E1QqT0G+N3Fa4NELYA==
X-IronPort-AV: E=McAfee;i="6700,10204,11176"; a="26891122"
X-IronPort-AV: E=Sophos;i="6.10,177,1719903600"; 
   d="scan'208";a="26891122"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2024 05:59:07 -0700
X-CSE-ConnectionGUID: oOZBIGsrScKFds0cAbg3Bg==
X-CSE-MsgGUID: yOAOpmyyQHW2e9ZhaRsUmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,177,1719903600"; 
   d="scan'208";a="93307504"
Received: from ubuntu24.iil.intel.com ([143.185.122.15])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2024 05:59:04 -0700
Message-ID: <c7c24f3f6661e5a01aae4e7ef549801411f063cb.camel@intel.com>
Subject: [PATCH 0/2] Add luma 16-bit interlaced pixel format
From: Dmitry Perchanov <dmitry.perchanov@intel.com>
To: linux-media@vger.kernel.org, linux-usb@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com, mchehab@kernel.org,
 sakari.ailus@iki.fi,  demisrael@gmail.com, gregkh@linuxfoundation.org
Date: Mon, 26 Aug 2024 15:58:31 +0300
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

        V4L2_PIX_FMT_Y16I
        UVC_GUID_FORMAT_Y16I

Interlaced lumina format primary use in RealSense
Depth cameras with stereo stream for left and right
image sensors.


Dmitry Perchanov (2):
  v4l: Add luma 16-bit interlaced pixel format
  uvc: Add luma 16-bit interlaced pixel format

 .../userspace-api/media/v4l/pixfmt-y16i.rst   | 74 +++++++++++++++++++
 .../userspace-api/media/v4l/yuv-formats.rst   |  1 +
 drivers/media/common/uvc.c                    |  4 +
 drivers/media/v4l2-core/v4l2-ioctl.c          |  1 +
 include/linux/usb/uvc.h                       |  3 +
 include/uapi/linux/videodev2.h                |  1 +
 6 files changed, 84 insertions(+)
 create mode 100644 Documentation/userspace-api/media/v4l/pixfmt-y16i.rst

--=20
2.43.0



