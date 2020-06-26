Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F2D420AC40
	for <lists+linux-media@lfdr.de>; Fri, 26 Jun 2020 08:23:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728346AbgFZGX0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 Jun 2020 02:23:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726451AbgFZGX0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 Jun 2020 02:23:26 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2A38C08C5C1
        for <linux-media@vger.kernel.org>; Thu, 25 Jun 2020 23:23:25 -0700 (PDT)
Received: from pyrite.rasen.tech (unknown [IPv6:2400:4051:61:600:2c71:1b79:d06d:5032])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id EF24472E;
        Fri, 26 Jun 2020 08:23:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1593152604;
        bh=0Tuu/KmyuVDgLstdHUzKp/XPGV7COOKpvP+MgrqzwWc=;
        h=From:To:Cc:Subject:Date:From;
        b=ezdMvXMcotOciMl9jW4MTX+eNDb2q4QyXQZhWtgoyt5ufrTgsFxzDDZNKruiz+5cY
         PV+t4CYBDXSpeb66EEdMxpOsmfoVqRfblxorlg14H7QoFKZ/UzN2Pq5MT2soDv3yVb
         9ZWKQKoTihgb8+qAAfBni/+kSRMtYxAGkFdYmrdk=
From:   Paul Elder <paul.elder@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Paul Elder <paul.elder@ideasonboard.com>,
        laurent.pinchart@ideasonboard.com, hverkuil@xs4all.nl
Subject: [PATCH] v4l2-compliance: Add libcamera to businfo prefixes
Date:   Fri, 26 Jun 2020 15:22:58 +0900
Message-Id: <20200626062258.109511-1-paul.elder@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Support V4L2 devices provided by libcamera via its V4L2 compatibility
layer.

Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>
---
 utils/v4l2-compliance/v4l2-compliance.cpp | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/utils/v4l2-compliance/v4l2-compliance.cpp b/utils/v4l2-compliance/v4l2-compliance.cpp
index 91774782..b5bde2f4 100644
--- a/utils/v4l2-compliance/v4l2-compliance.cpp
+++ b/utils/v4l2-compliance/v4l2-compliance.cpp
@@ -629,7 +629,8 @@ static int testCap(struct node *node)
 	    memcmp(vcap.bus_info, "I2C:", 4) &&
 	    memcmp(vcap.bus_info, "parport", 7) &&
 	    memcmp(vcap.bus_info, "platform:", 9) &&
-	    memcmp(vcap.bus_info, "rmi4:", 5))
+	    memcmp(vcap.bus_info, "rmi4:", 5) &&
+	    memcmp(vcap.bus_info, "libcamera:", 10))
 		return fail("missing bus_info prefix ('%s')\n", vcap.bus_info);
 	if (!node->media_bus_info.empty() &&
 	    node->media_bus_info != std::string(reinterpret_cast<const char *>(vcap.bus_info)))
-- 
2.27.0

