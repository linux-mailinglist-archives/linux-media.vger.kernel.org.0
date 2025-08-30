Return-Path: <linux-media+bounces-41370-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 86501B3CA71
	for <lists+linux-media@lfdr.de>; Sat, 30 Aug 2025 13:15:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4C45E5815C6
	for <lists+linux-media@lfdr.de>; Sat, 30 Aug 2025 11:15:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A8952356C7;
	Sat, 30 Aug 2025 11:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pinefeat.co.uk header.i=@pinefeat.co.uk header.b="a0ecjl91"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5C007DA93
	for <linux-media@vger.kernel.org>; Sat, 30 Aug 2025 11:15:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756552524; cv=none; b=ZiIb+t1m19FNO+/PWA97XlRQOUebDnt+k8Pvku/6ilQiZu0mWDfAUlxTiejGBiFs4RmuDdFo4SNrGlXPUCPtEeEaSXzEnhbJrlOEY95qk2K7m9ljUIYs9/FROLFk16l3AFEOkUDPN211zDphW7NxB+BDOIwMUOTR49xx4mg+nL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756552524; c=relaxed/simple;
	bh=FcS3lVango2lJ/7H1mnUAZSXYOc30orPYr2Ga4jvAh0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=atx/ibiaGJKQ1CFO3lXXeneB6o15ZW2wpUiyyxqy/o5gcGMRjWrd59XvIQO/L2o+c3WO4832d/WUDEYx4Z7hulfkDj8xYruRZYDzYY7JfvObReQwSaAaJhoyyxS7xmteGiehSz2QB55/ARl7TK5Qhc64Il5PCd2T7ktVpkSS9yA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pinefeat.co.uk; spf=pass smtp.mailfrom=pinefeat.co.uk; dkim=pass (2048-bit key) header.d=pinefeat.co.uk header.i=@pinefeat.co.uk header.b=a0ecjl91; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pinefeat.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pinefeat.co.uk
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3cf991e8b6aso1077063f8f.2
        for <linux-media@vger.kernel.org>; Sat, 30 Aug 2025 04:15:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pinefeat.co.uk; s=google; t=1756552520; x=1757157320; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7sB8nLNw7OUCAbqYw05qQ79tpzJtdnEdFbZCz5X3kyU=;
        b=a0ecjl91O3ccYBO2BFFvDPwZnsOIdcxSla/MUN8yobkdlazpGcpLPt9o+pTZmPixqB
         kV0Ky5IbWg9TpmLdKXMk5kD01IioJD9DeAETtRxCKVF0QLvHR0NtEq9BNKo96ekosXoe
         yVJMgUeULT889TiYLTy6QYhvJIzt5cQ8j+A3xQPhCqvdvrpoesaMNkV3+RJ0upaK4goe
         DTgtE5VGpzepukBo+VuwDX+urXqNFvJpbpXzxApL+V7+D2cZIBLqtTFwxSA5Tqul/T2S
         QZicjc23z8+r2pUcFGBmlVY/bZLHgC7VD6nBFZMQbpYHkEZ6p9rtisspe9QX2vEBUELj
         +7QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756552520; x=1757157320;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7sB8nLNw7OUCAbqYw05qQ79tpzJtdnEdFbZCz5X3kyU=;
        b=WqIDTDmAHLjgHN0UQ8F+S3AjfcO8rVMTxobS5pAb3uRrR7LuXoByhK3YuSDLHig9Ia
         +wKhiaVtIaUBw0sBdIMPHhkrFNB2xADnOvi+/HNFVC6E1Gw7JaBUPYBB/P0aHbHR4a1E
         3TRXWXKVkol1OFa3P5VNhowxOKtRqHEKZVjOQxcrobaWhUWVnA6+I/d7vbUkXhArw5Zo
         i1l+oyRjfbB9BXq840eQiKzuxN4qulPp89F0bSxvsiNuGTsV1+0q51c8EiLgOUPrr+/b
         P4Z13wpE/jP15EpZk7yQnsy5NslGVeCbUP9dlJd3Zk2d+cwfLf6iNv2QbM6k2zVdIpM0
         7HgA==
X-Forwarded-Encrypted: i=1; AJvYcCUKlEChtljO9Z3enpmWCALpCLqS6t13H8ANC3svru74h+UQ6/emehecjDCJtiuy02HLKlXhW63BrNWikg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzADhWd6/aGlx1a7x7wuRXveEo4YL119p43uQzNqmMDJKU7gX28
	hoi08SP6apG1IW5va+LYMVqWiuavyvYiORb+0iM1b1OoAVLmYHYKkdhF3gYPVcGN5c8=
X-Gm-Gg: ASbGncvWbR2+QLy398bbRsTqkTWqNJU7r/114O8VRJuiqKyRhV8THe+eAHyFgIacHnw
	UAmfUWm47LWcpwfuyQW0fzfMWJ0LgM2IYro9rDZMf2SA4Q/PoyqS93WYlgGYYXlBk6PXRtzk9ly
	KNPMml1JtQfHNfsijk9tA1zsIlT2j8hojeCbNtT5cpFlgApDOiZIHckXIwTi/g6esP+MqaN7QN5
	hdgg9/VgYODkPJstVn6K5d2fijI5VjwnwAguCNThkSefw+r+DfOt8W2QOSE6C2aaKrKCMgvfguv
	PXQ4sq/4zbCG7qwTWsQIoxXR3D05kPHqhSh5E9O2d1xu3gdbYWGpKxI/+QAoZgyP8jO0LT6ozLH
	9K1y/+grsllHGTmjJv2UKNzXRE1quNpvKpAyGBvVZXRM8O/KNqfyl
X-Google-Smtp-Source: AGHT+IGx677+6au987cfOlNk+fioFFj5OQLwe6obAylZPfiLfEVfCRdytUkq11pyEGu2h8sIc4QKzQ==
X-Received: by 2002:a05:6000:188e:b0:3c9:fc3c:3a8a with SMTP id ffacd0b85a97d-3d1df53b1bemr1345860f8f.61.1756552519895;
        Sat, 30 Aug 2025 04:15:19 -0700 (PDT)
Received: from asmirnov-G751JM.Home ([2a02:c7c:b28c:1f00:8714:ec04:28d3:3897])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3cf33fba9c4sm6713630f8f.48.2025.08.30.04.15.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Aug 2025 04:15:19 -0700 (PDT)
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
Subject: [PATCH v4 0/2] Pinefeat cef168 lens control board driver
Date: Sat, 30 Aug 2025 12:14:58 +0100
Message-Id: <20250830111500.53169-1-asmirnou@pinefeat.co.uk>
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


base-commit: 2b38afce25c4e1b8f943ff4f0a2b51d6c40f2ed2
-- 
2.34.1


