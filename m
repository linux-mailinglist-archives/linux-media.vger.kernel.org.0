Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C47EB2FFF70
	for <lists+linux-media@lfdr.de>; Fri, 22 Jan 2021 10:46:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727645AbhAVJqI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 22 Jan 2021 04:46:08 -0500
Received: from meesny.iki.fi ([195.140.195.201]:45562 "EHLO meesny.iki.fi"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727389AbhAVJpW (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 22 Jan 2021 04:45:22 -0500
Received: from hillosipuli.retiisi.eu (213-243-181-26.bb.dnainternet.fi [213.243.181.26])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by meesny.iki.fi (Postfix) with ESMTPSA id AC1AB20244
        for <linux-media@vger.kernel.org>; Fri, 22 Jan 2021 11:44:14 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
        t=1611308654;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type;
        bh=aChDf+j/KsLWQiwg+NC5BtNE507x7IxTK6RIcLX8TrM=;
        b=Wx3vlexeiZv7R/JuVA04TRrRJ8vlFjfpMzkWZ/RIRttJV+CEKnFqDNpvDcN3qsO828vadb
        tkjZNpHEGvOF2cVjNrwm+VWF5TxIf32bk7efIqmIgTIP0tkwCJ60f8D2o4sB64KBqQjuGh
        2chCqKNKiRSrjrbIpkea8Sj+FFfm5hc=
Received: from valkosipuli.localdomain (valkosipuli.localdomain [IPv6:fd35:1bc8:1a6:d3d5::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 4DB1A634C8C
        for <linux-media@vger.kernel.org>; Fri, 22 Jan 2021 11:42:48 +0200 (EET)
Received: from localhost ([127.0.0.1] helo=valkosipuli.retiisi.org.uk)
        by valkosipuli.localdomain with esmtp (Exim 4.92)
        (envelope-from <sakari.ailus@iki.fi>)
        id 1l2sxs-0004jN-4t
        for linux-media@vger.kernel.org; Fri, 22 Jan 2021 11:42:48 +0200
Date:   Fri, 22 Jan 2021 11:42:48 +0200
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     linux-media@vger.kernel.org
Subject: [GIT PULL v2 for 5.12] More V4L2 patches
Message-ID: <20210122094248.GL3@valkosipuli.retiisi.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1611308654; a=rsa-sha256; cv=none;
        b=ZaShHOlAOJNNrXxsVWnyfSIrA1f6/DxyoPC+V825awF1Iz5FkYPVFrTVqCVPNJoNjP9X8V
        kL4j/ZPhYupb9BZcr6Txve/V70WfZYpXs2U9DYvYBD4AWeyp+v4v1FZRtqBTSA1JWfhzj7
        /2zoyuPul1KR6xgJm+4BkBnMCb5EOxM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=meesny; t=1611308654;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type;
        bh=aChDf+j/KsLWQiwg+NC5BtNE507x7IxTK6RIcLX8TrM=;
        b=iY5jiJoYa79Zynd2uokIBFP3GfKLyg/UkzjESeKuNeZZCjmJGRSB8yLL6X2a8PJmAzKTBR
        x9UpyFjSj0jLfPYpEQIuZx292Kqo9GjbH6r95M4BtbTCueUIMznMfXDnuuobVOc3/MCowe
        oSSR/SaBLdsp3y+ukivg3WtMKuPemv0=
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

Here's a small set of fixes and improvements for DT bindings, ov8865 driver
and v4l2-async.

Since v1, added a patch from Ezequiel to remove the custom async match
type. This addresses the warnings in the earlier pull request.

Please pull.


The following changes since commit 321af22a3d2f6ed1fb1737c8588c01f6fec8a7b8:

  media: atomisp: convert comma to semicolon (2021-01-14 13:59:46 +0100)

are available in the Git repository at:

  git://linuxtv.org/sailus/media_tree.git tags/for-5.12-4.1-signed

for you to fetch changes up to bd5927c372287d51cde8741c83bd7e302b6ecd0a:

  dt-bindings: media: ov5647: Fix filename (2021-01-22 11:35:29 +0200)

----------------------------------------------------------------
More V4L2 patches

----------------------------------------------------------------
Ezequiel Garcia (2):
      media: v4l2-async: Remove V4L2_ASYNC_MATCH_CUSTOM
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
 drivers/media/v4l2-core/v4l2-async.c               | 83 ++++++++++++++++++----
 drivers/media/v4l2-core/v4l2-dev.c                 |  5 ++
 include/media/v4l2-async.h                         | 25 +++----
 6 files changed, 85 insertions(+), 33 deletions(-)

-- 
Kind regards,

Sakari Ailus
