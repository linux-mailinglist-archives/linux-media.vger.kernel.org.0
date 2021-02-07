Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 12E4631287D
	for <lists+linux-media@lfdr.de>; Mon,  8 Feb 2021 00:59:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229621AbhBGX5U (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 7 Feb 2021 18:57:20 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:56652 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229564AbhBGX5T (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 7 Feb 2021 18:57:19 -0500
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 397DC50E;
        Mon,  8 Feb 2021 00:56:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1612742197;
        bh=j62a2IBrKAx6szs8IhFDSokvcWMBJWFIY+SK4ilnSuE=;
        h=From:To:Cc:Subject:Date:From;
        b=EfFlQsg9GHqdO65S5OkYx2heu5nn6gwwzugOPRSoIoF/HYYjBLnlLLO24pSxDWnXP
         ogdLNx0B149rbog/G8B6GxNZ+Ls3xZKI/zLJjIdgmryOBin1JQaA06vYv18BixiWMW
         /gwAbRENRpm41GPko45KbLDqC5itGcJoRIoT0Gg8=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Tianshu Qiu <tian.shu.qiu@intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: [PATCH] media: staging: ipu3: uapi: Add "WITH Linux-syscall-note" license
Date:   Mon,  8 Feb 2021 01:56:10 +0200
Message-Id: <20210207235610.15687-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

All Linux headers licensed under the GPL-2.0 must include a "WITH
Linux-syscall-note" extension in their SPDX license identifier, as
enforced by the scripts/headers_install.sh script. Fix the Intel IPU3
UAPI header currently stored with the driver in staging.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/staging/media/ipu3/include/intel-ipu3.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/ipu3/include/intel-ipu3.h b/drivers/staging/media/ipu3/include/intel-ipu3.h
index edd8edda0647..9b644fb23dde 100644
--- a/drivers/staging/media/ipu3/include/intel-ipu3.h
+++ b/drivers/staging/media/ipu3/include/intel-ipu3.h
@@ -1,4 +1,4 @@
-/* SPDX-License-Identifier: GPL-2.0 */
+/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
 /* Copyright (C) 2017 - 2018 Intel Corporation */
 
 #ifndef __IPU3_UAPI_H
-- 
Regards,

Laurent Pinchart

