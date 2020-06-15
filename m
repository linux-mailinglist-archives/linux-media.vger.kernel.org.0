Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E55D61FA2E5
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2020 23:35:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731603AbgFOVe5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 15 Jun 2020 17:34:57 -0400
Received: from mail.kernel.org ([198.145.29.99]:46080 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731513AbgFOVe4 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 15 Jun 2020 17:34:56 -0400
Received: from embeddedor (unknown [189.207.59.248])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D1413207D3;
        Mon, 15 Jun 2020 21:34:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1592256896;
        bh=BdYjNLEgTcpmwRJ0GEQnNtjrpeCQvu4Ztsdv4OuQUNc=;
        h=Date:From:To:Cc:Subject:From;
        b=uxW7hxRX4HksUHvlNRvQrnjyZibTlQhWohtiL/A2cAee8xmUFMDP36Im1AQXIjvkb
         0G6YikUjq4c9sR/jjLZn5jv+7DP7f2DxQS8VsQqCLQlvkY490G82YW5BLj1GYm37jW
         6vdmEM7G4fICp75T0WO6kHQZGwmXHzPz1pJXS/mE=
Date:   Mon, 15 Jun 2020 16:40:15 -0500
From:   "Gustavo A. R. Silva" <gustavoars@kernel.org>
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: [PATCH] media: test_drivers: vivid-core: Use array_size() helper
Message-ID: <20200615214015.GA5258@embeddedor>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The tpg_alloc() and vmalloc() functions have no 2-factor argument form, so
multiplication factors need to be wrapped in array_size().

This issue was found with the help of Coccinelle and, audited and fixed
manually.

Addresses-KSPP-ID: https://github.com/KSPP/linux/issues/83
Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
---
 drivers/media/test-drivers/vivid/vivid-core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/test-drivers/vivid/vivid-core.c b/drivers/media/test-drivers/vivid/vivid-core.c
index 6c740e3e6999..7abaf858c4a3 100644
--- a/drivers/media/test-drivers/vivid/vivid-core.c
+++ b/drivers/media/test-drivers/vivid/vivid-core.c
@@ -1117,7 +1117,7 @@ static int vivid_create_instance(struct platform_device *pdev, int inst)
 	ret = -ENOMEM;
 	/* initialize the test pattern generator */
 	tpg_init(&dev->tpg, 640, 360);
-	if (tpg_alloc(&dev->tpg, MAX_ZOOM * MAX_WIDTH))
+	if (tpg_alloc(&dev->tpg, array_size(MAX_WIDTH, MAX_ZOOM)))
 		goto free_dev;
 	dev->scaled_line = vzalloc(array_size(MAX_WIDTH, MAX_ZOOM));
 	if (!dev->scaled_line)
@@ -1127,7 +1127,7 @@ static int vivid_create_instance(struct platform_device *pdev, int inst)
 		goto free_dev;
 
 	/* load the edid */
-	dev->edid = vmalloc(256 * 128);
+	dev->edid = vmalloc(array_size(256, 128));
 	if (!dev->edid)
 		goto free_dev;
 
-- 
2.27.0

