Return-Path: <linux-media+bounces-49297-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 65C04CD4F99
	for <lists+linux-media@lfdr.de>; Mon, 22 Dec 2025 09:21:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EF0653027A6E
	for <lists+linux-media@lfdr.de>; Mon, 22 Dec 2025 08:17:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B76E30EF62;
	Mon, 22 Dec 2025 08:17:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="aA5WrMcv"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7488730E852;
	Mon, 22 Dec 2025 08:16:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766391422; cv=none; b=nyVRAoS8AikZvbym/wE0Y6fpc5nDs3o/PUhKDm8tK4CKXjHXfn7OYNC0IMr9Bi+eMTlDMZxgRw840Mxw1QHJfmjWhsk0wGXbNV1KfmL79zYzXXGVXH99ZmzZzU8Ph0bKRr3Vdw2XvZcoFYhvcBRl4yOz2YxrpUJ+95KnLtCT7ms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766391422; c=relaxed/simple;
	bh=KKKK4z+kvru3VFoBd142iq9naKrKyclQEEeQ162zZzk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=j4CzFmbj3HuA/QXZKeS3FxqAYCio2KMm4sghChcUVfeL2KYYl27OHgfb+HHzkAVyrP21YRZYB7LxlAtPUqOuO6kChrpmc01fIvpDbRFilob0uY9GWWhZg3zSATwvbkfbG6pElEbe5ekr2a9JMp7RYwC4Y2y4pdUqitJUEDrB7yQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=aA5WrMcv; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c66:aa51:d08b:9316:9524:9005])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C27FD593;
	Mon, 22 Dec 2025 09:16:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1766391406;
	bh=KKKK4z+kvru3VFoBd142iq9naKrKyclQEEeQ162zZzk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=aA5WrMcvimi3gdarSg4tSvIWqYxIq3SxpBmW/nFaLEkAqCRExTPOpYM6HgCaAZtXO
	 NI0V4Slxw35v+sfiRBc2KvGuRk6XRtgqw/lcx9jbruxmyBC0r+jMxAaXO0+XUfdjF4
	 oYA07mkrZCcwZozNIcsvrJ6/l9zfevROUaOHl3ko=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Mon, 22 Dec 2025 13:45:35 +0530
Subject: [PATCH v4 11/17] media: i2c: ov5647: Use
 v4l2_async_register_subdev_sensor for lens binding
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251222-b4-rpi-ov5647-v4-11-b949c7309280@ideasonboard.com>
References: <20251222-b4-rpi-ov5647-v4-0-b949c7309280@ideasonboard.com>
In-Reply-To: <20251222-b4-rpi-ov5647-v4-0-b949c7309280@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=928;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=QsX/hByiqQlas5Ymkp8f1NjXamxR7lPgDcCMNYA5uI8=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBpSP4rzS5gxzfqn+598sGzHJ34bDTPrSOPNuQDH
 E/pQuleHBKJAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCaUj+KwAKCRBD3pH5JJpx
 Rf3aEADMyKxtGsPa4kll0UA9o5E1wkCSPksikD06ZN/tjLXwEqH0AgUqyjwrRx5Vdj0NxUtlxK7
 Nq0VIwZG5OoNMK9QKrHxI+aP76BeM/W9Fa95qMeoR/FOYEm/diOWZzWK73qBp/YJT41clQ2AHoZ
 VsSIXNfWmP39venduMobZ5oN88yNnq2e7j6czYzsO9+IEYyAUjWDi/IT268FaYKzD1fIH+qs8gC
 hAeeC0at4CH/jQV3Ta8pcqC4ks4EOaRI6Prmctpwin7qUWQkqtDhBshjfRNv2lmpXKeua6haPE6
 MLDGllcX7R21Tq8D9fpf2ZsJ+IOTDt5XueGmIO5X5xom21GM74BoFmbilYtH3rPUsmgCIANxBs1
 dAywl94X56Rmxoy+1ood4jhGll9mfjY8OS1WhZDW8Yz5Pckw+r8C+Vg5lP4eBMz/ofwz107td7J
 xt5E3nmT8otALAMBgM2lJg29uGQRMvo0mi9na859PabrGoyYV8g1RR6/m2GyQ9N0CBTSoOYgXHz
 8OqCYSiAVaIq7JKHCmtf9XgsQXDvksbpzyBWo4JX3LkZoyOSJe1/95u3YTlEmnlYrYBdUgnAnCU
 cjkCIzdTz5c6bDxNbu0ukiW+8HORJ5SfzBHtwNz8Cg5K4CHYrxSKC4jib9AssBmQslpQ64zu9/r
 NdHu/X6dsDaLRoA==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145

From: Dave Stevenson <dave.stevenson@raspberrypi.com>

v4l2_async_register_subdev doesn't bind in lens or flash drivers,
but v4l2_async_register_subdev_sensor does.
Switch to using v4l2_async_register_subdev_sensor.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
 drivers/media/i2c/ov5647.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ov5647.c b/drivers/media/i2c/ov5647.c
index 5bb80b943c8b5b922bd74e3c185c5e88f4f1a671..d6accdd20ef5f3d3c16d2fceadd0fca3afd6fc9e 100644
--- a/drivers/media/i2c/ov5647.c
+++ b/drivers/media/i2c/ov5647.c
@@ -1554,7 +1554,7 @@ static int ov5647_probe(struct i2c_client *client)
 	if (ret < 0)
 		goto power_off;
 
-	ret = v4l2_async_register_subdev(sd);
+	ret = v4l2_async_register_subdev_sensor(sd);
 	if (ret < 0)
 		goto power_off;
 

-- 
2.52.0


