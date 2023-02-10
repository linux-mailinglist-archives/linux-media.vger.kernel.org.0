Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C9612691EAD
	for <lists+linux-media@lfdr.de>; Fri, 10 Feb 2023 12:56:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231450AbjBJL4I (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 10 Feb 2023 06:56:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229584AbjBJL4H (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 10 Feb 2023 06:56:07 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 890C32111
        for <linux-media@vger.kernel.org>; Fri, 10 Feb 2023 03:56:03 -0800 (PST)
Received: from desky.lan (91-154-32-225.elisa-laajakaista.fi [91.154.32.225])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E2DE113FF;
        Fri, 10 Feb 2023 12:56:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1676030161;
        bh=wJuptfFykuJ7aIyAJWsW70TUovWPNpthswy9E79QLFI=;
        h=From:To:Cc:Subject:Date:From;
        b=FtFKaB9FoEFM10NXWaNsQUZwRFaUChqt7N1koDVXDzASoyK6Bwe7W/zJZDyJzJsgi
         P6bG+16ALNKqBVzKuzIyUeAWU5flr4MKk4XCQhf5cpJVWcu/BVwG5FpN9CI8+JplaB
         5kG4AFvhpb47/vGuEjbtH8mbsXILsZDrHuF4WE+Y=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        satish.nagireddy@getcruise.com
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v3 0/3] v4l-utils: support multiplexed streams
Date:   Fri, 10 Feb 2023 13:55:43 +0200
Message-Id: <20230210115546.199809-1-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

v4l2-ctl and media-ctl are updated to allow configuring routes and
setting configs per stream.

v4l2-compliance is updated to always set the new stream field, and to do
some testing for multiplexed subdevs.

v2 of the series can be found from:

https://lore.kernel.org/all/20220714132116.132498-1-tomi.valkeinen@ideasonboard.com/

v3 is just a rebase on top of latest master, which contains the most
recent headers from the kernel.

Uses of V4L2_SUBDEV_ROUTE_FL_IMMUTABLE and V4L2_SUBDEV_ROUTE_FL_SOURCE
have been dropped as they don't exist in the mainline.

 Tomi

Tomi Valkeinen (3):
  v4l2-ctl: Add routing and streams support
  media-ctl: add support for routes and streams
  v4l2-ctl/compliance: add routing and streams multiplexed streams

 utils/media-ctl/libmediactl.c               |  41 +++
 utils/media-ctl/libv4l2subdev.c             | 283 +++++++++++++++++--
 utils/media-ctl/media-ctl.c                 | 121 ++++++--
 utils/media-ctl/mediactl.h                  |  16 ++
 utils/media-ctl/options.c                   |  15 +-
 utils/media-ctl/options.h                   |   1 +
 utils/media-ctl/v4l2subdev.h                |  58 +++-
 utils/v4l2-compliance/v4l2-compliance.cpp   | 120 ++++++--
 utils/v4l2-compliance/v4l2-compliance.h     |   8 +-
 utils/v4l2-compliance/v4l2-test-subdevs.cpp |  43 ++-
 utils/v4l2-ctl/v4l2-ctl-subdev.cpp          | 288 +++++++++++++++++---
 utils/v4l2-ctl/v4l2-ctl.cpp                 |   2 +
 utils/v4l2-ctl/v4l2-ctl.h                   |   2 +
 13 files changed, 874 insertions(+), 124 deletions(-)

-- 
2.34.1

