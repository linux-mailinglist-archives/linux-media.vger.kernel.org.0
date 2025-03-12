Return-Path: <linux-media+bounces-28072-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D79CA5D39F
	for <lists+linux-media@lfdr.de>; Wed, 12 Mar 2025 01:11:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D0555166130
	for <lists+linux-media@lfdr.de>; Wed, 12 Mar 2025 00:11:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FE1F4C85;
	Wed, 12 Mar 2025 00:11:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IUJxAp1/"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD1133D76
	for <linux-media@vger.kernel.org>; Wed, 12 Mar 2025 00:11:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741738306; cv=none; b=oiqQc2I++s5ZKwjsdLyTHM5JypbchJ53pNnocIBKL5ZT+OPSVX+xwL0YC4TqF1i/VXHBdopDok3DgWa3QSZ/PqP64Vx/A+1aQ2f6CuGeHs+fVHYsHFzLX4UVAuXkWTXSuBAhBmY8Jssq9Z6cjaK8lj34YI8Mj8eTQ3XRGOgYEEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741738306; c=relaxed/simple;
	bh=r4uMDAv8ZLSzUVvmQWSjnGSf+Wa5/Jy45T2NBY/rZWU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OPo42ufpM9GWRUQSN1slFOFEBCF0iH6YUefNtdcWTfIHCybM7+7FZSbFYlNznRApz7GXKJ5qZafQAZrSs+SWBx3F5MrOVUp7MOCtMGKzaZBynjkI1en7k9p3M/4TeTOaSHZMKVx6ULfetJR06RA9YZIwhULoSA6DqG2RHk4/rYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IUJxAp1/; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5498cd09cbfso739426e87.2
        for <linux-media@vger.kernel.org>; Tue, 11 Mar 2025 17:11:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741738303; x=1742343103; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=x71rDFrG69wZWQuxGcSWuM7VOTt0MMfh9Nt7EV6dQ7g=;
        b=IUJxAp1/7H0GgbmfiWUMLoaK6coxlwKeGs+WcqTl6HVbbMtKQsE0toWP4YweW4s2M5
         EtY72MyME6dAgkzkW63Zkn2J63WIojHO/jP4MHUXvba967ubUWJ5/9zHF93C/FVfSlDv
         026x0C4Wf16zixi0bU/A93lSaBXbOnRBj4LYOYFqoZRm4z/xfnh7seNYFnGxr8NW+cXj
         LVFxC57BRkvbQiNI70SxWYZkeFAxfQg/dBcu0fM7IndXQuUyZfedsJafnlecEpvynx3R
         I709r7BkzOS4B/m/G816vL1aycmxj3BgcfS2diWm+oIkA6wVEh02dum1kdlCzjVjLWL4
         lwsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741738303; x=1742343103;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x71rDFrG69wZWQuxGcSWuM7VOTt0MMfh9Nt7EV6dQ7g=;
        b=wIliGYZYTtmkdwj71bVl7f9CWkv4qmE1lhEK90TOZEQCB2WvAUgxYKMhBUftKCJc9T
         AYWIAh2OE0jGTEzsEbeoCYyKvbiPN2+f6dwCGTzXN57l+3FrPEt9whlNlmJgTGSPIrlI
         AKXXB0xef2/USoWPjPOn5ZgqJMIx3hzHE8EUO6yosm3LRr693o+5usKScL0Oewlg15AA
         YdJf+xz/MKj2S5mUBDsrSPDrt7SG6XZwAV5q1kpR+mgCgpAehv3hUkNwntmZX4Is9vXu
         NDMVdKfk/pI5BWt4ikHekCrVZn7tmJUwCIUmrBsi/5ExaAQWJTMZicQGLf1riKuG4aFO
         h0kQ==
X-Forwarded-Encrypted: i=1; AJvYcCU/edZdcAvs+wXj+jWtAF/KKRDgAPCE7Wao1EWv6pNwtPy4Ks2GS7w9wIuvxbOSn3C21Egv5zMMD6Sk+g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyn39Sib4aPam1gHJ/yp7Udo0cxrurN3fumaQELDPR2XxXeXvJm
	hyisnAEJ62OuUSDUkZl7qUQZIoNpTbXJGfZgMZ3ZX/7ddN6PC+dM1fUgAMFhwDg=
X-Gm-Gg: ASbGnctwl/XsMwmX8Tv3jgsIoT7dv3FHcEw2u4jgDP2ttE6PIUDLQs8oQPX+EWDiozo
	HAXyimypcWW1jWvOoN4Sb5dVDxk1wWGVKccXzEaWtvO5JaD2IeQEnsiyuMjiGvV0yoIAbuWR+xl
	XuKbV/o9u+qCt4p/AN5Pp9JuMeqTcUFlzuPzX+4L6VgzWkmq17dVimM1lYUDqcO6bRcE8BFoYk7
	joSapt/+2Xcd9pQjvcf8rPgRh0rQBYEjg/++NG2pwqKh3D1nDj06rdPUbhty6zdA4/ZF1DfIUtM
	V1zxfRVdh5LGaQy8zYBaTR21Clz7n+vNibexraNv8MrIbmJNEwG99ToRPqYusjnCM8nZTPZHKjk
	2Zu5+9CbcGX7XdQuCPyCIYgegfM/eQGOrLizQFRGGilND
X-Google-Smtp-Source: AGHT+IGueK5QoMNin55y1U+ReeRji5g+uoV6EuXb1xgUOJA1idypd0Lwh+bCzoqSFe0fWJeU2bJx6Q==
X-Received: by 2002:a2e:a9a4:0:b0:308:ed4d:6291 with SMTP id 38308e7fff4ca-30c206a5124mr8288491fa.3.1741738302256;
        Tue, 11 Mar 2025 17:11:42 -0700 (PDT)
Received: from localhost.localdomain (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30bfe741fadsm15984251fa.10.2025.03.11.17.11.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Mar 2025 17:11:40 -0700 (PDT)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 0/3] arm64: dts: qcom: sm8650: Add CAMSS device tree node
Date: Wed, 12 Mar 2025 02:11:29 +0200
Message-ID: <20250312001132.1832655-1-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Qualcomm SM8650 SoC contains a camera subsystem IP, which is
got supported in the platform device tree by this change series.

Qualcomm SM8650 CAMSS IP contains of
* 6 x CSIPHY,
* 3 x CSID,
* 2 x CSID Lite,
* 3 x IFE,
* 2 x IFE Lite.

Vladimir Zapolskiy (3):
  dt-bindings: media: Describe Qualcomm SM8650 CAMSS IP
  arm64: dts: qcom: sm8650: Add CAMSS block definition
  arm64: dts: qcom: sm8650: Add description of MCLK pins

 .../bindings/media/qcom,sm8650-camss.yaml     | 389 ++++++++++++++++++
 arch/arm64/boot/dts/qcom/sm8650.dtsi          | 328 +++++++++++++++
 2 files changed, 717 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/qcom,sm8650-camss.yaml

-- 
2.45.2


