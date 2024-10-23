Return-Path: <linux-media+bounces-20123-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 41E419ACD9A
	for <lists+linux-media@lfdr.de>; Wed, 23 Oct 2024 16:57:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E29F8281964
	for <lists+linux-media@lfdr.de>; Wed, 23 Oct 2024 14:57:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6E541E8825;
	Wed, 23 Oct 2024 14:42:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D4Tnz4qm"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F25B51E5728;
	Wed, 23 Oct 2024 14:42:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729694548; cv=none; b=K05/X4/7x+44R4a9jxXEPoN5SHKqImkG712yMlEFv/d6n+lC9k1LK0ovyNsGaGAmYbw/f5IV04zyBt/V1a14YcTuPPCefm++YKOxfeV5/D+6B/bBBci/5aaVQj/nVuIHyHLDQhKOlvIFBV4PmCvPtssSShoGe7xXWvOEU+vGw2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729694548; c=relaxed/simple;
	bh=zpR97wImTIrx3ByzAIrCiRAwdYxRwz5Xn5EXEfOwwnE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=cNneTwbu5srvMoceNKJdIIf5vBgbIEoqmFof1w8qhM2N1Q9Omq+bByiUmUFvjbXC56su72xQ3v126K8Zfi6wEAbCL+PS3V7QTc52VKZejvkrFxbKAIEh1w9BdaNxrsbrgQ06PPxhqj3D6Q/AQ1Ns5N0Mt4BGcq3PknT2qFWgQRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D4Tnz4qm; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-20c77459558so58205805ad.0;
        Wed, 23 Oct 2024 07:42:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729694546; x=1730299346; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bYolit0oEDPjKKIauLDGCJud7Hae6w8ED+2L2v/ZWTI=;
        b=D4Tnz4qm/jpzc7fV6cG+S1qZH0o+X+oJPmt3Nhc2W4H6sPRK3it7odvTaKbeOiNmIn
         zfox4QWlRaqH8rQTB8g3P7vwvbxvjaw3rkviEgZtbiP5IcbeK7usqMunbPGohA198VNo
         EVXGPEYjlai2c/CGhQ9RHL+AhnMy2hgk/lqNyfuiPcmC3vpH3GRTjYdW6lHNQJu6hU+K
         oS6SzsqRpa8GVRXmkpM0pEIqL+FlnSJ9DDxdUfRh+KSgXGJRI9xsZLNS2VXNKwCyQgX9
         FlaJ5DOvISEXY30+egc92M4zZyde+YcMR8gkJ1JvQj3ER6psCL6hkxynDQmIQcOzCYhQ
         Dfbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729694546; x=1730299346;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bYolit0oEDPjKKIauLDGCJud7Hae6w8ED+2L2v/ZWTI=;
        b=QSwNV/jRSmeTADw4+D3/W+18S/pmA7xCKzXn9fGzz62WNS3YrM6weYEHASdGxB4qSf
         7F8LjGX6UkWvIVAR/PzJWXsx1nAcIoWjwp27kmwEzzyN4DKD0Ctg4l1ZIl/q+Sj7Gnnv
         bPUJqaOVXFdV13teAGgU1QRVHDTaLTJxTf1U21DXP+DgM03unOFffu5AYjhC61GUZExH
         Uja9myo7cRlAYRsJU5b1H6aHRmjJ57ZF6zzEgrstA1LikP6qDnvuIabHUi1QP6cA8dNc
         g/kLxDfwgsyTXTPtdNa0EjN2TNQRg8Odb775G0KMADEtnc+1B/u5Pn9yg6I2FyiSYRt7
         he+Q==
X-Forwarded-Encrypted: i=1; AJvYcCU3ioh98ydPQBD55yz8vs8eN9Oel4OOpQ6XaKq+Iw7mWOZSZEo901UCmKuFkeuR7+uXxiNTQ/4Z+QwdktU=@vger.kernel.org, AJvYcCUWsqVJvSUdUelL+piZBTcV7hD5G9GmH6CpeNtiMNLGRFSA70zu4h81lAxMhK1nmltIIAYnTFUbG04h@vger.kernel.org
X-Gm-Message-State: AOJu0YyzYgOxH+5LTcYB57xEIXooHBHlqkmFSoy21ihXM0+X1Ux7TkpR
	YEZI2h0HcsSYM4Y/FI1Jarv8AiY4p+G6FmNf/jC9Mrd6bWBO5yo+
X-Google-Smtp-Source: AGHT+IHG7wVN8sv+Wk0L7DfW42pyBFghSXVRbiqAmmc8nei7NQaHvNsehM/Zbqwa+6Obc4oF8ba3/A==
X-Received: by 2002:a17:903:22c3:b0:20d:f00:bd26 with SMTP id d9443c01a7336-20fa9e68136mr37239775ad.36.1729694546188;
        Wed, 23 Oct 2024 07:42:26 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:3468:366c:e529:6d8e])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20e7f109c5asm58573725ad.305.2024.10.23.07.42.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 07:42:25 -0700 (PDT)
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
Subject: [PATCH 3/3] ARM: dts: imx6qdl-apalis: Change to "adi,force-bt656-4"
Date: Wed, 23 Oct 2024 11:42:06 -0300
Message-Id: <20241023144206.1099622-3-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241023144206.1099622-1-festevam@gmail.com>
References: <20241023144206.1099622-1-festevam@gmail.com>
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

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
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


