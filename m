Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8B075640A3D
	for <lists+linux-media@lfdr.de>; Fri,  2 Dec 2022 17:08:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233546AbiLBQIA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 2 Dec 2022 11:08:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233497AbiLBQHz (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 2 Dec 2022 11:07:55 -0500
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D10B26AF6
        for <linux-media@vger.kernel.org>; Fri,  2 Dec 2022 08:07:53 -0800 (PST)
Received: by mail-ej1-x62e.google.com with SMTP id fc4so5648458ejc.12
        for <linux-media@vger.kernel.org>; Fri, 02 Dec 2022 08:07:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=melexis.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lN7SLbrO6IRiwLkabai6Yk1jGwDx04yNJ/i+Pt05kbI=;
        b=ouAx3zIYJo87/9kuuvnJZWrLXDYN/kBd8D+5aRKdCbEd1dmRsXWjsiR3wzgdhXK6Ye
         DIeWzb6nM1n9s4HS0bVBZVnzMRykDMdu/R5T16y7L2CnknQAlqbInPP0F2ymzdtF/Jdj
         SM1uDNeAMfGTTJWejfosCvi3BEHw8jmaCVBLCo/2zkJzz1+qiWp3jalmbXTRQ/IrSu25
         wDWsS+qD+bcX6qxI2mi1iu4pO05i1aXCYwXvassyXivDC8ZKTHtp/Bbrxte4ans6t61v
         6Bx4hf5sS+iyuVGGjYaChvf3aitP4H2aZhsIa85/MwxfmlRUYnNW280P5azwhRS2wFVA
         Vjgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lN7SLbrO6IRiwLkabai6Yk1jGwDx04yNJ/i+Pt05kbI=;
        b=53argm6c+nSbE3xUwMtY66HM+dJr8ZDmo3yl2MWpuri0WJ56UTku+nVBrYZcbkvvl/
         08Gu79ukDTlRPbHmiBtd0MAxta3B/SBWlYFffRb9PF2EhvbsiK0d1UipjlgUwlBfO2HF
         Mpq+1KvJKqnFOimM/TcsYZWtZvK7hc6m5/EBU5ifq1pDKRth0RqUkDRVpfjqgKrY/98P
         zdBlcsmbH5ud7tjJOja9PqyYyDDRkLegkorVj8ePGG0nk2IrV47ejwUeERvvBVjag8lK
         nMGUoqgXagB8pBcFZGaj3eKyl74Dr0ntnAmumkygv5HOUYLovekIFy5FEPVc/eO3DxD7
         VGBg==
X-Gm-Message-State: ANoB5pntVlSAzkKX4djJw++3u4ebtc73akbn+d1uUNGBn6+foE2TujnE
        vyJwCt39bjohhzIC+lYeXTaKAGKAKfaYTGBKVek2zQperiiyiy3wnMKFWvGusuB7PEcEYDBJXC1
        B2cH18r8UwHUzMeWnJEFmxlDhN2oaFgTDqTv+GFZSexs9N5hYXANTm5gYE6Y97mR+n8jn4BwuVe
        M=
X-Google-Smtp-Source: AA0mqf7lH3dyya87BXasWaVfLkxyri8QF91SYPgtl7mldNw+Q68cRubykpXAJ1K8uaie15A9hC8TEw==
X-Received: by 2002:a17:906:b108:b0:7b5:dd3e:69c1 with SMTP id u8-20020a170906b10800b007b5dd3e69c1mr44864435ejy.381.1669997272146;
        Fri, 02 Dec 2022 08:07:52 -0800 (PST)
Received: from melexis ([91.192.183.26])
        by smtp.gmail.com with ESMTPSA id o7-20020a056402444700b0044dbecdcd29sm1668210edb.12.2022.12.02.08.07.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Dec 2022 08:07:51 -0800 (PST)
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
Subject: [PATCH v4 4/8] media: v4l: ctrls-api: Allow array update in __v4l2_ctrl_modify_range
Date:   Fri,  2 Dec 2022 18:07:34 +0200
Message-Id: <e69f6cd8eec064fecde250927f55ba29cd361465.1669978791.git.vkh@melexis.com>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <cover.1669978791.git.vkh@melexis.com>
References: <cover.1669978791.git.vkh@melexis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
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
index d0a3aa3806fb..ebe57ec72813 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-api.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-api.c
@@ -933,17 +933,18 @@ int __v4l2_ctrl_modify_range(struct v4l2_ctrl *ctrl,
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
@@ -961,16 +962,16 @@ int __v4l2_ctrl_modify_range(struct v4l2_ctrl *ctrl,
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

