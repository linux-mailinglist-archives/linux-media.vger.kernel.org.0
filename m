Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CFBE01A3807
	for <lists+linux-media@lfdr.de>; Thu,  9 Apr 2020 18:29:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726964AbgDIQ30 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 9 Apr 2020 12:29:26 -0400
Received: from mail-qk1-f171.google.com ([209.85.222.171]:39244 "EHLO
        mail-qk1-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726706AbgDIQ30 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 9 Apr 2020 12:29:26 -0400
Received: by mail-qk1-f171.google.com with SMTP id b62so4570553qkf.6
        for <linux-media@vger.kernel.org>; Thu, 09 Apr 2020 09:29:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=8s2ERfHLg960xclFm8h70FIDF2UYHX/AGMAOPHRNwaU=;
        b=a/acH/4e+7K7w9ktaCkPJkZr1X5xYvh3zLoe+pRkrwPdE42/ARLoZ8OqCVeqlU7R0Z
         B0luo4te4ObKwyAHmYJPiH19Sm/zwMuUR+1wrMPUiqPr5KIZpzSAi+ciADEMX4/AmeQx
         HIO4BC6vvJ1Egnf8CqsXGnfOtapsfLU4XNl0RINwP8jHTpahziLpIg7x894GFt7rALT0
         eQJ9ViPjp3mTEKNO5qHNcnNbzsA+Nw92QaCWSr5JleKaQRd8esaFEmzNZRs4zhpnF21H
         rXoy0cBUO6XodInqUELINhtF1UYeClDWZ1g7UYPG7PL4gtv3PmXm4K1gIiGkWc17S7jK
         7XsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=8s2ERfHLg960xclFm8h70FIDF2UYHX/AGMAOPHRNwaU=;
        b=hJAfs5Ktve/9mMg1w9lvwqmlTLBo/MELy1qSSpWJmxQ6bD/Fbjii99BwSHGoyifVkd
         FPFyvIJ/8F9OZCttwu26LY5W3+qHEjT1Y8R6S++1Ge2vqV5N60GlmGt3XUYWOVzCuhcG
         96W5Mh83G2mwuBYezUJShBO96WDOYUewJCZmsxxL0OW5QB3ZropeSOxYnoIrluR+vQQz
         m6wts3uVSoGJN038OQ/TET8qZERDJ6XaoiBFfh+hOGlbpLur01WQ6sG+NAmw5baBFE1E
         pbAFcAyG5fpZkFabXSGw3oPNETzlHuBMI5I6WrtHXqEd+dGzGKmVAx2YauvjQ36OA7jk
         LCDQ==
X-Gm-Message-State: AGi0PuZnve66cgOfeQQP6Y/ZpzTKVCIVVr1WynDE0bXMuByAIc5H8LP5
        jK6u4S7VtLKua+ig73NrEpU=
X-Google-Smtp-Source: APiQypKLMmDSOH5ddkSOPNbq6Rb7kb3V3JcD53aNurzC7sULVCQQoUViP4/fXXkkAc/DzGiiNwvubg==
X-Received: by 2002:a37:b17:: with SMTP id 23mr663826qkl.136.1586449764357;
        Thu, 09 Apr 2020 09:29:24 -0700 (PDT)
Received: from localhost.localdomain ([2804:14c:482:5bb::3])
        by smtp.gmail.com with ESMTPSA id x66sm16980587qka.121.2020.04.09.09.29.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2020 09:29:23 -0700 (PDT)
From:   Fabio Estevam <festevam@gmail.com>
To:     hverkuil-cisco@xs4all.nl
Cc:     slongerbeam@gmail.com, p.zabel@pengutronix.de,
        linux-media@vger.kernel.org, Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v2 3/4] media: imx.rst: Provide the OV560 module part number
Date:   Thu,  9 Apr 2020 13:29:44 -0300
Message-Id: <20200409162945.3559-3-festevam@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200409162945.3559-1-festevam@gmail.com>
References: <20200409162945.3559-1-festevam@gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

In order to improve the documentation, provide the OV5640 MIPI module
part number that is used on the imx6q-sabresd board.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
Reviewed-by: Steve Longerbeam <slongerbeam@gmail.com>
---
Changes since v1:
- None

 Documentation/media/v4l-drivers/imx.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/media/v4l-drivers/imx.rst b/Documentation/media/v4l-drivers/imx.rst
index fb6e01976254..955d27582e10 100644
--- a/Documentation/media/v4l-drivers/imx.rst
+++ b/Documentation/media/v4l-drivers/imx.rst
@@ -641,8 +641,8 @@ connects to i2c bus 1 and the OV5640 to i2c bus 2.
 The device tree for SabreSD includes OF graphs for both the parallel
 OV5642 and the MIPI CSI-2 OV5640, but as of this writing only the MIPI
 CSI-2 OV5640 has been tested, so the OV5642 node is currently disabled.
-The OV5640 module connects to MIPI connector J5 (sorry I don't have the
-compatible module part number or URL).
+The OV5640 module connects to MIPI connector J5. The NXP part number
+for the OV5640 module that connects to the SabreSD board is H120729.
 
 The following example configures unprocessed video capture pipeline to
 capture from the OV5640, transmitting on MIPI CSI-2 virtual channel 0:
-- 
2.17.1

