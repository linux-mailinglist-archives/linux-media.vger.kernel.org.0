Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4ABA92527D4
	for <lists+linux-media@lfdr.de>; Wed, 26 Aug 2020 08:52:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726709AbgHZGwt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 26 Aug 2020 02:52:49 -0400
Received: from esa5.microchip.iphmx.com ([216.71.150.166]:60140 "EHLO
        esa5.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726152AbgHZGws (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 26 Aug 2020 02:52:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1598424769; x=1629960769;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=HBnyjxMa7uVI/eu1uBnT609d4ARMKM0v5wDO/MK1iLM=;
  b=soGar4OlokHCTsFtuzDD9ymzl3TCl3YFC3N0NjiLqjrq0SHuCmbi8H+K
   SfeuJbnr0FLaRMlMwMBkQmOen2QtAzEDOQ6U8Tg7rxNSc8QRIGcZdbC28
   WP5wul4yFFDrsja7hj32sUl0PLlZl0Sawkkl/c9dcvqdGCHNTeducBP7w
   0ML5FcWdfMBlygNVFuZU0YtkDAYrgD92epV+EPKufwRPLNT+WSu+6hPdN
   nr6ipUSJnJ8QwFTV/9sXRcu0CUJVPThkm73QvY05to8rMMAHhH81XHIka
   GxaoH0cz60qPcIHuamC00qSs1NqxyJkkjnGKzR51YyaDU82EvnQULDK9c
   Q==;
IronPort-SDR: ltFITmBxW421ggd23VoOb62FaLmXM2x8/RabVddrGsBdJh32y4SXsDc6IRb4cr0kGI0NwMplHy
 ChKs4JpINBDKcbMhvoPvKke9MLA9Vn3PgpW+5rx/4pb2kzfvFGPFLto2ROgM53E9vZZpanToXi
 TycWEhxxvFDpozssBO00NTWNxlaJGWrWVyWycj3jDgIyYDk1eMO8DLtzKTJ3bsYiCAAIMYhmel
 2y/v9ENHW+gxKlRMm/Mc63xMZJk2mCYjen/yY5EEJQhuulotq6ThHl6PsPHo9iJS4sFgb5m12D
 BkU=
X-IronPort-AV: E=Sophos;i="5.76,354,1592895600"; 
   d="scan'208";a="88565264"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 25 Aug 2020 23:52:46 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Tue, 25 Aug 2020 23:51:56 -0700
Received: from ROB-ULT-M18282.microchip.com (10.10.115.15) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.1979.3 via Frontend Transport; Tue, 25 Aug 2020 23:52:28 -0700
From:   Eugen Hristev <eugen.hristev@microchip.com>
To:     <robh+dt@kernel.org>, <sakari.ailus@iki.fi>,
        <linux-media@vger.kernel.org>
CC:     <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        Eugen Hristev <eugen.hristev@microchip.com>
Subject: [PATCH v3 3/3] MAINTAINERS: add microchip csi2dc
Date:   Wed, 26 Aug 2020 09:51:42 +0300
Message-ID: <20200826065142.205000-3-eugen.hristev@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200826065142.205000-1-eugen.hristev@microchip.com>
References: <20200826065142.205000-1-eugen.hristev@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add Microchip CSI2DC driver in the list.

Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index deaafb617361..a07d3f5597a6 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11375,6 +11375,13 @@ L:	alsa-devel@alsa-project.org (moderated for non-subscribers)
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

