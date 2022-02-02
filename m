Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 38E944A72E9
	for <lists+linux-media@lfdr.de>; Wed,  2 Feb 2022 15:23:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233716AbiBBOWS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Feb 2022 09:22:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229775AbiBBOWR (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 2 Feb 2022 09:22:17 -0500
Received: from meesny.iki.fi (meesny.iki.fi [IPv6:2001:67c:2b0:1c1::201])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23637C061714
        for <linux-media@vger.kernel.org>; Wed,  2 Feb 2022 06:22:17 -0800 (PST)
Received: from hillosipuli.retiisi.eu (dkvn5pty0gzs3nltj987t-3.rev.dnainternet.fi [IPv6:2001:14ba:4457:9640:1e2d:1f75:a607:ef37])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by meesny.iki.fi (Postfix) with ESMTPSA id 9DAA02004C
        for <linux-media@vger.kernel.org>; Wed,  2 Feb 2022 16:22:15 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
        t=1643811735;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type;
        bh=zC1TjTj4KlJ13TohuUK0XoOCh6PMWpRPDMvLTLlYsi4=;
        b=gSp1dZ5DB7ffGYC/MK1XNAY4J+5ANDwXlY8/r8SqEBr5OdREPWrSrhNeIBp5x+tGUTHazg
        thPYdTaQOdi1r30T+f5umMYB653+6fdfKl9+rjKPlQEEiQS8JP0gPmw+nq3sOYv98kVD+j
        LTqwebrZjwltLzFzBJPw7UNUKOapirE=
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 35C03634C90
        for <linux-media@vger.kernel.org>; Wed,  2 Feb 2022 16:22:15 +0200 (EET)
Date:   Wed, 2 Feb 2022 16:22:15 +0200
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     linux-media@vger.kernel.org
Subject: [GIT PULL v3 FOR 5.18] V4L2 patches
Message-ID: <YfqTl5GBCDRDLXl1@valkosipuli.retiisi.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1643811735; a=rsa-sha256; cv=none;
        b=FblsCyVE7NaOBzD7HlmREjIwyPQPS9VJsz4uvUAqu6fb9C78ZT/EEsGa4LfAihFnmlbC1R
        dMIstCZkEnBSlhGR2WoRVn+p9tdR19N8NMWwSZwtny481mh9ZU6kbrXoYVIodRnm1pd0Yq
        woJM+Pd5K/IkhBFeeM7IH6Zdaxdkhho=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=meesny; t=1643811735;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type;
        bh=zC1TjTj4KlJ13TohuUK0XoOCh6PMWpRPDMvLTLlYsi4=;
        b=ZabfSh7DQgNp8qZIYGIE9LrJzD8orArjELsvNULaITL6n6tOnOPRKYTD+xBvaflWdDO4qj
        eTsiDmI/q2i9ePe65LCasgHAb60Xn8rJrx7s5Yv+KqUAQl7FVrbM2LxCO1nUoPTUdkOn0o
        mu0dMUh+ONgFonS3DOQ9vhU38VIGhqA=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

Here's a bunch of patches again for 5.18. Most notably there's V4L2 fwnode
/ mbus_config cleanup by Laurent, the hi847 camera sensor driver from Shawn
Tu and the od08d10 camera sensor driver by Jimmy Su. Fixes elsewhere are
included, too.

Since v1, a few more patches have been added and I've dropped a camss patch
already picked by Hans.

Since v2, I've added a new patch to prepare the ov6650 driver for
get_mbus_config() changes by Laurent. Also other fixes have been added,
effectively the rest of the patches. This is now on the media stage tree as
it depends on other patches there.

Please pull.


The following changes since commit 68a99f6a0ebfe9101ea79ba5af1c407a5ad4f629:

  media: lirc: report ir receiver overflow (2022-01-28 19:32:50 +0100)

are available in the Git repository at:

  git://linuxtv.org/sailus/media_tree.git tags/for-5.18-1.2-signed

for you to fetch changes up to 63e1437181c45a2b74d2e1f2c852381f0ccff20b:

  media: i2c: ov08d10: Unlock on error in ov08d10_enum_frame_size() (2022-02-02 15:44:33 +0200)

----------------------------------------------------------------
More V4L2 camera patches

----------------------------------------------------------------
Bingbu Cao (1):
      media: ov5675: use group write to update digital gain

Dan Carpenter (1):
      media: i2c: ov08d10: Unlock on error in ov08d10_enum_frame_size()

Kees Cook (1):
      media: omap3isp: Use struct_group() for memcpy() region

Laurent Pinchart (4):
      media: v4l2-mediabus: Use structures to describe bus configuration
      media: v4l2-mediabus: Drop legacy V4L2_MBUS_CSI2_*_LANE flags
      media: v4l2-mediabus: Drop legacy V4L2_MBUS_CSI2_CHANNEL_* flags
      media: v4l2-mediabus: Drop V4L2_MBUS_CSI2_CONTINUOUS_CLOCK flag

Martin Kepplinger (2):
      dt-binding: media: hynix,hi846: use $defs/port-base port description
      dt-bindings: media: hynix,hi846: add link-frequencies description

Sakari Ailus (1):
      microchip-csi2dc: Remove VC support for now

 .../devicetree/bindings/media/i2c/hynix,hi846.yaml |  6 ++-
 drivers/gpu/ipu-v3/ipu-csi.c                       |  6 +--
 drivers/media/i2c/adv7180.c                        | 10 ++---
 drivers/media/i2c/adv748x/adv748x-csi2.c           | 18 +--------
 drivers/media/i2c/ml86v7667.c                      |  5 ++-
 drivers/media/i2c/mt9m001.c                        |  8 ++--
 drivers/media/i2c/mt9m111.c                        | 14 ++++---
 drivers/media/i2c/ov08d10.c                        |  4 +-
 drivers/media/i2c/ov5675.c                         | 32 ++++++++++++++--
 drivers/media/i2c/ov6650.c                         | 14 +++----
 drivers/media/i2c/ov9640.c                         |  8 ++--
 drivers/media/i2c/tc358743.c                       | 24 ++----------
 drivers/media/i2c/tvp5150.c                        |  6 ++-
 drivers/media/platform/atmel/microchip-csi2dc.c    | 20 ++--------
 drivers/media/platform/omap3isp/ispstat.c          |  5 ++-
 drivers/media/platform/pxa_camera.c                | 12 +++---
 drivers/media/platform/rcar-vin/rcar-csi2.c        | 16 ++------
 drivers/media/v4l2-core/v4l2-fwnode.c              |  6 +--
 drivers/staging/media/imx/imx-media-csi.c          |  7 ++--
 drivers/staging/media/imx/imx6-mipi-csi2.c         | 25 ++----------
 include/media/v4l2-mediabus.h                      | 44 +++++++++-------------
 include/uapi/linux/omap3isp.h                      | 21 +++++++----
 22 files changed, 138 insertions(+), 173 deletions(-)

-- 
Kind regards,

Sakari Ailus
