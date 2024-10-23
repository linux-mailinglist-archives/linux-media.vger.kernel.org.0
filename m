Return-Path: <linux-media+bounces-20121-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 40B5A9ACD96
	for <lists+linux-media@lfdr.de>; Wed, 23 Oct 2024 16:56:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D4BBD1F21378
	for <lists+linux-media@lfdr.de>; Wed, 23 Oct 2024 14:56:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E5A51CC8A1;
	Wed, 23 Oct 2024 14:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UH5zhiMQ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5179A1E2828;
	Wed, 23 Oct 2024 14:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729694540; cv=none; b=KmKQFPR+k+6TMWo9oml8rGmRLyXjz17RfUCO9EbB/2h9IsqHtDda0YuxfFdUmtb7VkWRrTL+n2QfNxqYso/5N5SY6HadrVgWr+9Jk+DKCorznpBBvqRr5eOr36288W+yjNHc6dTg2KC21Q9CpqCTZ0PmofXvMHCCTUVnyl5+4Sw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729694540; c=relaxed/simple;
	bh=e4RmPryBG5qlhhvr/oYSobk0OjYStFjvhCmAXDT3sOk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=YV9taTbsmVbS3AYxGkqEuz6u30N55RSA1/ipbE9Rrh1EKHl8YLogGby6EHyVDCbvUSDCrz/Trm46ANVcnvrV4yGAtnZVfZVIEMtUz+WrJrd1yQDCBkUmkBRfIZlU+lMUXCoAOJxZaWMFWztajln+7A3xriRT4HM88vbeCZQECUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UH5zhiMQ; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-20ca1b6a80aso66898285ad.2;
        Wed, 23 Oct 2024 07:42:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729694539; x=1730299339; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YfCfY0e08fQets56CZIoi6Rt+juLarU3s4v7RWevgfI=;
        b=UH5zhiMQb80SsGArshbeL+R+XQJnDqfe/Tt5Ug7nO+nMhFduOe8CjqWIzy3y+a8mz5
         Lft9tWAjS+WAwzyhifkn7Cc+pTtqB4Jd/zFmVcQ1dKcAqv80XxH49e4poyPVdlDyJwez
         snD3+IoTbPky019nXYjb/zJxQUFtNoHv0Wr6nvhinoWdXjGBDfacW3twoVrYwhofNNFw
         54r/rl9Upx/5vNXK9o0+MS0rJk71pe0g3sU7whh+nAADDkm5EsdNUrDwuq5t67k69NMO
         /+wZWoJqVyBUJn4oK5PS4b5OUdns8b2I8y06tG7tzr1qre7NkLSZbxDzCEoeNSO+2NXC
         knyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729694539; x=1730299339;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YfCfY0e08fQets56CZIoi6Rt+juLarU3s4v7RWevgfI=;
        b=pu2GrVD/sbR6EO+j0lqiPHbmyr/63m0pMO1/YYj22lMiqxUk3uZnOdw1DCsdSCpj77
         LCmiePHOToCAl+lHsLnbrc46gpL6m5NSQv+mzWyl4kVE348jlT3vGrTOX/ai4UBf/hZQ
         aNZoPuGd3/MiVGFY0bZNPd2fM12oAaaIgK/9bmrL3q8HS5oZBfMHfvxbUCjNjs+Fi1do
         99ClK8WY2uA24Tt+KDuu5pNsvfyU8dXSZMV83qgNAAa1GVxKPWES1VyQgmboBwF6ijvH
         jNETe+nco5V6rFo/WhXsG88LIYP0Wlc65RGjN85z2ARGQYrwLFHwPa9v8wPG5GQEus/W
         e2RQ==
X-Forwarded-Encrypted: i=1; AJvYcCWOsT/P8Jvs70wgEV3Mo6zmJzja2dF1gfmUOjSYVxNSZFCN/kU+soT8+uph6FqWFxFHysVeMC/AzI7ZAk4=@vger.kernel.org, AJvYcCWe+MuYm3aNxRd04AAjnrYL5Xbhr6sSLD5q8qRZFo2T8rMfb1wkUFOYX9kB+LtGeP4xNRM74/3nntRR@vger.kernel.org
X-Gm-Message-State: AOJu0YwaiFxW9vPO81BR3X5qcExLb1joH7p5EOfVq3az5LHftxnAoMiL
	OOexfnOreeQ1gwwxIFgNPO5yNTwU+RVflkRLY+rkmE6Szl65zIEj
X-Google-Smtp-Source: AGHT+IFB17hqHfuiufxeK4p878goN3oqjHEpwzkM7x70GkUyk90bBzpvra7dZniR9vA6LGkZjhYwug==
X-Received: by 2002:a17:902:d507:b0:20b:5ea2:e06 with SMTP id d9443c01a7336-20fab31f644mr43620755ad.56.1729694538576;
        Wed, 23 Oct 2024 07:42:18 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:3468:366c:e529:6d8e])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20e7f109c5asm58573725ad.305.2024.10.23.07.42.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 07:42:17 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: hverkuil-cisco@xs4all.nl
Cc: lars@metafoo.de,
	mchehab@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	shawnguo@kernel.org,
	francesco.dolcini@toradex.com,
	linux-arm-kernel@lists.infradead.org,
	Fabio Estevam <festevam@denx.de>
Subject: [PATCH 1/3] media: dt-bindings: adv7180: Document 'adi,force-bt656-4'
Date: Wed, 23 Oct 2024 11:42:04 -0300
Message-Id: <20241023144206.1099622-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Fabio Estevam <festevam@denx.de>

The "adv,force-bt656-4" compatible string causes several dt-schema
warnings because 'adv' is not a valid vendor prefix defined in
vendor-prefixes.yaml:

adv7280@21: 'adv,force-bt656-4' does not match any of the regexes: '^#.*'...

The correct vendor prefix for Analog Devices is 'adi', so change
the property name to 'adi,force-bt656-4'.

Keep the old property for old DTB compatibility and mark it as deprecated.

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
 Documentation/devicetree/bindings/media/i2c/adv7180.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/adv7180.yaml b/Documentation/devicetree/bindings/media/i2c/adv7180.yaml
index c8d887eee3bb..4371a0ef2761 100644
--- a/Documentation/devicetree/bindings/media/i2c/adv7180.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/adv7180.yaml
@@ -39,6 +39,12 @@ properties:
     maxItems: 1
 
   adv,force-bt656-4:
+    deprecated: true
+    description:
+      Indicates that the output is a BT.656-4 compatible stream.
+    type: boolean
+
+  adi,force-bt656-4:
     description:
       Indicates that the output is a BT.656-4 compatible stream.
     type: boolean
-- 
2.34.1


