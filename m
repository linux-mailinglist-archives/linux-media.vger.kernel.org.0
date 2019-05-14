Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 094FA1E54E
	for <lists+linux-media@lfdr.de>; Wed, 15 May 2019 00:50:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726465AbfENWun (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 May 2019 18:50:43 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:43720 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726148AbfENWun (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 May 2019 18:50:43 -0400
Received: by mail-lj1-f196.google.com with SMTP id z5so707714lji.10;
        Tue, 14 May 2019 15:50:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zn4G2bFjrYQCf9SnncqZRscUBjdYIodDzPMbFewZnc8=;
        b=ZeffY7RelLSaziG4wNcOE/BLaHjI07TAmpkKsAzc1bjup1PGCn5j9VkuH2n8+N8aBy
         kEH8i7At0K331Cz74YM+RuMyH2YyULShVU74pTW/qoLY1tPgF73m+M/bwd9M9Y2Sw9Bf
         oVB7cB+SxcGpGrYQ72y+w+mWlKmm60KFad1FRppux8PBB2sGoJsgiQcvVvxLyOh7x4fm
         aGPPEgbyFb8w31cbo1hWAW0qxHlOq1tvfwl6h47YY19XX0v0sAf44T+ysD4+teNjByvO
         b9+s1pxdRJcuwlGgq7WzUTxDvixJMtmu4FLOwaMskFq/YX03o7S2Q8GTq9D7rPDeGGtf
         y+fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zn4G2bFjrYQCf9SnncqZRscUBjdYIodDzPMbFewZnc8=;
        b=XmvrYzxHKW9beTaAcYSDNI2cKevVl6BUVn7e5li8DMvu8/zv1N808tSIwfAC38a5N3
         MYy2XEsJBD1jmgNTJyj4RpgQG0NcUqiGnHJbEovOVfCQxzV74VuMko/QgWNcYOPpW/6A
         Zh1xDh/EAfwbBaq6qA32PrwxUEEsaHMCW4GMveWKA5cgQl/xbGHe73hRMPjrjh4ECtD6
         1jQQBb2RV+pZhOivtKiG6ONPtzsgOHJyyKmPAHA4U8dhijjCy7Q0OAAGkMGV+eizctAY
         b93aTHwXSyn+8t6UikcNBahHydFCP4ex7aZ3EQp4llGxud+2sSpPgntQAHhhabVqHWjC
         hNKA==
X-Gm-Message-State: APjAAAXF2a11o8mIsrxTsCu3LEzBETT4STV4nT9CH3Gko3cKH/A/jctV
        GNMSeumChhR6b/+kAfzDJAI=
X-Google-Smtp-Source: APXvYqxF8F0ef6U2TWFXrcQPbHuZWP7IKGIXBYt0eXRhSsrpoTZ7kq/2sVbGruhOiI72J6QQYZyINQ==
X-Received: by 2002:a2e:121d:: with SMTP id t29mr9763738lje.29.1557874240760;
        Tue, 14 May 2019 15:50:40 -0700 (PDT)
Received: from z50.gdansk-morena.vectranet.pl (109241207190.gdansk.vectranet.pl. [109.241.207.190])
        by smtp.gmail.com with ESMTPSA id s6sm50190lje.89.2019.05.14.15.50.38
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 14 May 2019 15:50:39 -0700 (PDT)
From:   Janusz Krzysztofik <jmkrzyszt@gmail.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>
Subject: [PATCH v6 0/3] media: v4l2-subdev: Verify arguments in v4l2_subdev_call()
Date:   Wed, 15 May 2019 00:48:20 +0200
Message-Id: <20190514224823.11564-1-jmkrzyszt@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Correctness of format type (try or active) and pad ID parameters passed
to subdevice operation callbacks is now verified only for IOCTL calls.
However, those callbacks are also used by drivers, e.g., V4L2 host
interfaces.
    
Since both subdev_do_ioctl() and drivers are using v4l2_subdev_call()
macro while calling subdevice operations, move those parameter checks
from subdev_do_ioctl() to v4l2_subdev_call().  Also, add check for
non-NULL pointers, including pad config if V4L2_SUBDEV_FORMAT_tRY is
requested.

Having that done, we can avoid taking care of those checks inside
drivers.

Janusz Krzysztofik (3):
  media: v4l2-subdev: Verify arguments in v4l2_subdev_call()
  media: v4l2-subdev: Verify v4l2_subdev_call() pointer arguments
  media: v4l2-subdev: Verify v4l2_subdev_call() pad config argument

 drivers/media/v4l2-core/v4l2-subdev.c | 262 +++++++++++++++++---------
 include/media/v4l2-subdev.h           |   6 +
 2 files changed, 182 insertions(+), 86 deletions(-)

Changelog:
v5->v6:
- rename wrappers to call_something() as suggested by Sakari - thanks!
- make check_ functions inline - also on Sakari's suggestion, thanks!
- drop patch 2/4 and remove WARN_ONs from remaining patches to avoid
  kernel WARNs on non-kernel bugs - thanks Hans for pointing this out!

v4->v5:
- a few coding style and code formatting changes,
- require CONFIG_MEDIA_CONTROLLER, not CONFIG_VIDEO_V4L2_SUBDEV_API,
  for a valid pad ID check,
- perform pad ID check only if at least one pad is configured so
  drivers which don't configure pads are not affected if built with
  CONFIG_MEDIA_CONTROLLER defined,
- issue kernel warnings on invalid parameters (new patch - 2/4),
- validate pointers before using them (new patch - 3/4).

v3->v4:
- fix 'struct' keyword missing from patch 2/2,
- fix checkpatch reported style issue in patch 2/2
Sorry for that.

v2->v3:
- add patch 2/2 with pad config check,
- adjust continuation line alignments in patch 1/2 to match those
  used in 2/2.

v1->v2:
- replace the horrible macro with a structure of wrapper functions;
  inspired by Hans' and Sakari's comments - thanks!

-- 
2.21.0

