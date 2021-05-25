Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E8FA738FF03
	for <lists+linux-media@lfdr.de>; Tue, 25 May 2021 12:26:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231539AbhEYK1f (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 25 May 2021 06:27:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231423AbhEYK1e (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 May 2021 06:27:34 -0400
Received: from meesny.iki.fi (meesny.iki.fi [IPv6:2001:67c:2b0:1c1::201])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6EF7C061574
        for <linux-media@vger.kernel.org>; Tue, 25 May 2021 03:26:04 -0700 (PDT)
Received: from hillosipuli.retiisi.eu (unknown [IPv6:2001:2003:f75d:b010::e64])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by meesny.iki.fi (Postfix) with ESMTPSA id 3EA4820055
        for <linux-media@vger.kernel.org>; Tue, 25 May 2021 13:26:01 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
        t=1621938361;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=bpFT+OxmMBWhUQaEIQfXOW8JLN01NgO+vCMJCfjd5i8=;
        b=e/fHxLq10wWsjIpAoUjl21YTX37JHxMTczYCH/8yshOej2e+T2fs12u/jq5eVuss5Kaz6x
        qaF9nPfESp+Hxjz8Vcse4iCLMco5UtYTSw6qC7sKlJKMekcpKPDLT+yB+F3rbYBHZqUBg+
        n9FxnNjuLzMBRSmI7Tnb8UYXwOVLN3M=
Received: from valkosipuli.localdomain (valkosipuli.localdomain [IPv6:fd35:1bc8:1a6:d3d5::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 0B67A634C87
        for <linux-media@vger.kernel.org>; Tue, 25 May 2021 13:25:42 +0300 (EEST)
Received: from localhost ([127.0.0.1] helo=valkosipuli.retiisi.eu)
        by valkosipuli.localdomain with esmtp (Exim 4.92)
        (envelope-from <sakari.ailus@iki.fi>)
        id 1llUG7-0000yR-Us
        for linux-media@vger.kernel.org; Tue, 25 May 2021 13:26:00 +0300
Date:   Tue, 25 May 2021 13:25:59 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     linux-media@vger.kernel.org
Subject: [GIT PULL for 5.14] V4L2 camera sensor etc. patches
Message-ID: <20210525102559.GD3@valkosipuli.retiisi.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
User-Agent: Mutt/1.10.1 (2018-07-13)
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1621938361; a=rsa-sha256; cv=none;
        b=K93lL8AiWddGzTHxnE4I9lrHB8tVXR9RVyKVcJTHZ5tbaYnTXiDhKCKTYFNGghMH57CoqM
        U1UiK5Xs+c9CByLum8GQyrfYNxslytFqgEBmpfxGsK8NPRuUM6+5/hE3ibo6aognScsAxg
        ziIbI/enGsLSFebnu9v/V1m+L1yIuHg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=meesny; t=1621938361;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=bpFT+OxmMBWhUQaEIQfXOW8JLN01NgO+vCMJCfjd5i8=;
        b=JJoQ3N5Ce34LLWNGps+J8SFwHB8qqx1pIO/LrEZ5bKwMDIFax+g8Xp6TcztzvdjBWSc2Pc
        nD3tKXvwtU7d6fXcByCU18yeRe8we8J9UCY/pwhpCV0JXeqEspUplXuGrt1HrU/5XddCV6
        iVLywe5mO/sHQHDKxSlKV6quAoj0Cc8=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

Here's a bunch of patches for sensor drivers, documentation and DT bindings
mostly. Included is a driver for IMX208 sensors, as well as fix for the CCS
driver that's cc'd to the stable trees. A lot of the changes in the ov8856
driver are for adapting the driver data structures to work with multiple
lane configurations.

Please pull.


The following changes since commit bb9212fd971035597d264fc6a7cc4df0db9b5fd0:

  media: ARM: dts: sama5d4: enable Hantro G1 VDEC (2021-05-19 09:51:40 +0200)

are available in the Git repository at:

  git://linuxtv.org/sailus/media_tree.git tags/for-5.14-1-signed

for you to fetch changes up to 69577665eb1552b4f739cd3b9a149b0f7972d2f8:

  media: dt-bindings: media: renesas,vin: Add r8a779a0 support (2021-05-24 18:10:05 +0300)

----------------------------------------------------------------
V4L2 patches for 5.14

----------------------------------------------------------------
Andy Shevchenko (1):
      media: ipu3-cio2: Fix reference counting when looping over ACPI devices

Bernhard Wimmer (2):
      media: Documentation: ccs: Fix the op_pll_multiplier address
      media: ccs: Fix the op_pll_multiplier address

Christophe JAILLET (2):
      media: i2c: ov2659: Fix an error message
      media: i2c: ov9650: Fix an error message

Dillon Min (1):
      media: i2c: ov2659: Use clk_{prepare_enable,disable_unprepare}() to set xvclk on/off

Niklas Söderlund (2):
      media: dt-bindings: media: renesas,isp: Add bindings for ISP Channel Selector
      media: dt-bindings: media: renesas,vin: Add r8a779a0 support

Paul Kocialkowski (1):
      media: i2c: ov8865: remove unnecessary NULL check

Sakari Ailus (3):
      v4l: async, fwnode: Improve module organisation
      staging: ipu3-imgu: Move the UAPI header from include under include/uapi
      staging: ipu3-imgu: Document pages field

Shawn Tu (3):
      ov8856: Add support for 2 data lanes
      ov8856: add vflip/hflip control support
      media: imx208: Add imx208 camera sensor driver

 Documentation/admin-guide/media/ipu3.rst           |   35 +-
 .../devicetree/bindings/media/renesas,isp.yaml     |  196 ++
 .../devicetree/bindings/media/renesas,vin.yaml     |   26 +-
 .../driver-api/media/drivers/ccs/ccs-regs.asc      |    2 +-
 .../driver-api/media/drivers/ccs/mk-ccs-regs       |    5 +-
 .../media/v4l/pixfmt-meta-intel-ipu3.rst           |    2 +-
 MAINTAINERS                                        |    8 +
 drivers/media/i2c/Kconfig                          |   22 +
 drivers/media/i2c/Makefile                         |    1 +
 drivers/media/i2c/ccs/ccs-limits.c                 |    4 +
 drivers/media/i2c/ccs/ccs-limits.h                 |    4 +
 drivers/media/i2c/ccs/ccs-regs.h                   |    6 +-
 drivers/media/i2c/imx208.c                         | 1087 +++++++++
 drivers/media/i2c/ov2659.c                         |   27 +-
 drivers/media/i2c/ov8856.c                         | 2449 +++++++++++++-------
 drivers/media/i2c/ov8865.c                         |    2 +-
 drivers/media/i2c/ov9650.c                         |    4 +-
 drivers/media/pci/intel/ipu3/cio2-bridge.c         |   10 +-
 drivers/media/v4l2-core/Kconfig                    |    5 +
 drivers/media/v4l2-core/Makefile                   |    5 +-
 drivers/media/v4l2-core/v4l2-async.c               |   23 +-
 drivers/media/v4l2-core/v4l2-dev.c                 |    5 -
 .../media/ipu3/include/{ => uapi}/intel-ipu3.h     |    0
 drivers/staging/media/ipu3/ipu3-abi.h              |    2 +-
 drivers/staging/media/ipu3/ipu3-css-pool.h         |    1 +
 25 files changed, 2981 insertions(+), 950 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/renesas,isp.yaml
 create mode 100644 drivers/media/i2c/imx208.c
 rename drivers/staging/media/ipu3/include/{ => uapi}/intel-ipu3.h (100%)

-- 
Sakari Ailus
