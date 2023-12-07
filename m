Return-Path: <linux-media+bounces-1798-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B47980834B
	for <lists+linux-media@lfdr.de>; Thu,  7 Dec 2023 09:39:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CC4AD283C75
	for <lists+linux-media@lfdr.de>; Thu,  7 Dec 2023 08:38:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44A8831A7F;
	Thu,  7 Dec 2023 08:38:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="CoRiCgCA"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D4AB10E3
	for <linux-media@vger.kernel.org>; Thu,  7 Dec 2023 00:38:50 -0800 (PST)
Received: from umang.jain (unknown [103.251.226.79])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 171C9669;
	Thu,  7 Dec 2023 09:38:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1701938287;
	bh=D3D1TD9ac0JkckHnvb2sD5MkPEbDyC1GqVp0zg7uxc8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CoRiCgCAt3YVtv6/QNL1wTa+oIeCikbKPq8LhTP3nuVaJh4sxkl+yRz3V+UvZMm+Q
	 2/Pw4JHvqHWc4mpd0wO8y0miXRKf7/8YmifYKjhmPmw8/0o9JuOFLyuhmTE3Fo/nZq
	 F9GOiK4231mO9wgV0TAvNo4koBfg9rj1E/qyXiUk=
From: Umang Jain <umang.jain@ideasonboard.com>
To: linux-staging@lists.linux.dev,
	linux-rpi-kernel@lists.infradead.org,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Stefan Wahren <stefan.wahren@i2se.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dan Carpenter <error27@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	"Ricardo B . Marliere" <ricardo@marliere.net>,
	Umang Jain <umang.jain@ideasonboard.com>
Subject: [PATCH v3 2/2] staging: vc04_services: vchiq_dev: Use %p to log pointer address
Date: Thu,  7 Dec 2023 14:08:37 +0530
Message-ID: <20231207083837.153843-3-umang.jain@ideasonboard.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231207083837.153843-1-umang.jain@ideasonboard.com>
References: <20231207083837.153843-1-umang.jain@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Solves the following Smatch warnings:
vchiq_release() warn: argument 7 to %lx specifier is cast from pointer

%p will print the hashed pointer to dynamic debug.
In order to print the unmodified pointer address, one can use the
`no_hash_pointers` via kernel parameters.

Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
---
 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c
index 68c8897c504c..4d9deeeb637a 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c
@@ -1201,7 +1201,7 @@ static int vchiq_release(struct inode *inode, struct file *file)
 	int ret = 0;
 	int i;
 
-	dev_dbg(state->dev, "arm: instance=%lx\n", (unsigned long)instance);
+	dev_dbg(state->dev, "arm: instance=%p\n", instance);
 
 	if (!state) {
 		ret = -EPERM;
-- 
2.41.0


