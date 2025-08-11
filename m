Return-Path: <linux-media+bounces-39471-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 06B4FB21773
	for <lists+linux-media@lfdr.de>; Mon, 11 Aug 2025 23:32:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C3C1D3A0171
	for <lists+linux-media@lfdr.de>; Mon, 11 Aug 2025 21:31:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED06E2E4244;
	Mon, 11 Aug 2025 21:31:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pinefeat.co.uk header.i=@pinefeat.co.uk header.b="Ki2b8kgH"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62A2A27D771
	for <linux-media@vger.kernel.org>; Mon, 11 Aug 2025 21:31:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754947903; cv=none; b=C+Qb5Hf75Osye+wj1lWfptHxy7vcRSYf6ZYRtDIab1jYek4HqTx05e3e6i/P0AXnQx24Q4ewnQJFz3gD3WQ3VNSzTy4M9u/L21PYHPs3gHVzVNOtpzW6oWFFIqmNyjZuHo9D2YmvjljmjKvUgdhJkV5GJOFdqcRVAhrbN2fU2wI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754947903; c=relaxed/simple;
	bh=A7sBPj0UtuSH9vGuJB9qRxAejgbw0PMmS5KnCE2Na3c=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Il9bAnsH1qTNPtjXfEEBPs/PtNRb5js3jjZQ9c5CRU2eupc4DxBknUxVO/h5D62EXVnvCvfpkXEK29Z5ibEvTWP9OHRtrK4smUpjve4Fi+3Sm8KCfX8xnO+vPLeapmrg33LxvckBfjmdbHr9VpEjb8/ACb0+oJGkFts5NJRBwOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pinefeat.co.uk; spf=pass smtp.mailfrom=pinefeat.co.uk; dkim=pass (2048-bit key) header.d=pinefeat.co.uk header.i=@pinefeat.co.uk header.b=Ki2b8kgH; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pinefeat.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pinefeat.co.uk
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3b786421e36so2585580f8f.3
        for <linux-media@vger.kernel.org>; Mon, 11 Aug 2025 14:31:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pinefeat.co.uk; s=google; t=1754947899; x=1755552699; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DYzITiNffVuRdA1N1ljG/+eAuKtVyktyWrYwNqaZgpM=;
        b=Ki2b8kgHlRkL9NTL4lUhPAifvQ7VLQ+PcTJlqwGdsr9tw2UqZKyEG1relRdy2HkMUw
         dt3IX47BvVlSUgewlFlv2NesjMAlP3VqAacFV4wROCWZQ4AXccZFsO8zgMyvlxr1W9sS
         KVcEil56XRvj5/XpBjjlQxoDD6EMxc3LyIawxk5XH4hQ9pJGqXC0GH8T+i7oh9pZz7db
         fBh1tKrxSjhQDk5OlGw/noouiMmm6k7i8tTU+FrDIqRXWbt5dMWo23OrGZWScqvp9e2c
         j8nrpRuu0JwZ+UL/0x6W3jbSqZgvqs8SdxSmYLCZiwSn7t1UHifqrNMHhWw39qzRTU3w
         U1aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754947899; x=1755552699;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DYzITiNffVuRdA1N1ljG/+eAuKtVyktyWrYwNqaZgpM=;
        b=k4b3Y/BkG4EYB5L/GuWkknn/VKCYCcCAN57qKb1JC3zRHDnSW/2Ob0iUYN53ist7Rq
         TiVrO2DL94jCRlPFkTq6nGFecIPAihQfoEQ1ichsZ85C6iFuJ9CCO+tMPozLn2vUV2bs
         yVluROImATrkxyv6LyWnxVqzCNoXJ/2L/QO6e8YigGTXbieHaDDbrdfr01pJq0nyh5m0
         lDBeM2mjPtmEjE+aOBSCfFFpB1p7s4sA3YVapZm73lGmvAC8DznLQ0/OsYD9UiZgNbaT
         N/RQRsdM6LKgEEznupx59vRP5zFk7Y/Vr1e8CrgEJFapJ6c6bc56wCb6OVeIBnxzkjdL
         iX2A==
X-Forwarded-Encrypted: i=1; AJvYcCXwh+RfgGBxy5R4MUNLN6bzPHAVC6OvtITiOgIjAU034pzQheuDSiVLf2Lgg2I4V/X9M9khA1yeLaTg8w==@vger.kernel.org
X-Gm-Message-State: AOJu0YyPOhEPhSj9olJeLcz1BLny+LBABdbUx/DT8opC2WhVkdsM5n9l
	dePdd7quQuml33dHFM/vG8rHSVwIw8n7FzpNcUvVgz4zb8HIBK6xPGJayUzGTkZ0N5s=
