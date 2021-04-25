Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 842C736A5CB
	for <lists+linux-media@lfdr.de>; Sun, 25 Apr 2021 10:41:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229659AbhDYImN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 25 Apr 2021 04:42:13 -0400
Received: from msg-2.mailo.com ([213.182.54.12]:46318 "EHLO msg-2.mailo.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229485AbhDYImM (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 25 Apr 2021 04:42:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailo.com; s=mailo;
        t=1619340085; bh=Qqf9ahi+IZc1jf6jrxyv3k3Uf3mOBFvvlUwshF0Hbpo=;
        h=X-EA-Auth:Date:From:To:Cc:Subject:Message-ID:References:
         MIME-Version:Content-Type:In-Reply-To;
        b=KxuS4n6lBn/FLZubTF9sj04UNz3XpwYxanwg9TBeF7lFmjOVHDOy8/lKG1/1qKxhh
         9Hml0Z2L/rp3/0J8P6PSkx0Z/mcw9VwxoJxFv7L+xFDwmqXduFcLZDUE7/q7ueR8Zb
         nxCEZPhmHtLaRq7fBkkXW2bEpfXiI56DRz7gZBPs=
Received: by 192.168.90.12 [192.168.90.12] with ESMTP
        via ip-206.mailobj.net [213.182.55.206]
        Sun, 25 Apr 2021 10:41:25 +0200 (CEST)
X-EA-Auth: NQVoMnGHHwIfTWzPjsqcHeotSAtV8/2qeT6Kw+qdSu70Qt89re7apZLaE+NR5yrKKty4wu6BeoIyRIzYJBzlaDukko9uwfkg
Date:   Sun, 25 Apr 2021 14:11:21 +0530
From:   Deepak R Varma <drv@mailo.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org, drv@mailo.com
Subject: [PATCH RESEND v3 1/6] staging: media: atomisp: improve function
 argument alignment
Message-ID: <9b517e04d1a9b56dc14494a246d70915d51b1839.1619199344.git.drv@mailo.com>
References: <cover.1619199344.git.drv@mailo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1619199344.git.drv@mailo.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Improve multi-line function argument alignment according to the code style
guidelines. Resolves checkpatch feedback: "Alignment should match
open parenthesis".

Signed-off-by: Deepak R Varma <drv@mailo.com>
---

Changes since v2:
   - None.
Changes since v1:
   - None.


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



