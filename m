Return-Path: <linux-media+bounces-48766-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 783A9CBCE30
	for <lists+linux-media@lfdr.de>; Mon, 15 Dec 2025 09:00:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5F4C5300CA0F
	for <lists+linux-media@lfdr.de>; Mon, 15 Dec 2025 08:00:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6B4B32A3C5;
	Mon, 15 Dec 2025 07:59:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="maQsA5SJ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A845E329E79
	for <linux-media@vger.kernel.org>; Mon, 15 Dec 2025 07:59:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765785597; cv=none; b=Fk38mhiUnKH/4asIymi/dmqhqtevxtH2GM4D0OrhZtjJdY9vXz4PdLxQ99ITAbBq7LShBNoggZ3hlMDBCW5blTX6MstTlLlTCc1C+CuSqCtoybBUawbfVKoTxJbJLsOarED9BLOeIV9ZQIM5uBqk4GQTSWKRc9n/V3eKkXh60eM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765785597; c=relaxed/simple;
	bh=pYWPUiYByiZkGu4rD+NqHdrKuVDp3YaH1DFpSKGq56s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lx0W8iqsnTD8bNOxUPtLsTJMRibeC1xguLE9CjrRFrojbNNnrKine18tmI6QP0fTjBBJ4qeLiF7PO7rWwUSvU35w5qULmx7pOJ88iRFbIh8I3mx7JMf9LiT2rmN7d3bERj8eDjf+cYS378qqM6nNBUdAmsah8wS1ppHlTrgvcck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=maQsA5SJ; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-7b8eff36e3bso4829737b3a.2
        for <linux-media@vger.kernel.org>; Sun, 14 Dec 2025 23:59:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765785595; x=1766390395; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=J3y8U5/hQxLgvSw1sA3RfHATBZeuvFmSgboI4LGzrUw=;
        b=maQsA5SJ4QoChi4rx4Tej9TP4SAYp3dKC9R7JC5GxP0pfpmegRm9Hc6JVifRnxmf+r
         Tx16PpON63Ybi1mbVhd+myrPr1nEF5syCae3M/ibvz+ahBlG7IujgUxIvigWK1chuOOw
         Dal1BIdQLLh3TGDyhExMDiJQW8qXF90VhP6kCng7AmrvSJf9c9ujtI/PVNE/fQ/U+cWr
         XMkGB3xYpdkeGy6DuwBi1OFV9ZcfloFFfiIEDBcP8LnYtGmYBnEkj/8umDpivxCZLR1N
         HfjkX4WfFXVbLVXQFZVHKujIeHRs2n3Nrv08wVJHM/qvlt9ZfV13wytVjqA5ysdxH1/G
         uu5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765785595; x=1766390395;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J3y8U5/hQxLgvSw1sA3RfHATBZeuvFmSgboI4LGzrUw=;
        b=W7DFK1Fzl2nLmimn0aeerkLFlgPk1k4/M5XiSNsZ7r5/DCGyZd0xf/cLiurn0+O3i9
         WBxWDOkzSxpNc2Fd88sCEKJ/QoRhKGaSm7E+wz+PYv7th++hSYmMKZFdSAIerqGw6DKY
         3ddajCooXHAhS914+YzFB22aqCPBs13rA1gZoZYRvsZbZ2N+7/0G9Le/NOT7VxiLqek6
         CcJPUHHpU0ajESe4/LjLJpIqhz9Xag0C22jAYZ+kfP1rx9mngHNd/jzZGY2q9o59Y4Oc
         yBd61e8Ihp4BhFd8tgRZDodYDcNYsBK3H/JA7sIt5t+5ljKNwaz3mXjc3I+n8Ua9YVMN
         5Bqw==
X-Forwarded-Encrypted: i=1; AJvYcCU5Us1ZHt98BI2jBfTSPQkw583/qOWZSxy1YdP8sQmjDCQZUcneaI9pD9K1FlXqiFTIUkwD7aTScmbcpQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwVwyfxQ5IrmvB05EeB7W5TTOGYlsSHWUCMJmFlvz9UnnuU0bqn
	GvviYe4bkgq2JPZ7R/JXFfenFEZIsXqqpV1rmd975L+PuuVrs+30+XOP
