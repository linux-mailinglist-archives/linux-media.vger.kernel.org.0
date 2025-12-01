Return-Path: <linux-media+bounces-47948-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D7B81C97530
	for <lists+linux-media@lfdr.de>; Mon, 01 Dec 2025 13:42:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id CB2014E2185
	for <lists+linux-media@lfdr.de>; Mon,  1 Dec 2025 12:41:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 425B730DEAD;
	Mon,  1 Dec 2025 12:41:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="hIL5Dqc7";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="0oKmwJ/v"
X-Original-To: linux-media@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A23A30C373;
	Mon,  1 Dec 2025 12:41:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764592888; cv=none; b=APpoabY+AOh0gCrrsAgTO8DcTv5XukQBLtCU2luFw4DbM5kKb93YRCf6aO0/qJV8l+uMmL082yx2pMDWunONvjPqSzB7zcOYRNgzSosKP7X6OOS0NZiGsG6+1euibyB2WS5IPLwlNJwHG5CD6kGMlWen/1huSduRZy40u+XeOG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764592888; c=relaxed/simple;
	bh=+6R2Dm3f0PWsrFTZH6ZutnaKbYK6hSXwOT1Aim7DcUg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=XQjzHZ/hm11kyV6f0SwqIxCahV1CS8RW6qwQ/zzn8cvYx0kv7Ks0LobI/U1dROKs/dLR8ttK/W65h/v1TD0g2V+N/fB+hlj92MjaEV5V+nQvR3xmyK2gkDXm6UGph1OXSqhRogcSaaA7QRhyzmCdsy47DaXTIV6kHo8xBKs9iVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=hIL5Dqc7; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=0oKmwJ/v; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Date:Subject:From; t=1764592855; bh=sZSoiCqr6jnkXFHZB09/EO6
	ISHkyMj98KPx4jfDfSHQ=; b=hIL5Dqc7Ax0vnHw4rtOzg8J1GUk32G02PYL+cjMaOR07vvYZGd
	kft54/SSQ9TFHBBR+pZuvEGkjMi/diEPNdTNCBNQ25N1D2yxhkX/wM1bdzTo1YBt1TnHdEhj1wE
	hwkUGANPKykfs8/Y2FDXkPU0tXDMXvb979Kvn1bFHzaEtOYA+hA0VIimuRijw52GoHQdOXnOv0G
	NwdPiSWk0Sg8UNQkD1qud5Vg2MJFk2ypuGgvS3tKoN3iiyd3icdFdAh+TAWm5x9zIeP2s5B+UiQ
	tY//lgGotKn8O9Pa6qImpJzmC5dqtl9Mm24Edv4SRJl+s3oAoY/EiVC3qdxQA4aFDyg==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Date:Subject:From; t=1764592855; bh=sZSoiCqr6jnkXFHZB09/EO6
	ISHkyMj98KPx4jfDfSHQ=; b=0oKmwJ/vk1Im2g9WGsDi2X+OOVgWoaRxACBHQPENcfhvNawBVR
	/hh4wiNSF+Bj9fRzODRYYrZtZsuPVkkPeHBw==;
From: Vasiliy Doylov <nekocwd@mainlining.org>
Subject: [PATCH v3 0/3] media: i2c: lc898217xc: initial driver
Date: Mon, 01 Dec 2025 15:40:42 +0300
Message-Id: <20251201-media-i2c-lc898217xc-initial-driver-v3-0-46e23897e921@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMqMLWkC/53NQQ6CMBCF4auYrh1TphTQlfcwLko7hUmwmEIaj
 eHuFly6MS7fZPL9LzFRZJrEafcSkRJPPIY81H4nbG9CR8Aub4EStUSs4UaODTBaGGxzbLCoHxY
 48MxmABc5UQRXt1qaQmlLWmTpHsnzY6tcrnn3PM1jfG7RhOv14ytZ/uQnBAmVKStlySsyzflmO
 Az5K3SHMXZijaTiD7jIMKH3Dlv0TtMXvCzLGwpr9oE0AQAA
X-Change-ID: 20250227-media-i2c-lc898217xc-initial-driver-d7b50a135ce5
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, david@ixit.cz
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 Vitalii Skorkin <nikroks@mainlining.org>, 
 Antonio Rische <nt8r@protonmail.com>, 
 Vasiliy Doylov <nekocwd@mainlining.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1903;
 i=nekocwd@mainlining.org; h=from:subject:message-id;
 bh=+6R2Dm3f0PWsrFTZH6ZutnaKbYK6hSXwOT1Aim7DcUg=;
 b=owGbwMvMwCXGd//xporA/cmMp9WSGDJ1e64f+H1orZNsQvimk/NUWL4G8PzW5EyOcln27d6sE
 J/MeayLOkpZGMS4GGTFFFn+Gy6SO3BD2bMuN/UZzBxWJpAhDFycAjARsY+MDDc1J8i9eubE0iLl
 693wb7nLIqE398wjLyjEpOU4na30n8jwz4bL038+R2i714WOC91SBzZcrPFfFbzm3hqOKYsS/XQ
 1GAA=
X-Developer-Key: i=nekocwd@mainlining.org; a=openpgp;
 fpr=FF31A21EC0D823497E6D65E60EDFE3B27851BF63

LX898217XC is a 11 bit DAC, designed for linear control
of voice coil motor. This driver creates a V4L2 subdevice
and provides control to set the desired focus.

Tested on Oneplus 6 (oneplus-enchilada)

Co-developed-by: Vitalii Skorkin <nikroks@mainlining.org>
Signed-off-by: Vitalii Skorkin <nikroks@mainlining.org>
Co-developed-by: Antonio Rische <nt8r@protonmail.com>
Signed-off-by: Antonio Rische <nt8r@protonmail.com>
Signed-off-by: Vasiliy Doylov <nekocwd@mainlining.org>
---
Changes in v3:
- Fixed MAINTAINERS (Krzysztof)
- Reordered commits (Krzysztof)
- Removed blank line from device-tree documentation (Krzysztof)
- Refactored to use CCI regmap
- Refactored to use dev_err_probe in probe
- Link to v2: https://lore.kernel.org/all/20250304-media-i2c-lc898217xc-initial-driver-v2-0-6a463cef3ea8@mainlining.org/
Changes in v2:
- PM functions annotated as __maybe_unused.
- Fixed dt bindings documentation commit message
- Added v4l2 events (now v4l2-compliance shows no failed tests)
- Link to v1: https://lore.kernel.org/r/20250304-media-i2c-lc898217xc-initial-driver-v1-0-e2ffd2b2fd5e@mainlining.org

---
Vasiliy Doylov (3):
      media: dt-bindings: Add LC898217XC documentation
      media: i2c: Add driver for LC898217XC VCM
      MAINTAINERS: Add entry for Onsemi LC898217XC lens voice coil driver

 .../bindings/media/i2c/onnn,lc898217xc.yaml        |  53 +++++
 MAINTAINERS                                        |   7 +
 drivers/media/i2c/Kconfig                          |   9 +
 drivers/media/i2c/Makefile                         |   1 +
 drivers/media/i2c/lc898217xc.c                     | 254 +++++++++++++++++++++
 5 files changed, 324 insertions(+)
---
base-commit: 7d31f578f3230f3b7b33b0930b08f9afd8429817
change-id: 20250227-media-i2c-lc898217xc-initial-driver-d7b50a135ce5

Best regards,
-- 
Vasiliy Doylov <nekocwd@mainlining.org>


