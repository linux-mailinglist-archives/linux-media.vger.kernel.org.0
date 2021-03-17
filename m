Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4AA2533F5DC
	for <lists+linux-media@lfdr.de>; Wed, 17 Mar 2021 17:46:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232700AbhCQQpc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 17 Mar 2021 12:45:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232632AbhCQQpS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 Mar 2021 12:45:18 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E311BC06174A
        for <linux-media@vger.kernel.org>; Wed, 17 Mar 2021 09:45:17 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id r17so3648055ejy.13
        for <linux-media@vger.kernel.org>; Wed, 17 Mar 2021 09:45:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2RKdLF2sp2nWSuacDzuOWi0sXk9JfjBGvDHGz4cIafk=;
        b=k+ThYHIuc2NjaaoljJGSTYAoaeumkGrLMqub4uoq2IJOu9R6RS6ItFvAfsa9qHTzaM
         dmoQUa8W2Vi/BVV1WnZ8tfQGvaDN4N8dfCmVz4sPRHMiafkcczuI3fHJmMu5rNFqo5qD
         r/lPPo2VOIKgTc/4+CPvXYKkjYrcA/dpIP6+U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2RKdLF2sp2nWSuacDzuOWi0sXk9JfjBGvDHGz4cIafk=;
        b=Liwj7uf3KRfaehR6BFisEFoQ/IywEDQSIPfLSwu2hqV90cq59G2OBDanxS7mJ/cMe7
         GLDq53n4aJWkSjUnI0r2AYKbipTuV6GSx4dGcnr3rUWu757RaTfX4aMVJu/9Yn71UvHl
         PfA9DU6JPJfIybUgVputFX3CXHeK/vb/sGd9u4mb3iiRDEn8wzKAcpTiSkEnSJ22pDk+
         ofNUH+mKre7OQbIPaqjKME0K1xa6q8buZVn3g3fcJI1ZWMAUhPNvKg1kdEP5kStzwoRo
         HdQ7km6Vpn+BxLw4RM+t6xQKOOEN9dgsqclufWl10kZRdNrTwg2/wby/mHe5XJMh9Vye
         cVtw==
X-Gm-Message-State: AOAM531rxEgKA92sVA7xYIj5/ef13aeuKXuvi4sVkW/Cez0bl3W8pmcO
        s87DKeUVAtz1Sk0RNPpzKusHzA==
X-Google-Smtp-Source: ABdhPJxuo4TqX+Yg1mQ91PFK4dVRStVJ2t6QskXUJYwNt3RwiDJfOQRgc2hpwcP2MOVLPJoil6lMIw==
X-Received: by 2002:a17:906:22d2:: with SMTP id q18mr36389148eja.437.1615999516492;
        Wed, 17 Mar 2021 09:45:16 -0700 (PDT)
Received: from alco.lan ([80.71.134.83])
        by smtp.gmail.com with ESMTPSA id hy25sm12088128ejc.119.2021.03.17.09.45.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Mar 2021 09:45:16 -0700 (PDT)
From:   Ricardo Ribalda <ribalda@chromium.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        tfiga@chromium.org
Cc:     Ricardo Ribalda <ribalda@chromium.org>, stable@vger.kernel.org
Subject: [PATCH v6 04/17] media: v4l2-ioctl: check_ext_ctrls: Fix V4L2_CTRL_WHICH_DEF_VAL
Date:   Wed, 17 Mar 2021 17:44:58 +0100
Message-Id: <20210317164511.39967-5-ribalda@chromium.org>
X-Mailer: git-send-email 2.31.0.rc2.261.g7f71774620-goog
In-Reply-To: <20210317164511.39967-1-ribalda@chromium.org>
References: <20210317164511.39967-1-ribalda@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Drivers that do not use the ctrl-framework use this function instead.

Default value cannot be changed, return EINVAL as soon as possible.

Cc: stable@vger.kernel.org
Fixes: 6fa6f831f095 ("media: v4l2-ctrls: add core request support")
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/v4l2-core/v4l2-ioctl.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index 528eb5f420f6..ccd21b4d9c72 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -929,6 +929,13 @@ static bool check_ext_ctrls(struct v4l2_ext_controls *c, unsigned long ioctl)
 			return false;
 		break;
 	case V4L2_CTRL_WHICH_DEF_VAL:
+		/* Default value cannot be changed */
+		if (ioctl == VIDIOC_S_EXT_CTRLS ||
+		    ioctl == VIDIOC_TRY_EXT_CTRLS) {
+			c->error_idx = c->count;
+			return false;
+		}
+		return true;
 	case V4L2_CTRL_WHICH_CUR_VAL:
 		return true;
 	case V4L2_CTRL_WHICH_REQUEST_VAL:
-- 
2.31.0.rc2.261.g7f71774620-goog

