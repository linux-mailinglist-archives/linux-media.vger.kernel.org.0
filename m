Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E6D9361083
	for <lists+linux-media@lfdr.de>; Thu, 15 Apr 2021 18:54:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234318AbhDOQzD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Apr 2021 12:55:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234326AbhDOQzC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Apr 2021 12:55:02 -0400
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com [IPv6:2607:f8b0:4864:20::72c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE9FDC061756;
        Thu, 15 Apr 2021 09:54:37 -0700 (PDT)
Received: by mail-qk1-x72c.google.com with SMTP id o5so25935156qkb.0;
        Thu, 15 Apr 2021 09:54:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=sKPscdnN4p036oGIIGdcJly3t0X9xL0TlPcjGDANiX4=;
        b=kX+aT+xJYRNY3gF53LIK1HUQZ5f+r2tQ37dfCn9Nmm7Wsps7RHfZ/21lgEFLKEyXJ3
         cjI6FT2RSfxH4Y5nsPgDzHbDffzZMkgGqm8y+JUEpEOej7GXpT/gvj+QlsCY26fRurjV
         JZHCHxYO3oh4fZ3T08NbzCAcxb0K0/W4rZIdXe5696aj8gj1JLu0MDeRotPyvFMPrZZT
         WFBeZ4CIushvjcm6q0sNNqpu5ca3v/duaKWV966+i0oIdALHcPQOstbYQcAtMAkBYYqn
         c1PG43pMh3QPUSKuzTODwF6QzkOHdPtY3HC4uHa94LExzE08IzkjdaPaP5XSSVwqYlBz
         xLHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=sKPscdnN4p036oGIIGdcJly3t0X9xL0TlPcjGDANiX4=;
        b=b0k8a+6QTByHtDRBUvvw1x5+FyYdlcCZngr4aOJpRdTEftekqi8+cSRVQlfwcQqp8R
         Ww/B/e/2t4WCBUg6+rUnXC3nRcdDkurTzLeUCxxZCRQayrlPlHbd6sOUgjoustLqenYk
         CQ69YZsHzXCu1LtyrS+UhpBe01cI49lXC9FczKXHxE7NBQIM0gWel9KqMeUJ9PNuUDuW
         4kFksR4JJ/BnHT1BTQEkHM/YvpMWs7ee53LG94iJmHD9ptsPHAIaw0K7VrtLo3y8xr4E
         nsaVuP1QSPZ05MynHtKH89W7xXvDYg/ZyhgAkLk82oRW8VJJsgGY+gPV8Bl7jGLifITb
         Hr/g==
X-Gm-Message-State: AOAM5306BzCB9zj3dMnNxSGH6TWZHjDq2DG0wkwUHi9YUjrnvjSGZlS8
        fgWiwezqEWfXj3ejYtLwyPU=
X-Google-Smtp-Source: ABdhPJwswCLrM97/QTIaaO99478ipWzTiiBnhPB0l8ODUefpA7hDJcP3iTIBG0WNzrgNPN5xkKEMvQ==
X-Received: by 2002:a37:b103:: with SMTP id a3mr4561489qkf.261.1618505676976;
        Thu, 15 Apr 2021 09:54:36 -0700 (PDT)
Received: from focaruja ([138.204.24.234])
        by smtp.gmail.com with ESMTPSA id s12sm2085022qtn.69.2021.04.15.09.54.36
        (version=TLS1 cipher=ECDHE-ECDSA-AES128-SHA bits=128/128);
        Thu, 15 Apr 2021 09:54:36 -0700 (PDT)
Date:   Thu, 15 Apr 2021 13:54:34 -0300
From:   Aline Santana Cordeiro <alinesantanacordeiro@gmail.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com
Subject: [PATCH 3/4] staging: media: atomisp: pci: Balance braces around
 conditional statements in file atomisp_subdev.c
Message-ID: <b07b5e819c0b262ee0bc3c775de7bebb71b648fa.1618505476.git.alinesantanacordeiro@gmail.com>
References: <cover.1618505476.git.alinesantanacordeiro@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1618505476.git.alinesantanacordeiro@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Balance braces around conditional statements.
Issue detected by checkpatch.pl.
It happens in if-else statements where one of the commands
uses braces around a block of code and the other command
does not since it has just a single line of code.

Signed-off-by: Aline Santana Cordeiro <alinesantanacordeiro@gmail.com>
---
 drivers/staging/media/atomisp/pci/atomisp_subdev.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_subdev.c b/drivers/staging/media/atomisp/pci/atomisp_subdev.c
index 2ef5f44..aeabd07 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_subdev.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_subdev.c
@@ -472,9 +472,9 @@ int atomisp_subdev_set_selection(struct v4l2_subdev *sd,
 			 * when dvs is disabled.
 			 */
 			dvs_w = dvs_h = 12;
-		} else
+		} else {
 			dvs_w = dvs_h = 0;
-
+		}
 		atomisp_css_video_set_dis_envelope(isp_sd, dvs_w, dvs_h);
 		atomisp_css_input_set_effective_resolution(isp_sd, stream_id,
 			crop[pad]->width, crop[pad]->height);
-- 
2.7.4

