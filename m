Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9B2B9573D6C
	for <lists+linux-media@lfdr.de>; Wed, 13 Jul 2022 21:59:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236974AbiGMT7e (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 13 Jul 2022 15:59:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231772AbiGMT7b (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 13 Jul 2022 15:59:31 -0400
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [IPv6:2a0b:5c81:1c1::37])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43FD927CFA
        for <linux-media@vger.kernel.org>; Wed, 13 Jul 2022 12:59:30 -0700 (PDT)
Received: from hillosipuli.retiisi.eu (89-27-103-169.bb.dnainternet.fi [89.27.103.169])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by lahtoruutu.iki.fi (Postfix) with ESMTPSA id D63EA1B00358
        for <linux-media@vger.kernel.org>; Wed, 13 Jul 2022 22:59:28 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
        t=1657742368;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type;
        bh=u+NiCzyMjkHHmiHuh84SY92MgKkUvt3O8K7k27v7dS4=;
        b=Sn0mn+1Y2xxTlYgy3vdr8T2r2bmt7GGQRpVttGnN9fcLJVgMo800ArbSVqUrNI/ZcuI4iQ
        yfkFO/peqppoYTwVxEaRrvTbQIAbG034JoAaELkpBbpECKgz9LzbZDPyCnBVp4YnsKEBZB
        tzbDrjObzddV9kddMSwqvxoO6fs8Qxk1q3qWw7m8tP5y+qFuZuO7WHisFTeU7L7WyUSP16
        XOeCInjJMkptd0myKVBFvENycnVF4ojo/GjaDOydxythDeZRxooTBmLiMcg+xX62rxtBh4
        6uzTgFL4UHAkVClOXczmVTyDYoxQRNvvusW+Sm+JzLwEx5Gy+JlF0hNV46+SUg==
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 8549F634C98
        for <linux-media@vger.kernel.org>; Wed, 13 Jul 2022 22:59:28 +0300 (EEST)
Date:   Wed, 13 Jul 2022 22:59:28 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     linux-media@vger.kernel.org
Subject: [GIT PULL FOR 5.20] More V4L2 patches
Message-ID: <Ys8kICeZqicfr0mC@valkosipuli.retiisi.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1657742368; a=rsa-sha256;
        cv=none;
        b=EFSkTUbBNiBnP+iWG0luZx5HBXjZ/CGXP9vRLO1ZDzeiqE5F1XRA1fGowcRLFcFCWsQ373
        ZfsutavfqWhTqVgzEWg5394NNVDMMNxFgYehVDiInyKQ+TBiN+EMJy9eq9swDnt9/NWB0v
        Iimrpc1Z1453TklUGbg44uRgYFqlwJipMPWw63Qv0sNoG4GVI7aRD7V4+la64SlFLprMqq
        SbUs6Up1oTaesbHurNrtjXOUseNx/D+ajZjOXbPI/PZhvrXDWNJQ3wGWmukVTUNFw0zv+O
        ZxBcXCsUoX8wr6dp6CvqDBq2HOLM0IIOiBHI+aNYhEpR0Bn8dx0uaC4E881zMg==
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=lahtoruutu; t=1657742368;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type;
        bh=u+NiCzyMjkHHmiHuh84SY92MgKkUvt3O8K7k27v7dS4=;
        b=dlK8/KXhS0gXzHaFoI9bda9hDpAycBDJ5sgyCFxrg5mooZV6lVo5GLpBuqMrfaz85z6V+w
        JDQ/FvrgaHL1QGB1XdOYEwMbFGvjIpulvt14yWMIQoGwcfYgiWtOq07xDZj3kEEg1ygGHs
        8MFsKKxjqd9dFaXN4lZcONbR8TVM0IvetTxLbHRP3bJFV0UsTTKQbnbaGdsQXq70bPpQO/
        d56/VyEkDY4hyWkeyB0kqWE+WRHeDGsXSsn+1q37M0roVNZ23UnFKccwK7GzT2E0Td+VM0
        GFxhq7VdFDbz8i+l6gPLJgnhZmxI8F2mw/wMKEsg+9F5EWspC1WOCLLsVQh+ng==
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

Here's another set of V4L2 patches for 5.20. Hopefully it's not too late
for that yet.

Here are a few fixes and improvements to existing APIs and drivers. No new
drivers are included.

Please pull.


The following changes since commit e670f5d672ef3d00b0b8c69eff09a019e6dd4ef9:

  media: amphion: only insert the first sequence startcode for vc1l format (2022-07-08 18:18:49 +0100)

are available in the Git repository at:

  git://linuxtv.org/sailus/media_tree.git tags/for-5.20-2.1-signed

for you to fetch changes up to e927c9847d7aeb12c5853a4d84d58723f5b5db36:

  media: ov5693: add ov5693_of_match, dts support (2022-07-13 22:57:29 +0300)

----------------------------------------------------------------
More V4L2 patches for 5.20

----------------------------------------------------------------
Daniel Scally (2):
      media: entity: Add iterator for entity data links
      media: entity: Use dedicated data link iterator

Hans Verkuil (1):
      ar0521: fix Kconfig: VIDEO_V4L2 -> VIDEO_DEV

Laurent Pinchart (1):
      media: Replace dependency on VIDEO_V4L2_SUBDEV_API with select

Marek Vasut (1):
      media: mt9p031: Implement crop bounds get selection

Sakari Ailus (1):
      media: sunxi: Depend on GENERIC_PHY_MIPI_DPHY

Tomi Valkeinen (2):
      media: subdev: Add v4l2_subdev_call_state_try() macro
      media: stm32: dcmi: Fix subdev op call with uninitialized state

Tommaso Merciai (6):
      media: ov5693: count num_supplies using array_size
      media: ov5693: add dvdd into ov5693_supply_names array
      media: ov5693: rename clk into xvclk
      media: ov5693: add support for acpi clock-frequency prop
      media: dt-bindings: ov5693: document YAML binding
      media: ov5693: add ov5693_of_match, dts support

Yang Yingliang (1):
      media: ov7251: add missing disable functions on error in ov7251_set_power_on()

 .../devicetree/bindings/media/i2c/ovti,ov5693.yaml | 124 +++++++++++++++++++++
 MAINTAINERS                                        |   1 +
 drivers/media/i2c/Kconfig                          |   6 +-
 drivers/media/i2c/mt9p031.c                        |  20 +++-
 drivers/media/i2c/ov5693.c                         |  57 ++++++----
 drivers/media/i2c/ov7251.c                         |   2 +
 drivers/media/mc/mc-entity.c                       |  22 +++-
 drivers/media/platform/atmel/Kconfig               |   4 +-
 drivers/media/platform/st/stm32/stm32-dcmi.c       |  14 +--
 .../media/platform/sunxi/sun6i-mipi-csi2/Kconfig   |   1 +
 .../platform/sunxi/sun8i-a83t-mipi-csi2/Kconfig    |   1 +
 drivers/media/v4l2-core/Kconfig                    |   6 +-
 include/media/media-entity.h                       |  30 +++++
 include/media/v4l2-subdev.h                        |  34 ++++++
 14 files changed, 278 insertions(+), 44 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov5693.yaml

-- 
Sakari Ailus
