Return-Path: <linux-media+bounces-1951-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 77ED280A4FD
	for <lists+linux-media@lfdr.de>; Fri,  8 Dec 2023 15:02:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2EDBA1F2120D
	for <lists+linux-media@lfdr.de>; Fri,  8 Dec 2023 14:02:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C45EA1DDD1;
	Fri,  8 Dec 2023 14:02:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="QXhx2F9i"
X-Original-To: linux-media@vger.kernel.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7503DA9;
	Fri,  8 Dec 2023 06:02:40 -0800 (PST)
Received: from stla-brain-8255-1.home (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmassot)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id B311566073BE;
	Fri,  8 Dec 2023 14:02:38 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1702044159;
	bh=h+HbizrJKPn8UpSI3F6HuTM+2XjNta254C+sNhLFv0A=;
	h=From:To:Cc:Subject:Date:From;
	b=QXhx2F9iBYbbdeJMFy7eaOF2vdNXEz5CWD8JcmstP95RuiSsyzlDMzJ1ET5R/b1//
	 EBUUD1zsWLqs5porrZSInQw6zd8bnxGKqN5f598r9NCH3IO+BfBhvOC524O89klYI4
	 4gYzBY/GyL0cAibgI3kpPmlSZQwTjcS1L6DKqCDAMQDu7SYILk2oDBrqF3SeMJwCBl
	 AcNxl4xn+uwfhlaqWKc1P3mxXavfmWzVm8Zms3fDiopFklsIkV7fNFSJuUJWsRtGcu
	 gQ1Tq2gDEQEPGQRaiRjlNbe83pXfV3oF3VwVQy3rcdMFoh0WcA4WvSpGXxIjowPL0d
	 pTTqKooHEx2VQ==
From: Julien Massot <julien.massot@collabora.com>
To: devicetree@vger.kernel.org,
	linux-media@vger.kernel.org
Cc: kernel@collabora.com,
	Julien Massot <julien.massot@collabora.com>
Subject: [PATCH 0/4] Add support for MAX96714F and MAX96717F GMSL2 ser/des
Date: Fri,  8 Dec 2023 15:02:13 +0100
Message-ID: <20231208140217.457609-1-julien.massot@collabora.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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


