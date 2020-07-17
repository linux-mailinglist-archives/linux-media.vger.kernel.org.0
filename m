Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 415362243FB
	for <lists+linux-media@lfdr.de>; Fri, 17 Jul 2020 21:13:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728670AbgGQTMD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 17 Jul 2020 15:12:03 -0400
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:6388 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728620AbgGQTL7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 17 Jul 2020 15:11:59 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5f11f7f20000>; Fri, 17 Jul 2020 12:11:46 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Fri, 17 Jul 2020 12:11:58 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Fri, 17 Jul 2020 12:11:58 -0700
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 17 Jul
 2020 19:11:58 +0000
Received: from rnnvemgw01.nvidia.com (10.128.109.123) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Fri, 17 Jul 2020 19:11:58 +0000
Received: from skomatineni-linux.nvidia.com (Not Verified[10.2.163.115]) by rnnvemgw01.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5f11f7fd0001>; Fri, 17 Jul 2020 12:11:57 -0700
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
To:     <skomatineni@nvidia.com>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <frankc@nvidia.com>, <hverkuil@xs4all.nl>,
        <luca@lucaceresoli.net>, <leonl@leopardimaging.com>,
        <robh+dt@kernel.org>, <lgirdwood@gmail.com>, <broonie@kernel.org>
CC:     <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 2/3] dt-bindings: media: imx274: Add optional input clock and supplies
Date:   Fri, 17 Jul 2020 12:15:21 -0700
Message-ID: <1595013322-15077-2-git-send-email-skomatineni@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1595013322-15077-1-git-send-email-skomatineni@nvidia.com>
References: <1595013322-15077-1-git-send-email-skomatineni@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1595013106; bh=GFC1LF/7lvAW8gpnTVuP0yCQ7aUNS8pw6xjdqQGCq/s=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:X-NVConfidentiality:MIME-Version:
         Content-Type;
        b=J+54t67z4hEeAnjeHc2ks0APmu0OdZJEdPX69TmRi3nt2oU2a+gZqpVQ9s8yzpQfM
         n4Oiy/ovrAvVEPVQUTDRMKRlrG8OfrijH4f24TUBVcp0gw2nf73UYXfARtSnUDHfP+
         UvrsYYzkpKzCCxOX573J2JCVVmGMCkclCMX1JGvG5o8R69WTzrCV/MHpUx+/5B2e6R
         4iwcXFa9/6WWR0jdP3invXNMBF6pEvt4nZix0FM2JAujujuDMHTrh9JeBD8Qbb/2Yf
         w5eVDxKTrd7JPWPuJzLxAfcPdMrAA5SGFIHJRnffmeGC4Q+Lnt+7WgV/xf+rT6dTC+
         O/WDy0BfhI35Q==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patch adds IMX274 optional external clock input and voltage
supplies to device tree bindings.

Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
---
 Documentation/devicetree/bindings/media/i2c/imx274.txt | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/imx274.txt b/Documentation/devicetree/bindings/media/i2c/imx274.txt
index 80f2e89..0727079 100644
--- a/Documentation/devicetree/bindings/media/i2c/imx274.txt
+++ b/Documentation/devicetree/bindings/media/i2c/imx274.txt
@@ -13,6 +13,11 @@ Required Properties:
 
 Optional Properties:
 - reset-gpios: Sensor reset GPIO
+- clocks: Reference to the input clock.
+- clock-names: Should be "inck".
+- VANA-supply: Sensor 2.8v analog supply.
+- VDIG-supply: Sensor 1.8v digital core supply.
+- VDDL-supply: Sensor digital IO 1.2v supply.
 
 The imx274 device node should contain one 'port' child node with
 an 'endpoint' subnode. For further reading on port node refer to
-- 
2.7.4

