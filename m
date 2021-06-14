Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 19B263A64EC
	for <lists+linux-media@lfdr.de>; Mon, 14 Jun 2021 13:30:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235111AbhFNLaz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Jun 2021 07:30:55 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:58154 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235231AbhFNL2H (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Jun 2021 07:28:07 -0400
Received: from deskari.lan (91-158-153-130.elisa-laajakaista.fi [91.158.153.130])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8CDEF150A;
        Mon, 14 Jun 2021 13:24:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1623669842;
        bh=GTVfutGOn0CWpvdxcdPKsP7IHOYIcKIoZnneIodE97I=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=uUbOCj5YEhWIaXcTsA8Je1WYwIyVtomnYNXjLz7rB1AMdVEeDhAh05FZAVd/qpn87
         a30tYoixRxfvXRJ7UjeX0d3GPRnQxuh7XfikuLXL+5YozB6QpK2dIYwsrmXnxOyLWu
         KGQK0aIOIwpWZlhXuOnkTUs2aydjp9sOgwsf44o8=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     linux-media@vger.kernel.org, Lokesh Vutla <lokeshvutla@ti.com>,
        Pratyush Yadav <p.yadav@ti.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v4 03/35] media: ti-vpe: cal: remove unused cal_camerarx->dev field
Date:   Mon, 14 Jun 2021 14:23:13 +0300
Message-Id: <20210614112345.2032435-4-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210614112345.2032435-1-tomi.valkeinen@ideasonboard.com>
References: <20210614112345.2032435-1-tomi.valkeinen@ideasonboard.com>
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

