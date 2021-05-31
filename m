Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 97DFA3964CE
	for <lists+linux-media@lfdr.de>; Mon, 31 May 2021 18:10:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232391AbhEaQMR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 31 May 2021 12:12:17 -0400
Received: from mail.kernel.org ([198.145.29.99]:47454 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234253AbhEaQJ4 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 31 May 2021 12:09:56 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1945061375;
        Mon, 31 May 2021 16:08:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622477296;
        bh=7nRQNUs2rErpkS0ZCYK+pzNS57N7bTyK9fM/MXtKnCE=;
        h=From:To:Cc:Subject:Date:From;
        b=iB8LhCn1LrbfxBQBNZRI1SAtLtIsiG2Qe4pwN/IVRugrt2zm+h0aMrB6UT7XP+TTr
         JhM7EJAQSdplHfDEZq+aOl3F2n5LxvAj8GZuKhM9cjTnltbv/ORRWUBk5sIyhS9+WO
         UeT+q2g+6+ieokRE5bu0oob9G6UWVpVERie/NSXND2BrtlIIek/Tc+SNT3WT6epf31
         RvCr1JJmU/tDxnfN5ynZ1o+MkXViDZsZYHCAI8zzDIOiIWaD4wixnw6Lea/UO0L8AB
         sA9txjzHlK70ILn6wAwhN9GdUGSsqU3GYz0gQejQg0fHJXftNSAs6W9EAo6euMiACa
         1m8tYh6dgQ6jw==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1lnkSb-000epK-IN; Mon, 31 May 2021 18:08:13 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev
Subject: [PATCH 0/2] Move av7110 driver to staging
Date:   Mon, 31 May 2021 18:08:10 +0200
Message-Id: <cover.1622476959.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This driver was written for a hardware manufactured by
Convergence, which bankrupted and stopped manufacturing av7110
chipset more than 15 years ago.

Recent checks identified that a frontend used by such driver was
broken for sometime without nobody noticing it.

It means that it is time to retire it for good.

Mauro Carvalho Chehab (2):
  media: move ttpci-eeprom to common
  media: av7110: move driver to staging

 drivers/media/common/Kconfig                  |  4 +
 drivers/media/common/Makefile                 |  1 +
 .../{pci/ttpci => common}/ttpci-eeprom.c      |  0
 .../{pci/ttpci => common}/ttpci-eeprom.h      |  0
 drivers/media/pci/ttpci/Kconfig               | 74 -------------------
 drivers/media/pci/ttpci/Makefile              | 11 +--
 drivers/media/pci/ttpci/budget.h              |  2 +-
 drivers/media/usb/Kconfig                     |  5 --
 drivers/media/usb/dvb-usb/Makefile            |  2 +-
 drivers/staging/media/Kconfig                 |  2 +
 drivers/staging/media/Makefile                |  1 +
 drivers/staging/media/av7110/Kconfig          | 74 +++++++++++++++++++
 drivers/staging/media/av7110/Makefile         | 20 +++++
 drivers/staging/media/av7110/TODO             |  2 +
 .../ttpci => staging/media/av7110}/av7110.c   |  0
 .../ttpci => staging/media/av7110}/av7110.h   |  0
 .../media/av7110}/av7110_av.c                 |  0
 .../media/av7110}/av7110_av.h                 |  0
 .../media/av7110}/av7110_ca.c                 |  0
 .../media/av7110}/av7110_ca.h                 |  0
 .../media/av7110}/av7110_hw.c                 |  0
 .../media/av7110}/av7110_hw.h                 |  0
 .../media/av7110}/av7110_ipack.c              |  0
 .../media/av7110}/av7110_ipack.h              |  0
 .../media/av7110}/av7110_ir.c                 |  0
 .../media/av7110}/av7110_v4l.c                |  0
 .../media/av7110}/budget-patch.c              |  0
 .../media/av7110}/dvb_filter.c                |  0
 .../media/av7110}/dvb_filter.h                |  0
 29 files changed, 107 insertions(+), 91 deletions(-)
 rename drivers/media/{pci/ttpci => common}/ttpci-eeprom.c (100%)
 rename drivers/media/{pci/ttpci => common}/ttpci-eeprom.h (100%)
 create mode 100644 drivers/staging/media/av7110/Kconfig
 create mode 100644 drivers/staging/media/av7110/Makefile
 create mode 100644 drivers/staging/media/av7110/TODO
 rename drivers/{media/pci/ttpci => staging/media/av7110}/av7110.c (100%)
 rename drivers/{media/pci/ttpci => staging/media/av7110}/av7110.h (100%)
 rename drivers/{media/pci/ttpci => staging/media/av7110}/av7110_av.c (100%)
 rename drivers/{media/pci/ttpci => staging/media/av7110}/av7110_av.h (100%)
 rename drivers/{media/pci/ttpci => staging/media/av7110}/av7110_ca.c (100%)
 rename drivers/{media/pci/ttpci => staging/media/av7110}/av7110_ca.h (100%)
 rename drivers/{media/pci/ttpci => staging/media/av7110}/av7110_hw.c (100%)
 rename drivers/{media/pci/ttpci => staging/media/av7110}/av7110_hw.h (100%)
 rename drivers/{media/pci/ttpci => staging/media/av7110}/av7110_ipack.c (100%)
 rename drivers/{media/pci/ttpci => staging/media/av7110}/av7110_ipack.h (100%)
 rename drivers/{media/pci/ttpci => staging/media/av7110}/av7110_ir.c (100%)
 rename drivers/{media/pci/ttpci => staging/media/av7110}/av7110_v4l.c (100%)
 rename drivers/{media/pci/ttpci => staging/media/av7110}/budget-patch.c (100%)
 rename drivers/{media/pci/ttpci => staging/media/av7110}/dvb_filter.c (100%)
 rename drivers/{media/pci/ttpci => staging/media/av7110}/dvb_filter.h (100%)

-- 
2.31.1


