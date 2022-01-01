Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 871A348282E
	for <lists+linux-media@lfdr.de>; Sat,  1 Jan 2022 19:28:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232661AbiAAS2U (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 1 Jan 2022 13:28:20 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:41358 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232656AbiAAS2T (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 1 Jan 2022 13:28:19 -0500
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4CA911C1C;
        Sat,  1 Jan 2022 19:28:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1641061697;
        bh=NzGbThJbHkTNGb9Y2RvNhqGx9XtHQ2R8epxt9n2Crvs=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=oOFk0/XjblFZivuHYLiJarWeR6LaItasEz79EgpuFsWaO6RGwxw6himFuA41DXpls
         QbI0i2VQclLX1ZHm0GhMWMkW00rUQG2U1DuibeP6opLDQQwvtJklYkyANWR9tJ0lDy
         5ifOyfiphUJEKtebT3IbjOnnljdeOmQA/IM5Gpko=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Jacopo Mondi <jacopo@jmondi.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Thomas Nizan <tnizan@witekio.com>
Subject: [PATCH v2 06/11] media: i2c: max9286: Rename MAX9286_DATATYPE_RAW11 to RAW12
Date:   Sat,  1 Jan 2022 20:28:01 +0200
Message-Id: <20220101182806.19311-7-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220101182806.19311-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20220101182806.19311-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The MAX9286_DATATYPE_RAW11 value is used to configure the MAX9286 for
11-bit or 12-bit input data. While 11-bit data is supported on the GMSL
side, CSI-2 doesn't have a RAW11 format. 11-bit data is transferred over
CSI-2 as RAW12. Rename the macro accordingly to avoid confusion.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/media/i2c/max9286.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
index 75374034724f..576d9c6fac14 100644
--- a/drivers/media/i2c/max9286.c
+++ b/drivers/media/i2c/max9286.c
@@ -71,7 +71,7 @@
 #define MAX9286_DATATYPE_USER_YUV_12BIT	(10 << 0)
 #define MAX9286_DATATYPE_USER_24BIT	(9 << 0)
 #define MAX9286_DATATYPE_RAW14		(8 << 0)
-#define MAX9286_DATATYPE_RAW11		(7 << 0)
+#define MAX9286_DATATYPE_RAW12		(7 << 0)
 #define MAX9286_DATATYPE_RAW10		(6 << 0)
 #define MAX9286_DATATYPE_RAW8		(5 << 0)
 #define MAX9286_DATATYPE_YUV422_10BIT	(4 << 0)
-- 
Regards,

Laurent Pinchart

