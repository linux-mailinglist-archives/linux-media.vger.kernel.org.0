Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7335194CC0
	for <lists+linux-media@lfdr.de>; Mon, 19 Aug 2019 20:26:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728208AbfHSS0Z (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 19 Aug 2019 14:26:25 -0400
Received: from mail.kernel.org ([198.145.29.99]:51754 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727970AbfHSS0Y (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 19 Aug 2019 14:26:24 -0400
Received: from localhost (lfbn-1-10718-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9B1D422CF4;
        Mon, 19 Aug 2019 18:26:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1566239183;
        bh=mozUcucGGwNgrbVi8JK9nVIb5jRxn/xNJi2ONZFCZ2Y=;
        h=From:To:Cc:Subject:Date:From;
        b=ntPMtuI91Gm+vd+WT9IwTrwb/hc5EiZdpBpAV1rgdo9Fx3zA2xSneo4AKT3kqclFi
         ltJQpT13dP0js7xm87Yf2G0bwcZXXAcB/nJyuTiT72xs5ELWBFRDPLyVZl9w8bqSZw
         Uf+MMQrCoKDmeEH3dnk9qEJLuBIKn+suO233lLNw=
From:   Maxime Ripard <mripard@kernel.org>
To:     mchehab@kernel.org, sean@mess.org
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Chen-Yu Tsai <wens@csie.org>,
        Maxime Ripard <mripard@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v2 1/2] dt-bindings: media: Add YAML schemas for the generic RC bindings
Date:   Mon, 19 Aug 2019 20:26:18 +0200
Message-Id: <20190819182619.29065-1-mripard@kernel.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Maxime Ripard <maxime.ripard@bootlin.com>

The RC controllers have a bunch of generic properties that are needed in a
device tree. Add a YAML schemas for those.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>

---

Changes from v1:
  - Update the list of valid RC map name
---
 .../devicetree/bindings/media/rc.txt          | 118 +-------------
 .../devicetree/bindings/media/rc.yaml         | 145 ++++++++++++++++++
 2 files changed, 146 insertions(+), 117 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/rc.yaml

diff --git a/Documentation/devicetree/bindings/media/rc.txt b/Documentation/devicetree/bindings/media/rc.txt
index d3e7a012bfda..be629f7fa77e 100644
--- a/Documentation/devicetree/bindings/media/rc.txt
+++ b/Documentation/devicetree/bindings/media/rc.txt
@@ -1,117 +1 @@
-The following properties are common to the infrared remote controllers:
-
-- linux,rc-map-name: string, specifies the scancode/key mapping table
-  defined in-kernel for the remote controller. Support values are:
-  * "rc-adstech-dvb-t-pci"
-  * "rc-alink-dtu-m"
-  * "rc-anysee"
-  * "rc-apac-viewcomp"
-  * "rc-asus-pc39"
-  * "rc-asus-ps3-100"
-  * "rc-ati-tv-wonder-hd-600"
-  * "rc-ati-x10"
-  * "rc-avermedia-a16d"
-  * "rc-avermedia-cardbus"
-  * "rc-avermedia-dvbt"
-  * "rc-avermedia-m135a"
-  * "rc-avermedia-m733a-rm-k6"
-  * "rc-avermedia-rm-ks"
-  * "rc-avermedia"
-  * "rc-avertv-303"
-  * "rc-azurewave-ad-tu700"
-  * "rc-behold-columbus"
-  * "rc-behold"
-  * "rc-budget-ci-old"
-  * "rc-cec"
-  * "rc-cinergy-1400"
-  * "rc-cinergy"
-  * "rc-delock-61959"
-  * "rc-dib0700-nec"
-  * "rc-dib0700-rc5"
-  * "rc-digitalnow-tinytwin"
-  * "rc-digittrade"
-  * "rc-dm1105-nec"
-  * "rc-dntv-live-dvbt-pro"
-  * "rc-dntv-live-dvb-t"
-  * "rc-dtt200u"
-  * "rc-dvbsky"
-  * "rc-empty"
-  * "rc-em-terratec"
-  * "rc-encore-enltv2"
-  * "rc-encore-enltv-fm53"
-  * "rc-encore-enltv"
-  * "rc-evga-indtube"
-  * "rc-eztv"
-  * "rc-flydvb"
-  * "rc-flyvideo"
-  * "rc-fusionhdtv-mce"
-  * "rc-gadmei-rm008z"
-  * "rc-geekbox"
-  * "rc-genius-tvgo-a11mce"
-  * "rc-gotview7135"
-  * "rc-hauppauge"
-  * "rc-imon-mce"
-  * "rc-imon-pad"
-  * "rc-iodata-bctv7e"
-  * "rc-it913x-v1"
-  * "rc-it913x-v2"
-  * "rc-kaiomy"
-  * "rc-kworld-315u"
-  * "rc-kworld-pc150u"
-  * "rc-kworld-plus-tv-analog"
-  * "rc-leadtek-y04g0051"
-  * "rc-lirc"
-  * "rc-lme2510"
-  * "rc-manli"
-  * "rc-medion-x10"
-  * "rc-medion-x10-digitainer"
-  * "rc-medion-x10-or2x"
-  * "rc-msi-digivox-ii"
-  * "rc-msi-digivox-iii"
-  * "rc-msi-tvanywhere-plus"
-  * "rc-msi-tvanywhere"
-  * "rc-nebula"
-  * "rc-nec-terratec-cinergy-xs"
-  * "rc-norwood"
-  * "rc-npgtech"
-  * "rc-pctv-sedna"
-  * "rc-pinnacle-color"
-  * "rc-pinnacle-grey"
-  * "rc-pinnacle-pctv-hd"
-  * "rc-pixelview-new"
-  * "rc-pixelview"
-  * "rc-pixelview-002t"
-  * "rc-pixelview-mk12"
-  * "rc-powercolor-real-angel"
-  * "rc-proteus-2309"
-  * "rc-purpletv"
-  * "rc-pv951"
-  * "rc-hauppauge"
-  * "rc-rc5-tv"
-  * "rc-rc6-mce"
-  * "rc-real-audio-220-32-keys"
-  * "rc-reddo"
-  * "rc-snapstream-firefly"
-  * "rc-streamzap"
-  * "rc-tbs-nec"
-  * "rc-technisat-ts35"
-  * "rc-technisat-usb2"
-  * "rc-terratec-cinergy-c-pci"
-  * "rc-terratec-cinergy-s2-hd"
-  * "rc-terratec-cinergy-xs"
-  * "rc-terratec-slim"
-  * "rc-terratec-slim-2"
-  * "rc-tevii-nec"
-  * "rc-tivo"
-  * "rc-total-media-in-hand"
-  * "rc-total-media-in-hand-02"
-  * "rc-trekstor"
-  * "rc-tt-1500"
-  * "rc-twinhan-dtv-cab-ci"
-  * "rc-twinhan1027"
-  * "rc-videomate-k100"
-  * "rc-videomate-s350"
-  * "rc-videomate-tv-pvr"
-  * "rc-winfast"
-  * "rc-winfast-usbii-deluxe"
-  * "rc-su3000"
+This file has been moved to rc.yaml.
diff --git a/Documentation/devicetree/bindings/media/rc.yaml b/Documentation/devicetree/bindings/media/rc.yaml
new file mode 100644
index 000000000000..3d5c154fd230
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/rc.yaml
@@ -0,0 +1,145 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/rc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Generic Infrared Remote Controller Device Tree Bindings
+
+maintainers:
+  - Mauro Carvalho Chehab <mchehab@kernel.org>
+  - Sean Young <sean@mess.org>
+
+properties:
+  $nodename:
+    pattern: "^ir(@[a-f0-9]+)?$"
+
+  linux,rc-map-name:
+    description:
+      Specifies the scancode/key mapping table defined in-kernel for
+      the remote controller.
+    allOf:
+      - $ref: '/schemas/types.yaml#/definitions/string'
+      - enum:
+          - rc-adstech-dvb-t-pci
+          - rc-alink-dtu-m
+          - rc-anysee
+          - rc-apac-viewcomp
+          - rc-astrometa-t2hybrid
+          - rc-asus-pc39
+          - rc-asus-ps3-100
+          - rc-ati-tv-wonder-hd-600
+          - rc-ati-x10
+          - rc-avermedia
+          - rc-avermedia-a16d
+          - rc-avermedia-cardbus
+          - rc-avermedia-dvbt
+          - rc-avermedia-m135a
+          - rc-avermedia-m733a-rm-k6
+          - rc-avermedia-rm-ks
+          - rc-avertv-303
+          - rc-azurewave-ad-tu700
+          - rc-behold
+          - rc-behold-columbus
+          - rc-budget-ci-old
+          - rc-cec
+          - rc-cinergy
+          - rc-cinergy-1400
+          - rc-d680-dmb
+          - rc-delock-61959
+          - rc-dib0700-nec
+          - rc-dib0700-rc5
+          - rc-digitalnow-tinytwin
+          - rc-digittrade
+          - rc-dm1105-nec
+          - rc-dntv-live-dvb-t
+          - rc-dntv-live-dvbt-pro
+          - rc-dtt200u
+          - rc-dvbsky
+          - rc-dvico-mce
+          - rc-dvico-portable
+          - rc-em-terratec
+          - rc-empty
+          - rc-encore-enltv
+          - rc-encore-enltv-fm53
+          - rc-encore-enltv2
+          - rc-evga-indtube
+          - rc-eztv
+          - rc-flydvb
+          - rc-flyvideo
+          - rc-fusionhdtv-mce
+          - rc-gadmei-rm008z
+          - rc-geekbox
+          - rc-genius-tvgo-a11mce
+          - rc-gotview7135
+          - rc-hauppauge
+          - rc-hauppauge
+          - rc-hisi-poplar
+          - rc-hisi-tv-demo
+          - rc-imon-mce
+          - rc-imon-pad
+          - rc-imon-rsc
+          - rc-iodata-bctv7e
+          - rc-it913x-v1
+          - rc-it913x-v2
+          - rc-kaiomy
+          - rc-kworld-315u
+          - rc-kworld-pc150u
+          - rc-kworld-plus-tv-analog
+          - rc-leadtek-y04g0051
+          - rc-lme2510
+          - rc-manli
+          - rc-medion-x10
+          - rc-medion-x10-digitainer
+          - rc-medion-x10-or2x
+          - rc-msi-digivox-ii
+          - rc-msi-digivox-iii
+          - rc-msi-tvanywhere
+          - rc-msi-tvanywhere-plus
+          - rc-nebula
+          - rc-nec-terratec-cinergy-xs
+          - rc-norwood
+          - rc-npgtech
+          - rc-pctv-sedna
+          - rc-pinnacle-color
+          - rc-pinnacle-grey
+          - rc-pinnacle-pctv-hd
+          - rc-pixelview
+          - rc-pixelview-002t
+          - rc-pixelview-mk12
+          - rc-pixelview-new
+          - rc-powercolor-real-angel
+          - rc-proteus-2309
+          - rc-purpletv
+          - rc-pv951
+          - rc-rc5-tv
+          - rc-rc6-mce
+          - rc-real-audio-220-32-keys
+          - rc-reddo
+          - rc-snapstream-firefly
+          - rc-streamzap
+          - rc-su3000
+          - rc-tango
+          - rc-tbs-nec
+          - rc-technisat-ts35
+          - rc-technisat-usb2
+          - rc-terratec-cinergy-c-pci
+          - rc-terratec-cinergy-s2-hd
+          - rc-terratec-cinergy-xs
+          - rc-terratec-slim
+          - rc-terratec-slim-2
+          - rc-tevii-nec
+          - rc-tivo
+          - rc-total-media-in-hand
+          - rc-total-media-in-hand-02
+          - rc-trekstor
+          - rc-tt-1500
+          - rc-twinhan-dtv-cab-ci
+          - rc-twinhan1027
+          - rc-videomate-k100
+          - rc-videomate-s350
+          - rc-videomate-tv-pvr
+          - rc-winfast
+          - rc-winfast-usbii-deluxe
+          - rc-xbox-dvd
+          - rc-zx-irdec
-- 
2.21.0

