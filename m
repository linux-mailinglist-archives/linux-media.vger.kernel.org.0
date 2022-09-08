Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 55C8B5B28A3
	for <lists+linux-media@lfdr.de>; Thu,  8 Sep 2022 23:40:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229607AbiIHVk3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 8 Sep 2022 17:40:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229536AbiIHVk2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 8 Sep 2022 17:40:28 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5D3D98773
        for <linux-media@vger.kernel.org>; Thu,  8 Sep 2022 14:40:27 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B2AD48F1;
        Thu,  8 Sep 2022 23:40:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1662673225;
        bh=0ezqjiKplJnq9ssCIWTf+issj/Op2EEgQomQcr+YN3U=;
        h=From:To:Cc:Subject:Date:From;
        b=CztEEFjVzagHOCvP+LbCVPTQq9T1FZ4AHcVg45D38ZF1j8ngs18s2hWTG3ZeC+uVw
         VodcwLTIDT9gDw8JuCcIcyne1d/YMlU5AjIi2DVuLWlnJGKX21Bbk3vCx6DnsPoNyn
         zthZ+5cf8xw4CWmiJdt5S1qDTHKKT4vde/xn2sUI=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@iki.fi>
Subject: [PATCH] media: Fix documentation typos in media-entity.h
Date:   Fri,  9 Sep 2022 00:40:09 +0300
Message-Id: <20220908214009.26222-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.35.1
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

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
A few small fixes for issues noticed while reviewing v14 of the streams
series. I didn't want to comment on this in a review as a pull request
for the corresponding patches has already been sent. The s/inside/of/ is
arguably not a typo, I can drop that part if anyone disagrees.
---
 include/media/media-entity.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/media/media-entity.h b/include/media/media-entity.h
index 28c9de8a1f34..85ed08ddee9d 100644
--- a/include/media/media-entity.h
+++ b/include/media/media-entity.h
@@ -237,7 +237,7 @@ struct media_pad {
  * @link_validate:	Return whether a link is valid from the entity point of
  *			view. The media_pipeline_start() function
  *			validates all links by calling this operation. Optional.
- * @has_pad_interdep:	Return whether a two pads inside the entity are
+ * @has_pad_interdep:	Return whether two pads of the entity are
  *			interdependent. If two pads are interdependent they are
  *			part of the same pipeline and enabling one of the pads
  *			means that the other pad will become "locked" and
@@ -1144,7 +1144,7 @@ __must_check int __media_pipeline_start(struct media_pad *pad,
  * media_pipeline_stop - Mark a pipeline as not streaming
  * @pad: Starting pad
  *
- * Mark all pads connected to a given pads through enabled links, either
+ * Mark all pads connected to a given pad through enabled links, either
  * directly or indirectly, as not streaming. The media_pad pipe field is
  * reset to %NULL.
  *
-- 
Regards,

Laurent Pinchart

