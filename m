Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8B3BF478CB3
	for <lists+linux-media@lfdr.de>; Fri, 17 Dec 2021 14:50:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236823AbhLQNur (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 17 Dec 2021 08:50:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236820AbhLQNuq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 17 Dec 2021 08:50:46 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58A24C06173E
        for <linux-media@vger.kernel.org>; Fri, 17 Dec 2021 05:50:46 -0800 (PST)
Received: from deskari.lan (91-156-85-209.elisa-laajakaista.fi [91.156.85.209])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7B83992A;
        Fri, 17 Dec 2021 14:50:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1639749044;
        bh=qgXKv0tgxm9rNtNKIPgpdmZ9KhbcEFyaqyOsmesJams=;
        h=From:To:Cc:Subject:Date:From;
        b=hn4p42Fn6hDhEfr9tjZWjmEHeMOJ3KWeb6/bNf+9e5sMiPwRju+/n5QmHbQzyQEdL
         OkVigRThT1WRFBWE+jGcwlti1+WfQYwlik4KkqYoNJjm0fFbXg9blscYikDUg1+rgm
         xZlc8IAaCYB6Al7T77uKjlak0O6VpZebHBTqwz+0=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v2 0/6] v4l: subdev active state
Date:   Fri, 17 Dec 2021 15:50:16 +0200
Message-Id: <20211217135022.364954-1-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

v2 of the subdev active state series. I've fixed this according to
comments from Hans and Jacopo:

- doc improvements
- drop extra #include
- use active_state in two places instead of state
- improve the notice in v4l2_subdev_lock_and_return_state()

 Tomi

Tomi Valkeinen (6):
  media: subdev: rename subdev-state alloc & free
  media: subdev: add active state to struct v4l2_subdev
  media: subdev: pass also the active state to subdevs from ioctls
  media: subdev: add subdev state locking
  media: subdev: Add v4l2_subdev_lock_and_return_state()
  media: Documentation: add documentation about subdev state

 .../driver-api/media/v4l2-subdev.rst          |  57 +++++++
 drivers/media/platform/rcar-vin/rcar-v4l2.c   |   9 +-
 drivers/media/platform/vsp1/vsp1_entity.c     |  10 +-
 drivers/media/v4l2-core/v4l2-subdev.c         | 125 +++++++++++++--
 drivers/staging/media/tegra-video/vi.c        |  10 +-
 include/media/v4l2-subdev.h                   | 150 +++++++++++++++++-
 6 files changed, 334 insertions(+), 27 deletions(-)

-- 
2.25.1

