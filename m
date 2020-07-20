Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5BE15226CB6
	for <lists+linux-media@lfdr.de>; Mon, 20 Jul 2020 19:02:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730086AbgGTRBc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 20 Jul 2020 13:01:32 -0400
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:8973 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728495AbgGTRBb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 20 Jul 2020 13:01:31 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5f15cdde0002>; Mon, 20 Jul 2020 10:01:19 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Mon, 20 Jul 2020 10:01:31 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Mon, 20 Jul 2020 10:01:31 -0700
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 20 Jul
 2020 17:01:31 +0000
Received: from rnnvemgw01.nvidia.com (10.128.109.123) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Mon, 20 Jul 2020 17:01:30 +0000
Received: from skomatineni-linux.nvidia.com (Not Verified[10.2.168.236]) by rnnvemgw01.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5f15cdcf0006>; Mon, 20 Jul 2020 10:01:09 -0700
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
To:     <skomatineni@nvidia.com>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <frankc@nvidia.com>, <hverkuil@xs4all.nl>,
        <luca@lucaceresoli.net>, <leonl@leopardimaging.com>,
        <robh+dt@kernel.org>, <lgirdwood@gmail.com>, <broonie@kernel.org>
CC:     <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 2/3] dt-bindings: media: imx274: Add optional input clock and supplies
Date:   Mon, 20 Jul 2020 10:01:33 -0700
Message-ID: <1595264494-2400-2-git-send-email-skomatineni@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1595264494-2400-1-git-send-email-skomatineni@nvidia.com>
References: <1595264494-2400-1-git-send-email-skomatineni@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1595264479; bh=jfIuIpGRX9xuFBABf1C51Etpua3E0Nzd/i4o2tvMVMM=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:X-NVConfidentiality:MIME-Version:
         Content-Type;
        b=R8lhgdZnaPBRhUDe+GOVzBmbj3sDhWplkgKCGd9BVkXU2ZzU9+Qjv/fnzAr5DZWE3
         3YnGnfXldVNriOHQ6YNF2BjybB7pcAqh+9vfiU5pAoJCG0T7AVtyjfIFdT3YmfVvxe
         yRxsZDxz8XY5yVVlTcYHII51jqW9unh3Q8ApzYbTWntNgmy51f21v4t7nQ/xqUf2px
         lsJQY5c2XO7hcBx4x44vFFtjA8uBLK9BbTPw6gmfbjzQjCHibSaAPHWbiaQ6TGmNCd
         mC1xTCD8+McJmRwKHG3VDUqsbsYv21xpa4+fih8Ydnk5kZ0Zoc1Wxk2hE3PriaJubT
         g3vBDKOaxB+wQ==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patch adds IMX274 optional external clock input and voltage
supplies to device tree bindings.

Reviewed-by: Luca Ceresoli <luca@lucaceresoli.net>
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

