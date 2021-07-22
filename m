Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC0D53D2DC9
	for <lists+linux-media@lfdr.de>; Thu, 22 Jul 2021 22:36:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231341AbhGVTyR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 22 Jul 2021 15:54:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231163AbhGVTyE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 22 Jul 2021 15:54:04 -0400
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A55BC061575;
        Thu, 22 Jul 2021 13:34:38 -0700 (PDT)
Received: by mail-wr1-x435.google.com with SMTP id b7so39939wri.8;
        Thu, 22 Jul 2021 13:34:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=GE21SVbP56JLHHeeUD31HSFfx1lzRy5IzAMg4KQauls=;
        b=FA7ZdzRjIUOdgr/EcEsxpgq0ybuGaGcbTPEjgnuGIS7X5PMzIC1PGUL/jzX767HqV8
         AzdtpOxpm8+2cSKmY0Wmwyvp1tFNivX1uy0dOHt6Lt9lt62zRqNEI+v43LdD2+fHTETT
         +TKfZ4Ybx/RfNZNDf4yZ4Nit23rrwPAXgUWegjt+eOe4zp/mZm4JzYf96+pLAj+himHg
         pOTL+oGXjW21ZnilIAFeJvQgU8BZt65ybCK9sLuepMOFh9wrqFJQAMhdzqLi7iTASYN0
         62luwvwABc/hkRokJX4RkOF84I+vxesh91MoSvfXJ32nIGYM3TZqgYIQ3ENDQcUapQXT
         f/Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GE21SVbP56JLHHeeUD31HSFfx1lzRy5IzAMg4KQauls=;
        b=CEXBjQiVSDjdOWXflpnhxXdwiCQr1Hb8mYnPKFyNXacpiva3yLxRSb6dlZtfzTRbu1
         4AxJ6Ss6tVGTfTBC9FN1IBvljmtLJ5/jba+cIyAi8iMJk5/43SysmAyEIbMI8CVxtvId
         k35JxSoWJIZK7H5exmint0e5NYej4suQYYQjqRc6XuyVxa0Y+T3KH53rGi9qCF1QwV15
         ew4KeD06rFgc86UkzIfz+8eQbNftFW6/0eGJJzrYwhmn3Clj30rrW4wpF9wi/KgTbqMm
         PzDzmHgx+C/BdQQ5NNcIh9j37nrGS6K7TlqkchA38w+F1l3AyYbkJ3m/Whq/KKsROeeq
         1rqQ==
X-Gm-Message-State: AOAM5315lX7VrS6OCRY/D2fVA6k6RTJwtVqA8+dj+ztgDdlkdTyxFuwP
        hU796BqUOKqaj+pXGXy6O5g=
X-Google-Smtp-Source: ABdhPJyW7/VwMGMyAYEN1Y/4BfCMDQWlVAqvRUHcmQDr5vaK8LY2bOIqO05DjxHBxIrXzk016Z37mA==
X-Received: by 2002:a05:6000:231:: with SMTP id l17mr1828100wrz.40.1626986076857;
        Thu, 22 Jul 2021 13:34:36 -0700 (PDT)
Received: from valhalla.home ([2.29.20.106])
        by smtp.gmail.com with ESMTPSA id b16sm31036455wrw.46.2021.07.22.13.34.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jul 2021 13:34:36 -0700 (PDT)
From:   Daniel Scally <djrscally@gmail.com>
To:     Daniel Scally <djrscally@gmail.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Yang Li <yang.lee@linux.alibaba.com>,
        linux-media@vger.kernel.org (open list:MEDIA INPUT INFRASTRUCTURE
        (V4L/DVB)), linux-kernel@vger.kernel.org (open list)
Cc:     Yong Zhi <yong.zhi@intel.com>, Bingbu Cao <bingbu.cao@intel.com>,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        Colin Ian King <colin.king@canonical.com>,
        laurent.pinchart@ideasonboard.com, kieran.bingham@ideasonboard.com
Subject: [PATCH 11/13] media: i2c: Switch exposure control unit to lines
Date:   Thu, 22 Jul 2021 21:34:05 +0100
Message-Id: <20210722203407.3588046-12-djrscally@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210722203407.3588046-1-djrscally@gmail.com>
References: <20210722203407.3588046-1-djrscally@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The ov8865 driver currently has the unit of the V4L2_CID_EXPOSURE control
as 1/16th of a line. This is what the sensor expects, but isn't very
intuitive. Switch the control to be in units of a line and simply do the
16x multiplication before passing the value to the sensor.

The datasheet for this sensor gives minimum exposure as 2 lines, so take
the opportunity to correct the lower bounds of the control.

Signed-off-by: Daniel Scally <djrscally@gmail.com>
---
 drivers/media/i2c/ov8865.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/ov8865.c b/drivers/media/i2c/ov8865.c
index 4954808f5416..dca4db3039bb 100644
--- a/drivers/media/i2c/ov8865.c
+++ b/drivers/media/i2c/ov8865.c
@@ -2126,6 +2126,9 @@ static int ov8865_exposure_configure(struct ov8865_sensor *sensor, u32 exposure)
 {
 	int ret;
 
+	/* The sensor stores exposure in units of 1/16th of a line */
+	exposure *= 16;
+
 	ret = ov8865_write(sensor, OV8865_EXPOSURE_CTRL_HH_REG,
 			   OV8865_EXPOSURE_CTRL_HH(exposure));
 	if (ret)
@@ -2525,8 +2528,8 @@ static int ov8865_ctrls_init(struct ov8865_sensor *sensor)
 
 	/* Exposure */
 
-	ctrls->exposure = v4l2_ctrl_new_std(handler, ops, V4L2_CID_EXPOSURE, 16,
-					    1048575, 16, 512);
+	ctrls->exposure = v4l2_ctrl_new_std(handler, ops, V4L2_CID_EXPOSURE, 2,
+					    65535, 1, 32);
 
 	/* Gain */
 
-- 
2.25.1

