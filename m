Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DD102364A47
	for <lists+linux-media@lfdr.de>; Mon, 19 Apr 2021 21:12:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241041AbhDSTNJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 19 Apr 2021 15:13:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237147AbhDSTNJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 19 Apr 2021 15:13:09 -0400
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F105BC06174A;
        Mon, 19 Apr 2021 12:12:38 -0700 (PDT)
Received: by mail-pl1-x635.google.com with SMTP id t22so17967527ply.1;
        Mon, 19 Apr 2021 12:12:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=hhCuGXWa0fhjfhibJmgMwfVxqiMW8JqhMXVVBFl7UlE=;
        b=h/2xO5MHvbzo/6sLqX/slReFjbdfceWv4QDvMzUjAv+ZW3B20hWBoCZAUOdE8vKEY9
         faH/CYNYYb+bKZuZdf/BLuZawWyAEXXZjCdOd73twX9oCjqAYuULZnYwz1B7X2+t74+6
         S+5GXrKZbM6fvUfzd6wMccpIlwulKX2H84Q0A+YVfO6ZXZ+eiTNbF28r0VsZgIp5yv1I
         LE/6dPTXazuv7AcA2BoJ1/vXMe+/e8wIIVVy0Wdg0KYT5+H+1wJencik0OJ1XRSMi8Rq
         OzXXg0g4yT9YqPxWkRXUSRu29kOE3wY9v1liErLT0wAm9y9TnQcNRNl73TH+pYneYnpv
         7tVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=hhCuGXWa0fhjfhibJmgMwfVxqiMW8JqhMXVVBFl7UlE=;
        b=Q1cN+cSEgjLHDhpzrh2bXOiFiTOVRbPOXFFHJFPmi/JSkmxd7s1N6S5Wx3MyQkBaDc
         xDxlXlEWG+eR4ECAF2z1wD7hnR44HNj8Gwrbyo2M6VEU3H8dBtgBzb4c8h537pfKuPuo
         YMFqylJ7VRa3I+J+q+h1KtXBArWBaeGLcT8gwozUjBOFmuRuQ7Yg5kZDUydws9fpitWP
         TK8lxkBU+d4kPQeA8EM/TgcP/q+WmxecLJ3lfrx+dmUvLqfpFBYHWrb3CiKNoRfbdf7W
         4qQ+z1RHZ5rdtTv8aATIUUhbfw1tzDwEh1anlq2RhRa9sxzDzoDe1zWEEiqW1DFdMwHj
         4Tkw==
X-Gm-Message-State: AOAM531FYY9YdCFhXOPSCWY7Agmo20Dfcy4UKeKhpfAhkGFEAoyMQeba
        Pks8c7Q7FexoHr0SfnTZK/U=
X-Google-Smtp-Source: ABdhPJwwnoRLnvUg/qcBV69px02pdkGq9lZIfhnSCOJd5DYa4kt7j+iMQx09/c6YNhRYxNf7+GrBSA==
X-Received: by 2002:a17:90a:d201:: with SMTP id o1mr631123pju.230.1618859558651;
        Mon, 19 Apr 2021 12:12:38 -0700 (PDT)
Received: from localhost ([103.241.225.98])
        by smtp.gmail.com with ESMTPSA id q18sm13752588pfj.131.2021.04.19.12.12.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Apr 2021 12:12:38 -0700 (PDT)
From:   Deepak R Varma <mh12gx2825@gmail.com>
X-Google-Original-From: Deepak R Varma <drv@mailo.com>
Date:   Tue, 20 Apr 2021 00:42:33 +0530
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org
Cc:     mh12gx2825@gmail.com
Subject: [PATCH 1/6] staging: media: atomisp: improve function argument
 alignment
Message-ID: <9b517e04d1a9b56dc14494a246d70915d51b1839.1618859059.git.drv@mailo.com>
References: <cover.1618859059.git.drv@mailo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1618859059.git.drv@mailo.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Improve multi-line function argument alignment according to the code style
guidelines. Resolves checkpatch feedback: "Alignment should match
open parenthesis".

Signed-off-by: Deepak R Varma <drv@mailo.com>
---
 drivers/staging/media/atomisp/i2c/atomisp-gc0310.c | 4 ++--
 drivers/staging/media/atomisp/i2c/atomisp-gc2235.c | 4 ++--
 drivers/staging/media/atomisp/i2c/atomisp-ov2722.c | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c b/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
index 2b71de722ec3..6be3ee1d93a5 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
@@ -192,8 +192,8 @@ static int __gc0310_buf_reg_array(struct i2c_client *client,
 }
 
 static int __gc0310_write_reg_is_consecutive(struct i2c_client *client,
-	struct gc0310_write_ctrl *ctrl,
-	const struct gc0310_reg *next)
+					     struct gc0310_write_ctrl *ctrl,
+					     const struct gc0310_reg *next)
 {
 	if (ctrl->index == 0)
 		return 1;
diff --git a/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c b/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
index 78147ffb6099..6ba4a8adff7c 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
@@ -171,8 +171,8 @@ static int __gc2235_buf_reg_array(struct i2c_client *client,
 }
 
 static int __gc2235_write_reg_is_consecutive(struct i2c_client *client,
-	struct gc2235_write_ctrl *ctrl,
-	const struct gc2235_reg *next)
+					     struct gc2235_write_ctrl *ctrl,
+					     const struct gc2235_reg *next)
 {
 	if (ctrl->index == 0)
 		return 1;
diff --git a/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c b/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c
index eecefcd734d0..aec7392fd1de 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c
@@ -212,8 +212,8 @@ static int __ov2722_buf_reg_array(struct i2c_client *client,
 }
 
 static int __ov2722_write_reg_is_consecutive(struct i2c_client *client,
-	struct ov2722_write_ctrl *ctrl,
-	const struct ov2722_reg *next)
+					     struct ov2722_write_ctrl *ctrl,
+					     const struct ov2722_reg *next)
 {
 	if (ctrl->index == 0)
 		return 1;
-- 
2.25.1

