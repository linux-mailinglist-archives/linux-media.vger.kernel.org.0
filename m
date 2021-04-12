Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E039435CF00
	for <lists+linux-media@lfdr.de>; Mon, 12 Apr 2021 18:57:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243967AbhDLQ5e (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Apr 2021 12:57:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343812AbhDLQww (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Apr 2021 12:52:52 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33399C061371
        for <linux-media@vger.kernel.org>; Mon, 12 Apr 2021 09:50:01 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id e14so9732147lfn.11
        for <linux-media@vger.kernel.org>; Mon, 12 Apr 2021 09:50:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=FA0vIF9pu2eng/WDzjUCxcAicxHaQhK2nIsRi8PPNHM=;
        b=TA6K77ry2qMscATyqbeD6FZHBPVDxqnN+tNXnPzvrjjLIi73wdqjKk4r69zr6VWOlH
         ih/EP/mRFG7+JOTY5T6EMAYCStgolsYWyKpxht+F0WESzdviRdXPDnadSFinyRqHO4ow
         01uXwG63czq0QWd9IfzHyBUQM7pyuTzndX4Cc52GLrl+UzMtF9e9cRQHPfNizRAj6zct
         xC1BTZPacEljVmkFU7cpeIItW9emdUfNro/0eQIXPnX0LIogEpFLjnEXD1eFxX50TcYI
         K+bJ4+zWwszmzj3DwnfR9+Ehh6inlkzJFo5tUmvIGI5DuNZZRg0XnD73XTvqE0Eb5z6L
         T2Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=FA0vIF9pu2eng/WDzjUCxcAicxHaQhK2nIsRi8PPNHM=;
        b=gq2VMdulhbAPvcCwSlNrSQwIuMJ70GS46pchTG27LC/99eJoDoePJsGsn2zQvt6CGF
         1mkX7hMz0G7rgyC+iuk7/87PEogNLXDlNUgrk4RaLcuKhiKVKo9SwFrVftCl7jvT0jqp
         8l53yg3gAUHfqetdOHuvi7wZ+58et+3DExzG3Lwoz/CtHGfXm7zVkDYEktz0/pO0MQ9f
         CVnuKN4bG8cSsBd7IRT4MX7VwwbkH/X8nONMJsZn1PGh2epf67aMw7oQrkcotctu3UcH
         2A18k45EYruS0fHl19Zacl95khjZqroJ6UeCmBe8sVtR+l0AqUU1h7NQtC9fBuLjCXfS
         B1FQ==
X-Gm-Message-State: AOAM531zJ3Y5beiIK4F3N/JusSSCNW0b5GntEkMmBbCkhoBSuc4l6aCK
        1Q3g3wjsDqOwG/ix0lF1vq2NK/okFP8=
X-Google-Smtp-Source: ABdhPJwlnT86p8kM5cz/NptbbKXLDyrfGt4iMjzAItzi1+T5j3F/RbfrzAhUYwc7VxyTcss2rgekpg==
X-Received: by 2002:ac2:5f1b:: with SMTP id 27mr19336960lfq.425.1618246199757;
        Mon, 12 Apr 2021 09:49:59 -0700 (PDT)
Received: from localhost.localdomain (cm-84.211.29.145.getinternet.no. [84.211.29.145])
        by smtp.gmail.com with ESMTPSA id 8sm2314017lfz.236.2021.04.12.09.49.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Apr 2021 09:49:59 -0700 (PDT)
From:   Bernhard Wimmer <be.wimm@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     Bernhard Wimmer <be.wimm@gmail.com>
Subject: [PATCH] media: ccs: Fix the op_pll_multiplier address
Date:   Mon, 12 Apr 2021 18:49:43 +0200
Message-Id: <20210412164943.1849-1-be.wimm@gmail.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

According to the CCS spec the op_pll_multiplier address is 0x030e, not 0x031e.

Signed-off-by: Bernhard Wimmer <be.wimm@gmail.com>
---
 Documentation/driver-api/media/drivers/ccs/ccs-regs.asc | 2 +-
 Documentation/driver-api/media/drivers/ccs/mk-ccs-regs  | 5 +++--
 drivers/media/i2c/ccs/ccs-limits.c                      | 1 +
 drivers/media/i2c/ccs/ccs-limits.h                      | 1 +
 drivers/media/i2c/ccs/ccs-regs.h                        | 3 ++-
 5 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/Documentation/driver-api/media/drivers/ccs/ccs-regs.asc b/Documentation/driver-api/media/drivers/ccs/ccs-regs.asc
index f2042acc8a45..bbf9213c3388 100644
--- a/Documentation/driver-api/media/drivers/ccs/ccs-regs.asc
+++ b/Documentation/driver-api/media/drivers/ccs/ccs-regs.asc
@@ -210,7 +210,7 @@ pll_multiplier				0x0306	16
 op_pix_clk_div				0x0308	16
 op_sys_clk_div				0x030a	16
 op_pre_pll_clk_div			0x030c	16
-op_pll_multiplier			0x031e	16
+op_pll_multiplier			0x030e	16
 pll_mode				0x0310	8
 - f					0	0
 - e	single				0
diff --git a/Documentation/driver-api/media/drivers/ccs/mk-ccs-regs b/Documentation/driver-api/media/drivers/ccs/mk-ccs-regs
index 6668deaf2f19..807c0c14ec29 100755
--- a/Documentation/driver-api/media/drivers/ccs/mk-ccs-regs
+++ b/Documentation/driver-api/media/drivers/ccs/mk-ccs-regs
@@ -72,13 +72,14 @@ $uc_header =~ s/[^A-Z0-9]/_/g;
 
 my $copyright = "/* Copyright (C) 2019--2020 Intel Corporation */\n";
 my $license = "SPDX-License-Identifier: GPL-2.0-only OR BSD-3-Clause";
+my $note = "/* Generated by $0; do not modify. */\n";
 
 for my $fh ($A, $LC) {
-	print $fh "// $license\n$copyright\n" if defined $fh;
+	print $fh "// $license\n$copyright$note\n" if defined $fh;
 }
 
 for my $fh ($H, $LH) {
-	print $fh "/* $license */\n$copyright\n";
+	print $fh "/* $license */\n$copyright$note\n";
 }
 
 sub bit_def($) {
diff --git a/drivers/media/i2c/ccs/ccs-limits.c b/drivers/media/i2c/ccs/ccs-limits.c
index f5511789ac83..e4b7127b88a1 100644
--- a/drivers/media/i2c/ccs/ccs-limits.c
+++ b/drivers/media/i2c/ccs/ccs-limits.c
@@ -1,5 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only OR BSD-3-Clause
 /* Copyright (C) 2019--2020 Intel Corporation */
+/* Generated by Documentation/driver-api/media/drivers/ccs/mk-ccs-regs; do not modify. */
 
 #include "ccs-limits.h"
 #include "ccs-regs.h"
diff --git a/drivers/media/i2c/ccs/ccs-limits.h b/drivers/media/i2c/ccs/ccs-limits.h
index 1efa43c23a2e..40b067fc9a70 100644
--- a/drivers/media/i2c/ccs/ccs-limits.h
+++ b/drivers/media/i2c/ccs/ccs-limits.h
@@ -1,5 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0-only OR BSD-3-Clause */
 /* Copyright (C) 2019--2020 Intel Corporation */
+/* Generated by Documentation/driver-api/media/drivers/ccs/mk-ccs-regs; do not modify. */
 
 #ifndef __CCS_LIMITS_H__
 #define __CCS_LIMITS_H__
diff --git a/drivers/media/i2c/ccs/ccs-regs.h b/drivers/media/i2c/ccs/ccs-regs.h
index 4b3e5df2121f..5de330bf8a89 100644
--- a/drivers/media/i2c/ccs/ccs-regs.h
+++ b/drivers/media/i2c/ccs/ccs-regs.h
@@ -1,5 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0-only OR BSD-3-Clause */
 /* Copyright (C) 2019--2020 Intel Corporation */
+/* Generated by Documentation/driver-api/media/drivers/ccs/mk-ccs-regs; do not modify. */
 
 #ifndef __CCS_REGS_H__
 #define __CCS_REGS_H__
@@ -202,7 +203,7 @@
 #define CCS_R_OP_PIX_CLK_DIV					(0x0308 | CCS_FL_16BIT)
 #define CCS_R_OP_SYS_CLK_DIV					(0x030a | CCS_FL_16BIT)
 #define CCS_R_OP_PRE_PLL_CLK_DIV				(0x030c | CCS_FL_16BIT)
-#define CCS_R_OP_PLL_MULTIPLIER					(0x031e | CCS_FL_16BIT)
+#define CCS_R_OP_PLL_MULTIPLIER					(0x030e | CCS_FL_16BIT)
 #define CCS_R_PLL_MODE						0x0310
 #define CCS_PLL_MODE_SHIFT					0U
 #define CCS_PLL_MODE_MASK					0x1
-- 
2.17.1

