Return-Path: <linux-media+bounces-43873-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B9C5BC2907
	for <lists+linux-media@lfdr.de>; Tue, 07 Oct 2025 21:57:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 4D7CC4EE619
	for <lists+linux-media@lfdr.de>; Tue,  7 Oct 2025 19:57:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43413239573;
	Tue,  7 Oct 2025 19:57:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pinefeat.co.uk header.i=@pinefeat.co.uk header.b="HSQ4TJX2"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA44A221D87
	for <linux-media@vger.kernel.org>; Tue,  7 Oct 2025 19:57:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759867062; cv=none; b=UegdREjIb1hJqli7RJeszesNQZ92cPsHFplovr4bz/HlPt0jrV+trClfXCvcxyaK0PPUOPREi7oi0F46rjuL0SdIm4OrxSuGzHkBQ6M8uxddE+lS/OYA69U0tNj+OnHkwLUrK3fW7E7feyrjYgMtgOKSODRH2TS6zuMES21VE18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759867062; c=relaxed/simple;
	bh=LLFoPlsqXZ6cVvc1iROcimhAMsfDr/77J/uNnPt8xZ8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=WG3jN+nSQTUYV8EwmwkB+0sZ7GW1lOcSMvQVeAetcL7lj8gUs6SxiuxCd5SMuBTp7ayr+3onb3dPMRoIa5aCEyMQ1NCSEsWeR3qfJcoUlq24oo7++ccKYYf9ChLb5yH+7o4VQc4Rbm88WXHWzkkd9jYoIH158q3jBv38NgwguCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pinefeat.co.uk; spf=pass smtp.mailfrom=pinefeat.co.uk; dkim=pass (2048-bit key) header.d=pinefeat.co.uk header.i=@pinefeat.co.uk header.b=HSQ4TJX2; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pinefeat.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pinefeat.co.uk
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3f0308469a4so3847995f8f.0
        for <linux-media@vger.kernel.org>; Tue, 07 Oct 2025 12:57:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pinefeat.co.uk; s=google; t=1759867059; x=1760471859; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7+qx4RaKoGovMIC4vNJLjFd56LfO6/L90wBU+eqHXZo=;
        b=HSQ4TJX2O6cUh8iVr48fLJla1S2tqFm7CmIPMdpNGlhD/n2+dwCduwU0krxVGbSId7
         egsF0AoPLJQ0AI77pkW+QURNoG+FeN61Hv2CPSvbljFly3d5Aomn6rqy/vvmlJRQHb/n
         9TDFodWMsAyu4sJ9CSDr5RZzpJOVApfVqfSj+c5ibvwWIOtyASFbaHmB5irUWxojZcPF
         iFfxB4NCx/a4ZuwmN0NU5lbFjI5iHA4qtbNZIystXl6aIRD90p/KF30Xb7A5E7g2OhN1
         pgdlem5jo/1Y5cuja6r1h0ITztyd7pfFFsDWr8eeU6/AiURybN7YfCiueYIhi4KfdiOg
         clQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759867059; x=1760471859;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7+qx4RaKoGovMIC4vNJLjFd56LfO6/L90wBU+eqHXZo=;
        b=q1J29Reh3oDU8yg+9cVItOnY8+Nf31e+mTFEnCrS4YSrmV2ojeCfgGF9Kw2XaMCSuz
         5fwkXNQEQmWURGmeAd5gL8JbB1dJMicNXUO7k5Ujjze8pM6/soTyZFgvd4ZP+KIHw8us
         T8koIfo6gLh72wPMjjLxs2ienYo3bM3pjzxUf+Sk0PVENTZdvvTpqXPz/3h0beVByowv
         mmjYcZg9kC0GzMCzOqH6MoSgeU2ejl0+2K9FUu6RDpPXw11G0EOjy/mSafMjwY/SRqti
         uE2id+47gTnUT/9MRLM1fcNJ4g9N5/kfZeNaMPogcZnlRXtY9/tnNk9ouHlR69vv3tyu
         VuaQ==
