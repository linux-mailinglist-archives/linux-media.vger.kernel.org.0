Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 330AD370365
	for <lists+linux-media@lfdr.de>; Sat,  1 May 2021 00:18:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229997AbhD3WT2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 30 Apr 2021 18:19:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231992AbhD3WTO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 30 Apr 2021 18:19:14 -0400
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ECAFFC06174A;
        Fri, 30 Apr 2021 15:18:24 -0700 (PDT)
Received: by mail-pl1-x633.google.com with SMTP id p17so11450177plf.12;
        Fri, 30 Apr 2021 15:18:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=GreS4fBgl6pEV5ybguXpWoNeQVZDsUS8OAXOHJk+8wM=;
        b=pPYasJfQPDLh9FrOMp0mptyMvy4gjMQJa0NBf57qfvjppSfIGNvQI3ykjfqEhfS8kj
         UztaSTIEExHo3ovN02obtP/xOfpiPqJyY7agRcYr4z0I+G5qKOJOJ5Sqw3jv9U3Z0n0r
         CGsiZUO1OmHNBdDz2rRY0nIlcZ+U055wHVc/Ws0QwkbFa3joDsj3rYJcawo2tPekzOs7
         it1YtjeBe8+2QKz75hvbTkennxGSFkLYnb5fYWEPnGDfEzdC1W6GF7eZMcsO2JqQ2PaW
         MXrCQeU/oP73pqk3Z4UIIlYzLgpdEEwx8C0Ox93QbEvOnEzW56ROST9ln+aaQnwwP1M+
         Zw5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=GreS4fBgl6pEV5ybguXpWoNeQVZDsUS8OAXOHJk+8wM=;
        b=pF6/ps4ABO1Gr1ngLylLatMm/Ce0f+k8Y7+V+nEUdoqOsosf5YWFu0qzB6DJDTcRMA
         wR5J8kB/Tub0fNxP2/TdKIlH1WaoE810Q/IV3vdqWJtDt+xHkwTFHRNbJOCWfLdqjXlX
         8ktFevxDHxFPAzGCmsbiZvyeA+Gqk0lpoAT8xohI0Lvo2sXbu7enZlxDqplQfWFWy5XQ
         ipnPAkmPqDSwiVftmjZgTgUGTRC+KGypPtehQgAMug/LP7I2K/OYd4PMWWbU8l9db40m
         fRvj8YY70QHZJlW56wKH07bG5jmEL1sd8pUsXEL9FshB4lSahYE730QUenJUzyrqp9un
         gERw==
X-Gm-Message-State: AOAM530WMcJSSzM/YH7BTjvdJ/y5uQ3mKw+lzUkXyPvLaU3Wicy3Qqta
        3BujLoDBoMrzXyFjK1PnZq0=
X-Google-Smtp-Source: ABdhPJxaDiH9szIVfnkcaUq0V1qiXIgYt0WLhR4vZ+vpkdpMLhQTURmvpGsZa/fSLVhrv3pmVEic0Q==
X-Received: by 2002:a17:902:7603:b029:ec:f560:7d66 with SMTP id k3-20020a1709027603b02900ecf5607d66mr7503330pll.39.1619821104487;
        Fri, 30 Apr 2021 15:18:24 -0700 (PDT)
Received: from fedora ([103.125.235.29])
        by smtp.gmail.com with ESMTPSA id e5sm2926887pjv.22.2021.04.30.15.18.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Apr 2021 15:18:24 -0700 (PDT)
Date:   Fri, 30 Apr 2021 18:18:14 -0400
From:   Nigel Christian <nigel.l.christian@gmail.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] media: uvcvideo: Remove unused variable
Message-ID: <YIyCJoEwdqgqkxYN@fedora>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The variable buflen is being assigned a value that is never read,
which can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Nigel Christian <nigel.l.christian@gmail.com>
---
 drivers/media/usb/uvc/uvc_driver.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index 9a791d8ef200..370b086c6e22 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -768,7 +768,6 @@ static int uvc_parse_format(struct uvc_device *dev,
 		format->xfer_func = uvc_xfer_func(buffer[4]);
 		format->ycbcr_enc = uvc_ycbcr_enc(buffer[5]);
 
-		buflen -= buffer[0];
 		buffer += buffer[0];
 	}
 
-- 
2.31.1

