Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C2DB48E8C5
	for <lists+linux-media@lfdr.de>; Fri, 14 Jan 2022 12:02:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240599AbiANLCk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 14 Jan 2022 06:02:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234595AbiANLCj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 14 Jan 2022 06:02:39 -0500
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25272C061574
        for <linux-media@vger.kernel.org>; Fri, 14 Jan 2022 03:02:39 -0800 (PST)
Received: by mail-ed1-x533.google.com with SMTP id k15so33467505edk.13
        for <linux-media@vger.kernel.org>; Fri, 14 Jan 2022 03:02:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CwOPSI/x6WISy5xaU7A1XOITYlC8CEEnNs70uyu/4VI=;
        b=lzuTvcA0vLRGjWdJGefFU3SwExD2klLSvu84jf3QsHuqXy9tD1ct/VclxTjuFu0Vqp
         04J8cJTwUhAJYvDCH1P8mkJY7LrOrcJXGhgvySbnXRdEqpchFD+ve1CK2fK1rIyP9hyT
         yNjM0WAzvOd0fwmRJblY/9YXgp4hC73JNa8T3NqoPz8CnEmiaIrFWbmylyjxRuk0ewmj
         +r5CeWStEeOFu7NFJin8ndTKQcsTOvmus8PgdjoK3EiiU7f/xffuub3FMctskUT5eDCo
         13II64iddxTPwVeldzmLnBZkObxhlGIlVgDoXjtTxg9yt74K5b2vqZ54nFEnZ9LbklTv
         QE6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CwOPSI/x6WISy5xaU7A1XOITYlC8CEEnNs70uyu/4VI=;
        b=RPE0vAK6X7dpzJOVeD0WJE0B1ZtKUIDPBsFCdyoXm9ru9DagzhLUrUol+0FvBchcce
         8dNnmAjediybAxgyC1QjOf8P3l+U9n++JER7s70IDYaGinDR81UDOJW8ILM4+yXQubSU
         y2s8GxGeUaTLKoInAdAplZFU1m4HiCdr4tojK0Kg4ElcpsdT3eiBGzzC5wk0N7fZIjxi
         GCcPfGSEqP8w4O9y5WtdcQZykEx6t4G87ep/ORCLNcVtZh/p80eSeUTwR0nhTAaFgF/I
         rUOLgji/xkzozC5SuiFcTMBDfMCoj62AG2x3J09UJhCi1y/O46DQ4ihy2Ml+LFoOHrU7
         dLgg==
X-Gm-Message-State: AOAM5307vaHI5VF+9jEfLnOIhWpcKuPFyug5i5Ay4Jj6+Oen/DZE9w+y
        NfHFkA3v59mvq40Nwm0wNPJyOs7iJsk/VSh+
X-Google-Smtp-Source: ABdhPJx1j9WH9qLXW9VT1IwVpHidffKuqTuHnKtBK0Kpxdic00MomCcR6Dm0CVCrpI9PmLCbklcOFw==
X-Received: by 2002:a05:6402:11c9:: with SMTP id j9mr8406792edw.411.1642158157759;
        Fri, 14 Jan 2022 03:02:37 -0800 (PST)
Received: from localhost.localdomain ([2a02:a210:20c5:8c80:7d0a:cd68:c339:f426])
        by smtp.gmail.com with ESMTPSA id 21sm1725718ejz.24.2022.01.14.03.02.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jan 2022 03:02:36 -0800 (PST)
From:   Luca Weiss <luca.weiss@fairphone.com>
To:     linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        Luca Weiss <luca.weiss@fairphone.com>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] media: venus: hfi: Add error message for timeout error
Date:   Fri, 14 Jan 2022 12:02:25 +0100
Message-Id: <20220114110226.130380-1-luca.weiss@fairphone.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This error can appear with wrong configuration and is difficult to find
as it just returns -ETIMEDOUT with no further message.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 drivers/media/platform/qcom/venus/hfi_venus.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/venus/hfi_venus.c b/drivers/media/platform/qcom/venus/hfi_venus.c
index 3a75a27632fb..9a34662fea38 100644
--- a/drivers/media/platform/qcom/venus/hfi_venus.c
+++ b/drivers/media/platform/qcom/venus/hfi_venus.c
@@ -1583,8 +1583,10 @@ static int venus_suspend_3xx(struct venus_core *core)
 	 */
 	ret = readx_poll_timeout(venus_cpu_and_video_core_idle, hdev, val, val,
 				 1500, 100 * 1500);
-	if (ret)
+	if (ret) {
+		dev_err(dev, "wait for cpu and video core idle fail (%d)\n", ret);
 		return ret;
+	}
 
 	ret = venus_prepare_power_collapse(hdev, false);
 	if (ret) {
-- 
2.34.1