X-Forwarded-Encrypted: i=1; AJvYcCWTxHvNmPjjuSseyORaGmfwppwG2aOQOsD9voq9458jS1u4Wu4lBueC1AGnLemBbVLcEzn/3pegwHizwg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxlk++7K6K/NKtouzfj9XuTABqniwgxxEK17JZPEy1vRCTNYJlZ
	15quM/6Nezuwp92S3CZuZHDq8oo0r+CPLe7cwidFE4pmpNLsf6XamRemGhUDYtkttK0=
X-Gm-Gg: ASbGncvFkXvDXWg3BLL5ntDJbKwwS44OQqxySnYjmN5RPfsfwOLd2VcVHhzTfuAoPlJ
	bT1tX6zN0//RAQAq84gCr5x1hUPhrqh/O1rGKUxvfnBHX7jmTO6o7koywu9Bh5yb4JWplBVtHp/
	Kv2XXn9YJzrYhZeTJfmsvv91b36c+aFEhxFUKZ5bu3+z61CdWcc0qOvlGyjHHAeeeXW59LoZzzh
	yOBWIVwUlWcaLtJCN94HGSUW4vs57v3nHCdDfce5lIAeEom/Z4llSOGFc4092pWT1HJnyiI5sep
	QREjfw6UOE5TM6v+Lw3gk9mvDH2l7irXU8QelOOGTr7iFSYbRTn60VB7Eu4skBvnquO6rQn1AYW
	l0Hd7dUBFTma3Qsz8NktJREfUMUBOM8fJryNGlOCabWYzEYiLIu0d14NpxjcMu9Wh83Fkxm2r3U
	M=
X-Google-Smtp-Source: AGHT+IG+/J0gFUNE9o2hpPt+WBbb/cdcTnJFI5jfr4VSMTfm5DuIbrq+63b/Wf83a/Mm/bMhowHzng==
X-Received: by 2002:a05:6000:4284:b0:3f9:1571:fe04 with SMTP id ffacd0b85a97d-4266e8de175mr353643f8f.48.1759867059042;
        Tue, 07 Oct 2025 12:57:39 -0700 (PDT)
Received: from asmirnov-G751JM.Home ([2a02:c7c:b28c:1f00:bdb:8f55:60a1:c8ff])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4255d8b0068sm26830896f8f.26.2025.10.07.12.57.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 12:57:38 -0700 (PDT)
From: Aliaksandr Smirnou <asmirnou@pinefeat.co.uk>
To: jacopo.mondi@ideasonboard.com,
	hverkuil@xs4all.nl,
	mchehab@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: devicetree@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Aliaksandr Smirnou <asmirnou@pinefeat.co.uk>
Subject: [PATCH v6 0/2] Pinefeat cef168 lens control board driver
Date: Tue,  7 Oct 2025 20:57:30 +0100
Message-Id: <20251007195732.16436-1-asmirnou@pinefeat.co.uk>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series adds support for the Pinefeat adapter, which interfaces
Canon EF and EF-S lenses to non-Canon camera bodies. The cef168 circuit
control board provides an I2C interface for electronic focus and aperture
control. The driver integrates with the V4L2 sub-device API.

For more information about the product, see:
https://github.com/pinefeat/cef168

Changes in v6:
 - removed "focus_range" custom control, instead modified the range of
   the standard "focus_absolute"

There were no changes in dt-bindings patch.

Link to v5: https://lore.kernel.org/all/20251005133228.62704-1-asmirnou@pinefeat.co.uk/

Patches:
  dt-bindings: Pinefeat cef168 lens control board
  media: i2c: Pinefeat cef168 lens control board driver

 .../bindings/media/i2c/pinefeat,cef168.yaml   |  47 +++
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 MAINTAINERS                                   |   7 +
 drivers/media/i2c/Kconfig                     |   9 +
 drivers/media/i2c/Makefile                    |   1 +
 drivers/media/i2c/cef168.c                    | 317 ++++++++++++++++++
 include/uapi/linux/v4l2-controls.h            |   6 +
 7 files changed, 389 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/pinefeat,cef168.yaml
 create mode 100644 drivers/media/i2c/cef168.c


base-commit: 6093a688a07da07808f0122f9aa2a3eed250d853
-- 
2.34.1


