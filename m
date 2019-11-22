Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3115F107A64
	for <lists+linux-media@lfdr.de>; Fri, 22 Nov 2019 23:10:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726546AbfKVWKH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 22 Nov 2019 17:10:07 -0500
Received: from mail-il1-f196.google.com ([209.85.166.196]:45894 "EHLO
        mail-il1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726089AbfKVWKH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 22 Nov 2019 17:10:07 -0500
Received: by mail-il1-f196.google.com with SMTP id o18so8380864ils.12;
        Fri, 22 Nov 2019 14:10:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=bBifFU+n+ullPalYVdHCIouKPhTwiN8vd2nuMuI0EP4=;
        b=N7Owfb0ymE4k55Cz4Tylc3lGqajuxdOLCaNNOL3y3YMqPUW3gcx8W6yj+Dpbm0wi1Y
         9DY8gf1IHSaJjwBIxHM9apHriu6PKCVWVyYNrK++aBHkQFO9JfB+ytCOwfLOYhZUqlKG
         JRtLyAL0FaN4vVtBMhgeAMmyTPm8AhrVAyIQm0foeg1A/UFKM3MgetBxBsNo2En9mCxM
         +8va9/9q+3jKh8fifbJLgo/lXfFEdQFEHN7aHwuL30xIygancJoCqz13j6Ij9dHgb2/I
         W5K4QaLAe34D7CngLE5MALsc0iuXyeqfX8nR0+B7okTbb68K227iK0fzCuiqvX12wmhT
         66wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=bBifFU+n+ullPalYVdHCIouKPhTwiN8vd2nuMuI0EP4=;
        b=Fs3xb68juJOWaHzzR34ADXE171ooHk9Nca0mZgYkrvTZC++om09JdZuzOPK7SZxAUM
         eerd5whoGlV44zY3SuMx1xE2Tqmpvt6WST7tNvCxEvUvZIdGPZIZuy1aETlDQRVuBhvR
         tiz9HWoyCXnXPY5uHsrxfKn56vVNHvtDehDejwKO8t8JXFMgDI2G5kZGMwkHnTlEOKGF
         LHDJoe9a1ZXMPu3sa/7Lr++crdKSJN6lZL7b74KuBGNY2bT0qFEGw26tnvAyrleh3Xyy
         VOHuOVbMBW4S0xECu3zBQtc+Vje+HVD09PErcFptGd0EblRU+HeZa9hufFziJ9xjcD4K
         wjWw==
X-Gm-Message-State: APjAAAXPshLqIZI1oKhCSSjHVNl/CtOk3VlRg2Y4LWUvjxYj5xJE27ZD
        i7UFps6yPHaJA8wXxiT6LV8=
X-Google-Smtp-Source: APXvYqzYxev0mehw5aRdi6YyMlpR/8LUw3GUw9sxPjIdE6W/F2xPhVpIyLMPatJ4Vp8FiB6YoHO2yw==
X-Received: by 2002:a92:8605:: with SMTP id g5mr19067812ild.172.1574460605747;
        Fri, 22 Nov 2019 14:10:05 -0800 (PST)
Received: from cs-dulles.cs.umn.edu (cs-dulles.cs.umn.edu. [128.101.35.54])
        by smtp.googlemail.com with ESMTPSA id x62sm398741ill.86.2019.11.22.14.10.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2019 14:10:05 -0800 (PST)
From:   Navid Emamdoost <navid.emamdoost@gmail.com>
To:     Sumit Semwal <sumit.semwal@linaro.org>,
        Gustavo Padovan <gustavo@padovan.org>,
        linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Cc:     emamd001@umn.edu, Navid Emamdoost <navid.emamdoost@gmail.com>
Subject: [PATCH] dma-buf: Fix memory leak in sync_file_merge()
Date:   Fri, 22 Nov 2019 16:09:55 -0600
Message-Id: <20191122220957.30427-1-navid.emamdoost@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

In the implementation of sync_file_merge() the allocated sync_file is
leaked if number of fences overflows. Release sync_file by goto err.

Fixes: a02b9dc90d84 ("dma-buf/sync_file: refactor fence storage in struct sync_file")
Signed-off-by: Navid Emamdoost <navid.emamdoost@gmail.com>
---
 drivers/dma-buf/sync_file.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma-buf/sync_file.c b/drivers/dma-buf/sync_file.c
index 25c5c071645b..91185db9a952 100644
--- a/drivers/dma-buf/sync_file.c
+++ b/drivers/dma-buf/sync_file.c
@@ -221,7 +221,7 @@ static struct sync_file *sync_file_merge(const char *name, struct sync_file *a,
 	a_fences = get_fences(a, &a_num_fences);
 	b_fences = get_fences(b, &b_num_fences);
 	if (a_num_fences > INT_MAX - b_num_fences)
-		return NULL;
+		goto err;
 
 	num_fences = a_num_fences + b_num_fences;
 
-- 
2.17.1

