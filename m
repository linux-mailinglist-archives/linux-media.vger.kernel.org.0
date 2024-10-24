Return-Path: <linux-media+bounces-20193-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 074DF9AE40B
	for <lists+linux-media@lfdr.de>; Thu, 24 Oct 2024 13:38:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B64F228298A
	for <lists+linux-media@lfdr.de>; Thu, 24 Oct 2024 11:38:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CB6F1C9EDC;
	Thu, 24 Oct 2024 11:38:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B7Krbn7K"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A988E1C9EAF;
	Thu, 24 Oct 2024 11:38:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729769924; cv=none; b=Im8FPJ4njRX9quMs9IA4G95LN/sqbeMahtLk+CjlrzebWTThPU1FCl6pZpjeyu/qIMGRY2x1Ae5ceWh6oN9Pv+GrV0ZPZyyrWgIWCsjgwyjBSBdU3kwheIueChLBxL3U9W6nCLtP/xcv9vQAuXxHtsOBg4R40ahLky7vGugkMUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729769924; c=relaxed/simple;
	bh=dI0QkuoDX8u3vx3JnrxScO35lDK0+t73x8nSHnzmFd8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=GRz1frNE26uRuyjwtZ3KP68s4tJUjv6A0+lUfSAQFOOhNFwH4xWAZQZE5FEB7GL3xTPA5lE2vOeMXowQmIhAyyTcNVPnbCpJ6OaR0Dzh6IC7vqs9qxazv+GgiH2XVbGApd08tIwfD0+X2oWcy7bI6yV+KVwJHIPs9HZ9BkB3Efo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B7Krbn7K; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-7ea12e0dc7aso481447a12.3;
        Thu, 24 Oct 2024 04:38:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729769922; x=1730374722; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4fLacl9mFAQr08mGf7Pwj3Tmlo5Fg+y5GeLVVCqGWWQ=;
        b=B7Krbn7K79al9g+1K/5+B04JfphJyGlSrlJ4LofWoJasObavWuAc0IgrTeWeyIrHYN
         ZVlYjZK9y2OLF7hQIOsSIokthxnD9+hQKgxKkFYkUckZ0DFvpVU+7JSDH33lPMdqDOqU
         DWyvavsf0x/mPhoViMSnDKSFs0bp1wWLH5OnTtmdCVqaDw0qit5V/w4fx244hxlZ5rzf
         0WCvBkPtEMB/q7fFI7KIlYi0APeXlRgRlVaQq0i3/rlaFtrXaYRB9zYzvsrVpsEBzZ3Q
         IK+egPXTp2rXfYx98k5BlNEujJHqJD+vqT+0Ity5fX82htlcOgTk4vYIeOxBR6IGfv/B
         zDpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729769922; x=1730374722;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4fLacl9mFAQr08mGf7Pwj3Tmlo5Fg+y5GeLVVCqGWWQ=;
        b=ujtVvBQM/xZ1EVGxCuY8yK46r/BitOsU4WTN5Zqz7NaPGlGuzeB7+nUHpq/5K6TbMP
         UZ5qLu6Xnctti0edMANAVCC1YfAJgClggtgZvKrOveAaQIJzSN5jUW6gmuu86EPjRaAU
         3nPud5EDF1+l75G3ss9WXyzKxcc4kPIAaNXGbq5c455VzX8qASZgJ8UqTHVMbneGgGtR
         /SDOrzqj8KOE3eV+mNH0Qp7F9UCEKMSywDAI/YfnUs068orlAQEVF+nys3RRrAi1+lvw
         dfhNE0r4PlI2WBkulaAr4xO+DvJxEogW/XxoS1ok8diRJgz3N6altzipmNTY8y5GheaO
         4bSw==
X-Forwarded-Encrypted: i=1; AJvYcCVbPzS6c420RGRch4VrTfydJ5bGcfEwUYDukg0tmAMQR3fspObmjO2FB5j3iJNnRbdZb3pNwS2NGjNi@vger.kernel.org, AJvYcCW4jQZ0wtQ7nBKv3RnuoECt0tIiY5Lg4v3Y3UTRqEWfqrS3tX7SshXD7JDOh68wjCAzULCP5ogzmO8UlGc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7xOxbjS0ZdYoAyYLy7wmQxz1kiVZs2dYBzh6Gzqy5iiUAtZ3a
	nnSvcmpTFdKD9rbxDdrIYddQsOrDTzfMmCaS6zUVxcyYpKId53qP
X-Google-Smtp-Source: AGHT+IEkqI04BxDtCvY5jcDyZMiBGcsXPoBgP8y9Xb5C63ws5LBwXPMrxU8kmjCEpifRKrC8LS8ILA==
X-Received: by 2002:a05:6a21:1519:b0:1d9:28f8:f287 with SMTP id adf61e73a8af0-1d978bae47fmr7195483637.36.1729769921824;
        Thu, 24 Oct 2024 04:38:41 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:248:317f:2ba9:e66c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71ec13d765csm7798029b3a.115.2024.10.24.04.38.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 04:38:41 -0700 (PDT)
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
	Fabio Estevam <festevam@denx.de>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 1/3] media: dt-bindings: adv7180: Document 'adi,force-bt656-4'
Date: Thu, 24 Oct 2024 08:37:51 -0300
Message-Id: <20241024113753.1353023-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Fabio Estevam <festevam@denx.de>

The "adv,force-bt656-4" property causes several dt-schema warnings
because 'adv' is not a valid vendor prefix defined in
vendor-prefixes.yaml:

'adv,force-bt656-4' does not match any of the regexes: '^#.*'...

The correct vendor prefix for Analog Devices is 'adi', so change
the property name to 'adi,force-bt656-4'.

Keep the old property for old DTB compatibility and mark it as deprecated.

Signed-off-by: Fabio Estevam <festevam@denx.de>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
Changes since v1:
- Changed compatible string -> property in the commit log. (Krzysztof)
- Fixed checkpatch warning due to the commit log being wider than 75 chars.
- Collected Krzysztof' Reviewed-by tag.

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


