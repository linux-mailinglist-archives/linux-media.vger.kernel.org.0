Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 357B150BA28
	for <lists+linux-media@lfdr.de>; Fri, 22 Apr 2022 16:32:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1446549AbiDVOfS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 22 Apr 2022 10:35:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233899AbiDVOfQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 22 Apr 2022 10:35:16 -0400
Received: from mail-oa1-x29.google.com (mail-oa1-x29.google.com [IPv6:2001:4860:4864:20::29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8224E5A59F
        for <linux-media@vger.kernel.org>; Fri, 22 Apr 2022 07:32:23 -0700 (PDT)
Received: by mail-oa1-x29.google.com with SMTP id 586e51a60fabf-e5e433d66dso8797830fac.5
        for <linux-media@vger.kernel.org>; Fri, 22 Apr 2022 07:32:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=I9tvWskpIr8+9UiEpmFFVJ6M7CMkzGZ6sRHF/Le6p20=;
        b=SjLnawm/EAkXc7uDsym7KQ6N14kXb64pUIN1CqYRaXYeoS45NKCN8Qsmh7UvwB6bvz
         EPxN+3ojRLmYC9adP8ik8APFQGEyK3xqPk3Q73dVcR556D3hPdcwdUhLazGjkdJKQJ4L
         sPKQtFJLTteWZp3XXyJL6tVt7Y9dAw1EYsfrfhLY8MjRY+qjtv7K+r/wt2i0E9J/GMi6
         mNFBod5GliKzPsG76gWZbsaJaz+Fzj5IpxPrWJtTASrIMFqYb4a/bcot+wuPzP2h0Dbx
         EiGb6W8TuQbJh7D1hgFPGSpTeBBfWmELs43UvP/QK2dKr6YT2Qq01v6MRpzSBxZmjxS2
         3eoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=I9tvWskpIr8+9UiEpmFFVJ6M7CMkzGZ6sRHF/Le6p20=;
        b=GAu41KYW9nGcWErRFaBuFYrzs2h5UO63GluaBt3kEFYoyDH43a9nzc3ENr/Txilytb
         CwmFyizM5IE0Q6TpEgktImBeAZQT55ZhOKnVnQVP+ly2gf0G+6TmD8vi+rvC0kWpFziP
         fWtfX7LGj9p+C6ObVuKU/2gUdAXhuTDQUAUq07i9Sc3vAsVmKjgb+tkXvDXpdeLfBn+b
         q53f3SDhXUPPeFzSra1ZeHCSeKbAExMIuKou9apTSqiBAVbLWrpU4BnZ4TPLmjYWsJPo
         Ulp9xOuQ3ZFr0BUgUc146ODGb5Y0yJnjgqKpsSyeg9SYP1+67U9UGT7zn44EPNoheyRe
         yBjw==
X-Gm-Message-State: AOAM531OynkPYP6uBWwExYfsf8/30awws+Wx0mYfx8NCtQSP+Zuk6WOx
        BhS4dca5D8LlbEuOMwJBTKr+6cfTm1M=
X-Google-Smtp-Source: ABdhPJwkKQPpl4DhMVp+suOCCAR6JO12uG4ugEsEas4ELI/RuDYE3P7HF+Y60dz0NAeeZlGwSTks9Q==
X-Received: by 2002:a05:6870:700c:b0:e5:abbc:ca32 with SMTP id u12-20020a056870700c00b000e5abbcca32mr5934182oae.92.1650637941872;
        Fri, 22 Apr 2022 07:32:21 -0700 (PDT)
Received: from localhost.localdomain ([2804:14c:485:4b69:9f29:454f:1c77:1b6b])
        by smtp.gmail.com with ESMTPSA id j17-20020a056808119100b00322e1b61907sm801850oil.35.2022.04.22.07.32.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Apr 2022 07:32:21 -0700 (PDT)
From:   Fabio Estevam <festevam@gmail.com>
To:     mchehab@kernel.org
Cc:     laurent.pinchart@ideasonboard.com, rmfrfs@gmail.com,
        linux-media@vger.kernel.org, agust@denx.de,
        Fabio Estevam <festevam@denx.de>
Subject: [PATCH 1/2] media: platform: imx-mipi-csis: Remove unneeded 'default n'
Date:   Fri, 22 Apr 2022 11:31:29 -0300
Message-Id: <20220422143130.1697636-1-festevam@gmail.com>
X-Mailer: git-send-email 2.25.1
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

From: Fabio Estevam <festevam@denx.de>

There is no need to pass 'default n' in Kconfig, as by default the
CONFIG_VIDEO_IMX_MIPI_CSIS option is not selected.

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
 drivers/media/platform/nxp/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/platform/nxp/Kconfig b/drivers/media/platform/nxp/Kconfig
index 5afa373e534f..a0810df751dc 100644
--- a/drivers/media/platform/nxp/Kconfig
+++ b/drivers/media/platform/nxp/Kconfig
@@ -11,7 +11,6 @@ config VIDEO_IMX_MIPI_CSIS
 	select MEDIA_CONTROLLER
 	select V4L2_FWNODE
 	select VIDEO_V4L2_SUBDEV_API
-	default n
 	help
 	  Video4Linux2 sub-device driver for the MIPI CSI-2 CSIS receiver
 	  v3.3/v3.6.3 found on some i.MX7 and i.MX8 SoCs.
-- 
2.25.1

