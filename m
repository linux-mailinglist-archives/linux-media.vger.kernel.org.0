Return-Path: <linux-media+bounces-40234-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E0EAB2BB15
	for <lists+linux-media@lfdr.de>; Tue, 19 Aug 2025 09:50:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0A7133B21AB
	for <lists+linux-media@lfdr.de>; Tue, 19 Aug 2025 07:49:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C3063112B0;
	Tue, 19 Aug 2025 07:49:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mp3JamPX"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4366C310655;
	Tue, 19 Aug 2025 07:49:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755589769; cv=none; b=fjnGAAtgrJ8sebTYwPXFt7VbH8gXVw6LBfOZoNCC1zOuAC1eUvJ+mZXL6AaqdpLMfJMsBmFSzb160VOLUN+D0vRB3EeFUVR290z6KZKbS/abl+CeKwLlohCsxBwMpQsRx7qD8I2NTH3uYYNPSA8zslTjm2Dcp07uhA+iAkz8AFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755589769; c=relaxed/simple;
	bh=o9TySSLEBxV1vBVKUolgwGhPErtzbRBzHso3BUuOW6I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pSvlEQDB0TjFxu7hJeCF/Nyb3mv+PErsdCJhIVGt0wroo5RRXKUP1pqjVx8DBmN4Nn0FW7xsHjQWDgdPY9vliJHJssxeMKSq/Pcgz57xDCSS0uyGWqMMeBlVTty2DGmpNjG/qJ7VSYcApKRtCKbstV4/zB8Oam258rLZ4FzBjcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mp3JamPX; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3b9e41101d4so2599598f8f.2;
        Tue, 19 Aug 2025 00:49:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755589766; x=1756194566; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Tktl11pfy3/Yp1aBg2B/XJPwdXr6OR9NrbROhrLFKOA=;
        b=mp3JamPXTzZiP7m1Sa3TepFMZzt7i/GO3TBiH0aoHgJ5vzIh/YOtoAw1j1X3M9DgMb
         BzccNJy69w86Ccy7Q+Cvz0zxrKeYKTla1BjsbxIyBdynsMXCuYGwnkMP3LX81Jfe2wvY
         Laqd8zG1R00N8uDMtKWm+m7JVR/iBHTYg97uy2JjNfdq+C2xzBgt8pvsiRYB8FZCyEJW
         y+ZAsMArarcOWi6iu+tgPscxIhi3Q4cqNexbAQuCKF8d7Vl4lx1878MsIjcIIGjUTa+p
         DdE9+3O2Nht1S/JTNl0IJ8jaNuAdBbX1xEfd369BmwT+qgOo4Cj8k8EMUvdRes1UZe3n
         R2pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755589766; x=1756194566;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Tktl11pfy3/Yp1aBg2B/XJPwdXr6OR9NrbROhrLFKOA=;
        b=n9R9E70kUslf9Y43vwHnCLjHXit+iiztcLivD6ClAsZAKNkDH/UnK7qked9vXZOTs+
         OjmeZW0nRMGojG4kmnPmUKlaRzZEghYR5oUAYJQjwGZcCyf3bJjjgQCMK4vl1Q47EKJp
         siPeI2JhnBL64+RGKoJmwWjVnrDlHUzXMzRSglTaVSPNRpruYdp9WmKNDLp1ZicydeFj
         7OemhmxZvshEv3FP/eUNQFgmuW8d267llGW8JxuO0XmEHhht+KWFPeJ2EApqsYtCvnVm
         miyABJJs26f+vUgrIHjabco4T61DC0LPJEOJuzO+85lCAu0KlhjaTZDj8Gwu0HQKKxJm
         Kjdg==
X-Forwarded-Encrypted: i=1; AJvYcCU3uiQlzsxUS3O/L3gdxDs0VMtf9DFn+sfc51p33Aeajxm5eBfZB4IZ2rYxA7w/t1S5VMIRU41l8yQwkH4=@vger.kernel.org, AJvYcCUrHBLM64WKVdTo7ErCWQy87Gn8zhSMKVskFgHiiM3QNg5SmIH5sVY4RffGVZpcq2ZSRtcgX6gb76AsFT2s@vger.kernel.org, AJvYcCVxfj0hkAvaAJfS/UQit82cwdpPEldBQpqwoX+OBBHPfTD+ADCkNghkIy81SuU+BrkM0R5L/Z7DdUTX@vger.kernel.org, AJvYcCWgl7ZGZx/keJSQ7fmFkpI3O5qwV4r4/ToVssJOTSEHIEOZDm29dP5kz7p3rcqdM2iSI7CCcTWpu8txVx4WYe7IDTc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9Or3whlchQSgFv5omOxlODgwKqExTVleFj9Nl08VF0LJNeVzf
	rFlWhtfBaPK/7bl+DqkLId+/BXOi9XBJucYuvB9hcX9fQ0GME1sCD8s5
