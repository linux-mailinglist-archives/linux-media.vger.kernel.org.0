Return-Path: <linux-media+bounces-18646-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id AAFDE9876CE
	for <lists+linux-media@lfdr.de>; Thu, 26 Sep 2024 17:46:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0EF6DB280CA
	for <lists+linux-media@lfdr.de>; Thu, 26 Sep 2024 15:46:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98075157485;
	Thu, 26 Sep 2024 15:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="J67VL/6n"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 437C629D0D
	for <linux-media@vger.kernel.org>; Thu, 26 Sep 2024 15:46:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727365607; cv=none; b=GAHHK5sZfeDolFPE6i4IZ7/kJL4/9GJuH7mB/fZkkawD6IS6d60E/S5wPCAgBqZy3x3W2tpUTD+oiLZhkuVQ6wxuWkCdtAJcc6/89uSAXJ81GmuWG6JFSAlAp97XOXC0kutVLdfYBbmoWhq/9sBH4MDaNX0/KQXHeniAKD1yYIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727365607; c=relaxed/simple;
	bh=SuHI94/NJuRKFCunzRbAg6UvpyQ5uCb4T3j4SVdB1nQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ZOsK/PhMSkiU5+3p7GFuUZWriM/BLUuLiBitxTExOPGp19oyvkSiwi5DKg9dmqmWyNxaAvWoOKaAgf5xLZATV+xS8bww9smu+SZ8k2vB+GuKFvFbWQifRN2HESWk9zMHleayWBBtsUrycZ44px9yP2LIJTt7M4vKDHeamQa0Qe0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=J67VL/6n; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2f75f116d11so13326321fa.1
        for <linux-media@vger.kernel.org>; Thu, 26 Sep 2024 08:46:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727365603; x=1727970403; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SLuFDJ+OJh2cs6DQqYJ4Myy9hkcubhtgAstbmRPjdOo=;
        b=J67VL/6ntJvs2a+41QrFjwUCaHax3mGHvYqJwJydQ9acz7ysBStE3AnzjWIaWSWkHr
         F9bdieefNNhsOXm5lVR6uRqPOPpnUoUVHd7ZVpUkprg3QEGuEHLKr0k6ZFzk+oYpi+1+
         ZQTxUW9ahhVQjD4YhswkorssnftkWcRA4Vo0nab/pKTVQyPOpmDB7OVY5RWh8Zn/TAxj
         dm+ItQfmeQvQc8gn13fQlGwOpWdUKoeJqHXYRHMmV/HUhSqBsBQ3LAlBwtxrZ2RijBhu
         geNcLPSvKb1ZGO7pESwsWlmuZssux+qiChOQEV5c+3VFuZrCL+TQ3PJPAlfyTzRPpKzM
         IpHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727365603; x=1727970403;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SLuFDJ+OJh2cs6DQqYJ4Myy9hkcubhtgAstbmRPjdOo=;
        b=txfCzGxiCPQmEF+81MM5dc0SXEnWB9ujkp3N+B6Qgeh4X+xb+8pu+9CvYK14dcugPT
         2Aj7FtgVxS6mR7itGc7N+SWKpkUwE0Rbt9CEFt9bkD5jSlWIUqPJ7PhwPLu/L90HJp6y
         741AlgZxqGD/JkwJy3uaCCgCZP/nmWg5BnsPM69VCf+/46xyKvZyFblR/rl8dR6JOgMo
         z+500bfH+No7x7b3Jtp38LPeKbkBFnUyXQPmA4zfRXwYPU3uvJHCoSclPZaJ3kJ1xJ2W
         f8wH2sR+wZ3r5e0Dl5h3yaPhgBjhWoz8xp7DkBsCfjnhXgFTmoWqD6J6wFImxHfL8Tdu
         e9hA==
X-Gm-Message-State: AOJu0YzwPAHUkmh5YlH0Dx/kze37CVLrD3d3NObMkoh5SLRCUbLL2k96
	3C+VaC1UUdrYsC0/pYp5lbhxnIzhRijeNIt1FKix7ht84yZlHU0FgYbN5XpiHleH3ZMp1w+kMzD
	dN1w=
X-Google-Smtp-Source: AGHT+IH3ucAQlIkL4Yfv7P8gDAIdffffiN8uilUFYJ1cSSVcwOP1JZLskf0ivdeCi+lEu2kGOIIm+Q==
X-Received: by 2002:a05:651c:b12:b0:2f7:90b9:7534 with SMTP id 38308e7fff4ca-2f9d3e479aemr922871fa.11.1727365603023;
        Thu, 26 Sep 2024 08:46:43 -0700 (PDT)
