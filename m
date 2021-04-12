Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C28D935C549
	for <lists+linux-media@lfdr.de>; Mon, 12 Apr 2021 13:35:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240527AbhDLLfi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Apr 2021 07:35:38 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:52612 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237993AbhDLLfi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Apr 2021 07:35:38 -0400
Received: from deskari.lan (91-157-208-71.elisa-laajakaista.fi [91.157.208.71])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6ADF6DBC;
        Mon, 12 Apr 2021 13:35:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1618227319;
        bh=ueWaY1lplgixWtanXqrjxeqnbkV3LvSiiW9KwPgy4Mw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=pq+jQtYMntorcVdazl7HvjAZMkbBgdEU+ENSN0tBABk4RqLZ3HZbLKqMCar2K1sYH
         RbcKfg2BmyITsg/1DWc6XIhDrLlBZni8QwMxALdfm9mUPtE4LmI7fRlXmNfOKwC6hA
         rkIJSy9+IodL0LZMolOxwv/51EF7Y6P2pOGsuBTA=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     Benoit Parrot <bparrot@ti.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Pratyush Yadav <p.yadav@ti.com>,
        Lokesh Vutla <lokeshvutla@ti.com>, linux-media@vger.kernel.org
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH 08/28] media: ti-vpe: cal: change index and cport to u8
Date:   Mon, 12 Apr 2021 14:34:37 +0300
Message-Id: <20210412113457.328012-9-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210412113457.328012-1-tomi.valkeinen@ideasonboard.com>
References: <20210412113457.328012-1-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

cal_ctx's index and cport fields are numbers less than 8. In the
following patches we will get a bunch of new fields, all of which are
similar small numbers, so lets change the type to u8.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/media/platform/ti-vpe/cal.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/ti-vpe/cal.h b/drivers/media/platform/ti-vpe/cal.h
index 09ad20faa9e1..251bb0ba7b3b 100644
--- a/drivers/media/platform/ti-vpe/cal.h
+++ b/drivers/media/platform/ti-vpe/cal.h
@@ -217,8 +217,8 @@ struct cal_ctx {
 
 	unsigned int		sequence;
 	struct vb2_queue	vb_vidq;
-	unsigned int		index;
-	unsigned int		cport;
+	u8			index;
+	u8			cport;
 };
 
 extern unsigned int cal_debug;
-- 
2.25.1

