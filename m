Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6CF6336585C
	for <lists+linux-media@lfdr.de>; Tue, 20 Apr 2021 14:05:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232059AbhDTMFq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 20 Apr 2021 08:05:46 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:57972 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230118AbhDTMFp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 20 Apr 2021 08:05:45 -0400
Received: from deskari.lan (91-157-208-71.elisa-laajakaista.fi [91.157.208.71])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id CCB791051;
        Tue, 20 Apr 2021 14:05:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1618920313;
        bh=GTVfutGOn0CWpvdxcdPKsP7IHOYIcKIoZnneIodE97I=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=efhbuTto0hw0ebl7WCO/IB19GtHcch7sLJFzgNhZGHImLgwqaF+oeOwzm3tRy2SXg
         D2XEmoQ44FTDEl07N8iMGx+PStlWUc7UfyPNgxbm0naBm3Yte3bpwc+ckDR8+UZ3Qu
         2TnmMzOIZ25OFSeCmUejshYi+X5woqmgNUR3nkdk=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     Benoit Parrot <bparrot@ti.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Pratyush Yadav <p.yadav@ti.com>,
        Lokesh Vutla <lokeshvutla@ti.com>, linux-media@vger.kernel.org
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v2 03/35] media: ti-vpe: cal: remove unused cal_camerarx->dev field
Date:   Tue, 20 Apr 2021 15:04:01 +0300
Message-Id: <20210420120433.902394-4-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210420120433.902394-1-tomi.valkeinen@ideasonboard.com>
References: <20210420120433.902394-1-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

cal_camerarx->dev field is not used, remove it.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/platform/ti-vpe/cal.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/platform/ti-vpe/cal.h b/drivers/media/platform/ti-vpe/cal.h
index db0e408eaa94..e079c6a9f93f 100644
--- a/drivers/media/platform/ti-vpe/cal.h
+++ b/drivers/media/platform/ti-vpe/cal.h
@@ -149,7 +149,6 @@ struct cal_data {
 struct cal_camerarx {
 	void __iomem		*base;
 	struct resource		*res;
-	struct device		*dev;
 	struct regmap_field	*fields[F_MAX_FIELDS];
 
 	struct cal_dev		*cal;
-- 
2.25.1

