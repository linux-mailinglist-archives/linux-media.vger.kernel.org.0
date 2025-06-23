Return-Path: <linux-media+bounces-35613-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DDBFAE3D93
	for <lists+linux-media@lfdr.de>; Mon, 23 Jun 2025 13:00:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 36A9B7A56D5
	for <lists+linux-media@lfdr.de>; Mon, 23 Jun 2025 10:59:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F063423C4F2;
	Mon, 23 Jun 2025 11:00:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qRVXv3UE"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59F7F10E9
	for <linux-media@vger.kernel.org>; Mon, 23 Jun 2025 11:00:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750676445; cv=none; b=bTvUNjJVx9OlVNl5IYTfU/TxR4Vwg4FKwT/ACRX321NSsb3mRviTP2hGbzhhY7YL8KRRXLqAdlafkcF/dRn4tPid+DZcZAdrKPzQBVYIIDLcAokgpQrCZPCMZ1dG/HmmYH1QbcVthzQHDhU9LGxc+/OHMxZ7a1zFGE12H2V1xJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750676445; c=relaxed/simple;
	bh=MVY7AKiaZooC07nzEcKGLfte6M/06uHVXX1ovRX/OfA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gQ2VCSa/3k76XP8m9LGzO2MKpzx8BZU250pBlKjHiLEWY7pBxR08tfHsXD97eVCLe/dszPG5CxwOjfLAVeZRVCT3O8RRF8sbdrRvNHpFzAK8gtVM5p8Pk2D6n1yb1SH1t6IWZWlTFjNZjuJDOSAkd20BMOxIe0CRSLpK0woSgVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qRVXv3UE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC897C4CEF2;
	Mon, 23 Jun 2025 11:00:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750676445;
	bh=MVY7AKiaZooC07nzEcKGLfte6M/06uHVXX1ovRX/OfA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qRVXv3UELY7SDumA1E8gtE2jxgCBYqi8XdkcsiAqo+GMKTAPb6m/fkGYbAl751yeX
	 v3KmpX8D4EABuhFBlmOAqVMIkHNzFfn7/9mpSYLy2V4lheN36RT7v8pbawXSy5+T2r
	 9Wkg49ss/nas59Ho7c/W8pTkC2lz611KTaK95Qh0Kl7vSFxYHRqn63jyXC5FPnPWzU
	 uFyGi1cpdaFO0sD+fpUHeb5/ftDqP/SwVWhbcbAGII/gUTvIsmJlxqNkK6tIDeHjfE
	 cGDalpTGV+6ukpXWBDn/mFojZu8bi+aL1uyE3jfHt1jj9CvPAfEIcbKOFsqJfrns8F
	 3IOCgFbGmDMBQ==
From: Hans de Goede <hansg@kernel.org>
To: Daniel Scally <djrscally@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH 3/4] media: ov8865: Improve error logging when fwnode is not found
Date: Mon, 23 Jun 2025 13:00:34 +0200
Message-ID: <20250623110035.18340-4-hansg@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250623110035.18340-1-hansg@kernel.org>
References: <20250623110035.18340-1-hansg@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Hans de Goede <hdegoede@redhat.com>

The ov8865 driver waits for the endpoint fwnode to show up in case this
fwnode is created by a bridge-driver.

It does this by returning -EPROBE_DEFER, but it does not use
dev_err_probe() so no reason for deferring gets registered.

After 30 seconds the kernel logs a warning that the probe is still
deferred, which looks like this:

[   33.952061] i2c i2c-INT347A:00: deferred probe pending: (reason unknown)

Use dev_err_probe() when returning -EPROBE_DEFER to register the probe
deferral reason changing the error to:

deferred probe pending: waiting for fwnode graph endpoint

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/media/i2c/ov8865.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ov8865.c b/drivers/media/i2c/ov8865.c
index 95ffe7536aa6..a2138f7988aa 100644
--- a/drivers/media/i2c/ov8865.c
+++ b/drivers/media/i2c/ov8865.c
@@ -2991,7 +2991,8 @@ static int ov8865_probe(struct i2c_client *client)
 
 	handle = fwnode_graph_get_next_endpoint(dev_fwnode(dev), NULL);
 	if (!handle)
-		return -EPROBE_DEFER;
+		return dev_err_probe(dev, -EPROBE_DEFER,
+				     "waiting for fwnode graph endpoint\n");
 
 	sensor->endpoint.bus_type = V4L2_MBUS_CSI2_DPHY;
 
-- 
2.49.0


