Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D3AE0E777C
	for <lists+linux-media@lfdr.de>; Mon, 28 Oct 2019 18:18:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404127AbfJ1RSx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 28 Oct 2019 13:18:53 -0400
Received: from mail-il1-f193.google.com ([209.85.166.193]:37313 "EHLO
        mail-il1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730665AbfJ1RSw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 28 Oct 2019 13:18:52 -0400
Received: by mail-il1-f193.google.com with SMTP id v2so8860014ilq.4;
        Mon, 28 Oct 2019 10:18:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=iuTrpxKUHZ/UCdTRpuBAw/Jl1hvuK8hDPzJ43oHoufo=;
        b=ZeldSHPeFLJ+46uOkfBauBzB4QUPRBL6FT/1IHG3H5HgV/S9oZEeCr/eYmlUMX7RQq
         IFbtyzQhlAjxV3MeEOPtjCY8Mgkf7ZOjnufKao/zkc8ODIrNdmsBxMrvOsEYgxp8plBY
         Zp0UGhtXV58wk7kTz2557fjBR2/HNO+4dc9QPt39aIk70v8soaE+VJulKOGSGN5DPj5r
         yGXE/TiVoohKDdetpgR3vFS8PLMbiOrvdEIKTalwP+ZB5NtQPEv+qqHl0Ae8gfMoYpWR
         pHfnd+NmAMEOqTOFdBKEqVr5NztbiyfO2NZAiotAE7M9JiDm1PeEbPhivg9/gcDxn0h2
         vkDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=iuTrpxKUHZ/UCdTRpuBAw/Jl1hvuK8hDPzJ43oHoufo=;
        b=eAMKlkC3vM0vMeNdu14Y6PzrciKxSvgTGLTKrHmMKHDaMEgnZNhu6K+ATH6c9oRbaf
         d6IhAsGT6vYhxJdZP150JnlrwaM7wLLn7fxHAlU6oW4mzM8mS9hHCAYm8oB80pAlBHV3
         tXfbZL3Ikz8TnshpaaQu1qsXqgwurXtYlY+l/XMYJ6CWT4rpDFERU85/iMSjO8CFrx46
         3ZwR/aRufDik3qIZ3xs57GFB2GPQEhFJWANd9xa6LifPqL2ZIlU5tA1geDkOyeTaTwau
         pjDYcdPPCWhz30/gRoUIQWqvOj2hvSYx3H5VKfm5I+njmrl9YAbcCgijdjF+xLN0zdFC
         t2QQ==
X-Gm-Message-State: APjAAAXS2kuqqLkjQRH8SV+m8B5DNHEUyy1XGUmT0OlQ836fvkpC4mhx
        1qXHSs0OxmayCOqWtVuI0alpaeofhgY=
X-Google-Smtp-Source: APXvYqzQieKGGUdlk8auRT6Jo9SvrelCUC+fWWRQTTE6KT3RIsMBxP0GS64VURM0hUE8IXpPF2ghQg==
X-Received: by 2002:a92:ce4a:: with SMTP id a10mr22136925ilr.48.1572283131374;
        Mon, 28 Oct 2019 10:18:51 -0700 (PDT)
Received: from cs-dulles.cs.umn.edu (cs-dulles.cs.umn.edu. [128.101.35.54])
        by smtp.googlemail.com with ESMTPSA id f8sm1637563ilg.58.2019.10.28.10.18.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2019 10:18:50 -0700 (PDT)
From:   Navid Emamdoost <navid.emamdoost@gmail.com>
To:     jae.hyun.yoo@linux.intel.com
Cc:     emamd001@umn.edu, smccaman@umn.edu, kjlu@umn.edu,
        Navid Emamdoost <navid.emamdoost@gmail.com>,
        Eddie James <eajames@linux.ibm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>, linux-media@vger.kernel.org,
        openbmc@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3] media: aspeed-video: Fix memory leaks in aspeed_video_probe
Date:   Mon, 28 Oct 2019 12:18:37 -0500
Message-Id: <20191028171838.28533-1-navid.emamdoost@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <da959329-aa40-b6e7-dcc9-48183a8da716@linux.intel.com>
References: <da959329-aa40-b6e7-dcc9-48183a8da716@linux.intel.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

In the implementation of aspeed_video_probe() the allocated memory for
video should be released if either devm_ioremap_resource()
or aspeed_video_init() or aspeed_video_setup_video() fails. Replace
kzalloc() with devm_kzalloc to avoid explicit release for video.

Fixes: d2b4387f3bdf ("media: platform: Add Aspeed Video Engine driver")
Signed-off-by: Navid Emamdoost <navid.emamdoost@gmail.com>
---
Changes in v3:
	-- fix call to devm_kzalloc()
---
 drivers/media/platform/aspeed-video.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/aspeed-video.c b/drivers/media/platform/aspeed-video.c
index eb12f3793062..70797b41447c 100644
--- a/drivers/media/platform/aspeed-video.c
+++ b/drivers/media/platform/aspeed-video.c
@@ -1646,7 +1646,8 @@ static int aspeed_video_probe(struct platform_device *pdev)
 {
 	int rc;
 	struct resource *res;
-	struct aspeed_video *video = kzalloc(sizeof(*video), GFP_KERNEL);
+	struct aspeed_video *video =
+		devm_kzalloc(&pdev->dev, sizeof(*video), GFP_KERNEL);
 
 	if (!video)
 		return -ENOMEM;
-- 
2.17.1

