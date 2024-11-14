Return-Path: <linux-media+bounces-21408-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 02DAD9C8F81
	for <lists+linux-media@lfdr.de>; Thu, 14 Nov 2024 17:17:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B0778B45BD9
	for <lists+linux-media@lfdr.de>; Thu, 14 Nov 2024 16:02:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71CB917C230;
	Thu, 14 Nov 2024 16:01:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="MOlUHzwh"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F01416B3B7
	for <linux-media@vger.kernel.org>; Thu, 14 Nov 2024 16:01:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731600109; cv=none; b=RqnlOL+PL8BiT+HPxml2mk0Ukadf52uQoDXGcFb7QcaP8kspEfXrRHhsbcU6IPs1AZSRyIIN17Cx3AfeFl5AFTiaZJmou028SGoy4rmdTwPOiEbxK4vJ6uFfP5LFRqM4F0c7ZNSqDP0PKL1XmZjhzf9k09QqB01q4/gRp56CO4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731600109; c=relaxed/simple;
	bh=LLKUlHSRdQo0ASKheAI2lktC1qkTUKqGMf38rCFKTT4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=F+W0qimWpErlxhJz1FdSY32PtsgP4JRTnFTCxBJA7jwFU94SRTIkOmGaLYQ4axwRpVabk9k7fVerpqZjwB8i47fR9BQX5p7H8o42kdjmPZ6x0Q+7jhQWrvjjd8qtPbXtnh3MRbeZd3rj3WcvRdyoVQK5JZo95tAkz7fvt1lkaf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=MOlUHzwh; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3821a905dbcso515959f8f.0
        for <linux-media@vger.kernel.org>; Thu, 14 Nov 2024 08:01:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1731600106; x=1732204906; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6sBEsvd+dgZ/xP6/kn7wo3kVN9KTyz4HVn9G9Q/OIqs=;
        b=MOlUHzwhE2C4MFFZ+6rO/zWHBsZQZN7iwJSzGYyeVQ+zyZFkZG4FmcpTY/v7Lpqet7
         izpyynOLpnZft6U3tp9Owhqq38EM8XU7WDsA0l19bGMmDgXmzAj+aqCudN5O3LngsLia
         KEKoNkP13bLo6mC0ipx3nls6sZEqIpZH8JMM4JoUNq/s/0qiksAtb7DuG4xnA3YUNQfv
         t15Ob0XMZH9br4Kmb8fDMKSBtPz7xLkfZKbTM1yA9T5Pt1eS/jZ28+DrO/ybMDKBctsQ
         1cJS2W+Ql1Ey6x8JQGi+CAtimBVco6TcSeQk3p3Vq0aBJRMt6FhJlf5IbBQxKSbdOTO3
         DQzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731600106; x=1732204906;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6sBEsvd+dgZ/xP6/kn7wo3kVN9KTyz4HVn9G9Q/OIqs=;
        b=DfzFmuSrFHYb/EbDwe6Xl4rj1UKAaqJZec84OXRzXB0kh2j4KiuMzq8WfCLnoFm3+d
         sq7qWP5aNYJItLzXe9Kny0OC77WGcGJxNXg0ztKI+vsEl0rKUOsKPMQOpw9hHSjcm2AY
         S0ovH92ZT4JZLLvVkIHJ289JSXyT0Yd3xqFC3yJFaN1nmHjE/kOg050ftzK7Are4vb/8
         Yc0tkE3d5L00bCEWW6YBUJuBzUDXJgLjsjzYxWugBZRG3WAX+drt7wEnFVp87JGPyc49
         mL1yfSF8m1KFoO9u9DepCpUnRQBm8REej8iECs8Hl8lb2IbBIOX9bsR57dMn8rweM6cR
         qckQ==
X-Gm-Message-State: AOJu0YwVSMNnrw9FrAaYXsBW05NIb+J4hHefhnj85qiSfgphwqj7vx5+
	hu0Q+3j/yXJTtyagr9PEXGm4S9ftlM8zEyraCcq6sw8GiQFz/wuEtRekRqLn3n8=
X-Google-Smtp-Source: AGHT+IG4Sy0eRFWGgQ022WtiTP8SuksgBmcBl+ihey6/w0qCP+GyJB1dxeBjLookfEv7e1llkV/zYw==
X-Received: by 2002:a05:6000:18a9:b0:37d:4ebe:164f with SMTP id ffacd0b85a97d-381f1883d96mr22287017f8f.46.1731600104522;
        Thu, 14 Nov 2024 08:01:44 -0800 (PST)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-382200fe00esm1139024f8f.42.2024.11.14.08.01.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Nov 2024 08:01:44 -0800 (PST)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 14 Nov 2024 16:01:14 +0000
Subject: [PATCH 2/3] media: dt-bindings: media: i2c: Add IMX462 to the
 IMX290 binding
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241114-media-imx290-imx462-v1-2-c538a2e24786@raspberrypi.com>
References: <20241114-media-imx290-imx462-v1-0-c538a2e24786@raspberrypi.com>
In-Reply-To: <20241114-media-imx290-imx462-v1-0-c538a2e24786@raspberrypi.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>
X-Mailer: b4 0.14.1

IMX462 is the successor to IMX290, which is supportable by
the existing IMX290 driver via a new compatible string.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 Documentation/devicetree/bindings/media/i2c/sony,imx290.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx290.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx290.yaml
index bf05ca48601a..fa69bd21c8da 100644
--- a/Documentation/devicetree/bindings/media/i2c/sony,imx290.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/sony,imx290.yaml
@@ -33,6 +33,8 @@ properties:
           - sony,imx290lqr # Colour
           - sony,imx290llr # Monochrome
           - sony,imx327lqr # Colour
+          - sony,imx462lqr # Colour
+          - sony,imx462llr # Monochrome
       - const: sony,imx290
         deprecated: true
 

-- 
2.34.1


