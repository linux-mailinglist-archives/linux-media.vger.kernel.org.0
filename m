Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E20C4789AD
	for <lists+linux-media@lfdr.de>; Fri, 17 Dec 2021 12:19:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235179AbhLQLTC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 17 Dec 2021 06:19:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233444AbhLQLTC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 17 Dec 2021 06:19:02 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05C43C061574
        for <linux-media@vger.kernel.org>; Fri, 17 Dec 2021 03:19:01 -0800 (PST)
Received: from deskari.lan (91-156-85-209.elisa-laajakaista.fi [91.156.85.209])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B7D0F92A;
        Fri, 17 Dec 2021 12:18:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1639739939;
        bh=7EVn4FVxty9WZxGSwpH+0gxbOL33K0P0aVsxbnb2r+E=;
        h=From:To:Cc:Subject:Date:From;
        b=tjS594DQWj1tTa0ao5e5OYzYhIcW1HFC5kKl+zQcw4SmtmTL0p5BS060ZBDPZuJXL
         lGgoCHNiRMQF/UVZg4yzKhHJ8Ix7ZwVu0M9HxB1lq68tCrdMuPGt3/b48/8DAs5aX0
         0jwOm+YCeORYdhDD/jttW/M9esXEhLHme4bJYtDQ=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH 0/6] v4l: subdev active state
Date:   Fri, 17 Dec 2021 13:18:30 +0200
Message-Id: <20211217111836.225013-1-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

These are the first 6 patches from the "[PATCH v10 00/38] v4l: subdev
internal routing and streams" series. I'm posting these as a separate
series, as the active state patches are a separate topic from the
multiplexed streams.

There are changes in these patches compared to the v10 series in the
docs and comments. The only functional change is in the
v4l2_subdev_lock_and_return_state() function, where we now:

	if (!state)
		dev_notice_once(sd->dev, "source subdev should be ported to new state management\n");

I don't particularly like the text there, so if anyone has better
suggestions...

 Tomi

Tomi Valkeinen (6):
  media: subdev: rename subdev-state alloc & free
  media: subdev: add active state to struct v4l2_subdev
  media: subdev: pass also the active state to subdevs from ioctls
  media: subdev: add subdev state locking
  media: subdev: Add v4l2_subdev_lock_and_return_state()
  media: Documentation: add documentation about subdev state

 .../driver-api/media/v4l2-subdev.rst          |  58 +++++++
 drivers/media/platform/rcar-vin/rcar-v4l2.c   |   9 +-
 drivers/media/platform/vsp1/vsp1_entity.c     |  10 +-
 drivers/media/v4l2-core/v4l2-subdev.c         | 125 +++++++++++++--
 drivers/staging/media/tegra-video/vi.c        |  10 +-
 include/media/v4l2-subdev.h                   | 149 +++++++++++++++++-
 6 files changed, 334 insertions(+), 27 deletions(-)

-- 
2.25.1

