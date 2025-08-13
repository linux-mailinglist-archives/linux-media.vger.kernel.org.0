Return-Path: <linux-media+bounces-39740-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AC84AB2427B
	for <lists+linux-media@lfdr.de>; Wed, 13 Aug 2025 09:21:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C5BF01896F4D
	for <lists+linux-media@lfdr.de>; Wed, 13 Aug 2025 07:21:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8ECB2D6418;
	Wed, 13 Aug 2025 07:21:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="lkmuBeLu"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31B3B1448E3;
	Wed, 13 Aug 2025 07:21:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755069671; cv=none; b=H15M7xs5CwKgWO+6G9oaScIQueJyTu0Ds5+3y+7hpsk1/Bc30Y7Bq3xvTYRSR4z7+yd7EvZRWbE3QVRzKPS268hu1faYZ4U3lR7edG3SiJC2qtYVrF5Gi9YUUzYRUZmSy5qMoxaRTJ2WwxOvTJuSxQLdRvb4InUlpCInsdMnMS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755069671; c=relaxed/simple;
	bh=ekAeD03LGT/H0bd1yQdjAK79f/ZbGNLX1qkr/VWVeYM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Z2To7B5ZtkyVlhNneVAtsXalW1Iwu+ozLUxUEbcszSBOhOtjeXlXZiZlOfL2FM34z2Chw7grnOSHMaFOcujQnNAK77lCn4IhlTwu0urw9CsLc/ohLHGFZfGeo0dzNccQD7nBFLESfn5xVuFxjpfQ/VazwHif9YCqW0CXIkKQsLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=lkmuBeLu; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c66:bd1a:669e:3dcb:5a6b:a905])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 37843351;
	Wed, 13 Aug 2025 09:20:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1755069610;
	bh=ekAeD03LGT/H0bd1yQdjAK79f/ZbGNLX1qkr/VWVeYM=;
	h=From:Subject:Date:To:Cc:From;
	b=lkmuBeLu/hxO5aKu05wL4JYecX2R5z1BjeqAIiZD0F0W81mOha62j99LMJW7TWLv5
	 DvDgUK4/QcObI0IIIvd+0F6bDHkzpVKgACvV+P3eaWUQRPuVwxA4GOjUB76N+Pm1Uz
	 aXb0hYnYVlwiycMgrCpFL4k7cCh+y9ldupB1i+QA=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Subject: [PATCH 0/6] media: imx335: Vflip, active state and binning support
Date: Wed, 13 Aug 2025 12:50:31 +0530
Message-Id: <20250813-imx335_binning-v1-0-a42b687d8541@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAL88nGgC/x3MTQqAIBBA4avErBP8SaGuEhGWU82iKRRCCO+et
 PwW772QMBImGJoXIj6U6OIK1TawHp53FBSqQUttpZNO0JmNsfNCzMS7CJ0JK/ZaLdJDje6IG+V
 /OE6lfBj+hsRgAAAA
X-Change-ID: 20250606-imx335_binning-d43dce921b0a
To: Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jai Luthra <jai.luthra@ideasonboard.com>, 
 Umang Jain <umang.jain@ideasonboard.com>, 
 Tommaso Merciai <tomm.merciai@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1519;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=ekAeD03LGT/H0bd1yQdjAK79f/ZbGNLX1qkr/VWVeYM=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBonDzUVMyF2SIqvIdBgBUADpnJa10ckB8kwDYxK
 N4a0vz/I0SJAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCaJw81AAKCRBD3pH5JJpx
 RfYOD/9PiSLtvg89r3kSH0qLpvDdKLumSOFRP7vatOb/m2SGK0MpAqdeI1M4mOv3IQQ4P1PbctX
 /eyYmnFDL9d2MZymusWX76IDai6ELYDVvT3Fcc16gOJSQXGgtkVsAq3fY/KRSuiUVKrcCfPPoRU
 O+d5mFJOP9ZSIrTp96r7OOlXjSO1Xzjfk89hNBU1pR4zu0YvF/XfMQhsyLQmpSP+W18kyo1V3IA
 PwyiQ4eI1xIYnbSfxYlvDn3f8A216XLc9e9+xHvVvmajc7C6h37265DnPevKAGdFQ9koIc5j4Il
 9KXuJV7OdkpwSC8y2QOdrBUPdxUDK02/8bf8csem0PFHyjiTiYLZ60yVbILZtU9vU41c3IjhnFv
 gB17Uj9DIXPRYlRMmtBK3B7323GEMl/enPf+s6ojqQHOGm93CqI6oI8ZWLfHEaxGeDL6vOtkzh7
 8SV/YfOOlr5zwlI28Ua8VD5lAD8PHs2d0zVgkT3SwbDC5rNZSt148c/ZHk8ZhMFLOjlyWKUjylw
 LRmDCbCn2dAp58U6OnGKAjdB9SansWnVNmucnifYRtHYThuPkkMDFXGTDc4vUnfTJaH3JQMZpYL
 bdoxLX/y7DYAFM1QBsVQVd/3WCV/OcC8pHrRBfBABNq32qmhvIK5FMEirYD4+xCFVis9TU7YOcG
 FKYd+xtt+RHtgwQ==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145

Hi,

This series adds support for 2x2 binning mode for Sony IMX335, along
with some improvements like using subdev active state, and fixing the
native pixel array width to match the datasheet.

These changes are done on top of a couple of already reviewed patches
from Umang's series from last year that added support for vertical flip [1]

[1]: https://lore.kernel.org/all/20240830062639.72947-1-umang.jain@ideasonboard.com/

There is some WIP to make the resolution freely configurable:
 - [x] Add support for a cropped mode (1944x1100)
 - [ ] Fix exposure timing limits when cropping
 - [ ] Add support for a cropped binned mode
 - [ ] Make it freely configurable (depends on new control for binning)

Available in the branch here:
https://github.com/jailuthra/linux/commits/imx335_binning

Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
Jai Luthra (4):
      media: imx335: Update the native pixel array width
      media: imx335: Update HBLANK range on mode change
      media: imx355: Use subdev active state
      media: imx335: Support 2x2 binning

Umang Jain (2):
      media: imx335: Rectify name of mode struct
      media: imx335: Support vertical flip

 drivers/media/i2c/imx335.c | 463 +++++++++++++++++++++++++++++++--------------
 1 file changed, 324 insertions(+), 139 deletions(-)
---
base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585
change-id: 20250606-imx335_binning-d43dce921b0a

Best regards,
-- 
Jai Luthra <jai.luthra@ideasonboard.com>


