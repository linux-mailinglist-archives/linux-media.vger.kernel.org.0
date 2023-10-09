Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DAA9C7BE2B3
	for <lists+linux-media@lfdr.de>; Mon,  9 Oct 2023 16:27:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1376995AbjJIO1E (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Oct 2023 10:27:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1376994AbjJIO1D (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 9 Oct 2023 10:27:03 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F5AFCA
        for <linux-media@vger.kernel.org>; Mon,  9 Oct 2023 07:27:02 -0700 (PDT)
Received: from umang.jainideasonboard.com (unknown [IPv6:2405:201:2033:3002:3848:5d20:59c9:c87c])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3D3C756D;
        Mon,  9 Oct 2023 16:26:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1696861617;
        bh=WQ3xASG267In0YvI93AXom8OWAcBmrMz7+LHP8T4v5E=;
        h=From:To:Cc:Subject:Date:From;
        b=OiDwVAYbYd7qHBTHXcurgmZPgZUVUKnWO9gsInMLEaowi5+EbNc2FCaBXIwcGFzMJ
         e4LBvJ5rBXPSBgIKhe8k8hL37BwTZmxF78ITFvwN8/KwO9Cw2JRYfMry2JyvQ7vb3O
         oPvJxYT0zCaSIM4FckJVw4eIRqRX2CllD7t0MCzw=
From:   Umang Jain <umang.jain@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Umang Jain <umang.jain@ideasonboard.com>
Subject: [PATCH] media: Documentation: ccs: Fix spelling mistake
Date:   Mon,  9 Oct 2023 19:56:48 +0530
Message-Id: <20231009142648.179243-1-umang.jain@ideasonboard.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Correct the wrong spelling of 'exposes' in the binner section.

Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
---
 Documentation/driver-api/media/drivers/ccs/ccs.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/driver-api/media/drivers/ccs/ccs.rst b/Documentation/driver-api/media/drivers/ccs/ccs.rst
index 7389204afcb8..7c1c45d4c518 100644
--- a/Documentation/driver-api/media/drivers/ccs/ccs.rst
+++ b/Documentation/driver-api/media/drivers/ccs/ccs.rst
@@ -30,7 +30,7 @@ that purpose, selection target ``V4L2_SEL_TGT_COMPOSE`` is supported on the
 sink pad (0).
 
 Additionally, if a device has no scaler or digital crop functionality, the
-source pad (1) expses another digital crop selection rectangle that can only
+source pad (1) exposes another digital crop selection rectangle that can only
 crop at the end of the lines and frames.
 
 Scaler
-- 
2.40.1

