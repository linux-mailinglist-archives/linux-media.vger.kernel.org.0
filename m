Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 75AE4288558
	for <lists+linux-media@lfdr.de>; Fri,  9 Oct 2020 10:32:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732860AbgJIIby (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 9 Oct 2020 04:31:54 -0400
Received: from mx0a-00128a01.pphosted.com ([148.163.135.77]:61954 "EHLO
        mx0a-00128a01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1732798AbgJIIby (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 9 Oct 2020 04:31:54 -0400
Received: from pps.filterd (m0167088.ppops.net [127.0.0.1])
        by mx0a-00128a01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 0998OWB1017267;
        Fri, 9 Oct 2020 04:31:46 -0400
Received: from nwd2mta4.analog.com ([137.71.173.58])
        by mx0a-00128a01.pphosted.com with ESMTP id 3429n1skex-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 09 Oct 2020 04:31:46 -0400
Received: from SCSQMBX10.ad.analog.com (scsqmbx10.ad.analog.com [10.77.17.5])
        by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 0998ViXA037624
        (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=FAIL);
        Fri, 9 Oct 2020 04:31:45 -0400
Received: from SCSQCASHYB7.ad.analog.com (10.77.17.133) by
 SCSQMBX10.ad.analog.com (10.77.17.5) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1779.2; Fri, 9 Oct 2020 01:31:26 -0700
Received: from SCSQMBX10.ad.analog.com (10.77.17.5) by
 SCSQCASHYB7.ad.analog.com (10.77.17.133) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1779.2; Fri, 9 Oct 2020 01:31:25 -0700
Received: from zeus.spd.analog.com (10.66.68.11) by SCSQMBX10.ad.analog.com
 (10.77.17.5) with Microsoft SMTP Server id 15.1.1779.2 via Frontend
 Transport; Fri, 9 Oct 2020 01:31:25 -0700
Received: from btogorean-pc.ad.analog.com ([10.48.65.113])
        by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 0998VEn1027915;
        Fri, 9 Oct 2020 04:31:37 -0400
From:   Bogdan Togorean <bogdan.togorean@analog.com>
To:     <linux-media@vger.kernel.org>
CC:     Bogdan Togorean <bogdan.togorean@analog.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        "Jacopo Mondi" <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Shawn Tu <shawnx.tu@intel.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 2/2] media: dt-bindings: media: i2c: Add bindings for ADDI9036
Date:   Fri, 9 Oct 2020 14:29:55 +0300
Message-ID: <20201009113014.71531-2-bogdan.togorean@analog.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201009113014.71531-1-bogdan.togorean@analog.com>
References: <20201009113014.71531-1-bogdan.togorean@analog.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-ADIRoutedOnPrem: True
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-10-09_05:2020-10-09,2020-10-09 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 malwarescore=0
 bulkscore=0 mlxlogscore=999 lowpriorityscore=0 impostorscore=0
 suspectscore=1 adultscore=0 spamscore=0 mlxscore=0 phishscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2010090060
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add YAML device tree bindings for Analog Devices Inc. ADDI9036 CCD TOF
front-end.

Signed-off-by: Bogdan Togorean <bogdan.togorean@analog.com>
---
v3: drop I2C reg description
    specify maxItems on reset-gpios property
---
 .../bindings/media/i2c/adi,addi9036.yaml      | 76 +++++++++++++++++++
 1 file changed, 76 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/adi,addi9036.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/adi,addi9036.yaml b/Documentation/devicetree/bindings/media/i2c/adi,addi9036.yaml
new file mode 100644
index 000000000000..067b08ad8f53
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/adi,addi9036.yaml
@@ -0,0 +1,76 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/adi,addi9036.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Analog Devices ADDI9036 VGA CCD Time of Flight Sensor
+
+maintainers:
+  - Bogdan Togorean <bogdan.togorean@analog.com>
+
+description: |-
+  The ADDI9036 is a complete, 45 MHz, front-end solution for charge coupled
+  device (CCD) time of flight (TOF) imaging applications. It is programmable
+  through I2C interface. Image data is sent through MIPI CSI-2 2 lanes and
+  can output two RAW12 packed data streams. One is IR and the other is Depth.
+  Each data stream is on a separate or same MIPI Virtual Channel, depending
+  on configuration and each have 640x480 resolution.
+
+properties:
+  compatible:
+    const: adi,addi9036
+
+  reg:
+    maxItems: 1
+
+  reset-gpios:
+    maxItems: 1
+    description: |-
+      Reference to the GPIO connected to the RST/SYNC pin, if any.
+      Must be released (set high) after all supplies are applied.
+
+  # See ../video-interfaces.txt for more details
+  port:
+    type: object
+    properties:
+      endpoint:
+        type: object
+        properties:
+          data-lanes:
+            description: |-
+              The sensor supports two-lane operation.
+              For two-lane operation the property must be set to <1 2>.
+            items:
+              - const: 1
+              - const: 2
+
+required:
+  - compatible
+  - reg
+  - port
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c0 {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        addi9036: addi9036_tof@64 {
+            compatible = "adi,addi9036";
+            reg = <0x64>;
+
+            reset-gpios = <&gpio 41 1>;
+
+            port {
+                addi9036_ep: endpoint {
+                    remote-endpoint = <&csi1_ep>;
+                    data-lanes = <1 2>;
+                };
+            };
+        };
+    };
+
+...
-- 
2.28.0

