Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1FA1F570300
	for <lists+linux-media@lfdr.de>; Mon, 11 Jul 2022 14:44:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231941AbiGKMn4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 11 Jul 2022 08:43:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231907AbiGKMnr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 11 Jul 2022 08:43:47 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9094A1169
        for <linux-media@vger.kernel.org>; Mon, 11 Jul 2022 05:43:43 -0700 (PDT)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7EBA887F;
        Mon, 11 Jul 2022 14:43:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1657543406;
        bh=7sbUkkye5+dYoWflQy1cdxxtC9s2TG0e40gp789YWv0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=OV/kOeTpx6t+7CtfjcErIff22f/jAu3dEZ63HDvHr/cYldOQ5HgHemzPERz7ZNesJ
         5aGPNUfVkpQezW1V/eOLFYgQpUc+Bbyr0oapEBBYLb/VFDypket+rN4Mq5oF9UEFHR
         HWoeMNQD9ujUcStxeVZa+NLOYGLt/5Csho/be05Y=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     linux-rockchip@lists.infradead.org,
        Dafna Hirschfeld <dafna@fastmail.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Helen Koike <helen.koike@collabora.com>,
        Paul Elder <paul.elder@ideasonboard.com>
Subject: [PATCH v3 12/46] media: rkisp1: cap: Print debug message on failed link validation
Date:   Mon, 11 Jul 2022 15:42:14 +0300
Message-Id: <20220711124248.2683-13-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220711124248.2683-1-laurent.pinchart@ideasonboard.com>
References: <20220711124248.2683-1-laurent.pinchart@ideasonboard.com>
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

When a link validation failure occurs, print a debug message to help
diagnosing the cause.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Paul Elder <paul.elder@ideasonboard.com>
Reviewed-by: Dafna Hirschfeld <dafna@fastmail.com>
---
Changes since v1:

- Add missing \n
---
 .../media/platform/rockchip/rkisp1/rkisp1-capture.c    | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
index 94819e6c23e2..fb14c8aa154c 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
@@ -1294,8 +1294,16 @@ static int rkisp1_capture_link_validate(struct media_link *link)
 
 	if (sd_fmt.format.height != cap->pix.fmt.height ||
 	    sd_fmt.format.width != cap->pix.fmt.width ||
-	    sd_fmt.format.code != fmt->mbus)
+	    sd_fmt.format.code != fmt->mbus) {
+		dev_dbg(cap->rkisp1->dev,
+			"link '%s':%u -> '%s':%u not valid: 0x%04x/%ux%u != 0x%04x/%ux%u\n",
+			link->source->entity->name, link->source->index,
+			link->sink->entity->name, link->sink->index,
+			sd_fmt.format.code, sd_fmt.format.width,
+			sd_fmt.format.height, fmt->mbus, cap->pix.fmt.width,
+			cap->pix.fmt.height);
 		return -EPIPE;
+	}
 
 	return 0;
 }
-- 
Regards,

Laurent Pinchart

