Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A75913B9EAB
	for <lists+linux-media@lfdr.de>; Fri,  2 Jul 2021 12:00:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231766AbhGBKCA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 2 Jul 2021 06:02:00 -0400
Received: from mickerik.phytec.de ([195.145.39.210]:55534 "EHLO
        mickerik.phytec.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231572AbhGBKB5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 2 Jul 2021 06:01:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; d=phytec.de; s=a4; c=relaxed/simple;
        q=dns/txt; i=@phytec.de; t=1625219963; x=1627811963;
        h=From:Sender:Reply-To:Subject:Date:Message-Id:To:Cc:MIME-Version:Content-Type:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=Zic2qKtoJ6PDuAYqaDtiLhCpLAC6FxtCGOmCk/unsSU=;
        b=muxZOiqqGZghe0t565cdNrT00KQd+BVndfZ6qhBMyTMwi6Z5+k9rM9nwjBG/B9AQ
        XuF5bXJF3q5KkLKQlhszpQU+A5jWRUs5JpSX5olrvM2ngmdtr4H9r7wZN2LGOFT6
        sy3E1hEc8DDoOkA/hdWTQw1Qz5nj5sYRdG+GCLiBOwQ=;
X-AuditID: c39127d2-a77bc70000001c5e-79-60dee37b4d19
Received: from idefix.phytec.de (Unknown_Domain [172.16.0.10])
        by mickerik.phytec.de (PHYTEC Mail Gateway) with SMTP id 15.01.07262.B73EED06; Fri,  2 Jul 2021 11:59:23 +0200 (CEST)
Received: from lws-riedmueller.phytec.de ([172.16.23.108])
          by idefix.phytec.de (IBM Domino Release 9.0.1FP7)
          with ESMTP id 2021070211592337-1081048 ;
          Fri, 2 Jul 2021 11:59:23 +0200 
From:   Stefan Riedmueller <s.riedmueller@phytec.de>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Stefan Riedmueller <s.riedmueller@phytec.de>
Subject: [PATCH v3 3/6] dt-bindings: media: mt9p031: Add missing required properties
Date:   Fri, 2 Jul 2021 11:59:19 +0200
Message-Id: <20210702095922.118614-4-s.riedmueller@phytec.de>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210702095922.118614-1-s.riedmueller@phytec.de>
References: <20210702095922.118614-1-s.riedmueller@phytec.de>
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on Idefix/Phytec(Release 9.0.1FP7|August  17, 2016) at
 02.07.2021 11:59:23,
        Serialize by Router on Idefix/Phytec(Release 9.0.1FP7|August  17, 2016) at
 02.07.2021 11:59:23
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrJLMWRmVeSWpSXmKPExsWyRoCBS7f68b0EgxtnDS3mHznHatE5cQm7
        xeVdc9gsejZsZbVYtukPk0Xr3iPsFp+2fGNyYPeY3TGT1WPTqk42j3knAz0+b5ILYInisklJ
        zcksSy3St0vgyti4/zJrwXWuip7dF9gaGN9zdDFyckgImEjcPfWArYuRi0NIYBujRHfHTmaQ
        hJDANUaJLzONQWw2ASOJBdMamUBsEYEoiZ/ne1hAbGaBB4wS+18lgNjCAiESJ/73soPYLAIq
        Evcud7GC2LwCthITZ65mh1gmLzHz0ncwm1PATuLMzaMsELtsJY72/4KqF5Q4OfMJC8hBEgJX
        GCVmXFrGBNEsJHF68VlmiMXaEssWvmaewCgwC0nPLCSpBYxMqxiFcjOTs1OLMrP1CjIqS1KT
        9VJSNzECg/fwRPVLOxj75ngcYmTiYDzEKMHBrCTCGzrvXoIQb0piZVVqUX58UWlOavEhRmkO
        FiVx3g28JWFCAumJJanZqakFqUUwWSYOTqkGxraMNx//xU7SCLf7H+f4r+X80Ye7zu/scVmX
        ZKHBkOJTVbt1zxdvwc6KrdbyZy5J2S933ns87F9QyozHIXLO1+VmJkz7+eD1dzHVC9xNnjkV
        xU2951LTL6g6cl3a2ny74Aq/nNdCOdM8S7V3Ku9ZnJ6Fz5xyoD0tQHHm/MgAv0NvFNgWaz7c
        psRSnJFoqMVcVJwIAOxqU6NMAgAA
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add missing required clocks and supply regulator properties for the
sensor input clock and vdd, vdd=5Fio and vaa supply regulators.

Signed-off-by: Stefan Riedmueller <s.riedmueller@phytec.de>
---
 .../devicetree/bindings/media/i2c/mt9p031.txt        | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/mt9p031.txt b/Docu=
mentation/devicetree/bindings/media/i2c/mt9p031.txt
index cb60443ff78f..4437d0e3147d 100644
--- a/Documentation/devicetree/bindings/media/i2c/mt9p031.txt
+++ b/Documentation/devicetree/bindings/media/i2c/mt9p031.txt
@@ -9,6 +9,12 @@ Required Properties:
 	(a) "aptina,mt9p031" for mt9p031 sensor
 	(b) "aptina,mt9p031m" for mt9p031m sensor
=20
+- clocks: Reference to the sensor input clock
+
+- vdd-supply: VDD supply regulator
+- vdd=5Fio-supply: VDD=5FIO supply regulator
+- vaa-supply: VAA supply regulator
+
 - input-clock-frequency: Input clock frequency.
=20
 - pixel-clock-frequency: Pixel clock frequency.
@@ -29,6 +35,12 @@ Example:
 			reg =3D <0x5d>;
 			reset-gpios =3D <&gpio3 30 0>;
=20
+			clocks =3D <&sensor=5Fclk>;
+
+			vdd-supply =3D <&reg=5Fvdd>;
+			vdd=5Fio-supply =3D <&reg=5Fvdd=5Fio>;
+			vaa-supply =3D <&reg=5Fvaa>;
+
 			port {
 				mt9p031=5F1: endpoint {
 					input-clock-frequency =3D <6000000>;
--=20
2.25.1

