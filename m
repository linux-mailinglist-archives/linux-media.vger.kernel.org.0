Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BC3274DFCA
	for <lists+linux-media@lfdr.de>; Fri, 21 Jun 2019 06:35:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726166AbfFUEfI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 21 Jun 2019 00:35:08 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:34272 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725832AbfFUEfH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 21 Jun 2019 00:35:07 -0400
Received: by mail-pf1-f193.google.com with SMTP id c85so2914286pfc.1;
        Thu, 20 Jun 2019 21:35:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=A6hpEgoP1HI2YorrXleNsa6bGrxBTridY5fsAuWOnjU=;
        b=CvxKvx3xNelgjCHpJ4YVwgMYvH7pIpFmcjBoqo+5hiBcck1xOmKIBU2sNZsPAHY3rn
         ypMs2JdXApsw99Gci4FIdnWQA5BFZiUCaQZvGFpmvVij3FViQJ4Q4gSEWqDWe2aZvxxW
         ItyN694Bucdwm3/8akBSS9gNF4s2AamaJ4q0tZwS5oBQOTwO4ofqIil/ysgTZ/6jn3lS
         w/uzdz0DoyIqa1oIl9unuRGQje77Be28kTniBSEv+r5NO1Y2ZrC1NXIjwsP/Ga5ziTTj
         5uOv+/27xPJSjccf83Zr6fSAx6JRvPC3mz3jAnqr4lGcr9hIVYHDfkGIreuu2jlvaORm
         unnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=A6hpEgoP1HI2YorrXleNsa6bGrxBTridY5fsAuWOnjU=;
        b=Y5nvBLz/MwZYmbaSGJHoAfTGAdXzsFKSq1NFrFeoBPiLd7c5dkxaiEXnTKB1TvmSOL
         O/GcvfQHKx7lNit0S4N5jpydj0ErUovwyvKgmOO8EIUPgZ2H8+PCU7LSPQ/n7O33jC+3
         MFZTxXgwChqCZW68iYMQvDz5SMBonyG7/p/Z/p7OkYBIgr8F/Z26RqqMDGzQ7CIvAyVa
         xxICvNGVAOEPTMVHRWw56Soex8I4HyBeCaZ+tQstj0n6TKUQ2FCeQmNFIUOtmD7x6g+P
         273EmPX+mjfz9FuicOIASJJci7sBl5Vysg3YmXDjJtW0JJJX1JNt8HwClGlOgU5GC830
         1EsQ==
X-Gm-Message-State: APjAAAUuuYFvrVI1SjZPQPc5UINLL0AG7PqIKMThMBN/1fi9uiZHxrNW
        FWb5nsS6qYIANvXL9N3J4Q3CuVNimnHtpA==
X-Google-Smtp-Source: APXvYqxHMHyhPdKQxCrGfvw9wAOrl15TkC2ds302Ew8Wn3SFF+bYxm8yb3RoY+JJegiIJ2gtpXYTgQ==
X-Received: by 2002:a63:5247:: with SMTP id s7mr15570937pgl.29.1561091706357;
        Thu, 20 Jun 2019 21:35:06 -0700 (PDT)
Received: from AHMCPU1978.einfochips.com ([219.65.62.52])
        by smtp.gmail.com with ESMTPSA id g13sm1015258pfi.93.2019.06.20.21.35.04
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Thu, 20 Jun 2019 21:35:05 -0700 (PDT)
From:   Aliasgar Surti <aliasgar.surti500@gmail.com>
X-Google-Original-From: Aliasgar Surti
To:     linux-media@vger.kernel.org, gregkh@linuxfoundation.org,
        linux-kernel@vger.kernel.org
Cc:     Aliasgar Surti <aliasgar.surti500@gmail.com>
Subject: [PATCH v2 1/1] staging: media: fix style problem
Date:   Fri, 21 Jun 2019 10:04:53 +0530
Message-Id: <1561091693-18427-1-git-send-email-aliasgar.surti500@gmail.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Aliasgar Surti <aliasgar.surti500@gmail.com>

checkpatch reported "WARNING: line over 80 characters".
This patch fixes the warning for file davinci_vpfe/dm365_isif.c

Signed-off-by: Aliasgar Surti <aliasgar.surti500@gmail.com>
---
Changes in v2:
	- Fixed styling as per suggestion in comments
 
 drivers/staging/media/davinci_vpfe/dm365_isif.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/davinci_vpfe/dm365_isif.c b/drivers/staging/media/davinci_vpfe/dm365_isif.c
index 46fd818..e9c8de1 100644
--- a/drivers/staging/media/davinci_vpfe/dm365_isif.c
+++ b/drivers/staging/media/davinci_vpfe/dm365_isif.c
@@ -532,7 +532,8 @@ static int isif_validate_dfc_params(const struct vpfe_isif_dfc *dfc)
 #define DM365_ISIF_MAX_CLVSV			0x1fff
 #define DM365_ISIF_MAX_HEIGHT_BLACK_REGION	0x1fff
 
-static int isif_validate_bclamp_params(const struct vpfe_isif_black_clamp *bclamp)
+static int
+isif_validate_bclamp_params(const struct vpfe_isif_black_clamp *bclamp)
 {
 	int err = -EINVAL;
 
@@ -593,7 +594,8 @@ isif_validate_raw_params(const struct vpfe_isif_raw_config *params)
 	return isif_validate_bclamp_params(&params->bclamp);
 }
 
-static int isif_set_params(struct v4l2_subdev *sd, const struct vpfe_isif_raw_config *params)
+static int isif_set_params(struct v4l2_subdev *sd,
+			   const struct vpfe_isif_raw_config *params)
 {
 	struct vpfe_isif_device *isif = v4l2_get_subdevdata(sd);
 	int ret = -EINVAL;
-- 
2.7.4

