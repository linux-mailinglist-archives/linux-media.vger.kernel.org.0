Return-Path: <linux-media+bounces-36841-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C2FBDAF9460
	for <lists+linux-media@lfdr.de>; Fri,  4 Jul 2025 15:39:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2CD9B1881FD5
	for <lists+linux-media@lfdr.de>; Fri,  4 Jul 2025 13:39:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22F222FF497;
	Fri,  4 Jul 2025 13:38:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HsGrDjsm"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F7DC2D77E6
	for <linux-media@vger.kernel.org>; Fri,  4 Jul 2025 13:38:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751636337; cv=none; b=Cn0CwXyxiFD5tCUNTHN52Rt5t/UcppVZPNML0gBpjPP51FEpcfy96eiB4NIrivXcT5n291Zl+Iyr2FatXlV1C5H3WOACj00BV1NdB4UekjtjNFp/xY6DW6NcL4faWSoJr5f/O+X8QuW88C+NwuFZBHAscAPM8ySpl/96zKxUsXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751636337; c=relaxed/simple;
	bh=Ni0dpnJU3rhbEwaxJZOcN4eUR3ubAzS3k4xsQNwjQ0c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=iaXVlBywYdwd2ljf+1fUVGz/A2HwbF+tc5IHbIWq/849sx+JCotQknyp1MC27KbGj986c0jCY+4YZRQCT0aWow9UUtgIxpw2lmi8EkHo29svXvi7J2Sqoj/4OLg0h/MJQsPfr84tPwWWKGRoCV4ER0C/5GpIrNNUZnEmJ++zw6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HsGrDjsm; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3a50fc7ac4dso428708f8f.0
        for <linux-media@vger.kernel.org>; Fri, 04 Jul 2025 06:38:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751636334; x=1752241134; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tmZly46HF2qvPjEzdRLzoBDfMCOkNolKlPyBFoDkbDc=;
        b=HsGrDjsm0QXN3BGJspmN4I1SPw2PkWKcLIG1PAB6d5wlv2qABupgrsW17gDSXdjJly
         H3nkncaRANAvkPwlPd4Bu633OEkh42Hf8ThuefKjbleUkfrYKAnL0kq0Ep1YgUHXhU8d
         d4PYtpkCDfJU+lojQUbRUF5rEaxJSE8XO2N9u18/JDeE3ulgi8Tuc/bzsU813KelxP9i
         qR/m61OVMC/MwAquVMr5nkfBYPu3UK3n/zY3a0n689LQWrgsdICYFk5CvKTDW1tTjKQX
         RPHpI+2XGRwiR5eFDbai5alqWudmawg+AmA8/50aMNsl61sJMLOTekon7mnEFwWkpdEX
         9vlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751636334; x=1752241134;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tmZly46HF2qvPjEzdRLzoBDfMCOkNolKlPyBFoDkbDc=;
        b=s2rDu1isxh9KZmjjTZIyELuMT+IO7R5V5udfYBgbPBB/osOS6Kxlh/aUxJwU1p8E/V
         kDeTgAPYYML02+gVFwwqy0gdtgtdl1CY/SQkDCEAp2xk2kOhSs4mp9ro9+RgmYvdWklM
         sDRhMxjR3vGyQqXy7DgHeM8LVVQc5HzWyWPM2jYtijI71DNMbt8MW5kHxyjd/ws2J6VB
         M1lpRh0gqdwdaHghAR+bf6eEKcKlvsICNR2pa9vEygE4//bF6HqFJl1wIcUgASWJd6Xh
         WKI+ukc37O84MZX5/M1uRtqoYgCBrb50Hp9r+Svqrd+dwKvgTvLkybyzbHU5gh0Mr5Gh
         x75w==
X-Forwarded-Encrypted: i=1; AJvYcCVDMR0HXG96UPTLrnfkdVH8vqrgYHPSyKbgwzPkQMF78jA679Xb58TTc/8kcKrFW3IbpJEG4dU6tE+5Rg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwsNZYSl+DM8kWM6CLbWN9bVvJV7eTViHOCp9Zhi9JLGEwh2Mv5
	ID/mw1VEatdRltd1jaaQVLEmctaRXS/G6l7+lC5l+pNr+wRZH8GDlwzco2Or1uInRiU=
X-Gm-Gg: ASbGncunlxGP8qxV1CXGtQhlGx432qRmtD2C28sH8gWFX+SyP8EL3P9xnojIYAVma7C
	FvUf2rFzhWLxGAKnJbjbr5rn7zuZvJojMRdXpAUwHTBXk+fjodiV0p02pg34zN96t2C9FEx9rjj
	anqq6pY/+/rTndH7hLwRopGqJLOyta8Etkq3KUstw7lpgaTR0hBWJQ3URHwDbIc5xkmVZFLZpTs
	88xh4FLV5CBLK6+IHYtA+2Zax8rOXKVGk+LraW1AuBu94DkOhqkaaObP0fFMARxve7SQy1sPjkb
	dVMO2tP18EfHOOjYHy01W85lJdRHhuwOstFkxdvt9UT7I14EZi5te0BypX1/dT4jMMx2xRU3G1k
	4+pBugzwE8BEq
X-Google-Smtp-Source: AGHT+IFbADOmXUyvQXWzmqL0Vi+x5HWen9VdaHK/QLd7cw/v0MlRhdUI0DW37OsEiFwGE10fuPnNcQ==
X-Received: by 2002:a05:6000:4025:b0:3a4:c2e4:11b with SMTP id ffacd0b85a97d-3b4964fc4bdmr2704268f8f.51.1751636333777;
        Fri, 04 Jul 2025 06:38:53 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff21:ef41:779f:7637:a2a6:1bda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b47030bc79sm2522595f8f.9.2025.07.04.06.38.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 06:38:53 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Fri, 04 Jul 2025 15:38:41 +0200
Subject: [PATCH] dt-bindings: media: qcom,sm8550-iris: Add X1E80100
 compatible
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250704-x1e-iris-v1-1-c3137d979e43@linaro.org>
X-B4-Tracking: v=1; b=H4sIAGDZZ2gC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDcwMT3QpDoFBRZrGuSaJpioGxcZpJolGKElB5QVFqWmYF2Kjo2NpaALM
 e2UdaAAAA
X-Change-ID: 20250704-x1e-iris-4a5d033f4a2d
To: Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Dikshita Agarwal <quic_dikshita@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Stefan Schmidt <stefan.schmidt@linaro.org>
X-Mailer: b4 0.14.2

Iris in X1E80100 is pretty much identical to SM8550. We can use the same
firmware image and the same definitions in the driver, so just add
qcom,x1e80100-iris to the existing list with qcom,sm8550-iris as fallback
compatible.

Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
---
 Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
index c79bf2101812d83b99704f38b7348a9f728dff44..9504d7ea23f4a30fd2d03e8683721641f8b1a115 100644
--- a/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
@@ -20,6 +20,7 @@ properties:
       - items:
           - enum:
               - qcom,sa8775p-iris
+              - qcom,x1e80100-iris
           - const: qcom,sm8550-iris
       - enum:
           - qcom,qcs8300-iris

---
base-commit: 26ffb3d6f02cd0935fb9fa3db897767beee1cb2a
change-id: 20250704-x1e-iris-4a5d033f4a2d

Best regards,
-- 
Stephan Gerhold <stephan.gerhold@linaro.org>


