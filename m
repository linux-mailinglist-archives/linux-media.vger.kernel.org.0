Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2F0E3574F09
	for <lists+linux-media@lfdr.de>; Thu, 14 Jul 2022 15:22:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239503AbiGNNWl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Jul 2022 09:22:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239442AbiGNNWX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Jul 2022 09:22:23 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B01C560518
        for <linux-media@vger.kernel.org>; Thu, 14 Jul 2022 06:21:53 -0700 (PDT)
Received: from deskari.lan (91-158-154-79.elisa-laajakaista.fi [91.158.154.79])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3D862383;
        Thu, 14 Jul 2022 15:21:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1657804910;
        bh=B+Zd6cW+gUjTMBQH9x8nbFqCJkqBGOY/gHF6fI3z8aA=;
        h=From:To:Cc:Subject:Date:From;
        b=K6vLiAhvLfm76LaAg2QsyZDS5pR/SFM+ELbOFy1nhanht7zd2iABUreAWSMRV5l/u
         OPwP6yT7/0zatjOp1eEGOPvJ/sothv+Y5uGVbvXXbwwIQDu6xMzWivf2Os3dlh26IE
         BtjCpFVz0626OfMJOaz9/bRyUo/5Nsn+r9nuA8TQ=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>, satish.nagireddy@getcruise.com
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v2 0/4] v4l-utils: support multiplexed streams
Date:   Thu, 14 Jul 2022 16:21:12 +0300
Message-Id: <20220714132116.132498-1-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

v1 can be found here:

https://lore.kernel.org/all/20211130141815.892354-1-tomi.valkeinen@ideasonboard.com/

Changes in version 2:

- Addressed the review comments
- Fixed two memory leaks

So, no big changes but I wanted to fix the review comments as it's been
over half a year since v1.

And as this depends on the routing and streams kernel support, which is
not merged, this series is not for merging yet.

 Tomi

Tomi Valkeinen (4):
  v4l2-utils: update Linux headers for multiplexed streams
  v4l2-ctl: Add routing and streams support
  media-ctl: add support for routes and streams
  v4l2-ctl/compliance: add routing and streams multiplexed streams

 include/linux/v4l2-subdev.h                 |  88 +++++-
 utils/common/v4l2-info.cpp                  |   2 +
 utils/media-ctl/libmediactl.c               |  41 +++
 utils/media-ctl/libv4l2subdev.c             | 285 +++++++++++++++++--
 utils/media-ctl/media-ctl.c                 | 123 +++++++--
 utils/media-ctl/mediactl.h                  |  16 ++
 utils/media-ctl/options.c                   |  15 +-
 utils/media-ctl/options.h                   |   1 +
 utils/media-ctl/v4l2subdev.h                |  58 +++-
 utils/v4l2-compliance/v4l2-compliance.cpp   | 124 +++++++--
 utils/v4l2-compliance/v4l2-compliance.h     |   8 +-
 utils/v4l2-compliance/v4l2-test-subdevs.cpp |  43 ++-
 utils/v4l2-ctl/v4l2-ctl-subdev.cpp          | 289 +++++++++++++++++---
 utils/v4l2-ctl/v4l2-ctl.cpp                 |   2 +
 utils/v4l2-ctl/v4l2-ctl.h                   |   2 +
 15 files changed, 966 insertions(+), 131 deletions(-)

-- 
2.34.1

