Return-Path: <linux-media+bounces-26525-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A8157A3E806
	for <lists+linux-media@lfdr.de>; Fri, 21 Feb 2025 00:08:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1EF513BF5A8
	for <lists+linux-media@lfdr.de>; Thu, 20 Feb 2025 23:08:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3626326562A;
	Thu, 20 Feb 2025 23:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UGAll7xA"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6A48264F81;
	Thu, 20 Feb 2025 23:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740092925; cv=none; b=sjzyzBJrqnGpPHwN4KocULGt+VD+2XCJhGi3SbE6snvDQHoYDbVqrCE7svV8TFEGHdE9j5lR3C3wR/w5wPr7TmfHKDRKIliJeD7o+kAg1IXwtsz63y+C66CSJdtT53rcpr/R7ELB8SwBa+nAe/BeLQtN+/9hL9rAQ9RsoufKktA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740092925; c=relaxed/simple;
	bh=PZ1DnjTFl18o7jkWFg8lWtATbzYcZDhG5/KGRCkkiUU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n8PiZi7xEE8bLyFmQTgbV98iylYGO2EVc9ZHmkGFMBmfVyrluDej9bRzrQsU27y7UNHSCw0+D2r5Ok6eEG2nTvT9GnB40oBf6KT8m2PSe+H1u9Xy9FD7uLScEW9dQVA4iVhQYV47BzCI87FkGs+fbC2tU4pBA5L29l29d7iAzcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UGAll7xA; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-abb7a6ee2deso240170866b.0;
        Thu, 20 Feb 2025 15:08:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740092922; x=1740697722; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NFOJHCDRxWmWioNC6N/UlZoweJhdV9qdoQg8e0aFcrs=;
        b=UGAll7xA+MBMMwWbqAYzYmnbGzi47B6kHRSFtPWlCY/F3ZZ5OOiA1h5VSqAVETLO4l
         uz8bKqWl6FDQ/izgkf6NrjLfcUUogMyNaG0cDGSkkkVJNWOTMGR+4Mtwr12+aTRbQPip
         BO2fxQ7gDIEB4j9ID2Qgz8VyNOuwuVoBH+s/PZKYZIM1sf6O4AW2lYBopf/t9ul0mroM
         /K8gQm9gk1LRZf85md7Nr2SOP7qZ+lmjxBpJgd73DZ/TnPq8VqF/VTEESZYmUFHkNt8H
         uRh7M97Za7KzqnaznP6VUJUoYCTLTZZuFwVcrMsnYFBqY3tloV5TCjpuHaiJNyKVSgF3
         xwCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740092922; x=1740697722;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NFOJHCDRxWmWioNC6N/UlZoweJhdV9qdoQg8e0aFcrs=;
        b=O5AVm5mlbRxiR2TvfEBBbPR6zbDVAeC3hkLmZ3YeNg3Lp5zNyaDPYes5W2Rh2z84PO
         1sgt+fC9YpTE0UVQb3JWIAKeup8D/wcjwPiIYRPkFQOLJIMQk/xawkvlqmwOZH3e0gvr
         Z7d1gNOWapo7nTsh/1EQjCej2rsz4wh4/taag5mGNawW1gnfP6ZwjVza3yoMbmBqXEIM
         DRm1lW4KG2vST3ozCF/TTs+pN1Rt+ZY+qXdEGqW10LRKZZRWMADZ9aapQMF5y/8TGBd3
         EhaHoYrb/q/8GvISEHJ8v9X3pQHmRC2OZoFruMQup42cwvkuZVZfAbFf9x4XFETE1KXq
         G8HA==
X-Forwarded-Encrypted: i=1; AJvYcCVD4BiSvV3bAQK9UU5tJFcNUg1ddaNDcymG3tBSQfUb5qiV/7hZ34rKAkLYHuqhDSQVCowYU2p+YhyQTwAF@vger.kernel.org, AJvYcCW+x3q6SoPaN3qCI+LQl53nCzp7yG7pxx3/mP+oMHnP8u70Upo22Uv3ySWSb0rGSr6M7t33ULCbVz2K3t4=@vger.kernel.org, AJvYcCWpJMmREy7s93KTU+xIK4erXdHB2njGJaoa7Kl1U5xG9Y7eJW5115sUD6iupQ2CGQrbkEGbCvP2IYlp@vger.kernel.org
X-Gm-Message-State: AOJu0YwY9dFw6o28OJp39s5KS5wjWUeR+L3UwgeYWJLWFps810biOEAG
	msR3gxqLSVtZUM3EUlpw8YVBAfXFd0Z+kkcKMKDLfb2RqiSLOKti
X-Gm-Gg: ASbGncszZV12JP261jLJ0/XJzeqIkPaWuFeAL7QINfYW9Vf5Cd8zntjdKdKdL6/pZPK
	wyUD/XpxTzCWgNzVEzHBs6EtMbVG46a+u61npW6YeXuNTVSigwFhe0PGwaMd+h9QCpGBLY6sovc
	NenJaI8NYq5Dstnr3VD3NNdee6IAvC03gD/+FauwFrW6Y8cQPs3R2v7haHJFa6iqDh/px+FPExY
	PtiLpFjTb7gWjqUWUyQbeSpM6/+ZL5GLetvfWApe/Y+uqZiYP+aNfGI8yQoifmQN7y1AoLV1khP
	qshyl0j3II4SvhzTe6rUaHsCvBzF
X-Google-Smtp-Source: AGHT+IG9EAhYRQtFAS88EjfSpO8anFUAbm7p/IUPqkE3ggwd0qucvdpByol+KZZelROudQA+nudZqQ==
X-Received: by 2002:a17:907:c284:b0:aba:5f48:eda4 with SMTP id a640c23a62f3a-abc09ab9bcfmr86596366b.25.1740092921968;
        Thu, 20 Feb 2025 15:08:41 -0800 (PST)
Received: from demon-pc.localdomain ([188.27.130.21])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abb9654a6b2sm909107066b.135.2025.02.20.15.08.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 15:08:41 -0800 (PST)
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
Subject: [PATCH v2 1/6] dt-bindings: media: video-interfaces: add support for Virtual Channel IDs
Date: Fri, 21 Feb 2025 01:08:09 +0200
Message-ID: <20250220230818.275262-2-demonsingur@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250220230818.275262-1-demonsingur@gmail.com>
References: <20250220230818.275262-1-demonsingur@gmail.com>
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


