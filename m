Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E208943ACE2
	for <lists+linux-media@lfdr.de>; Tue, 26 Oct 2021 09:12:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235173AbhJZHOt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 26 Oct 2021 03:14:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231801AbhJZHOb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 26 Oct 2021 03:14:31 -0400
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BCAC8C061767;
        Tue, 26 Oct 2021 00:12:07 -0700 (PDT)
Received: by mail-pj1-x1035.google.com with SMTP id u12so6167485pjy.1;
        Tue, 26 Oct 2021 00:12:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=pcmEq5vv4/Zod2OeFqMFRTk1dpSjGR5ACaXGxWChEao=;
        b=UROeYmwKyzBBptFZ2WM2sIvqfej1E24tNMxcO+fJbUuoHrtg/lP7jjI67OH+qdCK4c
         2EX6FMwa7uegRS2RqUpww4jwphTv3ml7Ungd7Ij4XVp63cooOxW5qnW3tLyuLnL4Ujec
         yQTW9BW+JoxLOLN3rYXVIFEeMznSxvuuCrfsVwkgbJCscGZIaOkCz3EXJPM0XoNyNhB5
         wWzFJss7rNc1Nx1qv4ymI2cYLw47ggMMnOVtp1I/v4Wx8VSxQP/njbRy1wHnwUsLcKK1
         4Y9AhoJBsGfjAxDCp94+ofWuBiouce9rBw3kpF2H/QE8vQSax6TWM9HPtsL/BuMIu2jj
         ZFmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=pcmEq5vv4/Zod2OeFqMFRTk1dpSjGR5ACaXGxWChEao=;
        b=eBl//hy0vXcR+NIXbHnKeSTBmb1NpBlmArRpqvbNi2GPMqNMeO7PseMupDwSU62zB/
         xvBY9ZRcHsASPbtdwirwPjQT5h1qUqb5hXRHrZWeogcQJGCsZXRw+i4UmGOdGUK3n5NJ
         suIhHnYlfqEKzd5LoUAq/BsiLQndo1byd6+vqWUBSe/oSSll5SvLVnr2fZdzi5UHrbBD
         7BrupeDzvn3L8AxUxUgh5wFlTCjxLwGw2dFBzsw1VdoHuAQr4evS0VXsLX4PiKUQgHMS
         9bHEn/69mZ+2wnCVzeBlal93YHZ3d1ZoSMDDw0806s6/UXjdYNig1VZ0FD1IXlzdaZPS
         1AzA==
X-Gm-Message-State: AOAM530Wazjett2sFirdqKzh7wunLRwDrwjqHmZu4/pZhMvlTXsilzqK
        c2Uon0uJx7x4+D81kMt3mGc=
X-Google-Smtp-Source: ABdhPJziu59cIkiWnsyl37/UYoRpXfnGMq87xvUw1+ZM3AAuKyK6nSnS4JbZ8hGQuLkxHrsKU3d2lA==
X-Received: by 2002:a17:90a:2bca:: with SMTP id n10mr27232652pje.241.1635232327365;
        Tue, 26 Oct 2021 00:12:07 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([137.59.103.165])
        by smtp.gmail.com with ESMTPSA id l11sm23243367pjg.22.2021.10.26.00.12.02
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 26 Oct 2021 00:12:07 -0700 (PDT)
From:   Dillon Min <dillon.minfei@gmail.com>
To:     mchehab@kernel.org, mchehab+huawei@kernel.org,
        hverkuil-cisco@xs4all.nl, ezequiel@collabora.com, gnurou@gmail.com,
        pihsun@chromium.org, mcoquelin.stm32@gmail.com,
        alexandre.torgue@foss.st.com, mturquette@baylibre.com,
        sboyd@kernel.org, robh+dt@kernel.org, gabriel.fernandez@st.com,
        gabriel.fernandez@foss.st.com
Cc:     patrice.chotard@foss.st.com, hugues.fruchet@foss.st.com,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, lkp@intel.com, kbuild-all@lists.01.org,
        llvm@lists.linux.dev
Subject: [PATCH v7 07/10] media: v4l2-ctrls: Add V4L2_CID_COLORFX_CBCR max setting
Date:   Tue, 26 Oct 2021 15:11:19 +0800
Message-Id: <1635232282-3992-8-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1635232282-3992-1-git-send-email-dillon.minfei@gmail.com>
References: <1635232282-3992-1-git-send-email-dillon.minfei@gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The max of V4L2_CID_COLORFX_CBCR is 0xffff, so add it to v4l2_ctrl_fill()
to sure not beyond that.

Signed-off-by: Dillon Min <dillon.minfei@gmail.com>
---
 drivers/media/v4l2-core/v4l2-ctrls-defs.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
index ebe82b6ba6e6..0cb6c0f18b39 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
@@ -1400,6 +1400,12 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
 		/* Max is calculated as RGB888 that is 2^24 */
 		*max = 0xFFFFFF;
 		break;
+	case V4L2_CID_COLORFX_CBCR:
+		*type = V4L2_CTRL_TYPE_INTEGER;
+		*step = 1;
+		*min = 0;
+		*max = 0xffff;
+		break;
 	case V4L2_CID_FLASH_FAULT:
 	case V4L2_CID_JPEG_ACTIVE_MARKER:
 	case V4L2_CID_3A_LOCK:
-- 
2.7.4

