Return-Path: <linux-media+bounces-40493-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B56A0B2E848
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 00:47:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EC8221CC240C
	for <lists+linux-media@lfdr.de>; Wed, 20 Aug 2025 22:47:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DD792D8DB9;
	Wed, 20 Aug 2025 22:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kxevNaGH"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4568B2652A4
	for <linux-media@vger.kernel.org>; Wed, 20 Aug 2025 22:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755730013; cv=none; b=Tqo6hWPzkjDArNVClXvpBw6y/7wOKYoudBLji3iG+RC6YPpvOliDwP/gPcgYYsCONRoCQrrz/goFZG1U9jogIdXCFlv2WITLJfS7nGrLbrVBu6dgiYKUKb1a1FVgJ4uJa5VR6Ook+TSI43gspKQELtdcGmRPv9LWsGQ47DNiAJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755730013; c=relaxed/simple;
	bh=KU3FTthwRowVMTVaTyLmf4pD6LnJDA7ySyBmSeT38Y0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YmWF4RkehOpvJjj1SoePknN3oqTBfw/2Ka6AVb4IH0fErmWfJa11oIr68yZpLRXTKjZ6qXSk2sdRCIsxzMZAhPbqE06lhTpo/MIeMpVriO6knz/fgoNjrZP30SHd7Oh6vI2sDxXehfL3jEC/RtIrnaRjd3BHCCUwai1KnjQDY9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kxevNaGH; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-333f914fb11so634621fa.2
        for <linux-media@vger.kernel.org>; Wed, 20 Aug 2025 15:46:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755730009; x=1756334809; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JEosG5JItKWGRoBCSGIzX/Bvhweg8i99hxt52TxZk8k=;
        b=kxevNaGH75PbvLtEkntRKNAaWZRzS4lcxyZbtcWUSJ/rChis/VcJSb0IVx9+vG3C5R
         SQ+eW1dhvMd4qjJDE3YlqFYRwt6bVkEQBOhVQSrvKejfCGK9TgYazD1IIwJjqJENbAA5
         gVqcphsa3w1SPCuR6YhtTm/Hl2IOQQeuwOmCg7gFjzoD4UcM0QenrsE4+az+oshMyc/M
         QZ4V+3bRunjRl6u4kab8TBiHb+tjHDFxT4fLA4CflPgAuA9vUbtaylPxz9PTm9L9t9sS
         9VczcZ2oCUk45PHNHYl6vPQMFsaGSKrMV8rW4YqBPqAZfK/HgWK0OHJ4WLA9TWTO+T0o
         8ntg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755730009; x=1756334809;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JEosG5JItKWGRoBCSGIzX/Bvhweg8i99hxt52TxZk8k=;
        b=mYAQ+bJZmPJQuF8X/Y7EJ0X/kabRaYB1ux4F+CtzGZdJzIpZb8fAahhk3rSVx5qm1O
         Zar2K+wYgVWGz3BY97oBUlFhendgVBFCGzSjT0cm/LXzsSWIGYGsYWzZTrEB2zW4plzG
         uRGIEcW8N1vqOeY4ZC+0W+LBCPWfKFW3qZECpTBm7ODBAMNbCYxWTUeNYUGhLsxW+6Wx
         W2X3epfoG36NSjFM6vwF52JiZdkhGurHByqAdfCRGGHOk5IUeW1oKqIhEdPvOnpI2m2/
         7jEixPv7wxl0rRablb3JJQ4uRDyK0gTNpakoDgYcu57CbN3L+6C1GE4sXBbxRWvUXDaI
         tqZw==
X-Forwarded-Encrypted: i=1; AJvYcCVkiDg5IwCWx07nhy9c5bwsER9mEni3//lCIN93hgR6HuHBrNTCCDGlVy5+Wy71pZCJtDjA+fSZR737OQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwCIIfEZqIGlSNU3GZx4mMFFFBMQ8BWc2Fma4RhiZzuNra1rYvl
	YhftUiRFS6wz/PnGp45QFGFbQ5N0MA852kczpPNxDH/RmexWFNnIWr/ZBA3clOSvq9c=
X-Gm-Gg: ASbGnctu+EDZpmpdiN8g/kcykKvP56DfI8gUXbYIK6DW8HgbMzvzrM8OGmsaF1y4bkv
	w2NafFiTjK0jWB4frxovYV2IT3NrvoLQaLtm22ywXu2BoJsFqRjmGgo/uU5PNi4CcwiBxQp25S8
	naLHnx6mct2TsrZflLgLdJP7qLDyAGVb9CeY8k/r1+DNhMhs5XVlULlut9EpUDyFGYhmYAzXpW0
	SZg6Vs6RELIaxMcBdcab4qpGppb3d6isXl7JTgsWea6urjI991QS+9+/vvC+JLsnlxrl5KyR8HC
	yB3khXZoBoHtFGOctwBcLI9RkpfJotyDyGyLRIGUL6GPBLkGglMKgUpYlEaji3NkFWD4hgdy0p2
	0PkHPv9quCxMoBTT1xehqNyQokObecqNw6Mubv9aavCJOCvydAStWEQp0gAP8ydrH0qbkV10=
X-Google-Smtp-Source: AGHT+IHXwVv5e7hzXq6+sGxxAKQk4+ePGsrd92r27XTXWqW9kMRIUHXYKHdxw00pG61HTVR8I7yJkQ==
X-Received: by 2002:a05:6512:3d22:b0:55b:8260:3011 with SMTP id 2adb3069b0e04-55e0d5ae669mr84533e87.7.1755730009405;
        Wed, 20 Aug 2025 15:46:49 -0700 (PDT)
Received: from thyme.local (88-112-128-43.elisa-laajakaista.fi. [88.112.128.43])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55cef3ccdfesm2841413e87.91.2025.08.20.15.46.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 15:46:49 -0700 (PDT)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Rob Herring <robh@kernel.org>,
	Tarang Raval <tarang.raval@siliconsignals.io>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 0/2] media: i2c: Add OmniVision OG0VE1B image sensor driver
Date: Thu, 21 Aug 2025 01:46:44 +0300
Message-ID: <20250820224646.130270-1-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

OmniVision OG0VE1B is a monochrome image sensor, which produces frames
in 8/10-bit raw output format and supports 640x480, 400x400, 200x200
and 100x100 output image resolution modes.

At the moment the only supported resolution in the device driver is
640x480@120fps (Y8).

The driver version is based on top of media/master, which contains a new
devm_v4l2_sensor_clk_get() helper function.

Vladimir Zapolskiy (2):
  dt-bindings: media: i2c: Add OmniVision OG0VE1B camera sensor
  media: i2c: Add OmniVision OG0VE1B camera sensor

 .../bindings/media/i2c/ovti,og0ve1b.yaml      |  97 ++
 MAINTAINERS                                   |   8 +
 drivers/media/i2c/Kconfig                     |  10 +
 drivers/media/i2c/Makefile                    |   1 +
 drivers/media/i2c/og0ve1b.c                   | 858 ++++++++++++++++++
 5 files changed, 974 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,og0ve1b.yaml
 create mode 100644 drivers/media/i2c/og0ve1b.c

-- 
2.49.0


