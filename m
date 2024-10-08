Return-Path: <linux-media+bounces-19211-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 65B2099429E
	for <lists+linux-media@lfdr.de>; Tue,  8 Oct 2024 10:49:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 002342944FF
	for <lists+linux-media@lfdr.de>; Tue,  8 Oct 2024 08:49:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09E8C1DF25B;
	Tue,  8 Oct 2024 08:21:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bxrxIhqt"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D264D1DEFF6
	for <linux-media@vger.kernel.org>; Tue,  8 Oct 2024 08:21:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728375680; cv=none; b=VRWLlwXkP9bBeVKfRdgE+u91QfMb69b4kaOjP0VNSJISaPFxvrJm3SvE6baStcDELRi33ady4G0sb05sRoXuAFF2ltUCk4sjjdbvCwmFU5haXb82Y2adPrwrjmvGxVZ8SWa8IYRGFRsSP59jw4Mmh7tFxnRIIXIo7GqTeBPVmzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728375680; c=relaxed/simple;
	bh=4EzPo5QM2ThjiRw/jrJtbHMzQnFxglX8KRjClOzY0yo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=CjG0byhTMwAlX0jmsvuK8CFp2Fs9ekSELrB5sh0UOeRC0kmYyLYPhv6q5ew8/wPi37wNgUIoUSjFucgSyzIeXaMaxiudewH5asBjhoPtteaJPOQwy/sp7hu7MgzncMDEdYPLfRApFLZM692zS/ds04XtrcsnwqoJiTDUrMsFvpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bxrxIhqt; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2fad8337aa4so58472091fa.0
        for <linux-media@vger.kernel.org>; Tue, 08 Oct 2024 01:21:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728375675; x=1728980475; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=otwhDzOCNeNVXPwAcHPPGqulsStefaBozoSdDkCoylU=;
        b=bxrxIhqtPI5MmNmWnAGixtnvi811jyKHES+D2ikE83jm4ZsB8zhHh+aU7e8//bwJ8I
         CTBgX8Yx0PivmfQmbqqBBUPyjFFNKofVJUakXJnVjANpJ3NEyXGuxdZuudZacWwp5Ear
         01NaxNyd9iEEwyP5f8ZAYqwHlkUlOH1txE2UXgjjZKJ5g+ZWSf3UgPU8qpP5TdVPvcrm
         y0rFr3h/4s58em0lguLSEYy01WNIevNTwM67UKIKWZdy0ZMfFHnamK26xV1NBocl+vSQ
         pMI9RHqOiDcwGncZtXNk3MbkzYgEWR69bSpRt0aThQXFYEFTffbzw89SfNdPo4ACo0eX
         OFcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728375675; x=1728980475;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=otwhDzOCNeNVXPwAcHPPGqulsStefaBozoSdDkCoylU=;
        b=PH4MoAqTsG+WuMlsWZEu+kN9WdL8qcoA7ljy7sgY1H1pcpuAoIabIi6D7zmeSowHnu
         a/dt0JYc9+DQQffDdZ5CFdLrx1EJiZc36Ui7WILyIs+kpJeKsXoBVk5F0vflznqW8H/C
         aBbJkkwanUz7LnHJTafWcBpXQDBIdv2fYfToIAlh/iGMgAU5Nl7ikN0qfu2W6OSyQNfM
         YZ4d3tVNG7PrXKhj/XbwXh8ljeo5FOFbHKczFAi3QiWoQA02lvF1/EkEZDr5jzJUUTKz
         GEPuqUtnCIWhgdynX+PkKNW6vvZVfTHMQZnWW55SHGO4iXcCRltleJavH4lfChUywZ0E
         6z5A==
X-Gm-Message-State: AOJu0Yx82Jb9/Cu29j0kF2uuUbAnLk1m4HF5d5fT+yqq7fyKJuIFJeK5
	lU5shlM1a/xHdXLdq3DWPQ6LUwDr6cfIw/x/p1nqy1WLSaSErXztnrNXee4b
X-Google-Smtp-Source: AGHT+IFqsk/RK4pLE2u6T/ZBc0DVyOvnwnGD4P698W7UdSAYDiuJ+KQlUO7wxsEI+LQ99NRM6LopeQ==
X-Received: by 2002:a2e:be83:0:b0:2fb:d37:172 with SMTP id 38308e7fff4ca-2fb0d3701f4mr15888611fa.39.1728375675250;
        Tue, 08 Oct 2024 01:21:15 -0700 (PDT)
Received: from localhost.localdomain ([188.243.23.53])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2faf9ac440asm11022941fa.46.2024.10.08.01.21.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Oct 2024 01:21:13 -0700 (PDT)
From: Alexander Shiyan <eagle.alexander923@gmail.com>
To: linux-media@vger.kernel.org
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexander Shiyan <eagle.alexander923@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v2 3/3] media: dt-bindings: i2c: ds90ub960: Add DS90UB954 chip to DS90UB960 bindings
Date: Tue,  8 Oct 2024 11:20:49 +0300
Message-Id: <20241008082049.18483-3-eagle.alexander923@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20241008082049.18483-1-eagle.alexander923@gmail.com>
References: <20241008082049.18483-1-eagle.alexander923@gmail.com>
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
---
v2: No changes

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Alexander Shiyan <eagle.alexander923@gmail.com>
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


