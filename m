Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5674434A50D
	for <lists+linux-media@lfdr.de>; Fri, 26 Mar 2021 10:59:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230044AbhCZJ6z (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 Mar 2021 05:58:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229915AbhCZJ6s (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 Mar 2021 05:58:48 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F37CFC0613AA
        for <linux-media@vger.kernel.org>; Fri, 26 Mar 2021 02:58:47 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id ce10so7500193ejb.6
        for <linux-media@vger.kernel.org>; Fri, 26 Mar 2021 02:58:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wCOKiDe1D/0+aQGCLvfjrwWo1WTUNQYZ1NkzC83Pgoo=;
        b=Pzn0kWnChdk/UirORjmsRwsR+oJ22H1ym6wCOBwOu++2zuLyan8hiB3BM38xLIcXD7
         kfJ3z0oxTVWSkbPp8wpEKYGBHbOn50EBn2CCzL60WxfweTpqONv4ClSJjcMrJExY26YZ
         eU8v4Z7E2TJDr0Q+YNdTSP1u781h+rFTqnCiY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wCOKiDe1D/0+aQGCLvfjrwWo1WTUNQYZ1NkzC83Pgoo=;
        b=Xlh5eTa574oQLCQRyTBvvAKBnbZapwQZaCk8YxUtGJ35UYP4YqJlzZ35AH772YON3U
         icdoWToJkXTm0x7orEx2tO5k2c4Bzllr8lEZ6We4itw2rJgnmJwbnKnZVStzNv84tMWD
         48YMkXBkqSdQUMclWj2lwrfA4cvxPOSU+VpjUxFx/rCZDFOeMSTqLL2UA9EGFXelXGMt
         wEVAC8bzxoV4CJYUCyFAyWmiNF3iZ/5p2449euUluKbYbyaIa+RdVcgrU5CwoxJedEpL
         cWIWmAAFObNRljj69wUdaB/sJqfNh6nZ/f8PXYC1MX5CpbBeU/4okVCiXSybrx8uEFR9
         g/xg==
X-Gm-Message-State: AOAM533JfeKMpRBi6+zkJwR7ObMXqL6afNwkgf+px2c6r2jZvCXSCyHn
        b99SCHU9EqWvXdt06ZDsvHbtIM5CRrWNaTI1
X-Google-Smtp-Source: ABdhPJwkeqYZ51pGzh40eJyou6ovVfgFAaDwHlqI8RlKlXwyUrysWMigh+IRvGzHmwqbswfjgmSRag==
X-Received: by 2002:a17:907:7664:: with SMTP id kk4mr14978013ejc.352.1616752726790;
        Fri, 26 Mar 2021 02:58:46 -0700 (PDT)
Received: from alco.lan ([80.71.134.83])
        by smtp.gmail.com with ESMTPSA id h13sm4036658edz.71.2021.03.26.02.58.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Mar 2021 02:58:46 -0700 (PDT)
From:   Ricardo Ribalda <ribalda@chromium.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        tfiga@chromium.org
Cc:     Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v9 03/22] media: uvcvideo: Do not check for V4L2_CTRL_WHICH_DEF_VAL
Date:   Fri, 26 Mar 2021 10:58:21 +0100
Message-Id: <20210326095840.364424-4-ribalda@chromium.org>
X-Mailer: git-send-email 2.31.0.291.g576ba9dcdaf-goog
In-Reply-To: <20210326095840.364424-1-ribalda@chromium.org>
References: <20210326095840.364424-1-ribalda@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The framework already checks for us if V4L2_CTRL_WHICH_DEF_VAL is
written.

Reviewed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_v4l2.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
index 252136cc885c..47b0e3224205 100644
--- a/drivers/media/usb/uvc/uvc_v4l2.c
+++ b/drivers/media/usb/uvc/uvc_v4l2.c
@@ -1089,10 +1089,6 @@ static int uvc_ioctl_s_try_ext_ctrls(struct uvc_fh *handle,
 	unsigned int i;
 	int ret;
 
-	/* Default value cannot be changed */
-	if (ctrls->which == V4L2_CTRL_WHICH_DEF_VAL)
-		return -EINVAL;
-
 	ret = uvc_ctrl_begin(chain);
 	if (ret < 0)
 		return ret;
-- 
2.31.0.291.g576ba9dcdaf-goog

