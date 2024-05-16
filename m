Return-Path: <linux-media+bounces-11569-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 26B838C7A8D
	for <lists+linux-media@lfdr.de>; Thu, 16 May 2024 18:42:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3D3981C2107C
	for <lists+linux-media@lfdr.de>; Thu, 16 May 2024 16:42:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D13ED8BF7;
	Thu, 16 May 2024 16:42:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=melexis.com header.i=@melexis.com header.b="l+zMY4tk"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FDF879DF
	for <linux-media@vger.kernel.org>; Thu, 16 May 2024 16:42:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715877742; cv=none; b=XXbHxT77eFiXF4VfP8X5BQVVWD7APe5F17+6sztax6Oesz0QarCTA9Ygeg3ePsOmc0MjwlDkSodsKxwSitlGjlbbfyW8ql0kJzmy5Y7iImgF4AanexF9GB29s3zsq1f9pX6V23uAIhpoXlpeqz6nGtmwNVX8udqD7oT/FcyxoVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715877742; c=relaxed/simple;
	bh=jGqzhaOd16cpVcsnK4AsE1lanw1GigLr24tQMLYItF0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ZsHD5XpKn/UoUqO3Gj7vdHlAzlmq4XlH5Qg00mio8OOZTtsv8JgeKJ7VApVLqAU/tVYb25S3L2WRAiMgdqu0GSzGCE26GyCaLvMTsuuIxc3IC4PEMeH2/7rvZtDaOiYUZiJJ4B+LWPPubPNl1+Q90P7VuwwsguO9CeFVv+JfDSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=melexis.com; spf=pass smtp.mailfrom=melexis.com; dkim=pass (2048-bit key) header.d=melexis.com header.i=@melexis.com header.b=l+zMY4tk; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=melexis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=melexis.com
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a59ab4f60a6so275051266b.0
        for <linux-media@vger.kernel.org>; Thu, 16 May 2024 09:42:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=melexis.com; s=google; t=1715877739; x=1716482539; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x86b2pC0BGkgc9pZoaWR80EZrkXbOTilbfMfMb6B3+0=;
        b=l+zMY4tkmNN5KtTmuSr8WOU1UOtakVjcklz6+t6vTCUw4WAnXhIZFivVRSoEeTWzoH
         XJroM9cgdafAJkkdM0Oosk9zrV+GY9Kx5uoBL0ds/uzaCWuO2FUEhvff7PccWGZt1+42
         GePwwn6H1ezBNFaz2RwD0DdPejCvf0YGiINeWs1lQHzHSnypZmldPxZLLDOnJLR2bH2c
         adp0HmkBp/rgYkuPsokNLJdW6STZqd8kyg+iZKNcdFq3cZEKBH4zKzlKA72S8I4/PagN
         +hVlzvzfAUbqMFGQr0bSX6JUtREW2yVnfr+HXyBnIF1d2aJ08XH797/ytEm6PtLbfZm0
         k3wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715877739; x=1716482539;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x86b2pC0BGkgc9pZoaWR80EZrkXbOTilbfMfMb6B3+0=;
        b=QpaWR5KK9WIOME9dUeeqOnEaqSbNgfiaHzFxaxAQXZP7lm08XYxSpOV+A71Sa/fHUC
         LjBuDFYvunpVvqCDuH67ilcXKmXINrK2JwCoVTGuQN09xgb4UfOzVCri+Ti9hFUOQUZG
         h+Cze/DpzVm6rBSEjjuoigI+VA23zFJbphDyI8WdHJdd/T505Da29DmqEJWg0+fFVuic
         Jvt1u1gKApl01nYWHgyAQErMPGIAMzD8BG1rD4ljviQJdEr+Wy/eB+2tLsS7ZJ+r8eqV
         FN/1XBehfSKxZm3z9QZ/3QQJBkaf5KiHxd8+LFulMVsaMD8l4vEWOzobRTxEgqZRC5q0
         3RAA==
X-Gm-Message-State: AOJu0YxjYuWTthFDgBcpBCV4of4v0bIVYLmbox/LEPAyAXg+O3bAUFjw
	qnF+g7bYhqB6Ri73wiZ4K2ifXyg2FKjMJa3H5/OgnSL/qcqAlh0MfDsV5UBXNIXAlfPaY2qmJxG
	MZ0+S3/laa4GdoUqpw/tZRC5cSH94MTDy7p5UD8XjpAWwDKz5HeW+I7uhNRF4EA/DcsYd6GIcRI
	dDxLg1+90VrNo6htbIhzR7oW2X+QJCMixadmHp1w/5
X-Google-Smtp-Source: AGHT+IHMA/7KS4nXZp1n19NAbIpGBUaNCGnqr2Ma53AhWlNvJ1WlcykMbVpaHMIG+C8VAROpqCcqWQ==
X-Received: by 2002:a17:906:c452:b0:a59:9da0:cc1 with SMTP id a640c23a62f3a-a5a2d65fcf7mr2046631566b.58.1715877739202;
        Thu, 16 May 2024 09:42:19 -0700 (PDT)
Received: from melexis ([91.192.181.19])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a5a179c7e9bsm996991266b.134.2024.05.16.09.42.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 May 2024 09:42:19 -0700 (PDT)
From: Volodymyr Kharuk <vkh@melexis.com>
To: <linux-media@vger.kernel.org>
Cc: Andrii Kyselov <ays@melexis.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	devicetree@vger.kernel.org,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Volodymyr Kharuk <vkh@melexis.com>
Subject: [PATCH v6 06/10] media: v4l: ctrls-api: Allow array update in __v4l2_ctrl_modify_range
Date: Thu, 16 May 2024 19:41:51 +0300
Message-Id: <7789f15cfbad2c145e5b4b99b790be2da01fbf32.1715871189.git.vkh@melexis.com>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <cover.1715871189.git.vkh@melexis.com>
References: <cover.1715871189.git.vkh@melexis.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For V4L2_CID_TOF_TINT, which is dynamic array, it is required to use
__v4l2_ctrl_modify_range.  So the idea is to use type_ops instead of u64
from union. It will allow to work with any type.

Signed-off-by: Volodymyr Kharuk <vkh@melexis.com>
---
 drivers/media/v4l2-core/v4l2-ctrls-api.c | 25 ++++++++++++------------
 1 file changed, 13 insertions(+), 12 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-ctrls-api.c b/drivers/media/v4l2-core/v4l2-ctrls-api.c
index e5a364efd5e6..f65d6114592c 100644
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


