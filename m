Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 153E61C9D4D
	for <lists+linux-media@lfdr.de>; Thu,  7 May 2020 23:33:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726616AbgEGVdj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 7 May 2020 17:33:39 -0400
Received: from mout.kundenserver.de ([212.227.17.10]:35769 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726320AbgEGVdj (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 7 May 2020 17:33:39 -0400
Received: from localhost.localdomain ([149.172.19.189]) by
 mrelayeu.kundenserver.de (mreue106 [212.227.15.145]) with ESMTPA (Nemesis) id
 1MxVfj-1jDKON2Jhp-00xv0X; Thu, 07 May 2020 23:33:26 +0200
From:   Arnd Bergmann <arnd@arndb.de>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        "Maciej S. Szmigiero" <mail@maciej.szmigiero.name>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] media: cxusb-analog: fix V4L2 dependency
Date:   Thu,  7 May 2020 23:33:14 +0200
Message-Id: <20200507213325.1843982-1-arnd@arndb.de>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:Rv72NQ7lV3Em1OEsWqDRAyPR38KvtDNs+dtnkIuB+d8R9Xh2XAl
 31PdnpcP4hqkNR0493P5xqUwSBY8QdnFmKiJD2mxoj3z21pJn5hobueEYT2fqztCUtnMQ87
 QEvRHgaQbgGcpVYqtFDZevReF6Rf1jjzxO4AYAgjlamInBgLWgupeTwtIpV/ulLOU25SW8C
 1Zu8nTtMb0Phs/E9e9KYw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:vEyyDlsoHbA=:AHuUt9P5LntWj+2JvWGvNk
 dDkkwDbgcPkwUTzLqsmafxt57RiGWPDmuCiW8eVb+UpVbOmrmOmo5psU0YeP3U6vkc03oNSm7
 JS0adBDVTqCZG6XAOQU8cEcJErNlXKdi5YDuGKymLYl09MU/gChSF3uuZv2VybnizPG38ZpHP
 kEQ3VWL+OLJWi+o+MNZc4VNQwMw/BaMrwLFx0VP/mFJ4Hfkf0rpaEbQdIRGPWf0xn6cQaNuQg
 npPQL13lVm3Fm5froD3xVBNM07xJtSNfnGreM0wiqXy99DDkdtarIopjo2R/G3aJq9goxrdar
 YGWjP6JXCzYgpGBlRokIWFe7qZD6NG3c9MgqL5g4BI5QUqTQVEw34O57ntDFVkUDgmPD1C8CZ
 vYB5h/UjfwUXRV3/RYD6QjSyoWmcKlguE/eISUSBMemJd/1xUQHLmflWTPW6smsfy2UKE5Eyg
 Cq25LNXrk5dxiAIxNhJ6DsVpiNK0c4DX7PdKPbEpQTDKbXBCQMoXPRMS06iKViARHXMOZSTQ7
 wUPpRf6F7jz1aU/YtEJhz5ekkt/wh71oKN5MTUKfwRgN4Hd8mcZdEtYj2wEZRrevC2Ay98rJC
 FG+IPErjd+FKJB5JrtFeMt7fYuUGa3d1slFOtQpdsfQtGxfLwxyM594iK5WgTksW0BbS+ku/9
 K2uyqM6N1JJfCTcz9C04uCis6MChM2iSqj7VgNImMucrg9docymcOWAs6TwbTZtXy73OTtHu8
 dW+AYVzNNyQkmKTmBJp/feNH97lCcJgiRsFqw4aaZKYvEhP/ST7EIQDNgx3gqI+jQqztXuJ9u
 FEHIkPcuinQAglTmOyADeViAEp4oL5huwaDgtFxQwSPq11aA/g=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

CONFIG_DVB_USB_CXUSB_ANALOG is a 'bool' symbol with a dependency on the
tristate CONFIG_VIDEO_V4L2, which means it can be enabled as =y even
when its dependency is =m. This leads to a link failure:

drivers/media/usb/dvb-usb/cxusb-analog.o: In function `cxusb_medion_analog_init':
cxusb-analog.c:(.text+0x92): undefined reference to `v4l2_subdev_call_wrappers'
drivers/media/usb/dvb-usb/cxusb-analog.o: In function `cxusb_medion_register_analog':
cxusb-analog.c:(.text+0x466): undefined reference to `v4l2_device_register'
cxusb-analog.c:(.text+0x4c3): undefined reference to `v4l2_i2c_new_subdev'
cxusb-analog.c:(.text+0x4fb): undefined reference to `v4l2_subdev_call_wrappers'
...

Change the dependency only disallow the analog portion of the driver
in that configuration.

Fixes: e478d4054054 ("media: cxusb: add analog mode support for Medion MD95700")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/media/usb/dvb-usb/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/usb/dvb-usb/Kconfig b/drivers/media/usb/dvb-usb/Kconfig
index 15d29c91662f..25ba03edcb5c 100644
--- a/drivers/media/usb/dvb-usb/Kconfig
+++ b/drivers/media/usb/dvb-usb/Kconfig
@@ -151,6 +151,7 @@ config DVB_USB_CXUSB
 config DVB_USB_CXUSB_ANALOG
 	bool "Analog support for the Conexant USB2.0 hybrid reference design"
 	depends on DVB_USB_CXUSB && VIDEO_V4L2
+	depends on VIDEO_V4L2=y || VIDEO_V4L2=DVB_USB_CXUSB
 	select VIDEO_CX25840
 	select VIDEOBUF2_VMALLOC
 	help
-- 
2.26.0

