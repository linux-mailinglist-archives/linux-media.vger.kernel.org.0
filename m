Return-Path: <linux-media+bounces-43755-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id F1687BB978E
	for <lists+linux-media@lfdr.de>; Sun, 05 Oct 2025 15:33:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 84F114E4884
	for <lists+linux-media@lfdr.de>; Sun,  5 Oct 2025 13:33:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0625228851F;
	Sun,  5 Oct 2025 13:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pinefeat.co.uk header.i=@pinefeat.co.uk header.b="NkDSbIBL"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE5CC28751B
	for <linux-media@vger.kernel.org>; Sun,  5 Oct 2025 13:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759671185; cv=none; b=DRC+s1Sxx1rI1nxukV2kTet5ERz8Y2W6ggMYuh2Ku1pPnzM/VeBSXhvc/+raybM8OpMHotfaFQmG4Li9HFveKM1PXyBXveXlZK8u7prAM9ZckIhbKXRx7n4QZkqwC1Vt0tk2oEknm1UQ7XfMbevGZK6t9gbgoybtr1cdvmJIyTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759671185; c=relaxed/simple;
	bh=cyiVJg25k0NX9LYEhmvn4MG3tINMYaQdcfMOvJz+5Sk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=I3csM97I+f1evm8ImCtvlp4NTfBF7JCXxa5p8Dv5bV0WxYL2hnkqvNHFxf4CLtrAw7GNI2Q274VzzypkV3MrU8xfU76NOviqt1AJIzxvpZTyJgDw45pEfcmwRxBJtUfjPD0rk2LvA8mptk0VNJvXIBKmp+YeunQTK8BtW3OOjPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pinefeat.co.uk; spf=pass smtp.mailfrom=pinefeat.co.uk; dkim=pass (2048-bit key) header.d=pinefeat.co.uk header.i=@pinefeat.co.uk header.b=NkDSbIBL; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pinefeat.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pinefeat.co.uk
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3ee1381b835so3315786f8f.1
        for <linux-media@vger.kernel.org>; Sun, 05 Oct 2025 06:33:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pinefeat.co.uk; s=google; t=1759671182; x=1760275982; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DM1GAlirByGXSQF70Ag8YLw+oeiWY9AvHShiftQ9JDA=;
        b=NkDSbIBLYidb57T4DijAiMheV2F+mz/kbrv1v8a3Uj1zrkWlBEe/zuOniFhO+p6KmN
         jUjPZBBtVPTDbk3FPQv/wMfe9vFRAjPDWqfooV40i5Bi7zi1ElgtmrO4P4s7Da6Lpw9m
         NELfiyf8V7cG+YujMUXoXK73kepQeS+lk7aFQAWUYHuhqm6AhAaSTDCdzlKGBmCVGRZL
         Tib9hiU8Zc/dJFMMuSQ2aFJvCbq2XTT0qEjWRMuo2BHAMj6Lx96Qyl+ejmRBRGZGnG1d
         qfJRGKRQeetczoGk8SqapfBg5hm2PJsKzn+Fjw8hi3TQAqOeGsm4qg7uGKrCjupR2AE+
         lXLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759671182; x=1760275982;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DM1GAlirByGXSQF70Ag8YLw+oeiWY9AvHShiftQ9JDA=;
        b=iwFtyehHjSIBRseB6r97mvPeooxcS6+cHJLZoBphc7UNlmxSrAzqMFpjcfLg28QscU
         CvvAU+HRal4uaCBhI8JOutjsR1NbwgShQc9rXNcsdk7L10qTiBx99AzeJZAnOhSl9VTo
         FldB4hfWoEjlBAWbSQVak5hl1hIgpZSlRiLG5MI5CPqcK9HMnGherjQfQEpxWquyQCy2
         9bc2B/uQP23EYXH3qqt8V0fSWiXzN6ynm0H5Lw2x3PQM4VlaIb/umbaRRIt9rPoVVcXE
         K9CIfv1Zz3X4LLSftcZHI3xFWJRKT+CSToCfs99gOtBJigbVSw82OZ/bNDfDxczqmqH3
         p4WA==
