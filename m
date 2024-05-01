Return-Path: <linux-media+bounces-10529-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6925D8B897C
	for <lists+linux-media@lfdr.de>; Wed,  1 May 2024 13:55:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9B2001C20A89
	for <lists+linux-media@lfdr.de>; Wed,  1 May 2024 11:54:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACA1C82498;
	Wed,  1 May 2024 11:54:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="PDzzLcvg"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E9817CF3A
	for <linux-media@vger.kernel.org>; Wed,  1 May 2024 11:54:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714564490; cv=none; b=HTOAhh9M9ITfhAmUfpdDSToL//CuWPG1qEaGTXwlzf/Zb3G0LCXIC/rckSA1eZOQJItFpXFmyfPaJr9eJpqYgyf5VaPTVOJ0Z3gQwfi6d1bD07jaZ/q/7JHOiRPeOiQnjuzPlX5j8bUlt8hNPLBz1nIm8vo0DOY6ShErHeQCNac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714564490; c=relaxed/simple;
	bh=RpvUDVAaphkrnHMwfmB3vPwLmRkfOgST/PnLNe8zhi0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RHJJNNg/FkFlGstuqUxEZ0k/xI9xAoRdIZOOyfAsvKm0utJQv8rN9k/8AIAa0d154NZKUXEIcbT6lAinzpuKsOCeaYpSTlzROX4lsgWz83KvFwXyflCH/aUFUjUFCGzeoupT92Y8tt0C3rpS1m5mgjfTosjfFxUtdSzhl9PU9HM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=PDzzLcvg; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (85-76-79-44-nat.elisa-mobile.fi [85.76.79.44])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 58888524;
	Wed,  1 May 2024 13:53:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1714564430;
	bh=RpvUDVAaphkrnHMwfmB3vPwLmRkfOgST/PnLNe8zhi0=;
	h=From:To:Cc:Subject:Date:From;
	b=PDzzLcvg/6hG8lGgRaQEkMs/YY7PbKz/iXaPDFD76PAo+T0CUmfSMpLAWbDNoyXxq
	 fyee6lwVrYdmOwBCmOw9a6naTEPFX/Tz8UA2ur+slggPn5BxVgaXXaiMbEY70bDhRA
	 /CxuR30pVPp2+fC+Bva6TV2XgAK4x6SOxw3VV0Hs=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] media: bcm2835-unicam: Fix driver path in MAINTAINERS
Date: Wed,  1 May 2024 14:54:39 +0300
Message-ID: <20240501115439.9789-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.43.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The MAINTAINERS file entry for the bcm2835-unicam driver incorrectly
references the non-existing drivers/media/platform/bcm2835/ path. Fix
it.

Fixes: 392cd78d495f ("media: bcm2835-unicam: Add support for CCP2/CSI2 camera interface")
Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 01b86927a7ad..ef6be9d95143 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4039,7 +4039,7 @@ M:	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/media/brcm,bcm2835-unicam.yaml
-F:	drivers/media/platform/bcm2835/
+F:	drivers/media/platform/broadcom/bcm2835-unicam*
 
 BROADCOM BCM47XX MIPS ARCHITECTURE
 M:	Hauke Mehrtens <hauke@hauke-m.de>

base-commit: a1c6d22421501fc1016b99ac8570a1030714c70f
-- 
Regards,

Laurent Pinchart


