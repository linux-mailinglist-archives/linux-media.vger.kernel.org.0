Return-Path: <linux-media+bounces-63327-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qKumBXvwHWotgAkAu9opvQ
	(envelope-from <linux-media+bounces-63327-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 01 Jun 2026 22:50:03 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A7EA6255B1
	for <lists+linux-media@lfdr.de>; Mon, 01 Jun 2026 22:50:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0084F3031AD4
	for <lists+linux-media@lfdr.de>; Mon,  1 Jun 2026 20:49:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C855D3ED13F;
	Mon,  1 Jun 2026 20:49:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pinefeat.co.uk header.i=@pinefeat.co.uk header.b="poy0jId5"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EDFD3E171A
	for <linux-media@vger.kernel.org>; Mon,  1 Jun 2026 20:49:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780346949; cv=none; b=TBmNMa9HOHoi0iWDJcEar8CTiLCqwRJqpMelvoPsXU8fXzXpcdvkVSnhH25BZOARhQppamBFVlIuts5nt0CregwKmIjliZXBVk59iazOOCg07fCRLtKcN3OlBxQrbWTs16QG+CFYkiZypP8rqeL571UbHtXUWpLbxJz5djxu6bs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780346949; c=relaxed/simple;
	bh=2NdXQyf2lc9XJgdc/KUyq7NFd1R/OI3Y1Q8DKBtBWj4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=PehwgzgBnoc7QLD59612hJoXxqfRmvF5EP2sk0owj0XCU4zuQokVWIDxTrsrbX/8NSRn8nht4z4msZkcnrmtu3vwOhcA/4aaACX1NZm0IKVYLBp/8U21K4/PggD7RwVQTzJDjgDcWgat3wzQdEniDKF76ZlL6dMeaQdB4QpTgf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pinefeat.co.uk; spf=pass smtp.mailfrom=pinefeat.co.uk; dkim=pass (2048-bit key) header.d=pinefeat.co.uk header.i=@pinefeat.co.uk header.b=poy0jId5; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pinefeat.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pinefeat.co.uk
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-49050ff7cbdso96749345e9.2
        for <linux-media@vger.kernel.org>; Mon, 01 Jun 2026 13:49:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pinefeat.co.uk; s=google; t=1780346946; x=1780951746; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HO3wl142riasjJepHp4iBoN8QUkvS1GbNX0jwvu13jo=;
        b=poy0jId5zYd2d/AuIiOAv+HxRQrKcOpUL6wy2h6IfVg/EtWxcjGeLz61R8NVWySsIn
         qMp3d+EJoWXG2vujg2bCu2Xbhp9b+1v4EiWIGR7W+/6+mpntK26KqSnrKQB3HARRtP48
         7b+nqQ1f+k9fWauoO50eCAUPYNluRaEKsKJNwca4XjJ6a3PAaHTU7c8DNZilgtig1Qfd
         seRzbdZtLThmhRRci0GzkEJMwv/diTuJksJ+hwA5ekZjOhp//dBYxzMZcyBXS8+o5Y30
         irgrRhOspUgI/krlCD2rkIIeKmed1u5vAK3Yf1/Tb67m6QKifaWK8r8w3VFEmmeksYFo
         azsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780346946; x=1780951746;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HO3wl142riasjJepHp4iBoN8QUkvS1GbNX0jwvu13jo=;
        b=niKwpUJ/AdP8FrnzjbbUJllpGRKFxW1GzWSwqKFshtLqYhR794KTYkSL9pYnggsbdH
         AZ9MDSDkGfaIzJlT5vYYYKchI+NVCTCJMpisGvtMqG8+oNMZRdfReAN2THEq46KDhX+a
         gKITluz9UWXNz03Mdcg5UWU+Jo+yoN2KqbDXvD0iFyrPMLqll614ygYsC4SQeI2//qEc
         luYWF0tinVfytyXVy2SA55rl1Gk1gxebsjmWPJTR8u8j2SrpdxtJ+iPw3piLmzOgk3kb
         w+mbbF+3xuVFQOUBdfh+L2eLUVJmo58bBsv6vgAroMLuxNB4arY6ksV6e3iVQTThx6xM
         9XMg==
X-Forwarded-Encrypted: i=1; AFNElJ9dTnmaNv9l5qz2fKe6U0RniFxcGth7HNDVCbm0BRw0oC5NS30izjaIq71y8E82crh4gwwB/4ms0bMuUw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwybXCRDBtx/aQe2En9IyLWlkymEcxIJwwuPOSmvCw9qKJb3lVs
	i8t+fsPkWZy5LphOx7mKqSJ3Nly1FudDEW1ZTXsOMwsrJPVfx5PTWaiJ2+QvRd37Lfc=
X-Gm-Gg: Acq92OH6hpZDc4KRl6T+LvoPj0hes5y/XCP7Q4jz7VRDm1LIz+8QPpFQ904iWZ7ygr6
	UJkd52l5vQ4pnffzQivRzG9ONcUJW2q8rjcqEm+JSNA/hEq6ockxlqVsX7me+C7fE7KbbJgOPvI
	2ISC2p3KgPtqTWMvc6PeEVsxkfSB4xAsO6UulzqlPCBCbMGSU0lv2eZnGubQg1uU9Hz7XMN8uX2
	jtqaF1n/fXgYdbITlf4P3pDEvSKJY1xjSGnxDtU0aVmjhjqndt5dqJUlywk5T01ZGilZkhn2bky
	KUPwIPi0csDPnodF1jKEEDpagGWXAXlv1uDpHyZGv+Vfv4RzZfnWNGcxnxDh+iHgH38mBaFSorJ
	hzczDa06wbGcHOGGliAI4gSqmyYFb6f+6NMPRyqPdRktI9j/OmHuTr8wnyul15aEDFMr9rpyzkK
	emMR46RB0//mBNAfRi8WnohVAYsKn1Rk/heND9fDgKmzH8/eZ1F6Kj
X-Received: by 2002:a05:600c:190d:b0:490:abef:dae6 with SMTP id 5b1f17b1804b1-490abefdbacmr80856025e9.19.1780346945632;
        Mon, 01 Jun 2026 13:49:05 -0700 (PDT)
Received: from asmirnov-G751JM.Home ([2a02:c7c:b28c:1f00:93e4:a0af:c443:477e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b0e76153sm16493715e9.11.2026.06.01.13.49.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 13:49:05 -0700 (PDT)
From: Aliaksandr Smirnou <asmirnou@pinefeat.co.uk>
To: Alen Karnil <alen.karnil@ideasonboard.com>
Cc: Aliaksandr Smirnou <asmirnou@pinefeat.co.uk>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Aliaksandr Smirnou <support@pinefeat.co.uk>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
	"Kael D'Alcamo" <dev@kael-k.io>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	linux-media@vger.kernel.org (open list:PINEFEAT CEF168 LENS DRIVER),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v7 1/2] dt-bindings: Pinefeat cef168 lens control board
Date: Mon,  1 Jun 2026 21:48:13 +0100
Message-Id: <20260601204814.19148-2-asmirnou@pinefeat.co.uk>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260601204814.19148-1-asmirnou@pinefeat.co.uk>
References: <20260601204814.19148-1-asmirnou@pinefeat.co.uk>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[pinefeat.co.uk:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	TAGGED_FROM(0.00)[bounces-63327-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[pinefeat.co.uk];
	DKIM_TRACE(0.00)[pinefeat.co.uk:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[asmirnou@pinefeat.co.uk,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media,dt];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,microchip.com:email]
X-Rspamd-Queue-Id: 6A7EA6255B1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add the Device Tree schema and examples for the Pinefeat cef168 lens
control board. This board interfaces Canon EF & EF-S lenses with
non-Canon camera bodies, enabling electronic control of focus and
aperture via V4L2.

Power supply is derived from fixed supplies via connector or GPIO
header. Therefore, the driver does not manage any regulator, so
representing any supply in the binding is redundant.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Aliaksandr Smirnou <asmirnou@pinefeat.co.uk>
---
 .../bindings/media/i2c/pinefeat,cef168.yaml   | 47 +++++++++++++++++++
 .../devicetree/bindings/vendor-prefixes.yaml  |  2 +
 MAINTAINERS                                   |  6 +++
 3 files changed, 55 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/pinefeat,cef168.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/pinefeat,cef168.yaml b/Documentation/devicetree/bindings/media/i2c/pinefeat,cef168.yaml
new file mode 100644
index 000000000000..1295b1f4edeb
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/pinefeat,cef168.yaml
@@ -0,0 +1,47 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright (c) 2025 Pinefeat LLP
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/pinefeat,cef168.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Pinefeat cef168 lens driver
+
+maintainers:
+  - Aliaksandr Smirnou <support@pinefeat.co.uk>
+
+description: |
+  Pinefeat produces an adapter designed to interface between
+  Canon EF & EF-S lenses and non-Canon camera bodies, incorporating
+  features for electronic focus and aperture adjustment. The cef168
+  circuit board, included with the adapter, provides a software
+  programming interface that allows control of lens focus and
+  aperture positions.
+
+properties:
+  compatible:
+    enum:
+      - pinefeat,cef168
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        camera-lens@d {
+            compatible = "pinefeat,cef168";
+            reg = <0x0d>;
+        };
+    };
+
+...
diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 28784d66ae7b..4e5307a9c5c4 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1289,6 +1289,8 @@ patternProperties:
     description: Picochip Ltd
   "^pine64,.*":
     description: Pine64
+  "^pinefeat,.*":
+    description: Pinefeat LLP
   "^pineriver,.*":
     description: Shenzhen PineRiver Designs Co., Ltd.
   "^pixcir,.*":
diff --git a/MAINTAINERS b/MAINTAINERS
index 9ec290e38b44..06668674e167 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -21146,6 +21146,12 @@ S:	Supported
 F:	Documentation/devicetree/bindings/input/pine64,pinephone-keyboard.yaml
 F:	drivers/input/keyboard/pinephone-keyboard.c
 
+PINEFEAT CEF168 LENS DRIVER
+M:	Aliaksandr Smirnou <support@pinefeat.co.uk>
+L:	linux-media@vger.kernel.org
+S:	Supported
+F:	Documentation/devicetree/bindings/media/i2c/pinefeat,cef168.yaml
+
 PLANTOWER PMS7003 AIR POLLUTION SENSOR DRIVER
 M:	Tomasz Duszynski <tduszyns@gmail.com>
 S:	Maintained
-- 
2.34.1


