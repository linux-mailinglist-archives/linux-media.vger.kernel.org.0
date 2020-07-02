Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E717721249D
	for <lists+linux-media@lfdr.de>; Thu,  2 Jul 2020 15:26:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729389AbgGBN0a (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 2 Jul 2020 09:26:30 -0400
Received: from esa3.microchip.iphmx.com ([68.232.153.233]:38062 "EHLO
        esa3.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729271AbgGBN03 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 2 Jul 2020 09:26:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1593696389; x=1625232389;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=fmDRosteDtE+IMlkhAt1snIWAZ0oO40wspsHahgvM4Q=;
  b=q7X5fDJEdaqd9PQze7BDq2PDFGUAIFTmHNb0uBnYKvPpeHWrXFupEaxd
   XxpV4KA9nE62Ad5cZFhDCJ3FNSdv0EvoSkKZkGiY2QNOyBRq7bpe6jA4Z
   HdB9S5vDiaJgljN658Rlz49Vbfr9WuwrgjrpyhZE8sN9mkBaaWM1WGAsf
   MOGPieLQsaEr/ztsWm4j9+zv1kuU6sxXdjJ5+tffNVU8awTt0W6Obpah/
   7OOQV+b+KVFqhSAdrrSEejBYWpzF2mQIntjHUELJUrjNSwLyk4I1eNUUK
   Dy6lzzIfdtUccOzlRTBIHMpJhDLUDfoISlGZC+nTzwdD1PWSxMzRNTy/u
   w==;
IronPort-SDR: 7jF5NsVHpGHDhyUheajoLhwDd4e8Wx4hjW6+TAz/HGbVFaT4DwEiEh16h7cJrdTxLzBmnEo/o4
 Gb04TIn0IAhpp27q4gFNXTWOjxvnkf11ZAM5mN4DoQfHsDrjiV7uE7p2GaFQ6IRsKoJdWaWHeq
 t4Qkusa78F9jXRfsYKw8YdS6MO++ZHaAUCOzgoFF++PxyO7lo1++C+xf3LekkBrCey2RNhmQeN
 STn7KeUo3T780DTMYhRAHbWwVf2AyxjUb2yBlPq3ioa0DDMl1nKcdBVDoEptPc6GBKsuJGxd51
 FQI=
X-IronPort-AV: E=Sophos;i="5.75,304,1589266800"; 
   d="scan'208";a="82395154"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 02 Jul 2020 06:26:28 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Thu, 2 Jul 2020 06:26:09 -0700
Received: from ROB-ULT-M18282.microchip.com (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.1979.3 via Frontend Transport; Thu, 2 Jul 2020 06:26:22 -0700
From:   Eugen Hristev <eugen.hristev@microchip.com>
To:     <mchehab@kernel.org>, <hverkuil@xs4all.nl>, <robh+dt@kernel.org>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
CC:     Eugen Hristev <eugen.hristev@microchip.com>
Subject: [PATCH 4/4] MAINTAINERS: add microchip csi2dc
Date:   Thu, 2 Jul 2020 16:23:59 +0300
Message-ID: <20200702132359.122844-5-eugen.hristev@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200702132359.122844-1-eugen.hristev@microchip.com>
References: <20200702132359.122844-1-eugen.hristev@microchip.com>
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
index 791d2a862e41..a65b8d28c7d2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11069,6 +11069,13 @@ L:	alsa-devel@alsa-project.org (moderated for non-subscribers)
 S:	Supported
 F:	sound/soc/atmel
 
+MICROCHIP CSI2DC DRIVER
+M:	Eugen Hristev <eugen.hristev@microchip.com>
+L:	linux-media@vger.kernel.org
+S:	Supported
+F:	Documentation/devicetree/bindings/media/microchip,csi2dc.yaml
+F:	drivers/media/misc/microchip_csi2dc.c
+
 MICROCHIP DMA DRIVER
 M:	Ludovic Desroches <ludovic.desroches@microchip.com>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
-- 
2.25.1

