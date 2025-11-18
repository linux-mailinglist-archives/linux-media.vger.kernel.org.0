Return-Path: <linux-media+bounces-47272-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 6744CC69428
	for <lists+linux-media@lfdr.de>; Tue, 18 Nov 2025 13:07:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 0C33835969E
	for <lists+linux-media@lfdr.de>; Tue, 18 Nov 2025 12:03:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 288DE352F96;
	Tue, 18 Nov 2025 12:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Nuz4bipc"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 738FE33E36D;
	Tue, 18 Nov 2025 12:03:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763467412; cv=none; b=Ufgd2hpLKsrs8Uet99wDXvhDhHdD7LlJZyz7Ko4V85MLr7L2BI2tOnBGcA0bJHJEMC5q6VwSxdVe+fMgKLq3RIg5CEj7lB+gm7jILNZF5D9Qf9/cQVxUdeS8POTHcEmv4iXlc5tpwfzIuhXk0xU9IDT3YcEv4APjBuW4U7xwaqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763467412; c=relaxed/simple;
	bh=3oY2hfI4kA/xXIAt/gv8znyKKZ7SXxVd7TB90i5d/HE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=hmi5Dy9eZOKbCfRZk9gIVMQ0jAQlMuEK2O+70Otuhs+jbkFGMfKaOSUSw8cpKaf4uy98B3L30lsnH8tSqQTdyBkqYEZ/q+9VEzaVWS7OSnpgxSbUIAnaOPbh4ScIoHMZeMjIcIKkOtBio43a38wrvWNmA77jFEpP1kRHPXx9NB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Nuz4bipc; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c66:4b0d:7040:4d69:4c7c:d231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1CF3D1E33;
	Tue, 18 Nov 2025 13:01:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1763467283;
	bh=3oY2hfI4kA/xXIAt/gv8znyKKZ7SXxVd7TB90i5d/HE=;
	h=From:Subject:Date:To:Cc:From;
	b=Nuz4bipcSeQwfGxABcfLyuZLlSzuHTiCFfzB9jgdqscyIAuvLyvVAaSZvAMgURf+/
	 XSz5TkUW7wTqwskl4FZhvnwmfZ+/e0w56PhoUzo9PjirS6DZQ3S1CKbaX1QEwQ0N64
	 2g7jYKys3bRpqUfgChpQzE5M9uY8/+X5IluU+pls=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Subject: [PATCH v2 00/16] media: i2c: Miscellaneous features and fixes for
 OV5647
Date: Tue, 18 Nov 2025 17:32:53 +0530
Message-Id: <20251118-b4-rpi-ov5647-v2-0-5e78e7cb7f9b@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAG5gHGkC/12Oyw7CIBBFf6VhLQYor3blfxgXUAY7C0uF2miM/
 y7auHF55mbOvU9SICMU0jdPkmHFgmmqIHYNGUY3nYFiqEwEE4ozIamXNM9I06q0NJQprxkzyho
 tSP2ZM0S8f33HU+URy5Ly46tf+ef6M9k/08opo6yzkrdSyajggAFcSZNPLof9kC7k9NoaMlxvd
 eiy1RDvCtCaX3Dpm9ZZrZk11rZddC54GbnTIRgxtNx0Aw9RaWNNlb3eFD/Apf0AAAA=
