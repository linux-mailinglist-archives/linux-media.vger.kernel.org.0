Return-Path: <linux-media+bounces-25613-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 48EDFA26C64
	for <lists+linux-media@lfdr.de>; Tue,  4 Feb 2025 08:05:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CDBB0165CD0
	for <lists+linux-media@lfdr.de>; Tue,  4 Feb 2025 07:05:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61A892054E7;
	Tue,  4 Feb 2025 07:05:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="wAw0QDj1"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 428BD204F7D;
	Tue,  4 Feb 2025 07:05:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738652716; cv=none; b=ppCTqHVAeBTaQJkqIiI5gTK4zCKBPcsQKQe1c4bcwm1Jwqq+nKhT6hNoIN7iR61Com3zjcq9wfqUC2hPD1nlOBJ0fHH87LEdjsLF1GJtM+UK2W2BxhUXJ/6feO7/8WZoLiLP51ECOfFmorIjorH5gzMy/kaSs0AivjWV28ynpQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738652716; c=relaxed/simple;
	bh=zs/zpjxPU+0QUaPa1Vt1KUU/FtlGY4Upb4yOBtUYaPs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aivhXZw9bNatfVyCsriOxse3UnrDgzZ8yzD8S1BBBG6bT9GyJVJTqPoRSJxdlltTVqrh1fTzg5HXCgBFGm8T6vR4aJssXCvLqupPIZ3TNDadxDDbnUZNI/DCBoYIO7726XaaZP/vplV+IqF6FaASTspMbnXLLcsYru1HZo/2RjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=wAw0QDj1; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:8839:be31:a1f6:6475:ef19:2df7])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B41B01198;
	Tue,  4 Feb 2025 08:04:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1738652642;
	bh=zs/zpjxPU+0QUaPa1Vt1KUU/FtlGY4Upb4yOBtUYaPs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=wAw0QDj1EJVQr6yNPldPNmwaQrSiMz6k7LuDKgMhV2JvSQ8PGE57Da8+GJYw1EZK0
	 fu3GhNC6BixP3ipeGdhJlnjduqd6e/tfS9JCRiiqrLU/ya5Ni621wy7hsHhIihXxS+
	 C29vmuPbCcPLktcMwm5kS+KWd2MHLDUQ/+zJIDog=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Tue, 04 Feb 2025 12:34:36 +0530
Subject: [PATCH v6 1/5] media: i2c: imx219: Correct the minimum vblanking
 value
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250204-imx219_fixes-v6-1-84ffa5030972@ideasonboard.com>
References: <20250204-imx219_fixes-v6-0-84ffa5030972@ideasonboard.com>
In-Reply-To: <20250204-imx219_fixes-v6-0-84ffa5030972@ideasonboard.com>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Jai Luthra <jai.luthra@ideasonboard.com>, 
 David Plowman <david.plowman@raspberrypi.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1008;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=zbiKBhScbJyq8ATOozaLCyaAJ+K4hRoEedI8DOVPUSs=;
 b=owEBbQKS/ZANAwAIAUPekfkkmnFFAcsmYgBnobwd4fO0WgZtuK6IJygoFTQ1o3GdBmMllOj+V
 i/PRGnMZq6JAjMEAAEIAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCZ6G8HQAKCRBD3pH5JJpx
 RfhBD/wO2hJ1kWkyQeZ5cj4mmkMjNiirey/Q76mbj3mrxh41eZsc1+VJKUlcvL/twjkQQa72z07
 ThLP9RmJAyLLa+vFtjGphghSiwoozdfWca9rl3YjHiWiabLeoIfGHGGBYlJou34Aq+YPM6NgtTk
 SLyGmTU0kZtZVRy5Q8xMwIbzYTiRZzHtVjn1o7uLXH6Ov2Mzu70DFbVPhSKYBVXN+IeOPlxJRhS
 A7cNTqxFwflkb2/jo9qeMqbsMex1a1RB95MzSDXHmE3ZKS7611eCO6b5ff6HWYTQGY1RV5nCn/B
 xbDgulkY29QySeYAWy/3m18BjD+c23t56F3Bh+egOekbrzs8sLKjoz6K2TSiBnxtec801n4OFQn
 6sHtzlnipo/dfP9FDhJSun0XgC5COItxdc8pInSA+S/gx+H+OrAOHgZiIvOMsy8Tzn/V49Jb5uu
 q6ItZ7TOvaq8v4I0Ba2N0S1dX0kln0GVttx16JIUdmBEvUcyo5FbybvgQ3zEhPAincPhftVv+mn
 4SkK4qyQ3ZGwsdq2T5qEbaPWMBnbmkj4AuXo5ftDZ/ACLbUaGXvSahZ6kdqAfkNEwyKF1cxgDH+
 VYQp67tMZXRswbyHa6e9pPmSv5Q3M0NcrACCJb38yn2T29unNKfFuFanl32vnsB+4S5qV8wkSOM
 fmDOfDoQOSkSItA==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145

From: David Plowman <david.plowman@raspberrypi.com>

The datasheet for this sensor documents the minimum vblanking as being
32 lines. It does fix some problems with occasional black lines at the
bottom of images (tested on Raspberry Pi).

Signed-off-by: David Plowman <david.plowman@raspberrypi.com>
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
 drivers/media/i2c/imx219.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
index 2d54cea113e19f68e1553ffb2e4c78491dc80acf..0486bbc046cb9c36afd911eb799c1b010a01d496 100644
--- a/drivers/media/i2c/imx219.c
+++ b/drivers/media/i2c/imx219.c
@@ -73,7 +73,7 @@
 #define IMX219_REG_VTS			CCI_REG16(0x0160)
 #define IMX219_VTS_MAX			0xffff
 
-#define IMX219_VBLANK_MIN		4
+#define IMX219_VBLANK_MIN		32
 
 /* HBLANK control - read only */
 #define IMX219_PPL_DEFAULT		3448

-- 
2.48.1


