Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E09FA35FCE2
	for <lists+linux-media@lfdr.de>; Wed, 14 Apr 2021 22:56:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229966AbhDNU4m (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 14 Apr 2021 16:56:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229813AbhDNU4f (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 14 Apr 2021 16:56:35 -0400
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com [IPv6:2607:f8b0:4864:20::72c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 799FBC061574;
        Wed, 14 Apr 2021 13:56:13 -0700 (PDT)
Received: by mail-qk1-x72c.google.com with SMTP id e13so13137416qkl.6;
        Wed, 14 Apr 2021 13:56:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=bmptYvWdWIOPCd1RN15wApNIIZ5dgXHAl1pedQA7xlU=;
        b=QPoJag9yGA1GOBhwtT+1duhqIzzCY8qs/y3S8htwFw0U7Cyn23Ang5ej+HY456zf65
         MMWDIjtr1shEafI7mOGdGjp6ZTDPlaQk3XfK1WHSyrE8sCaFPIwn3sXyKTnmpvuimYEt
         t9cKTlufpbEWKxkyxbatsuQ4hJ6len8UhIjKVzIXKDjYxPu0eqG4FZKTgc+JZJ1OJ/0T
         sZ+Ww8edrZ+EdbamN2+8xeZ1zshBeYMBoIQxWr7sb8xvQ4bz/4x6xwQfGuNucRAd1H/e
         v89ff2n0nfWt6t8IM1shCsbr6u3tntF8CxVz97DB/dTXHc9cdKtUxWPMsdz55oke8Zkf
         dvsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=bmptYvWdWIOPCd1RN15wApNIIZ5dgXHAl1pedQA7xlU=;
        b=EmoDIS8xCt8IEzxN14EKLD3mWWR8aS45eY30/pkorJY9MRbkzusV8uai2cKZbCtLJK
         2/FWAjZusvk+rkd6RLCJuqfw315U6vQuH9Db4uGhHU4TPFfnkuIZx4F7cJQvohP3CVK1
         IAXTWkIoA3hCPfOI2YhjhOA/+AksJ4SxvA42/hCdGHzvxgynUFvtNCshPiERyOS9/W1f
         8YrCWHaXDgcNnuo+N4YUxWMO3QAyuWMkJnbe1PneJiHu2LHWssHdaXr2ezkiK01vuSfb
         97Mxv9Q267wzY5KCfNEkbcE3M+kMkDRETKTIATJS2dlsXChGrcXAvozzTTNbXMFCBReO
         Uimg==
X-Gm-Message-State: AOAM531lv/CrLUHXg+T+SDG+QWuu2dddwdIn2/4ruCr9eYxNwjPH2mbI
        HCCI5EU8d8vImd3bhCpbaXU=
X-Google-Smtp-Source: ABdhPJxmX4nWljBmq9wRZI9dTp34558vJ8nQ4Pq+Y2PAm2cf1hMhfGu+/nzurd5LZ4CFuewxk88r9g==
X-Received: by 2002:a37:f612:: with SMTP id y18mr268067qkj.406.1618433772775;
        Wed, 14 Apr 2021 13:56:12 -0700 (PDT)
Received: from focaruja ([138.204.24.234])
        by smtp.gmail.com with ESMTPSA id b83sm481917qkc.97.2021.04.14.13.56.12
        (version=TLS1 cipher=ECDHE-ECDSA-AES128-SHA bits=128/128);
        Wed, 14 Apr 2021 13:56:12 -0700 (PDT)
Date:   Wed, 14 Apr 2021 17:56:10 -0300
From:   Aline Santana Cordeiro <alinesantanacordeiro@gmail.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com
Subject: [PATCH] staging: media: atomisp: pci: Change line break to avoid an
 open parenthesis at the end of the line
Message-ID: <20210414205610.GA9017@focaruja>
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
 drivers/staging/media/atomisp/pci/atomisp_cmd.h | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.h b/drivers/staging/media/atomisp/pci/atomisp_cmd.h
index 1c0d464..8c4fc2b 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.h
@@ -75,8 +75,8 @@ void atomisp_wdt(struct timer_list *t);
 void atomisp_setup_flash(struct atomisp_sub_device *asd);
 irqreturn_t atomisp_isr(int irq, void *dev);
 irqreturn_t atomisp_isr_thread(int irq, void *isp_ptr);
-const struct atomisp_format_bridge *get_atomisp_format_bridge_from_mbus(
-    u32 mbus_code);
+const struct atomisp_format_bridge
+*get_atomisp_format_bridge_from_mbus(u32 mbus_code);
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

