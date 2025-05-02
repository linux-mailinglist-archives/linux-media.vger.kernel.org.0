Return-Path: <linux-media+bounces-31649-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E71F4AA7B09
	for <lists+linux-media@lfdr.de>; Fri,  2 May 2025 22:42:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5A5EA4A4576
	for <lists+linux-media@lfdr.de>; Fri,  2 May 2025 20:42:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9936620102C;
	Fri,  2 May 2025 20:42:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bYoZQyrT"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EB601FE45A
	for <linux-media@vger.kernel.org>; Fri,  2 May 2025 20:41:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746218520; cv=none; b=XJ3jui2eANa7mxF5IO5z0PXj37+J2uug1BE2p1tV02EzpBzxFatw0RuybWrdq3c9GOsMexPvkYLZQux150KUH+EDzhxbyBhK3airdpGn+s38xmTk+fwdmYJx4H+TpJfmjLvxBKAEBY7zhTmmmFHl6uHDVkRhC22UK+qDkUjtBg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746218520; c=relaxed/simple;
	bh=Gor5eZeOe95pbDOvaRNjo/pq9TyKVg+UU7vzl4dpmTg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IzDzvXCJp63OXDzJPnPg9kaZDjXLuXNws5tMh3ipAQcPpJsKhfVY3IzuI+TIHJFoMIoWwvNIB9plbXWS6OTpCrQnq6xXPVuGD9ia0Pbdjef00d7A48YIuCr5SDNGNkUo9US/J4G26iPN06AOHUvf7/v5u5lAB8TXxRRv8VDccFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bYoZQyrT; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-549c70bf6caso338780e87.0
        for <linux-media@vger.kernel.org>; Fri, 02 May 2025 13:41:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746218516; x=1746823316; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vh/HB4YndctfR9aIAkHgSZCg6hCNtQ3fblG9H0OCQvc=;
        b=bYoZQyrTCvS0D/jHFsU22HGwlfzc5QrwHl8a7Nh8c1c0mEEzJMbztDxxKPofSlbw1o
         WemgjDhlDBEMjFID/VyAvpdZ33sh+OOvg5sTMrO5dvaDrzQYYe/3O5BSMUxnvQbDpldD
         wX+W6j68Q1eJHrfMdIvgMVw12xABsfPGDRzRj4scJjh82QX0wzJHpERtHxeN29+mjZMq
         Sa4GLBXb/hBLrhF0AfsLBAwob5ACFEJLch+jqD6NsRyB/g2IPftJotoM8Sh5Rd/o8/Oq
         fcjGoE5tlDjykGdKXzHzYUXeCok1FCafvAiPnby1NCRrIXeGwNLCeVsXzsWzzLxLtiRQ
         HmWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746218516; x=1746823316;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Vh/HB4YndctfR9aIAkHgSZCg6hCNtQ3fblG9H0OCQvc=;
        b=r3dNQt3MUe1p6I/PxWMXCzM4dVJw32m7dDCNqBMfbxIR1furqLmOxT5SiyCCuHus7+
         oG6l7JCThNbPFnXLG/peyaMYPiQeyXHIuZwfFpPfo7K6eZ2x7IXxJ4cqESVr5QWIYnnG
         DgQPrsNE1xmy0IZiWQqCPlOSYVTa7HEI5Q+xpsSnbxacLicKFDWJmxmLH+Hni+ACB1mP
         zw6ZKImgzZTZ8TWNvOsItcMRnTkX//tEq+8kqSWOm76o/4wPNkJd028WZrE58gjAuYSa
         muofkibb84RoElEQTyjmB8iD9pANp9dqqO2j6sl7NMR8H/yLw6qOAUmPlxlSQNZJMCQY
         GtSA==
X-Forwarded-Encrypted: i=1; AJvYcCVmdy/q0Fo8IRRod5U+6CqAwrjKCRnTlaNkbP/4hVjFIcutBY7Dnezup1xVoI3C3qbb0jped4EM46gMmA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4NEkQlxx8wu+vjQQKg5dgcdXOCstrG6yh3KNarH9feOc+/gYE
	Ulo/wU1kwvbDRoD2eGxaxGVnWIm5UNqRX+RU9ZsJXL0E+Xp2S8bao9Lko//YXnk=
X-Gm-Gg: ASbGncv9obTuGsD7vLenTFt5ygRK6pBh+ge+XFg+t3dU6RY0z0gNmHzNT5k8HB/cZXC
	Hzvmn0PuUSF14ORbGz2gdaqz1iVXzW4o7aTOvZfExC5PcedvyUIejnYMLk0qsi0CAgmAR4jtUcW
	rX+7XbkDNbYMmL9DJXAJfpQtaG7NC8cdcJy0F1AujKTKIOTsDuwApsFDy5EcQXezT0crSW/pU88
	qcqIp7nFDXzxC8wzsQik1L04OgDPJ2LQTYtmJ4T7bMERru8sG/5rEaH8fdckoa4LF0OcbTqjiNZ
	Tg7vh2J+bffzZaKmx28DSRFX68SjPict8Do22oVeIwh4BibDXZqgx9nmb6noSro9P1uT0eHTzey
	G8KdV5vkfiMooekkQJWkRdI8ktQ/tfQ==
X-Google-Smtp-Source: AGHT+IEvl+Xcmxwi3YlwZ0zrf65PyUadsBHWXJ9yXMntXt5u3cTRlzR9GC1W0M0Y15MOFSmh90ma5w==
X-Received: by 2002:a05:651c:146d:b0:308:e803:119b with SMTP id 38308e7fff4ca-320c3afdda4mr4623881fa.1.1746218516348;
        Fri, 02 May 2025 13:41:56 -0700 (PDT)
Received: from localhost.localdomain (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32029017825sm4675301fa.40.2025.05.02.13.41.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 13:41:56 -0700 (PDT)
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
Subject: [PATCH 3/3] dt-bindings: media: qcom,x1e80100-camss: Remove clock-lanes port property
Date: Fri,  2 May 2025 23:41:42 +0300
Message-ID: <20250502204142.2064496-4-vladimir.zapolskiy@linaro.org>
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

Since clock lanes under CSIPHY are hard-wired and non-selectable,
it makes sense to remove this port property.

The change follows the same logic as found in commit 336136e197e2
("media: dt-bindings: media: camss: Remove clock-lane property").

Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 .../devicetree/bindings/media/qcom,x1e80100-camss.yaml       | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
index 2e7455bd75ec..c101e42f22ac 100644
--- a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
@@ -146,9 +146,6 @@ properties:
             unevaluatedProperties: false
 
             properties:
-              clock-lanes:
-                maxItems: 1
-
               data-lanes:
                 minItems: 1
                 maxItems: 4
@@ -159,7 +156,6 @@ properties:
                   - 4 # MEDIA_BUS_TYPE_CSI2_DPHY
 
             required:
-              - clock-lanes
               - data-lanes
 
 required:
@@ -362,7 +358,6 @@ examples:
                 port@0 {
                     reg = <0>;
                     csiphy_ep0: endpoint {
-                        clock-lanes = <7>;
                         data-lanes = <0 1>;
                         remote-endpoint = <&sensor_ep>;
                     };
-- 
2.45.2


