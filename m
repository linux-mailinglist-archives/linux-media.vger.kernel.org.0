Return-Path: <linux-media+bounces-49288-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 219F9CD4F23
	for <lists+linux-media@lfdr.de>; Mon, 22 Dec 2025 09:16:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6EEAA300E3E1
	for <lists+linux-media@lfdr.de>; Mon, 22 Dec 2025 08:16:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 187DA30C375;
	Mon, 22 Dec 2025 08:16:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="AsZJ1ceA"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4136215A864;
	Mon, 22 Dec 2025 08:16:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766391371; cv=none; b=o2nq/i2aAU6DG1n2IqHX9ely1X8hubkr/TDZndoSSBS8v/hzdBqPAl0wBFEIkeEgm3QCUJ+T+R/H2sx+qyHyZmHzkdfEQjTYJnykyTtp3QGhQM3c7/KjznRGuVN08iwVUaHYAiZNWNA3MJPolMtL7BGQA67fbvZBQ/TFea7ulIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766391371; c=relaxed/simple;
	bh=PW+/8dl2mQGpTkC+eShCSuNoV+iHnXMHKa+UcCLLYY8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VUbHrEvq51SVdk3/Uf2MVcIFNTszhNOs3mVKlrX9OkNhlQUeSZ4UDdZWOcIro8zYNrb28f4UIa8toiVIHwCrbbxCOmxE7VTtHtY8TdvW1Swv5XmIJZ0Bqo1UbPPSa6MbJs38Idb0abEKRXRbXmEvzEDlzMaHouJUf2DE1T8tnDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=AsZJ1ceA; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c66:aa51:d08b:9316:9524:9005])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B4CE5593;
	Mon, 22 Dec 2025 09:15:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1766391356;
	bh=PW+/8dl2mQGpTkC+eShCSuNoV+iHnXMHKa+UcCLLYY8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=AsZJ1ceAyZGBbmT8wolP7irMlmqHQhHRPxT0Woz4wQg5iPUY4LCbyrU3m5anLyiRc
	 OayP7vQUCPpP6yVmHINcb4ErtOeJOGqdI+HflCH03EcjUtpWBzZX6+96oCTR9yUcNB
	 dDJ9yvbU3LiIhD+Mj6lq0Lyon8dh0ecUWe8BmfC0=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Mon, 22 Dec 2025 13:45:26 +0530
Subject: [PATCH v4 02/17] media: i2c: ov5647: Correct pixel array offset
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251222-b4-rpi-ov5647-v4-2-b949c7309280@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=944;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=BagRXN6sZL/zObcXhgJy0qmX4s/f+WU1Te2BiQiP7r8=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBpSP4itYstjdE53DuUkc64+HkDdRo5zby4d1ca/
 GG/8bFJZDOJAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCaUj+IgAKCRBD3pH5JJpx
 RTO7D/9sMLYaLC0xNBh641gp4zYNVY0xDEvjHpW0Ew7e1wCgiNbDJFsVd5tCJL7RT+hAYbBuv26
 doSX6EI7tGH+NYehiW00GFKPbdpLMQa4WFEPh8yCuLASJSeR+LnqWCJpC6m/mukRfj038jIbwbU
 vHbJObcE1BpQNfa18YZk61n+rYdC7Oklv1svNijYCCK0jAdXp0PRWkj2wo783oqW9VVL/wU2Khq
 ++he5z75PrPXdwOC3BEzXG9WklnsGT7TzdRqXTdtWQ9F69zmjJtuaA/qZ2opr2IFpLtKXqtzWlX
 eIyevGw5MUMmeMCjlAJfLD4F44S8UrwCcMIzLfwum0zydvn7IBYdcormnXJgFlIhhcc6GePDGNZ
 6hrj8pWiZROkh6piYeNpVeQ3JtRRTk7iGC/IC/GB+siIqryBw1oQjoPFh0UJ95QG8ObZp37n+Ex
 o9SwH/nvUlRhpxNrYqUAbhyFc4Hs46KUQz8hCdDK4S1uV8eC5uzN+Y1On5cS8/Ltsw08V4L7uFo
 7gPQe/NYjZTYcAoZw7DFzM3cPAxtKklD8M0cGpBEVPqelw3pGLmuMh8Lm+bBfP97BtWU5e2yPnh
 0oYmRGL0Cen2MaeghuGen02Ct1GkjUgoYEWzxGEIfU3nSKc0+HW6gwLhqJTks3j4BfDSV45FSsK
 dfQQyESGiTrhDeg==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145

From: David Plowman <david.plowman@raspberrypi.com>

The top offset in the pixel array is actually 6 (see page 3-1 of the
OV5647 data sheet).

Fixes: 14f70a3232aa ("media: ov5647: Add support for get_selection()")
Signed-off-by: David Plowman <david.plowman@raspberrypi.com>
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
 drivers/media/i2c/ov5647.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ov5647.c b/drivers/media/i2c/ov5647.c
index f9fac858dc7ba754bdbebe1792f6fb0358781408..d9e300406f58e554de12d9062840353bdf7a226c 100644
--- a/drivers/media/i2c/ov5647.c
+++ b/drivers/media/i2c/ov5647.c
@@ -69,7 +69,7 @@
 #define OV5647_NATIVE_HEIGHT		1956U
 
 #define OV5647_PIXEL_ARRAY_LEFT		16U
-#define OV5647_PIXEL_ARRAY_TOP		16U
+#define OV5647_PIXEL_ARRAY_TOP		6U
 #define OV5647_PIXEL_ARRAY_WIDTH	2592U
 #define OV5647_PIXEL_ARRAY_HEIGHT	1944U
 

-- 
2.52.0


