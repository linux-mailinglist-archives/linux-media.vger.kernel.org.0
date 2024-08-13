Return-Path: <linux-media+bounces-16183-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 564ED95024A
	for <lists+linux-media@lfdr.de>; Tue, 13 Aug 2024 12:20:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 007F01F227AF
	for <lists+linux-media@lfdr.de>; Tue, 13 Aug 2024 10:20:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B27C18B47A;
	Tue, 13 Aug 2024 10:20:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cUTLFWcv"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 010B8208AD
	for <linux-media@vger.kernel.org>; Tue, 13 Aug 2024 10:20:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723544445; cv=none; b=e4QBghxfag1L1sACEuFWNgrB5+vsexptxbMmiB7SYJvFGAl89jL9G8Nq4to3BQYmYP5cHLZFluV+cMuMANgnHanHbYdPayPm5YajNrU9E7Et6jXhNxZy03J43AZr8z8Xp5NkoAx5rzm+f0/ntxwwdilgrUyiNyCn1KbyUJkyM38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723544445; c=relaxed/simple;
	bh=+bAE+IPFnXoXyX+IQcm/27Efz0l8mtqP+1M6sRFioGc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=d3bJBxCjHzCUu7L/eYHmt8WDzh8nIlUWStDCH8d/+tIbmSpRCtzFA36G0/LS2eoxTfbqp8YLDcZO6suewPs7tCNOeRYwo7ukDk8gDzGMjxu0SXZo2+s0zOM8AkkY3+Ubexz62cIciH257xswuEi9fOjEeap8gdUPGhv4EX2O+iA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cUTLFWcv; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2f166ec1265so9999611fa.3
        for <linux-media@vger.kernel.org>; Tue, 13 Aug 2024 03:20:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723544442; x=1724149242; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DX7W21Yh/mjR26O8GKAlfXIfXrqzTvCw1xoGhXjnBmo=;
        b=cUTLFWcvPaeQ/Y8X9nGKrKcAghquDQx6t8/YmrDJoZPol/qA5vcaatMCMjTi4B60zN
         fKzu786aElmJkcZXQNEe/MSm1l3vPWDZjCXP8uoLA1+VLsuYH8lUTJuAayA0OtZ/3hZJ
         V3iZ6UKz9RzVRXNaiSHjCZ4LXuzzn+YfHbdxVyKX/IYPnoKI93/ZxFBC+WS1jONaYior
         3NWaUACfJGHrPam2zSXwsUIx+UV64/tbeybK145yma3MJQ/+P8PCFyQGrrefRJFzxiqI
         htktTgTMg/9cYct5UjKJXyBorTvDJgHI7ii9OWVijvp79KimF21Lo8PWLoBqdUtao4cp
         Z/5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723544442; x=1724149242;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DX7W21Yh/mjR26O8GKAlfXIfXrqzTvCw1xoGhXjnBmo=;
        b=gD4oa8L4W0PCEfCSVb5YBRVisDKluGTpucn1MFAnvHMYV06ZmWIlBnPjEGEfjOkF50
         DMun6io8ecQlfpn/0bkvREoPCfL3i7x+Yt/geVdgA0Kve8YTAZsF4IfWLHtMN9rkrj8O
         Vi2r8KWR03PzHKAJ+mWNcpRTevUnda2g/yKDHkKRqML09sMd6Gg8RwfoBIHA6K1uC8MJ
         xv4WSzapncoATcK+JoHY0MhEi/wmduFgk2zLkY9uyMwa/DmSb8d9UtRtGsadd+0XyGf7
         jROewDoJmrxEQut//f0hToFPcpFMxbNE028/IiQflKI9xfIV+wqVLamUzwzfiCYQTjNd
         bE3w==
X-Forwarded-Encrypted: i=1; AJvYcCXx/j6+RVvKMI89mbDE3m2qv3Mb8cO3rhf+rrKGTek/yT/WwpXiuoSM/oqCagRuEGvBHJ4FfjyKXPAGxg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwILD8zbT4kx4rlkIawoEizQWR+SXQBX1QdEPTvDZ6HdlW9zZjg
	fibsrVp5MsswM/LVbLz65ipxE1EPWGS73+c4hy25qbraH83iLuZ5R7ico4ip+CU=
X-Google-Smtp-Source: AGHT+IF6dTnOB3zKQmaJKOzExBpsJDPGd/M7Fo3Lc8kYvoQwyxWz1+CKJCaj/mT05eno6Myf5S5LWA==
X-Received: by 2002:a05:6512:31c7:b0:52e:ccf5:7c3e with SMTP id 2adb3069b0e04-532150239ffmr786680e87.7.1723544441898;
        Tue, 13 Aug 2024 03:20:41 -0700 (PDT)
Received: from localhost.localdomain (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53200eb3ca5sm965917e87.55.2024.08.13.03.20.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Aug 2024 03:20:41 -0700 (PDT)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 0/6] media: i2c: og01a1b: Add OF support to OmniVision OG01A1B
Date: Tue, 13 Aug 2024 13:20:29 +0300
Message-ID: <20240813102035.1763559-1-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The change adds basic support of OmniVision OG01A1B image sensor on OF
platforms, and a few follow-up changes from the series extend runtime power
management support.

Previous version of the change is found as a shorter patchset:

  https://lore.kernel.org/all/20240620124745.1265011-1-vladimir.zapolskiy@linaro.org/

Changes from v1 to v2:
* updated device tree documentation according to review comments received
  from Krzysztof and Sakari,
* extended runtime power management support, added functional support of
  optional XSHUTDOWN GPIO, XVCLK supply clock and 3 supply regulators.

Vladimir Zapolskiy (6):
  media: dt-bindings: Add description of OmniVision OG01A1B image sensor
  media: i2c: og01a1b: Add OF support to the image sensor driver
  media: i2c: og01a1b: Add stubs of runtime power management functions
  media: i2c: og01a1b: Add support of xvclk supply clock in power management
  media: i2c: og01a1b: Add management of optional reset GPIO
  media: i2c: og01a1b: Add management of optional sensor supply lines

 .../bindings/media/i2c/ovti,og01a1b.yaml      | 107 +++++++++++
 MAINTAINERS                                   |   1 +
 drivers/media/i2c/og01a1b.c                   | 178 ++++++++++++++++--
 3 files changed, 272 insertions(+), 14 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,og01a1b.yaml

-- 
2.45.2


