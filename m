Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E3B032AC39E
	for <lists+linux-media@lfdr.de>; Mon,  9 Nov 2020 19:22:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730007AbgKISWR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Nov 2020 13:22:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729740AbgKISWQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 9 Nov 2020 13:22:16 -0500
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9036C0613D3
        for <linux-media@vger.kernel.org>; Mon,  9 Nov 2020 10:22:14 -0800 (PST)
Received: by mail-wr1-x42f.google.com with SMTP id c17so9798038wrc.11
        for <linux-media@vger.kernel.org>; Mon, 09 Nov 2020 10:22:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4P2xmgevp6DARNoI93TPQjmwkxCbh1dSMEz+Iq7USWQ=;
        b=Pxyzv6hbcgjcrX05VpRCx6Ets2223lXot8ZTbClQRJLprCn0ly07zluqvcckUwBv2G
         NIq6z87PB5x9f1wUlv638Irwanc+OCehWWNhnOFFti+l0O7APSHjCjOl9+k8Py5fD6m9
         eUpg7v2rXyNZtFFFL5AWVl1eAmjGjlADa7/4FvXsH5K8UheAwCD+/fH3EMyvjWDiOJnR
         o/SHANbbNGirUUevHyRC0LQBOS2jxr2hOW4gi0YMIrz48DvJrVIRIgs8jWlx4/g9EeoX
         e4kt601ZYAkpa0jtbL1BheC/y7YKMhB1t8j8y3TcDYijFThVu98lbFsKHZPh0lS2XuxR
         q3kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4P2xmgevp6DARNoI93TPQjmwkxCbh1dSMEz+Iq7USWQ=;
        b=B71PZ5tc8cbaTxc7lHyY4ZoKuI2qA8xtM96uhHfwnw8zDmoNLxcJlGdE5Q5X0iFwU2
         FlcQOmHkUjlHuCJKhqtWHs1cADj78ULshnJyvuKr2AzbWVKf0Rz7wWKR5FyYFuwxDijt
         YStktZl1fRFqZHwvlkMUwoF5GX1oE+gqnZppHBvRDE9VQrl/0Rn+Pwda8xTh1xspKv37
         kcYPuyHEIvZ7d0YdudSeFZiWBYWyswBR5m1ELrzvjmVia2Ib2eB/YRlo4HPdTBdAR/cp
         4BXpLHiCQdm4kvtQ6KObU3uNXDBJZLFxXPvuYq/hSIb2muB4ZMO+p5hR9642+AohGzuo
         Z/hQ==
X-Gm-Message-State: AOAM5302RIvEpZtFN5gpGmiGFdmloIgF55YCwDLxys630eziiZV9EdIB
        O8tDD06Y6HIg6I+lYx1AmyvUQg==
X-Google-Smtp-Source: ABdhPJxhRwyrEVueE23+RLeJQ/TbrawEL5WZ/GkvIUQxW/l/GeVywuz/qg1kBRs7igqCfZa2ZMZnvw==
X-Received: by 2002:adf:de85:: with SMTP id w5mr4447254wrl.90.1604946133526;
        Mon, 09 Nov 2020 10:22:13 -0800 (PST)
Received: from dell.default ([91.110.221.180])
        by smtp.gmail.com with ESMTPSA id g186sm735365wma.1.2020.11.09.10.22.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2020 10:22:12 -0800 (PST)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org,
        Adrian Hunter <ext-adrian.hunter@nokia.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Ben Dooks <ben@simtec.co.uk>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Boris BREZILLON <b.brezillon.dev@gmail.com>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Brian Norris <computersforpeace@gmail.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Choudary Kalluri <punnaia@xilinx.com>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        Dan Brown <dan_brown@ieee.org>,
        David Woodhouse <dwmw2@infradead.org>,
        Dmitriy B <rzk333@gmail.com>, dri-devel@lists.freedesktop.org,
        Frieder Schrempf <frieder.schrempf@kontron.de>,
        Jian Zhang <jzhang@ti.com>,
        =?UTF-8?q?Jochen=20Sch=C3=A4uble?= <psionic@psionic.de>,
        Kamal Dasu <kdasu.kdev@gmail.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Kukjin Kim <kgene@kernel.org>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        linaro-mm-sig@lists.linaro.org, linux-media@vger.kernel.org,
        linux-mtd@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
        linux-samsung-soc@vger.kernel.org,
        Maxime Ripard <mripard@kernel.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Naga Sureshkumar Relli <nagasure@xilinx.com>,
        Nicolas Pitre <nico@fluxnic.net>,
        Paul Mackerras <paulus@samba.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Qiang Yu <yuq825@gmail.com>,
        Richard Weinberger <richard@nod.at>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        Sergey Lapin <slapin@ossfans.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Thomas Gleixner <gleixner@linutronix.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        Tudor Ambarus <tudor.ambarus@microchip.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Yoshio Furuyama <ytc-mb-yfuruyama7@kioxia.com>
Subject: [PATCH v3 00/23] Rid W=1 warnings in MTD
Date:   Mon,  9 Nov 2020 18:21:43 +0000
Message-Id: <20201109182206.3037326-1-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This set is part of a larger effort attempting to clean-up W=1
kernel builds, which are currently overwhelmingly riddled with
niggly little warnings.

v2 => v3:
  - Reworded subject lines

v1 => v2:
  - Added tags
  - Satisfied Miquel's review comments
  
