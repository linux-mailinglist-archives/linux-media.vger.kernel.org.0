Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 08FCD52D80A
	for <lists+linux-media@lfdr.de>; Thu, 19 May 2022 17:43:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241074AbiESPm5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 May 2022 11:42:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241277AbiESPlY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 May 2022 11:41:24 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1306515837
        for <linux-media@vger.kernel.org>; Thu, 19 May 2022 08:41:21 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id i40so7468783eda.7
        for <linux-media@vger.kernel.org>; Thu, 19 May 2022 08:41:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=WTUmXa/64n3GmqLH4t1zWSye8BWFqtPRackPhQ7O1Mc=;
        b=VBMGp6SVXaYYTIvTJUKNAo4dMzncK/sXtWR7zTwwI5Q+HXg3MZ8wUe4WmWpe4YbmlD
         AyJtYCkYNTFoE0SGz2LHCxEiVpN8XyoZrJLnMhkcDsUY0gyvL74gavd+Y68wmNU38cbh
         csz28gGPl/L0gVN8WnAda5weYezXGV2+j1Xjk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WTUmXa/64n3GmqLH4t1zWSye8BWFqtPRackPhQ7O1Mc=;
        b=qfzNIsLstDGLWfgJ8b/D/TganF5F0zzihM8aGgEOQ4mZqctrsSBS1ADGgl2gcQxMHr
         1NedoVcr4eda+3PFRdQWOGqOc1E+z6v0zbdgkFYLKfk64J/MvzRl3S/o6Ctja2TApTVs
         rweq/VBV0TdUWyxGk4Bq2qpEM49b3IJPfvcIrfEyyzCF/GAfNGaBukASr1cz1dOD1CXI
         iVVkJyBu2zViU+M39lptaCmAcqcI5J4U2DkBPls0eAKc2Dl+dNvyQWt9J993LizAdxJm
         NozOgA8n4+RetbhdPRuZdldNLy3EMnZr5/2AnMKKNd0nzatB65CLCngtEU8yKTgabPoO
         b6YA==
X-Gm-Message-State: AOAM532+d4jW8Nuyfo/X5eokzWywUuY0rObz0E+7GSswdvOi3yf9kiub
        zJq2Oeip8pCdGaTCdrwfiBgX1g==
X-Google-Smtp-Source: ABdhPJwtcZFVm9eQrNgwy/WsrvMl+Wwfo9Bv7rvR756MF5Qp0e0McQcNdMF4Nw4haFAx6Z4I86ZZVg==
X-Received: by 2002:a05:6402:4414:b0:419:28bc:55dc with SMTP id y20-20020a056402441400b0041928bc55dcmr6138706eda.130.1652974879697;
        Thu, 19 May 2022 08:41:19 -0700 (PDT)
Received: from alco.corp.google.com ([100.104.168.197])
        by smtp.gmail.com with ESMTPSA id k24-20020a056402049800b0042aae307407sm2990092edv.21.2022.05.19.08.41.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 May 2022 08:41:19 -0700 (PDT)
From:   Ricardo Ribalda <ribalda@chromium.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Tomasz Figa <tfiga@chromium.org>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Yunke Cao <yunkec@google.com>
Cc:     Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH 1/4] media: uvcvideo: Add missing value for power_line_frequency
Date:   Thu, 19 May 2022 17:40:56 +0200
Message-Id: <20220519154100.333091-2-ribalda@chromium.org>
X-Mailer: git-send-email 2.36.1.124.g0e6072fb45-goog
In-Reply-To: <20220519154100.333091-1-ribalda@chromium.org>
References: <20220519154100.333091-1-ribalda@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

UVC 1.5 class defines 4 values for this control on:
4.2.2.3.6 Power Line Frequency Control

Add the missing value.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_ctrl.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index b4f6edf968bc..13cad4aa7573 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -366,6 +366,7 @@ static const struct uvc_menu_info power_line_frequency_controls[] = {
 	{ 0, "Disabled" },
 	{ 1, "50 Hz" },
 	{ 2, "60 Hz" },
+	{ 3, "Auto" },
 };
 
 static const struct uvc_menu_info exposure_auto_controls[] = {
-- 
2.36.1.124.g0e6072fb45-goog

