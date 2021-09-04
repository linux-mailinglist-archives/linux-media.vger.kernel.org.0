Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 31EEF400D88
	for <lists+linux-media@lfdr.de>; Sun,  5 Sep 2021 01:28:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237682AbhIDX3P (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 4 Sep 2021 19:29:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237663AbhIDX3M (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 4 Sep 2021 19:29:12 -0400
Received: from bombadil.infradead.org (unknown [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3083C061575;
        Sat,  4 Sep 2021 16:28:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
        Content-ID:Content-Description:In-Reply-To:References;
        bh=Zk3uQBAXf/fzxJY9diVoDReXvr6larCYLw+BtA10j6I=; b=iTR5+7mZD1qOB7hi9Oc+218JdS
        6r4/mlMDQtpr8aQ4G+j7UjWOYNbbttTiRDNL5lROOFnHYzCTSMqdoMME1ZwGnqkOwhaMTAm7glmHy
        de4HzRNrMU5/PUY+BhojwqpsnUR2lg3HaJWQ6A/RTY9jsNhU7mLB53n9ExVd3gZcJRd/fwijiWA4O
        Pv+MDV2iX9e15arutC6dIR/8+iI8AeVF7C0trAE25abtfgvmNYHTOQcCBJa4XkUyU+boiMTAqcx5W
        ujRfYqwZMC1zCdweoWbAUyQDMsK/oSdNxBE0FyZKB4aYuxnLVKDZHzuen8VzMqwxCeA5sdk88rU1Q
        UKzu9ibQ==;
Received: from [2601:1c0:6280:3f0::aa0b] (helo=bombadil.infradead.org)
        by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1mMf4z-00EsH6-MC; Sat, 04 Sep 2021 23:28:09 +0000
From:   Randy Dunlap <rdunlap@infradead.org>
To:     linux-kernel@vger.kernel.org
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        kernel test robot <lkp@intel.com>,
        "Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Subject: [PATCH] media: i2c: ths8200 needs V4L2_ASYNC
Date:   Sat,  4 Sep 2021 16:28:08 -0700
Message-Id: <20210904232808.25638-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fix the build errors reported by the kernel test robot by
selecting V4L2_ASYNC:

mips-linux-ld: drivers/media/i2c/ths8200.o: in function `ths8200_remove':
ths8200.c:(.text+0x1ec): undefined reference to `v4l2_async_unregister_subdev'
mips-linux-ld: drivers/media/i2c/ths8200.o: in function `ths8200_probe':
ths8200.c:(.text+0x404): undefined reference to `v4l2_async_register_subdev'

Fixes: ed29f89497006 ("media: i2c: ths8200: support asynchronous probing")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Reported-by: kernel test robot <lkp@intel.com>
Cc: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Ezequiel Garcia <ezequiel@collabora.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org
---
 drivers/media/i2c/Kconfig |    1 +
 1 file changed, 1 insertion(+)

--- linux-next-20210903.orig/drivers/media/i2c/Kconfig
+++ linux-next-20210903/drivers/media/i2c/Kconfig
@@ -597,6 +597,7 @@ config VIDEO_AK881X
 config VIDEO_THS8200
 	tristate "Texas Instruments THS8200 video encoder"
 	depends on VIDEO_V4L2 && I2C
+	select V4L2_ASYNC
 	help
 	  Support for the Texas Instruments THS8200 video encoder.
 
