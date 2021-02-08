Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C02DC314004
	for <lists+linux-media@lfdr.de>; Mon,  8 Feb 2021 21:12:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235161AbhBHULZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 8 Feb 2021 15:11:25 -0500
Received: from retiisi.eu ([95.216.213.190]:57072 "EHLO hillosipuli.retiisi.eu"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235241AbhBHUKw (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 8 Feb 2021 15:10:52 -0500
Received: from lanttu.localdomain (lanttu-e.localdomain [192.168.1.64])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id B3728634C87;
        Mon,  8 Feb 2021 22:08:33 +0200 (EET)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-kernel@vger.kernel.org
Cc:     linux-media@vger.kernel.org,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Petr Mladek <pmladek@suse.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        dri-devel@lists.freedesktop.org, hverkuil@xs4all.nl,
        laurent.pinchart@ideasonboard.com, mchehab@kernel.org,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Joe Perches <joe@perches.com>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>
Subject: [PATCH v6 0/3] Add %p4cc printk modifier for V4L2 and DRM fourcc codes
Date:   Mon,  8 Feb 2021 22:09:00 +0200
Message-Id: <20210208200903.28084-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi all,

This set adds support for %p4cc printk modifier for printing V4L2 and DRM
fourcc codes. The codes are cumbersome to print manually and by adding the
modifier, this task is saved from the V4L2 and DRM frameworks as well as
related drivers. DRM actually had it handled in a way (see 3rd patch) but
the printk modifier makes printing the format easier even there. On V4L2
side it saves quite a few lines of repeating different implementations of
printing the 4cc codes.

Further work will include converting the V4L2 drivers doing the same, as
well as converting DRM drivers from drm_get_format_name() to plain %p4cc.
I left these out from this version since individual drivers are easier
changed without dealing with multiple trees.

If DRM folks would prefer to convert drivers to %p4cc directly instead I
have no problem dropping the 3rd patch. Nearly all uses in DRM are in
printk family of functions that can readily use %p4cc instead of the
current arrangement that relies on caller-allocated temporary buffer.

Since v5:

- Added V4L2 core conversion to %p4cc, as well as change the DRM
  fourcc printing function to use %p4cc.

- Add missing checkpatch.pl checks for %p4cc modifier.

Sakari Ailus (3):
  lib/vsprintf: Add support for printing V4L2 and DRM fourccs
  v4l: ioctl: Use %p4cc printk modifier to print FourCC codes
  drm/fourcc: Switch to %p4cc format modifier

 Documentation/core-api/printk-formats.rst | 16 +++++
 drivers/gpu/drm/drm_fourcc.c              | 16 +----
 drivers/media/v4l2-core/v4l2-ioctl.c      | 85 ++++++-----------------
 lib/test_printf.c                         | 17 +++++
 lib/vsprintf.c                            | 51 ++++++++++++++
 scripts/checkpatch.pl                     |  6 +-
 6 files changed, 112 insertions(+), 79 deletions(-)

-- 
2.29.2

