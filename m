Return-Path: <linux-media+bounces-13291-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E6F0690956E
	for <lists+linux-media@lfdr.de>; Sat, 15 Jun 2024 03:58:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 62F8E285A31
	for <lists+linux-media@lfdr.de>; Sat, 15 Jun 2024 01:58:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F061524C;
	Sat, 15 Jun 2024 01:58:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="U671+UAD"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04A22D515;
	Sat, 15 Jun 2024 01:58:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718416701; cv=none; b=LpT7goLlU1Em7zngMOgtMT6vaiEhCt6/arwzr651kf8EIItxlOAarv1wVMHzVUgAlSkP/BWz2/ed9esXwRd21qBJ2M41onlI5qsBeN44ztX+pQ/9r6KRmfcJlTwthUK/qoxogYn4nAht4lAQPZT/g5lz3e5yw9j7oE0NjqhZsX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718416701; c=relaxed/simple;
	bh=0UTcYjd/8qry8O1pLuXm3l+KAOWonlHQZvdyiqU7/JM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=j/+9yjYHWygsQNwEVpAJCWUlFXcUXNBj/UsaeHJBzJCWS7HJoyjN8QTKYGx3y+ElYqtfzS86CkUkIDtxRnsdCLwV5ghSWLEZw8pDdXrBGXxtGZ+9PnnqHGFrefC8MOF/AXoQV5Nu33tCA/XYuwENdMpebUHt/KZUGs+jup0ihKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=U671+UAD; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1718416697;
	bh=0UTcYjd/8qry8O1pLuXm3l+KAOWonlHQZvdyiqU7/JM=;
	h=From:To:Cc:Subject:Date:From;
	b=U671+UADHvs8gQ98je0MEVzUl8WLvHhfyn4jmSIgM5ChBC38OyxBDhtjhBVqMTqyj
	 9w2dFHRBTOGM6O/GCVtZ2TviKFUnainsR+DPX7Ul5HhoOtce0KrCTz2yvfxrbaRhMi
	 aHOtaQlFkLLN3cKVr/FYhRpQJkufmFPzsw0VFVNxbCj07vj6f8nsScKQLfgRw0M4Tr
	 Izc/u77ruz2XCFRXCRf47l0eowOb6yzXPE7G0gIr8RKwZJU8jTfuwD7DZTcpHclBxg
	 a2yoChE4gg2S21jQZvSKgbHvoVFnwMThR0Bg8tppTz89VkSzEaeOTYQuIfPWacpLlB
	 DfccvweTBHjuQ==
Received: from arisu.hitronhub.home (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 2CD263781104;
	Sat, 15 Jun 2024 01:58:14 +0000 (UTC)
From: Detlev Casanova <detlev.casanova@collabora.com>
To: linux-kernel@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Dragan Simic <dsimic@manjaro.org>,
	Alexey Charkov <alchark@gmail.com>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Diederik de Haas <didi.debian@cknow.org>,
	Andy Yan <andy.yan@rock-chips.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-staging@lists.linux.dev,
	Detlev Casanova <detlev.casanova@collabora.com>
Subject: [PATCH 0/3] media: rockchip: Add rkvdec2 driver
Date: Fri, 14 Jun 2024 21:56:26 -0400
Message-ID: <20240615015734.1612108-1-detlev.casanova@collabora.com>
X-Mailer: git-send-email 2.44.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a rkvdec2 driver for newer video decoder found on rk3588 based SoC.

See the first commit message for implementation details.

Detlev Casanova (3):
  media: rockchip: Introduce the rkvdec2 driver
  media: dt-bindings: rockchip: Document RK3588 Video Decoder 2 bindings
  arm64: dts: rockchip: Add rkvdec2 Video Decoder on rk3588(s)

 .../bindings/media/rockchip,vdec2.yaml        |   80 ++
 .../boot/dts/rockchip/rk3588-rock-5b.dts      |    4 +
 .../boot/dts/rockchip/rk3588s-orangepi-5.dts  |    4 +
 arch/arm64/boot/dts/rockchip/rk3588s.dtsi     |   19 +
 drivers/staging/media/Kconfig                 |    1 +
 drivers/staging/media/Makefile                |    1 +
 drivers/staging/media/rkvdec2/Kconfig         |   15 +
 drivers/staging/media/rkvdec2/Makefile        |    3 +
 drivers/staging/media/rkvdec2/TODO            |   13 +
 drivers/staging/media/rkvdec2/rkvdec2-h264.c  |  899 +++++++++++++
 drivers/staging/media/rkvdec2/rkvdec2-regs.h  |  372 ++++++
 drivers/staging/media/rkvdec2/rkvdec2.c       | 1160 +++++++++++++++++
 drivers/staging/media/rkvdec2/rkvdec2.h       |  123 ++
 13 files changed, 2694 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/rockchip,vdec2.yaml
 create mode 100644 drivers/staging/media/rkvdec2/Kconfig
 create mode 100644 drivers/staging/media/rkvdec2/Makefile
 create mode 100644 drivers/staging/media/rkvdec2/TODO
 create mode 100644 drivers/staging/media/rkvdec2/rkvdec2-h264.c
 create mode 100644 drivers/staging/media/rkvdec2/rkvdec2-regs.h
 create mode 100644 drivers/staging/media/rkvdec2/rkvdec2.c
 create mode 100644 drivers/staging/media/rkvdec2/rkvdec2.h

-- 
2.44.2


