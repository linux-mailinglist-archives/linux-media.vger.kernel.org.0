Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4AC3523312D
	for <lists+linux-media@lfdr.de>; Thu, 30 Jul 2020 13:47:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727956AbgG3LrW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 30 Jul 2020 07:47:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727942AbgG3LrV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 30 Jul 2020 07:47:21 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6E0AC0619D8
        for <linux-media@vger.kernel.org>; Thu, 30 Jul 2020 04:47:18 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id r12so24548050wrj.13
        for <linux-media@vger.kernel.org>; Thu, 30 Jul 2020 04:47:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=CTatHtGbJyhfIe07LyOFqsBAVFHXpCGvt0MRleoAwFM=;
        b=uaEmjOC2l9sHxKq7NHLH6ZQ/+FQ9P8LnKs3PJp993cAdhk0pREg2Wiryu6EtJVV4/t
         9PSq1/5a8rp94P/DPRkFKBMb44gE/F5+TSyztqX0OSRMKgsNABOl8UacD1ia2FwnxeLI
         YnpfZ9Wprk8Sq/Q3DWDoXEd1Ba0uBG+DmAhlk/4OEygcCkGPbpuEwtXdrgKRRd1kSuSM
         gv9WSizuUKm8a6VOGRTObtnR6vZ142SDrrbiGt7lxr1PnoU4Mk2pOsQ+DWQeClt6T7CD
         WVHny8bvWrDgog3DcOj4SD4/341IqiLTqEPzTSgyEeueBPtpyyrq5iZSu7DmuO7TUz+U
         ahhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=CTatHtGbJyhfIe07LyOFqsBAVFHXpCGvt0MRleoAwFM=;
        b=TiFatuI0Glo8MIhJbJ39JJz+5hHg0nCy7bs+12ZXMr+L5BuFJsm/e+iqSk0hXUXXdB
         369yKhg8GdSIXrEkX2f5w/zcii7UEGNA8kdSHsMvtqHwbMq+TO1PEAb1YcAYPFerenc0
         tjdT9LxaZjF5WK7YSQmFANkgqIxPSzqx4Bk3PZt/XZXu3KpL2THKS3oTpkLQny3SIyxd
         jSvu8m6JVRTiQaOpnu0ncOlxGbL8TNywJLbVwIxfZJpoSVVgh+LitlDYg2yOxBdEi91O
         Jg8F3gJRwXva8lYamTcJq0mLaIROiXkxv0HYVe/5kkaDpQPgHRQ/KLkETms9oKpCHEWT
         jNVg==
X-Gm-Message-State: AOAM531t5DEOzQ6iDqYJg9kaDBM7AvbKZPfNubIZ726nRT6UeVxa0U1j
        NyOPDR9mbUDMqoPWhZk9vzY3pFHK0XmLHQ==
X-Google-Smtp-Source: ABdhPJxSRZkvCIm8Zm439FWlOxBqCLeYktGV8+YQ++3WfHvvEz+Xf5CpMovL50+ZyWyEAs/WLFhMuw==
X-Received: by 2002:adf:a192:: with SMTP id u18mr2704077wru.158.1596109637205;
        Thu, 30 Jul 2020 04:47:17 -0700 (PDT)
Received: from localhost.localdomain ([195.24.90.54])
        by smtp.gmail.com with ESMTPSA id 32sm9636691wrn.86.2020.07.30.04.47.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2020 04:47:16 -0700 (PDT)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH 1/3] venus: parser: Prepare parser for multiple invocations
Date:   Thu, 30 Jul 2020 14:46:30 +0300
Message-Id: <20200730114632.6717-2-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200730114632.6717-1-stanimir.varbanov@linaro.org>
References: <20200730114632.6717-1-stanimir.varbanov@linaro.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Presently the hfi_parser has been called only once during driver
probe. To prepare the parser function to be called multiple times
from recovery we need to initialize few variables which are used
during parsing time.

Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---
 drivers/media/platform/qcom/venus/hfi_parser.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/platform/qcom/venus/hfi_parser.c b/drivers/media/platform/qcom/venus/hfi_parser.c
index 7f515a4b9bd1..363ee2a65453 100644
--- a/drivers/media/platform/qcom/venus/hfi_parser.c
+++ b/drivers/media/platform/qcom/venus/hfi_parser.c
@@ -239,6 +239,9 @@ u32 hfi_parser(struct venus_core *core, struct venus_inst *inst, void *buf,
 
 	parser_init(inst, &codecs, &domain);
 
+	core->codecs_count = 0;
+	memset(core->caps, 0, sizeof(core->caps));
+
 	while (words_count) {
 		data = word + 1;
 
-- 
2.17.1

