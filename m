Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 44C66351C79
	for <lists+linux-media@lfdr.de>; Thu,  1 Apr 2021 20:46:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235595AbhDASRr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 1 Apr 2021 14:17:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234651AbhDASKo (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 1 Apr 2021 14:10:44 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5DC2BC0045E8;
        Thu,  1 Apr 2021 07:43:48 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id x21so2256460eds.4;
        Thu, 01 Apr 2021 07:43:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6B26f3IlajNfnhYcTkXd3V9kuoJqzsJf9D1voUcVJjo=;
        b=PQD/yD5wECUFHyUXqIIV6kgZEBoPNySiNLhipn5PaPgwdwqEZMV/JOvfNwzPouldSH
         yFOXRCAVF6syQpz1q+7SuyWq0t8aB+S2R6hVI6lPvSgIj0Vz9xLJhX9Np+Hd83JaFL1j
         sZc/f4pPcW6wIATINRATOVun4cyzKK6gw227gFRHkYanowJ3XWx3XF2pRq3aY/Wb2YkF
         uioaXeOOD+Ysm2m8u8tOPtHDwRtDggFO/wqsOfH8z4RJmtoBS0x3ClV5D2fZCan3rlYg
         iBqY65qefYhJQenmjxpCRpXrRRl6rN43jyjECL1ve0Fytry0wgQIkQ5x83nvxDtlSJET
         yuVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6B26f3IlajNfnhYcTkXd3V9kuoJqzsJf9D1voUcVJjo=;
        b=Nos1aeAh5dJrqZfXqezR5igY4Uz5NZizbKc9nq6xq7fqdF6mti5bi8dBC3n9k95+wc
         oHWohLnDvsBNSCp8F4OXoPnng+XaV/OlFYbtO747OFMaOnKDuXGhYJ4zj+TDk7liLaU7
         wDfRrxL80oG5JAr59u+JDdZpazhg4p+kw24OED7aCAQGhTlFYZSaL8V+7K6UbhBLQb7Q
         XSE+p+hoB2vj0z8+z1DnXsr6QczEw5rfSRdyuxEo3QLCmwt2WCDiLdjQ/eSjoYru1QcZ
         IgfybYPJHC8mmsGHN+McEqHVKYLxFhZQk+tGbBO5Pl//EyQw0lEjJulv1gsNSxLRB5mk
         AlCg==
X-Gm-Message-State: AOAM531WNKrx7FmyTHqqPyHGZ/feJYzZZIrlowv3BRyQxF4E1FDyDguP
        epH3gexFBXgjZZe4sVogAfc=
X-Google-Smtp-Source: ABdhPJys+1L+GR0Q8RJlO+aVJo1otlu7AICp0FPiPRQPvqFgdpuDu2gCuA6ngwmguDf6yWL4FXMWJg==
X-Received: by 2002:a05:6402:3550:: with SMTP id f16mr10175223edd.134.1617288227200;
        Thu, 01 Apr 2021 07:43:47 -0700 (PDT)
Received: from arch-x1c3.. (cpc92308-cmbg19-2-0-cust99.5-4.cable.virginm.net. [82.24.248.100])
        by smtp.gmail.com with ESMTPSA id nd36sm2854950ejc.21.2021.04.01.07.43.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Apr 2021 07:43:46 -0700 (PDT)
From:   Emil Velikov <emil.l.velikov@gmail.com>
To:     kernel@collabora.com, Ezequiel Garcia <ezequiel@collabora.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org
Cc:     emil.l.velikov@gmail.com
Subject: [PATCH v4 2/9] media: hantro: imx: reuse MB_DIM define
Date:   Thu,  1 Apr 2021 15:43:29 +0100
Message-Id: <20210401144336.2495479-3-emil.l.velikov@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210401144336.2495479-1-emil.l.velikov@gmail.com>
References: <20210401144336.2495479-1-emil.l.velikov@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Emil Velikov <emil.velikov@collabora.com>

Swap the hardcoded 16 with MB_DIM define.

Fixes: 8e4aaa687863 ("media: hantro: add initial i.MX8MQ support")
Acked-by: Nicolas Ferre <nicolas.ferre@microchip.com>
Reviewed-by: Ezequiel Garcia <ezequiel@collabora.com>
Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
Signed-off-by: Emil Velikov <emil.velikov@collabora.com>
---
 drivers/staging/media/hantro/imx8m_vpu_hw.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/hantro/imx8m_vpu_hw.c b/drivers/staging/media/hantro/imx8m_vpu_hw.c
index c222de075ef4..1f48c1956cd2 100644
--- a/drivers/staging/media/hantro/imx8m_vpu_hw.c
+++ b/drivers/staging/media/hantro/imx8m_vpu_hw.c
@@ -109,10 +109,10 @@ static const struct hantro_fmt imx8m_vpu_dec_fmts[] = {
 		.frmsize = {
 			.min_width = 48,
 			.max_width = 3840,
-			.step_width = 16,
+			.step_width = MB_DIM,
 			.min_height = 48,
 			.max_height = 2160,
-			.step_height = 16,
+			.step_height = MB_DIM,
 		},
 	},
 	{
-- 
2.31.1

