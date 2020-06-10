Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 93BE51F5E8F
	for <lists+linux-media@lfdr.de>; Thu, 11 Jun 2020 01:06:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726777AbgFJXGD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 10 Jun 2020 19:06:03 -0400
Received: from vsp-unauthed02.binero.net ([195.74.38.227]:8720 "EHLO
        vsp-unauthed02.binero.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726753AbgFJXGC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 10 Jun 2020 19:06:02 -0400
X-Halon-ID: f05f6433-ab6e-11ea-933e-005056917a89
Authorized-sender: niklas@soderlund.pp.se
Received: from bismarck.berto.se (p4fca2eca.dip0.t-ipconnect.de [79.202.46.202])
        by bin-vsp-out-01.atm.binero.net (Halon) with ESMTPA
        id f05f6433-ab6e-11ea-933e-005056917a89;
        Thu, 11 Jun 2020 01:05:55 +0200 (CEST)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 5/5] rcar-vin: Do not unregister video device when a subdevice is unbound
Date:   Thu, 11 Jun 2020 01:05:41 +0200
Message-Id: <20200610230541.1603067-6-niklas.soderlund+renesas@ragnatech.se>
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

If the v4l2-async notifier have once been complete and the video
device(s) have been register, do not unregister them if one subdevice is
unbound. Depending on which subdevice is unbound other parts of the
pipeline could still be functional. For example if one of multiple
sensors connected to a CSI-2 transmitter is unbound other sensors in
that pipeline are still useable.

This problem is extra critical for R-Car VIN which registers two
independent CSI-2 receivers in the same media graph as they can both be
used by the same dma-engines. If one of the CSI-2 receivers are unbound
the other CSI-2 receiver pipeline is still fully functional.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/media/platform/rcar-vin/rcar-core.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/media/platform/rcar-vin/rcar-core.c b/drivers/media/platform/rcar-vin/rcar-core.c
index 7440c8965d27e64f..6b0f13618556cac4 100644
--- a/drivers/media/platform/rcar-vin/rcar-core.c
+++ b/drivers/media/platform/rcar-vin/rcar-core.c
@@ -525,7 +525,6 @@ static int rvin_parallel_subdevice_attach(struct rvin_dev *vin,
 
 static void rvin_parallel_subdevice_detach(struct rvin_dev *vin)
 {
-	rvin_v4l2_unregister(vin);
 	vin->parallel->subdev = NULL;
 
 	if (!vin->info->use_mc) {
@@ -747,10 +746,6 @@ static void rvin_group_notify_unbind(struct v4l2_async_notifier *notifier,
 	struct rvin_dev *vin = v4l2_dev_to_vin(notifier->v4l2_dev);
 	unsigned int i;
 
-	for (i = 0; i < RCAR_VIN_NUM; i++)
-		if (vin->group->vin[i])
-			rvin_v4l2_unregister(vin->group->vin[i]);
-
 	mutex_lock(&vin->group->lock);
 
 	for (i = 0; i < RVIN_CSI_MAX; i++) {
-- 
2.27.0

