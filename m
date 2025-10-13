Return-Path: <linux-media+bounces-44274-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 007A3BD35F9
	for <lists+linux-media@lfdr.de>; Mon, 13 Oct 2025 16:15:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 61D454EDF62
	for <lists+linux-media@lfdr.de>; Mon, 13 Oct 2025 14:15:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31A1828D84F;
	Mon, 13 Oct 2025 14:14:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="GyzHZvp1"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36B1125A331
	for <linux-media@vger.kernel.org>; Mon, 13 Oct 2025 14:14:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760364894; cv=none; b=deZIuq5TwdvYiDd2jXAvu153uWOo0l1OBPQCl+oO14Q905AXxrBifGiMTCTjHIrOcN1oKjotx/HA42GGmOaN16EPbrJvCIiOLujKogUtZTvmrVqLp1lvGpB1qyGVZDBhRMJ9TVxUdlxrGnuFXGgeRq+0yn6mjbuWAIPvWEk/9XY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760364894; c=relaxed/simple;
	bh=xM6+M/SyFflYknH7dftgYleR+CqneUH3h+wd93U33vM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=jIlSe75sa/5tGOccq5TNQD0EAAY+DxQhwUP1Byy9BiHpZRuASOEJLlKIj0MVQWZG8ox41rqtO7BffatSEL62iu+UoQN7d16Z5anUm47yuPvYoI1M66y49n9VESoEBHS/Djgy4Td1MvxAWC+kPtYP1cGzJXK9U5a4Cr/Vjfu5I8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=GyzHZvp1; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-59093250aabso2769524e87.2
        for <linux-media@vger.kernel.org>; Mon, 13 Oct 2025 07:14:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1760364890; x=1760969690; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4+LqH67jKM/F3LSKb9pvwKSduKssNZljIxm4L3nejxY=;
        b=GyzHZvp1DOcvm7vHNL+Td8CmhMsk7TGVNgQIoBjFfw4L6zQ+OeVeqG20NlrFcVTiOo
         4SQ1ZVy/dPholR5fEtit++d7J0+0xfUghp+joEVL3M0cVcWiLQ4/R+2J1Itjupw9xQF1
         Amug60kwa5bWueyMVrjWpjKqRNCPdFu5Wt7tc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760364890; x=1760969690;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4+LqH67jKM/F3LSKb9pvwKSduKssNZljIxm4L3nejxY=;
        b=oL9BO+veAeHyU2ZCWiMcC26yPWzpXMHXUWeRggTxj9zPu34K/JrCaQaWRfNlCL+NZV
         CPxt7K+XZzulf1sELqsIkZ9Ff4HmlMLXz+eazimK572Y7C4S4Ifv3+jzR4kw0HCS+01/
         v3m54/JivCjJJaef8WE6t8gXC7lZVS64uEYy6Dt0z0SejzPddqvJ/p3MufGL5gXrjqm+
         EOAdpg+LQ4kwRRU5VQ95vYN0lTkIqAUtPbptlidFQox8CHnEuLkwzDJy5iggedRjbQfK
         q3X4v//i7MaJjBH7qwiM89NOkdyc/YGEj/W6ii30/xmFfLhJQPzzbOaLKiDL8TKtcadM
         LOGw==
X-Forwarded-Encrypted: i=1; AJvYcCVp3avwTyv/Ml+d8y8kloMWAEiOiDQdIlS7EHN3oblhbYLaVJTIm2bW8YGkk7NrURyK+UMuqs1Os1nVhA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyUnW3e1aP6k7EYztRySaYPNFSRqmJqhbKuIbw44y+jIq8KLeh4
	c6hYnswGFXkoyyxRjJXsJfl7TYOaTDqMAvXKeNvicM4RVwoPIV7t51g7mMXviqDq0Q==
