Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7E905242B6
	for <lists+linux-media@lfdr.de>; Mon, 20 May 2019 23:21:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727033AbfETVUf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 20 May 2019 17:20:35 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:44409 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726628AbfETVUf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 20 May 2019 17:20:35 -0400
Received: by mail-lj1-f193.google.com with SMTP id e13so13815146ljl.11;
        Mon, 20 May 2019 14:20:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=eeXGl4OisvD9va1fGMuq+T3d0J26MMP0kgZu3foyCjo=;
        b=OYoUqfsV7mnWmXy+IkWaJk4b+/wAkvrpvuM+z79nSyjzwjwcS6AbOID0/NRi0HEY/c
         vrGdesXrxKXYljPfOXnKFv+7ZR9dlIDKxl3uwE+YUCimbotSmyNR6J02eiwvneuH31xk
         2AVqmnjLPRb4k/vLeJAsZNbdPxTMqp0X+Y947Xs7Vd2p4HfUCsK0z1QMjP2ujrKc1rgA
         5O++K6uhB1xVh7CdROgmc8FJVG1BJ6x1YKY9klnWLd82mQ2FO8/GkUhw0trQJMPmguVo
         swQdsXmwhG6gynTTtXQp4Gtftjgi98VHaObRFRvLwXDhOP/flvotiFMMxVtxRJkJufIn
         TRuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=eeXGl4OisvD9va1fGMuq+T3d0J26MMP0kgZu3foyCjo=;
        b=lANFTL0HwkftuZKtQ3rSsJYg9xD8uAadY9ZQIHG2zG0FRHFxqXTCUOHwdZm5gX6vX6
         MN1gNXGUbRe84Y4g/n6KFQ/+yqRAjUd7vI/nQXgcUSn2KSkrg7oM/+RexHQgMXquRQGH
         ghr3DPnp48WL7Nnvq/a6I5gGdCdu1NFhIY3qq3DeXmbmZinnLUXEVOC5y+R8I9xm4uu1
         rPru/tE9TNAj7XZnLCg4pT1RjhLqT5/S1S6baq+b1wcVVQnRC3QtWks5V1kORLNYXnAs
         rd8zjl6LoYIBiIAnWYWMRMQIH9UOY9pppJTCzfGdJ1j559Z52c7UpLGjvYYGoQsBwhx1
         nnLg==
X-Gm-Message-State: APjAAAXOE4drpxfkOsG5JOJpCT98W+D9xpAJanvHWkPiyLYlAXmATwD2
        iDQEib32pnxPtbP/QhGcbt4=
X-Google-Smtp-Source: APXvYqzxP/xb+w6wE/ZkGlf3K3toIPvyEsdt0fzUOzdIzNGu0FtAMPR2E1Ma/ja1p9A3sd6h2qEGRQ==
X-Received: by 2002:a2e:8857:: with SMTP id z23mr38822150ljj.73.1558387233349;
        Mon, 20 May 2019 14:20:33 -0700 (PDT)
Received: from z50.gdansk-morena.vectranet.pl (109241207190.gdansk.vectranet.pl. [109.241.207.190])
        by smtp.gmail.com with ESMTPSA id e12sm4149897lfb.70.2019.05.20.14.20.31
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 20 May 2019 14:20:32 -0700 (PDT)
From:   Janusz Krzysztofik <jmkrzyszt@gmail.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>
Subject: [PATCH v7 0/3] media: v4l2-subdev: Verify arguments in  v4l2_subdev_call()
Date:   Mon, 20 May 2019 22:50:19 +0200
Message-Id: <20190520205022.8714-1-jmkrzyszt@gmail.com>
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

