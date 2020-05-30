Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A78071E936F
	for <lists+linux-media@lfdr.de>; Sat, 30 May 2020 21:32:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729299AbgE3TcM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 30 May 2020 15:32:12 -0400
Received: from mail.kernel.org ([198.145.29.99]:34412 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729268AbgE3TcM (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 30 May 2020 15:32:12 -0400
Received: from mail.kernel.org (ip5f5ad5c5.dynamic.kabel-deutschland.de [95.90.213.197])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6C93B2074D;
        Sat, 30 May 2020 19:32:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1590867131;
        bh=7cTkxXgRiO29IpoJV/L31iUYghUqHIk+zT/61X8nXHg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=x25j37GIR0zDzDogC9mR5LgH744ECJoTi3FgRrMr/vfPOysZFGKBK5b3FzFujp3X4
         c5zFybjcb+RCgApg1ul0tGG/wuPL36Qrp2nHA2lxixcZkFs7V4TTfqy3BMAH88qqZu
         RK2RBFTsDHeiJ2WzioyGutcG7lVTMqncXWffXMqQ=
Received: from mchehab by mail.kernel.org with local (Exim 4.93)
        (envelope-from <mchehab@kernel.org>)
        id 1jf7DF-003LJC-CW; Sat, 30 May 2020 21:32:09 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org, devel@driverdev.osuosl.org
Subject: [PATCH 2/2] media: atomisp: get rid of sh_css_pipe.c
Date:   Sat, 30 May 2020 21:32:08 +0200
Message-Id: <7d398a74c789941b36646d1b27cada97a8b58b06.1590866796.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1590866796.git.mchehab+huawei@kernel.org>
References: <cover.1590866796.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

There's nothing there, just comments.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/staging/media/atomisp/Makefile          |  1 -
 drivers/staging/media/atomisp/pci/sh_css_pipe.c | 17 -----------------
 2 files changed, 18 deletions(-)
 delete mode 100644 drivers/staging/media/atomisp/pci/sh_css_pipe.c

diff --git a/drivers/staging/media/atomisp/Makefile b/drivers/staging/media/atomisp/Makefile
index 0b62020f9b8b..9dc8072799e3 100644
--- a/drivers/staging/media/atomisp/Makefile
+++ b/drivers/staging/media/atomisp/Makefile
@@ -37,7 +37,6 @@ atomisp-objs += \
 	pci/sh_css_param_dvs.o \
 	pci/sh_css_param_shading.o \
 	pci/sh_css_params.o \
-	pci/sh_css_pipe.o \
 	pci/sh_css_properties.o \
 	pci/sh_css_shading.o \
 	pci/sh_css_sp.o \
diff --git a/drivers/staging/media/atomisp/pci/sh_css_pipe.c b/drivers/staging/media/atomisp/pci/sh_css_pipe.c
deleted file mode 100644
index b6bd47d9b01c..000000000000
--- a/drivers/staging/media/atomisp/pci/sh_css_pipe.c
+++ /dev/null
@@ -1,17 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-/*
- * Support for Intel Camera Imaging ISP subsystem.
- * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
- */
-
-/* This file will contain the code to implement the functions declared in ia_css_pipe.h and ia_css_pipe_public.h
-   and associated helper functions */
-- 
2.26.2

