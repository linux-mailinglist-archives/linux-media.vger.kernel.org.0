Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B14E63D8B63
	for <lists+linux-media@lfdr.de>; Wed, 28 Jul 2021 12:06:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232165AbhG1KGf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 28 Jul 2021 06:06:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231907AbhG1KGf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 28 Jul 2021 06:06:35 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07E88C061757
        for <linux-media@vger.kernel.org>; Wed, 28 Jul 2021 03:06:33 -0700 (PDT)
Received: from guri.fritz.box (unknown [IPv6:2a02:810a:880:f54:2423:b21a:aa05:1a51])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: dafna)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id BBFAC1F435D4;
        Wed, 28 Jul 2021 11:06:31 +0100 (BST)
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, dafna.hirschfeld@collabora.com,
        helen.koike@collabora.com, ezequiel@collabora.com,
        hverkuil@xs4all.nl, kernel@collabora.com, dafna3@gmail.com,
        sakari.ailus@linux.intel.com, mchehab@kernel.org,
        tfiga@chromium.org, enric.balletbo@collabora.com,
        acourbot@chromium.org, hsinyi@chromium.org, eizan@chromium.org
Subject: [PATCH 0/3] media: v4l2-ctl: Add support to VIDIOC_DQEVENT_TIME32 on non x86_64 arch
Date:   Wed, 28 Jul 2021 12:06:21 +0200
Message-Id: <20210728100624.16129-1-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Currently, if the ioctl VIDIOC_DQEVENT_TIME32 is called on e.g. Arm-64
the function 'v4l2_compat_translate_cmd' doesn't have a 'translation'
for the cmd and so 'cmd' is returned as is. This later cause
a failure '-ENOTTY' in __video_do_ioctl.
This patchset fix it by defining VIDIOC_DQEVENT32_TIME32 to be
VIDIOC_DQEVENT_TIME32 for non x86-64 arch and translate it
to VIDIOC_DQEVENT.

I tested the patchset with vicodec on x86_64 with both v4l2-ctl v4l2-ctl-32
and I tested it on arm64 with v4l2-ctl compiled to 32 bits, - chromeos userspace on mt8173 device.

The command I used:
$ modprobe vicdec
$ v4l2-ctl -d7 --stream-mmap --stream-out-mmap --stream-from jelly_700-1000-YU12.fwht

Witout that patchset the command holds:
$ v4l2-ctl -d7 --stream-mmap --stream-out-mmap --stream-from jelly_700-1000-YU12.fwht
>>>>

This patchset also fixes a failing test video.DecodeAccelVD.h264 from the 'tast' tests on mtk-vcodec:

tast -verbose run -build=false 10.42.0.175 video.DecodeAccelVD.h264

Dafna Hirschfeld (3):
  media: v4l2-core: move the code that copies v4l2_event_time32 to a
    function
  media: v4l2-core: combine code chunks under macro condition together
  media: v4l2-ctl: Add support to VIDIOC_DQEVENT_TIME32 on non x86_64
    arch

 drivers/media/v4l2-core/v4l2-compat-ioctl32.c | 51 ++++++++++---------
 drivers/media/v4l2-core/v4l2-ioctl.c          | 41 +++++++++------
 include/media/v4l2-ioctl.h                    |  9 ++++
 3 files changed, 61 insertions(+), 40 deletions(-)

-- 
2.17.1

