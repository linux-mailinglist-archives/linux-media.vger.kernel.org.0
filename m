Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BFA5B48DA53
	for <lists+linux-media@lfdr.de>; Thu, 13 Jan 2022 16:01:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235907AbiAMPA7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 13 Jan 2022 10:00:59 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:42086 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233641AbiAMPA7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 13 Jan 2022 10:00:59 -0500
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6BDA497;
        Thu, 13 Jan 2022 16:00:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1642086057;
        bh=qWPVGJ5W1NvYRzHLPuu5I6zcACVC1HPzt4VgbkN/tJg=;
        h=From:To:Cc:Subject:Date:From;
        b=AmRMw9PFV+jiZHFZsozGHEVl33Q/YTo3qKE8n+SQit8I0W/5fXOCtnBiGodXaVY9+
         R14XgCl0bHqyHASkkeILc9Qxq9neOH/KdVWDdEFHQfnI646tLV8EXWL2kg48Dvvcpp
         D70hY08pS2djiUQESgdgD0NCZF9zUv0gcvzVTB/0=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Sakari Ailus <sakari.ailus@iki.fi>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Jacopo Mondi <jacopo@jmondi.org>
Subject: [PATCH 0/2] media: mc: Simplify media pipeline start/stop
Date:   Thu, 13 Jan 2022 17:00:40 +0200
Message-Id: <20220113150042.15630-1-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

This small series simplifies the implementation of the
media_pipeline_start() function (and to a lesser extend, the
media_pipeline_stop() function as well) by avoiding unnecessary graph
walks.

Patch 1/2 adds a small inline helper function to avoid direct access to
the media_entity.stream_count field in drivers, making it easier in
patch 2/2 to rework the implementation (dropping the stream_count field)
without disturbing drivers. Please see patch 2/2 for a detailed
explanation of the simplification.

Laurent Pinchart (2):
  media: media-entity: Add media_pad_is_streaming() helper function
  media: media-entity: Simplify media_pipeline_start()

 drivers/media/mc/mc-entity.c                  | 55 ++++++++-----------
 drivers/media/platform/exynos4-is/common.c    |  5 +-
 drivers/media/platform/exynos4-is/fimc-isp.c  |  2 +-
 drivers/media/platform/exynos4-is/fimc-lite.c |  6 +-
 drivers/media/platform/rcar-vin/rcar-core.c   |  2 +-
 include/media/media-entity.h                  | 21 +++++--
 6 files changed, 48 insertions(+), 43 deletions(-)


base-commit: 68b9bcc8a534cd11fe55f8bc82f948aae7d81b3c
-- 
Regards,

Laurent Pinchart