Lee Jones (23):
  mtd: mtdpart: Fix misdocumented function parameter 'mtd'
  mtd: devices: phram: File headers are not good candidates for
    kernel-doc
  mtd: onenand: onenand_base: Fix expected kernel-doc formatting
  mtd: devices: docg3: Fix kernel-doc 'bad line' and 'excessive doc'
    issues
  mtd: Fix misspelled function parameter 'section'
  mtd: onenand: onenand_bbt: Fix expected kernel-doc formatting
  mtd: spi-nor: hisi-sfc: Demote non-conformant kernel-doc
  mtd: ubi: build: Document 'ubi_num' in struct mtd_dev_param
  mtd: spinand: toshiba: Demote non-conformant kernel-doc header
  mtd: ubi: kapi: Correct documentation for 'ubi_leb_read_sg's 'sgl'
    parameter
  mtd: ubi: eba: Fix a couple of misdocumentation issues
  mtd: ubi: wl: Fix a couple of kernel-doc issues
  mtd: rawnand: brcmnand: Demote non-conformant kernel-doc headers
  mtd: ubi: gluebi: Fix misnamed function parameter documentation
  mtd: rawnand: diskonchip: Marking unused variables as __always_unused
  mtd: rawnand: cafe_nand: Remove superfluous param doc and add another
  mtd: rawnand: s3c2410: Add documentation for 2 missing struct members
  mtd: rawnand: omap_elm: Finish half populated function header, demote
    empty ones
  mtd: rawnand: omap2: Fix a bunch of kernel-doc misdemeanours
  mtd: rawnand: sunxi: Document 'sunxi_nfc's 'caps' member
  mtd: rawnand: arasan: Document 'anfc_op's 'buf' member
  mtd: onenand: Fix some kernel-doc misdemeanours
  mtd: devices: powernv_flash: Add function names to headers and fix
    'dev'

 drivers/mtd/devices/docg3.c                   |   5 +-
 drivers/mtd/devices/phram.c                   |   2 +-
 drivers/mtd/devices/powernv_flash.c           |   5 +-
 drivers/mtd/mtdcore.c                         |   2 +-
 drivers/mtd/mtdpart.c                         |   2 +-
 drivers/mtd/nand/onenand/onenand_base.c       | 444 +++++++++---------
 drivers/mtd/nand/onenand/onenand_bbt.c        |  32 +-
 drivers/mtd/nand/raw/arasan-nand-controller.c |   1 +
 drivers/mtd/nand/raw/brcmnand/brcmnand.c      |   6 +-
 drivers/mtd/nand/raw/cafe_nand.c              |   2 +-
 drivers/mtd/nand/raw/diskonchip.c             |   4 +-
 drivers/mtd/nand/raw/omap2.c                  |  18 +-
 drivers/mtd/nand/raw/omap_elm.c               |   7 +-
 drivers/mtd/nand/raw/s3c2410.c                |   4 +-
 drivers/mtd/nand/raw/sunxi_nand.c             |   1 +
 drivers/mtd/nand/spi/toshiba.c                |   2 +-
 drivers/mtd/spi-nor/controllers/hisi-sfc.c    |   2 +-
 drivers/mtd/ubi/build.c                       |   1 +
 drivers/mtd/ubi/eba.c                         |   3 +-
 drivers/mtd/ubi/gluebi.c                      |   2 +-
 drivers/mtd/ubi/kapi.c                        |   2 +-
 drivers/mtd/ubi/wl.c                          |   3 +-
 22 files changed, 278 insertions(+), 272 deletions(-)

Cc: Adrian Hunter <ext-adrian.hunter@nokia.com>
Cc: bcm-kernel-feedback-list@broadcom.com
Cc: Ben Dooks <ben@simtec.co.uk>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Boris BREZILLON <b.brezillon.dev@gmail.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Brian Norris <computersforpeace@gmail.com>
Cc: Chen-Yu Tsai <wens@csie.org>
Cc: Choudary Kalluri <punnaia@xilinx.com>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: Dan Brown <dan_brown@ieee.org>
Cc: David Woodhouse <dwmw2@infradead.org>
Cc: Dmitriy B <rzk333@gmail.com>
Cc: dri-devel@lists.freedesktop.org
Cc: Frieder Schrempf <frieder.schrempf@kontron.de>
Cc: Jian Zhang <jzhang@ti.com>
Cc: "Jochen Schäuble" <psionic@psionic.de>
Cc: Kamal Dasu <kdasu.kdev@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Kukjin Kim <kgene@kernel.org>
Cc: Kyungmin Park <kyungmin.park@samsung.com>
Cc: linaro-mm-sig@lists.linaro.org
Cc: linux-media@vger.kernel.org
Cc: linux-mtd@lists.infradead.org
Cc: linuxppc-dev@lists.ozlabs.org
Cc: linux-samsung-soc@vger.kernel.org
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Naga Sureshkumar Relli <nagasure@xilinx.com>
Cc: Nicolas Pitre <nico@fluxnic.net>
Cc: Paul Mackerras <paulus@samba.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Qiang Yu <yuq825@gmail.com>
Cc: Richard Weinberger <richard@nod.at>
Cc: Robert Jarzmik <robert.jarzmik@free.fr>
Cc: Sergey Lapin <slapin@ossfans.org>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: Thomas Gleixner <gleixner@linutronix.de>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>
Cc: Vignesh Raghavendra <vigneshr@ti.com>
Cc: Yoshio Furuyama <ytc-mb-yfuruyama7@kioxia.com>
-- 
2.25.1

