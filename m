Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 42872363777
	for <lists+linux-media@lfdr.de>; Sun, 18 Apr 2021 22:14:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232437AbhDRUOs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 18 Apr 2021 16:14:48 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:34744 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229488AbhDRUOs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 18 Apr 2021 16:14:48 -0400
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id DA8B84AB;
        Sun, 18 Apr 2021 22:14:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1618776854;
        bh=VIMjVGJhamyFxPoGSvoXa+NX6l5sD+DSpYYxK8gvEjQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=gyXoBEwG2fTNnmYce0cXK0d3JNiafcu5cS29sQlADkhyMAyBtSkiplL6Qe/H3euBJ
         g69TRrN0gtfH721Sk/JKNxOFQAA3k9THfEz1fonkXzpuLxiLU7vePPGoMB4TfomOT/
         wV9EWcLnFQKWktxuqbij8KNVk6GByvUA3lsEXPjk=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>, kernel@pengutronix.de,
        Fabio Estevam <festevam@gmail.com>, linux-imx@nxp.com,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH 24/23] media: imx: imx7_mipi_csis: Update MAINTAINERS
Date:   Sun, 18 Apr 2021 23:14:06 +0300
Message-Id: <20210418201406.11631-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.28.1
In-Reply-To: <20210413023014.28797-1-laurent.pinchart@ideasonboard.com>
References: <20210413023014.28797-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Given my recent contributions to the imx7-mipi-csis driver, I can as
well be listed as a maintainer.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index cb727179826b..2f498269c2ec 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11029,6 +11029,7 @@ F:	include/media/imx.h
 
 MEDIA DRIVERS FOR FREESCALE IMX7
 M:	Rui Miguel Silva <rmfrfs@gmail.com>
+M:	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 T:	git git://linuxtv.org/media_tree.git
-- 
Regards,

Laurent Pinchart

