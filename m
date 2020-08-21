Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7347D24DB87
	for <lists+linux-media@lfdr.de>; Fri, 21 Aug 2020 18:42:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728451AbgHUQm3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 21 Aug 2020 12:42:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728220AbgHUQmY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 21 Aug 2020 12:42:24 -0400
Received: from hillosipuli.retiisi.org.uk (hillosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::81:2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D2F7C061573
        for <linux-media@vger.kernel.org>; Fri, 21 Aug 2020 09:42:23 -0700 (PDT)
Received: from valkosipuli.localdomain (valkosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.org.uk (Postfix) with ESMTPS id D962B634C87
        for <linux-media@vger.kernel.org>; Fri, 21 Aug 2020 19:41:03 +0300 (EEST)
Received: from sailus by valkosipuli.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@retiisi.org.uk>)
        id 1k9A6B-00030D-N9
        for linux-media@vger.kernel.org; Fri, 21 Aug 2020 19:41:03 +0300
Date:   Fri, 21 Aug 2020 19:41:03 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     linux-media@vger.kernel.org
Subject: [GIT PULL v2 FOR 5.10] V4L2 fixes, cleanups and documentation
 improvements
Message-ID: <20200821164103.GN7145@valkosipuli.retiisi.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

Here's a pile of patches I dug from the depths of Patchwork. It's mostly
fixes but also a few cleanups as well as guide on writing camera sensor
drivers.

Since v1, I've done more tests and added a few more patches plus fixed a
commit ID in a Fixes: tag.

Please pull.


The following changes since commit 9a538b83612c8b5848bf840c2ddcd86dda1c8c76:

  media: venus: core: Add support for opp tables/perf voting (2020-08-18 15:55:56 +0200)

are available in the Git repository at:

  git://linuxtv.org/sailus/media_tree.git tags/for-5.10-1.1-signed

for you to fetch changes up to 10dc3647f36f54fdd39fa7c5143bd30a5969652d:

  media: ov5675: correct the maximum exposure value (2020-08-21 11:00:44 +0300)

----------------------------------------------------------------
V4L2 camera patches for 5.9

----------------------------------------------------------------
Alexander A. Klimov (1):
      media: omap: Replace HTTP links with HTTPS ones

Bingbu Cao (3):
      media: i2c: ov2740: get OTP data ready before nvmem registration
      MAINTAINERS: Fix email typo and correct name of Tianshu
      media: ov5675: correct the maximum exposure value

Colin Ian King (1):
      media: i2c: fix error check on max9286_read call

Hans Verkuil (1):
      imx274: fix frame interval handling

Jacopo Mondi (4):
      dt-bindings: media: ov5647: Convert to json-schema
      dt-bindings: media: ov5647: Document pwdn-gpios
      dt-bindings: media: ov5647: Document clock-noncontinuous
      media: MAINTAINERS: ov5647: Replace maintainer

Jordan Hand (1):
      media: ipu3.rst: Format media-ctl and yavta commands as code blocks

Kieran Bingham (1):
      MAINTAINERS: Fix sort order for RDACM20

Paul Kocialkowski (1):
      media: ov5640: Correct Bit Div register in clock tree diagram

Raag Jadav (1):
      media: ov7740: use SCCB regmap

Rahul Gottipati (1):
      media: intel-ipu3: Fix code style issue

Sakari Ailus (1):
      Documentation: media: Document how to write camera sensor drivers

Tom Rix (1):
      media: m5mols: Check function pointer in m5mols_sensor_power

 Documentation/admin-guide/media/ipu3.rst           | 104 ++++++++--------
 .../devicetree/bindings/media/i2c/ov5647.txt       |  35 ------
 .../devicetree/bindings/media/i2c/ov5647.yaml      |  88 ++++++++++++++
 Documentation/driver-api/media/camera-sensor.rst   | 134 +++++++++++++++++++++
 Documentation/driver-api/media/csi2.rst            |   2 +
 Documentation/driver-api/media/index.rst           |   1 +
 MAINTAINERS                                        |  12 +-
 drivers/media/i2c/Kconfig                          |   2 +-
 drivers/media/i2c/imx274.c                         |   8 +-
 drivers/media/i2c/m5mols/m5mols_core.c             |   3 +-
 drivers/media/i2c/max9286.c                        |   3 +-
 drivers/media/i2c/ov2740.c                         |  24 ++--
 drivers/media/i2c/ov5640.c                         |   2 +-
 drivers/media/i2c/ov5675.c                         |  15 ++-
 drivers/media/i2c/ov7740.c                         |  10 +-
 drivers/media/platform/omap3isp/isp.c              |   2 +-
 drivers/staging/media/ipu3/include/intel-ipu3.h    |  14 +--
 drivers/staging/media/omap4iss/iss.c               |   2 +-
 18 files changed, 330 insertions(+), 131 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/media/i2c/ov5647.txt
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ov5647.yaml
 create mode 100644 Documentation/driver-api/media/camera-sensor.rst

-- 
Kind regards,

Sakari Ailus
