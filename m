Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 91E496F1B5C
	for <lists+linux-media@lfdr.de>; Fri, 28 Apr 2023 17:22:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346275AbjD1PWR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 28 Apr 2023 11:22:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346322AbjD1PWP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 28 Apr 2023 11:22:15 -0400
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A3182717
        for <linux-media@vger.kernel.org>; Fri, 28 Apr 2023 08:22:05 -0700 (PDT)
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-63f273b219eso97056b3a.1
        for <linux-media@vger.kernel.org>; Fri, 28 Apr 2023 08:22:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1682695324; x=1685287324;
        h=to:from:cc:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E/dZSqOQ8xKsHjj0RW9/HAxmmL3kEAjfoEclPmIfeD4=;
        b=MhRrFAJGxtQ17F8KaKtDs1zQLGGbwFbLblYgD63yL8hZm7JOPfAkJyNK5sUh2C5u55
         vsjUwj3Vtc3CHRAKXo8+y6VLV3KUmEBx2vyGrHSXTGtkeLIX974eMZ4zJw7oIx3/lw7M
         Sfxu2z4JgoyFDW2sRMQhXdkGODTL+0EXRXEtPliK0iFBKYLd7Wsf9y6dWDuyQfnL0tu0
         bu27KG/U8M9JEMeIpZmgxcRXuXQhyaP1c2b1w6aoIYCrfiz1cZxQle6Z/i4H6jfMfN6a
         vsAlOqlyQDTgsnaq3Bk9Dam4CLddfOdnroJzZf0oBjbIQX3nzFYkAbhPlBGnlTJQo5sh
         ygFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682695324; x=1685287324;
        h=to:from:cc:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E/dZSqOQ8xKsHjj0RW9/HAxmmL3kEAjfoEclPmIfeD4=;
        b=Fm0pN+/9YUgU8p0mKq4vLOmZAX0TofTKJS19nUQszf5kmyzpPqsm6cfu6czIHqRFDW
         Pp5qiFbOFyBH8psgAe9nmg/sM54GHD/LhS1yfNPWbOgyLWspuA8jvbeuxKc3ovrY8s5y
         jgNY5qnr+/IaWui8WqmUs4nxn7o3GvBHuaz2CXg/FmdXCJFUJk2jTaAllUUcscPICk2y
         EpQLuVsY6sf8dNFUOXUkCzfwtQp5PqJB6kMxfw7Vm1DyifCC50eg4PYuwY1gEDy9iPag
         DQ8AnLM+rDGtAnXtsEo80w9QWB/EV13lyx2Oa/5SHzBXYAVZ9phQiHbLUWWCT5Gh6z9H
         AtVg==
X-Gm-Message-State: AC+VfDwWAzpu/0XK9kdqrUMMZB3Ljl25tqW2g1OWR8Y78lzQ5yEHewe0
        Wucxydj9jEjd4jNz4g+YU3kFKA==
X-Google-Smtp-Source: ACHHUZ6vvPIyv/g8B5tecu9r7NgX/Jpujj6sBadbgOknEsVGEL71WM3NRbfptKFrNrtPGiKod+BZYQ==
X-Received: by 2002:a05:6a20:3ca6:b0:ef:a31b:af90 with SMTP id b38-20020a056a203ca600b000efa31baf90mr7027045pzj.28.1682695324579;
        Fri, 28 Apr 2023 08:22:04 -0700 (PDT)
Received: from localhost ([135.180.227.0])
        by smtp.gmail.com with ESMTPSA id y9-20020a63e249000000b0051b36aee4f6sm13346594pgj.83.2023.04.28.08.22.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Apr 2023 08:22:04 -0700 (PDT)
Subject: [PATCH 1/2] media: nxp: imx8-isi: Fix unusued function warnings
Date:   Fri, 28 Apr 2023 08:21:55 -0700
Message-Id: <20230428152156.22840-2-palmer@rivosinc.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230428152156.22840-1-palmer@rivosinc.com>
References: <20230428152156.22840-1-palmer@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc:     laurent.pinchart@ideasonboard.com, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        linux-imx@nxp.com, linux-media@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux@rivosinc.com, Palmer Dabbelt <palmer@rivosinc.com>
From:   Palmer Dabbelt <palmer@rivosinc.com>
To:     mchehab@kernel.org
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Palmer Dabbelt <palmer@rivosinc.com>

I just stumbled into these when trying to test against Linus' master.

Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
index 238521622b75..01a24ee8b5a1 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
@@ -311,7 +311,7 @@ static const struct mxc_isi_plat_data mxc_imx8mp_data = {
  * Power management
  */
 
-static int mxc_isi_pm_suspend(struct device *dev)
+static int __maybe_unused mxc_isi_pm_suspend(struct device *dev)
 {
 	struct mxc_isi_dev *isi = dev_get_drvdata(dev);
 	unsigned int i;
@@ -325,7 +325,7 @@ static int mxc_isi_pm_suspend(struct device *dev)
 	return pm_runtime_force_suspend(dev);
 }
 
-static int mxc_isi_pm_resume(struct device *dev)
+static int __maybe_unused mxc_isi_pm_resume(struct device *dev)
 {
 	struct mxc_isi_dev *isi = dev_get_drvdata(dev);
 	unsigned int i;
-- 
2.40.0

