Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BCDFC3D545F
	for <lists+linux-media@lfdr.de>; Mon, 26 Jul 2021 09:39:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232681AbhGZGy4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 26 Jul 2021 02:54:56 -0400
Received: from mickerik.phytec.de ([195.145.39.210]:56428 "EHLO
        mickerik.phytec.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232550AbhGZGyy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 26 Jul 2021 02:54:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; d=phytec.de; s=a4; c=relaxed/simple;
        q=dns/txt; i=@phytec.de; t=1627284920; x=1629876920;
        h=From:Sender:Reply-To:Subject:Date:Message-Id:To:Cc:MIME-Version:Content-Type:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=zqdg7cPQM0a0PwYnHpAj5YucP/jlhWnUNr7bDHErP8M=;
        b=Vjwd6zwr7fv+eZf91o+cdstlZecigHYecI6MYh7xKWCf9bh4oAwzGklvsYl+IXzV
        zjGIH4+wMluMG5QY9leeE/oPGLD6NgmQID0zs9HXh9OEfNT67dKNplcaVVFyqqkl
        qoo5nmsh3KqJCZlOFxVwNf2YOwmHadFVxPQC4G5xgcI=;
X-AuditID: c39127d2-1e4f970000001daf-af-60fe65b85094
Received: from idefix.phytec.de (Unknown_Domain [172.16.0.10])
        by mickerik.phytec.de (PHYTEC Mail Gateway) with SMTP id 96.82.07599.8B56EF06; Mon, 26 Jul 2021 09:35:20 +0200 (CEST)
Received: from augenblix2.phytec.de ([172.16.0.56])
          by idefix.phytec.de (IBM Domino Release 9.0.1FP7)
          with ESMTP id 2021072609351980-1233319 ;
          Mon, 26 Jul 2021 09:35:19 +0200 
From:   Stefan Riedmueller <s.riedmueller@phytec.de>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Stefan Riedmueller <s.riedmueller@phytec.de>,
        Rob Herring <robh@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v7 6/6] media: dt-bindings: mt9p031: Add missing required properties
Date:   Mon, 26 Jul 2021 09:35:18 +0200
Message-Id: <20210726073518.2167398-7-s.riedmueller@phytec.de>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210726073518.2167398-1-s.riedmueller@phytec.de>
References: <20210726073518.2167398-1-s.riedmueller@phytec.de>
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on Idefix/Phytec(Release 9.0.1FP7|August  17, 2016) at
 26.07.2021 09:35:19,
        Serialize by Router on Idefix/Phytec(Release 9.0.1FP7|August  17, 2016) at
 26.07.2021 09:35:19
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrHLMWRmVeSWpSXmKPExsWyRoCBS3dH6r8Eg/uLGC3mHznHatE5cQm7
        xeVdc9gsejZsZbVYtukPk0Xr3iPsFv/37GC3+LTlG5MDh8fsjpmsHptWdbJ5zDsZ6PF5k1wA
        SxSXTUpqTmZZapG+XQJXRuPqBSwFu3grTh7yaWCcztXFyMEhIWAi8f5pVhcjF4eQwDZGiWfv
        9zNBOBcYJaZPb2PsYuTkYBMwklgwrREsISLQxiix40gzE0iCWeAyo8S3rz4gtrBAiMTHzT+Z
        QWwWAVWJCd8Ws4HYvAJ2Es/vfgGzJQTkJWZe+s4OYnMK2EvcevoezBYCqmnt3MgOUS8ocXLm
        ExaQZRICVxglDhzdyATRLCRxevFZZojF2hLLFr5mnsAoMAtJzywkqQWMTKsYhXIzk7NTizKz
        9QoyKktSk/VSUjcxAsP48ET1SzsY++Z4HGJk4mA8xCjBwawkwuuw4neCEG9KYmVValF+fFFp
        TmrxIUZpDhYlcd4NvCVhQgLpiSWp2ampBalFMFkmDk6pBsaK+abRk0umzy8PO/30xOe2k6pm
        6S2s5SeesXSX3BEROsG9TIxj7x+5XTe97e7dl31Tzf2I6/felQHrM8/mbenwEVvy1ODKnqy7
        i7/4m52J3JKx5V/qE7/zrjP0LUJ/v5wQ9Ysx+OhMz+pk1+fHLq52+Lo/dGGI2f3jmRc7r+Ut
        OFLC9XzXljVvlFiKMxINtZiLihMBxtG8dFECAAA=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add missing required clocks and supply regulator properties for the
sensor input clock and vdd, vdd=5Fio and vaa supply regulators.

Signed-off-by: Stefan Riedmueller <s.riedmueller@phytec.de>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../bindings/media/i2c/aptina,mt9p031.yaml    | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/aptina,mt9p031.yam=
l b/Documentation/devicetree/bindings/media/i2c/aptina,mt9p031.yaml
index bc0e8e5194e8..c2ba78116dbb 100644
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
@@ -59,6 +71,10 @@ properties:
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
@@ -74,6 +90,12 @@ examples:
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

