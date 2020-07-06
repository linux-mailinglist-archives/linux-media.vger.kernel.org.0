Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1022C215E77
	for <lists+linux-media@lfdr.de>; Mon,  6 Jul 2020 20:38:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729857AbgGFShi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Jul 2020 14:37:38 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:45198 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729599AbgGFShf (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Jul 2020 14:37:35 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id DD06F1942;
        Mon,  6 Jul 2020 20:37:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1594060651;
        bh=WkhsRClnatKxgddnJ6HOKKArxl2llLqIcmosbw/fSjs=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=M7c49UmtsJOuXhk+iicT4RvAD3gVopjYaLQwH0zUbafqBDsoe44NFovMjHWLBmV5S
         Y2ihRBj6jhKL3tnm+W6ok1hiwasuWu76+MJprS4TicY8vpFfns14j221NiXa4dA496
         Cgl7CsBly+evkV5FnjNIZFdJ9R2ShfxnfrzNk8vs=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Benoit Parrot <bparrot@ti.com>
Subject: [PATCH v2 007/108] media: ti-vpe: cal: Inline CAL_VERSION macro in its only user
Date:   Mon,  6 Jul 2020 21:35:28 +0300
Message-Id: <20200706183709.12238-8-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200706183709.12238-1-laurent.pinchart@ideasonboard.com>
References: <20200706183709.12238-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The CAL_VERSION macro is used once only, in MODULE_VERSION(). This
doesn't improve readability, inline it.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
Reviewed-by: Benoit Parrot <bparrot@ti.com>
---
 drivers/media/platform/ti-vpe/cal.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
index 2aa28af7cad3..9b5ad48538c1 100644
--- a/drivers/media/platform/ti-vpe/cal.c
+++ b/drivers/media/platform/ti-vpe/cal.c
@@ -39,12 +39,10 @@
 #define MAX_WIDTH_BYTES (8192 * 8)
 #define MAX_HEIGHT_LINES 16383
 
-#define CAL_VERSION "0.1.0"
-
 MODULE_DESCRIPTION("TI CAL driver");
 MODULE_AUTHOR("Benoit Parrot, <bparrot@ti.com>");
 MODULE_LICENSE("GPL v2");
-MODULE_VERSION(CAL_VERSION);
+MODULE_VERSION("0.1.0");
 
 static unsigned video_nr = -1;
 module_param(video_nr, uint, 0644);
-- 
Regards,

Laurent Pinchart

