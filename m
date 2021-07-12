Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F2B753C59B2
	for <lists+linux-media@lfdr.de>; Mon, 12 Jul 2021 13:02:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1357707AbhGLJHn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Jul 2021 05:07:43 -0400
Received: from mickerik.phytec.de ([195.145.39.210]:45270 "EHLO
        mickerik.phytec.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1382904AbhGLJCa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Jul 2021 05:02:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; d=phytec.de; s=a4; c=relaxed/simple;
        q=dns/txt; i=@phytec.de; t=1626080137; x=1628672137;
        h=From:Sender:Reply-To:Subject:Date:Message-Id:To:Cc:MIME-Version:Content-Type:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=uC8cBQL1xFdGBkFPFEx8KFNhS1ChOLH8o8ZHun1kY00=;
        b=bH8rxWtzV2H/DIIZ3MBOQc2kPIm60IM50J0Bm2EbE2gWRXG4XkmRsq5PJwlYohek
        +n5es4yCod/CMyBGpPdAnfGIbkl56xI3ST6Z+Vc5VgGYD7rK2FxsjwIDQC6COx+J
        MfT22lu6dLtwpalX/Ecz4qMbA5eOs1F3h340DUcZKOM=;
X-AuditID: c39127d2-1e4f970000001daf-27-60ec03896928
Received: from idefix.phytec.de (Unknown_Domain [172.16.0.10])
        by mickerik.phytec.de (PHYTEC Mail Gateway) with SMTP id ED.8D.07599.9830CE06; Mon, 12 Jul 2021 10:55:37 +0200 (CEST)
Received: from lws-riedmueller.phytec.de ([172.16.23.108])
          by idefix.phytec.de (IBM Domino Release 9.0.1FP7)
          with ESMTP id 2021071210553709-1131636 ;
          Mon, 12 Jul 2021 10:55:37 +0200 
From:   Stefan Riedmueller <s.riedmueller@phytec.de>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Stefan Riedmueller <s.riedmueller@phytec.de>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v5 6/6] media: dt-bindings: mt9p031: Add missing required properties
Date:   Mon, 12 Jul 2021 10:55:35 +0200
Message-Id: <20210712085535.11907-7-s.riedmueller@phytec.de>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210712085535.11907-1-s.riedmueller@phytec.de>
References: <20210712085535.11907-1-s.riedmueller@phytec.de>
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on Idefix/Phytec(Release 9.0.1FP7|August  17, 2016) at
 12.07.2021 10:55:37,
        Serialize by Router on Idefix/Phytec(Release 9.0.1FP7|August  17, 2016) at
 12.07.2021 10:55:37
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrNLMWRmVeSWpSXmKPExsWyRoCBS7eT+U2CwZ2r0hbzj5xjteicuITd
        4vKuOWwWPRu2slos2/SHyaJ17xF2i09bvjE5sHvM7pjJ6rFpVSebx7yTgR6fN8kFsERx2aSk
        5mSWpRbp2yVwZew8No2toI+3Yu+EgywNjB84uxg5OSQETCRef/7I1MXIxSEksI1RYur2HawQ
        znVGibVLtjKBVLEJGEksmNYIViUi0MYoseNIM5jDLLCFUWL65eVsIFXCAiESc5eeYgGxWQRU
        JV4vXcUMYvMK2EjsujmNBWKfvMTMS9/Zuxg5ODgFbCX2/LAECQsBlVyfv4EFolxQ4uTMJywg
        8yUErgDNf3ibGaJXSOL04rNgNrOAtsSyha+ZJzAKzELSMwtJagEj0ypGodzM5OzUosxsvYKM
        ypLUZL2U1E2MwAA+PFH90g7GvjkehxiZOBgPMUpwMCuJ8H7rfZUgxJuSWFmVWpQfX1Sak1p8
        iFGag0VJnHcDb0mYkEB6YklqdmpqQWoRTJaJg1OqgTF43mvZc8sVlpQkeuwtfvDrxHub9RGv
        Fp+d3PM24hrzx/55zIbzipc+nuy/yGfeScts58SUDQHJZfvjImWvya/YvJPH+amh0GqliL6f
        T4z5eXKKD6/TmTZpncsn14aHno6b+mKvJZrd1jVWddNZ9v6UW8qCa56zOQxSpcpfWTgUBE/P
        tUiwjVRiKc5INNRiLipOBAAeoPmeTgIAAA==
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
index ad9a2db73d86..487a3facfcbc 100644
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

