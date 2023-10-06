Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3147E7BB29E
	for <lists+linux-media@lfdr.de>; Fri,  6 Oct 2023 09:47:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230327AbjJFHrN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 6 Oct 2023 03:47:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230335AbjJFHrL (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 6 Oct 2023 03:47:11 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15CB9EA
        for <linux-media@vger.kernel.org>; Fri,  6 Oct 2023 00:47:11 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-503f39d3236so2264936e87.0
        for <linux-media@vger.kernel.org>; Fri, 06 Oct 2023 00:47:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696578429; x=1697183229; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=K20DvfF1G3+DE1e2pKo6QyYsPpd+O8yAeixtZ1Wfa7Q=;
        b=NhHFeBuEvdL3Vjhq1TTFSw7mcCW+TXzTVMMsv2FdRIrFKR0AAsKYspvPD9CZMnsR1+
         jy//Bu0WI9A/GfFqBCs6gg6DjCBLJF2jJfOhXFMHh1O+tGUCuni30wR/NZuEHvQXWaQn
         eMQzANuAAlnPIrEGqrW/zeuwkLJJSpUA+cIvNpXyjf2RFmAoBaT4cZLRVAgcfynrjAwp
         aqLint+D/aa7DlkFW2GapO2umkkcyCF0dtVQ84zSrYZHpLQDGK8zwv1MtVOjtCTt+DKe
         dEEAhCXaTd63Uw8wpwhN89vmp5eGK21sWw5nEIbQQcfLhPg19CY5j10SxAEqAQGN9CI5
         iAbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696578429; x=1697183229;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K20DvfF1G3+DE1e2pKo6QyYsPpd+O8yAeixtZ1Wfa7Q=;
        b=A39MiMIzkiDvXzcRvf+jHCQOACXNbjHloUQrBwAYXY03SAqSqAiD9xNTzGfib2/ubz
         iBH3yA1kjAMxTXI5X20Z7bXC0Dx1yan8P2578F96wjQxCT/SZpBGYIkD8qPr4rTf34S0
         bB5hjkxRUtAI75+cWPS5eFC1UPVZ53JmhrfGNJPp4JO3otPgt05xE+kHRclyLWBm8y2a
         4QkqFeg0YU6cYYA93nsgvjMl3lCjOAx3ij07SIZoPno3uwPEUluqewvIKKJwECV/5I0y
         VJHvD9UexQXCkuXnm4aMgvytrznR2xn/tLHw/uzmVlY/2u8KNWVIf1hLq77JB5FP+lV7
         Trbw==
X-Gm-Message-State: AOJu0YyqIMRhpjagKISo028SG1DZ9fV/uAwl7UYJpZDU2HgecfSJMbZ/
        XxDTuqwPklq0pkP1EHI222dWQcnXENtpwA==
X-Google-Smtp-Source: AGHT+IHms/UFSmLatDkW6FlhSCyxdZNBxpSOqJHCiwIXTyZe0W5OjkV7ytApy2Y6MqmaYa8cO64V/w==
X-Received: by 2002:a05:6512:282:b0:502:cc8d:f20a with SMTP id j2-20020a056512028200b00502cc8df20amr6951851lfp.27.1696578428667;
        Fri, 06 Oct 2023 00:47:08 -0700 (PDT)
Received: from localhost.localdomain ([188.243.23.53])
        by smtp.gmail.com with ESMTPSA id c28-20020ac244bc000000b005046bf37bebsm204789lfm.57.2023.10.06.00.47.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Oct 2023 00:47:08 -0700 (PDT)
From:   Alexander Shiyan <eagle.alexander923@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Martin Kepplinger <martink@posteo.de>,
        Alexander Shiyan <eagle.alexander923@gmail.com>
Subject: [PATCH] media: imx: imx-mipi-csis: Fix null pointer dereference when link is not set
Date:   Fri,  6 Oct 2023 10:46:54 +0300
Message-Id: <20231006074654.11468-1-eagle.alexander923@gmail.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Let's add a check for src_sd before using it.
The link may not be set, in which case the call to this function will fail.

Signed-off-by: Alexander Shiyan <eagle.alexander923@gmail.com>
---
 drivers/media/platform/nxp/imx-mipi-csis.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers/media/platform/nxp/imx-mipi-csis.c
index 5f93712bf485..df5a159b2d39 100644
--- a/drivers/media/platform/nxp/imx-mipi-csis.c
+++ b/drivers/media/platform/nxp/imx-mipi-csis.c
@@ -595,6 +595,9 @@ static int mipi_csis_calculate_params(struct mipi_csis_device *csis,
 	s64 link_freq;
 	u32 lane_rate;
 
+	if (!csis->src_sd)
+		return -EINVAL;
+
 	/* Calculate the line rate from the pixel rate. */
 	link_freq = v4l2_get_link_freq(csis->src_sd->ctrl_handler,
 				       csis_fmt->width,
-- 
2.39.1

