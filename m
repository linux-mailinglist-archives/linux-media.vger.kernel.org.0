Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7BEBB1AEB77
	for <lists+linux-media@lfdr.de>; Sat, 18 Apr 2020 11:44:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726006AbgDRJoj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 18 Apr 2020 05:44:39 -0400
Received: from mail.kernel.org ([198.145.29.99]:57314 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725869AbgDRJod (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 18 Apr 2020 05:44:33 -0400
Received: from mail.kernel.org (ip5f5ad4d8.dynamic.kabel-deutschland.de [95.90.212.216])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id CBE5522240;
        Sat, 18 Apr 2020 09:44:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1587203073;
        bh=aGpKm2WP2jVgdfoHCgHrXPe6qHp7TrvhJmRUNE7rGlc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=JUdg+mDQxRZc9dLNY7vyAty7GjGlBCJlccv5u964yR8uzDNSxaRoMjMyZOnVbeWI4
         nD5iCY0DJZT75LIWw5/IDWzsnDiDP//r8Dju8LMmjgUokb9m1GdNobFxKVsCX30EAX
         n8K0trLsZOR6R8O4M7Wsxcj1IUl5uWWhiI5oXdIc=
Received: from mchehab by mail.kernel.org with local (Exim 4.92.3)
        (envelope-from <mchehab@kernel.org>)
        id 1jPk1W-0081O5-7c; Sat, 18 Apr 2020 11:44:30 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: [PATCH 4/9] media: admin-guide: add a table with USB drivers
Date:   Sat, 18 Apr 2020 11:44:24 +0200
Message-Id: <2a083f434130498140c875f6a3eb437c9a38d07c.1587202259.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.25.2
In-Reply-To: <cover.1587202259.git.mchehab+huawei@kernel.org>
References: <cover.1587202259.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Having a table with a list of all USB drivers seems worth,
and it comes almost for free, as we can just use Kconfig
descriptions (with some adjustments).

So, add a table for that.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/admin-guide/media/cardlist.rst | 78 ++++++++++++++++++++
 1 file changed, 78 insertions(+)

diff --git a/Documentation/admin-guide/media/cardlist.rst b/Documentation/admin-guide/media/cardlist.rst
index 93c3290ae9cc..62375bde4755 100644
--- a/Documentation/admin-guide/media/cardlist.rst
+++ b/Documentation/admin-guide/media/cardlist.rst
@@ -47,6 +47,84 @@ by different products. So, several media drivers allow passing a ``card=``
 parameter, in order to setup a card number that would match the correct
 settings for an specific product type.
 
+The current supported USB cards (not including staging drivers) are
+listed below\ [#]_.
+
+.. [#]
+
+   some of the drivers have sub-drivers, not shown at this table.
+   In particular, gspca driver has lots of sub-drivers,
+   for cameras not supported by the USB Video Class (UVC) driver,
+   as shown at :doc:`gspca card list <gspca-cardlist>`.
+
+
+======================  =========================================================
+Driver                  Name
+======================  =========================================================
+airspy                  AirSpy
+au0828                  Auvitek AU0828
+b2c2-flexcop-usb        Technisat/B2C2 Air/Sky/Cable2PC USB
+cpia2                   CPiA2 Video For Linux
+cx231xx                 Conexant cx231xx USB video capture
+dvb-as102               Abilis AS102 DVB receiver
+dvb-ttusb-budget        Technotrend/Hauppauge Nova - USB devices
+dvb-usb-a800            AVerMedia AverTV DVB-T USB 2.0 (A800)
+dvb-usb-af9005          Afatech AF9005 DVB-T USB1.1
+dvb-usb-af9015          Afatech AF9015 DVB-T USB2.0
+dvb-usb-af9035          Afatech AF9035 DVB-T USB2.0
+dvb-usb-anysee          Anysee DVB-T/C USB2.0
+dvb-usb-au6610          Alcor Micro AU6610 USB2.0
+dvb-usb-az6007          AzureWave 6007 and clones DVB-T/C USB2.0
+dvb-usb-az6027          Azurewave DVB-S/S2 USB2.0 AZ6027
+dvb-usb-ce6230          Intel CE6230 DVB-T USB2.0
+dvb-usb-cinergyT2       Terratec CinergyT2/qanu USB 2.0 DVB-T
+dvb-usb-cxusb           Conexant USB2.0 hybrid
+dvb-usb-dib0700         DiBcom DiB0700
+dvb-usb-dibusb-common   DiBcom DiB3000M-B
+dvb-usb-dibusb-mc       DiBcom DiB3000M-C/P
+dvb-usb-digitv          Nebula Electronics uDigiTV DVB-T USB2.0
+dvb-usb-dtt200u         WideView WT-200U and WT-220U (pen) DVB-T
+dvb-usb-dtv5100         AME DTV-5100 USB2.0 DVB-T
+dvb-usb-dvbsky          DVBSky USB
+dvb-usb-dw2102          DvbWorld & TeVii DVB-S/S2 USB2.0
+dvb-usb-ec168           E3C EC168 DVB-T USB2.0
+dvb-usb-gl861           Genesys Logic GL861 USB2.0
+dvb-usb-gp8psk          GENPIX 8PSK->USB module
+dvb-usb-lmedm04         LME DM04/QQBOX DVB-S USB2.0
+dvb-usb-m920x           Uli m920x DVB-T USB2.0
+dvb-usb-nova-t-usb2     Hauppauge WinTV-NOVA-T usb2 DVB-T USB2.0
+dvb-usb-opera           Opera1 DVB-S USB2.0 receiver
+dvb-usb-pctv452e        Pinnacle PCTV HDTV Pro USB device/TT Connect S2-3600
+dvb-usb-rtl28xxu        Realtek RTL28xxU DVB USB
+dvb-usb-technisat-usb2  Technisat DVB-S/S2 USB2.0
+dvb-usb-ttusb2          Pinnacle 400e DVB-S USB2.0
+dvb-usb-umt-010         HanfTek UMT-010 DVB-T USB2.0
+dvb_usb_v2              Support for various USB DVB devices v2
+dvb-usb-vp702x          TwinhanDTV StarBox and clones DVB-S USB2.0
+dvb-usb-vp7045          TwinhanDTV Alpha/MagicBoxII, DNTV tinyUSB2, Beetle USB2.0
+em28xx                  Empia EM28xx USB devices
+go7007                  WIS GO7007 MPEG encoder
+gspca                   Drivers for several USB Cameras
+hackrf                  HackRF
+hdpvr                   Hauppauge HD PVR
+msi2500                 Mirics MSi2500
+mxl111sf-tuner          MxL111SF DTV USB2.0
+pvrusb2                 Hauppauge WinTV-PVR USB2
+pwc                     USB Philips Cameras
+s2250                   Sensoray 2250/2251
+s2255drv                USB Sensoray 2255 video capture device
+smsusb                  Siano SMS1xxx based MDTV receiver
+stkwebcam               USB Syntek DC1125 Camera
+tm6000-alsa             TV Master TM5600/6000/6010 audio
+tm6000-dvb              DVB Support for tm6000 based TV cards
+tm6000                  TV Master TM5600/6000/6010 driver
+ttusb_dec               Technotrend/Hauppauge USB DEC devices
+usbtv                   USBTV007 video capture
+uvcvideo                USB Video Class (UVC)
+zd1301                  ZyDAS ZD1301
+zr364xx                 USB ZR364XX Camera
+======================  =========================================================
+
 .. toctree::
 	:maxdepth: 1
 
-- 
2.25.2

