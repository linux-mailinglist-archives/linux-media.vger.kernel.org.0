Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A3023365864
	for <lists+linux-media@lfdr.de>; Tue, 20 Apr 2021 14:06:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232091AbhDTMFv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 20 Apr 2021 08:05:51 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:57972 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232066AbhDTMFs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 20 Apr 2021 08:05:48 -0400
Received: from deskari.lan (91-157-208-71.elisa-laajakaista.fi [91.157.208.71])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6CAB21221;
        Tue, 20 Apr 2021 14:05:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1618920316;
        bh=aedTIyaGUAuS7YId45EgChcriinGbuRuRUTj0zoDUKw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=cKtQgvkwd/764nUtj/lqlT//a6U5dmYH98gEYcVS1u2AGRx1BQ3S2ST3g/AOGa3WF
         4vB5s3PC1JuT6wJB18iuEDWHdM9btlqTTPqFyNJEbYWvWCFBYsYRmkWXWPPSumuAHT
         HiTxvqVCoI6zC9tpN8YPVtdorzQF4vlvo/NAhNMg=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     Benoit Parrot <bparrot@ti.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Pratyush Yadav <p.yadav@ti.com>,
        Lokesh Vutla <lokeshvutla@ti.com>, linux-media@vger.kernel.org
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v2 08/35] media: ti-vpe: cal: change index and cport to u8
Date:   Tue, 20 Apr 2021 15:04:06 +0300
Message-Id: <20210420120433.902394-9-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210420120433.902394-1-tomi.valkeinen@ideasonboard.com>
References: <20210420120433.902394-1-tomi.valkeinen@ideasonboard.com>
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

