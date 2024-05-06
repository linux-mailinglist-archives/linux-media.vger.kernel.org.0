Return-Path: <linux-media+bounces-10891-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B72E8BD0B8
	for <lists+linux-media@lfdr.de>; Mon,  6 May 2024 16:50:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F26E91F21420
	for <lists+linux-media@lfdr.de>; Mon,  6 May 2024 14:50:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2F28153BDE;
	Mon,  6 May 2024 14:50:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="mdUqYNn/"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C70115383A
	for <linux-media@vger.kernel.org>; Mon,  6 May 2024 14:50:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715007005; cv=none; b=EPO52xx47Z4/qghCm8Nm03PH+NNqxP4XV3DpBSgVD9/5ONNkP1pMOyQzsK6cpafUcM4UbvXPlKqefoWWH/vcM6+OmuGIIddgEIGxAS9G6/Vq9FnZwJ9+tjRSU67W2Qc+UPtB0+jdvAgM8nWhUyQ6GUEdGgNXjUD5wpbqjlj9cGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715007005; c=relaxed/simple;
	bh=HITyKoJSr9PJAhrXF9x+wUhptTP3rWST5fPmdzQQpBU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Et9b9m4ZEqofn6THm3JbTh0DZqZ0HqOCIRhzKGsSSN9Ok+TrQ6Re6qVsuq4byrUxiN4xSFhQXJjrTcy5iOIOztJA66y83gdrA5EmpEhVlqcphWxkRRQNIVgn3z1aKCHpDshiszdrOJ26m7RtTATP6feyeM9qqELEzAX4wOgnuGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=mdUqYNn/; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from localhost.localdomain (unknown [IPv6:2001:b07:5d2e:52c9:cc1e:e404:491f:e6ea])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id EB607DC9;
	Mon,  6 May 2024 16:49:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1715007000;
	bh=HITyKoJSr9PJAhrXF9x+wUhptTP3rWST5fPmdzQQpBU=;
	h=From:To:Cc:Subject:Date:From;
	b=mdUqYNn/ZNy/Ok+oEBl56/9IFckReFT/sq9SdllKwu+GFq6H7/a00xinIpJ3e25FF
	 4jlXAqHtHanTntAoht1ZddTD7+SvWflH7Zvv4gSTmGGG2uxnrb2J8pVD6qABbnV5W8
	 +E0/FKvIILS/TkytcTvhnJSGUU3fZrPlC/mntzVo=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: laurent.pinchart+renesas@ideasonboard.com,
	niklas.soderlund+renesas@ragnatech.se,
	kieran.bingham+renesas@ideasonboard.com
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	linux-media@vger.kernel.org
Subject: [PATCH] media: i2c: max9271: Ignore read error in s_stream
Date: Mon,  6 May 2024 16:49:46 +0200
Message-ID: <20240506144947.85253-1-jacopo.mondi@ideasonboard.com>
X-Mailer: git-send-email 2.44.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In order to start streaming, the serializer's SEREN bit has to
be asserted and the video link enabled. In order for the video
link to be enabled correctly a valid pixel clock has to be
detected between the serializer and the connected image sensor.

The pixel clock detection is performed by reading register 0x15 but the
first attempt to read the register value sporadically fails resulting in
a error in the stream start procedure.

As the error is not fatal, and the pixel detection procedure will abort
anyway after 10 msec if no valid pixel clock is detected, continue
instead of failing immediately if the register read fails.

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

---
When running 4 cameras at a time, the first register read on the first started
camera fails pretty often. I here decided to ignore the error and go for another
read attempt, but issuing a simple "i2c_smbus_read_reg()" (as we do in the wakup
function) before the actual register read resolves the issue in the same way.

I've not been able to find in the datasheet any mention of a "ping to wakeup"
requirement before enabling the video channel, but this change make capturing
from 4 RDACM20 camera pretty reliable.
---

 drivers/media/i2c/max9271.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/max9271.c b/drivers/media/i2c/max9271.c
index ff86c8c4ea61..e339dff3986d 100644
--- a/drivers/media/i2c/max9271.c
+++ b/drivers/media/i2c/max9271.c
@@ -66,8 +66,10 @@ static int max9271_pclk_detect(struct max9271_device *dev)

 	for (i = 0; i < 100; i++) {
 		ret = max9271_read(dev, 0x15);
-		if (ret < 0)
-			return ret;
+		if (ret < 0) {
+			usleep_range(50, 100);
+			continue;
+		}

 		if (ret & MAX9271_PCLKDET)
 			return 0;
--
2.44.0


