Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C320D7B788F
	for <lists+linux-media@lfdr.de>; Wed,  4 Oct 2023 09:20:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241499AbjJDHUL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 4 Oct 2023 03:20:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241498AbjJDHUK (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 4 Oct 2023 03:20:10 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3DD3EB7
        for <linux-media@vger.kernel.org>; Wed,  4 Oct 2023 00:20:07 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-9ad8a822508so325475966b.0
        for <linux-media@vger.kernel.org>; Wed, 04 Oct 2023 00:20:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=melexis.com; s=google; t=1696404006; x=1697008806; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kzcwo4ukmDfPKZy6rdPKwwlEPxVpUKsKZT5Uwd7WsXc=;
        b=M02FXBLh7ejXwXu/TsjlZzku+dalAqqtUj95FPBxHRJaSmRB0BgIwNik3ZGvnHACa4
         vHhJrYmQ0r8dVpi2oOs74UQJ8f/bN6+Yh/jMBEByV+vZxXZrc6R4kSJPUn/lMU/uJ4ME
         s0MQSiA7xwjGdTZcNyy7/XVkszfw64j+/ix8Lgp5AR5rfTBCPHZi3vzazZ3eCeOFSZBK
         +Ei0XisDCmxdjg71f/0ydPHnnBGeKWRdUrE/ZxdREKfkheolXWHOI2SeQMuNlBmwuFRP
         V6mLMWYXtBJQFoDvdzEuJqb6nwRodIPCh/Aeot7YJSKq4FVOK36RoqnZjrv6B+R2zvPq
         3lGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696404006; x=1697008806;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Kzcwo4ukmDfPKZy6rdPKwwlEPxVpUKsKZT5Uwd7WsXc=;
        b=Wb4KLbdYpyKRLPYr/4CVwL76FpvUwIvyUFyFnBs8AQLRTS9b8aB9Dd3124bTw+nkNQ
         mkC1AUBYt1Ikh9j1TlYUkP+6+Kgyn6PEfpy1MfBnI82TeLfrv7IVoajsJdAAX51wThX5
         ncz9MXWJW30uOj8psH3ixSrDf3J8Cw33xBN30MUZJzok4qlFBOcL60QKY23HbGFhIwAW
         HdM7TRjGk9TVW/d8cLvOP4DIQ/e3+hM8I8aGxkQwyFUDvtx2aetnYDxjnKTFWsROpgNz
         Zfn/nvQZ3a1jDNYrDhKkSimPEOO/29DmoOrIeG3cEssC2j/62wrb3dRELCrP91qY7ylV
         MY2g==
X-Gm-Message-State: AOJu0YwZbruvK6BffuTjf+BemY2shxw0G7Pf+v7niXwd7PygvjuLUPa4
        E6sQngwnEg//iv4tmrlpcKkMZzhgbeQs5zaGiNHHY8xNAXaEtWOSGJXCjJejLpgCJfCVCjhSlDY
        bACJZq+QIm6VBgqse2q4sEMj2PxhevudfLADBKiIeJJA8XU/01BAFL6mlrHZhajCpll9pRVsqWd
        6B8g==
X-Google-Smtp-Source: AGHT+IE5xYr03nXNv+eAduyOMopyqz38v9LQhcENIeSzCs8FoM7dZaX9YHayscV8PLuOl5v8tWk6mA==
X-Received: by 2002:a17:906:74db:b0:9b2:78bf:d8d4 with SMTP id z27-20020a17090674db00b009b278bfd8d4mr1362877ejl.5.1696404005642;
        Wed, 04 Oct 2023 00:20:05 -0700 (PDT)
Received: from melexis ([91.192.181.19])
        by smtp.gmail.com with ESMTPSA id h14-20020a170906590e00b0099cd008c1a4sm2296005ejq.136.2023.10.04.00.20.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Oct 2023 00:20:05 -0700 (PDT)
From:   Volodymyr Kharuk <vkh@melexis.com>
To:     <linux-media@vger.kernel.org>
Cc:     Andrii Kyselov <ays@melexis.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        devicetree@vger.kernel.org,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
        Volodymyr Kharuk <vkh@melexis.com>
Subject: [PATCH v5 4/8] media: v4l: ctrls-api: Allow array update in __v4l2_ctrl_modify_range
Date:   Wed,  4 Oct 2023 10:19:43 +0300
Message-Id: <4861f8420b6b11343604c681fd410836fa7ce4af.1696347109.git.vkh@melexis.com>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <cover.1696347109.git.vkh@melexis.com>
References: <cover.1696347109.git.vkh@melexis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

For V4L2_CID_TOF_TINT, which is dynamic array, it is required to use
__v4l2_ctrl_modify_range.  So the idea is to use type_ops instead of u64
from union. It will allow to work with any type.

Signed-off-by: Volodymyr Kharuk <vkh@melexis.com>
---
 drivers/media/v4l2-core/v4l2-ctrls-api.c | 25 ++++++++++++------------
 1 file changed, 13 insertions(+), 12 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-ctrls-api.c b/drivers/media/v4l2-core/v4l2-ctrls-api.c
index 002ea6588edf..03e7efea1cf7 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-api.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-api.c
@@ -934,17 +934,18 @@ int __v4l2_ctrl_modify_range(struct v4l2_ctrl *ctrl,
 	lockdep_assert_held(ctrl->handler->lock);
 
 	switch (ctrl->type) {
+	case V4L2_CTRL_TYPE_MENU:
+	case V4L2_CTRL_TYPE_INTEGER_MENU:
+		if (ctrl->is_array)
+			return -EINVAL;
+		fallthrough;
 	case V4L2_CTRL_TYPE_INTEGER:
 	case V4L2_CTRL_TYPE_INTEGER64:
 	case V4L2_CTRL_TYPE_BOOLEAN:
-	case V4L2_CTRL_TYPE_MENU:
-	case V4L2_CTRL_TYPE_INTEGER_MENU:
 	case V4L2_CTRL_TYPE_BITMASK:
 	case V4L2_CTRL_TYPE_U8:
 	case V4L2_CTRL_TYPE_U16:
 	case V4L2_CTRL_TYPE_U32:
-		if (ctrl->is_array)
-			return -EINVAL;
 		ret = check_range(ctrl->type, min, max, step, def);
 		if (ret)
 			return ret;
@@ -962,16 +963,16 @@ int __v4l2_ctrl_modify_range(struct v4l2_ctrl *ctrl,
 	}
 	cur_to_new(ctrl);
 	if (validate_new(ctrl, ctrl->p_new)) {
-		if (ctrl->type == V4L2_CTRL_TYPE_INTEGER64)
-			*ctrl->p_new.p_s64 = def;
-		else
-			*ctrl->p_new.p_s32 = def;
+		WARN_ON(ctrl->is_array); /* This shouldn't happen, as
+					  * INTEGER/Ux/BOOLEAN/BITMASK will not
+					  * return an error.
+					  * In case it happened, all array will
+					  * set to default value
+					  */
+		ctrl->type_ops->init(ctrl, 0, ctrl->p_new);
 	}
 
-	if (ctrl->type == V4L2_CTRL_TYPE_INTEGER64)
-		value_changed = *ctrl->p_new.p_s64 != *ctrl->p_cur.p_s64;
-	else
-		value_changed = *ctrl->p_new.p_s32 != *ctrl->p_cur.p_s32;
+	value_changed = !ctrl->type_ops->equal(ctrl, ctrl->p_cur, ctrl->p_new);
 	if (value_changed)
 		ret = set_ctrl(NULL, ctrl, V4L2_EVENT_CTRL_CH_RANGE);
 	else if (range_changed)
-- 
BR,
Volodymyr Kharuk

