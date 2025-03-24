Return-Path: <linux-media+bounces-28628-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E320AA6D9B2
	for <lists+linux-media@lfdr.de>; Mon, 24 Mar 2025 13:02:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BBF9F3A2A56
	for <lists+linux-media@lfdr.de>; Mon, 24 Mar 2025 12:01:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EBBD25E461;
	Mon, 24 Mar 2025 12:02:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="BFotkZBy"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BED025C6F5;
	Mon, 24 Mar 2025 12:02:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742817724; cv=none; b=BEGgm6EPMJ2OhQYI3SvgOEtE6HkT0aefg7Bjc6qaP28BOkbJwxVCTf7lMsEDBsiIPy9+KztTthfSyGv/XqFJlZaQLTJfm6HaJsno1N3Pm+Vs2zdBxhIEAvYBG/9chji89II+/EZTrQh6/xSFoPqSWcXWvkhllXSOnxklf6sQ5Uo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742817724; c=relaxed/simple;
	bh=/dV9MUc2Op5+pvhi2Vp2s8XMfSAPhlqmS8TGQ+mYzVs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=gkmFKUSfe6dtL7G2BYaCKJVEqB1z239k/NIOYWghaahzXIFOgkrVywruEJjtzwZTaok80nQE9qWgB9NsKIIz/6sDGpkep4ItxSWQkK+wFuY+Qmxo/PRsFWz5/IcS+b452k6brsakpUku4WIujja4d5ItyM5yd4/LL6Maygotf/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=BFotkZBy; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c68:904a:b2d:8d57:4705:738e])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1374B455;
	Mon, 24 Mar 2025 13:00:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1742817614;
	bh=/dV9MUc2Op5+pvhi2Vp2s8XMfSAPhlqmS8TGQ+mYzVs=;
	h=From:Subject:Date:To:Cc:From;
	b=BFotkZBydLc/D29WHWTjW/VcMx+0FxyWmJzzsqBuiTn/uoeYtX0MrvPU8C+Kd9GIF
	 ohsSCuwhq16DFOVIpARhfaFYYbmePVXApo+MGMVtIGAY9NoqrE/jf8h+W1FwfsF0MB
	 vVVtyhB74iYx/n8VVDNkSHs2NBqrn0WLbd6LqLtQ=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Subject: [PATCH 0/6] media: ti, cdns: Multiple pixel support and misc fixes
Date: Mon, 24 Mar 2025 17:31:36 +0530
Message-Id: <20250324-probe_fixes-v1-0-5cd5b9e1cfac@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKBJ4WcC/x3LQQqAIBBG4avErBMsC6GrRETZX81GYwYiCO+et
 Px4vJcUwlAaqpcENyunWNDUFYVziQcMb8XU2ra3runMJWnFvPMDNR4Wwbngd4DKcQn+UIZxyvk
 DW8rKSl0AAAA=
X-Change-ID: 20250314-probe_fixes-7e0ec33c7fee
To: Jai Luthra <jai.luthra@linux.dev>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil@xs4all.nl>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>
Cc: Devarsh Thakkar <devarsht@ti.com>, 
 Rishikesh Donadkar <r-donadkar@ti.com>, Vaishnav Achath <vaishnav.a@ti.com>, 
 Changhuang Liang <changhuang.liang@starfivetech.com>, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jai Luthra <jai.luthra@ideasonboard.com>, stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1684;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=/dV9MUc2Op5+pvhi2Vp2s8XMfSAPhlqmS8TGQ+mYzVs=;
 b=owEBbQKS/ZANAwAIAUPekfkkmnFFAcsmYgBn4UmwMEkRFw1FySwIxcsufydfvWSBoDgiU0Lg/
 xB7h8vSBqiJAjMEAAEIAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCZ+FJsAAKCRBD3pH5JJpx
 RRXjEACLSZph72bUqCMJyyKWbRMFfuXXOtWEYPFxioZmeoVfmGWSCnIfsCigmyt+vaXYilxRwkk
 +Lq87Pk/IH3hDxtzNNY5yFTuClcnXQxS0lJegWFPLpLGncetu/9nVnEG/Mc9DQwWjTaUp1x8Go1
 P9IfbjzpjtGxUb9xhwV6ti7uLFe1459uji04mEAHSyQDhEHZDLLFibey7quepzAJ+1GES1jzI8H
 tFRt8zZfTauo5mUNGIFivJRxWlNCUdsHnYRNuMKLtb7JLQpDwMFE/QHcCBoay0Wpww8Xx70ttMC
 pvCijN6X31d80r5Tl6ea9eIJ69qhyV0g4mXasdpsLMgaYWR4xQWODxKqFsgXzqgX5cbqba/3WGv
 zx9WGbLGHZa2RtbJhd0PmIitWuEROB9Fg19LO+RtOO4xf1z1+3aZTDC2Wt8srkbLt50Cdy4r40y
 zWVUsraNpa6rdIdOiZzCy6BOdupXBtJhbFTHHkm5ngDBlBls6ynO6/6guZzvA9Vkk/0Vm6qgolo
 nw5ydQ/917FSb1wqHy0sSap5PJFk74/86+uXheQsNg177fkWYK31NxDdYch5AZmCK2CMqt3x7X+
 bEI0MH8wAf6o83RlFII29KmS8dq60ypP/R2mZAMSbFS7Scx6JtG3fVe+kLnjWq5NWXWXyBhJ2MU
 HG9+A0KGuNe3ULQ==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145

Hi,

The first four patches in this series are miscellaneous fixes and
improvements in the Cadence and TI CSI-RX drivers around probing, fwnode
and link creation.

The last two patches add support for transmitting multiple pixels per
clock on the internal bus between Cadence CSI-RX bridge and TI CSI-RX
wrapper. As this internal bus is 32-bit wide, the maximum number of
pixels that can be transmitted per cycle depend upon the format's bit
width. Secondly, the downstream element must support unpacking of
multiple pixels.

Thus we export a module function that can be used by the downstream
driver to negotiate the pixels per cycle on the output pixel stream of
the Cadence bridge.

Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
Jai Luthra (6):
      media: ti: j721e-csi2rx: Use devm_of_platform_populate
      media: ti: j721e-csi2rx: Use fwnode_get_named_child_node
      media: ti: j721e-csi2rx: Fix source subdev link creation
      media: cadence: csi2rx: Implement get_fwnode_pad op
      media: cadence: cdns-csi2rx: Support multiple pixels per clock cycle
      media: ti: j721e-csi2rx: Support multiple pixels per clock

 drivers/media/platform/cadence/cdns-csi2rx.c       | 75 ++++++++++++++++------
 drivers/media/platform/cadence/cdns-csi2rx.h       | 19 ++++++
 drivers/media/platform/ti/Kconfig                  |  3 +-
 .../media/platform/ti/j721e-csi2rx/j721e-csi2rx.c  | 66 ++++++++++++++-----
 4 files changed, 128 insertions(+), 35 deletions(-)
---
base-commit: 586de92313fcab8ed84ac5f78f4d2aae2db92c59
change-id: 20250314-probe_fixes-7e0ec33c7fee

Best regards,
-- 
Jai Luthra <jai.luthra@ideasonboard.com>


