Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 69D7938E458
	for <lists+linux-media@lfdr.de>; Mon, 24 May 2021 12:44:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232677AbhEXKqL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 24 May 2021 06:46:11 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:60914 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232672AbhEXKqE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 24 May 2021 06:46:04 -0400
Received: from deskari.lan (91-157-208-71.elisa-laajakaista.fi [91.157.208.71])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 404971C41;
        Mon, 24 May 2021 12:44:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1621853076;
        bh=xFfj10WdiD53chHxuqJtN59Ld/FMrT2Nhb/E1Uos194=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=QJs39DN0rgMGLbniwuVWM1U1eViGVovh9NsTVvYQqtzshl0300CDplbd6hv1Uq62H
         sRHE2m+9Q8dGak45rW1Tcn2t16eg2fmvKm84vmYyraIVMF8Y69CooUhzAr2y3y/e1l
         yjEnbi/ORqiVyFDnxsV0im1rx1e1B4k+z4MgFv9o=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Pratyush Yadav <p.yadav@ti.com>,
        Lokesh Vutla <lokeshvutla@ti.com>
Subject: [PATCH v7 11/27] media: entity: Skip link validation for pads to which there is no route
Date:   Mon, 24 May 2021 13:43:52 +0300
Message-Id: <20210524104408.599645-12-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210524104408.599645-1-tomi.valkeinen@ideasonboard.com>
References: <20210524104408.599645-1-tomi.valkeinen@ideasonboard.com>
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
index 6a270eeae280..2ff0ae4c13c1 100644
--- a/drivers/media/mc/mc-entity.c
+++ b/drivers/media/mc/mc-entity.c
@@ -487,6 +487,11 @@ __must_check int __media_pipeline_start(struct media_pad *pad,
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

