Return-Path: <linux-media+bounces-26471-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CEEFA3DC77
	for <lists+linux-media@lfdr.de>; Thu, 20 Feb 2025 15:21:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D557A17F57D
	for <lists+linux-media@lfdr.de>; Thu, 20 Feb 2025 14:19:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 769AF1FAC48;
	Thu, 20 Feb 2025 14:17:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kco0kcYn"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 189161FDE24;
	Thu, 20 Feb 2025 14:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740061070; cv=none; b=LtG7DWku7bJXcU46jjZ/T7c9iWKYrwI9gUBqI9Zu7/9EPERPH49PCYZc+WAENRmj8lIdQ348mjCg+CAuxfHdJ7OY/9p3a094tn8MJe/SHigr6fCz5WuNgA6fMpKT98ttrtB9sjBkWg+oDSrMt347f4HP0ZlYyZxl178yFyWbyQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740061070; c=relaxed/simple;
	bh=PZ1DnjTFl18o7jkWFg8lWtATbzYcZDhG5/KGRCkkiUU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FRtcX5CxxCd/POEoQgaVscKPAc6BrH0JPqnK5/YfMAMPO5OwoVifwtr8i9NaFzK2THxTySyVKItXtvqS6gfCyCrXs26HrD49R0+83MQZyUswPNmeeIHl+BWP6jrAiue56kNYsLeqj/EP9dZHX2Fu9QPr4J2GjjWgnRQCXr/1QUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kco0kcYn; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-abb8d63b447so136237666b.0;
        Thu, 20 Feb 2025 06:17:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740061067; x=1740665867; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NFOJHCDRxWmWioNC6N/UlZoweJhdV9qdoQg8e0aFcrs=;
        b=kco0kcYnVdZaI19p/wWJt4VKGOqhzb9ca4+IJhK1pYSUYp06popPPjk8FZlCpviSlA
         GihaNHU63bQisfq9VEMpKd9O4oySJ1Z4jbaa1LuWv0KaGQTJw7p69Ki02GhTVCaynmtd
         DwfJvO+6gClwfTCzwFTuy5oLn9esL++qYvAQQMH7nNo2I/suHjOttdblpLT70oCg8ggn
         jEt48qjqtYGbLBynNny+sKv/j3QIWKIoVWxOVUWtMq/W7Dk6XrEqPX8d863iG9+7A51y
         oANOmzFaEr7nbhlmV3WUt6qMm6owu+YtoogoYI/JxO1PrM65yEeXHbu3Vekb26Tltlem
         c0CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740061067; x=1740665867;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NFOJHCDRxWmWioNC6N/UlZoweJhdV9qdoQg8e0aFcrs=;
        b=YU1jwlWkXyxMVhFX40MHHoZ6uWwBIKDIaFtPKW//4/nOcmHmNJQGf+yCcgTXgFGTCh
         vm9jpmNl7X9xA4mTUAZKbp+9+5RMvhXZ+f9MZWRrk4nfl/chaHGLZZ7FiQj0ERrxJ7Ct
         chn4rXO8Jv9ZagWvhBAGBSIin++ygH6uWKu50kQFc5uS1Nj7i4IRFLU0f5HnlqhIzzvc
         onfu3Ay4hR3BjeHAQKomv4NTHGr1sxm5MfVNtTbXtjuTJ+6yFp142LiFRC7wI87t465Q
         B2y4JqT2ZRGQ8TmQcmsD3YixgqLguQEVn8/ESs5fGCVMIHP1slcxQ8Cpc5tmwYqWZcYK
         WsCw==
X-Forwarded-Encrypted: i=1; AJvYcCUUmBY5mC8bsH0Xso6z0BtReWq31hjL+wqyvneJSLS1nrumB6Vk37qr/XVVWkPZDWeN6TUvlKDUVIWMC1Y=@vger.kernel.org, AJvYcCUdfDj+fznhl47s8Dxfrb68iqc2A6Me4RQRgWZ+m+HzJ4MIbExBF7u7zBX9fmygvAyxlU7PIDAp/CuM@vger.kernel.org, AJvYcCUzqwzB/iX0+wR8nNG+1Xxsd3MkdQSsRPfcjEUn1ZDe/W5Ukos/DlWkrsZAk7LgDEVgSpfeS83JYesckhUN@vger.kernel.org
X-Gm-Message-State: AOJu0YygWRQ9khaTm4ZtCryHpTzW7CKWfWQBF9jZagdyDYz7dkeuS80P
	OrkH4KaNa9sw8wPuMW0fYKPSYkjReY3S4kbwB3/kO3aeLdH07pla
