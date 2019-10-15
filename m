Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 29F1ED7AB3
	for <lists+linux-media@lfdr.de>; Tue, 15 Oct 2019 18:00:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732799AbfJOQA5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Oct 2019 12:00:57 -0400
Received: from mail-qt1-f194.google.com ([209.85.160.194]:34716 "EHLO
        mail-qt1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731936AbfJOQA5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Oct 2019 12:00:57 -0400
Received: by mail-qt1-f194.google.com with SMTP id 3so31363198qta.1
        for <linux-media@vger.kernel.org>; Tue, 15 Oct 2019 09:00:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=/gx13EoeTgkG/Oe6NP7WzbbRHpWHPhwLQ0S20aXkA7M=;
        b=ZoC85FgC4p1HBVU2ERFz9QkVKW+my8X1B2vZJN8l/RwCbNeE3uOU1ces8pE3OBiMQR
         wQ1LdYnSGI2lbDXDjlAOsqXYc2MDjKLm4WjV/u+2jDAiIJ+yXly3jzWpqWbZ73dhlSTp
         PRs65S418OezqO6U8FNv8beWdUUaMuxiQYQTf/Ke9bA/Xvm6Srv245CjmzdzV2O5mllU
         8w3hmSg5PYxhYRsBPdrc7Ec7mjukjc5c9TGjSfp+inJcYcjl+z4ptO2kljI0D/QXAdDT
         Hmj+NeYj11mrbLglBUR+/0Ll+U3uJjjnU8AKtaRqY9gD6mJEEOGJKNYokmuc3/+ur180
         MBSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=/gx13EoeTgkG/Oe6NP7WzbbRHpWHPhwLQ0S20aXkA7M=;
        b=aueQiL+c0x0iKGZodeKdv2iYuTEmCATi1SpSGvqKebyHdcvOFl+qgKBURX/A7ixeyB
         E41jvLMyLjqOurRyLkdc33V7XVZfIlf8IrXLPgVsd4VtM07ggX5zBAeW51LooNv8rzsF
         BNPI9rMTtd8ke8CGzsvv7o1/Xp/Gy4tDPvjfif1jc5oA8QyaQhm/nBW8Xz0rfGpoJg0/
         rNwPTsJM2ZB4z5K0XZ5UtiQ4XYLTgPbKyjNW7D6Y1b16NuXTa61VBtbWIHrhL6b82NA+
         el7X6Dpzx8u25s2N9001eH2IsnYMBaKvp81FZOjM7ijg8xMpaGwDlcCOp3QdzKda3TTl
         MAoQ==
X-Gm-Message-State: APjAAAXiELydHtKIstM6mx40b7CXDqnStnpXrZIs7Fur85G70f9LnDeW
        0XT1oWCr6SvdyUvb31AUp60=
X-Google-Smtp-Source: APXvYqxhES4J/wTNs1PSowZ4WrCIHVp9oRnjf7KD1WZQGjRhcDqPdMjGIReHWtKPp26qmhMoyOWIDQ==
X-Received: by 2002:ac8:359d:: with SMTP id k29mr37507195qtb.96.1571155256616;
        Tue, 15 Oct 2019 09:00:56 -0700 (PDT)
Received: from fabio-Latitude-E5450.nxp.com ([177.221.114.206])
        by smtp.gmail.com with ESMTPSA id n21sm10304930qka.83.2019.10.15.09.00.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Oct 2019 09:00:55 -0700 (PDT)
From:   Fabio Estevam <festevam@gmail.com>
To:     hverkuil-cisco@xs4all.nl
Cc:     mchehab@kernel.org, slongerbeam@gmail.com, tharvey@gateworks.com,
        p.zabel@pengutronix.de, linux-media@vger.kernel.org,
        Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v3 2/4] media: imx.rst: Provide a real example for the output format
Date:   Tue, 15 Oct 2019 13:00:40 -0300
Message-Id: <20191015160042.28113-2-festevam@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191015160042.28113-1-festevam@gmail.com>
References: <20191015160042.28113-1-festevam@gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

In the i.MX6Q sabreauto pipeline example, it is better to provide
a real example for the output format, so do it just like in the
previous lines for consistency.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
Acked-by: Steve Longerbeam <slongerbeam@gmail.com>
---
Changes since v2:
- None

 Documentation/media/v4l-drivers/imx.rst | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/Documentation/media/v4l-drivers/imx.rst b/Documentation/media/v4l-drivers/imx.rst
index 3d72e411b93d..36e8d1226ac6 100644
--- a/Documentation/media/v4l-drivers/imx.rst
+++ b/Documentation/media/v4l-drivers/imx.rst
@@ -547,8 +547,6 @@ This example configures a pipeline to capture from the ADV7180
 video decoder, assuming PAL 720x576 input signals, with Motion
 Compensated de-interlacing. The adv7180 must output sequential or
 alternating fields (field type 'seq-tb' for PAL, or 'alternate').
-$outputfmt can be any format supported by the ipu1_ic_prpvf entity
-at its output pad:
 
 .. code-block:: none
 
@@ -565,7 +563,7 @@ at its output pad:
    media-ctl -V "'ipu1_csi0':1 [fmt:AYUV32/720x576]"
    media-ctl -V "'ipu1_vdic':2 [fmt:AYUV32/720x576 field:none]"
    media-ctl -V "'ipu1_ic_prp':2 [fmt:AYUV32/720x576 field:none]"
-   media-ctl -V "'ipu1_ic_prpvf':1 [fmt:$outputfmt field:none]"
+   media-ctl -V "'ipu1_ic_prpvf':1 [fmt:AYUV32/720x576 field:none]"
 
 Streaming can then begin on the capture device node at
 "ipu1_ic_prpvf capture". The v4l2-ctl tool can be used to select any
-- 
2.17.1

