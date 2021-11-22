Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 43CD84598B2
	for <lists+linux-media@lfdr.de>; Tue, 23 Nov 2021 00:56:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231312AbhKVX7m (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Nov 2021 18:59:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230388AbhKVX7k (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Nov 2021 18:59:40 -0500
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 174ACC061714
        for <linux-media@vger.kernel.org>; Mon, 22 Nov 2021 15:56:33 -0800 (PST)
Received: by mail-wr1-x42f.google.com with SMTP id d27so35738709wrb.6
        for <linux-media@vger.kernel.org>; Mon, 22 Nov 2021 15:56:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=C49ukYQDkzktNiDmSCG/QyhYcDoN794qTC8WPG5XUuw=;
        b=jGMcGpvfiRQ73gt29Xk5AsNW+P9bujAKsFXgRWfzgJ6FoGPzuxr6B10oNOzs7NSmvF
         SACwwdfSsqB2hl1VwM10QEqjzAENzCuw8WqRtnta2et4GwGkIPyWtSqjJj+R5E3jxZ0h
         YkhNKF8q75NDGd1tjpP8zAKmJdBAUHdpn9wz97Do58ZN7w8qZZhxeruxmHAxyCI2+Ii+
         9tWvxJ2OvPa0O9/gjcjgTfh34Fago51G59yRSlB8MfUtytSsW4nW99iWx6xXxwMFssfM
         UkOo1k49NjluYPvzWPQ20b55OW24fhJ1xg/4LvLgQO6rAJ0SsbLR19jalzJKLQtiPIzw
         jwIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=C49ukYQDkzktNiDmSCG/QyhYcDoN794qTC8WPG5XUuw=;
        b=axs9gaYfyEyPnR6VkYHL8zIegj1mQDAyEg5yJ+iipJb5oACKysqtc6z02QhDrJJism
         ZQJxC9BaaMZmifBp2p9Q00pMNHyggMFpedKD4o/lgIDeJSAmCaS7otqsvKfj6aAvOztV
         Ib2GZqLgii7HzTi55+TgV2IqiI6qKiFm4pSLfdkOKShev55Lu7gIXOKm9qFKETz1jdG3
         Dah5JYaUiAUWd2gCJG05XHcRWrnlGUFrsAIs5OI5hMQie8ltsA3/Jv6aqCMqQH09trGz
         7MGVSWmK+YhWZQJmQMIRcZwXXAodYbRr2o3OgjTqYMJ5E7goe1wSnfuEfztjKxxY7LFl
         ix0Q==
X-Gm-Message-State: AOAM530WffoWsYbv9SOM+RHu+S/7zTREFdag8AldzBA4IFiSRy56QZrV
        Hcy8s3QfE4JDk+jptMwt/Z09Ix5XALQ=
X-Google-Smtp-Source: ABdhPJwlHHfTm5SzPFfZI1pDqlzGg25UO3YQJAy/dbLs+TuHp2aat+sj4poU/jPiFjSUVal7Gneoqg==
X-Received: by 2002:adf:a1d4:: with SMTP id v20mr1754931wrv.190.1637625391746;
        Mon, 22 Nov 2021 15:56:31 -0800 (PST)
Received: from localhost.localdomain (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net. [86.13.91.161])
        by smtp.gmail.com with ESMTPSA id b188sm10442067wmd.45.2021.11.22.15.56.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Nov 2021 15:56:31 -0800 (PST)
From:   Daniel Scally <djrscally@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     sakari.ailus@linux.intel.com, andriy.shevchenko@linux.intel.com,
        laurent.pinchart@ideasonboard.com, yong.zhi@intel.com,
        bingbu.cao@intel.com, jeanmichel.hautbois@ideasonboard.com,
        kieran.bingham@ideasonboard.com, hdegoede@redhat.com
Subject: [PATCH v6 3/3] media: ipu3-cio2: Add link freq for INT33BE entry
Date:   Mon, 22 Nov 2021 23:56:13 +0000
Message-Id: <20211122235613.41682-4-djrscally@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211122235613.41682-1-djrscally@gmail.com>
References: <20211122235613.41682-1-djrscally@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add a link frequency to the cio2-bridge table of supported sensors.
This means that the driver can parse supported link frequencies from
firmware in the usual way and validate that it can accommodate them.

Signed-off-by: Daniel Scally <djrscally@gmail.com>
---
Changes since v5:

	- None

 drivers/media/pci/intel/ipu3/cio2-bridge.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/pci/intel/ipu3/cio2-bridge.c b/drivers/media/pci/intel/ipu3/cio2-bridge.c
index 0b586b4e537e..b4b8930d795c 100644
--- a/drivers/media/pci/intel/ipu3/cio2-bridge.c
+++ b/drivers/media/pci/intel/ipu3/cio2-bridge.c
@@ -21,7 +21,7 @@
  */
 static const struct cio2_sensor_config cio2_supported_sensors[] = {
 	/* Omnivision OV5693 */
-	CIO2_SENSOR_CONFIG("INT33BE", 0),
+	CIO2_SENSOR_CONFIG("INT33BE", 1, 419200000),
 	/* Omnivision OV2680 */
 	CIO2_SENSOR_CONFIG("OVTI2680", 0),
 };
-- 
2.25.1

