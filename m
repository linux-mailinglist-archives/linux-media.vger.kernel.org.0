Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D906D2FEA37
	for <lists+linux-media@lfdr.de>; Thu, 21 Jan 2021 13:39:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731307AbhAUMhv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 21 Jan 2021 07:37:51 -0500
Received: from meesny.iki.fi ([195.140.195.201]:47694 "EHLO meesny.iki.fi"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731223AbhAUMhN (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 21 Jan 2021 07:37:13 -0500
X-Greylist: delayed 547 seconds by postgrey-1.27 at vger.kernel.org; Thu, 21 Jan 2021 07:37:11 EST
Received: from hillosipuli.retiisi.eu (dbd4xkyj7wcfw2k22jcct-3.rev.dnainternet.fi [IPv6:2001:14ba:8f1:3400:fb90:892b:22d6:3885])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by meesny.iki.fi (Postfix) with ESMTPSA id E5B5F2016D
        for <linux-media@vger.kernel.org>; Thu, 21 Jan 2021 14:27:18 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
        t=1611232039;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type;
        bh=dxDyjxUC3Z4sHP8Al712E22fkr8mP7TlfIeqRq8D3l8=;
        b=ccufn1WUFSJn7w8KwtCkuwYMWDc8WtrJMCA9t1VTDnFh0Ng3dAsaZHnOXWi7dBDkTXTkML
        kq1FyWOve6X/cvZK+uAIoB/wprsE1GVyhQAoq7TILdz3fq+5Vwvn6TcAmeYDXMR8nVyPUX
        n2bV8CyHusPs6fOJ2oJKZP5OKrZA3Q0=
Received: from valkosipuli.localdomain (valkosipuli.localdomain [IPv6:fd35:1bc8:1a6:d3d5::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 15027634C8C
        for <linux-media@vger.kernel.org>; Thu, 21 Jan 2021 14:25:57 +0200 (EET)
Received: from localhost ([127.0.0.1] helo=valkosipuli.retiisi.org.uk)
        by valkosipuli.localdomain with esmtp (Exim 4.92)
        (envelope-from <sakari.ailus@iki.fi>)
        id 1l2Z2C-0004eO-Qe
        for linux-media@vger.kernel.org; Thu, 21 Jan 2021 14:25:56 +0200
Date:   Thu, 21 Jan 2021 14:25:56 +0200
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     linux-media@vger.kernel.org
Subject: [GIT PULL for 5.12] More V4L2 patches
Message-ID: <20210121122556.GK3@valkosipuli.retiisi.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1611232039; a=rsa-sha256; cv=none;
        b=awqxTXDcgPnPgbsPzQJn1BrtqobYW1cZvj/VmqYeFqf4a+FzGEpTTnhA4TRCSbPBrcS62Z
        F7pXdxmyFVdLdPqz6Hd3IgQylsaAmz4uUkX9WQJfzvZUkLk82wuWjJpL/bc9DNRWGoW0+M
        EcVkERsZiPJ4fQMQGxihdf1jWrye3wM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=meesny; t=1611232039;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type;
        bh=dxDyjxUC3Z4sHP8Al712E22fkr8mP7TlfIeqRq8D3l8=;
        b=Jf7dHunZrMqZkKMrtDB+UYR9uJ7x1oXwsYNcfVToCKF9mXeLx+KNbpBEDhWBmHMKSkJqs9
        at/uOS+p8QRjhOpQKUBIUyGHSshLhOxSe776cXjKWSDRv3BUkigNNxI23tlncfbFxykl5n
        muvwWUy1OvzjfnUYG5E5IdrZRn5216Y=
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

Here's a small set of fixes and improvements for DT bindings, ov8865 driver
and v4l2-async.

Please pull.


The following changes since commit 321af22a3d2f6ed1fb1737c8588c01f6fec8a7b8:

  media: atomisp: convert comma to semicolon (2021-01-14 13:59:46 +0100)

are available in the Git repository at:

  git://linuxtv.org/sailus/media_tree.git tags/for-5.12-4-signed

for you to fetch changes up to 1f09359977f13880269a2109f55b7596a6dc479e:

  dt-bindings: media: ov5647: Fix filename (2021-01-21 14:18:36 +0200)

----------------------------------------------------------------
V4L2 patches for 5.12

----------------------------------------------------------------
Ezequiel Garcia (1):
      media: v4l2-async: Add waiting subdevices debugfs

Jacopo Mondi (1):
      dt-bindings: media: ov5647: Fix filename

Lad Prabhakar (1):
      media: i2c/Kconfig: Select FWNODE for OV772x sensor

Laurent Pinchart (1):
      media: v4l2-async: Safely unregister an non-registered async subdev

kernel test robot (1):
      media: i2c: fix odd_ptr_err.cocci warnings

 .../devicetree/bindings/media/i2c/ovti,ov5647.yaml |  2 +-
 drivers/media/i2c/Kconfig                          |  1 +
 drivers/media/i2c/ov8865.c                         |  2 +-
 drivers/media/v4l2-core/v4l2-async.c               | 69 ++++++++++++++++++++++
 drivers/media/v4l2-core/v4l2-dev.c                 |  5 ++
 include/media/v4l2-async.h                         |  8 +++
 6 files changed, 85 insertions(+), 2 deletions(-)

-- 
Kind regards,

Sakari Ailus
