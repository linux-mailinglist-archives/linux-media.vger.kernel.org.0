Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3C808109D86
	for <lists+linux-media@lfdr.de>; Tue, 26 Nov 2019 13:08:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728218AbfKZMId (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 26 Nov 2019 07:08:33 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:49498 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727547AbfKZMId (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 26 Nov 2019 07:08:33 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: dafna)
        with ESMTPSA id 86002281E9A
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     dafna.hirschfeld@collabora.com, hverkuil@xs4all.nl,
        dafna3@gmail.com, helen.koike@collabora.com,
        ezequiel@collabora.com, skhan@linuxfoundation.org,
        kernel@collabora.com
Subject: [PATCH v3 0/3] media: vimc: release vimc in release cb of v4l2_device
Date:   Tue, 26 Nov 2019 13:08:19 +0100
Message-Id: <20191126120822.11451-1-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patchset solves a crash that happens when unbinding the vimc
device while it is streaming. Currently when the device is unbounded
the vimc entities are released imidiettaly, this cause a crash
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

Changes from v2:
in patch 3, in case of failure in the probe function the memory is released
directly from the probe function, and only on success path the release callback
of v4l2_device is assigned

Dafna Hirschfeld (3):
  media: vimc: replace vimc->pdev.dev with vimc->mdev.dev
  media: vimc: allocate vimc_device dynamically
  media: vimc: crash fix - release vimc in the v4l_device release

 drivers/media/platform/vimc/vimc-capture.c |  18 ++--
 drivers/media/platform/vimc/vimc-common.c  |   2 -
 drivers/media/platform/vimc/vimc-common.h  |  30 +++---
 drivers/media/platform/vimc/vimc-core.c    | 101 ++++++++++++++-------
 drivers/media/platform/vimc/vimc-debayer.c |  19 ++--
 drivers/media/platform/vimc/vimc-scaler.c  |  19 ++--
 drivers/media/platform/vimc/vimc-sensor.c  |  18 ++--
 7 files changed, 115 insertions(+), 92 deletions(-)

-- 
2.20.1

