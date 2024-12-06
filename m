Return-Path: <linux-media+bounces-22775-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7306A9E68BF
	for <lists+linux-media@lfdr.de>; Fri,  6 Dec 2024 09:27:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 26EEE1886068
	for <lists+linux-media@lfdr.de>; Fri,  6 Dec 2024 08:27:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6DB21E0DEA;
	Fri,  6 Dec 2024 08:27:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ZvV1GPDZ"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F3A41D47A2;
	Fri,  6 Dec 2024 08:27:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733473639; cv=none; b=n7MMucNfUMmBYvsIX40WThKH3rExghPlC6rOTZfvF8MNKwIpbDKADSfdLzcQxrYzoX4AFI3vAleSWmJq6+jd96Y+iggcGN0LSRHk+gwAKWriUpjHomxgAMLMEpRCk1fkjhXJrIYpuQG1rrK1LAx2TaZTnYHi+t2fXTrdhD5mfKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733473639; c=relaxed/simple;
	bh=hiiDMQ0QVyH5ARoHam2LktnO8Z7HGrueYA4xcpNrgdw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nfRyEraoJ6QnJOeVKLzL+YfPhoyAwivfaaP2PyjwHDsRRrTTnMgxwZp7aRusx5SCCU5N6UM8CCgAN0PbayfBLW8ft6/P92Pd9AZ+dxLZXs5Wfr7rH+e6yoDyba18KFy4DlNPR0YgaH9OlE1TS3B7m2hqRkU/xn/gy0331R/1U6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ZvV1GPDZ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-157-155-49.elisa-laajakaista.fi [91.157.155.49])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id EB3DE9FC;
	Fri,  6 Dec 2024 09:26:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1733473605;
	bh=hiiDMQ0QVyH5ARoHam2LktnO8Z7HGrueYA4xcpNrgdw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ZvV1GPDZCot0zkih/jpySTac04qrXKDORVvP+NmIcuR/iWN/NZiicck5HjdGsXIK5
	 zJlrxw0BML8Rhy3qMU1oaM2cGfeaLAW64vFFGLQEmBAzy6krS/7dUbm5xJRKPaApSr
	 dyk5RGhHx8WwBWeT2SfSh6u7GbUW0XyAG57jT8rw=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Fri, 06 Dec 2024 10:26:37 +0200
Subject: [PATCH v4 01/15] media: i2c: ds90ub9x3: Fix extra
 fwnode_handle_put()
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241206-ub9xx-fixes-v4-1-466786eec7cc@ideasonboard.com>
References: <20241206-ub9xx-fixes-v4-0-466786eec7cc@ideasonboard.com>
In-Reply-To: <20241206-ub9xx-fixes-v4-0-466786eec7cc@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Jai Luthra <jai.luthra@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, stable@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1760;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=hiiDMQ0QVyH5ARoHam2LktnO8Z7HGrueYA4xcpNrgdw=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBnUrVbjjpK7Ti/JnvvpjXOoXt0rPI+IQuUgctN8
 q73htQwS3eJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ1K1WwAKCRD6PaqMvJYe
 9QI6D/4nHwnjwzsBjhbYOYf7emM5woFAfAvk8UCgl65gi1lYdLmFFQ52s9BQb0REIdNMe/G4LpX
 AT7f1ZB9Ur7oC1eEyk2QJe8bxzE6KaKUv8cX6TbLyp+rFxC97LwzPZ6+3UqXV4eL0poOO2hnqRR
 /RG7GNn3dWVA2xGOGPcjSR7NcPc5TIMQuu8GAxn6YtGssAt+ThrxGX3wjzfQo2r6HVvNGpygVJE
 gvyoR/ChWlc1hkIJWjcjf1mIBuZU3NKIgteRUUSB0711gccn53ZZ2UHDo3Bsj88mH9WCs+GWeSw
 XvHDijCX+8sghemPoaC+Dm02/iiNmfMjqkxKinoTDBIdre9AN7zu1CC1nn8zO3zcySaZgFy1cGw
 5YTEntxhb/+jivfkXzX+cF0lwoPPOQ2Cy1HCOvMNnd63Z2XIfjeewR0q/ZNtf4bSOyKuUoi6Vna
 GWgXZds3XmWX4eUNl5RGjXuL2q0l4vOshiI4pLmkGDZxhjPIszqfDNm4q0iZ3KqaW5SpyCXDTWT
 f8HTxIG32tuSnvIoLQvv6/nLOyjxwqdNafBRCnlycS8Mh9+CvBQb56fiHREz0Q6Nz1zOkxd8r80
 aiGWLIXrrjBh5XRzAAk7Nk5vjudoaDPlwZZd9OknH7nRC0oH9ESN5rUZpmClpqBpx+X3fUcGTQD
 oZ2AvA8nnHigibg==
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

Cc: stable@vger.kernel.org
Fixes: 905f88ccebb1 ("media: i2c: ds90ub9x3: Fix sub-device matching")
Reviewed-by: Jai Luthra <jai.luthra@ideasonboard.com>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/media/i2c/ds90ub913.c | 1 -
 drivers/media/i2c/ds90ub953.c | 1 -
 2 files changed, 2 deletions(-)

diff --git a/drivers/media/i2c/ds90ub913.c b/drivers/media/i2c/ds90ub913.c
index 8eed4a200fd8..b5375d736629 100644
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


