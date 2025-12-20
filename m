Return-Path: <linux-media+bounces-49249-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E1168CD36BD
	for <lists+linux-media@lfdr.de>; Sat, 20 Dec 2025 21:42:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 189243009770
	for <lists+linux-media@lfdr.de>; Sat, 20 Dec 2025 20:42:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3728831282E;
	Sat, 20 Dec 2025 20:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KUGA0dSW"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDBC53126DB
	for <linux-media@vger.kernel.org>; Sat, 20 Dec 2025 20:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766263365; cv=none; b=WcnTyeMrDWIRIfPUUl20xppNn1VJCxNJz8TH79K9lG3i8tIsUwWTt/W0mzEE6B95dHe2rnl0esCvR06jSD+4NGidWNuHaZJCQghUIDD6DekoWmA+5KhUVruTmh6FUIwelVLamN+3rTEIHLt9vsKBgSfQrFS5OX3pubfewIsrCB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766263365; c=relaxed/simple;
	bh=Z/CcaMqE2F9hQ373hh+TK08NHmxmRfaRGf+PqPGAoTU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BdNeIvBGkq6KTH2o9ayB2soxNFhutT5NCkoDvLrWmx6oi+Y6NC88SDg2UPCVqX5n11uUmQ4GJgDu0MAGGRUtd8wyXE0bNDm5ERFDcWJ7HjWB9Mj1OGqUSaSlUivWxqncjDHxPbKxA2DU9XuDkrMKvaNYGzyxnQ5wQIAB3RB5U+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KUGA0dSW; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-7b7828bf7bcso3109931b3a.2
        for <linux-media@vger.kernel.org>; Sat, 20 Dec 2025 12:42:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766263363; x=1766868163; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=c+VagBe28+HbfctXznw2EgljC1Oa7V0N70ONS8x29vE=;
        b=KUGA0dSWV3Av0siFmcQjuFwv7JOvhM/LRSsF0awFmVxdCC2U+D+hNdhl8hlCfFiHy/
         2x5D7X+i99IyjvnBEMQdU/kYlvG3UJkZHKDgL0LymOSg9xp9efpagiT56N6hN0XLIubF
         QG7v4TgkIvOmkLo4PSEM5Vz+9EDE0NZNfcya1OmODAHv8h6t0kq5Nvmfm1cm+TR0w4zY
         Kgwkh41EkCEdHpL4ozCAzIEUIhXXpLAOMbtl1lXwbM7SWO6dB/aINape/qh+3NmtkXxr
         S2KDD5fnL77l27nmMRjCi+upmd4b8Y+fIyQ3cVGwMg/Hc4X3MJicNPqhuTVMbqrlfCIt
         /ilg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766263363; x=1766868163;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c+VagBe28+HbfctXznw2EgljC1Oa7V0N70ONS8x29vE=;
        b=actINLD9Tv3CMajVE+oQ99sOn/cb1A9RLXvPcvwP0H1zEtZpksALJ9htlQgxk2JW6w
         ddsU0qQ4mNmjxqEegEkIUnPpM4Uv0YHd6BsYDYfYQKFfXADC0K4D7QiqqToEQt7RTFTk
         NMdCg73e6ii+ig0hmwEk2JjIm9bkFw0jieFkcbSae88V7rCg8EX3kmbQxYS8P5btRKjt
         SXnaHyBOwbUE+cE+g2gW/JUtGvt3lEuK4l1tNRYcC6jrXR3LQMxGERgCQrgulM2Z2uja
         6s8CIRUzck9nKAJZPtNPrXOrVO3yDz+niCG+thn+DDh2hFPqglgn91AmxBF8RznX4iV1
         D3nw==
X-Forwarded-Encrypted: i=1; AJvYcCWowYBwSPflfCh1Sa1BL72WhubW8C5MlaHS3J9gC/FRIcMLFXs2KVSMyhJ2xvdJ9l/i4P8fGBfd3F3NZg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4xFD8eM1GlID++3EtmltvfV1f/J3XSrOK5VVQHj4xDoD5M+JI
	wZTgfzD8NEbystszlxU6ZmZd5MWFfOoAa53xzj7qwtijomcZJXI7RsP9
