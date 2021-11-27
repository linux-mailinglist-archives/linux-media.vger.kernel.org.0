Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CCD0945FDC7
	for <lists+linux-media@lfdr.de>; Sat, 27 Nov 2021 10:51:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354021AbhK0JzG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 27 Nov 2021 04:55:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353584AbhK0JxF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 27 Nov 2021 04:53:05 -0500
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A536C061746;
        Sat, 27 Nov 2021 01:49:51 -0800 (PST)
Received: by mail-lf1-x133.google.com with SMTP id b40so30228878lfv.10;
        Sat, 27 Nov 2021 01:49:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4dvE+ch/nK/kBBnPMxA7WcMHh6CQ4+F3d1jcet3ts9E=;
        b=ZXuIR2mSzWESYoGxApxyDpzUZ7G9DWJus7hcVkGx5nQJ4UeELMyJ/lQiabT9sZ5Wck
         jRFwzfU41LyA7/qTY2jI+WV3tk5iYy1GSsawVGH7YUX5a+YNppPuQobRMKvbyroBDy3n
         n8Z3PyyR7vm2NPYGJFkMC4yWu3xlkZBlrCZ+WM+vzokTmvNwzYWeu3XdwqCDLNMXjH7B
         OpsS8el+slyxIa0w8Mt1Yv43KZvD3bnyEjc8OEHbOcH0LOTRGJwh45Kx0GOta+X8vFqb
         85DUALpHlFBzem+7+TinTX/0+mw8ICYTBZTsCnqVjFoSuac4jxzimeIpmFFqS8RpjbL2
         mrtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4dvE+ch/nK/kBBnPMxA7WcMHh6CQ4+F3d1jcet3ts9E=;
        b=jLuvsJgEtBmiKrV9o/5dwzij7WIFBunf2b429JPbIqzOotGy8fKlgSBeoI6zm0vNfy
         +mnc/QwxkBym9eUYH/TR+lSl+MAjsfgWkWwOstf6ou34uBFbHFlafeiLe3bC4xFczPTM
         51Rex/2IHPHjY7PBpBvwnbe/Bp2+jc0mNc2hqYkvel6E8fUdCsicCTMwKG0Uqn7H6/o2
         nl8lAnzw+QK7WnTeUad9az27vQp/ZpV2WIpV/l6YWXAG0VIJrAV3xkA6GKr1w+UK8oNm
         rDisQhblk6rZRx5ThlVszujKG7e7vpIPvKNa6mbDLUcirqs8tlmn1YB+Wz3eUUYL90b0
         BMXg==
X-Gm-Message-State: AOAM531qRpZ0bkiuOqMnITxamVK42f1RUnd50qguPsyTqsIxhDLy4Pxr
        bIffvlsoFv1Sj3MAIEzcHiI=
X-Google-Smtp-Source: ABdhPJwfnbwzqV+ykIQ/LK2UA5l0Ll8vWjs+AQqxLyu+TGPMiTQkbN3nRbqiaeJnvRMk82/2oUYU3g==
X-Received: by 2002:ac2:5499:: with SMTP id t25mr35000401lfk.674.1638006589932;
        Sat, 27 Nov 2021 01:49:49 -0800 (PST)
Received: from localhost.localdomain (h-155-4-221-129.NA.cust.bahnhof.se. [155.4.221.129])
        by smtp.gmail.com with ESMTPSA id g10sm704582lfv.113.2021.11.27.01.49.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Nov 2021 01:49:49 -0800 (PST)
From:   Rikard Falkeborn <rikard.falkeborn@gmail.com>
To:     =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org,
        Rikard Falkeborn <rikard.falkeborn@gmail.com>
Subject: [PATCH] media: staging: max96712: Constify static v4l2_subdev_ops
Date:   Sat, 27 Nov 2021 10:49:44 +0100
Message-Id: <20211127094945.27985-1-rikard.falkeborn@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The only usage of max96712_subdev_ops is to pass its address to
v4l2_i2c_subdev_init() which takes a pointer to const struct
v4l2_subdev_ops as argument. Make it const to allow the compiler to put
it in read-only memory.

Signed-off-by: Rikard Falkeborn <rikard.falkeborn@gmail.com>
---
 drivers/staging/media/max96712/max96712.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/max96712/max96712.c b/drivers/staging/media/max96712/max96712.c
index 847e2ffd4f53..9bc72d9a858b 100644
--- a/drivers/staging/media/max96712/max96712.c
+++ b/drivers/staging/media/max96712/max96712.c
@@ -250,7 +250,7 @@ static const struct v4l2_subdev_pad_ops max96712_pad_ops = {
 	.set_fmt = max96712_get_pad_format,
 };
 
-static struct v4l2_subdev_ops max96712_subdev_ops = {
+static const struct v4l2_subdev_ops max96712_subdev_ops = {
 	.video = &max96712_video_ops,
 	.pad = &max96712_pad_ops,
 };
-- 
2.34.1

