Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 710BF1F8BB8
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2020 02:01:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728234AbgFOABn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 14 Jun 2020 20:01:43 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:33340 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728227AbgFOABm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 14 Jun 2020 20:01:42 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4193B2165;
        Mon, 15 Jun 2020 02:00:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1592179248;
        bh=xb/ImsPVABx3c9zOiAlNpJe6yANi0bWryIgKlf3pXH8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ckajl/2Mpbs13hjAgYEDI2s+Sw8hLNA79yyhCysJIwudzEa4MkKNKMLarSHLdNLQD
         d53KP3jQIBVvScQiUJWyzGhKYm6Zwx6fEzm6FCL1xhlzh/vAsKfVOYf7HhsFDzlUux
         MRhY7YDH+JXieV4dltn4nbIXHHgQHbbqYSr8g7Mk=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Benoit Parrot <bparrot@ti.com>
Subject: [PATCH v1 080/107] media: ti-vpe: cal: Use 'unsigned int' type instead of 'unsigned'
Date:   Mon, 15 Jun 2020 02:59:17 +0300
Message-Id: <20200614235944.17716-81-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200614235944.17716-1-laurent.pinchart@ideasonboard.com>
References: <20200614235944.17716-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Specifying 'int' explicitly is generally preferred in the kernel for
unsigned int types. Fix the only wrong occurrence.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/platform/ti-vpe/cal.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
index 38d2fc186ba7..b67e59a4eedd 100644
--- a/drivers/media/platform/ti-vpe/cal.c
+++ b/drivers/media/platform/ti-vpe/cal.c
@@ -1759,7 +1759,7 @@ static int cal_queue_setup(struct vb2_queue *vq,
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

