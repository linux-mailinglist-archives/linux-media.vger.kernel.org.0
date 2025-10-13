Return-Path: <linux-media+bounces-44310-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id A1C95BD3E37
	for <lists+linux-media@lfdr.de>; Mon, 13 Oct 2025 17:08:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 6264A4F9A8F
	for <lists+linux-media@lfdr.de>; Mon, 13 Oct 2025 15:00:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 836E230AAAD;
	Mon, 13 Oct 2025 14:52:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Q0nJDQEe"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06EE3309F0A
	for <linux-media@vger.kernel.org>; Mon, 13 Oct 2025 14:52:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760367151; cv=none; b=QH0QVK5VpR84euT8xlEv3u4sdMgGE2e0r3vGuzBw0FNvg8i7q9vnMNa2jLtKAUDLL3Xofu+ZbluYtGwptlv0PXy2od0tKH2UrrejQGuljL31xgmJ6BX7rULpl8z4SqRnKDgsZlD/5HNOWInBWK6xPykEKrn6aUqUQzsouRE+I98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760367151; c=relaxed/simple;
	bh=ehKGfZgSjS6V9yj3+PS5sl4s+AURZPsv7Zg5nNIPtno=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Br1At1VnGXZylPQFxFmZ9/XL/IQgovf2/17UGh2wdqGlCDSwZzx9W2cTZNaAXbHRw7YCMrdV7PPWNPk4Q3jxnDwEBMNF01J4J55JAgVY8gy+IRI86rO5ChHg9I8Ib2qCo/8a6dpbmSv3MkiOYFjCoZQSrlhpArHzpVBllwA5ScM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Q0nJDQEe; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-375ff2b3ba4so42739721fa.0
        for <linux-media@vger.kernel.org>; Mon, 13 Oct 2025 07:52:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1760367148; x=1760971948; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ndqybwsxO2QFLLjTy3qgkVgt9RREczDl4RIa/Rwx+w0=;
        b=Q0nJDQEel5gc99GmRnr8ploVEESfqJQ8OACKI6pmhh95YW+rTgf3oaTt8WDzcuB0wd
         WoounIzesA/9JcCYQsiZunWfi4RCBklLo7Oy1ptedEccHc7vmA2OzUFRvbJTw/GggbFK
         1lUNjWqiMY/3XtfytAeKviMsm3mgHZWSO3Dlo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760367148; x=1760971948;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ndqybwsxO2QFLLjTy3qgkVgt9RREczDl4RIa/Rwx+w0=;
        b=cJnkmWv9ADf491CfiwnEnHlhWE2Zpl3MH9sYpQV978e5wEGNvv1zh02HTt/D0lTfPB
         GYGlT6RQVqbDSzp2ZZIXXZv5SZBy/uU/8daiJX49TlEr7r0YejbR5k2HreHjjQCsr7yb
         GId0530Ug0Ut/sHAOCDv7g+3KxslxbmairGY5gzu1xMN0NwY1NgJqGwoXjrPFPMZIcgp
         xhM1iVqnAPKaU7bycHqzFSuteZJp0FQX+EsB9AedE8BMYtqULs+0pcHgwAV1ID5N9gxl
         /OQiCWDJSOTkiFtTM1a1a8iCYk12qvNXB9z1g/1c3b79z+BZ/HjZrcHc5/NczE/9KlA0
         CN1Q==
X-Gm-Message-State: AOJu0YzxJDkM1Ks4xz0KU8g2Y1lXr5dhREdBCqncg3zu3/UuX3lJyv30
	MrRT76qf8Z3WQOoAZO/Hy1mffK6qwNbSMTxEbmVZ1/H7oiLg6JFQNTZ3hAzjaz4TDw==
X-Gm-Gg: ASbGncuSpbw+MhLf+7pwdQM9rD0WNAbs6bkujSIegP5+DSoBmpbAY08twKTjBNpB/LD
	RirpcgxacBqaddxHE5g/RFP3hyy2lMFlvrXKM3UIJU96/wmJQVezovXY2xa35Mu55CIjivZOcoT
	DEFgAVHZSJB2wEb3wvv/2zJ/HH8nMiEjp9kNgAL5ZbUowxmBRiU+MJBaVHIMXHfSbcOkLbpXKCg
	rFBxo/ZtY3Qr5iJdbBjQLdd6erousU2d6Jtpw3Q9Ifhkdd7BjCvKwpdwXcehgF32BGL2UNpaHHN
	+aIq3VGR4RLdMkg8ll/c6b1FRHnFtCYSRCjUDrk1FiXIjQqIj+H/3KcChKQIoq/+5iZE8Nv15ZS
	QDpksOIeePzVsvkeR7NS0sQB6obAqK6KKwlz7rteqMheQJ7BI+H/ejYwiXMpVJCSY0muh1jwifv
	Cfs6Bbx7cxS71nzRg/GA==
X-Google-Smtp-Source: AGHT+IHv11J/UiQuXRPc53mXWiSRrpkDd1UzSDOJ4DL+ON/DEt7ZP7ZjRbXESDq57CD/XFRcpXXCtA==
X-Received: by 2002:a2e:a582:0:b0:372:9bf0:aed6 with SMTP id 38308e7fff4ca-37609e64b6bmr49929971fa.25.1760367147927;
        Mon, 13 Oct 2025 07:52:27 -0700 (PDT)
Received: from ribalda.c.googlers.com (56.213.88.34.bc.googleusercontent.com. [34.88.213.56])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3762e77b8a6sm31980121fa.10.2025.10.13.07.52.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 07:52:27 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 13 Oct 2025 14:52:20 +0000
Subject: [PATCH] dt-bindings: media: fsl,imx6q-vdoa: Remove redundant quote
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251013-dts-v1-1-5731ed92684a@chromium.org>
X-B4-Tracking: v=1; b=H4sIACMS7WgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDA0Nj3ZSSYl0L4+RU8zTzJMtUUxMloMqCotS0zAqwKdGxtbUAwYGFfFU
 AAAA=
X-Change-ID: 20251013-dts-83ce7f7b9e54
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.2

Latest dts-ci complains about this:
./Documentation/devicetree/bindings/media/fsl,imx6q-vdoa.yaml:19:12: [error] string value is redundantly quoted with any quotes (quoted-strings)

Fix it to make our CI happy.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 Documentation/devicetree/bindings/media/fsl,imx6q-vdoa.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/fsl,imx6q-vdoa.yaml b/Documentation/devicetree/bindings/media/fsl,imx6q-vdoa.yaml
index 511ac0d67a7f2360afe22b81d76644575081089b..988a5b3a62bdebeda6b922a986b9ac93d0933e51 100644
--- a/Documentation/devicetree/bindings/media/fsl,imx6q-vdoa.yaml
+++ b/Documentation/devicetree/bindings/media/fsl,imx6q-vdoa.yaml
@@ -16,7 +16,7 @@ maintainers:
 
 properties:
   compatible:
-    const: "fsl,imx6q-vdoa"
+    const: fsl,imx6q-vdoa
 
   reg:
     maxItems: 1

---
base-commit: 3a8660878839faadb4f1a6dd72c3179c1df56787
change-id: 20251013-dts-83ce7f7b9e54

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>


