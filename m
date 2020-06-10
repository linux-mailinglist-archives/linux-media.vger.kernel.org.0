Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 847911F5E88
	for <lists+linux-media@lfdr.de>; Thu, 11 Jun 2020 01:06:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726471AbgFJXGA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 10 Jun 2020 19:06:00 -0400
Received: from bin-mail-out-06.binero.net ([195.74.38.229]:8091 "EHLO
        bin-mail-out-06.binero.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726553AbgFJXGA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 10 Jun 2020 19:06:00 -0400
X-Halon-ID: ef3e8b75-ab6e-11ea-933e-005056917a89
Authorized-sender: niklas@soderlund.pp.se
Received: from bismarck.berto.se (p4fca2eca.dip0.t-ipconnect.de [79.202.46.202])
        by bin-vsp-out-01.atm.binero.net (Halon) with ESMTPA
        id ef3e8b75-ab6e-11ea-933e-005056917a89;
        Thu, 11 Jun 2020 01:05:54 +0200 (CEST)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 2/5] media-device: Add a complete flag to struct media_device
Date:   Thu, 11 Jun 2020 01:05:38 +0200
Message-Id: <20200610230541.1603067-3-niklas.soderlund+renesas@ragnatech.se>
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

Add a complete flag to indicate if the media graph is complete or not.
The use-case is for v4l2-async to set the flag when all subdevices are
bound and that the flag be reported to user-space so it can learn when a
graph is completely populated.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 include/media/media-device.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/media/media-device.h b/include/media/media-device.h
index fa089543072052cf..cd685c3a791c6c04 100644
--- a/include/media/media-device.h
+++ b/include/media/media-device.h
@@ -83,6 +83,7 @@ struct media_device_ops {
  * @serial:	Device serial number (optional)
  * @bus_info:	Unique and stable device location identifier
  * @hw_revision: Hardware device revision
+ * @complete:	Graph completed flag
  * @topology_version: Monotonic counter for storing the version of the graph
  *		topology. Should be incremented each time the topology changes.
  * @id:		Unique ID used on the last registered graph object
@@ -151,6 +152,7 @@ struct media_device {
 	char serial[40];
 	char bus_info[32];
 	u32 hw_revision;
+	bool complete;
 
 	u64 topology_version;
 
-- 
2.27.0

