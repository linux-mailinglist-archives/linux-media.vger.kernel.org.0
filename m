Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB14842C922
	for <lists+linux-media@lfdr.de>; Wed, 13 Oct 2021 20:58:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238765AbhJMTAY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 13 Oct 2021 15:00:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231522AbhJMTAX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 13 Oct 2021 15:00:23 -0400
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA4C9C061570
        for <linux-media@vger.kernel.org>; Wed, 13 Oct 2021 11:58:19 -0700 (PDT)
Received: by mail-wr1-x42d.google.com with SMTP id o20so11654836wro.3
        for <linux-media@vger.kernel.org>; Wed, 13 Oct 2021 11:58:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=B+AY0+OI2PAH7kEtlWzi6aAmClSw8n2MFbS+iADmhiQ=;
        b=dkJGe2ydPJcbVUbuW4blU66DGMRHsKGBo50bAkQswlBP8z3v8s9Gd2HXyymtKq4row
         yAEsdIDfm4cbDFSVH98s1vJp2/CdjKcvxbJ8jwdJqh4OfgDVwXhOiSOi8UlZuMxWinut
         mNRSk9DvH7rz7ZIMWTc5YG18ls0nAAzdtw0DNwFkHNxbaZ+HTUXmfYXannEPRpO/WuCk
         c+D5EjP2YQwTQok/25md0rSjVU/I+o2eQJeJRncn3KMeYLRDxpZiaWZgg7yIooyG0tln
         XNuEiE9IhgeATuro1USZUGpZl1IuVOoZ5TKbbdRX8NKCu1FMVDolv/Ba4I5hfhrctfmo
         btmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=B+AY0+OI2PAH7kEtlWzi6aAmClSw8n2MFbS+iADmhiQ=;
        b=1rXAlEdBhkJ8ZSNTQZ7/U12Ag+a5/KkcHuSmne/dvyuopHnrCH319DeWfau82TYPVk
         Yt2ydF/QgGqaxj63FzoS7LcgoUiPXNnhlnQpOoF3Rw+izR1pLRjpwTjO8n9vrhgjekS6
         UTgKqWUoqcwu244m88hShGChuXjfOOg2CSYPNYeIIEiarcOOc6nUeNBOuefmfjQQ/fF0
         ST7lpSZw8VID30GZR6sE1gqgOGcCd7SZyw5A6VslbnqamovyeGUf/eIROq+OH8N8G2xg
         HPpVpK12Ek3ZpmlsokgeXHlyyRTPK7Q4cyrP+Voic8neATAA7xgFm8lkwP2cG+uzaGW5
         ppfg==
X-Gm-Message-State: AOAM532g2qgP4dlb2ziongbUKsXF2geszGqO4nnlj1Bthab9GDUqvcYD
        g9mCHYTD8xgT+BKFt1/tB0vr+g==
X-Google-Smtp-Source: ABdhPJyshLTiFB9PpS2SpFkTztGRsVKMP3l3PqG4vPTTmpk0b9T92cdKQBQmD3lyysrTMi5jZLaYnA==
X-Received: by 2002:adf:9784:: with SMTP id s4mr1006923wrb.277.1634151498541;
        Wed, 13 Oct 2021 11:58:18 -0700 (PDT)
Received: from localhost.localdomain (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id e8sm573059wrg.48.2021.10.13.11.58.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Oct 2021 11:58:18 -0700 (PDT)
From:   Corentin Labbe <clabbe@baylibre.com>
To:     mchehab@kernel.org, hverkuil@xs4all.nl, gregkh@linuxfoundation.org
Cc:     linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev, mjpeg-users@lists.sourceforge.net,
        Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH v2 00/10] staging: media: zoran: fusion in one module
Date:   Wed, 13 Oct 2021 18:58:02 +0000
Message-Id: <20211013185812.590931-1-clabbe@baylibre.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello

The main change of this serie is to fusion all zoran related modules in
one.
This fixes the load order problem when everything is built-in.

Regards

Changes since v1:
- add missing debugfs cleaning
- clean some remaining module_get/put functions which made impossible to
  remove the zoran module
- added the two latest patchs

Corentin Labbe (10):
  staging: media: zoran: move module parameter checks to zoran_probe
  staging: media: zoran: use module_pci_driver
  staging: media: zoran: rename debug module parameter
  staging: media: zoran: add debugfs
  staging: media: zoran: videocode: remove procfs
  staging: media: zoran: fusion all modules
  staging: media: zoran: remove vidmem
  staging: media: zoran: move videodev alloc
  staging: media: zoran: move config select on primary kconfig
  staging: media: zoran: introduce zoran_i2c_init

 drivers/staging/media/zoran/Kconfig        |  46 +--
 drivers/staging/media/zoran/Makefile       |   8 +-
 drivers/staging/media/zoran/videocodec.c   |  68 +----
 drivers/staging/media/zoran/videocodec.h   |   6 +-
 drivers/staging/media/zoran/zoran.h        |   6 +-
 drivers/staging/media/zoran/zoran_card.c   | 328 ++++++++++++++-------
 drivers/staging/media/zoran/zoran_driver.c |   5 +-
 drivers/staging/media/zoran/zr36016.c      |  24 +-
 drivers/staging/media/zoran/zr36016.h      |   2 +
 drivers/staging/media/zoran/zr36050.c      |  21 +-
 drivers/staging/media/zoran/zr36050.h      |   2 +
 drivers/staging/media/zoran/zr36060.c      |  21 +-
 drivers/staging/media/zoran/zr36060.h      |   2 +
 13 files changed, 291 insertions(+), 248 deletions(-)

-- 
2.32.0

