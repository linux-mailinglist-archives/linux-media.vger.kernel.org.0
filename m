Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 23D4C4C2E70
	for <lists+linux-media@lfdr.de>; Thu, 24 Feb 2022 15:31:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235143AbiBXObl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 24 Feb 2022 09:31:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231404AbiBXObk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 24 Feb 2022 09:31:40 -0500
Received: from meesny.iki.fi (meesny.iki.fi [IPv6:2001:67c:2b0:1c1::201])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54E0017C41B
        for <linux-media@vger.kernel.org>; Thu, 24 Feb 2022 06:31:09 -0800 (PST)
Received: from hillosipuli.retiisi.eu (dkvn5pty0gzs3nltj987t-3.rev.dnainternet.fi [IPv6:2001:14ba:4457:9640:1e2d:1f75:a607:ef37])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by meesny.iki.fi (Postfix) with ESMTPSA id 02C332005B
        for <linux-media@vger.kernel.org>; Thu, 24 Feb 2022 16:31:06 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
        t=1645713066;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type;
        bh=GqGUFqTUZHqMI8HDjgdCT7MmIt54BKO8pUfCCuTvHkQ=;
        b=NUcz6XlaUeqnejqfSXsRA8viK0wIru8rkQzt0olt2y5VNKvzg4xK1Y6dH6prIKFqs0dcP9
        cefMMhj5N4p7PwPdauiPo+vtEXx7AYqOzy4BuRQ4AAEYQpKy9ufoT0+uQos8BvTYtrynrx
        xsXwePlvF8q9FEClbEf69A/GUvI2QeA=
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 618A7634C90
        for <linux-media@vger.kernel.org>; Thu, 24 Feb 2022 16:31:05 +0200 (EET)
Date:   Thu, 24 Feb 2022 16:31:05 +0200
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     linux-media@vger.kernel.org
Subject: [GIT PULL v2 FOR 5.18] More V4L2 patches
Message-ID: <YheWqQBjLtUXR5Xb@valkosipuli.retiisi.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1645713066; a=rsa-sha256; cv=none;
        b=e+rb0K/FMp88+6d33b5+yKQ4+lhsbxFJ84Yn78jRFbEjdZjZi+oTUYAw5KdCZrTjGRyw0u
        tS8YU5k/UPcxLtV8BeqEQylqaPmYsnyg31Pv9ZpDu7Sa9N7Yb9/rVmMQafIoF9CR3xaES6
        gf4nav3nCp7uP0A11XiS9rzeQ/m8DgU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=meesny; t=1645713066;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type;
        bh=GqGUFqTUZHqMI8HDjgdCT7MmIt54BKO8pUfCCuTvHkQ=;
        b=xlPXwE/37KPsKsGzzjR4QpvXTGcqjKtmFyUoGI8DSjX2FS+oO8sG6EMQnNlVvszQKhT+Q4
        dhnXRW7sxnNupyWqFIenTqgx7hfoWWdxMBrsBbEo7lhSAHz18Y4TyRoa6rbm3CezY8ZmCF
        HrlnyYvZ2QvU9aaaRda7Mp3UYxBOBn0=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
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

Since v1:

- Drop isl7998x driver from this PR, add Laurent's MC documentation patch.

Please pull.


The following changes since commit 2b891d3980f6c255459d0e1c29ce2152ec7cf678:

  media: xilinx: csi2rxss: Use mipi-csi2.h (2022-02-17 10:32:26 +0100)

are available in the Git repository at:

  git://linuxtv.org/sailus/media_tree.git tags/for-5.18-2.3-signed

for you to fetch changes up to b13f1fdb898ed8f973359b5e380bb69ebbacbecc:

  media: media-entity: Clarify media_entity_cleanup() usage (2022-02-24 16:21:42 +0200)

----------------------------------------------------------------
V4L2 patches for 5.18

----------------------------------------------------------------
Daniel Scally (1):
      media: i2c: Fix pixel array positions in ov8865

Hans de Goede (1):
      media: i2c: ov5648: Fix lockdep error

Laurent Pinchart (3):
      media: media-entity: Add media_pad_is_streaming() helper function
      media: media-entity: Simplify media_pipeline_start()
      media: media-entity: Clarify media_entity_cleanup() usage

Linus Walleij (2):
      media: i2c: ccs: Drop unused include
      media: i2c: imx274: Drop surplus includes

Mirela Rabulea (1):
      media: ov5640: Fix set format, v4l2_mbus_pixelcode not updated

Sakari Ailus (2):
      v4l: fwnode: Drop redunant -ENODATA check in property reference parsing
      v4l: fwnode: Remove now-redundant loop from v4l2_fwnode_parse_reference()

Shawn Tu (1):
      media: Add a driver for the og01a1b camera sensor

 MAINTAINERS                                   |    6 +
 drivers/media/i2c/Kconfig                     |   13 +
 drivers/media/i2c/Makefile                    |    1 +
 drivers/media/i2c/ccs/ccs-core.c              |    1 -
 drivers/media/i2c/imx274.c                    |    2 -
 drivers/media/i2c/og01a1b.c                   | 1128 +++++++++++++++++++++++++
 drivers/media/i2c/ov5640.c                    |   14 +-
 drivers/media/i2c/ov5648.c                    |   10 +-
 drivers/media/i2c/ov8865.c                    |    4 +-
 drivers/media/mc/mc-entity.c                  |   55 +-
 drivers/media/platform/exynos4-is/common.c    |    5 +-
 drivers/media/platform/exynos4-is/fimc-isp.c  |    2 +-
 drivers/media/platform/exynos4-is/fimc-lite.c |    6 +-
 drivers/media/platform/rcar-vin/rcar-core.c   |    2 +-
 drivers/media/v4l2-core/v4l2-fwnode.c         |   28 +-
 include/media/media-entity.h                  |   25 +-
 16 files changed, 1225 insertions(+), 77 deletions(-)
 create mode 100644 drivers/media/i2c/og01a1b.c

-- 
Sakari Ailus
