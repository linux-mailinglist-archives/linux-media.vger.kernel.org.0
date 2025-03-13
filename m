Return-Path: <linux-media+bounces-28172-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F4B9A6038A
	for <lists+linux-media@lfdr.de>; Thu, 13 Mar 2025 22:43:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 528CE7A7935
	for <lists+linux-media@lfdr.de>; Thu, 13 Mar 2025 21:42:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 113831F63DD;
	Thu, 13 Mar 2025 21:43:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="b2OAtKlh"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BD581F4E5B
	for <linux-media@vger.kernel.org>; Thu, 13 Mar 2025 21:43:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741902201; cv=none; b=K2Dus2ddOWOM6acC/mZQSk894eGyUa36xdJ2pvt6E3QzBncQSXpRk8mwEACKXVBnRy72vGLsJMOnvkR2bcVhkNur15vFIv9pR0na5CLloXR/qEEuoXGuKw7BayyyEezb88t1twbBsDSyKZfNr0a1BUtv+Qu+zqPgQEspvKdxNag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741902201; c=relaxed/simple;
	bh=NaZu91DC4T8heFZFo5XZ2syZfWhTaJWbyUNy8uixAT4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eWvRZyKkA/dG/P1zKwPvGBvKUmGIXy6JQbAE/AKCwLoowC9sUOuA4IvW0fxUJn8OvMUDdeB1Ubzt15Hx59+laZFRNtECiY/MPxsznXFxnFEdjmi2rJWs4p4408sTtkffopqJWaWq6l3akyUevIUjI+oaCeCX1Qq51y/EaZZjM8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=b2OAtKlh; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5e61da95244so2592576a12.2
        for <linux-media@vger.kernel.org>; Thu, 13 Mar 2025 14:43:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741902197; x=1742506997; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v+Au6V+nm5YKxU288WKh4NUBJU2SyJevP5UMvrIA5i8=;
        b=b2OAtKlhBW9xtV+GU2vRGF+mKQ5FDsaluza2OobOIxUn8H7em+qDlQiFNjU+ownvG7
         ysrZUuJANLkUTWX8MWj8EWGM6y6LH4IT+q/OdVwhaiHv/gQWyABwymqLUwpCFx+RtjOd
         FpnlSiarc7d0JKBkvDSsOLk9dJZyXZPbs9hdC4p5YbptwgkdlNcYcEPwIw0zocNrw8LW
         1C2vghifvLfBPRz7a9QWbDjx1PUsQmCjtPlgozIAbuBLeAns3ciSobTK7ibQ7qOnmpFp
         IC8uG2JDyNZfRyYLBJ6XZwxs2Ut/Fil1ZlNrsTAz9ltuoTK1OlaJXGJllZ+PX2Xs1Th9
         RSRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741902197; x=1742506997;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v+Au6V+nm5YKxU288WKh4NUBJU2SyJevP5UMvrIA5i8=;
        b=wLeh2m+Ai8jj81JUmfGdsvOo3en2Cf8N9uM+qkH3TKpYhnqnK8aCAotkmjGXTmWC8i
         vaUlHSf1St8jG7x4CGcrrCblMIezbJDmUcLDV/qNQhOlKtUHJ64A5v5YPIqmyOLWO5Aw
         GvClcRlz5k6vzCgfAgdhF5mNQe8vPmDw6SpBrX4FQybacsPBV7G6Y1uciEwBFsASCRDJ
         6/W29wMpT4oNnZLba61GLEmiLeWurMM3XSOXekb3RWnhfDigpiJafXkBw4Fhe4TRjYrD
         +MPg7jw2kdjEHcwdrNxMmEjZKfZmj3k336pT2IVd/sDMZMTbLJCu5RaTfxp6wifk3d4c
         EwVw==
X-Forwarded-Encrypted: i=1; AJvYcCW/T1qAoHhKavbrhgPi6x7vV+x3LP/SOiHlPsRVp8mnGnLbzd691PyZJJIRpD3dIx20QM8EDHIvA5x4Vg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzoZnIb2VA/iI4HEvWnpmpWaDl6SWZrBfjzfD8Z6l40YDJMQBhM
	zz14XMoL/3VYsCflGirKSKYD2ONgy/1Sneyaye3K0Y7vz/NBaMQwQsxGvjX9IIA=
