Return-Path: <linux-media+bounces-42256-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DBD02B52B4F
	for <lists+linux-media@lfdr.de>; Thu, 11 Sep 2025 10:15:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9C0067B70ED
	for <lists+linux-media@lfdr.de>; Thu, 11 Sep 2025 08:13:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53E7F2D73B4;
	Thu, 11 Sep 2025 08:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="O+d/AvVR"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8B532D6608;
	Thu, 11 Sep 2025 08:14:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757578502; cv=none; b=muJU222kfSzjLXmubfS669uAs9oH8B9xwp1vbtjvgr/IyYGk+9kMPQW3O/9cuuxsdTbOshsMbrqj95p0UU7mQz7anmspnmcjSO742xjg+tFdfLIBhwQH2YRJU7rZteGN432JUVeV3HUeDl9avyaRYiz5hkqhROrGBM/z+XDJIKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757578502; c=relaxed/simple;
	bh=BQNUaMyvC89BnAUDtL7cW4ixV8y5kg6cGZdMK8Vg3jw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=GaJ0JD8hX96TnyJyAhpQ7g5xEzk8cBUIgOA3ZR+W5gxSr3Uw3IUOi4dnQaDw8Z/Hhb0ah3cpqY5XzCI8SL5T97Dvla4D8UkMpEDOeJ+eOR7PvM2CTgoA6ZawqZaignGgkN3y1rYNkqJgz7Xmfr/X6EvEUoEsQU6ysnxzYDZzHg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=O+d/AvVR; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c66:c9e9:75f9:f434:33cd:e4fe])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D09C84A4;
	Thu, 11 Sep 2025 10:13:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1757578417;
	bh=BQNUaMyvC89BnAUDtL7cW4ixV8y5kg6cGZdMK8Vg3jw=;
	h=From:Subject:Date:To:Cc:From;
	b=O+d/AvVRhIdjwV1OMHBTVMzM+KoDnHgsrfL5PMLXUmT2aNXGEkKkm/8V/iMepdKw9
	 AZXeUckME2NO2h/QylvKV0Y+/PTDFqJGYpb+yjR+/tiy8ZZ/W8TWrzDHGbdDIhzbfi
	 2/SJ8obio1xVtFqTO8NNW345MRrTFqvRhkM7uY5U=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Subject: [PATCH v2 0/8] media: imx335: Vflip, active state and binning
 support
Date: Thu, 11 Sep 2025 13:44:16 +0530
Message-Id: <20250911-imx335_binning-v2-0-30a28df74df6@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANiEwmgC/13MSw6CMBSF4a2QO7amD6joyH0YYvq4wh3QmtYQD
 OnerThz+J/kfBtkTIQZLs0GCRfKFEMNeWjATSaMyMjXBsllxzXXjOZVqe5uKQQKI/Ot8g7PUlh
 uoJ6eCR+07uBtqD1RfsX03v1FfNcf1Qv1Ty2CcWZaaXV/8n3Xiit5NDkGG03yRxdnGEopH6hzc
 7OzAAAA
X-Change-ID: 20250606-imx335_binning-d43dce921b0a
To: Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Tommaso Merciai <tomm.merciai@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2033;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=BQNUaMyvC89BnAUDtL7cW4ixV8y5kg6cGZdMK8Vg3jw=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBowoTogSrh8zBw1B2Ekeg2pnDbvqpqRK3Eq+60n
 dWvT6laKPiJAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCaMKE6AAKCRBD3pH5JJpx
 RdQuD/9rL11RnbmGt0ewMNb9Y7QOwLZHeV2csSE3PlOGViRhwWL9cA8+duhYzmzuKnE2r4hD8jJ
 qEO0dbJe0pHG74v0b0rDCbqh1GGr3sd0m5R8Y5QxUOmKp9I07Phff/B8KUyAzcQ1Pa0XabU+Rb6
 ok+h8cNM0FG8Kbgayr9uiV5JE0/8DVf3WZgypK3DjQcvtfo+12Vxdb9zQUEeDm3+g+CmiqaUA10
 pR8LyzfTQXnWAYqkfusS5NmvIEzlMG7qDrjOnDLJYbCWDBgVXk6srWk3GfxjrmYA6h+C6QKZG7L
 E021g0Eo7SfGhBeKc6t/zP968mrEA7zC/z007deKuGEhzibAXgvR57P1tu2NzJS+CIxzQTQfjeq
 BQWZhOUuqng4rwxCDOowesFjsRtMjckd4HhQluT/tkJus4bBNt3r2/rGIvRDPAvATt0y4IpeWex
 W0QmyLcQaJlxLMv0HeLi1Tqd3RXXaKJp2BIyyK7DHblRLVMzawXnxhEjr12rmvk6dYjQ4LdCpHv
 /PFmk09g6upuXAJdi8igLcdleD7hnDuXekC6Mldl5WTMIgf8vcYkgz1KMwxcTfqaBRaE0bs+0SJ
 CVeKZaZ8q7YoUlvVsoji645iACUQD/VX3HvhNQYsaMBVgMaX0ek2ubdR1UB/XMA2uZRM3G3wTx3
 YC+62lXBJNkz01A==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145

Hi,

This series adds support for 2x2 binning mode for Sony IMX335, along
with some improvements like using subdev active state, using
{enable,disable}_streams APIs and fixing the native pixel array width to
match the datasheet.

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
Changes in v2:
- Split runtime PM re-ordering from the patch introducing state support
- Use v4l2_rect instead of macros for sensor native and crop sizes
- Add new patch to introduce enable/disable streams API support with
  s_stream fallback helper
- Link to v1: https://lore.kernel.org/r/20250813-imx335_binning-v1-0-a42b687d8541@ideasonboard.com

---
Jai Luthra (6):
      media: imx335: Update the native pixel array width
      media: imx335: Update HBLANK range on mode change
      media: imx335: Handle runtime PM in leaf functions
      media: imx355: Use subdev active state
      media: imx335: Support 2x2 binning
      media: imx335: Switch to {enable,disable}_streams

Umang Jain (2):
      media: imx335: Rectify name of mode struct
      media: imx335: Support vertical flip

 drivers/media/i2c/imx335.c | 516 ++++++++++++++++++++++++++++++---------------
 1 file changed, 347 insertions(+), 169 deletions(-)
---
base-commit: 76d2d8f7b6348af5f524b7ed21b5ad7d9686971b
change-id: 20250606-imx335_binning-d43dce921b0a

Best regards,
-- 
Jai Luthra <jai.luthra@ideasonboard.com>


