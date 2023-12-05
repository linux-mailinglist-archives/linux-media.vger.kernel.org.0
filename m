Return-Path: <linux-media+bounces-1643-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C0EF9804CEB
	for <lists+linux-media@lfdr.de>; Tue,  5 Dec 2023 09:48:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 42A9AB20CE8
	for <lists+linux-media@lfdr.de>; Tue,  5 Dec 2023 08:48:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74A653C689;
	Tue,  5 Dec 2023 08:48:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="U9l3dYf1"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA3611B6
	for <linux-media@vger.kernel.org>; Tue,  5 Dec 2023 00:48:40 -0800 (PST)
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-33318b866a0so5021362f8f.3
        for <linux-media@vger.kernel.org>; Tue, 05 Dec 2023 00:48:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701766119; x=1702370919; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GBBOhYI+d0VUyAPFbgIHeqblC7WS3xrkGn9mj7w3QOg=;
        b=U9l3dYf1oUkyYmhOTn4MwC/K+DNjGt62rYE2zROPX1TWFayRR9bEPsD8mW2alPsucI
         O1o+Ff6NWudOER5S2A4P0C3gx5ylDNuUdOrWjI1UuSsKZp9uC4H8C8AamHP5tqar9iqL
         mWdRcV4jNfTLBMZEhinV9kfrwG40qK7gQbtqlBrXRRdIfGG63ZKKPjvUX0yCtN3ma4Ka
         wZYHWHUgwTK9qlgIWfLGQpdjuzyN4FrRkNOlLRSJxV0xs42onYBgRY8wPB/w9tjxVJBg
         Xu7r0lGY0LqxVy6v3VR5TcKOskM34tl57zeNSyx8XvXSQHGRhGHvyb07Xzth3CnD8cvs
         NG7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701766119; x=1702370919;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GBBOhYI+d0VUyAPFbgIHeqblC7WS3xrkGn9mj7w3QOg=;
        b=fUzJVfrrMUEINagLDnizU/EhJUI5loetJTKQw2+S/OHTphqRtKGGc3J87hSVJ01zRX
         7BUVojL+jlDfrdDYlBNl7BisWrmOjIZzMsZY0Nvhxvi27EgFD1720oOc5MNHEntOZVTg
         LLBl6qtvbM93XXv48VVkhqYpaNb9I/G7O2D1qx1sMk0O2Z5h3Lnxj75lf6MYF9KA1FIe
         riPw0wQeLTsG2wSzE5x/sqJ/BE3lMsVzbbPJv/TS2/r8JLkyB3mHaE7yulvsSKPZwoXt
         33wK+QvfDxRHYxeaiLcbbHRCKQLZhsZQwTjMLerdU1UDwU0LcELNY56x9fl1p+tSPYMH
         dwgw==
X-Gm-Message-State: AOJu0YwakKnTBlukHOgJqWd58ARhI2j4uKbWsjTfeJP8ed15ZANQmpZ1
	f33/EsPADKCyTt+fqQZrh2jOxw==
X-Google-Smtp-Source: AGHT+IHdv7OQKiElGBn2/aqaAgE1wrKCNJvIOE4NT14r/t7kzAW4r8cfctQZQsNB8qK+z+rp6/kZQA==
X-Received: by 2002:a5d:5406:0:b0:333:3af7:a4ef with SMTP id g6-20020a5d5406000000b003333af7a4efmr2188899wrv.8.1701766119013;
        Tue, 05 Dec 2023 00:48:39 -0800 (PST)
Received: from krzk-bin.. ([178.197.218.27])
        by smtp.gmail.com with ESMTPSA id x18-20020adfffd2000000b00332fd9b2b52sm8323097wrs.104.2023.12.05.00.48.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Dec 2023 00:48:38 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] media: dt-bindings: ov8856: add missing second link frequency in example
Date: Tue,  5 Dec 2023 09:48:35 +0100
Message-Id: <20231205084835.15871-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Bindings and Linux driver require two link frequencies, so correct the
example:

  ov8856.example.dtb: camera@10: port:endpoint:link-frequencies:0: [360000000] is too short

Fixes: 066a94e28a23 ("media: dt-bindings: media: Use graph and video-interfaces schemas")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/media/i2c/ov8856.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/ov8856.yaml b/Documentation/devicetree/bindings/media/i2c/ov8856.yaml
index 57f5e48fd8e0..bd1a55d767e7 100644
--- a/Documentation/devicetree/bindings/media/i2c/ov8856.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/ov8856.yaml
@@ -126,7 +126,7 @@ examples:
                 wcam_out: endpoint {
                     remote-endpoint = <&mipi_in_wcam>;
                     data-lanes = <1 2 3 4>;
-                    link-frequencies = /bits/ 64 <360000000>;
+                    link-frequencies = /bits/ 64 <360000000 180000000>;
                 };
             };
         };
-- 
2.34.1


