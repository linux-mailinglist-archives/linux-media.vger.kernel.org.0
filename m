Return-Path: <linux-media+bounces-35733-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 52CD7AE6114
	for <lists+linux-media@lfdr.de>; Tue, 24 Jun 2025 11:43:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D131A4A042C
	for <lists+linux-media@lfdr.de>; Tue, 24 Jun 2025 09:43:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F374B27C154;
	Tue, 24 Jun 2025 09:43:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="roYw0110"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A404427C145
	for <linux-media@vger.kernel.org>; Tue, 24 Jun 2025 09:43:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750758189; cv=none; b=BW81ZbfL57llfG/n3WHdiYaTVwaeqa8fcLKIOA4VPpwwD49yD8yNWEKAoaY7Q412J2dWu4FnYsk2rVS/aK6x9F9N8LBGGcRVQ3ZHR5v4nJFPtuPgBCS+ArkN4Lm0WcxG4pNy5QTJSHhHV9l3ZbyxJ8TrYv6tdkHCN7arH/OhXPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750758189; c=relaxed/simple;
	bh=vc4T3W18PvkFg0rj79V12KCNRxUBkAeilmfIoZ3rL50=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FP6SW9DOuDO/Am0Y89znzOBY0f6OYWYztC0ZogQLOlyOt3C73Atx8fcsIFDJvcSf+/s8mIm5ucHgvEQYt1rfxFwiV7RG6Fn8IZGh2gjBNRAsZVwfnArQecbvbcSfU35afdS5SW7MhLfLcQeYdGYIs6AniTduQhYXmvMT/tluyNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=roYw0110; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-553b7a3af9aso463242e87.2
        for <linux-media@vger.kernel.org>; Tue, 24 Jun 2025 02:43:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750758186; x=1751362986; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IDaAFYI52ky8ECzgixqMv55kMOm5gQwoYNn82tPUwfI=;
        b=roYw0110eEOIWrAzYN9tmfg6Tnhhr7WtLD9B64/tfbQpXkwx0NZEZci5zGW3oPS8rY
         zFPQ+9CvhXZ44YsUlG6jDWRwgYkjs0IsPkY4NS1YMwh8FEKpPrGwopyYARqo2ycrhDrX
         k52nSlcRqGhkO4yP+9f4OJbjh9J2OKLz4Ql5IXsiLzSkd8lPGvkYOmgu9AeLFno3CTdW
         Gh4E6ovcfiIRSxU/7vhWdxuLFcLI+DUHtMh6qx11AmO4zVx1K6lWrlT97n/S35jBP2Yd
         ovy6K7AmccBQtejUshwhMlA5BWm3mC+rKxeo6W4PhGmo6eZV6MCVJFvwhlfTfLi00TRs
         HH4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750758186; x=1751362986;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IDaAFYI52ky8ECzgixqMv55kMOm5gQwoYNn82tPUwfI=;
        b=iC9MH5lDE/xQd+3RTeehvP5eBpSBNsZIOKTi1Lcs3JjgLDe83CLl4peo5stW0AiZgQ
         Rwq5IUyQJ729Wtef0mUSLJkBDT8oFTYKBO4NqxWAlNvV2bEXViGrfEj7XYX4Nd2HLOEG
         nD3F5lt1vlj5HWTLDpegxgiLYV4LZfYpOy10KWAcTBEgCbyXmj39aplOmpAiAwk1gUhF
         uT+i2K6NVgtcu2JpSKqSRXSYkKXF+2oW0Ud/nwukXumGgsHWZwWF9wKRqo9DWR7dLJMB
         TRkWNSj+SKXIBZYVJrx+lt5XQr5vrDfem4lQRFwpWVgW0LZOYcqgkIP7fpJo9dqZIVjx
         MkoQ==
X-Forwarded-Encrypted: i=1; AJvYcCUi87ELDLdudbjoJMlbaaXuGcr5Rh6TzF1Q/wQOHO888JmDq8BPT003OtjwY9fRmdnKo1uT3aMV0uyzCw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxuYOydRzWN/g2DALTaYfBwBg1pwBXjeFqaaWuQJLOGdyge1PYB
	s/23hX0Vbg7ZzewSiNYGI7cMMdp/bNi3LndqCvy9R8jlw0XbiGEc3ITQ5FIgo2BpCpQ=
X-Gm-Gg: ASbGnctppqYxQNW1AKuasi3/Mmj5zSheCHqxNkYuFlv2sNlIUyUIjoiKvGiwvG7cOij
	SD+Vpaq2+iPH2pEa43AYCN5O3OsZKzXm+S6fZXjf3rlo2vC4RRjtZXK/oDkMT+hZxAELm4i+frd
	3SMcFJcl9LemwQm8B5yNUMVTBS28NXPAZemFZATonqlshPtg5dR8Rq0wdf0RJU3J40puXZ34Y+c
	RusUzkZo8rPQpIPZcwALdoaRZIvaGjG02BKHPPkVCVDtwMAWWnKenOAjmR4NOEmWsG2VsuF+rso
	9bUidnRQnrWlG9RMxIiu5e1BSMSv1SvXQb+N/vyhOUvShiXCIJAz013pQ1P3qBLp3k5q3D0L7AU
	jHaUzoEcDHCVySMq3emUKaP8MwnYCDefLCfqdpyBd5+z/QxUvcAY=
X-Google-Smtp-Source: AGHT+IFB5Y+BNiftWwmBvAOA5kXC+eLDm74Ade7DqALAPV7CezKuc5b/NKdfTZFuJ1jHFwoH9fG+fA==
X-Received: by 2002:a05:6512:239d:b0:553:2a74:b455 with SMTP id 2adb3069b0e04-553e3bb63d1mr1481243e87.4.1750758185716;
        Tue, 24 Jun 2025 02:43:05 -0700 (PDT)
Received: from localhost.localdomain (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553e414445asm1745793e87.12.2025.06.24.02.43.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 02:43:05 -0700 (PDT)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 2/2] dt-bindings: media: qcom,x1e80100-camss: Fix isp unit address
Date: Tue, 24 Jun 2025 12:42:53 +0300
Message-ID: <20250624094253.57441-3-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250624094253.57441-1-vladimir.zapolskiy@linaro.org>
References: <20250624094253.57441-1-vladimir.zapolskiy@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

According to the devicetree specification a unit address shall match
the first address value of the reg property.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 .../devicetree/bindings/media/qcom,x1e80100-camss.yaml          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
index b18c7d1794ed..303c1458d410 100644
--- a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
@@ -189,7 +189,7 @@ examples:
         #address-cells = <2>;
         #size-cells = <2>;
 
-        camss: isp@acb6000 {
+        camss: isp@acb7000 {
             compatible = "qcom,x1e80100-camss";
 
             reg = <0 0x0acb7000 0 0x2000>,
-- 
2.49.0


