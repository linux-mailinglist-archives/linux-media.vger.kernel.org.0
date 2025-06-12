Return-Path: <linux-media+bounces-34620-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 77F6DAD70D4
	for <lists+linux-media@lfdr.de>; Thu, 12 Jun 2025 14:53:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0DFAA3A679D
	for <lists+linux-media@lfdr.de>; Thu, 12 Jun 2025 12:53:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64A03239E6B;
	Thu, 12 Jun 2025 12:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QYneCstx"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFA6B222574;
	Thu, 12 Jun 2025 12:53:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749732831; cv=none; b=ar1Ob6Vdj53Xy6e3uG4zwPpKfLIQev/JWMJJAJUDsrevbRTaa1xMlhtj/BCewXIOY3GgdYTsoSgysy7uClVkC1WLXIlFubkz1OoSqIgyqWmWrYNvap8DCyiN/jceVR8AuCMDE0LXdVcNFkfme6aAnnUFrBD+sNYJjLByI7qo4ts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749732831; c=relaxed/simple;
	bh=yFuplQaGraVB/jC46rCw01Nwl4q8Hzg2z9yTdGmI6Do=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ob5XLOWTD+73ZYs5Fv8t9GPvYOygLG0E70BbkVR76dTKWQJYKaXPDiShO2/L2DboqGMg4YmN+i2A6d25HO+P9QvPly53fS484Z4oB2ECAv3y8Y0PlMRYRpqMJnfCjSvRyfqo/3l/W66SrWmDtIH2VMK5xVZHCyRtM+dCfzBSmjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QYneCstx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD468C4CEEA;
	Thu, 12 Jun 2025 12:53:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749732831;
	bh=yFuplQaGraVB/jC46rCw01Nwl4q8Hzg2z9yTdGmI6Do=;
	h=From:Subject:Date:To:Cc:From;
	b=QYneCstx0rYtxjm+cOycDc959jas2xD6daUx7rd2F0kMXmlrQJDT0UoNdKrKnT/iC
	 Uv121RS8ya1diYa/jVOiJmBnvumat0zD71Imuwi5wje64ehbpzJhdv8XxWO1I1Vzdp
	 1/O6AcwSUfn/qWXILnysMmRV0+uTk9VqEeLmrXDQsGTuZh7DyEk51BygdcfaKPfhGu
	 vaigrzOIblu0n+gO7DDLBHFSPYKlF4gR5heSZlL/fU2BRt1aZ8pyTeRwn65qtK5l9r
	 803MM13LlCtHiufNV2xLA2GDD8e0CXOCPTCNKF0rjy8BygEyasIuxv4M07Un5kWMnN
	 Y/KeJbu9nyFKg==
From: Maxime Ripard <mripard@kernel.org>
Subject: [PATCH 0/4] media: Fix CSI2 RGB vs BGR pixel order
Date: Thu, 12 Jun 2025 14:53:38 +0200
Message-Id: <20250612-csi-bgr-rgb-v1-0-dc8a309118f8@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANLNSmgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDM0Mj3eTiTN2k9CLdovQk3SQLY3NLC4NkA4MkYyWgjoKi1LTMCrBp0bG
 1tQCJNqIAXQAAAA==
X-Change-ID: 20250612-csi-bgr-rgb-b837980c00b3
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil@xs4all.nl>, Mats Randgaard <matrandg@cisco.com>, 
 Alain Volmat <alain.volmat@foss.st.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Hans Verkuil <hans.verkuil@cisco.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1975; i=mripard@kernel.org;
 h=from:subject:message-id; bh=yFuplQaGraVB/jC46rCw01Nwl4q8Hzg2z9yTdGmI6Do=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBleZ2+ZtB2qbJwtPedtXMS8Zpn6R4oz3sl6zbC6x9E9u
 flcMH9ux1QWBmFOBlkxRZYnMmGnl7cvrnKwX/kDZg4rE8gQBi5OAZiIqBBjndr6h7NzE+fn/D8o
 v1aY/Xv+bobNDSoywiXKSuuMt6yw1Zf49o1957Gz92xLFjK8Zrjiztgw+8KtoKMX3s6xYrC9stn
 inual+KUbLdpq1u66FcWY/tR5/bZvss1qWssljoTZLdfbsFYPAA==
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

Hi,

Here's an(other [1]) attempt at fixing the current mess due to the
opposite meaning of what v4l2 and the MIPI-CSI2 spec call "RGB". By v4l2
nomenclature, the format CSI calls RGB is actually BGR.

Unfortunately, a handful of CSI transceivers report through RGB media
bus pixel code, which is then understood as V4L2_PIX_FMT_RGB24 by CSI
receivers.

This is made somewhat worse the fact that media bus codes have been made
mostly with parallel busses in mind, and thus the order of pixels wasn't
clearly defined anywhere.

So the v4l2 vs CSI mismatch was confusing (but there's nothing we can do
about it), but the doc didn't really make an attempt at clearing it up
either.

We did have a convention so far though, that about half the affected
drivers were following. 

This series improves the doc, adds the missing media bus codes, and
converts the transceiver drivers to the rightful media bus format.

We'll also need that series [2] from Laurent to fix all the affected
transceivers. 

Let me know what you think,
Maxime

1: https://lore.kernel.org/r/20250606-rpi-unicam-rgb-bgr-fix-v1-1-9930b963f3eb@kernel.org
2: https://lore.kernel.org/r/20250611181528.19542-1-laurent.pinchart@ideasonboard.com

---
Maxime Ripard (4):
      media: uapi: Clarify MBUS color component order for serial buses
      media: uapi: Introduce MEDIA_BUS_FMT_BGR565_1X16
      media: tc358743: Fix the RGB MBUS format
      media: gc2145: Fix the RGB MBUS format

 .../userspace-api/media/v4l/subdev-formats.rst     | 51 +++++++++++++++++++---
 drivers/media/i2c/gc2145.c                         |  4 +-
 drivers/media/i2c/tc358743.c                       | 10 ++---
 include/uapi/linux/media-bus-format.h              |  3 +-
 4 files changed, 54 insertions(+), 14 deletions(-)
---
base-commit: 6e417fb287553495e43135125d099daf80b63fe1
change-id: 20250612-csi-bgr-rgb-b837980c00b3

Best regards,
-- 
Maxime Ripard <mripard@kernel.org>


