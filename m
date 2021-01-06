Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD19D2EC304
	for <lists+linux-media@lfdr.de>; Wed,  6 Jan 2021 19:13:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726165AbhAFSMr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 6 Jan 2021 13:12:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726077AbhAFSMq (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 6 Jan 2021 13:12:46 -0500
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F9C7C061575;
        Wed,  6 Jan 2021 10:12:06 -0800 (PST)
Received: by mail-ej1-x630.google.com with SMTP id 6so6278622ejz.5;
        Wed, 06 Jan 2021 10:12:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XQGxCTiFtkpwj/Esic/UMfZbUtBp4PBZp64OUURa+20=;
        b=RWIMZR9tYUK0zb+wnT+3jfcN8dX3wv8IPW/nmDWHNgNLq5fyLclGQHXonUkJJrFmJ4
         yW6LFyLvLiRe+8qILz1DJY1BeqZ7+oFcjltzgac8oqR6qBslzw7abQk/1jPS59lpZMlC
         PQM2sM8qK6Q57uFwKagAxhOhPbM3h/XVVk/Sl9QydU5T7v51FcMFXq/S/XOd9IPNxoba
         lyoVYDruY+zKEsd7bDCmZlDgRdK3A5BapEJWUT0E5VJXnjh72KJuC7+ybHNCCphbcpue
         d9JBsz3dPbjOHENhvkuqqEa4zO0TqepiwH7EuIVXh76uQCSOlKMIsn0AFnt5t8vTXW00
         /kRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XQGxCTiFtkpwj/Esic/UMfZbUtBp4PBZp64OUURa+20=;
        b=ss06up6h5yJHb6BRVMoeAKUho2SjjZe/+z065N3Ut6K7ttXuJl5VIOz3uTAAg4RKfw
         KoY/QaQ7/J9r8bgu2mlOXRpeK3hYO4nYTdVXkJxhG2STVaRKOGtf/lrg+ESPPldeuyTY
         cdMr8knC5MR1eYVpljYdS7nI+tD7AnYRQKNpKAR0xs9dnwfRp5y1C7JIXmCuNdILFRAN
         2IWpvcBMk1AgzLG0TF9BHVtEjgSAtfg+Pa78jZIYhwxDQq9+1JCFu/ejAW2/xV7GXgM7
         xASvEQgTebgKpWig7Exfbkm55o3Hgx8KDP+ur877VFI4DmlUA9EKSJjcyaOpPN80ybaA
         LRrg==
X-Gm-Message-State: AOAM530Kr4R7KjfuZFCOvL9v+Vpryn+fBid3ovdmAVi5+twnnzaA4kpU
        vN72C8OByEpAf9Eeq3kO34Y=
X-Google-Smtp-Source: ABdhPJzfDzEBV+E55rXB3SibnGqFHhcQR7AGH+4qRC68WH9Yv2ib3eYaIjb+HWC07g8efOSBuHeCAw==
X-Received: by 2002:a17:906:440e:: with SMTP id x14mr3684191ejo.77.1609956725113;
        Wed, 06 Jan 2021 10:12:05 -0800 (PST)
Received: from arch.laptop (84-238-151-182.ip.btc-net.bg. [84.238.151.182])
        by smtp.gmail.com with ESMTPSA id t26sm1592469eji.22.2021.01.06.10.12.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Jan 2021 10:12:04 -0800 (PST)
From:   Filip Kolev <fil.kolev@gmail.com>
Cc:     Filip Kolev <fil.kolev@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] media: atomisp: ov2722: remove unnecessary debug print
Date:   Wed,  6 Jan 2021 20:11:05 +0200
Message-Id: <20210106181158.2270-1-fil.kolev@gmail.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

checkpatch.pl emits the following warning:

WARNING: Prefer using '"%s...", __func__' to using 'ov2722_remove', this function's name, in a string
+	dev_dbg(&client->dev, "ov2722_remove...\n");

This is just a "trace" call and therefore should be removed entirely;
ftrace should be used instead.

Signed-off-by: Filip Kolev <fil.kolev@gmail.com>
---
 drivers/staging/media/atomisp/i2c/atomisp-ov2722.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c b/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c
index eecefcd734d0e..1209492c1826a 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c
@@ -1175,8 +1175,6 @@ static int ov2722_remove(struct i2c_client *client)
 	struct v4l2_subdev *sd = i2c_get_clientdata(client);
 	struct ov2722_device *dev = to_ov2722_sensor(sd);
 
-	dev_dbg(&client->dev, "ov2722_remove...\n");
-
 	dev->platform_data->csi_cfg(sd, 0);
 	v4l2_ctrl_handler_free(&dev->ctrl_handler);
 	v4l2_device_unregister_subdev(sd);
-- 
2.30.0

