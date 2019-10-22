Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2E9ACDFEB4
	for <lists+linux-media@lfdr.de>; Tue, 22 Oct 2019 09:52:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388057AbfJVHv6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Oct 2019 03:51:58 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:38475 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387938AbfJVHv5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Oct 2019 03:51:57 -0400
Received: by mail-pf1-f195.google.com with SMTP id h195so10119878pfe.5
        for <linux-media@vger.kernel.org>; Tue, 22 Oct 2019 00:51:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=mnkod33vwMuA00vH7HqY3oXGAe7uV737j+rUjwh5yfs=;
        b=HK9ngHqwylxbOcCILTpB5lDm9UnZRbcqztWc2aQbBlgmxtd66VmfUJVlw6w4JJ9W0C
         7sMsv4Qtyq8rqAjD8398tTgXRbe0xgsakZEB0jtCBd1mNkLL8Q6IRn4MP2YgdkcL0tjk
         dzTGxjZqCibzAQXQFBmTOA/hDxhzrqvzEG4JBs7erWZiwR8GBcf5EGtGHd3tZRmmu540
         5V6+ZDszmZ+ctVy4wE0Q6y7gHcikj6MQV2OYPfRmgpLP1VRhlXkgEV75uRWytQYE4W7T
         /eJw1Y63XvAw8WVDHM1QCQH4T4EtmfwpCrYrUGmNxuQ1fHAicB7LOH4HbfUk6h6+TqHi
         7RDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=mnkod33vwMuA00vH7HqY3oXGAe7uV737j+rUjwh5yfs=;
        b=M9srK9to7vX5IJFfcp7xLAexZ5dPzf48OZ40cFgU2rgm9pMqmoO0JMWPiWaZ6irrle
         m3PPKrxFakuyroAEF/AcgT6Jkb03VKH9ipT/mIhTA6TRFB1kxlSag4ysroushzcAeWJY
         0q8lhlnokyQQdmB0QLathD20Uu36otpq4LOsHtUoYMAtDc2vWPn2No9g3BjQfeUo147V
         LUgL52tCUtles/+Vpir7N52Zkcf/Phi//+cfNIaiH9hq7wX1+jY2cdUO8cELOhEzYOwr
         OZgveoK2RM+zzlrN6AIcmfmSp7VRB0jwFWrBd9bF0mXG76I6iPWJva6bxQruxboSvPeP
         vYBQ==
X-Gm-Message-State: APjAAAW6hT9NJAE/0GOsuLnIJsYwT3d/H7xQGG7h3Dm0t98OOwmrUWYJ
        8+gSFbDlZNR1rsC9WE4dFbzFM2xr
X-Google-Smtp-Source: APXvYqx38UWfgdwbYwszD07PzrMSrAli0U2J9VA+g75Wb40khfuN7MNWNsgftkmmAbb+LNc0OWgTXA==
X-Received: by 2002:a62:cf42:: with SMTP id b63mr2729215pfg.33.1571730716705;
        Tue, 22 Oct 2019 00:51:56 -0700 (PDT)
Received: from bnva-HP-Pavilion-g6-Notebook-PC.domain.name ([117.248.69.110])
        by smtp.gmail.com with ESMTPSA id w6sm19611773pfw.84.2019.10.22.00.51.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2019 00:51:56 -0700 (PDT)
From:   Vandana BN <bnvandana@gmail.com>
To:     linux-media@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org
Cc:     hverkuil@xs4all.nl, Vandana BN <bnvandana@gmail.com>
Subject: [PATCH 0/2] vivid: Support for touch device
Date:   Tue, 22 Oct 2019 13:21:39 +0530
Message-Id: <20191022075141.21069-1-bnvandana@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patch adds support for touch devices in the vivid driver.
Current code provides a framework for touch support and passes
compliance tests.
TODO: Add touch emulation.

Thank you.
Regards,
Vandana.

Vandana BN (2):
  v4l2-core: fix touch support in v4l_g_fmt
  vivid: Add touch support

 drivers/media/platform/vivid/Makefile         |   3 +-
 drivers/media/platform/vivid/vivid-core.c     | 134 ++++++++++-
 drivers/media/platform/vivid/vivid-core.h     |  18 ++
 drivers/media/platform/vivid/vivid-ctrls.c    |  11 +
 .../media/platform/vivid/vivid-kthread-cap.c  |   1 -
 .../platform/vivid/vivid-kthread-touch.c      | 211 ++++++++++++++++++
 .../platform/vivid/vivid-kthread-touch.h      |  13 ++
 .../media/platform/vivid/vivid-touch-cap.c    | 160 +++++++++++++
 .../media/platform/vivid/vivid-touch-cap.h    |  18 ++
 drivers/media/v4l2-core/v4l2-ioctl.c          |  33 +--
 10 files changed, 578 insertions(+), 24 deletions(-)
 create mode 100644 drivers/media/platform/vivid/vivid-kthread-touch.c
 create mode 100644 drivers/media/platform/vivid/vivid-kthread-touch.h
 create mode 100644 drivers/media/platform/vivid/vivid-touch-cap.c
 create mode 100644 drivers/media/platform/vivid/vivid-touch-cap.h

-- 
2.17.1

