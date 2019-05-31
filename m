Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6DAD6309D9
	for <lists+linux-media@lfdr.de>; Fri, 31 May 2019 10:07:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726649AbfEaIHF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 31 May 2019 04:07:05 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:38231 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726002AbfEaIHF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 31 May 2019 04:07:05 -0400
Received: by mail-wm1-f67.google.com with SMTP id t5so5296152wmh.3
        for <linux-media@vger.kernel.org>; Fri, 31 May 2019 01:07:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id;
        bh=kXajL38jtroQRK1inSfA5o1UhLh96/R1VmmZLy58S0M=;
        b=S04+oLu0VvmfqkGp7cZ9u1kAzRSHW7yu4ilUH7VbdVVWbLDCJj5wi7PDEbaQPRoRJI
         /lSaJvGA0vo2VyMKD3ecGUrEhHqajrka8Hv8V3w2ZnNBdkt0d0NQzj8/BrBSU53g+I1X
         AnMp5YEE5qMJdBb3Zq6Sd6ltqUnKShQ2hrtLzYVqJuPsH17H86bJH+U4ct+b4GtHZzMS
         shPw2PdXZ3GKThkwhVvxcOoJjJ9aEqhB0pkWZIuwrylxopLnB9aAZhKspyif0uAUYFCS
         3v4npfRXbfomqE7NJymm2zNlqvhL7eWB6Lded6WQ5YkRR6fq1uyUOW/7DuhST4NFQpAS
         eouA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=kXajL38jtroQRK1inSfA5o1UhLh96/R1VmmZLy58S0M=;
        b=VNeCBjieRC5hxZ4Tj4MQmD1O8ztNb+mgrv1rZfUNXLtUy9PFaFeMbltXU0IqP3N+Zj
         eRm9v4Ak12e7cWABFevwXzGJusjuI8Lth+UAbVS2FP+/3YoRg5EDGFisVRYJ3l2kQkpf
         N6wkaNeM1GfaUvTL422cmNiVxVJl/29zU6zovyI7jlH/AUmvGkH69gI1z1Hw4B/alPvx
         ldqhgJEjNLQQUVRWqu6VaVjmErPUUjOrkTmNT7Hm32TFZ1z7OvlDbdzme/VN1xfxP203
         wAOIw/YyL/CekSwWgmSsSy+Hw5PQfjCLFGxNf2cduEuCGxg1WMorMXRUYaw+eP7ieX3Q
         TfYg==
X-Gm-Message-State: APjAAAXKnUYeNqtQ1cyrfBYSfrKkmEMotKBKhHEWjYeTQT15TutJ6H2L
        VtScq0yZy0oYIorWx1y2Z/I+EQ==
X-Google-Smtp-Source: APXvYqztXy2WnV+tfHqRnZCIpfF56H23uNYivX8K7jrgceeZauQrsQB9mdWVtq8E17XgsWqmbGhQhg==
X-Received: by 2002:a1c:ca01:: with SMTP id a1mr4724931wmg.30.1559290023359;
        Fri, 31 May 2019 01:07:03 -0700 (PDT)
Received: from cobook.home (nikaet.starlink.ru. [94.141.168.29])
        by smtp.gmail.com with ESMTPSA id g2sm5958147wru.37.2019.05.31.01.07.02
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 31 May 2019 01:07:02 -0700 (PDT)
From:   Nikita Yushchenko <nikita.yoush@cogentembedded.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Shuah Khan <shuah@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Nikita Yushchenko <nikita.yoush@cogentembedded.com>
Subject: [PATCH] media: avoid skipping MEDIA_PAD_FL_MUST_CONNECT logic
Date:   Fri, 31 May 2019 11:06:37 +0300
Message-Id: <20190531080637.4341-1-nikita.yoush@cogentembedded.com>
X-Mailer: git-send-email 2.11.0
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

In the current code, __media_pipeline_start() skips check of
MEDIA_PAD_FL_MUST_CONNECT logic for entity not providing link_validate()
op.

Fix that by checking for existence of link_validate() at different code
location.

Signed-off-by: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
---
 drivers/media/mc/mc-entity.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
index a998a2e0ea1d..8b4912be30d1 100644
--- a/drivers/media/mc/mc-entity.c
+++ b/drivers/media/mc/mc-entity.c
@@ -449,9 +449,6 @@ __must_check int __media_pipeline_start(struct media_entity *entity,
 		if (entity->stream_count > 1)
 			continue;
 
-		if (!entity->ops || !entity->ops->link_validate)
-			continue;
-
 		bitmap_zero(active, entity->num_pads);
 		bitmap_fill(has_no_links, entity->num_pads);
 
@@ -479,6 +476,9 @@ __must_check int __media_pipeline_start(struct media_entity *entity,
 			    !(link->flags & MEDIA_LNK_FL_ENABLED))
 				continue;
 
+			if (!entity->ops || !entity->ops->link_validate)
+				continue;
+
 			ret = entity->ops->link_validate(link);
 			if (ret < 0 && ret != -ENOIOCTLCMD) {
 				dev_dbg(entity->graph_obj.mdev->dev,
-- 
2.11.0

