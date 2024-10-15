Return-Path: <linux-media+bounces-19651-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 45E7799E068
	for <lists+linux-media@lfdr.de>; Tue, 15 Oct 2024 10:08:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BA231B24F35
	for <lists+linux-media@lfdr.de>; Tue, 15 Oct 2024 08:08:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1B371AC450;
	Tue, 15 Oct 2024 08:08:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NqWoB1p2"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 848921C8FC6;
	Tue, 15 Oct 2024 08:08:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728979697; cv=none; b=J+NqV/tJVg7XjsTtwHNRV6YtBM3w1AmaXB5QoGuqtN8Cb3MkwrPmm+1XkIuiMbZ49CtW2835SUzJDKoUnCqay/05rtiRM8QGp86ZyRbAE+yC25E1+hFBUVOF1dhisN5j8FZQp1RpKLn0qFtiT9rI0wd8xNaMotvAxMakXC1mgJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728979697; c=relaxed/simple;
	bh=u5iK7N1sGDGQGeNVgL/RzdIODVfZqJiLClLx6saPxzA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=mswGmhCguoDYTvH/4giA26JeK1MwZp1JWO9RedvC9u9r1ZXSGmGGxue5JOucqqs3s4Jnl6DEK2TIaB51NICdq7EnBjpAYdBkRBFu89S+iFm2z4tOqQhEp8NK0OXKePYesQcwUhPvmfi3LvaqsQI+etF34pf54rfexLreJDslvnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NqWoB1p2; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-539e4b7409fso2839341e87.0;
        Tue, 15 Oct 2024 01:08:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728979693; x=1729584493; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LSvltiDJsHK24aMx8hk7NkxBylZL/vFqXqk0X+fc2aU=;
        b=NqWoB1p26P1otG4UwI36QiB0DcG5Yv6Fsi0gLDkkoLPLY1O3AEvT9CyusDsYR3EVvo
         l8W2P6p58v8wk51fHlaxIO4E/Y7kYFSejw4Rt5ZETK1Md01gL2M6+woATIK86cmt4fxc
         nMJ2GlNk6TAMk1cPCjrgr2zjmqGokliqCcoNKJDLq3ZL8OKjFvmzCnAbjtskj1OdKF3M
         yQTfcpkDYa4QhkmpVaIWQywVf+sIh/fAVzjOsCl+dX60CLFG2b5KJcNmvIGd77eqSeDc
         qFgQ3HaJ9slblAlFcymOaez+1Vqhr/KA2bsgX4u9qOzbiJafYsTdN4cWHxo6CQDW814J
         WlbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728979693; x=1729584493;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LSvltiDJsHK24aMx8hk7NkxBylZL/vFqXqk0X+fc2aU=;
        b=mKcBRdRJJ2MZoeo0LLyGBThf0vtjytdmvwNlUH2vnZqEn+2YiH5rK4iFn8eFCL9Ywq
         2PZVnlmU5YbBw4onJnXizi2UdePMZuuYgkAaKrMsSvSDdEsl7MRn8loRB8TA+REtkkVu
         bvEVYWF48ATRnDnOdvRfcD/Hysz2LSO3E1Vh1vqi2qung+bZcCPtylymHsDUzlpeeHnV
         Y4n5pjeJJ+W8uHcUzO4q4fM2OuWNpLsYlyn0flwrsNHNUxmS8LhzEXQq/boaw4/0hTVp
         ur0VOlCx9RgPieFU52WtvQo5f1/KutbzBWe6bzBdORrA8IPSkBUO0S7NMa0zma414T1v
         iUpg==
X-Gm-Message-State: AOJu0YykJfO9ZlhMonbOKJ6MfdFDTbRc9SSxcjRI40j7ngq/0ZrxpbjC
	j//N7Br3X8SfSLwP7ChSyFLd4tSXkjapQ6+XBGslkWEiU5VRTuj9gDbhoweKzDk=
X-Google-Smtp-Source: AGHT+IGRSgYUjdksRCpoex8/NdvF1yocrNTsMzsNDmIplJ3Y2qHfwlS+XQf1aRXxBuW0Cgf/u0y6Gw==
X-Received: by 2002:a05:6512:3b13:b0:539:fde9:4bca with SMTP id 2adb3069b0e04-539fde94fcemr736812e87.29.1728979692675;
        Tue, 15 Oct 2024 01:08:12 -0700 (PDT)
Received: from localhost.localdomain ([188.243.23.53])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-539ffff3ddfsm94736e87.149.2024.10.15.01.08.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Oct 2024 01:08:10 -0700 (PDT)
From: Alexander Shiyan <eagle.alexander923@gmail.com>
To: linux-media@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Alexander Shiyan <eagle.alexander923@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v3 3/3] media: dt-bindings: i2c: ds90ub960: Add DS90UB954 support
Date: Tue, 15 Oct 2024 11:07:37 +0300
Message-Id: <20241015080737.16272-3-eagle.alexander923@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20241015080737.16272-1-eagle.alexander923@gmail.com>
References: <20241015080737.16272-1-eagle.alexander923@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ds90ub960 driver can now be used for the DS90UB954 chip as it has
a similar register set and configuration.
Let's add an additional compatibility line to the bindings.

Signed-off-by: Alexander Shiyan <eagle.alexander923@gmail.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
v2: No changes
v3: Change patch description, no functional changes
---
 Documentation/devicetree/bindings/media/i2c/ti,ds90ub960.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/ti,ds90ub960.yaml b/Documentation/devicetree/bindings/media/i2c/ti,ds90ub960.yaml
index 0b71e6f911a8..86d43d949dd3 100644
--- a/Documentation/devicetree/bindings/media/i2c/ti,ds90ub960.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/ti,ds90ub960.yaml
@@ -19,6 +19,7 @@ allOf:
 properties:
   compatible:
     enum:
+      - ti,ds90ub954-q1
       - ti,ds90ub960-q1
       - ti,ds90ub9702-q1
 
-- 
2.39.1


