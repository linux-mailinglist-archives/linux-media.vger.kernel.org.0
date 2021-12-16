Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B20C4771ED
	for <lists+linux-media@lfdr.de>; Thu, 16 Dec 2021 13:35:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236839AbhLPMfU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Dec 2021 07:35:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236577AbhLPMfT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Dec 2021 07:35:19 -0500
Received: from meesny.iki.fi (meesny.iki.fi [IPv6:2001:67c:2b0:1c1::201])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 638BEC061574
        for <linux-media@vger.kernel.org>; Thu, 16 Dec 2021 04:35:19 -0800 (PST)
Received: from hillosipuli.retiisi.eu (dkvn5pty0gzs3nltj987t-3.rev.dnainternet.fi [IPv6:2001:14ba:4457:9640:1e2d:1f75:a607:ef37])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by meesny.iki.fi (Postfix) with ESMTPSA id DD852201E0
        for <linux-media@vger.kernel.org>; Thu, 16 Dec 2021 14:35:16 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
        t=1639658116;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type;
        bh=2tQtrIX6jo7+xG5RWJiWO3vf2lZRf4gHqxi9b4s0Tw8=;
        b=S2m0wAUfjMKJPkWKVF2Q73ecHWmGJp5KSrDLyn/IwFtAX66/kNN8ItT6+cQTLGp2PitF1A
        u/bBHILpP987HfgSAsdkAcD8Nn4iotpC/HeArkF6QAWpGOTJ+f3P0AicD53IokHggKWQw4
        T5j3IB+B13QQu/yftAcMQphSHPEPF5k=
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 2C2AA634C91
        for <linux-media@vger.kernel.org>; Thu, 16 Dec 2021 14:35:14 +0200 (EET)
Date:   Thu, 16 Dec 2021 14:35:14 +0200
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     linux-media@vger.kernel.org
Subject: [GIT PULL v2 FOR 5.17] V4L2 patches
Message-ID: <Ybsygi8PTRXngyay@valkosipuli.retiisi.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1639658116; a=rsa-sha256; cv=none;
        b=R8A2fl/p49K7VkOmWcgweJP49+gNxv7HvnBUBrmvMMPJkmdLG43UKJ1gyKIAOvASpzv1y4
        FUIWHtfmSFSXGHFxy19+T/ElDrOGG2QTURyhsBJSJb2NGBRS2a+Ly8M762Cm98Vy12hgXO
        Jst4ZP+nGzl+1Vmshw4NkwWGWfGWKTg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=meesny; t=1639658116;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type;
        bh=2tQtrIX6jo7+xG5RWJiWO3vf2lZRf4gHqxi9b4s0Tw8=;
        b=EUWmGIYHm1UDza9Eih/yZDgLmdOWh0CMaZ+DDy7GDSiA47HCPKtMwgLddH5FEE4Fulr/Xb
        GkboPtT9w3gE72oyXqknkQN1U+DsPr4zQtRDTZHnqfS4VbhGRpBXB8a3n6z9y7PBcFjKU+
        Q35Vdb7gFsTRQxCzmwYUuvio0ae0sC4=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

Here's a few more V4L2 patches for 5.17.

There are various patches for supporting sensor driver probing in non-D0
ACPI power states and a few random fixes.

Note that the checkpatch.pl complaint about Martin's From: and Sob:
originate from .mailmap.

Since v1, I've rebased on media stage tree.

Please pull.


The following changes since commit b9aafbd46eb92b3174781661c33bdb2c17d484f1:

  media: si2157: add ATV support for si2158 (2021-12-14 16:19:05 +0100)

are available in the Git repository at:

  git://linuxtv.org/sailus/media_tree.git tags/for-5.17-3.1-signed

for you to fetch changes up to a4aab54975e042f182eb3d49b1451dccde38b789:

  media: i2c: hi846: use pm_runtime_force_suspend/resume for system suspend (2021-12-16 14:29:52 +0200)

----------------------------------------------------------------
V4L2 patches for 5.17

----------------------------------------------------------------
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

Sakari Ailus (3):
      Update Intel-submitted camera sensor driver contacts
      ov8865: Disable only enabled regulators on error path
      media: ov5670: Support device probe in non-zero ACPI D state

 MAINTAINERS                                        |   1 -
 drivers/media/i2c/hi556.c                          |  70 +++++----
 drivers/media/i2c/hi846.c                          |  14 +-
 drivers/media/i2c/imx208.c                         |  82 +++++++----
 drivers/media/i2c/imx319.c                         |   2 +-
 drivers/media/i2c/imx355.c                         |   2 +-
 drivers/media/i2c/ov13858.c                        |   2 +-
 drivers/media/i2c/ov2740.c                         |  69 ++++++---
 drivers/media/i2c/ov5670.c                         |  80 +++++-----
 drivers/media/i2c/ov5675.c                         |  71 +++++----
 drivers/media/i2c/ov8856.c                         | 162 +++++++++++----------
 drivers/media/i2c/ov8865.c                         |  12 +-
 .../staging/media/ipu3/include/uapi/intel-ipu3.h   |  32 +++-
 13 files changed, 370 insertions(+), 229 deletions(-)

-- 
Sakari Ailus
