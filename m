Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0DC9F387911
	for <lists+linux-media@lfdr.de>; Tue, 18 May 2021 14:41:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349346AbhERMmv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 18 May 2021 08:42:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349325AbhERMmo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 18 May 2021 08:42:44 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4AD9AC061573
        for <linux-media@vger.kernel.org>; Tue, 18 May 2021 05:41:25 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id i17so10036133wrq.11
        for <linux-media@vger.kernel.org>; Tue, 18 May 2021 05:41:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ldAI2BEKXxmJwnRzX0pdIQjXTGeWN2MbcUVMx3/xOUs=;
        b=O5FmbtkdFv+oxMelevJi0tWdjn++hJ44o/jcC2ZARwh5sLYFn/lBlDfzF0XNMlknGC
         4oengB49L5SsD1PCzBRJUNCWqKKGU7W8K5jmQ0+jZ8Je+iEByHJnSUzoKFoBAqCZ7jJQ
         JheLx6ziP873975yjnVewJo7F9qgF2qp/5Tf7VyddT2ZVykln/d6yMPEJezmBC5KoRMJ
         FDFMHzr1T23wTcwGR7T3lIXTVw2NsqSnAD2GXe8b0dblFIFQhoA1tlmccGF5nZ7NPQUm
         7oxaAWpvnYIEX1aMh+9JO9Lofgt3Nx/w/ELjJyMhDtPOXS7lYpscDGScCov/uX+Kgcji
         ZmXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ldAI2BEKXxmJwnRzX0pdIQjXTGeWN2MbcUVMx3/xOUs=;
        b=gr2C6pe8ntMJU8IFD+seeqb6pmpP8XTXMIhE4sSEvxh5VWCflG/pEcgyFdDuUD9rkz
         YLCN7sOfKnpKxUXV3pVdQN+GWmH9dL5MeJ9zISoPaeofkV4fVxsLwn1FGzBB9HDg77DL
         Q1UvFqiSHfZzWwbOZbYe05xlH0C1Nge763qn7/KJg96LjcnmW72c5IsCX2F2bHzF8/m4
         CSAgYIOEgD1fBg5w2wL2HpWsnLxWMJPyrkrnceyTXzHmIxskXxR7WFP1//suFOFfl8yk
         IGREQxN7vz0E5DCBxa+wXmA7ssY5+aM/KWbIsvxS+VBYzz3l8UZgChqZ9VXVkQxqiYI+
         PaTg==
X-Gm-Message-State: AOAM531yH3yMlghegeTNEXHnQeo1QKgMmHEwU/I6pVH9p13uFQBvfO4p
        11XGkjSNFV7/EjtgEuq4sB79hw==
X-Google-Smtp-Source: ABdhPJwfe0oVtQR6+PwolxvP1DrBzzzVAuvX50itJs00RINjQWwDB1/8Aby8FoFAtrGLlYghJslkrQ==
X-Received: by 2002:adf:e484:: with SMTP id i4mr6694239wrm.117.1621341684097;
        Tue, 18 May 2021 05:41:24 -0700 (PDT)
Received: from localhost.localdomain (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id z3sm1677239wrq.42.2021.05.18.05.41.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 May 2021 05:41:23 -0700 (PDT)
From:   Corentin Labbe <clabbe@baylibre.com>
To:     gregkh@linuxfoundation.org, mchehab@kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev, mjpeg-users@lists.sourceforge.net,
        Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH 5/5] staging: media: zoran: change asm header
Date:   Tue, 18 May 2021 12:41:13 +0000
Message-Id: <20210518124113.1823055-5-clabbe@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210518124113.1823055-1-clabbe@baylibre.com>
References: <20210518124113.1823055-1-clabbe@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

As asked by checkpatch, convert a asm/xxx header to a linux one.

Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
 drivers/staging/media/zoran/zr36050.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/zoran/zr36050.c b/drivers/staging/media/zoran/zr36050.c
index 8bb101fa18bc..c62af27f2683 100644
--- a/drivers/staging/media/zoran/zr36050.c
+++ b/drivers/staging/media/zoran/zr36050.c
@@ -16,7 +16,7 @@
 #include <linux/wait.h>
 
 /* I/O commands, error codes */
-#include <asm/io.h>
+#include <linux/io.h>
 
 /* headerfile of this module */
 #include "zr36050.h"
-- 
2.26.3

