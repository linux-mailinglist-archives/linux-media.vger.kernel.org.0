Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9CDEF914FE
	for <lists+linux-media@lfdr.de>; Sun, 18 Aug 2019 07:59:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726286AbfHRF7B (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 18 Aug 2019 01:59:01 -0400
Received: from mail-yb1-f195.google.com ([209.85.219.195]:36552 "EHLO
        mail-yb1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725209AbfHRF7B (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 18 Aug 2019 01:59:01 -0400
Received: by mail-yb1-f195.google.com with SMTP id m9so3309345ybm.3;
        Sat, 17 Aug 2019 22:59:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=z+ekumFDBeqsCJJqP+DBppfAA/PTmlYsOJRcevKwZrQ=;
        b=O1UseAXtW+CWVrhgMit6lPXYcN1akvaslFvKv4X0n7OCIRZuPUNzgBeUe5/HBJexPc
         Ue76TLKIS48F1Fve2OSZH9d0qLVvVYBMgBAef+0Zq1JKj/e4ksy/iB9hI8X4z1LwNZro
         OmPauFUhcZv7EAZfXoY23a7Ww0PcPRV9VN/fh/U0rxmYmTttayJMo0lF419bh7WJZ45/
         15xHjLrY+X9YmWxO2dienkmiNCcd4o7IZyvdSA/bTgoF62ZbFWaIv8J3a0mSWeMylQNV
         Ry/3PH1OppYrMIbzABIDt/LI13MJ+d0DQdzCMREVonD9OdQ8N6oM8zVfaRo9vqylSYhR
         SV3Q==
X-Gm-Message-State: APjAAAVaov8upEGug+GtnRwyZjMxxUzX3CTL1SzGVLBrznxba1vf84yi
        1c4wFWydLEImloom64zn9Ls=
X-Google-Smtp-Source: APXvYqyZIfVqHLPXbFGWvkaxVG4Ig5wbBIae2LnuRxnLrywbXzUngzvezEELbJyJf4Ayv0fxnUHuSw==
X-Received: by 2002:a25:8b01:: with SMTP id i1mr13474480ybl.478.1566107940804;
        Sat, 17 Aug 2019 22:59:00 -0700 (PDT)
Received: from localhost.localdomain (24-158-240-219.dhcp.smyr.ga.charter.com. [24.158.240.219])
        by smtp.gmail.com with ESMTPSA id d15sm568385ywa.34.2019.08.17.22.58.59
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Sat, 17 Aug 2019 22:59:00 -0700 (PDT)
From:   Wenwen Wang <wenwen@cs.uga.edu>
To:     Wenwen Wang <wenwen@cs.uga.edu>
Cc:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org (open list:MEDIA DRIVERS FOR RENESAS - FDP1),
        linux-renesas-soc@vger.kernel.org (open list:MEDIA DRIVERS FOR RENESAS
        - FDP1), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] media: fdp1: Fix a memory leak bug
Date:   Sun, 18 Aug 2019 00:58:53 -0500
Message-Id: <1566107933-3355-1-git-send-email-wenwen@cs.uga.edu>
X-Mailer: git-send-email 2.7.4
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

In fdp1_open(), 'ctx' is allocated through kzalloc(). However, it is not
deallocated if v4l2_ctrl_new_std() fails, leading to a memory leak bug. To
fix this issue, free 'ctx' before going to the 'done' label.

Signed-off-by: Wenwen Wang <wenwen@cs.uga.edu>
---
 drivers/media/platform/rcar_fdp1.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/rcar_fdp1.c b/drivers/media/platform/rcar_fdp1.c
index 43aae9b..9e4b330 100644
--- a/drivers/media/platform/rcar_fdp1.c
+++ b/drivers/media/platform/rcar_fdp1.c
@@ -2122,6 +2122,7 @@ static int fdp1_open(struct file *file)
 	if (ctx->hdl.error) {
 		ret = ctx->hdl.error;
 		v4l2_ctrl_handler_free(&ctx->hdl);
+		kfree(ctx);
 		goto done;
 	}
 
-- 
2.7.4

