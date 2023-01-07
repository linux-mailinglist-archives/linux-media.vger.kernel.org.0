Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 15D17660D09
	for <lists+linux-media@lfdr.de>; Sat,  7 Jan 2023 09:38:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230238AbjAGIig (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 7 Jan 2023 03:38:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230098AbjAGIig (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 7 Jan 2023 03:38:36 -0500
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2DED9219F
        for <linux-media@vger.kernel.org>; Sat,  7 Jan 2023 00:38:35 -0800 (PST)
Received: by mail-ej1-x632.google.com with SMTP id u9so8506023ejo.0
        for <linux-media@vger.kernel.org>; Sat, 07 Jan 2023 00:38:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xOgzPUkVPsFJ6g/ffT102vjrzD0+OvtINIcm9iZZqT0=;
        b=p0uMCQyRwUkzuKw8jnTTRgB5Lb24wiA32+JQ4g5JXiTTzWapxZLkmKH/AaoUzsl29b
         2HH2BLb3ZN5SaZ6FIYCOx8kXkOC3P4DNu7RnjsjBZ64ZgqV16KM4WfENlfCKZRcDFGhx
         e9+yCGQtYUk6ePhkRuRLeoEGphudoLhd/IfNBhgECWQMmddKTtvTzpmaPnlwMMZ6ZqKm
         4/QbZJLjoizm6viFpHP+/C92bQXjAI+35+snGZd+4VdDvRrNuwEgbLNqh0UpfFxFnFGy
         OLfNuZywlX4MDcZQikowzBvlwxWEMGwiGFMvS2ODz3oqTqsh3HmYTNlyfjcBZ3uGee3e
         0WPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xOgzPUkVPsFJ6g/ffT102vjrzD0+OvtINIcm9iZZqT0=;
        b=WAQKnvnceasBD+bPg545IYJxsvsgDvqkh0eRisBjAONkSKv+yE62v5vGq8x3yGaVvO
         I0S2U3+iniyAo9isYE+zupRRsI50gFacBr39l9SqQOJVz9eWAwGd1rF+QVny9ZRZFE68
         hsWqv29QB9kt+3DQbtp64pYjThWEAEQkagRUo0QtTmCPzd1kkKOUVo5v7YiCG4QDTcEV
         HCyRB1FNDRe8+V9oqSKsVYX1bHtKBAubCDoiOURauwSabBohleLcAtlDB/opOKgs5qhJ
         VTLViWD2T/8vsZbSh/bkpIR/D7UJLCClIAoK47SNrrDUWndcB7qKuUcGbVvVCsQXUEvE
         AAkQ==
X-Gm-Message-State: AFqh2kpA3rYR8NMfi9nTmXkkFz50YT2FKlL434anaxnxFFbDfEYXH62u
        uovnpSaU99C0Iv3GyR4ACdY=
X-Google-Smtp-Source: AMrXdXto/4G2M8RCTk63eS0nYKljP3eOEIHWa4CDLiaoEToyIbOSm80Ct5qBHA3otiYiDy6XgKH98g==
X-Received: by 2002:a17:907:a091:b0:7c1:23ef:4bb9 with SMTP id hu17-20020a170907a09100b007c123ef4bb9mr47302390ejc.13.1673080713744;
        Sat, 07 Jan 2023 00:38:33 -0800 (PST)
Received: from localhost.localdomain (mm-96-64-120-178.brest.dynamic.pppoe.byfly.by. [178.120.64.96])
        by smtp.gmail.com with ESMTPSA id g22-20020a170906539600b0080b3299ebddsm1226146ejo.13.2023.01.07.00.38.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Jan 2023 00:38:33 -0800 (PST)
From:   Oleg Verych <olecom@gmail.com>
To:     linux-sunxi@lists.linux.dev (open list:ARM/Allwinner sunXi SoC support)
Cc:     Oleg Verych <olecom@gmail.com>, Maxime Ripard <mripard@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org (open list:ALLWINNER A10 CSI DRIVER)
Subject: [PATCH] media: sun4i-csi: Fix 'Unbalanced pm_runtime_enable!'
Date:   Sat,  7 Jan 2023 11:37:49 +0300
Message-Id: <20230107083749.2419-1-olecom@gmail.com>
X-Mailer: git-send-email 2.35.1.windows.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

When removing the module, balance PM runtime enable with
the corresponding disable call.

Signed-off-by: Oleg Verych <olecom@gmail.com>
---

dmesg:
```
[   32.570802] i2c-core: driver [ov5640] registered
[   32.585345] sun4i-csi 1c09000.csi: Device registered as video0
[  396.520467] random: crng init done
[ 1603.050944] ov5640 2-003c: remove
[ 1603.051878] i2c-core: driver [ov5640] unregistered
...
[ 1603.108832] i2c-core: driver [ov5640] registered
[ 1603.119400] sun4i-csi 1c09000.csi: Device registered as video0
[ 1603.119984] sun4i-csi 1c09000.csi: Unbalanced pm_runtime_enable!
```

 drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c b/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c
index 18e6c65f4..86c5235a0 100644
--- a/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c
+++ b/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c
@@ -264,6 +264,7 @@ static int sun4i_csi_remove(struct platform_device *pdev)
 {
 	struct sun4i_csi *csi = platform_get_drvdata(pdev);
 
+	pm_runtime_disable(&pdev->dev);
 	v4l2_async_nf_unregister(&csi->notifier);
 	v4l2_async_nf_cleanup(&csi->notifier);
 	vb2_video_unregister_device(&csi->vdev);
-- 
2.20.1
