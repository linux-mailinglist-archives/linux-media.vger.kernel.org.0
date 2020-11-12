Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BFC9B2B068B
	for <lists+linux-media@lfdr.de>; Thu, 12 Nov 2020 14:35:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728344AbgKLNev (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Nov 2020 08:34:51 -0500
Received: from esa2.microchip.iphmx.com ([68.232.149.84]:30366 "EHLO
        esa2.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728322AbgKLNeu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Nov 2020 08:34:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1605188089; x=1636724089;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=mZMYZuBCXD1r2QBjxb/5Nxy7uEFXyX6auS5QNy3Y63g=;
  b=MnQan7/hpBg5CcC6J95C7S2borftQ+Jw5G8OJdGugW6ybYcbGWttF+5h
   yBlr7TvLusk05+2qAcVZd8Zvl73G9d7ExbvRfxQNiMj3tUXukOYF1p2nT
   YrgLV0svUgbDH9k+x3Tw1RXluYltsM0UU4Oj4uy0whPp0WR5Nji+qz4NG
   MFaCMwuIWfokfeFmv6mbd7ErDBhniHMBwTpDFj/XF/VaIh3yB0K73IjmS
   LZ8MaHn/1RkGuvnO9DAh/pJMvlKTDhVb1VpASzmt1Jk0p/CiXJu+xYN67
   U+mISZcCns+EqXc9V2NjFCnBzvthAKRt20UkLpY2WqoIy4R3uQoLtA71/
   g==;
IronPort-SDR: EaF931/VbbnvEQ6rG5uaWC6ZlBcibNqP/IWoUJKzErE+vdxihPOavXbA2mDuyBIOEs10a1nMuK
 abh33OTIfmfYQ6HGlD5MUnJ1H6wiGoQw89xH0EH5rO9rv+1mYAePiiyXnf8mGs/x0g3qOLDtr3
 XSJ3xbztu2ikkXIlh0TbZRL4S3JzlVDcCHVQXcDgegXgd1339LqMfy07X0UysgZxKDnBEzN93W
 wikBLSkaEtq1miVcCkJHZpjzvH32Rf8C7rMkCTqbZOr9YcSfiqCs6CLWN515n17TtR/bWlFfir
 5Cg=
X-IronPort-AV: E=Sophos;i="5.77,472,1596524400"; 
   d="scan'208";a="96064559"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 12 Nov 2020 06:34:48 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Thu, 12 Nov 2020 06:34:48 -0700
Received: from ROB-ULT-M18282.microchip.com (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.1979.3 via Frontend Transport; Thu, 12 Nov 2020 06:34:45 -0700
From:   Eugen Hristev <eugen.hristev@microchip.com>
To:     <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <robh+dt@kernel.org>,
        <sakari.ailus@iki.fi>, <laurent.pinchart@ideasonboard.com>,
        <jacopo@jmondi.org>
CC:     Eugen Hristev <eugen.hristev@microchip.com>
Subject: [PATCH v5 3/3] MAINTAINERS: add microchip csi2dc
Date:   Thu, 12 Nov 2020 15:34:37 +0200
Message-ID: <20201112133437.372475-3-eugen.hristev@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201112133437.372475-1-eugen.hristev@microchip.com>
References: <20201112133437.372475-1-eugen.hristev@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add Microchip CSI2DC driver in the list.

Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 2ec6fda103f8..3392a5803743 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11472,6 +11472,13 @@ L:	alsa-devel@alsa-project.org (moderated for non-subscribers)
 S:	Supported
 F:	sound/soc/atmel
 
+MICROCHIP CSI2DC DRIVER
+M:	Eugen Hristev <eugen.hristev@microchip.com>
+L:	linux-media@vger.kernel.org
+S:	Supported
+F:	Documentation/devicetree/bindings/media/microchip,csi2dc.yaml
+F:	drivers/media/platform/atmel/microchip-csi2dc.c
+
 MICROCHIP ECC DRIVER
 M:	Tudor Ambarus <tudor.ambarus@microchip.com>
 L:	linux-crypto@vger.kernel.org
-- 
2.25.1

