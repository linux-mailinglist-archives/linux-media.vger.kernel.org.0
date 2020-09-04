Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3DC8325E37D
	for <lists+linux-media@lfdr.de>; Fri,  4 Sep 2020 23:52:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728164AbgIDVv7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 4 Sep 2020 17:51:59 -0400
Received: from hostingweb31-40.netsons.net ([89.40.174.40]:51484 "EHLO
        hostingweb31-40.netsons.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727057AbgIDVv5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 4 Sep 2020 17:51:57 -0400
Received: from [78.134.95.246] (port=33500 helo=melee.fritz.box)
        by hostingweb31.netsons.net with esmtpa (Exim 4.93)
        (envelope-from <luca@lucaceresoli.net>)
        id 1kEJcg-0004Q2-GZ; Fri, 04 Sep 2020 23:51:54 +0200
From:   Luca Ceresoli <luca@lucaceresoli.net>
To:     linux-media@vger.kernel.org
Cc:     Luca Ceresoli <luca@lucaceresoli.net>,
        linux-kernel@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [PATCH 1/3] media: docs: v4l2-subdev: fix typo
Date:   Fri,  4 Sep 2020 23:51:39 +0200
Message-Id: <20200904215141.20862-1-luca@lucaceresoli.net>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - hostingweb31.netsons.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - lucaceresoli.net
X-Get-Message-Sender-Via: hostingweb31.netsons.net: authenticated_id: luca+lucaceresoli.net/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: hostingweb31.netsons.net: luca@lucaceresoli.net
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fix "will to" -> "will do".

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 Documentation/driver-api/media/v4l2-subdev.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/driver-api/media/v4l2-subdev.rst b/Documentation/driver-api/media/v4l2-subdev.rst
index bc7e1fc40a9d..9a7dddd97f5a 100644
--- a/Documentation/driver-api/media/v4l2-subdev.rst
+++ b/Documentation/driver-api/media/v4l2-subdev.rst
@@ -191,7 +191,7 @@ but it is better and easier to use this macro:
 
 	err = v4l2_subdev_call(sd, core, g_std, &norm);
 
-The macro will to the right ``NULL`` pointer checks and returns ``-ENODEV``
+The macro will do the right ``NULL`` pointer checks and returns ``-ENODEV``
 if :c:type:`sd <v4l2_subdev>` is ``NULL``, ``-ENOIOCTLCMD`` if either
 :c:type:`sd <v4l2_subdev>`->core or :c:type:`sd <v4l2_subdev>`->core->g_std is ``NULL``, or the actual result of the
 :c:type:`sd <v4l2_subdev>`->ops->core->g_std ops.
-- 
2.28.0

