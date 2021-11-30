Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B10BD46367B
	for <lists+linux-media@lfdr.de>; Tue, 30 Nov 2021 15:18:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233750AbhK3OVo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 30 Nov 2021 09:21:44 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:41492 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232314AbhK3OVn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 30 Nov 2021 09:21:43 -0500
Received: from deskari.lan (91-156-85-209.elisa-laajakaista.fi [91.156.85.209])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id DDBB18F0;
        Tue, 30 Nov 2021 15:18:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1638281903;
        bh=GUV/RT6OyPICacsL0zA03I5bRVvhuZXy3bvCEuwv0J8=;
        h=From:To:Cc:Subject:Date:From;
        b=bS6cjRngJoB7LICsUVsjzFbOoO1MMyGa+jQouZLHatvQK263DsufOCexBdnq9LD6X
         gG/RyepTPOq6xZF6iXa9PUvhJVb+zCva55oCtoT8KozzhJYvMvRTYGD/hiLhTzTmco
         uORkl1kB9PCYTO9urv3AI5rBkDs4pjudwFhwa5MY=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v1 0/4] v4l-utils: support multiplexed streams
Date:   Tue, 30 Nov 2021 16:18:11 +0200
Message-Id: <20211130141815.892354-1-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

This series adds support to multiplexed streams.

v4l2-ctl and media-ctl are updated to allow configuring routes and
setting configs per stream.

v4l2-compliance is updated to always set the new stream field, and to do
some testing for multiplexed subdevs.

 Tomi

Tomi Valkeinen (4):
  v4l2-utils: update Linux headers for multiplexed streams
  v4l2-ctl: Add routing and streams support
  media-ctl: add support for routes and streams
  v4l2-ctl/compliance: add routing and streams multiplexed streams

 include/linux/v4l2-subdev.h                 |  88 +++++-
 utils/common/v4l2-info.cpp                  |   2 +
 utils/media-ctl/libmediactl.c               |  41 +++
 utils/media-ctl/libv4l2subdev.c             | 256 +++++++++++++++--
 utils/media-ctl/media-ctl.c                 | 113 ++++++--
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
 15 files changed, 928 insertions(+), 130 deletions(-)

-- 
2.25.1

