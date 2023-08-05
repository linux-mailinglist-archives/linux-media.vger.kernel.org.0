Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 90602770E33
	for <lists+linux-media@lfdr.de>; Sat,  5 Aug 2023 08:53:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229685AbjHEGxl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 5 Aug 2023 02:53:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229570AbjHEGxj (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 5 Aug 2023 02:53:39 -0400
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C1D3E70
        for <linux-media@vger.kernel.org>; Fri,  4 Aug 2023 23:53:38 -0700 (PDT)
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-317dcdae365so131296f8f.1
        for <linux-media@vger.kernel.org>; Fri, 04 Aug 2023 23:53:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691218417; x=1691823217;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ch+LYFfCHiYUj/1ZiC56FaiBDJ/SRdM9J5pvgGpfX2c=;
        b=VXTTokOB4KxAUdHpMUn2YlateQftqj27ZsjzrtDk2T16y9cmXaHyN7UsPKCR+anBnf
         G7Bnv0YIMGdGC0jjpz3/3wL7CyG18t6qiKj3bw+N7QOOHJFNAfWJEoZzLZDmnWglpWRw
         8infLY+bZmQJLrrybf6yUtQ+JKppZ0CIxdarUl2oR6nmGLsJAF1GeXphx5qHJa3PmwLL
         n61besyQ7QULbTvsY+Rdg9Z2U2G6MHIbypafpnyxU8VK6JlPbC+kZhiifEBFEDuJluEs
         dacec1W4wEp1iAWaFiaHU8mlD8ci1k0F5ppELUZ3vr2pzXtauaQCMi6jJqH/ji7KLACg
         8HNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691218417; x=1691823217;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ch+LYFfCHiYUj/1ZiC56FaiBDJ/SRdM9J5pvgGpfX2c=;
        b=l7zgo9lMjihGf/4WAJQRdUVQPUiNgT9zL+gZYDhqFbrLLCxkP+JVcG6ZOGCiUM70tA
         xfGMq1/ECxvsg9vL2Pcg7soRpv8hTvQ21QHQUjw27doyW04O7HG20TSfiNU1E2tA7ZV1
         0lKvkFeRbnZ9fHSq9eU/o2b0hCw4UB9O9TfuLyfJPl+NxSFpLE5gg/FPLt/FtHDWAK9h
         uIhJr9vSXzUUNEO+0zs5piwAkAqfq8iC45RyirMSLuu8GWH0OvIK/lbccnd3p6eKujf9
         G6okOMvrCE1ZxsB73eIS0MmMVEooYpqcD2Sy1cD69V0qg9ixaPvU10JeZdi9gCqTTYDi
         uzRA==
X-Gm-Message-State: AOJu0Yz/qpz0d+WRK3OGyE0FlYknOqNX8DR0CUIDUFjxAfhbZek8khKf
        20qiR4ayh0qEa9KA0tUFB2Lt1g==
X-Google-Smtp-Source: AGHT+IF+9RXWcwNkyjwN686javCYpMC7EW6x2zR6vdp/vwRab72ojLtpmuNDVltocAtktvnB3qpYnw==
X-Received: by 2002:adf:dd4a:0:b0:317:60f2:c08b with SMTP id u10-20020adfdd4a000000b0031760f2c08bmr2651966wrm.31.1691218416697;
        Fri, 04 Aug 2023 23:53:36 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id h6-20020a5d6e06000000b0031435731dfasm4345492wrz.35.2023.08.04.23.53.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Aug 2023 23:53:36 -0700 (PDT)
Date:   Sat, 5 Aug 2023 09:53:32 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        kernel-janitors@vger.kernel.org
Subject: [PATCH] media: atomisp: csi2-bridge: check for negative port values
Message-ID: <8bc2ab0f-88ac-42f1-876b-147da525b1eb@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The atomisp_csi2_get_port() function reads an integer value from the
firmware.  We check for invalid positive values but we should also
check for negatives.

Fixes: 8d28ec7e9145 ("media: atomisp: Add support for v4l2-async sensor registration")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c b/drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c
index 46d9f31986c9..0f0ec5d7e49d 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c
@@ -626,7 +626,7 @@ static int atomisp_csi2_connect_sensor(const struct atomisp_csi2_sensor_config *
 			goto err_put_adev;
 
 		sensor->port = atomisp_csi2_get_port(adev, clock_num);
-		if (sensor->port >= ATOMISP_CAMERA_NR_PORTS) {
+		if (sensor->port < 0 || sensor->port >= ATOMISP_CAMERA_NR_PORTS) {
 			acpi_handle_err(adev->handle, "Invalid port: %d\n", sensor->port);
 			ret = -EINVAL;
 			goto err_put_adev;
-- 
2.39.2

