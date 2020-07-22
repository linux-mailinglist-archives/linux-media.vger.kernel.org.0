Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D4065229ABB
	for <lists+linux-media@lfdr.de>; Wed, 22 Jul 2020 16:55:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732721AbgGVOzd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 22 Jul 2020 10:55:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730465AbgGVOzc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 22 Jul 2020 10:55:32 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84FC4C0619DC;
        Wed, 22 Jul 2020 07:55:32 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id q17so1109971pls.9;
        Wed, 22 Jul 2020 07:55:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=eBk8dn3TkE/mXBf9J+w2oBabvbVjCrfi1xVwK+Vqgqw=;
        b=ev6cmxvAmJcG8uKwSIUBEVa6/oL3l8xdeiA7PtFrooZLz5A1LTGpHCweRDRjOsbZI9
         xJ5vka2DHiQMI3yYv/yI3er0WN4B+WRfwwaI5oMZOW4cR02rJqnoAOrhr1eiY21o7Tgs
         89sv4eEbwc5i1mR3WK81S4YdmV5Jbq2yo770mCCcpwPs0OTQt7Cit/CBEngZGxWlDkn9
         +rPcsmac1KE3nCUi/WwNA/cJ8eM+RSU3OsX+rIYEGowxrHOgkWHFKHV53axGaEe0p1xj
         btpLczsLmZgSUyBwVEmvV8By14/bkdD7HIsaAwWlf+y+Tnb+kbqDRWNQpunNeuzz29oO
         v8OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=eBk8dn3TkE/mXBf9J+w2oBabvbVjCrfi1xVwK+Vqgqw=;
        b=ipipcc6Oiy12A4sNuTgtlZSqj551A/Y1PR5/bHuwBNRgu+IlTK5XyoOXvFYmpOJKJZ
         yv/Mpf0WycDSyXNpNHPyzLczP4CH94it5uOwIJM9uk05Ed+IRoaTGx7vxVgeGyVndDxc
         cqurt+4jWukXq7edC+oS7pH3EhDvZY9wZCNKM8EBrfFx4NcQyNQN7QeiEZ472KANH4QU
         yMvEANF9o3cYaoNmZ7vLzf33iGDLUAvw/MTuR+gkiT6P2WMXobV0APALXw4uYPOXbhZj
         MgOwPmABUZVIVkcjGNR4tlfOyp770I5/YncvhbVBt1+lILAoj4uE0w6unYCmBxY6ne0G
         ESPA==
X-Gm-Message-State: AOAM533aA1rqNmM/1rq91D/6LPttYoqkyRl/EPz34TPiHjIXkC8ltPbk
        aLgYNl/xfkWz3qEfPkjNEGx6klVgURgchw==
X-Google-Smtp-Source: ABdhPJw76w0kPEqMDGiPNMC3LgNmJdLi4c/82+Yx46SIE0fzhwYuMQnjpKhrCTmnG5E5YsPcg/tjnQ==
X-Received: by 2002:a17:902:7b92:: with SMTP id w18mr27157399pll.258.1595429732044;
        Wed, 22 Jul 2020 07:55:32 -0700 (PDT)
Received: from rahulg-ThinkPad-T450 ([122.175.125.202])
        by smtp.gmail.com with ESMTPSA id m19sm230252pgd.13.2020.07.22.07.55.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2020 07:55:31 -0700 (PDT)
Date:   Wed, 22 Jul 2020 20:25:28 +0530
From:   Rahul Gottipati <rahul.blr97@gmail.com>
To:     mchehab@kernel.org
Cc:     sakari.ailus@linux.intel.com, gregkh@linuxfoundation.org,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/2] media: atomisp: Fix coding style issue - remove
 beginning whitespaces
Message-ID: <250fcbc1d5b766e9494e1ecbc379ed76d7dc28c8.1595429109.git.rahul.blr97@gmail.com>
References: <cover.1595429109.git.rahul.blr97@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1595429109.git.rahul.blr97@gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This removes whitespaces at the beginning of a few lines to fix
some checkpatch.pl warnings.

Signed-off-by: Rahul Gottipati <rahul.blr97@gmail.com>
---

Changes in v3:
	Changed style of function headers in response to review comments
Changes in v2:
	Distributed changes across 2 patches instead of the previous 1

 drivers/staging/media/atomisp/pci/atomisp_ioctl.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
index 9404a678fa6f..4fc4bdd85ce0 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
@@ -511,8 +511,8 @@ const struct atomisp_format_bridge atomisp_output_fmts[] = {
 #endif
 };
 
-const struct atomisp_format_bridge *atomisp_get_format_bridge(
-    unsigned int pixelformat)
+const struct atomisp_format_bridge *
+atomisp_get_format_bridge(unsigned int pixelformat)
 {
 	unsigned int i;
 
@@ -524,8 +524,8 @@ const struct atomisp_format_bridge *atomisp_get_format_bridge(
 	return NULL;
 }
 
-const struct atomisp_format_bridge *atomisp_get_format_bridge_from_mbus(
-    u32 mbus_code)
+const struct atomisp_format_bridge *
+atomisp_get_format_bridge_from_mbus(u32 mbus_code)
 {
 	unsigned int i;
 
@@ -606,8 +606,8 @@ static int atomisp_enum_input(struct file *file, void *fh,
 	return 0;
 }
 
-static unsigned int atomisp_subdev_streaming_count(
-    struct atomisp_sub_device *asd)
+static unsigned int
+atomisp_subdev_streaming_count(struct atomisp_sub_device *asd)
 {
 	return asd->video_out_preview.capq.streaming
 	       + asd->video_out_capture.capq.streaming
-- 
2.25.1