X-Gm-Gg: ASbGnctv2EMshSF1gs/AxD8pNyjYe0G2j8sqQSJ9x6v1QmGeEp+Fv4n+1uwLo4CYIBu
	mZlJnTBIeqPQqMMdpTRFXnid3k34tLJy0+dQHaVVw0x+bAPp4F/jYITfkGL6eKhW22VHH67haly
	GXV9D5W7VANZ64pD8adxn409E7zvJRxcGEyUUVLPzqnZvAQX4RJ1m6ujIIrchajoqEKUCM6QDgk
	1blqRtULMblBGmNgirJY1+Rhc6HNkzyatW2cnuO94y7B4TJDZQQ7yslvQGM82MuAcrsuDKVGP/s
	uYubPf/KXuqB0Y6iOM007UMhIAZEaePBUTDklcAfzYOpNUQ/k9x9sF9R6Vb5Wi/ceEBw5mV4k4q
	Fzu3DwuspsbE8ipBZ5DVzV9T+7xGbbWbpyNF0tpjJf4mHAot764kHywthy6DVYHZeq6tWpXyQ84
	n+30dB0xDSutOzMdmPkLCQx39dZFDr
X-Google-Smtp-Source: AGHT+IG+iBDcqiuo6CtjHJApPQk8SPIEd1S5IwUf4U1/yNdgttxsX0zixn6oQdpzKAlIqjeJyJH+pw==
X-Received: by 2002:a05:6512:1110:b0:590:656c:d114 with SMTP id 2adb3069b0e04-5906dae5d1bmr5995198e87.46.1760364890201;
        Mon, 13 Oct 2025 07:14:50 -0700 (PDT)
Received: from ribalda.c.googlers.com (56.213.88.34.bc.googleusercontent.com. [34.88.213.56])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-590881e4e58sm4165256e87.25.2025.10.13.07.14.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 07:14:49 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH 00/32] media: Use %pe format specifier
Date: Mon, 13 Oct 2025 14:14:40 +0000
Message-Id: <20251013-ptr_err-v1-0-2c5efbd82952@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFAJ7WgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDA0Nj3YKSovjUoiJdy0RzSzOLtOQUQ8s0JaDqgqLUtMwKsEnRsbW1AKj
 z2DxZAAAA
X-Change-ID: 20251013-ptr_err-9a7968fcd19f
To: Linus Walleij <linus.walleij@linaro.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 =?utf-8?q?Krzysztof_Ha=C5=82asa?= <khalasa@piap.pl>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Leon Luo <leonl@leopardimaging.com>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Jacopo Mondi <jacopo+renesas@jmondi.org>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
 Julien Massot <julien.massot@collabora.com>, 
 Jacopo Mondi <jacopo@jmondi.org>, Daniel Scally <djrscally@gmail.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
 Sylvain Petinot <sylvain.petinot@foss.st.com>, 
 Yong Zhi <yong.zhi@intel.com>, Bingbu Cao <bingbu.cao@intel.com>, 
 Tianshu Qiu <tian.shu.qiu@intel.com>, 
 Tiffany Lin <tiffany.lin@mediatek.com>, 
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
 Yunfei Dong <yunfei.dong@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Rui Miguel Silva <rmfrfs@gmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Martin Kepplinger <martink@posteo.de>, Purism Kernel Team <kernel@puri.sm>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Dafna Hirschfeld <dafna@fastmail.com>, 
 Heiko Stuebner <heiko@sntech.de>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Yemike Abhilash Chandra <y-abhilashchandra@ti.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, imx@lists.linux.dev, 
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-staging@lists.linux.dev, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.2

The %pe format specifier is designed to print error pointers. It prints
a symbolic error name (eg. -EINVAL) and it makes the code simpler by
omitting PTR_ERR().

