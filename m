Return-Path: <linux-media+bounces-1533-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 67C82802F1D
	for <lists+linux-media@lfdr.de>; Mon,  4 Dec 2023 10:47:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6045D1C209F9
	for <lists+linux-media@lfdr.de>; Mon,  4 Dec 2023 09:47:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0F491D53B;
	Mon,  4 Dec 2023 09:47:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nguQT6fE"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E34AD6;
	Mon,  4 Dec 2023 01:47:24 -0800 (PST)
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-a18b0f69b33so751932366b.0;
        Mon, 04 Dec 2023 01:47:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701683242; x=1702288042; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=N7+GisMetmeV1BjhAW+nXBCvnzDTHf4Bb1eGUAm0TFs=;
        b=nguQT6fEdXUR1UNH1xjla1b0QlZLMoDNFAGgpKsUzHP7wZzz4E8yl+D1MxU1sJZfWg
         +gMYH8W18/Nm7a7unwFGBPyOZwG0HnCO09qV56umE+HkD8OJXxNPZ91Si3GH395sSTFO
         wHA3uKco+qgorQEopyhxr7t7UWx2GZIJXj12vqNRLio4/2g4QMZ7zoXYhU1v/a82b2Cb
         GNU4ILgBO3Crhx/Uy2EdWzxL0cTkPLNNawSIb+RE+GnjZ9RKFKTlaT+MdmOTIS6JiDM2
         BFPmWAYZIjrypabN0XQ9OaYYeaGyNpphPLYf4FUB6EkdmbimGG8iGjBWoDavrfkefpSP
         kt4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701683242; x=1702288042;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N7+GisMetmeV1BjhAW+nXBCvnzDTHf4Bb1eGUAm0TFs=;
        b=lRTFr7BR+KKt6tRyzO9BKzm4n6kRv/iJfEFCoB57Osggl2/0tfNrPC4MfxPjUpCkrr
         fPTpTIYWWMYv0TjGjA7pnzHZaWCuAl+XYfezy+/DgcPp0Lvh2SPqXA0AfHX2XSmLUdh1
         1cR0MAVIZrid2nGNYB3tLxgvb1dMJEjuilgsXj1fKLBjHCVe63f6B054EvRbW/XfXk2d
         zYgyv4ZFZZ50bVTPD41JQMzoULKial0yJzJWgxQYrua35lf2zqTNaLD82lrTZak1U1qM
         djRpn2PG4KD4q4HB+DSTEFIZPNQZ0jao2JB78Pt4RoX2kytuk87PqzKtOYRtYqwLpZ2j
         1K1g==
X-Gm-Message-State: AOJu0YyHXGbYCeG/reVCkRdeRksj3BBqHpbXqxNsZ8eWUTcHEGV30lVE
	yFDPcoUD5qVkfgfhT1s5ByU=
X-Google-Smtp-Source: AGHT+IEVVV2+fQMGFUi9/E/mkA/TQDsBWdCygc8K6b/XEzEsq/aFwPydzlsP0l8BUEaA2WgnSORiAA==
X-Received: by 2002:a17:906:212:b0:a1b:7af2:614d with SMTP id 18-20020a170906021200b00a1b7af2614dmr902929ejd.37.1701683242451;
        Mon, 04 Dec 2023 01:47:22 -0800 (PST)
Received: from tom-HP-ZBook-Fury-15-G7-Mobile-Workstation.station (net-188-217-48-100.cust.vodafonedsl.it. [188.217.48.100])
        by smtp.gmail.com with ESMTPSA id le12-20020a170907170c00b009dd90698893sm5051705ejc.38.2023.12.04.01.47.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Dec 2023 01:47:22 -0800 (PST)
From: Tommaso Merciai <tomm.merciai@gmail.com>
To: 
Cc: laurent.pinchart@ideasonboard.com,
	martin.hecht@avnet.eu,
	michael.roeder@avnet.eu,
	linuxfancy@googlegroups.com,
	mhecht73@gmail.com,
	sakari.ailus@linux.intel.com,
	christophe.jaillet@wanadoo.fr,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Alain Volmat <alain.volmat@foss.st.com>,
	Paul Elder <paul.elder@ideasonboard.com>,
	Gerald Loacker <gerald.loacker@wolfvision.net>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: [PATCH v15 0/3] media: i2c: Add support for alvium camera
Date: Mon,  4 Dec 2023 10:47:13 +0100
Message-Id: <20231204094719.190334-1-tomm.merciai@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi all,

This series add support for Allied Vision Alvium camera.
The Alvium camera is shipped with sensor + isp in the same housing.
The camera can be equipped with one out of various sensor and abstract
the user from this. Camera is connected via MIPI CSI-2.

Driver use latest V4L2_CCI_I2C API.

https://www.alliedvision.com/en/products/embedded-vision-solutions/

Tested the following alvium models:
 - alvium 1500 C-500c
 - alvium 1800 C-2050c
 - alvium 1800 C-1240c
 - alvium 1800 C-040c
 - alvium 1800 C-052c
 - alvium 1800 C-240m

Note:
 - Driver is rebased on top of [1], commit [2].

Thanks & Regards,
Tommaso

 - [1] https://git.linuxtv.org/sailus/media_tree.git/log/
 - [2] media: stm32-dcmipp: STM32 DCMIPP camera interface driver (79adb3adb331)

Tommaso Merciai (3):
  dt-bindings: vendor-prefixes: Add prefix alliedvision
  media: dt-bindings: alvium: add document YAML binding
  media: i2c: Add support for alvium camera

 .../media/i2c/alliedvision,alvium-csi2.yaml   |   81 +
 .../devicetree/bindings/vendor-prefixes.yaml  |    2 +
 MAINTAINERS                                   |    9 +
 drivers/media/i2c/Kconfig                     |   10 +
 drivers/media/i2c/Makefile                    |    1 +
 drivers/media/i2c/alvium-csi2.c               | 2530 +++++++++++++++++
 drivers/media/i2c/alvium-csi2.h               |  475 ++++
 7 files changed, 3108 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/alliedvision,alvium-csi2.yaml
 create mode 100644 drivers/media/i2c/alvium-csi2.c
 create mode 100644 drivers/media/i2c/alvium-csi2.h

-- 
2.34.1


