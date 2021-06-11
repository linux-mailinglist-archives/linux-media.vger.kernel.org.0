Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 716CA3A4B54
	for <lists+linux-media@lfdr.de>; Sat, 12 Jun 2021 01:43:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230380AbhFKXpI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 11 Jun 2021 19:45:08 -0400
Received: from mail-lf1-f49.google.com ([209.85.167.49]:34452 "EHLO
        mail-lf1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230349AbhFKXpH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 11 Jun 2021 19:45:07 -0400
Received: by mail-lf1-f49.google.com with SMTP id f30so10962944lfj.1;
        Fri, 11 Jun 2021 16:43:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Vw+MJMCk1jvVznn1bkcb+1btNeiCegoCcjrwneORPn4=;
        b=nswv/6Od8pYV0DsvhYiMUEaJPp0AH1JzRT1nil1Wi8VvYdLZKkcIpVhxsw6LBVNPp2
         HF9FNiszxO9OZuRvYZ4AYxc8DTI29o1gFmibh5rDaTSZGGWdukjqrByCkwFaR9j2lhJB
         qSWTcFCsaG1nMwksvx8I+ox9bOOtDKnL+j7HFLwTwUXVCNpuWYQimcGQMb/xT7+jjrbe
         KqD/BQlvbaQKIdeKsZuSAoEAjiegVthqeqm523TOz5pksIHZMHNgW9oPj7ckkOIH2sU+
         AY8daE1CarjRwIGIc/URJDWEedZ49J8+66C+5LaTFIjAz46mdVLvKcRVEqDDM+44yTnD
         2PQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Vw+MJMCk1jvVznn1bkcb+1btNeiCegoCcjrwneORPn4=;
        b=r/3Jcu6IVLxmVBo5wzYvgHmZSt2I4+bSKkSr+GUBHi/3N7+yFm1CG2RZAAj39SK3G9
         lYcRqfx/aHAelymtVZR6HDhF53rcIryw7YrNtYHfO3EltIkk1SgVRJgNOJt8nSuelXGT
         1Jz6btHh2dZL9eHKSEoq0CJhFgesjjsFwAfuy+ah/qwocQcC3NzG1+8hjiQMda1vjUgZ
         xdY4TARcNsUp+X6fw/Y0FuHqWoA2THQ4km2usXbBSD5Or3UZIOnqvHMc7GHf2FzQZint
         Q+6Gv+//HPED/JvSOMyk+5nbGe9Hq0yazFvJeqq80MOi7pR4SYgfgl1f4r0R+VghC590
         vhCQ==
X-Gm-Message-State: AOAM533FFV9rvEGihFzCUusvULR8zomP88BtJaW2liq6F3mhgUrbmwRA
        BPXk5i6cLO2ybT7Z8rufmfY=
X-Google-Smtp-Source: ABdhPJwOlIahKWZ2Fur9W+yJYlZjD9gGe8qx8jU5PX+Yu+zdSgtvBdTq9FTbytMqqCIAfVF+h4HNzw==
X-Received: by 2002:a19:7410:: with SMTP id v16mr3989980lfe.189.1623454928069;
        Fri, 11 Jun 2021 16:42:08 -0700 (PDT)
Received: from localhost.localdomain (h-98-128-228-193.NA.cust.bahnhof.se. [98.128.228.193])
        by smtp.gmail.com with ESMTPSA id b23sm972246ljk.18.2021.06.11.16.42.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jun 2021 16:42:07 -0700 (PDT)
From:   Rikard Falkeborn <rikard.falkeborn@gmail.com>
To:     Mirela Rabulea <mirela.rabulea@nxp.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>
Cc:     NXP Linux Team <linux-imx@nxp.com>,
        Fabio Estevam <festevam@gmail.com>,
        linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Rikard Falkeborn <rikard.falkeborn@gmail.com>
Subject: [PATCH 1/2] media: imx-jpeg: Constify static struct v4l2_m2m_ops
Date:   Sat, 12 Jun 2021 01:42:00 +0200
Message-Id: <20210611234201.64832-2-rikard.falkeborn@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210611234201.64832-1-rikard.falkeborn@gmail.com>
References: <20210611234201.64832-1-rikard.falkeborn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The only usage of mxc_jpeg_m2m_ops is to pass its address to
v4l2_m2m_init() which takes a pointer to const struct v4l2_m2m_ops. Make
it const to allow the compiler to put it in read-only memory.

Signed-off-by: Rikard Falkeborn <rikard.falkeborn@gmail.com>
---
 drivers/media/platform/imx-jpeg/mxc-jpeg.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/imx-jpeg/mxc-jpeg.c b/drivers/media/platform/imx-jpeg/mxc-jpeg.c
index 03b9264af068..3a49007e1264 100644
--- a/drivers/media/platform/imx-jpeg/mxc-jpeg.c
+++ b/drivers/media/platform/imx-jpeg/mxc-jpeg.c
@@ -1890,7 +1890,7 @@ static const struct v4l2_file_operations mxc_jpeg_fops = {
 	.mmap		= v4l2_m2m_fop_mmap,
 };
 
-static struct v4l2_m2m_ops mxc_jpeg_m2m_ops = {
+static const struct v4l2_m2m_ops mxc_jpeg_m2m_ops = {
 	.device_run	= mxc_jpeg_device_run,
 };
 
-- 
2.32.0

