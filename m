Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DDC0B34CDDB
	for <lists+linux-media@lfdr.de>; Mon, 29 Mar 2021 12:21:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231379AbhC2KVR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 29 Mar 2021 06:21:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231701AbhC2KVC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 29 Mar 2021 06:21:02 -0400
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [IPv6:2a0b:5c81:1c1::37])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0320C061574
        for <linux-media@vger.kernel.org>; Mon, 29 Mar 2021 03:21:01 -0700 (PDT)
Received: from hillosipuli.retiisi.eu (213-243-181-26.bb.dnainternet.fi [213.243.181.26])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by lahtoruutu.iki.fi (Postfix) with ESMTPSA id CB83F1B00115
        for <linux-media@vger.kernel.org>; Mon, 29 Mar 2021 13:20:58 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
        t=1617013258;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type;
        bh=0l/C3iRPeytdbZZ8MyhHH0q5GLPhNz1ZCygX3tY+g3c=;
        b=KKG2o+9D2WmaOKiG4mUD46K87KocCEwfWlPnlFBppbB9Ocxvu5O0Rb9lvzGEY/WONRxSYI
        XzkVqM871SfgFRy6ihXxY1eXlhpDS99xLQWIW0Ymo36QUvqSNYXWVr0MFcAI0KY3bfNyY2
        fRQ9APD25JUp7Ue6UP6uvki0PNFOWJqXJkbrLj8bdsAV907NvgsobppYvlWxbRpoggGuk0
        r0hT4/QfaRnRQNxxG1vp21tn/vjKTfpXnDATSF66QRN+IC/OwWCvMTUDafWyGCsFhRCEHk
        iDeUSPwRiUkBdMRx7Me+8pzIXEvJZZQeBPr+DqTdgf1AnhlglocIkrlN2Xbi5w==
