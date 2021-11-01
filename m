Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5735B4411A0
	for <lists+linux-media@lfdr.de>; Mon,  1 Nov 2021 01:11:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230501AbhKAAOL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 31 Oct 2021 20:14:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230484AbhKAAOL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 31 Oct 2021 20:14:11 -0400
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1724C061714
        for <linux-media@vger.kernel.org>; Sun, 31 Oct 2021 17:11:38 -0700 (PDT)
Received: by mail-wm1-x32e.google.com with SMTP id z200so11394631wmc.1
        for <linux-media@vger.kernel.org>; Sun, 31 Oct 2021 17:11:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hafVvi465P3sPwGgXMo1mcvsH6Eg9wims/dDxx08Hn0=;
        b=pk4CuIywMvkod6jpLCMV8SOCEtiF5HTmUt2eNcH9rWDfAEJ1jfz/M0qhbW3WZFjjD9
         EXxbpmkUu7WjjjTuij9guU8fdQie5Dd/EgA9cg6mY7Pr/wHOwuXxL3ofVmxLXqdVMRcx
         g/+h2kBSqLUeR1SHO+bv96t77d+xLhLWVNtOp94nOYnKvVJe6F1zitBnwBxNLs41a8Ml
         zzA2xuUHqJHWwwlork6V5NUms95RiZWZ8BoiEJZcFO3TX1ovxeK43mi3g41mgG+/J/aU
         q5eDpqvjo186UYdSR8okJLiMOReMDByCCAyaj99xZg/AP4U/hEwF+Sdiao7P39TUmeJ4
         gJVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hafVvi465P3sPwGgXMo1mcvsH6Eg9wims/dDxx08Hn0=;
        b=4r8QgXIf+GXiDn5Oi6KHOsu6SXjCJRN7i0iUx9wNCLkFO7gNUd22ydYW+jWEXo/FyQ
         hFk4q2LqmMEOKFJQHAr6xms94lCRq5HALVKJAfqU74IgJfLajSk3ZcDm/B6k4BoxfUup
         OzjXhrbq5ormpubIREK1fC/xnPEKWiKVyovfR7MJ+FFzKyEsRHCBUPMRjBveUvi2z3O0
         qgbYH02kajxJIDis4H+Js6xv7gOHl+bLq7Y6UCsz1hHgZeqd69e7q60xop1UOU7GEA4V
         Gw7eZIaiXVreud9hWIpKtqI7bjrBXJT8dg68QVgAeQRaywizrQFnqYSkr9P+a3XZmTRN
         tTSQ==
X-Gm-Message-State: AOAM532i5IfgCFNJplFu30e4eBVMogzFcTGMsjtBdhfs2lg1B7h/H4jF
        AUWPxir9W+otoHkl2Ttubug=
X-Google-Smtp-Source: ABdhPJytEmjYDlbVhNGAmtnVxvCjJXQvtIBkpdeBR07IbMPfC9qsNrjAYrO5A48WJn8Rg/81BD+EwA==
X-Received: by 2002:a1c:8090:: with SMTP id b138mr13522817wmd.25.1635725497296;
        Sun, 31 Oct 2021 17:11:37 -0700 (PDT)
Received: from localhost.localdomain (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net. [86.13.91.161])
        by smtp.gmail.com with ESMTPSA id k6sm12557678wri.83.2021.10.31.17.11.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Oct 2021 17:11:36 -0700 (PDT)
From:   Daniel Scally <djrscally@gmail.com>
To:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Daniel Scally <djrscally@gmail.com>,
        linux-media@vger.kernel.org
Cc:     Yong Zhi <yong.zhi@intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [PATCH v4 13/16] media: i2c: Re-order runtime pm initialisation
Date:   Mon,  1 Nov 2021 00:11:16 +0000
Message-Id: <20211101001119.46056-14-djrscally@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211101001119.46056-1-djrscally@gmail.com>
References: <20211101001119.46056-1-djrscally@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The kerneldoc for pm_runtime_set_suspended() says:

"It is not valid to call this function for devices with runtime PM
enabled"

To satisfy that requirement, re-order the calls so that
pm_runtime_enable() is the last one.

Signed-off-by: Daniel Scally <djrscally@gmail.com>
---
 drivers/media/i2c/ov8865.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ov8865.c b/drivers/media/i2c/ov8865.c
index 5f19d82554df..18b5f1e8e9a7 100644
--- a/drivers/media/i2c/ov8865.c
+++ b/drivers/media/i2c/ov8865.c
@@ -3085,8 +3085,8 @@ static int ov8865_probe(struct i2c_client *client)
 
 	/* Runtime PM */
 
-	pm_runtime_enable(sensor->dev);
 	pm_runtime_set_suspended(sensor->dev);
+	pm_runtime_enable(sensor->dev);
 
 	/* V4L2 subdev register */
 
-- 
2.25.1