X-Forwarded-Encrypted: i=1; AJvYcCUNlLM1aBoPNn95Et5fGM0PE7n7y3eeZ2nxVkoqfkP6UGk7vLvM1RO9BW4uerfwHCoVKhAYFmvfr6RpMg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4v0f9UVEbtFn7DYvXJtxYjeB7iQX/gLjSD157H/kmIuagclDM
	q3QebOJn84kDoxUkqNdQIXALcuf0YoOb4743pprs6s0oFGfLKFsGb288rFfKQ1m59SY=
X-Gm-Gg: ASbGncsoY9FBg0GaIXsBV2wDfM9HQWOEj+L62lpa7sY/ApekqDcaYqTV5pMT4/N9LWk
	sK7l8uoBIuVRs9OSLhCYbQ9vcgbJieHvPbTzZz873vmXK7xB+Xbg/PTubd9Lr05t9OuE0WLXwpe
	LCq3FqljX5L0V29kIA2q0Z2a5c+Lry6WSVnS0C5coKHfgg93Fk9e3v+/IcDQtcme6wARvARPDxl
	v2w0hXrHQi4L7M1jY1qgH1s47zWGSlQ4LCumly4+JZRe+CyQ2kB115kU6scMaGGaDIAGTOKw2kn
	XLC+oRrpKFeQVXwVtQQLr6fsWed+7mt5lng1jTdVbknr3XGKoM3j272olclJpZQEiukB/5mgaX7
	HmIj/gd9baAE7EOm2+xXZw6HVR0lzPpxprKcjKUP4pPa526w8PCZiTFGkHRlAqysL
X-Google-Smtp-Source: AGHT+IHCiJZkw14XZXnMA6yB5yBnUdpiT4anaRQQoQvPUVPZHpciGWzVWIcLIG5jgBP/EmLvZqWpKA==
X-Received: by 2002:a05:6000:481e:b0:425:7c3c:82cf with SMTP id ffacd0b85a97d-4257c3c8349mr414378f8f.11.1759671181696;
        Sun, 05 Oct 2025 06:33:01 -0700 (PDT)
Received: from asmirnov-G751JM.Home ([2a02:c7c:b28c:1f00:33bb:4d0:68e8:89b8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4255d8f4cc3sm16459730f8f.55.2025.10.05.06.33.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Oct 2025 06:33:01 -0700 (PDT)
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
Subject: [PATCH v5 0/2] Pinefeat cef168 lens control board driver
Date: Sun,  5 Oct 2025 14:32:26 +0100
Message-Id: <20251005133228.62704-1-asmirnou@pinefeat.co.uk>
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

Changes in v5:
 - rebased onto the latest master branch;

Changes in v4:
 - removed driver mention from the hardware documentation;
 - added named email in commit signed-off-by;
 - added select CRC8 in Kconfig;
 - removed header file;
 - moved variable declaration at the beginning of the function;
 - removed kerneldoc from structures;
 - removed control id check as the core handles this for us;
 - removed Power Management Runtime (pm_runtime_*) calls as redundant;
 - reserved v4l2 controls in linux header file;

Link to v4: https://lore.kernel.org/all/20250830111500.53169-1-asmirnou@pinefeat.co.uk/
Link to v3: https://lore.kernel.org/all/20250817130549.7766-1-support@pinefeat.co.uk/

Patches:
  dt-bindings: Pinefeat cef168 lens control board
  media: i2c: Pinefeat cef168 lens control board driver

 .../bindings/media/i2c/pinefeat,cef168.yaml   |  47 +++
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 MAINTAINERS                                   |   7 +
 drivers/media/i2c/Kconfig                     |   9 +
 drivers/media/i2c/Makefile                    |   1 +
 drivers/media/i2c/cef168.c                    | 331 ++++++++++++++++++
 include/uapi/linux/v4l2-controls.h            |   6 +
 7 files changed, 403 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/pinefeat,cef168.yaml
 create mode 100644 drivers/media/i2c/cef168.c


base-commit: 6093a688a07da07808f0122f9aa2a3eed250d853
-- 
2.34.1


