Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C6340423790
	for <lists+linux-media@lfdr.de>; Wed,  6 Oct 2021 07:45:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233284AbhJFFrd convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Wed, 6 Oct 2021 01:47:33 -0400
Received: from ni.piap.pl ([195.187.100.5]:44002 "EHLO ni.piap.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229579AbhJFFrc (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 6 Oct 2021 01:47:32 -0400
From:   =?utf-8?Q?Krzysztof_Ha=C5=82asa?= <khalasa@piap.pl>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] Add ADV7610 support for adv7604 driver - DT docs.
Date:   Wed, 06 Oct 2021 07:45:38 +0200
Message-ID: <m31r4yoge5.fsf@t19.piap.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

ADV7610 is another HDMI receiver chip, very similar to
the ADV7611. Tested on TinyRex BaseBoard Lite.

Signed-off-by: Krzysztof Hałasa <khalasa@piap.pl>

diff --git a/Documentation/devicetree/bindings/media/i2c/adv7604.yaml b/Documentation/devicetree/bindings/media/i2c/adv7604.yaml
index de15cebe2955..c19d8391e2d5 100644
--- a/Documentation/devicetree/bindings/media/i2c/adv7604.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/adv7604.yaml
@@ -4,23 +4,24 @@
 $id: http://devicetree.org/schemas/media/i2c/adv7604.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Analog Devices ADV7604/11/12 video decoder with HDMI receiver
+title: Analog Devices ADV7604/10/11/12 video decoder with HDMI receiver
 
 maintainers:
   - Hans Verkuil <hverkuil-cisco@xs4all.nl>
 
 description:
-  The ADV7604 and ADV7611/12 are multiformat video decoders with an integrated
-  HDMI receiver. The ADV7604 has four multiplexed HDMI inputs and one analog
-  input, and the ADV7611 has one HDMI input and no analog input. The 7612 is
-  similar to the 7611 but has 2 HDMI inputs.
+  The ADV7604 and ADV7610/11/12 are multiformat video decoders with
+  an integrated HDMI receiver. The ADV7604 has four multiplexed HDMI inputs
+  and one analog input, and the ADV7610/11 have one HDMI input and no analog
+  input. The ADV7612 is similar to the ADV7610/11 but has 2 HDMI inputs.
 
-  These device tree bindings support the ADV7611/12 only at the moment.
+  These device tree bindings support the ADV7610/11/12 only at the moment.
 
 properties:
   compatible:
     items:
       - enum:
+          - adi,adv7610
           - adi,adv7611
           - adi,adv7612
 

-- 
Krzysztof "Chris" Hałasa

Sieć Badawcza Łukasiewicz
Przemysłowy Instytut Automatyki i Pomiarów PIAP
Al. Jerozolimskie 202, 02-486 Warszawa
