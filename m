Return-Path: <linux-media+bounces-1534-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 67BED802F26
	for <lists+linux-media@lfdr.de>; Mon,  4 Dec 2023 10:47:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 13FF41F21210
	for <lists+linux-media@lfdr.de>; Mon,  4 Dec 2023 09:47:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C69891D692;
	Mon,  4 Dec 2023 09:47:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UhBta7As"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C62BF2;
	Mon,  4 Dec 2023 01:47:30 -0800 (PST)
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-54c79968ffbso2243367a12.3;
        Mon, 04 Dec 2023 01:47:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701683248; x=1702288048; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bOzMZrOc4TXLlj4e0qB5kA7+nJNtSZOuDFRaI4ekybQ=;
        b=UhBta7AshQwrD3gDEp8tXJz2Ldghfg3gSyxvSv0H78TtRUh69hAbvZZhYud1BVsyGo
         JDw906m6sdRTx5XNlnTXSPTSmxyJMdQikCuAB2+6psjSdVUofRzmEoyu7vyR3nCOJ1DQ
         2vl8ya+PfATneQAKqufziWWrUIc457tpaKCfY5txTjI3k+lmoP9cxnufp1yUmILTdfyV
         m7U7LLlOiFlTGKcLIv8rYjh9mE4udJN93aRodYJxpqS1Eg94iGgG4nASM8vYTxzV4Boq
         0XPlABCMfc+nLy9J8+1KqIOiYB804pPHP+aCpkBoYtDtQf8mvNvbBq//sTB+eTuNKIJI
         afQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701683248; x=1702288048;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bOzMZrOc4TXLlj4e0qB5kA7+nJNtSZOuDFRaI4ekybQ=;
        b=PQGrBt5DxPrW6bQotvNB7iLdX8G7ZLTSBz0gywroFdP6BGT92rvflp4xNyyUZzYpQw
         u8GJkbS37iqk6GF6u3tMHnUYNf8kRNFZe6eecfAUcDmr65oDzyKlkOadTyrPkT7Me/zZ
         m1op5UxLSUtjtGdmiXB/JsCN2ETrz8ljK1EIu7gO2Qe8myMgF3SbXMa9b+3LT9yVkaEM
         0sWht7IoltjqANuNBwcLkcvxArbWVgopfGvu8I415kQTKW3WfTjz7wFWitHnPmvCQ6JJ
         V9aI1eY29fBbdA9EkZbxYfPQEIWc2AtFYhOA8i4r/yweT7ozhW9bUoKYxdDnqD5AqIdT
         4Vww==
X-Gm-Message-State: AOJu0YzPqH1LQCRRgsT5Zw4b6dk37wZa8lHNdaJb1R9Lu0fWiStkpINi
	+M/UCCBCC3m46bFN6su9T88=
X-Google-Smtp-Source: AGHT+IFUoPwpWL/hJP440H/T3hqp7GPssu+F4HSU00luc24+ynJe7V8VI0sMaf8Y2+LXn2WVBqzL0g==
X-Received: by 2002:a17:906:dfd8:b0:a19:a19a:eac7 with SMTP id jt24-20020a170906dfd800b00a19a19aeac7mr3162383ejc.128.1701683248553;
        Mon, 04 Dec 2023 01:47:28 -0800 (PST)
Received: from tom-HP-ZBook-Fury-15-G7-Mobile-Workstation.station (net-188-217-48-100.cust.vodafonedsl.it. [188.217.48.100])
        by smtp.gmail.com with ESMTPSA id le12-20020a170907170c00b009dd90698893sm5051705ejc.38.2023.12.04.01.47.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Dec 2023 01:47:28 -0800 (PST)
From: Tommaso Merciai <tomm.merciai@gmail.com>
To: 
Cc: laurent.pinchart@ideasonboard.com,
	martin.hecht@avnet.eu,
	michael.roeder@avnet.eu,
	linuxfancy@googlegroups.com,
	mhecht73@gmail.com,
	sakari.ailus@linux.intel.com,
	christophe.jaillet@wanadoo.fr,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Chris Morgan <macromorgan@hotmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Alain Volmat <alain.volmat@foss.st.com>,
	Paul Elder <paul.elder@ideasonboard.com>,
	Gerald Loacker <gerald.loacker@wolfvision.net>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	Bingbu Cao <bingbu.cao@intel.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: [PATCH v15 1/3] dt-bindings: vendor-prefixes: Add prefix alliedvision
Date: Mon,  4 Dec 2023 10:47:14 +0100
Message-Id: <20231204094719.190334-2-tomm.merciai@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231204094719.190334-1-tomm.merciai@gmail.com>
References: <20231204094719.190334-1-tomm.merciai@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a vendor prefix entry for Allied Vision Technologies GmbH
(https://www.alliedvision.com)

Signed-off-by: Tommaso Merciai <tomm.merciai@gmail.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
Changes since v3:
 - Collected tags from LPinchart, CDooley, KKozlowski

Changes since v7:
 - Fix company legal entity from Inc. to GmbH

 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index b3d751b42927..3ffff7161e23 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -79,6 +79,8 @@ patternProperties:
     description: ALFA Network Inc.
   "^allegro,.*":
     description: Allegro DVT
+  "^alliedvision,.*":
+    description: Allied Vision Technologies GmbH
   "^allo,.*":
     description: Allo.com
   "^allwinner,.*":
-- 
2.34.1


