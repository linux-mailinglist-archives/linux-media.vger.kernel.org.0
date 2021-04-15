Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 68AF73610C3
	for <lists+linux-media@lfdr.de>; Thu, 15 Apr 2021 19:08:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234313AbhDORIs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Apr 2021 13:08:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234316AbhDORIr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Apr 2021 13:08:47 -0400
Received: from mail-qt1-x832.google.com (mail-qt1-x832.google.com [IPv6:2607:f8b0:4864:20::832])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96494C061574;
        Thu, 15 Apr 2021 10:08:24 -0700 (PDT)
Received: by mail-qt1-x832.google.com with SMTP id m16so18078608qtx.9;
        Thu, 15 Apr 2021 10:08:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=uf0ZGB2uqUBLy2FnRQ3C5Lz7GzWpWAMQjMxZozUcp5k=;
        b=bCFCUHYUlz/cSCkhPoAYlnGHW0yxm8SgH5bZ5/zjQtgK7Kxi38yQcZrE45PiIq9++i
         xLpAMGedcKXZ/+0ypaMlt++xi274dslp6FLpKeAWMyg87OSpAm4DK3YCa9xLgXkDNj5q
         p+DzbHChR/QXglUAbTI5KDmu+Njim/jkpMOGYGkNuN/A03NemlZHcW0+jerzkCkBfwJC
         ymtkwf/UazsBelMfqPl49R2CBpvooC9426pVHPnN8qnvWkpew0xt7mQY4dSeYGy1R+w9
         EDFLtq73zm/SdAdNPmrN7vZTv7a9RCSENBJ0KgKAOwesML6nk6fFTzfY7+fzTj1l1QSY
         exFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=uf0ZGB2uqUBLy2FnRQ3C5Lz7GzWpWAMQjMxZozUcp5k=;
        b=n/h0Rx/dLXArpRsGEu9MAvUQ3jIE/OdwoF1N8bg5/Rxb9caxcSr0bIQZ6Ak/1UGIHz
         UGC1Zb82vIQmj6+ME3TzEEkkOi0TAjZ0S7noPsScm26H7ZaCd9Cw2N+oc2RvFPNJNeAk
         QlAFT6W8uWCto++oc3YsTMBj56D2dOSeECji1rY6R7yAui2rab0adpeXc+TaT6OR7C6T
         30IiOOoInATE2reVxhFOmHo2oRXjjK+Qb6iY5jgzGzIZCTPHmQ/W6Cd/xNCZmhEMfyOa
         nIhcMRZctI/B6V/hF/k8r3mW55ugMkwClj+Me2n/GcHIMBFAI1gAUFZ9Akvth0H73scg
         c/EQ==
X-Gm-Message-State: AOAM530OB/Hb4mK0zVQV4wMTHqkev2wl2ECjph/Dqn+dq8/zScmwVvn4
        Zxz8YvTJJaA+tBFxeeWTV5cj/XrbU4zo0Qy3
X-Google-Smtp-Source: ABdhPJzOeRFjoO9OHsiSE+7RSGeSUAWJh1ZYOuV+qhCuDn5eN6OwJWeKdgkT+p9hZWQfsORQj2wICg==
X-Received: by 2002:ac8:7dc5:: with SMTP id c5mr3948348qte.270.1618506502022;
        Thu, 15 Apr 2021 10:08:22 -0700 (PDT)
Received: from focaruja ([138.204.24.234])
        by smtp.gmail.com with ESMTPSA id d10sm2022151qtn.34.2021.04.15.10.08.21
        (version=TLS1 cipher=ECDHE-ECDSA-AES128-SHA bits=128/128);
        Thu, 15 Apr 2021 10:08:21 -0700 (PDT)
Date:   Thu, 15 Apr 2021 14:08:19 -0300
From:   Aline Santana Cordeiro <alinesantanacordeiro@gmail.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com
Subject: [PATCH v2] staging: media: atomisp: pci: Change line break to avoid
 an open parenthesis at the end of the line
Message-ID: <20210415170819.GA17534@focaruja>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.5.24 (2015-08-30)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Change line break to avoid an open parenthesis at the end of the line.
It consequently removed spaces at the start of the subsequent line.
Both issues detected by checkpatch.pl.

Signed-off-by: Aline Santana Cordeiro <alinesantanacordeiro@gmail.com>
---

Changes since v1:
 - Keep the * with the function return type 
   instead of left it with the function name

 drivers/staging/media/atomisp/pci/atomisp_cmd.h | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.h b/drivers/staging/media/atomisp/pci/atomisp_cmd.h
index 1c0d464..e2b36fa 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.h
@@ -75,8 +75,8 @@ void atomisp_wdt(struct timer_list *t);
 void atomisp_setup_flash(struct atomisp_sub_device *asd);
 irqreturn_t atomisp_isr(int irq, void *dev);
 irqreturn_t atomisp_isr_thread(int irq, void *isp_ptr);
-const struct atomisp_format_bridge *get_atomisp_format_bridge_from_mbus(
-    u32 mbus_code);
+const struct atomisp_format_bridge*
+get_atomisp_format_bridge_from_mbus(u32 mbus_code);
 bool atomisp_is_mbuscode_raw(uint32_t code);
 int atomisp_get_frame_pgnr(struct atomisp_device *isp,
 			   const struct ia_css_frame *frame, u32 *p_pgnr);
@@ -381,9 +381,9 @@ enum mipi_port_id __get_mipi_port(struct atomisp_device *isp,
 
 bool atomisp_is_vf_pipe(struct atomisp_video_pipe *pipe);
 
-void atomisp_apply_css_parameters(
-    struct atomisp_sub_device *asd,
-    struct atomisp_css_params *css_param);
+void atomisp_apply_css_parameters(struct atomisp_sub_device *asd,
+				  struct atomisp_css_params *css_param);
+
 void atomisp_free_css_parameters(struct atomisp_css_params *css_param);
 
 void atomisp_handle_parameter_and_buffer(struct atomisp_video_pipe *pipe);
-- 
2.7.4

