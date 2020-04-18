Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9AD4A1AEB71
	for <lists+linux-media@lfdr.de>; Sat, 18 Apr 2020 11:44:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725983AbgDRJoe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 18 Apr 2020 05:44:34 -0400
Received: from mail.kernel.org ([198.145.29.99]:57330 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725949AbgDRJoe (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 18 Apr 2020 05:44:34 -0400
Received: from mail.kernel.org (ip5f5ad4d8.dynamic.kabel-deutschland.de [95.90.212.216])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D6B8022250;
        Sat, 18 Apr 2020 09:44:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1587203073;
        bh=QZk2xlQqSFJH5vFVd8OdpuhfFsMpDoLSMQB4JhKcjcc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=EADDfDDf0YrWQSa1EXqZG/3eqzD4tt0LwXHHCqFBJwQwhRpQlIYPNQUsrbOjyazgs
         LmI0H9kY5aqNVeQoY7a7tdXfjzzqoKC5GbnJTOFRX3xPws3/YZ5bbGPsRznSSCdHkq
         csJILl3znX8byVj0Nry05SlUvHl3DhF8QOVObbfU=
Received: from mchehab by mail.kernel.org with local (Exim 4.92.3)
        (envelope-from <mchehab@kernel.org>)
        id 1jPk1W-0081OP-CQ; Sat, 18 Apr 2020 11:44:30 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: [PATCH 8/9] media: admin-guide: add card lists for radio and firewire
Date:   Sat, 18 Apr 2020 11:44:28 +0200
Message-Id: <8daeb0a0a2f57252cd6032a0d1978514da38aa8b.1587202259.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.25.2
In-Reply-To: <cover.1587202259.git.mchehab+huawei@kernel.org>
References: <cover.1587202259.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Document the supported radio devices, plus document the
firewire driver.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/admin-guide/media/cardlist.rst | 54 ++++++++++++++++++++
 1 file changed, 54 insertions(+)

diff --git a/Documentation/admin-guide/media/cardlist.rst b/Documentation/admin-guide/media/cardlist.rst
index cd00154ea623..99f6a43910b7 100644
--- a/Documentation/admin-guide/media/cardlist.rst
+++ b/Documentation/admin-guide/media/cardlist.rst
@@ -338,6 +338,60 @@ Driver   Name
 smssdio  Siano SMS1xxx based MDTV via SDIO interface
 =======  ===========================================
 
+Firewire driver
+===============
+
+The media subsystem also provides a firewire driver for digital TV:
+
+=======  =====================
+Driver   Name
+=======  =====================
+firedtv  FireDTV and FloppyDTV
+=======  =====================
+
+Radio drivers
+=============
+
+There is also support for pure AM/FM radio, and even for some FM radio
+transmitters:
+
+=====================  =========================================================
+Driver                 Name
+=====================  =========================================================
+si4713                 Silicon Labs Si4713 FM Radio Transmitter
+radio-aztech           Aztech/Packard Bell Radio
+radio-cadet            ADS Cadet AM/FM Tuner
+radio-gemtek           GemTek Radio card (or compatible)
+radio-maxiradio        Guillemot MAXI Radio FM 2000 radio
+radio-miropcm20        miroSOUND PCM20 radio
+radio-aimslab          AIMSlab RadioTrack (aka RadioReveal)
+radio-rtrack2          AIMSlab RadioTrack II
+saa7706h               SAA7706H Car Radio DSP
+radio-sf16fmi          SF16-FMI/SF16-FMP/SF16-FMD Radio
+radio-sf16fmr2         SF16-FMR2/SF16-FMD2 Radio
+radio-shark            Griffin radioSHARK USB radio receiver
+shark2                 Griffin radioSHARK2 USB radio receiver
+radio-si470x-common    Silicon Labs Si470x FM Radio Receiver
+radio-si476x           Silicon Laboratories Si476x I2C FM Radio
+radio-tea5764          TEA5764 I2C FM radio
+tef6862                TEF6862 Car Radio Enhanced Selectivity Tuner
+radio-terratec         TerraTec ActiveRadio ISA Standalone
+radio-timb             Enable the Timberdale radio driver
+radio-trust            Trust FM radio card
+radio-typhoon          Typhoon Radio (a.k.a. EcoRadio)
+radio-wl1273           Texas Instruments WL1273 I2C FM Radio
+fm_drv                 ISA radio devices
+fm_drv                 ISA radio devices
+radio-zoltrix          Zoltrix Radio
+dsbr100                D-Link/GemTek USB FM radio
+radio-keene            Keene FM Transmitter USB
+radio-ma901            Masterkit MA901 USB FM radio
+radio-mr800            AverMedia MR 800 USB FM radio
+radio-raremono         Thanko's Raremono AM/FM/SW radio
+radio-si470x-usb       Silicon Labs Si470x FM Radio Receiver support with USB
+radio-usb-si4713       Silicon Labs Si4713 FM Radio Transmitter support with USB
+=====================  =========================================================
+
 I²C drivers
 ===========
 
-- 
2.25.2

