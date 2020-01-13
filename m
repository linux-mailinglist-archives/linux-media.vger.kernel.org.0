Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 36481139368
	for <lists+linux-media@lfdr.de>; Mon, 13 Jan 2020 15:16:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729145AbgAMOQA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 Jan 2020 09:16:00 -0500
Received: from mout.kundenserver.de ([212.227.126.133]:52835 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729141AbgAMOP7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 Jan 2020 09:15:59 -0500
Received: from mail.cetitecgmbh.com ([87.190.42.90]) by
 mrelayeu.kundenserver.de (mreue011 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MtwIW-1jeZI32dDQ-00uJAi; Mon, 13 Jan 2020 15:15:51 +0100
Received: from pflvmailgateway.corp.cetitec.com (unknown [127.0.0.1])
        by mail.cetitecgmbh.com (Postfix) with ESMTP id 56FA764F293;
        Mon, 13 Jan 2020 14:15:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at cetitec.com
Received: from mail.cetitecgmbh.com ([127.0.0.1])
        by pflvmailgateway.corp.cetitec.com (pflvmailgateway.corp.cetitec.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id Cy68gE_GQgSA; Mon, 13 Jan 2020 15:15:51 +0100 (CET)
Received: from pfwsexchange.corp.cetitec.com (unknown [10.10.1.99])
        by mail.cetitecgmbh.com (Postfix) with ESMTPS id 0556764D641;
        Mon, 13 Jan 2020 15:15:51 +0100 (CET)
Received: from pflmari.corp.cetitec.com (10.10.2.141) by
 PFWSEXCHANGE.corp.cetitec.com (10.10.1.99) with Microsoft SMTP Server (TLS)
 id 15.0.1320.4; Mon, 13 Jan 2020 15:15:51 +0100
Received: by pflmari.corp.cetitec.com (Postfix, from userid 1000)
        id ACF2D804E9; Mon, 13 Jan 2020 15:15:50 +0100 (CET)
Date:   Mon, 13 Jan 2020 15:15:50 +0100
From:   Alex Riesen <alexander.riesen@cetitec.com>
To:     Kieran Bingham <kieran.bingham@ideasonboard.com>
CC:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rob Herring <robh+dt@kernel.org>,
        "Mark Rutland" <mark.rutland@arm.com>,
        <devel@driverdev.osuosl.org>, <linux-media@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-renesas-soc@vger.kernel.org>
Subject: [PATCH 7/8] dt-bindings: adv748x: add information about serial audio
 interface (I2S/TDM)
Message-ID: <20200113141550.GH3606@pflmari>
Mail-Followup-To: Alex Riesen <alexander.riesen@cetitec.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, devel@driverdev.osuosl.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <cover.1578924232.git.alexander.riesen@cetitec.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <cover.1578924232.git.alexander.riesen@cetitec.com>
X-Originating-IP: [10.10.2.141]
X-ClientProxiedBy: PFWSEXCHANGE.corp.cetitec.com (10.10.1.99) To
 PFWSEXCHANGE.corp.cetitec.com (10.10.1.99)
X-EsetResult: clean, is OK
X-EsetId: 37303A29536F936F657D64
X-Provags-ID: V03:K1:3UWAIQ3PRfLO3SwbaMk2tmknBL5osw0uZ9NNz1XG25ufDyVB987
 Rnh6LNFpwA3UZYI6ufAhoe4a8NtVJEBSoSefoOWiac4vzKPdAmaGA4uud+7nVPLtU+hwlKB
 ivmJWe3VtUSjoh29NJQYrX4aCjT9VPfn5H6VWbIKyeCuKF/LKs4ZBDoy4NoDeIe820DTsAX
 l1pZXy2FDQa7eBA3kGxXA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:eaTY7FtP9y8=:+ydYl8ej9B+Czt0/FVvRtv
 wFuQ6GLarf54qSdmILfr09Zx+LImhPvVnwrRC1YZTuWroqVCyo99Kn0OXd9FdMr0kFajMoErU
 IIiIr7UaqHHHtqEIJTEQGU7EKfDyywZOrHVL/NZB90V5oYxh8pfqRAUfDv698egqrD3bArFSP
 dTP77quAllDo8aRHmmWADCqtzdPejdzfT+JzIEHsm1WgzslmPKnVPiI9o8vB7uvvR8UCmCv6C
 IZDlGky+6GcQN3yWjpR36X1VsGyuBGRJsXP7E7xNaG3GCU1QjRUfVQxUHr1w/5d90KKZ0Z7Kb
 AaBQmIVgZ93KMiPPwfk/Qtt9+JFGxmAF38jJiw1Zl7Ixx/5b7VE8+7ffPAyJ+H9qDxBMNouLx
 ck+r5Xo6QIW1Wklok99XIKeVVuaiR35Uepr5Kkrp3w7T8nFtmzbI4Xq8iCIDalNC7YRZM7+d6
 f3/c51N0i4Z1cckJJNfXAUgt0Gi+PfsitW+RpCWfpEAAyNHJWpnvXrr8pNoQiqwngTFYEjZEL
 3FIc9MTNbdlleP6M8IbBFDvZq+LfhVvU8VHYQo8vxV7fR6WLscrF4Zi8gzJWAS/tSZI2e0N0F
 SsQQ3MFuYebE+eViR4fzsojaMdVDx4w/swB5FQxWPOifVd2n9+kXFPGLsv2xMafST+j/4y0wQ
 jxXBF7SdszeIB7dcptZZ21GZToZEfFo025aKn+Oa+zR/aF71q//qOUnzTvENew7OQgKCu13pN
 e6YfRw9+8QaMPaE2kteGUgzWnBiHkRxwoGmI8l0CyqF/F6hsk1aJN2ZOKoTRrBI1Y/5BNyyKZ
 7ZWIgWarBIeDOCNGuhjjS9XudHlUy4vEVvW2HAPH6+ZTFNR++DqEEP9dg+2I+rh/hcMo2+BUi
 71TdhWNhfLsCTi1enMoZNAWb8zzMjJFcXDROx7SWU=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

As the driver has some support for the audio interface of the device,
the bindings file should mention it.

Signed-off-by: Alexander Riesen <alexander.riesen@cetitec.com>
---
 .../devicetree/bindings/media/i2c/adv748x.txt       | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/adv748x.txt b/Documentation/devicetree/bindings/media/i2c/adv748x.txt
index 4f91686e54a6..c42dffb37a82 100644
--- a/Documentation/devicetree/bindings/media/i2c/adv748x.txt
+++ b/Documentation/devicetree/bindings/media/i2c/adv748x.txt
@@ -2,7 +2,9 @@
 
 The ADV7481 and ADV7482 are multi format video decoders with an integrated
 HDMI receiver. They can output CSI-2 on two independent outputs TXA and TXB
-from three input sources HDMI, analog and TTL.
+from three input sources HDMI, analog and TTL. There is also support for an
+I2S compatible interface connected to the audio processor of the HDMI decoder.
+The interface has TDM capability (8 slots, 32 bits, left or right justified).
 
 Required Properties:
 
@@ -47,6 +49,7 @@ are numbered as follows.
 	  TTL		sink		9
 	  TXA		source		10
 	  TXB		source		11
+	  I2S		source		12
 
 The digital output port nodes, when present, shall contain at least one
 endpoint. Each of those endpoints shall contain the data-lanes property as
@@ -113,4 +116,12 @@ Example:
 				remote-endpoint = <&csi20_in>;
 			};
 		};
+
+		port@c {
+			reg = <12>;
+
+			adv7482_i2s: endpoint {
+				remote-endpoint = <&i2s_in>;
+			};
+		};
 	};
-- 
2.24.1.508.g91d2dafee0

