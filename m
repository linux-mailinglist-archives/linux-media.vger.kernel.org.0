Return-Path: <linux-media+bounces-21743-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C0DFF9D4C92
	for <lists+linux-media@lfdr.de>; Thu, 21 Nov 2024 13:11:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F2EFFB253FE
	for <lists+linux-media@lfdr.de>; Thu, 21 Nov 2024 12:09:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75E381D5ADC;
	Thu, 21 Nov 2024 12:09:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ITCCumxL"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C01071D3627;
	Thu, 21 Nov 2024 12:09:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732190945; cv=none; b=Dj4DtTEFIG6SQFRROhxI3Vd1hG4NCqXAYGJ7UEt89ZTMe07bBVEzXjLn6W4rO9ECfVPgYBx5Bz3LSSCBk3jbP7O7rbo1XhqcTl1KRkWAT8AeH6jwkJQEp5zRFJyeA1W2DdZTUZ+H6yH4/wcIHGRhgb8OdSMAQ21FgjRf1P1uUQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732190945; c=relaxed/simple;
	bh=YwJa4ZE5jyHEJV+g3sgNej5M8rF37IhwufyCMPNMMok=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=uQ1GSpwGZlBxaTIWJcFILVa/s8798moXurn84OGRWAJUKSV4bluCn+SjBj3IQj0LtP+ViXlqJwMsRSW+fgSnnLFx1mtdvEd7/IjFBg4u+aHzk9HNdScxsTXcL/aor2V7CoNcXFMwL0LQRCG07t7G2xzvKiRRzWxKvAnf3GBvCmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ITCCumxL; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:883a:10f2:5b4b:5292:ac46:e988])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id EC85B219;
	Thu, 21 Nov 2024 13:08:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1732190923;
	bh=YwJa4ZE5jyHEJV+g3sgNej5M8rF37IhwufyCMPNMMok=;
	h=From:Subject:Date:To:Cc:From;
	b=ITCCumxLloED4MwkpUjDIKUw4TcmktWkUJMPFI57DJSzA+CvGksYJqa3gH4xtO9As
	 JZGQNXYqU3oDeR1Bl9FPjvIOQDoTpZKapwNd27vI3WfeTFG/+FoCrGgCoLUaCBVk5m
	 +2IzgRmLpCP9svuUqMbbW6zCSms5x6GPq/rOLZbU=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Subject: [PATCH v2 0/3] media: i2c: imx219: Fixes for blanking and pixel
 rate
Date: Thu, 21 Nov 2024 17:38:01 +0530
Message-Id: <20241121-imx219_fixes-v2-0-7b068a60ea40@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKEiP2cC/3WMyw7CIBBFf6WZtRhAaKwr/8M0hsfUzqLQgCE1D
 f8udu/y3JtzdsiYCDPcuh0SFsoUQwN56sDNJryQkW8MkksluBwYLZsUw3OiDTOzkzFOGd1LzqE
 pa8LjaMZjbDxTfsf0OepF/NY/oSIYZ1Zp7y69vlqFd/Jocgw2muTPLi4w1lq/WYN6Nq8AAAA=
X-Change-ID: 20241029-imx219_fixes-bfaac4a56200
To: Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
 Jai Luthra <jai.luthra@ideasonboard.com>, 
 David Plowman <david.plowman@raspberrypi.com>, 
 Naushir Patuck <naush@raspberrypi.com>, Vinay Varma <varmavinaym@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1315;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=YwJa4ZE5jyHEJV+g3sgNej5M8rF37IhwufyCMPNMMok=;
 b=owEBbQKS/ZANAwAIAUPekfkkmnFFAcsmYgBnPyLVbyE8psPL5s0TPHlnvJ3hEKSIK8sW2lhb7
 8Ge0zJB0QqJAjMEAAEIAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCZz8i1QAKCRBD3pH5JJpx
 RYEdD/4sH8/OwjNQq7hX7l9BuNGsW2Q/wkgxotbkMWIjP5GzlgVRaCrAP9w1Qkmu8RuZgBjjrVZ
 xTdX00cyBQ3ncJNqWFQqtFlOp47iwcaJtc4EfiWpG+WjVSUQ90cLcBKd6Iau4X3RngRLjS43xOp
 I60olC9Oe9MDe8c/JAoWirMVBLCDm9dZRn3O8WdKaRzaDMEhoKXg9eB8xBhMLRyn2rZJbqDFKEB
 cO5d5pCJ7NkQUBAaVs8kG70paESVTG7ipFXlMH8d68POaDRjuU88tjiITZmxWI2tm4NdwhKYacl
 QxpwkXlXI9j1qTXJarwsQ1I+Ld+0H+buzPdQxCkvMZEjqx4jQoi+q32GeWXa+Tl2sK/lrfa+G0d
 awIdAFq4q3azA5prZdg0RvLa85c3/gISQidRSetVqmNR3rAzcpT2E16QvUX1MzQrkn1Rt0s1a+q
 0vqYTLFNLpa3lybM+1sHCjJqqaIlaxpRa0747sxeCZySFcJsT2vQAGTUk8f3YKcA300O52VvreQ
 nWKsaMwE0S5w0GQJoXjMZfex957/ofxuacBn6mGdVaAYs+rSOgeOGzKdUtjHCBupOUV9IGKxiG+
 E2rnCu9A4TWXevpek2ODgPd3cU2mkUziC7dJ05eL1eeoXnSf+/HDHOziVETzcacN7OGoPSjpi+s
 wlizrzg3bB30Hig==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145

This series has a few fixes for improving h/v blanking and pixel rate
reporting for the IMX219 sensor.

These patches are picked and modified (and squashed where applicable)
from the rpi-6.6.y vendor tree.

Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
Changes in v2:
- PATCH 1/3: Add R-By from Jacopo, Dave
- PATCH 2/3:
    - Keep IMX219_PPL_MIN macro value in hex, matching the datasheet
    - Fix prev_hts calculation, by moving it before updating pad format
- PATCH 3/3:
    - Store binning register values in enum binning_mode directly
    - Remove unnecessary pixel_rate variable in imx219_init_controls()
- Link to v1: https://lore.kernel.org/r/20241029-imx219_fixes-v1-0-b45dc3658b4e@ideasonboard.com

---
Dave Stevenson (1):
      media: i2c: imx219: make HBLANK r/w to allow longer exposures

David Plowman (1):
      media: i2c: imx219: Correct the minimum vblanking value

Jai Luthra (1):
      media: i2c: imx219: Scale the pixel rate for analog binning

 drivers/media/i2c/imx219.c | 177 ++++++++++++++++++++++++++++++---------------
 1 file changed, 119 insertions(+), 58 deletions(-)
---
base-commit: adc218676eef25575469234709c2d87185ca223a
change-id: 20241029-imx219_fixes-bfaac4a56200

Best regards,
-- 
Jai Luthra <jai.luthra@ideasonboard.com>


