Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A25143BAE5
	for <lists+linux-media@lfdr.de>; Tue, 26 Oct 2021 21:34:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238820AbhJZTgr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 26 Oct 2021 15:36:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238774AbhJZTgr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 26 Oct 2021 15:36:47 -0400
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8C51C061570
        for <linux-media@vger.kernel.org>; Tue, 26 Oct 2021 12:34:22 -0700 (PDT)
Received: by mail-wr1-x433.google.com with SMTP id d3so120862wrh.8
        for <linux-media@vger.kernel.org>; Tue, 26 Oct 2021 12:34:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=iQIW0HtsUm24MMnIjicuVNqLRGXi6K45G9dZoAsljvs=;
        b=e1BT2flNGyNgh/Fbo9efhwTrwkVuH3xsd2x+dS/RIzRx+dS8IDhyr7hOyDtzC6aTOx
         njOaA5U6CFvDTGgNiDDcXe26St2TYjxdH2FnATT6c+r0+KXLPAP8+0LTygSafs6eScMS
         95vzdvkFuonkjmxQQTQvndrxwXgnP/nMcVkdY8MqCw/yxQMGbd6kClg/pmgtJD7gl98E
         MQ/HBCMl+KJBxO3fFqg/fkcFJL8S2m3s4GumKIutUT+olyZKqWdr0fjbTt7WiFelQU9k
         UKGkdQAVEjpB8nMznPJykl/4Nxn7KS0zJCfh8Usfh5N0s0f4wROmbrZtvCQ947oWfqlF
         EB0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=iQIW0HtsUm24MMnIjicuVNqLRGXi6K45G9dZoAsljvs=;
        b=KAgHLQTv/3qBBQo+gLMueES2kUUb9iIQvXr4qTfxtxvmDgv+B7Kug9+PMi7t2JjZef
         hHsns7cKlv5MtOYoXaVEINjjRaW0ohejywehw0jhRkKWRow+fmLhi5AykIJLBPXRWa0B
         eHxvmjTHf5nhyYB8fvS/rSd16CiZXrmHqZIeJYCbJfmVFMHMziEgZOZDeE8Hxa1nEU3u
         QfLoTGW0W8/Ydq8uuwi4RbM1Ggsefek5OZeqAG1cIZojsIQeag3F4s0MayzINWckBJKk
         tT/4CMMVVQABu3lpR/rtNHnkIg1VsXh17eKcAJ2aPMEL09ZFEhZXsalIlWxYF9ANnss1
         /uiA==
X-Gm-Message-State: AOAM531q2lSIl48Ur7+H5ZGdYruwpz2Mz/n4ubBczIIm7Gxlxf9ITe+G
        6uUS2cdPYba8d9zx3xuG+pFYxw==
X-Google-Smtp-Source: ABdhPJxS7PlFtRT5hWEkseaWJxkRf4NGhzTOq9iPY2TpHGSU9+sFPkfwdqjqvUTUHK05HJPX1tgh8g==
X-Received: by 2002:a05:6000:2a2:: with SMTP id l2mr27301241wry.109.1635276861598;
        Tue, 26 Oct 2021 12:34:21 -0700 (PDT)
Received: from localhost.localdomain (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id s18sm17676123wrb.95.2021.10.26.12.34.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Oct 2021 12:34:21 -0700 (PDT)
From:   Corentin Labbe <clabbe@baylibre.com>
To:     mchehab@kernel.org, hverkuil@xs4all.nl, gregkh@linuxfoundation.org
Cc:     linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev, mjpeg-users@lists.sourceforge.net,
        Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH v3 00/14] staging: media: zoran: fusion in one module
Date:   Tue, 26 Oct 2021 19:34:02 +0000
Message-Id: <20211026193416.1176797-1-clabbe@baylibre.com>
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

Changes since v2:
- added the 4 latest patchs
- removed DEBUGFS kconfig option
- fixed Dan Carpenter's reported codec issues
- fixed kernel test robot's reported issues on vb2_dma_contig_set_max_seg_size()

Changes since v1:
- add missing debugfs cleaning
- clean some remaining module_get/put functions which made impossible to
  remove the zoran module
- added the two latest patchs

Corentin Labbe (14):
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
  staging: media: zoran: fix usage of vb2_dma_contig_set_max_seg_size
  staging: media: zoran: clean unused code
  staging: media: zoran: fix counting buffer in reserve
  staging: media: zoran: DC30 encoder is not adv7175

 drivers/staging/media/zoran/Kconfig        |  38 +-
 drivers/staging/media/zoran/Makefile       |   8 +-
 drivers/staging/media/zoran/videocodec.c   |  68 +---
 drivers/staging/media/zoran/videocodec.h   |   4 +-
 drivers/staging/media/zoran/zoran.h        |  18 +-
 drivers/staging/media/zoran/zoran_card.c   | 400 +++++++++++++--------
 drivers/staging/media/zoran/zoran_device.h |   2 -
 drivers/staging/media/zoran/zoran_driver.c |   8 +-
 drivers/staging/media/zoran/zr36016.c      |  25 +-
 drivers/staging/media/zoran/zr36016.h      |   2 +
 drivers/staging/media/zoran/zr36050.c      |  24 +-
 drivers/staging/media/zoran/zr36050.h      |   2 +
 drivers/staging/media/zoran/zr36060.c      |  23 +-
 drivers/staging/media/zoran/zr36060.h      |   2 +
 14 files changed, 317 insertions(+), 307 deletions(-)

-- 
2.32.0