X-Gm-Gg: ASbGncveUoms2LM2Aj3GzzCx2b9jFeUd3JFhFpVPl4mpaE4Z/IWbl9zIaB33T92cd+a
	VwCXDV2dpDDRgpIl4F3EaqQkeyIZuuXCbKUJVakZmUKQvrdQnhrnV5h5F9NWmYuxwz7HmA4iX1Z
	+0Oc6b+0fHVZ06KXwB34tfus4xgYO+dMIjTJmJN7/l68vHmiQYUtP1Nw/1L+ZPa9PvGQQMyOKqM
	C4/Mvc+uZU1s8jiVGlCe+/uEm/C11hGetZF8ybxOn/W7Ec/xZuHAfFxE9MNyQcquiZEXPQlo/WS
	I4c/NO5pDj6nei+BRcR/7jBlc85k
X-Google-Smtp-Source: AGHT+IGbvT+ElwJFSjuG2SgiS1oHKWL2tTnh/dZxsOpA946XGKGKmXCEg6KymAHfaze7tPu7/efmcQ==
X-Received: by 2002:a17:906:dc90:b0:aba:cc21:8b3c with SMTP id a640c23a62f3a-abbcd0491demr861472966b.38.1740061067200;
        Thu, 20 Feb 2025 06:17:47 -0800 (PST)
Received: from demon-pc.localdomain ([188.27.130.21])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dece1b4f59sm12124224a12.6.2025.02.20.06.17.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 06:17:46 -0800 (PST)
From: Cosmin Tanislav <demonsingur@gmail.com>
To: 
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Cosmin Tanislav <demonsingur@gmail.com>
Subject: [PATCH 1/6] dt-bindings: media: video-interfaces: add support for Virtual Channel IDs
Date: Thu, 20 Feb 2025 16:17:23 +0200
Message-ID: <20250220141739.228714-2-demonsingur@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250220141739.228714-1-demonsingur@gmail.com>
References: <20250220141739.228714-1-demonsingur@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Multi-camera systems often have issues with receiving video streams
from multiple cameras at the same time because the cameras use the same
Virtual Channel IDs.

CSI bridges might not support remapping the Virtual Channel IDs, making
it impossible to receive the separate video streams at the same
time, while the CSI receiver is able to de-mux streams based on VC IDs.

Cameras sometimes have support for changing the VC IDs they output
themselves.

For a practical example, GMSL2 deserializer chips do not support VC ID
remapping in tunnel mode, and neither do the serializers. Allowing the
cameras to have their VC IDs configured would allow multi-camera setups
to use tunnel mode.

Add support for specifying these Virtual Channel IDs in Video Interface
Endpoints. The supported values are 0 to 3, with a maximum of 4 values.
Although the CSI-2 specification allows for up to 32 virtual channels,
most hardware doesn't support more than 4. This can be extended later
if need be.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
---
 .../devicetree/bindings/media/video-interfaces.yaml   | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/video-interfaces.yaml b/Documentation/devicetree/bindings/media/video-interfaces.yaml
index 038e85b45befa..414b5fa8f3472 100644
--- a/Documentation/devicetree/bindings/media/video-interfaces.yaml
+++ b/Documentation/devicetree/bindings/media/video-interfaces.yaml
@@ -231,6 +231,17 @@ properties:
       shall be interpreted as 0 (ABC). This property is valid for CSI-2 C-PHY
       busses only.
 
+  vc-ids:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    minItems: 1
+    maxItems: 4
+    items:
+      maximum: 3
+    description:
+      An array of Virtual Channel IDs. These are unsigned integers that specify
+      the VC IDs used by the device for its data streams. This property is valid
+      for MIPI CSI-2 only.
+
   strobe:
     $ref: /schemas/types.yaml#/definitions/uint32
     enum: [ 0, 1 ]
-- 
2.48.1


