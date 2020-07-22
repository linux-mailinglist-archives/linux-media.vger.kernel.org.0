Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C720D229765
	for <lists+linux-media@lfdr.de>; Wed, 22 Jul 2020 13:29:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730099AbgGVL2g (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 22 Jul 2020 07:28:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726028AbgGVL2f (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 22 Jul 2020 07:28:35 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CBD68C0619DC;
        Wed, 22 Jul 2020 04:28:35 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id s189so1068025pgc.13;
        Wed, 22 Jul 2020 04:28:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=QRz/9vB9ihwSFnVrvk1F21V7kn+nkhXBAC2KmN40Tc0=;
        b=XY1qaQKKsrnYf9ll7C4uW2w0IPRusZfy2PrOu9uj08G3AVQaP5wkxV+F15JCjapGKc
         9R2oHjdDpGcMBA9QJ+/+u7FgmZzru3dVs5hWZ+8kKF/8gtzpxJ0bpFlZuDXfaaj6YrpI
         7ldZXlmor4vRSde0w8atIcewBjpfrY/gNLL92+C5lwDMibtj1RJui0lv5nzeA7bJrYZh
         DszaLG8zsWEffvCHVY4ZKO+kB8zKZU3L2Szd9QWXcec7IGsQdc2GLj2Dk5c95cG7wwNV
         Bovh19cFku49ax7Cscg8d2QBYZmqUAf4KGpKuZlXFsa2Chlr7xklu5hTdv+0RhjYGp6r
         T5rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=QRz/9vB9ihwSFnVrvk1F21V7kn+nkhXBAC2KmN40Tc0=;
        b=iiBAxLjEjrB4zEAKK3ToxE4WN9x/HeFW+KsyFtqL68P9vjYX2NHO8AVMz2vj20DMuN
         yLpqPtPsltSWXps/5eQ9l/os9AgMEqLxvzQdieGMT8DaBs+0wd2Qhk6kKiybSVWlJljp
         ey2l2Oe6nHEfJwPRJ4xjInFi50uqBvWMyCzu8Nx1aabrpFZhCVe8BR2PkqzulAlBPHHH
         WmPhbJHW5Xg+MICNpGVOVvkMup8pcwDZpneW8M7snqh9iQMVwJTfqnmQFqf5kgTmu0+H
         EUHUvYmA/ES1+lYath0QhDjmYFNVs18U8CpnQ4cMXNVppTX6qcG7WlAmjjU0Fkt4HkLY
         h1hg==
X-Gm-Message-State: AOAM532YP6O7JWXpv6LwMufdhzy+zbG1BP8XtE2q5nXIefSyLMaLWctm
        EDcpXD8280zppQj0PAWQBq8=
X-Google-Smtp-Source: ABdhPJzDcgdGQfkQgxhAWWc78GEEPa8O65nyTUsMXpvIZZ2SjKAcsv6wDRn6VtbtRs/U0zpqzmXuoQ==
X-Received: by 2002:a63:e241:: with SMTP id y1mr26974243pgj.410.1595417315369;
        Wed, 22 Jul 2020 04:28:35 -0700 (PDT)
Received: from rahulg-ThinkPad-T450 ([122.175.73.180])
        by smtp.gmail.com with ESMTPSA id b8sm6681107pjd.5.2020.07.22.04.28.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2020 04:28:34 -0700 (PDT)
Date:   Wed, 22 Jul 2020 16:58:31 +0530
From:   Rahul Gottipati <rahul.blr97@gmail.com>
To:     mchehab@kernel.org
Cc:     sakari.ailus@linux.intel.com, gregkh@linuxfoundation.org,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] media: atomisp: Fix coding style issue - remove
 beginning whitespaces
Message-ID: <5b2242008c92871daa5bfb7c9c3cafbbf592228b.1595416585.git.rahul.blr97@gmail.com>
References: <cover.1595416585.git.rahul.blr97@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1595416585.git.rahul.blr97@gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This removes whitespaces at the beginning of a few lines to fix
some checkpatch.pl warnings.

Signed-off-by: Rahul Gottipati <rahul.blr97@gmail.com>
---
Changes in v2:
	Distributed changes across 2 patches instead of the previous 1

 drivers/staging/media/atomisp/pci/atomisp_ioctl.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
index 9404a678fa6f..9cdcbe774229 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
@@ -512,7 +512,7 @@ const struct atomisp_format_bridge atomisp_output_fmts[] = {
 };
 
 const struct atomisp_format_bridge *atomisp_get_format_bridge(
-    unsigned int pixelformat)
+				unsigned int pixelformat)
 {
 	unsigned int i;
 
@@ -525,7 +525,7 @@ const struct atomisp_format_bridge *atomisp_get_format_bridge(
 }
 
 const struct atomisp_format_bridge *atomisp_get_format_bridge_from_mbus(
-    u32 mbus_code)
+				u32 mbus_code)
 {
 	unsigned int i;
 
@@ -607,7 +607,7 @@ static int atomisp_enum_input(struct file *file, void *fh,
 }
 
 static unsigned int atomisp_subdev_streaming_count(
-    struct atomisp_sub_device *asd)
+				struct atomisp_sub_device *asd)
 {
 	return asd->video_out_preview.capq.streaming
 	       + asd->video_out_capture.capq.streaming
-- 
2.25.1

