Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9F547185BEA
	for <lists+linux-media@lfdr.de>; Sun, 15 Mar 2020 11:27:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728256AbgCOK1j (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 15 Mar 2020 06:27:39 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:38745 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728141AbgCOK1j (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 15 Mar 2020 06:27:39 -0400
Received: by mail-wr1-f65.google.com with SMTP id x11so12801859wrv.5;
        Sun, 15 Mar 2020 03:27:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FwtzcC8IW9tEsin9GPZR2uWGtkHPFjBYYOq6bNXXxpw=;
        b=am6oQ6Qgb8gpvC5ELOHohR0HLqW9UAY/kQkNaQvn8HLe8PvWC2l8xjIRpb0arNo/AN
         SkCp7IoCdBWOBuMl10wBbc5uhI3Nky+R90bR0IGIku2/0yCo1Uf4cPXISFZJSnKZSFk0
         IJthdtVEEMVnd2YVE39B8FUq/eVWPv8e/cuJxxCJw6AjIH9RXxPi9U+l0M54NsxzwT8P
         YKcaURK+XLvfN1l08nMNEjMgyokzsdPd6KwxLozvfdk/t56395aei9foEvOZrHyMHctb
         +1gHLK/gp3d+DFD45UMLOIJWpFW6DSDmMadtP7Gx/ZjL30gmMdq2bKvDAchsSankBWhK
         xxGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FwtzcC8IW9tEsin9GPZR2uWGtkHPFjBYYOq6bNXXxpw=;
        b=U4WyqCDYy+3KvKSypTfvzlDornB2aX3qgEUkXAOg/EEPl0wiRXMu8garMCQEu+BnG5
         BAf0K8O14zV4x4LP2s+iUdyhj8WFUshIoEFMddeSDKvTL4ujakjWx+d8TyCNqxjB8GsL
         kM4HmZ739HGshKKA8N1/xJRw6WH8+NN680KY3py+X951xT8H8NFe1OUZxjFahDNVQB35
         h1m8sPqVBioKdij1kmVmvppfaK8jJSoe402CdngxwKqsoUGHBh9a63n5pIugLaqHN8ar
         I1Pr6sTvoOum/SV/qcqKtLlrBUeXwuRU5Bd8ePkleu8E0JWM0D6yWJr9rrvpWDzPdoOI
         oAhQ==
X-Gm-Message-State: ANhLgQ11ge5I6XMYhfmgkl/XBjHjzpbQHQ8GdVlWCO2hn94+0Sgeknwq
        9DwZIkHuKKORZOPhNoShamg=
X-Google-Smtp-Source: ADFU+vuJv4kBkZEOnJbIlq3eEi685L26EqBo3hYHwhnfeY9y/Gz0D/sNPSZrEhapWICATb4anJxfPQ==
X-Received: by 2002:adf:b19e:: with SMTP id q30mr28969014wra.163.1584268057577;
        Sun, 15 Mar 2020 03:27:37 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2510:d000:2c12:3438:7cb7:556d])
        by smtp.gmail.com with ESMTPSA id z129sm25765190wmb.7.2020.03.15.03.27.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Mar 2020 03:27:36 -0700 (PDT)
From:   Lad Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Niklas <niklas.soderlund@ragnatech.se>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 1/2] media: v4l2-async: Pass pointer to struct v4l2_subdev in match_custom callback
Date:   Sun, 15 Mar 2020 10:27:23 +0000
Message-Id: <20200315102724.26850-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200315102724.26850-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20200315102724.26850-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Passing a pointer to struct device for the match_custom callback is of no
use as in the bridge driver to match the fwnode, so instead pass the
struct v4l2_subdev pointer so that the bridge driver has enough
information to match against the subdevices.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/media/v4l2-core/v4l2-async.c | 2 +-
 include/media/v4l2-async.h           | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
index 8bde33c21ce4..f897d4025f97 100644
--- a/drivers/media/v4l2-core/v4l2-async.c
+++ b/drivers/media/v4l2-core/v4l2-async.c
@@ -80,7 +80,7 @@ static bool match_custom(struct v4l2_subdev *sd, struct v4l2_async_subdev *asd)
 		/* Match always */
 		return true;
 
-	return asd->match.custom.match(sd->dev, asd);
+	return asd->match.custom.match(sd, asd);
 }
 
 static LIST_HEAD(subdev_list);
diff --git a/include/media/v4l2-async.h b/include/media/v4l2-async.h
index 8319284c93cb..8c014e3bbd6c 100644
--- a/include/media/v4l2-async.h
+++ b/include/media/v4l2-async.h
@@ -86,8 +86,8 @@ struct v4l2_async_subdev {
 			unsigned short address;
 		} i2c;
 		struct {
-			bool (*match)(struct device *dev,
-				      struct v4l2_async_subdev *sd);
+			bool (*match)(struct v4l2_subdev *sd,
+				      struct v4l2_async_subdev *asd);
 			void *priv;
 		} custom;
 	} match;
-- 
2.20.1

