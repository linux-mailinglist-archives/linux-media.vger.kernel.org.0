Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3D62A4CCF2B
	for <lists+linux-media@lfdr.de>; Fri,  4 Mar 2022 08:40:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238876AbiCDHkv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 4 Mar 2022 02:40:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232100AbiCDHkt (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 4 Mar 2022 02:40:49 -0500
Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AAE1F18C786
        for <linux-media@vger.kernel.org>; Thu,  3 Mar 2022 23:40:01 -0800 (PST)
Received: from hillosipuli.retiisi.eu (89-27-103-169.bb.dnainternet.fi [89.27.103.169])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by meesny.iki.fi (Postfix) with ESMTPSA id 96D042016C
        for <linux-media@vger.kernel.org>; Fri,  4 Mar 2022 09:39:59 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
        t=1646379599;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type;
        bh=0LYeQPPBjlk7EZdsfO+anecR5EXaZwZDmhprLiOepw0=;
        b=JUm99UVqgKxuCfcWG5KxVaXwf/l/9PEeoHL0ZTEnOmStfEVfO3XTnT475wSiVmccx/Zzsy
        Uh+dR8d4qLBlCFaanXa9Z+X2UrfNpijJWcVjPPNFG7ZOzBpXdRQTKkZz0OZXF7UQ+mc/Hb
        NWj+hY+cJVu/xdM2LwStgIzDXtKrC28=
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 0D8A2634C90
        for <linux-media@vger.kernel.org>; Fri,  4 Mar 2022 09:39:58 +0200 (EET)
Date:   Fri, 4 Mar 2022 09:39:58 +0200
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     linux-media@vger.kernel.org
Subject: [GIT PULL v3 FOR 5.18] Even yet more V4L2 patches
Message-ID: <YiHCTill0+2zBBTm@valkosipuli.retiisi.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1646379599; a=rsa-sha256; cv=none;
        b=lK6ROcDQUnOOqtsLjmKAzCkOBI9/sj14TC174CRk4gTBcUp8a4gsN2HVyQcjbCtcgaKgaK
        Ff8RXDOwYGfCA8pX9qZmLg3W99823XxijSp6OZlhQL399RJZsoLwzucq6NYNhllrHOT/D9
        m7LbVPwJhaprn4QyTF23+BbFZkYYzIM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=meesny; t=1646379599;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type;
        bh=0LYeQPPBjlk7EZdsfO+anecR5EXaZwZDmhprLiOepw0=;
        b=JcXzPeIK3c8BE7RwQPTCB2sKWRBJ0HAWqL2aPBzS4Fj2keAYBQqDp2FgRtqYuJRrPyuC5H
        O2BcE1D9VSaBMVdeez2143RQvU4VWC3PcYBzQMi9c9Q7lYg5s2lNsc7ACmPaVdtTQfvSLm
        CR5PKzy5/OJofZq/Lu88H0dEcJ1FUy4=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

Here's a nice set of mostly camera related patches for 5.18. Worth noting
are especially new drivers for isl7998x analogue to CSI-2/BT.656 decoder
and og01a1b camera sensor. Also included are cleanups for V4L2 fwnode
reference parsing and stream control internals in MC, as well as various
driver fixes and cleanups.

Since v2:

- Add all Linus's sensor driver gpiod patches.
- New version of the ov8865 pixel array position patch.
- Added isl799x driver back, with fixes.

Since v1:

- Drop isl7998x driver from this PR, add Laurent's MC documentation patch.

Please pull.


The following changes since commit 2b891d3980f6c255459d0e1c29ce2152ec7cf678:

  media: xilinx: csi2rxss: Use mipi-csi2.h (2022-02-17 10:32:26 +0100)

are available in the Git repository at:

  git://linuxtv.org/sailus/media_tree.git tags/for-5.18-2.6-signed

for you to fetch changes up to 3d1e4228c9dd5c945a5cb621749f358766ee5777:

  media: i2c: Fix pixel array positions in ov8865 (2022-03-04 09:36:28 +0200)

----------------------------------------------------------------
Even yet more V4L2 patches for 5.18

----------------------------------------------------------------
Daniel Scally (1):
      media: i2c: Fix pixel array positions in ov8865

Hans de Goede (1):
      media: i2c: ov5648: Fix lockdep error

Laurent Pinchart (3):
      media: media-entity: Add media_pad_is_streaming() helper function
      media: media-entity: Simplify media_pipeline_start()
      media: media-entity: Clarify media_entity_cleanup() usage

Linus Walleij (7):
      media: i2c: ccs: Drop unused include
      media: i2c: imx274: Drop surplus includes
      media: adv7511: Drop unused include
      media: mt9m111: Drop unused include
      media: noon010p30: Convert to use GPIO descriptors
      media: m5mols: Convert to use GPIO descriptors
      media: adv7183: Convert to GPIO descriptors

Marek Vasut (2):
      media: dt-bindings: Add Intersil ISL79987 DT bindings
      media: i2c: isl7998x: Add driver for Intersil ISL7998x

Mirela Rabulea (1):
      media: ov5640: Fix set format, v4l2_mbus_pixelcode not updated

Sakari Ailus (2):
      v4l: fwnode: Drop redunant -ENODATA check in property reference parsing
      v4l: fwnode: Remove now-redundant loop from v4l2_fwnode_parse_reference()

Shawn Tu (1):
      media: Add a driver for the og01a1b camera sensor

 .../bindings/media/i2c/isil,isl79987.yaml          |  113 ++
 MAINTAINERS                                        |   14 +
 drivers/media/i2c/Kconfig                          |   23 +
 drivers/media/i2c/Makefile                         |    2 +
 drivers/media/i2c/adv7183.c                        |   51 +-
 drivers/media/i2c/adv7511-v4l2.c                   |    1 -
 drivers/media/i2c/ccs/ccs-core.c                   |    1 -
 drivers/media/i2c/imx274.c                         |    2 -
 drivers/media/i2c/isl7998x.c                       | 1628 ++++++++++++++++++++
 drivers/media/i2c/m5mols/m5mols.h                  |    2 +
 drivers/media/i2c/m5mols/m5mols_capture.c          |    1 -
 drivers/media/i2c/m5mols/m5mols_core.c             |   29 +-
 drivers/media/i2c/mt9m111.c                        |    1 -
 drivers/media/i2c/noon010pc30.c                    |   75 +-
 drivers/media/i2c/og01a1b.c                        | 1128 ++++++++++++++
 drivers/media/i2c/ov5640.c                         |   14 +-
 drivers/media/i2c/ov5648.c                         |   10 +-
 drivers/media/i2c/ov8865.c                         |    4 +-
 drivers/media/mc/mc-entity.c                       |   55 +-
 drivers/media/platform/exynos4-is/common.c         |    5 +-
 drivers/media/platform/exynos4-is/fimc-isp.c       |    2 +-
 drivers/media/platform/exynos4-is/fimc-lite.c      |    6 +-
 drivers/media/platform/rcar-vin/rcar-core.c        |    2 +-
 drivers/media/v4l2-core/v4l2-fwnode.c              |   28 +-
 include/media/i2c/m5mols.h                         |    4 -
 include/media/i2c/noon010pc30.h                    |    4 -
 include/media/media-entity.h                       |   25 +-
 include/uapi/linux/v4l2-controls.h                 |    6 +
 28 files changed, 3063 insertions(+), 173 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/isil,isl79987.yaml
 create mode 100644 drivers/media/i2c/isl7998x.c
 create mode 100644 drivers/media/i2c/og01a1b.c

-- 
Sakari Ailus
