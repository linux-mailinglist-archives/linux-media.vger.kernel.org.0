Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1FCE2364A55
	for <lists+linux-media@lfdr.de>; Mon, 19 Apr 2021 21:16:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241459AbhDSTRQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 19 Apr 2021 15:17:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241313AbhDSTRP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 19 Apr 2021 15:17:15 -0400
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0007C06174A;
        Mon, 19 Apr 2021 12:16:45 -0700 (PDT)
Received: by mail-pj1-x1032.google.com with SMTP id nk8so5341645pjb.3;
        Mon, 19 Apr 2021 12:16:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=0WK8M0c904A+vC9fiAqfVaCp4aJcCTHCS/P40/Etu8g=;
        b=pJjBX/ZKn2oFj5S/D7unyBaOimlqx3++WSKnGiNkDS42f90dJWWpiN8LGKIcqVIbrr
         V+er0hwoPmFvwNdZPuIR8QjlwK1FjUS7ce34HtpjSYQmgdRddJnavfXve9ePJCQQyVCS
         qZX5wdcaVFrBzl052K32foSw56SJoYfg3am7SlklOkIKY9WWsjokTIF2zEH2WOwhMEb5
         skzBBR2Qbl3NVPmQ67qjlQaDSYP+9Q0B4zo52dL3eeI3qHsDPSp/7t3vToBY/VQn52Bd
         EfUDcF/SDPEU/5FX3o4qB+0hFKHnSW/8CSqqwuRcqCxdOUMT8sk+3MSkp8ij6DD58PHA
         1HRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=0WK8M0c904A+vC9fiAqfVaCp4aJcCTHCS/P40/Etu8g=;
        b=AFSRWIUPqna1+qRRMLajmgEbYnvpaXG9kYBe3V7MDUe/OGn/tc0UgnSoW6JtADi4hm
         5Fc6PMUwn472Hs1KBudypYElF334iATGd8jEkLdBjVxuURLrJirMgE9upXW/D+zmnSkr
         edehGlopjsknWxEEeIAryrDfKAyAP7b8Td/pY2fnxxTXVTo2MABlU19Dg9E4iNRCttPt
         CC49By/zh0f9Z2KUHDg83mAO3EA2evyxZ5IVc8CbdAeTwJvb6ipRoD28opx7jZWB+BiZ
         v3Y7MZANSZkZClujK2p5TM6Qp713sNftOUo/KzB9et1UKJ0l/SQkpTMxau5jf2j4EwsJ
         SHFg==
X-Gm-Message-State: AOAM531MGNlOXO++tCINUBQvLWM/JK/VV4OJN+F8Hevz7y64+qSl0GXr
        uYrWbAfc1OSEdsK3kQyA7d8=
X-Google-Smtp-Source: ABdhPJwfsaXul7oKNLaJXV7dO4RfRtUP23mpUHlOwgwJ/1RCFZSk0X8QLXmIDOQz2h0+bU8beBi5Fw==
X-Received: by 2002:a17:90a:ca83:: with SMTP id y3mr653074pjt.191.1618859805475;
        Mon, 19 Apr 2021 12:16:45 -0700 (PDT)
Received: from localhost ([103.241.225.98])
        by smtp.gmail.com with ESMTPSA id o16sm7196271pfp.215.2021.04.19.12.16.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Apr 2021 12:16:45 -0700 (PDT)
From:   Deepak R Varma <mh12gx2825@gmail.com>
X-Google-Original-From: Deepak R Varma <drv@mailo.com>
Date:   Tue, 20 Apr 2021 00:46:40 +0530
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org
Cc:     mh12gx2825@gmail.com
Subject: [PATCH 6/6] staging: media: atomisp: use printk with KERN facility
 level
Message-ID: <4947abeebc2cecca43137675519a2fb48577d3e5.1618859059.git.drv@mailo.com>
References: <cover.1618859059.git.drv@mailo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1618859059.git.drv@mailo.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

printk() without KERN_<LEVEL> facility is flagged by checkpatch as a
warning. It is better to use pr_info() which comes with an
inbuilt KERN_INFO level.

Signed-off-by: Deepak R Varma <drv@mailo.com>
---
 drivers/staging/media/atomisp/i2c/atomisp-gc0310.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c b/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
index b572551f1a0d..a0f3c5c32f94 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
@@ -1020,7 +1020,7 @@ static int gc0310_set_fmt(struct v4l2_subdev *sd,
 		return -EINVAL;
 	}
 
-	printk("%s: before gc0310_write_reg_array %s\n", __func__,
+	pr_info("%s: before gc0310_write_reg_array %s\n", __func__,
 	       gc0310_res[dev->fmt_idx].desc);
 	ret = startup(sd);
 	if (ret) {
-- 
2.25.1

