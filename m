Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 47B9F3BF778
	for <lists+linux-media@lfdr.de>; Thu,  8 Jul 2021 11:19:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231453AbhGHJWR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 8 Jul 2021 05:22:17 -0400
Received: from mickerik.phytec.de ([195.145.39.210]:46340 "EHLO
        mickerik.phytec.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231401AbhGHJWK (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 8 Jul 2021 05:22:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; d=phytec.de; s=a4; c=relaxed/simple;
        q=dns/txt; i=@phytec.de; t=1625735963; x=1628327963;
        h=From:Sender:Reply-To:Subject:Date:Message-Id:To:Cc:MIME-Version:Content-Type:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=iPCwYoZWJZV4vwThU3muuhgkMB2HBIf7o/b+oay4+PA=;
        b=TM+Eac0WxmL5yRDrAB8CsT7WLbMVg/57l1cY0PI6PL6vIT/ICis8ttBhyGQrE4so
        dfno+s5fYEKY+rGhnIylVTo4FvXmPzcdWwt1Go3TSO8tkkp2a9BgRzBW7hEHZMoE
        z+c+7LW/uLyJdotJOCxc/55UWEbEmHAbc7fZvdT3v+0=;
X-AuditID: c39127d2-1d8f870000001daf-8a-60e6c31bbd9e
Received: from idefix.phytec.de (Unknown_Domain [172.16.0.10])
        by mickerik.phytec.de (PHYTEC Mail Gateway) with SMTP id AA.B7.07599.B13C6E06; Thu,  8 Jul 2021 11:19:23 +0200 (CEST)
Received: from lws-riedmueller.phytec.de ([172.16.23.108])
          by idefix.phytec.de (IBM Domino Release 9.0.1FP7)
          with ESMTP id 2021070811192355-1113446 ;
          Thu, 8 Jul 2021 11:19:23 +0200 
From:   Stefan Riedmueller <s.riedmueller@phytec.de>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Stefan Riedmueller <s.riedmueller@phytec.de>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v4 6/6] media: dt-bindings: mt9p031: Add missing required properties
Date:   Thu, 8 Jul 2021 11:19:22 +0200
Message-Id: <20210708091922.5508-7-s.riedmueller@phytec.de>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210708091922.5508-1-s.riedmueller@phytec.de>
References: <20210708091922.5508-1-s.riedmueller@phytec.de>
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on Idefix/Phytec(Release 9.0.1FP7|August  17, 2016) at
 08.07.2021 11:19:23,
        Serialize by Router on Idefix/Phytec(Release 9.0.1FP7|August  17, 2016) at
 08.07.2021 11:19:23
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrNLMWRmVeSWpSXmKPExsWyRoCBS1f68LMEg9dPzS3mHznHatE5cQm7
        xeVdc9gsejZsZbVYtukPk0Xr3iPsFp+2fGNyYPeY3TGT1WPTqk42j3knAz0+b5ILYInisklJ
        zcksSy3St0vgyvjVtZCtoI+3YuK+g4wNjB84uxg5OSQETCRO/pjD2MXIxSEksI1RYsPvD1DO
        NUaJBXNbWECq2ASMJBZMa2QCSYgItDFK7DjSDOYwC2xhlJh+eTkbSJWwQIhEz5s7TCA2i4CK
        xJTlp9lBbF4Ba4nNG+eyQOyTl5h56TtQnIODU8BGoqs/BSQsBFRybNYtVohyQYmTM5+wgMyX
        ELjCKDH/1zI2iF4hidOLzzKD2MwC2hLLFr5mnsAoMAtJzywkqQWMTKsYhXIzk7NTizKz9Qoy
        KktSk/VSUjcxAgP48ET1SzsY++Z4HGJk4mA8xCjBwawkwms041mCEG9KYmVValF+fFFpTmrx
        IUZpDhYlcd4NvCVhQgLpiSWp2ampBalFMFkmDk6pBkbhvefZmHbeNN5rzBh+qWAN++Pifcxe
        OQkautPajKMkzbbGBzpwpP6b/kZhDntj5ZzK6JClLwWmvLqncd7FIzntXG32rDlhvd0bPm/g
        P7BeX/Vcd6XEHtdjW6Z91dOTmGJ5J/N1o2vgyV1TXC8tZ7e032Tb9S+kI1wl8vgq7dVr3jx1
        +nnB4qMSS3FGoqEWc1FxIgB1sv9WTgIAAA==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add missing required clocks and supply regulator properties for the
sensor input clock and vdd, vdd=5Fio and vaa supply regulators.

Signed-off-by: Stefan Riedmueller <s.riedmueller@phytec.de>
---
 .../bindings/media/i2c/aptina,mt9p031.yaml    | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/aptina,mt9p031.yam=
l b/Documentation/devicetree/bindings/media/i2c/aptina,mt9p031.yaml
index 7de62e339895..09560d97a59d 100644
--- a/Documentation/devicetree/bindings/media/i2c/aptina,mt9p031.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/aptina,mt9p031.yaml
@@ -24,6 +24,18 @@ properties:
     description: I2C device address
     maxItems: 1
=20
+  clocks:
+    maxItems: 1
+
+  vdd-supply:
+    description: Digital supply voltage, 1.8 V
+
+  vdd=5Fio-supply:
+    description: I/O supply voltage, 1.8 or 2.8 V
+
+  vaa-supply:
+    description: Analog supply voltage, 2.8 V
+
   reset-gpios:
     maxItems: 1
     description: Chip reset GPIO
@@ -48,6 +60,10 @@ properties:
 required:
   - compatible
   - reg
+  - clocks
+  - vdd-supply
+  - vdd=5Fio-supply
+  - vaa-supply
   - port
=20
 additionalProperties: false
@@ -63,6 +79,12 @@ examples:
             reg =3D <0x5d>;
             reset-gpios =3D <&gpio=5Fsensor 0 0>;
=20
+            clocks =3D <&sensor=5Fclk>;
+
+            vdd-supply =3D <&reg=5Fvdd>;
+            vdd=5Fio-supply =3D <&reg=5Fvdd=5Fio>;
+            vaa-supply =3D <&reg=5Fvaa>;
+
             port {
                 mt9p031=5F1: endpoint {
                     input-clock-frequency =3D <6000000>;
--=20
2.25.1

