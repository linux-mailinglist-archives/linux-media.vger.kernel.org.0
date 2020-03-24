Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D37B7191329
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2020 15:27:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728786AbgCXO0h (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Mar 2020 10:26:37 -0400
Received: from mail.kernel.org ([198.145.29.99]:35808 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727530AbgCXO00 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Mar 2020 10:26:26 -0400
Received: from mail.kernel.org (ip5f5ad4e9.dynamic.kabel-deutschland.de [95.90.212.233])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7D2C820BED;
        Tue, 24 Mar 2020 14:26:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1585059985;
        bh=Wn32YEXlsFeyH0U1lHQAPIpXDBsqxsEtcqAGcnsGtIA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=fihTGl90BKi+65Fzmf7DFqZlEO3aGNIa40bKpITjIjISSNmUYylROagHhISTGIZbp
         7o4hZ8ATFf77BLNAkGlSuxSZtGsEZv/liY4S5BVX5ckufFHC7U3ZCH0PzCVdw493+b
         nSS7+073w3GscAeJ+Oo6eHVk6VsHTFbYl/+O5dWM=
Received: from mchehab by mail.kernel.org with local (Exim 4.92.3)
        (envelope-from <mchehab@kernel.org>)
        id 1jGkVb-00266t-O5; Tue, 24 Mar 2020 15:26:23 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: [PATCH v2 07/20] media: Kconfig: add an option to filter in/out the embedded drivers
Date:   Tue, 24 Mar 2020 15:26:08 +0100
Message-Id: <23242586947faec259eabc545415592a5ea9ac92.1585059896.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <cover.1585059896.git.mchehab+huawei@kernel.org>
References: <cover.1585059896.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Most systems don't need support for those, while others only
need those, instead of the others.

So, add an option to filter in/out the SoC specific drivers.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/media/Kconfig | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/media/Kconfig b/drivers/media/Kconfig
index e266d1afa912..a57e2198b2db 100644
--- a/drivers/media/Kconfig
+++ b/drivers/media/Kconfig
@@ -88,6 +88,14 @@ config MEDIA_CEC_SUPPORT
 	  Say Y when you have an HDMI receiver, transmitter or a USB CEC
 	  adapter that supports HDMI CEC.
 
+config MEDIA_EMBEDDED_SUPPORT
+	bool "Embedded devices (SoC)"
+	help
+	  Enable support for complex cameras, codecs, and other hardware
+	  found on Embedded hardware (SoC).
+
+	  Say Y when you have a software defined radio device.
+
 endmenu # media support types
 
 if MEDIA_SUPPORT
@@ -177,9 +185,13 @@ source "drivers/media/radio/Kconfig"
 
 # Common driver options
 source "drivers/media/common/Kconfig"
+
+if MEDIA_EMBEDDED_SUPPORT
+
 source "drivers/media/platform/Kconfig"
 source "drivers/media/mmc/Kconfig"
 
+endif # MEDIA_EMBEDDED_SUPPORT
 
 comment "FireWire (IEEE 1394) Adapters"
 	depends on DVB_CORE && FIREWIRE
-- 
2.24.1

