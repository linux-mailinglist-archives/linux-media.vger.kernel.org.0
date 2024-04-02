Return-Path: <linux-media+bounces-8432-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BC487895AE9
	for <lists+linux-media@lfdr.de>; Tue,  2 Apr 2024 19:41:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B4D791C21FCF
	for <lists+linux-media@lfdr.de>; Tue,  2 Apr 2024 17:41:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62BCA15AAC4;
	Tue,  2 Apr 2024 17:41:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PxEqlNYN"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5187815A4A7;
	Tue,  2 Apr 2024 17:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712079660; cv=none; b=EY6GaAmTQMZCEFvFbTElvkSB9rpPx0dTraRftoManPa2J55K3wHukzTIAxl+8B8O0R9aAsGki0OpJCXJYfMl5zlLNPS2FT2r0db80wBd1aQ1jdlppKGKXDFaOCdc9htNpqE8MeWYJHAYbgBZdWFEzv9Zu8+zM/cf6ZePfldCkSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712079660; c=relaxed/simple;
	bh=1rFdNZAPyiQd5YvYrgl+b//xP4F62hYfvSXdo2y3mSI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Ts84k0IyoA1A5rOm88zQPDa1CESaymEDjTnpUvTGrsfztzXiNNEmgS1FNULXnbpx+eO2lY18ekQXTPnkAaVu5u8mFuyMCXO9zIzJWuehgBdv6EuhPgwi71/n7rvfvbo5wJ2YyQTWgKOwjT3qt2p2ScEEIU8HkEr92fDMw+VjU/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PxEqlNYN; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-6e6c38be762so597586b3a.1;
        Tue, 02 Apr 2024 10:40:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712079658; x=1712684458; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zk3XKb0313XxlPGBiYPfDtWT1uFFIekVFB4cJRRrJmw=;
        b=PxEqlNYNy8k0FTuv9Yhpxx3xexKjUN2Qb6TporrlaGWy/uS8BJMbyhmMcHrn0lDFjX
         wIGUDEy2spbL1MAXqMjK9IAoLWTuccLGOHrke2Aai6A/KnrEOdFzKefA66MZ0HhPMCdv
         Adjj4Q9tIFtwOiZP1kWVAKbfGqlrqNLABvTt5WHHtdkWl5l2qVHuUCm/oN0zzosdjacy
         PbCQUTUEmRs4Xley1RcE8Fx4nZUKzuah5E7V5af82EL7v7XfjVs5rJQOxVi/MJMivBX6
         yLtg4rx4OMVmo8D/BmpEnlGaK8HwSQzqYc8fXg8CPKpMHfnTIX/67zigUUBdCo4rU+KV
         U1JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712079658; x=1712684458;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zk3XKb0313XxlPGBiYPfDtWT1uFFIekVFB4cJRRrJmw=;
        b=rAxKmcIJz6HwSDohLGqpGktnrThq6vDaru7HDHq29UvtxTRkgrk9NNhgyn80imNYPt
         EoQ2f2Y4VOzS/qWeqJLVklX9a8jWdx5Z9Upd4jQpn8MFpZB3Q6+tDx0nWmnwbZaCHa2I
         hL+NLb8QcDaPunkXqthZNbYFdBO0zDvp/5kLLVVcbmMXCJSPIOwdfKYcMoWr5g5UbwwG
         IkK1u3+A8naOh3M+cQ1GNMcr66Ei4Pq4c5fo7e70jj3/+iJYgR03YJK3m1ksN9pkko0G
         4zDgZJLdIhsJf8i+YS1/s6esVW48W+WsslaoeOELElryrCmMGvhZZL80y/QuQY7pDlIP
         aYzA==
X-Forwarded-Encrypted: i=1; AJvYcCVCkAo/951asT+RBblnapKc+YA7ZK/7j7FcT1XS8BBxvwbwuk1AWQytF23caoyRJ+T7EhMTNaVq4TMw/D6SqCfFe5IeqAolypL6dsEnHiiHXigbMYmmWN4gtnOHjtbqsPZPX+8NRFSW
X-Gm-Message-State: AOJu0YwyFl9D2wMqi190xL+K7vmE9S/7kDvYiz7JOpd709/Bwpnv1MTI
	5XcNuFuXY9AV/KmoUYbGdZXK8nJq9obH2u+4h4Szt2qhxw6HqljQ
X-Google-Smtp-Source: AGHT+IEsFSNaSMqzOmZDLbkCCioeknyxrJRlU2EYnY9K1bBP31xR0LgJbZ11RFQB8HTUuzJ6J2mEww==
X-Received: by 2002:a05:6a00:b31:b0:6ea:8604:cb1d with SMTP id f49-20020a056a000b3100b006ea8604cb1dmr15183288pfu.0.1712079658523;
        Tue, 02 Apr 2024 10:40:58 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:7fdc:71fa:30d0:4855])
        by smtp.gmail.com with ESMTPSA id w10-20020aa79a0a000000b006e6aee6807dsm6818919pfj.22.2024.04.02.10.40.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Apr 2024 10:40:57 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: sakari.ailus@linux.intel.com
Cc: rmfrfs@gmail.com,
	laurent.pinchart@ideasonboard.com,
	hansg@kernel.org,
	robh@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	Fabio Estevam <festevam@denx.de>
Subject: [PATCH v4 2/2] media: dt-bindings: ovti,ov2680: Document link-frequencies
Date: Tue,  2 Apr 2024 14:40:28 -0300
Message-Id: <20240402174028.205434-2-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240402174028.205434-1-festevam@gmail.com>
References: <20240402174028.205434-1-festevam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Fabio Estevam <festevam@denx.de>

Document the link-frequencies property as recommended by the following
document:

https://www.kernel.org/doc/html/v6.9-rc1/driver-api/media/camera-sensor.html#handling-clocks

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
Changes since v3:
- Only document link-frequencies.

 .../bindings/media/i2c/ovti,ov2680.yaml         | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov2680.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov2680.yaml
index c87677f5e2a2..634d3b821b8c 100644
--- a/Documentation/devicetree/bindings/media/i2c/ovti,ov2680.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov2680.yaml
@@ -50,9 +50,23 @@ properties:
       Definition of the regulator used as digital power supply.
 
   port:
-    $ref: /schemas/graph.yaml#/properties/port
     description:
       A node containing an output port node.
+    $ref: /schemas/graph.yaml#/$defs/port-base
+    additionalProperties: false
+
+    properties:
+      endpoint:
+        $ref: /schemas/media/video-interfaces.yaml#
+        additionalProperties: false
+
+        properties:
+          link-frequencies: true
+
+          remote-endpoint: true
+
+        required:
+          - link-frequencies
 
 required:
   - compatible
@@ -89,6 +103,7 @@ examples:
                 port {
                         ov2680_to_mipi: endpoint {
                                 remote-endpoint = <&mipi_from_sensor>;
+                                link-frequencies = /bits/ 64 <330000000>;
                         };
                 };
         };
-- 
2.34.1


