Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 706E04598C6
	for <lists+linux-media@lfdr.de>; Tue, 23 Nov 2021 01:00:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232804AbhKWADq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Nov 2021 19:03:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232529AbhKWADg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Nov 2021 19:03:36 -0500
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C60DC06175A
        for <linux-media@vger.kernel.org>; Mon, 22 Nov 2021 16:00:28 -0800 (PST)
Received: by mail-wm1-x32a.google.com with SMTP id p18so17032079wmq.5
        for <linux-media@vger.kernel.org>; Mon, 22 Nov 2021 16:00:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Fg94uUQn2/SXglU+IC4DmHKHCZy+RICRqtDlkkYk8qQ=;
        b=icFiZHIcemu4dgdti/RAmQIUxSP3EjSd6rTh58Wqwx3FP4WOT8qohhQVK32PQ9aLS4
         IEUBuuv/KgF2I33693Zty5s2HOUGWrkvPZHb4jEoGOwYSGG4sTP2+Cuvp/LtpPIxwjtj
         4sZplevTUYRXZ8iAnW4iIZqL4J9ubRSwdVcJgxBf1leVlAXhXtAhxB4d3PB21i88jF0i
         167kLWY7BLNW/UubASdDZR7cii44dajEPD4PFPd+ajk11+fNTaGUCqypUziqTQgnRDgi
         RMRff8lMQoG5rlreg28DULtMHiy0mtvX9dlLYhdwurYs9GycDvv+cdL3P99T4ML2O+1x
         +tEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Fg94uUQn2/SXglU+IC4DmHKHCZy+RICRqtDlkkYk8qQ=;
        b=ULV1pQiFCyVS99uzTqW6AXYXcseYddQZvNHPJiCm/X5KqMpWlyohDuHRWarT6cclWF
         n4M4SP1UweFxYrKwCeUJf6OgGVvfr8O+YIaDmIm/BbtEQQsH9koXS1cLAyvjisRSMWrR
         SqPv67JAbRg7y03DympDsORZyZCHlvhbNfP/cPmOSOxpGIioUAlM4q6M4+Fs2vY1H2aP
         VvsePuhBEbfXQIpT7ohXBSDr02AJAEE57EJ6X3DDyKg3vml6AvfQl62X+DRndW8iPRiI
         h0Cdmj/YizBFU/qMvO5h6Wbhs0ngTBevge5Wqz0eAh4qp6iae0N8NeCBVeBMvxYZh5Lt
         tVGQ==
X-Gm-Message-State: AOAM5310uBWfXYBZbuF0pRcqiW9ltJZ1rxscKY/HTVjIgJZso72/r9pF
        4VqI41Gy40tQJRCvBDXXXWMnpI2AM0w=
X-Google-Smtp-Source: ABdhPJwYUHed9Ylf1ABB8wj216MIhzimBvL4K58ZgmATlFIlFDADxqv39fRB1PWy3JmGKAdce4+x6w==
X-Received: by 2002:a05:600c:2308:: with SMTP id 8mr1344825wmo.179.1637625626409;
        Mon, 22 Nov 2021 16:00:26 -0800 (PST)
Received: from localhost.localdomain (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net. [86.13.91.161])
        by smtp.gmail.com with ESMTPSA id s13sm23650782wmc.47.2021.11.22.16.00.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Nov 2021 16:00:26 -0800 (PST)
From:   Daniel Scally <djrscally@gmail.com>
To:     linux-media@vger.kernel.org, paul.kocialkowski@bootlin.com
Cc:     sakari.ailus@linux.intel.com, andriy.shevchenko@linux.intel.com,
        laurent.pinchart@ideasonboard.com, yong.zhi@intel.com,
        bingbu.cao@intel.com, jeanmichel.hautbois@ideasonboard.com,
        kieran.bingham@ideasonboard.com, hdegoede@redhat.com
Subject: [PATCH v5 02/17] media: i2c: ov8865: Fix lockdep error
Date:   Tue, 23 Nov 2021 00:00:02 +0000
Message-Id: <20211123000017.43187-3-djrscally@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211123000017.43187-1-djrscally@gmail.com>
References: <20211123000017.43187-1-djrscally@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Hans de Goede <hdegoede@redhat.com>

ov8865_state_init() calls ov8865_state_mipi_configure() which uses
__v4l2_ctrl_s_ctrl[_int64](). This means that sensor->mutex (which
is also sensor->ctrls.handler.lock) must be locked before calling
ov8865_state_init().

Note ov8865_state_mipi_configure() is also used in other places where
the lock is already held so it cannot be changed itself.

This fixes the following lockdep kernel WARN:

[   13.233421] WARNING: CPU: 0 PID: 8 at drivers/media/v4l2-core/v4l2-ctrls-api.c:833 __v4l2_ctrl_s_ctrl+0x4d/0x60 [videodev]
...
[   13.234063] Call Trace:
[   13.234074]  ov8865_state_configure+0x98b/0xc00 [ov8865]
[   13.234095]  ov8865_probe+0x4b1/0x54c [ov8865]
[   13.234117]  i2c_device_probe+0x13c/0x2d0

Fixes: 11c0d8fdccc5 ("media: i2c: Add support for the OV8865 image sensor")
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
Changes in v5: 

	- None

 drivers/media/i2c/ov8865.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/i2c/ov8865.c b/drivers/media/i2c/ov8865.c
index 490832cdb831..fe064e716ea8 100644
--- a/drivers/media/i2c/ov8865.c
+++ b/drivers/media/i2c/ov8865.c
@@ -2891,7 +2891,9 @@ static int ov8865_probe(struct i2c_client *client)
 	if (ret)
 		goto error_mutex;
 
+	mutex_lock(&sensor->mutex);
 	ret = ov8865_state_init(sensor);
+	mutex_unlock(&sensor->mutex);
 	if (ret)
 		goto error_ctrls;
 
-- 
2.25.1

