Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 414D5683658
	for <lists+linux-media@lfdr.de>; Tue, 31 Jan 2023 20:21:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231388AbjAaTVC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 31 Jan 2023 14:21:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230523AbjAaTUy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 31 Jan 2023 14:20:54 -0500
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD2B159B68
        for <linux-media@vger.kernel.org>; Tue, 31 Jan 2023 11:20:49 -0800 (PST)
Received: by mail-wm1-x330.google.com with SMTP id bg13-20020a05600c3c8d00b003d9712b29d2so13257075wmb.2
        for <linux-media@vger.kernel.org>; Tue, 31 Jan 2023 11:20:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3Oglwja209DBwLPu/64QCgl+GIyqfPWjKg2KrFs+Lww=;
        b=TS5sWYetcPvm91XnLw+xD+jrwdRtv59wYwjAKKW3WWTl5tfWIPUY7iA0SSiq/q+Aya
         +pM6W5ri9LyP41LVIyNxTgnpG4aXF3Vpl/45UhNqfOFmxGK3OEuecwik1/1O0EzsdDvf
         M5n6ho58N/8M3J5NfzJfHpduKH/m94axLTjvx3fcfhH/2RTjL4lRXIVqD8w/napcocmn
         4QZyQIcOLIewAepLEfVNPCX/HVkcrEVETBUckRQGI+1rmO3EUJO6bGu7jwt/kxkfMWkQ
         ag/sqaPWM+lK/CGjk9DSyCZRk38hByuPa4E+e7+gq0abN8d1XIBuGa4TlLjdrLngUEki
         lSig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3Oglwja209DBwLPu/64QCgl+GIyqfPWjKg2KrFs+Lww=;
        b=3uBQwtSazgx9wbFPMt2hrkc0MYlDKLGf/I0OzDKrB/51BaSJddELt0mevXdeh/BDia
         27y3otTJWIV7ck5XU5Lr80+OqdObZQn4MC6WgaLtvgnmrQcK8lRQ9DH88XU1ohXUewbc
         WV973zxAuL05jETIOniO0xJGiXVm+0Attr9sGet87KMp5MFoOa8dTkS40M0rASNWvSXZ
         DPU5MMrhF4zIrzG3F0a2z384NjJkeay1N8MgxAZa5kIvcI2XugSoYORQS8ZMs42WZ9S9
         IhS6P7pVSs0+xFfCGR00m4xaYgFAGbCVjXXvmv1hvf8fR7ykFyhEYlIqypLKUh4HWdIU
         xocA==
X-Gm-Message-State: AO0yUKWAMtDWV8C3O+vim4KY21johcG5T7i3PGFoAO8IR8cD9icZ57Sb
        N/V+y3hfFy9tfV3QinVoz1alQYVcBBbHllOk
X-Google-Smtp-Source: AK7set/gr68zvRQKZtGLX6QGf7rg9huTK9JRSM7zo+I2yHq2Sf6x249l67GJJI9o2sWZKH4ELvzd8Q==
X-Received: by 2002:a05:600c:d0:b0:3dd:1bd6:3839 with SMTP id u16-20020a05600c00d000b003dd1bd63839mr4322303wmm.24.1675192848293;
        Tue, 31 Jan 2023 11:20:48 -0800 (PST)
Received: from dave-Ubuntu2204.. (194.15.169.217.in-addr.arpa. [217.169.15.194])
        by smtp.googlemail.com with ESMTPSA id x9-20020a05600c21c900b003dc434b39c7sm3527512wmj.0.2023.01.31.11.20.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Jan 2023 11:20:47 -0800 (PST)
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
To:     Manivannan Sadhasivam <mani@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH 00/11] imx290: Minor fixes, support for alternate INCK, and more ctrls
Date:   Tue, 31 Jan 2023 19:20:05 +0000
Message-Id: <20230131192016.3476937-1-dave.stevenson@raspberrypi.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi All

This is a small patch set that fixes a number of issues, adds in support
for the alternate input clock frequency option, and expands the control support
for flips and VBLANK/HBLANK.

My source tree has the 2 patches I've just sent for mono support first, but I
believe the two series should apply in either order.

  Dave

Dave Stevenson (11):
  media: i2c: imx290: Match kernel coding style on whitespace
  media: i2c: imx290: Set the colorspace fields in the format
  media: i2c: imx290: Add V4L2_SUBDEV_FL_HAS_EVENTS and subscribe hooks
  media: i2c: imx290: Fix the pixel rate at 148.5Mpix/s
  media: i2c: imx290: Support 60fps in 2 lane operation
  media: i2c: imx290: Use CSI timings as per datasheet
  media: i2c: imx290: Convert V4L2_CID_HBLANK to read/write
  media: i2c: imx290: Convert V4L2_CID_VBLANK to read/write
  media: i2c: imx290: Remove duplicated write to IMX290_CTRL_07
  media: i2c: imx290: Add support for 74.25MHz external clock
  media: i2c: imx290: Add support for H & V Flips

 drivers/media/i2c/imx290.c | 429 ++++++++++++++++++++++++++++---------
 1 file changed, 333 insertions(+), 96 deletions(-)

-- 
2.34.1

