Return-Path: <linux-media+bounces-17378-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BBFFD968B62
	for <lists+linux-media@lfdr.de>; Mon,  2 Sep 2024 17:58:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 79850283E14
	for <lists+linux-media@lfdr.de>; Mon,  2 Sep 2024 15:58:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79A8D1AB6DF;
	Mon,  2 Sep 2024 15:57:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QA59RIqc"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 112561A3029;
	Mon,  2 Sep 2024 15:57:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725292660; cv=none; b=HhP2tiUfQp75a9gj7DLPYhOLvw58Fcc7Oqu2FDJY26AvgJXJuuaOHd+6aCXRxxzHmEMDFeunhFh7ATLmid3qEvMvcalZe4rY2ftwBZfh+hbMxSKPDEDyzDOGLy4s5mK0ENRzHDUzoWI+zWygmEgSUCKXCZnjXpqXP2qomFqnuQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725292660; c=relaxed/simple;
	bh=2Y1CK/ZUdRcqXt3dmTgNqjmsP7DbbBhP6WuYBevo8jk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=S3Xw7n1ulWH6z8Y6DWfKqy5JlW1+v2B0+FdkWx1bUr5BYWpL2qdYrynZaL0Mp0hkZPOVt7jP9WEjuC3UnWmWU+yFVwoaUYrDKVU8h3QiJig/JUomuSWwVw1CO+L1TklscjQaugfv4Hswtz2rvRUM8xxWTbO4QWANI/ZjH8X9epg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QA59RIqc; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a867a564911so529316566b.2;
        Mon, 02 Sep 2024 08:57:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725292657; x=1725897457; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NXwHXEw95cMboYJFBjnBrAHhlVpCookFbgIsrq6R6Z4=;
        b=QA59RIqcSkAs26B54PxiAV+x6HYvASfIscKkq+TI0BT4Pxxo/tbVpPwWLkhOiTsFM8
         ZDiL2dWL5p0U2TLumEHiUih7ZWN0tsBFY8t9xtnuWh402sOMQFhK+T4AssRozKKv/dOG
         T22HB+CF/Khln/bQ0CfYB9hMUjuyBDcpFoGs9xpslWU1E5aSq8E19x7tcloNYvsVecJa
         dIi8ErJePpeDl1xC4YgJzeOkn+cUIJ6auaGNkfZImmr//sVchc2+g6VznCqPp7qgR/cp
         c3t6iZD26DkZsODo3fP5jU73EOXz9CNCa2xBvrXd3bB+3OX9iKfilpHs4y7WksberzGu
         Yo4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725292657; x=1725897457;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NXwHXEw95cMboYJFBjnBrAHhlVpCookFbgIsrq6R6Z4=;
        b=ahWHp1nJYTrMCM86cTkINMTwsFytilvJgPzsywHpkZnorN2NUtjsU2HDxC3g4C8fOK
         /Wy5GGwv3Edz5PJbsvqSJE3jrBZwZljC+LIMvczgMoow2evnz8j+9+osi/IbXNXzmffX
         V/kLpTGP1Lcm1oMb/Ia2hLTEpm8Gx9/j7JaipnnV0Bx3mVaRQx6KxE/1C1VIztVowP2U
         c0lrUm46xQPZkC7Yjs64FKr6c8JL2JdW4z1eQUL5jR+vksFMR1s+0c6ZM2p6/uI03wNg
         M1vqt1TtWYn9NsKs+/xdu8L9RBTVCYPtx/MjO6Qy0mmqOJ0Ux2EYsY6vBzo8oAVsv+lT
         Z45Q==
X-Forwarded-Encrypted: i=1; AJvYcCVnVzku48SRvc6MICj4xj/7NlaaTtugq02nZhtJrvWdd8WvandQZlzLOlcPUFCEHVZWqGhGMpVc1xEV2k8=@vger.kernel.org, AJvYcCXf1dTg8p4+/6EKEwSUnUVE2rKULGUk1HKuOeB4Cq66ICicGoo76jzHV5k2qES3Zh1wU2T3z5Y/Lj4+crs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2f6nUcuM8IdnHlq+7XYzTv+y8l/p4WoU1Mw0OilpKfrnCyMJD
	ImJTJMrEqzTizh/+wB5zC3LnODLGp+JyeCPz5lx/xfflhvaBg3ST
X-Google-Smtp-Source: AGHT+IEMD83ccy+oSFeK9kl7eDfBn5hiI7P5VcdM1rqK0OivirKXoCNu9QzZ7dV6iRf6BU7mHdYslw==
X-Received: by 2002:a17:907:7f24:b0:a86:9690:9c10 with SMTP id a640c23a62f3a-a89b96f8b6emr676816666b.49.1725292657312;
        Mon, 02 Sep 2024 08:57:37 -0700 (PDT)
Received: from [127.0.1.1] ([2001:67c:2330:2002:af84:a410:1c4f:f793])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a89891d6f87sm570951366b.158.2024.09.02.08.57.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Sep 2024 08:57:37 -0700 (PDT)
From: bbara93@gmail.com
Date: Mon, 02 Sep 2024 17:57:28 +0200
Subject: [PATCH v3 3/7] media: i2c: imx290: Remove CHIP_ID reg definition
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240902-imx290-avail-v3-3-b32a12799fed@skidata.com>
References: <20240902-imx290-avail-v3-0-b32a12799fed@skidata.com>
In-Reply-To: <20240902-imx290-avail-v3-0-b32a12799fed@skidata.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Alexander Stein <alexander.stein@ew.tq-group.com>, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Benjamin Bara <benjamin.bara@skidata.com>
X-Mailer: b4 0.14.1

From: Benjamin Bara <benjamin.bara@skidata.com>

This register is not described in the public available imx290 datasheet.
Additionally, a read returns '0x07d0' for an imx327lqr and also for an
imx462, which means it cannot be used to distinguish between those two
imx290 derivatives.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Benjamin Bara <benjamin.bara@skidata.com>
---
Changes since v2:
- picked up R-b of Laurent (thx!)
---
 drivers/media/i2c/imx290.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
index 466492bab600..6812e7cb9e23 100644
--- a/drivers/media/i2c/imx290.c
+++ b/drivers/media/i2c/imx290.c
@@ -80,7 +80,6 @@
 #define IMX290_ADBIT2					CCI_REG8(0x317c)
 #define IMX290_ADBIT2_10BIT				0x12
 #define IMX290_ADBIT2_12BIT				0x00
-#define IMX290_CHIP_ID					CCI_REG16_LE(0x319a)
 #define IMX290_ADBIT3					CCI_REG8(0x31ec)
 #define IMX290_ADBIT3_10BIT				0x37
 #define IMX290_ADBIT3_12BIT				0x0e

-- 
2.46.0


