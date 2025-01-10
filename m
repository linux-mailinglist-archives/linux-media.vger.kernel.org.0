Return-Path: <linux-media+bounces-24629-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ABCBA09A3A
	for <lists+linux-media@lfdr.de>; Fri, 10 Jan 2025 19:50:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 24B9A3A3A67
	for <lists+linux-media@lfdr.de>; Fri, 10 Jan 2025 18:50:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FB6D24B238;
	Fri, 10 Jan 2025 18:50:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HAe0+XEv"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 976F224B221;
	Fri, 10 Jan 2025 18:50:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736535035; cv=none; b=EuhlZo8mm2LBmjpOUm7gXlPDQdcZPHKKJOBSK993z/alKK0WsI22DU79+wQ2ksFKU8riNqMKMgSF+JR4yxuG4O3NknWphS1unf8tNrJ2ox2v5NQsC9XF5cw8PjQ+Xg0rhrc7VnnZWT+r/Ltk2aM729r06kZukP62/g8E3z1dLfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736535035; c=relaxed/simple;
	bh=vrT8a6O4opiIU7s9cC8Ep2OX2G8eqXuK9/RYBE5Tk9w=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ChOFR2Gp30yHzQ1UF/rzb0vdg7WuV0Zw/JGsoOnOoKc+tArvQrRYLRAlwT+yjCsMHwBefYDQ5NACNTddQN3kxyVaI60lGhUNcVyjf0CWhiTZYN6OwhjiiZJd/VEeaAnckdftCRB7HmzR/wtricxiK2TRyvx3vvVNOy9xe5GsI48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HAe0+XEv; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-21661be2c2dso39128585ad.1;
        Fri, 10 Jan 2025 10:50:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736535033; x=1737139833; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HcMvjcc6CYhEYyGOEDhz98L/qluxgiWXs8T6SJA0DOE=;
        b=HAe0+XEvnEpaMa0Zjeo8f4TPbxp0R6O2SKT+w6UT4j2C9MZZEKUwRVXU74UlRfwNt1
         wOdioQCbQGPhL5KItHgPlJaYWQeYpQ73qJDUaA5lDT3QwD4py58gd6/if8idmq1ZGwKt
         BsYJwV5DGnye+GNTQxZEV0OyhH62gOZ8C99puVGNF/6+j3gw6yHjf44tIEzTzFwDNVSZ
         IijJB1c37IiK2JVWC1e2sLMBWVO/d32n2+ZB+F2xsuVZtLCEmuH5RthoBtTFd4CixXjS
         QW3PG/COPeAxHyYCgv+LSvqRkz/coR2XIjOUInUnSUxQADGk0rZDK6h3JIEIPboZZRMP
         lpmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736535033; x=1737139833;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HcMvjcc6CYhEYyGOEDhz98L/qluxgiWXs8T6SJA0DOE=;
        b=EKC3S81o7+O533HGZ1HVxCj7xX4UH2gwemE//USzNesuix4ZodI0oos57jbyr/b5Ga
         WY8pw1P4brOzs7wENNgtfx5EITFf2kql1opohB5D6EYiSv50wrTEL5EQn+MAKKmqXK34
         zt4nn2vyUkl/TleGJoibM9GZxIj3HH4grN28m0L6iF8XmdIb8kItoIvgtw0J4gpp0x6M
         6ecZOuuchCyyY42w/IB7YfzY/bFjTrqsayMUB7X/rF5pKGuz3lIjHwBQEcMtuz0bSpTs
         VMRhK6KhluMQ2xb1d1wnPlLPsK3V6IGi2TybUUcYhtOmHTHQsyPthHJ6kpLHl7rSyk79
         ap5g==
X-Forwarded-Encrypted: i=1; AJvYcCVKJ9AL6TYhGQbG5MbeKTfMAM/GYlH1EUaGp0MSSfJkq0d8WWDTb2HCPfCCnA7gbDxcE+lLfhAeJXsU@vger.kernel.org, AJvYcCXd0VMGsXtgKnvuIggeW9nqzonBOSYgCZY7FZxfzPQXOrQQACaeyhQZBnIplMaw3/QiFt1Hg0zpMYOPL1E=@vger.kernel.org
X-Gm-Message-State: AOJu0YwDLJGeU+XLWw5QcunBaebdyWJjh+Bt9LKvzRnmzWhL9FslL2kJ
	dwghtYkxFvywaMu1g5+VNttcmcYNXVIv08FjILPcmQ/Bmuq2mcRQ
X-Gm-Gg: ASbGnctJtKs12EuHlOdE0Cg90E3TpaL71KQcfyTugvLTxM7b9S7kBx19lag+3cEw8LB
	lcKPLZGFmaFMFzS2QmgCWidkBoemxab2zO6m0EnxPOy6yIlMV5kCww7485IbJGlxgfc18pZBoTc
	6FYFzSt5sNj+hrCX9d5Mtz4I2UY2cxpOleNtiY0wrmkt8IY9uT/+S01Is5VTKJ4bFE8UGjz4s8w
	QzQhaF4DQNceAbB0cYnXH6eoLQd9RAF+/XeibF+6JKMKIFYYm1UCmFWXp5uI3HIcZ6zEIg=
X-Google-Smtp-Source: AGHT+IGW+MuixB5XkEnE80DxPRK3INcukeNfB68zQBSb5p1L1ZGffWxuuz0c12sEGTJ0vsPhZNTyPQ==
X-Received: by 2002:a05:6a00:1802:b0:727:3ac3:7f9c with SMTP id d2e1a72fcca58-72d21f29700mr17085694b3a.10.1736535032646;
        Fri, 10 Jan 2025 10:50:32 -0800 (PST)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:a286:52bb:e897:3316])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72d405485c2sm1843861b3a.5.2025.01.10.10.50.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jan 2025 10:50:32 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: hverkuil-cisco@xs4all.nl
Cc: mchehab@kernel.org,
	lars@metafoo.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	Fabio Estevam <festevam@denx.de>
Subject: [PATCH v2] media: dt-bindings: adv7180: Document the 'interrupts' property
Date: Fri, 10 Jan 2025 15:50:26 -0300
Message-Id: <20250110185026.590049-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Fabio Estevam <festevam@denx.de>

The ADV7180 family of chips have an INTRQ pin that can be connected
to a SoC GPIO.

Allow the 'interrupts' property to be described to fix the following
dt-schema warning:

'interrupt-parent', 'interrupts' do not match any of the
regexes: 'pinctrl-[0-9]+'

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
Changes since v1:
- Detail the interrupt description.

 Documentation/devicetree/bindings/media/i2c/adv7180.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/adv7180.yaml b/Documentation/devicetree/bindings/media/i2c/adv7180.yaml
index 4371a0ef2761..ede774dff4a8 100644
--- a/Documentation/devicetree/bindings/media/i2c/adv7180.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/adv7180.yaml
@@ -49,6 +49,12 @@ properties:
       Indicates that the output is a BT.656-4 compatible stream.
     type: boolean
 
+  interrupts:
+    description:
+      The ADV7180 chips can generate interrupt in the INTRQ pin.
+    items:
+      - description: INTRQ pin interrupt.
+
   port:
     $ref: /schemas/graph.yaml#/$defs/port-base
     unevaluatedProperties: false
-- 
2.34.1


