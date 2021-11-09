Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E6F8744A9B1
	for <lists+linux-media@lfdr.de>; Tue,  9 Nov 2021 09:52:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244520AbhKIIzA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 9 Nov 2021 03:55:00 -0500
Received: from mga18.intel.com ([134.134.136.126]:10464 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234536AbhKIIy7 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 9 Nov 2021 03:54:59 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10162"; a="219306207"
X-IronPort-AV: E=Sophos;i="5.87,219,1631602800"; 
   d="scan'208";a="219306207"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2021 00:52:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,219,1631602800"; 
   d="scan'208";a="491585274"
Received: from ipu5-build.bj.intel.com ([10.238.232.188])
  by orsmga007.jf.intel.com with ESMTP; 09 Nov 2021 00:52:09 -0800
From:   Bingbu Cao <bingbu.cao@intel.com>
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        rafael@kernel.org
Cc:     shawnx.tu@intel.com, tian.shu.qiu@intel.com,
        chiranjeevi.rapolu@intel.com, hyungwoo.yang@intel.com,
        tfiga@chromium.org, senozhatsky@chromium.org,
        linux-kernel@vger.kernel.org, bingbu.cao@intel.com,
        bingbu.cao@linux.intel.com
Subject: [PATCH 0/6] Support device probe in non-zero ACPI D state
Date:   Tue,  9 Nov 2021 16:48:29 +0800
Message-Id: <1636447715-15526-1-git-send-email-bingbu.cao@intel.com>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

In many use cases where the chip is part of a camera module, and the camera
module is wired together with a privacy LED, powering on the device during
probe will cause the LED blink, it is undesireable as the privacy LED concern.

Sakari's change - 
https://lore.kernel.org/lkml/20211018121729.6357-1-sakari.ailus@linux.intel.com/
which add the support device probe in non-zero ACPI D state.

This following patch add support probe in non-zero ACPI D state for more camera
sensors: ov2740, ov5670, ov5675, ov8856, imx208 and hi556.

--

This patch series is based on linux-next branch of Rafael J. Wysocki's
linux-pm git repository:
https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git

--
--

Bingbu Cao (5):
  media: ov8856: support device probe in non-zero ACPI D state
  media: ov2740: support device probe in non-zero ACPI D state
  media: imx208: Support device probe in non-zero ACPI D state
  media: ov5675: Support device probe in non-zero ACPI D state
  media: hi556: Support device probe in non-zero ACPI D state

Sakari Ailus (1):
  media: ov5670: Support device probe in non-zero ACPI D state

 drivers/media/i2c/hi556.c  |  67 ++++++++++++-------
 drivers/media/i2c/imx208.c |  77 +++++++++++++--------
 drivers/media/i2c/ov2740.c |  69 ++++++++++++-------
 drivers/media/i2c/ov5670.c |  78 +++++++++++++---------
 drivers/media/i2c/ov5675.c |  71 +++++++++++++-------
 drivers/media/i2c/ov8856.c | 162 +++++++++++++++++++++++++--------------------
 6 files changed, 316 insertions(+), 208 deletions(-)

-- 
2.7.4

