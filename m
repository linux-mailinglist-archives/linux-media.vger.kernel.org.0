Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E2DC01B2CA7
	for <lists+linux-media@lfdr.de>; Tue, 21 Apr 2020 18:29:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726012AbgDUQ3r (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 Apr 2020 12:29:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725870AbgDUQ3r (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 Apr 2020 12:29:47 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13342C061A10
        for <linux-media@vger.kernel.org>; Tue, 21 Apr 2020 09:29:47 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id y6so1040416pjc.4
        for <linux-media@vger.kernel.org>; Tue, 21 Apr 2020 09:29:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=2HNE8p8rM4ANg0w3y9mHp4bW04NR0HfjTv/4Ar6Da3Y=;
        b=LTgU6lOxxuFsOBc/eb7Op7li/ma/97DD3fnoU1p9gVbgVAH5JIh5CG9xBtHTCEUaXW
         LVl9ecILmgQAFA7IlFA+KdbQpOCHqItdq0NAAn23QEH74ey61DrU6S7t86ffAbjNCUXm
         JzN3Cfu/j+GhgnKBuOhqg4kh7FB8HgU9cIlUZIt5+01+AUqlcDBKb6NTG8mJM6GiqPwR
         4rUZoYjwt8cDXvjxmrTbP41e5E9yGyNQrxgbKEKvC3Bt/eIba+8HypuplZ7o7N47afc/
         nQwdUdW7c6fu0/jRA935NfDHP30cFcpe5F0AwIUiz1I2cyOFHQcjQ+EZepXvrgNzLz+5
         IG7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=2HNE8p8rM4ANg0w3y9mHp4bW04NR0HfjTv/4Ar6Da3Y=;
        b=rZ299Dv0uf5ro+dkFXPSEDK/4ZD86PPff8XDUs4bhvnQVccohqKuOk6SnvqA9fqepr
         n2xY/tDyJLcTR/WY0YgQqZyqOoVdb6xVflm/+J2e2Cf+n3xIdXvsKKffTizpu6xsG5Mt
         w2XtvoaP+sEmHTmcnONIDkqnxc5En85PH/vN9piTEY9kpWK54PDZ23xt4b3DAXzH4raw
         dDpyDxWD77SyTT4caH2lx7YlLoY7LFFLIlTbUL0cgTIhCtkkt4uG/d2VSOEALJYG1dGl
         fYZm3pvriFWJBzXderTmvaRsh68lpwBGrIGgjLLNa4vFcWuBbCs7TWtS0KoVFiZudpFu
         q5jg==
X-Gm-Message-State: AGi0PuaTKIod5ELRYZ1PHzFbHXw2I1NSZMT8m7s9I9tmfRSYY8HnhfBc
        JrCFjgtG0fdT0D5fpx4CvPOJ3/dH
X-Google-Smtp-Source: APiQypK8/8ihve+8s/gkK3HKEJyF0qZ2Ir8crnaP6cHp2absPixi8rB6Re0BK1HJMaFzS0XVS0Xsbw==
X-Received: by 2002:a17:902:6bc3:: with SMTP id m3mr2997721plt.288.1587486586161;
        Tue, 21 Apr 2020 09:29:46 -0700 (PDT)
Received: from mappy.world.mentorg.com (sjewanfw1-nat.mentorg.com. [139.181.7.34])
        by smtp.gmail.com with ESMTPSA id t188sm2630754pgb.80.2020.04.21.09.29.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2020 09:29:45 -0700 (PDT)
From:   Steve Longerbeam <slongerbeam@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Steve Longerbeam <slongerbeam@gmail.com>
Subject: [PATCH v2] media: imx: utils: Default colorspace to SRGB
Date:   Tue, 21 Apr 2020 09:29:40 -0700
Message-Id: <20200421162940.861-1-slongerbeam@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The function imx_media_init_mbus_fmt() initializes the imx subdevice
mbus colorimetry to some sane defaults when the subdevice is registered.
Currently it guesses at a colorspace based on the passed mbus pixel
format. If the format is RGB, it chooses colorspace V4L2_COLORSPACE_SRGB,
and if the format is YUV, it chooses V4L2_COLORSPACE_SMPTE170M.

While that might be a good guess, it's not necessarily true that a RGB
pixel format encoding uses a SRGB colorspace, or that a YUV encoding
uses a SMPTE170M colorspace. Instead of making this dubious guess,
just default the colorspace to SRGB.

Reported-by: Hans Verkuil <hverkuil@xs4all.nl>
Signed-off-by: Steve Longerbeam <slongerbeam@gmail.com>
---
Changes in v2:
- rebased
---
 drivers/staging/media/imx/imx-media-utils.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/media/imx/imx-media-utils.c b/drivers/staging/media/imx/imx-media-utils.c
index 42e64b618a61..4ba6a5310f76 100644
--- a/drivers/staging/media/imx/imx-media-utils.c
+++ b/drivers/staging/media/imx/imx-media-utils.c
@@ -388,8 +388,7 @@ int imx_media_init_mbus_fmt(struct v4l2_mbus_framefmt *mbus,
 
 	mbus->code = code;
 
-	mbus->colorspace = (lcc->cs == IPUV3_COLORSPACE_RGB) ?
-		V4L2_COLORSPACE_SRGB : V4L2_COLORSPACE_SMPTE170M;
+	mbus->colorspace = V4L2_COLORSPACE_SRGB;
 	mbus->xfer_func = V4L2_MAP_XFER_FUNC_DEFAULT(mbus->colorspace);
 	mbus->ycbcr_enc = V4L2_MAP_YCBCR_ENC_DEFAULT(mbus->colorspace);
 	mbus->quantization =
-- 
2.17.1

