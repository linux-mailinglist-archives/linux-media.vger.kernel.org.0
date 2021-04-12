Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F2ECA35C7DB
	for <lists+linux-media@lfdr.de>; Mon, 12 Apr 2021 15:42:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241442AbhDLNnP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Apr 2021 09:43:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237043AbhDLNnO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Apr 2021 09:43:14 -0400
Received: from mail-qv1-xf32.google.com (mail-qv1-xf32.google.com [IPv6:2607:f8b0:4864:20::f32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20B2BC061574;
        Mon, 12 Apr 2021 06:42:57 -0700 (PDT)
Received: by mail-qv1-xf32.google.com with SMTP id j3so6233849qvs.1;
        Mon, 12 Apr 2021 06:42:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=MrWSz6wX/egEaHbz/XuvavKQPKrV7Jk/VW2Pb1PAdG4=;
        b=g9jMdSGtgnXKHYE1xnBY+GxDo7ngyK+6HpalUopCkEtoC5Tg+WMPO+ByeHvSzoTjoU
         2kRcw2b4H9hyJcU3HZqhgJR3ZynWKsWstzb/luDMR4Y6eI4wW1LY5iXUcUg8ZgxFYSVq
         2p6frvh+gbaCGwZpq/zpfw1qmkbW8AgJn3mRTO4Bz3fTK1Pn6yk2oR9hixnwF2bom3QP
         SglD3szmjp3mhopV+S6GV+6sI2S4BHjDa234tDQmmSQL/AeSF8JS/FTBGb6siJI1v5sd
         8Qqp2LEGAAGB3idiUMwsm05czEy2StlrAd3vi44z7lpqncFx4oPfMHV+Y4eEEMal5n5T
         t7pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=MrWSz6wX/egEaHbz/XuvavKQPKrV7Jk/VW2Pb1PAdG4=;
        b=jScfspMLhYUy1WGvMExk65fk7vPOHE8sLC3ZKI8jrIlfALn3PTHLHzuNcRn3cs39qy
         W81juffkvRck40v+aj6UC/DmbTdzIXog+slVcoVp4ECww3bpnk0QW3u2weBKbZ15/9K2
         S7ElUZl4xj155RgqSpy7h6uZN2+xV8kivDyNWjBQH4MSOqZG6NzsrStWUR92gKRxvnjO
         kQ0RiiB+EZ0eeDjze8JysSwomMAG4o65Qum8DkqJdOXG91g9Tarvb5YSabhTf2pr18Vb
         lVAnJPlb8jtvuToKKJK1Iar4cUKfoCwInHh8/3r6VuVcLqCuGFkwcfRyw55XCniN6FBR
         difA==
X-Gm-Message-State: AOAM533t2Qfdtz88SQTM/oMtsl6KW104lMZgZ0UXddPU7f2GwE2a9gO+
        hfU+BIj7Rg+7di/0OHFrKLc=
X-Google-Smtp-Source: ABdhPJzM4oLk1JOxyMdE5yZntqPBFf4twVqatPTNh2UrfXvmjLgISBWZ+FZHEaKsqhTWrv7Qer/+uw==
X-Received: by 2002:a0c:eacb:: with SMTP id y11mr12388363qvp.57.1618234976435;
        Mon, 12 Apr 2021 06:42:56 -0700 (PDT)
Received: from focaruja ([2001:1284:f016:a037:476a:dfcd:f18f:9ad5])
        by smtp.gmail.com with ESMTPSA id n6sm7346339qtx.22.2021.04.12.06.42.55
        (version=TLS1 cipher=ECDHE-ECDSA-AES128-SHA bits=128/128);
        Mon, 12 Apr 2021 06:42:56 -0700 (PDT)
Date:   Mon, 12 Apr 2021 10:42:53 -0300
From:   Aline Santana Cordeiro <alinesantanacordeiro@gmail.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com
Subject: [PATCH] staging: media: omap4iss: Remove unused macro functions
Message-ID: <20210412134253.GA19402@focaruja>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.5.24 (2015-08-30)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Remove unused macro functions "to_iss_device()", "to_device()",
and "v4l2_dev_to_iss_device(dev)".

Signed-off-by: Aline Santana Cordeiro <alinesantanacordeiro@gmail.com>
---
 drivers/staging/media/omap4iss/iss.h | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/staging/media/omap4iss/iss.h b/drivers/staging/media/omap4iss/iss.h
index b88f952..a354d5f 100644
--- a/drivers/staging/media/omap4iss/iss.h
+++ b/drivers/staging/media/omap4iss/iss.h
@@ -29,11 +29,6 @@
 
 struct regmap;
 
-#define to_iss_device(ptr_module)				\
-	container_of(ptr_module, struct iss_device, ptr_module)
-#define to_device(ptr_module)						\
-	(to_iss_device(ptr_module)->dev)
-
 enum iss_mem_resources {
 	OMAP4_ISS_MEM_TOP,
 	OMAP4_ISS_MEM_CSI2_A_REGS1,
@@ -119,9 +114,6 @@ struct iss_device {
 	unsigned int isp_subclk_resources;
 };
 
-#define v4l2_dev_to_iss_device(dev) \
-	container_of(dev, struct iss_device, v4l2_dev)
-
 int omap4iss_get_external_info(struct iss_pipeline *pipe,
 			       struct media_link *link);
 
-- 
2.7.4

