Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 074BE1F5E8C
	for <lists+linux-media@lfdr.de>; Thu, 11 Jun 2020 01:06:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726768AbgFJXGC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 10 Jun 2020 19:06:02 -0400
Received: from bin-mail-out-06.binero.net ([195.74.38.229]:7175 "EHLO
        bin-mail-out-06.binero.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726453AbgFJXGC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 10 Jun 2020 19:06:02 -0400
X-Halon-ID: ef9f9575-ab6e-11ea-933e-005056917a89
Authorized-sender: niklas@soderlund.pp.se
Received: from bismarck.berto.se (p4fca2eca.dip0.t-ipconnect.de [79.202.46.202])
        by bin-vsp-out-01.atm.binero.net (Halon) with ESMTPA
        id ef9f9575-ab6e-11ea-933e-005056917a89;
        Thu, 11 Jun 2020 01:05:54 +0200 (CEST)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 3/5] v4l2-async: Flag when media graph is complete
Date:   Thu, 11 Jun 2020 01:05:39 +0200
Message-Id: <20200610230541.1603067-4-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200610230541.1603067-1-niklas.soderlund+renesas@ragnatech.se>
References: <20200610230541.1603067-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

When the notifier completes set the complete flag in the struct
media_device. This flag can can then be reported to user-space to let it
know the graph is complete.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/media/v4l2-core/v4l2-async.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
index 8bde33c21ce45f98..331594ca5b3bb723 100644
--- a/drivers/media/v4l2-core/v4l2-async.c
+++ b/drivers/media/v4l2-core/v4l2-async.c
@@ -217,6 +217,11 @@ v4l2_async_notifier_try_complete(struct v4l2_async_notifier *notifier)
 	if (!v4l2_async_notifier_can_complete(notifier))
 		return 0;
 
+#if defined(CONFIG_MEDIA_CONTROLLER)
+	if (notifier->v4l2_dev->mdev)
+		notifier->v4l2_dev->mdev->complete = true;
+#endif
+
 	return v4l2_async_notifier_call_complete(notifier);
 }
 
-- 
2.27.0

