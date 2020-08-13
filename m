Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E3AF4244054
	for <lists+linux-media@lfdr.de>; Thu, 13 Aug 2020 23:06:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726637AbgHMVGU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 13 Aug 2020 17:06:20 -0400
Received: from bin-mail-out-06.binero.net ([195.74.38.229]:24930 "EHLO
        bin-mail-out-06.binero.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726427AbgHMVGT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 13 Aug 2020 17:06:19 -0400
X-Halon-ID: d45a33c2-dda8-11ea-a39b-005056917f90
Authorized-sender: niklas.soderlund@fsdn.se
Received: from bismarck.berto.se (p54ac52a8.dip0.t-ipconnect.de [84.172.82.168])
        by bin-vsp-out-02.atm.binero.net (Halon) with ESMTPA
        id d45a33c2-dda8-11ea-a39b-005056917f90;
        Thu, 13 Aug 2020 23:06:17 +0200 (CEST)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 1/2] rcar-vin: Unconditionally unregister notifier on remove
Date:   Thu, 13 Aug 2020 23:06:01 +0200
Message-Id: <20200813210602.3983805-2-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200813210602.3983805-1-niklas.soderlund+renesas@ragnatech.se>
References: <20200813210602.3983805-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

If the VIN device is part of a group of VIN devices (all Gen3 boards)
there is no reason to only unregister the group notifier if the VIN that
registers the notifier is removed. The VIN that registers the notifier
is always the last VIN device to be bound, so keeping the notifier
around after any VIN is unbound creates an unbalanced state where no VIN
in the group is operational.

Fix this by unconditionally unregistering the notifier when any VIN
device is unbound. Unregistering the notifier will lead to unbound()
being called and all video devices exposed by any VIN instance to be
removed.

The lock was only needed to protect the check which VIN registers the
notifier and is no longer needed.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/media/platform/rcar-vin/rcar-core.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/rcar-vin/rcar-core.c b/drivers/media/platform/rcar-vin/rcar-core.c
index 7440c8965d27e64f..1cbbcc9008e39627 100644
--- a/drivers/media/platform/rcar-vin/rcar-core.c
+++ b/drivers/media/platform/rcar-vin/rcar-core.c
@@ -1370,12 +1370,8 @@ static int rcar_vin_remove(struct platform_device *pdev)
 	v4l2_async_notifier_cleanup(&vin->notifier);
 
 	if (vin->info->use_mc) {
-		mutex_lock(&vin->group->lock);
-		if (&vin->v4l2_dev == vin->group->notifier.v4l2_dev) {
-			v4l2_async_notifier_unregister(&vin->group->notifier);
-			v4l2_async_notifier_cleanup(&vin->group->notifier);
-		}
-		mutex_unlock(&vin->group->lock);
+		v4l2_async_notifier_unregister(&vin->group->notifier);
+		v4l2_async_notifier_cleanup(&vin->group->notifier);
 		rvin_group_put(vin);
 	}
 
-- 
2.28.0

