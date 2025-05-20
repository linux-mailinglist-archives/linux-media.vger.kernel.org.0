Return-Path: <linux-media+bounces-32921-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B5842ABD921
	for <lists+linux-media@lfdr.de>; Tue, 20 May 2025 15:18:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 83D537A31F6
	for <lists+linux-media@lfdr.de>; Tue, 20 May 2025 13:16:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2E6D2417C4;
	Tue, 20 May 2025 13:18:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="mWJahKP+"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A2AF24168D;
	Tue, 20 May 2025 13:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747747087; cv=none; b=pAjEKDNpli3O+ZBnC1QSLaeG8aBWbrc/XXK9Mueu1r2BxFjVqHnV8kCB6rfw6OSP5Ahibm/CX1sWxU7zZHoR/cqukhLYOR9gjUlN4O9R1yMhYQPmJk6y62sYth/updHqrb1cpW1C04Yjc7oIGCXIxXYffAZHWDnwj366Dl/o9PE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747747087; c=relaxed/simple;
	bh=12sxSexrPftwam4EVzQzaBGgKY0Ix96koleT5+KTJ4g=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=o8LPWghZvJXBvZlLuaPd0qGAcCf5ZMYhLyWlQRrCNG+xphTwcFN5kaLfHMnwDUyJ5LxQnMJsaSEo6GeGlffuVQLpnizULZewtNz5USN03a+kfXWfRJ3H+9At9S/WZFEWWTkQQptXnhSu4SFmfpTrPDM69MhG5TIydMhoU3J8F3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=mWJahKP+; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id F104D74C;
	Tue, 20 May 2025 15:17:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1747747057;
	bh=12sxSexrPftwam4EVzQzaBGgKY0Ix96koleT5+KTJ4g=;
	h=From:Subject:Date:To:Cc:From;
	b=mWJahKP+H81H15HXLpZuXmzfRIWb0d+vDRGnwJAEpnaiedGEaLLaELvubI6L4aCTH
	 Ep6Irt7j6bmoVKxIiMrSLPQLY7RAp2rdfv1ejcLwjceoYWC7A14ImxVBaK1Wp4R7xq
	 eIoCGW7Ddpc1z7I7zJNUcmWI3TjQ2Vp+vg+MToD0=
From: Daniel Scally <dan.scally@ideasonboard.com>
Subject: [PATCH v2 0/3] Support OV5670 on IPU3 devices
Date: Tue, 20 May 2025 14:17:43 +0100
Message-Id: <20250520-djrscally-ov5670-v2-0-104ae895aecf@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPeALGgC/x3MQQqAIBBA0avErBNkYoq6SrQQnWpCNBSikO6et
 HyL/wtkTsIZpqZA4kuyxFCBbQN2N2FjJa4aUCNpQq3ckbI13j8qXtQPWhFbcuNqHHUGanYmXuX
 +l/Pyvh9vGqTSYgAAAA==
X-Change-ID: 20250520-djrscally-ov5670-5ec5d9fad53a
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Daniel Scally <djrscally@gmail.com>, Hans de Goede <hdegoede@redhat.com>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: linux-media@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
 Daniel Scally <dan.scally@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=974;
 i=dan.scally@ideasonboard.com; h=from:subject:message-id;
 bh=12sxSexrPftwam4EVzQzaBGgKY0Ix96koleT5+KTJ4g=;
 b=owEBbQKS/ZANAwAKAchJV3psRXUyAcsmYgBoLID+yFr8c0e+05Cw895+RH/NrPZq/GofEakyF
 QSLXscI0ESJAjMEAAEKAB0WIQQqyuwyDnZdb+mxmm/ISVd6bEV1MgUCaCyA/gAKCRDISVd6bEV1
 MvHdD/4zKyw0FyXpG6Tyxp0rIGtN5I0ip9KF/d/JZOkcgnq7U7GauXb8B3zgySf+mcQMZqnd8Et
 zYrMXVIJ47SFg8BjrJtlHTLBVDP/71ip4EyE40NKsHqlfbrqnW6lStbD8QHbF7GNrsGDwN/+Vp6
 cL5SE837tWJJV+j2c3IGQ+7uL3p2NMtZ6jcCfvdnDd4w31oLrcft2yx3UOdoyS4gtCoReGGQFji
 h4ZzQiBEV3RzSlnlpjW+iEImaNelvoGlmJTeVNfjq6T1ryd1u8wW6madfhsLcK7NpC0/wkAqyOQ
 HZObXr7CmJM21ikYYTUfH48t5FuQc0u41VoIHRtO0oyqJ60KGeObNDby+QtlGLEuL/m3NOyVUyO
 4Cia7eeoEbNmT8y81B/EoWYF3bvTqAIEfinM40/DqypPamWH36RShba0PnHk6pmqA39iVQXbIwu
 p3nwb+9roxmbldb6sFMmfVx1FFC1o2yNllLPkJA/DSYpRzx8zI+TH/W4kliARTLX8r7LoPLp4lb
 v/MiyQUD2UHQa5FcNoZuzv7CDrPgj3NryZ14PkLiYaEBoI9bFPVnWYSCsD7j/tdzhNhctAScIJr
 xcQyCXq1lkmQGHrwTnsQYyOO0mR4pmaa8m1+Rq/SJFrjQOc+EAfEeqqxu3yvQNQw+M6VROXjNSp
 /g0yCfBfbhKbhhw==
X-Developer-Key: i=dan.scally@ideasonboard.com; a=openpgp;
 fpr=EEC699ACA1B7CB5D31330C0BBD501C2A3546CCF6

Hello all

The OV5670 is found in the Dell 7212 tablet, along with an IPU3 ISP. This small
series adds support for the sensor by connecting it through the ipu-bridge and
adding board data for the PMIC so that it can be powered.

Changes since v1:

* Commas following the final member in a struct definition in patch 2

Regards
Dan

---
Daniel Scally (3):
      media: i2c: Defer ov5670_probe() if endpoint not found
      platform/x86: int3472: Add board data for Dell 7212
      media: ipu-bridge: Add _HID for OV5670

 drivers/media/i2c/ov5670.c                         |   9 +-
 drivers/media/pci/intel/ipu-bridge.c               |   2 +
 .../x86/intel/int3472/tps68470_board_data.c        | 128 +++++++++++++++++++++
 3 files changed, 137 insertions(+), 2 deletions(-)
---
base-commit: b64b134942c8cf4801ea288b3fd38b509aedec21
change-id: 20250520-djrscally-ov5670-5ec5d9fad53a

Best regards,
-- 
Daniel Scally <dan.scally@ideasonboard.com>


