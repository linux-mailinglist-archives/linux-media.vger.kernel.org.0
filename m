Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 891443B9EB0
	for <lists+linux-media@lfdr.de>; Fri,  2 Jul 2021 12:00:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231761AbhGBKCE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 2 Jul 2021 06:02:04 -0400
Received: from mickerik.phytec.de ([195.145.39.210]:55538 "EHLO
        mickerik.phytec.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231587AbhGBKB6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 2 Jul 2021 06:01:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; d=phytec.de; s=a4; c=relaxed/simple;
        q=dns/txt; i=@phytec.de; t=1625219964; x=1627811964;
        h=From:Sender:Reply-To:Subject:Date:Message-Id:To:Cc:MIME-Version:Content-Type:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=CaMLn61Y+ve1XVWW0rnEgj+YIitGaqg0Z0+lCBa6ZHg=;
        b=Qk68JeVZcGAUDXyQMi2kK/su/eVkOQy5MMlXdtJXL5nh+Ck78KG0HF2FQWRLR+UV
        iBtKUyqfieZPhA7gqIZc77MNCurrxgxmr0HiT4kEukrE1L7/q9qCmeYl9iEKh6L2
        lFYMA7Eq3Yp1MJ9GN9QBGt40aeVmZ5iuEJJaHBOLwa0=;
X-AuditID: c39127d2-a9fbd70000001c5e-7b-60dee37cc97e
Received: from idefix.phytec.de (Unknown_Domain [172.16.0.10])
        by mickerik.phytec.de (PHYTEC Mail Gateway) with SMTP id B5.01.07262.C73EED06; Fri,  2 Jul 2021 11:59:24 +0200 (CEST)
Received: from lws-riedmueller.phytec.de ([172.16.23.108])
          by idefix.phytec.de (IBM Domino Release 9.0.1FP7)
          with ESMTP id 2021070211592367-1081049 ;
          Fri, 2 Jul 2021 11:59:23 +0200 
From:   Stefan Riedmueller <s.riedmueller@phytec.de>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Stefan Riedmueller <s.riedmueller@phytec.de>
Subject: [PATCH v3 4/6] dt-bindings: media: mt9p031: add pclk-sample property
Date:   Fri, 2 Jul 2021 11:59:20 +0200
Message-Id: <20210702095922.118614-5-s.riedmueller@phytec.de>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210702095922.118614-1-s.riedmueller@phytec.de>
References: <20210702095922.118614-1-s.riedmueller@phytec.de>
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on Idefix/Phytec(Release 9.0.1FP7|August  17, 2016) at
 02.07.2021 11:59:23,
        Serialize by Router on Idefix/Phytec(Release 9.0.1FP7|August  17, 2016) at
 02.07.2021 11:59:24
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrJLMWRmVeSWpSXmKPExsWyRoCBS7fm8b0Eg+dTWCzmHznHatE5cQm7
        xeVdc9gsejZsZbVYtukPk0Xr3iPsFp+2fGNyYPeY3TGT1WPTqk42j3knAz0+b5ILYInisklJ
        zcksSy3St0vgyjhxcwVLQQtnRd/Se0wNjMfYuxg5OSQETCQOPl/P1sXIxSEksI1RYtqH61DO
        NUaJKQuOMIJUsQkYSSyY1sgEYosIREn8PN/DAmIzCzxglNj/KgHEFhbwldjz5jIriM0ioCJx
        /+lssBpeAVuJVdNOs0Bsk5eYeek72GZOATuJMzePgsWFgGqO9v9ihagXlDg58wlU/RVGiVsr
        MyFsIYnTi88yQ+zVlli28DXzBEaBWUhaZiFJLWBkWsUolJuZnJ1alJmtV5BRWZKarJeSuokR
        GLyHJ6pf2sHYN8fjECMTB+MhRgkOZiUR3tB59xKEeFMSK6tSi/Lji0pzUosPMUpzsCiJ827g
        LQkTEkhPLEnNTk0tSC2CyTJxcEo1MLod9M1ncZAsjNfLPayiYrjyO8f6ulfHefgyalJmBrsY
        buKtyE448sHpPPuuCe0M0Ryf7uVv/Wb8UTBgnddDxv13BP4sYNpsxFGw+ZorY2FU8fRNpx49
        D/MvdFEtab752UIwmdeXLc3wc1ZTudb/ru8/Vzz/t+qQMut92c+OBUHbjy22ky6sVmIpzkg0
        1GIuKk4EAHYF7s5MAgAA
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add the pclk-sample property to the list of optional endpoint
properties for the mt9p031 camera sensor.

Signed-off-by: Stefan Riedmueller <s.riedmueller@phytec.de>
---
 Documentation/devicetree/bindings/media/i2c/mt9p031.txt | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/mt9p031.txt b/Docu=
mentation/devicetree/bindings/media/i2c/mt9p031.txt
index 4437d0e3147d..17e44fc6dc66 100644
--- a/Documentation/devicetree/bindings/media/i2c/mt9p031.txt
+++ b/Documentation/devicetree/bindings/media/i2c/mt9p031.txt
@@ -22,6 +22,10 @@ Required Properties:
 Optional Properties:
 - reset-gpios: Chip reset GPIO
=20
+Optional endpoint properties:
+- pclk-sample: For information see ../video-interfaces.txt. The value is s=
et to
+  0 if it isn't specified.
+
 For further reading on port node refer to
 Documentation/devicetree/bindings/media/video-interfaces.txt.
=20
@@ -45,6 +49,7 @@ Example:
 				mt9p031=5F1: endpoint {
 					input-clock-frequency =3D <6000000>;
 					pixel-clock-frequency =3D <96000000>;
+					pclk-sample =3D <1>;
 				};
 			};
 		};
--=20
2.25.1

