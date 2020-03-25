Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1FF421932A2
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2020 22:27:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727504AbgCYV1Z (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Mar 2020 17:27:25 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:39680 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727357AbgCYV1P (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Mar 2020 17:27:15 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: dafna)
        with ESMTPSA id 06C51293A21
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     linux-media@vger.kernel.org, dafna.hirschfeld@collabora.com,
        helen.koike@collabora.com, ezequiel@collabora.com,
        hverkuil@xs4all.nl, kernel@collabora.com, dafna3@gmail.com,
        sakari.ailus@linux.intel.com, linux-rockchip@lists.infradead.org,
        mchehab@kernel.org, laurent.pinchart@ideasonboard.com
Subject: [PATCH 0/2] media: staging: rkisp1: Fix formats for metadata pads
Date:   Wed, 25 Mar 2020 22:27:02 +0100
Message-Id: <20200325212704.29862-1-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

There are 4 pads between the entities
rkisp1_isp, rkisp1_params, rkisp1_stats that transmit
metadata. Since metadata has no dimensions, it makes
sense to set the width and height of these pads to 0.
The problem is that it makes the v4l-compliance tests fail.
Currently, in order to silent the tests, the width
and height are set to RKISP1_DEFAULT_*

This patchset sets the dimensions to 0 and solves the
compliance error by introducing a new flag
MEDIA_PAD_FL_METADATA in media.h and setting
this flag to those pads.
Then the v4l2-compliance tests can skip the
dimensions test if this flag is set.

This is just a suggested implementation from Laurent,
a better documentation is probably needed.
Another possible solution suggested by Verkuil
is to add a new media bus format: MEDIA_BUS_FMT_FIXED_METADATA.

- patch 1: introduces the the flag
- patch 2: set the flag to the pads and removes a related TODO item

A corresponding patch to v4l-utils will be sent.


Dafna Hirschfeld (2):
  media: media.h: Add a pad flag MEDIA_PAD_FL_METADATA
  media: staging: rkisp1: add the flag MEDIA_PAD_FL_METADATA to the
    metadata pads

 Documentation/media/uapi/mediactl/media-types.rst |  4 ++++
 drivers/staging/media/rkisp1/TODO                 |  1 -
 drivers/staging/media/rkisp1/rkisp1-isp.c         | 10 ++++++----
 drivers/staging/media/rkisp1/rkisp1-params.c      |  2 +-
 drivers/staging/media/rkisp1/rkisp1-stats.c       |  2 +-
 include/uapi/linux/media.h                        |  1 +
 6 files changed, 13 insertions(+), 7 deletions(-)

-- 
2.17.1

