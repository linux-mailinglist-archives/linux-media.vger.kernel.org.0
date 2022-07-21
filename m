Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3D3D157C4C7
	for <lists+linux-media@lfdr.de>; Thu, 21 Jul 2022 08:57:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231286AbiGUG5P (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 21 Jul 2022 02:57:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231726AbiGUG5O (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 21 Jul 2022 02:57:14 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91CB0785BE
        for <linux-media@vger.kernel.org>; Wed, 20 Jul 2022 23:57:13 -0700 (PDT)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E22DA496;
        Thu, 21 Jul 2022 08:57:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1658386631;
        bh=rre2EFq+a/iXK3MjyFHjjC/DQtSAI9OIMUGABD57OFU=;
        h=From:To:Cc:Subject:Date:From;
        b=GjOdOCC8014vLsl5mAO/xKH6ZT9uouhMFsWFUyIsLv/WIhzr47PVy7tmE5DAD9hmk
         HJC78pZYyNmBJPCE/6uynL0+FFC+KoK3f5mIrF44+Qnv2TH+HCeuOksZSfC/5eFZFJ
         +Yy1/x/5Uz4kdrma8ZqI45EWWf5X9JtxpC14mimY=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Dafna Hirschfeld <dafna@fastmail.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Paul Elder <paul.elder@ideasonboard.com>,
        linux-rockchip@lists.infradead.org
Subject: [PATCH] media: rkisp1: Make local immutable array variables static const
Date:   Thu, 21 Jul 2022 09:57:06 +0300
Message-Id: <20220721065706.31710-1-laurent.pinchart@ideasonboard.com>
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

The max_widths and max_heights variables in rkisp1_try_fmt() are
immutable and don't need to be allocated on the stack every time the
function is called. Make them static.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 .../media/platform/rockchip/rkisp1/rkisp1-capture.c  | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
index ef3c9389d684..81177ad08cf0 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
@@ -1162,13 +1162,17 @@ static void rkisp1_try_fmt(const struct rkisp1_capture *cap,
 			   const struct rkisp1_capture_fmt_cfg **fmt_cfg,
 			   const struct v4l2_format_info **fmt_info)
 {
+	static const unsigned int max_widths[] = {
+		RKISP1_RSZ_MP_SRC_MAX_WIDTH,
+		RKISP1_RSZ_SP_SRC_MAX_WIDTH,
+	};
+	static const unsigned int max_heights[] = {
+		RKISP1_RSZ_MP_SRC_MAX_HEIGHT,
+		RKISP1_RSZ_SP_SRC_MAX_HEIGHT,
+	};
 	const struct rkisp1_capture_config *config = cap->config;
 	const struct rkisp1_capture_fmt_cfg *fmt;
 	const struct v4l2_format_info *info;
-	const unsigned int max_widths[] = { RKISP1_RSZ_MP_SRC_MAX_WIDTH,
-					    RKISP1_RSZ_SP_SRC_MAX_WIDTH };
-	const unsigned int max_heights[] = { RKISP1_RSZ_MP_SRC_MAX_HEIGHT,
-					     RKISP1_RSZ_SP_SRC_MAX_HEIGHT};
 
 	fmt = rkisp1_find_fmt_cfg(cap, pixm->pixelformat);
 	if (!fmt) {
-- 
Regards,

Laurent Pinchart

