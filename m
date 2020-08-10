Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4CF2A24078D
	for <lists+linux-media@lfdr.de>; Mon, 10 Aug 2020 16:25:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727790AbgHJOZn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 10 Aug 2020 10:25:43 -0400
Received: from mga11.intel.com ([192.55.52.93]:6985 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726499AbgHJOYs (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 10 Aug 2020 10:24:48 -0400
IronPort-SDR: +NnfU9i/Srsl3qSsYz5oRAdfJxrgqbqiB87kghA8bUtF8FYD09pyDzcIK1KHT21+GJohpqewOb
 2l9DJ7xnQeww==
X-IronPort-AV: E=McAfee;i="6000,8403,9708"; a="151226132"
X-IronPort-AV: E=Sophos;i="5.75,457,1589266800"; 
   d="scan'208";a="151226132"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2020 07:24:47 -0700
IronPort-SDR: ISl6OiKHJsgCyCE/fF7o80n+7pdzNsHq5+65kEHYRejKZwR96IhEOjtBNT4WGpkoSJSNAPRjpt
 hh7SvuksRo8Q==
X-IronPort-AV: E=Sophos;i="5.75,457,1589266800"; 
   d="scan'208";a="398239634"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2020 07:24:43 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
        by paasikivi.fi.intel.com (Postfix) with ESMTP id 9CBE2204B4;
        Mon, 10 Aug 2020 17:24:41 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1k58mC-0003Ep-3j; Mon, 10 Aug 2020 17:27:48 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-i2c@vger.kernel.org
Cc:     Wolfram Sang <wsa@the-dreams.de>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        linux-acpi@vger.kernel.org, Bingbu Cao <bingbu.cao@intel.com>,
        linux-media@vger.kernel.org,
        Chiranjeevi Rapolu <chiranjeevi.rapolu@intel.com>,
        Hyungwoo Yang <hyungwoo.yang@intel.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rajmohan.mani@intel.com, Tomasz Figa <tfiga@chromium.org>,
        "Qiu, Tian Shu" <tian.shu.qiu@intel.com>
Subject: [PATCH v5 0/6] Support running driver's probe for a device powered off
Date:   Mon, 10 Aug 2020 17:27:41 +0300
Message-Id: <20200810142747.12400-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi all,

These patches enable calling (and finishing) a driver's probe function
without powering on the respective device on busses where the practice is
to power on the device for probe. While it generally is a driver's job to
check the that the device is there, there are cases where it might be
undesirable. (In this case it stems from a combination of hardware design
and user expectations; see below.) The downside with this change is that
if there is something wrong with the device, it will only be found at the
time the device is used. In this case (the camera sensors + EEPROM in a
sensor) I don't see any tangible harm from that though.

An indication both from the driver and the firmware is required to allow
the device's power state to remain off during probe (see the first patch).


The use case is such that there is a privacy LED next to an integrated
user-facing laptop camera, and this LED is there to signal the user that
the camera is recording a video or capturing images. That LED also happens
to be wired to one of the power supplies of the camera, so whenever you
power on the camera, the LED will be lit, whether images are captured from
the camera --- or not. There's no way to implement this differently
without additional software control (allowing of which is itself a
hardware design decision) on most CSI-2-connected camera sensors as they
simply have no pin to signal the camera streaming state.

This is also what happens during driver probe: the camera will be powered
on by the I²C subsystem calling dev_pm_domain_attach() and the device is
already powered on when the driver's own probe function is called. To the
user this visible during the boot process as a blink of the privacy LED,
suggesting that the camera is recording without the user having used an
application to do that. From the end user's point of view the behaviour is
not expected and for someone unfamiliar with internal workings of a
computer surely seems quite suspicious --- even if images are not being
actually captured.

I've tested these on linux-next master. They also apply to Wolfram's
i2c/for-next branch, there's a patch that affects the I²C core changes
here (see below). The patches apart from that apply to Bartosz's
at24/for-next as well as Mauro's linux-media master branch.

since v4 <URL:https://lore.kernel.org/linux-acpi/20200121134157.20396-1-sakari.ailus@linux.intel.com/>:

- Rename "probe-low-power" property as "allow-low-power-probe". This is
  taken into account in function and file naming, too.

- Turn probe_low_power field in struct i2c_driver into flags field.

- Rebase on Wolfram's i2c/for-next branch that contains the removal of the
  support for disabling I²C core IRQ mappings (commit
  0c2a34937f7e4c4776bb261114c475392da2355c).

- Change wording for "allow-low-power-probe" property in ACPI
  documentation.

since v3 <URL:https://lore.kernel.org/linux-acpi/20200109154529.19484-1-sakari.ailus@linux.intel.com/T/#t>:

- Rework the 2nd patch based on Rafael's comments

	- Rework description of the ACPI low power state helper function,
	  according to Rafael's text.

	- Rename and rework the same function as
	  acpi_dev_state_low_power().

	- Reflect the changes in commit message as well.

- Added a patch to document the probe-low-power _DSD property.

since v2 <URL:https://patchwork.kernel.org/cover/11114255/>:

- Remove extra CONFIG_PM ifdefs; these are not needed.

- Move the checks for power state hints from drivers/base/dd.c to
  drivers/i2c/i2c-base-core.c; these are I²C devices anyway.

- Move the probe_low_power field from struct device_driver to struct
  i2c_driver.

since v1:

- Rename probe_powered_off struct device field as probe_low_power and
  reflect the similar naming to the patches overall.

- Work with CONFIG_PM disabled, too.

Rajmohan Mani (1):
  media: i2c: imx319: Support probe while the device is off

Sakari Ailus (5):
  i2c: Allow driver to manage the device's power state during probe
  ACPI: Add a convenience function to tell a device is in low power
    state
  ov5670: Support probe whilst the device is in a low power state
  at24: Support probing while off
  Documentation: ACPI: Document allow-low-power-probe _DSD property

 .../acpi/dsd/allow-low-power-probe.rst        | 28 +++++++++++++
 Documentation/firmware-guide/acpi/index.rst   |  1 +
 drivers/acpi/device_pm.c                      | 31 ++++++++++++++
 drivers/i2c/i2c-core-base.c                   | 17 ++++++--
 drivers/media/i2c/imx319.c                    | 23 ++++++-----
 drivers/media/i2c/ov5670.c                    | 23 ++++++-----
 drivers/misc/eeprom/at24.c                    | 40 ++++++++++++-------
 include/linux/acpi.h                          |  5 +++
 include/linux/i2c.h                           | 14 +++++++
 9 files changed, 146 insertions(+), 36 deletions(-)
 create mode 100644 Documentation/firmware-guide/acpi/dsd/allow-low-power-probe.rst

-- 
2.20.1

