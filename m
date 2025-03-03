Return-Path: <linux-media+bounces-27358-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8186CA4C5FB
	for <lists+linux-media@lfdr.de>; Mon,  3 Mar 2025 17:03:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E1FF93A812A
	for <lists+linux-media@lfdr.de>; Mon,  3 Mar 2025 16:02:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9960215165;
	Mon,  3 Mar 2025 16:02:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="EuMMZM/x"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79A147080D;
	Mon,  3 Mar 2025 16:02:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741017738; cv=none; b=rVo15JkM4wZZXjl5UQtAM5ZhOyTjWFvL5hQI2o0SiupIz4mqySWPhKa6vLIpKR/vWBsO+WKaS4GyQg9R7F6cfcMn/mFc7+rxndiM5OksUZMT69tAeyqdvHmDqMS2M1LQUhbARyYauBHG7Uoh6jgxRvUCiSi/ZhaKZyNbRdgnYyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741017738; c=relaxed/simple;
	bh=PG4GnlV8k/FN7kKkLP0CXN8xUJ6bTDOH+YyQOqYlWEs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=WAqGLn8QqwfXrPklWZbgnJNAQNalNedW512l5R79j3JiSTisosJQe80qLkGzxMDHO9k6ht+pWDjX5PogphKru132p2VKUbphl33Hj9dlkKwvUehAcMNNfKUMp1cmGLc0+32E70xhJKOaW0drjgNORBK7NJzhO4K83axkjfLV6Rs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=EuMMZM/x; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c69:8872:6fe4:6987:313:70cc])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B57DB1189;
	Mon,  3 Mar 2025 17:00:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1741017643;
	bh=PG4GnlV8k/FN7kKkLP0CXN8xUJ6bTDOH+YyQOqYlWEs=;
	h=From:Subject:Date:To:Cc:From;
	b=EuMMZM/xINI9Ms12ccxFyvICix6VUDcty3ZQQWVB+y9go8iAohKCEYMt/A3lp7xs9
	 qCLayHfh5D9FeGF7HymizYE2atuNz8y48K7l64RJhTtu5ynDsmeqYixzFs673Leh+b
	 3IQL7O2hWmitqH5Gdm3MxpCB4rpSVzxBaCnYIU/g=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Subject: [PATCH v3 00/19] media: i2c: ds90ub9xx: Error handling, UB9702
 improvements
Date: Mon, 03 Mar 2025 21:32:03 +0530
Message-Id: <20250303-b4-ub9xx-err-handling-v3-0-7d178796a2b9@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHvSxWcC/zWNwQ6CMBBEf4X07JpabKCe/A/DodAFNpGWbLHBE
 P7divH4JjNvNhGRCaO4FZtgTBQp+AzlqRDdaP2AQC6zUFJpWcoS2iu8WrOugMyQG+5JfgBd2dp
 oWaPVKPJ2ZuxpPbyPJvNIcQn8Pm6S+qY/40X9dTTNHBJO6JcISYGEvpKV7oxBq+SdHNoYfBssu
 3MXJtHs+/4BxouLob4AAAA=
