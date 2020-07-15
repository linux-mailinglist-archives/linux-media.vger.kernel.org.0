Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0C08A2203B3
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2020 06:23:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725897AbgGOEX2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Jul 2020 00:23:28 -0400
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:12214 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725770AbgGOEX0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Jul 2020 00:23:26 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5f0e84840000>; Tue, 14 Jul 2020 21:22:28 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Tue, 14 Jul 2020 21:23:26 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Tue, 14 Jul 2020 21:23:26 -0700
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 15 Jul
 2020 04:23:25 +0000
Received: from rnnvemgw01.nvidia.com (10.128.109.123) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Wed, 15 Jul 2020 04:23:25 +0000
Received: from skomatineni-linux.nvidia.com (Not Verified[10.2.160.169]) by rnnvemgw01.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5f0e84bc0003>; Tue, 14 Jul 2020 21:23:25 -0700
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
To:     <skomatineni@nvidia.com>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <frankc@nvidia.com>, <hverkuil@xs4all.nl>,
        <luca@lucaceresoli.net>, <leonl@leopardimaging.com>,
        <robh+dt@kernel.org>, <lgirdwood@gmail.com>, <broonie@kernel.org>
CC:     <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH v1 2/3] dt-bindings: media: imx274: Add optional xclk and supplies
Date:   Tue, 14 Jul 2020 21:24:55 -0700
Message-ID: <1594787096-26685-2-git-send-email-skomatineni@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1594787096-26685-1-git-send-email-skomatineni@nvidia.com>
References: <1594787096-26685-1-git-send-email-skomatineni@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1594786948; bh=gNw4k90OTE+VvIylcKV7xe1muDw1PPjdaD+rSYJHkSk=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:X-NVConfidentiality:MIME-Version:
         Content-Type;
        b=ktReT8M/m/qQbNnGK2NvTQn2mTM4+l+EyVfDq1luzIM/t8wJiTBt7n5OPD0nmkDWY
         cFZe0eBSxF1Q57aAdAIaOoH2MvoF0xSt/tZilgCUY53uv30ij0NG4+Q876VXXtjh4Q
         MSZslh4W5iA0e3TygUl1l4R4dcGgY0JpDULps+9tRlDHRJkNh0+Gs3/7V2xRpcNb86
         AxV4Ruqkc8gyROxtNCooc+3ZznjjuF7V5Hr6RR5PkgocOVWjFHkPMHbgdQfaPOxXut
         /8RY29wTIW0+27avwQPxtcJ6TJOuU45cb5JQg27toSu1XlFCY+qf5fFN4mes29Pgj7
         nwEwhcku3yAiQ==
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
index 80f2e89..ee427f5 100644
--- a/Documentation/devicetree/bindings/media/i2c/imx274.txt
+++ b/Documentation/devicetree/bindings/media/i2c/imx274.txt
@@ -13,6 +13,11 @@ Required Properties:
 
 Optional Properties:
 - reset-gpios: Sensor reset GPIO
+- clocks: Reference to the xclk clock.
+- clock-names: Should be "xclk".
+- VANA-supply: Sensor 2.8v analog supply.
+- VDIG-supply: Sensor 1.8v digital core supply.
+- VDDL-supply: Sensor digital IO 1.2v supply.
 
 The imx274 device node should contain one 'port' child node with
 an 'endpoint' subnode. For further reading on port node refer to
-- 
2.7.4

