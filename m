Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 944501F85BE
	for <lists+linux-media@lfdr.de>; Sun, 14 Jun 2020 00:40:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726784AbgFMWju (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 13 Jun 2020 18:39:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726789AbgFMWjm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 13 Jun 2020 18:39:42 -0400
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com [IPv6:2a00:1450:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 299CBC08C5C4
        for <linux-media@vger.kernel.org>; Sat, 13 Jun 2020 15:39:42 -0700 (PDT)
Received: by mail-ej1-x641.google.com with SMTP id l12so13565393ejn.10
        for <linux-media@vger.kernel.org>; Sat, 13 Jun 2020 15:39:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=AUdOHKBSFKpTj40WJgkPwcDzGagUihc/mu7zxNsYZ+k=;
        b=OhMh8QdAKsM/LD7FzRgfTPN/VXAc/bfcsd/Jg+yegVvqkiw0ZQQ1ZFUpO1z6Zg3f3c
         3umiBiw5vRmNhJvxwIv2BRS0N6QIiCUm2YkZMvE4edfNg/wTRNBGQ93PnmylKJTlouGd
         2G4q2igvurJXoQLCJNFkq1onnfm80LAH68015hanO/XNpStK/wI7ro/50FJCncYabfzE
         br3OOrcsNlw+g075/h01a9KB12j2L7sQameavQ1HCT4M6rF4/XhSlB9LgjBo0SESuPiw
         /PvzHHSDjvc2E3cMDocR2Nsl9PGw+veeI72B2UYxioKOz0PfNaJ9DK1OwLr38YvMV92A
         CiOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=AUdOHKBSFKpTj40WJgkPwcDzGagUihc/mu7zxNsYZ+k=;
        b=Rwoo8/zpAdUYi8HJJ/gNbnR7+It10BYUzL9gvfqJ/7ZBF7Fm1TfJGTHvj2JU5QoKWv
         ybe1tLnsEQcVrKFwb9J2RM/E32bm5TjdeWZU/cOqi/Y6MoOpbwC5Rml+ykn9p81qyrPY
         Koii33eWMbXmdubaDQAgFtZnbUf36um2N/XiPxWDkUeE8BM90nhLJf2b2lLALUvZXTll
         5OHIOlhpPAB8hpORqqo8wt4y4uKZOwfBmYFYVQst67f0jm9N+G+L5vY+UIKabtLqmFc1
         p6wk2GCjRd3ddbmwk0H/Oa0SlUEB4HhsrrERvIhr/SNk7x0Z2byRDslHS34QKW/2wyfH
         d/ZQ==
X-Gm-Message-State: AOAM531lSm3486qB3CZnJmKsJIBd58xR3okf6XFCV7CbhIo4/kcGx5Re
        /InFA7iUJbC/jow+xHayiY1YSwWDgqRn3w==
X-Google-Smtp-Source: ABdhPJzxj8C/3hik/vFIz1gDDlvyUI4ojVSG5W2uxMyvgh/o8BwnQmqSRtEzHERwF/L+vXseZu70oQ==
X-Received: by 2002:a17:906:6d3:: with SMTP id v19mr6626238ejb.306.1592087980907;
        Sat, 13 Jun 2020 15:39:40 -0700 (PDT)
Received: from localhost.localdomain (212-5-158-38.ip.btc-net.bg. [212.5.158.38])
        by smtp.gmail.com with ESMTPSA id u3sm5581606edx.25.2020.06.13.15.39.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jun 2020 15:39:40 -0700 (PDT)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Cc:     Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH v4 3/3] venus: Add a debugfs file for SSR trigger
Date:   Sun, 14 Jun 2020 01:39:19 +0300
Message-Id: <20200613223919.7038-4-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200613223919.7038-1-stanimir.varbanov@linaro.org>
References: <20200613223919.7038-1-stanimir.varbanov@linaro.org>
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

