Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4D2932AC30
	for <lists+linux-media@lfdr.de>; Sun, 26 May 2019 22:48:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726202AbfEZUsa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 26 May 2019 16:48:30 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:41151 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726106AbfEZUsS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 26 May 2019 16:48:18 -0400
Received: by mail-lj1-f196.google.com with SMTP id q16so4530021ljj.8;
        Sun, 26 May 2019 13:48:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yxy8jhb7vj4f583mX+9bjwUeoCyJQOsv4k9GjkXUQ2g=;
        b=h6tdj+sL53sdFiNAj75lH6fUo0CsOzTPQ7xv1AERtT/h1WVe35E4pq/nB90f9V/C+v
         WHORIAj3z4FRPd24Z2dwdelOP5Yf05LMyqDj5HGxWqNXp50gGmyFnAXVZFCg7uhOEM8J
         7dJRsJ4htsB3CDvLc6j+GbjBe88DML8fUMdpFzYpFTYNg5icFqxfRJEi8aimcrUc7QiY
         MQZbDjfUfvC60XnIwlMoqYInsEZn9P+iDMKfGQIDMFRNo6j4GPfKD17sSprcD/Oxa491
         lCvEVEhZKZGNePdbgFhtpolAfYzL0IrfCzqCsc55FUUXf2yk4D5sNMD4Ym6JHg/jpQNn
         p5qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yxy8jhb7vj4f583mX+9bjwUeoCyJQOsv4k9GjkXUQ2g=;
        b=Yc9F4mB1xhp8voF8CxhXMe6AJU2HWZMh/DxFdNV+sCyhtSg1X8MSLJ9Irq88h3inX0
         yU3DgiuvfqSGuXh5iLmniKa187Xrd2CaTJzcK1aq4Vd/FtegDEhJSv+dAt++k8eFijV7
         Ty7w38st/ciwOMytF0wWaantMaCpe62P/a61HT2siZYS2CRc+lDkF+yn72SDTxPTG609
         TuuMsIwyH5rY3TmwOSa+36Edqm5GQHz40K/n7tbQ7ReEP8mnypbd59zCdvin/0Vh56V5
         z8YbSozILYalMrXnnM7awCfQSdk22+UU21EC+x+8cSJR0ajrRhCOcAyl+sQAi14WnAm2
         e8Og==
X-Gm-Message-State: APjAAAWlQ7NPrRRh9h1/vjz555DzD0+u1a5l62Wd3BR3AotqgVLSgcJ5
        zLLwGN1xA7DUdbx/PVUvesM=
X-Google-Smtp-Source: APXvYqxdqLj3Qk75k2XIFwOaySBHWie+VHdFb+eGV2zH1WXrGaxvKJfUF+5xAiND0OBA1r98FCNhEQ==
X-Received: by 2002:a2e:900e:: with SMTP id h14mr39180739ljg.77.1558903696049;
        Sun, 26 May 2019 13:48:16 -0700 (PDT)
Received: from z50.gdansk-morena.vectranet.pl (109241207190.gdansk.vectranet.pl. [109.241.207.190])
        by smtp.gmail.com with ESMTPSA id i187sm1859475lfe.64.2019.05.26.13.48.14
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 26 May 2019 13:48:15 -0700 (PDT)
From:   Janusz Krzysztofik <jmkrzyszt@gmail.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>
Subject: [RFC PATCH 4/5] media: ov6650: Fix frame scaling not reset on crop
Date:   Sun, 26 May 2019 22:47:57 +0200
Message-Id: <20190526204758.1904-5-jmkrzyszt@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190526204758.1904-1-jmkrzyszt@gmail.com>
References: <20190526204758.1904-1-jmkrzyszt@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

According to V4L2 subdevice interface specification, frame scaling
factors should be reset to default values on modification of input frame
format.  Assuming that requirement also applies in case of crop
rectangle modification unless V4L2_SEL_FLAG_KEEP_CONFIG is requested,
the driver now does not respect it.

The KEEP_CONFIG case is already implemented, fix the other path.

Signed-off-by: Janusz Krzysztofik <jmkrzyszt@gmail.com>
---
 drivers/media/i2c/ov6650.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/media/i2c/ov6650.c b/drivers/media/i2c/ov6650.c
index 47590cd51190..cc70d8952999 100644
--- a/drivers/media/i2c/ov6650.c
+++ b/drivers/media/i2c/ov6650.c
@@ -472,6 +472,8 @@ static int ov6650_get_selection(struct v4l2_subdev *sd,
 	}
 }
 
+static int ov6650_s_fmt(struct v4l2_subdev *sd, u32 code, bool half_scale);
+
 static int ov6650_set_selection(struct v4l2_subdev *sd,
 		struct v4l2_subdev_pad_config *cfg,
 		struct v4l2_subdev_selection *sel)
@@ -515,7 +517,13 @@ static int ov6650_set_selection(struct v4l2_subdev *sd,
 	}
 	if (!ret)
 		priv->rect.height = sel->r.height;
+	else
+		return ret;
 
+	if (priv->half_scale) {
+		/* turn off half scaling, preserve media bus format */
+		ret = ov6650_s_fmt(sd, priv->code, false);
+	}
 	return ret;
 }
 
-- 
2.21.0

