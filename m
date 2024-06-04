Return-Path: <linux-media+bounces-12497-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 828C88FA9D4
	for <lists+linux-media@lfdr.de>; Tue,  4 Jun 2024 07:16:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3D50B28E326
	for <lists+linux-media@lfdr.de>; Tue,  4 Jun 2024 05:16:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF53413DBB1;
	Tue,  4 Jun 2024 05:15:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hWuvVcMZ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C83DF9473;
	Tue,  4 Jun 2024 05:15:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717478141; cv=none; b=mSbok9fkHaogrQv48LLgs20xRdnfnhg8KMXf37Pil68gylpZqPoTLn7C+NDVkwdMA/FuCESixlwmOzmeuVJopFgiDN6xZoEC27OE++mvXJ4lcBlTyw1ZqR99hcdXrBOx4XWqQa0IkoUd3Oasw5P4kqK7LEFZP6+sTY7Uz4xjeLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717478141; c=relaxed/simple;
	bh=D6Si2bEd/gJd1CSLAqajZQzPBLVMC2TuZsR1YACoGVo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=cIDWSj9agiso7/FYmmmWKBPlNcp6ICzb7cOcwV2Wexa7JUJeVs44NSCKdhYxJF01dAK05p2yub4mXlqveBF3q13cnMAUTUr6YHF6Kv1xRvqWAU3ONGWzZPCIZJ3Kbcj62NXG2POw6lD5KW0/Cn0xu2C0IKce4HbmsXTm+79mo1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hWuvVcMZ; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-578517c7ae9so604012a12.3;
        Mon, 03 Jun 2024 22:15:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717478138; x=1718082938; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2KFwSuk79X9DX5w/ku6Z9rjU54vKlCO06+DBoLY9A3Y=;
        b=hWuvVcMZJDni9yIPxApdpEd3XmChL3NDHzSjp6jcUa5V92SxA178ezdC5OyD6yA+UM
         3z2WdFGR49359jsqliMqD2d2sNuUaO5o9nppOAv7b+DjY4brWfPPqLw2z4v7CcvZmOrk
         hCzLnbkL1ZAMsXhDOEQN1svjE0jZx3CmVBKoOHv1Q54850epOue23BjVaaAksHa1rULP
         rmajYfWljtfb6YMgIVCVnp+LF+a3bO0NlxyUU7Ar7wgSHdC8FA1B7gVw1yV6iaT5qr5w
         L3lVNK50rfOdkLJebE1CdZMURATHJYl/AiGN1euQRz7XR0+te39lSzAfJd/ep+HvAXdZ
         /zkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717478138; x=1718082938;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2KFwSuk79X9DX5w/ku6Z9rjU54vKlCO06+DBoLY9A3Y=;
        b=Zn3PElb6dYy7XuorKMpV6LzC7Hk4yb1gncnkOe3k/JAxqjZRA+mqzbwT0l3LY4V6Dn
         KcYbo96RkLdUCbcGHgbswSmRamnHwyRmo7MVJkoE69ilegHfvzwR3RSa2m+KD2SWK/pt
         vk3sfK8vBqtVeqUz2LDyORb+Fa2X4V5R/Bk4mFcFLkiJj6QYnjlnEN7Ed3m5E0UYEFIC
         lW7U5kJwlJ4BTv/tJ2lDU6YNvlrRDGwKJ1PHvIBHJWNd04As6Kg+XtEI/cCvcEiSQWba
         tsT8fj5RBlpg4S/PhGiQDpHAnNP7apTMSgpwBsNqr3J0f5oFwdSmQN9Q9VSUhS0jJqfu
         mjtA==
X-Forwarded-Encrypted: i=1; AJvYcCUVpXZkInqrmiZizsGJ1gZCD12Y7tIcEQn1RUB8TBDvrhk4tLdZU5F3LDVqUu7+bpkspuKNtp0t7/mLHULiTygmIexyv57OSboJ6oRUU1S7+JrTc3XedUdLRUCUt3DLT3q5SjekfRTBXvA62TGjEjgEkUdWyVGwKJ61NkvaNvFNsMPyuIQE
X-Gm-Message-State: AOJu0YxsEBdSrLdz1ZNt9dd5ghYpd4Rq8DVc5xIkqqonyw1iYqBab72o
	GoF+Bazj4ZxLKT6LFXw97XDbCceWRkt1HilOw20mrMKk5+SzoVv5
X-Google-Smtp-Source: AGHT+IELwPjYkPPMjx/cOlLOkJTKS9byWM4fjPErh9dLotwDfRJJOfxB6eikJGAPgwJevRJtlecYGA==
X-Received: by 2002:a17:907:970e:b0:a69:228:8a6e with SMTP id a640c23a62f3a-a690228939dmr370899266b.44.1717478138040;
        Mon, 03 Jun 2024 22:15:38 -0700 (PDT)
Received: from toolbox.. ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a68afbaac03sm451896566b.149.2024.06.03.22.15.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jun 2024 22:15:37 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-media@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Christian Hewitt <christianshewitt@gmail.com>
Subject: [PATCH 1/2] dt-bindings: media: amlogic,gx-vdec: add the GXLX SoC family and update GXL
Date: Tue,  4 Jun 2024 05:15:32 +0000
Message-Id: <20240604051533.3312944-1-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The GXLX SoC is a GXL variant that omits VP9 codec support. Also add S905W
and S905Y as GXL chips and sort the GXL comment.

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
 Documentation/devicetree/bindings/media/amlogic,gx-vdec.yaml | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/amlogic,gx-vdec.yaml b/Documentation/devicetree/bindings/media/amlogic,gx-vdec.yaml
index 55930f6107c9..47dce75aeae6 100644
--- a/Documentation/devicetree/bindings/media/amlogic,gx-vdec.yaml
+++ b/Documentation/devicetree/bindings/media/amlogic,gx-vdec.yaml
@@ -31,7 +31,8 @@ properties:
       - items:
           - enum:
               - amlogic,gxbb-vdec # GXBB (S905)
-              - amlogic,gxl-vdec # GXL (S905X, S905D)
+              - amlogic,gxl-vdec # GXL (S905D, S905W, S905X, S905Y)
+              - amlogic,gxlx-vdec # GXLX (S905L)
               - amlogic,gxm-vdec # GXM (S912)
           - const: amlogic,gx-vdec
       - enum:
-- 
2.34.1


