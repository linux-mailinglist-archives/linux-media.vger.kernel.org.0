Return-Path: <linux-media+bounces-22592-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A41D9E3845
	for <lists+linux-media@lfdr.de>; Wed,  4 Dec 2024 12:06:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2F3BE28736F
	for <lists+linux-media@lfdr.de>; Wed,  4 Dec 2024 11:06:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DBF91B415F;
	Wed,  4 Dec 2024 11:05:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Oe+XQYUm"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1E4E1B4137;
	Wed,  4 Dec 2024 11:05:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733310348; cv=none; b=MC1vuOq12cW3fETI+N1wKAooz5X1HpX+FAEdPiOpoibwVQvXQgc3fA73fujlpzPtcOBbDE1TPHKUDXD+sC6pvXJYPscQMPA+LT8sc73BPWgilsoxnLfDPcvXw4BXmtwMz6iwFIXSMnj9hQQvtWQxUmjJD5VS0A2Zj1hopBmEFCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733310348; c=relaxed/simple;
	bh=9Q+3PN+oneMKxhelptmjC5NFHWuyRqKXnKfK75CmdQA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=d2D/xUv6vKM8Fcjs469i1qDn2j0QoRBn5DOYGM+M2YBG5IqjXHG94X2OljJj3Ea3B2yEXZZlnwC3c8CKYyU4zHr8Ge2QpoTMtY9hbhfdbW9FJEQ8jA2zYsIe4fsRXJA6jYLcMezDUniLkFonUsUFNGhL7QUbOuDZ9tAP9AcR5No=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Oe+XQYUm; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-157-155-49.elisa-laajakaista.fi [91.157.155.49])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7E4FA9FC;
	Wed,  4 Dec 2024 12:05:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1733310317;
	bh=9Q+3PN+oneMKxhelptmjC5NFHWuyRqKXnKfK75CmdQA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Oe+XQYUmbcpz24w5x9pat9Trho1+HN6/tcmsmXPGy+b3rTGhZNkEw+pjlWZ+whDjC
	 5hxLp3QRDiZUjJ3E99Elo+xxH4KyTQDRGFZ9MUL0RfUkyopcQiC+ESQVZj/t7VVpRF
	 mZ0xDAPCF0rtLEPerXVcFcZ8mDqOgcQaUWLTehQU=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Wed, 04 Dec 2024 13:05:15 +0200
Subject: [PATCH v3 01/15] media: i2c: ds90ub9x3: Fix extra
 fwnode_handle_put()
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241204-ub9xx-fixes-v3-1-a933c109b323@ideasonboard.com>
References: <20241204-ub9xx-fixes-v3-0-a933c109b323@ideasonboard.com>
In-Reply-To: <20241204-ub9xx-fixes-v3-0-a933c109b323@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Jai Luthra <jai.luthra@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, stable@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1705;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=9Q+3PN+oneMKxhelptmjC5NFHWuyRqKXnKfK75CmdQA=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBnUDeBYVp5Kfg9W7I/Qp2qHxiACwAa47wM0BRoh
 5lxVibt42iJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ1A3gQAKCRD6PaqMvJYe
 9XMbEACQ9pwMYU9SaQdXTYK+M49PDywbL5xCbOnk7bTQjSc6U77i1AR9nMAQSxN5EivAoBczkl4
 RZzhaFt33HkIQI8QerX2POTtu+vaO6UYPjeWkELNwbp6VQ9ZWHos1gpVtAN00VcAOxxmFoeD5ld
 yg81gyHY6PR3w0IUvhqsgR8XXqRr0gKWrPYndGpzOkSnsW/o65JFuxSJWULFTuk1z+i9ZaBkp8Q
 dmePwIz7/BGpMaAF8laEXUSiixF+7kMZKvnaTz/Ylyygpt9+LeuIa2WmfPcp6ViCtZ3coaYwYOD
 YnvSi0PaflK8s7NHvMssI2zchX0IEFPV8A42wHDwz72Xluklt0NAxMcDSeQ0FOe+epvyuUALdLN
 y8hyHIWwid+FtcvHLEfeDycL3QTufZr8m+Wkav7o1BO/vM9+zgugE/Nt3mzzqDWUTBCUQe6kICT
 o/s5LJfcNvCEiEz3pGlAFgaWiqrUWcyTtFX4BhickpPLH6P3rEJpSAgHKh/7m9PabNjQ3esUWQb
 sAf9gMY6Zt3PcV+gxa3RdHHF2kGXvWU72kxntzOsiU5+5xPFu2J1r+NknFddJjakcSvkArtb5Jc
 FakmFfIaMS5F7gwWm/sxh1SodJUZTZSOvKyu+qNmJovfIKnu25UU+l8cP3gTUJaRCNktKzEYUYr
 bu1fplZHVVksbCw==
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
Cc: stable@vger.kernel.org
Fixes: 905f88ccebb1 ("media: i2c: ds90ub9x3: Fix sub-device matching")
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


