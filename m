Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EBA9A3F217F
	for <lists+linux-media@lfdr.de>; Thu, 19 Aug 2021 22:19:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235035AbhHSUUR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 Aug 2021 16:20:17 -0400
Received: from retiisi.eu ([95.216.213.190]:60170 "EHLO hillosipuli.retiisi.eu"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230039AbhHSUUP (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 Aug 2021 16:20:15 -0400
Received: from lanttu.localdomain (unknown [192.168.2.193])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id 2EBED634C91;
        Thu, 19 Aug 2021 23:19:36 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-acpi@vger.kernel.org, linux-media@vger.kernel.org
Cc:     andriy.shevchenko@linux.intel.com, rafael@kernel.org
Subject: [RFC 0/3] ACPI, PMICs and probing cameras
Date:   Thu, 19 Aug 2021 23:19:33 +0300
Message-Id: <20210819201936.7390-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi all,

The intel_skl_int3472 driver is required for some of the ACPI power state
transitions to function. This driver may be compiled as a module and thus
may probe after a sensor driver that depends on it (e.g. imx258).

Make the sensor driver return -EPROBE_DEFER if the sensor cannot be found.
This way the sensor driver will be probed when both the intel_skl_int3472
and the gpio-tps68470 drivers have successfully probed while also the
gpio-tps68470 driver may be built as a module.

The drawback of the approach is needless probing of the imx258 driver but
everything can be built as modules.

I'm posting this as RFC since the approach would require effectively all
ACPI based sensor drivers to have the same check. This would be a
non-issue to add. I wouldn't mind but...

Is there a way to figure out whether the PMIC opregion callbacks actually
succeed? At least the imx258 driver is happily probed even if the driver
implementing the opregion callback is not there, and thus the device
remains powered off --- and probe fails.

Sakari Ailus (3):
  imx258: Defer probing on ident register read fail (on ACPI)
  gpio-tps68470: Allow building as module
  gpio-tps68470: Add modalias

 drivers/gpio/Kconfig         | 2 +-
 drivers/gpio/gpio-tps68470.c | 5 ++++-
 drivers/media/i2c/imx258.c   | 8 ++++++++
 3 files changed, 13 insertions(+), 2 deletions(-)

-- 
2.30.2

