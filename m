Return-Path: <linux-media+bounces-20422-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B8EF59B333E
	for <lists+linux-media@lfdr.de>; Mon, 28 Oct 2024 15:21:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E4AFB1C21C1A
	for <lists+linux-media@lfdr.de>; Mon, 28 Oct 2024 14:21:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4FD71DD864;
	Mon, 28 Oct 2024 14:21:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O2sTa4fZ"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E31713D539;
	Mon, 28 Oct 2024 14:21:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730125274; cv=none; b=ogaIZIuczml7zhdvJrTGpD9QX/kov9eXpIadYm4z5/SQGu1PHtYkmohjUIZQZNMF7X+NQZeH6/zTaFl9/Z5MAtEQFrQ5VtvW39rMXHZLSVx4WPROI08hv6jbiCX3NQWcZk5wlGb+L2/gWHFSKrAjSVQ4MPUqfs5LgjWeLp2D9MQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730125274; c=relaxed/simple;
	bh=QhoMOA3thfyYMlJZ9ETgV6sjVHnxZtN6xzc280Q27bM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=OVSCLLjlmzKAXu3izSs4EJKaozzxeQTVsBOCqw3p/b+wNST9/1t98SC4pZCytrmJcrspvjKDQDsZKeyXNcqlu5+ik2eRb6hqB/NVcbB/vqE9sV53In0KPWa61oLUAVFogdDIWwXJkcBettbcXTv7Bn75KTcQJgPW0B+A8HjM9q0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O2sTa4fZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C147DC4CEC3;
	Mon, 28 Oct 2024 14:21:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730125273;
	bh=QhoMOA3thfyYMlJZ9ETgV6sjVHnxZtN6xzc280Q27bM=;
	h=From:To:Cc:Subject:Date:From;
	b=O2sTa4fZmpqnas6xA7rb8gKMCrNDrD7WUHZOkFUSYa/tkykEawdP12GkAvHsly/Mk
	 Oqh4a0qoeN/jEa0A4RJCGPUEUjf074pmO/0TX4i6Y6EKzZEs863WoUCREV4ZfZotlr
	 NpEYLQwfJPx7gosnM1BZnx77re0aLfrow4H1MdMYk4zWtWqz3K7HjI5Q1dje3Z6mQd
	 WOEZFPI+6gxVqCRIjuOIl9Zz9bG9irIrGkBZoGGQAPdpk/xib8M28e9OTPw8VP4Acz
	 ZeGR/4/c98V/ur/B2anzTNKB8l/MyKTWQ8TfGQ95A0mIABdjFh02Pb6NdDIwaz0tWI
	 KCIgwMOCOYCkg==
From: Arnd Bergmann <arnd@kernel.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Zhipeng Lu <alexious@zju.edu.cn>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: dvbdev: return -EINVAL on failure
Date: Mon, 28 Oct 2024 14:21:03 +0000
Message-Id: <20241028142107.737053-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

The dvb_register_device() function can return an uninitialized
error code:

drivers/media/dvb-core/dvbdev.c:554:10: error: variable 'ret' is uninitialized when used here [-Werror,-Wuninitialized]
  554 |                 return ret;
      |                        ^~~

Change this to -EINVAL as in the other half of the #ifdef block.

Fixes: 972e63e895ab ("media: dvbdev: prevent the risk of out of memory access")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/media/dvb-core/dvbdev.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/dvb-core/dvbdev.c b/drivers/media/dvb-core/dvbdev.c
index 78f46cb47c84..8c8dc7bbc59b 100644
--- a/drivers/media/dvb-core/dvbdev.c
+++ b/drivers/media/dvb-core/dvbdev.c
@@ -551,7 +551,7 @@ int dvb_register_device(struct dvb_adapter *adap, struct dvb_device **pdvbdev,
 		kfree(dvbdev);
 		*pdvbdev = NULL;
 		mutex_unlock(&dvbdev_register_lock);
-		return ret;
+		return -EINVAL;
 	}
 #endif
 	dvbdev->minor = minor;
-- 
2.39.5


