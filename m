Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6E100F2CA3
	for <lists+linux-media@lfdr.de>; Thu,  7 Nov 2019 11:36:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387890AbfKGKgU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 7 Nov 2019 05:36:20 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:37250 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387856AbfKGKgU (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 7 Nov 2019 05:36:20 -0500
Received: by mail-wr1-f66.google.com with SMTP id t1so2427627wrv.4
        for <linux-media@vger.kernel.org>; Thu, 07 Nov 2019 02:36:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=teW38WXulAIrUKBNvuumxpbZRbtrGwotg8AiJU+tjw4=;
        b=iZcNRyt3DP47SX6ynhkUyOQ+MvqqiG2DCpTPy4uEpdf/CGYqTGawcGA+YB86s2sDN/
         k0rMrOm9ZIg+M7fkoeNQDzl+0qmlF+eFsGk958hdenhBGS3zOe0qZYHfRXbDvEjRegk6
         LgqPiuri7VPm9HPDo7aePyxU6GwsIemjqNaAVmwStjTQr4WxXYcDcfp0S0iIYt2xb54r
         d4TuFYeR/4Ixj9aShZlIDJPb/iM5Pj1W5kT4rwPadGmS8d8So8VyTq2k0cGrwYeHY35N
         xXx9fQFXQXbNqUx+HChXT+IVTAUC1eW5oU7wOnOZ7sGekBg4vICoxfmU3HbYJzhKwlqA
         asnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=teW38WXulAIrUKBNvuumxpbZRbtrGwotg8AiJU+tjw4=;
        b=InSoIjDPLa2m82lYrUoKu3zkEU+3elM9v+dOkfe1IG9LCWVDhU/FtJIwmZwtRy80q2
         ynnoTmGTu+QZYlUNZn5FxPcjRXaqhjdCzxzudufSfZvaR8gNw/P6BheBjbEMdX8bt0Ja
         hwMUkIjFzBZM+is8397Ug9rSvGt0lAbrGpPO0HaTQ/b8PqTv1Fw8myMNTNqFicTZduOk
         K84BP2KdTaxn49ySwNOQStUVkJ+AkGWKQ7hHHZRVhqkdCfadB8YTOVGKY+rmTarAk5kE
         1SOT/BXbDm2hLsYZahGJiev6L1VhWoD3e8HaOlU1yV0DJSwYVWLlALzwOZesSgMHJple
         iGOQ==
X-Gm-Message-State: APjAAAWDE6TaAK5It7VBNv9qAXnRfll9zBQwcZwpuNuyf8QCdALdzLME
        1ArLqLlnOw6c/D/xlpQuHayEmgG4eoqA
X-Google-Smtp-Source: APXvYqymapv7J0ujPLALFJRUbP8bLm6eKLIIQ7g/IOqnU7Kf0+l9qECuyOxX6ZSih4OZVInSpIhaaw==
X-Received: by 2002:a5d:4645:: with SMTP id j5mr2245480wrs.329.1573122978159;
        Thu, 07 Nov 2019 02:36:18 -0800 (PST)
Received: from ninjahub.lan (79-73-36-243.dynamic.dsl.as9105.com. [79.73.36.243])
        by smtp.googlemail.com with ESMTPSA id k125sm2094922wmf.2.2019.11.07.02.36.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Nov 2019 02:36:17 -0800 (PST)
From:   Jules Irenge <jbi.octave@gmail.com>
To:     outreachy-kernel@googlegroups.com
Cc:     sakari.ailus@linux.intel.com, gregkh@linuxfoundation.org,
        julia.lawall@lip6.fr, mchehab@kernel.org,
        linux-media@vger.kernel.org, Jules Irenge <jbi.octave@gmail.com>
Subject: [PATCH] staging: ipu3: replace 0 with false
Date:   Thu,  7 Nov 2019 10:36:08 +0000
Message-Id: <20191107103608.26598-1-jbi.octave@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Replace 0 with false to clear
warning of assignment of 0/1 to bool variable.
Issue detected by coccinelle tool.

Signed-off-by: Jules Irenge <jbi.octave@gmail.com>
---
 drivers/staging/media/ipu3/ipu3-css.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/ipu3/ipu3-css.c b/drivers/staging/media/ipu3/ipu3-css.c
index fd1ed84c400c..f36de501edc6 100644
--- a/drivers/staging/media/ipu3/ipu3-css.c
+++ b/drivers/staging/media/ipu3/ipu3-css.c
@@ -1450,7 +1450,7 @@ bool imgu_css_pipe_queue_empty(struct imgu_css *css, unsigned int pipe)
 bool imgu_css_queue_empty(struct imgu_css *css)
 {
 	unsigned int pipe;
-	bool ret = 0;
+	bool ret = false;
 
 	for (pipe = 0; pipe < IMGU_MAX_PIPE_NUM; pipe++)
 		ret &= imgu_css_pipe_queue_empty(css, pipe);
-- 
2.23.0

