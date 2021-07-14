Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B11D03C857A
	for <lists+linux-media@lfdr.de>; Wed, 14 Jul 2021 15:39:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232081AbhGNNlt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 14 Jul 2021 09:41:49 -0400
Received: from mickerik.phytec.de ([195.145.39.210]:56700 "EHLO
        mickerik.phytec.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232463AbhGNNlq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 14 Jul 2021 09:41:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; d=phytec.de; s=a4; c=relaxed/simple;
        q=dns/txt; i=@phytec.de; t=1626269931; x=1628861931;
        h=From:Sender:Reply-To:Subject:Date:Message-Id:To:Cc:MIME-Version:Content-Type:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=Fi8CUC/821UJ4ETQjYvefvR9ynmRH/8tbcOi/xffdlc=;
        b=ocTiVrxvTatABXXeW87rqK0P0ISWZqZU5UzmuuhsBZi09tYshSEbC3pRBjM8mRON
        sSI8Ch74ePz/BIdJPdFO3KSEEs4miF1s8lJimcJ44pkjKV9BCCk+Oc/kFJ1G6hZ6
        a2JeP+YkjHu9gRSahzLZtydvgwioxejSCxmJBPUCtt4=;
X-AuditID: c39127d2-1e4f970000001daf-28-60eee8eb2292
Received: from idefix.phytec.de (Unknown_Domain [172.16.0.10])
        by mickerik.phytec.de (PHYTEC Mail Gateway) with SMTP id DD.57.07599.BE8EEE06; Wed, 14 Jul 2021 15:38:51 +0200 (CEST)
Received: from augenblix2.phytec.de ([172.16.0.56])
          by idefix.phytec.de (IBM Domino Release 9.0.1FP7)
          with ESMTP id 2021071415385071-1154293 ;
          Wed, 14 Jul 2021 15:38:50 +0200 
From:   Stefan Riedmueller <s.riedmueller@phytec.de>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Stefan Riedmueller <s.riedmueller@phytec.de>,
        Rob Herring <robh@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v6 6/6] media: dt-bindings: mt9p031: Add missing required properties
Date:   Wed, 14 Jul 2021 15:38:49 +0200
Message-Id: <20210714133849.1041619-7-s.riedmueller@phytec.de>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210714133849.1041619-1-s.riedmueller@phytec.de>
References: <20210714133849.1041619-1-s.riedmueller@phytec.de>
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on Idefix/Phytec(Release 9.0.1FP7|August  17, 2016) at
 14.07.2021 15:38:50,
        Serialize by Router on Idefix/Phytec(Release 9.0.1FP7|August  17, 2016) at
 14.07.2021 15:38:50
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrPLMWRmVeSWpSXmKPExsWyRoCBS/f1i3cJBvfeMFnMP3KO1aJz4hJ2
        i8u75rBZ9GzYymqxbNMfJovWvUfYLf7v2cFu8WnLNyYHDo/ZHTNZPTat6mTzmHcy0OPzJrkA
        ligum5TUnMyy1CJ9uwSujBXH17IV7OKtWDb/GlsD43SuLkZODgkBE4lF546zdzFycQgJbGOU
        2Lr6F5RzgVFi6sSn7CBVbAJGEgumNTKBJEQE2hgldhxpZgJJMAtcZpT49tUHxBYWCJF4de8V
        I4jNIqAq8fnwBpYuRg4OXgE7iUuv3CG2yUvMvPQdbCangL1E99F/LCC2EFDJncvzwVp5BQQl
        Ts58wgKyS0LgCqPE3XXPGSGahSROLz7LDLFXW2LZwtfMExgFZiHpmYUktYCRaRWjUG5mcnZq
        UWa2XkFGZUlqsl5K6iZGYCAfnqh+aQdj3xyPQ4xMHIyHGCU4mJVEeJcavU0Q4k1JrKxKLcqP
        LyrNSS0+xCjNwaIkzruBtyRMSCA9sSQ1OzW1ILUIJsvEwSnVwOggcmuft/UL93NX563wzfDs
        /bLzm033huO/iueeje+69+4kp5HxqvP/fryzvOktYja/5Lf6newjijdioldv7q+5dHA9u0yU
        xtVgzhes1Xe+WOU6ZpQ/ndER9OZk0Lm7lpKRSvnzK1ee17FYEbeeY8WfxTLH6rqlF91NXz+D
        55j2DYWFLGG1dx8psRRnJBpqMRcVJwIAZyOklVICAAA=
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
index 1531ecd1ed95..8cf485d64753 100644
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
@@ -65,6 +77,10 @@ properties:
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
@@ -80,6 +96,12 @@ examples:
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

