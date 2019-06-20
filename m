Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 63F434C6CE
	for <lists+linux-media@lfdr.de>; Thu, 20 Jun 2019 07:31:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725965AbfFTFbm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 Jun 2019 01:31:42 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:46606 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725857AbfFTFbm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 Jun 2019 01:31:42 -0400
Received: by mail-pl1-f194.google.com with SMTP id e5so885480pls.13;
        Wed, 19 Jun 2019 22:31:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=6IzJrR+c/7CD2gEM6wltfGJeK5J3wuAexdiIyCIyGOo=;
        b=MztBeW/W2j7/pfg4b/inCqZbZcOnGgZc5bc2ujyWZnYesDaMlkFeLXptzahsWzyG8x
         wJ2WPalTHsyi5D+jgFWXytHIV+JbtGWeIBD7t+kyPLycF0uPtIC/f9ulgajbL2mJO+3b
         JXUJLv+PAawK+Epq4YzCGCZnMoPLsdbQZbpgWeW7wFCIUxJ+bspCaBgkMcI1XqBX3aRG
         UEtNGCyGq1NQnKV2Eg3qc1gNbXB2udi6TIJxAUNaso+2bwwtBOlop2hM8FQ9qsQjSNV3
         YtbStfnutMehnOG+2NG48XnV8qKMSMAThoXhckNiHDg5iPzPCTmiRI4qSMb/R5A8op15
         g33Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=6IzJrR+c/7CD2gEM6wltfGJeK5J3wuAexdiIyCIyGOo=;
        b=U7v20tha6DPe/qmeGVwXZRTkO+mWtayTwAfN03bMDvShpzDnDPb9OHSjvQVm+mqxwu
         QzvI+TdkjfxUTulZrMj5oDr6X8GG3znwKGOq4gRFFVb4+oaCPO8AKYM0UBCggQq5m1zd
         Ck490FGZN3I7Zqm02ZXFlNsjJUud25Ho+xx8kjHmndXfQSzIB/OBRRnaYvnWOlc4qIjZ
         cfyfBsXG6+JVs8CFTl6I3cbsxuHjuEoR5rv0ltAe3Tg8nahAPP3s0fGBUZHd/D5jcsUq
         iAraf2DwF0hBSXUk0w5ua165UxDwN/LgRVaXU5t5Ft0aCbLmZiAqppT26bPzepTB4gwT
         629w==
X-Gm-Message-State: APjAAAWuh8tZyK6yygTRl0/XtHSuU67eXU98CfIVqfM7eFo0BqTKrkj9
        gncc9f0etCV1ygQUB2tIeJV3DGIBHFtFGg==
X-Google-Smtp-Source: APXvYqxq7Uri+tANu87ptbZTRn1/fIUoR9hYUmDMjUAKlkKdWL8vDPN4bmQAt820Xy+ywLQvlA3fNQ==
X-Received: by 2002:a17:902:86:: with SMTP id a6mr57640036pla.244.1561008701699;
        Wed, 19 Jun 2019 22:31:41 -0700 (PDT)
Received: from AHMCPU1978.einfochips.com ([219.65.62.52])
        by smtp.gmail.com with ESMTPSA id v23sm20806458pff.185.2019.06.19.22.31.39
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Wed, 19 Jun 2019 22:31:41 -0700 (PDT)
From:   Aliasgar Surti <aliasgar.surti500@gmail.com>
X-Google-Original-From: Aliasgar Surti
To:     linux-media@vger.kernel.org, gregkh@linuxfoundation.org,
        linux-kernel@vger.kernel.org
Cc:     Aliasgar Surti <aliasgar.surti500@gmail.com>
Subject: [PATCH 1/1] staging: media: fix style problem
Date:   Thu, 20 Jun 2019 11:01:15 +0530
Message-Id: <1561008675-30224-1-git-send-email-aliasgar.surti500@gmail.com>
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