The recently introduced test scripts/coccinelle/misc/ptr_err_to_pe.cocci
checks that we use %pe. Let's make it happy.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
Ricardo Ribalda (32):
      Input: cyttsp5 - Use %pe format specifier
      media: dvbdev: Use %pe format specifier
      media: mn88443x: Use %pe format specifier
      media: adv7842: Use %pe format specifier
      media: ar0521: Use %pe format specifier
      media: ccs: Use %pe format specifier
      media: i2c: ds90ub913: Use %pe format specifier
      media: i2c: ds90ub953: Use %pe format specifier
      media: i2c: imx274: Use %pe format specifier
      media: i2c: imx335: Use %pe format specifier
      media: i2c: imx412: Use %pe format specifier
      media: i2c: max9286: Use %pe format specifier
      media: i2c: max96717: Use %pe format specifier
      media: i2c: mt9m111: Use %pe format specifier
      media: i2c: mt9v111: Use %pe format specifier
      media: i2c: ov5675: Use %pe format specifier
      media: i2c: ov5693: Use %pe format specifier
      media: i2c: ov9282: Use %pe format specifier
      media: rj54n1cb0c: Use %pe format specifier
      media: i2c: st-mipid02: Use %pe format specifier
      media: ipu-bridge: Use %pe format specifier
      media: ipu3-cio2: Use %pe format specifier
      media: ipu6: isys: Use %pe format specifier
      media: mediatek: vcodec: Use %pe format specifier
      media: imx8mq-mipi-csi2: Use %pe format specifier
      media: platform: rzg2l-cru: Use %pe format specifier
      media: renesas: vsp1: Use %pe format specifier
      media: rkisp1: Use %pe format specifier
      media: samsung: exynos4-is: Use %pe format specifier
      media: ti: cal Use %pe format specifier
      media: staging: ipu3-imgu: Use %pe format specifier
      media: staging/ipu7: Use %pe format specifier

 drivers/input/touchscreen/cyttsp5.c                          |  4 ++--
 drivers/media/dvb-core/dvbdev.c                              |  4 ++--
 drivers/media/dvb-frontends/mn88443x.c                       |  7 +++----
 drivers/media/i2c/adv7842.c                                  |  4 ++--
 drivers/media/i2c/ar0521.c                                   |  4 ++--
 drivers/media/i2c/ccs/ccs-core.c                             |  8 ++++----
 drivers/media/i2c/ds90ub913.c                                |  2 +-
 drivers/media/i2c/ds90ub953.c                                |  2 +-
 drivers/media/i2c/imx274.c                                   |  3 +--
 drivers/media/i2c/imx335.c                                   |  4 ++--
 drivers/media/i2c/imx412.c                                   |  4 ++--
 drivers/media/i2c/max9286.c                                  |  4 ++--
 drivers/media/i2c/max96717.c                                 |  2 +-
 drivers/media/i2c/mt9m111.c                                  |  4 ++--
 drivers/media/i2c/mt9v111.c                                  | 12 ++++++------
 drivers/media/i2c/ov5675.c                                   |  4 ++--
 drivers/media/i2c/ov5693.c                                   |  4 ++--
 drivers/media/i2c/ov9282.c                                   |  4 ++--
 drivers/media/i2c/rj54n1cb0c.c                               |  8 ++++----
 drivers/media/i2c/st-mipid02.c                               |  4 ++--
 drivers/media/pci/intel/ipu-bridge.c                         |  4 ++--
 drivers/media/pci/intel/ipu3/ipu3-cio2.c                     |  4 ++--
 drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c                |  4 ++--
 .../media/platform/mediatek/vcodec/common/mtk_vcodec_dbgfs.c |  4 ++--
 drivers/media/platform/nxp/imx8mq-mipi-csi2.c                |  4 ++--
 drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c        |  8 ++++----
 drivers/media/platform/renesas/vsp1/vsp1_drv.c               |  3 +--
 drivers/media/platform/rockchip/rkisp1/rkisp1-csi.c          |  4 ++--
 drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c          |  4 ++--
 drivers/media/platform/samsung/exynos4-is/media-dev.c        |  4 ++--
 drivers/media/platform/ti/cal/cal.c                          |  3 +--
 drivers/staging/media/ipu3/ipu3.c                            |  3 +--
 drivers/staging/media/ipu7/ipu7-isys-csi-phy.c               |  4 ++--
 drivers/staging/media/ipu7/ipu7-isys-csi2.c                  |  4 ++--
 34 files changed, 72 insertions(+), 77 deletions(-)
---
base-commit: 3a8660878839faadb4f1a6dd72c3179c1df56787
change-id: 20251013-ptr_err-9a7968fcd19f

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>