X-Gm-Gg: AY/fxX6KTU4KW2lYWXgqB5ZRcLMEHhrIk6LaItmVwXapY0ZqMsvjUOx/LiyuzM0olTP
	RXO0Uhf0zAWdxUBYMnBfGXG5NmFwGMyXXyHs5C4zp8ZDk+T/lOZ9GPgrdw4m8A+9X+5yCOj/cLP
	UUFu/T+6Boa8q3yXeOYsJMbk2TwG+3Rsb6vWTK6X+H/uwLcygubbhMJ7y3+FaV26VDLivK6zTAd
	AdrO0rRNxRQGqc0sxXH54ZEUc0DNKRc3I2M5T1468/iBmJxdLKdeDvTia3DrytopCvWFNvQ3Utu
	xOVQhCu+A1MtJsvB+NCiD7S11S0i/+ChnKvX4R8+eNjMyRzaLMkI1WmAbc1n/BMmri7AC+w2t6Y
	6RM5xltiDdqZiXMUs82i/WVs/mk+McOpMH9GSsmGvMyN1sJicLIgTa/iHbdVJQmao+xuatLTZHa
	6VPdkOjRtLous=
X-Google-Smtp-Source: AGHT+IFq5tcwPoJwfxvrZUUDz0qgQmWdg4+4632Khh+KuqQQ/MV3mweQS7nx8QAzHFzdCMQOKnMlcQ==
X-Received: by 2002:a05:701b:230a:b0:11b:2de8:6271 with SMTP id a92af1059eb24-12172309badmr5959381c88.39.1766263362996;
        Sat, 20 Dec 2025 12:42:42 -0800 (PST)
Received: from fedora ([172.59.162.202])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1217253c0c6sm25462571c88.12.2025.12.20.12.42.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Dec 2025 12:42:42 -0800 (PST)
From: Alex Tran <alex.t.tran@gmail.com>
To: mchehab@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: pavel@kernel.org,
	sakari.ailus@linux.intel.com,
	mehdi.djait@linux.intel.com,
	alex.t.tran@gmail.com,
	laurent.pinchart@ideasonboard.com,
	hverkuil+cisco@kernel.org,
	linux-media@vger.kernel.org
Subject: [PATCH v1 0/2] media: dt-bindings: Convert toshiba,et8ek8 and ti,omap3isp to YAML schema
Date: Sat, 20 Dec 2025 12:42:21 -0800
Message-ID: <cover.1766123192.git.alex.t.tran@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series converts the dt-bindings for media components
toshiba,et8ek8 and ti,omap3isp from the TXT to YAML schema.

The series is composed of:
Patch 1: Converts the Toshiba ET8EK8 sensor binding and updates
the MAINTAINERS file under the NOKIA N900 CAMERA SUPPORT accordingly.
Patch 2: Converts the TI OMAP 3 ISP binding.

Alex Tran (2):
  media: i2c: toshiba,et8ek8: dt-bindings: Convert to DT schema
  media: ti,omap3isp: dt-bindings: Convert to DT schema

 .../bindings/media/i2c/toshiba,et8ek8.txt     |  55 ------
 .../bindings/media/i2c/toshiba,et8ek8.yaml    |  91 +++++++++
 .../devicetree/bindings/media/ti,omap3isp.txt |  71 -------
 .../bindings/media/ti,omap3isp.yaml           | 182 ++++++++++++++++++
 MAINTAINERS                                   |   1 +
 5 files changed, 274 insertions(+), 126 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/media/i2c/toshiba,et8ek8.txt
 create mode 100644 Documentation/devicetree/bindings/media/i2c/toshiba,et8ek8.yaml
 delete mode 100644 Documentation/devicetree/bindings/media/ti,omap3isp.txt
 create mode 100644 Documentation/devicetree/bindings/media/ti,omap3isp.yaml

-- 
2.51.0


