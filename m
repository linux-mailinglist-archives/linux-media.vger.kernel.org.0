Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CF2BB18A70A
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2020 22:31:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727108AbgCRVbH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Mar 2020 17:31:07 -0400
Received: from bin-mail-out-05.binero.net ([195.74.38.228]:49989 "EHLO
        bin-mail-out-05.binero.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726747AbgCRVbH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Mar 2020 17:31:07 -0400
X-Halon-ID: b206bf1e-695f-11ea-9f40-0050569116f7
Authorized-sender: niklas@soderlund.pp.se
Received: from bismarck.berto.se (p4fca2392.dip0.t-ipconnect.de [79.202.35.146])
        by bin-vsp-out-03.atm.binero.net (Halon) with ESMTPA
        id b206bf1e-695f-11ea-9f40-0050569116f7;
        Wed, 18 Mar 2020 22:30:32 +0100 (CET)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [RFC 2/5] media-device: Add a graph_complete callback to struct media_device_ops
Date:   Wed, 18 Mar 2020 22:30:48 +0100
Message-Id: <20200318213051.3200981-3-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200318213051.3200981-1-niklas.soderlund+renesas@ragnatech.se>
References: <20200318213051.3200981-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add a new graph_complete operation to struct media_device_ops. The
callback is optional to implement. If it's implemented it shall return
the status about the media graphs completes. If all entities that the
media device could contain is registered in the graph it shall return
true, otherwise false.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 include/media/media-device.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/media/media-device.h b/include/media/media-device.h
index fa089543072052cf..f637ad2eee38f456 100644
--- a/include/media/media-device.h
+++ b/include/media/media-device.h
@@ -61,6 +61,8 @@ struct media_entity_notify {
  *	       request (and thus the buffer) must be available to the driver.
  *	       And once a buffer is queued, then the driver can complete
  *	       or delete objects from the request before req_queue exits.
+ * @graph_complete: Check if the media device graph is complete and all entries
+ *		    have been added to the graph.
  */
 struct media_device_ops {
 	int (*link_notify)(struct media_link *link, u32 flags,
@@ -69,6 +71,7 @@ struct media_device_ops {
 	void (*req_free)(struct media_request *req);
 	int (*req_validate)(struct media_request *req);
 	void (*req_queue)(struct media_request *req);
+	bool (*graph_complete)(struct media_device *mdev);
 };
 
 /**
-- 
2.25.1

