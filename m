Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 38540145933
	for <lists+linux-media@lfdr.de>; Wed, 22 Jan 2020 17:02:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726026AbgAVQCS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 22 Jan 2020 11:02:18 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:34828 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725883AbgAVQCR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 22 Jan 2020 11:02:17 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: dafna)
        with ESMTPSA id 2A284293092
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     dafna.hirschfeld@collabora.com, helen.koike@collabora.com,
        ezequiel@collabora.com, skhan@linuxfoundation.org,
        hverkuil@xs4all.nl, kernel@collabora.com, dafna3@gmail.com
Subject: [PATCH v5 0/3] media: vimc: release vimc in release cb of v4l2_device
Date:   Wed, 22 Jan 2020 17:01:45 +0100
Message-Id: <20200122160148.23686-1-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

I decided to split the patchset "race condition fixes" into
several patchsets since it deals with several bugs that are independent
and also, some of the fixes deal only with code in vimc and other fixes code in
the framework.

This patchset fixes only the first bug from the last patchset which is
a bug only in vimc:

Currently when the device is unbounded, the vimc entities are
released immediately. If the device is streaming,
the function `vimc_streamer_pipeline_terminate` is called when
unregistering the streaming capture device and it references the
already freed vimc entities.
The patchset solves this by deferring the release
to the release callback of v4l2_device. This ensures that
the vimc entities will be released after the last fh is closed
and so the streaming terminates before.
The detail of how to reproduce this bug are described in the patch:
"use-after-free fix - release vimc in the v4l_device release"
The bug is easily detected with a KASAN report.


Changes since v4:
- make the unregister callback optional and implement it only for vimc-capture entities.
This is because the subdevices are unregisterd anyway in v4l2_device_unregister.

Changes since v3:
- add a more precise description of the first bug in the third patch and replace the crash report with the KASAN report

Changes from v2:
in patch 3, in case of failure in the probe function the memory is released
directly from the probe function, and only on success path the release callback
of v4l2_device is assigned

Changes from v1:
v1 solved it by adding refcount to each entity.
(patch "media: vimc: crash fix - add refcount to vimc entities")
v2 is different solution due to comments from Hans Verkuil

Patches Summary:

- The first patch replaces the usage of vimc_device.pdev.dev with vimc.mdev.dev
- The second patch allocates the vimc_device dynamically.
This is needed since the release of the device is deferred
and might run after the device is initialized again.
- The third patch solves the use-after-free bug by moving the release of the vimc_device
and all the vimc entities to the release callback of v4l2_device.

Dafna Hirschfeld (3):
  media: vimc: replace vimc->pdev.dev with vimc->mdev.dev
  media: vimc: allocate vimc_device dynamically
  media: vimc: use-after-free fix - release vimc in the v4l_device
    release

 drivers/media/platform/vimc/vimc-capture.c | 18 ++---
 drivers/media/platform/vimc/vimc-common.c  |  2 -
 drivers/media/platform/vimc/vimc-common.h  | 27 +++----
 drivers/media/platform/vimc/vimc-core.c    | 94 ++++++++++++++--------
 drivers/media/platform/vimc/vimc-debayer.c | 21 +----
 drivers/media/platform/vimc/vimc-scaler.c  | 21 +----
 drivers/media/platform/vimc/vimc-sensor.c  | 20 +----
 7 files changed, 96 insertions(+), 107 deletions(-)

-- 
2.17.1

