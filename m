Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B8EC525B13C
	for <lists+linux-media@lfdr.de>; Wed,  2 Sep 2020 18:18:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728219AbgIBQKv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Sep 2020 12:10:51 -0400
Received: from mail.kernel.org ([198.145.29.99]:53500 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726528AbgIBQKq (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 2 Sep 2020 12:10:46 -0400
Received: from mail.kernel.org (ip5f5ad5c3.dynamic.kabel-deutschland.de [95.90.213.195])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D596B2072A;
        Wed,  2 Sep 2020 16:10:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1599063046;
        bh=iMwur6qM3ZZ6P0L7pVxBdHuvvZDLHp1t0SylHttyE2M=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=FKIcXRYqTJF0AmXLoClH7H/yXvzpyvcH1uSCsd+ZGN2Tmwb+nCHcZSxsyw7b7zxXn
         xgM1HqgHX0MmHK6coPjhKYN+E3paH36oxBY0fA6ib2lXONudq/3XVYYGon3/+g1LY4
         ERBx6hi/mXjQpO5BeNlXb5D70bugk3PiDt0FXq8I=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1kDVLP-000t9u-PX; Wed, 02 Sep 2020 18:10:43 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 06/38] media: venus: place extern venus_fw_debug on a header file
Date:   Wed,  2 Sep 2020 18:10:09 +0200
Message-Id: <64a99ecb3e7cfae697a16c6b6ca05034f73ad985.1599062230.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1599062230.git.mchehab+huawei@kernel.org>
References: <cover.1599062230.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Sparse warns about this symbol:

	drivers/media/platform/qcom/venus/hfi_venus.c:133:5:  warning: symbol 'venus_fw_debug' was not declared. Should it be static?

Because hfi_venus.c doesn't include a header file with the
extern. So, move it to core.h, with is included by both
hfi_venus.c and dbgfs.c.

This way, if something changes with it, warnings or errors
will be produced.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/media/platform/qcom/venus/core.h  | 2 ++
 drivers/media/platform/qcom/venus/dbgfs.c | 2 --
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
index 8e75a199f9f7..1a7aee7ee628 100644
--- a/drivers/media/platform/qcom/venus/core.h
+++ b/drivers/media/platform/qcom/venus/core.h
@@ -24,6 +24,8 @@
 #define VIDC_VCODEC_CLKS_NUM_MAX	2
 #define VIDC_PMDOMAINS_NUM_MAX		3
 
+extern int venus_fw_debug;
+
 struct freq_tbl {
 	unsigned int load;
 	unsigned long freq;
diff --git a/drivers/media/platform/qcom/venus/dbgfs.c b/drivers/media/platform/qcom/venus/dbgfs.c
index 782d54ac1b8f..52de47f2ca88 100644
--- a/drivers/media/platform/qcom/venus/dbgfs.c
+++ b/drivers/media/platform/qcom/venus/dbgfs.c
@@ -7,8 +7,6 @@
 
 #include "core.h"
 
-extern int venus_fw_debug;
-
 void venus_dbgfs_init(struct venus_core *core)
 {
 	core->root = debugfs_create_dir("venus", NULL);
-- 
2.26.2