X-Change-ID: 20251024-b4-rpi-ov5647-05b600758762
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Jacopo Mondi <jacopo@jmondi.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Naushir Patuck <naush@raspberrypi.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, 
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 David Plowman <david.plowman@raspberrypi.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Peter Robinson <pbrobinson@gmail.com>, Stefan Wahren <wahrenst@gmx.net>, 
 "Ivan T. Ivanov" <iivanov@suse.de>, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
 Jai Luthra <jai.luthra@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2482;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=3oY2hfI4kA/xXIAt/gv8znyKKZ7SXxVd7TB90i5d/HE=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBpHGB5qjxfmA60mpEAKVxxVk5SNj2mC7VU/1zAH
 j+CHndxMlWJAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCaRxgeQAKCRBD3pH5JJpx
 RR7ND/0ZI1meZShmzT+ZfBZOrwLAcxKW8P8builU7gL4kSqouWP4VZuIssANwV6KQI8DVvjYH5/
 BEQuNHrEWSAorAlX+o6Jctb8qhzhUW6TUZt3MJovZ6VXRbDSxtdbIj2c8yC8T10EdGIEv69zdLG
 h0Yy3LiL5INAzjE7kr4bMnYRo3HxnxenlOLcSM5tpBikDgdgplzH3QpFzIE+eb9yVw9LQutpr1h
 b4MIn8DWaq0yWRTjaXQvfr85NVpG4O8R3gH7lsgD3OHSGvWb49EGlLoK91uEsn5obcicI1G1Eay
 3QwSLguzlezMI4HFx6I9+ck8vBf8RorDeunmhdHzXfZipX+YphmKjmkl/mmFEesrRl3FkeP8QbT
 ykRyxfgz7UYzpFfyzTAH7VGR4e/3dBSdMblDj2FVB1f83CPRYbMyey7TEFREwxCts5I4kFAe1jC
 nWDpvetSZb061M46Bk1JwO7VmHzBtQKY+kQgNbY7HXVguKAKCi4nbCGvP5GVlFpX2uBuZruejnn
 5vDzJ3CfCWCo70sp9LdmEBiYGv2adTeVunXo/8zx9jpZwULMJq10WOcwE2bBvRLVzkPnTZkJK9/
 UV+Onf8r7ybqS57eeE9TGkjpwB5j0YiW+Wi2Z5vhkI6m34LNVrnbM7ieW++dgmuWPoNewobnR+C
 GDLi0gQwjOzBK9g==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145

This series adds support for some important features, like controls for
H/VFLIP, horizontal blanking, link frequency and regulator support that
is present in the downstream kernel to support the Raspberry Pi v1 camera
module.

Additionally, it also fixes some known issues with streaming lockups and
wrong pixel array size.

Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
Changes in v2:
- Drop [PATCH 4/13] as it is already present in mainline
- Add a fix for a potential segfault by reordering ov5647_init_controls
  after v4l2_i2c_subdev_init in the probe
- Add 2 new patches updating dt-bindings for regulators and
  rotation/orientation
- Add a patch for cleaning up the PIXEL_RATE control
- Reorder the patches in the series, moving all fixes at the start
- Fix review comments from Jacopo, Stefan, Kieran and Dave, picking
  Jacopo's R-by tag on a few patches
- Link to v1: https://lore.kernel.org/r/20251028-b4-rpi-ov5647-v1-0-098413454f5e@ideasonboard.com

---
Dave Stevenson (7):
      media: i2c: ov5647: Add support for regulator control
      media: i2c: ov5647: Use v4l2_async_register_subdev_sensor for lens binding
      media: i2c: ov5647: Add control of V4L2_CID_HBLANK
      media: i2c: ov5647: Tidy up mode registers to make the order common
      media: i2c: ov5647: Separate out the common registers.
      media: i2c: ov5647: Use the same PLL config for full, 1080p, and binned modes
      media: i2c: ov5647: Add V4L2_CID_LINK_FREQUENCY control

David Plowman (4):
      media: i2c: ov5647: Correct pixel array offset
      media: i2c: ov5647: Correct minimum VBLANK value
      media: i2c: ov5647: Sensor should report RAW color space
      media: i2c: ov5647: Support HFLIP and VFLIP

Jai Luthra (4):
      media: i2c: ov5647: Initialize subdev before controls
      dt-bindings: media: ov5647: Add optional regulators
      dt-bindings: media: ov5647: Allow props from video-interface-devices
      media: i2c: ov5647: Tidy up PIXEL_RATE control

Laurent Pinchart (1):
      media: i2c: ov5647: Parse and register properties

 .../devicetree/bindings/media/i2c/ovti,ov5647.yaml |  14 +-
 drivers/media/i2c/ov5647.c                         | 467 ++++++++++-----------
 2 files changed, 238 insertions(+), 243 deletions(-)
---
base-commit: 3a8660878839faadb4f1a6dd72c3179c1df56787
change-id: 20251024-b4-rpi-ov5647-05b600758762

Best regards,
-- 
Jai Luthra <jai.luthra@ideasonboard.com>


