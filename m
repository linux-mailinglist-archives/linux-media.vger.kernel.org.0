Return-Path: <linux-media+bounces-42511-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D158B57075
	for <lists+linux-media@lfdr.de>; Mon, 15 Sep 2025 08:39:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 44089173771
	for <lists+linux-media@lfdr.de>; Mon, 15 Sep 2025 06:39:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CFCB287511;
	Mon, 15 Sep 2025 06:39:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="boYOqDm+"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FB1320126A;
	Mon, 15 Sep 2025 06:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757918371; cv=none; b=hblFQXJmAUSXxfemPz6kHHnHXhwqTI2i4cLHiup84GhtkW9j97fuLndHfQzCpPprB/xv8J+MyWZJGz+XSAnZy83LIgvqAXlkjSuCA1hdOGNv7TTK73Xe55VWb2xIHkygILt5dKKM+2lfMEqQlG7cYk9nZTAhSQtIstHm+cDbdmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757918371; c=relaxed/simple;
	bh=pYcz2x7nSX/+Y3c0sAlQoX7P/VnQalB+Wcn61H6HfD4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=X7zBnFqZRT+wb5E6robqUkSguuy4ggaSw/BpMo0aczxjN063vvUl0xHKOneeYi9qVjFAKXFAs3NepBr/vjKAA5q3NLy7E3yYCvYQXTFckR0XxiZoy8etnhaN9TttVjAGVMsCnC16hC21hhfmjYd0nv5C8mqawMSDbrKNopExaTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=boYOqDm+; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c66:2dbc:e233:e1b4:15e7:45cd])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id F4203EC1;
	Mon, 15 Sep 2025 08:38:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1757918289;
	bh=pYcz2x7nSX/+Y3c0sAlQoX7P/VnQalB+Wcn61H6HfD4=;
	h=From:Subject:Date:To:Cc:From;
	b=boYOqDm+/qQEuJLedBjI5x2UIAFvqjVRokr5CTteWsvvHevu8YhrFXODGy3dNtx6r
	 nAqlKAPT0UDp9VjL5f7dZ9ITiWPYm5ZqJwRtG1LzCcWOBLCI09rBZ+Hg6AeF4k+RTj
	 gsoE6Bl4zwiDfcfjunX0j9TqBwC0Y0KCwWnyQbts=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Subject: [PATCH v3 0/8] media: imx335: Vflip, active state and binning
 support
Date: Mon, 15 Sep 2025 12:09:06 +0530
Message-Id: <20250915-imx335_binning-v3-0-16ecabf2090d@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIq0x2gC/23MTQ7CIBhF0a00jMXwV0oduQ9jDBTafoOCAUNqm
 u5dWgcm6vC+5J0FJRfBJXSqFhRdhgTBl+CHCnWj9oPDYEsjRlhNJJEYppnz+mbAe/ADtoLbzrW
 MGqJROd2j62Hewcu19AjpEeJz9zPd1jelKP+mMsUEa8GMVI1VtaBnsE6n4E3Q0R67MKFNzOyjt
 JT+KKwonGimbN8I28s/yrquL9uS6Gb5AAAA
X-Change-ID: 20250606-imx335_binning-d43dce921b0a
To: Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Tommaso Merciai <tomm.merciai@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2274;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=pYcz2x7nSX/+Y3c0sAlQoX7P/VnQalB+Wcn61H6HfD4=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBox7SPEqTvR9uVWqOoGTigGIts38DqlokhHbgq3
 nd4p0qrIpWJAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCaMe0jwAKCRBD3pH5JJpx
 RSjsD/91Z1dldh2qJ2H7LrYrEvx/Z92+XwfDcnh3Em7ADllaLPX3QSpTUIxeLtT18lyG9IFJtVf
 Rc6pLYCtV+4ccamYTv8LVOmox3aAs8cYPLpBI1fFprNirlR7fae6MQ65p2ov8aggcDits9h1JlJ
 bfTLOwJL+tT1UmxutnbaLVK174Y+EY426r+FGD9P+fm7UVVeUczejccPqU7wklV+blpHPEEiyc2
 um3Kvr5bLyW7OluLfonUIt0RQ6fv3xCU3xkP7BTycqZU5wGbyD0Dn1BOx25vvU2B/nilvRCeMri
 nVC480sMSOQGlM3gPpwRzTg0AIZE9amsV1C71bubLuQ6KUO/ONnFwkSujQ3+zRduxMUPyhyndZi
 ElFcC1vDNJOQod/6YWbn12mKdgLVoY4x/y9kF7VWK/H9VQommdW1Vf2vF9dtJbQdMWqF3er95i5
 BDxKX9vy0s6hjyCzpV8lPPaUIR3gEzY+jh+rgo4rTwOiG7MxKzQ9zhCBfMs7PBy3ESkpHZCUXP+
 ZoncBQLS73azFuwPZREHQ+3kds84CQYKQ7TM6p9vGnuEiKwZknK8BNo+Q2bC1MGIAw0kQZcMS3T
 PpSrukJUbFsrw0kAKiNxcjwICat+QXM71DK1hugI6FK7i48WzS7zFJ7KK0Pzx+AX3LV2Cx/udfu
 xz53mIMlwrZz+Uw==
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
Changes in v3:
- Drop extra commas in reglist
- Fix checkpatch check for wrong indentation in disable_streams
- Add Kieran's R-by tags
- Link to v2: https://lore.kernel.org/r/20250911-imx335_binning-v2-0-30a28df74df6@ideasonboard.com

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
base-commit: 0e2ee70291e64a30fe36960c85294726d34a103e
change-id: 20250606-imx335_binning-d43dce921b0a

Best regards,
-- 
Jai Luthra <jai.luthra@ideasonboard.com>


