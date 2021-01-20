Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 25C6C2FD41C
	for <lists+linux-media@lfdr.de>; Wed, 20 Jan 2021 16:37:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388024AbhATOv6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 20 Jan 2021 09:51:58 -0500
Received: from mail.kernel.org ([198.145.29.99]:39806 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2390610AbhATO0b (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 20 Jan 2021 09:26:31 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4FF9623329;
        Wed, 20 Jan 2021 14:25:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1611152751;
        bh=Ml82Ilk3uWAR/baEBX67sDIIYM3HJlb7ixtfUzEqphk=;
        h=From:To:Cc:Subject:Date:From;
        b=OgCaqSQxyf/TYabaAu/7452GFpIaDNNChmi7Fvh81dHNW59960jD0tUcu9CQCWqXN
         Hd+Bty+9uH0j4TU3l37nfk3DjmqbRAiuzVoC1d+lEWQBXGeYcKjZPIUtVH0HFYp987
         PWd6ZW65ngKK/M/qGphumL1PMS6tiGBAf2W0aqONC2vHXm855U/8el7liqEmR41FV3
         zKU+iPpC/NcADQQLxgbcEbl6r/YqFW9MoedDH+oDIJTQ73HHYbAX7TKO+enosL8nj5
         QdNMTKISggRapuGEBoCn7Y/dAj5Oaf9QJwHgb8GRpTqJRpCE7qdvITt5AmRgNmD0wz
         5SvlazTvRUHLw==
From:   Arnd Bergmann <arnd@kernel.org>
To:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, Sean Young <sean@mess.org>
Cc:     Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH 0/2] media: rc: remove obsolete drivers
Date:   Wed, 20 Jan 2021 15:25:40 +0100
Message-Id: <20210120142542.4100741-1-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Arnd Bergmann <arnd@arndb.de>

A few Arm platforms are getting removed in v5.12, this removes
the corresponding remote control drivers.

Link: https://lore.kernel.org/linux-arm-kernel/20210120124812.2800027-1-arnd@kernel.org/T/


Arnd Bergmann (2):
  media: rc: remove tango ir driver
  media: rc: remove zte zx ir driver

 .../devicetree/bindings/media/zx-irdec.txt    |  14 -
 drivers/media/rc/Kconfig                      |  21 --
 drivers/media/rc/Makefile                     |   2 -
 drivers/media/rc/tango-ir.c                   | 267 ------------------
 drivers/media/rc/zx-irdec.c                   | 181 ------------
 5 files changed, 485 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/media/zx-irdec.txt
 delete mode 100644 drivers/media/rc/tango-ir.c
 delete mode 100644 drivers/media/rc/zx-irdec.c

-- 
2.29.2

