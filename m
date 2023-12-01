Return-Path: <linux-media+bounces-1470-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 07964800B26
	for <lists+linux-media@lfdr.de>; Fri,  1 Dec 2023 13:39:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 378181C20FBB
	for <lists+linux-media@lfdr.de>; Fri,  1 Dec 2023 12:39:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B102025558;
	Fri,  1 Dec 2023 12:39:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cXIhISkY"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com [IPv6:2607:f8b0:4864:20::531])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59E77D67;
	Fri,  1 Dec 2023 04:39:42 -0800 (PST)
Received: by mail-pg1-x531.google.com with SMTP id 41be03b00d2f7-51f64817809so405482a12.1;
        Fri, 01 Dec 2023 04:39:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701434382; x=1702039182; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Vqdz1YfBNjc+eVrlN9o+0H4c20wVH3whTNBfac3uifs=;
        b=cXIhISkY+1So0AJN2P9hRaf6kWbda+n3bNhZ2fYsR0Sr0B2aug2MmeNE/LwJhzbH8T
         fSi0O8BKukFC8nNZhwqlRaVFfDg9WqZ4Rs/KY8ziGP7pSsBMgV4S02m/j7xVgjkE7XU2
         OsOCXRAJrMHVerCtRHcfFuBFp7yKjoPPBqPHPtYUHIt2OcF7VHegUPE/mi4HSF67Dj45
         j4MHZ9T85Fg2C19H2D3m6Vk6DD41mb93Qpa4eVRtvcJwyaajbjX3T9xTE8jL1W1qyfjS
         X1mCjpy3DIPRKDY7mykyEjhY7cjBUGAOYTF5yTrJwZvwlRVPwrMER4eTKXlUA82uCTkg
         RXJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701434382; x=1702039182;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Vqdz1YfBNjc+eVrlN9o+0H4c20wVH3whTNBfac3uifs=;
        b=ONmfh+oOe8Uun6Qi5Ec3kfqdbkpKvp4z4NMAfX9gDMKwUnhtEEV7FkKyQGUq5IWWze
         PiPJvK0mr1mMCCn+1e/vM07kW4uGCkUYb2aVQXm1MAdXsT05oAIZzBKayXIkojzj7SxL
         sfkpAYB1yNH6JXE+tAN0YGEo5N9fIrjjQq3puRjg94nZghMU80ZV4HodVdPHsBP4URUo
         YT4unbNoZf4oN6yMsW0LQkud5357C+/yF+xq8sQ076HkmzYDlQu+Tsb1vAA/BM59OpoA
         IxKuAxKR9/KDn1IB4sZ9jIOsAehjXYSCgQLc4Khhtf7oz6iXY2WjEKZuQr4xzi2wUBmD
         arDQ==
X-Gm-Message-State: AOJu0YzIFmhUjgyffSHGipz1VrTEuj6UvjU4BEIXxRPOidlWia4+k+k/
	A+g74W1vtTPQYw9kV5U4Eg0=
X-Google-Smtp-Source: AGHT+IEZ7W9IRYRll9h9uWqh5SBYAX/pBsQHL07rx8rNJF9nlyKVBicXRS2qfvHOD5ya0KhLo3JM0g==
X-Received: by 2002:a05:6a21:187:b0:18b:feaf:36da with SMTP id le7-20020a056a21018700b0018bfeaf36damr6383766pzb.2.1701434381651;
        Fri, 01 Dec 2023 04:39:41 -0800 (PST)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:12b3:b1c7:121e:c465])
        by smtp.gmail.com with ESMTPSA id gx21-20020a056a001e1500b006930db1e6cfsm2896155pfb.62.2023.12.01.04.39.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Dec 2023 04:39:41 -0800 (PST)
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
	xji@analogixsemi.com,
	Fabio Estevam <festevam@denx.de>
Subject: [PATCH v2 1/3] dt-bindings: drm/bridge: anx7625: Remove incorrect bus-type
Date: Fri,  1 Dec 2023 09:39:33 -0300
Message-Id: <20231201123935.1057929-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Fabio Estevam <festevam@denx.de>

bus-type = <7> is incorrect as this is a DSI endpoint, not a DPI
endpoint.

Reported-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Fabio Estevam <festevam@denx.de>
---
Changes since v1:
- Newly introduced.

 .../devicetree/bindings/display/bridge/analogix,anx7625.yaml     | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml b/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
index a1ed1004651b..f043d57dd25a 100644
--- a/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
@@ -157,7 +157,6 @@ examples:
                     reg = <0>;
                     anx7625_in: endpoint {
                         remote-endpoint = <&mipi_dsi>;
-                        bus-type = <7>;
                         data-lanes = <0 1 2 3>;
                     };
                 };
-- 
2.34.1


