Return-Path: <linux-media+bounces-20195-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CF2029AE40F
	for <lists+linux-media@lfdr.de>; Thu, 24 Oct 2024 13:38:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0AB201C21EA8
	for <lists+linux-media@lfdr.de>; Thu, 24 Oct 2024 11:38:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0998E1D041D;
	Thu, 24 Oct 2024 11:38:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XUGRfS9n"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB9776CDBA;
	Thu, 24 Oct 2024 11:38:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729769932; cv=none; b=STcIxx13ZamfZ4Fij6MbS7L9KtVahc8u7DbXYxE8E/reWwBIK268xGKR3wmj3W3fqNOMRMjQ72qMMl4vs3Uf+3nhJeT4OtHCn1/XNkZptEcis7zCpfUizfpxEAhs+eGpMdJ9S0J1JKpRpsPDgVFs66sBT5Eu0qVhy0LS6c0PsDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729769932; c=relaxed/simple;
	bh=hqlg2YtmWdiJmr9u0eruHGxP7S+SiiVgFKrJTmfS/9U=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=FLa6MLvQfAAqeLFmd7sH3rfGhAvTgYO70rBnZI37PeL+7Xwzhlz8j8GsHg2ZjyEU9PUjh9G8d+gr7u0mpnW3ed49s5jS9yzZQOveci1Pkwy2/VxqgHEocOtCbYGV/jNzI6nw4ex+0BP9qvjPfYhCC/LmlmXhtlqzxQ8DdCk7u8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XUGRfS9n; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-7ea16c7759cso329849a12.1;
        Thu, 24 Oct 2024 04:38:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729769930; x=1730374730; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h51FzxuqZx84XIIcsnQe3sKi7dN+XbGmdPwCk73slTo=;
        b=XUGRfS9n9y5KkSDyS1Pie3udtZEeOUszhjOHxD1MWlGLQCKuuQ2ZsrEkfzH7fI1XcH
         j6Snf5tGFWHhINCgZxLf16duuS9TmxJw2mGC0FeepQ3Dg8+vd+v0tUGhRCo2RnIv2WWl
         7NYFnAl23UU+QMUR26XOBwghRnk2VzFT2J5IoLIHTTtILwXdl3iK6Qa9WuD+DGHTKewz
         rDb08T2Q/CGe7H18eeot+77PgMnyFHs/1hQ55NnB7pPGBdbyotgdC8nAVvxZcqgDsKqs
         mw5BC142oRFLu71wPzLJo9fhac/AT3bkT4B/0Bmxn2y2t9tvogL5Vl0gaMgjtlDqmxfq
         DzKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729769930; x=1730374730;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h51FzxuqZx84XIIcsnQe3sKi7dN+XbGmdPwCk73slTo=;
        b=MTkXZbje4TvTwBydYXcBWJ9MGK41Mc+HuDprYgIWif5erX6VizHsyuYdRS3WYtVtlJ
         VGQFYlNkrTiJrrO2dxtJ0718Zwh3gjlctPyC+sPh1V+4/5tdNYu93UaGAJNRWvTgP3eS
         E8Sen0IIO0/Rj8ixUGCFMYZWbpQchN7pHArCfMYzpCiVSPaRDu49IB8khgB5yzyrQHgC
         4Mf0/fh3tFIZrWJnrUrljXGpHTBpwBA3jaAydK0Js0arkSIgz+AHSh1HoBGHSyAd77Nk
         eYkKAd3O+WxpaAI6dnbxMi2EbwPRl5GfAZ6PCGdBiH5eT7w22J27Q5Vzgd58ZBI2lIq8
         wqzw==
X-Forwarded-Encrypted: i=1; AJvYcCWMR3tUUem1Dec1rpK67wITMRTBojmmKvri84eYK9SUrk3mdbAntD0cR3GHstHCOJVPPVuD+azU7dgSumw=@vger.kernel.org, AJvYcCXW5HfxVNkQIEaoBxVF+SrZkSVncWaQkVLNcDVQILeN4hMruq7ipmlnArw6LVFvCn9T17adydrEjZDK@vger.kernel.org
X-Gm-Message-State: AOJu0YxyhfcF/ZiLalJVh89gp1sr5lxzfTKDpe8Y4ljm3SqsHAUnRbvC
	LLSIX1kASzmUDxXSCHBj8k6xCwV//eGSfS/OUMf8dlNgkYAl2llB
X-Google-Smtp-Source: AGHT+IHY62GgRDdJj2B1P8mJl5CIT+4l632XBQQyTWVwGIj6oa6s+113AuHJDtUpTys50xLwBR9hzw==
X-Received: by 2002:a05:6a20:e617:b0:1d9:275b:4f06 with SMTP id adf61e73a8af0-1d978b1cfaamr8015692637.19.1729769929861;
        Thu, 24 Oct 2024 04:38:49 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:248:317f:2ba9:e66c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71ec13d765csm7798029b3a.115.2024.10.24.04.38.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 04:38:49 -0700 (PDT)
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
Subject: [PATCH v2 3/3] ARM: dts: imx6qdl-apalis: Change to "adi,force-bt656-4"
Date: Thu, 24 Oct 2024 08:37:53 -0300
Message-Id: <20241024113753.1353023-3-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241024113753.1353023-1-festevam@gmail.com>
References: <20241024113753.1353023-1-festevam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Fabio Estevam <festevam@denx.de>

According to adv7180.yaml, the correct property name is
"adi,force-bt656-4".

Update it accordingly to fix several dt-schema warnings:

adv7280@21: 'adv,force-bt656-4' does not match any of the regexes: ...

imx6qdl-apalis.dtsi is the only in-tree kernel user of this property.

BSD does have a adv7180 driver, so should not be impacted.

Signed-off-by: Fabio Estevam <festevam@denx.de>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
Changes since v1:
- Explained that BSD is not impacted. (Krzysztof)
- Collected Krzysztof' Reviewed-by tag.

 arch/arm/boot/dts/nxp/imx/imx6qdl-apalis.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-apalis.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-apalis.dtsi
index 1c72da417011..dffab5aa8b9c 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-apalis.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-apalis.dtsi
@@ -691,7 +691,7 @@ &i2c3 {
 
 	adv_7280: adv7280@21 {
 		compatible = "adi,adv7280";
-		adv,force-bt656-4;
+		adi,force-bt656-4;
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_ipu1_csi0>;
 		reg = <0x21>;
-- 
2.34.1


