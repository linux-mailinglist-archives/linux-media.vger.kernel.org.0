Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 60420232FE4
	for <lists+linux-media@lfdr.de>; Thu, 30 Jul 2020 11:54:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729392AbgG3Jyf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 30 Jul 2020 05:54:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729137AbgG3Jye (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 30 Jul 2020 05:54:34 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2947C0619D2
        for <linux-media@vger.kernel.org>; Thu, 30 Jul 2020 02:54:33 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id 3so5626432wmi.1
        for <linux-media@vger.kernel.org>; Thu, 30 Jul 2020 02:54:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=AUdOHKBSFKpTj40WJgkPwcDzGagUihc/mu7zxNsYZ+k=;
        b=LfvJup6ovWiwAucvKZVQFk1CwI7buQN2T1r+dQ6oB6Y9OXRHdh2ia0LkWSZQm/HJGy
         28edLScXxl/nFAygtX+andMgAEDNdZzl294AwcOdk34IoozNgT+1XTlfbcQHE0bTO1g5
         6cmQV+vZo2eVuUx7lvUZ4zb9qHJvS/iMBf0ymbLFujgr46o9drobClO/VtKP6dnUFQ4w
         NnFIiKiXFJos9qfmi3OBbIROMi63tzS99nhh8SbMx7+I0J14pFLognQoy/3wpSlVjvAF
         mxHn5t0oEEAd9LDh6237j12wSQeZ0yvmlaJZ31q8hftrRcvypvmNNDv+Tq/SlsG0YXG2
         L2EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=AUdOHKBSFKpTj40WJgkPwcDzGagUihc/mu7zxNsYZ+k=;
        b=L6IkR5E43DCnityHJ1cJ5V8jsJ97mPkLwiU2mAedprf9VV1cRkQh4QDul+YwhtBiy9
         THG3uksqw+AFLLtkND/AMZ8Ky7iSMjXTAlai0OqKkg+vSXVuZbfUlorsyeXelhDCDywz
         YV2yCXxbXg55kksdm6IcFOXck0FdyXUxal4bvLOS79tBiI6IW4BJvcjSm/0y8jexMwL3
         ArTbki05uM2CP3w5Q9zstQzNxY6QN7ynZJ6wESu7Mszyov2cekU35jXkK6vZvwl6qG9x
         Hw9LtGtxgRr9B6h8M1uU8yAm2ADIXdjHr5LQUjDmCPZcayuAkcW0GTWhrUlcBodfVeCv
         HDvQ==
X-Gm-Message-State: AOAM531MPxYswB24KyGknf/pnPleUt5SvYLeyoPCE8falOhxXCPPodfh
        DhyTWBj48cBIJ1bWVSSyaIKzaA==
X-Google-Smtp-Source: ABdhPJxl+zAauMo/NwX8D0vz10uVpUP3IZ/MMYh5A3LnBT6RWGbY47iRI70Rr003qXL238CNARVaXw==
X-Received: by 2002:a1c:5451:: with SMTP id p17mr13612609wmi.180.1596102872621;
        Thu, 30 Jul 2020 02:54:32 -0700 (PDT)
Received: from localhost.localdomain ([195.24.90.54])
        by smtp.gmail.com with ESMTPSA id u1sm10623139wrb.78.2020.07.30.02.54.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2020 02:54:32 -0700 (PDT)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Cc:     jim.cromie@gmail.com, Joe Perches <joe@perches.com>,
        Jason Baron <jbaron@akamai.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH v5 2/3] venus: Add a debugfs file for SSR trigger
Date:   Thu, 30 Jul 2020 12:53:49 +0300
Message-Id: <20200730095350.13925-3-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200730095350.13925-1-stanimir.varbanov@linaro.org>
References: <20200730095350.13925-1-stanimir.varbanov@linaro.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The SSR (SubSystem Restart) is used to simulate an error on FW
side of Venus. We support following type of triggers - fatal error,
div by zero and watchdog IRQ.

Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---
 drivers/media/platform/qcom/venus/dbgfs.c | 30 +++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/drivers/media/platform/qcom/venus/dbgfs.c b/drivers/media/platform/qcom/venus/dbgfs.c
index 782d54ac1b8f..f95b7b1febe5 100644
--- a/drivers/media/platform/qcom/venus/dbgfs.c
+++ b/drivers/media/platform/qcom/venus/dbgfs.c
@@ -9,10 +9,40 @@
 
 extern int venus_fw_debug;
 
+static int trigger_ssr_open(struct inode *inode, struct file *file)
+{
+	file->private_data = inode->i_private;
+	return 0;
+}
+
+static ssize_t trigger_ssr_write(struct file *filp, const char __user *buf,
+				 size_t count, loff_t *ppos)
+{
+	struct venus_core *core = filp->private_data;
+	u32 ssr_type;
+	int ret;
+
+	ret = kstrtou32_from_user(buf, count, 4, &ssr_type);
+	if (ret)
+		return ret;
+
+	ret = hfi_core_trigger_ssr(core, ssr_type);
+	if (ret < 0)
+		return ret;
+
+	return count;
+}
+
+static const struct file_operations ssr_fops = {
+	.open = trigger_ssr_open,
+	.write = trigger_ssr_write,
+};
+
 void venus_dbgfs_init(struct venus_core *core)
 {
 	core->root = debugfs_create_dir("venus", NULL);
 	debugfs_create_x32("fw_level", 0644, core->root, &venus_fw_debug);
+	debugfs_create_file("trigger_ssr", 0200, core->root, core, &ssr_fops);
 }
 
 void venus_dbgfs_deinit(struct venus_core *core)
-- 
2.17.1