Received: from [127.0.0.1] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c882405166sm75744a12.9.2024.09.26.08.46.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Sep 2024 08:46:42 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: [PATCH 0/4] ov08x40: Enable use of ov08x40 on Qualcomm X1E80100
 CRD
Date: Thu, 26 Sep 2024 16:46:36 +0100
Message-Id: <20240926-b4-master-24-11-25-ov08x40-v1-0-e4d5fbd3b58a@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANyB9WYC/x3MSwqEMAwA0KtI1hNoQ6yOVxlcRI2ahR9aEUG8+
 xSXb/NuSBpNEzTFDVFPS7atGf5TQD/LOinakA3kiN2XAnaMi6RDIxKj90glbqerL3bYh5GrSkS
 CMORgjzra9ea/9nn+W/zqoGwAAAA=
X-Change-ID: 20240926-b4-master-24-11-25-ov08x40-c6f477aaa6a4
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Jason Chen <jason.z.chen@intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sergey Senozhatsky <senozhatsky@chromium.org>, 
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 stable@vger.kernel.org
X-Mailer: b4 0.15-dev-dedf8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1576;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=SuHI94/NJuRKFCunzRbAg6UvpyQ5uCb4T3j4SVdB1nQ=;
 b=owEBbQKS/ZANAwAIASJxO7Ohjcg6AcsmYgBm9YHgAIZlJYGVPLuMr80jeHY/pnREkUHMuDyZO
 SwuXxIrvmCJAjMEAAEIAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCZvWB4AAKCRAicTuzoY3I
 Om5bD/9LR8ePOIbXN45DmQCg1+WdeWDs1nItKFUq6V/shmQbqBlhuQqzlq19WdGxWomeuQ7fx+r
 RCPaSy2lTmGj47biItBF6Gi/48RcOGFpk6OIEGJmqgxmfr0yj9D+mYpiWS2el3b0kvCmSHSjPZk
 6u3PtPLeqGToobWWplsemgF6w0jjoQea5l55rP8kqmPvXIZkubtJayRrsxAhMlZD835ffGwL7hO
 /2ZJ/rFhPZoc+nwrrpOTxQ8ngGVP36zzqfSGoUGOGDuAwxhE9YxOlpc27HywtDgw8VqI/DyY3wz
 tezMgR9zEDi0pTncDuOeIlKYragCaIqKb3QVO4CsYPf48byytJHBun87+Qs0bqgAfxN4xnSQe3y
 L478K8d/+Gr60SCyJHghrnF9rja97H0pj8JWzak7owqmBjYIkrr7dSTSuhigxnerx3cr7qD6wPD
 NQJtuNNxHEfrLqTDA9q3c/DRee3Tm3GauEVWbqZu9ByiLKUrV5wGejc8ub/cuZfjt/BQNJbX5M0
 QBuckkSdoAZZNgxJInR/vyYbnSd+uTNEiviv0DnZ50p0o1LHXNXdBfZP/lPFpDa0CAIlK4WrnoR
 BF3kHJa5gYAGUAhXVp1nQCQm71sxPnztcqSaIZ4dCpp/VObox+rRSjc0JMDnxKfcNtEk9EScW5R
 rXBNdoJTPVuK+Uw==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

This series brings fixes and updates to ov08x40 which allows for use of
this sensor on the Qualcomm x1e80100 CRD but also on any other dts based
system.

Firstly there's a fix for the pseudo burst mode code that was added in
8f667d202384 ("media: ov08x40: Reduce start streaming time"). Not every I2C
controller can handle an arbitrary sized write, this is the case on
Qualcomm CAMSS/CCI I2C sensor interfaces which limit the transaction size
and communicate this limit via I2C quirks. A simple fix to optionally break
up the large submitted burst into chunks not exceeding adapter->quirk size
fixes.

Secondly then is addition of a yaml description for the ov08x40 and
extension of the driver to support OF probe and powering on of the power
rails from the driver instead of from ACPI.

Once done the sensor works without further modification on the Qualcomm
x1e80100 CRD.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
Bryan O'Donoghue (4):
      media: ov08x40: Fix burst write sequence
      media: dt-bindings: Add OmniVision OV08X40
      media: ov08x40: Rename ext_clk to xvclk
      media: ov08x40: Add OF probe support

 .../bindings/media/i2c/ovti,ov08x40.yaml           | 130 ++++++++++++++++
 drivers/media/i2c/ov08x40.c                        | 172 ++++++++++++++++++---
 2 files changed, 283 insertions(+), 19 deletions(-)
---
base-commit: 2b7275670032a98cba266bd1b8905f755b3e650f
change-id: 20240926-b4-master-24-11-25-ov08x40-c6f477aaa6a4

Best regards,
-- 
Bryan O'Donoghue <bryan.odonoghue@linaro.org>


