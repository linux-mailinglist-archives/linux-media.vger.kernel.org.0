Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D997457823F
	for <lists+linux-media@lfdr.de>; Mon, 18 Jul 2022 14:24:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233690AbiGRMY5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 18 Jul 2022 08:24:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235116AbiGRMYn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 18 Jul 2022 08:24:43 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07ADA765D
        for <linux-media@vger.kernel.org>; Mon, 18 Jul 2022 05:24:39 -0700 (PDT)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E99BC6DC;
        Mon, 18 Jul 2022 14:24:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1658147078;
        bh=8GJxUO0sgiUTZ9Yvenn+5TX/f3PpytakZGHUhb5ztig=;
        h=From:To:Cc:Subject:Date:From;
        b=K8A6+YzilFkDe2wRr8Y5RwUPMWZk06F4jlJHhD0dvkLoaA1cMHk0Nr+JKfr6ptDJr
         1i/CCBO4TstK1HD7i4ObNNbxUu3XwaSOMu9wCulCSoUBhrL0g1FDif++cAqGqLkR+U
         znXNfQMAIH0ar86IZcWekJjTtK4c11PHcu5dilmw=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [PATCH] media: Documentation: mc-core: Fix typo
Date:   Mon, 18 Jul 2022 15:24:02 +0300
Message-Id: <20220718122402.22183-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fix a typo in the mc-core.rst media driver API documentation. Due to its
nature, the typo unfortunately caused a warning during documentation
build.

Fixes: 03b282861ca7 ("media: mc-entity: Add a new helper function to get a remote pad for a pad")
Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 Documentation/driver-api/media/mc-core.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/driver-api/media/mc-core.rst b/Documentation/driver-api/media/mc-core.rst
index 644911936ad9..84aa7cdb5341 100644
--- a/Documentation/driver-api/media/mc-core.rst
+++ b/Documentation/driver-api/media/mc-core.rst
@@ -186,7 +186,7 @@ is required and the graph structure can be freed normally.
 
 Helper functions can be used to find a link between two given pads, or a pad
 connected to another pad through an enabled link
-(:c:func:`media_entity_find_link()`, :c:func:`media_pad_remote_pad_first()`n
+(:c:func:`media_entity_find_link()`, :c:func:`media_pad_remote_pad_first()`,
 :c:func:`media_entity_remote_source_pad_unique()` and
 :c:func:`media_pad_remote_pad_unique()`).
 

base-commit: 8bd1dbf8d580c425605fb8936309a4e9745a7a95
-- 
Regards,

Laurent Pinchart

