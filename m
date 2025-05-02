Return-Path: <linux-media+bounces-31647-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D606DAA7B02
	for <lists+linux-media@lfdr.de>; Fri,  2 May 2025 22:42:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 42D434A4A6C
	for <lists+linux-media@lfdr.de>; Fri,  2 May 2025 20:42:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0680A202C46;
	Fri,  2 May 2025 20:41:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xbhPuK3Q"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A56861FE45A
	for <linux-media@vger.kernel.org>; Fri,  2 May 2025 20:41:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746218514; cv=none; b=Ad+CadYzRGAXhRiL4w12r9RvaBACVOum4T0TnToBzGwEhYuFzOcoAT6dDF7YyHNYRTWNHN16kVFgRlrQF3797NwrEVJNQAkIRlI0Ab0ZHSQjtGL/4CDWPC3TvEaLSsHNTHby7gqfJz0+AifYTn5nBVrI0uTt8ISIeCGcouKIWKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746218514; c=relaxed/simple;
	bh=MPvPmZh+KI/vX6v8BpTlWha6CK4hH13DLszHrBZcvjs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Yu2d5ZM6CCj/4dPcHiWXTd9NbVbF6jG21x4p8wbaV9t7aBz2q08QO15sI40U5caA2BlWl80QHOkV1QZRymWIBg1albwulVn7Zclko09v4eIrCe+NtUMDKDi+MB7pf6kmgZAHYMQ2Ij/tse0FHe48cbgbeEmuFtVpI7qc+zRh29w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xbhPuK3Q; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-549b11c7fddso292348e87.0
        for <linux-media@vger.kernel.org>; Fri, 02 May 2025 13:41:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746218511; x=1746823311; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tPaj/4V7+OOkqE6GFuNlK/kYu1XUR9X/tbZvlr3jjRo=;
        b=xbhPuK3QjtnsjSyTlQVoV2R6uRgGaNLtU8GURPdEVkiX87/NvrHOybPaDIf8HczjaQ
         ypQ/xWpqkK0KgEj4rf5yvLrhfPvXqyz1UpwYKT4mxIi1klT04xArZeMGPdEKw/xgH2lS
         Xs3Bc0MYi93mAaPt4NHCxHS0ILewxR9cxOl5Z0qJCatKPB5Tr53+sSjE9lVBT8+RcCyH
         pgx+HSEn5b1hxEqv3ZRFobmkRxLqqtZuK7mU9Vk4Dj/Fa+i6w0q6baVREYajDe439QL6
         GAeoSW5JQncKpYKkWDEkV2/q6dRHogtzHlVhtVypebUMvgAfdwhUHtH8BL0SvOM+9KZT
         1P3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746218511; x=1746823311;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tPaj/4V7+OOkqE6GFuNlK/kYu1XUR9X/tbZvlr3jjRo=;
        b=Xs12THTflp1Q2t03Y0S8QfebuuPv2RFHIpEZpL2iEGLD8BzJcfVWcel0Z9Pvt8iXRy
         6humE0gxtK1rUW5oaR5pWOJvloW9q6668yjYVs29xC1bE8h5J1FQ9oUV1MaKtqsmj9fF
         aBh+g0Oxs4EDMcV/U4mKcs7Y0H5KZO0Jn7oRwLegSIbolNTHC9yLXqfj6oATHOxUAJbl
         UkIujEFCIlEKYN3A5duhKAAwxihNM7Ow6w+qXT1uTj/EuregBXkYqx9GO9ZVQbazGfx4
         BOxXz6BJk59sYIEEZ9fTvArmQ0vmMIXW0rZMOUS1mrpXW+TRRXDUjdrENcROMmPyzKfg
         60uA==
X-Forwarded-Encrypted: i=1; AJvYcCUNBcfkLEnofR1NgLc4qbZrT1A1WFS90+WBFnAH4FCetm+SG/4zNNmXIUuBOP5gWfLFu92WhVyAAB0+Pw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1srO9RWXb2tGuZlawe2xu+MFhd3h3vY+OdIfxdaug3MdTmioh
	5/p28PR61NFRE+VNGASoogq3oTdw9kTCo2CGwP/eSxK47MhCKJLA/FLQ8BGqDiQ=
X-Gm-Gg: ASbGncsUwp8s2smIV9h3bQXn7f98I8+9Aoq9x4bJDSxEIJuvW60KG5jMsaCZqdtMmoO
	CKIFVHTp2+o90FPnrMomBIDAIMKmCeMsThIJI/YNydViX8Kdj8sKVhSEU7WSei3b7C7tiEmTNqk
	0n1GGxUTtNBf8iwXm9utfnDnSXHgZSusInZWXdrTtmBvKBObecJkd2EUy0oeA3aBXc0a078dkrr
	oEcZzIvuIvb4ozaDy+S9GlyHaPtYOc1hkqiIS41tMsqbKNiMrLv78TsVYerSB9RXlmyl15wVsV0
	o4JJckaQvj1W95rQhDyMt7dyXarKErkR5XskAGOdcbqMAs9+BSvEBNJS6Iq0l8wNcfVgpSuEeTK
	4HlEr+AAGRnkm0vL4GLAnEKlcBgXgxQ==
X-Google-Smtp-Source: AGHT+IEs3e6sj7jJlfP80Impdxq7EHKBnH+AAwUJDBb1D4J05e7jVTpLlGxeHYR91oREpm9Ef+xn3g==
X-Received: by 2002:a05:651c:221b:b0:30c:40d6:f564 with SMTP id 38308e7fff4ca-320c5701790mr4917621fa.9.1746218510798;
        Fri, 02 May 2025 13:41:50 -0700 (PDT)
Received: from localhost.localdomain (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32029017825sm4675301fa.40.2025.05.02.13.41.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 13:41:50 -0700 (PDT)
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
Subject: [PATCH 1/3] dt-bindings: media: qcom,x1e80100-camss: Tighten the property regex pattern
Date: Fri,  2 May 2025 23:41:40 +0300
Message-ID: <20250502204142.2064496-2-vladimir.zapolskiy@linaro.org>
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

There are 4 CSIPHY ports on X1E80100, it'd be preferred to tinker a too
loose the regexp, which covers all these port names.

Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 .../devicetree/bindings/media/qcom,x1e80100-camss.yaml          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
index 113565cf2a99..680f3f514132 100644
--- a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
@@ -133,7 +133,7 @@ properties:
       CSI input ports.
 
     patternProperties:
-      "^port@[0-3]+$":
+      "^port@[0-3]$":
         $ref: /schemas/graph.yaml#/$defs/port-base
         unevaluatedProperties: false
 
-- 
2.45.2


