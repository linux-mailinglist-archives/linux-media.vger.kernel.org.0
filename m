Return-Path: <linux-media+bounces-5675-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C645785FF21
	for <lists+linux-media@lfdr.de>; Thu, 22 Feb 2024 18:19:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7C46528819E
	for <lists+linux-media@lfdr.de>; Thu, 22 Feb 2024 17:19:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85935158D9C;
	Thu, 22 Feb 2024 17:17:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="w5FaFJCO"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0260D1586E6
	for <linux-media@vger.kernel.org>; Thu, 22 Feb 2024 17:17:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708622238; cv=none; b=alqT4f+Wv/AC1n3r/6jQeskW6JjWunyLSNvYfR5QA3c8bnUEPgbVxwA2V2B2EwSleDxaim3kizrxuWw/dSvQi0wxqAUVHRDS7FVQbffL+V7HouApPsTpvHC8Hz1kDXEbTZwVOYaIujTZ3lYz2pLECuPerRvcMez2qXiGH9W8p8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708622238; c=relaxed/simple;
	bh=4o1+/xiccn6IbZFyFdK5VsobG9GOTyhsglvL8I9FFnU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ovYh2MMf0Ovkf2LTJdSbNq9PjX6xxxVQuqoBBNdBxmGLcoyJCRPVezS8aFwWnf72sutZoqUIfwgVEAKzPzMTk0p3o+aE17gpX8d5A1lcwvdoXR6zuo0JcKO8tsaZ9Nn+lQFvlSzfYL2QNpVwIm6OHUERlX8LZKvaOd5FTDsZmek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=w5FaFJCO; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4128fef00d6so1183435e9.1
        for <linux-media@vger.kernel.org>; Thu, 22 Feb 2024 09:17:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708622235; x=1709227035; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MvlvisPT5Ben13N2VpV4ugUj5QGv6luxiD0ao9BxeLo=;
        b=w5FaFJCO9D3RAF9eLMmVH3O+Yto/r9JtGBF+hRwr4fn6LD0Ga9YcnM4c5OIy/ZsU8B
         0Ikzg1yHEe6uLBX/p/EXm8Njv4sWlT6baWKiDSZuOlLUUpvAXjYsyo99OszN9HRvZoHc
         VuNih3CzpHGcn5SV+gQtO2kG+ghLssrYcvm9tgRRvCyLJyipvSUl2zHPyD0qimO5kVPw
         +m4Poay8z1kKhaUM0Ii4XjfkTu2Bao13C4gLVoCyZnRKUI1uDBLmIVoiSbF43s8DLZyc
         qVYaC2/XsLMU4ZM5Pn3cP61aWAOR8Ek05PfQBk+XqM61Ep3RG6m62GEOlItDu9gynIcX
         l1aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708622235; x=1709227035;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MvlvisPT5Ben13N2VpV4ugUj5QGv6luxiD0ao9BxeLo=;
        b=dkM5GVfHQ1tOm1UYeeEnp/U1JMpxEiNdEBcgNpua0uxdRy6/Lq751LS/ozuHjALDOF
         rOzzpC8r00iRs7EwwhJfcMTCdNt1xAGWX9Jkz+4CTQF5es6418WwUQMfleMHnTk1ZCCz
         /REvQZmL5U0dGk4qZVKrbL6fBgZP7s9MhatGHu3doQoqVmXNJX5YXXs3zuyn1WPLnEvh
         IcJLx+ZMwY1PcX9A0efjV/52V934Mb1IoV5xY4xbrvamuHy4SFl8HDuWreTMfJRjTX9u
         WCW/tqyOybJTet3qtMxOWs1tWcyqb3zGb/LoSLn7TnrC2MRCKkWn1RYWz5xg4nFFzez2
         h7HA==
X-Forwarded-Encrypted: i=1; AJvYcCValGczESsrrzMGaVBuQM1BUhrESdjUXu2y92e1R9ReHSrjYPk8apQgMa+uLoUH/64CK/N2nTHAv9VP2SrpoSrqYhE7syMA7pintRU=
X-Gm-Message-State: AOJu0YxraA9ymjCogcsG5hUEsLCL4a5bN2gheZtMCceTVYs9qSWDOUSb
	QRACcpCRj/3nbBVzuD2ybYrT6oHwOAJu6gyGAL4L9TYbK4I+4+TlbXhzs5oxEYk=
X-Google-Smtp-Source: AGHT+IFh0J92vILaksmRT7F3B/QT/Hprse3K5+Rx3tOAYoCDqO3ED1yTgMeYAb00DS3QuDi++fmveA==
X-Received: by 2002:a05:600c:a386:b0:411:ee70:ed5c with SMTP id hn6-20020a05600ca38600b00411ee70ed5cmr16596123wmb.12.1708622235258;
        Thu, 22 Feb 2024 09:17:15 -0800 (PST)
Received: from [127.0.1.1] ([176.61.106.68])
        by smtp.gmail.com with ESMTPSA id u7-20020a7bc047000000b0040fe4b733f4sm6656512wmc.26.2024.02.22.09.17.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Feb 2024 09:17:14 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Thu, 22 Feb 2024 17:17:04 +0000
Subject: [PATCH v6 6/6] media: qcom: camss: vfe-17x: Rename camss-vfe-170
 to camss-vfe-17x
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240222-b4-camss-sc8280xp-v6-6-0e0e6a2f8962@linaro.org>
References: <20240222-b4-camss-sc8280xp-v6-0-0e0e6a2f8962@linaro.org>
In-Reply-To: <20240222-b4-camss-sc8280xp-v6-0-0e0e6a2f8962@linaro.org>
To: hverkuil-cisco@xs4all.nl, laurent.pinchart@ideasonboard.com, 
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Todor Tomov <todor.too@gmail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, vincent.knecht@mailoo.org, 
 matti.lehtimaki@gmail.com, quic_grosikop@quicinc.com
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.13-dev-4e032

vfe-170 and vfe-175 can be supported in the same file with some minimal
indirection to differentiate between the silicon versions.

sdm845 uses vfe-170, sc8280xp uses vfe-175-200. Lets rename the file to
capture its wider scope than vfe-170 only.

Acked-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/Makefile                             | 2 +-
 drivers/media/platform/qcom/camss/{camss-vfe-170.c => camss-vfe-17x.c} | 0
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/camss/Makefile b/drivers/media/platform/qcom/camss/Makefile
index 4e2222358973..0d4389ab312d 100644
--- a/drivers/media/platform/qcom/camss/Makefile
+++ b/drivers/media/platform/qcom/camss/Makefile
@@ -14,7 +14,7 @@ qcom-camss-objs += \
 		camss-vfe-4-1.o \
 		camss-vfe-4-7.o \
 		camss-vfe-4-8.o \
-		camss-vfe-170.o \
+		camss-vfe-17x.o \
 		camss-vfe-480.o \
 		camss-vfe-gen1.o \
 		camss-vfe.o \
diff --git a/drivers/media/platform/qcom/camss/camss-vfe-170.c b/drivers/media/platform/qcom/camss/camss-vfe-17x.c
similarity index 100%
rename from drivers/media/platform/qcom/camss/camss-vfe-170.c
rename to drivers/media/platform/qcom/camss/camss-vfe-17x.c

-- 
2.43.0


