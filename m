Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F8963A6520
	for <lists+linux-media@lfdr.de>; Mon, 14 Jun 2021 13:35:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235650AbhFNLeA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Jun 2021 07:34:00 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:58154 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235696AbhFNLb5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Jun 2021 07:31:57 -0400
Received: from deskari.lan (91-158-153-130.elisa-laajakaista.fi [91.158.153.130])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id DF598355C;
        Mon, 14 Jun 2021 13:24:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1623669845;
        bh=aedTIyaGUAuS7YId45EgChcriinGbuRuRUTj0zoDUKw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=bv7M05kr4KDmZpxfsmp4IJBVlDAZ8NW+DGNKX7alSo9E8lM/7NPwaDQp7Mr1RZZxz
         FL56Z5FweN/JNwX5hAC1mwgaMR49idz6/3gDAtNPQZNO14zOa+9L3npeE+RaQcQ5+w
         liIJ9JyIa6mqnm5YTKMp4oG6MSGn+dsDHA8x5j+w=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     linux-media@vger.kernel.org, Lokesh Vutla <lokeshvutla@ti.com>,
        Pratyush Yadav <p.yadav@ti.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v4 08/35] media: ti-vpe: cal: change index and cport to u8
Date:   Mon, 14 Jun 2021 14:23:18 +0300
Message-Id: <20210614112345.2032435-9-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210614112345.2032435-1-tomi.valkeinen@ideasonboard.com>
References: <20210614112345.2032435-1-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

cal_ctx's index and cport fields are numbers less than 8. In the
following patches we will get a bunch of new fields, all of which are
similar small numbers, so lets change the type to u8.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
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

