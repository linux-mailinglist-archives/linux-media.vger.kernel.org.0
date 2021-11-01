Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 01C914411A3
	for <lists+linux-media@lfdr.de>; Mon,  1 Nov 2021 01:11:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230520AbhKAAOP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 31 Oct 2021 20:14:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230484AbhKAAOO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 31 Oct 2021 20:14:14 -0400
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EDFACC061714
        for <linux-media@vger.kernel.org>; Sun, 31 Oct 2021 17:11:41 -0700 (PDT)
Received: by mail-wm1-x329.google.com with SMTP id 71so9960797wma.4
        for <linux-media@vger.kernel.org>; Sun, 31 Oct 2021 17:11:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Lf87r12qxO68BXDuIGNnYQNQjUznr0ZaTkZGfQbHXlU=;
        b=mfLpg74+eMXxduYla1KtSEkzFEikqA54TmCXSa41wai691vz+UvwPQZXR3z1yGhuHf
         qec1samOPyiTBl9IOW6wNzPL5U5bkvpJXwUSYdmWOAJoKPkQ5ta1ogE/xaPRduExX+b/
         jkfP4cKT3JFaV24KPKGH6rrh4Z8fSkTd65YVyZg+PTp5D28zl0vCSo6AUl9fM8bc9iru
         yZdgnVui+y7L/lQHkUgkfBUMoeqNMISBI8j7uNrexviy/EacDpWdJ453MpH+CKXwmIrT
         iaqhlmvcMpA86IinzBpBA/K0Y3+gL4FIewHBVVqFvp/DgsoCSui+dMg50UvQ2h+zcYeE
         /4dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Lf87r12qxO68BXDuIGNnYQNQjUznr0ZaTkZGfQbHXlU=;
        b=iwzd6vgp+pYUo08uAJkbL/WmlHDeizfRkxhrvuNDmGZd21uPSVQKEnFIFK0NBU46QK
         kcWAA1AE7eDJ7eUWb+iTIcm8R5N1C1jQnDeKOPTGTb917p5eqQxmVogL4GHy5ey1JxX3
         9HbsEbChpox1ksHCrSvYrxzC54vSfmziLt+IvB9q+w07pp8XDz04ZigULRP/B7nVefht
         4hbt6yBZdk2s0xxtYAbN13z9Q3dY4o/8tVy1F9M1JZC+tdm9n6Cqh/cSBkCftK9nTWnt
         uFMyXTRwOZmp8aX3Z63bDL6RCfpPFskRBxPIU4AW0G8+agPoVLu0mwfBsEh75wRLPhCI
         MpHg==
X-Gm-Message-State: AOAM530xbgHiu/JSdz64VARFYKO0+I4qRrB9qflp0FXUwk1vVnDdfBRb
        X7CujNXlejgJH2O6VV59ioI=
X-Google-Smtp-Source: ABdhPJwV/+hk3locqVIrD468sTimUc23Ac/+kcTvcX3WJGTipz8S8OrlZY3H0NTKZyBdSWcNERHPIQ==
X-Received: by 2002:a1c:1fcf:: with SMTP id f198mr24363146wmf.66.1635725500605;
        Sun, 31 Oct 2021 17:11:40 -0700 (PDT)
Received: from localhost.localdomain (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net. [86.13.91.161])
        by smtp.gmail.com with ESMTPSA id k6sm12557678wri.83.2021.10.31.17.11.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Oct 2021 17:11:40 -0700 (PDT)
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
Subject: [PATCH v4 16/16] media: i2c: ov8865: Fix lockdep error
Date:   Mon,  1 Nov 2021 00:11:19 +0000
Message-Id: <20211101001119.46056-17-djrscally@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211101001119.46056-1-djrscally@gmail.com>
References: <20211101001119.46056-1-djrscally@gmail.com>
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

[   13.233413] ------------[ cut here ]------------
[   13.233421] WARNING: CPU: 0 PID: 8 at drivers/media/v4l2-core/v4l2-ctrls-api.c:833 __v4l2_ctrl_s_ctrl+0x4d/0x60 [videodev]
...
[   13.234063] Call Trace:
[   13.234074]  ov8865_state_configure+0x98b/0xc00 [ov8865]
[   13.234095]  ov8865_probe+0x4b1/0x54c [ov8865]
[   13.234117]  i2c_device_probe+0x13c/0x2d0

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/media/i2c/ov8865.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/i2c/ov8865.c b/drivers/media/i2c/ov8865.c
index ab225fb616b9..c5fe290317e8 100644
--- a/drivers/media/i2c/ov8865.c
+++ b/drivers/media/i2c/ov8865.c
@@ -3073,7 +3073,9 @@ static int ov8865_probe(struct i2c_client *client)
 	if (ret)
 		goto error_mutex;
 
+	mutex_lock(&sensor->mutex);
 	ret = ov8865_state_init(sensor);
+	mutex_unlock(&sensor->mutex);
 	if (ret)
 		goto error_ctrls;
 
-- 
2.25.1

