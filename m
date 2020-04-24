Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D2E101B7F78
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2020 21:58:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729310AbgDXT6R (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 24 Apr 2020 15:58:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725970AbgDXT6P (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 24 Apr 2020 15:58:15 -0400
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com [IPv6:2607:f8b0:4864:20::844])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83DEEC09B048;
        Fri, 24 Apr 2020 12:58:15 -0700 (PDT)
Received: by mail-qt1-x844.google.com with SMTP id b1so5335981qtt.1;
        Fri, 24 Apr 2020 12:58:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=A3XPQz7R7FZXT20UmmKFaaeS4yksZtiocodJLBHbiYc=;
        b=F2Ka3sr1kfzPB2y5reGyinI53PYXqPYk95Z5eu7UmYUBWb8iHjv+reSNCaKBjlPU2K
         4Cbp0Lsmt4SH8TWsuOo0bd/2Ai/ymfU5VtoABZylrKZVcO9Rx8+Q90TPHThTGRx2RF7f
         PpK+mRO/yeyH6WdKA992quQoHvIo+uFk/wMqD11sSvD0Nts9BVO5rvVSI9+Mh7Ruw4UH
         UsZOtzjQeogiiPIarGe3Cbg95iW2zWL1CPdGoi8yTVflKUCJm3KFsi+JdTqWSmI46T15
         xwX2A1XCg2DEVXqbPjm1TVTKGXMyoSP/PI3TsUErzEg1j0oqFPROOuo3AEAGHzxYSpJf
         kaog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=A3XPQz7R7FZXT20UmmKFaaeS4yksZtiocodJLBHbiYc=;
        b=cC+XL11KsaiXEJGLSAB6CAQ5iLwVNKoF67mQqvt6kx9eup5M9fNqQhBgFTAIkgRT3B
         hpKphT0KYFW1x5HSI/ludY10cV1FIctvM+Aiw0Wg91F8dgUuMbwc0Fy/Y98h6r6HByCt
         n9kQLQXiTaDN3/NIAbZC4rRZRCRmcZq/X/SiwqNcoVHrw9Wugcx233BYtmCLoSiGPExT
         P7YU4zHFx0kiOpCFwx5OVDTy5lUR4zi69vhCc4gp18tu0qewU/Em4fYJqgTz2X3oqZb8
         RCJjBmXtq//tDA9/I2W6hDia6bmm3kmiJDDTQLxL3TSouZb/OcWPhqI99iccrH1WZFBb
         59gQ==
X-Gm-Message-State: AGi0Pub6KOE5x1zo7grhN9GaCaZZMazTtQTli7sVMjBz1viXN+yPKaPQ
        utmLJfCiDtxr6nVmMAHxbj/RxcPQpbMFVA==
X-Google-Smtp-Source: APiQypJDJDu0Olrg+n6dE1MT/s5ZUshYnDdfbpU/SmL/bsxZZU5ZDP8HXI03DPTeHw+bLdLee2tyRQ==
X-Received: by 2002:ac8:73d3:: with SMTP id v19mr11397487qtp.263.1587758294587;
        Fri, 24 Apr 2020 12:58:14 -0700 (PDT)
Received: from localhost.localdomain ([2804:14c:4e4:9fd:c16a:b4f7:4f95:6154])
        by smtp.gmail.com with ESMTPSA id f188sm4141892qkd.101.2020.04.24.12.58.11
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 24 Apr 2020 12:58:14 -0700 (PDT)
From:   Guilherme Ricioli <guilherme.riciolic@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     lkcamp@lists.libreplanetbr.org, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org, mchehab@kernel.org,
        gregkh@linuxfoundation.org, hverkuil-cisco@xs4all.nl
Subject: [PATCH] staging: media: soc_camera: Enclose macro with parentheses
Date:   Fri, 24 Apr 2020 16:56:24 -0300
Message-Id: <1587758184-17867-1-git-send-email-guilherme.riciolic@gmail.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fix checkpatch error "ERROR: Macros with complex values should be
enclosed in parentheses" in soc_camera.c:241.

Signed-off-by: Guilherme Ricioli <guilherme.riciolic@gmail.com>
---
 drivers/staging/media/soc_camera/soc_camera.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/soc_camera/soc_camera.c b/drivers/staging/media/soc_camera/soc_camera.c
index 39f513f..c2f96ea 100644
--- a/drivers/staging/media/soc_camera/soc_camera.c
+++ b/drivers/staging/media/soc_camera/soc_camera.c
@@ -238,8 +238,8 @@ unsigned long soc_camera_apply_board_flags(struct soc_camera_subdev_desc *ssdd,
 }
 EXPORT_SYMBOL(soc_camera_apply_board_flags);
 
-#define pixfmtstr(x) (x) & 0xff, ((x) >> 8) & 0xff, ((x) >> 16) & 0xff, \
-	((x) >> 24) & 0xff
+#define pixfmtstr(x) ((x) & 0xff, ((x) >> 8) & 0xff, ((x) >> 16) & 0xff, \
+	((x) >> 24) & 0xff)
 
 static int soc_camera_try_fmt(struct soc_camera_device *icd,
 			      struct v4l2_format *f)
-- 
2.7.4

