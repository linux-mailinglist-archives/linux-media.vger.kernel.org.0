Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C1D4F2AD9D4
	for <lists+linux-media@lfdr.de>; Tue, 10 Nov 2020 16:12:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731200AbgKJPMG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Nov 2020 10:12:06 -0500
Received: from esa3.microchip.iphmx.com ([68.232.153.233]:40586 "EHLO
        esa3.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730754AbgKJPMF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Nov 2020 10:12:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1605021125; x=1636557125;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=mZMYZuBCXD1r2QBjxb/5Nxy7uEFXyX6auS5QNy3Y63g=;
  b=yKPn4P0Ra6EDMFLMRqw83RsnLFx0NRcMJLBnKIPoaMEoI7yStfmQUUE4
   shPrjjnF135PruOMJ5f1M8Rxr8MK8gpTUuaymTNmBd5aRAt+MzzOWvM3R
   Vzgc4QzIv3PUjKZcBZtiu9EvB94vJ9pJ9wxiKxFVPTgP+Yc8qG+pCoLxs
   NvxPPQrvarFY2R6WUVELu8qAk1yJYBNitAwhcBC1q8tkbtBrbq7ndQvTn
   YqwjEOm35mMYva0JqUns34SeggpxzM7hFO2r2qx1kEeeFsz4qTb59h1A+
   vSZQguv9TZsBK1JVjFuoFRABLae2ZhqWYUskMl4Wiy9wYK8yLYsO90/gn
   g==;
IronPort-SDR: zNhnbsHeHSLmcnPI6zYAtWTCGeRr/aZyv3mq7s2wXTOqCKFhq3ke6rDTeAjDhDz4IvKMcWkn0R
 ev7ueYQDF+VGC3eIXFnhprBq3h2YJNtVyBfwA6jwpNUGV/EHPuswlrkPJ1lBXC7l/YyfwLnjMP
 pvbkXEL+qS1VeymyOV2BukK7OthKIYjzfvguyiMA8xL7ZNcHyXydu0fRCY9p7AuKyRteYL17ti
 91hijvlqLjWBsIdIimDTX/y+L8VJzXTY0QwueK8bQFzxMM0dkOR2UkLvdR4w1IkuQUfq96KqNk
 VsM=
X-IronPort-AV: E=Sophos;i="5.77,466,1596524400"; 
   d="scan'208";a="98459318"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 10 Nov 2020 08:11:53 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Tue, 10 Nov 2020 08:11:51 -0700
Received: from ROB-ULT-M18282.microchip.com (10.10.115.15) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.1979.3 via Frontend Transport; Tue, 10 Nov 2020 08:11:48 -0700
From:   Eugen Hristev <eugen.hristev@microchip.com>
To:     <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <robh+dt@kernel.org>,
        <sakari.ailus@iki.fi>, <laurent.pinchart@ideasonboard.com>,
        <jacopo@jmondi.org>
CC:     Eugen Hristev <eugen.hristev@microchip.com>
Subject: [PATCH v4 3/3] MAINTAINERS: add microchip csi2dc
Date:   Tue, 10 Nov 2020 17:11:16 +0200
Message-ID: <20201110151116.161260-3-eugen.hristev@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201110151116.161260-1-eugen.hristev@microchip.com>
References: <20201110151116.161260-1-eugen.hristev@microchip.com>
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

