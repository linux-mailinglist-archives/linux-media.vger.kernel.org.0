Return-Path: <linux-media+bounces-26831-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B987A42105
	for <lists+linux-media@lfdr.de>; Mon, 24 Feb 2025 14:42:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E977D7A6D17
	for <lists+linux-media@lfdr.de>; Mon, 24 Feb 2025 13:40:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8EEF24EF74;
	Mon, 24 Feb 2025 13:40:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="oRucYvIo"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9785424889C;
	Mon, 24 Feb 2025 13:40:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740404435; cv=none; b=VDc9o5aF7ge9wmi2FD2iHvFUam2hPoQgSkChDMQ9yetNbCX2pxSWTsJBxAV6ZiCFwMn3ehXdIx5icxTFoO44XsMCtLmA2DnoAqHKktTSCAOSBg0PiUTXbgeZAXV6dR9WHUyEw4g4RzxFPaV9cQwIQNjfGwGRRInu5Jyg0aJvJlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740404435; c=relaxed/simple;
	bh=MIOxF0OFY04I/2eN+5Yd+Qi2ePOCqgNj6DSKo7kGAWE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=anIFKfmf2WN/DGrowDu7MpKcmZLev3Eu3VWpMrBbjr5qW6heaZDZPptrpOdXHA2CjI/8VWqLZH8Phu80njNgJWSH95v6JdGOauRC0Ukjt2nQ4Ahf0iI0saxGPUNxDGnyUyFg0KrnOK2y3Tq+q9vO9KoVEOraef59KoClf2tT4vw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=oRucYvIo; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [223.190.81.199])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9C00B455;
	Mon, 24 Feb 2025 14:39:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1740404345;
	bh=MIOxF0OFY04I/2eN+5Yd+Qi2ePOCqgNj6DSKo7kGAWE=;
	h=From:Subject:Date:To:Cc:From;
	b=oRucYvIo9JPs381iV3A7pUhnokMaY5eg9BuhGW7o5u190T/LE9K+QYsQ33lSk9zQI
	 vfwUfN9uW008WkB7M4mP4uvYX9wGflcSTKoccrYpAQ/iZy5TQsqwZbGyV81ypMgshd
	 M581oEbH42vRD3dNhS0A77DdgC3eNtAXFCwB4RPY=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Subject: [PATCH 0/3] media: Support runtime PM and system sleep for
 TI-CSI2RX
Date: Mon, 24 Feb 2025 19:05:55 +0530
Message-Id: <20250224-ti_csi_pm-v1-0-8f8c29ef646d@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALt1vGcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDIyMT3ZLM+OTizPiCXF0jEwsDiySjJBMT02QloPqCotS0zAqwWdGxtbU
 AskrAqVsAAAA=
X-Change-ID: 20250224-ti_csi_pm-24808b2b445c
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Maxime Ripard <mripard@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Changhuang Liang <changhuang.liang@starfivetech.com>, 
 Devarsh Thakkar <devarsht@ti.com>, Jai Luthra <jai.luthra@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1402;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=MIOxF0OFY04I/2eN+5Yd+Qi2ePOCqgNj6DSKo7kGAWE=;
 b=owEBbQKS/ZANAwAIAUPekfkkmnFFAcsmYgBnvHa/txb/9ekASqDzH5VXLHN6z/d+s2uU8A9gu
 mfXxGSxODyJAjMEAAEIAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCZ7x2vwAKCRBD3pH5JJpx
 RZ4PD/9ml2eaDzNVL+uAxFLRwVsuG8j0g6m9KfgsSMaIanzgpqGqe3uEveyBtCGwKTdCFIiv/aS
 kHuEKt1Y3HrqLSOp4QoAmmL0c0nrH0AJMU8LHl+r1coSwS0flU5guZsGB6Db4yF30n3UsWiH5xU
 uH7Df27wBiix5/jzNw9HmJMfWr3ze5FYvzcCYDy2EIo1vCdYEgJMfRMUOFNThcIcwn6TknVA81c
 sFG/vUAb40ICwxMBZHr2VzB3vqYglE8j6OAzMXrXiUiCqsfQDhVshfABWrcPvd99RsIKBCsXAq/
 eRJU30pFXLRtKmzcmT3a+VAJNVFOVtL4xZr/KbZzTIfO3FAayXyHfkh/zK95az1xZ0hukCtMPem
 BnijUwDcehiQhdOdWUn58BUqlxi+ckhTt8/5gvmTuft3nZ5752e3ojrUt2IDcYteXUrXBfWiXrc
 9cRSCGPawsFytKX4owBDyyCia1xoDELJo6nYdLCzbQOxzJYmERVqnb3DrdzMZA0GP7aj9jPCnUd
 brW19YmPdULstXgCSWqFVL4v0FlXy8mEduD8AVceSWfx+WBOsO28K3NMAUx8HMhhDy6hHQqorR7
 j36nXxY4aGtiKb0T189R7XrV1NCqtYCiv7rpdpK4U0TADvO3KrTaacUiOZ/iY3VkeipeUF0t6rD
 3ll0sQqkg7L3p1g==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145

This series adds support for runtime power management and system sleep
for the TI (J721E) CSI2RX pipeline.

Some basic testing with suspend-to-idle mode has been performed to
ensure that any ongoing stream resumes smoothly after wakeup. More
testing with suspend-to-memory mode will be done later, as I need to
update the device management boot firmware, which supports newer APIs
used by the mainline kernel.

I have picked PATCH 1/3 from Changhuang's earlier series [1] with minor
modifications.

Link: https://lore.kernel.org/linux-media/20240718032834.53876-1-changhuang.liang@starfivetech.com/ [1]

Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
Changhuang Liang (1):
      media: cadence: csi2rx: Support runtime PM

Jai Luthra (2):
      media: ti: j721e-csi2rx: Support runtime suspend
      media: ti: j721e-csi2rx: Support system suspend using pm_notifier

 drivers/media/platform/cadence/Kconfig             |   1 +
 drivers/media/platform/cadence/cdns-csi2rx.c       | 121 +++++++++-----
 drivers/media/platform/ti/Kconfig                  |   1 +
 .../media/platform/ti/j721e-csi2rx/j721e-csi2rx.c  | 180 +++++++++++++++++++--
 4 files changed, 252 insertions(+), 51 deletions(-)
---
base-commit: d082ecbc71e9e0bf49883ee4afd435a77a5101b6
change-id: 20250224-ti_csi_pm-24808b2b445c

Best regards,
-- 
Jai Luthra <jai.luthra@ideasonboard.com>


