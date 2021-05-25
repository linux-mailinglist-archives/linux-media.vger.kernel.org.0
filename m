Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 73A12390532
	for <lists+linux-media@lfdr.de>; Tue, 25 May 2021 17:22:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232215AbhEYPYZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 25 May 2021 11:24:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59692 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231365AbhEYPYY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 May 2021 11:24:24 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A18D9C061574;
        Tue, 25 May 2021 08:22:53 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id lz27so47955918ejb.11;
        Tue, 25 May 2021 08:22:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZLkyDyqWj1CZiuS0iYizljfWHH1n3/to3p6LvPj6158=;
        b=jw7y4JYPCW8W44lrRsqYaEQnU5CeQlrs+LImSYZnPS5yhxAuFDdy+siVIp7F3Frdnz
         ka66/Zqdm+626O2jPve1O1Y0jlu+siGG7E3mckiLIXAbUdRtZbPjjqZ1G75MkybmazY1
         rP24AQIJxWx2c/4sUeFtX9jK+4bbYzxIeZhMyjCjMjcudjGCGcohjCCvWQvu1ZAvToVP
         QpOAbuV+lRgu9lyxRgTVBePi6Q0QzxM5XNCaxmSDOgm7Yet77o9/nHlAgWy1bcBc6CNA
         +5uLy4icLvrerIvsk/3f+ZdHPJBjWZJmC1lKj+hwsV9nlbWjRxT/JxNy856e5apEvgcV
         atpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZLkyDyqWj1CZiuS0iYizljfWHH1n3/to3p6LvPj6158=;
        b=mALO6RWdDFscXHDC9zedEgQFGu1oUyt72WLovMV6hvzZt2c8F+McWsCz3AyC2flVy6
         19l4kutyWcSrKoluhidn3kaia4mSQczrcDNtvv2cy53O4wnmSEGSUfV5EWmLOg8I4D3u
         7A8pIZk6DBmaxiumw+PqBny5S6b3OxzqZp9o3EabNjQvPAlwr/0I8leCGKZohAMjtLDu
         xSFWjuqVVkaDvy4js40SoCzkYptC97Md7ojyFuolDzWsgUBiS5beWr99qgJcAdBdCG6V
         ZPXPBm6wp0dBP+Lh3/h0rlxNSnLNPengo81SwuK23fxYiEN2xGrttAdVZr1gS0wg+9m+
         yQOQ==
X-Gm-Message-State: AOAM533S/TixvzPNU+RwsYmCEiN4N2IMbCIO5RdknevkcvoWI8OGXBx4
        11j8FjbHy/YMS6jcBgaeOg==
X-Google-Smtp-Source: ABdhPJwzCu+InKX5nF/IaZU2v8nNyrs5B4uj83Sq8mWbpWSrBmmQZ1nLC3SWyNJew3TsZfv2s4xGAA==
X-Received: by 2002:a17:907:927:: with SMTP id au7mr30004348ejc.267.1621956172296;
        Tue, 25 May 2021 08:22:52 -0700 (PDT)
Received: from localhost.localdomain ([2a02:810b:f40:e00:b55:da44:4fe2:2760])
        by smtp.googlemail.com with ESMTPSA id e23sm11212945eds.2.2021.05.25.08.22.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 May 2021 08:22:52 -0700 (PDT)
From:   Alex Bee <knaerzche@gmail.com>
To:     Ezequiel Garcia <ezequiel@collabora.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Heiko Stuebner <heiko@sntech.de>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Lee Jones <lee.jones@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        devicetree@vger.kernel.org
Cc:     Alex Bee <knaerzche@gmail.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-staging@lists.linux.dev
Subject: [PATCH 03/10] dt-bindings: mfd: syscon: add Rockchip RK3036/RK3228 qos compatibles
Date:   Tue, 25 May 2021 17:22:18 +0200
Message-Id: <20210525152225.154302-4-knaerzche@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210525152225.154302-1-knaerzche@gmail.com>
References: <20210525152225.154302-1-knaerzche@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Checked with:
make ARCH=arm dtbs_check
DT_SCHEMA_FILES=Documentation/devicetree/bindings/mfd/syscon.yaml

Signed-off-by: Alex Bee <knaerzche@gmail.com>
---
 Documentation/devicetree/bindings/mfd/syscon.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/syscon.yaml b/Documentation/devicetree/bindings/mfd/syscon.yaml
index f14ae6da0068..ad1121620e15 100644
--- a/Documentation/devicetree/bindings/mfd/syscon.yaml
+++ b/Documentation/devicetree/bindings/mfd/syscon.yaml
@@ -45,7 +45,9 @@ properties:
               - microchip,sparx5-cpu-syscon
               - mstar,msc313-pmsleep
               - rockchip,px30-qos
+              - rockchip,rk3036-qos
               - rockchip,rk3066-qos
+              - rockchip,rk3228-qos
               - rockchip,rk3288-qos
               - rockchip,rk3399-qos
               - samsung,exynos3-sysreg
-- 
2.27.0

