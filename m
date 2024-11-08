Return-Path: <linux-media+bounces-21125-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A356F9C1937
	for <lists+linux-media@lfdr.de>; Fri,  8 Nov 2024 10:36:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5A9A11F240F3
	for <lists+linux-media@lfdr.de>; Fri,  8 Nov 2024 09:36:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1D221E2852;
	Fri,  8 Nov 2024 09:35:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="XjWNrBi/"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D16AF1E1A3E;
	Fri,  8 Nov 2024 09:35:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731058520; cv=none; b=czn/ZZz/OuE1BBXIweSocexxZRSm9t98zK5q73idNULE3oS5FDvq5rt0WTOlfwlYMPfP4NBB7c/lzKDrx99YhF5WIggvFIe2gEug78D8/RJy1ViU9BAnO9Kd4VKt4GMuP3jv0HRMGlwvTKoulCibDPt+Tdhy5l8DtRqgx29TwME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731058520; c=relaxed/simple;
	bh=OC00lpY7NpyIrSmfbWRiAoUQ/5I+ziKOYf+2u7jSrH8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YTl+C2yGJTxofw/PEFohGTsJ5NIP2Hrpthpun4N/cj1lGla4yPrsvZAKP8GIlYDBT5nM4ITBJsPYdB1ioWLQhTwipkNPt6Z8KT5aDsNQY5Ipu2vkRBFEgXr82YD6eE7u4FCEQxL15ijRnY481w+JaD0fHcQZguLECT44ZoCZEjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=XjWNrBi/; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-157-155-49.elisa-laajakaista.fi [91.157.155.49])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9E369A30;
	Fri,  8 Nov 2024 10:35:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1731058507;
	bh=OC00lpY7NpyIrSmfbWRiAoUQ/5I+ziKOYf+2u7jSrH8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=XjWNrBi/mOLC5WZ3h5iQmW069oCnKovu/okPn0Hu8OWJW6EOrIZ5EFKcEraGaN5mI
	 8PVGIGoVU8TasLQNcEzBjhlB2RBP8exumELaC40A/rXPeyvj2WKJcFRiyuDbYyCiWc
	 tR+dlB/wuyhJP0aQyKtVGC5yguXLS9YgVPTmPp2E=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Fri, 08 Nov 2024 11:34:45 +0200
Subject: [PATCH v2 01/15] media: i2c: ds90ub9x3: Fix extra
 fwnode_handle_put()
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241108-ub9xx-fixes-v2-1-c7db3b2ad89f@ideasonboard.com>
References: <20241108-ub9xx-fixes-v2-0-c7db3b2ad89f@ideasonboard.com>
In-Reply-To: <20241108-ub9xx-fixes-v2-0-c7db3b2ad89f@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jai Luthra <jai.luthra@ideasonboard.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1677;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=OC00lpY7NpyIrSmfbWRiAoUQ/5I+ziKOYf+2u7jSrH8=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBnLdtN+IeuO31FN375+cuGav2V2T1fr/kDyUD3U
 oZPzT12uM+JAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZy3bTQAKCRD6PaqMvJYe
 9XlMD/41+MLDic05HXHz+QGGJfZAqVxOhUwuCUylXevDEdmIXJRgJPHt8DMD5r5wYjDe0qwvQGA
 aorantz1W8knvSXdYOONYkO53/LK/VCs61zH0BCjFn8OmNFU7mIdwBQ7IUrLm0kukXBy1Zhphhd
 bOE2+of9TfFeepRFVKiY08FC7C8581yqA6+5GdK3hypm4/HBGFxNZayVEQmtnznde4LEgkqMMEQ
 n3KHom5F5P+ORJS8dqCpZHzh9gFVFwVTGu/LZ3iGAvei3kBFgFgOqU0xezojzuRu/7N82JqdDzI
 e6AEw911/Qd1qxiYjWN8hn1o221yegcX9ImwMPnq/mijNQ0DiUNqxipvQ1VBf6kOimeA1FI1jNK
 weg5Yn/YqXwf7OJ1IbDawdrvM7nFW+7h3g+Z4YnX4KpSy8M2807WeYE+ih6ChoR++AfsDYKfOVP
 lp+R966HcqxuliEWq+GsaOuOeBU3tuCWyapFdbI72+6xN2UZN0EXWNX7bZat+ovQ+Ilaq97Gg9q
 63F+xmKWYZ22HDYteXO38rKEclkJfgpXSp2UKvE/W4sDz2lgOEUed8U7B54NfEIUS0EYYnHoL+1
 EjRFiN8ELjJB1pfXnSB/sNgFfSY+ryNvph+1RCLkW7iB4YJ16lVYtXCStiiQtwOdpQLDR4QhybM
 FUjPggJnEb6P9Og==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

The ub913 and ub953 drivers call fwnode_handle_put(priv->sd.fwnode) as
part of their remove process, and if the driver is removed multiple
times, eventually leads to put "overflow", possibly causing memory
corruption or crash.

The fwnode_handle_put() is a leftover from commit 905f88ccebb1 ("media:
i2c: ds90ub9x3: Fix sub-device matching"), which changed the code
related to the sd.fwnode, but missed removing these fwnode_handle_put()
calls.

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


