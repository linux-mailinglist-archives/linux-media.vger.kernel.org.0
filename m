Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 74189260F76
	for <lists+linux-media@lfdr.de>; Tue,  8 Sep 2020 12:15:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729479AbgIHKPg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Sep 2020 06:15:36 -0400
Received: from mail.kernel.org ([198.145.29.99]:59746 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728828AbgIHKMc (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 8 Sep 2020 06:12:32 -0400
Received: from mail.kernel.org (ip5f5ad5ce.dynamic.kabel-deutschland.de [95.90.213.206])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id AD899216C4;
        Tue,  8 Sep 2020 10:12:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1599559951;
        bh=68DNqEok2XhXHOmQ4/OhRUUJNNkVRuXHV71v+f39NZM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=gvLSkwfAcQ8V+/WodB5dkaMyFIcNgQ0c4wdSL3yhrGFVXRe5cofRHaIdQUSO9Pyvo
         22LHFHkAi+tqdaOSBaLBqRm0HEf3OmJUsWx/Mwlq5tZ5/pVkZLdzjW1ge2Y2lp7kzR
         fdQPz8NWeAdP4f1t4VTa+wDsS1nprFL483diKtFE=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1kFac1-00B3qh-4u; Tue, 08 Sep 2020 12:12:29 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 4/5] media: atomisp: move a static constant out of a header file
Date:   Tue,  8 Sep 2020 12:12:25 +0200
Message-Id: <a3280622dd3c85360c789e156f7b9d03bc8b2de3.1599141140.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1599141140.git.mchehab+huawei@kernel.org>
References: <cover.1599141140.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Gcc reports that input_formatter_alignment is not used:

	In file included from ./drivers/staging/media/atomisp//pci/hive_isp_css_include/input_formatter.h:34,
	                 from drivers/staging/media/atomisp//pci/runtime/debug/src/ia_css_debug.c:55:
	./drivers/staging/media/atomisp//pci/hive_isp_css_common/host/input_formatter_local.h:118:27: warning: ‘input_formatter_alignment’ defined but not used [-Wunused-const-variable=]

However, it is, but only inside input_formatter.c.

So, move it out of the header file.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 .../atomisp/pci/hive_isp_css_common/host/input_formatter.c    | 4 ++++
 .../pci/hive_isp_css_common/host/input_formatter_local.h      | 4 ----
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_formatter.c b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_formatter.c
index 1b196cd265b9..5cd6136f21a2 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_formatter.c
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_formatter.c
@@ -27,6 +27,10 @@
 #include "input_formatter_private.h"
 #endif /* __INLINE_INPUT_FORMATTER__ */
 
+static const unsigned int input_formatter_alignment[N_INPUT_FORMATTER_ID] = {
+	ISP_VEC_ALIGN, ISP_VEC_ALIGN, HIVE_ISP_CTRL_DATA_BYTES
+};
+
 const hrt_address HIVE_IF_SRST_ADDRESS[N_INPUT_FORMATTER_ID] = {
 	INPUT_FORMATTER0_SRST_OFFSET,
 	INPUT_FORMATTER1_SRST_OFFSET,
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_formatter_local.h b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_formatter_local.h
index 94fff77584f7..dfb593c109af 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_formatter_local.h
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_formatter_local.h
@@ -115,8 +115,4 @@ struct input_formatter_bin_state_s {
 	u32	en_status_update;
 };
 
-static const unsigned int input_formatter_alignment[N_INPUT_FORMATTER_ID] = {
-	ISP_VEC_ALIGN, ISP_VEC_ALIGN, HIVE_ISP_CTRL_DATA_BYTES
-};
-
 #endif /* __INPUT_FORMATTER_LOCAL_H_INCLUDED__ */
-- 
2.26.2

