Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 09F343F1880
	for <lists+linux-media@lfdr.de>; Thu, 19 Aug 2021 13:49:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238210AbhHSLuS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 Aug 2021 07:50:18 -0400
Received: from lahtoruutu.iki.fi ([185.185.170.37]:35912 "EHLO
        lahtoruutu.iki.fi" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238105AbhHSLuS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 Aug 2021 07:50:18 -0400
Received: from hillosipuli.retiisi.eu (89-27-100-251.bb.dnainternet.fi [89.27.100.251])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by lahtoruutu.iki.fi (Postfix) with ESMTPSA id E85791B00239
        for <linux-media@vger.kernel.org>; Thu, 19 Aug 2021 14:49:39 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
        t=1629373780;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=t2gyf4cFU/bzxrB0LCplScJCQuq/M2PLZ/+k1r4kXrM=;
        b=LyHkRdALpgYGDOx61SBqhDqNqUT8hX2DR6L90P9umgZRI4Xki6a3uiRNEWvOp25vrKQ6u3
        54THbIR0Qc3LopHRrOT45p+WPtBcL+NigX3BPXqi3ASuMhYFwJG/Ts4vvgDd/kbQkzarNO
        +JmeKHoWvSId5bK/uGkxTp5KLvGR/+YOG2fEAMFYK4amgAsy0ct6JNMS0nUZTUPvyQUc/G
        pGGs9UngM7FQlGDuzdeEdbZ6lPOwLuL6jjuzc4THn3Dccv+fFDPbpjB4956J3CyntSavY0
        mG9+8HCXDONfzFNg1F/A6Ap2MOyRt+QQi+fdzXQkR8Ez0RcDfpmBFVCJpdwmEA==
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 5D2BA634C91
        for <linux-media@vger.kernel.org>; Thu, 19 Aug 2021 14:49:39 +0300 (EEST)
Date:   Thu, 19 Aug 2021 14:49:39 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     linux-media@vger.kernel.org
Subject: [GIT PULL FOR 5.15] More V4L2 patches
Message-ID: <YR5FU/yKuX8Tx3y9@valkosipuli.retiisi.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=lahtoruutu; t=1629373780;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=t2gyf4cFU/bzxrB0LCplScJCQuq/M2PLZ/+k1r4kXrM=;
        b=R/QTkCh4YY9RQFcoS1R+zPL/kyV6iwens829/hjgGrc1kxQ4J6nhcQdJjJQYiz1YUQma06
        toLwE2SF1PS26GrSY+89tDvjfi19n7GW9kDwuKkKwtB+Rm1LT3rNec9wgMb70mfwGzxE7k
        yKyKfD+k5Cr/JB5U2V1BZEHJn0RjI8UcjkC6toO6o5GdpnicTQxtQUzQyr8RfiUI3rZJ/g
        E6I2Kcm+Zk98kWdTt0IhhYd6UKQZ7OFlIOQ/tg5K0juOoZcQCRRLk8qJw8Hx2kwJ9Hiq6Z
        Y1cZrSdwdI3Pe9PwE/gHa9BSP4PjU3yY4tN1ULoAEWNONYB9+9hs0sE+81Mbhw==
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1629373780; a=rsa-sha256;
        cv=none;
        b=WK2INeZqb0749C6cgAu0iYbZuBZaTQnUDvLM/miuYgJMqtXwSjS0P4qX5VdwO5H0fAkh/p
        XLdlOyHFfV2bRLrJfHkVjbmY12yYD6Vx7iBY42FqchTzNpBP3TXSDT6sjCjeDIz+UoTebz
        NianQTCOnrD5TepBALKFw9Gmdpj4vSa7rpMaVjNkPjLZJRBNTN02/MjD8xAt2SKRSl/VL9
        tVTXeeuys7wcIleDkDVRg9uKViA3tYwncHy5mSzaYpIei/uRzblt7brPbDpnOQbRL0z3b7
        8CX9MUy6XzdCP3EUnr5cqXSZz+jfJqhfA2z5730HlNonDYQ7BdWANMQeKD5bLQ==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

Here's a pile of more patche sfor 5.15. There's a new driver for the
ov13b10 camera sensor, a bunch of fixes and cleanups for the IPU3 CIO2 and
ImgU drivers as well as other drivers including gspca (a trivial fix),
stm32, ov8856 and imx258 drivers. Also renensas,imr bindings are converted
to json-schema.

Please pull.


The following changes since commit 19e95228c722ad458ef03f4a45e7740a640252f7:

  media: netup_unidvb: handle interrupt properly according to the firmware (2021-08-18 14:51:30 +0200)

are available in the Git repository at:

  git://linuxtv.org/sailus/media_tree.git tags/for-5.15-3-signed

for you to fetch changes up to 7835a2c0059629bd13150ac80cc293335a01d476:

  media: staging: document that Imgu not output auto-exposure statistics (2021-08-19 11:29:52 +0300)

----------------------------------------------------------------
V4L2 patches for 5.15

----------------------------------------------------------------
Andy Shevchenko (6):
      media: ipu3-cio2: Replace open-coded for_each_set_bit()
      media: ipu3-cio2: Use temporary storage for struct device pointer
      media: ipu3-cio2: Switch to use media_entity_to_video_device()
      media: ipu3-cio2: Introduce to_sensor_asd() helper macro
      media: ipu3-cio2: Introduce to_cio2_buffer() helper macro
      media: ipu3-cio2: Introduce to_cio2_device() helper macro

Arec Kao (1):
      Add sensor driver support for the ov13b10 camera.

Bingbu Cao (1):
      media: staging: document that Imgu not output auto-exposure statistics

David Plowman (2):
      media: v4l2-ctrls: Add V4L2_CID_NOTIFY_GAINS control
      media: v4l2-ctrls: Document V4L2_CID_NOTIFY_GAINS control

Dmitriy Ulitin (1):
      stm32: Potential NULL pointer dereference in dcmi_irq_thread()

Geert Uytterhoeven (1):
      dt-bindings: media: renesas,imr: Convert to json-schema

Gustavo A. R. Silva (1):
      media: staging/intel-ipu3: css: Fix wrong size comparison imgu_css_fw_init

Hsin-Yi Wang (1):
      media: ov8856: Set default mbus format but allow caller to alter

Nícolas F. R. A. Prado (1):
      media: ipu3.rst: Improve header formatting on tables

Sakari Ailus (1):
      imx258: Fix getting clock frequency

Shaokun Zhang (1):
      m5602_ov7660: remove the repeated declaration

 Documentation/admin-guide/media/ipu3.rst           |   14 +-
 .../devicetree/bindings/media/renesas,imr.txt      |   31 -
 .../devicetree/bindings/media/renesas,imr.yaml     |   67 +
 .../media/v4l/ext-ctrls-image-source.rst           |   20 +
 MAINTAINERS                                        |    7 +
 drivers/media/i2c/Kconfig                          |   10 +
 drivers/media/i2c/Makefile                         |    1 +
 drivers/media/i2c/imx258.c                         |   12 +-
 drivers/media/i2c/ov13b10.c                        | 1491 ++++++++++++++++++++
 drivers/media/i2c/ov8856.c                         |   83 +-
 drivers/media/pci/intel/ipu3/ipu3-cio2-main.c      |  247 ++--
 drivers/media/pci/intel/ipu3/ipu3-cio2.h           |    4 +
 drivers/media/platform/stm32/stm32-dcmi.c          |   19 +-
 drivers/media/usb/gspca/m5602/m5602_ov7660.h       |    1 -
 drivers/media/v4l2-core/v4l2-ctrls-defs.c          |    1 +
 .../staging/media/ipu3/include/uapi/intel-ipu3.h   |    7 +-
 drivers/staging/media/ipu3/ipu3-css-fw.c           |    7 +-
 drivers/staging/media/ipu3/ipu3-css-fw.h           |    2 +-
 include/uapi/linux/v4l2-controls.h                 |    1 +
 19 files changed, 1826 insertions(+), 199 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/media/renesas,imr.txt
 create mode 100644 Documentation/devicetree/bindings/media/renesas,imr.yaml
 create mode 100644 drivers/media/i2c/ov13b10.c

-- 
Sakari Ailus
