Return-Path: <linux-media+bounces-1959-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5219880A594
	for <lists+linux-media@lfdr.de>; Fri,  8 Dec 2023 15:34:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0D02D281C14
	for <lists+linux-media@lfdr.de>; Fri,  8 Dec 2023 14:34:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8FA81E487;
	Fri,  8 Dec 2023 14:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Yz5zf475"
X-Original-To: linux-media@vger.kernel.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A490B173B;
	Fri,  8 Dec 2023 06:34:34 -0800 (PST)
Received: from stla-brain-8255-1.home (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmassot)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 296666607377;
	Fri,  8 Dec 2023 14:34:33 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1702046073;
	bh=LZVCAsCUnDL0KeLYlgde5y7S5stjtAOpob5t+fOLuI4=;
	h=From:To:Cc:Subject:Date:From;
	b=Yz5zf475kCZdlg0MgRs59/Ct6YMN+G68OTSeQTTrshiU99FiNq9vrr/KAr+SigmE9
	 QWJilMoGaIQamNdfwtRbVY7eq17LTvgf6GML8gBDVdUuYte9B75tlV3MLIx3GLQWTr
	 NSE+xw3jjudHUoIN4IlHLlbmJwnrftrAPdGIr5sOU5qnyUfm5QTX1nlmUzwkQOCtnE
	 La+v5WPWlQQbOzxosxkUCiBuMxg5kzUv2d5IRUbeoxHfOms0uBtNIYmn4A5tsNPwp7
	 rCrjkoOauw06aZkLU/j6//lYj3Q7JWScS2o8Vtfn2Z0FteaRZVee0XoFo32Bj/IrrN
	 2tSKe5YAp45zg==
From: Julien Massot <julien.massot@collabora.com>
To: devicetree@vger.kernel.org,
	linux-media@vger.kernel.org
Cc: kernel@collabora.com,
	Julien Massot <julien.massot@collabora.com>
Subject: [PATCH v2 0/4] Add support for MAX96714F and MAX96717F GMSL2 ser/des
Date: Fri,  8 Dec 2023 15:33:55 +0100
Message-ID: <20231208143359.469049-1-julien.massot@collabora.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


Change in v2:
- move dt-binding changes from 3/4 to 1/4

Hi,

These patches add support for Maxim MAX96714F deserializer and
MAX96717F serializer.

MAX96714F has one GMSL2 input port and one CSI2 4 lanes output port,
MAX96717F has one CSI2 input port and one GMSL2 output port.

The drivers support the tunnel mode where all the
CSI2 traffic coming from an imager is replicated through the deserializer
output port.

Both MAX96714F and MAX96717F are limited to a 3Gbps forward link rate
leaving a maximum of 2.6Gbps for the video payload.

Julien Massot (4):
  dt-bindings: media: add Maxim MAX96714F GMSL2 Deserializer
  dt-bindings: media: add Maxim MAX96717F GMSL2 Serializer
  media: i2c: add MAX96714 driver
  media: i2c: add MAX96717 driver

 .../bindings/media/i2c/maxim,max96714f.yaml   |  163 +++
 .../bindings/media/i2c/maxim,max96717f.yaml   |  144 +++
 MAINTAINERS                                   |   12 +
 drivers/media/i2c/Kconfig                     |   26 +
 drivers/media/i2c/Makefile                    |    2 +
 drivers/media/i2c/max96714.c                  |  945 ++++++++++++++++
 drivers/media/i2c/max96717.c                  | 1003 +++++++++++++++++
 7 files changed, 2295 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/maxim,max96714f.yaml
 create mode 100644 Documentation/devicetree/bindings/media/i2c/maxim,max96717f.yaml
 create mode 100644 drivers/media/i2c/max96714.c
 create mode 100644 drivers/media/i2c/max96717.c

-- 
2.43.0


