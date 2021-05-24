Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 913E038E4E0
	for <lists+linux-media@lfdr.de>; Mon, 24 May 2021 13:09:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232661AbhEXLKu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 24 May 2021 07:10:50 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:33754 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232591AbhEXLKs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 24 May 2021 07:10:48 -0400
Received: from deskari.lan (91-157-208-71.elisa-laajakaista.fi [91.157.208.71])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 43CA1182C;
        Mon, 24 May 2021 13:09:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1621854557;
        bh=GTVfutGOn0CWpvdxcdPKsP7IHOYIcKIoZnneIodE97I=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=BSolgkA3GifNsT/H19OhVI9rUDHFhLcbSPMCcB9cjQjKqiqwHog7md0VqSzdlhAzO
         ACwY0IOw6XdFNcE5UpsLF19kj/MCFdHcQKob/WaY6NnInTCGT9L2vS1fLjU04tEx9r
         iQWcEmIxH9JdaJG91lJx8JUQ+qjy/PW0ZdLdp3iQ=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Pratyush Yadav <p.yadav@ti.com>,
        Lokesh Vutla <lokeshvutla@ti.com>, linux-media@vger.kernel.org
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v3 03/38] media: ti-vpe: cal: remove unused cal_camerarx->dev field
Date:   Mon, 24 May 2021 14:08:34 +0300
Message-Id: <20210524110909.672432-4-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210524110909.672432-1-tomi.valkeinen@ideasonboard.com>
References: <20210524110909.672432-1-tomi.valkeinen@ideasonboard.com>
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

