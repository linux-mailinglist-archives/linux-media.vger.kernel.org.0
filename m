Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 270713A28B1
	for <lists+linux-media@lfdr.de>; Thu, 10 Jun 2021 11:49:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230179AbhFJJvR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Jun 2021 05:51:17 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:39500 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230154AbhFJJvR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Jun 2021 05:51:17 -0400
Received: from deskari.lan (91-158-153-130.elisa-laajakaista.fi [91.158.153.130])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E66F9E79;
        Thu, 10 Jun 2021 11:49:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1623318559;
        bh=JmkNuAe5ML2lMe34RQEml2s5kqGf2owY6qBIt51SW7g=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=anuHefaDq0F4BVmrp5OmDbEkrRFi/eyudaNB+OjkQBBjWCL3sUYJ+ccWocBbKCadq
         58jZ4QK8AxHLM6ipW0J3aeFIk4Ei/chej2VgXHk+JyioAAVuAFVeBQaIsUAHSI1iGe
         cHesVSPMehCYK6YKpLe1B97diFFd75w4cicFUzBw=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v3 4/5] media: v4l2-subdev: v4l2_subdev_free_state() to accept a NULL state
Date:   Thu, 10 Jun 2021 12:49:02 +0300
Message-Id: <20210610094903.343183-3-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210610094903.343183-1-tomi.valkeinen@ideasonboard.com>
References: <20210609100228.278798-1-tomi.valkeinen@ideasonboard.com>
 <20210610094903.343183-1-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Make v4l2_subdev_free_state() accept a NULL state.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/media/v4l2-core/v4l2-subdev.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index dacae53b68d5..25c80d6de23b 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -931,7 +931,8 @@ EXPORT_SYMBOL_GPL(v4l2_subdev_alloc_state);
 
 void v4l2_subdev_free_state(struct v4l2_subdev_state *state)
 {
-	kvfree(state->pads);
+	if (state)
+		kvfree(state->pads);
 	kfree(state);
 }
 EXPORT_SYMBOL_GPL(v4l2_subdev_free_state);
-- 
2.25.1

