Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 184D84776D2
	for <lists+linux-media@lfdr.de>; Thu, 16 Dec 2021 17:07:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238939AbhLPQG6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Dec 2021 11:06:58 -0500
Received: from meesny.iki.fi ([195.140.195.201]:48676 "EHLO meesny.iki.fi"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238861AbhLPQGv (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Dec 2021 11:06:51 -0500
Received: from hillosipuli.retiisi.eu (89-27-103-169.bb.dnainternet.fi [89.27.103.169])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by meesny.iki.fi (Postfix) with ESMTPSA id C41D72067E;
        Thu, 16 Dec 2021 18:06:49 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
        t=1639670809;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type;
        bh=bz1RfdFo0nnYNYeu6J+BkgWlcCFi5f/Q1ybmg6NPCN8=;
        b=YTvMIGXt/e0qIGTpCrUG67R2ckvK6uZDDReHVaXJI+aq6NhzmOxQZfyHT3dfA7TNDX1V7F
        6uh4y9RLVg3mmnVbBDr7xvVKlDEhnbCUJVs6gNcsptiFIvgs7RzEOiV04IEro8XcrM4M4Y
        lGh/NwNKjx8UMeJpWZqt/zks/yqOk68=
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 0FB5B634C94;
        Thu, 16 Dec 2021 18:06:48 +0200 (EET)
Date:   Thu, 16 Dec 2021 18:06:48 +0200
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     linux-media@vger.kernel.org
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [GIT PULL FOR 5.17] Ipu3-cio2 VCM on Windows BIOS
Message-ID: <YbtkGLF1cNN6d2cC@valkosipuli.retiisi.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1639670809; a=rsa-sha256; cv=none;
        b=CiHpSVeVhwxwpuKlTDJnObHbYWFoFblkDR2O1FVqpYj13FRKfs7T4+DAp3hmAgVYbiK35H
        CsQT8xqGBUdnPnctzPVKjUEfI4WjWKpyDUsSAhs3yqtJnOKK4GsojNZRT39f2U6RUJ/MFh
        Uer2/4DtGAuhnesqpEoAEBOg0W1VPjE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=meesny; t=1639670809;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type;
        bh=bz1RfdFo0nnYNYeu6J+BkgWlcCFi5f/Q1ybmg6NPCN8=;
        b=VusdPTUCG7CWTS9zcjxWEa0lfDriJwzH+suiv785T/9i465x3pIYOT1+zRcH8qEKPtmzns
        sQzbIlul9HZfOalWH/1urnIZRdR2xdDqqVXpZe/+VQnNeGmuQKCUf74RmyOagZQp169JBR
        C4dvDB4olBOlPvhGcR82vPgNkueQr0s=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

Here are ipu3-cio2 patches for supporting VCM on those laptops shipped with
Windows from Hans de Goede, on top of an immutable branch on rc1.

I pulled Hans's branch on the media tree master and applied the media
patches there. I hope this is fine.

Please pull.


The following changes since commit 9b4d7b5c81a2578e080da33b5cddc3149fa611aa:

  media: bttv: use DEVICE_ATTR_RO() helper macro (2021-12-07 11:29:58 +0100)

are available in the Git repository at:

  git://linuxtv.org/sailus/media_tree.git tags/for-5.17-hans-signed

for you to fetch changes up to e41aa17756846f7796771566c4baab5d96117ae1:

  media: ipu3-cio2: Add support for instantiating i2c-clients for VCMs (2021-12-16 16:28:59 +0200)

----------------------------------------------------------------
Hans's ipu3-cio2 patches on top of INT3472 stuff

----------------------------------------------------------------
Hans de Goede (12):
      ACPI: delay enumeration of devices with a _DEP pointing to an INT3472 device
      i2c: acpi: Use acpi_dev_ready_for_enumeration() helper
      i2c: acpi: Add i2c_acpi_new_device_by_fwnode() function
      platform_data: Add linux/platform_data/tps68470.h file
      platform/x86: int3472: Split into 2 drivers
      platform/x86: int3472: Add get_sensor_adev_and_name() helper
      platform/x86: int3472: Pass tps68470_clk_platform_data to the tps68470-regulator MFD-cell
      platform/x86: int3472: Pass tps68470_regulator_platform_data to the tps68470-regulator MFD-cell
      platform/x86: int3472: Deal with probe ordering issues
      media: ipu3-cio2: Defer probing until the PMIC is fully setup
      media: ipu3-cio2: Call cio2_bridge_init() before anything else
      media: ipu3-cio2: Add support for instantiating i2c-clients for VCMs

Sakari Ailus (1):
      Merge tag 'platform-drivers-x86-int3472-1' of https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86 into for-5.17-stable

 drivers/acpi/scan.c                                |  37 +++++-
 drivers/i2c/i2c-core-acpi.c                        |  22 +++-
 drivers/media/pci/intel/ipu3/cio2-bridge.c         |  92 +++++++++++++
 drivers/media/pci/intel/ipu3/cio2-bridge.h         |  16 ++-
 drivers/media/pci/intel/ipu3/ipu3-cio2-main.c      |  10 +-
 drivers/platform/x86/intel/int3472/Makefile        |   9 +-
 ...472_clk_and_regulator.c => clk_and_regulator.c} |   2 +-
 drivers/platform/x86/intel/int3472/common.c        |  82 ++++++++++++
 .../{intel_skl_int3472_common.h => common.h}       |   6 +-
 .../{intel_skl_int3472_discrete.c => discrete.c}   |  51 +++++---
 .../x86/intel/int3472/intel_skl_int3472_common.c   | 106 ---------------
 .../{intel_skl_int3472_tps68470.c => tps68470.c}   |  92 +++++++++++--
 drivers/platform/x86/intel/int3472/tps68470.h      |  25 ++++
 .../x86/intel/int3472/tps68470_board_data.c        | 145 +++++++++++++++++++++
 include/acpi/acpi_bus.h                            |   5 +-
 include/linux/i2c.h                                |  17 ++-
 include/linux/platform_data/tps68470.h             |  35 +++++
 17 files changed, 584 insertions(+), 168 deletions(-)
 rename drivers/platform/x86/intel/int3472/{intel_skl_int3472_clk_and_regulator.c => clk_and_regulator.c} (99%)
 create mode 100644 drivers/platform/x86/intel/int3472/common.c
 rename drivers/platform/x86/intel/int3472/{intel_skl_int3472_common.h => common.h} (94%)
 rename drivers/platform/x86/intel/int3472/{intel_skl_int3472_discrete.c => discrete.c} (91%)
 delete mode 100644 drivers/platform/x86/intel/int3472/intel_skl_int3472_common.c
 rename drivers/platform/x86/intel/int3472/{intel_skl_int3472_tps68470.c => tps68470.c} (56%)
 create mode 100644 drivers/platform/x86/intel/int3472/tps68470.h
 create mode 100644 drivers/platform/x86/intel/int3472/tps68470_board_data.c
 create mode 100644 include/linux/platform_data/tps68470.h

-- 
Kind regards,

Sakari Ailus
