Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A04564766D8
	for <lists+linux-media@lfdr.de>; Thu, 16 Dec 2021 01:11:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232265AbhLPALp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Dec 2021 19:11:45 -0500
Received: from meesny.iki.fi ([195.140.195.201]:55314 "EHLO meesny.iki.fi"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231740AbhLPALp (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Dec 2021 19:11:45 -0500
Received: from hillosipuli.retiisi.eu (89-27-103-169.bb.dnainternet.fi [89.27.103.169])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by meesny.iki.fi (Postfix) with ESMTPSA id 2050020180
        for <linux-media@vger.kernel.org>; Thu, 16 Dec 2021 02:11:43 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
        t=1639613503;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type;
        bh=sB/hc4DaCYfGwf45ejsl0/htf4xNoTNYOPMgZmjb1gI=;
        b=SLL6LwbD726Q5JSRJplOa+q7pGoeWmbPvpjxB0ch04rb466OaWklmqO7Gan6Pfbk2IPWaT
        Ao/Z5jKcn6op3lrnBfVtm0Bsf8rc9iZNbre+919nrmnwmYOeqhxZ02cl48dEtQmqNYCn7h
        HLTZLblmkpQkWp7OVK+MDC9vQbQRuxQ=
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 59518634C91
        for <linux-media@vger.kernel.org>; Thu, 16 Dec 2021 02:11:42 +0200 (EET)
Date:   Thu, 16 Dec 2021 02:11:42 +0200
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     linux-media@vger.kernel.org
Subject: [GIT PULL FOR 5.17] V4L2 patches
Message-ID: <YbqEPv6h6cESfWY5@valkosipuli.retiisi.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1639613503; a=rsa-sha256; cv=none;
        b=sehvcC6FqxVSFzdTomaXMu0/MKhu6SxH0kUhu/W6G44R2Mw7SKd0gsBVqnonPXVRVi9lhF
        eWR49Y5y4bd6FchgBA7Tp3oJHgLPHrRZaFEHXnH3JfDnacGC55I0fBqX+ghb27NnmIFu4I
        iInRtELTHDUe2n2cPt9pmHDOrtM8M1c=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=meesny; t=1639613503;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type;
        bh=sB/hc4DaCYfGwf45ejsl0/htf4xNoTNYOPMgZmjb1gI=;
        b=UzIqhZydYTHyLjnzPUOcxCiqwmHYkpO/BI4MqNckSPl/F+1EXRKQ1sC+Muw43oS6UJniG3
        8sluHcEzRcsruyQfo7PB+qeEfldOkP1DrazflZ781iGLLRCK1hLZGEYU36nsYVpavrIIMw
        CIoHHHaBH3OrDyTJT7o5+3XwLCKVWCc=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

Here's a few more V4L2 patches for 5.17.

There's a dependency fix for the max96712 driver, various patches for
supporting sensor driver probing in non-D0 ACPI power states, a few random
fixes and imx6-mipi-csi2 support for pre- and post-streamon ops.

Note that the checkpatch.pl complaint about Martin's From: and Sob:
originate from .mailmap.

Please pull.


The following changes since commit 9b4d7b5c81a2578e080da33b5cddc3149fa611aa:

  media: bttv: use DEVICE_ATTR_RO() helper macro (2021-12-07 11:29:58 +0100)

are available in the Git repository at:

  git://linuxtv.org/sailus/media_tree.git tags/for-5.17-3-signed

for you to fetch changes up to 8d08471daa49e47671e3b64a9c89bc3cbdac5438:

  media: i2c: hi846: use pm_runtime_force_suspend/resume for system suspend (2021-12-16 01:27:18 +0200)

----------------------------------------------------------------
V4L2 patches for 5.17

----------------------------------------------------------------
Andy Shevchenko (1):
      media: i2c: max9286: Get rid of duplicate of_node assignment

Bingbu Cao (5):
      media: ov8856: support device probe in non-zero ACPI D state
      media: ov2740: support device probe in non-zero ACPI D state
      media: imx208: Support device probe in non-zero ACPI D state
      media: ov5675: Support device probe in non-zero ACPI D state
      media: hi556: Support device probe in non-zero ACPI D state

Jean-Michel Hautbois (1):
      media: staging: ipu3-imgu: add the AWB memory layout

Martin Kepplinger (2):
      media: i2c: hi846: check return value of regulator_bulk_disable()
      media: i2c: hi846: use pm_runtime_force_suspend/resume for system suspend

Michael Tretter (1):
      media: imx6-mipi-csi2: use pre_streamon callback to set sensor into LP11

Sakari Ailus (4):
      max96712: Depend on VIDEO_V4L2
      Update Intel-submitted camera sensor driver contacts
      ov8865: Disable only enabled regulators on error path
      media: ov5670: Support device probe in non-zero ACPI D state

 MAINTAINERS                                        |   1 -
 drivers/media/i2c/hi556.c                          |  70 +++++----
 drivers/media/i2c/hi846.c                          |  14 +-
 drivers/media/i2c/imx208.c                         |  82 +++++++----
 drivers/media/i2c/imx319.c                         |   2 +-
 drivers/media/i2c/imx355.c                         |   2 +-
 drivers/media/i2c/max9286.c                        |   1 -
 drivers/media/i2c/ov13858.c                        |   2 +-
 drivers/media/i2c/ov2740.c                         |  69 ++++++---
 drivers/media/i2c/ov5670.c                         |  80 +++++-----
 drivers/media/i2c/ov5675.c                         |  71 +++++----
 drivers/media/i2c/ov8856.c                         | 162 +++++++++++----------
 drivers/media/i2c/ov8865.c                         |  12 +-
 drivers/staging/media/imx/imx6-mipi-csi2.c         |   9 +-
 .../staging/media/ipu3/include/uapi/intel-ipu3.h   |  32 +++-
 drivers/staging/media/max96712/Kconfig             |   1 +
 16 files changed, 379 insertions(+), 231 deletions(-)

-- 
Sakari Ailus