X-Gm-Gg: ASbGnctEI/Gn/pY60q+qs4lFIQKwCdXjijz+oG13CGEMHDqp5Dpc0E3gV2o7MJktYu8
	PTVwkcQfimBLVCnkq5tQVKygabhM5um+DV8hKa+qls16dTCdJq8zOSADj20opVogDG6/YxGIaIl
	gUpRjnKLchxexF8W+43v2dvNYiamBZ1rFAVtZScoKV92RTBtSkUZsRZAoq2ak3OyD5oGHzWTv2f
	o6DBa3NZbQsVlR1e9/wNQZ0oE+Lqev6mVOKLyFrrxv+yK4/VaffheUWJ1eJ8nmyRezLh4xFZ4gn
	cgQJNlVNV+K544RmiDf4vLaHMRn5IYWrbsNaZqUAcgNuCHabpnvqBhlW86QG5wbhrGKdFz0oRTK
	7Ytjmov+CaY8tYfGmOM7p7mGNDngwr8CMQm75sjNsjHeFW33b
X-Google-Smtp-Source: AGHT+IG6kJ5mVgtdOC96YHAJij3E32r9WMZPowvaweTxAYjG7iGvD+92On2w6MtfqnNA7HMakNZTVw==
X-Received: by 2002:a05:6000:24c5:b0:3b8:d7fe:314d with SMTP id ffacd0b85a97d-3b9110079e3mr944396f8f.36.1754947898457;
        Mon, 11 Aug 2025 14:31:38 -0700 (PDT)
Received: from asmirnov-G751JM.Home ([2a02:c7c:b28c:1f00:f8cb:3493:2eed:8d11])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c485444sm42397387f8f.66.2025.08.11.14.31.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 14:31:38 -0700 (PDT)
From: Alexander Smirnov <asmirnou@pinefeat.co.uk>
X-Google-Original-From: Alexander Smirnov <aliaksandr.smirnou@gmail.com>
To: mchehab@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: devicetree@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Aliaksandr Smirnou <support@pinefeat.co.uk>
Subject: [PATCH v2 0/2] Pinefeat cef168 lens control board driver
Date: Mon, 11 Aug 2025 22:31:00 +0100
Message-Id: <20250811213102.15703-1-aliaksandr.smirnou@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Aliaksandr Smirnou <support@pinefeat.co.uk>

This patch series adds support for the Pinefeat adapter, which interfaces
Canon EF and EF-S lenses to non-Canon camera bodies. The cef168 circuit
control board provides an I2C interface for electronic focus and aperture
control. The driver integrates with the V4L2 sub-device API.

For more information about the product, see:
https://github.com/pinefeat/cef168

There are no regulators on the board. The MCU is powered by 3.3V, which is
supplied either through the CSI connector or the serial connector directly
from the Raspberry Pi GPIO power pins. Hence, the driver lacks any regulator
handling. Please let me know if regulator support is still needed.

Changes in v2:
 in [PATCH 1/2] addressed review comments:
 - added optional vcc-supply property and example
 - made node name generic in the example
 - removed tree type and location from maintainers entry

 in [PATCH 2/2] addressed review comments:
 - wrapped devm_kzalloc line according to coding style
 - removed oddly formed i2c_device_id struct as not required
 - formatted of_device_id struct according to coding style

Link to v1: https://lore.kernel.org/all/20250810192609.11966-1-support@pinefeat.co.uk/

Patches:
  dt-bindings: Pinefeat cef168 lens control board
  media/i2c: Pinefeat cef168 lens control board driver

 .../bindings/media/i2c/pinefeat,cef168.yaml   |  52 +++
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 MAINTAINERS                                   |   8 +
 drivers/media/i2c/Kconfig                     |   8 +
 drivers/media/i2c/Makefile                    |   1 +
 drivers/media/i2c/cef168.c                    | 337 ++++++++++++++++++
 drivers/media/i2c/cef168.h                    |  51 +++
 7 files changed, 459 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/pinefeat,cef168.yaml
 create mode 100644 drivers/media/i2c/cef168.c
 create mode 100644 drivers/media/i2c/cef168.h


base-commit: 2b38afce25c4e1b8f943ff4f0a2b51d6c40f2ed2
-- 
2.34.1