X-Change-ID: 20250303-b4-ub9xx-err-handling-57a89508ea5e
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Devarsh Thakkar <devarsht@ti.com>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
 Jai Luthra <jai.luthra@ideasonboard.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2585;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=PG4GnlV8k/FN7kKkLP0CXN8xUJ6bTDOH+YyQOqYlWEs=;
 b=owEBbQKS/ZANAwAIAUPekfkkmnFFAcsmYgBnxdJ+6wY8b2WhgGU+RJKua8ijkB5l1rrzizZhD
 e6b/+/scHOJAjMEAAEIAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCZ8XSfgAKCRBD3pH5JJpx
 RRYgEACvPbYD9YPKWOvA6z8UVIQw6dvvYjq6hy6ZHxYoZjVE4eGXUzfLdWpQ9iI6uR030LoPQDJ
 RSOIX9uTvnJJRmoEDY1cltcImONfdEIb7yXb9FoaJnmm1x5StwO4yxSgpKt+hsIXgqjifnuvDNe
 HpB9AAqzhTh/CDmr19Fxsv2nco2YUsktfHwQZZvT6WmKCw5zX1hKYs/nCCinWhZiKqzdnFL57mJ
 rbFg0Ac2rmnS5Ju263esaCNggZvXJrIKXfbLWw3K1JBKfpYP0cHgI7+K1MDzGHjQBtk+AO/QKcs
 yQSTNgVnvj+C7qRA4MHcBvTWBHBIIzcmO9fW/jsJsN9tFGsf4zwEy7kXMZbKtv4WuxGrzy69uWm
 2WMdkK95Uo5LD1tmdOl06Do+Mqdq7xLIHUHs6fN6TP4NR0MJqOCF6Zx5iyF9Iv8bE2+XXUjYUMn
 oUsu9yhieaPXcwvHhVoXN3Uxuaz7NuFHpU6qqybJNcaXWPqaAe50s9HvOPMKLLK1M/uchVc8Cog
 J3xJYdz7ORp3UQkPwUDxZ46A+o5ePGO2MhlGy4fZKE8GySbrPFnDA02XZo8KNqIPI8BvgjHlQIN
 qKJfB0eumV7yIM7tbAMPj9ZlVYf3nwTWEsqM03LxxlL2+xE7KyyPl30Kz3Xzpmdbd3ItUEwhacT
 Ov/5xbQjzW1ABlA==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145

Hi,

This series has two main parts: 1) add error handling all around, and 2)
update the drivers according to latest (mostly non-public) information
from TI.

Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
Changes in v3:
- Now that this series is closer to being merged, squash "Remove old
  ub9702 RX port init code (SQUASH)" and "Update UB9702 init sequences"
  as they were only split to ease review.
- Drop SSCG bindings and driver changes.
- Fix Sakari's minor review comments on "Speed-up I2C watchdog timer".
- Link to v2: https://lore.kernel.org/r/20250124-ub9xx-improvements-v2-0-f7075c99ea20@ideasonboard.com

---
Jai Luthra (4):
      media: i2c: ds90ub953: Speed-up I2C watchdog timer
      media: dt-bindings: ti,ds90ub960: Allow setting serializer address
      media: i2c: ds90ub960: Configure serializer using back-channel
      media: i2c: ds90ub9xx: Set serializer temperature ramp

Tomi Valkeinen (15):
      media: i2c: ds90ub953: Fix error prints
      media: i2c: ds90ub913: Fix returned fmt from .set_fmt()
      media: i2c: ds90ub913: Align ub913_read() with other similar functions
      media: i2c: ds90ub9xx: Add err parameter to read/write funcs
      media: i2c: ds90ub960: Add error handling to multiple places
      media: i2c: ds90ub953: Add error handling to ub953_log_status()
      media: i2c: ds90ub913: Add error handling to ub913_log_status()
      media: i2c: ds90ub960: Move UB9702 registers to a separate section
      media: i2c: ds90ub960: Add UB9702 specific registers
      media: i2c: ds90ub960: Split ub960_init_tx_ports()
      media: i2c: ds90ub960: Refresh ub960_init_tx_ports_ub9702()
      media: i2c: ds90ub960: Add RX port iteration support
      media: i2c: ds90ub960: Move all RX port init code into ub960_init_rx_ports()
      media: i2c: ds90ub960: Update UB9702 init sequences
      media: i2c: ds90ub953: Move reg defines to a header file

 .../bindings/media/i2c/ti,ds90ub953.yaml           |   77 +-
 .../bindings/media/i2c/ti,ds90ub960.yaml           |   16 +-
 drivers/media/i2c/ds90ub913.c                      |   82 +-
 drivers/media/i2c/ds90ub953.c                      |  242 ++-
 drivers/media/i2c/ds90ub953.h                      |  104 +
 drivers/media/i2c/ds90ub960.c                      | 2166 +++++++++++++++-----
 6 files changed, 1966 insertions(+), 721 deletions(-)
---
base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
change-id: 20250303-b4-ub9xx-err-handling-57a89508ea5e

Best regards,
-- 
Jai Luthra <jai.luthra@ideasonboard.com>


