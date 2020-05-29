Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 72BC81E71E7
	for <lists+linux-media@lfdr.de>; Fri, 29 May 2020 03:06:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2438277AbgE2BFz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 28 May 2020 21:05:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2438203AbgE2BFx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 28 May 2020 21:05:53 -0400
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6007DC08C5C6;
        Thu, 28 May 2020 18:05:53 -0700 (PDT)
Received: by mail-lf1-x144.google.com with SMTP id z206so278708lfc.6;
        Thu, 28 May 2020 18:05:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:subject:message-id:mime-version:content-disposition;
        bh=W5t5VFsoLBXmenoX347jKHn4U2gPV8qf+vAZBbiyle8=;
        b=luWUDREQxObwgj2vwuOUloQFgFs3TXhvyHtvtJu2noTXvctvOCuIvVf9G5ew6z0v+S
         99GvM3DOg8x3Qfa6410ku/AkyPd1IiPBJe2P4JBkEKCI5EEPaKfsIImsF4zFc2hnG8rS
         BBJflZYbb1+olUADMRtjjShnyF0pbthZG18Ml6gJ0ukwswoo98UD5fJVOt3HJ14+u4Pl
         UOKcrTWHqgz5RHvcsirlQPu9T/5PU3UQE5oSo04o2dL/N7UDsDDRWYStE5intz6YSc3f
         SagghPabz+r7JK7gcXsdaX5BUNDIb6prqQr4ZzF5GzPAgLQAV8gUpo5n4UpBOx+G76bQ
         M6ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-disposition;
        bh=W5t5VFsoLBXmenoX347jKHn4U2gPV8qf+vAZBbiyle8=;
        b=GgPRQ3k1k5X3jsuBQ4MyJp+tIHyhzR3PODkPgoWlrGw8vfVdG31F3wwyXJc1fgZ3wP
         1FtTitVxquDtzBIEGEEkSHyQEXI7ZfgWp8MbQWf7mltA9ViszQrBVG5CNxsazr6ZMBS4
         Rw9ynlLb2aB1/8277jTEEoHVP30aI/QvYlk1zPl6sVHCvbSwk97hT9WVOJ184kJ6QK3T
         hRP2wPlLMw5omfEDn6fWVT6fdruBcKxDXkl5AA5zLaRUH2/fi0AtnIbVf2tzh8ONMWpb
         oNkIRX2ZzWUgF+x2xNNbathJD37WNB7x1tEqCrjwjohaxRCfhOyeOcJGNVePbdTjBLub
         HDhQ==
X-Gm-Message-State: AOAM531mRQa1ElYCFTcrS/WocRWxC9XEInce7uJ2vXzxcNEOjn8dbblb
        tRSv622mPgvjdyl64/8hxa7NJPJlc4emqw==
X-Google-Smtp-Source: ABdhPJzKg9cQeT1QQMJ5sr/pyaDpYzqAzMjt6Ajm3i0wOPng9GdbX5EzQs0NJXhwk4LJhlucduwm3w==
X-Received: by 2002:a05:6512:3111:: with SMTP id n17mr2999438lfb.137.1590714351866;
        Thu, 28 May 2020 18:05:51 -0700 (PDT)
Received: from dmitry-T520 ([185.57.31.227])
        by smtp.gmail.com with ESMTPSA id y24sm1975866ljh.18.2020.05.28.18.05.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2020 18:05:51 -0700 (PDT)
Date:   Fri, 29 May 2020 11:05:47 +1000
From:   Dmitry Buzdyk <dima.buzdyk@gmail.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [RFC PATCH] uvcvideo: Add mapping for HEVC payloads
Message-ID: <20200529010547.GA630131@dmitry-T520>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add HEVC GUID and assotiate with HEVC pixel format so that frame
based format descriptors recognized by the UVC video driver.

Signed-off-by: Dmitry Buzdyk <dima.buzdyk@gmail.com>
---
 drivers/media/usb/uvc/uvc_driver.c | 5 +++++
 drivers/media/usb/uvc/uvcvideo.h   | 4 ++++
 2 files changed, 9 insertions(+)

diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index 431d86e1c94b..825ee3601661 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -214,6 +214,11 @@ static struct uvc_format_desc uvc_fmts[] = {
 		.guid		= UVC_GUID_FORMAT_CNF4,
 		.fcc		= V4L2_PIX_FMT_CNF4,
 	},
+	{
+		.name		= "HEVC",
+		.guid		= UVC_GUID_FORMAT_HEVC,
+		.fcc		= V4L2_PIX_FMT_HEVC,
+	},
 };
 
 /* ------------------------------------------------------------------------
diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index 6ab972c643e3..c7f043121b41 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -165,6 +165,10 @@
 	{0x32, 0x00, 0x00, 0x00, 0x02, 0x00, 0x10, 0x00, \
 	 0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
 
+#define UVC_GUID_FORMAT_HEVC \
+	{ 'H',  'E',  'V',  'C', 0x00, 0x00, 0x10, 0x00, \
+	 0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
+
 
 /* ------------------------------------------------------------------------
  * Driver specific constants.
-- 
Dmitry Buzdyk
Rhonda Software

