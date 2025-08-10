Return-Path: <linux-media+bounces-39352-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 003BFB1FBE5
	for <lists+linux-media@lfdr.de>; Sun, 10 Aug 2025 21:27:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B5DCD3AB2A9
	for <lists+linux-media@lfdr.de>; Sun, 10 Aug 2025 19:27:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DECF20B7F9;
	Sun, 10 Aug 2025 19:27:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pinefeat.co.uk header.i=@pinefeat.co.uk header.b="Ga6zuduq"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B86413790B
	for <linux-media@vger.kernel.org>; Sun, 10 Aug 2025 19:27:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754854042; cv=none; b=Aq/qJYeLqaCbIv50BqndyQVmOeELucS4SRKrW5lgkKDBVUouB12dWnUV/IVrDfe8Ld3n+8h4ed5TbsOmEab7L6XchgzlV00Du8EKa2Ew0VFyjSb27KUL50ZOR5PbslyD8LM+9l0gzjwOHMaM4r0iZ2jEa0Y8kXAyai5eKETvzjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754854042; c=relaxed/simple;
	bh=Px3DZRklB2oXIv7JRoEDl+7ABYhIzjIVytgkdD8WRLc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=jhcIdG7Ku5OsN5qiFkHnXj4S51gTB8tUB4La05+7YRgk4sH5g7dPirIw58QJf00vL2Ul63baiSPR9INyc0+5HCBITBQeCXSZRlUpaSAJ3y3UllxUhb1k5szSm8okPHskNj4mz10V46hIxyQ2bzTk+auf4b9hyn82RQGAuAlK7Zs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pinefeat.co.uk; spf=pass smtp.mailfrom=pinefeat.co.uk; dkim=pass (2048-bit key) header.d=pinefeat.co.uk header.i=@pinefeat.co.uk header.b=Ga6zuduq; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pinefeat.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pinefeat.co.uk
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-451d41e1ad1so25058575e9.1
        for <linux-media@vger.kernel.org>; Sun, 10 Aug 2025 12:27:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pinefeat.co.uk; s=google; t=1754854036; x=1755458836; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xWYXXDbw++hefcSCW7VPfxxIpBDi6aZwun0MbeORMtI=;
        b=Ga6zuduqeWZcuZTpHnxSp/20/tSd8zJDuUkeRo5rdGYQqkFV8x8UQKXxE4VG8UKABj
         oqk96pPsOH+SrmYEyB7Zh8kVuJ7GgNDEeNPYX76zHeUzasm+WT/9cy7pgNvf7T4QGCl4
         7Ee4ckMZN4ziIfGJ6t7rqV2TRL6uXO/jx+dIexm1+knLC9xyCG9W2H1iSRBZtuD/6lSO
         ZSKSjapxGHzEdW/t9k/U/Qdkarl7hH5ezxL/dBbOMLfeyYcJs4fqPL63SwmhXiEc5XJz
         bFeu3Y57AJ/5buYnaMgOr8uQY4zZi0wd5M39b0PAoWtNe1Vmfd2S3Agk6Qm8NMqoTsqO
         5qNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754854036; x=1755458836;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xWYXXDbw++hefcSCW7VPfxxIpBDi6aZwun0MbeORMtI=;
        b=ETXNxx2KsMUGRLpwmpqysae+ebU75oFlGGXdXt3mCQoChyyjJ5PkBIKYxmG16FnKhh
         G7QpQkJrIXycac2LxuL5cOkDblBpnYfqpaOmPE0+1R9mJYzx97XU2ihyTmH7GtcRoIEe
         YhiTptkCoKrylZ73Iq8rmjnxXAHSrWp7FsqWhoWtdlfMM8byriFbqlUH1ZgGgY3Zp72b
         mQf7F8HFKru+hPjIyYT86BcglMdsoLN2GfE3lVscrM1hl2UuuD8d3oV4ck+/kL7kZnku
         lWGCF0zDpXIa5PzT09V6cwDlYJji2MuX/vBwPiS5c4Xb0Rwd07BTArh3FjSlbSmehc5V
         jiLQ==
X-Gm-Message-State: AOJu0YwyTAS6NTQTVYXD0k9oKpNc5r6OZNSju1vqWRQ8Lk8WsyQnKLYZ
	fUxKA7+8gM8EvILgVfT1GW9OR6MB99cn6vyVNBdSKBO/8ZvTwtbR/JEY318Xb2msDuE=
X-Gm-Gg: ASbGnct05hlDC+KcxiJbKciQLKOx4mrdoimB6q7YEn0WsCpmMbBJaIDEu+q2+vx7MSI
	Me3ZQIZEeBeofr3GCPd+3j2nfPC3nxidBrjIobCiIa1e4f46UWHpUVnpvDVgdFwG3+jXYM78U0X
	Ep51hOVAuTozIDBZu/fv2AzqQI7FEKYUYihTwZifB0w2wp9QfBR8+MjzEvphCBN9M80MkMJoEcq
	ivrmO/wMUpWHniNem9+/OE5wfJlhEGS3dlW2M0EQnYFaYciLoJQYMSNxu5EeYiayQomLWf7tISE
	gxxZmb+eegF/j64bQ357520zGBhRF3WmZqBoI3kuXBqYdTqN2sYGdYtviYXVWo314vSUZRhdGTM
	1o9n94qevmVnDJTjp/Z4JfRmp3D41pPTZxBPuqg==
X-Google-Smtp-Source: AGHT+IHmMtcSJS1vesoWL7Q0hPKqj9Q+4q8sWivm0l5v/KxfrPJ5ryZ8BG1X2Y/X3wtMhTWMSjeQbw==
X-Received: by 2002:a05:600c:19ce:b0:455:bd8a:7e7 with SMTP id 5b1f17b1804b1-459f4f528b5mr89129575e9.9.1754854036411;
        Sun, 10 Aug 2025 12:27:16 -0700 (PDT)
Received: from asmirnov-G751JM.Home ([2a02:c7c:b28c:1f00:d8d1:2f6:48b:1545])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c4530a8sm37890947f8f.38.2025.08.10.12.27.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Aug 2025 12:27:16 -0700 (PDT)
From: Aliaksandr Smirnou <support@pinefeat.co.uk>
To: devicetree@vger.kernel.org
Cc: linux-media@vger.kernel.org,
	Aliaksandr Smirnou <support@pinefeat.co.uk>
Subject: [PATCH 0/2] Pinefeat cef168 lens control board driver
Date: Sun, 10 Aug 2025 20:26:07 +0100
Message-Id: <20250810192609.11966-1-support@pinefeat.co.uk>
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

Patches:
  dt-bindings: Pinefeat cef168 lens control board
  media/i2c: Pinefeat cef168 lens control board driver

 .../bindings/media/i2c/pinefeat,cef168.yaml   |  48 +++
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 MAINTAINERS                                   |   9 +
 drivers/media/i2c/Kconfig                     |   8 +
 drivers/media/i2c/Makefile                    |   1 +
 drivers/media/i2c/cef168.c                    | 342 ++++++++++++++++++
 drivers/media/i2c/cef168.h                    |  51 +++
 7 files changed, 461 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/pinefeat,cef168.yaml
 create mode 100644 drivers/media/i2c/cef168.c
 create mode 100644 drivers/media/i2c/cef168.h


base-commit: 2b38afce25c4e1b8f943ff4f0a2b51d6c40f2ed2
-- 
2.34.1


