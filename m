Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 171FD463665
	for <lists+linux-media@lfdr.de>; Tue, 30 Nov 2021 15:17:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242156AbhK3OUY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 30 Nov 2021 09:20:24 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:41006 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242051AbhK3OUH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 30 Nov 2021 09:20:07 -0500
Received: from deskari.lan (91-156-85-209.elisa-laajakaista.fi [91.156.85.209])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 12AAE14E2;
        Tue, 30 Nov 2021 15:16:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1638281806;
        bh=3+YgyXzsPP4KS4GsPgH+S1WSVb2QTLubXVGO6Cuekc0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=NAu//0FSCi6yr4qOcAy0ukdF+1FmnLF7fJbiapGLuya3HgFOPTF0nvKI4TvU4CB7+
         ULO7dQHDV+CkPKN+h8LTUAG7ojZ5Uf8fhP4xDcJ2U7djzOFuPWc4R7P/kAFi9N1Swt
         rGawmTmboh+MsQKSV/Cg5bQiSxode7Akk1aJ1QIA=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v10 17/38] media: entity: Skip link validation for pads to which there is no route
Date:   Tue, 30 Nov 2021 16:15:15 +0200
Message-Id: <20211130141536.891878-18-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211130141536.891878-1-tomi.valkeinen@ideasonboard.com>
References: <20211130141536.891878-1-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Sakari Ailus <sakari.ailus@linux.intel.com>

Links are validated along the pipeline which is about to start streaming.
Not all the pads in entities that are traversed along that pipeline are
part of the pipeline, however. Skip the link validation for such pads.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/mc/mc-entity.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
index 58cdc9c6b342..e963850b32df 100644
--- a/drivers/media/mc/mc-entity.c
+++ b/drivers/media/mc/mc-entity.c
@@ -489,6 +489,11 @@ __must_check int __media_pipeline_start(struct media_pad *pad,
 				link->sink->entity == entity ?
 				link->sink : link->source;
 
+			/* Ignore pads to which there is no route. */
+			if (!media_entity_has_route(entity, pad->index,
+						    other_pad->index))
+				continue;
+
 			/* Mark that a pad is connected by a link. */
 			bitmap_clear(has_no_links, other_pad->index, 1);
 
-- 
2.25.1