X-Gm-Gg: ASbGnctw5fSCCm0nnm8nBACdpB9MFo6ARpIkvEZh8eFdIDTZkbGPN1mcFelwwOed3BW
	iuAwgqhUyvD/i16qu0F9QoKgN/f0gzELbQ1fN5n7Zm6dD7MgOdYYoTcQvZK5VEpSluKrRLYM/im
	LYtl2ScKYuEFhWX49efCV74e3wefJBCi0DeWIpPA/6uMv8T1v7bKIv3yAOtyjfZpexrKv9GR1vh
	8EVlc80AN/FKo7SRdfxPwr1ioV7gEfiYrNAebI2Tla1eM0rG3jr16r5ZrGOAHBo29J/1F7ipMlQ
	7OjbSG/RU60Ri1ZW1ph1bfrTQ9lYmMlCSsr1vsqujvBCzVVFZOrydqFLjWOFFYWQj1eyDVVRYd4
	+029CCMgmv6tZA/DGM+bfNLeiyICw5mQVxR666gzDemtkC82VI22p8dZlBdRlHsBVQ5beRHo0lW
	2XteE=
X-Google-Smtp-Source: AGHT+IHvGRlUnca+L9ajzxTMQ3ZVV9sUWOvELGKMoU5iE6uqCQcPOCFhwS9U5tYCom0ODtsxVB3EIw==
X-Received: by 2002:a17:907:6ea9:b0:ab7:1012:3ccb with SMTP id a640c23a62f3a-ac330181a8amr10857666b.14.1741902196696;
        Thu, 13 Mar 2025 14:43:16 -0700 (PDT)
Received: from [192.168.178.107] (2001-1c06-2302-5600-7555-cca3-bbc4-648b.cable.dynamic.v6.ziggo.nl. [2001:1c06:2302:5600:7555:cca3:bbc4:648b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac314a489e0sm126938866b.151.2025.03.13.14.43.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Mar 2025 14:43:16 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Thu, 13 Mar 2025 21:43:13 +0000
Subject: [PATCH v5 1/5] dt-bindings: clock: qcom,x1e80100-camcc: Fix the
 list of required-opps
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250313-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v5-1-846c9a6493a8@linaro.org>
References: <20250313-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v5-0-846c9a6493a8@linaro.org>
In-Reply-To: <20250313-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v5-0-846c9a6493a8@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>, 
 Todor Tomov <todor.too@gmail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
X-Mailer: b4 0.14.2

From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

The switch to multiple power domains implies that the required-opps
property shall be updated accordingly, a record in one property
corresponds to a record in another one.

Fixes: 7ec95ff9abf4 ("dt-bindings: clock: move qcom,x1e80100-camcc to its own file")
Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 Documentation/devicetree/bindings/clock/qcom,x1e80100-camcc.yaml | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,x1e80100-camcc.yaml b/Documentation/devicetree/bindings/clock/qcom,x1e80100-camcc.yaml
index 5bbbaa15a26090186e4ee4397ecba2f3c2541672..938a2f1ff3fca899b5708101df7f8aa07e943336 100644
--- a/Documentation/devicetree/bindings/clock/qcom,x1e80100-camcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,x1e80100-camcc.yaml
@@ -40,9 +40,9 @@ properties:
       - description: A phandle to the MMCX power-domain
 
   required-opps:
-    maxItems: 1
-    description:
-      A phandle to an OPP node describing MMCX performance points.
+    items:
+      - description: A phandle to an OPP node describing MXC performance points
+      - description: A phandle to an OPP node describing MMCX performance points
 
 required:
   - compatible
@@ -66,7 +66,8 @@ examples:
                <&sleep_clk>;
       power-domains = <&rpmhpd RPMHPD_MXC>,
                       <&rpmhpd RPMHPD_MMCX>;
-      required-opps = <&rpmhpd_opp_low_svs>;
+      required-opps = <&rpmhpd_opp_low_svs>,
+                      <&rpmhpd_opp_low_svs>;
       #clock-cells = <1>;
       #reset-cells = <1>;
       #power-domain-cells = <1>;

-- 
2.48.1