Received: from valkosipuli.localdomain (valkosipuli.localdomain [IPv6:fd35:1bc8:1a6:d3d5::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 23CD5634C87
        for <linux-media@vger.kernel.org>; Mon, 29 Mar 2021 13:20:50 +0300 (EEST)
Received: from localhost ([127.0.0.1] helo=valkosipuli.retiisi.eu)
        by valkosipuli.localdomain with esmtp (Exim 4.92)
        (envelope-from <sakari.ailus@iki.fi>)
        id 1lQp0y-0000eQ-SV
        for linux-media@vger.kernel.org; Mon, 29 Mar 2021 13:20:56 +0300
Date:   Mon, 29 Mar 2021 13:20:56 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     linux-media@vger.kernel.org
Subject: [GIT PULL for 5.13] V4L2 camera patches
Message-ID: <20210329102056.GA3@valkosipuli.retiisi.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=lahtoruutu; t=1617013258;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type;
        bh=0l/C3iRPeytdbZZ8MyhHH0q5GLPhNz1ZCygX3tY+g3c=;
        b=skx/Q21bz4zHnwJKuT5vnINrejw38qsNI4F2WYRzJG4JDKSruqeKm30dSKnLK8kqA9OzKN
        x/KyYfkm0jtDGn8wV5XLEiD0dexvVaJn5asGHCZDRPmWbdqIwJ3a/H6MaEbwsPRUXXr6Jj
        PMTEFriSifWLgiTQtcqWYJvn2sN2wQ6+2daQZ5XL17IaYrIjn0ONcO1rvWUrTfNxHrXiOk
        naAHgXM8bZ+8h+3YMxmQV7tfaGWIMLOycHqqzFa1x9TZxjxIuT2dx4kr1RVfeJnMYu6afy
        GW19LPXbXF9DmhnqWGC/AXrTGXWByrkg642JnrvxxIP16prYcYLPFyi/+9bwOA==
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1617013258; a=rsa-sha256;
        cv=none;
        b=iYRlYhxHrJuOL5coew99WiPg5iL0uGYPYuoP3xGtGcpvkFZH8EBH8ZhIeS3eWPYbM9MTK0
        EZf2rwKpd6yt2BGTsb3HdLC00SKIq+bIeaqWICfizlTCb3EGSg8lW0l09TRXcWLw5XkvuW
        HirfJYVo3q0HTpag1TTDo/EnrxvzoR+vdg80yjyJcdS6zLLeEqYf6UUgDTIMYZFcIXFK1p
        vDT0lUch6Pf7JFzb/tj0KK67ZxEApFYlkzcfG8IuZOb7M67qOkN1cct7c1uOgY/iMtHg3I
        Iv9gGKMpqMv1ssV90wzq1cbWwU5pzsOGoaeYlgSrQz76CsR04OMqGYzcLRiHxA==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

Here's a bunch of V4L2 patches for 5.13.

There are fixes and imporovements  for the ccs, ipu3, imx219, imx258 and
imx274 drivers, among other things, cleanups and documentation
improvements. Also added a note on media graph walk documentation that it
requires the graph mutex, something that was assumed previously but not
documented. Omap3isp and omap4iss drivers were fixed to take that into
account, too.

I postponed some V4L2 fwnode API imrovements until I have time to address
some comments on them, and send another pull request next week.

Please pull.


The following changes since commit 1cb3ff130f4d97dec2d1bee968a87f5d6e24dd60:

  media: imx: imx7_mipi_csis: Print shadow registers in mipi_csis_dump_regs() (2021-03-11 11:59:53 +0100)

are available in the Git repository at:

  git://linuxtv.org/sailus/media_tree.git tags/for-5.13-1.1-signed

for you to fetch changes up to aa0d667b0f864a973650a49ca341440637fa4ee8:

  staging: ipu3-imgu: No need for kernel-doc comments in driver struct (2021-03-29 13:16:33 +0300)

----------------------------------------------------------------
V4L2 patches for 5.13

----------------------------------------------------------------
Hans Verkuil (2):
      i2c/ccs: fix kernel-doc header issues
      staging: media: ipu3: add missing kernel-doc 'struct' keywords

Jia-Ju Bai (1):
      media: i2c: imx274: fix error return code of imx274_s_frame_interval()

Krzysztof Kozlowski (1):
      media: i2c: imx258: add HDR control

Lad Prabhakar (2):
      media: i2c: imx219: Move out locking/unlocking of vflip and hflip controls from imx219_set_stream
      media: i2c: imx219: Balance runtime PM use-count

Laurent Pinchart (1):
      media: staging: ipu3: uapi: Add "WITH Linux-syscall-note" license

Ricardo Ribalda (1):
      media: staging/intel-ipu3: Fix set_fmt error handling

Sakari Ailus (8):
      ccs: Fix sub-device function
      ipu3-cio2: Fix pixel-rate derived link frequency
      omap3isp: Acquire graph mutex for graph traversal
      omap4iss: Acquire graph mutex for graph traversal
      media: entity: Add lockdep check to media graph walk
      v4l: fwnode: Rename and make static V4L2 async notifier helper
      v4l: fwnode: Rename v4l2_async_register_subdev_sensor_common
      staging: ipu3-imgu: No need for kernel-doc comments in driver struct

Tom Rix (1):
      s5k5baf: remove trailing semicolon in macro definition

Yang Li (2):
      media: i2c: remove unneeded semicolon
      media: i2c: remove unneeded variable 'ret'

 Documentation/driver-api/media/v4l2-subdev.rst  |  2 +-
 drivers/media/i2c/ccs/ccs-core.c                |  6 +--
 drivers/media/i2c/ccs/ccs-data.h                |  2 +-
 drivers/media/i2c/ccs/ccs-quirk.h               |  4 +-
 drivers/media/i2c/et8ek8/et8ek8_driver.c        |  2 +-
 drivers/media/i2c/hi556.c                       |  2 +-
 drivers/media/i2c/imx214.c                      |  2 +-
 drivers/media/i2c/imx219.c                      | 51 +++++++++++++++----------
 drivers/media/i2c/imx258.c                      | 30 ++++++++++++++-
 drivers/media/i2c/imx274.c                      |  3 +-
 drivers/media/i2c/imx319.c                      |  2 +-
 drivers/media/i2c/imx334.c                      |  2 +-
 drivers/media/i2c/imx355.c                      |  2 +-
 drivers/media/i2c/ov02a10.c                     |  2 +-
 drivers/media/i2c/ov13858.c                     |  2 +-
 drivers/media/i2c/ov2740.c                      |  2 +-
 drivers/media/i2c/ov5640.c                      |  2 +-
 drivers/media/i2c/ov5648.c                      |  2 +-
 drivers/media/i2c/ov5670.c                      |  2 +-
 drivers/media/i2c/ov5675.c                      |  2 +-
 drivers/media/i2c/ov5695.c                      |  2 +-
 drivers/media/i2c/ov8856.c                      |  2 +-
 drivers/media/i2c/ov8865.c                      |  5 +--
 drivers/media/i2c/ov9734.c                      |  2 +-
 drivers/media/i2c/s5k5baf.c                     |  2 +-
 drivers/media/mc/mc-entity.c                    |  1 +
 drivers/media/pci/intel/ipu3/ipu3-cio2-main.c   |  2 +-
 drivers/media/platform/omap3isp/isp.c           | 16 +++++++-
 drivers/media/v4l2-core/v4l2-fwnode.c           | 31 +++++++++++----
 drivers/staging/media/ipu3/include/intel-ipu3.h |  2 +-
 drivers/staging/media/ipu3/ipu3-css-pool.h      |  4 +-
 drivers/staging/media/ipu3/ipu3-v4l2.c          |  5 +++
 drivers/staging/media/ipu3/ipu3.h               |  5 ---
 drivers/staging/media/omap4iss/iss.c            |  5 +++
 drivers/staging/media/omap4iss/iss_video.c      |  3 ++
 include/media/media-entity.h                    |  5 +++
 include/media/v4l2-async.h                      | 12 +++---
 include/media/v4l2-fwnode.h                     | 21 ----------
 38 files changed, 155 insertions(+), 94 deletions(-)

-- 
Sakari Ailus
