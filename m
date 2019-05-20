Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 86DE6242D8
	for <lists+linux-media@lfdr.de>; Mon, 20 May 2019 23:28:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726619AbfETV2G (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 20 May 2019 17:28:06 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:38173 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726111AbfETV2G (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 20 May 2019 17:28:06 -0400
Received: by mail-lj1-f194.google.com with SMTP id 14so13877149ljj.5;
        Mon, 20 May 2019 14:28:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=eeXGl4OisvD9va1fGMuq+T3d0J26MMP0kgZu3foyCjo=;
        b=pFNOQb9hR5mBf6ujnYXfCgJXtYgalIrtiB0t5xD4Xa3bxGaLC1QriMaDDnyKSs2qia
         M2lfOvHOkeYSX2Pa3318he20GOXkYWoopJr269ALVqWEcc/ZdclEpYZLBM6VSOlTtEvy
         VvMR0626uVCtq7OxzXLBsiQxRxmlOsZ8flSN3SXqL5Xzmzsq4ezR9ENyzetowICyutmz
         uGQHAhULamFlaSLG5HhT0DGpN1pBVGtLQz6xG+3ES7Hve7jhc/2nHypzcnxw4g5bJJRv
         g+PsBS+XnYgLTpLOBmVXUwrXSufgXebD6jv/3K3ZfOAztsTvBOuChcTHNuLo/z16Y4Pd
         N9bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=eeXGl4OisvD9va1fGMuq+T3d0J26MMP0kgZu3foyCjo=;
        b=ZgBXzenWDrrMT1cCWU8mZGAlJ3YI97zdQWGyVX6ZS04xgK+52c0H13mQSG2nXztac+
         l0nkHTX4y2DoFuZXRrOmZkMAIxNupWJHItsO9dd6HzSn7jwbgMMzwl8mmZV7ze+6AGZU
         LyAuDpntC3abUBACzJUmLAHLAUKteTzet7z06EUUdWMcmvvHmXn68ozsD8tEEJ8GKu7T
         2lpBzw7QmYCAUA45AlA3tvZlROkZ/fq1lMiYFIpFW4QPowbMHFWa6yTWKVxb++dqPSX3
         8KTBdgT4I7tSnazDCYp89TVkeGuw+T7hiyV9R4Yu1Bh4pnzgOT7y4DrX3+IaGCaIPz72
         EzMA==
X-Gm-Message-State: APjAAAXkQjFc1bKKZbcRPMXmkWoVovrVrEXa7OkLwpok475DEu35kDoC
        HBWD44p+F6X3zQa32JOxvvg=
X-Google-Smtp-Source: APXvYqxu/gYyuXVEVMYZumel6gJClPU4QqMU5iEHC7fT2PYZBo8pJDBPpThXdcs8Msnq3XKTjSWjiA==
X-Received: by 2002:a2e:2f03:: with SMTP id v3mr1017507ljv.6.1558387683881;
        Mon, 20 May 2019 14:28:03 -0700 (PDT)
Received: from z50.gdansk-morena.vectranet.pl (109241207190.gdansk.vectranet.pl. [109.241.207.190])
        by smtp.gmail.com with ESMTPSA id q9sm4226813lfn.88.2019.05.20.14.28.02
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 20 May 2019 14:28:03 -0700 (PDT)
From:   Janusz Krzysztofik <jmkrzyszt@gmail.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>
Subject: [PATCH v7 0/3] media: v4l2-subdev: Verify arguments in v4l2_subdev_call()
Date:   Mon, 20 May 2019 23:27:44 +0200
Message-Id: <20190520212747.368-1-jmkrzyszt@gmail.com>
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
non-NULL pointers, including pad config if V4L2_SUBDEV_FORMAT_TRY is
requested.

Having that done, we can avoid taking care of those checks inside
drivers.

Janusz Krzysztofik (3):
  media: v4l2-subdev: Verify arguments in v4l2_subdev_call()
  media: v4l2-subdev: Verify v4l2_subdev_call() pointer arguments
  media: v4l2-subdev: Verify v4l2_subdev_call() pad config argument

 drivers/media/v4l2-core/v4l2-subdev.c | 268 +++++++++++++++++---------
 include/media/v4l2-subdev.h           |   6 +
 2 files changed, 188 insertions(+), 86 deletions(-)

Changelog:
v6->v7:
Changes suggested by Sakari - thanks!
- never succeed pad check on media entities with pad_num == 0,
- allow pad 0 on subdevies not registered as media entities.

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

