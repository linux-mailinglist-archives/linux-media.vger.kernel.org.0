Return-Path: <linux-media+bounces-45798-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AC4BC144FF
	for <lists+linux-media@lfdr.de>; Tue, 28 Oct 2025 12:16:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 57755504536
	for <lists+linux-media@lfdr.de>; Tue, 28 Oct 2025 11:11:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 603793054F9;
	Tue, 28 Oct 2025 11:11:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FasfVChE"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF30727FB2B
	for <linux-media@vger.kernel.org>; Tue, 28 Oct 2025 11:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761649883; cv=none; b=aMoVkJGvKUoTZ3ELDG1uTX6gLrTet/zVSsRI/hTwBVwd0FBZj+CY2JCO49E4hzZgw0hQEe7+0P9WT2gBLcP5xOG9zPvMaHRNe79AaXlGo0xndXEmg5QyVVO7CxGxGCqYqPXX8ktlISTLvPQ0XTtK4r7jodm94/IsvDpmbfxp8wI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761649883; c=relaxed/simple;
	bh=4qzCYQcrCmvs1fI1Y2jGeN1q9TLaOaKK5NL7b0UxVTE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EbCBWBybEcWUZgv5kFmsYjCp/Ug1go+niOVnS3bKDqDoAlzHF9ooA1iQv+bsFTfi8EzLN3gA3XAFgSimnNNGta2qKY9C5gVaqR4WSyKmW4JCDDxhegEBN97S6FHjANeYGQPvxElMHcf6QrB4SEe6lNqpovVSJVc/AfBOXzcxDDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FasfVChE; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-47103531eeeso2685995e9.1
        for <linux-media@vger.kernel.org>; Tue, 28 Oct 2025 04:11:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761649879; x=1762254679; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NvBepMQaluNKHheiFuZLoEpaFoQ4R3PwHCfLsenXn0o=;
        b=FasfVChELow0zHK9NCh45bNPvfSrp0dgfoxwIPiRZjy3XQMxGw06xutf+9rwFL7vYz
         RhNHPbAtq9Y6dc0bws/vZhsnlGT3AwjxarnvJVe2fTsozTZ4bzraNM8jXfKhM8Fe1wXV
         FFRDALplmm+kMsZyxIrPF71Aoh+XtNkj31zAGBVXpFzW2IdoXBXH4/Qh29GWrJtXSqB0
         PJDNi2j7Pa6El818EAXatXihZ4+7EAa0klNyDKf5cA5OiZmFo2cxQoZBG4ol6pTW/lYw
         YXkgKoJrERa3/U6yhk/hfoEZAL5+cBQGz3vRBbos7EdynIsO22Xj+OJHbsJ1B4H8KnLY
         MFuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761649879; x=1762254679;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NvBepMQaluNKHheiFuZLoEpaFoQ4R3PwHCfLsenXn0o=;
        b=ekvu/dPoA9AZD2oBgN8KtSRFvudz/wcbd9PmOOKfUjY995McXXAFtYo1gdHcELoLpe
         vEXb4cir6w8uY+ZMSpXRj8/JHJsbKLmlB4U/PBs37li4mDt0TiuI57WOL7n+OShUmAwl
         dPXRjkc4Xv8oYdeOWSrgLPoq8DtsWGAZQ4BGvkGX44ArsV5gsTUIdE/IyzQwN4suoDbK
         MUXfKU+8/OexwNSVpwVY8KlUqUvsuZ1baLG57rD5z9kdP5qvGa5TaRd3k9avTch6xcb4
         mic/MwB0d2QvJjbyuC5Sc7RJnDa6HshOC5cbvlZYhWW5uw8bM8PjaOb1mcJXkpyWEqeE
         SYsQ==
X-Forwarded-Encrypted: i=1; AJvYcCWglt/TiOoNxheG1AloG/p3SY9GKevfhDDu/4c8AvG7dLa8saGm3+NJL3H7f+J/GRT/ISspi7NO+Nkd9w==@vger.kernel.org
X-Gm-Message-State: AOJu0YyQhPaRsvHqiRVK3rrsfpayCucArUrvmtnzxPzrCyraw4dmOnzB
	jRI3XiUAPkirr7AMmcp1thbIHMLohUpw/EZp8lNZv7fIRqEfCR0XD9zvoMbuyRUKH1s=
X-Gm-Gg: ASbGnctrDHmwsb+hKRo7Dw0OLNhteN+kCiFGcQxid7gyuxYeOVmL0DNRoKLwpSqo8W7
	ViNDEnFQfDdK3vK5j+hJPapdsTI4wAhapGKoI3W8E1GwEs1ThDO5BbK3GWIA4W8iEbPJb1SOB8I
	1aCTmQgCFVll7gX0PamNCANYtW/yFazaTFnmgMzq0jNBOvJgCo5FgOm1KHR3DZssIzkzdtATg+l
	VUuap+KOO3YgpjV0rp0YODPTPt+lMqFNPKaj26LYNjPfI8YEw9OPXCPYWVpzuYNxbyJp/KHEOkm
	hqy9yv2mWDWWy9G9mzP9d/b5w6nBmOLjWtyZ6MIElCrkYzOaavh5FO6vSFOWVTPdoeZ6VJ9j8Kl
	mKY6Rp1EvHr0MtaHRprZ0U3UukpPCxvwEiinV8Sq+d9RYvGAKq9t2QviUSLRaGwJcl50zL3t8ci
	XsruL2ZF13Tvtv7Kl5fiPpVA==
X-Google-Smtp-Source: AGHT+IGp17y0AcHm5V/8RFGmqH7SfEi8yaRv3lm/N2wuwDnD5uW4xhUCEWW3XzRmWpPyCMaaL9vIMQ==
X-Received: by 2002:a05:600c:3507:b0:471:1387:377e with SMTP id 5b1f17b1804b1-47717e787b0mr13605665e9.6.1761649879245;
        Tue, 28 Oct 2025 04:11:19 -0700 (PDT)
Received: from kuoka.. ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47718fe6382sm17268505e9.4.2025.10.28.04.11.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Oct 2025 04:11:18 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: "Bryan O'Donoghue" <bod@kernel.org>,
	Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] media: dt-bindings: qcom,x1e80100-camss: Fix typo in CSIPHY supply description
Date: Tue, 28 Oct 2025 12:11:16 +0100
Message-ID: <20251028111115.46261-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct description of the CSIPHY 1.2 V supply
("vdd-csiphy-1p2-supply"), because it supplies 1.2 V, confirmed with DTS
on the mailing lists.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/media/qcom,x1e80100-camss.yaml          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
index b075341caafc..b87a13479a4b 100644
--- a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
@@ -124,7 +124,7 @@ properties:
 
   vdd-csiphy-1p2-supply:
     description:
-      Phandle to 1.8V regulator supply to a PHY.
+      Phandle to 1.2V regulator supply to a PHY.
 
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
-- 
2.48.1