X-Gm-Gg: ASbGnctfliA9hmLHQwt1vjHjxR/AiL+dzPQesxvf63lvUZ+mNsadotUXaJmvP4QcmcN
	Cjad2ell43L/aCp+ugYa6BiiRHnr6cpp09YHwdepTTq1rjQSM/TXvT1AzMEE5O5Cg1Htw73A0Fa
	mc51iU0GgeyO/JS82mAqe4l/s9giQcrsFvyzC1irTYRVBpLgIXvWYgtrTHRwrOaAIlfLdmwE6hW
	7FA/hGxhhaI5Stnp/aAhWodYAkRabfnLuQcVm7AYsROpF+jCmWMvB1Lo7fDzBQtnt3psnOE2/Q7
	xgGFzZBp4DcYMnlVwVcliXJ4lm7xFADHGIVgLl+dOvxjTJaugSowYPNdOHQKCrNaW797UxM0npC
	8ET8Jf3SrY1coylKojUB+rWQPGF/PmFsC9gUf7RMvpL06HGSTLv43eSAhlG5aKUwE47xtcZCvjg
	==
X-Google-Smtp-Source: AGHT+IHUAZmruvo89s8w/TDHSQbTq0A+T1xiSAxrWAoBmrBQ1XVkEezpiCS1g5v9Gm3xgk+kjze3nw==
X-Received: by 2002:a05:6000:188f:b0:3b9:2960:bf92 with SMTP id ffacd0b85a97d-3c0ddd0f2e2mr1097338f8f.0.1755589766111;
        Tue, 19 Aug 2025 00:49:26 -0700 (PDT)
Received: from biju.lan (host31-53-6-191.range31-53.btcentralplus.com. [31.53.6.191])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b42a6d59dsm29351215e9.2.2025.08.19.00.49.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 00:49:25 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v2] media: dt-bindings: renesas,rzg2l-cru: Improve documentation
Date: Tue, 19 Aug 2025 08:48:42 +0100
Message-ID: <20250819074849.18696-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Drop CRU prefix from clocks and interrupts description.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
Ref: https://lore.kernel.org/all/20240909143358.GA2013-robh@kernel.org/
v1->v2:
 * Updated commit description
 * Dropped CRU prefixes from clocks and interrupts description.
---
 .../bindings/media/renesas,rzg2l-cru.yaml     | 22 +++++++++----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/renesas,rzg2l-cru.yaml b/Documentation/devicetree/bindings/media/renesas,rzg2l-cru.yaml
index 47e18690fa57..0a57b9d15318 100644
--- a/Documentation/devicetree/bindings/media/renesas,rzg2l-cru.yaml
+++ b/Documentation/devicetree/bindings/media/renesas,rzg2l-cru.yaml
@@ -32,15 +32,15 @@ properties:
   interrupts:
     oneOf:
       - items:
-          - description: CRU Interrupt for image_conv
-          - description: CRU Interrupt for image_conv_err
-          - description: CRU AXI master error interrupt
+          - description: Interrupt for image_conv
+          - description: Interrupt for image_conv_err
+          - description: AXI master error interrupt
       - items:
-          - description: CRU Interrupt for image_conv
-          - description: CRU AXI master error interrupt
-          - description: CRU Video Data AXI Master Address 0 Write End interrupt
-          - description: CRU Statistics data AXI master addr 0 write end interrupt
-          - description: CRU Video statistics data AXI master addr 0 write end interrupt
+          - description: Interrupt for image_conv
+          - description: AXI master error interrupt
+          - description: Video Data AXI Master Address 0 Write End interrupt
+          - description: Statistics data AXI master addr 0 write end interrupt
+          - description: Video statistics data AXI master addr 0 write end interrupt
 
   interrupt-names:
     oneOf:
@@ -57,9 +57,9 @@ properties:
 
   clocks:
     items:
-      - description: CRU Main clock
-      - description: CRU Register access clock
-      - description: CRU image transfer clock
+      - description: Main clock
+      - description: Register access clock
+      - description: Image transfer clock
 
   clock-names:
     items:
-- 
2.43.0


