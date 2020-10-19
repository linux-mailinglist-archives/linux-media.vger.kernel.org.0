Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 59A23293193
	for <lists+linux-media@lfdr.de>; Tue, 20 Oct 2020 00:59:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388770AbgJSW7c (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 19 Oct 2020 18:59:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388762AbgJSW7b (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 19 Oct 2020 18:59:31 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56CCBC0613CE;
        Mon, 19 Oct 2020 15:59:31 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id t9so1463609wrq.11;
        Mon, 19 Oct 2020 15:59:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=trR1UyLEyLhYwu/ZZWzIY8LJsFTVfoHaHUYXqU+RuAo=;
        b=TF5Jwu+n+5hsltmAMe9WKqv/GARSvja2+5FEGnab0MdKWMrKg1f/QjxmTj8C7QrRd6
         PIJqzMxHUUF1pYeifpwLnFYggN/F+tGMxOpdH0hVkK5ueG3itpwjGwA+TUSlzhScVukx
         fkKBC51ZIEIEqefIDLzaUTUdu3m4xZFWlFm1erc+LiakYeUFHNC9eb3fZbvgeTgGIB1P
         RFgCMHrduVRuKlMvmx7w/Ur/P+C/c35IDLwwe2/sHzS5EPfJTl9VQZwYWNb9Wob96xTF
         I/ic7GYTELhshBP4ubByOVpzwOqpLsApJ5fAX3LCGamEVAl5mxIU+OevoYbCxiv5Cuh7
         NDaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=trR1UyLEyLhYwu/ZZWzIY8LJsFTVfoHaHUYXqU+RuAo=;
        b=Cwyt3ry/K/J2UpnL+2pShzEBbQXJ8cgrq4vCzj0gJhJNhtj/dlBD1D6EM1SWzhO/Kc
         v9F5p1NHTk35fu1AuNd0kGdAUIcEG0OuEWYKWeXYaCO5TEMEdzDaPBi1+xyE9FLlVrxA
         QGXcW/0IA3/VwF8GoLXeX/W9//gqMb4Ot3rxnPqAMMQCI0oE0BAYKGYprnllVRNu37Jd
         3e1HCnEV7lh1S3UOGZF5Zvqc9Q/xOdizSBoHGF/V+fWDm/eNGBX1OpVqwhe+Gd6vW0kS
         I6Fl4R2/D4SSvZrmZfPWghiJEDF1mjUWKln3j2Im1fXup5pa8el+GhrUmSySZxc5VzBO
         ABeQ==
X-Gm-Message-State: AOAM532TO6pssGa7RbJk+Hz9n9Ri2vzBDvVZ94ic7afN5JWS6QvWag3O
        VVPDaqgC0IBcfMGW4U3j5JUYQ1c82D+Kd5h8
X-Google-Smtp-Source: ABdhPJxjhq/YTmJ2G6MVC68lqjRQxQBK0/XdAew4CZD2KivXEbQGSctjjGhNzjBWJ+UoFgECxztSwA==
X-Received: by 2002:adf:f246:: with SMTP id b6mr1597747wrp.111.1603148369737;
        Mon, 19 Oct 2020 15:59:29 -0700 (PDT)
Received: from djrscally-MIIX-510-12ISK.home ([2.26.187.29])
        by smtp.gmail.com with ESMTPSA id u20sm76505wmm.29.2020.10.19.15.59.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2020 15:59:29 -0700 (PDT)
From:   Daniel Scally <djrscally@gmail.com>
To:     linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Cc:     linux.walleij@linaro.org, prabhakar.mahadev-lad.rj@bp.renesas.com,
        heikki.krogerus@linux.intel.com, dmitry.torokhov@gmail.com,
        laurent.pinchart+renesas@ideasonboard.com,
        kieran.bingham+renesas@ideasonboard.com, jacopo+renesas@jmondi.org,
        robh@kernel.org, davem@davemloft.net, linux@rasmusvillemoes.dk,
        andriy.shevchenko@linux.intel.com, sergey.senozhatsky@gmail.com,
        rostedt@goodmis.org, pmladek@suse.com, mchehab@kernel.org,
        tian.shu.qiu@intel.com, bingbu.cao@intel.com,
        sakari.ailus@linux.intel.com, yong.zhi@intel.com,
        rafael@kernel.org, gregkh@linuxfoundation.org, kitakar@gmail.com,
        dan.carpenter@oracle.org
Subject: [RFC PATCH v3 6/9] ipu3-cio2: Rename ipu3-cio2.c to allow module to be built from multiple sources files retaining ipu3-cio2 name
Date:   Mon, 19 Oct 2020 23:59:00 +0100
Message-Id: <20201019225903.14276-7-djrscally@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201019225903.14276-1-djrscally@gmail.com>
References: <20201019225903.14276-1-djrscally@gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

ipu3-cio2 driver needs extending with multiple files; rename the main
source file and specify the renamed file in Makefile to accommodate that.

Signed-off-by: Daniel Scally <djrscally@gmail.com>
---
Changes in v3:
	- patch introduced

 drivers/media/pci/intel/ipu3/Makefile                          | 2 ++
 drivers/media/pci/intel/ipu3/{ipu3-cio2.c => ipu3-cio2-main.c} | 0
 2 files changed, 2 insertions(+)
 rename drivers/media/pci/intel/ipu3/{ipu3-cio2.c => ipu3-cio2-main.c} (100%)

diff --git a/drivers/media/pci/intel/ipu3/Makefile b/drivers/media/pci/intel/ipu3/Makefile
index 98ddd5bea..b4e3266d9 100644
--- a/drivers/media/pci/intel/ipu3/Makefile
+++ b/drivers/media/pci/intel/ipu3/Makefile
@@ -1,2 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0-only
 obj-$(CONFIG_VIDEO_IPU3_CIO2) += ipu3-cio2.o
+
+ipu3-cio2-y += ipu3-cio2-main.o
\ No newline at end of file
diff --git a/drivers/media/pci/intel/ipu3/ipu3-cio2.c b/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c
similarity index 100%
rename from drivers/media/pci/intel/ipu3/ipu3-cio2.c
rename to drivers/media/pci/intel/ipu3/ipu3-cio2-main.c
-- 
2.17.1

