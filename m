Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3459F4D98A4
	for <lists+linux-media@lfdr.de>; Tue, 15 Mar 2022 11:23:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346993AbiCOKYY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Mar 2022 06:24:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346998AbiCOKYX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Mar 2022 06:24:23 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F8691EAF8
        for <linux-media@vger.kernel.org>; Tue, 15 Mar 2022 03:23:11 -0700 (PDT)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id BC1891AD5;
        Tue, 15 Mar 2022 11:23:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1647339790;
        bh=SJR9G224zdIovlbwz8SltNum63K2QIVqUEJpVN5SXWA=;
        h=From:To:Cc:Subject:Date:From;
        b=MNRmSBipZ4UCwiZFf2ZbEXUM+UWNCBrNPB2uPNaZNNxNY0X5KBDA7rHmkeWNCYUNK
         IefyTPC9SKMIRr9lUuIko+S8y+Mx25GsJaSjEfwI5WXyD0phL41BJSjMjQmr/3HPSk
         Sx+ttxKBZq9FRYxOut1IEnbvpWb7S2JUZYKcoUUw=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH] media: v4l2: mem2mem: Fix typos in v4l2_m2m_dev documentation
Date:   Tue, 15 Mar 2022 12:22:45 +0200
Message-Id: <20220315102245.15031-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The v4l2_m2m_dev structure documentation incorrectly references the
v4l2_m2m_unregister_media_controller() function when it actually means
v4l2_m2m_register_media_controller(). Fix it.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/v4l2-core/v4l2-mem2mem.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-mem2mem.c b/drivers/media/v4l2-core/v4l2-mem2mem.c
index e2654b422334..ed1280adf7ff 100644
--- a/drivers/media/v4l2-core/v4l2-mem2mem.c
+++ b/drivers/media/v4l2-core/v4l2-mem2mem.c
@@ -68,16 +68,16 @@ static const char * const m2m_entity_name[] = {
  * struct v4l2_m2m_dev - per-device context
  * @source:		&struct media_entity pointer with the source entity
  *			Used only when the M2M device is registered via
- *			v4l2_m2m_unregister_media_controller().
+ *			v4l2_m2m_register_media_controller().
  * @source_pad:		&struct media_pad with the source pad.
  *			Used only when the M2M device is registered via
- *			v4l2_m2m_unregister_media_controller().
+ *			v4l2_m2m_register_media_controller().
  * @sink:		&struct media_entity pointer with the sink entity
  *			Used only when the M2M device is registered via
- *			v4l2_m2m_unregister_media_controller().
+ *			v4l2_m2m_register_media_controller().
  * @sink_pad:		&struct media_pad with the sink pad.
  *			Used only when the M2M device is registered via
- *			v4l2_m2m_unregister_media_controller().
+ *			v4l2_m2m_register_media_controller().
  * @proc:		&struct media_entity pointer with the M2M device itself.
  * @proc_pads:		&struct media_pad with the @proc pads.
  *			Used only when the M2M device is registered via
-- 
Regards,

Laurent Pinchart

