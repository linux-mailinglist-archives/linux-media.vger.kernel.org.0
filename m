Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B98A79866B
	for <lists+linux-media@lfdr.de>; Wed, 21 Aug 2019 23:16:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730822AbfHUVQR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 21 Aug 2019 17:16:17 -0400
Received: from mx2.ucr.edu ([138.23.62.3]:47390 "EHLO mx2.ucr.edu"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727629AbfHUVQR (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 21 Aug 2019 17:16:17 -0400
X-Greylist: delayed 426 seconds by postgrey-1.27 at vger.kernel.org; Wed, 21 Aug 2019 17:16:16 EDT
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=ucr.edu; i=@ucr.edu; q=dns/txt; s=selector3;
  t=1566422176; x=1597958176;
  h=from:to:cc:subject:date:message-id;
  bh=cBdSPmFTN1DOzz1EeXVkXTHdBWMI8uVVtsHBkBxazoQ=;
  b=B5BMyHrtOIFgQAbenN+daWQ1pGabzwT/1kOog89cyNQ5axJy759kqS48
   bRRlM4KCENlKkpMnTGwQdOn881lg0S282Hi1DCfI4cbtp2RI0S6BSDxr6
   0jHH++BhAWYSOOg8rekN7btnCIHjSCFsgU4lTq5rNBGNTixRAvUSbrqao
   gwvFk0vigh3rPb3x2IuZbYiqZavyqFkIb5IUK4u7tkXN80vdpOWEpK/++
   cpE0eZsFM6TLFWxn/jFPVpFrr7JwW8kZwEO1rmSq6B0I5h447XUCrh9uK
   KfOJuoyUeksZ62ltdcTxgZoq+qP2rjXForuTAL3RdeTStJDZ80o4YKdYO
   w==;
IronPort-SDR: 2h9ccD1T5iEdwdt9nQsSTSbbOyxJwBpsyJWpsGAXh07Xs1Z5cyMyp6+28y3d6Vih/7NKilIqJw
 VcbFYTWgYg1meiWTbzqSUKcFfK37NBc9bV7+vCN7wfMIZ18c8CDiVt7gvR5hYSWqUTB1JcX+FB
 9zS+BM/gTB6aN3mrYtkfDSBLImNbErqTYhVFlQ/KBpUhkqo5UuiOGXxCfcORyqPhUJ2bfzoXy4
 imJgOSdKGbQkTar60ivCFyS4QKlhOQSFK0rd8swsN26Ctl06U2DnLcbnFEawj2I6S6Mq1lHSMy
 PYQ=
IronPort-PHdr: =?us-ascii?q?9a23=3ASGmDHhxdLSG6qrjXCy+O+j09IxM/srCxBDY+r6?=
 =?us-ascii?q?Qd1OMTIJqq85mqBkHD//Il1AaPAdyBrasY0KGP7vGocFdDyK7JiGoFfp1IWk?=
 =?us-ascii?q?1NouQttCtkPvS4D1bmJuXhdS0wEZcKflZk+3amLRodQ56mNBXdrXKo8DEdBA?=
 =?us-ascii?q?j0OxZrKeTpAI7SiNm82/yv95HJbAhEmSSxbalvIBi5owjdudQajItmJ60s1h?=
 =?us-ascii?q?bHv3xEdvhMy2h1P1yThRH85smx/J5n7Stdvu8q+tBDX6vnYak2VKRUAzs6PW?=
 =?us-ascii?q?874s3rrgTDQhCU5nQASGUWkwFHDBbD4RrnQ5r+qCr6tu562CmHIc37SK0/VD?=
 =?us-ascii?q?q+46t3ThLjlTwKPCAl/m7JlsNwjbpboBO/qBx5347Ue5yeOP5ncq/AYd8WWW?=
 =?us-ascii?q?9NU8BUVyxAGYO8dIoPD+wOPe1FsYfzvkYFrRW/BQayAOPg1yJDinv40KEm1u?=
 =?us-ascii?q?gsFxzN0g49ENIUqHnarMv7OrocX+62y6fF1inPY+9M1Dvh8oXEbgwtrPeRVr?=
 =?us-ascii?q?xwa8rRzkwvGhvHgVWRqI3lPy6V1uMQuGWc7+thVOKvhHQmqw1tvjSiyNwhip?=
 =?us-ascii?q?TViYIP0FzL6zh2wJssKNC+VUV1YsakHYNOuy2GM4Z6WMAvTmFytCok17EKpY?=
 =?us-ascii?q?S3cDUOxZkj3xLTdv2KfoyS7h79WuucIS10iGxkdb6lhRu//k6twfDmWMauyl?=
 =?us-ascii?q?ZFtC9Fn8HJtnAKyhPc9NCKSuB4/ke9wTaP0B3T6v1cLUA0i6XbL5khz6Y1lp?=
 =?us-ascii?q?UJsETDGjb6mF34jKOLb0kk9PWk5uDjb7n8qZ+cMIh0ig76MqswgMCwHeM4Mg?=
 =?us-ascii?q?0WU2ia/+SzyqHj8FXnTLlWivA6iKrUvZDAKcgFu6K1HxVZ3psn5hu7Fzum1c?=
 =?us-ascii?q?4XnXgDLFJLYhKHiI3pNknOIfH5DfewmVWsnCt3y/3IJbDhH4nCLmLZnLj/YL?=
 =?us-ascii?q?l99lZQyBAvwtBH+5JUFrYBLer3Wk/wstzYExA4PxWxw+n5Fdp915kRVHmRAq?=
 =?us-ascii?q?+WLqzSq0WE5uExLOmWYo8apjL9J+Ii5/70gn9q0XEHeqz87JoFaG2/VqB3MU?=
 =?us-ascii?q?WQYCK02f8cGn1MswYjGr+5wGaeWCJeMi7hF5k34Ss2Xcf5VYo=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2FXGgDpsV1dgMfSVdFkHgEGBwaBZ4M?=
 =?us-ascii?q?FUkwQh2mFMoZTAQEBBoNAKIc1GHGFeIMIgWOFOwEIAQEBDAEBGxICAQGBBIM?=
 =?us-ascii?q?7gl8jOBMCBQEBBQECAQEGBAEBAhABAQkNCQgnhTAMgjopgUxfNQsWFVKBFQE?=
 =?us-ascii?q?FATUiOYJHAYF2FJ4UgQM8jCMzg3eEfwEIDIFJCQEIgSKHFYRZgRCBB4Nuc4J?=
 =?us-ascii?q?IhRuCRASBLgEBAZQ0lW8BBgIBggsUgW+EeY1FJ4MegQ6JFIsFAS2Dfp1Ng3E?=
 =?us-ascii?q?CCgcGDyGBRoF6TSWBbAqBRAmCcYYEiCkfM4EIjEIB?=
X-IPAS-Result: =?us-ascii?q?A2FXGgDpsV1dgMfSVdFkHgEGBwaBZ4MFUkwQh2mFMoZTA?=
 =?us-ascii?q?QEBBoNAKIc1GHGFeIMIgWOFOwEIAQEBDAEBGxICAQGBBIM7gl8jOBMCBQEBB?=
 =?us-ascii?q?QECAQEGBAEBAhABAQkNCQgnhTAMgjopgUxfNQsWFVKBFQEFATUiOYJHAYF2F?=
 =?us-ascii?q?J4UgQM8jCMzg3eEfwEIDIFJCQEIgSKHFYRZgRCBB4Nuc4JIhRuCRASBLgEBA?=
 =?us-ascii?q?ZQ0lW8BBgIBggsUgW+EeY1FJ4MegQ6JFIsFAS2Dfp1Ng3ECCgcGDyGBRoF6T?=
 =?us-ascii?q?SWBbAqBRAmCcYYEiCkfM4EIjEIB?=
X-IronPort-AV: E=Sophos;i="5.64,414,1559545200"; 
   d="scan'208";a="3386587"
Received: from mail-pf1-f199.google.com ([209.85.210.199])
  by smtp2.ucr.edu with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2019 14:09:09 -0700
Received: by mail-pf1-f199.google.com with SMTP id 191so2422573pfy.20
        for <linux-media@vger.kernel.org>; Wed, 21 Aug 2019 14:09:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=KPS5jpp4Ywj8sRwhNiLpJFreklEq0lOjofl+ZAU4qJQ=;
        b=geFgLfPuHa8YnonuzcRxB4+rpqtICko9clk5r3ivlRS+CmpoLJxTL8Ms6rYmU/y3xk
         yY64KUlqrLwxUYs4tBcDpVvhrS6aIzx7Lbd23ZQHiPBQVeLlWjM7TIIqzd7GzcvnAiv5
         HjdpjT+6bx5GTvfsX1qevLxDuvxSoafcCEEJ/JHUAZsLI+MvYvsWsuExhDQlk5ZrWc3/
         DEN/6qlkD1IBfVs4E1MMf+yjvFvhl7yMtWdtdYKeaf5CTLMi8visVGYgoDoy09MWHHg6
         ooT2GGW+oAqhsvQ3INZ6rRrMsdxwuTt5fgM7NkYPFKJ09JBUN9NGxqWObfCZH401S5pq
         PpzA==
X-Gm-Message-State: APjAAAUr2p65fXjhLC0NIv7b6YnwdKsJDjpvQht3wlnxdxazB5tss6Ge
        J5MFysBDGzA0VAnXv9MQed07uXQBnOH4DwM25CjDF4D8xwBvq8ox1wHrCq4a68FjsklWZYPfXiO
        SCi98WHeMGYqVchmnwsoOqwCV
X-Received: by 2002:a63:b555:: with SMTP id u21mr31205056pgo.222.1566421748840;
        Wed, 21 Aug 2019 14:09:08 -0700 (PDT)
X-Google-Smtp-Source: APXvYqypPungdy54NKD8FgZtyzscW8+eeQZFviA3kiXY7Ju80sT8SoAvChCE+gSfywI+XS44rMNfaQ==
X-Received: by 2002:a63:b555:: with SMTP id u21mr31205024pgo.222.1566421748376;
        Wed, 21 Aug 2019 14:09:08 -0700 (PDT)
Received: from Yizhuo.cs.ucr.edu (yizhuo.cs.ucr.edu. [169.235.26.74])
        by smtp.googlemail.com with ESMTPSA id m37sm4782555pjb.0.2019.08.21.14.09.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Aug 2019 14:09:07 -0700 (PDT)
From:   Yizhuo <yzhai003@ucr.edu>
Cc:     csong@cs.ucr.edu, zhiyunq@cs.ucr.edu, Yizhuo <yzhai003@ucr.edu>,
        Mike Isely <isely@pobox.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] [media] pvrusb2: qctrl.flag will be uninitlaized if cx2341x_ctrl_query() returns error code
Date:   Wed, 21 Aug 2019 14:09:31 -0700
Message-Id: <20190821210931.9621-1-yzhai003@ucr.edu>
X-Mailer: git-send-email 2.17.1
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Inside function ctrl_cx2341x_getv4lflags(), qctrl.flag
will be uninitlaized if cx2341x_ctrl_query() returns -EINVAL.
However, it will be used in the later if statement, which is
potentially unsafe.

Signed-off-by: Yizhuo <yzhai003@ucr.edu>
---
 drivers/media/usb/pvrusb2/pvrusb2-hdw.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/usb/pvrusb2/pvrusb2-hdw.c b/drivers/media/usb/pvrusb2/pvrusb2-hdw.c
index ad5b25b89699..1fa05971316a 100644
--- a/drivers/media/usb/pvrusb2/pvrusb2-hdw.c
+++ b/drivers/media/usb/pvrusb2/pvrusb2-hdw.c
@@ -793,6 +793,7 @@ static unsigned int ctrl_cx2341x_getv4lflags(struct pvr2_ctrl *cptr)
 	struct v4l2_queryctrl qctrl;
 	struct pvr2_ctl_info *info;
 	qctrl.id = cptr->info->v4l_id;
+	memset(&qctr, 0, sizeof(qctrl))
 	cx2341x_ctrl_query(&cptr->hdw->enc_ctl_state,&qctrl);
 	/* Strip out the const so we can adjust a function pointer.  It's
 	   OK to do this here because we know this is a dynamically created
-- 
2.17.1

