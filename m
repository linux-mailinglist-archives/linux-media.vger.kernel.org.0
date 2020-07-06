Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A2F9215EC1
	for <lists+linux-media@lfdr.de>; Mon,  6 Jul 2020 20:38:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729767AbgGFSis (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Jul 2020 14:38:48 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:45202 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729997AbgGFSir (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Jul 2020 14:38:47 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C956F257F;
        Mon,  6 Jul 2020 20:38:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1594060699;
        bh=Y2ZDov/UpaQSZqj/SMak7pppo5bvPrYiYI9C3Bb1ZQA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=aUKgfBvHlGbApiyjMw5gccD6EKlwn/AqcV5JjMv0UpVytgEKm5WtGh6JKwNktgQ2r
         ccXpn2xGXuFXMrrTao/nSrxP7/kkXQxHv6/tcfJfKmiqsVJWjRE09sHVN2KYuaWeep
         MAC7Wnyf8dWZlkwrZ8dm2Xct5uohrFG++SW915Ec=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Benoit Parrot <bparrot@ti.com>
Subject: [PATCH v2 081/108] media: ti-vpe: cal: Use 'unsigned int' type instead of 'unsigned'
Date:   Mon,  6 Jul 2020 21:36:42 +0300
Message-Id: <20200706183709.12238-82-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200706183709.12238-1-laurent.pinchart@ideasonboard.com>
References: <20200706183709.12238-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Specifying 'int' explicitly is generally preferred in the kernel for
unsigned int types. Fix the only wrong occurrence.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Benoit Parrot <bparrot@ti.com>
---
 drivers/media/platform/ti-vpe/cal.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
index ade76739de47..fdb40c85de9b 100644
--- a/drivers/media/platform/ti-vpe/cal.c
+++ b/drivers/media/platform/ti-vpe/cal.c
@@ -1776,7 +1776,7 @@ static int cal_queue_setup(struct vb2_queue *vq,
 			   unsigned int sizes[], struct device *alloc_devs[])
 {
 	struct cal_ctx *ctx = vb2_get_drv_priv(vq);
-	unsigned size = ctx->v_fmt.fmt.pix.sizeimage;
+	unsigned int size = ctx->v_fmt.fmt.pix.sizeimage;
 
 	if (vq->num_buffers + *nbuffers < 3)
 		*nbuffers = 3 - vq->num_buffers;
-- 
Regards,

Laurent Pinchart