X-Gm-Gg: AY/fxX663ClSVv8yqr5FB0YgpNm5FyxxZygHGYosAYbggjodhO1bjUFTNmGo/aHSuTu
	Xl5Rg8W+T1g+mxmaIxC3Yzlrx75JPqGIVxFsY88Yyffj9oXkr/sbxqbCu0zYubfaz71M2vF/6eX
	Oap+DA+6XLDKy1vMaZ6fZ0cBA2BdbnDCxs9/leqR/EjpREIYIeJjXGfcxAZsXK+piXok9Zc/iXq
	UIP/akslmyIYi9fr6ZS0UWTkN3KeMylYA+9Wx7A1rVa44TOSofMni+vHy+1ql/jnQL1lR3eqY/K
	lCqC9PLIRWJxGm6GEbcRdzbVQTt/BOdRORVzh5bmN6aH47FHyHnd8rpmAIoYQPCA3aKPNtau9yj
	4kmz2Q/U52R84P8WUAwGcbkdJ78S+P3Ge6IhhMA/b1QonquHvlw/+18Kr2YbZfHcAzVTaCAqv+O
	MyYQ/dS6+4ijU=
X-Google-Smtp-Source: AGHT+IHQQmJ+wLeQ1qi/KuqvZJU/To7Y4dcl5fOzW093dtZDFZfBZPmK7O119hfs7hDvgn6WW0/A7A==
X-Received: by 2002:a05:7023:d02:b0:11b:9386:7ecc with SMTP id a92af1059eb24-11f34c43d8dmr7717987c88.41.1765785594831;
        Sun, 14 Dec 2025 23:59:54 -0800 (PST)
Received: from fedora ([172.59.162.202])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11f2e2ff624sm43637473c88.12.2025.12.14.23.59.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Dec 2025 23:59:54 -0800 (PST)
From: Alex Tran <alex.t.tran@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Alex Tran <alex.t.tran@gmail.com>
Subject: [PATCH v2 0/4] media: omap3isp/et8ek8: Add CCP2 CRC configuration support
Date: Sun, 14 Dec 2025 23:58:31 -0800
Message-ID: <cover.1765782992.git.alex.t.tran@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series provides support for configuring CRC checksum via device tree
for et8ek8 sensor and OMAP3 ISP receiver.

Previously, CRC was hardcoded to enabled (1) in the sensor driver and ISP
receiver. This series makes it configurable through DT, allowing both
sides to be aligned, as both must use the same CRC setting for proper CCP2
communication.

Changes maintain backward compatibility by defaulting CRC to 1 when the
property is not specified in the device tree.

The series also converts both device tree bindings from TXT to YAML
schema format, as required.

Changes in v2:
- Fixed broken patch threading
- Added receiver support for reading crc from device tree
- Converted both sensor and ISP bindings from TXT to YAML format
- Both sensor and ISP endpoints can now be configured consistently via DT

Alex Tran (4):
  media: i2c: et8ek8: et8ek8_driver: add support for crc configuration
    via device tree
  dt-bindings: media: i2c: et8ek8: document missing crc as optional
    property
  media: platform: ti: omap3isp: isp: read crc configuration from device
    tree for CCP2
  dt-bindings: media: omap3isp: document missing crc as optional
    property

 .../bindings/media/i2c/toshiba,et8ek8.txt     |  55 -----
 .../bindings/media/i2c/toshiba,et8ek8.yaml    |  99 +++++++++
 .../devicetree/bindings/media/ti,omap3isp.txt |  71 -------
 .../bindings/media/ti,omap3isp.yaml           | 196 ++++++++++++++++++
 MAINTAINERS                                   |   1 +
 drivers/media/i2c/et8ek8/et8ek8_driver.c      |  49 ++++-
 drivers/media/platform/ti/omap3isp/isp.c      |   5 +-
 7 files changed, 339 insertions(+), 137 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/media/i2c/toshiba,et8ek8.txt
 create mode 100644 Documentation/devicetree/bindings/media/i2c/toshiba,et8ek8.yaml
 delete mode 100644 Documentation/devicetree/bindings/media/ti,omap3isp.txt
 create mode 100644 Documentation/devicetree/bindings/media/ti,omap3isp.yaml

-- 
2.51.0


