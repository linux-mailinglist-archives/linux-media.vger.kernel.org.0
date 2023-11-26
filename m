Return-Path: <linux-media+bounces-1038-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 121487F92BF
	for <lists+linux-media@lfdr.de>; Sun, 26 Nov 2023 13:53:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 439961C20964
	for <lists+linux-media@lfdr.de>; Sun, 26 Nov 2023 12:53:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C657D283;
	Sun, 26 Nov 2023 12:53:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E8E+6IRD"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65A26E5;
	Sun, 26 Nov 2023 04:53:35 -0800 (PST)
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-1cf88973da5so7580835ad.0;
        Sun, 26 Nov 2023 04:53:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701003215; x=1701608015; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aHs/ezw0Ly84u9q64DOYUfuCUEAWK3MbwxB/x63EELg=;
        b=E8E+6IRDcldGcJBT/42weRji81vcSG7itI4+bI9QWivse8qR7knRmgJgtGgHYjeT9Z
         agFmPbuoYbgZrvNs4Aoe8oxIWgaAYUh2CZIGoAZEVKQIiUY4deXg0NVL/v2snC527Ph1
         mSwegMKGBMWLYHCV+WbeBLt51Yz1HRIaOr6awTeqNoY+6bcVWwAvX+8s1SP7/xXx6YS8
         q5jBmpvZJqP+iGKEf4eifQzJXIUToy0dF99oP6WR7okIBy9OUtaQT+M7UX4HBUREvVNR
         BN9uW7o2XSJzLOZBPNROCor5uNJgwkIgDATfmGt2OCztWAPE889AyEb/hRpT7MqfMekp
         o3ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701003215; x=1701608015;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aHs/ezw0Ly84u9q64DOYUfuCUEAWK3MbwxB/x63EELg=;
        b=cuElXlLREuQRSzL8fYdzb7PeXWDn8ZhRD046hGb0avRdD7SNHLHVZFkh6FBTwabWJm
         69KgJNWq60Q38r0tTYnVzT97MG1HZUeO6rIMCc3HoysbtGMgMkyodWTcdkeobv58g/cZ
         Hr//OJvIGd9obNjeGFaSe4YHJg6AhkqPoABUCwRKx/n3JS3hnA/NtI6xx07FHTkwWEzm
         2f3+fswmbbO4hQtN/x15cIawuKg7Om5NMCumJUOJvzMmjEkqU7CCZy0rE/FC7Rj0cKax
         e5Ibqx3iBb7pFP4IS+ey9jNlFVsOZnM7YxwozTgPvpcvKYREwphAiD1gxEg/dzzicS5E
         fFEQ==
X-Gm-Message-State: AOJu0YwosEP6NJ6mSWt07A9ElZ9HYthCcj2Orl1jnyUj3kiaW7ogGn0j
	TR8n1gElYiEv0rRTg62PW3c=
X-Google-Smtp-Source: AGHT+IE+5zVPM8eDpWwMgK5uqH0bAsdymwRoGx/b9m2ctZ2AkU+0RfDrjJHUJFZwFXoe/JCEj1yP3A==
X-Received: by 2002:a05:6a00:2d24:b0:6cb:bc84:f932 with SMTP id fa36-20020a056a002d2400b006cbbc84f932mr11413073pfb.0.1701003214807;
        Sun, 26 Nov 2023 04:53:34 -0800 (PST)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:114f:aa2:522:14a4])
        by smtp.gmail.com with ESMTPSA id bh2-20020a056a02020200b0059d6f5196fasm5239847pgb.78.2023.11.26.04.53.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Nov 2023 04:53:34 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: sakari.ailus@linux.intel.com
Cc: rfoss@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	mchehab@kernel.org,
	laurent.pinchart@ideasonboard.com,
	devicetree@vger.kernel.org,
	linux-media@vger.kernel.org,
	Fabio Estevam <festevam@denx.de>
Subject: [PATCH 1/2] media: dt-bindings: media: Introduce MEDIA_BUS_TYPE_DPI
Date: Sun, 26 Nov 2023 09:53:19 -0300
Message-Id: <20231126125320.4024456-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Fabio Estevam <festevam@denx.de>

Commit 18860529a599 ("media: dt-bindings: media: video-interfaces: Add
new bus-type") introduced a new bus-type for DPI video bus.

Introduce MEDIA_BUS_TYPE_DPI into video-interfaces.h to complete
the list of video interfaces.

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
 include/dt-bindings/media/video-interfaces.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/media/video-interfaces.h b/include/dt-bindings/media/video-interfaces.h
index 68ac4e05e37f..0dace694a18f 100644
--- a/include/dt-bindings/media/video-interfaces.h
+++ b/include/dt-bindings/media/video-interfaces.h
@@ -12,5 +12,6 @@
 #define MEDIA_BUS_TYPE_CSI2_DPHY		4
 #define MEDIA_BUS_TYPE_PARALLEL			5
 #define MEDIA_BUS_TYPE_BT656			6
+#define MEDIA_BUS_TYPE_DPI			7
 
 #endif /* __DT_BINDINGS_MEDIA_VIDEO_INTERFACES_H__ */
-- 
2.34.1


