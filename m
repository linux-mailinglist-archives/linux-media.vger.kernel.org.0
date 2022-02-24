Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7FE9A4C2697
	for <lists+linux-media@lfdr.de>; Thu, 24 Feb 2022 09:49:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231589AbiBXItC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 24 Feb 2022 03:49:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230335AbiBXItB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 24 Feb 2022 03:49:01 -0500
X-Greylist: delayed 44592 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 24 Feb 2022 00:48:31 PST
Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6FFC5714D
        for <linux-media@vger.kernel.org>; Thu, 24 Feb 2022 00:48:31 -0800 (PST)
Received: from hillosipuli.retiisi.eu (dkvn5pty0gzs3nltj987t-3.rev.dnainternet.fi [IPv6:2001:14ba:4457:9640:1e2d:1f75:a607:ef37])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by meesny.iki.fi (Postfix) with ESMTPSA id A5B952004E
        for <linux-media@vger.kernel.org>; Thu, 24 Feb 2022 10:48:29 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
        t=1645692509;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type;
        bh=1EJfEx/xCBWzhAUsHy8cmUjN0QkXD0nbLts5VVYRf88=;
        b=BHu7xx8S2ULRC81wpWEmcZLQqs8EF5qmrYJeeQ6tfqvnec/Dmq2rViUdpvp7bkDeB4TuKu
        NpupsFyMbRsYI2CzsTuYQW4KLYJidjLS+hQgcVENWf8zldUVcgtn4TbvWp7Iynsi2SK0FO
        JDx/RFjZzgV/1IrK4acqcpsIzNHYlRM=
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 2BA5D634C90
        for <linux-media@vger.kernel.org>; Thu, 24 Feb 2022 10:48:29 +0200 (EET)
Date:   Thu, 24 Feb 2022 10:48:29 +0200
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     linux-media@vger.kernel.org
Subject: [GIT PULL FOR 5.18] More V4L2 patches
Message-ID: <YhdGXZL3xpfld/JQ@valkosipuli.retiisi.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1645692509; a=rsa-sha256; cv=none;
        b=Bh689HvSb9vnKCHtdm4/cdwrihkStu8zokFWD/yI37PmKjX61PBz1vx6i8JflSha7lBy0A
        V4v2cWKCWGbGDMu6QcvhbzJW/Z7f6tkkgmIKMUWb0zzYb4fz9yrlNllG8nHR7roaPJ+Ebj
        ywdWFRT6InF7hIWpsyVH+/yH/qKRD+A=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=meesny; t=1645692509;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type;
        bh=1EJfEx/xCBWzhAUsHy8cmUjN0QkXD0nbLts5VVYRf88=;
        b=VSFJe1USqsXBKC+LloqSt/JZ8lblBWLGJXlZ0Lef+hx9dPJnueXatC/V0/QuLoW0+VyBzN
        TE0lNqwflsu9PYfgke74o8iCYEdm9fS1/XUK4debCSPMPWvAoPIRK02jb3XM+C/TEQ066t
        VzlQvt1pEq3bNhlCOntAWxaif/w84+Y=
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

Please pull.


The following changes since commit 2b891d3980f6c255459d0e1c29ce2152ec7cf678:

  media: xilinx: csi2rxss: Use mipi-csi2.h (2022-02-17 10:32:26 +0100)

are available in the Git repository at:

  git://linuxtv.org/sailus/media_tree.git tags/for-5.18-2.1-signed

for you to fetch changes up to ba81a4fce9cdc59d32646d802a91a5164e77321c:

  media: i2c: imx274: Drop surplus includes (2022-02-23 22:05:19 +0200)

----------------------------------------------------------------
V4L2 patches for 5.18

----------------------------------------------------------------
Daniel Scally (1):
      media: i2c: Fix pixel array positions in ov8865

Hans de Goede (1):
      media: i2c: ov5648: Fix lockdep error

Laurent Pinchart (2):
      media: media-entity: Add media_pad_is_streaming() helper function
      media: media-entity: Simplify media_pipeline_start()

Linus Walleij (2):
      media: i2c: ccs: Drop unused include
      media: i2c: imx274: Drop surplus includes

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
 drivers/media/i2c/ccs/ccs-core.c                   |    1 -
 drivers/media/i2c/imx274.c                         |    2 -
 drivers/media/i2c/isl7998x.c                       | 1630 ++++++++++++++++++++
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
 include/media/media-entity.h                       |   21 +-
 include/uapi/linux/v4l2-controls.h                 |    6 +
 19 files changed, 2989 insertions(+), 77 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/isil,isl79987.yaml
 create mode 100644 drivers/media/i2c/isl7998x.c
 create mode 100644 drivers/media/i2c/og01a1b.c

-- 
Sakari Ailus
