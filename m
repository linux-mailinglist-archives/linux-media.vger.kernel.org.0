Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1FB90F3ADF
	for <lists+linux-media@lfdr.de>; Thu,  7 Nov 2019 23:03:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726292AbfKGWD4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 7 Nov 2019 17:03:56 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:54550 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725870AbfKGWDz (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 7 Nov 2019 17:03:55 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: dafna)
        with ESMTPSA id 30724290B39
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     dafna.hirschfeld@collabora.com, helen.koike@collabora.com,
        andre.almeida@collabora.com, skhan@linuxfoundation.org,
        hverkuil@xs4all.nl, kernel@collabora.com, dafna3@gmail.com
Subject: [PATCH v2 0/3] media: vimc: release vimc in release cb of v4l2_device
Date:   Thu,  7 Nov 2019 23:03:42 +0100
Message-Id: <20191107220345.21017-1-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patchset solves a crash that happens when unbinding the vimc
device while it is streaming. Currently when the device is unbounded
the vimc entities are released immediately, this cause a crash
if the streaming thread or the capture device dereference them
after the release. The patchset solves this by deferring the release
to the release callback of v4l2_device. This ensures that
the vimc entities will be released after the last fh is closed
and so the streaming terminates before.

- The first patch replaces the usage of vimc_device.pdev.dev
with vimc.mdev.dev
- The second patch allocates the vimc_device dynamically.
This is needed since the release of the device is deferred
and might run after the device is initialized again.
- The third patch moves the release of the vimc_device
and all the vimc entities to the release callback of
v4l2_device.

Changes from v1:
v1 solved it by adding refcount to each entity.
(patch "media: vimc: crash fix - add refcount to vimc entities")
v2 is different solution due to comments from Hans Verkuil

Dafna Hirschfeld (3):
  media: vimc: replace vimc->pdev.dev with vimc->mdev.dev
  media: vimc: allocate vimc_device dynamically
  media: vimc: crash fix - release vimc in the v4l_device release

 drivers/media/platform/vimc/vimc-capture.c | 14 ++--
 drivers/media/platform/vimc/vimc-common.c  |  2 -
 drivers/media/platform/vimc/vimc-common.h  | 30 +++----
 drivers/media/platform/vimc/vimc-core.c    | 94 +++++++++++++++-------
 drivers/media/platform/vimc/vimc-debayer.c | 15 ++--
 drivers/media/platform/vimc/vimc-scaler.c  | 15 ++--
 drivers/media/platform/vimc/vimc-sensor.c  | 14 ++--
 7 files changed, 101 insertions(+), 83 deletions(-)

-- 
2.20.1

