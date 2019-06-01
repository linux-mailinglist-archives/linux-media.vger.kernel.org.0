Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8268A31FC8
	for <lists+linux-media@lfdr.de>; Sat,  1 Jun 2019 17:27:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726531AbfFAP1i (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 1 Jun 2019 11:27:38 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:46909 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726149AbfFAP1h (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 1 Jun 2019 11:27:37 -0400
Received: by mail-pl1-f194.google.com with SMTP id e5so3478019pls.13;
        Sat, 01 Jun 2019 08:27:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=XIj7YOEub6/JCzsqfFJlT7eLLCGSmwe1HtOY1YjxnSQ=;
        b=QqK/60vo/jfvKUYQNFShV+4TE7taLKRU0t6RaGWKMP1yhJMs21nKP6NbTmhuyfsCdq
         aV/9r/z7lNh3/NAFfO5wB3r0sz1zV+GZNmeUVX7fuzIR+rVVStmqwhJbXg4wf3Q/5Acc
         tzPf4GhY3TjwiFiphKe+xrLSON7e/QG7VOrLcgS1q5HkKwuaqEnXnxhsTcA9niUFTvlt
         ttaPmJL5J8kQf+L1SStF/oVJ52JCAybqRUVJGUDs6+raj8YDudTUicLYe/6n/EF99w4T
         Fgq9ZGFTHYp19gx8gv5Irps3bw25UTaQ9M6qT0HGWKc4MlnpY3ciBlSgeLPT7d2P098K
         L68g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=XIj7YOEub6/JCzsqfFJlT7eLLCGSmwe1HtOY1YjxnSQ=;
        b=qouREPbrt+AvQEA5+/okPdliCZXqTztqNf9UmW/hbD1vT9u2RuQgVSdpLVRzynMXkG
         b57lEQWCfY5YuVOkOv04P+kLszv3kAY5Z7lE7/5upQuH/pxXZ2nGY8RCvMr82b0/g7L8
         xvqasHjduGrcwdePpmW6SXrdu0VsHg78/A7Uu0m7fOc/yeIGcCvmwUrPeSgTu5sU+CPO
         5goS1ybynwkxnJGUAWPAPh8LBooIwQxS64GMXsmH1f4mJhmmGyLssWGuJcbIGdmV6lLb
         c6YUcf90wtZ2zZppgNn0EGeb9IKQk8vCuPKGHn3+KOCXDuKfPOEf7D+LIhXLdAH+7kU1
         F8ug==
X-Gm-Message-State: APjAAAWU8D9v7RciOfQmYuI1lc1fq/cZEBGIdhnXHv44DYNRaZBzfjYE
        7PtqcNJoPSIG5qgaEFpxYVU=
X-Google-Smtp-Source: APXvYqwkq5LWhccgJndQpLkagphyyBfTQ93qwaTbUW8HtO/ujVRSt7L4XOPHl57FC2oeddhetk1w6A==
X-Received: by 2002:a17:902:9006:: with SMTP id a6mr12808271plp.305.1559402857033;
        Sat, 01 Jun 2019 08:27:37 -0700 (PDT)
Received: from t-1000 (c-98-210-58-162.hsd1.ca.comcast.net. [98.210.58.162])
        by smtp.gmail.com with ESMTPSA id y12sm7521851pgi.10.2019.06.01.08.27.36
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 01 Jun 2019 08:27:36 -0700 (PDT)
Date:   Sat, 1 Jun 2019 08:27:34 -0700
From:   Shobhit Kukreti <shobhitkukreti@gmail.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Shunqian Zheng <zhengsq@rock-chips.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     shobhitkukreti@gmail.com
Subject: [PATCH] media: i2c: Fix Unnecessary Semicolon Warning Reported by
 coccicheck
Message-ID: <20190601152731.GA15956@t-1000>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

	Removed the warning from the following files:

	drivers/media/i2c/ov13858.c
	drivers/media/i2c/ov2685.c
	drivers/media/i2c/ov5695.c

Signed-off-by: Shobhit Kukreti <shobhitkukreti@gmail.com>
---
 drivers/media/i2c/ov13858.c | 4 ++--
 drivers/media/i2c/ov2685.c  | 2 +-
 drivers/media/i2c/ov5695.c  | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/i2c/ov13858.c b/drivers/media/i2c/ov13858.c
index 45bb872..aac6f77 100644
--- a/drivers/media/i2c/ov13858.c
+++ b/drivers/media/i2c/ov13858.c
@@ -1224,7 +1224,7 @@ static int ov13858_set_ctrl(struct v4l2_ctrl *ctrl)
 					 ov13858->exposure->minimum,
 					 max, ov13858->exposure->step, max);
 		break;
-	};
+	}
 
 	/*
 	 * Applying V4L2 control value only happens
@@ -1262,7 +1262,7 @@ static int ov13858_set_ctrl(struct v4l2_ctrl *ctrl)
 			 "ctrl(id:0x%x,val:0x%x) is not handled\n",
 			 ctrl->id, ctrl->val);
 		break;
-	};
+	}
 
 	pm_runtime_put(&client->dev);
 
diff --git a/drivers/media/i2c/ov2685.c b/drivers/media/i2c/ov2685.c
index 98a1f2e3..6814583 100644
--- a/drivers/media/i2c/ov2685.c
+++ b/drivers/media/i2c/ov2685.c
@@ -576,7 +576,7 @@ static int ov2685_set_ctrl(struct v4l2_ctrl *ctrl)
 			 __func__, ctrl->id, ctrl->val);
 		ret = -EINVAL;
 		break;
-	};
+	}
 
 	pm_runtime_put(&client->dev);
 
diff --git a/drivers/media/i2c/ov5695.c b/drivers/media/i2c/ov5695.c
index 5d107c5..e65a943 100644
--- a/drivers/media/i2c/ov5695.c
+++ b/drivers/media/i2c/ov5695.c
@@ -1143,7 +1143,7 @@ static int ov5695_set_ctrl(struct v4l2_ctrl *ctrl)
 		dev_warn(&client->dev, "%s Unhandled id:0x%x, val:0x%x\n",
 			 __func__, ctrl->id, ctrl->val);
 		break;
-	};
+	}
 
 	pm_runtime_put(&client->dev);
 
-- 
2.7.4

