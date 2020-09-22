Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3DCDD274711
	for <lists+linux-media@lfdr.de>; Tue, 22 Sep 2020 18:58:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726656AbgIVQ6W (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Sep 2020 12:58:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726631AbgIVQ6W (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Sep 2020 12:58:22 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6803CC061755
        for <linux-media@vger.kernel.org>; Tue, 22 Sep 2020 09:58:22 -0700 (PDT)
Received: from guri.fritz.box (p200300c7cf13ec005877be1094b7a29d.dip0.t-ipconnect.de [IPv6:2003:c7:cf13:ec00:5877:be10:94b7:a29d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: dafna)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 7A8C029E069;
        Tue, 22 Sep 2020 17:58:20 +0100 (BST)
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, dafna.hirschfeld@collabora.com,
        helen.koike@collabora.com, ezequiel@collabora.com,
        hverkuil@xs4all.nl, kernel@collabora.com, dafna3@gmail.com,
        sakari.ailus@linux.intel.com, linux-rockchip@lists.infradead.org,
        mchehab@kernel.org, tfiga@chromium.org
Subject: [PATCH 0/2] Add format MEDIA_BUS_FMT_METADATA_FIXED and use it in rkisp1
Date:   Tue, 22 Sep 2020 18:58:11 +0200
Message-Id: <20200922165813.19378-1-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

There are 2 pads between the entities
rkisp1_isp to rkisp1_params and rkisp1_stats that transmit
metadata. This metadata is fixed and not configurable from
userspace. Since the metadata has no dimensions, it makes
sense to set the width and height of these pads to 0.
The problem is that it makes the v4l-compliance tests fail.
Currently, in order to silent the tests, the width
and height are set to RKISP1_DEFAULT_*

This patchset sets the dimensions to 0 and solves the
compliance error by introducing a new media bus code
MEDIA_BUS_FMT_METADATA_FIXED

The new code should be used when
the same driver handles both sides of the link and
the bus format is a fixed metadata format that is
not configurable from userspace.

Then the v4l2-compliance tests can skip the
dimensions test for this media bus code.

See irc discussion for that issue:
https://linuxtv.org/irc/irclogger_log/v4l?date=2020-05-13,Wed
https://linuxtv.org/irc/irclogger_log/v4l?date=2020-05-14,Thu



Dafna Hirschfeld (2):
  meida: uapi: add MEDIA_BUS_FMT_METADATA_FIXED media bus format.
  media: staging: rkisp1: isp: set metadata pads to
    MEDIA_BUS_FMT_METADATA_FIXED

 drivers/staging/media/rkisp1/TODO         | 1 -
 drivers/staging/media/rkisp1/rkisp1-isp.c | 8 ++++----
 include/uapi/linux/media-bus-format.h     | 8 ++++++++
 3 files changed, 12 insertions(+), 5 deletions(-)

-- 
2.17.1

