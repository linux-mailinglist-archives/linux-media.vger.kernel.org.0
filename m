Return-Path: <linux-media+bounces-49302-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E392ACD5168
	for <lists+linux-media@lfdr.de>; Mon, 22 Dec 2025 09:37:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9581A3018434
	for <lists+linux-media@lfdr.de>; Mon, 22 Dec 2025 08:36:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51DED311940;
	Mon, 22 Dec 2025 08:17:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="b8KSi2Ey"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42ED63112D3;
	Mon, 22 Dec 2025 08:17:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766391443; cv=none; b=ptHNtfyXLvAY1Q3aGiXj/yfhnsXTH5GwC/8JmSnwoi4XaPqFEdYrGqz5Qrw5OmT1KD2SRdZACIScBcWa1XpSgbLeBA3pK/EYddOPV0uyNh4evjUC9KnBxKUD1PxtJ5mH9M4HW8f05jy/6dudrS4xmrbKvaupQVmYGQVfi87D0qw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766391443; c=relaxed/simple;
	bh=+4q7XDBSv2HOLIacEse0YUxohIzfPyOGVDZ/vAkNL5k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dKNnNQ25Ezq+eEi+iN82YoAgiG/2RBI2on/N7c9xNQRH1zHbeWrOW0A+hJTcK5YClk0CHdn2O+oQkvu4/eHfgM264uG9iTks3zbDLFVTmq+MdTv47aQa2xs7NNVKdmVjZ5xs+UuH03eAekdd9EihFt7igHQJUkc+GD+QgL8gfjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=b8KSi2Ey; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c66:aa51:d08b:9316:9524:9005])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 900FA593;
	Mon, 22 Dec 2025 09:17:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1766391431;
	bh=+4q7XDBSv2HOLIacEse0YUxohIzfPyOGVDZ/vAkNL5k=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=b8KSi2EyjVFtYjWLf8HIwVxaHCuPmhNa1nwjlKaiZftGEHZpi3RiLKaU7lZ3gW1H+
	 GwRKwe13Lutvv4wJAopZqFT+y64Kub62drtZJEk6v3887N8X5Gw4EwPBd9zAUpA9ab
	 dTWn6eogJnEDgcijMrQ69SzLlHjhhTA2bFGQINBQ=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Mon, 22 Dec 2025 13:45:40 +0530
Subject: [PATCH v4 16/17] media: i2c: ov5647: Tidy up PIXEL_RATE control
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251222-b4-rpi-ov5647-v4-16-b949c7309280@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2008;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=+4q7XDBSv2HOLIacEse0YUxohIzfPyOGVDZ/vAkNL5k=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBpSP4wTs0wTKkyGyqFbeO1ibUtcqI5EjLN0lK1E
 EhfiDvlKNCJAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCaUj+MAAKCRBD3pH5JJpx
 RTs+D/9pPBzokYgKjMrQN0Ydwv8fC5X9Eyr9xzc2XR/7GCk+eExyYpI1sNpr1C5qxB8M2Ry6kIc
 yMhl4RVoDe7BrbR4ORIiuQ8jh+/6TNuhdfsT9RGZi/fHUMs4WhQrOH5jEGlUiBLozdDLUbGNqS1
 koQjS0Q09mSjh82HMNEpsl0+z7eIsARnx/LWGQfC/1GWzGgnNvNZo7ChqvHQA6dNJ5Uv11x+TFi
 KYC2iVCwKGp6iVW4GzD6UdaOCeVvkOYSYw/zBnnXxYYBIvIIFd8P7Cqq/53cAiHIMK0Y9ozhfmB
 5E+KMYh5dH7Al5Gz00wxo27h8yc9wioZ0g8hN5mLGi28BPbXBuw9aV7jLvqDo9oX6qoc4pVufsC
 8+fjd6tlr81rmuJU+Y07QTQfWIkZibwuwS5i/4UWsPhM4lKJ4lGJ8o6DFyWFyw1gNzcDgEC6N2G
 7LsF5w1CTqSwvWw3vgZ2GyIrpKZ6upNHErpBCmAu07PR8AKU/2gWRCoBEtxP8ot5Z9IuTrRQ0ID
 nrmhUaqpgvPLh+CZiyD0AqUOJgVr4dl3VH2pSLuqmXekxxAwVqz5fRZ+YrKiDy10uYvy+3HzNgP
 Jmpf1ogPL/z/Q8fo0Iy3TWkVLBtFNGOlKCopd/8SuqOmOCRewiUNMHhzv6URr04OBTYaeUp3MmX
 6vLXvYh6I8DPJwA==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145

The pixel rate control is marked as read-only by the framework itself,
so no need to mark it explicitly in the driver. Also, we can set the ops
to NULL to avoid checking for it in the s_ctrl implementation.

Suggested-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
 drivers/media/i2c/ov5647.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/media/i2c/ov5647.c b/drivers/media/i2c/ov5647.c
index d4a13e17692ff178e9dc257bcca0e44c92705825..7003c9922c5be666b4322c8d1dd0a2893c86f253 100644
--- a/drivers/media/i2c/ov5647.c
+++ b/drivers/media/i2c/ov5647.c
@@ -1190,12 +1190,6 @@ static int ov5647_s_ctrl(struct v4l2_ctrl *ctrl)
 		ret = ov5647_write(sd, OV5647_REG_ISPCTRL3D,
 				   ov5647_test_pattern_val[ctrl->val]);
 		break;
-
-	/* Read-only, but we adjust it based on mode. */
-	case V4L2_CID_PIXEL_RATE:
-		/* Read-only, but we adjust it based on mode. */
-		break;
-
 	case V4L2_CID_HFLIP:
 		/* There's an in-built hflip in the sensor, so account for that here. */
 		ret = ov5647_s_flip(sd, OV5647_REG_TIMING_TC_H, !ctrl->val);
@@ -1262,7 +1256,7 @@ static int ov5647_init_controls(struct ov5647 *sensor)
 			  V4L2_CID_ANALOGUE_GAIN, 16, 1023, 1, 32);
 
 	/* By default, PIXEL_RATE is read only, but it does change per mode */
-	sensor->pixel_rate = v4l2_ctrl_new_std(&sensor->ctrls, &ov5647_ctrl_ops,
+	sensor->pixel_rate = v4l2_ctrl_new_std(&sensor->ctrls, NULL,
 					       V4L2_CID_PIXEL_RATE,
 					       sensor->mode->pixel_rate,
 					       sensor->mode->pixel_rate, 1,
@@ -1301,7 +1295,6 @@ static int ov5647_init_controls(struct ov5647 *sensor)
 	if (sensor->ctrls.error)
 		goto handler_free;
 
-	sensor->pixel_rate->flags |= V4L2_CTRL_FLAG_READ_ONLY;
 	sensor->sd.ctrl_handler = &sensor->ctrls;
 
 	return 0;

-- 
2.52.0


