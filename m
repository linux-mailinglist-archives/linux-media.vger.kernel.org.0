Return-Path: <linux-media+bounces-31648-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5689EAA7B0A
	for <lists+linux-media@lfdr.de>; Fri,  2 May 2025 22:42:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4343B7B3888
	for <lists+linux-media@lfdr.de>; Fri,  2 May 2025 20:41:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEEA720766E;
	Fri,  2 May 2025 20:41:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="i4EJkGsV"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A1131FE45A
	for <linux-media@vger.kernel.org>; Fri,  2 May 2025 20:41:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746218517; cv=none; b=HJZRuHyLS/sQ9AZ3r7XZrKdENHPlwzPYT8nM0erQ6huA1WeKWs1iYVZfLc6vVlJz90CsRLUIed/F/ezImLDQ914iKvu2pm95Rzqajyh5vPt6BhWRM5TDcptUY4LYn2gnUeROj3vKggXGm6JbpSq04DVpNQ+FqIuzNoBmv8FxUG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746218517; c=relaxed/simple;
	bh=qBDUTYfzbVj4jXoJDjArfLtf7f0N+upaqktsRCcQKIY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KPMDk4dDpRpi3ztyA+dXwiNBNVu8s9sT1zzS1+vRQG4dw1ohQd9qsmyCd/o27fAUVqrqZ0odVAmBpwjiFU+2/T5TT1ATfjbOMcgGUC0FxjEjpDYeNjMsmziXey4zwlUe6drxbZCZW0dBdo1mWYQICw27d5SfgRo4scfRXyOYc4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=i4EJkGsV; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-30bfe08889fso762871fa.0
        for <linux-media@vger.kernel.org>; Fri, 02 May 2025 13:41:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746218514; x=1746823314; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=khZWzuPw8MC9kU83MrZsLmGuXdBa+7WXl5EAK6pqTCQ=;
        b=i4EJkGsVk7Jzw0oHMsycFm3uB80owx0f2IXu/9ByBbivZFAp9BQ0mBD4t6bcMisWpQ
         5ilk3RRE8hZlCTLWQTI05x2Kf75gb3SKeh1SrqZte8kupz+Kp+g6NH4aGNT0pbsN2ZUb
         3U8NUY5BBeBlovbHFHjMi+PhTFcc1ePA8gEUxkjp/+uMpwQx9uG+njo+uVES+SApDIk1
         Uhvr27Z6hD960vxtIqJZJRPxowUNKFU7MpTY5VAWkq/Jwfj7om20++9AXRw2AduqkEOq
         7yUTxsXBzaFc8vsyu46KNZDQr+QkAdGFTLv+9yRKFNDBRFFc7eMyZJOiCnDyhlXJtTVd
         aFNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746218514; x=1746823314;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=khZWzuPw8MC9kU83MrZsLmGuXdBa+7WXl5EAK6pqTCQ=;
        b=T3VV6TfGxIm3qR3rZPoEStgSkAcLr3W3mRHay4d1q2t2okwsjreV7UB4zEL2Qwwjv+
         SFBICW97qJGqf4tMbOaKjSUtnypshk5N02pGrPkZSmOEBhEyPaGMetpBZqGtYY/oFMe7
         mGv57iwY4nxoRTpF6wnM9tamjHkotUzaa5fuHmoK55Zi2xKhOiXx6chI9GKinQizPGKw
         KWIBllE9foQdDaAr3PTr4ChZOHd74H0FELj4vCNyQDvE4t94oeUKov3sKLg81j2lBYTk
         iO9xHp/L3p4KEg+HGgb+X2Iz2CnI4BwZbg80lz9wUGWgGczBQ9IzKBuXuWbOtV9thF2U
         4AyA==
X-Forwarded-Encrypted: i=1; AJvYcCWYi4g7PrGbne/85LzDvh2W6AY7V482o4TbexaoZwfhfiJtfB4eq4PKSdJfa8xp43X5w2Py3IGPlJgrYQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3ZcOS/J1VckBzSNxXkE4MeZOIDbWEVzqlQoPyi/iVnR+vqoG5
	gjwSOL+lGKH5uo9j4ZAWSgxSOghjrHxHXSW8NgEUwJSrGkoifQ0J9/aVa2SSM4k=
X-Gm-Gg: ASbGnct56K+yAkM7pmq6ez3mSi+Zm9yGvshf3jrJ5gzBr6ZEn76b3YT2L35wAS8BF1+
	u7VzVOozgZjp4FOFY5Fz0RMoQO5D+AV65xIoAFkpqv9M519H+ui4HiSEQyek10vMk3GSwL1IAxm
	p86XpRccC4Xi0OxFRtq2aF5hN03YXDS+8r9YkePVXCEW3xm6FOUibPNj1K12p2c8nusca9nAgx7
	4qIg5abDVMo/eT+HWzXdCAzhIjFnU9f5Om75v/1rScjgofAzMT2Dw1YTK2/prPZ3sOLW5Sxgkai
	l7OrN2RxjCAxry4EartXXb2VFZqSwAkeamLSboQkNDC7bam2uVH608J000JvZs5/CH3rLi8qtxp
	p8NLs8T8p6qFMJH5hvNaxiDeOdpFRjQ==
X-Google-Smtp-Source: AGHT+IF9w9Sh+K5UeYPgY598Q8/d8QkQIttClodfsnlBm65lYDB74O37sG6+IfqFPPHvC17r53zC5g==
X-Received: by 2002:a2e:a5c2:0:b0:30b:cacd:fd82 with SMTP id 38308e7fff4ca-320c4000f3bmr3832171fa.5.1746218513678;
        Fri, 02 May 2025 13:41:53 -0700 (PDT)
Received: from localhost.localdomain (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32029017825sm4675301fa.40.2025.05.02.13.41.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 13:41:53 -0700 (PDT)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 2/3] dt-bindings: media: qcom,x1e80100-camss: Add optional bus-type property
Date: Fri,  2 May 2025 23:41:41 +0300
Message-ID: <20250502204142.2064496-3-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250502204142.2064496-1-vladimir.zapolskiy@linaro.org>
References: <20250502204142.2064496-1-vladimir.zapolskiy@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since CSIPHY IP on modern Qualcomm SoCs supports D-PHY and C-PHY
interfaces, it might be necessary to specify it explicitly for some
particular devices.

Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 .../devicetree/bindings/media/qcom,x1e80100-camss.yaml       | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
index 680f3f514132..2e7455bd75ec 100644
--- a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
@@ -153,6 +153,11 @@ properties:
                 minItems: 1
                 maxItems: 4
 
+              bus-type:
+                enum:
+                  - 1 # MEDIA_BUS_TYPE_CSI2_CPHY
+                  - 4 # MEDIA_BUS_TYPE_CSI2_DPHY
+
             required:
               - clock-lanes
               - data-lanes
-- 
2.45.2


