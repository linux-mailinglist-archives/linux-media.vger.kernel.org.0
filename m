Return-Path: <linux-media+bounces-19091-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A250E9906B8
	for <lists+linux-media@lfdr.de>; Fri,  4 Oct 2024 16:52:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5DC77287921
	for <lists+linux-media@lfdr.de>; Fri,  4 Oct 2024 14:52:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8113F21F434;
	Fri,  4 Oct 2024 14:47:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="tKm/zeBY"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D40F2194A2;
	Fri,  4 Oct 2024 14:47:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728053237; cv=none; b=RasuRHit37PjakYgs6YZ/765Bal1EPYfLQS2mwuHTtM5hlFTk3oKmaX50sb6aaTAAQLfNdnHTakIcd8xh3dQl+ZESjDefJkpz7BKxP7GqcBGg+98bdu1od0zgf4kcu6oSWstKtcsgiMqVGalECoO9YEGx3piPy06cOtUDoBLHBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728053237; c=relaxed/simple;
	bh=jVVpja8HJr5tS26NiZRTQ7CgBBdWwcmpPnoC69uSxE4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=D0fFvI1ZRGUNxm+M2yeJEBiJ6O7EbY8lYpiGOvxO6m5z3gCCp9qpWJkeVYcM5U6F5OTlj4rFplfeC6kBgoN2NMQtZCLf+Bf9y9HXhakLzwJPWl8YXIUZLW1GAs5L1ppdEFXmOna/wPtEjG2d5R0Z5yc8YqTeZHNyqm6tWbcjqqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=tKm/zeBY; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-156-87-48.elisa-laajakaista.fi [91.156.87.48])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 094D059C;
	Fri,  4 Oct 2024 16:45:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1728053140;
	bh=jVVpja8HJr5tS26NiZRTQ7CgBBdWwcmpPnoC69uSxE4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=tKm/zeBYbIU+KqRJTxCR1oXAcabPWn2rZxiSSjCxz0rxWpi1ofcw34GQWmZ8SSvqE
	 /yURLFB3v+Xrr0jn0MRYDUDwlI8pcR3FmI+eTcaRQlkCse+bJBvEdZjNuYh6ruPd16
	 lXFsRBWOlIJygJ1DwYWrgMl9EbnumASv5Oxypfdc=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Fri, 04 Oct 2024 17:46:32 +0300
Subject: [PATCH 01/13] media: i2c: ds90ub9x3: Fix extra fwnode_handle_put()
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241004-ub9xx-fixes-v1-1-e30a4633c786@ideasonboard.com>
References: <20241004-ub9xx-fixes-v1-0-e30a4633c786@ideasonboard.com>
In-Reply-To: <20241004-ub9xx-fixes-v1-0-e30a4633c786@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jai Luthra <jai.luthra@ideasonboard.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1669;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=jVVpja8HJr5tS26NiZRTQ7CgBBdWwcmpPnoC69uSxE4=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBm///s1QcMHkesnhTHxh1jern33gDE8+jLjmcua
 SV1eetVijCJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZv//7AAKCRD6PaqMvJYe
 9al9EACdSBxidw6MmXaZsXNDGnuXYfShvvY5SwCFMHIHiXcS/orQCCiuaVWLcpUM7rr3jqo5/Ah
 pOCA2lSaMShV476fUTKGFpjlfWull5icK2VojfCrf+2O7VApoHX2aiNUgX8taBUqVahZLPurdLl
 SF7OaUwSkjimK9IZplHsKKO4P+jSx986HsPrC3xwxiw0pQJw4hEAa/Mzq4AVKRKXCi5Rzaz5KLM
 NGYvEV7nKpgCxF0KdIAjl+g8o1lO1zVBasSsheZkq46JJBd9qic65RrIGcUScj3mqJP2OCKe+Gc
 7Y5ZUNLIuDrMfKkpZCRgijsxpWfPY/1deiKqaIlUwXo/iMn1TFAYDSg1Udv4UunFBdP4Ewzu2Oj
 Ml6qXu1HNmPt8/XDdU50ZG5mRTf4dOoFhNNV0h46qNHxXMG0elQb0/r35byx9Avml/c2SdH2zBE
 OwHkhDoyyEQD5zpbroNja63v4vWYBX542taGBDFTohsRw+VFvLTFbgRIHosGHu0p5O9ennQWu90
 cJEti07jMh8EJqBVIxXkBFNXCP7CUd3jhxX2wO9IxVMzbpscPlJS1XZXjPBw5owuHnW/amzUW7+
 byd1LOAqdONdgIWbxB3gJdjzJagt1RG/IjVkIKxJgfr8v/LI+l74+DdZvCRBDRvfbsIL9aG8HLN
 UHdQR2yPtjye0pA==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

The ub913 and ub953 drivers call fwnode_handle_put(priv->sd.fwnode) as
part of their remove process, and if the driver is removed multiple
times, eventually leads to put "overflow", possibly causing memory
corruption or crash.

The fwnode_handle_put() is a leftover from commit 905f88ccebb1 ("media:
i2c: ds90ub9x3: Fix sub-device matching"), which changed the code
related to the sd.fwnode, but missed removing these fwnode_handle_puts.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Fixes: 905f88ccebb1 ("media: i2c: ds90ub9x3: Fix sub-device matching")
---
 drivers/media/i2c/ds90ub913.c | 1 -
 drivers/media/i2c/ds90ub953.c | 1 -
 2 files changed, 2 deletions(-)

diff --git a/drivers/media/i2c/ds90ub913.c b/drivers/media/i2c/ds90ub913.c
index ca9bb29dab89..150d6641516f 100644
--- a/drivers/media/i2c/ds90ub913.c
+++ b/drivers/media/i2c/ds90ub913.c
@@ -793,7 +793,6 @@ static void ub913_subdev_uninit(struct ub913_data *priv)
 	v4l2_async_unregister_subdev(&priv->sd);
 	ub913_v4l2_nf_unregister(priv);
 	v4l2_subdev_cleanup(&priv->sd);
-	fwnode_handle_put(priv->sd.fwnode);
 	media_entity_cleanup(&priv->sd.entity);
 }
 
diff --git a/drivers/media/i2c/ds90ub953.c b/drivers/media/i2c/ds90ub953.c
index 16f88db14981..10daecf6f457 100644
--- a/drivers/media/i2c/ds90ub953.c
+++ b/drivers/media/i2c/ds90ub953.c
@@ -1291,7 +1291,6 @@ static void ub953_subdev_uninit(struct ub953_data *priv)
 	v4l2_async_unregister_subdev(&priv->sd);
 	ub953_v4l2_notifier_unregister(priv);
 	v4l2_subdev_cleanup(&priv->sd);
-	fwnode_handle_put(priv->sd.fwnode);
 	media_entity_cleanup(&priv->sd.entity);
 }
 

-- 
2.43.0


