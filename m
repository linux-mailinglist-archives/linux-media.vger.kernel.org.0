Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6A984B5859
	for <lists+linux-media@lfdr.de>; Wed, 18 Sep 2019 01:02:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728297AbfIQXCz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 17 Sep 2019 19:02:55 -0400
Received: from mail-io1-f66.google.com ([209.85.166.66]:38556 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728168AbfIQXCz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 17 Sep 2019 19:02:55 -0400
Received: by mail-io1-f66.google.com with SMTP id k5so11669370iol.5;
        Tue, 17 Sep 2019 16:02:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=l3/R7eWJiNDCkUoIkkfFHiAvynxvR2Al0jggoujYqP8=;
        b=UqTPJVkMyjUH+pxJRXVO4wQN3AsWoP4RfA9zTsQF/p9MDmC59Ufcd6O1gCAb7ct6x2
         0iX+KOvDChxG8vRXizGwP4BTgUKsjkdecSKyKDhujWoqJNzcXxiAc5NR3gHNexqLHhbZ
         0i/3125w+y8RUTgDRGggPgVYaRzs/d4wjTcRAqwPxZy0kr/DTMGkQQnHS6O2Iu4IcdKy
         QpNcr1SaNAPTJWTdv9Or6Nl/3IxFFWAPbQfVqytEOLuKYoXW0GpROAs2OW52IkPCU2wd
         RBEhftc9hf4hfNmTuzBDaa+I6o+S3aVHyj37402st2JOEdJ6TkG3InAwc7nJ0PjbMF6i
         pRkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=l3/R7eWJiNDCkUoIkkfFHiAvynxvR2Al0jggoujYqP8=;
        b=GrQK0SH0ciIYTvE9ipPuY7CSXELP0jUQLiRBoFH2isALUrsBxVzVuS5d2emRfQUY0k
         /U9WWdQgLr079OjPcSktPlIyTC8EZ7/R1J5FrQcRx2MwNacK3zGwnHxHEv5e/hq7mGJi
         PJGvpVFjbcCoK5JHXjt/OVQJs8YTVVpX8FhnpPk0JVPZZfnAeHB3x5GoOHuR3yyxhokg
         mn0cUHUS0OoyylEP7YR05W2vLMlFZu6WrYOOnrh//aQ6DJFJ8yN8du1FmTSUhACngpYW
         Wi+tI1jsZY0kWLnWDRwfIbvmkFiyk+91uLnvWk2etpN/irA5JG9bHyUaVMlMBOtPHY9e
         aX1A==
X-Gm-Message-State: APjAAAXgskF6HIg0fRTEzFqLhXWqgMh92E9VhjrN1g5DKBOMauq/NYrP
        9eTJ8hS3uzifdqoVnEFEJMI=
X-Google-Smtp-Source: APXvYqw+tu8JRqDVUBuD3e5WVpPKtugEIg2I+YqmmazkQMiBywQzLuGL8TvkfzYSxxfEYa2ncgGECw==
X-Received: by 2002:a6b:3c0a:: with SMTP id k10mr1688594iob.282.1568761374099;
        Tue, 17 Sep 2019 16:02:54 -0700 (PDT)
Received: from cs-dulles.cs.umn.edu (cs-dulles.cs.umn.edu. [128.101.35.54])
        by smtp.googlemail.com with ESMTPSA id l19sm2570684iok.14.2019.09.17.16.02.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Sep 2019 16:02:53 -0700 (PDT)
From:   Navid Emamdoost <navid.emamdoost@gmail.com>
Cc:     emamd001@umn.edu, smccaman@umn.edu, kjlu@umn.edu,
        Navid Emamdoost <navid.emamdoost@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Irenge Jules Bashizi <jbi.octave@gmail.com>,
        Ioannis Valasakis <code@wizofe.uk>,
        Mamta Shukla <mamtashukla555@gmail.com>,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        Colin Ian King <colin.king@canonical.com>,
        Michelle Darcy <mdarcy137@gmail.com>,
        Madhumitha Prabakaran <madhumithabiw@gmail.com>,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] media: staging: davinci: fix for memory leak
Date:   Tue, 17 Sep 2019 18:02:38 -0500
Message-Id: <20190917230242.27630-1-navid.emamdoost@gmail.com>
X-Mailer: git-send-email 2.17.1
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

In ipipe_g_config the allocated memory for params needs to be released
if either module_if->get or copy_to_user fails.

Signed-off-by: Navid Emamdoost <navid.emamdoost@gmail.com>
---
 drivers/staging/media/davinci_vpfe/dm365_ipipe.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/davinci_vpfe/dm365_ipipe.c b/drivers/staging/media/davinci_vpfe/dm365_ipipe.c
index 52397ad0e3e2..3023691b53c0 100644
--- a/drivers/staging/media/davinci_vpfe/dm365_ipipe.c
+++ b/drivers/staging/media/davinci_vpfe/dm365_ipipe.c
@@ -1316,10 +1316,13 @@ static int ipipe_g_config(struct v4l2_subdev *sd, struct vpfe_ipipe_config *cfg)
 
 		if (to && from && size) {
 			rval = module_if->get(ipipe, from);
-			if (rval)
+			if (rval) {
+				kfree(params);
 				goto error;
+			}
 			if (copy_to_user((void __user *)to, from, size)) {
 				rval = -EFAULT;
+				kfree(params);
 				break;
 			}
 		}
-- 
2.17.1

