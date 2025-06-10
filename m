Return-Path: <linux-media+bounces-34395-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FBB9AD307B
	for <lists+linux-media@lfdr.de>; Tue, 10 Jun 2025 10:33:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DFC5B16D461
	for <lists+linux-media@lfdr.de>; Tue, 10 Jun 2025 08:33:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A54F2206B7;
	Tue, 10 Jun 2025 08:33:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TJeqOGkH"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CB28220F28
	for <linux-media@vger.kernel.org>; Tue, 10 Jun 2025 08:33:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749544416; cv=none; b=NCcfLhsecOjERA7+5UVTzOJcp8OGzT4CUOzYTcJF1wRUOmGmMzbVAjJDMWWydWkMlpsEO27wN5aOBA/UcA8MqSF8ge8cM97uQiLiZRJoTxUYHOVa3EEAlwx8t9nGx5CYqKEXTCUajYVnOfP6I0IBlpHquzOAcNtVAY0XyccXy6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749544416; c=relaxed/simple;
	bh=pux6+eb/W9FN2HoN5vMcC3kEUTHEg5oAoFHBsjMsScY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XX96v9g3Dez0a7sVKcDxsG4QP2O5KXHUNQ6XnXgcrYv29ckhIvULoBhhPJ/ZaWI/kY5lDYf9QwlAwjQMlK0vgmfJe6/wA8xthL86R0FKFKP1TtJjnPo3WpQCZX04fUUMWsNDCr3kV5yS4GurSd5hTxKP+QiEJh4Oy7+iYFbG4tY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TJeqOGkH; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-553237a1931so383861e87.3
        for <linux-media@vger.kernel.org>; Tue, 10 Jun 2025 01:33:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749544412; x=1750149212; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tXDUs5/+IldxO7NKXVBzYozOWgACkNjwwUA9PlSG+Pk=;
        b=TJeqOGkHNUqiOE4tJvs+tT66+FmeSoHy6MS4IlIinxIApsc+JABWnhNxFyKw/LK/8v
         lbiRcsjS/9/4lZNSXM09ENZSOTB3G0kGWZiYhxy7osUxWkTWcifhsjdgvde78q9QMkXu
         NmjT+0Qsj9NW08dJqbehZe46HCZ5j22UFsdscZeaOuUukmslMbDRnGsoc/cAX2Y6bsvc
         fA3DaKNuueGcraUxNI5AgYuGA68JY9wjuoMx2O4GzAKjoVWGvZG0yVX7FSZ8DMfQhwr9
         Eva1VDD2S6uw9NEBfBe83NgEN0bt/VVCdbL3GxlyBPIekdVeYcb4C5jaorxErwoqSNO3
         ouWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749544412; x=1750149212;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tXDUs5/+IldxO7NKXVBzYozOWgACkNjwwUA9PlSG+Pk=;
        b=DUKW26h9QNVaiCGeK6v4dLcHDV+pAwyhKViKZNzSZRaQ+RB1kVmEYJatOMctLPpNmy
         TwXIrymvAGr+Oy6Y+VnEXhYLSn6Byw1jmcZOX99XjjWs4l9fqbuVlWWRDsGyov/kfABn
         9wHrvuIQFda35zts0s6uwJgPXrxzW/AxfwX99c3OdSjXpqMzw9Be7CPZ/5v0aQG8s95S
         7Vu5QRWL4KUK4pRSQhjiwL+frTYWAQDeV5wqjafy8vZVtRkjAuTTAlheCpWjkL0o4Uz7
         mABFFMxoo/kPE+D2c+lY8uwrXtJ9wzGbOQ2yRdO8lzqLAYcCVtuTmYCZT+EU2zs5CCeF
         USYA==
X-Forwarded-Encrypted: i=1; AJvYcCVe/p4g1ZwMGcqnvG4MdphmOqE9/+5/4bzJGjDbJMSnEEtqL5dkvjfQ03FnAqtGcIUIK82NOXFoyxly5A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2z1hfjX63fGneQGDLq5ohx+2Elz6O0RvPw3sAwvsdi+bSn9p8
	GNaOtC5JZIIsLbnagkwmTNoftto5oiaJEVrfmcrUzVCVMCi3qRyHznCmzAy8styBu1A=
X-Gm-Gg: ASbGncuqXDGsQDRY1QedQARqvoIwDP6HZ47L5KlNqrOyJSWC4+4VDTKmfIO50mojj55
	nppQbJ2i6eWPkOzt3/1OWplJs+W4Y3+9ZDlzfdF5zNTJstX8VRm/ui1RWLbuQqofFdmAg0X29Dd
	wkPpHi075NhaNDDQ5YVYHFCagW6bcgs7ugcbcQWr/qJmjN/5ZQMGOygn9jvKbONwKHhHdlu7bKY
	SuS547GaE2s372X/Ji4ZFI+GK4oruLdIoH4q7vywWER+0/F2w0/QKu94XKPOV2XUncdo7SJfNB6
	bq6k6OUm24UzIBZxFx/hD82mj8rEQmkLcI//3TuBTiS/DDLSMySgGvI4U024VMffJnHfBLhbcOy
	nePgwWR76IsQ3Yl7JTFGee0byaKvJmI7q7L5zZ+m2EF8IpTgGzd+ZTm80h3KlTw==
X-Google-Smtp-Source: AGHT+IEYIQ2Xi67OSgwXBvj/zFL581W4WKugfySCgFBUviW8ff4ybP4NOKQ1O0rlnOZq1iQ1Xqg5oA==
X-Received: by 2002:a05:6512:15a9:b0:54f:c5e7:8f7c with SMTP id 2adb3069b0e04-55366c35abbmr1383687e87.16.1749544412391;
        Tue, 10 Jun 2025 01:33:32 -0700 (PDT)
Received: from localhost.localdomain (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32ae1b351fcsm14167241fa.35.2025.06.10.01.33.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 01:33:32 -0700 (PDT)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	linux-arm-msm@vger.kernel.org,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 2/2] dt-bindings: media: qcom,x1e80100-camss: Fix isp unit address
Date: Tue, 10 Jun 2025 11:33:18 +0300
Message-ID: <20250610083318.2773727-2-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250610083318.2773727-1-vladimir.zapolskiy@linaro.org>
References: <20250610083318.2773727-1-vladimir.zapolskiy@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

According to the devicetree specification a unit address shall match
the first address value of the reg property.

Fixes: 2ab7f87a7f4b ("dt-bindings: media: Add qcom,x1e80100-camss")
Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
Another fix on top of https://lore.kernel.org/all/20250502204142.2064496-1-vladimir.zapolskiy@linaro.org/

 .../devicetree/bindings/media/qcom,x1e80100-camss.yaml          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
index 7d4e6ef57bf8..959cff1a31a8 100644
--- a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
@@ -190,7 +190,7 @@ examples:
         #address-cells = <2>;
         #size-cells = <2>;
 
-        camss: isp@acb6000 {
+        camss: isp@acb7000 {
             compatible = "qcom,x1e80100-camss";
 
             reg = <0 0x0acb7000 0 0x2000>,
-- 
2.49.0


